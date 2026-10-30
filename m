Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330900;
	b=VJZDf645W3zXeIKT7UVu56kLU285BGkgoiEb6/NOA40OYmxOBMH89hksW1eHARSFgKgo
	 lzGHLp6GyuE9WrVx2krXv63clijqM+/3POqL05LhWf+UNxpa9l1DGBGqwrCqPD8pWM2r4
	 69zCpOKTH8a+vRR6m0N4UmKgtp2IUoWNH4UeHaweDs5WE9QJ8tu/P5Kz6FQ+eYb56T34f
	 YcpQW9BYQpOlVvrqkhxiTUU8uen2yilNkTG7XUB/B2anlBhKpT/f6HEIfa1+HQGUfcOhY
	 NjcP5LepJRs+gUQVmRmLCSJkMffy7+P1InCtiuf6m3z9gMLiGwbnpiYxH5KjfThGE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/IuBdm3v3+KNfZTmfbPur/zgtnwsutcegngLNEsBNYY=;
	b=kk/dUSDereSLcdhXiSE5v7O+RG8WETOPcPfqrTCqd24mqo97gjZ3sDvfCIVkzyTUlINX
	 LeXM2e/rlM0ydhQXgmR6/5j088GKXHa15fAoTJlzTukyV+paWDVFSWNENsjhwwNQjFe9s
	 h/ikvcqgROFg5QnGJi7vf+86fpYmJcJedF22QSrchOjp7XjomS0Nb2d/wK51d6qduSrSB
	 jBSdOX2bBVPOn3q00uruxM6c8rdaVzO+D45iJa1OJSa4bVRsxDtpX1QoyZUE/hd5llq1H
	 uybwIPxWSWZ6SxhY9MKApZD0FZmhJc4HAGHIFqwEIyCCVz5plr0QSCiwT+pGtjZzrJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JRrv5bCy;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05308606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05308606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JRrv5bCy
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso249389a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793330898; x=1793935698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/IuBdm3v3+KNfZTmfbPur/zgtnwsutcegngLNEsBNYY=;
        b=JRrv5bCyL4EQjhJ33Hsk63U6rHl4jlTgxGTY3gxpoF3cpBWeYUPySlH+OyzRXpF/AU
         boWsGdrmX+j8fOAXl0MemfpUE4CfVkKtqrtXPZGrN0uZjfx2rMS53EcLye1f+/GL9whr
         l28X0b3Ot2/M5HHQJXrzY6igvwqkJ4YinRi08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330898; x=1793935698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IuBdm3v3+KNfZTmfbPur/zgtnwsutcegngLNEsBNYY=;
        b=GWXUOh7SbTRuTgxF8IOePR4rM+7hCbHf44evpTdCU4IesNpUSvybMcAUDTqBvGB+t4
         i/OI7/bc0FCIId1Y68BAroaLZccCv8wScIXLBsb0NDUtmVA/ef0qjGXhIFEXmphWFEM5
         6LbI1sVRWjwSDPDjAEQD0U2s2tgx8wx/TRrwbGcvCSoz55pO3CUcyt+kEAFLXV6osS4K
         BBz62OaKhphRld/0x7UWRRq3Ux3iYLQf+VAq5Ct6uCCOSloUU5q0CXJgmhC4DURwj9b0
         Jye0EzE5/fZ95up5u49xAm2uyhCin9wxC9JP18bpBmrHxv0dgTXxG3HjfPoNp6OuoetH
         t9+g==
X-Forwarded-Encrypted: i=1; AKwUvBySSKyH/Dp61MUxwj5zaDjcoUfp6ivsPQ9j6bEM7bepB0FIyIOwIp/PJN8P6gxOIxmPsl4H2Dft12WfOTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaRQ/kCZAfBLTiLnoxc3fPCh+yYJ6114wBaKkRMp7lUK9toHeE
	1AOQpCp4rqMtFf7Jyse1LaOgZ/O/Qw2Tl9nydBbticUzB98Q1TSl1M+ygo8R8aDJu9WKA1nc12n
	C790L09xh
