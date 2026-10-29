Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268308;
	b=RSi0eyVdjXETFue2occkBQxw+BgcVMZT7N04Zo5QqhgGr3sFVxk6wWt5Xck5HT094U/R
	 IMhSy+me6iMgWYoM4wvk6XJz5hvzsmVDYm8zKI/l6qrx1H765suQdd5PdsF+fdVB1C7A6
	 2xNVjFo9fJZR6mAeZ8ShFHRMHLqh7xesCjJMa80srdJ9BH41je6UMaqSlHOug+61w+Bxb
	 Abr6auMxw1ouJ70PS53eKgfyTNeiEz9KTNPOxmwHRvWqd3QuV5CRcakxOcl4P/WAoxjk7
	 Mr7rW2sfUc3eJ3Ocu311e8p6+MuVgdhhiL07Tt6HZY9tQVnTgNqV93vIm6lFEkBNMpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
	b=sHFMLX8mmxckFySG+E6eo0C4bVvADVB6sLXsJ5pdCQTlhzbo8Ass0kllGHnMESDBge5A
	 vpVmd6Pegh7+eGt6i2RhLbrVzpMZfV8tKGVlgxEcYEbGzGDzBaR+XLLWkqHC8WioqIKqk
	 Kwq7dFeFLsma6GR8TdJwJjZRLCnRTr50OcXcnVspgB5Iq2R4Fy6ZYhdIGgwoAWr8pm78Z
	 L6SIPPuCBRDRYUY59iO+do5LH2hU7pvhT60G6y1gwjb4VzbbENzLn0lLPO7ANZWruixPT
	 bxcCoPRtuvdVQZEPt/gaKZRndI/g4uN3CfLEN+BYyt8uwgdAgSeEBQpHdRPNO60mfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=H1R2lLqH;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520D606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E520D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=H1R2lLqH
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso893582a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268304; x=1793873104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=H1R2lLqHn2Lr6k+r6OdZgfppHvcjyP6TZWTLyu5FilYMTbK3u3CZpeuCjjZIdi4jnC
         0TwveKR9jA6jVTkHNUrcAW5Tw1tmadniatMZ/qV5n4QHz4UpZeLMCH6YQcpCWNXHiqxm
         sw8RqXVy0A85Vy4bcECMhm6L0/zQylmNx98oc9kMhu0oZgHWGKa9CkqcG5v4I07BYGt8
         CgLVdi11r6LTfqrelvyydvPWPfjIYWzxZUqu9juiWWPud6Vj39Og6UeHebRhF8opkpqo
         QTVfn2BUYNe+MeNX4dHVQkUb1CFSbYgbCR2R0c9GD4Um/2KcLIxENbQuIx0sssnOk+oO
         cWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268304; x=1793873104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZ9giMsL3tTbnyDf/k62OFthNCmQXGHyiD+KvibTtRA=;
        b=s7tLMYmWEQE82qVT7h3DonlAe/Jp4WWIHB7tJA8Sj9292z3oqpSX4FN2GXt2oz13lT
         UHiM6YrNRLVFCDfoPS3OttGT135NnX4tr4fNZqo/O+tO5awzpqinRA+yk95avJbdiDmz
         FQDGenagva1/eihQxMUgLUzB0xKkhJz82TWHtPIRCHEs22JQwUEav+KCxDHP/Ou/8CE+
         348639txM8ZYCzlDCm3iw6TsGIpiVifEuizKuz0bGMm0ySUy6M0ze46HsDnlQ1IlnnEX
         VmfeFvMnvldfsBDsa8epBAmg3uT0iE7r25/fznxRtBBYH7CBms/unifF6EC1010IQbT+
         X2gw==
X-Forwarded-Encrypted: i=1; AKwUvBwuaeNbz19ia4KsImCrUOIjbpEUKkPybHwCNC7Cq0nZ/FtVBbJ0VxnV6kiF/h92913anQfpEHgsF8bWcVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtMzw84GGmew2+GMVARBBjdB8mp7RZ3NSe6sKoEAFIta5kSlDR
	Xq74ce1nPEhN/rPzOLaLNBvR7J/ziiZngWQP+4+r5/4TBNJx7p++9xfS/HSvrASUG0w=
X-Gm-Gg: AYBFou0axYUci4brNWAziOwEPNYjMHE/zCbo6MpZ3QVPurqMl7kZpeb1IBLKJCQCpmQ
	LopQzj/xSjKgTIMpmzEm45qVMRJOYtpzHTmc/X3AlxYmgmj7OWTbny1KaOv4c4xa779QOVXl2SS
	hPUMn5X1o5TtSl6Z2GUoKbMnd4UxtoI1tszpQKY0/JpulL+eB3ZsSlbh/EwY3H5drZJc8PXO2KP
	Ng5xxRQ2YiUjlkKK/tuPSEN27/1Z9L+R4wWcBVjGP+q4iOxw4EsN9688we2u9axeoj8w2wlmBb3
	QHDh3za37RTeNPPk19zNrv9wVfqzBNGvbjcHrO7DEl6p5R4Fq/d2lU6O8TRyoIcbfwDKWL4t9yY
	U9N4cwEdcna9hk0eAu/Z+fX/Y9KHwHWmS0ubUQ/o62C+OvjG85IF4L0iUm9HmHlmmjdjKtyQujm
	D4BH+NSBmEWNDsSbCVmosFVCsVo2iG87NMYmmZ2uM1Y+4YZgihOCTamRTE2Pb8y4S7f/RzbZ0zY
	Azq76iPnCjqvf6BKcGGtDRWcpfx7ce6B8bEmHQRqKiZSv248aAhqP86XLFHi+Kni0p9myMT+qTM
	hwpkhyqlf717EeBBmSjFgQpkxKpvB96+1D6XbA==
X-Received: by 2002:a17:906:ee82:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c49d10fc56bmr194240166b.3.1793268303706;
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm705408566b.81.2026.10.29.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:05:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:04:58 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auMX4kbsflE9kK3Q@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>=======
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>
>Did anyone implement a variable length challenge? That seems a bit
>strange. There is also a very important crypto warning here that the

Yes. TPM2_Quote accepts variable-length qualifyingData, represented by
TPM2B_DATA with an explicit length. This varies per request on the same
TPM:

[1] TPM Library Part 2, section 10.3.3, page 136: TPM2B_DATA.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_2_Structures_Version_185_pub_c0a962a931.pdf#page=136

[2] Part 3, section 18.4.2, page 158: TPM2_Quote qualifyingData.
https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf#page=158

The PSA Attestation API, section 4.4, also requires one implementation to
support 32-, 48-, and 64-byte challenges:
https://arm-software.github.io/psa-api/attestation/1.0/api/api.html

FIRME DEN0149 1.0 ALP2, section 8.12, Table 8.23, page 100, likewise
defines an explicit Platform challenge size parameter in x4[31:0].
FIRME itself does not mandate the specific 32/48/64-byte set:
https://documentation-service.arm.com/static/699c3b70b60ef220b14ec14d?token=#page=100


>userspace use of the challenge must not create a "signing oracle". Ie
>do not pass naked network data into the challenge..

Agreed that we should document safe challenge construction.


[..]


