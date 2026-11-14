Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653280;
	b=zPw2v0Do2Gb2piZxrMen5R2smwJdA19mNqWNiQTXSLPu4Q8eWy2hSuT2pOM3U9l2zWbk
	 UmShUfiakT/QbV0gudzvlXgA68cRsaCnHLbZ8XE3Osyx7VTwFLDo0KKXCYnV2xykgH8e2
	 NKqbRgFQ3KA+29hEkaPufd9JYBEBuBDfFrSiBti+r4RiLLrOfll581Oee20V38bTxpqbQ
	 opVf3jBYn4/oPuM8pa+elDg9XlU5QMgcALwRvYLVcDaWea7UMt5/kYxKFA1SjVFu0bQoO
	 HQb9e1j5ki1K/e0CJlzMoVT/4N39Ghavi1PWoS4q9Ff/zNyyZjbdmjFxcE0EnlxP6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653280;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CJh0rQjybtbAzplTNGEHCAHXCfQuBs4/UVdR5kq7ds0=;
	b=RihR2Z2DSNckR+k3EwixSVqDUUbYF7WQyFvKp63FWZgA3F9aX6Ah+6z3emEpWlxItmyd
	 nhUj6L/i4a6cy8cOzpLRX3MNEBWYA7eIVDj67jq9LlHh2lVzrIpUw/9t16x7QMKJiVkP7
	 Nb+wSinjw1IMJE1UcnoByxaEJGu4x6pf+dTDBELwlAcIZnqqGelTBJMghO0ADW11zsMrN
	 TcPEGhu5kivPZ3fV0i06QXK6innzCQL4eeOBtRF6YjkSwnxJrNiTbvS6g4zig9f4Q7/wY
	 x6SubmxOyY/MagBt+0giXD0U/q9u93GnIJ3bjEnvfK9yXbKwTylv/Z4KeeWeA2f6cGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=VroJM849;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=BGRfHca2;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40C606A894;
	Sat, 14 Nov 2026 10:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA40C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=VroJM849;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=BGRfHca2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653271;
	bh=VioXCKKaai/212jHFYdg0u5SsfRdIHmnqLj7K8cc+Bg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VroJM8496zM5m3DklAtZXegP/o6kxv6xl4Q67PpX+EDYdAcN5YCvRigMa770VFw5w
	 v33A7r0+i87RnsBgmhgxZ1jeZMA/s3OW5rv4Iqu71KY5YuIJRI5o2SGdE0JEYVgmZA
	 WKnnehsh4eCs5IvU9WzlBmSbzvboZCwyJieXAIcjA5Sd5jYTDjSQ75hfnIO2oLOjEw
	 YPS/tWPhS4gFV5T/Sdtk1ebI1LPv1/2eaBfnYW+a+VHbhJ7VNm6bE+6zbQW/ZMKJe/
	 KBqfFgfyE2TdOnDcxqaCWs5Izl4Pqvv5xg9w41UKGx9w5qOxUFv9InHzJsGq4wvM2a
	 1LaIqqFVqBTFw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id E8EAF489BF; Sat, 14 Nov 2026 10:47:51 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653269;
	bh=VioXCKKaai/212jHFYdg0u5SsfRdIHmnqLj7K8cc+Bg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BGRfHca2V3wLOB3sZYGm8qgzfbRok0ZSjkjZQWo0bZksICKyxo5wUC8gh+R3ke8pf
	 oWGK+xidlDbpzkAGVxY2NN6nOexi0XuDjsQY6zNKlaGRRF24Q/zPxDRoeyR023IfTs
	 ZFu+Bn2N61djsIXRVvK2DRH9qbZqAFd3piEgbbugTWcHIsTIjwpPHBN+KRBzM5Quuw
	 5JyYbNYz8dmua3B+ZkqYkG+JwtXRVTOURdvOUooCYwxsiqJ6EzeF34vJw83Eb183Ax
	 FZtAffLQRmcq56xp3h7ZwbD9sH0QBUy7RUEBTlbUvzASn1RZMoVc7jWNWfOQAMf7sp
	 nwV+o/Dl/s+kA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 43415489A6;
	Sat, 14 Nov 2026 10:47:49 +0000 (UTC)
Message-ID: <b855f0d7-a7ff-4de8-b71f-3822e7b55554@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:47:43 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 11/13] ax88179_178a: Update driver name and
 information
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Eric Dumazet <edumazet@kernel.org>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Jianhui Xu <neuromoments@gmail.com>,
 Emir Beganovic <beganovic.emir@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-11-37b5a1189983@birger-koblitz.de>
 <20261113190535.0e74cbb7@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <20261113190535.0e74cbb7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 4:05 am, Jakub Kicinski wrote:
> On Fri, 06 Nov 2026 08:21:26 +0100 Birger Koblitz wrote:
>> -config USB_NET_AX88179_178A
>> -	tristate "ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet"
>> +config USB_NET_AX88179
>> +	tristate "ASIX AX88179/179A/178A USB 2.0/3.0 to 100M/1G/2.5GbE Adapters"
>>   	depends on USB_USBNET
>> -	select CRC32
>>   	select PHYLINK
>> +	select AX88796B_PHY
>> +	select CRC32
>>   	default y
> 
> The rename of the symbol causes the question to pop back up and it will
> likely annoy Linus. There's no reason for this to 'default y', let's
> stay on the safe side and drop the 'default y'
I will drop the "default y"

> 
> You need to rebase the series, too. Someone mass-renamed a bunch of
> kmallocs to kmalloc_objs upstream, let's make sure we use the _obj
> form in the new places too.
Will fix and re-send shortly.

Thanks for taking the time to look at this!
   birger

