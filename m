Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326183;
	b=RO6QR1Zy0fPnJOJpz5LoptAj/40LxzyXJv47uQKtEXpMvKNd+4kZlaDWvq+nLWMtS8RR
	 qlCfqs4nfxKu7ciO74+37/bJbLUEUeHTYbkVrAeNRf0fLF37L4ZZMh3khZcbQw+XF1A6G
	 W6QcsjHcf02WIYpPZc5UadqzaDAxEQ5NRZHI/2J67qAg/MtK34BijoRq9jj1tOI2jaeuU
	 c0MBkRZ+jpERKMbtg4QG8HIcxMynx/xr6Vit4pninAjjDidx8YNsr3wN9F9F7yiy6a/SI
	 lvbb/W/P4NmLXT0guuh+P00uICHKjA5h9hRrljdIEsIiAdkjOLdEg37cz+VlCNDcrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=htqQfiZcaU1Q+OYy2llukQ4wA43h7/tzpMdfqQO7wGY=;
	b=fgqYx9feDK+VHT6ZIndldfnsS4gNVvPU48q2Ds8kryZaCSz4pzO4OsmrQSjmEdRQnZlv
	 KGmpMw33nzAiPhCshGAY8aB9cg2jfgyzZIfWAjS9U0snaIJlB+G2neAtaNSHfQCqIP5Tg
	 /FoQpr2Rs7ZFWGD2RgIDRiMo3ihVUL3hf7F5tPICMt9fdZhd2l9pk7hNj62JvUCCMGPGm
	 UUQDN96by/C4bIhB4plSAFZm1Dak/Rj7RPGlW+dnGSvrRhJnZ1REqdOTYvLxh0U2iBa81
	 TT8804zPZ8JBxWMJLN/zbEKMFSwKwsJKoeynox2NAdP5SxZUbZpBSaY7GGFzmDnCeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hA06RBTj;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hA06RBTj
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4322d310e7so25701866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793326181; x=1793930981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htqQfiZcaU1Q+OYy2llukQ4wA43h7/tzpMdfqQO7wGY=;
        b=hA06RBTjIt4DdpnO8Qyi+/HC61sPFHjb/efW2jJMwNBNpD2faxA0sP3bzRlcf9gbTr
         wIF4lACFPvN7l8OBUr/94cqvBg9D0LTYcGbP1O/iAIA3skU2q53vdhs0Em+lmdFKkbMl
         MgXUm4Kn8gGN+ihEia8jYj9CeFiCPQQtETvmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326181; x=1793930981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htqQfiZcaU1Q+OYy2llukQ4wA43h7/tzpMdfqQO7wGY=;
        b=dC572l1Wd5TML785eVfGOpkIX+kuwWWsUVLpCR1k4RByCRsCAwE3L44OgD6Kwm+5Vv
         n2z/aB0H7FHTeGLrdn49kGAeqkgyFCpMgkkSLMoaSf6r8dEz0VcYKNfy6x/NGzzWYCFT
         cXBYAiZovfKASawEyNP4n4jFCjTVUOZRmf7flUFdKktZ59LJUW8jx6zk5PQ0P8s2Su3h
         yn+HbrM5o96aws/7rGuueHSlnXwgcav0wQU6uIfNZAouOugRaJJEKMkyMA9N5qhQGgSG
         UH5UM0UV3eFa7NinkCqFvd5zUMtHxyq9X7f/N+fWrXqYF0Ta29Zte1EnDRx2Bj/75oAo
         Jlqw==
X-Forwarded-Encrypted: i=1; AKwUvByO5kNFr0Mw+fPoCIyZFvUqznDTAcDkpIe7JZ3x4/R9/bsdG/xIyRYaN5TlcgN+3Yk59HEIEPVivaEMeaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuJApDtHdc7hQ29xiwpqaQ/OLvfDybh4sN/Xdtdohd7S78xIc4
	f6YLotLn7thxEgE1QxMByOyzAUW7i2BbPQF65f9FXYnqBaVTJch2Q39/hA4POYh0DwvIctlw7pY
	wyX/ThzOA
