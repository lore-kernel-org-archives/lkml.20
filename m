Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821F42376E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750545; cv=none; b=tsbPkb4Lw6Vy5FWBrmOFNATlKopuglLdHhZrRGt3J0c4jeIv5kC3MHRLNd1dsAvwmb9h+7RvjTy5xSVna3FNFYQNc39BeQCWrQhBuvNPWM60WOkzkM4Bl8T4NeZsIeqYY8WpZOyuojbUob2iJWx9g7R0bnqiN/N4hrisKQNVaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750545; c=relaxed/simple;
	bh=nvrucR+AkADZ4+yG4rq9BJde654t4Sf6aZRf6pLCLLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=acHjc38NKxkJZF5YY5OL8ktxgnCrzoBkL+f/G9LRKdLgJI5V2l7urSJqt9EkuZQIayTxDBwnWPlcvQNGfrXIwaLLS+9lQRvuB9qyoKwiNv86/scD4WrkEfhlranc9cIBihZWfZ5JZ1ZrLXTVqgX9WNAjahWLzx+jxlAnpaXrZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1yVas+C; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1yVas+C"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1600d040e4so150658066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750540; x=1788355340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qvp7s9Z0ISxqdwUp6/xNiXsA+oD1adl5c2ELLa5CjIk=;
        b=S1yVas+CS0t5rZ0AkYJnyS+7W5wq5zQioLEtMhe7e8BT2hic++oIj5MoY2sCOD1ZeB
         SghL4QXySyQEk36nNxbDbl1VksmNFiEXrbnCgKB4vb5++L61jbmbHJg6eZf04WA/Djq2
         tHmVRDtHd/y0srgKlAHqL1ZZGnCTVkGkZuoOmJn6jWghiEl1Op73HEyaXI5KsIo7FlMH
         pxtZbg+P+9TGu8ixTD47flSDzXXkye8Z+RX1QWZxV17EciYhd2u6owFwHHh9SB2//vhY
         9tkBzN0JooxrmO/fP7QKkeaGkUNd7NcxNCJh+koAFdD0NDB2vOQpA1ke9I3Dv4iQN1In
         xaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750540; x=1788355340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qvp7s9Z0ISxqdwUp6/xNiXsA+oD1adl5c2ELLa5CjIk=;
        b=PjsA7UGKnbruLc0kiY0TBp/KqByG+Y+/5ttdCMZb0uN5ScCfKZAuSEy19z5ZmwT2Hi
         eQaGJaeRsZE01k9bKqJR+B0W2+4+TdPJXbHfXsm7/X6hhWz9eCR2Ek0m03/KxG3WSBSc
         VcFGQvpdjn+gWR6q6Iz0V9RbZvYJkpOs/HiiN3DoCNTZh4Nsowa5inKxl9lvN+xs7CyC
         gE9kXTQF7ywXB4m5B3Qc8COvtbxkSsvXSQFjbeuabtQHfdXJooFrtq3LYSPtbamJykBf
         yg5tAD3FHFf37VMxSpeCvXkadrspOy81egK5QJFrKu5ljZDzSayFIi8+2euN700WC/z2
         2cBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqVulwRTMraoV8M6yLBSvBZq+QzkW6tzM/aDbfz0/HhqWRI57nMxfAvOAQ52trpE2nigXESi3nXzbZ1Po=@vger.kernel.org
X-Gm-Message-State: AFuF++m2TgzEQzh8sBMObtqflWuyO7g2iZcsQk2jLgsli07QaHkjbk76
	jka9rhBYyaRHqE9RYPIQcc+w2j1qp0CeYLAPpHpTprRHEnb69ix2Vnm/
X-Gm-Gg: AR+sD11Xvz4kpgRCqacFTMjobOwWBGJGvR1fWDpiCo2p+Gm5/3b9oBRe+QaXc6e6f0j
	Edv6mn2uApQ7nA/Z6WAdlc/7pLcW1Moitvjva8AROimVPrExNtR7J5VrtYETALVfp2lA0Zx3qz5
	vhQ9/wiuy4QmwMmk+EJjO9I/KQKYqxfCFahs3puppqlISURsEGqx857qp+cZEF2QNugoCfO4D7y
	Z4aartaWL5mb4vy0YfZIHtZrUjv2FleZ6icbhKI/etpgXTg3mTi9RegA0dcT41v+GP/GzTpsl5u
	HoKf5jZ44KEF4kWpvUdqzp2jTKE1wFwwhA7gHZpsRpDqA6amBds3/hi2IvEys4u4uBQyvmQ8gtZ
	id8nxFix4xkAinFsSHIj2/gahPR998RYzk0Qyb6iphbgx/BTCMElFd2F5wSeYKs0zz/DjuWyEru
	8DAVO61F7u8zrM69t2ZhwYkEx8GKAVgf8KH0/9ZGLs8y9Zdf/Sl824mOj/kQCpEmDogL9G9jpxC
	CVMLs3FoFNCRDh2cMAF1qUe9JgleFxXGWkjLJs7F3Y=
X-Received: by 2002:a17:906:ee85:b0:c20:fd32:d9f5 with SMTP id a640c23a62f3a-c24e2e41c3dmr1619891466b.13.1787750539767;
        Wed, 26 Aug 2026 06:22:19 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm435905466b.24.2026.08.26.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 0/2] Input: Add ACPI support needed by Yoga Book DRV2604
Date: Wed, 26 Aug 2026 15:22:09 +0200
Message-ID: <20260826132211.3341936-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L contains two ACPI-enumerated DRV2604
haptic controllers.  ACPI does not describe a controllable vbat supply
or provide a _DSD function mapping for the enable GPIO, so the existing
driver cannot initialize the devices reliably.

Make the vbat regulator optional while preserving the existing behavior
when a supply is described, then map the first ACPI GPIO resource as the
enable line before requesting it.

Tested on a Lenovo Yoga Book YB1-X91L with both controllers probing and
direct per-device force-feedback playback.  A separately posted
platform/x86 series supplies the device mode and waveform properties.

Maurizio Casciano (2):
  Input: drv260x: Make vbat supply optional
  Input: drv260x: Map ACPI enable GPIO

 drivers/input/misc/drv260x.c | 72 ++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 24 deletions(-)


base-commit: 9a29ee801f525bcad71fea021bfe2a030885c8df
-- 
2.53.0
