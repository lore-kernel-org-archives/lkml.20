Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F647D94B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041876; cv=none; b=DqX6evmFq3pFMzsV+Am+CPTwMSp8fKclhZh+/8/prPB4x5ZsyV/UhDe7sTblxTlBer7VWePUw4iqr2kJgKvqu9IZ1IjE6V8fqFs7HWlOOe12jZjhXw7eUdFQVmF8JOeKQd5yLUh0kYzqqGEkLVWZwO1gra2VXdjhFgslgNB3mlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041876; c=relaxed/simple;
	bh=GslP+f+ysWexCMuLLbjgqXDGxcxg9akayxObM6R26so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYMJcX4OKgW8z4fq+TXMEDylrJDXpQ+bZfZq2+/gTP1yHwVQ2WFW0wwgVRJC4GJtErpXevu86g4rcFQzkPStgqPvI6ZthXbdqrV5nBWXIXLbRyscOrM2lrZ6Sj+hZZsXisYOzqud8OUQUTKS4i8oJA/TYCnSv+C4qj3H3NSyNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRsYC03t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRsYC03t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so4106865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041870; x=1789646670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csxrJaNJi4tIfZjrD+uNlOFumjNYljFKlQuyLO7kEBc=;
        b=bRsYC03tJR6bnFeWR91i2l6evdhcP8TzcnCgkgMvfjH1ZARY+1a0RPef/ufZTunREx
         keQ4AFocJUNRS7ZJt7Mh3Y/B+PRmXxcZxwho813GJnrFCc7py0ysw8BHWI9GC6TuArda
         n+tfm+oXp0GpDuFouDs3Q4pXYNr2uLmHcjpjrIqp73mz1FK5onJMr6UlMfRT7VnFpvfD
         SQN3yLOXHyGxkhePAHr6d6nWhHPrjI+eMBf/EbpH1TrL6s0uSBI95eOu3sl7YwvxRRwH
         MCBVhfvrvQs7MgAwoTlJIur05uYojdPawgUtuE2Y0B5idoph8R6zJ2AJkDYu6oXp6G5a
         NBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041870; x=1789646670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csxrJaNJi4tIfZjrD+uNlOFumjNYljFKlQuyLO7kEBc=;
        b=VolpmjKYP9FGuoPSicVYHoWNDJfLe0L6auz57ZNShOtiVAtfbA927Xgf+2pZJwnFVQ
         Kl279ZWaPoThkW5m5uNNj5eP5o9Eh6cz8xuqQara0ZWsX5srwH8nhz7pDGFfEIh5YsMO
         kODsrpmQPFmKeiaQPbZ4lf+nJFXcWW6Mn0xYBUVEqLMvXaInRFgBUqjJP+H5ATpW/LGh
         yDH1q5Dmmrt9i1WFLAIJ/gwVjim8lown7XHx1D2EFg4VGXBfx7k55B8SctusXo2xvP+L
         8U+JwXYXQzK2e5qzRyrxIngAGAfyVYrjLHHRHlKxoC9IAAKYRpqNIDYv8fOHnVHEDZ++
         vKaA==
X-Forwarded-Encrypted: i=1; AKwUvBwurinsMvXuICcUb/zo2zGj2KjW5yFa9g5dljI0Wtn2dvjucrNik2BI7+PFhI/UkooC1Tl32mA1JluCXHU=@vger.kernel.org
X-Gm-Message-State: AFuF++lLiyk/Ke1ibahAOUrptfxGeLFMNTNtIErRYwIiuVUzBKKdCCMD
	DiXP4C6tO+WuG23U9m5rrWf5N2t/V6hoBbpOaqgDOExa6Mze2hiJzl+z
X-Gm-Gg: AYBFou353X3pSuhDeYiknuO6ZGN4rgqHCeG2Dkt4VVHSHJuFaeWDn7PIi02zHsoJLDR
	eF7YMVHCuwoTmeygir+658gsI+5lZPE+ZnhXLYznkAksNrzWw5QxHGcPa9z6v1yKM/qEHh8Okhn
	PZ8yG517FEQ98XPoSjOTWrRPiZLO675i8waNv8DAg95xTT1kxArDkIP6AQL0b8bHyO0QSRIQ06p
	QEsRL12K/rp+R7ZeWS1Lz3woljZ6UsgXhtCCVYHCC13Isw3GWZDMtC29GWghiDZjZczY0YXVM6n
	YJkxqtV+Pt4r5oynapo7ofx+4Nd6fM0r1CdqlM+rBG8K/Lj3HqYNOrmOQYx5iE9ztHQ90nc0pkM
	29qTHXPSpeba5Re0y11VF4uR5RisfkfK3THRJoYVtPbSWDPR3N+prruZ6ViIsp1gJBNdHIYEdAZ
	+yfHKaOkH2TrmeEVL+9W0Iv0snGhZheGblE1YZOVRIbxSgMaboRYaT87mq8mhUxwRr4h6ohrNzW
	2TW03I95el8RPDskLzIjs4wQSocMw/TpHSH84Jg6FQ9BqMqRGzGTVmBKULVJlOcQty+K/5Od2t9
	xn63
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr308061045e9.0.1789041870300;
        Thu, 10 Sep 2026 05:04:30 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9146001C92980EE71198AB.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:1c92:980e:e711:98ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm34529530f8f.0.2026.09.10.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:04:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
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
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Thu, 10 Sep 2026 14:04:06 +0200
Message-ID: <20260910120409.63850-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <388fd1ef-a8c9-4419-8bf2-10af7063e734@rock-chips.com>
References: <388fd1ef-a8c9-4419-8bf2-10af7063e734@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chaoyi,

On 9/10/26 10:16, Chaoyi Chen wrote:
> Maybe we should consider adding a new "DRM_BRIDGE_OP_DP" :)

Works for me - it keeps the HDMI-only wording of max_bpc and makes the
check explicit. So that Maxime and Cristian have something concrete to
object to, this is all I would give the flag:

 - DRM_BRIDGE_OP_DP: the bridge drives a DisplayPort connector and
   fills in max_bpc. Nothing else is read from it for now.
 - drm_bridge_connector_init() treats it like DRM_BRIDGE_OP_HDMI:
   at most one such bridge in the chain (-EBUSY), max_bpc must be set
   (-EINVAL), and the connector gets "max bpc" with range 6..max_bpc.
 - dw-dp sets the flag and max_bpc = 10.

The connector itself stays a plain drmm_connector_init() one - no DP
counterpart of drmm_connector_hdmi_init() - so bridges without the flag
see no change at all.

> Perhaps @Cristian and @Maxime have better ideas?

That is point 3, and I will wait for it before writing v3: whether the
create-state block gets duplicated into the non-HDMI path or factored
out of drmm_connector_hdmi_init(), and whether keeping the restore value
in struct drm_bridge_connector is acceptable once 71/74 lands.

Thanks,
Igor
