Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435599;
	b=3z1g0OIEP5lU2wUFNPuB2NbLKjDJiIwlUHssA4kptzpdn0jLxxmq65YMo7yFY8JeuC+P
	 Jer4A+dTh56UZGOV7NrhQcMkL7zRVjoJ0Nfm9r0OUwy4BIwYCDdvXUg4SrTtY9jdunDMi
	 6FDDrFZtS3GmeCZZPZFDWBxfddeI4PQSU56NfZY/76KtVew7+MUU3aJIXH7iGBe9SbfR5
	 IXF5vRPsFcK+ll7WHItnT5DiUDfM5wtHSAKdEI8gN5tGLG5/D8ULaQNJv2++H+RAsopVp
	 S0VLekN/EdGWZgo1iQA4QVqncK6n5ndBoD66ZvUEyPbMfg3JgenfYsGEUDWRynsRpmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GrZgAedNjjfc1Cat6H/JuMrMooH5xXHjvJkahsdj4AA=;
	b=ydR5lXiiSie7zVU1ZYimkPPLNFliYNr3EpDob9E/WGEMQX8kxzpV7VmKllk4xtttcOg6
	 ppb1YrfJHL0TimF37O8KEC2aB2jO0oOQWZXnnJ6fSH47d/WU/0P7b41RJdt67+MsNjIJZ
	 U3+PA1YuxV2Wh8j/yMng+Nn2Ydxp5A2YKsgtIKs8k/V9+bu0ukJCvi+GPT409CSGbKjpc
	 T5yYmLpus+GWiD3v1iZEvesgQ6uq0kgSvcCZsunB0HFpJ4ANZWbQfRwV1u/zcY77abcPt
	 HLwAc4b+Np6yNbLSFYebMyiFcbvQBRk/pDRsEHPtrDBhNuN6YYpDlA7rgi0uLyYDnlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Z5CFZUP/";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FD606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398FD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z5CFZUP/
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3651771a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792435597; x=1793040397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrZgAedNjjfc1Cat6H/JuMrMooH5xXHjvJkahsdj4AA=;
        b=Z5CFZUP/fC9aRll/uqty9SC8XdKFsdsHi6Zm57fNXicwgewr+DN1Gm5+Ea7GK6QS/g
         xPA4S6aQfT0VldEUPkzMuq2vdG6MbrbJuGdSJ8HULHBjs//svJ2dnnsciVqyMregnENs
         4ruLS8xXoDa3mo53OOVMhcrFBG0sU4gVLFxtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435597; x=1793040397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrZgAedNjjfc1Cat6H/JuMrMooH5xXHjvJkahsdj4AA=;
        b=lNViRb6Dhptrj6bXAGIYqjenU1f8XxSAtiTEVJ987FkJ7IES4kSjtIG4NFF2lxMs7Z
         svKYDcTs6h0uXBzDf6iZPKXU5+76F4JFTUTC0Ju5LshzD9eObzmL2TJsHixIspR4Pc6Z
         mxiSCDa6Xg33bFmBh1VHfMBGYvtNXLXjxD5jhU0D54nbMRSk2sShoqSLBzgdU907jSDB
         NYzHHFuJ5MYpL1RntXkZTvr1841v78K5OGq5LIUpMyN7ESvgR1cgmKSCGRP+DXDCJ7tN
         JJAyXLWDy+70fkVftokTT9Rijc9CJz+dcasapQsWI5+EMqwQ1Q8jv2UqYxZ7/VtaUvNI
         5DBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPJbOBYJQD6qi9OXgfScZ9BWfGpftq7UYq6E/enFGL1XyiI5VRFvql6CFbh9UtGJwJWglbXyfIAtt/bxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhWREregDKy7G+GaBaDYR8jHB00coRlScFAJ1KILmnXxRbxx+S
	qFky8q6AQw/q7Fo11kXYK7QHP7KSCt0bmw0O5e445Eju5yrPdhUi71cJX5uxWV/rRbxe86X+DQn
	j24hBzw==
X-Gm-Gg: AYBFou2TqqyQeS4J6G6ALRTIXkgQM9R4ttQsrCm1BF+qbdbCWRgpwL493LigxLHh0JZ
	3jsXlTQQG0Bq5O4+Rl8MUCwYHWeNTciad6VlOCk9mR/ZRXYr8xD8i+iRdKHVsLqlvHPL13HAgEm
	Lc2/C+cReOAP9M1Y7nAoxEA++ldC9rfoeoLAKibZCqvdvSn9zoCClp3cGSeYdD7q18ZrbdnXfxX
	B1wasBVEMC/KnZrdbkGG95O2Po1SBnxXUEPueXyCSa1G4fxH3tcVtlP6inpJDqK5AnbxyxRs9r0
	WKrVm/JYE/0eJDOnRihyn/396KmFxPsnijnY7Z3lbiqPnGrDKYy1Kdg49eC45Z5gN4Y3yjda/Mv
	3a87RYutZ9XnOGXeVocRkxWtvgVczJrNuHswRGGMGsdy1oAbJDsgFHopNDtYaq7r2FmWessbSX9
	rvZPvViG1Kok+jJfrWnJQ5H6HcwOV9eREXnugmX9SOOISGnWjF6U00Wd5AWDa6R8KJVaDIS3TM8
	5rBEgAXVimpnt7NnSuSUN+HIxZ7tIrTbRp39jucZKpYGTZn
X-Received: by 2002:a05:6402:a2c5:20b0:6af:dd04:bb21 with SMTP id 4fb4d7f45d1cf-6b3a814b1e3mr4187132a12.15.1792435597561;
        Mon, 19 Oct 2026 11:46:37 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm4319324a12.22.2026.10.19.11.46.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:46:37 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so17517265e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIcj61aHDYrsR7qlyLo1xVpoJRpKDsfcaqY7AafiPe+c7cHTfYZnbiFl150Qwr3G/5n5zWOSUip5HnoRw=@vger.kernel.org
X-Received: by 2002:a05:600c:1395:b0:4a1:d73d:4137 with SMTP id
 5b1f17b1804b1-4a1d760f94dmr197402015e9.28.1792435594264; Mon, 19 Oct 2026
 11:46:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014235035.1731419-1-luke@phorex.org>
In-Reply-To: <20261014235035.1731419-1-luke@phorex.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Oct 2026 11:46:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U51TQF8r1Afv5D6HkRcE6CpnFJDJ_H1S+N6VGFaj9zLw@mail.gmail.com>
X-Gm-Features: AclHuK-9HZBpXRo11uBNzUEGmEbKurAg5Xd6yd5l18lGII7-MYI5avJghYF_wM0
Message-ID: <CAD=FV=U51TQF8r1Afv5D6HkRcE6CpnFJDJ_H1S+N6VGFaj9zLw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NE140WUM-N41 (0x0d9b) panel
To: Luke Macken <luke@phorex.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 14, 2026 at 4:51=E2=80=AFPM Luke Macken <luke@phorex.org> wrote=
:
>
> The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2 Elite) uses this 14"
> 1920x1200 panel. Without an entry panel-edp warns at every boot ("Unknown
> panel BOE 0x0d9b, using conservative timings").
>
> The panel's timing requirements are not published, so use the same delays
> as the other BOE NE140WUM entries (delay_200_500_e80). With them the pane=
l
> trains and lights up reliably on this machine.
>
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Looks fine, but please follow the example of all other recent similar
patches and include the EDID in the commit message. Thanks!

-Doug
