Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903545;
	b=jr+xbe4iutXn7vkwokO8w2IengplnufhpFBYYYVSIQ8FZmWbcLyCk9VPcoQqeEpT0WL7
	 pW37KtZ5oH1YYKeLeXY3NSoxqnKYuWum9NAExdPQt5Uomus1RCRyV6t0nlegQHBDegTI1
	 ZoT+d/5NUAFZ0XY1KwTa9wGuAdPrmD1RqveIktwMjqmf/oCE6HZNIf1JZjFMxeX8oO7xR
	 4gKBni6CjOLQTTmuKiR0ZmxvXwx312Otlev8lW2vqylvPosJNOlZ/4TzLYcFVe514zcLO
	 rh9g9vP3zNDnPNHEWsMMNuIGyiOD1Ww51zdPaSxEnLgCBtAq2cgr1looOo5WLa0O0GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZFFGdirTAMGtbCDF7cv9kKouCz6oxttoVV1PmG5xK7s=;
	b=UYutONqDqz9NXe8jNYTbqWhAPHeEx0C0WfdoOF8ZM3m957rXcWzT+SplJ5jAi7daFrys
	 ZrXc5MTWEn4liAyon1KQ8Xrg/XDVmPBmaJv2wIVeNdU2m63c7VOFJLGS3T6jE4XRulyrl
	 QTZL1Otb7EKMR0RQeBI64uWxTe6Mlteigy/GepuhOwsIpjQvcYRZpWBPjLIi+q5IHF8pS
	 7rTMBOWchmvwmyfaZrsg2CaEUalGJK2DKYkGmFhdmW18HxGud9MMNOBQ8pcGlUoNcBOUy
	 pX2+BmkKLj5NbI/YbrrS/mqh/6Nlg7snarH2/XvluFxajEjwot84eXzdBY4gmBzjKtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JvgOmnIL;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0302606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0302606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JvgOmnIL
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e948e56af3so820720e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793903544; x=1794508344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFFGdirTAMGtbCDF7cv9kKouCz6oxttoVV1PmG5xK7s=;
        b=JvgOmnILEp6JoB8exJAxxf1LyevYPecxPtWt07s45vFoiXwM/vGzxz6h7ok69LJvKi
         EG52ZDyJHVw0E38MPTMnUjdz2EIndjE98ddI5PYY443VrBXbNSU0m7H/X+3OO+Zdmi+5
         Iz1Vuq9QASKNq7xMUvH62KWgK4P5i0pxrd57CmQOSDlBm63qfSimGQqUxxt/ExN7d9dC
         ueuY5vyFcxK4h/br9E+xv9+95pSwxQw8WSLoUPiXVVZQK6m4o//DKXX27ABQG0jxdnWR
         vFohz0VzJ+eltDMQmzaWdmwM8rcgAklwdVrsH+3QrAqQX9OsIbT9QJy+ru/xOevv5Yck
         CbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903544; x=1794508344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFFGdirTAMGtbCDF7cv9kKouCz6oxttoVV1PmG5xK7s=;
        b=q5th6Ndg2PYUXDOgH/WQ9rGpnBxpdonJ7ujCJsAfd7Xcm55HnrdBxDUqB6vFpXc2Xv
         liGQL/O/bg4+gDIcKpbdkTR6fBdZHewkRWHUKLv/2xOULM6epBSf0r48wiaSzM02MtPX
         yUn97Pr7TgKcMLV3joYb8XnoRziJEsJegRV7no63yiuBGmIzdW4pOXkiwnVkxTSKRJ8d
         gB5xv41NzeYhYW/oznvl80GgUo96ZeZgnHJXBTOtv4LHR693nNN6Bc7Sa/JJjApQkHh+
         ScLv+jc0B8vC9/W4tFKXg1hu8Iailuyu1MhDby5ZZxTcZmICmsOi5FpRpRoH8vdxVsQv
         nlWg==
X-Forwarded-Encrypted: i=1; AKwUvBxs4+WibieM540w3i0AQuaX3WwzWfg1RZCXHFV5TobRZhtSqvNZRYkHwxQQ8j4fVmybd9ipjTJz1fyDyio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DRwoK4F4zkHQW5+xBpot7kLGsbwDS/8kdwV4ugBtqrSmLMTyB
	t1jmBosUut6cM/YhnLCmxQaXevJfT1NU6jVM6LQjKsxA8lfSpEPYhFfBIcSLRxrsl7Q=
