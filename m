Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59955259C9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962281; cv=none; b=jIyASZ1QTrnBmDh+YXJftr6Eq63jBejkka9qg6FhDoW7vAVVjrmrsoESfjGQUidYOVIox5+IgMsWxZjNeiu5V/PfYB5adh/krV7VROOVM78Cido7ugxHEAWWJTcVLzPBXpkua5JiyudcddkifMqB8hgjNsaHSKsMmxmtrBeWT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962281; c=relaxed/simple;
	bh=2oc4ITVXVK0Exx6OoR5Ug3N/01A/qNPfBJ3e1MRnxc8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GwzDsF0pTjxx95pg74PZIYvrNtwrlidCZHkUN5rOMGZPRBDiJ/pGwuL5Kge17X845BogDYWL+Jx9xuQMYKtsROFMJr+XwI2yhcok5kmpw7TV/G96UMAo8sdtgIe41EEWluyD4LjCxn1pn48XRTo5lKhg1G4oFWgvqwmwLsPb25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2+O7Nr1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2+O7Nr1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so7684785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962276; x=1792567076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=Y2+O7Nr1kmwjiVYlFJhBQE7p4V7dKAKpLVcxs6iY0TDUChMv5SvwGjvIxJO2up1F2u
         EOyjpy22uPVaMMmDaSIn29dKkeXEaU4gzllbRwvVFKJG18rQTF9Tw5fg7i/Kjt8BfXZn
         Fk5Q/q+vAAuFf211i239yq73kseXMNfPxjV0tEs76aUDTC45nNmycMgk56lj64nm0ItM
         /HYJVWV0G7n9CBWz97ergOXCAc7u0lAl5RIb3lgMfubH9drTi1p3Z21A1xbWRqyLhrQt
         0pCK5Au17wF0UDjMignMMRiBAczKFeWs6ift2N9zZld1zX6LTfoTw8cNJ0bSWgh0nrsk
         UlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962276; x=1792567076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=mNPqXRjqayxbRHx00oyn6GUgcPON+v7KNVI9l9sd7KUVDMDUX7m+GrnDHvRy664+qC
         AT8VwpgG/54weP0AXMUJstOvQBBgQVccKeD/YZXrHHK8UlWpsdWFiei8c3DZMXOknoP7
         B/KYKRt0GfE/qSB4yDrfNLXXIAQJ5YD1KJSMWIlIjJaMhDcJsGLro5bBGfeqR+d5fAhf
         Gft8J+WmRfk1ndVSg9ssH/B+iDkuEpwIwJBDt5GN0d6eHWZWlQqJLoJoQ+yCQrTOmmez
         lN1XMOm+ntUMAc32DxvZRkKrVb0tWcUNXHjpoFCyT8ath6Ls+bx2dNh4IOddWtSpwkOJ
         qcNA==
X-Forwarded-Encrypted: i=1; AKwUvBx6xDGn3uTO3Cw9vq1oPQBGNqLvs57CuzY/95CP1i+TVnidlS82YLBjT7pSYqLdrLK36sOuvcecNpo+ZWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHD0RQ8+aq7z7M52bRBKYgfL0ME8JJnrMhRL7Kfo17EmSq2xEJ
	q2DYltWz4KPtJbjgVHuoDXZt4Dcb80RQavymd6VFXhm2nkIl5xw87WjP
X-Gm-Gg: AYBFou2nqll5KHk87GZixajI+ppeMuG0Y3stIVoyMQlGQ3cUxsImXuei4xG4yVVOZPY
	dg40xpSUkEFDT/lUoyCfS3ks5drm9q36xBlY/9vpHNGg+mdYz8Z9EVtMUB8f/WnWj7JGC0z29en
	XuRizFDTySbhB4ondoFFod5DYM6HeqfQfYcsuO5sEh1M6jWE719ZxV9kfCQTAR0uS0MiSfkmaLn
	KQSB+pawwDIquTLRNz0E1EhxotnrRNW3kjKhugSOMftJpW5ayb3fK+wYf5HOulBh5deqIL08UY+
	lp1A7bmYQQBXbig4rFZ2QI/NmzwIb7LS3ZSECzq7qRfyL1XWo3QKrJW6ZJPLPXkT9S2gLRlzv7h
	pSiEa7ORLbq8y9q6GOulcGP3+UwqAZzrrTM4oizjthVWMGK681q1UXEK5Tf4t3U8vTK6dL2uTOx
	8UVkqzYkXTtxN5Hjtlk86SM5smNIcYWmfrrMefCpJxoDBta6yrSBQ5lQq4uqPNJcETyoeHB8GBW
	SG4jyNXfNuLaTGEMaTkJB48iIGjOifS6hXZ2ok+p/aUWSnrcwS2pTOw/p79UV/AMabmpIbAyJZm
	bgujbE/q/1087eThYAbDZA==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr296146185e9.6.1791962276389;
        Wed, 14 Oct 2026 00:17:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Wed, 14 Oct 2026 09:17:31 +0200
Message-ID: <20261014071739.216345-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: generalize cal_cycle function for GE SoC
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1851 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2365 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0

