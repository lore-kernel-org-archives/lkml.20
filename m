Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548892;
	b=mnjbEyWTx9Qvf/SOxTJz/VBv+ZPNnzSPKtfVhBRjCwOBQC3FgHqEQJBziQIKyVWeMgvs
	 J9+uFklkwWNhz+WVF1wY7o6EhIdsz9xxrfrlkG5ViMJ6irRhWKWmHHXBMCTnMUNPeVzx0
	 Zvkg7ghoEm/drlq1zzrY+InbPT6B9cofzAHQNs+hOKF6Gh4T1ByqEoL02yIssLu3NBNln
	 w0ojbTxuCaAEdrAudgZEkRbmymOHuduTaP5mOpIeOGLPOw9IQnpB5OtQ5PQepqgrO76r+
	 68fG1FubWYPmvKlcHEyN9R7JghKVOsBLHdTcCArOSyqDrEsYlu7bjNZFYX44UQl+gkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548892;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dJAjI256HYju+smarK/sFecvcjyXOoXB2UXk9HtpRA8=;
	b=20ISy001VI5FeuFhaPFxeokNCBs/N/eim7X5V1I/MrWmIKPYWX5iqrEhq0g38hDEWSiA
	 rpsNaX2Gn+7eIgGG82naUyidwA4Ho5ez3VzwfoV7UHs3IC6D3DRCFq6yH6PsBYrkMCxMT
	 iagV1SiDuywu9giOnrCZij86tWiwGxHGGJHNEyhvmnS9GIfJmzqHfqEI2825WENp7whxf
	 kMVjaHvQL0940PGXbYGBD//10FVjvPq+RMPP2S3RpJ3cKy7kZpHB7kJYUkqtKtj+MEDpo
	 Gmmdur19uxYdc/fydhFMXL7bvlleYVN68fcY+2ZgHWguAfadt1UJdozLnpZQkXbfP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=ZUCzD63D;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547E606A324;
	Sun,  1 Nov 2026 16:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B547E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=ZUCzD63D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793548885;
	bh=dJAjI256HYju+smarK/sFecvcjyXOoXB2UXk9HtpRA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZUCzD63DSRdrMEGTfiMCYIaqUrCTwmVQ69ub6q2NkDw6gvvu/4avWG/TRk1fhZVPw
	 KwbBi8q+j5NPWoKJkZWJH6gU4j26kdQRG4GLPNTCTqjclW1NgsltgULGBiLlxcI/PH
	 6EGKDS9iRK2DTDHXpE+brr6tWfEIQMUJ4+ebU7oA=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4D84AD9; Mon, 02 Nov 2026 00:01:13 +0800
X-QQ-mid: xmsmtpt1793548881t4gxc0hzc
Message-ID: <tencent_1E7A74EBC425C78E07DED39F31807B7E1D0A@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7VXtaDxIJMbnyZWPNEEi5lnAw/PKiMNYLrm4QS3fWT/7VliBWKo
	 wVkqf37fmaVukQ1DDu25FW5bTPqm90dpeRNKvTZL0AMVMmCJykhYrlaWwrZ/pNCHgnMFfW2wbwVJ
	 BQCTam0QDaL9lp8Jjius68lHf0Ji3oAZyDdsA1vnsoM/f0pKTB2Gx6RjVC9sRIqPlMkqGsmkBy8p
	 3pjKldcGNKsJEqWdSR/vphUMW7+CCZZbuQrwyFZC7bL7RH0381Y6xQAUoEtVWeGNxo3LMr11mlh3
	 3rlpfI/nBVWaOzsd9nrNjUYvQL3ovxK/AhOiXkdsHydODCLm6TrtEsdFZAc+H0s1lP0tHRxyDDkw
	 7marcOn+56TvjLi987o3xDk4y0DGmU4dHLoWTjP4nsRrq1TRGfNXckPY6emBLAvK3kgzaq3p5ZKh
	 ldaCCk6cuWq0lvA6fro14m6HN5ajixKHQs79Pf/7vcnt7p9fsBrw0/dMLhlKBP/FgNYrRdXYYZaO
	 LXOt9SzAUkPwEi7Pk+NI4rd+VRz1x8zKm9SLYYk2MYtPfKcarGKJYouReoNPcKgYWVPMJWRg/L4v
	 0k4Vf5itpQMmt74HYE6QgMTqIEgOa7O/Pk+pNhEaRO1Oi7Rbj172KJL87ewVLQgKv3C8x8CfJfwr
	 Yp8NeNYU3QCd2wvMxMI+Sw+iQIEiRaZCN762KMXNppDmdX1ct7Sm//WI1kWq4tVVKC6qXpmJJijd
	 vRe+cNTaRDSqDVMScY5RYbZ7Q092Uo6Ul1ew0NUrlOnhl0sGdXbj2rZaV5R+Q4Zfte0Z73x9sqFl
	 gHk7llNlOPIQCgFF29qDil8R7lRt2vp4bEcIfv0ePcCRJzaT0kp2/iYpl3Ip/5coFu26Ox4ZOIvP
	 3+4VOMl0a9NnvbsfFgCMD1FjhSCu4FuTE7BpfYAVqtbu0EiUUlu70ILuAwjgPwTFTheVbyhBRMbA
	 augxqhgjwJ6O1yIRBlk/VnPNxovtWcwjpJIUkl3PFka0VHOhiGdRHBtbGwLxR4nxQh0J6Lxuae89
	 TvxWLUHlJZ7HJsrQAN6az6mHyB2erfcD7N0uttXmVnoWq0uP8hGiqTySwzeQJqKt0+/qUiaw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Haozhen Li <dezige131@foxmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	=?UTF-8?q?Dawid=20Wr=C3=B3bel?= <me@dawidwrobel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haozhen Li <dezige131@foxmail.com>
