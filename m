Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673491;
	b=vhj5KL69I1Wcsd6m+mdk8sH1DWoMlVN5scRpc6Bw3uyPDPPUH4rC6uIThIksPQb27Ap6
	 G92uuoVjeDuZgMPX8vm7Etg6Q1shZZpRsovF21Mn8HSSuYwrjRlvzO/lx4vZUZqWg+DHR
	 q7IAZjWMIDCxxPUBB3AxlLpNphxmY8tHA4yHP1J0O/y/D7+i8PCN2MY+qdvwASisUHvDI
	 XBQgzpMvqcag0VF9F/++6vlgxsCetmYO1mi3j4bbCAhHxFQgdVMjRi2WtSbZ4niejoOX7
	 lR/FQ6lmR6vwnNHHOKpIcgBzv+TLPHYoxmhTq7rTf00z3eUz4dYedewgRyDUX+5IH4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
	b=O8bh11kMQE8FTDfmFi9Jqh0JF3KAa5jdRRbin5XwO+XmCvNebPnF5pSUVCMiDTMojLpk
	 5tMOoEU4QsHlwpDpVijUkQAg7gu8XmTB/IsNbdocF8iKihLx+LzphQwUbgcu8sad1iooK
	 MH3Ybkka63wBHLfahxbkwzA/a9D+7WvC2DUahQSvwy1qIPT0h3eDznP1M7VaZY/WE5DXq
	 lrD5LpNIP035v9wkDlThVNGJndGgpY5bf1PTI+f7wUGzg7fbk8IYUsn3uzU9hBFWCjdDj
	 v56GTH7TUPnJgDIbztt2iLZjisb3fxHZa3xhRJGMpqW4i8ZBmnyX14qPSp9AUCVPcgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fili5sVI;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB893606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB893606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fili5sVI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so11855165e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673489; x=1793278289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=fili5sVIP1r3gAqZl861bvY6WLGDKWF2AK/wry4jhK5MORWWPuQxgx4q7NA8Z2ODYB
         dbxM7oUzPnnK8XCQkES7W3CI1Yv7EvM011qtfeAkh/sL0fLxARGwZxKIAPi7mCuM4Xqj
         tSKO8KYWMzTuHEbZtEblWBvq8w59KkBglYgdwd0OY3zpGo3RlzJ+cBuxbF8VPYH7jmVc
         t8t6PNTqARH7eXoX1nviTckze/fVjB4N7tztH9ArnN7QzW7Y3NJtQN0ivDOd6r1oaeUn
         2yV7ghIS5pCoSz2zWSQ6dsMlUSH/8pBFjFwOMdFDiOln/7P9/WUCzZXmOROrSjVZB3Uh
         s1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673489; x=1793278289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=23c8GqmjXGdoCNbOW44SzOE0x/HA5llJlH1T2SY5jnerHzOOfhTvzzKauPH2+fiuA+
         gvzx6vonSjObuFfe8W8pssKS6iA/FbnXqVB2+tot4wzrKvmeHGepUshlqEbHp+AJwAVH
         AvHgk4weD/wTsv+XimKq79XyShZh+fpjkQTbucuN7FslU6oL0QLNzvq8LpJJvMgR5Mw/
         e9uffVqZBETyLHOgXQf7WLRJ3YRkVy6u3xcxj1jz16e2HZ0FKxGnr621jkwnN7TRYPow
         LHHSq/be2C35TtAJRq0znLYuayKx9l6fsWR6yXWay741h9Esp5Kv4byH0orCuz75tqo/
         o2hQ==
X-Forwarded-Encrypted: i=1; AKwUvBy787nXzb8JqcGRbyPvfrXwTbII/IQANuqAJ29Fhuac0o5LxgPtKLFAmLpWcxTvSGWN5zvlHu2tHigbl1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg9suV+cnkPgnAZzgMDMSLZGmqo7WR5iNXEb8rNstxmyC2KKfB
	Sr1IqkwIBC2DY/tPBdgOGzKzEEwrurUJkzFbMCM0ijNCg+KdU2gzt51u
X-Gm-Gg: AYBFou1K0L6ZT++76VzX6vG77HQMoThkAPqhtoL+2OdA8YKlA9Xdv9Xr8studbI+Hs2
	NiGH9cIx7zsdvvGtr7ApSk2f0eFVVo9JLMSnIHc7Kd46LvlcHwDZbss5byP1daetx8sYsiaduRC
	f2J7zdMJ9xqo3JBVpolgx5b6Yodnh4JkHnjRQk/eqEbtP6DT3gwwne9S+yYgqKXcGJ0tYJukuRX
	uvx9ngCdkcMwLfLRxeicj2UwGxNL3aaJ45wIvqTRP8mxar/x3O20DE0WdJkRalNjiwlk+nvfgy5
	eB12jfP2JAsyhsKJxg0iGpibRm0xPTG3GmljBmfzxax9nHhJQQuQmbe1dSpZeg8NjkMMUMefdok
	hs10qfmoummrFNPwoVtgef3wV2BEaCdqIeJK2Vk0bXFG69UuGzKw3J0GazxE5508CGupnRWwacg
	TJXlVnG+73PDwfUQo1i2awogcE0eGIKa82jmSCOkJH+Ad6sSwwAWhxszIfv8aOC5q3IlfEgBHMw
	PLqBcXyhzN/0oAg+k4pkE+qMRBKex7yJYX8Ljid9BKXOMbs+2bUKB9NMM+UNucFJcaSDiKWJS9P
	MY4Z2bMK3p2xT5cP2yVFHhczGrCsT9voUhXucPjiGUZZ/DQQjRSSNg4=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr127894895e9.5.1792673488922;
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex NAU8822
 BTL overlay
Date: Thu, 22 Oct 2026 14:51:04 +0200
Message-Id: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgG2moC/x2NQQ6DIBREr9Kw7m/g2yh01Xs0LhC+lUTBgCUa4
 92LLt9M5s3OEkVHib1uO4uUXXLBF8D7jZlB+y+Bs4UZcqwFRwFuWsHrn5SI0C0jWFJYYyW6vpG
 srOZIvVsv46ctPLi0hLhdB1mc6eXiijeQKVrnT6WcZvDBg9ETRQ2hNKPeEkTSdoMsgJeKm7oyq
 NSzfxeltrQ+TJhYexzHH0xT9a3IAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

The NAU8822 audio codec on the Toradex Verdin Development Board and
Apalis Evaluation Board V1.2 can combine its two loudspeaker outputs
into a Bridge Tied Load (BTL) output. The overlay selecting this mode
only sets a property on the codec node, which both boards label
nau8822_1a independent of the module.

Instead of adding identical overlays for every module, rename the
merged Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso and combine it
with the Verdin iMX8M Plus, Verdin iMX95, Lino iMX91, Lino iMX93 and
Apalis iMX8 device trees. The combined Verdin iMX8M Mini DTB keeps its
name.

To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Changes in v2:
- Split the BTL patch out of the Verdin iMX8M Plus overlay series, whose
  display overlays are deferred
- Share one overlay instead of adding an iMX8M Plus copy (Frank)
- Also replace the Verdin iMX95 and Apalis iMX8 BTL overlays posted in
  https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com
  https://lore.kernel.org/r/20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com
- Add Lino iMX91/iMX93 combinations
- Link to v1: https://lore.kernel.org/r/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the NAU8822 BTL overlay
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822 Bridge Tied Load

 arch/arm64/boot/dts/freescale/Makefile                 | 18 ++++++++++++++++--
 ...n-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} |  5 +++--
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261021-imx-nau8822-btl-de926231bf78

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

