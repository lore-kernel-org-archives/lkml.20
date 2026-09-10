Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0E25592F6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060866; cv=none; b=ZdyYEgF/FM5eWDbiP388lHAIbGeOMyBL4rEmzpuZG73R7BUyRUdeRuGNe9ioggBf99AGBFxMGsxgCAlHoN+GXPKANwEqheeBqJc/M9MKEGXu9aJ+kJZagynFq8hVghxjlsktzw0bpbXL3tO9lGw5WzsCZhqYDf8pRWb6s/nuY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060866; c=relaxed/simple;
	bh=1eUUFQwtAbVtRAx+nBumeTJONgF+zO1pSaOtsvyrnkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/p2QEpHmal+W2R4C4XFr/7wQHc4CmUVWIRUH5kf9RgL65xqhA6ITPFyAsPdRTHrJiMnh6iksvpoi13Z3etVpIUAu9ugiP/ByXDU4I+uLXbQH7kaP7O5LKfv3rf4TgFwXaG0bg/+FV/G1DQJgiQ2IS0eEDSZWzJLLnBIJZOEIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dfxh29W1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dfxh29W1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so4171366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789060844; x=1789665644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+3KF/o8Cps0NWVPCbvYTG6UtivJb4eqDQrioajlO1zk=;
        b=Dfxh29W1IJwwUSApP/PTX9+35HfLBNY1vEM59a+IuUAWuSygs7KngllsvFERu2h4BJ
         swSpLGZzT6JSZ+5plNm+x33dxHrOuKsWO3gkBp2RYeFfstrNVcSMerZJHwupO4yI6EL4
         Rrh6pWer/5eKw1OguFELc0lCrzthSQ4Xbs7Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060844; x=1789665644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3KF/o8Cps0NWVPCbvYTG6UtivJb4eqDQrioajlO1zk=;
        b=fJqXCuV7lrZsl2dSe6WkL/BDeqE+kwa5YjzgOldtPM9whQsJ3XB5qjrm4YGVkYCULs
         Pl0xYTFGE1zD9/bGi3+e3/zbUgV25Ow7xx3BVmPwdSgvi2Dy5v6515IHgUhkuCwD0lgV
         AF2sSEzC7FZ9WqwkX7+/7qg7baW1CvvG7FBswHmg3erCQu0dm7hpJLHXk8SNyM9X9I9V
         1x8+zWH+kGow+24HyHQhPEvPPDYElW/IvOC/eXLwlyDYcRwf9M/EuIz7gfrEZlYB0bWn
         mbKuEUYztq9EqLgzbBptSfZLI/4/0luRmCQ5Ft5OY9xQ+NIIv/xjepY7DCWTNQAo3/Zc
         OLlA==
X-Gm-Message-State: AFuF++kQXQZfFSg5QRExGLnjQFguw1BTXJtGIr7iaDJcoIy5dUKV704/
	a9/GhCGMsciXWHaDsrFIF8fpFnMa+/1g64/NeNUBXPmGbGVOV4RquzKnc66Iw1AlvxJ+o2FhH7K
	FGrwDBw==
X-Gm-Gg: AYBFou1gRh2JUQQCf/hTF1jSCu2bBzoX/cHya3uJ2yZe+bQJsdStyy/r5dOs8b1HDf7
	Ks7b0Yn5yqcZSoSzvxizeQOXJvS1L24QBOJCXpz9QQYahRDlZaW/BbH9L0ksF9H/Roip5gsrs2P
	HNqK010pX96tlPKfB286ZDbTRLOga7UODQUmqr29Z1HWMA40eQTvZ1TVogzQrWaVLcDbvtIsRT/
	qQBL9EWjAovVtXkpeOeYFx0EWkg7np6Tl/nROq3GdhXSilyA4D3/VZ9shwmuDQ90pbpSpTHhRL7
	2h+nshQRQN9vcvBkZuB6H+b/7K4jUgyHdme1nVHDzL4HVcaXXIv9nZK9p1+VoYh7+HkgNSs4GQL
	HisoTuUvR8h6PPfbhK25Tj43GCBu3nXOCg+Qg0xFye5serqY5gvqmJJXL/46sM2zXp/j7nP+Gn8
	WtiXyM0xe6T0K5ziaxBD2Ui7f2lEYDqG/XAY9vEJNxVpsavJI6SDq4aP/KgwrZnMNrfp1Go39AF
	dW4VCuMCyZzeBZKjfAAPc2SjassFL6wDO+E6UxAykNYZkDE
X-Received: by 2002:a17:907:d8d:b0:c21:180c:d82d with SMTP id a640c23a62f3a-c260ca1a25dmr1730660166b.20.1789060844484;
        Thu, 10 Sep 2026 10:20:44 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b7dsm938637166b.21.2026.09.10.10.20.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 10:20:43 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482ea739de2so5014582f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:20:41 -0700 (PDT)
X-Received: by 2002:a05:6000:60e:b0:485:8c16:a355 with SMTP id
 ffacd0b85a97d-4858c16a6c2mr40688071f8f.45.1789060840463; Thu, 10 Sep 2026
 10:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910030432.1009658-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20260910030432.1009658-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Sep 2026 10:20:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuHN-=YrEDEACaqrPJs=Me=kqn+M5Mz3RZK+QjBGHerw@mail.gmail.com>
X-Gm-Features: AcwNN1VzxdMZBV1mUzENH0DDwgg2DPid6UF7SN5vBnHmAA4ZLngkE3Xtq2q9P58
Message-ID: <CAD=FV=WuHN-=YrEDEACaqrPJs=Me=kqn+M5Mz3RZK+QjBGHerw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add BOE NV140FHM-T0A
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 9, 2026 at 8:04=E2=80=AFPM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> The raw EDID:
>
> BOE NV140FHM-T0A
> 00 ff ff ff ff ff ff 00 09 e5 ea 38 00 00 00 00
> 1c 24 01 04 95 1f 11 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 c0 39 80 18 71 38 28 40 30 20
> 35 00 35 ae 10 00 00 1a 80 26 80 18 71 38 28 40
> 30 20 35 00 35 ae 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 40 ff 0a 3c 7d 0c 10 21 7d 00 00 00 01 38
>
> 70 20 79 02 00 25 01 09 7f 41 02 7f 41 02 28 3c
> 80 81 00 10 6f 1a 00 00 03 01 28 3c 00 00 4a 5a
> 4a 5a 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c8 90
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add BOE NV140FHM-T0A
      commit: 45c7da8b15f6716f43143214eeb350d97623a608
