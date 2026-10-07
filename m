Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6141440E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360446; cv=none; b=npJzd2zrRlKX+T86sfoBkmCYppbnBQk6Wi6yiHDmdEF7PjDE0Q2QTStPv9Vlm5NcNc4E9B9RL0hgVGoj/sRporhC8/NOdouPb4i+VdObb366/tEd3/NAkaXrNAY3xXxWtUTnqJDbt4njdVqs3dTtZRJp3/NJ9pq5+XSyqwNqTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360446; c=relaxed/simple;
	bh=JG+VZZyN+gUkCxI9cJf8qvBhcarcWH5CUxrqXxET8ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLdqCmKZegXvvG1vuXkBS776tZ5dk057xyUKY0SnBIQNBcmuHFEZV3iKD8vujWwK2LDIXJggLw30Z/5QZ1OH1e43e4+4N+JIeLO2h9RZZ4/4iQ/80hz+kuxE0h2P64rNCfuU5HTOU34nP6NmeMQS+4zB/6UYBsqOGUEAwUBqIAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlVxY1fF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlVxY1fF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so35808225e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791360442; x=1791965242; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzXD0+Ygu79Gr9EwwktD8S/rNRVdL4aJQW2+sWeGtc8=;
        b=AlVxY1fF+rljERodGrSxLgphgY6/SW396nwwJtA0CerCc7ZQIMzS1RkhRnXn4Cme2T
         xk68dz2sYcLcK7ogAg0ZQDUGqfv3fJ6T+kfJV569ibkLbLUCBQ0i9v0GpwdodmpejDzn
         de7S+rxFfMLt0wwmpv2KksGYIZIynU3Z1QbXylMlYsp59gLy6DFyyDHlWhR5UrZqA26q
         KRAinoQdg9oiRF8GH3u0QVPywprISapY3taiXB6eD/N8sbn7a4kcf+HrNwtmm81O7qQT
         ijMCRYc+Nw8sg8C6cAUdsQEGxp7gRnjbSNTnJROrhigPVQeAhO1tTzv9OsLZPAumHVoa
         EyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360442; x=1791965242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AzXD0+Ygu79Gr9EwwktD8S/rNRVdL4aJQW2+sWeGtc8=;
        b=vNVRSxO2omWZ+HaVqjeAjmnXUjG9Y4WqFS7IRUGfheKGWylllG75eCNonbqEqjneDx
         sM3U9q4jjtSG94EVPtTz6Rc4hsqtt3mDfUTaaU3po1FvXEkPAkKSO5NaoT32ixA0qO4h
         cbgf7nRDg9ENEHHYemOnezOjQhmCkdJ3JNeZnmFB2LmzGx25+pzB9Bs0pOz3Jq1aCt9h
         xrR4cXQJinMLAfQDW3yoznWsktfD7c54hqJYZ2e7nyTZjkKoqxorT/3IEWgn42e/scCG
         QOzKx5TFkCL0Pg7ouh2CTmprCyNsLF3Hm6VXt8dlVTQI/OE5Bx8kpZ/V7LqDtS3a+AP4
         XS+A==
X-Forwarded-Encrypted: i=1; AKwUvBwfGA4mHkOuigkDglUBTZxLifndK8qkUh7aQP8e7WeFAkUAODuZxg/iEFq6CVXW6SlGLEatSzAmQKMS+Hg=@vger.kernel.org
X-Gm-Message-State: AFuF++mlLUiM9GnOZJz4VGIR9VhKOq0jRNlRWdEqEgWFEauHPW76RvP3
	mKeUEY0N51k39PBYrT+zGidx5WEUOMCZOIOuaUyI3Mg0Ve+0v3QQ4fty
X-Gm-Gg: AYBFou27BBJwwcQDfGN+qJlrtnpqExO/EKpJ2kwVfB+nXNxAtpYm581CY7YjoUESfAo
	9u2JkmKzPn4GacCFwf5/NHB9LS9SKLerwYkYKThq+N9UZ+DgLZ07HR56aE+L614xhoTbOG+vANS
	WNexZb0VtYLyDy7BpR/OgUHE+5m2O5wh8QTJXvu7UldPTAk9PzY7aFaZFFnFsdtXRyRWiDERSvZ
	py8cBvZGfo64fUBVNQQ/hW3r3u/G9CItbZVnJtPmATp+LmKH9ttILyXCJuQ6E0oU3I/JLiKlgVI
	Qgq/72LJu90c2XL2+xYzta6HRFBpVRtjjmMSlVFsNnEMLGsd3GVpuvHcw4wFXhlOE+n1oYB9bbX
	hDU114PbF5oCVu32EYG3+4KqCQGPkPeJ/ONrZ+foyFzpi4it8QPTvJoHCapG+6caWpy6/lQz2us
	QkThing/VIPPRx/g6rMjWyNKlfgIX5Zh/+mPXhbJgL2o3TH+w2PzwayXT0Ba5WFIVaNTiymQ8co
	UD/p5O6gKV0T8pdiRZgWmzyGrRJYh7CbQGJ/N+ZiVfrheXf2Tvo
X-Received: by 2002:a05:600c:4e13:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a180648e9dmr17951005e9.20.1791360442336;
        Wed, 07 Oct 2026 01:07:22 -0700 (PDT)
Received: from blinky (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm87004535e9.0.2026.10.07.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:07:21 -0700 (PDT)
Date: Wed, 7 Oct 2026 01:07:20 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Message-ID: <asX9uMyiJMAzjIFF@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.16486951642128892687.b4-review@b4>
 <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 09:59:30AM +0200, Radim Krčmář wrote:
> 2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
> >> User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
> >> only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
> >> XTheadVector on all harts).  XTheadVector also bundles operations with
> >> floating state, which additionally requires non-Off sstatus.FS and hence
> >> has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
> >> bitmaps alone, so it can advertise an extension that is always disabled
> >> in user-mode.
> >> 
> >> Report correct environment to user-mode.
> >> 
> >> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
> >> Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
> >>
> >> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> >> index 2eba34011786..f07aa1c8acac 100644
> >> --- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> >> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> >> @@ -1,5 +1,7 @@
> >>  // SPDX-License-Identifier: GPL-2.0-only
> >>  
> >> +#include <asm/switch_to.h>
> >> +#include <asm/vector.h>
> >>  #include <asm/vendor_extensions/thead.h>
> >>  #include <asm/vendor_extensions/thead_hwprobe.h>
> >>  #include <asm/vendor_extensions/vendor_hwprobe.h>
> >> @@ -14,6 +16,7 @@ void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpu
> >>  {
> >>  	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> >>  				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
> >> -		VENDOR_EXT_KEY(XTHEADVECTOR);
> >> +		if (has_xtheadvector() && has_fpu())
> >
> > xtheadvector is also gated on FPU=y so this is a reduntant addition. Is
> > it worthwhile to make this change?
> 
> With CONFIG_FPU=y, has_fpu() is set to false when a single hart doesn't
> have the D, and has_xtheadvector() could still be true.

Ahh that's a good point.

> 
> >                                                                      Is
> > it worthwhile to make this change?
> 
> I think that it's sensible to mimic the validation we do for the
> non-vendor extension, but users of vendor extensions likely already have
> to go out of their way to utilize them, so they can do the sanity checks
> too... I can drop the last two patches in v2.

I don't know, it seems better to keep standardization if possible and
leave the check in here to mimic the standard extensions?

- Charlie

> 
> Thanks.
