Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CAD4B5CC7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446385; cv=pass; b=fn3OnFk9QmWYcShIqLyP9MPgpzrRcr7HpabOwnfhMuNAxy7/M+VeTIMuKrakIcLrMgrJvQhs5dtH1BtJB1b+mpBD2alT1VlTLA1nb10TMv5E6sGzHSB7f4LbyCnBj+DkMccrg7tUnPCrOenbs9wrwQLQJwzuaPHv7BqGsKMMV4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446385; c=relaxed/simple;
	bh=GRG7VAW4y3EdB7x7u6hb320P3gD15LYx1LfsViKAjRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=UsulXF0KOvsN3n+fPHujD5UKZPghfaNXTMFJyTkvX7wUiB0YxX6wtDf8KGmNYMKrkn0oEU54ZQ1kRoWhwuoj/MZ8IWh5TMLK54Cw5BHlyZjEDUv+j+LDwv8wWAzZJenbvxGTV/w/VPmKRL1QL+EGUOfBjskGuPbvFrtFfTcgNSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRbNn70k; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRbNn70k"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86c0e4dd49cso24980297b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788446375; cv=none;
        d=google.com; s=arc-20260327;
        b=jZ1vBfpjF5fBuqZYJsUUogXAIjqoga14taL0fvCJ1NAgNq/Z0I37nYEe4/IpDzaIBw
         LgPZebGTC/1jzissPy9LG2xqXsk1XbrSi16qFfs6/gSfKfydOFtYsxbsd7xE58+8Ufo6
         NJd1/4taC5JIf9GEhZmKGHNJAGeF2k+PVNMPXdAqeeIhTklDdArCHDzfFuCfRTFofOXL
         1Awvy3E4ipu7CTU1Su/WGqgyz4mPDDEmYbSjLQgpPxlnsjB4w/0ypj/nSM40ML8+Ez07
         hGZTj6TTawUq9FTu/BBFwuDzpcGuEOhajJQylQAU0IrW9dV/47ZgQz2GydCBnD4D+1VQ
         X5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        fh=6Ecyg9CFMaa4OWXMI3fvwweCd4R9IZ8a37B2tFWyclE=;
        b=ehGfCsfkhyD3HIxleaa5RXngd/6gJXHxAL5E+u8NddiCDf9qw7Rg3nnomi+ZD8wWDk
         EIeTPn4UjBJ4Kz+4xwWHpbA/chJKg+zFNn9U0DYoIyli7B+rhXJFiDD9umvSSn+E1Cnt
         DmodA0WtwSAwctSizkKzkgvmMnBPso2kA46Gbtraah8fSV5uOjO5LNTpK10GfKoLuPny
         ssiRkIYbRwC+c5wCJp28kWbpn8tExyxh6mH/2AojHXUMqjrvqDQ7Qzvxu8DfFsxO43u3
         t7bD/jjz/meQfwxAAulXsqrQKGD03R3RTpOwzVX9IRJWyPPqjbR1ucODjkDPlaGDZSmB
         bvcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788446375; x=1789051175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        b=DRbNn70k6bjBwzq/69XlK1DKkzE4TZTcMvjla1ycME9l0goStPJ5V1Mf87RQnVjMYl
         3zRB9hcGBgWrV0o32Vq00EMx80pqHv19h9YRhP8xzRq7peuRot+K4lcVCQ9/qRRz+0Bg
         wV84qd0a2JEA7ZC/fnqfi9H64zuZ1NVHzq69x9BNjdugNJ73CsF82wkJ8WMOVoF/F/zv
         yiZsjGtFqmdnadadmJRtgdQqHot/fcgNFFqv8x5VU9oYq6LzsQ+yoLLZvBWvDXWubIL7
         CBbkRtGMSe28RTbZx1YQ/ndeofRz6rjEftEn05tgZf5rdye5hxaoJzUqRpC9z+XlYwZU
         ypWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446375; x=1789051175;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        b=aRcqs/maUh+G5sNjCn9OjrGd/NJw7j00FNRMg5FTmYQ1Xx+xL2sw2WgULzj9EHp6TS
         DEQxBpjrqzvoy2lN/wsKaEjY+IrywNo/qeFTKVKj0ngKz8KxACHiSdMeKER7DUGF+ndU
         zbTTTp01yNr8vdTkqAqiHBYL8G9Ki2q0Jh5E1hdfqFRMCpiM42m23GoW9pQWhfCckZGG
         m04kIWrECHXip8RkyVK4T5v9BvbSsv6lS5cCAc3JPyRKBXFNqnez2AMg56UQFx9TuK4G
         KP7zVqqOnVz0wfkqYpDEGicuOKMdgmClAcJXm8aoI9fKaqmqewPZuKU40XwB9s7M0dGg
         qX9w==
