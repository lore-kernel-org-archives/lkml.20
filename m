Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE226478846
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197033; cv=none; b=a637Wz+VRZVItiU2+hvSLnM2Jz+T8vaqPdhUYK9iBHyWua8u2IytlvKSTOUjoowKuXRay9Ot7ji69h4auMZh0FbqlNSkPWvAJ8aTOFnVMj5cuOBPDiCCuTr2ay0UN4w06LwaEEMDogB18PLeW2rJ9pFETLvsDfNa44k9PVwBsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197033; c=relaxed/simple;
	bh=GfNHU99XxoVs03uGEfjX2wwGQ3PijPbgRI3KAFfoh6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhP80fnL3n0Bjsv6iWfhf4kIzGW0TrC+evDq0Btz9osWhwZRB4PVBp58iAISOPV0zskZowir68aLTaKzbL8AgNDuTqwUDDdkum1iSg4bDxV+m7T0FCYN3Z9hWCjzF/OvxW/uqqpXppdLWuocJJNOTX4HbK3tASg0MXNOL6Kn0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=Yn2xMiyg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="Yn2xMiyg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a7bf792424so836931a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1791197027; x=1791801827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyhge/uJYGnijVR9ixeqw1SZu6gs64VLCeBEpS6Zzhc=;
        b=Yn2xMiyghQYYhW9Oosx9nTi/AR4IFuzRGCXKrSSn93AzmiNJDvSO0N1OzpvQYvc0ea
         6tpNmkGDMiuuqXc3EDStjpYqtByz2bwadcDE0DTtunf411PNAlmJs6B0ssHBcG00Uos7
         yeh81RiBvae9NkLb5YiNHjjDDkzuX/JMf2sZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197027; x=1791801827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyhge/uJYGnijVR9ixeqw1SZu6gs64VLCeBEpS6Zzhc=;
        b=oNKqoYzkG85oNpia+MJOTLe2jLoWbidB+Kg+f3A9SlCRd0KY1+9YsuHu1hOzAYK5AN
         ZiZZC35HsMwwOri9PvOhAVQK0UTl2gnCv25i35vb5slaQ+BbN+LU1cW1C3F9WIknv0Oo
         cyBhUnorx/QiW2/tXEU4QH74wW+pu1lG45nRE7ojCNFXXs/kwFsYMhNObDnvt4dtXHZq
         f/FatHEegIXunj+SAQ4BVWddmsdiZ2eEPYG6fK23L3IjjZUBowGEvEmwP1Uur7JNKyv/
         jhoMHFrSq/A/BLfBROXbQegPy/vOkIAYXE5xVUTe/3i2oiMLZxFfaw9Qiq1W61u2sXsR
         3dDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIUAz+ug0DwXXJ7MKXiopwzRAUXS5zQIApTqewTf/iwF66JhbN6HLo7yhJXKXiJiNjPaxL+Dds03ptKss=@vger.kernel.org
X-Gm-Message-State: AFq9FYIROY+IkJ+RNoibA+ABxAgz9ocLWtNiqGamPO7a3GwQKIXn0DMW
	os9CDW6D1obeCFrpBJrxpv69zbLuMnNLRxyKRVHzx5v9FufvwGuyz6fcPDdr8IRu2tI/5dvMm5L
	8eMwPWhci6Q==
X-Gm-Gg: AYBFou0hzrAA3L4aKGMrkkvjHVmTI2ffmvWN2/1OEnQzB+ObjEOFH9+Fxo5yqVafu0x
	+OstvZRyLlWbIv36nkLybHhzaDkVJrelq7XXL01wgScexBu1pBoRy+Iuqr1d9Res4HZPJ5kvIhy
	jadoNC9skCI5L1P17yRnRpLhqGXVYLhZsqpxTiWTPd9vZL3E28e1/lNNX1FseMolnYNSYsmXKVB
	BCTQ+WouY7++6XMfWKKagze7YwjPesTLJzcaoHlX2/RO5/slYZ/ddBK9CXXEFKQexlIgyYpW933
	5feINlAC0X/pX7piy4cn+fnR14liRiTvN9hgf9mSWOjy16UiZoO8OAMHi+cNS72xGlF8Jy0Yfb0
	RC6l0+Levi7ViA7c4OCr0aOQwxlQPthKKa14paUq99/eZ8WIm4uoSanw6j82beAO+8kmQhx1aiV
	HkrUFHzJKMgna23RTKKTHehY5dDwFcvu01yrMZKiWWS66L9f4X8l1FWChHPTobcsTE
X-Received: by 2002:a17:90b:388e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-3a78673670bmr5645882a91.9.1791197027272;
        Mon, 05 Oct 2026 03:43:47 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7dbf4c81asm3142994a91.1.2026.10.05.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:43:46 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:43:42 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/mm/slabinfo: refactor slab attribute reading
Message-ID: <a6cb4dbli4xaj7dfl2gwklq3suxz2nhrnjvrle4qrj336fxl4f@sf7de4bndqtv>
References: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
 <20260927-tools-mm-update-slabinfo-v1-1-a4ea0d4dc136@snu.ac.kr>
 <arqIzSPQVDky8jqc@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arqIzSPQVDky8jqc@thinkstation>

Hi Harry, thanks for the detailed review and some nice ideas!
I'll address the comments and prepare a v2.

On Mon, Sep 28, 2026 at 04:52:08PM +0100, Harry Yoo wrote:
> Would you please separate this patch into multiple patches?
> It's hard to review when multiple refactorings are done in a single
> patch.

Sure.

> > +	 * Deprecated files:
> > +	 * No STAT_ATTR()/SLAB_ATTR() for these exists in mm/slub.c's
> > +	 * slab_attrs[] anymore.
> 
> This part of the comment looks fine, but
> 
> > Although cpu_slabs remains as a file,
> > +	 * it is also outdated and always prints 0. Keep these for backward
> > +	 * compatibility, but they should be removed later.
> 
> This doesn't seem useful information to put in the comment.
> 
> We were able to remove some files when
> Documentation/ABI/testing/sysfs-kernel-slab says
> "Available when CONFIG_SLUB_STATS is enabled", because that implies that
> those files may not exist. 
> 
> But it's not the case for files like cpu_slabs,
> and I don't think we're going to remove them in the future.
> 
> Probably simply say something like
> 
> "Deprecated files: the kernel does not create those files anymore or
>  always prints hardecoded "0" since they are deprecated" ?

I agree. That sounds better.

-- 
Seongjun Hong
