Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326191;
	b=JMaa0/Zk1rh7ZPPpf9dnNh3bq8/if53yiUPccVjINZ4qbSPw52qMJfw/2nVBNuZLew+F
	 Yb1URM0mPmOaxYjku++9DTZsBJ9U5GQwkprzssej6YuEyTBtXfn5wLDNW8jVvmtLSc+3/
	 jj2pvSl2qSQjrKOtTi+YkwZSqp/PySSFnf+rhienuJi7kZzkmC5qpkAY6lj7DItAoxlRP
	 pUJnWNVHT2hWYv4CahESAxuJG+Nq4/X8FkxdjzdIX2apqoMg205QGJJFUz1ik9GG6JMdh
	 +v/G/99I/unxqoM5gDOSjDZD/B7agR5ZubwTgZ9e21Bc2yvJpuszTKq6uqH/Ih2GKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8+suxdvpWfA49QbPWxx4r9URTG9HBHBLF3h4jRuGu5o=;
	b=czVq0Ih3PZR2lkRIr2scsy9GvHVXYVfJy9Xmvc3/Wj17RGLijRbzrPmns49Caa8iwDmY
	 caeH7Pu7QtINpFk8gM3FJw479GMFvfPNIW091PEK/OWNCqjGYyqenM6cnxiKNIpauANAc
	 gunVDOvfz1xZxNqhb0+AUBx+JQ0Nuxn0sOg+wu/cn2TTy4mrujfgP5W2NQn9sFOHUHxut
	 ebwUdcxordBSU1MAfFH/4s1zN8cQqYcHoKQCYwp/Hpe1gY8dJyGj5bQm9sJsyabsbntKB
	 sWtW2aJ77d6Zfrg79nPZMYOr6hD6hFuyT4lOmqn00reQ+UoV+moFvplhxdaNC6kGq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D65QG1Aw;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D8C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D65QG1Aw
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e8c710847so26560066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793326190; x=1793930990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+suxdvpWfA49QbPWxx4r9URTG9HBHBLF3h4jRuGu5o=;
        b=D65QG1AwNlODYYEEhExeT814Fe+3/uOYKwY6a5dh5Qv55coylj6+FLPgVWwNS/Ne0D
         P0k6poj91C3oXqR6EPuDFFbYTk5i749r0yD1Ky9XrRD+Z4wugSpSd/ZPK1kflFgEAfFG
         kJcNSFYagyFYR37dkVNCfz697cU8XEjj1DPQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326190; x=1793930990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+suxdvpWfA49QbPWxx4r9URTG9HBHBLF3h4jRuGu5o=;
        b=qFwJZhuGp+6LkyMFfeFVO628RXsjEMoJsraDC8H72R8bAU/yftICsGSmMwlfFAI5GQ
         obpxPxhaMUthnvhypr/OZYrUTNnsszd1qeOFW4xCkegKhJ1RB0EmH64/ad8hEIc2EpA+
         8/Mw0qGh5YCpyZX9GRhxvfLBD5XvZtHkbKrmUFbZThVrJu4bv/7RgqpUAhGKSSmeIooG
         s9xcI7DQOKje89vbaSJ0RI5j3yM9UyQeyE36ML1kdV3AEmPYwYpjTsdPQ2uGLj0N3KBZ
         oRsjdX+GF5OkG4sqL69tYVuiQUN2cNC0p/4bWtSDfZyg0scdK423zPLgmPm1lm02yqpm
         UV8A==
X-Forwarded-Encrypted: i=1; AKwUvBzw4F2iHhQOjNUWqJnG202p4nT30oe0mBniGhEYENBUW92kmS0+h7y4OPQyl5Vj31KMs2OZjeG6qIzcLMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGJNy25Cq6PlSNHoR4ZpEZTlLGYxhvZMsbhM0Bw1H7xP3yyfxF
	zzYFjs5byQDTW1hDRFEi+Aa35U4B22NQmTHITe9Ak8lzleoMY7Reob6Wb6+1hdshkgpgkItE0yk
	D+Dt3WflB
