Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632334B1283
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444012; cv=pass; b=St1s8an6RBPDkhiL5ZM63FK0ksBQiugbz3Hkr565m2o3e2kO6Af41xEbXMLcSj81Zc7uHLrvZNgU4YFUKAQOf2zTWhdFAxV05BeYoNrANPqiV9+dyT6JQFIggh0on3iyZnBCFU8ZKFUDutraeRl4g4Ej+23L0yq1JrVhZb5it3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444012; c=relaxed/simple;
	bh=DP8nKiHz81rw7lPgX5oO0GiiObYLyVNzr60U8P2c65k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8aqzKzxvu6VCQhNN8+ZZlxI992laW/cgjpwqNSC1XR6iUP+kvBNtV+LRYm2D2f3tCt39oBjDal0EP/4tPDILAjJYIJHgLrfI4aWJdGlhKY4xNbJNeVyZcWrbO/aWBOWGNFnRPBgML8+TuMCiC3Fh9jkTtQ4qg/raJo8K/pDHNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=exfYE1Jo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uC+zKrgc; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="exfYE1Jo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uC+zKrgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788443993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vm+o51d5AAhWwdhCJ9D5D6GwJZ5w7R0MImR238UNQLM=;
	b=exfYE1Joj3YeTjfFrIpMivsMuj+++84tprELr4vL9k7PEKp1fJ6v6wFE7sTdH1iMbUJpHt
	pC91hCie2QBR78evme1AiwRAiYfYlBV9eXokKQKNRqBDHGENBJRgk0pJ1qHabZ/2W7oFbH
	ciaGnPCPjrjv0kzbaqrDI8CrKhBUCjY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-Ku6N_sYyMemTUb7JNwO2sQ-1; Thu, 03 Sep 2026 09:59:51 -0400
X-MC-Unique: Ku6N_sYyMemTUb7JNwO2sQ-1
X-Mimecast-MFC-AGG-ID: Ku6N_sYyMemTUb7JNwO2sQ_1788443991
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-820111eb28aso35253737b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788443991; cv=none;
        d=google.com; s=arc-20260327;
        b=TUraWOMYKBxQ3O5uZ7J78oDBN+wMtnFtzAdu1O65+89Y0zONa22PtEDzSL2hJldMcO
         M2EMw1gtkYvYxJK7N/wcuEpo95ocoaHQLmn8tr7Z43cFwZIrEMFkqHR/FJm/vmSCSTGg
         1SusTq3a3XKgVmLa7wXVhjHRZna1I5Fco+oMlyYlbzxx23GnbfYzvKyc8c2kj9RLgh2M
         GpQ1l3rryjt1anhzQdRxaG+8BdkXJ22Q/qAbGwnBgzYvXtv07YpjQAfrd920wcKpxejo
         Py6X+bAxEKb7muuNRqOGU/aKC2NRMAwn8jrV97eTla4UXSXznYJfrLZGR8WSSz2tK4yV
         0Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vm+o51d5AAhWwdhCJ9D5D6GwJZ5w7R0MImR238UNQLM=;
        fh=PbEJfuVV67NPF16x3Abxrty49u3ZNUgGCLt2y46x7Hs=;
        b=qkT3vGtdRVnivtrrklNTm/FaVg6lnOzbM0Xk7dyg2k17VTfBKOLbJYV2isGs9gCZ+9
         IIDeNdD14/NkQT1wNMH7h+0evjy3JI4StP9Gf3hn61Id7fs/a0AcJM4k5f7Qe53T+oIh
         YS8+Zb0yDeBY2EnwXC2bad6iW4gISRlWvWjMwE47kFPsuNLfKundqrcqSgylPWGT2zdI
         Kk/SwVqaREOB1uQR3tAtpA2W3fPd0uLXOAvFcDf58sDDFMEOX46Ph97uXHd2hvpBQxFZ
         H0HLQyYkRVtlq7j76gsoSciMUPn/tnRmdGXLXkBpEGLeRe/JVt/N2ISDVDHcdt+f5tp0
         xF4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788443991; x=1789048791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vm+o51d5AAhWwdhCJ9D5D6GwJZ5w7R0MImR238UNQLM=;
        b=uC+zKrgcgyepPmURqVSEOQd8iZFm+CktE5dvpdyb8Yc+IhBqrxlZGSIuvwAg2AVCPc
         ALhNAOSfnIeZc3jV74nYW5R2E3SUb49rVtI7tQZZ0OHfHDqxS5pA8i8Wk/d1eq5wAaLP
         nZvuZcHtKUC8QDuCX2usW2u0wWZ7nlilWF+bCF5doa83YlBKuOw30WCxiaBF1HEwHmKA
         bKVyJzroRs2T1d/9/7X3xQhY7/eyBcvtosD9oLaR1AD4FqgMHWVC4WX5xPwIUED8cTxu
         dFgVAQhNF3qhDI8pjCOYl5rxZx915Q/XIg/1E+eborAqx49tKIFUEGHmKKpAnTmSLzbe
         tv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443991; x=1789048791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm+o51d5AAhWwdhCJ9D5D6GwJZ5w7R0MImR238UNQLM=;
        b=A6P0qH5EGoisfN2rPOxoJ/1xVMqn3peSwkbAZke4gx7xObPTGY2kNGj66Dt+FfMjQ5
         97Vxfbsgf68bgtSR5jGr0CbodNrtHH2/YIyL+2n5n3blTBuEogkb2AzWerq9plW5bwd4
         gA/YDOnSyT2fBt0n/WdFMoOtglQOFhO63ys0TRdRi/h/V27sV/m16hoOJBcnqGDMOSP1
         whbOKWOH7N1+7sRFP9NhkS0DWWM6XhsaIM/Zb9ftaul0K7IZgHORc1vX3dzjmeB0TKm/
         BgtSs/Wl6bIEM7KWfyuOSoVn64gJPW6Cl2YosasQc0Gae2wHxQd21q7cJH0ez0YLIS5o
         G21g==
