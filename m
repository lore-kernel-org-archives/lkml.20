Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD744E021
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511514; cv=none; b=RKKJLxcK47o37P18IW4a3zmrBaww30O6Ujbv5h4kqZg++GfYv1TR/rXAUx4/XZNkMHzN8IT/E6VdOMw0k/h6TcPhoUwpOR3tCv6sfFg7Lwue3dXZwOEmyLYat5YcA+GHL5+hOE0UupfcXoyh6p1lY/dT55gyOXamWm3fuuvWb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511514; c=relaxed/simple;
	bh=vq9B+WHtR7YcxOfQ0HtBcAM9E5zRf5ErIV6WMfZLrhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6SP10+WLQqgLgv5DQvlfm76UtYMOKulaRAmXEpp7lBvBfkLzAUizULJ6kIgrFzvBefPU0VC8VX0K5qHwWEXrCczbPxFEPcL7V1IUhW1y6Cq1vs0sXs2xcsWILfCcQ2wcNvjdD2yoYNeM61ZqHKHO9ULI09jS3S17h13KFkuD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VckqRcbO; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VckqRcbO"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so275272a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511512; x=1790116312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY8BjpTJUvWkhY18qZeTDa5Pr7EX9PKwjyY0lXAdA+0=;
        b=VckqRcbOZ76p9baLN0i/tU4UeInXNMe1NOx2/5EtnFdLjZZch14O16Kh85glM2DYA8
         k/V8jbc4YnzXJ1mLfs/154OlhgxF/aCdpGhTWjeWOnF5dk+qOc68n4Ye1t/G2JQ2Sgwn
         rwcyvfUdmeeKpppH9MSedwYs3fi3SrW/MMZ4MNQAnhfL3hwvyxNUnkvLHUPLQ/P9swel
         Ajj0Vg17vzBSJ1UgCwzwdLXhEvaFHiLgzKwSSwtyTt+54Wf4PQxSw3TWgJwgRu18zrGS
         rTGS9drf7empPlX6Sftmxz+KYMt72XmQWwSY36lJTDC/WchL0hqUPEEgymova6qIcHtU
         sZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511512; x=1790116312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dY8BjpTJUvWkhY18qZeTDa5Pr7EX9PKwjyY0lXAdA+0=;
        b=eWHeESbsIi9sDwDRoNF5+k0+/hjWwUBCDmcN3lg+AnoOKAnLiM9t6upJCbE5qe8wH5
         7lgNqbRzD+ShVnb0uZ2GLRHkYJLNqE7ucMlhlpSIUHptcosNBouuSi5k3NNPzZCOk02Q
         7iPk1TZFWYfNsovvkelijOybTfpgAz0nrAdqUG8FsEmbh6qUekspELIcfHJyrI46Q7cj
         V0y+LpDLK/d7d3UpBRovQekfBc+U8UqGXmYXQ0xWmPofV/oAcAONwEEb3GCJzcAKynlh
         4puthIXU5NYvQ1bD2MPVVkcIQGUIVDXPVH+1Th/7l/C28VApkfOHnBKj1ugoU7RGdG2d
         J/2A==
X-Forwarded-Encrypted: i=1; AKwUvByqI44ddnOPPUEvijO7JG294ehoRDT2mjBo+/9lxiPxPvN7MXZ294xJ+9wIWf4LM7P4LqbIUsuIo+2+Qnc=@vger.kernel.org
X-Gm-Message-State: AFuF++klzoYCwQQZ3QRWOQlDqXhCfAbR1MyBuVScgJjTDL+cuxn0CACx
	KRX0buzLOJ6B7GSnvvjNMjVLdu3188pzgKbK879Lg0HUjkDndZz3OmA=
X-Gm-Gg: AYBFou1ukfuLWccBrqsJ/NnJcHcVnQJ/5UHsXXgTiDL5duRM9IwNtS0BPCsmdLyu6by
	Agb2dUkzLG6tq6N8719OGEeKj3vgm16pXpLRzkaMZV7muPhxKWHU9o1eZEX8CXvRM7FYL5lMN8i
	ay2w3ZarRkVfVz1y4h+3M10UQGv+htwygyUfn3M/cUX9WhlKkEbpiUcc+p9XBe3ITBVJBUQ6r3V
	42h+jPGlhFOa3yJmOonxXG87Dxv+IZG9+uiKes+Z04A7cdltMQ83274tMIFednLWVMbFfHQ8gVQ
	20SUUSs0J5vtWkjLHz9kXVz/O5qf1MBq7EYZbZ58YA69BE/isufAwxeKpPuPqDr0jGyIDMqHj5L
	VePavVzPKpQrAIZ21Irqv+/PkRHDg9MWooKi2Na855ChPjo9JHIw/ZvaJ5zYP81rIoNERK5GYoM
	3qnCCGN2tWiN2rJUvOxF0uVRq2mfe08fFqqBY0HX+Meu4yYH0rADfyNMXu4sanmz+sYNULQwpGZ
	6N9ZTd4xYdEsaFlGDEoUf8gug==
X-Received: by 2002:a17:90b:4987:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e1e4d371bmr651073a91.21.1789511512282;
        Tue, 15 Sep 2026 15:31:52 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:556:537c:f7cd:8a1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c337e97sm208036a91.2.2026.09.15.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:31:51 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH net v3 1/2] net: phy: qca808x: accept the active-high LED polarity mode
Date: Wed, 16 Sep 2026 07:31:37 +0900
Message-ID: <20260915223138.321307-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
References: <20260915223138.321307-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
added PHY_LED_ACTIVE_HIGH, but qca808x_led_polarity_set() still rejects
everything except PHY_LED_ACTIVE_LOW. An LED node carrying 'active-high'
therefore falls into the default case and returns -EINVAL, which
phy_probe() propagates: the mdio device is left unbound and
phy_attach_direct() falls back to the genphy driver, so the PHY loses
every qca808x-specific feature, not just the LED.

Accept the mode. The register write below already handles both
polarities.

Cc: stable@vger.kernel.org
Fixes: a274465cc3be ("net: phy: support 'active-high' property for PHY LEDs")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Tested in QEMU against a synthetic MDIO bus answering as a QCA8081; see
the cover letter for the three-arm table.

 drivers/net/phy/qcom/qca808x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c..3ba58f14e248 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -603,6 +603,9 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			active_low = true;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			active_low = false;
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.53.0

