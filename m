Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD74AD7EB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190136; cv=none; b=ZzlbvscfE4Z6CS4AFjRdpNXTaJlAYJvyXouXwk3Ex2wrdLR6xDdkJgrDtFyIAdTfJ0dBDzgK+Hm4dKq6ruEy1eOqMQzJIADS0WvuJAYg1rjCOgxTLehrYeWsDFgRt08Ipk/MZ2iUV/5pnQRhTjOlhKAMbH4B4XZ6yFQ2hBMU03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190136; c=relaxed/simple;
	bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jg6LMT4BIRmxGzqoIBjVJ0fewDAI5Gcdkf7pt2nQGLTDePOs/THX8bfRuQYSTdej6BuNAhA1hjJUujmTB5NIEZTZBy7A502dIU7p/IFEA7iWGN0tmKE7k38xn76YakVxy1O+2lfAj/7UsnWOpsaQd5+eGfNeZSb353zda6q9zDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g07CH+ks; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g07CH+ks"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso594525166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788190133; x=1788794933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=g07CH+ksiwYiL4IK6T5koP3J4qMFNh5TquhgD6kQ78rwaid7lklVFp8Ao/uXWK/fj1
         jYKgNnKdRa4I28H9LsDV8BvVl/AiwNAGuFulGmY1JQxjZP5ZaXUqZBP8sLNKTK+lwrBC
         FiPbxm0y3OUVvuMB/IifTUaU/Iez1grR8CBvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190133; x=1788794933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=XR30LCtqUIqMXiknrVP4vaPheueX99rQzB7KqAvYIeuAUufpE+Y2AKJ+myyr+kOKii
         KsJx2vUuSkikEmaDR+m+kn32O5tVQ5MCxn7k/H/GftaUdyi/31+tJLukl50sRCVOI+N6
         P6ZlJOVDtXfRzz4BFqkNtyvPPwWHqEOmTYEQ2VUsoll7llDnAfKdQsz4K7u7msF0tvo1
         4CoiFtPme0ljAWlZXRUW9gly8K5R1ckAqn/zlZfFxnkDAbZBOco4EKsT71sxcjzVlfxP
         PzggejxlNeB/GIe6py+7pdXEbgTfTqF+JYMIHq2Rz9LvYkAAWGFVqcqUen4F35er3VQR
         4ChA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ45Kr99Y+tntuz1ZGOfxsXYEmWG+QPHSTiDGUcrCZfYggR3v37tWS2BJFPLGPWtS8oAznl6+TEwmCJUo=@vger.kernel.org
X-Gm-Message-State: AFuF++nEbbSIicEe7JCnZ4laIO3TwUPD86zKZp+VOD0LTNPSmTOWpi0K
	7XbE55zXpaRIhd17Iyc3M+wRxgAitCWlgS2K8WXw0DDKvnmxDSip2AG08UZxbV57bZ5PM1MPfU4
	rPpGWhC6I
X-Gm-Gg: AR+sD10CWFWyVGbzCGZghQwMLTU49LlGlrDK0bKPEipxqxV1ZgmOXEXBDE3TU9NEtkJ
	sJ/AnFM0YYy4L0FW6PP/kRnsBBrqKAfj1PllhtRzxKOQTFvTLrRilR+o79bVEvbDX8vz0I23StG
	iT++wWsgJRE7AN4aU/co8R7K+SBmZ6J10fXct0xjcUpLhMHNYXOzC2r/ljBaxITCrJicgzU8FCa
	qgX9j2LRZa4DhjSHV17EBwwcQd6M/yKxYQAl6tvuCNtKiH5mIpKzy65ZSR2L7btE8EIl7deUbPG
	q04NtMQ5oQJjpq/U8runS+mtvnFgQGQux2ciH+P5bVZO+NlmvlotFlauKUMgqeKb3bFGthck/Bl
	fUAYn31hWz/+e9HNbC3gE1ZTuaI2IPowM1f4FkgeOmmzh8S0e/UT69O8WcvAXZDucTu81JHwrKO
	Q0TqoQZgb8GAHPSsJGjXVFzPgTSAuGu4AeIR8Qujx6aAmy/nTTF8RQy2wNCiqNj1H7feOUpUaQc
	IgqF7qhTuyMPm8g3aoGNVsawH4=
X-Received: by 2002:a17:906:a88d:b0:c25:61f4:b478 with SMTP id a640c23a62f3a-c25b3cbb65cmr83427166b.15.1788190132734;
        Mon, 31 Aug 2026 08:28:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2560e026d4sm435596566b.4.2026.08.31.08.28.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:28:50 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2133497f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzowHe87oaSocYzkv+qvGP7vTxrFJ1HE0TuYSnhFCtFYlTe1xEAI8REZzx5eAlWjyDtsbL1ooLZMxeuGhI=@vger.kernel.org
X-Received: by 2002:a05:6000:46cb:b0:484:3600:35b2 with SMTP id
 ffacd0b85a97d-48440fcee03mr2458557f8f.5.1788190129893; Mon, 31 Aug 2026
 08:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
 <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com> <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
 <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
In-Reply-To: <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 08:28:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vw4mO8ILYq4ZDFw7i23F9T4GMkIdNzC_wyAjuyFKPOHb3FlBTxENhm96k
Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
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
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 31, 2026 at 8:26=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> > Ah, indeed! I missed that since it didn't have "panel" in the name.
> > FWIW, then I think for this patch:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...but, ironically, that means that for the other patch I looked at
> > (ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
> > uses the same API call, doesn't it?
>
> Ouch, indeed! Thanks for noticing.

That was part of what confused me initially. I saw one of the drivers
selecting DRM_PANEL_BRIDGE and the other one not doing so, even though
(as far as I could tell) whey were both using the same API calls. ;-)


> I will send v3 with that fixed, can I keep your R-by if there's just that
> change to the sn65dsi86 patch?

Yeah, it's fine to keep my R-b.


-Doug