X-Gm-Gg: AYBFou17EB7RhG0u77DCnAypO3ghQU7UgGqQV7nj1acQBHeRGoDOhtpXQ+RZBlLcAZT
	N2F1wXVukvkT2QP8L7y1C6L+6s4IX1vIPWBqOM2QW6hvvwHhXYe0LedcdFE03PH8gNyQKfjBqTN
	vNRCJgh5kwgowl6WEooCmSNA5BmEU8PKz0E1oSOHDbKfnQiT11SYUD10U7/NCkH0d9W4+yevk45
	l0zX0R7t+okenw/kz7N9uAAatp5WyhhGs0sok9QcdeQi9EZwy6ciIHO57i3kiGrpKxB2wwfB9ws
	iUb0gz5OwgOguh3/HEDvPXBrLq13V72jE5+vrEqF4lBykefLNrGvxmf8Ex4khcu74amFRyZHStp
	OWnvUR9ikg3gwHlE0LZqHRiQ/ledg13YB8287M9VVHOr6eZq0NApY6kQ/Iy/1p8HUNAilkbxEAa
	lgikbbrR2rMcuVaexlkcvtLLoHEoFuouqllOY4p3DsLwTvDKYI5HVOcj1zgLLCz/BJJNgCN3HvG
	ksV4U0a55vleeZtu1rvUrFDxjk/XgxFT7TWXpdSvH/74oUJaZFM+DIxaPsWaPj2xClNGIcIsRYe
	u7h1TltJ/mLlpo+k3/RXkhPZsJMuoem3/XHW+VIGkZRJdUpkYW766ziu9IbArBqGDw+8
X-Received: by 2002:a17:907:3e96:b0:c49:b9b9:26cc with SMTP id a640c23a62f3a-c4ca7a68457mr69565766b.23.1793326189793;
        Thu, 29 Oct 2026 19:09:49 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f389sm8249266b.32.2026.10.29.19.09.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 19:09:48 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso1845365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBweRYJDTPuoy3+I15dkQusZ/afYeo5V8Fan4PNNmbHgOPGWgTyi96fulDcRnMb2juj+TpaUeo8D/lHZK58=@vger.kernel.org
X-Received: by 2002:a05:600c:3b97:b0:4a3:5a91:5f64 with SMTP id
 5b1f17b1804b1-4ac18e5dcbamr15731855e9.27.1793326187453; Thu, 29 Oct 2026
 19:09:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com> <20261012-mipi-multi-series-v1-3-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-3-6a29add1ec92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 19:09:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uki7Q5JxB0TFFBHCAc2k3WHes_C9w+tt-gkyPfxjxboQ@mail.gmail.com>
X-Gm-Features: AclHuK86ihCZ-uLYu1PO7sbohTJtFnXFnyxUkp4TJBSVBWEeSWA2MHF2bUC1_mM
Message-ID: <CAD=FV=Uki7Q5JxB0TFFBHCAc2k3WHes_C9w+tt-gkyPfxjxboQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panel: innolux-p079zca: Use mipi_dsi_*_multi();
 fix minor bugs
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 9:36=E2=80=AFPM Akash Sukhavasi
<akash.sukhavasi@gmail.com> wrote:
>
> @@ -108,24 +103,18 @@ static int innolux_panel_prepare(struct drm_panel *=
panel)
>                         goto poweroff;
>         }
>
> -       err =3D mipi_dsi_dcs_exit_sleep_mode(innolux->link);
> -       if (err < 0) {
> -               dev_err(panel->dev, "failed to exit sleep mode: %d\n", er=
r);
> -               goto poweroff;
> -       }
> -
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);

The patch looks fine and I'm OK with applying it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

However, it could be better. Specifically, you could change the
".init" callback to take the "dsi_ctx" that you've declared in
innolux_panel_prepare(). Then it doesn't need to return an error and
you can get rid of the whole error check after the call

  if (err < 0)
    goto poweroff;

That could be a nice follow-up patch.


-Doug
