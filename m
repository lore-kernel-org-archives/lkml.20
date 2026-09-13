Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99334C134
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328341; cv=none; b=cUoc6JgLwexr8H7v52V1P4S7oNGAzDf5fD1uxLSAH3Xa9ajybe/IaJXqPN681wdnQWVMtBOowWc54WldvYNqy6gQ49tQdYWzzDpu3DgH1n5g62VP1xRGO6B/jmoA86Y3xpuWA7bXWXbZm+jTxfSkYlCcT+jFfxT/Txq+ibB7CJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328341; c=relaxed/simple;
	bh=re3NJ+Jsd05aIRZR/hmrtpLB8vZj1nW+xprxkuiwqfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYvxzgblQIY0QBEhG65NDihJxk9kOizJl8kIIkp05T/LLZdHszeeQhivmHAoP8XX5sHZukY3vWiHDlLsiKeBKHwomWySLimPt1vO+Ed0BS+RWipiekbch9oewneaY3KVHxPJqVWuQv2ZLdzmEuIjOChrOGpq7R9UN0KIVOP5yN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTCeQqvl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTCeQqvl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5465e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789328338; x=1789933138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqld+C8LvUG/lCaEhAE1S24AuEqbvNc9EFv8rG0tUzU=;
        b=WTCeQqvlJyppviaQq+U4Al/A8fkLWy3Oio/lKhnRzjCMC+OYvEL+yEYBcM7cGVj92W
         1IOhbtvx7NQGBh/GeDEWypQkuzI2oj7pBvePtRY+PKCag6WJlxVU0jlxpEIEvlqEfF1M
         bDIPbA3BWZqldFFdZAUo0O/fZGu6DrSAt8Qdxt5sb3nstvVMIG03g2JWNd1mCWDUz/eo
         AL4b8IwMMF2iRFd4bRiS6eEXJhdCcawqQ4qFZMZYKOoAR+DSzUWjSQaNrmnFiTIzaNC8
         akvAyQFOvP1SSCDiai+0PzuQM43IQrrUCdiKzMSycnop4BOQinkQgaRhJ+YzR+8JeFP2
         wWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328338; x=1789933138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqld+C8LvUG/lCaEhAE1S24AuEqbvNc9EFv8rG0tUzU=;
        b=PwJrmHMrMxW46gLmYoERS4ZXY+srAlVq7lJrh6y5s3xB8VVIfMI2gLUim6/FYYxdwE
         /Czl0YA7Ge+lGnSiKUH2yWXjgSA5qBdkT8pSiRBAOwYWJHeyq1M/YS9vImM342kKodiJ
         Iclr94G88evYPf7pM2cxdURfC/p42LPT2qqfqc/6fEdzDvJD6Bxbn0H1pTIxtjY5U9Ya
         iY88cXBD5wPiIirMaTBRlEJet4BgyY6yUgNxR8HyYetEuRfbQ7XuHo9/5uPqUmNw2Z+O
         OmxRp6Hty1DTdmaqm6o5I6PpoTiJJLWDGFoavAPjHR46+Xpq+vphDi0WKxfWy7dW86+D
         JD4g==
X-Forwarded-Encrypted: i=1; AKwUvByBl1TfL+M/8f9x9e28Qe9XQg9PoNxTcppvHIoW/fO8NUkcdzj/gnmYVfAnGg3I5hdRQ7yUGXH/LtgEBdA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDFvyEsmGrNqPNB1k5g0qhEDPp9qwgWQAoV+H0C3MPkoNLoV3h
	aHTMcAs822XNBduGfolGxWnqGBwoUXhBF0F0XhexepZkr9Qooq9bdMo0
