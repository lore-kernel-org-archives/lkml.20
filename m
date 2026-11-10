Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301753;
	b=emLI4+ncWy10aFJlmSM/lT5iRuk4cX68+Ohpv6SnKmWegZQkzxPTrfPoTRvvOzc3y5IT
	 t6gwhl2DF5oS2gdb4tswiPwmWyBE/EiSMsq2KovV+kfJ0AwbMKRKbPE3BxdeQKPD1QFdJ
	 7h0ik8tc9dW9wfqxUh+e43bAbBEJ/eTe9xilYHX1ZlU6RHYMZNhMSVfG98k97qC1huA5X
	 4RQgX6f2Xr9rqcZQJjAHEWzd8Dj/bFq2EkVvKlJgJdEuURap+H+Ol8cgBOKFFehmDIfD/
	 1JM1gSzHa/lBziKB9dr9a++49NPI11kUlWK8j16nfQzVbBmzQkYdP/EMACoZZ0GRwmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301753;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QkExN09GPNCRK1/4OD2uNzfHx3wdxf9rC1N19wXJ3Yk=;
	b=UPrDenGPpMGWoUbVGcTazzMwVvmqtVNSS4Zvf5pRj/mP5GSu1XAln5BTUZC2WRAZvwex
	 8o8y9kCvfAWi/gk6amG8ffRALP1ewrhcCYIQx4JuzSpaTNkg9e4iZ01iJjVo0fil1MbDj
	 tM7DXv3khI9/9DtW6Ua81U3RJI64vLqfsLeFYy3N2QAld8qzfFKIokB2gump+RuP+nlD9
	 d13tegIZcnjU2GWhotgflXkLiv5E06CYoDQtG7jcj8vOLIJjW1LW6akUWQtDeh/nT8Tp+
	 6xMAaaQSJupfQMylbsQdc4y4qYj1uZ7mWamZohR7ozhgQDApuXjC28AoXuLRE/iN7Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="d/blhxDZ";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eopXaAHP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F53B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d/blhxDZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eopXaAHP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794301751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkExN09GPNCRK1/4OD2uNzfHx3wdxf9rC1N19wXJ3Yk=;
	b=d/blhxDZYDh8ZCaRul1CIqzUG7eA0t+1qtkbMR7Z0NZ5eCXT95fXN4wT5FoWewi92V34qu
	nQfPj1FqF9Ojuc+adfKWgpn3D5vKd34sR6oBLP/bee7956AzbnO5zWl9JVCibqlZ42Ia9e
	Gn+VbVdOTPm4AsiDVc1mCIJ40tAuiiI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-8g9PBXSePNC4r3kcn9uZQA-1; Tue, 10 Nov 2026 04:09:09 -0500
X-MC-Unique: 8g9PBXSePNC4r3kcn9uZQA-1
X-Mimecast-MFC-AGG-ID: 8g9PBXSePNC4r3kcn9uZQA_1794301748
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49337a224a8so1646137f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794301748; x=1794906548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkExN09GPNCRK1/4OD2uNzfHx3wdxf9rC1N19wXJ3Yk=;
        b=eopXaAHPb+A+3+XUaR5PVZCDdczE9BjsEgFKqdaMcxTjE/gpFATLvYIhKrzOmKpq6+
         RMhF48LWTJvgEGo27OIKUfbgQ5hOIHodEWR5Yp0zzOPvAAG9ugpUCAnaHqKWWfiWMdG4
         GT+Z3lGTbW6VpaNysCSiEFns6dlgj0tTYYKO1jEOdci2EyrXgZ1B3bnwsUXy5ZjZgMSB
         cD845qR0SSnaAvVPR3x3Us0t0F7aTAD9/qogO3BfZhTNxgt/DGYTfKIxWCYb4fXOwKze
         jNUkVS4cba4RLV0BANbzk6kwUSttF/FOb/N5e3CGIWCqLucISsKeAn3QjDFzDgTZ+Wqq
         Hn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301748; x=1794906548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkExN09GPNCRK1/4OD2uNzfHx3wdxf9rC1N19wXJ3Yk=;
        b=fRfHW6T1Wk7mvF8iCVdl4kAzkYuPiDHwEeQU58Ej9loo0o/t+Hk7miySysr09xBaRU
         qtfNOmZocsnEPfK8anzMjSRkIbcDd98gvwMQMdZiMzf2ff3zaLiX1pieF8FtjuegYHnU
         6S7uE8ghSxIdO4vnIGfuUnxrR3JuqofGIPXwoPczXtKwaytqnWw49/RElo41JChVrlfg
         E3+g+mS93mPj16g2JvkQOkuoGI8ZOMISdf76gYwTJ85heM+Xex2qMBMGN7xTBUz3XOYy
         VjZcYzyQFr7Ec+hOxypVUeYrQucwFQDUaBLd0WyIQhRlRtE7xrt10X5H+fEX7yccze1C
         jyLQ==
