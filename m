Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8D47FAEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525951; cv=none; b=ulms6SXre210Jt9OukPFe9+0Xlj9YY2nQR0V8ptilA27qAev2H9V6VXX6bMRWErqsAvR9JMGJFd3XlqBBiTqutqUmr6vtnS/k8JcXJhn9gWwzb/wOv6BpndX63FVJNo5FOIRp9rFBK5Ahghok5PjZo46v/lrdVREJsiQKAo7Kdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525951; c=relaxed/simple;
	bh=2erL2bLaccwPjVwcqdzIu+2SXFnnGxmZhjrm52aiW+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY1YuczksQNA4Z/K74JPJDRpKG2LC/zp/odDMaZKhSg2rpSGrcAP+4sg8hAhNoWHqz3/NePhNFRjsFqyJOMDInJ8khZ0UBe+BBpmo1KPfoevKo0WXzCzmJ2foyj+hL7tL2J7YI44fosGHpVqGSwgSG7rLtOxQHizd9ZmQPkygwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMNPDMnL; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMNPDMnL"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1b766bf01so431236eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525949; x=1789130749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCmaPe0iP6tKAqZOH5fpzpvMEa+c8TRt94OkvkEgA6g=;
        b=XMNPDMnLvMbJE66jKiMTjPypMwlanvHtDvpxaavmSMJ8wg6XxnTqyytQ5vmJ4BXCS8
         73aAtLo5XREA3eYvsvt+r/esuVB3au35Mw2o+ecW1heTZdkx//ORhl4xgJBHyJFbEGi2
         AEm3EoVLa9ZJnQ8ETkAvLRRcivCSqkSPDeDTjnC5rLIh3geMl+cBs9b4rQn0Rzy214mS
         d/610vdyJfCaTQmymc3I4FMpXaTtkD1FJFJT5Bi11fRVUB67c23piiLyGEX65B7uYlug
         MP43P9EAK2w2F1eq4r3TQwUNqU6eNtlNXe/KjBv6yXPzmAscdJ5kDkHLEgRlylDr5YNQ
         1hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525949; x=1789130749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCmaPe0iP6tKAqZOH5fpzpvMEa+c8TRt94OkvkEgA6g=;
        b=df3hsEuQrmaOQmzfXIEqUkht7R9elT1jwZ2c8PaG4Xci10mGR3YDvjn/RZn4UxGtPF
         u0qUPpIOVt0iL9WKerxRGUGMJoofn3Zl8wbrO2+IiYrwFcm4D0bzkTX09PSN+/wQnw7s
         ipgbhPBdPs29fI+EqT/BFYxsfMHdKYWDvSrOI1UL0Z1eCgESo8nHLj8hAuWEtnDV4aXm
         jF+ku2V3MWGs+Hml9nxjhr4vipXuSMGxVtWv4bW0BDBcJorNGSkgS30vKuIBel9swqdo
         ADOay2Uri6vPlrsS+va3uxwsNCQ1hunKy11dDVCnmRNQbPBkhoEryclZWioH07T5RSWx
         kQTw==
X-Gm-Message-State: AFuF++mqIc/mz3GISR1pJqiLCB1AqbogSwUslEt1o0FwKQwZPaTLApfT
	cfxEZgM7EkP2tYsUiziYWxvlms5Wv9BINePYg0UQyP8S6ZDXqNkCEqB/
X-Gm-Gg: AYBFou13KDwz0sQV7WB0YGOORjaanzakngh6hlOWIaiD4v5M7CiFRqH/Fe5BcyMio9+
	Bfd8NXc3w4sMHDb8r42JxHryfgHdZrSsgf9O9v7kzHjtuaJsp/G/VvwHrfGktATHmKcuLdX5fCm
	tVGIEVowoAO87xz8wYJWrhSqXoKfpvtwyCAMHmJ03gPt5YmxYt1wr8oJk97qZ30yu5Yjl5HnMwT
	LB0YcOsUVsOJZ7IUWQjsF4PzzU/x2rvSqCZ8noXKKEpeTorRxYfNUrlyjeq/au6v/Tbg0Cf1iL1
	+w2V5I+GnmAypRyrZQW3D7Y2rFFf7UDUMsjw9MsAoO07JimoBKAjlTx5t59pqKtkks2HC+g5h++
	POIbWKYECN9SCkYlIpVf7dOB+FEq5nm5G64/L7XD0PuEe840ej/7EBZ0BQ3XdB86V8Fx+KqRegD
	+kO/QDI7Djw9xJBkSDK0uQwhtEvqaSceWKyNgV5JwMKVoejXck9YPXt/nlgrVvgZq4YXize5Ttv
	I6hhpdqGyZcxdg=
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr4231568eaf.30.1788525948980;
        Fri, 04 Sep 2026 05:45:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6477419c88.13.2026.09.04.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:45:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] macintosh: fix typos in comments