X-Gm-Gg: AYBFou0MTD8w2hmTpaG+sGEMHgtapUkO2swhPh3NzCyPbda8eMu/zP3RUIh0Cn33Ca1
	hsYSy82LonMWRopthrmgRa/uzDOsBIH6slrf3elHM/u32lrBzyHifMr2Bo2YKkyeX23/GLm7RKw
	ImN/XlnxkMVxVKkmqsv7b6fqp91II46w1AtgNw11qmLppDxjH4ubSJwHXtyNZdGhRWNQCEwpzYm
	iQ72Q2RdatSqqDBCkn3rMh7t7RvE1gXE+TitilODgd7TpgxB/oA8S/sP12Zl0US7uFcVuqht2Sa
	oAk8saf/vVVI0W+qhHKs+Mzc/nor2Kjw4Vja9BxZsS57BSHcPG7Fwp0nqXiFly82NApteSYf1pL
	g+gjx0zKsh06XfNSOKmIi0X81ihhlZGTcTumb9HdZkWXeCuGwio3/WpsKM/3lBGa9ik9w6JUlLA
	wCK7/oyOPDYQ46rNQ6wsZLRtXpPH3GD1bfUPMoNSgcNnQLqChHvWWJlrSTziQmFeeuHAvCFJC1+
	bbuKZtiObWJrWxNUeuLQ1/oc8nL0UxV
X-Received: by 2002:a05:600c:3b8e:b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49e719eeafcmr85068285e9.26.1789328337445;
        Sun, 13 Sep 2026 12:38:57 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm334233445e9.4.2026.09.13.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:38:57 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH] media: ipu-bridge: Keep the clock-noncontinuous property name out of rodata
Date: Sun, 13 Sep 2026 20:38:40 +0100
Message-ID: <20260913193840.75686-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes ipu-bridge registers on a successful init are never
unregistered. There is no module_exit and no remove hook, and every
software_node_unregister_node_group() call sits on an error unwind label
inside ipu_bridge_init(), so on success the nodes stay registered and
readable after the module is unloaded, which a later rebind relies on.

Nothing reachable from a registered node may therefore point into the
module image. PROPERTY_ENTRY_BOOL() stores a pointer to its name, so the
"clock-noncontinuous" string literal leaves the surviving node carrying a
dangling property name once ipu-bridge is gone.

Add the name to struct ipu_property_names, which is copied by value into
each struct ipu_sensor, and use that copy, as every other endpoint
property name already does.

Fixes: 8e3def7bf410 ("media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260905211307.542810-1-dmanresa@gmail.com/
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
The series is already in next, so this is a follow-up rather than a respin.

Two things below would both need 8e3def7bf410 itself to be amended. I do not
know whether you rebase that branch, so please treat them as questions, and 
just apply this patch as it stands if the answer is no.

1. This could be squashed into 8e3def7bf410 instead of landing on top of it.
   The bug has never been in a released kernel, so there is nothing for stable
   to pick up, and the Fixes: SHA above is from next and would not survive a
   rebase in any case. One correct commit seems better, but a separate
   commit is entirely fine by me.

   If you do squash it, please carry the Reported-by and Closes: across.

2. D. Manresa sent a tested tag for patches 4-7 on 2026-09-06, five days
   before the series was applied and it didn't reach the commits. It is in
   the thread here:

     https://lore.kernel.org/linux-media/20260906073932.24090-1-dmanresa@gmail.com/

   His is the only report that exercises the sensor's 2x2 binned readout
   through the IPU6 hardware ISP; the other four are all raw ISYS capture.

Neither is a reason to hold up the fix itself.

For anyone testing by swapping modules under CONFIG_MODVERSIONS: this grows
struct ipu_property_names, and therefore struct ipu_sensor, so the CRCs of
ipu_bridge_init() and ipu_bridge_parse_ssdb() move again. intel-ipu6 needs
rebuilding alongside ipu-bridge.
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 include/media/ipu-bridge.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 952868a..233c513 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -237,6 +237,7 @@ static const struct ipu_property_names prop_names = {
 	.data_lanes = "data-lanes",
 	.remote_endpoint = "remote-endpoint",
 	.link_frequencies = "link-frequencies",
+	.clock_noncontinuous = "clock-noncontinuous",
 };
 
 static const char * const ipu_vcm_types[] = {
@@ -591,7 +592,7 @@ static void ipu_bridge_create_fwnode_properties(
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
-			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
+			PROPERTY_ENTRY_BOOL(names->clock_noncontinuous);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 760f076..3ef94c2 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -135,6 +135,7 @@ struct ipu_property_names {
 	char data_lanes[11];
 	char remote_endpoint[16];
 	char link_frequencies[17];
+	char clock_noncontinuous[20];
 };
 
 struct ipu_node_names {