X-Gm-Gg: AYBFou3q+pH4UIi3ax/CNExDOMzHjQgREuSPngQje5ar0lNdJ9XodTx/jf/NGQ0G+Un
	VrKOGln5B4JkD7g8OHBE1ZhcagYO7oQJOTAD8g/J+Y4XK8+5eysNOCeN6yF42Yd+wJBYgrJrBvj
	ywpN7zr4qUCyvKvyp7NSKynV1N8JhJS6UjS/atvIHv1Qz4Jhmco9P6QA6b0RVyhjfSE1F1F9CfB
	vz4TjTdCtoJLrfvVFYAruR/IzGkltgKaZuNvTY0U8av/ikU2lGhwnE6W6V/sskAnH+sO+iN7WJz
	XBmfHFLnXf8l7UogrmzUnX4Dv4SLgD/any9t2jw70WhI4Fy7FKqymhbWheKYI10CbPvKit9v98n
	kVD9zr154y/meWoCoUiVAPPzXgSu+jt+Ni8XTe3X3fMroL78x4uq8lHuv/q1/+lSeYNBgfOBrQL
	zqD7q0NPGdTb5L2c1BtKBPEU/4hs3JZQm7NqRHv+PSOc2ZBcmGFR0E2PExC2jhx4CpsHP+XbF8y
	xH5H1HNOSDZ4PJb/SfnsFVqRt0xKhVCO1ERYIVkjdt06C4HBr0ACT1gWUGsZs0FQCUFbuoF6KXZ
	TmoDW9kzijrTaVfQ84/y5GuuJab3ZXgPvo/ohdAylI2C2LgvdgcVT+8UEWqTzjaFS+tU2uIiMAD
	p9U2wd0maV1kd3Q==
X-Received: by 2002:a17:907:969e:b0:c41:8e21:4d5a with SMTP id a640c23a62f3a-c4ca793c08emr69940866b.5.1793326180926;
        Thu, 29 Oct 2026 19:09:40 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd260sm8778266b.22.2026.10.29.19.09.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 19:09:40 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1374755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxs1xIcxG0hGY4TnWr1knJpPDo1lybwGjGlWOAF+H7UwG7AlOl1AWDToSP0LhMBjJpnTWOdv7zB12UM4Ao=@vger.kernel.org
X-Received: by 2002:a05:600c:8712:b0:4a2:8c5:5f2 with SMTP id
 5b1f17b1804b1-4ac17a36a1bmr14702615e9.5.1793326178596; Thu, 29 Oct 2026
 19:09:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com> <20261012-mipi-multi-series-v1-2-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-2-6a29add1ec92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 19:09:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOShh08K6vZHQY_=FqmSQi=MO74GeQPaZNDetSVbKA6Q@mail.gmail.com>
X-Gm-Features: AclHuK_f9g75ti8K7qR2fIE1JkUyYgkj_TogS1MHsA8138cyXjvt6-AI5zGu4lQ
Message-ID: <CAD=FV=UOShh08K6vZHQY_=FqmSQi=MO74GeQPaZNDetSVbKA6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel: kingdisplay-kd097d04: Use
 mipi_dsi_*_multi(); fix minor bugs
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 9:35=E2=80=AFPM Akash Sukhavasi
<akash.sukhavasi@gmail.com> wrote:
>
> The mipi_dsi_dcs_*() and mipi_dsi_generic_write() functions used by
> this driver are deprecated in favour of their _multi() counterparts,
> as noted in Documentation/gpu/todo.rst. The _multi() variants record
> the first error in a context structure and skip subsequent calls once
> an error is set, removing the need to check the return value after
> each command. They also log failures internally, making the per-call
> dev_err() calls redundant.
>
> Convert prepare(), disable(), and unprepare() to use the _multi()
> equivalents.
>
> In prepare(), use mipi_dsi_msleep() and mipi_dsi_usleep_range() instead
> of plain msleep()/usleep_range() for delays between DSI commands, so
> they are skipped on prior error since the function will clean up via the
> existing poweroff label anyway.
>
> In unprepare(), keep plain msleep() since the hardware delay must execute
> regardless of any prior DSI error. This also fixes a bug where a failure
> in enter_sleep_mode would return early, skipping the T15 delay, GPIO
> deassertion, and regulator disable, leaving the panel stuck in a
> prepared state. Because drm_panel_unprepare() does not clear
> panel->prepared when the callback returns an error, drm_panel_prepare()
> would return early on the next call, leaving the panel unable to be
> re-initialised.
>
> For the same reason, stop returning the regulator_disable() error from
> unprepare(). Returning it would leave the panel in the same stuck state.
>
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
> Compile tested only, no hardware available. checkpatch and a W=3D1
> build are clean.
> ---
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 53 ++++++++--------=
------
>  1 file changed, 18 insertions(+), 35 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
