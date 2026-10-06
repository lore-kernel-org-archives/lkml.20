Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3D41A928
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318348; cv=none; b=b/UzPxxEpbbMTRtrY4sR/edFs8bZqvoLmY7rEF/qyr47wH7fGJFpCpgvYZR3IOgEUMb11udsvx7e3jdiDDxakXBBLum9jgWHGVzpYqWBCDLOBolhDr8q7zcY9/b1miA9piSETS4dEWUoZ9Ww7Ikg24Bj+9pSnXja4dckJyPwo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318348; c=relaxed/simple;
	bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=heZUDqK0Pjr3h/4hL/X3n+UqWdo65J+NWIXjSR1kSVyOmMO0x9gUCAVMcu2yh70pVp2PleipYcir6TfKSYf5CKBW3GKVGIuvflw8AqVO+KcsL96JJB0pXKuLMCgSzklOaeUS0Zp3T0ry9eVzwwLImCFjPoAWfumI16mjphVXLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EQ6VdN6+; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EQ6VdN6+"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6d290b10a35so438691eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318346; x=1791923146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=EQ6VdN6+PBIjbqN1Yv/AvFu0aihTFJ8RPiAOsbtPs8ZraddOOLKDEyeFGB40qbJSuV
         FWXnRmH2Kmbe8TDWVeBpUI63mGg9w5d6BRror4rbOpoD5kOyWaqPEIWmv+NAWKNIVfhN
         KKpE6rO6B77eaivuDNwMwdLu/cNlVC0husQXNh2zZglfrBxgnkmRAF8mZ7V4WDQqQdlp
         ODBz6M2ZDe5IX7QQHTSsFNuKzFyhzve/09SmP6xnLi76QSm+/q3c+JmCi9IGwBI1WGod
         COvv3HaoRDf0BEnksP1Ctd3Y3QQhr/0OAO0t0qS/AAAa5R5oMv6nIONNdXHUEDZ/ejw9
         u4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318346; x=1791923146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=I9MhXu07YWpdSvrtBzqXF4zp8CXgZWC53TILIsUcyPV4ATzRftb6Ga7GoQo1au5Fro
         9zoL1ECw7dEYfq+8FhHXfMFC3ema3MQgkmYaY35BxJjiNH5PuLoPRVEPIH7XBAViH3L7
         EgRr5uK3Qgu/xCp7qb+HhQbdcIA/g9I8TNsJOCFZP/r8F08Tmvo1g0d+xEdxHvUeK+c3
         aB2iOZMiIWNjG9BG6Qtzq9L6DpmtLFwX4/WdbIynaHcI+jmcY2CdbX126P3Km/c9BW6X
         1EVhJDzNZ/pMdhjKef3LbFPZRvyQD/Nyv5eNcP5D11sGrHszhL6o4AgpUOsWp/P0OQXN
         +knA==
X-Forwarded-Encrypted: i=1; AKwUvBxLyjlLcIYaQFRtqV0AkQS8/59erSYwIa9AtTnKH0lNrZOz0K5YjuA8Q7Utcj8nIC/WCbvsdDKGEJ1A1mU=@vger.kernel.org
X-Gm-Message-State: AFuF++llQBz0FypueWgHPIWrVpCeWupHb8/oYsCnlXiLWSbbPPJ/Uz8Y
	crvPvdzBf6mO8N8a5FgjrovhjJdCCc8wZPYhpxnPG3AH9mMh0hSpjngpY7HQjL+dy9c=
X-Gm-Gg: AYBFou3ljsS4T1U5hvwSgZdskJVJ9sKYCZYQ2Eh5OYBzXDN/vYtla3LbyI7ls+KqsdX
	076hxwXv5TIAdwBf5TB5XWL8dAGhkXSXkGztowrTPWnTlVhwcxEMMt/k57OISgAkBJKHJzM/YWB
	bTRm7b1FRNN3042vfYaqv+4bP+eeskUb5HE2L38UsKE6isPlQtqWWe2ruOn5I4aKai99zSQXXX/
	TCjbyQ1ZYBe9LKjxBtPSwy9Qmh4hvvP5Ye83d5UweR1RC4vdkg8JSqRAQ6ESfGnPdGfCKbL5JF7
	0K6cTIU69UwpKtk8vf4i1MutoVJ+yBbbYewtpN2RHKe0TwK8L2rdW+fogZk8osAapQ30PZFX5XX
	uXSYOhlkSqcm0u/pA4ab9ZNh7vCXK0y502nc5ga+D0o7dnY6EwLVh1uaLKpfmMu9PxE+E1qBMKA
	/BycVv6VJpgpcKCBgCDvpe3SuO2ZK4sxEUXmFqyPnd6jXr2mMs9+X20oyRCaWxUUkDVFHPFzRww
	A==
X-Received: by 2002:a05:6820:1996:b0:6df:961a:af2f with SMTP id 006d021491bc7-6e7ac5151d7mr253655eaf.85.1791318345779;
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:02 -0500
Subject: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVksNR5t/ywYjewlDcdi0ghHLOdJJIGqzYu4S
 0FRGFjsMxSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZLAAKCRDCzCAB/wGP
 wCSBB/4nAAPLD1Yv3Td1SgrZyG8pm0J+BxnvcD4ztUnuid/60B8XkFmMjr6FQkqLK1d/baXFatE
 cbGI8eGxXtN9EELfUFzkaiI6pbFo9vOfFbKfurBWmbBbZqfRPcn2p1P/KwOT8e9ERwN3pJBgDtw
 IJnA7ofvPQwKGq+hg/++URBXqdhW+mxUBDmxQ5lrxAKGaRxYsDnjzMf9aLhuEGGceSHp46P1zX7
 guK6fHdEksNWYX+mLcopg1bP6zp2KmcaUalp9b1hlPC3s2Xtoq75Qas1m+fWyast2NbbU+XFCNI
 OcROe3ts3gEeZSCMkm8yhiT4SXC0JamLJMaY4PxVT7cnbLG/
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Get and enable the vddp-supply along with VDD and IOVCC.

The Startek KD070FHFID078 panel has a VDDP power input, which the
MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
the driver has to enable it for the panel to be powered on those boards.

On boards that do not describe vddp-supply, the regulator core provides
a dummy regulator, so they only see a "using dummy regulator" message.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index 9e443c719843..fe665cd3a3d2 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -112,7 +112,7 @@
 struct hx8279 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi[2];
-	struct regulator_bulk_data vregs[2];
+	struct regulator_bulk_data vregs[3];
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
 	const struct hx8279_panel_desc *desc;
@@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
 
 	hx->vregs[0].supply = "vdd";
 	hx->vregs[1].supply = "iovcc";
+	hx->vregs[2].supply = "vddp";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
 				      hx->vregs);
 	if (ret < 0)

-- 
2.53.0

