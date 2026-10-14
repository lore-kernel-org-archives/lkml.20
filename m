Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E7D4C7546
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980163; cv=none; b=VIkAIwVaGl3/dBuXYT2aTxHV48R3rJsJnWP9lnOS86qN563Ns0GjmH2xLrvLOF2dtUlXk5A2618BIPvwCwuBl9kWVOMxbZKPnip8HUateByIIELGLQmdS9vAmqqEtGvUKGzXJ8BsLIfUNl0Pq8YGSxpmNgr5/0c1mnr5f0NcThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980163; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Swvz+54Iima49ICyXAJRQXwHdlFCNeJ5/ccVHdQW4BIqWRhyjXdzR4S5a5RLYKWDzhTOQC+QD/TnVfmkkm8qR1IE2e545xI9+Xp/GNDqKRbhu5rXMLEkb5IDpgNCVwBevS6TDD2Aqg3Z00vUwLsEJYegsitHHePB5xGv+rxtIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBa81QDG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBa81QDG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c02782159so2467247f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980160; x=1792584960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=QBa81QDGkiVNHB9FucMW+Or2VQh1xMRCVUhT7HhuLwdgoyO24ozI7qIVhA4vAQsOi+
         oOEAhQrgdZ0Pf77vtlpu/C1F2acWGMoXT026ylC0/hZ/s3dPcPC0iW/sy/KZeo/DnDH5
         bWY6KhgUrDE7jFO1giHkMiktxe7Vg/60FLUqhhh5cnC1DgYshKIEsZHnE56IQYJLGtGf
         Y69cEnx5oeVpHWInekH/Yu66Gx8GG4YfD/ivN20JFyG5xWSiLF1+45olsE6t9P7hthsf
         948avonszX/GahWNA7TN4F/k32dPVoDdT7IQnFz8HAqMW1O3nkEcKH1eAWMNo02M+Dpi
         vp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980160; x=1792584960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=tRQpLQ54jUK/DbQ6bsO3vbuHOeWt0q5KNW4d01Y1mNXQgOwG6IgUSCXqsOVMa3DK9X
         DApJ2gcRxbUHizavls4wkZio36Q3VDc5yXFhHzZd5iwiNd+zm/Y/6qH+DiKKnG+CCa/3
         VDbNorfUcCOsdBZXGdvqnGCcUhmaJVa3lGYAbTMnxdsiGNGAl0eox5Yai6U/0aZ1a7Li
         zUHfzJZS2O32ZBcsn56yDN5gualeSOxx31Bs61Jp+fthWmK73pJ650VsXI2rxKAt3N1N
         wHW9QdvMDH0dVvL6+WEzX/IRZI3D6cWjAsNejR81rsz42gEYHL128d092AKBn8Ggf41x
         0ZsQ==
X-Gm-Message-State: AFq9FYJ5lkWANqyJMevADZcltzHdYHRw75hJ4zdlfpV3TklpQhs9ElOq
	UWkxXcoBKHcZl+pz7BtOZniDLJU/3Oy9VgPgrHKFPbOW8JvApqzNzXIH
X-Gm-Gg: AYBFou0axdC6UXtEd+W0+fFQYj43o6ZtOMbT563qxw+5JQdOPFgqnIiaLgPTcO6R4cY
	2HJiDvO4jnVtnjxaNOZFV2aAoFzoHCNCl3ttQ/VysmLoxwPsxvQjZTNEENjcmqDG3Pe+oO0GL6P
	n8wUO6oeBltFy4b/ZlEz8E18TeFIwKvs5lEY2bww6mI/Lu2NZDKOSykmXMlNbG+fBe00D4Ig3gq
	9pwKEpZPUADuB7t1h7mDK5yzG+HK5SEW3EbYlBqKm/x3XnUPZuLC/0WEyCy0JMJI8F1zPjVfqFd
	nPMHZB7hMBMo6qlNMsp6v2JG5GE2J1XiOxBzhbq3vxxVcesGjKpjQ+YsQOI+g1Jow873N9gQOmt
	ggI+EeM+/VZz3m6eavk1IDE5VzbvBWMTYVCATVcLNbu/jqBlOok5RTlAF2UPOgfP6b5MMnjWkyp
	hhVv5aS3jOW+WpHS8Qp8o5MQsIJJwNeYVTgAy5eIC2mLjzrqxV0KZMxkk9T++XhAIbYCAaalZEj
	yffsaQnCODxAfQqWZ9vVHMCfImZzw==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr21986456f8f.16.1791980160478;
        Wed, 14 Oct 2026 05:16:00 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:15:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3 RESEND] mfd: max8907: Schema, pdata and poweroff
Date: Wed, 14 Oct 2026 15:15:41 +0300
Message-ID: <20261014121544.138958-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

