Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235713;
	b=Wrhoq8IF5zCOrC3Z8aq87uuVPcUOhezz1Rq9cPNHEkYnwa7kfIAYrS8sHlEwlSiCHSVi
	 Qi3gWLUoVsmv/fP59ipKJ4lefi+F9pPI9CEgfu7uI8RZGjU2PvYPGPo4PkfY/TqThciJM
	 mDd1pSfYkyNV9LsHuHkmhY4iqJ0q30wJJ02pko/rEYZmVFuMaN5W/z84nl8Z232/jWw8b
	 0noGRlE8QzG/D92nB+2kgbmLAxSo0dSEoOnpd8MP9Kh4yGi4zsOvnOnMyGeZpq23alW3j
	 kp4XkhzylPSR1CC0G7aRiT0IG7CN8kBCWugHU4xGb35Az83yxRu512whRgPm6n+cMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235713;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=NjWl5KmjVUAz7N5n6kseSrftao3cqHCKyxau4Vy2pKI=;
	b=MU5x07Lwy5A78nK0dl8ueyD+nj6/vm6UoSr2RaY1aNLwlSUyM5hxJeB6FcAcqHaBFrf9
	 dAZgz+CzdEdpR+1sY3RSkOchnbJ+/ik9KpSIi4JDFytcQL12lrAcbss89/PWSM+h7jHJP
	 7oVlgcFp+DKHZjNyT3o7Hz9tNjN1t3wu1Fybmu9ELFyq3Pv3/GC8bsaoIlz9anaYEcg1N
	 g+VRcoJS5OF4edNrxpAyJ8hskg34uDKSQum1WA6BOx7h9uSu4UuHUBv6Hbs5SuKJM1ghb
	 Otmt6gwD+Zosa7pYAX0kUvIZxSc5S11/dQw32ho5LRQ6Tr31Z4q4zfDGaJtLB6a8+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YcEmH4uC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oYMrm5wh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YcEmH4uC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oYMrm5wh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794235711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NjWl5KmjVUAz7N5n6kseSrftao3cqHCKyxau4Vy2pKI=;
	b=YcEmH4uCQK5m2Rv9gg2/4liVlNxL5glPJMq5ovpjpCL36zg9G3BgvTch+teoPsy9aoHL9F
	1PBWAWNJP5nZWLXNCbpn5YDtY2q9oy4Ew4muwLN/GcX+wrvprPvOt65jkXlSKIjzxFssHw
	BgOK8wS8aibc3GzOJ9GSGyv6FkEUAns=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-efddV_umNaSUtbf91TgkJQ-1; Mon, 09 Nov 2026 09:48:30 -0500
X-MC-Unique: efddV_umNaSUtbf91TgkJQ-1
X-Mimecast-MFC-AGG-ID: efddV_umNaSUtbf91TgkJQ_1794235709
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533928ef33aso13975601cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794235709; x=1794840509; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjWl5KmjVUAz7N5n6kseSrftao3cqHCKyxau4Vy2pKI=;
        b=oYMrm5whAXCXY2UxHzGYVihFnJKRNK0vcmGWGYPevDyv6DDW/hOSK13TKhfs+Im8LN
         Z+SLu/y0PiYOlCyf+YQvQjEbITsQYdsd0YR46JdmKw1fvd42l4NNQpAMbSJ4BxuDbBZC
         /qWWKtgkvNKKiKijCbW8Qd+P2Fm7cojtsBzEbtSXhuHzSK3rwFO0J0EPout8qLpFvYp5
         bLkQTmWKuvqAa4BKG6BGtfTul70zqfppc/Gtt4OT2ruA1sSfARBa8eVjBSg8f+4ibtkM
         dT+6HZcHI9bJ/QWvIY6mH41fPEXXTVUQniMX0nhGUUDgfGo9x3oGdvZMvnpGt2tlfWXD
         IV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235709; x=1794840509;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjWl5KmjVUAz7N5n6kseSrftao3cqHCKyxau4Vy2pKI=;
        b=aEnphqonS+ZDkwkuyZtif1rfqGLoQWAzX3dMYWf64EphyBOUDyGPL+oBl9kjR5S6Qd
         a7T5VBBaBSN/D7ey4txkAhFJCRKZdZi45HqHkJ9ocvytwQWhhSwunWrhnvqIhs/UOEBw
         EPFZokpAt6mLR9EPw0utHmykaUJiIDiAz/Ka5vSnKkLRQ7muawVt5T9iDRPxeABMPkP6
         tOzUo87ivWc/LbjqhrHf6BfqRWNCXq+SWLM81anKTvrTykH++5fsLBgrAKw3n4Mg9n3W
         GG+4zk1pqqCLh9SZaae1xwJXiq5VdKKm36y6ExecDUR1OKZFwcDLKfCoLuqgyC8kir5E
         tD8g==
