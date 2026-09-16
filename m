Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD321A42D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542995; cv=pass; b=RTvgP/DyBzegiQo+wM5jzHPx1+X2KW+KcFwW12/+jkS5UtjiEWBmVdofnYyr9Yk14RHrEgxUR1wrWe5Q3zJBlXUg7LZwmW9KqV/ohKH/W5pSd7F18zp1GIhJvIcrKUvrp6orwf35WcHyOPc1wU7N10jfT2e1PxIHabh02WAPnh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542995; c=relaxed/simple;
	bh=z5AkRAXM9LdDhqCS28O8reVfk0G0f4N1dCoZbIU3ejA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imF/S96hPE7nDbvk3a2CbyfkzeRCE+cz4B984I0f2lkSoY4e6s4+kyv3TDdUPzbsmpg21/3IwyVD3ZI701Z/tqeZqmB41DvBPPd9V46urklne65cPX31CVYbcbykC/e8cxB/PKuj6dfi3fACsHJIcsuLibUfBDAhod2PFzAoDqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sriRUURh; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sriRUURh"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so472401b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789542993; cv=none;
        d=google.com; s=arc-20260327;
        b=eN0L5UeSWc+hee0cRLovTYhwr5CFnzajhOr4WVq4o0uCXw4kbsBlHpICN1/B8ewBTf
         9QVWTLuAclqeNaAlPq0/NBCYRgygO2/Tp9Kq5D2rMrA5122p/m3Eogz16rUuuqLFx8lT
         wC3HpLMKU0hd0EyGQ+upcerU3Bq3gkIqSg4XHICK0LGMfoMA9hNI0W9JWwycDf+opvPo
         1PulrRn3AzuLw5KACz7++vy9kIHlEePiT2hnEDTSZG1pgCFPMUhkxM8rq7wAkKEieh72
         BUFsOTTFAaLecVKElSJMSwLoH0GSpaa9pkFElPvD0yntFWg6ii6qWtDYYsiO3V2dKefE
         6bVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        fh=R9eQaR54zeXAnFJUe8WDxIG9zQqj/YqbAR/xbl7NNX4=;
        b=qjDsxxQm11gJTEMO7OooWZHw62UZnzReU2kkeZKPO/h6dJTOOZGQd9/s6t3jZjNgyL
         KXaYjW4Bp7aMY9GAx/mm1VmMBMpjfTx9pKRavhnR+IQb3jz6tqjnLtVOfCrtsuhUgkx3
         HHxdyhORUbkAp6yzqjDKZym/6Ljq7w5nQ+bAm0yiv/tSFSuo2GizQsWjFGf1qrASLFyA
         g7p1ksn6V5cfUIJ/4AdZwwBW+EvNua8a9uyl6d5gUY4l+Ssv9JFqrx4VGeET/rDQmvvl
         ymXLlDnteEVNjWb2c22/4Tm02nAkI5XL5rXRvCw1EfJRFp4sbwTF4PtEyjRR0ZJFdW8F
         /LpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789542993; x=1790147793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=sriRUURhbbXK8jGBCM4O4iPRnNOhoeXrJr6CgQMfVnpatyEh+OmFzlWmF14kYxtNL8
         BAokMihJICnaOuJbFlW7aW1flZt9WitHPvMS6LajVEhEoTJwa3PDOMz2XvdWqRtfghQS
         F9wLkcGaF1FnTQ2SixKfGysPOOsQFsiw7O/TLaTErNNt/qkttmznrRcX1Pl5cIaV8qzA
         VYd8eOCyAOfZsvFPMkmp9i1hCvJBIxtrnufK988q0a81+CyE/It+BTz9MnbP0OcRkHpq
         FuixZCwKRHaHYzgCOv5c9lLE88fq5rdWYuejOUbPQgKJefgyaJhCOpfsa3PCWbpUkPXG
         ZxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542993; x=1790147793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=Ekrv5lJKPsjpn2aUJNp1jSvk/1HcjxDEsahwi2BNjb5Zu/ZmapgHYz3sYFSTfB8tdb
         R7Z4xhNTFVs9HneCKJBuQcOefW+Hc7nri6x/1xs0se3WBF//stZk9oJDxJDCmnDMfqgi
         bLZ+l1d8tugMm/FyFbVoyZKSgC2mWQ0myN1z0JhZA72oTYOvU+LHjw+IJiaqH0m5MxLI
         GzmgwHnw0mO1AbUtNTwlYq89lJKS4v4d0LUSzjwIwut3zaDXnv/9EnLBcM7/FIq0eONr
         58Ka48JoEzcKNWB6cQ3q68mHxamRtPOY7vSA99LUeC6NM1FKFcTytp+6jjn8xwR/rc1R
         sSIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0jeXCK2R0dkCrbhBY4qm0N8FcdK7OraG6pp5lYma8O3Xgvk+8QWy1kc6vnbcyBVJV0bWoh12Cfn1lKXI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBn6RQdl9wzGAwuxZQqmsPF5D7K7HNAIeuFwxpyQwmSGgDRGLr
	kevuOMqZKh8Y9jGv//IkJnIg41fpLuDzrAGyfa2BwmnIxYF1PQ6Y9OBtelig16dBGNSb57681pp
	+RozJ80OQUxQh5/bTzon/xatDhKNoLlQ=
X-Gm-Gg: AYBFou39wJOhz/FsEB8KblacaN+V8ooHoR2WRjSNRTPTwfRzvS5XwN8zf7MFYWLPZvF
	NKYjrG7TNw7VdIS+9kKHzdcYH4AF9QNbOJRnNbhWVP2cVJKHatbdIHcr/sb5y4XSG0pn5hXM8CC
	8PdzCeQiSXWH/l1j9aPqKVfrrpdHEb/0OdC3e2JQ7UODXynH2KsUScBLXXZOZWoZZKZCMYz/uh8
	NKHRk5SjB6pbcOKQMk65aUJF2Yq1XdQBLNTsjEWDhoo828JbsrUVuOQmirFFoY9buWtWfgXDy2o
	silr9a5hp9ZqNMsjXI/BwLlUj4FfjBhyuEO5MXy2o5AaBrZ+iZkubf0cc9ADQ6dE1cQogQgczzL
	mkG/O/9D9fUXUWU+wwbTcNQ8=
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr4128744637.21.1789542992705; Wed, 16 Sep 2026
 00:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
 <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 16 Sep 2026 10:16:21 +0300
X-Gm-Features: AcwNN1Wu02WhbDbGzw2qQ55m0JlviTMXZEyfe2ujg7uZXtgVBYhdlrVFke0bQq4
Message-ID: <CAPVz0n3kwZJTpanbCFzYKj=ysXQ_V=+uXjD5hY_n6OcDvnrx1A@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 15 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:47 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> This driver uses drm_panel_bridge_add_typed() and
> drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.
>
> Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() and
> drm_panel_enable() which the driver uses.
>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 73e13ad59a93..92938df3b747 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -351,6 +351,7 @@ config DRM_SOLOMON_SSD2825
>         select DRM_MIPI_DSI
>         select DRM_KMS_HELPER
>         select DRM_PANEL
> +       select DRM_PANEL_BRIDGE
>         help
>           Say Y here if you want support for the Solomon SSD2825 RGB/DSI
>           SPI bridge driver.
>
> --
> 2.55.0
>

LGTM

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
