Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796615;
	b=YYFvU6ynD4og1PmQAxbn02MCU5vVgv1izBx38RE8WIulDB+zMH1hflpr5Vi5tPdk9wTx
	 TiqejOlRZ3c/ZSo7Y/igM4wBlMGI5ZCCCSEgdWPuGO9X/tQb9rjkQfxlD9IOrTL2dTm7e
	 Ra+3CS0hrfy9yF1vQS/NOkMtIlGmmjtoxyoMzC504amQN7x7LZGxuSUDMnXIhmSffPFyr
	 r92SoD3pXkKaLtcxcgC9Nbun4MzJUMsg3hePhbeJDiX4xqcrZiveDr69GF3oK3ZGmY0oU
	 udgQXurKhE4hbXJQjTkFM0rck4MbSeTTFr1xBAAH50safmWNBp/vlW1jBtHYDP4RE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xX6CkA6Wx5SU/AcLVgEPrjNCEuQtMzhCBWWoMNoHGPg=;
	b=mmTu+RE37D3rt49AJUwRCk+YsSnFdwZIhlhfqKmgUE3AG2lyTcwszId9mphWTY0Gh9Ky
	 Y+eW25aAv/mVGCQ/0Oz9Bkgfy4vB/KGyCa3fED42+kV238kPsixgsRX3axb2ALpLzHGXH
	 JXP6YbHol79q+0qvzNKgvrwWUtOcQnmsfHs+q6n1zCIgogCzUkoqofIM9sfyFYOGLWPqP
	 F5NzyezYACUv5qedpYVv396LIu/lZ6ervFLsGBxFlccLoCdY3pitaROCu8IouydmTUbfD
	 aYkUEf85GluKpfA8OhbOWyeWZQB5k10tsZGL4lFSHHTA+l+BJZRgUCCY2WoZm27QxdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4Rist4w;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70239606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70239606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4Rist4w
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1091130c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796614; x=1795401414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xX6CkA6Wx5SU/AcLVgEPrjNCEuQtMzhCBWWoMNoHGPg=;
        b=l4Rist4wafGh61eo+v58em7wU81hSwBFHNcD+KdFFPB/2ZsmziQbgN4UCq0bUSgPOQ
         OCnFSgfdhP+BhEcshU/sZAqDpIZRdp9InRNM+i2epJBSi4G0CPQWPtDfiVWXskF8xqkG
         Y6yMCfVibIRJi394ZetkeDRrTjcYYJj46Uks2VMnki52NNBd39hKR6e6lyrxmurii+lp
         idoVVpPPh/o/p738Ayfw0jixFgwvI0Pjbmf66JxDM+vYaU/bMx0f+nJgQPOExfLDSkpQ
         cOEXtDa+lTuLBBbV9a2Zotb/5yq8vDyi4VjZ4oKoPTw6s5Pkfa51AqqbyXCMauvFdOwk
         EN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796614; x=1795401414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX6CkA6Wx5SU/AcLVgEPrjNCEuQtMzhCBWWoMNoHGPg=;
        b=CjudnvhWyXZ5xoXIjhlsZirVO/Smq7iG+RH2FDP5yy1r5UJlWubYEJjdBurXGbQ042
         sfKFq7bO876aiX1bM0vTkQN+yr10m3Qa+HmjWVPUu68hPgHIUFSnsTTYDuVMAiuE8rQh
         TX6cmyivitenVrK4Pzc8Ie665rBY5TSJp6bHeHqn9DWX/Q677FZbnQPCaxhN2EBgUk+o
         ZCA61lN9O+0oaKSj+g3ILPTeiaeobdpd3qWvCqfiI6P5OxIGOiugw7XEQ00Jb2W+/aXt
         GJSf2mW/TVxhTAAzdLGEN8j5+kYmUxEnRixNIgbhndcItVg9jVV5J8AQalW605266mHA
         Ubfg==
