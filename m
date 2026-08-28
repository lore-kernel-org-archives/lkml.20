Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37247410D3D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921660; cv=none; b=UBtRDj72cCP2n2PNYj+cBvZfbTQNmwqPOWJApD1I52aiH7cdH2fs3iiko4p+k6tTOmYfaxc/tN8nUvjr5JqX45jcFehlJUZF8V5w0NW47qkHK2TKYnWm43KlUEm2ashQIabPDWh6s38E/yXQA/fOnLwt3FUu43BokWSkSb6JN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921660; c=relaxed/simple;
	bh=5aBJVTFNtKdzt7V9kiKFCTKnRo+Q44vjxsSxWUMylcM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=quhFxMaNB2TiMFM1IVHzu19Yoh05jBRE9DCp3N5psvXiVB6qmrOIShfZhWbp5eQv0pQeQt6KD9KlJBTaijvejT4qOKTPXj5gndW/sDeZcmVunjxHOuM/woTT/8uh+DgwFQnUmDiWCgSN5/k+XhcZzxJDemwx2O0p5UfwaADKDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smr909eK; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smr909eK"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49545071724so6921825e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921657; x=1788526457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtQo4uL9ciRrWrgSm+7tcMPkQTLbUYsP8Kt9QCNYgXs=;
        b=smr909eKsz2PUfHEuJZZSpXxJxCHuoYWy4BaDC0kTDwp3Y1v2+hFl6DsUZ5bB1IrV8
         aLMX35xciBQ345436sTbtub03Wnz1CN7W5O4JzGcYLn+TpPdDfBSXUNYr6t1HOjG+c8p
         7xocVqmQLCa4lF5/EmHrsvexPVXAV+m6uNq9P9vC7NVlKtsBWP8+CYs3h3h40cLvpQ0R
         CJPJQkXZ+tcnOQCU9/qEQBKOxWUVZYgQDzXGqzVknztTlMzluMNYSFUrEdQPg2i2nHEu
         h10SsAjqoQ23RD0HPMPaGRNC8VHULQR9dVgEwcYox7rFQvwJ3qSBGeGMwP0MQSuDOwMF
         9zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921657; x=1788526457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtQo4uL9ciRrWrgSm+7tcMPkQTLbUYsP8Kt9QCNYgXs=;
        b=m75XI/s9QHQjVJ3VdG0uBsdexpSZ5mreqHEChlkyPunuTlQHqDD7af6uYomU/mbvoU
         DGYs4rbUBc4dCzqfabDH8BMzWkM9m/y/qC3G8u21cMiWBrORql/TySb7e/7P27t76zHi
         qW+sHQmXf6hE/zhuZ6JaMU838YIX5Vkaw4MBVTIrx10g6pvK90sinjdcNU5cwEbNJdRb
         Cq+f0g7BrKC7AH9oTzLrk/r/bS9Zb2dFsZF0xLShEvEes1PUN8jwOl4nvEhxc7Bb9HIo
         JKUjbbqGRvEYwVYIWHroBOIUSpHBJlJNwEVb8aZbeJsbtr4bLuKtYnhU5/OuAE74iaDd
         Y8WA==
X-Gm-Message-State: AFuF++naokbnQ97avuFIxE2nqcgfTVONYXWR3330YGqO+s6w45/Rqk8C
	wxsnxfa/MDzpdezBj93Gx3lor38u2+hNjLY7C3BrD+kuYa3RSwK8aNjqLGvriFRy7BRoDiXcAKI
	6qnCbnbYi9grNcStOepZgQs+XunPgZWSfJYogWfou58sdx8m2PgoK3WfgrsAfyzTH/Xs5AjV+6x
	94oVn7AMRiLHMNEH2iXOLvfO0z57784rvlldkeEvcdjXJYuIywJxVNsio=
X-Received: from wmbgx10.prod.google.com ([2002:a05:600c:858a:b0:49a:d4b6:42fc])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr90214355e9.14.1787921657014;
 Fri, 28 Aug 2026 05:54:17 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:37 +0000
In-Reply-To: <20260828125409.1921538-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828125409.1921538-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-3-smostafa@google.com>
Subject: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
will continue the loop skipping the duplicate sids insertion in the
rbtree.
However, in the error path of arm_smmu_insert_master() and in
arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
calls rb_erase() unconditionally.

For the duplicate streams, the node is zero allocated including the
parent pointer "__rb_parent_color". That means rb_erase() will think
that this node is root and it will corrupt the tree which includes
other masters not being removed.

Fix this by initializing those nodes with RB_CLEAR_NODE() and check
if they are empty before erasing.

Fixes: cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
Reported-by: Sashiko <>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 494bbfd2869f..36e3778c971e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4147,8 +4147,10 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 					->master;
 
 			/* Bridged PCI devices may end up with duplicated IDs */
-			if (existing_master == master)
+			if (existing_master == master) {
+				RB_CLEAR_NODE(&new_stream->node);
 				continue;
+			}
 
 			dev_warn(master->dev,
 				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
@@ -4159,8 +4161,10 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 	}
 
 	if (ret) {
-		for (i--; i >= 0; i--)
-			rb_erase(&master->streams[i].node, &smmu->streams);
+		for (i--; i >= 0; i--) {
+			if (!RB_EMPTY_NODE(&master->streams[i].node))
+				rb_erase(&master->streams[i].node, &smmu->streams);
+		}
 		kfree(master->streams);
 		kfree(master->build_invs);
 	}
@@ -4179,8 +4183,10 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 		return;
 
 	mutex_lock(&smmu->streams_mutex);
-	for (i = 0; i < fwspec->num_ids; i++)
-		rb_erase(&master->streams[i].node, &smmu->streams);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		if (!RB_EMPTY_NODE(&master->streams[i].node))
+			rb_erase(&master->streams[i].node, &smmu->streams);
+	}
 	mutex_unlock(&smmu->streams_mutex);
 
 	kfree(master->streams);
-- 
2.55.0.897.gb25b4bd76c-goog

