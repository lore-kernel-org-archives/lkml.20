Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168484;
	b=0JaDYaV2VuXqc3Z7CZdokSy31GJqHX7sA7m4ZXpf+UME5LV7djF0cVWrGCQchpEXtf64
	 By+eL9SlhRvg+uu4N1/KXZ3Q7gNBiraUAUe5hLPubv4nB95MO8WMJCkvYCEmIK11E1/8k
	 ijyomILUCCG6jrs3Gnqb+VXSDJUjPTk2YywMEDiTzUZamb52Q5m1Gh1a8SYUANOGiHmPy
	 WCw0/0anYpHLqEmQj2DEk6HKRiWQmBBWB+yGIjlc6r8So5GbO1Wc+UYClkzS02zfhaEeQ
	 fj7kZrmeiarjunMK3ugj9MmpCtgC6iwywSo7kZ4ywNLOoEJ0E5aFQH1dSJ7UA48/n5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
	b=j4ZKs5wk2KtybcXjJXIhn0zHY+WD26vD1J3ijhkT/2ik4n1UlK7tXS8jTv2WZ0k19BFJ
	 OuXvoZ9XDQvQYmEKl8YxXvnyv5eRZlW2r+Ic/O15Rq4Pko9PS2STLtROIdHWUo7B2tS7T
	 A4l1NNP9UFx2ikh4Vii804VZVld5zGVWzgUT69entExFY44u2IMu30oUxpvVdpXsF3o1J
	 ieixGxEf2qmwuN5xCPDcb3X7Gv4xycUZmuAUKc5dp58NzLgN/Z7cRLbX5h/QPvZ9KmVN8
	 asNvfp+EDawLAMswyIDNhya5GoILFD09Ymwnvt3UVHXS02qsy+15XMJqj3/i4OjozlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBRcKNqS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F54606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F54606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBRcKNqS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso1418095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168482; x=1794773282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
        b=wBRcKNqSAz36TTDwUf5ZOcSL8WudVNLCqD5t/lH5GhVDm7QF/V0exVUJWErSCrGj1H
         n0jS4cebVkJfkAGphSRhqB/HxUANeaTIdWx5U2qA561nZzkVLx7TKz87KhbFWubHF8S0
         N+ovVfagIlEM3o8xlH6/uvaSCHBQeHbEYYbKl27dtqeBvxauUuOAVZiJ5UEejGJoaMeG
         zxXKPRx3KTdKCB2ArgW8xu+Pqh0SLBHhpvCk4VtkmSP+UWANVq264VihJNHRp8jdW+kY
         5VhmcTiONg4v2h3Pb2l7pTMnwIPxmD0pXTUyt55F1/qQ0uoetVTnnrnNrJ7xdtMjYwOe
         dXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168482; x=1794773282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
        b=rJDFRTozUef09jR38dwBBXFL2t31aHNSuY7PDtt8BbPSNfHcEfgv8tFONBOT0cEDeA
         5UQRfGb7a/4YwIiN53nJXXbbwjRdiYjVCifh3bzc97p7SPWZlRjJjSLAMMGXaGpDxRP7
         uP6z9QBG9A/XQk1KiBPvdXEto9S7eBe94hTPRltULcGWAWB1FOrRiJwRtHZUVvNOAAb1
         BJ2bYpoH6mc71mJSwudG0Pbdd+nz90zfuqm7afeMzNxsqDE3+ug/PZmhAvJde1hU/5IK
         gZWuTouQhp3eT8f5deJ2AWZBInj27AXn6TyKCsWh8euIhnQgSXX+FCNjCkPUX7IRzPdr
         be6g==
X-Forwarded-Encrypted: i=1; AL+hErHOJ2dZ1L5MaS/xQHSGY1vYHWbxSdWiv1GJBWiNrqiXNROTjcCXDK4un8J6Q+xre5kDQybymzvv+dEOmlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qslSG/JAwcPEsoIgDi1mXXFwB2N0zroCw21r5FgBGG4M8L/Hn
	pHo5j4C6dBrKF7NCBsJhRuUhJLFvc6mTU9P0ya4oPqgrH7bQG++kosEc
X-Gm-Gg: AYBFou245OhOWeY5GZDtBnV16zUlQ6fwRom7vSpm9EjOJBPnMk9V5TT2S4Zs/vnH89O
	7UdCOyZYqVEM5CudKQNPOtfDgrRMCSZV7/nNuAAUDTN4YxQXebBzUHqFaBPKaOvkJ5vNGKTdtKn
	WTEhI538aqznSjWLFkUtfo7R9lGuQJTR+xQfWZUOR+dLZ2Ji+EqNycxbw28uNVduZoX34w1b6dJ
	5VIBv7tzWYNSAigwHuMV+2EYg5dIda65MiSc3w17snesl1odq2HXmtIDzItGR9OFB9WatAJo+hs
	rXZz39yZF3MJBp+fyQUXipaUkcx5BSCg3VEl8wELOwFYWvU1qaaZnL8TGoa5QfkutuXB4fLjEdY
	ouAKK8lecth2qhVRAjekNLkh1Uyz4YR+eFrLSyINt5Hy8AKbglXpCc4p8IpinR3ufg4VjYNugpr
	a6yKTbGyNTT3dv48RUIAuddFqXIJdOhRfZNDGIIuct+t7PVydZC9/HyhXDRMSVWI7+ZmxPxE94C
	3R/o6t5qpZyuRDvCSEy/GSsFoXnHLPMII4mqYE2WpLvK73VzAz1XnQcWotuzvZZEBXI+qWrGxBs
	s05CcSJMkOJGMZqSk03ub2XVDXUbL+X1GJF0C2wGZBnQFnGrSKxYD+9olvKhmqz4
X-Received: by 2002:a05:600c:8b6f:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4b9633cddd6mr40682765e9.16.1794168481504;
        Sun, 08 Nov 2026 12:08:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee249d3sm87320515e9.7.2026.11.08.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:08:01 -0800 (PST)
Date: Sun, 8 Nov 2026 20:08:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
Message-ID: <20261108200800.2b3b15cf@pumpkin>
In-Reply-To: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 00:45:18 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> In preparation for removing the deprecated strlcat() API[1], replace
> the strscpy() and strlcat() calls with seq_buf operations when
> constructing Hantro video device names.
> 
> This preserves the resulting strings, including truncation
> when the compatible string and suffix exceed the destination
> buffer's capacity.

This is just stupid...

David

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

