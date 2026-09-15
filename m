Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ACD217723
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454590; cv=none; b=atmi7+RwZjAPfTooCwXussByaWWp869u4O3C3VVyDeLlsFFKgLRFVldqOp/LK/xtMClaDjZNT8emNpD6Mfdb/pHlWNvsdgCLec9sLYHtW7qGC1JYPNdA/hPuv309qVZ0cZ0+SMa+9jzA3ArBq5s/IGvoH0Ablf7mwSsi4Q6W87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454590; c=relaxed/simple;
	bh=rPlJgrTAgivnnz6mVejTKVt9RYcI9yQwD/+TIy1M6Zw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M8erXetOqqHhAWIJFpGfmJT8cD7owBCPmoo59PzJ5BWASD9ZRbS19fAEN7RK3JrwVkGidm3cUvDeGpXKTLicG+V9bCMV/6wYI2r6fExpVFUyhZ7QNItQ+jLxeBDXoNLXZUq9C4Yezev/c0PVy5P8Am/+V76fV3KF+HKCg1vjBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=St+j1/nh; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="St+j1/nh"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e2254dso388243b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789454588; x=1790059388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKUg9BLWff5kiPeotNdE9F6L4UtNLkRCJ8RzVJJbCgI=;
        b=St+j1/nhhgxDKJequLN0w5F0iwwl/0yS+rMYNyknlHXeX6ZbW3wi/WLSuKULzURb+K
         bTK1QUC6sOpnbPKEBUqgk3yOEVXeWitUsydGGJ/n7kbegWEtb7k8RbIwp7xIAFnXGngi
         bLDKGogPda2Kih/F+Vt6Zw1EqMpuIq1jJvlyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454588; x=1790059388;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKUg9BLWff5kiPeotNdE9F6L4UtNLkRCJ8RzVJJbCgI=;
        b=cwIrDe5wU0k01KYpakRcINnyRqPySixiTDvriv3e3+Nr+lkk5p+cNThkt0wcQ3yM9h
         Omd0fqpy6dSI1zy7ieFgnuGYVM2yXFVghriJ1u6tpnOADYXyUdKlq6toODQVYxG5VTHr
         pRgeCUg1N2yNpiyPt/EHrl8ZhOuuh+8ME0QGTE740LJQYLBFkHRWYuQa/Ct6ddkU0MWn
         mdTvCFE+68dIjStj1ylIN9nOIdssAmj0RZgSsR4yWDy5nHtIV+PxFUIVdl0e49Fx2rFf
         j0tV8MU+WpcL6KkC9EdA7ous8ZjJxRhmz1MrPxogsqFIRHmB8LkgW1UWl/FlucYV5R1o
         M1aw==
X-Gm-Message-State: AFuF++lwnFdubhGOna2PymzIJzyrln8ZQtgZ8ifVf3LwHH8S1X/oYrdk
	8rWpaUmsgN6IVCYVikHUHtHg4qmUFIEJKT5N/wtJF8CWhAn0ZWMi07EKFeRdJJAZqgeebk5CXQ5
	gNNI=
X-Gm-Gg: AYBFou3q2bi4cXRKoxeGzw+LXN2RIk6vyzKxkQnQLl1XfQI/ZkgdgTYfa0xv7TDGtAs
	G25x3kLZEl63v+qRozg+fqR8Wx/oyRh187EU8/+EISJt3Oa3ASYRu91nPT/SmKl14qu9bkIVtp3
	n4DFzNPhGOEcsldkSSLs3MmQT6G8rigLfdSkoTNrbOzO5JbUV35a6z8kPYJM51/rC8bn+wcHuH/
	j55ZOIPEtNPaFastqZKAAm9a3iFhYG+4RYBhBmqVoWokHXqyN5OhkxbF86Vl2Xz6lqdK4qzHvmU
	ZZOtE810uk2X7L2Ly/ERFUle/5REM1PB28vuO8UypH6i1t0C4/uFqvjVZ+EPnecP4QKA4ogGZp/
	elDG732dAxomwvK6lNYx13u4NKDspEkAtTQhl28m77REUXHVa20wBOSOOLInTI0VCgFZscc/FwM
	2S+vk8RupXfc6NL154h75XliLfi581q6xe5h25jb2CxV+xt5UVWq2TubzlOexfKPp8vcEic7ff4
	WL+Q1lMGd5LOkAU3ftJhDbmB/suLX/IyiJRVGoVdVdN0vUKWezFpZ6IaA==
X-Received: by 2002:a05:6a00:3996:b0:867:bb96:52b2 with SMTP id d2e1a72fcca58-8708abcaaa7mr3435307b3a.5.1789454587912;
        Mon, 14 Sep 2026 23:43:07 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:fb1f:30c0:2c68:79bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb760sm5618262b3a.46.2026.09.14.23.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:43:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260903084823.4156065-1-wenst@chromium.org>
References: <20260903084823.4156065-1-wenst@chromium.org>
Subject: Re: [PATCH v2] drm/sysfb: Use iosys_map_memset() to clear buffer
Message-Id: <178945458608.1777136.8682538603402448473.b4-ty@chromium.org>
Date: Tue, 15 Sep 2026 14:43:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Thu, 03 Sep 2026 16:48:22 +0800, Chen-Yu Tsai wrote:
> The atomic disable in drm/sysfb currently clears the buffer using
> memset_io(). Since the mapping is provided in a |struct iosys_map|,
> it is better to use the related API instead of extracting the vaddr.
> This is mentioned as a TODO item.
> 
> Switch to iosys_map_memset(), which takes the mapping as well as an
> offset into the mapping.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sysfb: Use iosys_map_memset() to clear buffer
      commit: b57c9b345d18d67902625355c45caf322e2ab794

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