X-Forwarded-Encrypted: i=1; AL+hErFscTCypLFB0Wbf7gb2nHcHpV+IlrvpXGOJIxC8tJlyeXk8QHyzcB2JNi+c/df5ipGcMmTdZCPLpZ2nWPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z94mpVd4DsfcTwvxDOwHAEL6XftVl1vjdEI9FTwwgYqwAJHRL6H
	9eyGzDMHZxqRTNdZEQPUHzZq6CNkjRsIZxq9WmW6nqNig+u9d/t/ssmKMKYdP0K85YIqiAQPKQY
	GiAi1U0/rhpV46jlp1IpjKyuMK6thKFfaLkeNSSMrpH3uQj27vIEryHpw1/X54jMpNA==
X-Gm-Gg: AYBFou1fw9bAU+WDtv6amYpxu0BUhRi6UJZRCvnc3DaWVuktpWSpz8Yosvczy7ZBhoN
	BRCxNGbTjhkENx5RiWTbJXGKFkZoz8APs1doQn9S3NarqGpglXuV1FIhhJyLb+loxucP84KCK3n
	TT4/al61f1Za7EKrpZAczSkNqHT21MHyvo9lAWqzy4XlO6QmwvO5cnMse+hMN9g4w68EGlw0dgd
	5o33hggQzFZTys3ivuWPqOywfX8P1ZGcG5Eyzeeh51yN0AE5T6/sAQfGxVTu74yN6Xbah5C/Prp
	KhHRfovf7bORjicbNwmki/pR4XM5HwLCjsAZ3Uxnt853Lt5qlFbOI8zbzf5M28s/51+rUJtCzeD
	9ax6Bt9XZE14Bbm2vj0sc33lWpmR8SVJ3y1WLrxcmQhm/BlEs5pVMM7R2b56ZvIskxyoGiWCgoh
	J0sVveFRFYEv8vj+pKZCINqbiCxRDsOVcvGq2bhw9NmdiM
X-Received: by 2002:a05:600c:3b92:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba0233e8b0mr37840625e9.14.1794301748009;
        Tue, 10 Nov 2026 01:09:08 -0800 (PST)
X-Received: by 2002:a05:600c:3b92:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba0233e8b0mr37840145e9.14.1794301747662;
        Tue, 10 Nov 2026 01:09:07 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01feee1asm64708965e9.12.2026.11.10.01.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:09:07 -0800 (PST)
Message-ID: <533f97dc-f63a-45d1-b678-3962f5de316c@redhat.com>
Date: Tue, 10 Nov 2026 10:09:06 +0100
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
Subject: Re: [PATCH net-next v2] ipv6: Add NETCONFA_FORCE_FORWARDING to
 netconf messages
To: Ido Schimmel <idosch@nvidia.com>, Gabriel Goller <g.goller@proxmox.com>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-ipv6_add_netconfa-v2-1-6f660990062f@proxmox.com>
 <20261109090505.GA1495012@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261109090505.GA1495012@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 10:05, Ido Schimmel wrote:
> On Wed, Nov 04, 2026 at 10:46:10AM +0100, Gabriel Goller wrote:
>> Since force_forwarding was added, changing the sysctl sends an
>> RTM_NEWNETCONF notification of type NETCONFA_FORCE_FORWARDING, but
>> inet6_netconf_fill_devconf() never emits the attribute. Listeners only
>> receive NETCONFA_IFINDEX without the new value, and RTM_GETNETCONF
>> replies and dumps omit it as well.
>>
>> Also send a notification when disabling all.forwarding resets
>> force_forwarding on an interface, which previously happened silently.
>>
>> Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
> 
> Fixes tag on net-next is only valid when the blamed commit is only in
> net-next, but maybe Paolo / Jakub will agree to strip it, so wait with
> v3.

I agreed the tag should be stripped here, but just for completeness general
guidance above is slightly changed again. Due to the incoming fixes influx
we are redirecting actual, low prio, fixes from net to net-next, retaining
the fixes tag.

>> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> There's a report from Sashiko [1] about a pre-existing issue:
> all.force_forwarding not being cleared when all.forwarding is cleared.
> 
> # ip link add name dummy1 type dummy
> # sysctl -wq net.ipv6.conf.all.forwarding=1
> # sysctl -wq net.ipv6.conf.all.force_forwarding=1
> # sysctl -wq net.ipv6.conf.all.forwarding=0
> # sysctl net.ipv6.conf.dummy1.force_forwarding
> net.ipv6.conf.dummy1.force_forwarding = 0
> # sysctl net.ipv6.conf.all.force_forwarding
> net.ipv6.conf.all.force_forwarding = 1
> 
> [1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261104-ipv6_add_netconfa-v2-1-6f660990062f@proxmox.com

Thanks, I agree that is separate topic, again IMHO suitable for net-next.

/P

