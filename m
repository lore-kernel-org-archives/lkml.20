Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575824A92C1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188827; cv=none; b=dw8rwVui0jEYqdpW9RFIWmvXoYJDlBTojgNQvENU5Vktf/uDutKlPgUa0dJ4ASMdY79kYDeClhDUoHvaP0kW/Q+htuiaUFZidjvyZbiiHx0T475Xu9zmObkmaI4UJVXao+TENhAdUz8pd6JkEMvdFEb272sWZDN+uo6FuTp9hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188827; c=relaxed/simple;
	bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLubg/O/BQtq3GtJuZL+iytmWohYL6kbgLjaFkSdOJKWgWr/mQhqIJaxdFW81okxb4PNsQwk8v4yEfTIwUGDAkXOtG8OzXmnG91vpuCnmTNpfO5GP6zlqhLN167VyIQNt8NxBv/SeWInIRd/1faB1TsShUq94/l7BMGnIhFGPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TeM7JeFq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TeM7JeFq"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1981228f8so31637871fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788188823; x=1788793623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=TeM7JeFqOjRKDfJ6kS8yeXXWGBjXNYxdvmZ5p0CRAnBE5L7c64yLoyOu7lhx/nrDYW
         GUMUKPplobJNLfaNQQtTVw5dD8RYeclKiaIgWCLp5dY2t7u1T1wDKr+xLfNsCCi/zdAB
         AQgAJM4zhGE12xaIoB6jZ4qoaK5knvNW4JIk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188823; x=1788793623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=Tcz8d6JCHnVRqx3Xvl3al3L1ondaHERiHn0PIDO5Q5V+IZkj8MaCxfQGCCg1EOjiax
         4QO/G5UkzU8DIkYrKLtTtxliO+2y4mFsCNrNL/4NodEzhXFyCkkmXWi15fXEl/sko9Pt
         smrKLidiUTh4NgvUjYLHhYLhY0NiQUkAwHVZ1lafhi7nS3ziHnj04qNdTe4S+Uf3R2O7
         HdaQVm5mWvpjmg0t9Z+clSu3F2OkCHGSVNXyMWutrs6UunvNW0IkHi3OIGlYKEDe1fKj
         MfPdGL/W2e/nfTwQd9VvIJAUkC6QUdaRBiXNHFUKrge/xJPPOhYm+NLIDfyP+5iEEfUZ
         5RPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpt/3sR35J76mVQsFzjKlfTNWwdh1jb0JfYm7ZMY/qkoozzRuUNPt2DwpPsSYAr7aXktNUzk0LzW9nM/A=@vger.kernel.org
X-Gm-Message-State: AFuF++ncxowzm6JheyJNc1ysHsm73c/ynmJJ+32idrBJmXKVFqyjV5by
	ilK58lJJCfhHHQ6v84DpxX6Alfyo9QccGtPHQff8m7ljaW3E6wT5Hhzjn7kPyed7mZAYxXoqIoS
	pqnCqKmHY
X-Gm-Gg: AYBFou20c29f0wlzfT8IJfy64VRKGEMdFC0/46NyoDQTtHBuANfuFQfGTjeJuAwMTqw
	s3vGg+nw2y9Id3v+znDRm1BwYkCdEm4Qq5wQ5FjkAHVxDV56NP6DZ72+eKeB9Udgnhq8j2IhpNi
	tAvNIEz5IpOv0BH7jwykzlEjCGcxU4086nNKy9ZUI9nCc9oxJ9UiLbFbKrH7rPi2PaSrPNFCJe4
	wectlvUKMmVECkS7/1AVGFM5hjXhI2hy6rsaPCwXi69IjZcTONSaoJ2ikiX/bqQW0iGotBfpsUF
	nuKEikBfHrrglaX2CE2s0sNj/5se9isejBFGqafLjl+a6Sv/BDMdpIcgu2JneJyslS62JQHjoXB
	uS9e7y0hiHlyeCHYmfC6ECM9FXHqAy+Csp//T0/NhyNOg0weV/xytpGlF3k5ECrZrGLdpbZ1Fvf
	epkGadmIjOxUMnd5uDexuCK5xt1cwW2dHeUePqSLUV7zy45Q3skFur2aW9CRu5yeR8UezVUtn7d
	S6MWeUQuW0EslvpPb3rVacI4gA=
X-Received: by 2002:a05:651c:435c:10b0:39e:ed7e:45c2 with SMTP id 38308e7fff4ca-3a301ac98f1mr43059911fa.8.1788188823169;
        Mon, 31 Aug 2026 08:07:03 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305571f43sm17969051fa.28.2026.08.31.08.07.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:07:02 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso3818041e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3TPHNGeLHKbkGEbgk5130Kd4oIrhxwgfvROHRugGJ0Sw5qvFHVjuVT7outEJDBU8nRXsFcoLPZmp/3Fk=@vger.kernel.org
X-Received: by 2002:a05:6000:2403:b0:484:3310:f394 with SMTP id
 ffacd0b85a97d-4843310f432mr23509935f8f.23.1788188332108; Mon, 31 Aug 2026
 07:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com> <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
In-Reply-To: <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 07:58:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
X-Gm-Features: AcwNN1Uwe20Iwwe3Thag0bGUZKeQo9OpK0wBSimBjMptkSoLanhwYwfNst4yWiY
Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
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

On Mon, Aug 31, 2026 at 2:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hi,
>
> On Thu Aug 27, 2026 at 6:23 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver uses the drm_panel_bridge API and not the drm_panel API so=
 it
> >> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
> >
> > Which exact "drm_panel_bridge" API does it use? I don't see any...
>
> It calls devm_drm_of_get_bridge() [0], which is in bridge/panel.c [1],
> which is enabled by CONFIG_DRM_PANEL_BRIDGE [2].
>
> [0] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/parade-ps8640.c#L636
> [1] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/panel.c#L483-L515
> [2] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/Makefi=
le#L159

Ah, indeed! I missed that since it didn't have "panel" in the name.
FWIW, then I think for this patch:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...but, ironically, that means that for the other patch I looked at
(ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
uses the same API call, doesn't it?

-Doug
