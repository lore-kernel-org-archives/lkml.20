Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973486;
	b=5Uh1I32wPXI1tr5IdMV9wekhm3EokmkHGuMS8Ty4OSNuGQQnX/RcA+i1jrsxbLPngFBY
	 aU46g2Crw3181AtnpPbk0fBBc5ezflsmDN3kfFHKJYzrfdjKtBD7Y9Onz3J+sYbQddtDZ
	 x6U6zzXPnCDW1GW1XZZPlkFKBsJCMD4yPjscf+dR1biU101osOdu8q+4GADFZ7j//uV4H
	 p7n3mZBlmekh+MWvLr6SOWPIlrYLbzhbcuEwyMcXJNUW5x+8iU1zoU0OrTgmEWm0uh8l6
	 MEnqF9wnhWFp0jr4yQ/bCg/CLdMKVNeluwWq/jXGTB17lpbBxXC5RUjNwQMe9uUQOPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
	b=HSN6PLf0L7dSKVTGlNSMBQIA4crqmz6tZ/EWfBc6xhNAwPZLGko6OSPiX+2yksArQkpQ
	 n1ImwWK5CsSNl1QtaPUKCZMZ/2UFUNrWuwGMnpDEixOskt2ZoD2Ked9NnvuSBYCGX/lFx
	 FOQobKbmOEOjhCkX3NrZ8upNPrlcEVjDvTu0Dr4mZjcujMYA29wgR/Y5yPlHQQAYw3H00
	 RF+NGor3x3/RH+9tXJab+SEzRXbYqhGLD01lyxDcau27BNm580bU7d3qiABWhBKwQHb4F
	 XQQMYQSiC0M2aDyUhvCQDgNjGNaL80eMJK33gpTJEQTzHzBZKIKG4hQEN7JF25SWgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDxOh0a;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A5606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDxOh0a
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1993132a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973485; x=1793578285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
        b=CIDxOh0aBDi9vhnbv39eP8/prDff34JlyHFnFhvzxyJuajci3zsYRmfCEDMWrFmB3H
         2kWO9Mn/w9sg3V4Nf18mMKuuTkni5CJP5x449iUU0sB6x1JqSrR09KTrEqtI9f0OuO+x
         rDyElSpnaMhn/SHOs+X5LcWR6vSU/W2G2vsZ+hmlVQUqlnCSkzrO8bqgaWosHpY3VsaR
         Oe69ic+J3mPxwQQQ7XucgqBvvJkYvOiTuDNO6MsXygLjk/efXwwK12nFiIY3ykCbj97k
         QTmt2rkG9vZhoqFtXUmrKDAbvhzsExE0DLPzNCZg3ivGWeMR767bK31bYA97VFfed+He
         jO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973485; x=1793578285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
        b=tW1s5EusV7xnVSdkewpOf1jmFBtZKtENvSXz6SFQ0AK4uYkIcMLWQuGrqOd95Bfls9
         D6LG9b7HSC3Yjv+NID2lr8UjuDUGBtEJxXxQU9bJIcalltRYXUWbTezSiNe2KCzla276
         rmMTqcpQQfAUj0zhKgDgSHgQFXglKGoJl/afDR+TbV6twPVDg2pw1RI9m0lhkPP3FNVt
         Vt+GN4fvG8BlqhdH7B4ZyMHE1ynVV7rEr6TctaOvfqqDUA/z0U+4rwth+X2aq2rdqyYf
         /fQqNafVPH78VLnmYqIVaJ4X4kKO8eVrXOBxAsNa4XqwxCy7T6hFZLllCa9SYN8/V79W
         3Wjw==
X-Forwarded-Encrypted: i=1; AKwUvByBvPRFQP8BWTGY0xZAcUZD7yMpEZhB3ItNpRu5SSVuWP5Zslz7JjfEsCdheRoDTWTY7RiL6sFRYYaeR7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkFmnzmyV9BkkaTWNzdCJUv2rf4B6pVrZOYepum2UJYdzvzBxf
	bPmddRBjp+9Sxr2CGgPeLtzPk81LNsUZgLVghDq7JinkW+jwx8dwNlUwNwhjBA==
X-Gm-Gg: AYBFou2AkIKNv2FlF7Cd65GJseefPt7Y6JKtZ6Rpd9k5UaxwlV6rvCy8wXiT5omWTn0
	ms/erNr7C5nnjTNsEQXm9pHNTheg3Kyo0njjGImUCU66iZ6TT5taYjjZjN/FPIA7b4NoXkAehQp
	3kkNT7zsJxbftaanQKT5lo2dvLRBH5U91s54K+BnyWKNuN0aQ7vk423RACyh0cMXijayASH/dkZ
	cTEiYHGESILupMPfbGu4BLSuVAFz1jakjDyryZnvb9QJ58SEiY8toSdV+vUAM5rlXTfIsze/lfd
	zEV9iwAYgB6upy0uvfS/hLT/ZT7DM0SsVwEMdzwIc48K+9BjAFLxQ9LUHuOByze52qdKEKeTcH2
	vsaH/n8jfuS/vO8HnNAG9T1jgb4coEmykPKLDtlFsOBOZAFKWF/H9kq2d43evoHcUiQjTlacHGa
	SY3QV46zVdba9a3NBlY627PcgQ78N6p48aQ0rHS4rmptqTUm9+pPBPd2tNWq2X/H1sgaQVUxdjr
	KPGhUIiqaZ7DOK/PXJkXaav+PU1JtUxFVXCcLMF+BDbFhLxR/7aXmuKWGmoJpHTXZ5L8wk3MEpI
	1xzMbqneLCAUzdQ=
X-Received: by 2002:a17:90b:3dc8:b0:3ac:adce:60c5 with SMTP id 98e67ed59e1d1-3adeac07ed1mr4524637a91.23.1792973485449;
        Sun, 25 Oct 2026 17:11:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm5994393a91.5.2026.10.25.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:11:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:11:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Robert Marko <robert.marko@sartura.hr>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Daniel Nilsson <daniel.nilsson@flex.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/31] hwmon: convert i2c_smbus_read_block_data() users
 to pass buffer length
Message-ID: <6ec548ce-dce3-4a13-a34f-ed7d66b10c2a@roeck-us.net>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
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
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>

On Sat, Oct 24, 2026 at 08:06:03PM -0700, Dmitry Torokhov wrote:
> Convert all callers of i2c_smbus_read_block_data() across the hwmon
> and PMBus subsystems to pass destination buffer sizes, adopting the
> 4-argument form introduced in commit 68f382641f8c ("i2c: smbus: make
> i2c_smbus_read_block_data() safer").
> 
> For drivers that used intermediate bounce buffers (lineage-pem, lm93,
> and pt5161l), redundant buffer allocations and memcpy() calls are
> dropped so data is read directly into target structures.
> 
> For drivers performing string comparisons on the read data
> (acbel-fsg032, bpa-rs600, ltc4286, max15301, pim4328, and stpddc60),
> ensure the destination buffer is explicitly NUL-terminated before
> comparison, and pass a length that reserves space for the terminator.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Series applied.

Thanks,
Guenter
