Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7F29E10B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975371; cv=none; b=dcOe6JyGTajV6foM+xg119e6xosCOxktmjbwxAWdMH8ZtyzZeQr+qdVY+LMtPVyrygOK5IcYgx94BMRE55W9qhemW8FbmH+PoGRaugQpj6uafJpwjE+Nli+5at2K6/fhshruOj4+XMaxcQN9VLrJ4InjXGbzWEYeT5bjSAaJ7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975371; c=relaxed/simple;
	bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVMD6CWN6eb8Bp2E4elMrIHioPxQ9KfhSSwKVerNKzVmrQrZeRrJpGVdYGHRaqjMQxAT+HXSdODi7Dud3jO1jy93xAaLSEPm6Bd5OBLwEGMHvjxGs7vFvnFShhwiBvj+VyXdNH8lUBv5HrEkzzS/Xn6aupbS0rAB+7+/480JUfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIfZy6hh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIfZy6hh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so2458365e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975368; x=1789580168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
        b=MIfZy6hhcjpCnoTd5xgZOHbx6gtGOkoOg+wVK0s7Irpy/w8eZ3Prvia751OIkGRtX1
         jV6S3KsvFi6lrOuNs+B/DlNXe9LNBIinyu+GPOnSh3pIBFQnBMTlS8+psE2Msqo6XVlg
         yA0ngBnHy+5y9EYkfia/5nWgYiUiujOpDwH5naJr1KdiPLdYnCvQhvVkIPhT96H2QM/c
         BHjVbexAFRgISY+JZyiXx4ezPfODfc1Xlbt8hJ6r5oByIrjYAFbhVrLTX8NLA2855Va1
         YM0acd3tOtVU7G7+ktpW2rOC3QHAaPWD+loZjhmctR6KhBJ8mRZuyCm9SCaskHPPvTom
         +ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975368; x=1789580168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5xZwe6BB14FgiUoJeEDcecfAKoT6SnPT8CWcokGDbQ=;
        b=VoJS0t1Q878Zx8S+tDfRqXLTu+bkCtALqSUdvjj5pJ6EWVT5g4gpzBnQkFQpMfp1Lm
         Ql5y/+WbnqukUOE4KiatPZE8E+fO9zj+3nrVd4+h8IL1FrIzagzdq5oKmqA1q+6w/ttt
         mlwjSIALbCaKPz6k7Dk5ReJAMFwHwaUYVvBeoJqCgi8E8tF8KwDYjAJjRzavK5ljzbJU
         loxG9L81uU1SWG8RTNPR3Blu/fsEaVNukCvmAKjS/pZ2KYySJkXeFSfkE9NNhorq4vSj
         brCQFUKRFKxWLQzxhpHXdD7qBaqHrYSNNq4vPgYw16Ed3YHoJgpNLOygu0mD0ZiXITyY
         uMvg==
X-Forwarded-Encrypted: i=1; AKwUvByySF6amAiHrE1rYsaqg6oNDVzCUDLs5LgSlinSLQCroda77EB/pce9AMgvr/TqcLSVQCP+RWUHpN15Viw=@vger.kernel.org
X-Gm-Message-State: AFuF++kDomydSiSt5mnBExM6TMxIg42a8luV75qoxmBTlQr5N5HaVwUD
	19Iy5OjxSNd10xqXbvLnG/7cSzMBoORkqNg1Qqiob/8MieXN2dCESzK2
X-Gm-Gg: AYBFou1M+FXFwFk+1YOKefjkCDZzDMjFm7UzL+zwjFBoPPPGwV7vb5bKnbCjI0/Euf5
	Q8V5u9ljo9eXKw80H87jFzdo8OUSxyAO9RfnBOrgJXgJbkDGwvQDY/3IA4AIju7MQ10Ji1HyiNJ
	tx3lCbGxhkODwOt3gn53jkiCO142l/qj3SYOk0MRJ2O41nZ5oZgV4XXnF7EUWV0JG/OBj1LWZnl
	gJkjWLylQX4GD/qk5v+BfxB3F2H1BW3thuY701rE7n5KFU4kaXj2fFk9Mr+Tuo2jbc2E6q7bCMc
	C3QjjnmLKcnlRXJbpaLEr+jamIw5s6ClalGf7RSNw40ZSwOe8lTcnvsw1+vWJxD6tJtgnA2+kwt
	KKFRWoWTxq7BQ9OZxILuFOTdJOwcjX0uvNTRU8xWn6SYoQmtaLhst2p4VcQPqpyoGQ3E4f2Cx1L
	RoYW85piIZRlGIHpSreWRjG3f3r83xz9IbivyDjklKFC1Q1ATLlZsynOqsHzZMIv1zqkB0pKm5c
	cWVNPzJp3MRBfnEA/5eZ88KZ+iIo1YDQM0Hfv3bYR7SmUfuX8tE6r6LZJxQ+8av3J50UQfEk95u
	jA==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr256409415e9.1.1788975368210;
        Wed, 09 Sep 2026 10:36:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper, and max bpc for dw-dp
Date: Wed,  9 Sep 2026 19:35:37 +0200
Message-ID: <20260909173542.14030-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three patches of this series never reached the lists. The mistake
is mine: when sending, only the cover letter carried the recipients,
so the patches went to nobody but my own inbox. I noticed while
checking the archive after the fact.

Resent below as replies to this cover, byte-identical to what should
have arrived with it. Sorry for the noise.

Igor
