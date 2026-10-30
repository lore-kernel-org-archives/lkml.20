Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330881;
	b=n7aW44lXgLvfK2nLNXT1x0HxHRV4xobJr3IStB8Ob8VLR9fpoovZ0TVE93tZCE5ECamN
	 R0OFP4qDZMeV+MpvL6l7ckoUxDZYIndglaUd4J/pydIopS6Lp3iub0w955i7eys7wO+M3
	 frRbq4+5GO2n5gOIFIYdJlg/hiwk1iLGijsU6ypzjd/jXI5h61WJ8vOKZ1EJnnU7lo0wa
	 MxO34TYY9hUusc2SWIiDrPHsy75FJDtC8pUu861JuyDnlinPGnRC8fw8ribGbelsqEVPI
	 9W5w5ZPVjZ9XpAC/D4JkM8M0ZTCdr3aNSmGSpwZcKsIl+/rV5n4ktJVdBzKD27Lz4iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fN88yp49ogzmXbOIeRn5XeqkoPRjJDMkOosDgOcXdok=;
	b=aub6OHWm9+i2nLyBVbkkpl/LSzsIHCAFMkRxDkM3qfWxqgswuIxGHuaEHnPlAP47VGzO
	 1t3rrdPnvz/gozvE02y4JjEaY7qv3IfoYmrmh4qlGLPxFGerVnfCIekYt0gZ7g9a6dL/0
	 cV7ow2YNXPiV722T4CXX+ROd4LOOnAiRVjv3a6bPNXvv8trjU1RlVQNP60RSxZGKqhxqb
	 9aQ7rpBnPO+j8PT4BFSx46OsMTbSewqbytFtPUxlEaH0+bRtJ26ITI1OXgvLBLD36Ul3B
	 4+FFIl44LyQwWSay3YgJYkw6TY5o7SgSdBQuA7l6Z/HvglG0V5is/4eRllHBeW6sgcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bgkAQmIA;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21350606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21350606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bgkAQmIA
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso275334a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793330879; x=1793935679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fN88yp49ogzmXbOIeRn5XeqkoPRjJDMkOosDgOcXdok=;
        b=bgkAQmIAj8PtrVc2lkqGXY6p1IzGEM3f76t5L/xj88tnHIuWnTwiE54t9Jo5sR0AmZ
         KWRpB1AgF2w4yuc9aPNPNYTNAnqz+UfJCXEhxpBXzhJqUFrtHpOEFFwsIzAVflzWoBpa
         MQG/tnXervFHRbXqCxyiPnyvFe5zybVmbyQM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330879; x=1793935679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fN88yp49ogzmXbOIeRn5XeqkoPRjJDMkOosDgOcXdok=;
        b=SBE3hpY59/88iC+uv/UZOQwcYoSt4mRp1ShOWyW2GmbmGrbjUMg+lqvE/FO7vcpnR2
         XrAOoP7J2b+/FIoP1NNj+Tg1eSnSiBaaegAHCMLSlINP6RCgMqOzUWc5qbltzQuMPZRO
         Sbv37isZMRBcJTkIzNKDqRZ3p01nP9Occ6xFl/UzTQsixhMHWufsh4a5IIC/v0tmQYip
         f/oXWvQRxA33xduIDLCWJdq02ofZujKqGm9dYs2pNjqABGaWUcPv+RUSNmqE8nRIFqtA
         k6UD0cVEIRlccVMySnz1I9Mj+/9eBHSE33f3d5sroN/edzBKSbxWwF0yvnhYBozsJdps
         H7bA==
X-Forwarded-Encrypted: i=1; AKwUvBxBg5ezoZrDJqhRNHY6ve8By3RaduggKFxu1L0lBuoXyY7QRKWpVkjaOwuuRWAp1SJLlnWdHfi5rHaTTxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO1oJRuqyt2/GzZlP8+blEUM8O5n1zBwV4rhgEAgTayibmHX2q
	JkV6ln7Y+0WwHKkag1n15nM1Xk4WOqeyMh19GntsCVmTwHnThC2Q9SF+T1oNUHL8jT5wcELsFx7
	YIYfOs62+
