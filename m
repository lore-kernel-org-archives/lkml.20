Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4C3AE6F3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045306; cv=none; b=Wh6Yj9sVZR+ulIRjkqPmlXgXUOMc9yHrt99Unm6DVQUFzQQFX/xW43NHOktv+e0US2e0buUeMZFYLUO7hSa8ri1Bbv6OZFDENAgK6OWVAuXawU2ORbu5m2yFHLGHG0wg2erprusJxmMry5jxDWLz16c+FWP8Wzf0TKUE919DYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045306; c=relaxed/simple;
	bh=EJ2P31Mop4LFkYlYUXipIp6N57OpGRj1yqrRk3odRS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sibl6NXdlbGHa8QJUiZeV6xEiGiJruQ183bL270f2d/iXEby51ksFVZdXO951Cb7q0uRELy5PRdkf2/BMvnNubhUmsNFE0coJTfkbt681sMLvlSK9JC5tGzDSMMPZivkMPuLZ8oOZxM+TvxFKpW5l8evOmy2ymOGcPKy9mul9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYRFahFj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYRFahFj"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so2527000b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045303; x=1790650103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fqnxRDPGydfMihJ2OX+RSCvcoKZzlenNPZIcztBjRk=;
        b=MYRFahFjRk2z1BdH+H+7bCuD5vDdbX6PgGIYL91N+Xog3LidK6VUQ29WTKXcc7ozp2
         IyzaozvRbzggCl9LSSgzRwd4jiXn77c1DZKNNGeJ7m+pIpdodl7I86KCGrurBEzm5Snq
         Nx01W8xdOgmJcXOa6UawI+x5quwF82dLUTZkNnbOaepXVJ8j3255B7OrGAj+6H3W0HHr
         vGaR3CtCxUxA4Dc/BSL4RnXLuiR2qf0ZkQxqAAirphsCSFThxysF587kNHdJUmpEJOGa
         hfeCRlEJAdWc4oY3FGtMia1k/8YxZEBKrZfCkT7JmVQpVKOk1o5WXwFIJWeucdLZwJ13
         cFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045303; x=1790650103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fqnxRDPGydfMihJ2OX+RSCvcoKZzlenNPZIcztBjRk=;
        b=EnNz1lzx3MWOMt50/TSm2ER+DD7YVE3wt57ol98zr8mPE/6uwp2GxFkSd6nzMoKwHx
         ci3lYPzJkNCbkVojOanDY4WMUpF8KLskDl3mzTAhTlbDHcixmp0Wmhn/uUjx2vQrLXTE
         XVlo72bf4v+Q+eABA+prxl7OulPQlHP9AWO+LR1QP1ICluf+yn/+cL/ZH++VWpUGg0I/
         qk8Dh9UuHjiIdLbgjE0IG01+cWcZLkVRVTvwx02g923FK8Kk/ExXOitjlPuA/fb4Olv+
         ZzRWJW41vsObe9FIDnDn/ySE9n8nRDeArRgFlKBiZSyj90GTUFGw/PFc9pOSAdCBXaOL
         RgBg==
X-Forwarded-Encrypted: i=1; AKwUvBxGnon7bye6P6Ia/eItguw1vVfvSA7d5DdNVyzwGM9TPmBuCC3YpFSyOKTQa051IdexPGvEZm6B1AsiyH8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOzPmB9+dV10jErIn/xSlTBPK64gompbRviAGnJohrfz/mV9P8
	NHY63oc3MwIW7lZoydM4+QHULOFXPPL75QTNx96KhPT86M7d4xfoYNa8
X-Gm-Gg: AYBFou3uCutHxvJ56e1FFm0GPs+07vxzC3NeIhsnozj4kDQgSaaPYxIptGglA9vYI4I
	8whnlumxX6XwsxB0AgKZfIH1HEf7HP7YF2unaZ4xIrtTOLzziSQPMOsJDWc9YGjCqnnpyy6yzpZ
	9eRIqQnJ0bGMT82VFZJH8mRYEHlnbq0ZtwVrlNbkwEQNIG3babnnZqWuyOeFIBHXFYmQnBt2yBE
	9KgGVdmirkcdJa4geGDmXSDMJNXFW00HZn3Ur0RfUFC08VBTY/zCHOUdD7oh81tluDbS011HaXW
	kREp1eEhG7GxTd6BvtXn1YxxHzPiU37kf35LtviHDicgXmk4g0THVP50Ti5b9wLSh3LUphbRRyN
	MfHVPMnddY78m2/eAIP3yV4BSlq7fKi9fi/V6HNXwwH6sapvd2MOLsxrigaCEM/6hfIw2+l8c6B
	0zt3i1yiCdg47z0C0rXYhjMC1e8/fOPp3zLgGKMMkOSXjzcYZvXS+9MvhV6OembXD1oOqxR1Sw7
	n/YnP4=
X-Received: by 2002:a05:6a21:6282:b0:3dd:a197:7362 with SMTP id adf61e73a8af0-3dda1977457mr14288897637.59.1790045302885;
        Mon, 21 Sep 2026 19:48:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a18d4fsm115091a12.11.2026.09.21.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 0/5] phy: core: Use EOPNOTSUPP for disabled blob return value
Date: Tue, 22 Sep 2026 10:47:15 +0800
Message-ID: <20260922024724.191412-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the phy subsystem uses ENOSYS for dummy blob functions,
it does not reflect the function state correctly. As kernel already
has EOPNOTSUPP for disabled blob function, replace ENOSYS with
EOPNOTSUPP for a clear return value.

Inochi Amaoto (5):
  phy: core: Use EOPNOTSUPP for disabled blob return value
  ata: libahci_platform: Adapt the return value changed for disabled
    blob
  usb: dwc2: Adapt the return value changed for disabled blob
  usb: dwc3: core: Adapt the return value changed for disabled blob
  drm: bridge: analogix/dp: Adapt the return value changed for disabled
    blob

 drivers/ata/libahci_platform.c                |  4 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 drivers/usb/dwc2/platform.c                   |  2 +-
 drivers/usb/dwc3/core.c                       |  4 +-
 include/linux/phy/phy.h                       | 52 +++++++++----------
 5 files changed, 32 insertions(+), 32 deletions(-)

--
2.55.0