Subject: [RFC PATCH 1/2] firmware: qcom: scm: Add QSEECOM app loading and shutdown
Date: Sun,  1 Nov 2026 16:01:08 +0000
X-OQ-MSGID: <20261101160110.3622-2-dezige131@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101160110.3622-1-dezige131@foxmail.com>
References: <20261101160110.3622-1-dezige131@foxmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QSEECOM clients in the kernel can currently only talk to trusted
applications that some earlier boot stage happened to load:
qcom_scm_qseecom_app_get_id() looks an app up and
qcom_scm_qseecom_app_send() talks to it, but nothing lets Linux start
one itself.

Add the two missing app-manager commands:

  - qcom_scm_qseecom_app_load() authenticates, loads and starts an app
    from an image staged in TZ memory, handing it over with the
    APP_START call. Both image layouts QTEE accepts are supported: a
    split image (.mdt metadata followed by the segment files, with the
    metadata length passed as mdt_len) and a single-file signed ELF
    (mdt_len == 0), where QTEE parses the metadata from the program
    headers itself.

  - qcom_scm_qseecom_app_shutdown() stops an app and releases its
    secure-world memory and name. Without it an app can only be loaded
    once per boot: QTEE refuses a second load, and only a reboot
    clears the name.

QTEE reads the image address passed to APP_START as a 32-bit value
even under the 64-bit SMC calling convention, and truncates anything
above 4 GiB. Catch that case in qcom_scm_qseecom_app_load() and fail
with -EINVAL rather than pass an address on for silent truncation: on
platforms whose firmware hands out memory above 4 GiB the load would
otherwise fail far from the cause, or worse.

Based on the QSEECOM transport work of Dawid Wrobel and samcday
(https://github.com/samcday/linux).

Signed-off-by: Haozhen Li <dezige131@foxmail.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 123 +++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  14 +++
 2 files changed, 137 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250fae..c77130693 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
  * Copyright (C) 2015 Linaro Ltd.
+ * Copyright (C) 2026 Dawid Wróbel <me@dawidwrobel.com>
  */
 
 #include <linux/arm-smccc.h>
@@ -115,7 +116,14 @@ enum qcom_scm_qseecom_tz_svc {
 };
 
 enum qcom_scm_qseecom_tz_cmd_app {
+	/*
+	 * APP_START and APP_SEND share the same command number and are
+	 * told apart by owner and service: APP_START is
+	 * QSEE_OS/APP_MGR, APP_SEND is TZ_APPS/APP_ID_PLACEHOLDER.
+	 */
+	QSEECOM_TZ_CMD_APP_START		= 1,
 	QSEECOM_TZ_CMD_APP_SEND			= 1,
+	QSEECOM_TZ_CMD_APP_SHUTDOWN		= 2,
 	QSEECOM_TZ_CMD_APP_LOOKUP		= 3,
 };
 
@@ -2168,6 +2176,121 @@ int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_get_id);
 
