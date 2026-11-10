Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299466;
	b=AkFWkQ3ctf6DqM7vZv7y9Jv+KrZXa7DP81cP/AkEVhtbAQdkjAhdhNlDLwjhOS7pjdAY
	 zKcW6cZvVd0uc/5W13HkSXfPw1sQ+EZcaShUKBOlFKe9WQWA5x9nYKWwUwcNBOwZkH8y8
	 YP1JgFQlFxB+MOxcFsiGCFDL4L9zuNkwtzYLiDe8WudZWuW8nginlAPncNUq5bLkBivzM
	 ERdbEwgtN/ooCHZjs6tF8Awacjy09jHJwQWxCjJzc3J917d9EMvSt+aSk2lxOZeBW4e/N
	 td/YbOBa7k1ZvuWiiBr79by8LO7NiN0crVwTFYj+hFO9EUsfxc5bIx2Lp1ydqTOfZrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299466;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
	b=L5em95J4clKDgQPqXxoQUa0Qcyu6L/0TtN6uLQ79Gs5/Vs0l2ji8hQrfxqwWp/TC3XJb
	 49QGhsDPd3DaQMFrrN9a7Mt2h83PXhLRurR/OyTzSHNAD6gbpQn93HZvupZQIOSIpVnKC
	 IPhuIouNFI4mKsup7Izs2Zp2pmIUfPYm+TJSZbN+0qwwe7yrFrIyNLtmDKxF7DcgpMYd3
	 hqfBEdhLFAU0arxWo/TUIe48DaauVw+NsEofL7DiFsdpo7hMCtgyzNTXqCrQ2Nc8r08BU
	 jlWMXhKL/2pX3eUNfnS7QAkC8JMmYZzZXi3SBt0pyN6RcXuc6E/mJ5bk0dWjk9oKs5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KssVo+Za;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RlLSCZl1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313B60A3834
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6313B60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KssVo+Za;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RlLSCZl1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794299464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
	b=KssVo+ZaJ7rLj0MPnEMu3Fbeaq2N1FMfjXGHBOvvG0TKDI/D9eWAg6Xsn4rOqMk5m96MJ4
	abyHI0N1t9nSae4nALFn1oRLWJgCTI0Gn5H0WpxtLk/LZeQJtp3a4cRXHQfSE28ZstiCos
	8147xRtqW01MUTxiMHtTSMZERTCCBUQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-ck_VCfH6MrS5JpykNCNyZQ-1; Tue, 10 Nov 2026 03:31:02 -0500
X-MC-Unique: ck_VCfH6MrS5JpykNCNyZQ-1
X-Mimecast-MFC-AGG-ID: ck_VCfH6MrS5JpykNCNyZQ_1794299461
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2063be141so16491165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794299461; x=1794904261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
        b=RlLSCZl1f2ieYE0nuRo3ks6hpd/xhYiHJ8P5g0Ypa4rV99Nwm29STv/yE8VqrjVQQW
         gLvPr0sYZ492EZnEKGfzu5V6dCA0GI48Z5QoHF/H0w3sXQKq80qq93ySsVEs26JkUcuV
         rMV2fjCENBk8qtUKl6stIXvFt8T3FrH1n5Vv83wwYT79Scs8Vgof98GhCpbuv4PROwu+
         YrlLHXzAFs23ih5xiuRwjbkJq/t4ujKhvqUrkvr8+2K93OCiCACkraSDz6J5PV+Lwrsy
         t1DFw/829L9egt5kuG9BhyJKyiqtDjzywOlR7/xx/A0Xbd48JaFVfLSbSD6JvxbYZjJv
         a8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299461; x=1794904261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI2PKfoJt0rvenbJLW+04PG2yF6v5rLbE6RaSFwnr3Y=;
        b=Ud85cOfszMkvsAvCatELoajQvU+Cuts4tagc113ftZoTMPGk5+IWtwtFv9Q5EZQfCZ
         fk45Bwas1CkwezS+szdif8TZEv1Zj4HCm7gBAaqTUm/YZke6q/ATC857FsZVvLVqKxcG
         In6wMC9bqKQBGR0LIDgHquk1ESG6Ob2X6+3r1RAHpgeqSp8i3NE+5P8rupkNBypZ9rqw
         o3FeXDT1XSzQTxMnhRXc4vqa/UWTjvPwbX9ojtfafGQrWq14I71r2g3Nqyu1HjRZ5+po
         y2zuX7kItng8nEO10bErRszj72bRjLubj9Fu1FTfEgO7XMjh+rurbeqyaPYzAFgZPGw7
         sbXA==
