Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8B3E44ED
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755279; cv=none; b=gpo1WPH/PKpkW8KBvXK1OU+cBzx/65iirxiqjZ6x6e3uqa8gptPJA59TRg/3m3yj03W1KEvgRFI6lQf7AayHvHiIpcFyh7diS0PZJnUZ0V6k1PJxBdGMcJm5E8eQN3prM7YpztEPRP4Q1bKcsaX+2c2NX6JVePs/RThPIWpdp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755279; c=relaxed/simple;
	bh=8VvSOkc6y3rlTIlWLwAwwqIGp6vCW6cQopRx43uhKyE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YH/rNBtm6JBrwr2R2mYHfHu3IJWjNJ5mm/raWhlp9Pm7mnc2vRrvqieDQFxTFGyaJ8NFxdCLD2yRIabXF/4hC4jKOncUMTPxXNWtK0RbAyz1UykMVGrV/dIqofoQXmkEjddlsgRyiwfL8XM9xAdcujaHzf86YOhPOY14/lIEyhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev; spf=pass smtp.mailfrom=q-lab.dev; dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b=a444FESx; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=cAI5tOWH; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b="a444FESx";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="cAI5tOWH"
DKIM-Signature: a=rsa-sha256; b=a444FESxs9a3t4Te4rw0LAWZ8KpDvKWCU8k0SiyFi01YsZi1paZ5DI19G1eSUwKLA7VILMOM3AiGWyUhPjMpibN9QPDOjvh4D41ZKnGXdVFdKSCeaEZIaXnOhh/T2gVkv88UFzehgqDgDyVcRX3e4zH+FBgr6YjcnBSqweRDChh6EEy4JNLe2GOkc185BksFqalSADo+PZwFp6pZJne8lkpH+DI7dxuZy2+BGaFlMjrQEmAmWRuK5kFTFClw+nxYkJoD5n7F6DpXw3J2AFfrffudhFa2fpyDDd+K5TDNoeZehO8/izlYkByrp8Kplb5lP3MTl2n6hujSyBgqzbjKhQ==; s=purelymail3; d=q-lab.dev; v=1; bh=8VvSOkc6y3rlTIlWLwAwwqIGp6vCW6cQopRx43uhKyE=; h=Received:Date:From:Subject:To;
DKIM-Signature: a=rsa-sha256; b=cAI5tOWHSWMdhNh1KYmkPHnuNpvrEAUs1dOw9uXE4BL8wmuDj48J1cm3hM9kmyAZHQVBTQB0d9KGZk+IXbX+c/lduRGGZcfRXGkjyvVlXOufTilUnyZcTxipOXK/92YK3ch+ZYT+3VaN5nyCSk4cPFvx1V5JuFvuWQor//88Iwwjf3YXGq5QO9xhH2tXy6LUJRdVboSyi80mwpA3NDNMNhVr0N/Iuv0cawJWHRQnHl/XeSlw+A7lAhswu34brPtrb9FUIV7Y+MW9qmtvJw6qYmpZmVqHIIC8NwrQFd81m0T9DziUVaEOE5cw1499yiw9rjezd5vZ0ds0IMjKBHrCdw==; s=purelymail3; d=purelymail.com; v=1; bh=8VvSOkc6y3rlTIlWLwAwwqIGp6vCW6cQopRx43uhKyE=; h=Feedback-ID:Received:Date:From:Subject:To;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2023428983;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 30 Sep 2026 08:00:44 +0000 (UTC)
Message-ID: <2fe4a450-f176-463b-9799-5a03f6448c38@q-lab.dev>
Date: Wed, 30 Sep 2026 01:00:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Quentin Freimanis <quentin@q-lab.dev>
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928045012.30178-1-quentin@q-lab.dev>
 <20260929185936.687250f9@kernel.org>
Content-Language: en-US
In-Reply-To: <20260929185936.687250f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jakub,

On 9/29/26 6:59 PM, Jakub Kicinski wrote:
> On Sun, 27 Sep 2026 21:50:12 -0700 Quentin Freimanis wrote:
>> 0 is NET_ADDR_PERM, so userspace thinks this is a stable address.
> 
> Could you please explain the end-user impact of this?
> Unclear to me from the commit msg if this is something that broke
> your deployment / scripts or maybe you simply noticed it from code
> inspection / LLM scan.
> 
> No need to repost, just explain, I'll add it when applying.
> 

With a random MAC reported as NET_ADDR_PERM, systemd's 
MACAddressPolicy=persistent [1] leaves it unchanged, so a DHCP client 
gets a new IP address every boot and a static reservation can't be used. 
Reporting it as NET_ADDR_RANDOM makes systemd replace it with a stable 
address derived from the interface name and machine-id.

(this is my use case, and how I found the bug)

>> Fix by tracking the base MAC address assign type in the sparx5 struct
>> and applying it to each port's netdev.
> 
> Generally no need to repeat what an average reader can easily grok
> from the diff.

Ack.

- Quentin

[1] 
https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#MACAddressPolicy=