X-Gm-Gg: AYBFou1t7LjiZ8wOP4lH0fSEf/sTGO7UJ8+w3yFlueUtcKgnVmn6ys4KKWWHgbA5hpw
	AGtDFNQfjP07N+bubryoirctPPZzfJuWFpEbWh95XQQj/AsZ0W1lxhe0pqrSyXkbBKx4ApzKjVw
	KyT+a58CiGY4hbDnLL0WQ06jxpcJ8xyn+9bGVx70m/zuFsZtoqL72q1FNh6ymZOcq7HPPlGCKRl
	BW5zcUgJF1SV+r4a1mlupDLvgcComb9qIZoj8OT4pyUwhs6iAeVQ/pMOfvm1fBm0P8XouCisUwJ
	f6Dqz8PovyanHyH9M1x1ruo+xGLix2CjQ0aICxeE4Uoe0QOM5NTx4zdcFmCLalaVyeRgMe+eGCl
	MWqqqgTRx+w0TPiJDeLtozC8wpIm7i+FnKvFFLek88a6djXN/FcfC9US9adpRvZ/EDZa7GMk9so
	7nbrLnnl8Y6NiGNJt4PC7u8HRvWqxrxnR15xB5CNcaJd5DNufnezJICge8wXyk0l29souTgVRva
	S7C25pBpzT+yd7Y//SYeiOSvYWHnBk4Z8b2ILcs5kcMQF+EVnZrdxLI7M2f7SWtdlx9ZD2McRMn
	wi1aYJ4/6Mit+lCfM/nbYta6FNp1t740pw1cjTIoTNjPNwGQMUr9DwPU8u83obEvv2bp
X-Received: by 2002:a17:907:3e9f:b0:c36:7579:fe6d with SMTP id a640c23a62f3a-c4ca7a4202bmr80920866b.11.1793330898417;
        Thu, 29 Oct 2026 20:28:18 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf428f1sm13382466b.86.2026.10.29.20.28.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 20:28:16 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so1645455e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpN2vdudB3qF10rxceKYHZRvCGRoGCbXUm4R2LpMrZtB1h7YocfJcU/cI17ufUSlXEbUjVyeHYTjXakfs=@vger.kernel.org
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id
 5b1f17b1804b1-4ac1980118cmr16667665e9.33.1793330895525; Thu, 29 Oct 2026
 20:28:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014135028.1438841-1-hungen3108@gmail.com> <20261014135028.1438841-3-hungen3108@gmail.com>
In-Reply-To: <20261014135028.1438841-3-hungen3108@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 20:28:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WssS-VkBDw5czaBe+pJ+etdWdaZ8ibWvnTKR9KS_Nr9Q@mail.gmail.com>
X-Gm-Features: AclHuK9Z0o5vk_K9aqpGm9Z8TVk34VAR5093mRxE_muaOzNOVbgbq77FDBzqnAY
Message-ID: <CAD=FV=WssS-VkBDw5czaBe+pJ+etdWdaZ8ibWvnTKR9KS_Nr9Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	jagan@amarulasolutions.com, osama.abdelkader@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 14, 2026 at 6:50=E2=80=AFAM Hsieh Hung-En <hungen3108@gmail.com=
> wrote:
>
> @@ -258,6 +256,7 @@ static int rm68200_prepare(struct drm_panel *panel)
>  {
>         struct rm68200 *ctx =3D panel_to_rm68200(panel);
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>         int ret;
>
>         ret =3D regulator_enable(ctx->supply);
> @@ -275,19 +274,15 @@ static int rm68200_prepare(struct drm_panel *panel)
>
>         rm68200_init_sequence(ctx);

I think you also want to pass the dsi_ctx to the
rm68200_init_sequence() and eventually use it to replace the
mipi_dsi_dcs_write_buffer() / mipi_dsi_dcs_write() with their multi
variants too, don't you?

Oh, I see. You did this in the next patch. I would have just mashed
them together into one...


> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>
> -       msleep(125);
> +       mipi_dsi_msleep(&dsi_ctx, 125);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret)
> -               return ret;
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> -       msleep(20);
> +       mipi_dsi_msleep(&dsi_ctx, 20);
>
> -       return 0;
> +       return dsi_ctx.accum_err;

Similar to patch #1 (and what Sashiko pointed out): we really should
be turning off regulators and deasserting GPIOs here.

There's a bunch of small things here, though everything is
preexisting. As I've said, I wouldn't mind a v2, but if a week passes
and I don't see anything, I'll probably apply.


-Doug
