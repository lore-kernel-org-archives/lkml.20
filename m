Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71403E49F3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318345; cv=none; b=bwODgayV4c+bZWbxEmDAmkhq0mtUcWXrE2vh2bw1nr8ESeUnkM9vFCRPhv2rORKoKkw87Z8OlVnb2oyc4NcMSGv42Jb4dZ12hTq7iSaZchh/0QJJD8iG9T0KrCoyi5y4tjRFNMtnZTN7RWG4NVQeKGWdLjWAMkbPQ/ipdBF8Fzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318345; c=relaxed/simple;
	bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uB38PBi9DV46WmdZeA52urtuyP9Ecc/XJwWfkTJFJ30yGTHdvtB+9R7DwUP8y8uwNXywle4H8107v83ei8ZisoccWc9Vk3nAHTy/LchCpuvPC2gJSTGJdsTrnZecrTnx7JRc3tE/mJrWuBi9y2cj9EnMv5X0vog3NzQNAzZgvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Jh1UEuQB; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Jh1UEuQB"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6cfed5dd083so2512779eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318341; x=1791923141; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=Jh1UEuQBze6lzMWpEK6tV4eV+tGkqv92lC4xXs0XkAP5ZJSHp4CM3QOiACZB+esNBG
         8UCvp8zP4X1iWxdNQiZ9rttPrUHMtvJTcNRlDIHlA/CWQTqX/MIENeKhtRVcd+iLr8GK
         GSfvqEYoiYjXE2fckoR9Fano67FuZxaTyT7alJMr56BVfgNRM8rSkoAUS+C49t+ONxAS
         iZec9JfBx2zjity7gWKcRXlBTCpcYgbfWDGWEv+QkBHhDmZSjwphfqptyTKFumwdS9S1
         JR+aozAlWAp6Du7vqSBPjMMGLb5ACBl+R2XTnM0NmJn76r3s47nA+4OY9s7g7aZ6Trrx
         PmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318341; x=1791923141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=Zha84uns9P84DPEglJ2zZ6sKPOnGioyCLzgGLCJUS/OyjEaG/LHOJeuekOojAImM/w
         7VL1JHko3qiyfbaVBxm8DWW03nM8T6E1VvrHS5W3BX9bRsBYagKt/8vCRpLGX5AzjqUP
         1QMY2PWAM0a/PadzqPzJlcQ48HLwFrdfgeoJAmoiPnjRgIc2kGCU1zFrNUriq6RTUOYJ
         e2TQYBl1Ugzu69rgniLbjU9J8OAYI8hGqRKLQKNNjjrxCkikhUbw4pfAz+sjL50CJoyQ
         eUa/osGyOmegfk+XYyRGEvMogCVudlt2t5D91ggOQTe75983mpKguzyxGVEf+f7IQHss
         uikw==
X-Forwarded-Encrypted: i=1; AKwUvBy3U4tZhs6rtN4pM+ZaI+9t0tAJ40h62vZrCrHopDqXk+M/gUt1hskJQWaaCeqZHekoZJ2wbf1Daoyb00Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nkeQ1Yxur+hu5WoqvSIyDDldxIhcXaMDWTFd+JlNxKso24z3rh
	MUSXJIWfW/SoHLzgEytVNsB58WXo9xaEBy1U5TkLJ0Rd3sIWootTcfSbwOyZxy0+GZM=