X-Gm-Gg: AYBFou39v5zrrdLl3RyTgj7W2hgJSegZCmSVNUiotSjOrauQ/JQuhejtFA86TfdPneU
	3fcHFIra8SW0/99V2CXmSwnmwHPhXfnyObqVKcYpptN5SJ15T4K1zNId859dSwUSuc9lCbrPYRW
	jGig8FPX0o22182woOADT/214wBNfoJK33jjoPSYJ0uNl3/DZMeY68iVeW0GGxnoWmpfvuTSDJR
	ZAmlF/DQ0Xrqbd5fuh7/RUa3L0xQ9NscikLshuZlOEsf/rmW5mWa7sztTRXtwBRcpSq0lIpWAwM
	5rTDI+opgzw8RXgc1R3WxAhd6E5jt5teIRuPjf1OPBBzB/Dv4NbZKQF3nwhc7FHvHFv9aS276Pj
	kYjqwo7xIkgVlX4gQIJfYLn5ZpgrY2CKenRy3P109i3lh4j91qbdrPhJ1zwQwaUtKyMAoiOY9JM
	WvPHBoxsT2JPuAaH7KdTXAttEhVny7TVpM7O5wgqjKYctMlhA3gM2jfxNOkd3sSvlG+WX7rTP2t
	VuG1kNA8g6t/R2i6LUKgLFxiesqmYK9BSsqxNuDgcD6HS1vXhoqis/y1hp9QEDePhpZ5BdWBVcw
	NwmSg8ucgBI4h5Im9vtyfbRsGibJ+/1oFnlXHMdOb6bkdn3WeNk3dPzajyqW9BBucoyUL/ftA/l
	r/ZEgZkRgPA==
X-Received: by 2002:a05:6122:1782:b0:5ea:e1cd:6e4a with SMTP id 71dfb90a1353d-5ecc446d6b1mr99753e0c.23.1793903543539;
        Thu, 05 Nov 2026 10:32:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d77c6esm5043981e0c.6.2026.11.05.10.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:32:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP2G6-00000003Ng9-0h1l;
	Thu, 05 Nov 2026 14:32:22 -0400
Date: Thu, 5 Nov 2026 14:32:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: gong.shuai@sanechips.com.cn, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pbonzini@redhat.com, seanjc@google.com,
	kevin.tian@intel.com, andrew.jones@oss.qualcomm.com,
	fangyu.yu@linux.alibaba.com, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn, gsh517025@gmail.com
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Message-ID: <20261105183222.GE663069@ziepe.ca>
References: <20261029061131.584453-10-gong.shuai@sanechips.com.cn>
 <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
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
In-Reply-To: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>

On Thu, Nov 05, 2026 at 10:49:44PM +0800, Tan Chi wrote:
> Hi Shuai and Fei,
> 
> I noticed a potential issue with fixing the physical DC's PSCID to 0.
> 
> In QEMU, different VFIO devices can have separate stage-1 HWPTs while
> sharing the same vIOMMU and stage-2 parent. This means two devices may
> have different first-stage page table roots but the same host GSCID
> and PSCID=0.
> 
> According to the RISC-V IOMMU specification, DC.ta.PSCID identifies
> the first-stage address space when PDTV=0 and the first stage is not
> Bare. Could this cause the physical IOMMU to reuse cached translations
> across different stage-1 address spaces? Even broader invalidations
> would not prevent such cache aliasing.
> 
> There also seems to be a related issue in patch 6.
> riscv_viommu_cache_invalidate() unconditionally forces PSCV=1 and
> PSCID=0. However, an IOTINVAL.VMA with PSCV=0 also invalidates global
> mappings, while PSCV=1 excludes them. This appears to narrow the
> guest's requested invalidation scope and could leave stale global
> translations cached.
> 
> One possible approach might be to use the PSCID from the guest-provided
> DC.ta when allocating the nested domain, and preserve the guest's PSCID
> and PSCV settings during invalidation while substituting the host GSCID.
> I'm not sure whether additional considerations are needed for PSCID
> reuse or domain lifetime, though.

If the guest is issuing invalidations you must always preserve the
guests "ASID" or whatever your HW calls it. It can be virtualized and
mapped from a guest view to physical, but it must be preserved and
physical must be 1:1 with virtual.

Jason
