Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0724B2CD3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404584; cv=none; b=ma+97HOQlgVCl2qtQrD63cYscntCKRcerbDJK7kr10kvb1vr2mgRoMovt6k0K60O61LFtkgj5yL2Ulh8fqsduCVfZ0W2UQMlCYyug19FNWolbN7tN5BZrwY10Xo6Yzl1fSLy+fMG9sBhiz3bfqP2RenGUcFgdikRZjUtWurxFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404584; c=relaxed/simple;
	bh=gdG7DaAftWT3ADCplqkxnyzdbLARSb0KMGw7e2oKzQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6G3ywmPdLdamxMSKVf2ap9m38aeblaclof+fovJ5s1HCSi58otE6GZSQ4deW7tw8HpfbyyMKDgtVisM+oC0RNInA3mD9cKzL1hWT45QZTYXi6uXw+E+RM4Gdt+mStgps//7QjAqb1HTRKtxvb0hW5EMxoibu1otFee4soPqvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TapkNhEJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TapkNhEJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so14191555e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404581; x=1793009381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2k1+XdFZpFLCHbc15Fx/KjwLwLdvrI4ZxyGFOBKUCSU=;
        b=TapkNhEJU7Vgkd5wU7fYUDwxh7e7/IyI263kpRXTOwuS9ynyuObk06aZhZT47W1i0Q
         XAfwisAaONZnNG6L46nT4ve+z6eVled+VGc3t7eSEXQd0KMcaUaJiTfhkknBUVdnTFNd
         BLWT52XU7GiTBDx+axAPoja9tw08BR0pZHixLMloW6jaDC5gUZ0kqlg5Lus5ik+eK/jk
         KTGk6UIk+mUf3v6R/Q3wdXl/UteV3Zm7g79QxHtTLG/edn+5FRocgMhW8zxWE5VBkCmf
         Fnofqwh4r0A9+C2eS34kPCwcDqmfQV1kHHV3IHr6V1JzZ/CmZX6/kayhxOpVQu8X++72
         pv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404581; x=1793009381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2k1+XdFZpFLCHbc15Fx/KjwLwLdvrI4ZxyGFOBKUCSU=;
        b=X7hJfOKOLx4ZLvHWPjg0W3V5Ta93RqSwRUW8AZ9ns6I1Z+GNzLInddRFczPHM7S15U
         JPnU3kWy6eVxRvvnj99/s98geR3u1flZPOySu+kWXg42zDurmQxciPEavRNyXLv54cxr
         uiph3sCC7xbOr0AvHfwTn20vgbkVAiUWWjjifd1E9njMPBKoMuyOiGLONG4KG5jdlAfl
         50lNwLdvos/c8tdSqW/qoOe9knSKBdfzFGy3HEPHss/jCSu0I+6onps3o88rgmjr7lYI
         pqPnjXSImjCSN/luvnAsCcfifIy/DkJPJ1MRvJJHcOl2r4UUirhw7W+kUTPRJOBTIIAf
         QlmA==
X-Forwarded-Encrypted: i=1; AKwUvBz9ac0cwkF45fFmUAk9CkMUOMk8cOPa7+O2K7gDVeTxwWtIVzvbcCEubG282tybAECFf28eqFX/IyS0KQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXyeR/iLmzZeGx5z5GlqAE1urQqVD2cXyvNFNwAL7Wpe2UNo3S
	0cxrrRDXBfrtfSC9xd78rhFKC19Ie9+enSvm7IfZ9CYVt8zbvJDws4up
X-Gm-Gg: AYBFou3qwOvQrMgWXmweF9MoGOZiSSEVpqNdbwLw4Mw7hBKEgcCH2illzt2bGJtgVwv
	zRW4IlSJZeAXmWunLBluWEAW2Dd95+RPSkA/W1NEuSRDdNQ7WvrBk9Nk8iHV/txYz1wf0PSffJ1
	BJWsJEs12emVtg49PjFdQeZ5qAKAnCdEZ1Osap5M02QhSnUo5cSjr7Jp8XKPxRcw5PN/DWbQ+T6
	tfXOanCYNWwXTt8BXkBECyXvGVRoXuVebmIvqalo52KP2T5nYoud5MwsnR987mbtoKAmjQsuSXb
	BpGijHgqOLz3aoOy2PON1AI23EiI7I3VfHuycNEzDLawgC7fHkP0OqJYiRBNDE5Biur/W/wJmbK
	7ohsKX3PAL6YXFlnKi0mwX8FQ+DYursGaQkNw/PLPjtSSWj0fWfnEFve5sN/R3hkJDQchpmI7s6
	3JZRCv8mBQ7h7Ol6mj+jMF8Bew9U/92zFONgnk+3Zdoyvo1OlMm55SrjNk0t0vwgXeHRl+XUMKs
	nekJY2MwoFs3i1BWfM=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a1d7616464mr162248185e9.27.1792404580998;
        Mon, 19 Oct 2026 03:09:40 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] mfd: aat2870: Convert to use OF bindings
Date: Mon, 19 Oct 2026 13:09:26 +0300
Message-ID: <20261019100930.110954-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32
---

Svyatoslav Ryhel (4):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 ++++---------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  79 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 260 insertions(+), 318 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

