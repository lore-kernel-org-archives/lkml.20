Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439648;
	b=XyhvS9n3YCgX30jJCTH/bWizDl+TfdUBEGek9Qgzj/qvxmcvSXqZkwnTC9io2Hj8TMiE
	 sCz8tkVH+mFvluYR7nt1Pit6PB9jwwCOHQDQqcd+zNwhs7NkAhJInrokUGt+9eADYlSIn
	 8zks7JAdGqcqj+pNg9fAYoU3DYIMHpb+46qFuv/+/LC7bMr9Q+iJBlgQSOMtholW5R74K
	 36BQAFJhi/8FQz5m8fd3NgOU1loLH1nEVyMs/QivXHMNvRhC/FkF28+GypIhjneynx8mJ
	 6XSrVN35Wk0kNCdtlbNTlOEV11qMf/gaF21sWrilg7V27hfyV4RcZ09S+J04VYZllUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=l3ncA7LGC0e8S60f6Aii7X3fJT4GkRwmt3Q/dedOq/0=;
	b=4TDW4ahqt7N7/9/5PkRHhPM2mwo5ey0XBdnrrNJXrSiEKfs9W0w7z7b1Kx6emyOfCRAn
	 Mao4Ql79tRj0aCL943yeUjYDeZm754SzjwT1ILKGmYPKTOmrGRH8WHD0Lr8NxIMccehIW
	 XvqDayTybBfMLyBECj598A5wlFDBiBrrHQbiCip1g0tDGcj5Gc3c5ESWy/431d2akFsEV
	 lPjv67gLdc6FZRYHWQ5754Ax+NYHY2HcWYkg2nUbNMOW5JI8HhT52GOJq8kGf+bWxobwA
	 2d39+CE2LmnjtD+ZYy/4kSdog6Q9OZU397REfV2W7YbapPWVrX685ou/2NndBH6bG8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m3oPiefK;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4C606A89F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C4C606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m3oPiefK
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso4530556b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794439647; x=1795044447; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3ncA7LGC0e8S60f6Aii7X3fJT4GkRwmt3Q/dedOq/0=;
        b=m3oPiefKK1pKNC1ByZp+CXLtguk52lx3tFmKkDLzRxnW2ziQO1e7nwERWF0O++DoaM
         DBil3J92yz5eO8nWIXRIFFQs2SnwU27FC0s0xcywJek3tgeb92DrIYoLHbKkp9/sLqo7
         W92iZI+qpSCm3StXd5Foqhvo6NMJ//IsqYGlPyGXzBa9EIaLtbCadT6935bd9YxWR4X7
         YzQxVqH3jCrkZjGe/cm0dpVdShRlJc2McL67UEAYvFd51oJ1Z5PIbINQciNLla9oAebb
         yh3jgtSDjBYWuDG1/dP0T9eCHun8+1or8gEJHXVs9vC5iqafDiryJd8GmIszleNBR7Qt
         2LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439647; x=1795044447;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3ncA7LGC0e8S60f6Aii7X3fJT4GkRwmt3Q/dedOq/0=;
        b=OtOCqEdGEG4/66Vh1FjjUvUbcJnjre74cLk0BD3uivYVJAgsXdIb6H75W0BhWPF1Ke
         5nrcJigYOjvDAp+CiC2lNnswquSE+RVtzddFYUE9IVBFeoJIFSLSxcxLlorR4PV9PS/E
         ja1t3zy6rQf2DeyvMBYT9h9zLq7KmxOUwDd1mSJrVq9e7wFovPKM1YJtbdaM3ampIVKQ
         F9Dzzw738PgayuMfHLqS6uGxPJ1IKMVak/sTRYcS1/ZWp8K4p3oYlHYFVXl6O8zjpZe6
         mKhdv6bdhXAaFOfva0hQfNih98A4dH8p+xLBc3gFxYt+oz2/mo6IDoVfcvkL3FdofLTP
         jkYA==
X-Forwarded-Encrypted: i=1; AL+hErG8jbgRanrgWNHjqMbfIT534Qc5JH1cb615VxiTBW5sGi5ONS76PMaBDG7/TBR5iszdMAXYhAT5cqLxyyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l9g6xf6rGsQfaqBlj1wvTGC+cuNR+bxs53SRZA1MMyq97tnOy
	i4UMTxnCSFuloysp+bnLfMl1LNJ6VEPem8qaqeav+U8M/q0dRiid0FJ8HknFnjhVRh2+r4WMNUA
	qzRJZ3huHnyyLk0lC3hc7TsZkiQ==
X-Received: from ioz8.prod.google.com ([2002:a05:6602:20c8:b0:9c7:7bc8:8c7b])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2388:b0:517:dd67:aeb7 with SMTP id 5614622812f47-56b97e2b6cbmr3870593b6e.56.1794439646997;
 Wed, 11 Nov 2026 15:27:26 -0800 (PST)
Date: Wed, 11 Nov 2026 15:27:25 -0800
In-Reply-To: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
Message-ID: <avT5yrP3PYemJNCI@google.com>
Subject: Re: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
From: Justin Stitt <justinstitt@google.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, morbo@google.com
Content-Type: text/plain; charset="us-ascii"

Hi,

On Thu, Nov 05, 2026 at 12:45:18AM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1], replace
> the strscpy() and strlcat() calls with seq_buf operations when
> constructing Hantro video device names.
> 
> This preserves the resulting strings, including truncation
> when the compatible string and suffix exceed the destination
> buffer's capacity.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 26e5d5547466..2bfcd45cc55e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/seq_buf.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  #include <linux/workqueue.h>
> @@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
>  	const struct of_device_id *match;
>  	struct hantro_func *func;
>  	struct video_device *vfd;
> +	struct seq_buf s;
>  	int ret;
>  
>  	match = of_match_node(of_hantro_match, vpu->dev->of_node);
> @@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
>  	vfd->vfl_dir = VFL_DIR_M2M;
>  	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
>  	vfd->ioctl_ops = &hantro_ioctl_ops;
> -	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
> -	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> -		"-enc" : "-dec", sizeof(vfd->name));
> +
> +	seq_buf_init(&s, vfd->name, sizeof(vfd->name));
> +	seq_buf_puts(&s, match->compatible);
> +	seq_buf_puts(&s, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> +			"-enc" : "-dec");
> +	seq_buf_terminate(&s);
>  
>  	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
>  		vpu->encoder = func;
> -- 
> 2.43.0
> 

Reviewed-by: Justin Stitt <justinstitt@google.com>

Justin
