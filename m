Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A684248CE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267325; cv=none; b=HsGVeSQ2bIuvKpvJgvbmSQIAZYDcS3XgvdiM0PWZcDMSxsIK+zIZ3A/jWMFFUick9D2F724ZyZP8LPXuDNSsYrTeI53G+ALNVTolXCN+xrCMgM0NHAlW+Z9wCmQcWn50JlfS6fi+HZSEsc5g3iBPjFUUjADTxcSOY3xVyUYZJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267325; c=relaxed/simple;
	bh=cxP7WPgYOcsOzTkYzBVH75a7X8pFNombS5dd5Fs4gFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrDtIRmLt010AihtoIiBAX3mMG5ULF3xcvIIJjHDJXcu7iDCrducIdIXPSaulsylo4gkjzVDVJ1uTJ4/mbbSmeQoEAJBbNyM/XOn15tjLYQ7Alb5frn5QzcC5GcyvrDDaXPwWL6bsxTkOf/Z66aQnQMbIwPmEiCNOU73RfmOIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UFJomPNn; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UFJomPNn"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb0so155187685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267322; x=1790872122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vqnXyJFHA3jgUbjUAmybKoPJLc3QQSs1Be5SK9r4kic=;
        b=UFJomPNnGedUDMzL2JQqGfxFciFScmgvYi8OT5578HM7jjlXiRFqp4W076XAxgcQS6
         sHmK7pqVepM5TXUhqfO212jzkiCmPyyc40itZGUwyoSqYJPCXGDcnFT0bB0VQISK6H14
         jOIjLv2sD3bWyw3jHjrYUfvblbcmDXlQG9TpyAx4//15+DKMQXryA0EQLlaW6ybs6nIx
         aZJT93gsAfx79F07VydGRbK8Hct2hvTYHAA3e4vLlFqWIAJd1w+WQH1ec32IRxE9YrBA
         YzUpGnG1XfSpt6+aFRRlsYM9m0iqHeklawXLZE3mMLPqCqk+MZSbDnY1kLpHNNMMWSFF
         06/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267322; x=1790872122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqnXyJFHA3jgUbjUAmybKoPJLc3QQSs1Be5SK9r4kic=;
        b=le9Dbkor6AbcnBs2KoFCEqfN7xRNG637/8/n1Nj1XOQLOFAq3E+V479C5tk4k+0SYi
         /HOAYzCvjNn1SIPypmV/TXo69n45cNiR2nvX5MyvduhTej69NGOtJIJmMbiJX/AMsVGP
         jf1y7/nLA1DptkvBQVK5Uwyq2CxlCNO6oabSkv3yjblHfRRF96kfD1NoYukQm4umDShN
         YLk8ZuBHQQqE1dzCAiHt+reiCBv4muwYR+bnTn+rXurq7QSPyJZf86aPpyk1wTwBmQR1
         iYyt8gOOPRGeFfr6P1Gy/fzEv/741dCeHBAKHRfZ9h+dO8GXbDnouwVBSnAH7jF1WciB
         Qduw==
X-Forwarded-Encrypted: i=1; AKwUvBwHehkjDg3hROMRtBjsHI4g/aUn6oletqc58fb0flRERo4Rz5l1eRmCi84elZk6b+iiW0YXgvk6T/n7ZUA=@vger.kernel.org
X-Gm-Message-State: AFuF++kufKoUoq3SlLoA6TLw5+X7dBM31fF6uio3Xins/JsNuRnSEO19
	m9+9ZHgAIZyyutxNXr7Yr1JJHlId/Q/V5Lw2fZR70zSoRcgrDbrUUMhJVxde7vlpX4o=
X-Gm-Gg: AYBFou3F7c6j4wFsrYdro0FXosRgHJbJ3rjf27GFMAaOGHetbebFNIBIyiGkxCV6UM/
	r/WZ++yF5TK/z7MfMz4bAWCcaPuXFBjy3XTc/ux6w1lPFGT97xTtvt2JEmta/BTIkPvOFXXRU5X
	UZn53ndknEVcRLCVB199l4fJasut8kVjfiMsOcTNLrCOUI3dMWzcDxYWWyJ0ZvcYKokgSGOSRH8
	f1KzwIGUySJuTpXC27dJ5CYuJyOzHUHuYe2dR32ZGespvhUW029qsy/XUelAPx6661YjS3WqJVX
	jNycTtgSLs91+N3kLELWSMcwfPQBDQiazbIikFDaDynZANQ0k6kOznemNF8GJhPEItj6PWIRolT
	r8XoqY4P7q7LwW9BKPVSbjwdG2bds82XKUVdzmcoj2pmcZJZ07JiTiWRfFgYpxcSn3AK+6bcr+g
	bPxwZwiGlfGWl9j0ocUeNjPggRLHjgdVG8Xw8l8z8vYxFYQuvGoeLijQIPXK1PkwveN8XKOV25R
	IkbqBaA8RURj0MWj614+aS8qKu/GuKzUB1rELVLl7zI2bsy2f67/BU=
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr373053185a.10.1790267322126;
        Thu, 24 Sep 2026 09:28:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248223dbsm499338585a.10.2026.09.24.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:28:41 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:28:39 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 01/40] mm/vma: fix mmap_prepare file handling, remove
 file_doesnt_need_get
Message-ID: <arVOW_frpIU_JbbP@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-1-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-1-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:10PM +0100, Lorenzo Stoakes (ARM) wrote:
> +static void put_map(struct mmap_state *map)
> +{
...
> +	if (map->vm_file && !map_same_file(map))
> +		fput(map->vm_file);
...
> diff --git a/mm/vma.h b/mm/vma.h
> index e97bd2dfa786..f15faa83f3d6 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -394,8 +394,10 @@ static inline void compat_set_vma_from_desc(struct vm_area_struct *vma,
>  
> +	if (desc->vm_file != vma->vm_file) {
> +		fput(vma->vm_file);


Sashiko pointed out that this could be null if the vma is "anonymized".

Previously we'd discussed that anonymizing a file folio is more of a
wart than a feature, and IIRC you intended to remove that (i think?)
when you removed zero-file mapping "anonymization" so some of this VMA
stuff could be detangled.

If this is an intermediate state, do we still need to manage this NULL
scenario, and when we drop the anonymization mechanism we add a WARN()
that says someone is being naughty?

~Gregory