+/**
+ * qcom_scm_qseecom_app_load() - Load and start a QSEE application.
+ * @img:     Image buffer, must be allocated from TZ memory.
+ * @mdt_len: Length of the .mdt metadata at the start of @img, or zero if
+ *           @img is a single-file image.
+ * @img_len: Total length of the image in bytes.
+ * @app_id:  ID assigned to the loaded application.
+ *
+ * Hands an application image to QTEE for authentication, loading and
+ * starting, and returns the ID under which qcom_scm_qseecom_app_send()
+ * reaches it.
+ *
+ * Two image layouts are accepted. With a non-zero @mdt_len, @img holds the
+ * .mdt metadata followed by each segment file concatenated in
+ * program-header order; in that layout the metadata segments appear twice,
+ * as the .mdt already contains them, and padding between segments is
+ * dropped. With @mdt_len == 0, @img is a single signed ELF passed as one
+ * file, and QTEE parses the metadata from the program headers itself.
+ *
+ * The image buffer must lie entirely below the 4 GiB physical mark: QTEE
+ * reads the image address as a 32-bit value even under the 64-bit SMC
+ * calling convention, so a buffer above it would be truncated into a wrong
+ * address. Such buffers are rejected here rather than passed on.
+ *
+ * Return: Zero on success, nonzero on failure.
+ */
+int qcom_scm_qseecom_app_load(void *img, size_t mdt_len, size_t img_len,
+			      u32 *app_id)
+{
+	phys_addr_t img_phys;
+	struct qcom_scm_qseecom_resp res = {};
+	struct qcom_scm_desc desc = {};
+	int status;
+
+	if (!img || !img_len || mdt_len > img_len)
+		return -EINVAL;
+
+	/*
+	 * Unlike the lookup command, which passes a buffer holding the name,
+	 * the image is handed over as a bare physical address: all three
+	 * arguments are plain values.
+	 */
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
+	desc.cmd = QSEECOM_TZ_CMD_APP_START;
+	desc.arginfo = QCOM_SCM_ARGS(3);
+	desc.args[0] = mdt_len;
+	desc.args[1] = img_len;
+
+	img_phys = qcom_tzmem_to_phys(img);
+	if (!img_phys)
+		return -EINVAL;
+
+	/* See the comment on the 4 GiB limit in the function doc above. */
+	if (upper_32_bits(img_phys) || (u64)img_phys + img_len > SZ_4G) {
+		dev_err(__scm->dev, "qseecom: image buffer beyond 4GB: %pap\n", &img_phys);
+		return -EINVAL;
+	}
+
+	desc.args[2] = img_phys;
+
+	status = qcom_scm_qseecom_call(&desc, &res);
+	if (status)
+		return status;
+
+	if (res.result != QSEECOM_RESULT_SUCCESS) {
+		dev_dbg(__scm->dev,
+			"qseecom: app load rejected: result %llu, type %llu, data %llu\n",
+			res.result, res.resp_type, res.data);
+		return -EIO;
+	}
+
+	if (res.resp_type != QSEECOM_SCM_RES_APP_ID)
+		return -EINVAL;
+
+	*app_id = res.data;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_load);
+
+/**
+ * qcom_scm_qseecom_app_shutdown() - Stop and unload a QSEE application.
+ * @app_id: The ID of the application to unload.
+ *
+ * The counterpart to qcom_scm_qseecom_app_load(): stops the application
+ * and releases the secure-world memory it occupies, freeing its name for a
+ * later load. Without this an application can be loaded only once per
+ * boot: QTEE refuses a second load, and only a reboot clears the name.
+ *
+ * Return: Zero on success, nonzero on failure.
+ */
+int qcom_scm_qseecom_app_shutdown(u32 app_id)
+{
+	struct qcom_scm_qseecom_resp res = {};
+	struct qcom_scm_desc desc = {};
+	int status;
+
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
+	desc.cmd = QSEECOM_TZ_CMD_APP_SHUTDOWN;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	desc.args[0] = app_id;
+
+	status = qcom_scm_qseecom_call(&desc, &res);
+	if (status)
+		return status;
+
+	if (res.result != QSEECOM_RESULT_SUCCESS)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_shutdown);
+
 /**
  * qcom_scm_qseecom_app_send() - Send to and receive data from a given QSEE app.
  * @app_id:   The ID of the target app.
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc022..8f98b57e1 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -141,6 +141,9 @@ int qcom_scm_shm_bridge_delete(u64 handle);
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
+int qcom_scm_qseecom_app_load(void *img, size_t mdt_len, size_t img_len,
+			      u32 *app_id);
+int qcom_scm_qseecom_app_shutdown(u32 app_id);
 int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 			      void *rsp, size_t rsp_size);
 
@@ -151,6 +154,17 @@ static inline int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 	return -EINVAL;
 }
 
+static inline int qcom_scm_qseecom_app_load(void *img, size_t mdt_len,
+					    size_t img_len, u32 *app_id)
+{
+	return -EINVAL;
+}
+
+static inline int qcom_scm_qseecom_app_shutdown(u32 app_id)
+{
+	return -EINVAL;
+}
+
 static inline int qcom_scm_qseecom_app_send(u32 app_id,
 					    void *req, size_t req_size,
 					    void *rsp, size_t rsp_size)
-- 
2.43.0

