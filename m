Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41A3AC0E4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026728; cv=none; b=A0rsFZ3YZ6Imx0yTtnYTE480x7U0At+c1VG/lXUoRz46XoERSxXxSXVF0n5nPq2Rz1pg6Aisfw1NEQ2FxRRmNzy1+QSELs3AEugMxWE0mz84Axup1+EhrL/irypwmXvxHqMnksbBou7GzYtINX3Vn7eI63DjIVUgKK4Fs2jdkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026728; c=relaxed/simple;
	bh=1vomQXyHMLEIAkNAUwWX1P5pIY3Bv6hvQbgIZOOwoVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9JjFHoyE9LZvvJ/Kh3UfPy/IHQwXMTQVFRHuSThoUhVSS3pcl5r7ZRW0ihWyf2v56QMHTG2lcgiOJJuYIsyCgV5yAPeuV/zMZwpJjbOGyTDXChY5lmtc/v7xQI2fcm7d1ofViWSZ8G30twz8ZfepYj3e2nLbrFZ6cagDZllKFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5mzyvha; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5mzyvha"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd82be878so3873765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026721; x=1789631521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
        b=L5mzyvhaVCPWevXOyHdAXFQ9kQRl+DnxY0Qy91UsffdmJs9pfjZJkYe15g927G+Uoy
         W8h+Ri6CCSNxtEFkg5FbCEMMfRavdT9Ar1Pf7c+lVdItNNiR6rtgHrTnpZnDPbZrafFK
         BFu0p28EPvSgAse8dLkQVnuE6Az5eCmg2XqUFfdAB9avYkytxbpGCrpgMhNrjMlpgfRU
         oqKpWnBLVu9hTMYId7t1baBoPWGwdOCdAPY4sEA8UOO+Ebedrf0Yr+nmy1LH1hYEnYEQ
         b6WGIFt3+cg02DVg49WagURFcfKkn7cl8iwv4i65/zrSrz9EVCBC9SGZArbOo0VNXKra
         owmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026721; x=1789631521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
        b=Ixs5miMnwtw+nfl6cD9/8EJoY8hWjYVqPz3Um6yU5JoSP6ewz0bfTz1omQbRROopsn
         37yPs9EgAuXyDsu/WhFTYqNHNRtQq+8wx+fUJI2KfLXURadlIoy5Z+Fq/2efRaREOjdC
         r1pqQgEEQIbhjgn/oaiuZKiaSDrwY+RmnLqbvS5+9Tb8u5pM4yyQqgfWrPfgYyOo5gh9
         hAJhvLWvUAdPhar2O+AgWLBPDXapOiYZJKz72kutQf0B/TXCnjjsbIxeMM79Ow8rnG92
         v8fr6+N6TMNMj2nNzevBgef/3fgLn3HrE0/LPlvw2Zh3Ycda7DxHgI4sxAPqHlcFKTFL
         x/JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMk8Wrf6byr1u94AQq5h5YEk/Zq5HtPWnIiiory+NDPGTBnBzD4f/2nTjBgMar6epSkvcpz1+T/m+h75w=@vger.kernel.org
X-Gm-Message-State: AFuF++lrDmVc6dFsDrOaUwGc6UM7msYLf1pEApc9Ipa17FWi2ErZ9j0d
	6wSQPt/+yK3g8gZzM65J1S5l8dNNb+f96waKYagU30xCplHr+pYKFiCF
X-Gm-Gg: AYBFou3vUS1Xx0x6qicmxGw9Zr01dKSFi1H8RmmXKHuWOSl5nZW9uSHEpTyj5cWfgaX
	FdRlq+bJRmtChRHzUyI748WtiYdxH3hASp4dVlGtnQoVp8GsyDl67XKj2V2OUj2uSGTNrui3+mQ
	tjsybaqgqsdlPAyrk4fkO40KrMixvj6LGX6nWShnTPj3iuwknjuBnbbuwVBtGMwNWW9rAmlXuCk
	m+dHIarL6+wBoJQyMzzy15cvxpfB8nMerc0wMT2dW02SNDCa6Ik3G2jbNft/d72bXWnYQ57nrtN
	gDVxMOIKJOLKq1eQ4qCl77RE8BgLpGDvXA05kecMd2vC9qP0NDt+eWhcxXv2YiyvSQj2MTg0KJ3
	Uq/4euSHzP+9qdT3NqU7+WNNl7tx/OlKXVSPC/IH0TrV/iuAIQxYlXvKg6J7/ddD+K97sSuWZhJ
	4uDvJtKoefgG1yTWU/lQt2ZcgY4jktWECEaEjwPo71K79V7ReLzzJzNDWiEAhJiRkdgkgb9rMqS
	84xqtDDYze1ylQQ87/srRXh01NQ50ClUfs+9HpnClefJOuKOJuV0XaCsDNkDJYMxGPzXxDcKhp9
	83LV
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49d01dce86fmr291744635e9.1.1789026720937;
        Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9146001C92980EE71198AB.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:1c92:980e:e711:98ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm251593715e9.4.2026.09.10.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Thu, 10 Sep 2026 09:51:40 +0200
Message-ID: <20260910075141.48803-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
References: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chaoyi,

On 9/10/26 09:16, Chaoyi Chen wrote:
> I don't think this is the correct way to go.
>
> I believe max_bpc should be handled in drm_bridge_connector_init().
> Take a look at its implementation. HDMI already does max_bpc there,
> so DP should probably do something similar.

Agreed - that is the question I left open in my reply to the bot. v3
moves it into drm_bridge_connector_init() and drops this glue patch.

Three points I would rather ask than guess, since it is shared code:

1. How the bridge advertises it. drm_bridge.max_bpc is documented as
   "only relevant if DRM_BRIDGE_OP_HDMI is set" and the helper only
   reads it inside the OP_HDMI block. I intend to honour it on the
   non-HDMI path too, relax that doc sentence, and have dw-dp set
   bridge->max_bpc = 10. If you prefer to keep the field HDMI-only,
   a separate field is easy - I just did not want to add one unasked.

2. The range. HDMI attaches 8..max_bpc. dw-dp's format table goes down
   to 6 bpc RGB and i915 attaches 6..N on its DP connectors, so I intend
   6..max_bpc when connector_type is DisplayPort, 8..max_bpc otherwise -
   the same gate Dmitry used for the DP subconnector property in his
   msm series [1]. Nothing is attached unless a bridge declared
   max_bpc, so existing non-HDMI bridge connectors are unchanged.

3. Where the default lives. 2/3 restores max_requested_bpc from
   connector->max_bpc after drm_mode_config_reset(), but Cristian's
   v11 71/74 removes that field [2] (HDMI keeps it in hdmi.funcs). I
   intend to keep the value in struct drm_bridge_connector and restore
   it from there in drm_bridge_connector_create_state(), which folds
   2/3 into the same patch. 1/3 is unaffected.

The state still has to exist before the property is attached, so the
non-HDMI path gets the same create-state block drmm_connector_hdmi_init()
has. If you would rather see that block factored into a helper for both
callers, say so and I will do that instead.

[1] https://lore.kernel.org/all/20260722-drm-msm-display-interface-v1-24-368c10fe62fd@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-71-bc12954a0688@collabora.com/

Thanks,
Igor
