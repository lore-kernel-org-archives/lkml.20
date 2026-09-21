Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5344A3E6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977103; cv=none; b=FU5FX9iHVMv8Eo96ZapAl2CZDpu3NrjLdo7rgp7S681AJAPh774H7ldTsY4gD8ebx1rt0as2AKQaJtAhBvclM19V3VQz383WiAbsa8qQKlUQuJurFL1VlW5GCQUjT0QfOPVwU/cjNMoPzkcZ+PgTp+6W//03nyShkdHsONEP60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977103; c=relaxed/simple;
	bh=1sPWSo/ze+34c6q6DLdKEF4oZ9Qog3eBvO+2iEs87JY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7ogF9/6Nhvm+L8rgt7Hl95JDgr0W7wGBUEM6ubfHggr1nS8EcwAIlMhxw+HltCD4RmJXXBT6L3hH5IRV1U/5byKqsPnkMEQdbdSZyLex0d4I0qEP2ux5MCNy/coee1walwtufXGDAD1wiPiG+zlD0JVyqXgaeJaR9350Utxhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HUVRPP9A; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HUVRPP9A"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3OMOKHpD7ulr2m9IDnPxpFfRC91YhtYm/2SLkFlgfTA=;
	b=HUVRPP9A8UFsCVT9tT3c543xKpKNeC+y2zYTwidWFsARx9xRk0iRSEEw2ZNdhsDMIrKLVA+S+
	XfumiSLokoIHDpsscgBEQn0fjQuwkieZ1mOfj+QSoha2/y7TTYsh6NDD6p3APmArq6fF+PGvC1K
	jj451b3Hw6UdTMT4XHak5R4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hpFWf6XdszmV8f;
	Mon, 21 Sep 2026 15:40:30 +0800 (CST)
Received: from kwepemf200011.china.huawei.com (unknown [7.202.181.237])
	by mail.maildlp.com (Postfix) with ESMTPS id CCB7540573;
	Mon, 21 Sep 2026 15:51:32 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200011.china.huawei.com (7.202.181.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:51:32 +0800
From: Weili Qian <qianweili@huawei.com>
To: <gregkh@linuxfoundation.org>, <--to=herbert@gondor.apana.org.au>,
	<--to=zhangfei.gao@linaro.org>, <--to=wangzhou1@hisilicon.com>,
	<--cc=linux-crypto@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <--cc=huangchenghai2@huawei.com>,
	<--cc=liulongfang@huawei.com>
Subject: [PATCH 2/2] crypto: hisilicon/qm - implement uacce get_dev_usage callback
Date: Mon, 21 Sep 2026 15:51:31 +0800
Message-ID: <20260921075131.1062155-3-qianweili@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921075131.1062155-1-qianweili@huawei.com>
References: <20260921075131.1062155-1-qianweili@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200011.china.huawei.com (7.202.181.237)

The HiSilicon QM driver does not implement the get_dev_usage callback,
so the dev_usage sysfs attribute is hidden on its UACCE devices and
userspace cannot query per-channel usage through sysfs.

Implement hisi_qm_get_dev_usage and register it in uacce_qm_ops. For
each channel the callback reads the channel-usage register and derives
the usage via the existing qm_usage_percent() helper, moved to qm.c
with a shared declaration in qm_common.h to avoid duplication.

The channel-usage registers exist only on QM_HW_V5 and later, so the
callback returns -ENODEV on older revisions.

Signed-off-by: Weili Qian <qianweili@huawei.com>
---
 drivers/crypto/hisilicon/debugfs.c   | 17 ---------
 drivers/crypto/hisilicon/qm.c        | 52 ++++++++++++++++++++++++++++
 drivers/crypto/hisilicon/qm_common.h |  1 +
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/hisilicon/debugfs.c b/drivers/crypto/hisilicon/debugfs.c
index 3ee6de16e3f1..83dfbe74e704 100644
--- a/drivers/crypto/hisilicon/debugfs.c
+++ b/drivers/crypto/hisilicon/debugfs.c
@@ -1040,23 +1040,6 @@ void hisi_qm_show_last_dfx_regs(struct hisi_qm *qm)
 	}
 }
 