X-Forwarded-Encrypted: i=1; AL+hErE7RC8Wpbgvhqo80X4iPVjoUeI8Xgf++xi2OXdE87tGD7vVVB53kpJ8q2DKNCYIgGBVS8LdOE/wUCtCaVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ttn/ZYlKvEv+Sng5EIR4hW/ZWuSQN5h8J7JUeYUlw+ZiaHhW5
	exHprRspK5SKLgy4+d39BUESnSZHOkkjzgG4vfy9fYJ0g/JUVQ4DrQ9JJbsKlQ==
X-Gm-Gg: AYBFou3qykGv+A/WYFnNc8EWVpsIgImbh9XfdUcNUS7hj2D1qbaoXRSXnG1vEaPzk6M
	qkYCq7S44YhGPRUeoNm7mz38lbpOlMgmFbCqoHUXPpiUDNSyLrDvSJQ6hNOfSCJAV03ZGK1/wxI
	Ctl1sl3vdybg+HNtIm7sJKKkCiofh5ZSD3S07WNIzHOijUKyWfkjv/0WTnFsXnVkY1CR73PwynQ
	yawb4PE6L5pXX+zpGICoBP4LpkHEwfQSCC8P/rt9Njaxs98t6DVV4l3edIiSOIFrj0k55jVc0YZ
	g+TaHlC5bgfY7D+y9EYd1+LjyARc70URsoMvxEmPx68xG8IFNhteHz4+J7kPbSgDIYBGospYHac
	xM9FP/tp/tlzm57gJ3JucpOugL/B5Tb2EYrA1to/mug8xLWieqVes4PdofAHhW7Iwus/UfM943O
	k26mm0Zi2jx3a+EMnA9AtLyVXWGkkUADnZ3AsjS9UdHcpl+oL2CV1DogEqbtycv9lXo1nVZaT8h
	s6EjaKYa/IXErtm+MlwwB2oauE8yu+VE00LPIo6cmETZw5CbN2f6Nvts3LMb5TSW+kzJHMFX0x2
	mS7Dh7GcNSyxONEC302wN0pOYocwVRnloIro+e9ivzJ1IvlxkkOlXknojSdc19JkuPBCsw==
X-Received: by 2002:a05:7022:f109:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b50313d936mr8152988c88.38.1794796614479;
        Sun, 15 Nov 2026 18:36:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:203f:d9b9:dda8:24e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm37357720c88.9.2026.11.15.18.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:36:53 -0800 (PST)
Date: Sun, 15 Nov 2026 18:36:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: lm8323 - drain PWM work and finish with
 outputs disabled
Message-ID: <avpr6qngp8rfJ9Fe@google.com>
References: <179474329214.103840.17616107855531843241@seu.edu.cn>
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
In-Reply-To: <179474329214.103840.17616107855531843241@seu.edu.cn>

Hi Hongyan,

On Sun, Nov 15, 2026 at 07:48:12PM +0800, Hongyan Xu wrote:
> A PWM brightness callback can leave private work pending when the
> managed LED and chip state are released. Merely cancelling that
> work also discards the final LED_OFF requested by LED unregister.
> Flushing alone is insufficient if an earlier fade is still
> running: the worker waits for an IRQ to requeue it, and the
> managed IRQ is released before the LEDs during teardown.
> 
> Install cleanup before registering each LED. Once LED unregister
> and IRQ teardown have stopped the producers, cancel its work and
> use the documented single-END shutdown sequence: put END with
> RESET set in unused script slot 59, stop the channel and restart
> at that slot. Do not overwrite a running brightness script. The
> engine then disables its output autonomously without another IRQ
> or a worker accessing freed driver data. A current long RAMP can
> delay completion, as documented by the device specification.
> 
> Found by the author's in-house static analysis tool.
> 
> Fixes: a48b2d4a0091 ("Input: introduce lm8323 keypad driver")

This driver is being removed, no need to patch it. 

Thanks.

-- 
Dmitry