Date: Fri,  4 Sep 2026 18:15:35 +0530
Message-ID: <20260904124540.7652-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124540.7652-1-hemanth.selam@gmail.com>
References: <20260904124540.7652-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/macintosh/adbhid.c               | 4 ++--
 drivers/macintosh/macio_asic.c           | 2 +-
 drivers/macintosh/via-pmu.c              | 6 +++---
 drivers/macintosh/windfarm_lm75_sensor.c | 2 +-
 drivers/macintosh/windfarm_pm81.c        | 2 +-
 drivers/macintosh/windfarm_pm91.c        | 2 +-
 drivers/soc/fsl/qbman/qman_portal.c      | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 6155da58091b..68d1df6bc92d 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -32,7 +32,7 @@
  *
  * Improve Kensington support.
  * Split mouse/kbd
- * Move to syfs
+ * Move to sysfs
  */
 
 #include <linux/module.h>
@@ -604,7 +604,7 @@ adbhid_buttons_input(unsigned char *data, int nb, int autopoll)
 
 			case 0x7f:
 			case 0xff:
-				/* keypad overlay toogle */
+				/* keypad overlay toggle */
 				break;
 
 			default:
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index ee3caa3d87d1..926bd074352b 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -749,7 +749,7 @@ static void macio_pci_remove(struct pci_dev* pdev)
 
 /*
  * MacIO is matched against any Apple ID, it's probe() function
- * will then decide wether it applies or not
+ * will then decide whether it applies or not
  */
 static const struct pci_device_id pci_ids[] = { {
 	.vendor		= PCI_VENDOR_ID_APPLE,
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 8c652c15018c..736936152b0b 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -482,7 +482,7 @@ static int __init via_pmu_start(void)
 	/* Make sure PMU settle down before continuing. This is _very_ important
 	 * since the IDE probe may shut interrupts down for quite a bit of time. If
 	 * a PMU communication is pending while this happens, the PMU may timeout
-	 * Not that on Core99 machines, the PMU keeps sending us environement
+	 * Not that on Core99 machines, the PMU keeps sending us environment
 	 * messages, we should find a way to either fix IDE or make it call
 	 * pmu_suspend() before masking interrupts. This can also happens while
 	 * scolling with some fbdevs.
@@ -1286,7 +1286,7 @@ pmu_wait_complete(struct adb_request *req)
 
 /* This function loops until the PMU is idle and prevents it from
  * anwsering to ADB interrupts. pmu_request can still be called.
- * This is done to avoid spurrious shutdowns when we know we'll have
+ * This is done to avoid spurious shutdowns when we know we'll have
  * interrupts switched off for a long time
  */
 void
@@ -1549,7 +1549,7 @@ pmu_sr_intr(void)
 			/* 
 			 * For PMU sleep and freq change requests, we lock the
 			 * PMU until it's explicitly unlocked. This avoids any
-			 * spurrious event polling getting in
+			 * spurious event polling getting in
 			 */
 			current_req = req->next;
 			req->reply_len += data_index;
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 128e9944429a..085b8c640e3a 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -108,7 +108,7 @@ static int wf_lm75_probe(struct i2c_client *client)
 		return -ENXIO;
 	}
 
-	/* Usual rant about sensor names not beeing very consistent in
+	/* Usual rant about sensor names not being very consistent in
 	 * the device-tree, oh well ...
 	 * Add more entries below as you deal with more setups
 	 */
diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 2a4a3746f6a0..308ed55688b2 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -734,7 +734,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 	/* Release all sensors */
 	/* One more crappy race: I don't think we have any guarantee here
-	 * that the attribute callback won't race with the sensor beeing
+	 * that the attribute callback won't race with the sensor being
 	 * disposed of, and I'm not 100% certain what best way to deal
 	 * with that except by adding locks all over... I'll do that
 	 * eventually but heh, who ever rmmod this module anyway ?
diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index 14089d57e5f7..d2e72d1aa6bc 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -656,7 +656,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 	/* Release all sensors */
 	/* One more crappy race: I don't think we have any guarantee here
-	 * that the attribute callback won't race with the sensor beeing
+	 * that the attribute callback won't race with the sensor being
 	 * disposed of, and I'm not 100% certain what best way to deal
 	 * with that except by adding locks all over... I'll do that
 	 * eventually but heh, who ever rmmod this module anyway ?
diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index 456ef5d5c199..e44de59ec522 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -33,7 +33,7 @@
 struct qman_portal *qman_dma_portal;
 EXPORT_SYMBOL(qman_dma_portal);
 
-/* Enable portal interupts (as opposed to polling mode) */
+/* Enable portal interrupts (as opposed to polling mode) */
 #define CONFIG_FSL_DPA_PIRQ_SLOW  1
 #define CONFIG_FSL_DPA_PIRQ_FAST  1
 
-- 
2.48.1