X-Forwarded-Encrypted: i=1; AL+hErEYCB7dVgAQAO+fOhyF15E75OKO4qvu4wEcJBLr0rKugE0C7TZR5PETKreHp0A8s1Urt7D7eyTTZZFrfMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z+awZuqtiT5OX0dZIPc+rhrWPFfjFbiqCpnqSZnfHdN0GJwFv
	/G0/TUXTdTBUCKlamEjUYL4fdb03hHUT3gLRkgX+xvvlb4PCb0DIq4R4NYtP488HOsOg7I92fJ5
	SMcJsmi7o4c/jThn2+qEe6F41kaKAvEpnVe6elViXARV9IwxfFjwfrS8eKoQoQpUkSg==
X-Gm-Gg: AYBFou2dHEqVye/iDIZYxvXbKBY9wGNAnLK0Yd/Ev84yuCVpJRDMUQZ255bpYtINckA
	NRkuEaL/Y9Cpi/MkD5ZI5QZknPC1FRBtGN76d/LafYo22tgCoyQ1BDTw1gkKpqJGeRyRt0C6Z0m
	f58fUXDnYqdF3x2bL5s19drfo0s21bAnaJdOKgvmj+4ciP4ntiBCASHQz9lJF0/Bbz3yowoAEfq
	uOpgfYWOa11XVVCsQFE4lQdCixcWpiu5n6QAAheIdlEeKFS7zC4a8r2I4LMp4kadhiMT2uK6cEQ
	+qHy0kBo85WtUheYlisYISFAP+Z//KTp3xGJiZCdrCkjd5s7uzRoq+7W/qevnNVUspzNHgukIKg
	5fQTW2/tDlmSdSvVDtxdBroy628aVbGBPiIcIyKmyQ3TLIo5qmYCqVXvONhvVe7Gvq0hnhEOEPD
	9fX0LcVM9PlPAAjGOh727kiKdgvKxrP5Re9y5nKd2gqlPM
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr37428065e9.22.1794299461240;
        Tue, 10 Nov 2026 00:31:01 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr37427425e9.22.1794299460813;
        Tue, 10 Nov 2026 00:31:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm44017445e9.12.2026.11.10.00.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 00:31:00 -0800 (PST)
Message-ID: <817d2bd1-64fa-4a6f-bec6-5a4dd4d3a76f@redhat.com>
Date: Tue, 10 Nov 2026 09:30:58 +0100
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
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
To: Magnus Leatti <magnusleatti@kernelriot.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
 <179379704484.488856.2140619507341432623@kernel.org>
 <20261107100140.8279-1-magnusleatti@kernelriot.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261107100140.8279-1-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 11:01, Magnus Leatti wrote:
>> Should the Fixes: tag point at 1b9707e6f1a9 instead, or also include it?
>> As written, stable may backport this to 5.13+ trees that cannot hit these
>> storms.
> 
> A data point for the RBU case from the YT6801, same 64-byte UDP RX
> flood, all on the same 7.0.13 kernel:
> 
>    stmmac from 7.0.13 (has 6ccf12ae111e, not 1b9707e6f1a9):
>      no storm; the MAC interrupt never fires (4 streams for 10 s,
>      and 8 streams plus TX for 30 s)
>    stmmac from 7.2.11, built for 7.0.13:
>      storm, the machine hangs
>    the same, with only 1b9707e6f1a9 reverted:
>      no storm
> 
> So on this hardware the RBU storm needs 1b9707e6f1a9. I did not test
> the RPS case.
> 
>> Since RBU and RPS were enabled only for statistics, was masking them in
>> multi-MSI mode considered as an alternative?

AFAICS 'statistics' here means accounting of some corner cases errors. I
guess this could be a preferable route.

/P

