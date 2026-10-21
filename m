Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547153;
	b=qqnDXDmTDS8sXQHtgs/xiOkHptCXJrp1VP5m8LyUY7toN+MDosK6LgNgCKvzhsO7Tqln
	 7FHvmy2gPndGF5Hav6dnXB3XvvEuOx4IdzmwtrbJ8wog0VfywaSNDVPOuvr5qPqr/U4eX
	 54Bbtl7n2H8Hr2y29Kx/06GXdtxgLvSfJOWyISXiLNYuj/Cnh+PnHDck47PxDwtUZMi7E
	 SkQhFtpgapAJtcBOSaQuWHL1RG/VLaziH6WlAf5ELmBzYxsmSZY88tT4HI5XrBPEkPpT5
	 E52+GxtY4irAHHNSp3AnKgMENIEA8GJ65LzJLMO2gER1z0KIlcpmQrj+RPcgxdxKicA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
	b=mDJwZSxAFGl4FOWQCk/xpf5I+SVsekyQ1lPgo9HEmE0NysdI+iNRlE+W57aaobnlrozg
	 XHPtj7qSWaEbqhoN4E5EWr/FUAT+yvWhQzxSifceNsJJFzWIB3ZHsnqTDHfOEqbKtliJo
	 XvApwy38jruF/UzridtMcKc5bCVnbVDBBbgFVKmd5mr4MMvAV9yKvcUTe46nWpKZ4wRso
	 nVq798X1Y7A4ymzQSmLlgGSvnwOAur8LEH/J0JYA++41qPnVOifdvJzLkPx5vaTn6Zki3
	 yKvUJISEdOis0+eLFxSyyt5qeYHl8bNngc3ijWBjpzSLB/5sFI/G/BBe51Os0YfGx+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2B7606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so866315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547151; x=1793151951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=WzAyKkQIvP9jsHhriZZX2+NqaSKHWEKR32z2b8t/JWsBJhI9LmHVIAXIBLYTkAYA/r
         3TGyWsXWtYwy8KpoOhpjH1fl9t0x4k6khmQIJL92JvLawBrNY7VRYtODbZfszkWfDtlk
         HS0nv1yw2o3ojEl/F9RuwBcjrzTj35JtlKNkAkhlvMWTSlXyVZ0NbGvSXNaCYhh3lowr
         8K0sT7LNm0C5SEtYt1ojPcHQSTBf7euz4WpBK9GJv7QbGxr3yWS8zNzfRz3gj0S6JFTW
         mufD344rkM56yUSSjQ5vawwRV2ICenp24WFiu8fR5gwCnnlj0z9aDx00NOzWNERUlClx
         vtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547151; x=1793151951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=Xr0To5I6t9mhFKa+U6XmhWRV9wDbgMz+48KnzumUaumoJhUtEvITjNfBp3zX/MwvMe
         G1RxER1hKy7yWPg2aQPUhvsU8xa7XibaRjjLyFyFvtRxW/Siv5xSkoISRii3DwPa4y1P
         s99XVAaNMRvPBmcsZHoKDa4GaC/gOLfwMMB/7ZfUHJ6XbdLjwQEAmFmrJJoGIHzggg6b
         D/HSYpaPHPxNrskykX+xP1hfYBsWqmHhmRMTy4nHgUWunkTyExlhSEk6gzccJqlANH/k
         d3e0FUzAMh0Y6kuqfM62ZPFijViEYPThq0Qb/ay8X4j4ewvKm04x5ESml1jx0L9Ya8Hz
         ur9A==
X-Forwarded-Encrypted: i=1; AKwUvBzAXqhWmXXlhAcFgMN4F5ayv+hJQlmwM6Eb+qerBz6ONt5p9v964fy7v/RYEjZ870jn6JZkS5fLnf42T2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7/PPc8FMi/XcK2ntFMPqe4zinhTB6vlZtliW0v86OHvaBY9EU
	i7zukmK+pDqq2YkVM47g0p4z3biC/DSZaZJJUnXM+Z/f8F9EJZliHzc3
X-Gm-Gg: AYBFou1DIYtHInQCMLVqB2T5D4Z8K1F17PLsiKywOkp3q7nvrz+0Uk91DCiF32Mizvl
	tOXDEDByXtq/fDsVUddZyzpWn4c0/0v6n/8hoDnyycxN/vI+Z3tvr0Tq5uPyojJNT825A208fc0
	slsAHHRBd3TOtseRClcD/aFAsUILc64iTot+coC2Q3igdbCtNivSEy8pd43ZgON8p5hkeK8iIZw
	RH317lmghWkmGs6swv1YP9450V9eoJjmvH+EWdc6y7OSU4kRwOe2Y95fscJZ00ntDmbeHGuQxPm
	XpWXn5ZCi29u89JkFExBfE4zSA/X6X+0o6fiXwDayVDVjRmJh8XqYFxMSraqjGPqtB976TN2IVY
	QehbgzmhrTIwEFWOgIvSgwLtBXD9aB8Re01ZBA4GvowUMvkDOSa/k3aC/sYL0Htd4LUEHMelG5i
	5t8zOl9n6V/bi4uB5y85da1TvlIY9KaM7xtIMhodI6gPc8zuJXlci1s6tDuG8gujElEa0BebP5R
	iioNboD3bTro07GyGiq55NSJPyToyGecOiIyxNFvLDIxCsVg3Gw6B/Ru/BK5UNFqN5KEsD+LwTY
	XXMT0+AfS4x8DrUMZ8Xmh3pxo/9M8j3myqHWKumfnp4e6TZNaM3VLeV5o14bsD4YSHggqQeuGBB
	wzT8E+/+HNQJRcQU=
X-Received: by 2002:a05:600c:8714:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a1fdd1604fmr8629335e9.16.1792547150977;
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-105-001.95.117.pool.telefonica.de. [95.117.105.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm118638605e9.1.2026.10.20.18.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:45:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH 0/6] iommufd: harden DMA-BUF PAL setup and release
Message-ID: <atgWXLYKOFj5cZ0F@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
 <atdKZpEJVZY0enR2@nvdebian.thelocal>
 <20261020182029.GH3008132@nvidia.com>
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
In-Reply-To: <20261020182029.GH3008132@nvidia.com>

On Tue, Oct 20, 2026 at 03:20:29PM +0100, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 10:16:26PM +1100, Alistair Popple wrote:
> 
> > I haven't had a chance to look at these patches yet, but if some of them are
> > fixing bugs in Jason's series it might be best for us to fold them into that
> > series, with correct attribution of course. Anyway I will take a closer look in
> > the morning.
> 
> Are any fixing bugs in tree right now? I think one of them is already
> applied from someone else..
> 

Good catch. None of these fixes a bug in the current mainline tree. I
based the series on the stale c37cf2824740d topic and missed two fixes
that landed in mainline afterward:

- patch 4 is already covered more broadly by f2d70dbd3dce
  ("iommufd: Destroy the pages content after detaching from dmabuf");
- patch 5 duplicates Ankit Soni's e745cd2c749e
  ("iommufd: Take dma_resv lock before dma_buf_unpin() in release path").

Patches 1-3 address lifecycle issues introduced by the PAL conversion,
and patch 6 tests those paths.

My main goal with this RFC was to put the concrete lifecycle issues and
tests on the table and get the discussion moving.

I am not concerned about preserving these as separate commits for
attribution purposes. Please fold or rework any useful pieces into the
mapping-type series as makes sense.

Thanks,
Karl
