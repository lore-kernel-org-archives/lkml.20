Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B24A0EE8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365705; cv=none; b=tbE7g3dOT9vxqCTK+FALp5dt+GYWR+/Y5/4g60lb6itO2HxG0rcsVpKyFE48KwSLRawltedMwlzlctbM3OnHReyUMWmeTaqhVZWRddnveAI8cAvsuInj5HH4J1n1cnc+dBuMGtO8c74FuuY3an3R807AzX8GFiwjdx9CYROWZ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365705; c=relaxed/simple;
	bh=vftQekZp2GnMZBFvM3gkgc3Ln8G4KJFFIDh72gnrO3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDm0dgxcBy02NaJQHegkLOlajD+vVrxk1Hwq8N6m1JdWW1db8/w5IEocnFZKdN/MqCM6b4LCCmqnnMce2KfLtgbWGuV3CXuzOwqS39MmpMQmU75pGSBkEDsKY1EeXxy1wcMYA7Crm8Azh+w0ED4pr4HfeGk/iGLA0qv+4lscDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDc8J7n7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDc8J7n7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so746425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788365700; x=1788970500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVJl7440PF78QFaSaeh/sCgR4xwST1VQbAj1ICZardU=;
        b=eDc8J7n7dzQqf6Hludc5fj07HtunXIEbf4oPT4s2TyRVHck0BiDq9zb8kKB+Lys/ms
         CLsJTXCvqWAF4AKbuOTw5jeGqNBQGU1O7DCuUC6dOlMGaoR9paPjZRnXMTPOjB//vT5C
         KW88Yp3bxcCl94A3xW4VXgJThDo1f1yquUO2e5BBWpuR/HOeLq58q17mGoXufSKeGr9l
         0Rvps1lBAytYN+g/5Pkxn/+dNlmJM7ElCHcgMLz+iR1XNHPiMfI8lsJHuSFpSXmM7KYE
         /9L3Yi2jK/Gl4gNE+d9cTnPday03WZUGL1qozvzHm8qIaM2Nyf65ygYJOV+4BYIBzMqz
         fmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365700; x=1788970500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVJl7440PF78QFaSaeh/sCgR4xwST1VQbAj1ICZardU=;
        b=jYbj7zAYHHSlfteCu+yu8goeYe60tgo26ejXskOb+mk9lQt6q0qVJ9qfURlzNov7Pg
         79ySCfSxwvrPwrvbxbulb4QDGhP9AeZuh8iZklzikU8vk45s2UkNcWI12Qa+atrwAsfV
         xK4GoDPK1GynTJGl7LAWJNBD9SS66zjCS8HcQt5HSgeLp1qcesZ7fOK8NKmetK+X3VDV
         Y0q55U1A+VBcvhLS+BBW0s0/x7wHEpwNE6AUf6eDQamnY8fA2VI+sA75rCJML4v2GpVV
         ubZJtZvn3/ON/USmtUxZ2C88T03xafDoGngpG5RAyg1Kb8q0DNmK3+8w+h3To2PjnSY4
         wXMg==
X-Forwarded-Encrypted: i=1; AHgh+Rru5EAWRFtl+1MjhiLNszUK/7wOrKpW0n0OIqTK0L1L09sd5Mu5uGyHwsTD4ZY3EZE+08+ArupK3r/HF7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ktm7wU841JJKSTL1tzzGANy3WXNrDkyPkrLYQc42SuuBM+OEA4
	ovwrWQi6Gou60c4/Kq9xQIqvbzVTPraI1zywjmq4/c1oWk3grS+ehXkQ
X-Gm-Gg: AR+sD11iHabNSOwNuHJ4NNsWmeTVZb5dPCI9FffDxz6NqGFWvgqXKoORxcO4ANdDSBA
	358D5npMbFrnwmPSOrJZjM8vK8OparSGwVeFUlBDSQEp+TpDxRoxAdnv6n0SsnOg6lQRmvEBS+P
	2z+AAkmKYtCXv8enAHlxNreKk2a73nA5iwD3rQxX0J9i0Df3xMeSA0fovI/C8SiKA9JL3WhfvlO
	p2gy8qdZFz5IrKMdme7Fw+pTWR1RgbY1Lm2d+fs0j4zEfuCtws6WSWBiyjtyedcXoD0aPgD8D6K
	0BVxxP1i5irZWVfNNI4hCHYbHwOJVTIxLBG5LbYaqeBP0HOfoewjFKLBjonHdqQfAcy5Tr0/dsT
	Q3G4uaHHop/j1q1kScedYhZMy9EN5TuqPgyVvXDCpqD5ZqvoNVfMCLXcbKcJ004lrzSlaBqmJGK
	3fsBRoiqV0kiid73ulOdOYX5D0chhUE8Ghgcl1acmZVdJ8Xro4xfsgysFOg6Vddtytatjj1qhBk
	9BQo5TbHGnCykuD8VeF1EjfxSTBOp6f9is5baALe0nzH3w7ibpUuKUsLQdyAQgyoOqRJLjelq3M
	eCM3
X-Received: by 2002:a05:600c:83c4:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49ce580365emr50281685e9.1.1788365699791;
        Wed, 02 Sep 2026 09:14:59 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B923800D872728A926FD7C1.dsl.pool.telekom.hu. [2001:4c4e:1b92:3800:d872:728a:926f:d7c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm1878395e9.6.2026.09.02.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:14:59 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Simon Wright <simon@symple.nz>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi-qp: use drm_hdmi_acr_get_n_cts() helper for audio N/CTS
Date: Wed,  2 Sep 2026 18:14:35 +0200
Message-ID: <20260902161439.5276-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <86fcf349-0a7a-4618-9001-612371b0f71b@symple.nz>
References: <86fcf349-0a7a-4618-9001-612371b0f71b@symple.nz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Simon,

First RK3588 report for this patch, with register-level before and
after, both HDMI controllers driven at once:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, both HDMI controllers

Base: drm-misc-next 47b823940e38 with the HDMI 2.0 scrambling
series v11 on top. The patch needs one trivial context resolution
there (v11 still carries the open-coded tables next to its new
scrambling defines); the result is your intent verbatim, -206/+3.

Before (table code): at TMDS 297 MHz / 48 kHz the controller ran
with AUDPKT_ACR_CONTROL1 = 0, CTS_OVR_EN clear - the auto-CTS
fallback your commit message describes. Audio still played here
because both my sinks are permissive.

After (this patch), read back from AUDPKT_ACR_CONTROL0/1 while
audio was playing:

  TMDS      sink                     N     CTS      spec CTS
  297 MHz   Sony (300 MHz max)     5120   247500    247500
  594 MHz   Samsung (HF-VSDB 2.0)  6144   594000    594000

Both values land exactly on the HDMI spec numbers, CTS_OVR_EN set,
and audio is audible on both sinks simultaneously. The 594 MHz row
runs on a scrambled HDMI 2.0 link (4K60 RGB), which I believe no
one had exercised with this patch yet. Note N at 594 MHz changes
from the old table's 10240 to the helper's spec value 6144 - no
audible difference on my sinks.

Igor
