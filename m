Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668227;
	b=urnE1bLapYdozhYmktQK7rBKsWvn+tZJnN/rOfB/Yjw+tTxNjtcN4pUNK53PxMi0UAOx
	 ygRgORIdum2+0i6mhLouWSH8sh5bDU0//g2Y61QJKLR3Nquk7X6XvKRO2uHcXsYc+ioRD
	 i+OqVgEFBudULaPZBPEYP+DfIIN5gwrx8OhYECt10gZGD/suWHf/jZfzTFem2wTxwq6TX
	 LMXXiCwY5meblzOnoIAJj2IMRb8a33UHCmnLfpYE0OPxyiiFgyOJ9+79ANcOfRux2ZaeH
	 AuBuXLN6KU2Bsfvjkm9l//KYFSqMxnV7lwfTOBP25+gZV6RvzrdX7gyy2seAzWwjXpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RbuYOQqzgIfOAiaZGXnsrc5kralu1woOsjsJovLSjjs=;
	b=2UZHO1vZamrbnCgZgdcLVomHcbnafxy5AeO5VZzZs2FMoyDLqUyHSvRq4y6l8dxpt3iN
	 I2oCRP2FzFSyPdxsFeN7AjMbrtg5kNFVG76y82CIKTJKpSar4RZ1odk3T54ApRn3mUp7i
	 Dl9K87t+0FIV23Ob/j1vaYLMzReP3hO/b2TIqmeAsiQzouv1yo87RSR1UbnZfAiWMWw8t
	 Xeh9tWpBgXByeLX7zYEQ82Y1o1A1wuLneHrNiEIYoj+7kYo0+Zoc5iOKxhTY7bFws17pn
	 f0YFoLM3Cs4xo+WxkV3kVsL6vtDdMaupLoMTIf0Gm991zqNjsdPPtr7ETMFXdXkDRxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OrJVOppd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F3B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OrJVOppd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bb5afa736so233815eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668226; x=1793273026; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RbuYOQqzgIfOAiaZGXnsrc5kralu1woOsjsJovLSjjs=;
        b=OrJVOppdJmpQzpESNnbFh7FZ8bViWXC3cUjorcBi7DoWTRLoNWKjqoq3ED5QmGPJ60
         TFiku3HnfFCx/qDcUdPyYOK1MMrLUH4jwgZ03+npwHiehHjRednoyIgHL2zHTFqtOFPO
         rvVQC//0bD4RTn47Nxh8PIFp31JO8cMFvp8SbdcOPrup676IWiqy/2MzqurMnkI5L/bY
         9mJ+KRF1njvlEhevTmjxP7VpF5inuFMe44cPCDKJLM46OX6MizS8Tnhj1HQ1CqsFQeNP
         ofih15laI4RkIeNh2qhO27Y4IchRphFPcLZOCgrz8RJlYK2EJb80Axw6EV/njxNWq6qH
         rXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668226; x=1793273026;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbuYOQqzgIfOAiaZGXnsrc5kralu1woOsjsJovLSjjs=;
        b=q+MH4vvj/2579cVHz7kZfBFOC6RKaELnw4DhcuLXPQTX+xY5brx93UpjvRo6/lr7UR
         LFhGcdxqCFgFmH8/+SgxSXELbb50RZPfHNgg1uFXBTPXHiXmYUpv4WiDeIgudUtrNsnM
         45crwJrsocF/TSVMDckYQ3VRcQFLRZEPRrIqDZKrZtKN1vypCKoOvIHejStGtHYRhZWl
         j2v0zOvOyo6urY8jcWjjPS5P06hHrh4Yf8kLBy/SchUNTkAD3IosvihwqXEER2AS+raX
         AnSZiCQj0rs/3hGY51tsVRhSO8b02ONGJq8sPKLnNPP5bG+ZFLmP7zpwErLMTbb738Vy
         ReLA==
X-Forwarded-Encrypted: i=1; AKwUvBxn7NmeI4OrdMhDLdxqBtauUQCZ6fLGoB50OtAXg2hQzKF4i153JVOhYSQ2vHa7B3Bu6CYuPqV4J+dYwoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8WVzmcs/o21EvIT9zQnr8LUUeNgQvb9kf6VNyhWM1K5FE7T8F
	Rv+wGUjEMUqH7efZDO0wSPM9PD9rwJyj4mVpAOXKjExqyMod3AT6By5v
X-Gm-Gg: AYBFou1Brp3Vgdf/14W5AyuI256uJmNF9aLuDssT16P9Kt47RoqL/ejNIjkt8DPMonh
	aWEV30EegA3XPKTRtiGduGSWEazTOJfmxMo2pl9ciUXUyNWe8+ACXTStpCW0LPcmVWBaVGl4D2w
	r1uFB9PBjCqLdBkvzrkrdR5VISGYEdIAK/HAPyt/X8YVR/+x7no7967Af5hMRTSf8HV1TJ1tEFt
	lS8i+0aqWWmXa8xvuFjcxHqUZO5KMVDks4b+Z2UZEOkSD6grd1ssyNhxjo/DKFFuYocQWGzsPNG
	bcCpyYxkkUVMFmlYLYPDa/EeZ4kQE8pDzj7FYKo97bGHysjtMWakGx4EP7c3zoVLHthdCmNn6pW
	/gIceHWiSnzrBqz8J9XiJRSR688kqw75iP8HhQKBoqF2IBIpdHxHmWfjZ7KjDdOvmQKPIVddUtC
	MVwSHmutvt7NZTOCVg8g9WHaSE4M2+As//xAYxegSooJyUn/iGj3vbRbDwnZOEuMPMHhfkTnK7w
	77r4ZAOaETjQSGGM2EMt6ffKxTCjCZG6hTBk9wUmFvyH0zATqINaUQL+MQ7z4WAasR1wYjkZQVo
	m2iDZLmPb7LtIsOrHg==
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr5243257eec.0.1792668225739;
        Thu, 22 Oct 2026 04:23:45 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm16249400eec.10.2026.10.22.04.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:23:45 -0700 (PDT)
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
Subject: Re: [PATCH] mm/vma: avoid broken uffd merge on mremap
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Peter Xu <peterx@redhat.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>, 
 stable@vger.kernel.org
In-Reply-To: <atniL5lYyE28HSTm@gremlin>
References: <20261020-uffd-remap-fix-v1-1-0f34fc181f0a@kernel.org>
 <179266301162.763593.1501773594946042790.b4-review@b4>
 <atniL5lYyE28HSTm@gremlin>
Date: Thu, 22 Oct 2026 19:23:38 +0800
Message-Id: <179266821816.763593.10189260302790417327.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-22 11:15 +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Oct 22, 2026 at 05:56:51PM +0800, Xueyuan Chen wrote:
> 
> > > diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
> > > index be8f5161f92a..f786a585caf0 100644
> > > --- a/tools/testing/vma/include/stubs.h
> > > +++ b/tools/testing/vma/include/stubs.h
> 
> > > +static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
> > > +{
> > > +	return false;
> > > +}
> > > +
> >
> > Would it make sense to have the stub in tools/testing/vma/include/stubs.h
> > return a configurable bool, e.g. uffd_without_event_remap, and add a test
> > for the true case? The existing tests would continue to cover the false case.
> 
> No, stubs.h are for simple stubs.
> 
> Changes like that would be only be made if needed.

Got it, thanks!

-- 
Thanks,
Xueyuan