X-Forwarded-Encrypted: i=1; AKwUvByQWw5gneL7acbefileg00JfbF8uSoBFvg3m7fi25butyXYZcRK5wZqRg9N4kx8ImboT0qA9YX92f+Dpz0=@vger.kernel.org
X-Gm-Message-State: AFuF++kKoXRemP9iLvjv8mPk3HkzbLHGLJPiaEXLP75wwWzWQQ/pK1BN
	iym81vyn1rzVONjOiX4ieVi2ootEcjMS56hew640devzuPWzNz+4cSnwyKA7IRKNvuyuz0MNagh
	ny9SUCkBVoClpu6/8KmpX+r+eLk2dpa1DIwHzhBFa+w==
X-Gm-Gg: AYBFou0LvXYA7pe/Nj0npN/1RdLbiMNB3T+3qccE/JUTLuYf6T/eaW06gly6zq1pSxs
	8WeKjwc+kAcaFAopq9N926ndkrvpQTtbR/GytovkKkAskCYOZk+JUHddlAVp4Jfv1takySlq5t6
	eBxHveU0OJSs7UyYcVJ4zJLWI4NABHFKeTEGQ+WUqjMm4M0mS0yJ8Sn+XFfgruNRvceDmRTWTuj
	yd1XUUM/53Q33NmihdIPYVe0u3Q/wKVwLJNj48EEPOUtIrLkcscWeFmKyzYf//ZO+4k0dsn8L2c
	/lQQ6WFi70QF1KcGZfftD3JwLR62VrDHnT8B+GRBnox7wwNRUBdg+7i5Bw==
X-Received: by 2002:a05:690e:1904:b0:66d:1478:189c with SMTP id
 956f58d0204a3-66f9bf8d234mt5185180d50.40.1788446374768; Thu, 03 Sep 2026
 07:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903143004.1026181-1-jun.nie@linaro.org>
In-Reply-To: <20260903143004.1026181-1-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 3 Sep 2026 22:39:22 +0800
X-Gm-Features: AcwNN1V9Sc-XWHIXu60lPfwzYFhzqrxq1vJD2g2K6GQFtNs-hV63HQDDwAGV2Hs
Message-ID: <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: delete timeout timer when encoder is not busy
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Maxime Ripard <mripard@kernel.org>, 
	Teguh Sobirin <teguh@sobir.in>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=883=E6=97=A5=E5=
=91=A8=E5=9B=9B 22:30=E5=86=99=E9=81=93=EF=BC=9A
>
> There is a spurious timeout error message under the following reproductio=
n
> steps:
> 1. Run "modetest -M msm -r" and press CTRL+Z to pause it.
> 2. Run "while true; do rtcwake -m mem -s 3 -v; sleep 2; done"
>
> Resulting error message:
> [  124.018206] [drm:dpu_encoder_virt_atomic_disable:1425] [dpu error]enc3=
5 timeout pending
>
> dpu_crtc_commit_kickoff() calls dpu_encoder_kickoff() to set frame busy
> bits, and then arms the frame done timer. If the frame done IRQ fires
> between these two steps, the IRQ handler clears the busy bits before the
> timer is armed. As a result, the timer runs with busy bits already cleare=
d
> and is never cancelled by subsequent IRQ handlers, leading to a false
> timeout warning.
>
> Delete the pending timer when all busy bits are cleared in the frame done
> callback to prevent false timeouts.
>

Another option is to wrap the enc_spinlock lock/unlock pair in dpu_encoder.=
c
and expose it to dpu_crtc.c to make the sequence of dpu_encoder_kickoff()
and dpu_encoder_start_frame_done_timer() atomic against the IRQ handler.
However, this breaks encoder self-containment to some extent. Furthermore,
initial testing revealed a deadlock involving additional locks beyond
dpu_enc->enc_spinlock.

- Jun