X-Gm-Gg: AYBFou30IhrGSg9FaQHdMASABlINkB0mvfDsph+k52pg0RpLjVUwNpyKLHcArQ3KNPJ
	etzJ00RfpXJAemsw3COqi+v+dJhXhna6ALzMVB5a6vNdJ1p/ad/DDNEQlOr2BL+gSwmW+POJ4t3
	pUaR/uPGiP9zJinu06X7v3hfSJHHMrb11tvNY1rsvj8uWprOtTPIh/CpJo/SIeYh7gmFrqsZ7oz
	uuckRDbY74YEjd0o35ZBQg5shiYXgYcZ+O3xi27vQkbjLpcMHJ+4IVdvNONedXc9/IOMsoFN+uL
	H4/7aN/sy/d8Q3yHjpSEYz1yqZ3EKtOoJe16qlHv+b0+xTZEPz7U9WLgWXd7oql+99d0ixrCi1R
	fPJisYPPTRDETCHa/bne+D/k3BcsW8nMMo7627tK1sOTcR+yO7/qMZwChpHUds+H+TBmMuvM6qL
	Gh/k0defHxbV6LSEVmt7q6qvEkS4IBlPaw8BCQij0i2bzoDVDqEKQSPeU9pVEkmWUA/NvNgTv79
	Hxa0n6RujbbbQfH3yDNi2UQdwNd8lsENAEoFEP4hqmQZ5/AiU1FSACt3UvfusR4x8uyYrj7uGph
	wjKyGsFknGqDn5vXz1uY/zEdAwq2dHcCS8AJuuxKCXWMubCGiEKZYGPmqmjzO19wN58F
X-Received: by 2002:a05:6402:745:b0:6b1:bcb9:15a with SMTP id 4fb4d7f45d1cf-6b4d4d7ae90mr392282a12.20.1793330879483;
        Thu, 29 Oct 2026 20:27:59 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b3f602sm208583a12.32.2026.10.29.20.27.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 20:27:57 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so932485e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:27:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSVHawZGHjOqeXs7rrm08sMqtx3fG9sOgqveVkNBkrMmUq/qIBFObn5b9HwGhVrQWVT1Xoso5jmmQM8B8=@vger.kernel.org
X-Received: by 2002:a05:600c:8b47:b0:4a2:1a:a121 with SMTP id
 5b1f17b1804b1-4ac181e75cfmr18962635e9.18.1793330876564; Thu, 29 Oct 2026
 20:27:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014135028.1438841-1-hungen3108@gmail.com> <20261014135028.1438841-2-hungen3108@gmail.com>
In-Reply-To: <20261014135028.1438841-2-hungen3108@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 20:27:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xm48DUT==8HuuGCSFZtLTEk-W2Q6UTfqt-MnM4nULzTw@mail.gmail.com>
X-Gm-Features: AclHuK_Nd5U37dkvomrYO2ThLngy9YsYJCRU_Th0Mc6jwetgi-HY8bekgcsKOxM
Message-ID: <CAD=FV=Xm48DUT==8HuuGCSFZtLTEk-W2Q6UTfqt-MnM4nULzTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: feiyang-fy07024di26a30d: Use
 mipi_dsi_*_multi() functions
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
> @@ -81,44 +81,51 @@ static int feiyang_prepare(struct drm_panel *panel)
>                 const struct feiyang_init_cmd *cmd =3D
>                                                 &feiyang_init_cmds[i];
>
> -               ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data,
> +               mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, cmd->data,
>                                                 FEIYANG_INIT_CMD_LEN);
> -               if (ret < 0)
> -                       return ret;

I won't block landing the patch for it (though I woulnd't mind a v2
fixing it either), but we also should get rid of the
"feiyang_init_cmds" data structure. Instead, just hardcode 7 calls to
mipi_dsi_dcs_write_buffer_multi() with the 7 initialization commands.
If you search the past multi-conversion patches on the mailing lists
you can find some references for doing this on other panels. Let me
know if you can't find it.

This could land as-is, or I could re-review a v2 that inlines the 7
commands. Up to you.


>         }
>
> -       return 0;
> +       return dsi_ctx.accum_err;

There's a pre-existing issue here that I also won't block landing for,
but again I'd love to see it addressed in a v2. If we return an error
here, we should probably turn off the regulators and the GPIO. Many
other panels handle this correctly, so you can follow those examples.


Reviewed-by: Douglas Anderson <dianders@chromium.org>

If there are no additional comments, I'll probably land in ~1 week.
