Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334048;
	b=0ylPVvSMXRYa3iFflH3fvEbkqTKzNN8H8H7yV7Rhv9YmevG4ERh0xAUCARob3Xiql5+t
	 4n2HCbQqdNja56Ydll16spiLOW/7yWEhsJqIDeZmq9ZMO8fyaxEKAwVj3K7ZYG+1rrlal
	 z3agf9O0l3yEj/LrTWPMoaxV6dv0Ay7KqR53SmogUZSIsKnR8f8qqi9eaLd9sQdYZhw6J
	 F7PquUsZda7LEWIJrmuHvPXnEyNAHRRMd1a7shbFMzMlNAJ7aHi4veOcyOIgDlOcUAJNp
	 XOTb9HfAp+5KLwSj0VtT+5qf9n07hIWq2DR/s8DM7nhvqioAe00ar8EqplUXNItUtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/93bouI9CcjSIYEarFZ2TsV/Z5miSOYaycaZE18W1uo=;
	b=R6Khdf6JcTmJWNeF7Rq3BwjtUknJP4iGs93u5leXq0aBdh/ttDPwamh+UqvUp7aO/YFy
	 5ej5EckjEYZx7b6+ly5yN9tPqlw3ogi/da0hXD1gFBSJoeI9HUBSXEJ1oZPUALK8Jtf2Q
	 rijx2hTXOI9W83CKLLxu/1GOjA5VydJ7l+HD9nCKvlqeBmFJb6EwcCEWI/Xr+bFQV/4pN
	 lsUxOQ/CA+CgyqrXhPqGYhenKR9HoC5lwW769PpekEgyZLBcZ7CdvqJlGMpr3ZwbBRP63
	 UKHX0/+b+Cqmdeo6yO1RDRIsb32Tg0fgeGwjR8MM1O/9KDEN+LV8rmbrVUVJQLzC9Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upKILPLi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1994B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upKILPLi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37000e7234bso4305401eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334047; x=1794938847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/93bouI9CcjSIYEarFZ2TsV/Z5miSOYaycaZE18W1uo=;
        b=upKILPLiFPBNGdQfhXBlmQqYOTTt1EKphzcX9/OMkwv94HLJmJiQOmCKfwh7y4lGlx
         FVs8IcjYSYqd5ZekqqlR4K49in0kSdGTJAYGfngycieG1lFNGsLsqdSetjBpo983dRrL
         Js98PEFpaxz3fN/zrXVq+D+mxdyn91sOJ2tmj8lIB0EGm/8sstIElQrJlbYR4n1ZfhUx
         YbwSM0uwS6Kfn31DqB9S9RmuD33B8pMhDYQ/h9MKwPRkjsdZBmGkSLQ0/koqvYCkfRgD
         6AKEkoB+fgq4s/HfdfoMas5xs7FnumleKgo9om8084OEQsXbylAbkTdvexpqBLSlolvj
         AOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334047; x=1794938847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/93bouI9CcjSIYEarFZ2TsV/Z5miSOYaycaZE18W1uo=;
        b=MxzvjqvLWK7WGAt6jmkjcgnUjNC7g3nmZMGmNa2OGez4GAIzNwWRSFNpIUaFgswOz6
         YA/s0afOb/E0g8xJ294NQsH1RVX8Pmv44y2L8f2aFZkhhiQr+PhshX9kmrili7CKBD8R
         kB2prHhWnGLtTWK3p0qoeobbP9RXa/k/80vv6Ahkunnu39Ujl09LYjsF3u1+j3/StFqF
         LZFpNPXNpcEbPOJwJhe5rP/gNfLEDxV4HAuZs/MXaecX/DzRm0I4iem1Tw18Yjtvhozi
         6f6dbWoVohtOE7RQe21uWeuKFYB9xsUz4LPfw/6rpMZr3Wb8/utGhkuYf3ByfSOb+8e7
         74OA==
X-Forwarded-Encrypted: i=1; AL+hErFzWC3fDpl4VSuwQeeoEe7S8P36d6e2ZguhlaLsFf/J63ocComt2Kqrh/n1erB2pwAPKaTUoJkPfj2eg3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+du0y+y5+0rjNF2dScmVJ1I5Y1ycXqBRLei9lFQ8ujov1foyqs
	3p5LrzYzf30YQSvZNuY8TjcrlWpnnd2QvDqXxM2hCGVdjyIoQvgSpG7T