X-Forwarded-Encrypted: i=1; AKwUvBxakMY6oMxTtYOzmIYW4h2qm3e14nsRr+MKhZt5eazkSXW7qTFHQiPbPiptA5olR/6vl18x/R/sQG9gKus=@vger.kernel.org
X-Gm-Message-State: AFuF++l0H5jMf8ypQLQQWHhY9cCYbId62yGQGdwUjs8CQSQovdcnnV6T
	7wq/jTlTpIOr3w4YcJmFOZ4I+qmUchCMCczRWYRrw8o2DLSb2yjqdUtqA7BQto8viHBCW82WQq8
	i/ts0F5Mi8/st4VeY3KhIndEpfRZXSONFUyRDASi+zcGVbGMj8obgO1IJyOhnJTro1n66sF9+Dz
	3JPfWk67sUHQeNCL2Zgs+f8zj7OJgqaAr+vjRqBoKI
X-Gm-Gg: AYBFou0sejCpZLuLJcmdHv2EKP/eAsGDQ9pkN8yMTg78ua30fVyrD0N48DXLjJXbXA3
	QrnRd2QfStctv2GdM9eCOnhavN62UqUpdtzc+Hk4Sk7XqkzuZiPtmfQnJWlQ+J09i3PvC4zKhDt
	K4uU7oSVt6Fq9RR/P+AXpqvzbyhKjAt3khx7BJNROaNwvj+8lRPCMHog0=
X-Received: by 2002:a05:690c:ed6:b0:870:c600:686c with SMTP id 00721157ae682-870c60071f3mr2545687b3.18.1788443990667;
        Thu, 03 Sep 2026 06:59:50 -0700 (PDT)
X-Received: by 2002:a05:690c:ed6:b0:870:c600:686c with SMTP id
 00721157ae682-870c60071f3mr2545057b3.18.1788443990118; Thu, 03 Sep 2026
 06:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com> <20260903-drm-bridge-every-panel-v2-4-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-4-2ab8ee24538e@bootlin.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 3 Sep 2026 15:59:38 +0200
