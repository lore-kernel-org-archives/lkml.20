Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494013;
	b=VEOcaGz3FSyMMzD16wUdwc39rbc5F8l5RARLbqNxDQoZR2zkHF7uHh9raaTJ0qem+QOz
	 lczW3FEA1QG3ERP6ji9bhWKmwN+2S+pKYvLDeMq3nyQOYY07U5gGrJgS+GQ2oXrIuXRYW
	 2lTGGrVM3Zfi/SitqA4V25YQMqbjUNME2PlbnOpf6hjC6f2DhKgLb0Dt7LzBbSKTccCxh
	 yPe73GwaeyM2h3As9nD5tA1ygAnHybhPynAbWSaH0xXfEfWrLxkVBH1K/aIXvcvX5ty5F
	 7pWkVs9WiYX7pasUm4cAiPeAxA5Tq867m/QiTRKtk04l9RcxZ1aolUIL9+P601rG1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
	b=jjPFknlc+EQnc7Ug/0hX+m4Mm5WkggXTgFJC/beTgH1FWKzaRiWQ5GM7nA7SWCfllo88
	 s9f8fdcz2NDZ8wkLq4IcKp5yDaeVOrwAyGXh1AcSz2a6fcDYGJ2T3ums1ex8Vzj83mvq8
	 t9tNM3iJEDZIosV7EqWZUOHn7HzXcQN5CdbrqriJCrUuUR3XO3bT/rGlDzQVqv84yM+jH
	 jRlvVrUFKzPlgj+MlsIBA7tm/wSPpvjXRKU5wAmkrO0QvNkk871rpIsq5F92CBHVfCK9H
	 iLkOcktFCCDq9xoZGEF7Ny1Fm13F6H87gCUKeSUEoLZ1txG3mtbmhPZXsr8uP89Jwpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oQ+zSVN9;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DA8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oQ+zSVN9
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so3461644f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494012; x=1795098812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=oQ+zSVN9THvbiqdE8GiwRJNK+z24gZakVJfnzC+eqw25cdygzdehytyDLDTqQCFn21
         xE27tCNfqj6psPifjIiwgmK4Zy5Hh5HJkaCc3t3tUsdB9a9z5xCuWltnWvD9SWXQ8E5R
         sCwqzQcLRJ6fA2kzPZheRKdGc/k2JUZS7DZl7e/3axK5loEe5uUBMjjLQDJJ1AMwmO1y
         85LXArBhX40TZR4vFmDV3fO+BhwJZRJHM5RZfErNl3cBzukAKnzdkOMBD+qHtLNNpSNt
         PQ/N3LL+eU8385JeCA/eo734npQQfceHU1vDo5/S2VeIKWwGVStS+pyGD99hLpQMFWV0
         pm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494012; x=1795098812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvWhfh0tjT8b9eS/+ePbZ/29reieprsJmIKfK0jNE/I=;
        b=WAVFQ6rzNDdpl3vtLm+vH3cVP7hzDV3pjOQ57l1YEHioHuMihK3mssoGshIU/iNNUV
         pW/qn1ZJV58oaPbMmM7h3l70OYS4kyysfhBR8qz1AqYsaIP5OizGzZpRVCyKQopdL0O7
         4oJ2ciHomp8L5NUgy3BlNXM2rr+trwL9c4LnqMVDzzz/HC70/GSQyRYVqp8vp8WZloNH
         bztV6y2/WMbBj89Wg7XirMir5JyGZZH1DEPMtdyXhBzYVjYOeU5MSfUEpZy4m0BQ9NRV
         g4Kv9FbtztpwWkjhy7DmfFnrM0fMyrhevYSPE/RDYfliCaMDqQZ3T0POHyhHSvOyc63k
         Myvg==
