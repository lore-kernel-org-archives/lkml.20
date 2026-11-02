Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647610;
	b=eRJTehjDIvT9zr3LkIfoSmCWGA37xcrRjkH2LLUJ2Sp2FXH5vWeERxkbVZXgnllON1MD
	 DQDkmF+4ag5oKczi7kcguLkJtDXBJYLHbz6SRLmRObuHPz2Gt1VIbgWOFWxFojeXsnRkT
	 ywcwTIoslt0C/BdVVlxR88Ll7D4t6dGzxavqpe3LDqUD1bce3cQGC1liA/sKJEIFiTfM+
	 zTLeph3JVeJ6h4DhSnskeKRf1dWjxEU99aqmT0Ii3dy8oKpWx2n8VVvV2tzxg46DL4oEb
	 jCsHRBkiutv1XORXH4u3iBfpI5U96An+Dox2bL9HWaQTvHzdfx75LbHL3Y/IGLt0v4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
	b=flko4dIej+rrsBKBS9tzAZRBt1yjqeVOGZvLFB7IikJhr4t7/sp9c8TZdR3Snt/HeZgU
	 Fm7oxWia6yeYhl7beW9nfF/uOXJ7Uu2i89kr0nKb/RqZy3ZXyQPddiDVwb3BDTGL7PEOt
	 BEu5fEXoqvU9AJx/GiuhpVb5s9UP1OKN9/a4k94oNEwA6PUcikfJOGtOr5Qdu5FMtEAsN
	 TzXyvDG98ki3GPfyskWfmqJCFhxO/hvnAkMgOZ9e4RxQLAxUs5y0COn8SJt3DaSGi8iDo
	 9s9Cs9pbD0rVT/CWI/HtegqAPwQTFpTtxvVzm10S/jq/jLpvcolkAs8v1TKAtqEuY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BFF606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-679a254a724so1824385d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647609; x=1794252409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=ji5BHOzQ1RzwPyqsk2s8cHAViYOWD/O+3bZQY/tAGPh6iajASEYoYfopk4UXn09Dvp
         a8Y3e2wrg8IO3piRB36K67BsnG7u0nhbSW+8Ju9C2+l8e4PSWFRKG3DHntj+sT/fctga
         4R6gRl67e2TJBXI2nqrqp02Uj3sBQ8yzPwhNpwHIW8R2V6i2xrLJ0gU3vj79VkfBnMpJ
         5UoLOdz12VNFiwzSkpjsJT5tWJh95TTv8UHajaoTTo6ciV2sUFHKn09peiEAe3KCubYa
         gmdR7/rtDT7RHk67imJuw2/NIFZXKHl0hTZH0cbZIjhp8KOT1bA+l8VGOwaPX59+N1dJ
         pdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647609; x=1794252409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=d1AsAhkDwTaV8Mi9yzgYGuw+0lnUuG5Ebu7LVBONIcjgvm1ef5O964aXlpEak8jSWz
         JnaBfZzcFCYitVeFEdXAJ/xfWgbpZCgZJW+78vg+8mcPFsX4jAngbPJVoU/FvjSZfl5L
         P00DeIDDHiShol19tkuGj/IsbUz78tm6+CXdX2Sw54yc1guJsvBEN1asROIwB5bafRJ4
         oQzId614FMPv3Gi6ed25bjid4D6bhlOhRDIysGWvk3irAyXf2nWCccuV2uyeQ2FiUF4P
         fjEegQq4PMLNt2dD8zmkF0wwGYVfTDhHdV2GVTE8PFWZi8OBNnxbALX0IoD+dblJ/Azo
         OHXg==
X-Forwarded-Encrypted: i=1; AKwUvBz8Q0Ke9pqgA6ovboyZLqnFGUqzCjYK44njIeETIxmMjd+/97PvBZ+quHgfT713DzYuM5OqWg4S+pLOAoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eg6zQqc6WxytFgzvCAFfa6g2wgoIh+IoumQJxXkIW1K5k91Bm
	znQMg/Sy0HLUdFklLUf81o0sX0Ah5C2P46WDwhbuoTDQOrQsiZBYUyxn
