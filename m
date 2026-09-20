Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4547277C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929033; cv=none; b=YLTG/ZelYafMGwzzaeEPs5agld5zuqdVkS/aC/W966Zzp8HRBfUpn7oF8cz1j0+ejnDahqZT0I23XAtYTyzSAz3sUhnN9nWF44txYFANstYIm66ZpovRrJFvcZZ/6IPbiC/AZJJizqacb0pmRc9YGQtZXlkRPLFIgJbQIaNfNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929033; c=relaxed/simple;
	bh=AnpJGEP0W1AN/GcBwLnNfGbUIBoDF6SMZ0PKVmp8Mgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2UnH1o6w5vj/DZvpBlOr5RkqyUXatBfEW92MsOVCLAyUWCgGHbJE9L8YoDxjCY4JHah6XXiHyvictT+obPZMiqngtKulebOpKf73clNrcJ+V6UxL3kM2/gWY7zTDCRlPpLplqWaleHBv7lyR5c+tPZJCcRFn2urKQ4N4JWZ51Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=XY2KLTQB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="XY2KLTQB"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so2617043a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929024; x=1790533824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9AGoVe097CFQTljKQVnFARTDua53EnwrZ8dQWbEJDU=;
        b=XY2KLTQB9lJ6N77lVRgZZ8YQaaDGPNWyZV4qTEF3g+idh6BUmhRgxDnMCW2a2YTzVL
         wU1Z6vPjTPbAQ55PGxBRQ781P7hH0667cbrcwgLzBO2h0h0Aijv40lcXpnwJof6NVAXM
         +GoEMZhGvUqVutv1eMrZLzesweCL8oSFuSd4tLTDoL9zsP1+240flUajjyURBlxnsILf
         VOlq2plc5mEPNPAMIZnYoa8Y4cJOtr7DN7jp9zW1eQ6Bwj6vx2XSTNXhmKFyNqNInl9d
         EopBJzvpecIV4n2o5iCgNx0E+tFQq0EBmORpWFfhBYVzoto8oYhdOnVrDJ9OeOREmCgO
         V54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929024; x=1790533824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9AGoVe097CFQTljKQVnFARTDua53EnwrZ8dQWbEJDU=;
        b=umg2c3OVDtcnG6t+HxV1pMGwP2nQIWJ9FOHOM3fAn9B+hx4cJKzeUb22HdPyolIv1u
         RwN5aIKv6FneHJ2FlSk5FCcfOhG92kIpN1cagbiUy4i+hUwAo+sZGDEcxhWU1Ep1F/Eq
         5Wk+lNkljM+iXqV/NZgFqSa6L3Dn3/GFxamxkxtCTiS2CjR+BTjrvE0vXcxE8q8d7GRw
         OQ1xefAIWAjm6saazuIoNEIkgAcbjYHMxs93mp0c5idzC/77La2mBGWPeYft25qThlAu
         qtJGDUOaV9/AFcGszXj0HRSUZlGBP7lJri7x9NSSse7tpP9Avi46a8HobySGe0mkiMBx
         qeig==
X-Forwarded-Encrypted: i=1; AKwUvBx4jMZ/jyabbcHiwzydYz/hqvsznMiAyfpUJ0ljMKQIxSJ4nV+5dA0gh+ty3xrM5XP0bvn5qsxrVV1CULs=@vger.kernel.org
X-Gm-Message-State: AFuF++nU0BOtWNZebPVbVt/mty7FH4tV4y/Vk/WTOwuW44DMPxB/NPSw
	AawIuYKQGNYsECIl6PGpiNn2q2QqdwQ62uRzPZCk4Ll0k+fRNm4qlBI+6zKDs842GLs=
X-Gm-Gg: AYBFou3FGrG/7KO+okw1nXxiFThUukaJeK6yaPEJnnF7mnqIqncR/C2RUm0f5mt7vG/
	XjEPFcKhnu/EyxScvjSr28EKxxC073gswEIynHs6vqPmDgxwJS2egY7Njc1cFlbxnubUUFPXqUR
	Gn3coF2mvaZhjxqNgBepXs4kUCYMyYwEJTgi2RYx2+TnyBZ9LI1dMVv5fQdorsW4dDAgm6FeL4W
	GTLfinj9aklzTM0wBHvDOac6EWNf243GWWUvLQ22P9e7ZMi0VSCXILEFzIB6lleoJGMcmVqtY6v
	jH5VWotfjhq6NDztwRm2ymzL3jn4xZ0dYpAEwCOtu7001Egihc3wwuAQdGiWbMNuO+IoveGxKca
	uWfmTPrkSNjRgMmwNsWaXG7ZMYrcyNFsv/Fl1Y7i2EoxPPDIbYI43BIEt2xY71svs52JAmPHB+b
	aN09PaClJ/FSj6XL3cSKzA/t8f/Q3RA8LifDh2BSpnsJ+21UZ+DIkFE4sEzOPz9eDyRQA=
