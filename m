Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88451D531
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755428; cv=none; b=LTglPK1r4OxVqM7G8dEFDu6bEwrIXkY5FAdynt7OFIoCkzXk4F5UAsYmg2SeYNeIxwxbp0sWI2P5+6XYmnNbVfddY+E25/f6A/C0oUqH31g8B3YmzeP3i5yt3VIMcQCFbNq0FiFOVMUNgkQXz5MwAO0PBMQMEplKrLc4PBJS8Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755428; c=relaxed/simple;
	bh=AnpJGEP0W1AN/GcBwLnNfGbUIBoDF6SMZ0PKVmp8Mgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfqazFLuowpTeWj54PUTgt5yhY2APIsE7w1AaMPVW/eC4pNHZoPrA2oG5bgnZbq4aRq5YsmC2zSiFB+SD6/0JK2XxpY5y2uUhXiwXytF/Nr3dUgSlZOetVCw5WKuQ5Lc+32Qxv8SqroFyG9xYkr+T36Q3kzeERC5CIdVD2bbdGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZaoiC3Pp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZaoiC3Pp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1201322a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755426; x=1790360226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9AGoVe097CFQTljKQVnFARTDua53EnwrZ8dQWbEJDU=;
        b=ZaoiC3PpnpPh8uD0E5FymqWwoYM13qco9SH0zP06OLsYeU8dJhaZuC879BxIxtG76d
         7lCxmlCjkv1/BS5LcoJbKAiui14GVBna4z3OHTyyRjcOQ+oQ475vEaMpRTEhwnscszlM
         JP/Q4xbZettkTmD4U3MiSd3zL4Xh/YIkOHXs2d+5RG9yVoA+lBJJC93+UVf/vEBzpyDI
         6m7NNxUqm/EV96SF4Zt38vdxztkGSGT7esQKisEK8E+y5tVwYqPcjlLRfQtlVUSagKKk
         9FgQMLn06gFvCKe5DvfnsBjHm/VnY4sHDqcrxB5hvnX8XTPiQlxLD/2vauafMCCCq/5k
         ov9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755426; x=1790360226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9AGoVe097CFQTljKQVnFARTDua53EnwrZ8dQWbEJDU=;
        b=UWJCTX7m6UFBYOSDBnebugQ8wT3Mqo98TJs9tS2IE3qeAYIAhC3OaO7tWPsiIcsh29
         fDNtFfa6UzCPgajgtu9fsbiFchXHmeQ4gbg8ehD2aDhlZxeaS8GC5BkvkSdTvr4lMTlM
         vTY5EOcoWUoyV8cBoWDuqHQuZwbnTFezqo3AlEq1TFUmz83S05/LLBiPA29mCUuwcq2Q
         UeMkHF6lB2fm1efe5xzNaOOcfWF+HqsGi5eOL+ImTbixJ27F1GL71Z5/7yr+opIlJxE3
         S+e6u5kfop7nCqG5I0usKPLxXkVyUxYUim2oU+NvYImiZq7Ay3wESzK5dW+RvllWG3ml
         DBKw==
X-Forwarded-Encrypted: i=1; AKwUvBwkjVt8EYSxmI69poFmaWPI02OalOeHQhi3pmsj1F18zcqdVQ/ZitHKgk4X6mS5+DS3pgO2Cgbo6reEqPs=@vger.kernel.org
X-Gm-Message-State: AFuF++lodjIj7cuFUk5ff0hvDDN2QdNo4Gzp4AnHkA1ysB8QhhSGz48u
	Uw6ivREUGDHA4kCpZl1F4/8oI9rHYWsgSnHx34Q7G8BThtk9yWaatSiFSIBB85NLdf8=
X-Gm-Gg: AYBFou0pOhGDyPrMCHTzmlbhrxLrRXIGYT4fSGFwE3q+dTUmp1ceKQoZOsJNcvKGlMC
	6ug8TiHReTVTiFHBWaCbx5GtwmqZWtVJH1V7gai70h191XuL+voWx0koHGLo3Vm8vZcB5h1Dk6M
	9XCQFTPz1f6Zv/t31eEWD2Wu/SbFfxSDwB2MTSxhsKqxs/l0ItpFEvUiTjpN0+ZBrKlGBPflPlY
	W3x211zWJWiuDC/pXUYJIsNlmqaz4OONOygzspapwJfYRr/teTb78aao/QRjdXCIfTOE16xtqF4
	kTVlRAXwvMdoiOtXQRpjEWbcxwCZPRpVDzpd7k/3qQ5QEWeHU8u0lfMEoXGa24Ed3kc+WVKuXoq
	G0Un7vVX3PfNHY1LErQDsjT35mhgVoFY2fAn0dp6QIOZ0StUf4UGwZSHxT30+2JYWl7470A/B0i
	rrCmJeRILNARHVdFmNe7aN531BdSAhjy5SqJu2BV79B14wMEEHk2sskGQ0LIeGq5ylf1/GdtxnW
	IVVBx6/LzKt5Td9T+3M6VdiBn8Qj1GD
X-Received: by 2002:a17:90b:4c03:b0:39e:6c69:9b90 with SMTP id 98e67ed59e1d1-39e6c69b206mr680725a91.53.1789755426270;
        Fri, 18 Sep 2026 11:17:06 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:05 -0700 (PDT)
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
Subject: [PATCH 06/18] nvme: Rapid Path Failure Recovery read controller identify fields
Date: Fri, 18 Sep 2026 11:14:06 -0700
Message-ID: <20260918181614.3947933-7-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
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

