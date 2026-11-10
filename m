Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308359;
	b=hkNrkPpQ8xfmKANgjeh5vBALXAMSsqw7AmW7fH2cvKTleqq2tYJ49IkRMZ55DB7BuTam
	 PJt8z2TAYe2ILrTB5ecB5PQAGTPAOrnoJ1w1hxnTWSVsMFqPB2ELyYIeOu0v3U5f7KF2e
	 u64akXeiaQkp8r7C+hc3d3PPiRkhke70JOfqbhr25B4hOZIDOuvfRiegk/fa5QqK6O79h
	 n1jJD7Ebt5GDcK2oWI7d6LbS3uZ0sQeO4SlJY1FHc6rNtR67NDc7dxHvBPbzxz10ntBfs
	 M3Te1JcvbmP0CbYRKNLtTPJvbnctsZH7KptyX3Vjyo74UwbY0YCb95iZQJY+GNZzxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
	b=aqUjw6ptrumeVKBq40/PIswsBp5YoSxlURPmbzEeeSwJmlSVWduPSStuJBZMhTRY4xsU
	 myXgcE4qiTu8iXlkPIlp1WRhQTiu2IT/RDIYiYAAea1Ay8sLP1/lsID8jvaUwgVJMjyA0
	 Hkm/V60tPrJLM59ayf3jSndl9lmWh2jGZdw/IdkXSnIq7+KPPwbHzqlyoyej7yHWNKL5s
	 iPfU80BFrQK2cjpRvh1YtLhONjbUtWjoiIU3KiBMBs5Gw5irbwAdoDKHVfWYuATO2fVup
	 44P5/HSflufLCHj+5CWJ3IjHGiAbALRhCGGdJnFMRtxZHt69AdFPIL17Xh/lXtMMoIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFX9nmsa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA795606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA795606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFX9nmsa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15789205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308357; x=1794913157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=oFX9nmsafQAby8rQXTG/WkdaeqxbPSJ8xyjSHrFnHgYfLLfMf0MAmCOKX4sC2bIvZX
         lanifnfXcoQ6fHZRqustCSmHbExYQ3qxBUaOhH7NHZ/yf7/ZzSo7o4C2eAuis0W/U7cR
         LRS6vErXjiKGUYjGx4Yv5/zCT0L8oW0nhZnI1OpZoy/ZPdYyPYlZCLDa4mjM94gPPiCP
         54O6F50PyMrzWywTH5v9YQtUN0GtFFkOMh3E4wdB3EA+tnlXkagM5g6YbcuKXOodHXiQ
         g3Z7a6HzhqVBKrdhEMEnGhl9oDeIxac0E7/3WtCz41sM3dUNJFlEk/J0mBVI97CSsiFh
         H1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308357; x=1794913157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=O4VEJYMETxcCDr92zq3uEh66ZSRuHN4U+TMNEB/ibxEu0aiCMeHg4LhNlKdyZxioHz
         h383YtEDPHZKytJ9us1+snGqycq8SJhuqdYxHjCIb0uo73AVzTsZLyXCRq5bFbdzntWR
         aOC8gVqSJ69QpVHmKRaSAQt8Ynp+7VI695Qgnl5ybzor9/PzxIgquun4BUoqGcvXq0d/
         mAdMs+NPta1wMg5EvxOj+PdBtuYpJItorYGLiK+MIZZfiUTgXsssV6NO0m1mSRqyYoxo
         V1ecatP4bfH19W5TPSqw7Z3FdjxVu3OJWlWqwY+3E8A5Cr/7TsslLGbMhTciIPOcev0D
         00RQ==
X-Forwarded-Encrypted: i=1; AL+hErGXT+JhFeJjkoAoIuppnA692XB3HPU3aVrKCer4d1UJ60fIBH/aDx89y6SZcumozDOeNHxnqRsIiVENm/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FE418ccbuJyT7MsetUTWhDedM0YQlY6q3H9SrAqRPKZAem5Lz
	sbPyg+sAkeVKr4bVdRoYXeMzFfzR5WAGCIf7EFolQfHRMTepVRfiOPn1
X-Gm-Gg: AYBFou3NKYThaAiswNu4jqdvmlJfpjypEQc/9PWMIOMOB4YV33ug8FFVTAKiOrDPjvR
	A6g+F4bF4QfAxHgG1IeNLOq3g6N8nmc1PQGB5OFEBsHYt3eBzXCSl28h7TaA4N9jpQR0eEmTdY5
	q4JcLf00HdA7HpmqcE4v10q7uiz1KOLWzHzDEFVG2cMoMfcczChR92YyLRDb7lGd/7raRIkLwBJ
	A7CzPu8rpzoud5YF/ApL3oP/rrbuVheBimya/Ttev3hzBj8KVeIYAWm9z3fMU0K0ECIXI3S+Thg
	jPo6hoWi2/JSZ0VeYihSLn4HIrKuiNjcvelOcB9csEocQYortLKfEvYGaIVLk6x3HDBLPtC2Qbn
	V1Yt2yJGje1ljuS4kDwfTn10YIlnS6M3xi7gH0ig1mxrOb4lYA69qcP5DlPniVl8nvoCWDp79t6
	4nD4PsOXHoH5oClMggCQeTSs/z81or8wKK/0ArV6YtXIMISaqs9cWhOYoJoh/1oYTf8JsugUiWi
	rRbny4C+LRJyEOAM3YLFoljZZy1LPVMyD4niQSjNiVwA0Y6sMrKq9WOdC/VkxoKRq5jwvJMcJMh
	dcu/t9Pl3lZoaWd6kP0tU9rBstWTHAKwhexCNekNnjHC4ogLIzTDkdoY2CXeXF3b5XUb4aX+Iij
	biXxMR9qBN2d9+oALoxHnGFDPv/vcloe5YIWfUhNbr5LISZhBBZc=
X-Received: by 2002:a05:600c:3e88:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ba022c9b40mr36726835e9.0.1794308356995;
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH v2 0/6] ARM: dts: Add Colibri iMX6 overlays
Date: Tue, 10 Nov 2026 11:59:12 +0100
Message-Id: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zh2REBX3sOwKHSQSYCa1jQQ0
 rtbuYDL95L//g6BvXCAe7GD5yhB3JKBTgX0o1lejGIzAymqtNI37N0knReUea3QRfaT2QKaqzV
 Nyd2gqYa8fXseZD26zzbzKOHj/HbcRP2z/4pRo0IuraKmpvrS0CMHjOX13LsZ2pTSF8ftL8u8A
 AAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=RGp/rEfbSkTgb/XJ9d5cOGIySUNjBN/q8d0hynymqts=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JNZUnrRga3XGc5UPHh2d8EKpUfHb+/01uYwzVepk
 +f4Jm+8vaOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjARhjiGf7r6VxitJX6FSvy5
 3MxW9/vdD5t8DfetugU8XPwrWU8khTAydK97pucj3H6ieKUe7+c4wYeh2+rLRftMxQ/Z3HvKtJe
 PCQA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays, through a generic i.MX6QDL HDMI overlay
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Changes in v2:
- Include 'tdx' in the display panel overlay names, to make it clear that
  these are Toradex products.
- Replace the Colibri-specific HDMI overlay with a generic imx-hdmi
  overlay that can be shared by i.MX6QDL boards, as suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com

---
Antoine Gouby (6):
      ARM: dts: imx: Add generic HDMI overlay
      ARM: dts: imx6dl-colibri: Add HDMI DTBs
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso            | 14 ++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 290 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