X-Gm-Features: AcwNN1XDl-Ni_DEe3erHCFfPAz2cykoqMGRy_g6UAaZH6jri9FS6U46r-qkzR3A
Message-ID: <CADSE00+n4XQ+Xj-TG4KtbPq4asR6GH9=+fC0MdQUycM2_DXiNg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 04/19] drm/bridge: panel: rename
 drm_bridge_is_panel() -> drm_bridge_is_panel_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:12=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Work is in progress for every drm_panel to embed a drm_bridge, and for th=
at
> a function will be needed in the drm_panel API to tell whether a bridge
> represents a panel or something else. The ideal name for that will be
> drm_bridge_is_panel(), which however is already in use by the panel_bridg=
e.
>
> Rename the current function in the panel_bridge API to
> drm_bridge_is_panel_bridge(), which is more precise and frees up the
> drm_bridge_is_panel() for future use in the drm_panel API.
>
> No functional changes, just renaming a function treewide.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/panel.c                 | 8 ++++----
>  drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>  include/drm/drm_bridge.h                       | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Albert Esteve <aesteve@redhat.com>

Thanks for cc'ing me :)
Very curious to see how this series will unravel.

Albert

>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 40e3970e8b76..0582c708957c 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -221,17 +221,17 @@ static const struct drm_bridge_funcs panel_bridge_b=
ridge_funcs =3D {
>  };
>
>  /**
> - * drm_bridge_is_panel - Checks if a drm_bridge is a panel_bridge.
> + * drm_bridge_is_panel_bridge - Checks if a drm_bridge is a panel_bridge=
.
>   *
>   * @bridge: The drm_bridge to be checked.
>   *
>   * Returns true if the bridge is a panel bridge, or false otherwise.
>   */
> -bool drm_bridge_is_panel(const struct drm_bridge *bridge)
> +bool drm_bridge_is_panel_bridge(const struct drm_bridge *bridge)
>  {
>         return bridge->funcs =3D=3D &panel_bridge_bridge_funcs;
>  }
> -EXPORT_SYMBOL(drm_bridge_is_panel);
> +EXPORT_SYMBOL(drm_bridge_is_panel_bridge);
>
>  /**
>   * drm_panel_bridge_add - Creates a &drm_bridge and &drm_connector that
> @@ -321,7 +321,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridg=
e)
>         if (!bridge)
>                 return;
>
> -       if (!drm_bridge_is_panel(bridge)) {
> +       if (!drm_bridge_is_panel_bridge(bridge)) {
>                 drm_warn(bridge->dev, "%s: called on non-panel bridge!\n"=
, __func__);
>                 return;
>         }
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 00feb73e63d7..5de9b76f345b 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -983,7 +983,7 @@ struct drm_connector *drm_bridge_connector_init(struc=
t drm_device *drm,
>                 if (bridge->ddc)
>                         ddc =3D bridge->ddc;
>
> -               if (drm_bridge_is_panel(bridge)) {
> +               if (drm_bridge_is_panel_bridge(bridge)) {
>                         drm_bridge_put(panel_bridge);
>                         panel_bridge =3D drm_bridge_get(bridge);
>                 }
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 9f2294957669..b29096d624d5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1474,7 +1474,7 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridg=
e,
>                            enum drm_connector_status status);
>
>  #if IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
> -bool drm_bridge_is_panel(const struct drm_bridge *bridge);
> +bool drm_bridge_is_panel_bridge(const struct drm_bridge *bridge);
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
>  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>                                               u32 connector_type);
> @@ -1490,7 +1490,7 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm=
_device *drm,
>                                              struct drm_panel *panel);
>  struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *brid=
ge);
>  #else
> -static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
> +static inline bool drm_bridge_is_panel_bridge(const struct drm_bridge *b=
ridge)
>  {
>         return false;
>  }
>
> --
> 2.55.0
>