X-Forwarded-Encrypted: i=1; AL+hErEXyvXPFSbUpEjDaCwHOzUC/YZ6CNHeogGq3avdTgUh3hMNbEcwh1byqWNgIfWZ8dMcYvwSlM3UBkvmS60=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cz3Yctyr0JMAEz5lPg5SzPWaArQR8vxaVAIIqiITGK8T66TOB
	f+6uIsddTHyT5TZaGkutElBg86rd21Z2d2NL0sqyLVR1v7k6xqTO1e2w
X-Gm-Gg: AYBFou2A8Q9YaxIc9YH1+OoG0ym79Hn2Xzn/tybKz7aU0EXzXAY2IOj1zGWRdQi0wi6
	5DaJFDZ9AMsdHdN61Kj/wZMLZuZ0bBFdk5Pp2q5rnguiN1RPEdh0r8l3UqWCC+sxJKRKM7pzcL4
	kcau6plLp+zrMLwBGdGcA+b+HQvT5lane/qB3ARU0M2OOkBMLeLKJtN+zzyAJahzjLI/0yOCTXu
	Hh21uhMy8LcMYTXrvaucG4u4Huw9+3xfR6pApL6V2GejAOV6i+WsEw7pcdm+wOWzNJrOIqyt0U5
	fclo67vINUim8zCPdPMXYUFkUdhtpHVfmTt796wtke3ZKpzt+5IXnClfv4UPAGZNKh7f9JwLpda
	8vSoBg934komcpKkQLDg1TZDRQnbaXPuFtJ47uZHdxAmRULFtvOKkIj6AHaIhpFAO1KEvB7a6Ud
	xu76GlA/+EBQtRIg79aD+GjRJkF1c63z+BbOj4A4TNP2sIyxi1A0bodyDCB70e9hU3o3X9IYW5B
	GNY0c5BAlzYzGGxE/qfw5wqMS+3Sn+SI4n0EPqjiyn5HeJB4Rq6bQZ/ra7UxE5w/vujD04A4eCR
	6MFUdqFrLcYabBwYpAd5XijOl2QMFbSDHP5mZj5TJgGA98NcVkua1iaLTrwSK47P3Dyi5kPlg4p
	uL3bkBZhi7PIL2GBh19JeUzF/
X-Received: by 2002:a05:6000:2008:b0:493:8847:841e with SMTP id ffacd0b85a97d-499c8982608mr10751462f8f.16.1794494011369;
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:7c57:d4:a443:9a65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm15590804f8f.14.2026.11.12.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:33:31 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/35] drm/panel: drop the orientation workaround from get_modes()
Date: Thu, 12 Nov 2026 15:33:30 +0100
Message-ID: <20261112143330.2576419-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026, Dmitry Baryshkov wrote:
> The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra DSI, which get
> the panel only after the DRM device has been registered.
> None of the in-tree boards using them has a rotated panel.

Two are on their way for sun6i_mipi_dsi, both A33 handhelds with the
panel mounted for landscape use, rotation = <270>: the Miyoo PocketGo S30
(ILI9488, panel series at [1]) and the Miyoo A30 (ST7701, not posted yet).

I sent a fix for this gap on 1 November [2]: sun6i_dsi_bind() reads the
rotation from the panel node, a child of the DSI node, and sets the
orientation on the connector before the DRM device is registered. It
does not rely on the panel driver, so it keeps working once the
get_modes() workaround is gone, and it skips port/ports nodes, so it
does not mind whether the board also links the panel through the graph.
Tested on the S30; it still applies to drm-misc-next as of 12 November.

Could your repost of 15+ take it, or point at it for sun6i_mipi_dsi? It
reads the DT itself rather than panel->orientation from your 23/35,
because the panel is not there yet at bind time. I am happy to rebase it
on top of your series if you prefer.

[1] https://lore.kernel.org/all/20261109160706.2272332-1-romain.tisserand@gmail.com/
[2] https://lore.kernel.org/all/20261101203406.1360656-1-romain.tisserand@gmail.com/

Romain