X-Gm-Gg: AYBFou0yHRGReTPC+P26jHVu/ECnT15vVs0uL4vWO2KJDQ4JJLWFFBDP2Mi/x1lfo/F
	t50W3DaxOzzh1Cbis9zLhNQBlPyttxFz8J15cRzm80LW76WT/sGMKRWV5taP9onBozgl58WIh7y
	kc+iZ8NuzeL27t8/lm1fCFwhC5HtgTIdrQ05gghlJ5XCuQzsco0HiGs1pi31o0YJjtWy/GykTWb
	01Jk9zz0zthMtJZNAMURagUPL7iTblIyb56cncB7skIJXTmIru0bSEkGMy7itYyX9vLFMtMNy2U
	/s7a0jLdjdDS+BTEdDeh1EWx3mL0tEw52hqI2Wi1EhN35M5flhhCHxNEfAjKSVtVpGPHkUi0vQt
	dMqaslFeJS1eZLPYwAoqRr4YhOSh9Bxr/I6a3JEGPKvm/YYUHJRDsgzZwerVytOimPxvAjqgaGj
	iIY7WAyZd9ElwRIYYqDxK0HAGxPuT4EjV5SJ/q1zAgnx4C8cf85kD7cxf1Qpjod+GLU3HHX3aT5
	w==
X-Received: by 2002:a05:6820:80c8:b0:6dd:696d:b245 with SMTP id 006d021491bc7-6e7a7185793mr353926eaf.53.1791318341561;
        Tue, 06 Oct 2026 13:25:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply for Startek
 KD070FHFID078
Date: Tue, 06 Oct 2026 15:25:00 -0500
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrDIBBA4auEWXfACE1qrlK68GeMU1oj2gYh5
 O41zfJbvLdBocxUYOo2yLRy4SU29JcObNBxJmTXDFLIoRdiwKQjvTDwW1cM9SZHhatzCa9OGzL
 eS6sUtDpl8lz/5/vjdPmaJ9nPsYN9/wF2kTCEewAAAA==
X-Change-ID: 20261006-panel-himax-hx8279-vddp-5dabebff2c99
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkes7QQS6aQ71ndy4RUpYujm7OFMzt2sBzSY
 kEu4bXRqfeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZHgAKCRDCzCAB/wGP
 wGuSB/44mamJHa1OYsjk/6qCu9iX+nj2K3lZ+OPUrj2F/Tu1EPxYNTztwaI0acbMEtPAOin2fWA
 A8UERPrClUfDtJtQXleqD4fA4k4PCtaUDej9JuJpGH0hwuJm7y/s8SLzyqYDDgx8vj+fMDE9xFQ
 C8DBJBTejRaGWQn6OSrJ+aTu4QkEVuoMCMsKtLs3rsvMgLVaPz0bfKummw3fPVfhnIuG1Wqf9CY
 BQAhcSUE7ntQRjbKr1VUnFFZ853aN+Zvq9RG4Yd/9n8KBIejxnfEwMHGgMxKOb/oI4bLK8v/o7E
 n5On7Txi/XfsGkgGSlQtP53KKDh5xDd6iYFUeK6QSIK21wJa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
1200 EVK it comes from its own PMIC LDO, so it needs to be described and
enabled. The existing Genio 1200 EVK device tree also turned out to
describe the panel supplies incorrectly, so this series fixes that too.

Patch 1 adds vddp-supply to the binding, required for the Startek panel
only, since it is not known whether the Aoly panel has a VDDP input.
Patch 2 enables the new supply in the driver. Boards without a
vddp-supply in their device tree get a dummy regulator and keep working
so nothing breaks.

Patch 3 adds the property to the Genio 510 and 700 EVK device trees,
where VDDP and VDD share the same VSYS_LCM1 rail. Patch 4 fixes the
panel supplies on the Genio 1200 EVK: its device tree pointed vdd-supply
at the VDDP rail and used the backlight (VDD) switch as the IOVCC
regulator.

The Genio 520 and 720 EVK device trees are not upstream yet; U-Boot
support for them is being submitted separately and uses this property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (4):
      dt-bindings: display: panel: himax,hx8279: add vddp-supply
      drm/panel: himax-hx8279: add the VDDP supply
      arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies

 .../bindings/display/panel/himax,hx8279.yaml        | 13 +++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 drivers/gpu/drm/panel/panel-himax-hx8279.c          |  3 ++-
 4 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261006-panel-himax-hx8279-vddp-5dabebff2c99

Best regards,
--  
David Lechner <dlechner@baylibre.com>