X-Gm-Gg: AYBFou0h7zm6ohs5jtI6D9HXTY7J39WZDFt8pYbwRYsGfEDn5Stnbc4rkT/1jU/B4Dx
	7pn7iTijL31z0flBck2V/LmEwHguLAdXpSCw80BcWExsEAm4CbBbfr6C6NlyGHkTdWsOcwRC7TQ
	Rc/w8+7yio5SzVmoadUEwx3bbsAAQzWW6sF2srw82NuO8Plm0XolMRdn8EfTDbzrLcKDKoFy9d4
	Yw/euRRfDWJtap4DfIWD7VJ+f5OoqFkhE8Dk84Dt7807yOHusuBkvnzcF5nYayq02QKMZLwaRTt
	0rjFJMhkcIP8MPH3FYTC819RFQs8ZawDwu/iKzLDK5ASsUrZt50sBctbXaNAnEzLkarAkCLRDjM
	wn8dKsKIjw44sFcg/m5PiiL8FFr7f6MkayCGMQYlLi0FecJ6P6H3VCCFf12xvEvGyhO6v2wsOMA
	X4izUyyfwQknuHNIuAhdJbMYjF2bwTuOzZcBCWCIDrf8kCrZsbrmfeHpJ9JBdjNrTne/AJPWmrD
	+0kURyIm1VKErJhjyaKB7ZilfP3CdgJgKFgruHakIaOGCldMOcjxJM5tmVVlCR2OVMjVgreBsYi
	qU6F46bV7KFy9RDVv6y1Ld13SURWGedA81w=
X-Received: by 2002:a53:d148:0:b0:679:93bd:85ee with SMTP id 956f58d0204a3-67ba4ffc1a6mr6007860d50.39.1793647608751;
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3700b8sm5719489d50.23.2026.11.02.11.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Message-ID: <d39dfdac-e0e3-4c42-9a55-fbcef6806d77@gmail.com>
Date: Mon, 2 Nov 2026 14:26:47 -0500
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
Subject: Re: [PATCH net-next v4 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Martin Belanger <martin.belanger@dell.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
 <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/2/26 13:24, Chuck Lever wrote:
> On Mon, 02 Nov 2026 11:57:57 -0500, Martin Belanger wrote:
>> The matching tlshd change for ktls-utils is a small patch to be
>> submitted at a later time if this series is accepted.
> 
> Recognizing that there may be further API changes, for the series:
> 
>    Reviewed-by: Chuck Lever <cel@kernel.org>
> 
> I don't expect any changes for the sunrpc consumers will be necessary.
> For tlshd, as far as I can tell the whole change is:
> 
> - In tlshd_start_tls_handshake(), register a callback with
>    gnutls_handshake_set_secret_function() before the gnutls_handshake()
>    loop, as quic.c already does. We rely on SSLKEYLOGFILE to decrypt
>    NFS traffic in Wireshark, so that needs to continue to work.
> 
> - In tlshd_initialize_ktls(), after the existing TLS_TX and TLS_RX
>    install succeeds and only for a TLS 1.3 session, set
>    TLS_TX_TRAFFIC_SECRET with the write secret, then
>    TLS_RX_TRAFFIC_SECRET with the read secret.
> 
> - A configure.ac check for TLS_TX_TRAFFIC_SECRET in the installed
>    uapi header, so the build works against older kernels.
> 
> I assume you plan to send tlshd patches, but let me know if instead
> you'd like the ktls-handshake folks to take care of this.
> 
> 
Thanks for the review.

Yes, I will send the tlshd patches. I have a prototype, but it uses
gnutls_session_set_keylog_function(). That replaces the default
SSLKEYLOGFILE writer, so I will switch it to
gnutls_handshake_set_secret_function() as quic.c does, and add the
configure.ac check. I will post it to ktls-utils once the kernel uAPI
is settled.

Martin
