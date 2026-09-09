Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB04330B32
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933540; cv=none; b=sMBnC9otYC0TsaB2c0sI/fnoxYgw/vo0t7HA1m2nGsBCdcjxTIyCKXfB8Bs2mPUQF5RbygNRdqbT4B99c5CkIQhKax8WfiOJfHKVk/B4xSy5BV5nlbw6ur1EfUd6rkvUIc+hrEzzujaM7QONCwAnFhi1o6jJrXZMHJo1g8uHY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933540; c=relaxed/simple;
	bh=j2/rpIMHlyvQBXpjp1UnZyA6EtxR2Hk238RofMuM6Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Owx0JpBkYALkKXdDOAl43T3KpSm7TW8EUKoiSiB5W9Bm54h7Rk38jrLk5cwG+MuyzexT6pHawITXFvlMAW4soGCbrzKJQPE21xmwwMRMOD8FjjZPL3PZaM3+ItjzMNzFFz0vlUfnADDYeqxfefWqdeXeEFER6ylMhkk7hxk61+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OnXI7OVG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OnXI7OVG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cace91f112so46236405ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1788933538; x=1789538338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Yn17EsWeham9YF5uu/47qEPWL8ZeqKrd9IKLrIGf7Q=;
        b=OnXI7OVGQbhpEUM44aG8PSXmuYnpzluuIJl/fsDdBsTnML0AtWzJbw/aqty++I+bRT
         ufON8P2Sd+zRQbCBhUDHmynMWunDi4m2G8yg0DzT/SSV9cc0Kjwho1LWlTGIBbpMt0j4
         nBQORs+cW6Cxg4/9o8fDjGyEdF8ie+HRvTT+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933538; x=1789538338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yn17EsWeham9YF5uu/47qEPWL8ZeqKrd9IKLrIGf7Q=;
        b=YRZf1m6r7o8cMAbLbgK9p5Gj0DAxHoArEqZ6tPBbN1jjmzOjOUF8FP0pfhj0wNun8v
         px/OgIU0Rvp5lnJ/Qd0Xy6eEUcFIHlN7Pj5iq9JR5iXjo6T6SnCSoWN/sW8Je55TMcR2
         DuvIXm8g7AOaur42eb91eGDEHZkYuGm9HD3HQ0MqO8XmTdO7vMClKcSN6Cs8Ec9WLgtM
         vwy4jY9G0rvQATbRDXVWHuRyCkn4x4eLOWKultp0IdI+AEveftr9o0yPxPHy/Q2F1NVB
         Tf7AIClUaZS9gW62cF1UerqPOdel3zLrC9Mtv+8el94Pj+YPnDvvvMjl2GqrylMpWQAV
         gcDw==
X-Forwarded-Encrypted: i=1; AKwUvByND79t+uY8zIw+lMLkRk9Y/n0K0HDwmA/TbxzXV7xXtxsePxxvoeQHc0V0fUgDmI5ClyAkg7fBHMg6Fz0=@vger.kernel.org
X-Gm-Message-State: AFuF++nsjjPawaSTzAtWuZyy+/KJ0fO9bw5LatwUXAPWnx9RE73JJ+yU
	0jH4iE2CHBRHd/LgWXMkj73T3ex/IlBg5HxoDYqVPuJxtKHN/3nd0l8QIGXolMwqtmA=
X-Gm-Gg: AYBFou1z+RZhdIt2mHN13MDYJOS4kbmPsHdDzxLRPob0eZ7U6iFYKusZgUG4Zb1MH0H
	T8peIT3FZQC8ZWruygSFJD3c/HQchSbily56113/bRY5VTazBBpj+baeOSV2knvMhvJMfXC7JXJ
	uyO6vHX36bs5usFOqWrguZL7qRsikMn2XwGP1XNPY3I1GsIZJ+SMDyk0+253PNuCmDF+DZuOFEM
	sSgGE3iawRKv7PKx3JmEayoOAevSB7KPrQUgXfzc2hUjzW1yqkfSSwpuNEbi6q/cinDsKgEg6kx
	WAtjjpdIjTN7m+9KrYFGOn9G7L+cyyKziDbj6PbXJC3naa2xODpRuzesUUP5jqpjBGWTaH4QitT
	0/5Xp5ZnRg7AnxbvGYa8YgutRtXgiXHue+WweTKUcYzL+Hxi51Dh25SHJotSD9FlgSZNUq6se+i
	aaxISGrUB2jHiMVp22yoZobBmmvsX8gVcnPaeieA2SRUHHmq7a1kxPzymticUjb6yLOBc64mcjA
	+eYm9DJocgLsfHzffXQJdRJAcj8THzGWNCuJUzHbNqZNRR+ftp9H6ft2A8pV8ip3bYE8lIDgUX9
	Ay3hwdn4xx8OWPCfOl7SdOo/9PMi26+Cp9DpepJ7JiPkjzt2kULuxga38u1Hi1ttNWUYeor/59T
	BgZNQ6Bj4ZNi5oqupXTSKRgW9BViaywsen0sOOSFp
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39b260d333amr51199234a91.2.1788933537932;
        Tue, 08 Sep 2026 22:58:57 -0700 (PDT)
Received: from aegis ([175.158.204.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d6538acc3sm1290927a91.6.2026.09.08.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:58:57 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] net: qrtr: resend HELLO on MHI resume
Date: Wed,  9 Sep 2026 13:58:44 +0800
Message-ID: <20260909055846.16539-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the MHI HELLO exchange was relocated, it is sent only at device
registration. During a suspend-resume cycle, the firmware in WiFi
cards such as WCN7850 indefinitely waits for another HELLO,
triggering:

  ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110

Fix this by triggering the handshake from resume_early in the MHI
transport.

Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
suspend-resume cycles.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 net/qrtr/af_qrtr.c | 13 +++++++++++++
 net/qrtr/mhi.c     | 10 +++++++++-
 net/qrtr/qrtr.h    |  2 ++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 78347c937af7..2ffcfc2fdb4a 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
 	qrtr_port_put(ctrl);
 }
 
+/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
+{
+	struct qrtr_node *node = ep->node;
+
+	mutex_lock(&node->ep_lock);
+	node->hello_sent = false;
+	mutex_unlock(&node->ep_lock);
+
+	schedule_delayed_work(&node->say_hello, 0);
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
+
 /**
  * qrtr_endpoint_register() - register a new endpoint
  * @ep: endpoint to register
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 3990da1a65dc..50326ffa3401 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
 static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 {
 	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
 	enum mhi_state state;
 	int rc;
 
@@ -201,7 +201,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 		return rc;
 	}
 
-	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	if (rc)
+		return rc;
+
+	qrtr_endpoint_hello(&qdev->ep);
+
+	return 0;
 }
 
 static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 3f2d28696062..de2de69a6199 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
 
 void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
 
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
+
 int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
 
 int qrtr_ns_init(void);
-- 
2.53.0