X-Gm-Gg: AYBFou1BzQSqfXIf2qROBhc4ASvcizT6zeqaOY1TVcn8JH0Rot/YzLHieWRDdr1pPJA
	VdqurWf5slWSjoYJiuvaHvSRo0PJAUaHQtuZiJkpTHe26A8b9XokBOL7lJbTqsqeKC8VQyYv8I6
	V3HLBplfsKjcu27W77zaWC9J2jsD9pXnP03W7aTpItXYa0+ydWQknz4MQiQDZ+K4hoyral8ATCV
	Xab7+XXn+V0FdEbFnXZX3470V5+Ix61yXm6vDRRHEtqGH5Ifdtwbo4WUE5TLkqg1XPnlumRHUZm
	+obWxKtKtGTzki6EEEBzeHJnGnbPeqOf6hc6WlRjTOH+qp26z5yo/iGWWatb6sgFnTMXKiSoYzT
	TaJNa2ghlpVs/6XZd/sP0sxfCNyf5RsC/Or/VoF8WbMqwUNeRWVrzlzQIp7Cuun90Qm2mao4mQ9
	5O9SCOCOCdLAIT/LC7SCpEVSohgcRtBghF7eE+dybgEWoKaq+zBmFCqi8EVePlY+hqL0soEnHk8
	fpZ/v+sSDyKwtNzFgYgUOTqyJ1F2KHiju0XSQPX4GEwgMzqbRWaaS8AuhG44A2l44c/88bRS8h/
	ueHOFTOEZOlfAkK6aTp16HQEzn/Jdmoda9CrCg==
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr102273eec.5.1794334046759;
        Tue, 10 Nov 2026 10:07:26 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751d9f135asm8302893eec.2.2026.11.10.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:07:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] nvdimm/pmem: Fix disk resource cleanup on
 initialization failure
From: mdshahid03@gmail.com
To: Alison Schofield <alison.schofield@intel.com>
Cc: mdshahid03@gmail.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
 iweiny@kernel.org, nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <au0PabL2q2640uWI@aschofie-mobl2.lan>
References: <20261104161825.314835-1-mdshahid03@gmail.com>
 <au0PabL2q2640uWI@aschofie-mobl2.lan>
Date: Tue, 10 Nov 2026 23:37:07 +0530
Message-Id: <179433402708.154498.2389032583809626611.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Alison .

Lesson learned !!!

On 2026-11-05 15:21 -0800, Alison Schofield wrote:
> On Wed, Nov 04, 2026 at 09:48:25PM +0530, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > pmem_attach_disk() allocates a disk using blk_alloc_disk()
> > before initializing badblocks.
> > 
> > If devm_init_badblocks() fails, the function return directly
> > without releasing the previously allocated disk.
> > 
> > Use the existing cleanup path to release the disk and preserve
> > the original error code returned by devm_init_badblocks().
> 
> Hi Mohammad,
> 
> Your patch looks right but this leak is fixed in v7.4-rc1 by: 
> 855a46681e0b ("nvdimm/pmem: Release gendisk on probe failure")
> 
> Basing and building your patches on the latest tree, usually
> the most recent mainline -rc before sending helps avoid this.
> Sometimes a patch is also just on the mailing list, so check
> the list too.
> 
> -- Alison
> 
> > 
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > ---
> >  drivers/nvdimm/pmem.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index 5fb86595e8bd..76e80eccc8e7 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -563,8 +563,9 @@ static int pmem_attach_disk(struct device *dev,
> >  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
> >  	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
> >  			/ 512);
> > -	if (devm_init_badblocks(dev, &pmem->bb))
> > -		return -ENOMEM;
> > +	rc = devm_init_badblocks(dev, &pmem->bb);
> > +	if (rc)
> > +		goto out;
> >  	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
> >  	disk->bb = &pmem->bb;
> >  
> > -- 
> > 2.43.0
> > 
> 
> 