X-Forwarded-Encrypted: i=1; AL+hErF0geceCK04m1vbLAUAK5TIwMgi/zWXlT0YnUSdvgAJiS5yb7kLWNydcLKfcVZHNSLCeifLTxqH4mPEQuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/js+QNnsLdDx+1xE5DVowQFw3X+eDRRl2QDBLTZrs9wde2Nw2e
	MyXkclzNn0ZaaY/eNTsZS0gefp88UbNKuBK+pYeyWu4RNI/0ESDpZRO5aNwBO3m8dShkI88eNXO
	H0LSMMwOq7TBfqvUsDUXmP6fuBJ/lNOSof+6nvJu3tpufSYHmmq0ZVta3g8eEaSX8Vw==
X-Gm-Gg: AYBFou0VyD19Jrh0m24iS/HK6r5WD1Eo5uZ4nVyTdxH+kuM2ld6qaRLCvBEGBGTqfS5
	QtQk2VjDnPiy1g2guLA1L559HA4eZZWL1fD+6EzE0TqLP/5i9bk/4UlQsZhLxb/x4lE35YLrYme
	9faXeWvSF0rKTHOsyggMqHWlGSqa7t0nMHky8AwTCkHhD2sYF7He5W+FbXazHCxslhDLhTyCKrU
	+Ire9Uh8xeBPSRZVFjJ6JnFZtNFyK1ynIPPG0v2Yb/ET6CMxKKoP5cdseVc8nAsdu1Ki1bw5ETq
	GAu5AP5ZVewyN75HFK+Ss67oGDPHftNdFNIj1y7MwSSlZfQrSg9bNreafmkiMzmfkLV97Fz1e7w
	Cs1C75CND8xBdKurBtrJ4asp+yX4z1DcJBkqFA2O/bo54zuZXnVDoGKgRjh4Pg0DPars5AttZsZ
	RgjHqoSVuNwXX6mG+2hZ8hlUjAdYZMSiMpeTsisbI=
X-Received: by 2002:a05:622a:413:b0:532:a5f4:df25 with SMTP id d75a77b69052e-552a6247046mr61073611cf.57.1794235709177;
        Mon, 09 Nov 2026 06:48:29 -0800 (PST)
X-Received: by 2002:a05:622a:413:b0:532:a5f4:df25 with SMTP id d75a77b69052e-552a6247046mr61073211cf.57.1794235708702;
        Mon, 09 Nov 2026 06:48:28 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55264a2dab3sm41879801cf.27.2026.11.09.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:48:27 -0800 (PST)
Date: Mon, 9 Nov 2026 09:48:26 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] extcon: max77843: convert to subsys_platform_driver()
Message-ID: <avHdOsFVStOYtOm2@redhat.com>
References: <20261106-extcon-subsys-v1-1-6a781b323d6f@redhat.com>
 <10aacc3f-9ac9-413b-9216-ee166b1c6bef@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10aacc3f-9ac9-413b-9216-ee166b1c6bef@kernel.org>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Sat, Nov 07, 2026 at 11:46:57AM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2026 02:07, Brian Masney wrote:
> > Reduce boilerplate code in this driver and convert it over to use
> > the macro subsys_platform_driver().
> > 
> > Note that this driver is configured in the Kconfig to be a tristate,
> > the driver doesn't have suppress_bind_attrs set, and there is no __exit
> > function defined. This change will add an __exit function that
> > unregisters the platform driver.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/extcon/extcon-max77843.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> I am 99% sure that this driver can function as module platform driver,
> because it has necessary MODULE_DEVICE_TABLE() and device is not needed
> for early boot.

I agree and I'll post a v2 that converts it use module_platform_driver()
instead.

> Nevertheless, this change itself is also correct.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Brian