X-Received: by 2002:a05:6a20:9e4a:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd8c3f80bcmr14827589637.2.1789929024412;
        Sun, 20 Sep 2026 11:30:24 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:23 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v6 06/18] nvme: Rapid Path Failure Recovery read controller identify fields
Date: Sun, 20 Sep 2026 11:28:04 -0700
Message-ID: <20260920182936.2317916-7-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TP8028 Rapid Path Failure added new fields to controller identify
response. Read CIU (Controller Instance Uniquifier), CIRN (Controller
Instance Random Number), and CCRL (Cross-Controller Reset Limit) from
controller identify response. Expose CIU and CIRN as sysfs attributes
so the values can be used directly by user if needed.

Also add the nvme_fence_timeout_ms() helper that derives a fencing
timeout from the controller keep-alive timeout (kato).

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/core.c  |  4 ++++
 drivers/nvme/host/nvme.h  | 10 ++++++++++
 drivers/nvme/host/sysfs.c | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 758245c799a1..ae7c04b77a3e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3666,6 +3666,10 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	ctrl->crdt[1] = le16_to_cpu(id->crdt2);
 	ctrl->crdt[2] = le16_to_cpu(id->crdt3);
 
+	ctrl->ciu = id->ciu;
+	ctrl->cirn = le64_to_cpu(id->cirn);
+	ctrl->ccrl = id->ccrl;
+
 	ctrl->oacs = le16_to_cpu(id->oacs);
 	ctrl->oncs = le16_to_cpu(id->oncs);
 	ctrl->mtfa = le16_to_cpu(id->mtfa);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 2cff9fcbf740..cb9d7f45188f 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -393,11 +393,14 @@ struct nvme_ctrl {
 	u16 crdt[3];
 	u16 oncs;
 	u8 dmrl;
+	u8 ciu;
 	u32 dmrsl;
+	u64 cirn;
 	u16 oacs;
 	u16 sqsize;
 	u32 max_namespaces;
 	atomic_t abort_limit;
+	u8 ccrl;
 	u8 vwc;
 	u32 vs;
 	u32 sgls;
@@ -1339,4 +1342,11 @@ static inline bool nvme_multi_css(struct nvme_ctrl *ctrl)
 	return (ctrl->ctrl_config & NVME_CC_CSS_MASK) == NVME_CC_CSS_CSI;
 }
 
+static inline unsigned long nvme_fence_timeout_ms(struct nvme_ctrl *ctrl)
+{
+	if (ctrl->ctratt & NVME_CTRL_ATTR_TBKAS)
+		return 3 * ctrl->kato * 1000;
+	return 2 * ctrl->kato * 1000;
+}
+
 #endif /* _NVME_H */
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 02a2490a9ed7..b60f5b66a1d1 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -487,6 +487,27 @@ nvme_show_int_function(queue_count);
 nvme_show_int_function(sqsize);
 nvme_show_int_function(kato);
 
+static ssize_t nvme_sysfs_ciu_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%02x\n", ctrl->ciu);
+}
+static DEVICE_ATTR(ciu, S_IRUSR, nvme_sysfs_ciu_show, NULL);
+
+static ssize_t nvme_sysfs_cirn_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%016llx\n", ctrl->cirn);
+}
+static DEVICE_ATTR(cirn, S_IRUSR, nvme_sysfs_cirn_show, NULL);
+
+
 static ssize_t nvme_sysfs_delete(struct device *dev,
 				struct device_attribute *attr, const char *buf,
 				size_t count)
@@ -941,6 +962,8 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_numa_node.attr,
 	&dev_attr_queue_count.attr,
 	&dev_attr_sqsize.attr,
+	&dev_attr_ciu.attr,
+	&dev_attr_cirn.attr,
 	&dev_attr_hostnqn.attr,
 	&dev_attr_hostid.attr,
 	&dev_attr_ctrl_loss_tmo.attr,
-- 
2.55.0

