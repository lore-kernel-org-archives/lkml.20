Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BE386441
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318421; cv=none; b=cDYvz8Xi9B0RIQvQllCHkq0HWuJtdKjIGOj8jI6HJfBrFxbqeKwQVsgH3QqKxhhe9xT2ir1F39SWCUMDGm90taBsaw+93O7aI4JV9lRhLN1kj8YkFP/YYTrCmYmCWD+Cb5r2e/vTN3/SCXwilJLtw7wOeHTV4/Pa7Ub77E5uNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318421; c=relaxed/simple;
	bh=Um5la9q9xZ3y69EgjeoKr9fw+rbLpYHSq90twHQdDrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewPmDK32ApiLdT1J4txk/0Zec6BBHtUHPlqgptKmY/WaYwPTrl9A4+3TwN70Fohq7ZADxLoUAvxo/6sxmtmjoevNvkXTvXBU0MZxUir1wQfCClFHodllGzXo/vsvaPcPGQH2j1QqW4LuxGRy6vgLH9nTyPZjv5EPIhUb7MM9Z0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ26zKMZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ26zKMZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so963422a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318418; x=1792923218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwVVGv7Ypjc6OhBGHWkusgpjgoIKhERu3f/aqggLBqg=;
        b=DJ26zKMZ/5JZyxIZ3uALFK6MaczlP51dwUO+o64F3pVJs3BSIy5I8pvU5EzD2irLPL
         zwHqgiFINrNh7AR5xFZq1ubYjoHrzbC1kjc450SPGiIJtKr5eqUWww/PnwYk4UBAHHuA
         I0vETsuihIaf1XcKfznSfj5+wEbg72n6F8jSwGtD7pfHFubxranrX9xF06BKvjP07eGB
         LD1sSqk8NvbbG7ahAwNlpJPt7+9WzWgJFTj4OGQqSGHmyEs+rs8LvLcg9VnrZnQniQOg
         sgEi68qwMyUyAQ8znIbANyF6oug65R/15rwm+aJnF9nEXUnM9crOUFXodRLIog4Ggp+Z
         MH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318418; x=1792923218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwVVGv7Ypjc6OhBGHWkusgpjgoIKhERu3f/aqggLBqg=;
        b=Yfu8KdnUBP4z7mCbUgE59J8/T+PSnG+CQvcpe/EFmA1CyvbMs9ey2q1y3v+65fQnXb
         aqjeyQLAodbwXGxVq/g2YhJxSNHdDhXhHEKP2Wf+UHkVlnsMfOJRBOi8aISaN8VXhxqk
         TxpN7NSW1i9d6oFBb/+6joQn6h5/ECA7Db4sHsk2AehVwq3SKPJwsr2iSmbJlKH6oqMC
         LogNbK19Z5cuv4G4DEISWiG/htpTKIU9lMwqqY9hIwayZHjssahOwrfCjh6Phj6y5TJU
         vOBqetvrsc8W3bep0were+Pag1jozmhxDftYAy7J3xLSSR6TlwGw3x4AnFSmwiV7O3xP
         juOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6XZC5cY/iAlxsmhxBGLWFOWczD5/08EumeJ1La9ZekdmcFJHwwWdC3JibFsu7xCp05xhHxvyxCbU+B0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsBvuULsCpU5Ni9SpxiD7ETHnNpIwOB0sDUUOkLuU2S5LtKUcG
	D8QMsmfMQYOpI0SIoSFtzlGvdfNL/acjlfn0WLGfoWv4hOehPVeybADg
