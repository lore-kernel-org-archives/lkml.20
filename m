Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800771;
	b=GGaXc/KDuAALeWOK+zUu+h2w+pedjgkzS5BCWuvUR6sBbnYD3K1hzzDfDKcx36KoLXc4
	 4fRiS2y0uIkl1cD4F55A0y+XlbvLSyAfMeZ1jm/LTP7iszuqXD2Y6+pLFWEGPAFuP00nX
	 KIIsehRfesWpe7k+wiFURNblHGhsff42zVGR1yAJ2L8pQb3oIOXjzrSxXF8JAovjIUlLi
	 fDplf2B6Hzebo8oaGyJxawsU0kVCTzstzPNP0YotH1SbTqPVNFWvQRbO303y5SYyq0Web
	 M/GUTxNcOTjlDQ8D1oI/+/y9bEN/Bj76x5K7H+pqMxADLGXlOIxcFXtsX6if0HIMvfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800771;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=majQ4gnBolYu2mbieTBQiMbMKTHzyfMnZWZk6wCUSQw=;
	b=bJ4sIHMqjnlsSwiLg1LATUk/OqdYXn4fh5RYGRh8mfir8wMcfh4US36jaGNNnQDEjnRh
	 d606MR7gE3XEpZevh+gEMvlFv9myxJaNRcgF75YFToOJyZYG0ZLpkJNFDdZX2x4qpLxfz
	 HUpidIFS/OLVx53jEI6aEjDMLcFj8tL4RetjtYJ/vkwvn1I9N4qp+CUfLrgj6zXAoQjMv
	 DZpE4WpRFlc2E1Flav9NmPKmCv7nMHH3IFVIuzC9ENOeF3A8ZVAXcT7Z6zlVu8pvRMlWV
	 KYKRCbT1NlQSUzZH+R0Z2HGKSdMpzoOdRHAlMpB7jRR9HFb0mwMyLCmBFTL/QKh8b+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=W7Ll6+aw;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDA3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=W7Ll6+aw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A68110B0D2;
	Sat, 24 Oct 2026 02:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792800764;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=majQ4gnBolYu2mbieTBQiMbMKTHzyfMnZWZk6wCUSQw=;
	b=W7Ll6+awp/KidNpG5Z+6z9RXzsR/0QZzZJKf3J+h8QJp5pf5xYQER3gr/8uXpcSHDqDP12
	+bHUsXjHagZVtjrOOy8/wTCBn6vzfQRpObXP7IQXXf78//QFS3/ME0TMGaFdz6Oks+pOvO
	yNrY06Vh7VMKJpZsOSYr72ZBpMUzJfklS6y86aRvGB4Hqjngsj8YxYZt5IvAKNEsiUL/Lc
	YD6R+1lExQco6EIrhGsz7ezRd7U6VWVfbXOf8JgW4G3S8SNJrMV3IaguaM5to9LRZYXbL7
	dSvWOxQ8U7lTMf4WYpV2ENqCuX0D6n/QtBGv/ZmlxUsSc8Fbmj54WXp4YHBj5Q==
Message-ID: <f1edf86a-8f64-405d-b2d1-f5bad7d7c1c8@nabladev.com>
Date: Sat, 24 Oct 2026 02:12:39 +0200
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
Subject: Re: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
To: Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
Cc: chengminglin@mxic.com.tw, mwalle@kernel.org, miquel.raynal@bootlin.com,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
References: <20260925014517.174496-1-marex@nabladev.com>
 <9bdd8b02469042ffa71851fd2641708e@infineon.com>
 <75174a84-13b6-4a97-b4bf-7513ee43ab69@nabladev.com>
 <8daec856e8dd4f11a805d5d9dcf8d51a@infineon.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8daec856e8dd4f11a805d5d9dcf8d51a@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/23/26 10:05 AM, Takahiro.Kuwano@infineon.com wrote:

Hello Kuwano-san,

>> @@ -89,6 +139,7 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
>>    };
>>
>>    static const struct spi_nor_fixups macronix_qpp4b_fixups = {
>> +       .post_bfpt = mx25l51245_post_bfpt_fixups,
>>          .post_sfdp = macronix_qpp4b_post_sfdp_fixups,
>>    };
>>
> please use late_init hook. post_bfpt should fixe params declared in SFDP/BFPT.
> locking is not declared in SFDP/BFPT.

Understood, will do so and send V2 shortly.

But I would really like it if Macronix people could have a look at the 
patch too before it is applied, to be on the safe side.

[...]

Thank you for your help !

-- 
Best regards,
Marek Vasut