-static int qm_usage_percent(struct hisi_qm *qm, int chan_num)
-{
-	u32 val, used_bw, total_bw;
-
-	val = readl(qm->io_base + QM_CHANNEL_USAGE_OFFSET +
-				chan_num * QM_CHANNEL_ADDR_INTRVL);
-	used_bw = lower_16_bits(val);
-	total_bw = upper_16_bits(val);
-	if (!total_bw)
-		return -EIO;
-
-	if (total_bw <= used_bw)
-		return QM_MAX_DEV_USAGE;
-
-	return (used_bw * QM_DEV_USAGE_RATE) / total_bw;
-}
-
 static int qm_usage_show(struct seq_file *s, void *unused)
 {
 	struct hisi_qm *qm = s->private;
diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index c01966a4a33f..6cd1e98dd9e3 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -2884,6 +2884,57 @@ static u32 hisi_qm_isolate_threshold_read(struct uacce_device *uacce)
 	return qm->isolate_data.err_threshold;
 }
 
+int qm_usage_percent(struct hisi_qm *qm, int chan_idx)
+{
+	u32 val, used_bw, total_bw;
+
+	val = readl(qm->io_base + QM_CHANNEL_USAGE_OFFSET +
+		    chan_idx * QM_CHANNEL_ADDR_INTRVL);
+	used_bw = lower_16_bits(val);
+	total_bw = upper_16_bits(val);
+	if (!total_bw)
+		return -EIO;
+
+	if (total_bw <= used_bw)
+		return QM_MAX_DEV_USAGE;
+
+	return (used_bw * QM_DEV_USAGE_RATE) / total_bw;
+}
+
+static int hisi_qm_get_dev_usage(struct uacce_device *uacce, char *buf, int size)
+{
+	struct hisi_qm *qm = uacce->priv;
+	struct qm_channel *channel_data = &qm->channel_data;
+	const char *sep = "";
+	int ret, i, len = 0;
+
+	if (qm->ver < QM_HW_V5)
+		return -ENODEV;
+
+	ret = qm_pm_get_sync(qm);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < channel_data->channel_num; i++) {
+		ret = qm_usage_percent(qm, i);
+		if (ret < 0)
+			goto out;
+
+		if (len >= size)
+			break;
+
+		len += scnprintf(buf + len, size - len, "%s%s: %d",
+				 sep, channel_data->channel_name[i], ret);
+		sep = "\n";
+	}
+
+	ret = len;
+out:
+	qm_pm_put_sync(qm);
+
+	return ret;
+}
+
 static const struct uacce_ops uacce_qm_ops = {
 	.get_available_instances = hisi_qm_get_available_instances,
 	.get_queue = hisi_qm_uacce_get_queue,
@@ -2896,6 +2947,7 @@ static const struct uacce_ops uacce_qm_ops = {
 	.get_isolate_state = hisi_qm_get_isolate_state,
 	.isolate_err_threshold_write = hisi_qm_isolate_threshold_write,
 	.isolate_err_threshold_read = hisi_qm_isolate_threshold_read,
+	.get_dev_usage = hisi_qm_get_dev_usage,
 };
 
 static void qm_remove_uacce(struct hisi_qm *qm)
diff --git a/drivers/crypto/hisilicon/qm_common.h b/drivers/crypto/hisilicon/qm_common.h
index 0760bf55f13e..78bcf40bd851 100644
--- a/drivers/crypto/hisilicon/qm_common.h
+++ b/drivers/crypto/hisilicon/qm_common.h
@@ -75,5 +75,6 @@ struct qm_aeqc {
 int qm_set_and_get_xqc(struct hisi_qm *qm, u8 cmd, void *xqc, u32 qp_id, bool op);
 void hisi_qm_show_last_dfx_regs(struct hisi_qm *qm);
 void hisi_qm_set_algqos_init(struct hisi_qm *qm);
+int qm_usage_percent(struct hisi_qm *qm, int chan_idx);
 
 #endif
-- 
2.43.0

