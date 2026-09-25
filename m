Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9D4734E2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339904; cv=none; b=CnFS+ifGNqcgjFkvlbGE4egHs5XUR95p2mWiwPOJ6eOUrt/q0vgqh1XkkeKS5tVcwzZGYZA9umhpNUEmofGHpE3SiRrTjY6T+98cOJlE6J1LiVgBZZ8iV49eJZEYHQO3ZpUtr8W2pU15CKYHitPhFZDUJBG0UkyU/Jl5OsUZOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339904; c=relaxed/simple;
	bh=wuv4MGi1xIl4BRctbiwTEkiFRlGM1Ni+myKEmyicFV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMit6S4HBKHR1lqHiCSXz8VCT9eeU4y201s6Lg2nB2hn1iPtxOPYHOsEg3bZnEy8AgUFfKGh8cI3Za3HqwRA/aJYymXgOas1wRgWe8iHbumCDC9UK1CbCN6UZhrjXNyj/z9E1IFknU1iqk6gUE+hA66oK2WGTZGwys5zaFn3yHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKONaNoh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKONaNoh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so8643405e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790339901; x=1790944701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvqE09oZoS8YEZXQOd3uXFRtBT1f8xMiA/EGjlJRRjI=;
        b=ZKONaNohrAoGEnLKYp1xmtAlbbCL4hrAwC13us4QEvap6ZMUL/KeqrHemzj7cpVvW2
         zONfg13e4JQthHzrBlS5FIIrsV+Mzf5otUHhZzDAlUeO/oESh+AddA9O5SkTah4PB8jk
         Rr8/eob4rAKsSRhdgwl628c1ElXAOCtGqrHoO02mtFtjZOtK6lTCfOCqrEN97HMhXFJS
         1cb0y/E8AFLC/47pWkbfAErfzXwkTo8l9Hn81DoBZG3GdFr8Y/Yb7nQEqte/7XfVnJab
         t6z+4+Sg+uo6ukNYv0t3uJodREVeSdEr4D9S7IQXBCBH107OzP8i1Q88XJzdLouglXAj
         e2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339901; x=1790944701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvqE09oZoS8YEZXQOd3uXFRtBT1f8xMiA/EGjlJRRjI=;
        b=IknJbEKISpBJ5ruNfD1dOWVaLQG1M8whiXP7bJKqDMRhXZYXSDOZQ4F5iHFHzO1S1D
         1k00v2PB62V4tkvipszMZSnsciR2EwFitXksM4mSiBBG70YW+FfyvzwfqGHMbwmfDWHA
         aD+z3qHo/w9jCHLngjnoRtdvFcLlJq+dIphET+An2dSmbOaNNAKFJuH65l/CjOgATDMm
         KPEt9G1AvAhx1iG38VYrnRUwDnH57+OZ7UCHS7Qu3obQmKT6ucNDEA09QRu+YgHqxaQf
         bkGiIUtEljrGqOnYFlCMAU8mUGwpxLBdaQ2OgQlxGnOIgPoc8qoR+9myfKYgMmIn1ZPA
         0iKA==
X-Forwarded-Encrypted: i=1; AKwUvBzalU0XjyN+1S+fpA+86GBShyGe9wVAzJOB7WwOJas7iAZ57G8oYdY6N2qgrCwF1uM+w+5Z+LcAfXwvRyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nXb2Dib5W9rRC93Xrf4DFGBtk84HW50xE2QDHdrRMaLkF+A5Hw
	pjiD6zGA7ODh9BuhcmAnP+vI85zpfH2WW58ptPeFZCosLW3pEOwFKMDf
X-Gm-Gg: AYBFou1yNMikEdksHNmpqZ7YbP7yrXEAX0nSrrY0zQkdFqKbFHuWGVXNrYsyzioL39q
	OlVhy/UIwGqewjojQV6qjXChWk+poAfEx3s/94AaRbrKe9UvJmeNgaKW6aH2uv1dY6KyvFpKoG1
	pgkffd9mb8jAbuIKJWVKs9OjNn3lSgWsKvMU5HPSRIFAokUK5ttEgnKN2HbwIEC1/PStn2rhF1d
	C7EgjVAPz1CdjdJNyOBxtkVX1p5asad3LzLF0H16EQ+NR8F++uLY4o5jEAn9PBP6aqPTOCaF0xk
	ZBH7bvKhagUr82SmdAaqrRlmrSvtQ41PjMPxD2xSNDznZ1R27W5mgvOSNPnPS+EzoHduzd4nbTT
	r4KtEPFrAXEBRlXOoQ8F5/efTrAOIrmlvtk1KtagN4yugOIOpljJjd8l8lvg/IOv0jK6YmOoEX8
	xZ3IXQwKjE6MtLwOnSK29uME5j1xVcGLJI/PqQO97ciyG1apyFOAzWuYtB4cdIF7QKlyk8rdngc
	GwekSBmqzv5MpWocHWEHnzr9XtuPWclG9Wo
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fe6707bb7mr107006315e9.30.1790339900833;
        Fri, 25 Sep 2026 05:38:20 -0700 (PDT)
Received: from fedora ([130.43.154.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm176680405e9.9.2026.09.25.05.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:38:20 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:38:18 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: driver-core@lists.linux.dev, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, linux-kernel@vger.kernel.org,
	dawid.osuchowski@linux.intel.com
Subject: Re: [PATCH] driver core: platform: Simplify platform_device_alloc()
Message-ID: <arZrOu36s26e-mPq@fedora>
References: <20260925093928.3765486-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925093928.3765486-1-cezary.rojewski@intel.com>

On Fri, Sep 25, 2026 at 11:39:28AM +0200, Cezary Rojewski wrote:
> There is no need to double check the 'pa' object.
> 
> Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Minor nit: The commit message could be more descriptive (i.e. something
like "Check whether platform_object allocation failed once instead of
checking for success twice"). Although I imagine compilers are smart
enough to avoid double checking anyway (I haven't looked at the
generated code myself).

Either way the new code is more readable, so LGTM.

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
