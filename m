Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DB471268
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583649; cv=none; b=LxbcW9zq7EcfGe5+HlcUV4BPsVJ/RWLiYDHO+jHi+FKddVS+yFbshuWOeMs6jAisN1TkNE7gXiY2yNcl6ewQO1nwlguX3R/Br8VAG6shA4hkPCEJfHxfEtQAXYL8EF5oej8Erg8PNf97FpvS4p1ru6y3dKBwKFrEzju4jxRcN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583649; c=relaxed/simple;
	bh=CtjiIg1LsVrrun9n/5vKLItzxCmbEx2V8e805VpiR4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vaf+eMVbv20ghb8reQ6Ivjy0VkV6mJGaO85PtYHnBVSm6Yt4H4C8XCCe9OuL/LqxlpwNIBj8/O60ajmRrD0iz9QLAVfynPwdMcjdo5VnsGKs54fODli5WjcIS7nhMVfdSldOFL9GghILV+daKOvDeJeRdPxdHRh6ZO49/hgMyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=s3R1shks; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="s3R1shks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1790583640; x=1790842840;
	bh=sWR7+AcckXLzVN8kNNdUbAEI0EtHthjNSFtY23Le07s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=s3R1shksSUw6ZHzawrEzuYla/HQ3wOCMyXwUgQAjHEluSJ+zRBDxME8kSzMVniN0h
	 qFGqpUA6QW6gJIpNMVBZi7BsA8QfKYypT4Dm0kPHiPJ8c7wF53OOIYLmFwpbMMl6c6
	 lmpdBl3cJ/HVY28nNf0EzIAO808pbMLe/iE8mTzLPKVy6aY23TgjDDY/OQBw2O9/hB
	 nqGZVvHB/+oIAHH3NotFmIMlt79N09mZ8VAyOHAHEx8G4fvvGwPSWL1aU+MAMLW5Gi
	 d+Dv0qybqWM/x3F7jvsDvZFCzOVdaszF81ok7zQFIsADZ20S9K+xnut5Cegs1XOvG8
	 JQgQnybWCelww==
X-Pm-Submission-Id: 4htZ4h5D8mz1DF4X
From: Esben Haabendal <esben@geanix.com>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman"
 <jonas@kwiboo.se>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,  Guido =?utf-8?Q?G=C3=BCnther?=
 <agx@sigxcpu.org>,
  "Fabio Estevam" <festevam@gmail.com>,  "Robert Chiras"
 <robert.chiras@nxp.com>,  "Sam Ravnborg" <sam@ravnborg.org>,
  <dri-devel@lists.freedesktop.org>,  <linux-kernel@vger.kernel.org>,
  "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>,  "Oliver F. Brown"
 <oliver.brown@oss.nxp.com>
Subject: Re: [PATCH v4 0/4] drm/bridge: nwl-dsi: Various fixes
In-Reply-To: <20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com>
References: <vfndbk9zi3OIqSxPrtQEXwhrwIF37_6XjQPApIjAJ1MRPGB62dWkOgynZc0CcQjqCmzn-OzHvMjxzYtTttZXgQ==@protonmail.internalid>
	<20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com>
Date: Mon, 28 Sep 2026 10:20:35 +0200
Message-ID: <87qzidvlbg.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Esben Haabendal" <esben@geanix.com> writes:

> This series brings a few patches fixing horizontal sync timing, EOTP pack=
et
> behavior and hsync/vsync polarity selection when using DCSS endpoint, as
> well as a small fix to properly handle if/when nwl_dsi_mode_set() fails.
>
> The 3rd commit ("Correct auto-insert EOTP behavior") is taken directly fr=
om
> NXP vendor tree, so I have kept Author unchanged, although I have modified
> the commit message. Let me know if I should change Author for that.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Is there anything I can or should do to get this patch series merged or
at least some review feedback that I can work on?

/Esben

> ---
> Changes in v4:
> - Change calculation of hfp/hbp/hsa to use the raw clock rates directly to
>   eliminate intermediate rounding errors.
> - Drop patch 4 (will be included in follow-up patch series, together with
>   a patch addressing the unblanced resource teardown and PM runtime
>   underflow problems in the error path).
> - Link to v3: https://patch.msgid.link/20260810-nwl-dsi-fixes-v3-0-256da9=
d672e1@geanix.com
>
> Changes in v3:
> - Added Fixes and Cc: stable tags.
> - Split patch 1 into two, with change of endpoint mux control in a separa=
te
>   patch.
> - Fixed mux_control_try_select() state argument.
> - Link to v2: https://patch.msgid.link/20260803-nwl-dsi-fixes-v2-0-1809a0=
ac453f@geanix.com
>
> Changes in v2:
> - Added safeguard against small horizontal sync timings, protecting again=
st
>   division by zero and integer underflow.
> - Added error handling of nwl_dsi_mode_set() call.
> - Link to v1: https://patch.msgid.link/20260710-nwl-dsi-fixes-v1-0-927d91=
8a86ad@geanix.com
>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Luca Ceresoli <luca.ceresoli@bootlin.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Guido G=C3=BCnther <agx@sigxcpu.org>
> To: Fabio Estevam <festevam@gmail.com>
> To: Robert Chiras <robert.chiras@nxp.com>
> To: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Esben Haabendal (3):
>       drm/bridge: nwl-dsi: Cleanup endpoint mux control selection
>       drm/bridge: nwl-dsi: Limit LCDIF specific sync override
>       drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
>
> Robert Chiras (1):
>       drm/bridge: nwl-dsi: Correct auto-insert EOTP behavior
>
>  drivers/gpu/drm/bridge/nwl-dsi.c | 87 ++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 74 insertions(+), 13 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260710-nwl-dsi-fixes-c148b0adb685
>
> Best regards,
> --
> Esben Haabendal <esben@geanix.com>
