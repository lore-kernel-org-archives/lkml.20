Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EB548579
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923722; cv=none; b=utft5aS7D0BAJnWzsqa3Ohsf8kWXIBef7CXsU+8OzeopCD3tYnHLxZt5sj6Vx00IDhCIRh/Sz/ybYfZbXH8+5oh4pJHxUgTXCZutjMdyLBKekyKTxgWw9tj7tqaU8m84pH28jxZVpW2TQEx5New9kjsLnlDwatTSTsFWLn7eTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923722; c=relaxed/simple;
	bh=vSdc/GgrjZjvW48jrW3QLCyEw09wBJTQiSl8ktErzpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvM2awa3D8ehveTDFfSfVu4NQF+FHa+SqbN6uEUZJ0CquR54mrix8DdbSlUjmziHHpZ2X/NRfj5FbRAlvYk5zZcuhMEi9FQRdoCWHmiA1NQ8XRIKF0GRdHzFyYfxFqYBKvkRq+ddxB1S/PXGk6yOJwRURfikSVCKcNW8kty9Rj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P+Y3pfTq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P+Y3pfTq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so46358666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791923718; x=1792528518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=P+Y3pfTqqegHal2NWsjlfjB3YwhgIF6SNuX7tydRQjWyb7pG+UH4R03VXLUiHlTE3s
         UqrVBpUuyY6DylRCoimR/koTZ3IpBw8jOrfgdU0eczyD20d42brZLSNHamdQcAeQTqt6
         ZCHfp7lBn59uLSQ5cNoPejW4ZIikgW18Nawks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923718; x=1792528518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=wvygv6M1euI9GhCsKXv2fb/AhtOnQKe2357TDN1lbRRoTSB8EnpU+DF85eb54uphdz
         oREH6X4kg9zbwL0g+rqinr88hi0w+N8M/xdKsz1sh4XzIlljKBH3XxxhmShZsngBgxJi
         3k5PxrT5XNcGdsokPzu5DZBQiq5Qq1oXV7lcx2D7OAxjMsrcHBnnrGkwte6lZIhmVqD+
         myMY/q/WLwb22Mmp4nkOAvArK3W9NVsbJlVuLdlMXYXZXgu9VqsCgQ0mDZVK7xJeRmJ9
         dUVBUtsLlvhquoRLe6IXHfw9N9HpQG+cVuQjUBanWr66IlriTw0Y0acPAekn8jJfnDWx
         oEcA==
X-Forwarded-Encrypted: i=1; AKwUvBw7zfudlPRn97VYEGfYctwwUc3Ep4mHp1BjvZmfIHxTh+CRuf0j4psY8sAvvJgJpD3wvqcjX1vPs3JPLFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkoTRYpUYbkpOURweeEMKqhsS/n8eO7QCgmb8SAjrbDdCWB+YH
	E1OzaY5+Jm12/jjvNpWc0eKohAMkFPP0HNI7muLHFrDPysY9YAw9hRCJoXj0spY71VqnqbyJMHO
	UWpkLxA==
X-Gm-Gg: AYBFou0/+Ix6VAjut9IWye5bt3GLNAktPl8MqUyLg6BcAGrH5UFfSFtopoCJPqfTR7q
	UA2nODjQHbdv5FTGh08rAA9osKa9ITu+EMLmCzDKRO78cb06z5EaOPbquaanQOGRVN8nqeUDyTE
	u2cEpzDzobpNLwnY1dYIbdWU+90KsLM7Eu/QGzQhAX/WiKWQII5dBJbDDTrbxjL9gZN+ejrbgfS
	r7CUym+BBYagKA2ymqPEJRKtXwOx0AYT5m31VZMBwNMFCs2d4/53nj+j94VKqJa513xrkVBAjmD
	voKb47jramIKvbrad95ekzjzV+QKEQrR92mPLouF11tYoMRPfwa9ipoFriKziPgKKYzVRVY6hCr
	bXHhyesHfG9pA6awDucXqOA4Tb0a9FG0Yle3YipJfqNk0B5Gxl0y5ovfTDRORPoOxjzm8MRoN/1
	4LMbVnlu1bc6ry4444WPI/edvoX52UAvHgm1ZKZ8bR26X95m+O9hxehWYxLK0CbbQpZTLjpuZc2
	D+ffVsLteS1KNWA0wdk78ktnnO7jYHsU6oihQ==
X-Received: by 2002:a17:907:c298:b0:c2d:cf0e:49e9 with SMTP id a640c23a62f3a-c31a9ff494dmr1168635166b.15.1791923718498;
        Tue, 13 Oct 2026 13:35:18 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm632059766b.79.2026.10.13.13.35.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:35:16 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afe75f055so3101679f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1ExquFvyqhVUAqutVRivGfvKm3VtRIvqF9e7EJEjGxQopUH7SN10WwkxTkCLYkdwsrkdOM4MVQjcxcgM=@vger.kernel.org
X-Received: by 2002:a5d:4b4c:0:b0:48b:f92:1f67 with SMTP id
 ffacd0b85a97d-48dbaae6d3cmr18389338f8f.21.1791923713788; Tue, 13 Oct 2026
 13:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com> <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:35:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
X-Gm-Features: AclHuK_Kdnq_Nm7orMZLL2zoW1RgGH3OpgePi2fH32LmSKFmFT8VrWVBo8fW_FI
Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jasper Korten <jja2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> From: Jasper Korten <jja2000@gmail.com>
>
> Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> Galaxy Book2 Go.
>
> $ edid-decode /sys/class/drm/card0-eDP-1/edid
>
> 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
>
> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..73cdc2d37ab7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140H=
AN06.4"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140H=
AN04.0"),

I'd assume you don't have a datasheet here and that the timings are a
bit of a guess. It's nice if you put that in the commit message, but I
won't block it. Ideally you could reply here and let me know if you
referred to a datasheet or just made a guess about the timings so if
the question ever comes up later we can find the conversation based on
the Link: tag...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
      commit: 9125232bc2a5020710db1eadd21973757f740648
