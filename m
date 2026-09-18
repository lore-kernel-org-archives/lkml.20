Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com [74.125.225.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9267547208E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754271; cv=none; b=LeLk6tuePWPwBkUgxon5EYbeR94N7RZaWjki8iETcFd0sHrAm2eBa0s59fm3i3ZqvDVcU+6oeIrASjsxontW59VJ+/jR4YudJay6lYt8uA/Yi5lQp610Z+nXgmsn2SwInWyK/kYZw+QwPoUeoeTYes5J8iTFVDl+9n8j/9zqqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754271; c=relaxed/simple;
	bh=1Uh1f3Z956wEmF2q3u2UHyLztLyaLozkuEdPettpALA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p92agiuUKa3Sdnj2x1Tvt2B7mq3e8XC8jTmzKMG/OnZTdZtWM7/WaLRtUQlvipVCaX0JTTuGNZCLj4eDb0OUlEVJQmRScLYHzUlhEky3Y36cr5S9Da+gg6CorR5MrbU2JcYL0KciOlOHs1hCYzZv6XEs9I6yQrsV3AR/620cK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/EXPWRB; arc=none smtp.client-ip=74.125.225.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/EXPWRB"
Received: by mail-wr2-f27.google.com with SMTP id ffacd0b85a97d-4843796e373so594896f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754266; x=1790359066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=p/EXPWRB1gEJykv1aYDvIY2BdblMjduKbqtr+4Qdk0A2ODr36q5jqCU5QUP060jq35
         1o6UnAgkVdUtT0lsjinVtCpvUB1lBkUHz+yzG0ETqf2fxKJmIy+XFhEtmUjvGScBn5nT
         CCaHCqBqYNrXWKmUiW42r0DGnfFnYARjkRqopvPBqvFxCTumvcS7RwgzDKDUQSrfgQ+b
         coPopBK+BpM6Q+criWUeilqN/tkvZcW/VrTEhMRhH6jDtLV9zllw2ypFotoI9gDnfrkd
         3ZnJEPTdLP+9i/OM92cQd4ZZ7sU0EhOODKzRTbGfOV98T36/EYpsmPD3mZ4FrPbl4VHl
         jqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754266; x=1790359066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=fk5uso+tJXUSdanLMY06c3XpcupkVw6ZFLbRVgjYWF/3tVcgJZjsrhXvQBaR7v/bMR
         z2wXN5XN/26uI3Fwz42vN88M1rvRUHO5MpNMzzrmYo+IhL6qQLRi3JE6X9fYYyhynJss
         vnoEFMXpifDQ/4mjVawcZ/UkoZSXRRFrK1eUi+HpvbaDac0oDWPKbuInb2jpq1lMTIcj
         XFImHN7tCu7ODEhWkfCBgedPIvRzs/eODTMqTFjzKG4ufyIci0jkG03zGigmZsKv+NCx
         dm3K5MPccUD1/7lMUs38a/g4u7qKjSZ2byiDIK0k7+QcrIk3AT07Hs8sEYZPZUHfp6HL
         Ye/w==
X-Forwarded-Encrypted: i=1; AKwUvBxzqCX+ZMixkQqAg1ewNVYffDd++jXaDzf5ndSazfg7Ur6B3wDcNopgrmxYUtR7BukCDlPMbgEbBXnNvAk=@vger.kernel.org
X-Gm-Message-State: AFuF++lBdALns/2ZG1UTujTggExaoukIX9ZgMLxQef+j+5JTePZX0gCD
	h3zDesAdiX4MkYH5iuwn7q1eMfR3uy9QZ+JZ+xV7h8yzgSBnKV0d7Qxc
X-Gm-Gg: AYBFou235XAMjXJZqztUsnv3Laon6q7A2UNa6nsPel398DM1b6OdU1EP+aWad/hzaK+
	bc66oKs5CC9qN6kId62VnEeFq71vGUOoTMWqwEhYde2jEf6TxMuCK42Eq1p3o+18Ns/NiJJMO8x
	rl1g8u3n8vIJ4qcxcqgJ1nZCByRNjDt8/88BKcrHKxM8UOtK7zNqXbAFpiBw/Oo+0wbUNm8jwNM
	hryr515Gnyyqqi0J50EyLOCXjXZlwxq+WeUIuQhlMlycMAWnCewI5YGCWqcIT6TsAEC2JFS0qt0
	Tsf4+gRDpGAY325TT1BfCFPpGF8Qes6GSIELbtZl0lZrD7I5JEdgaPbpx1uHSVy93MnQ3keX+p7
	w7oMQS7T0xMVx/k562sxli3svYnEnZlb6lWKnIsSrcdyNfUnE2cA2I2kjXmipo/Ac8Zjs1Sv8W5
	uIjNpHq9ZnPTaGTJeJE/TvUadDQSW8sCptJZo12ljS0UEvSBrmkqVZTq2UGYf5Qr1xm+I=
X-Received: by 2002:a05:6000:610:b0:487:1681:2218 with SMTP id ffacd0b85a97d-4871e36bf5amr5507663f8f.45.1789754265990;
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Add support for the mt8167 display pipeline
Date: Fri, 18 Sep 2026 19:55:24 +0200
Message-ID: <20260918175736.355305-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 183 ++++++++-
 5 files changed, 569 insertions(+), 9 deletions(-)

-- 
2.43.0