X-Gm-Gg: AYBFou3zci3rIh+1akykuFumtNKkAlCEgUdvfCD8wFUmP73bzEcjmDe85uuUFVrHpfj
	Ctrp6Bq7Ab/uHYR8K9VsO8cCPsVi29smFDpIG/n1fhOIrQ+yN7wdE5FYrPdCta8ztPjQS7O6CQH
	NgzhI+6HnrXmwl2pGGrf7Q9zCS3Vt8Jva1VK2CEiQIHt9+ubVh1eRZa7uacZjj9yeEgIs/c3nKB
	of9NnAagENyUBLiPg0hrXZOlYPfM5kadU2XMP7Zz9e4DT//3SuVlUW+rQMyWn1Q8zQxtp+6NZ2N
	ay4fGV54yU2rNftwzWtO+KZI+Kx/3DERnphC+5/XZCUj2veYOaDcNW1Btxc7k93BeYWvDFNDJ2J
	xj9QQzEOeQ+tOh/ZS3sap0PPo5E8tb2mtDTpbIuHb8rAnV9gFFTpRskmSfx1S6pGcbkGx2yeuSB
	1Y+pD1ayDvkdlqqdQB0RnGgSB3ioniEC4Qbe1lgLgKFJVwBsDoP2PmhxRpd8x4VViD3dsBHkKh/
	4pTDr1vXBfcAe15Rv6x0OKnyt3s4vuhTrhwnisR7yP23cssNw==
X-Received: by 2002:a17:90b:224e:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3aceebf67eamr4308680a91.25.1792318418481;
        Sun, 18 Oct 2026 03:13:38 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3acc48e8646sm10798142a91.10.2026.10.18.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:13:37 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-input@vger.kernel.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: amd-sfh: Use shared interrupts
Date: Sun, 18 Oct 2026 18:04:06 +0800
Message-ID: <20261018100406.44560-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD SFH driver requests interrupts without IRQF_SHARED.
This can cause VFIO PCI passthrough initialization to fail
when a passed-through device shares the interrupt with AMD MP2.

Request the interrupt with IRQF_SHARED and check if any flags
are cleared before acknowledging an interrupt.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h |  6 +++---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index e8cc7f1d289cc..4481a50359de6 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -85,7 +85,7 @@ struct amd_mp2_ops {
 	void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
 	void (*stop_all)(struct amd_mp2_dev *privdata);
 	int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
-	void (*clear_intr)(struct amd_mp2_dev *privdata);
+	bool (*clear_intr)(struct amd_mp2_dev *privdata);
 	int (*init_intr)(struct amd_mp2_dev *privdata);
 	int (*discovery_status)(struct amd_mp2_dev *privdata);
 	void (*suspend)(struct amd_mp2_dev *mp2);
@@ -100,9 +100,9 @@ struct amd_mp2_ops {
 
 void amd_sfh_work(struct work_struct *work);
 void amd_sfh_work_buffer(struct work_struct *work);
-void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata);
+bool amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata);
 int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata);
-void amd_sfh_clear_intr(struct amd_mp2_dev *privdata);
+bool amd_sfh_clear_intr(struct amd_mp2_dev *privdata);
 int amd_sfh_irq_init(struct amd_mp2_dev *privdata);
 
 static inline u64 amd_get_c2p_val(struct amd_mp2_dev *mp2, u32 idx)
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index b3cb13b8c5e87..f48a096a6d2bc 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -103,25 +103,31 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
+bool amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
 {
 	if (readl(privdata->mmio + amd_get_p2c_val(privdata, 4))) {
 		writel(0, privdata->mmio + amd_get_p2c_val(privdata, 4));
 		writel(0xf, privdata->mmio + amd_get_p2c_val(privdata, 5));
+		return true;
 	}
+
+	return false;
 }
 
-void amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
+bool amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
 {
 	if (privdata->mp2_ops->clear_intr)
-		privdata->mp2_ops->clear_intr(privdata);
+		return privdata->mp2_ops->clear_intr(privdata);
+
+	return false;
 }
 
 static irqreturn_t amd_sfh_irq_handler(int irq, void *data)
 {
-	amd_sfh_clear_intr(data);
+	if (amd_sfh_clear_intr(data))
+		return IRQ_HANDLED;
 
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 
 int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
@@ -129,7 +135,7 @@ int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
 	pcim_intx(privdata->pdev, true);
 
 	return devm_request_irq(&privdata->pdev->dev, privdata->pdev->irq,
-				amd_sfh_irq_handler, 0, DRIVER_NAME, privdata);
+				amd_sfh_irq_handler, IRQF_SHARED, DRIVER_NAME, privdata);
 }
 
 static int amd_sfh_dis_sts_v2(struct amd_mp2_dev *privdata)

base-commit: ae6927c533a4454570950125ca8ba909c45f20f9
-- 
2.55.0

