Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103221;
	b=E1i4CrC+9YbDT69cI0vc/7G/RszMf0G535b4d9VnDm/dOY6uUjR4M6F3m603TzhP80Nm
	 uia7Bb1WCsS6J5hiseVRIf5jxnd+C31Qa0x1DHgYOQmgwwox13pFbScI3UA2E8+JJQwZA
	 G9zNAMZQaIIecdHJLYUFQAiitnRDkRTvXuhxYMiJSc/34/Bwc5EChB6IegWUiQneEfpGc
	 ovnFO1SRy94h3N2Pn0CmbT9ivRFmnp4bccayhbLM0I0hNUZrSV2eLynoEC9EhTZufkho3
	 3adlT007LpJC8zDcNnADjMSlhp+Flp/IRnP7pVyHdk/68lgaea7qBGTPNYvg1stlEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103221;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AVwkpBeu8NdqS/JctIui3XfwTxf0w6hxtjzhtDZNdX8=;
	b=r66bjAOfZ18pf7Kqnss55rSKYuiY6XmH+h0OQD5fR/dn/VGYQu7VU5fj+UGDfc8vCOaA
	 H6UDBmCvSzoYLBduO+XWGj+/9BA8A41sVbQ+fmW17gCtvf7s0u1VVxZULUU2H4kTnACO9
	 VJiKO+WO5LEFk3p0g7ojIZ7wPY+2YuFlug6CBaraSEPtnEEtkldFGvBMug3gMxhuQmiQa
	 ak8uZIkHyTdIIz11QuiHRc9jEwyfB3sw3timqj9R0rVbA8x5tC4Y2sYBcN7ejApXJ1cZU
	 4qgzdRpm2kk3mPnPGq/25aZgqzGcTrCaY7zsaokCtJ4JoBtztNlAK87G1BeV+46Kzzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=sMORe8ff;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AF60A2611;
	Tue, 27 Oct 2026 12:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9AF60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=sMORe8ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793103215; bh=AVwkpBeu8NdqS/JctIui3XfwTxf0w6hxtjzhtDZNdX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sMORe8ff+a8ggXDmBktiSwJ8ie090bEVItqjxCoUq22FxCOxq0tFHf0m6rKqUJ1Bf
	 1NFlOVo7BJShxlCRveFLAHqkfhXjaLB9zjhPVoxUl772K5QNOelKBELhNJ+upqs7P0
	 HhzjFX10P4ap65aDuXUPk6iZLtl2jF8WZP6+laUk=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2e7f:4b13:c1e3:e391])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 35D23E21; Tue, 27 Oct 2026 20:13:29 +0800
X-QQ-mid: xmsmtpt1793103212tfvq3ejc2
Message-ID: <tencent_02EC3FD2E750D09B95ACA70091EE65DE0906@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/Q/KZUGeG8LdJVBltaHZhj/6AWec96xENzjDyRt9GtIOIwuqwAK
	 nOi+6IOkDiSmKNPzkZceqpEwOElKr1BS3VB/KNNLJcbJadDjbp4f5EIyBd2u2rHwg5n52Noejd99
	 3Bat3FJQkUI+YSoxW6NJKkt3ieo3Z+oneV8dmLiUAsc9NRiXWeb0SoUt4Onl6sXgpUjlV8+PP1ln
	 olKzGjKI17mn5H48v7JMGQR9IKX6wsGQl366/ukIvB4QZRRLBvZabJB03o1p+yZ5gQu0+kdA7lqJ
	 lWx5q+wzmOsWC/9V7cc4wFvCU1neRJRkVNmhqb/OnhGxsHNmyU0AO9tQZNYvmWlRGhHU5hTSBkxk
	 SleGW1hNp+f8b1LTtohUhcGHqJXyS7K9tTYT+GmMTcIUMDoox85c1YtXiNnOc+GmMzfmDsoqjFzn
	 fcpxBDdnR09EwN5a7akKD0x0ADBHVmfUSb1/EX5TYTvEdG1l1OG1//lZFHXmJddN6RWq7PvIPyBx
	 k3frwmBH+FHlnm6ISkNR9bUeSIR8u3XoZioevq2JIDpkH6s9Stb/aVyKU6veHBQHUNdxRDW+grJp
	 uiT2lM/lH/Azd1kM9x3RaZJuyTW5udvS712T+GaxMgY26tY33GX97MuWW6PPKxiQhTu2sHhEXVP5
	 vZUZY00fu792YfKXbiZ5t1PsaPrkFAbt2OeqiLmbuo36vl97t0T5yE/2gkBgRtmLz1UAZfDA02ic
	 cSMJYBV9IlbTF7Gp9cGmXxB786nuiKzJ3os9zYuHzBiRSk8KY69RLkVYQIEOnr6U/Tk1gQhchkIt
	 hwBlOKCzV9caTkC3w96RhnhN6tyjfDdcC5UIQzlhpq/NbA9i/Vv5izliSZs+dEwSRXhzn5Txu3Ie
	 r/dXia+BjZDPze3fAqyPrOhx/PPpkuC4afXXmMQKly214zqFmQ6z9F1zN9vzOCoS95/NIr409Cny
	 Q5Y4NLBLoSTGEiUMjLIh5hILxw0J73RVUz6ksgvmzXxEbIeQWlGIoYQCSCwgbodklMRjhvjIcHAC
	 0MIyk0TyUUC4IvX5IdHmi/4NSVSLNiqjzWTOc9fQ411v8YxK0zUYhh/aqooEwnPJhe9UjQhJ99Xb
	 2cCYbFuspaUEiiI5yeaHBG+jhs9A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Yingjie Wang <1075151112@qq.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] nvme-tcp: validate the TLS handshake timeout
Date: Tue, 27 Oct 2026 20:13:29 +0800
X-OQ-MSGID: <d229a135c68b8713acd0ed48c2b79254f7fc7b6c.1793103202.git.1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793103202.git.1075151112@qq.com>
References: <cover.1793103202.git.1075151112@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tls_handshake_timeout is writable but stored as a signed int. Multiplying
the value by MSEC_PER_SEC and HZ therefore uses signed arithmetic.

With HZ=1000, setting it to 2147484 overflows both multiplications. If
the handshake request is accepted and its completion remains pending,
schedule_timeout() reports a wrong timeout value with a stack dump and
returns zero. The handshake then fails immediately with -ETIMEDOUT,
while the handshake agent was given about 24.9 days. Negative values
such as -1 have the same kernel-side effect.

Store the parameter as an unsigned int and reject values that cannot be
represented both by tls_handshake_args::ta_timeout_ms and by a safe
jiffies delay. Take one snapshot so a concurrent parameter update cannot
give the handshake agent and completion wait different timeouts.
Document the accepted range for built-in use.

wait_for_completion_interruptible_timeout() returns the remaining
jiffies as a long after a successful completion. Keep that result in a
long because an accepted timeout can exceed INT_MAX jiffies on 64-bit
systems.

Negative and oversized values now fail with -EINVAL. Keep zero valid,
preserving the existing immediate-timeout behavior.

Fixes: be8e82caa685 ("nvme-tcp: enable TLS handshake upcall")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/nvme/host/tcp.c                       | 34 ++++++++++++++-----
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cc54d5f169f67..a5adbf58fb8f7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4801,6 +4801,11 @@ Kernel parameters
 			Example:
 			nvme.quirks=7710:2267:bogus_nid,^identify_cns-9900:7711:broken_msi
 
+	nvme_tcp.tls_handshake_timeout=
+			[NVME] TLS handshake timeout in seconds. Valid values
+			range from 0 to the smaller of UINT_MAX / 1000 and
+			MAX_JIFFY_OFFSET / HZ. Default: 10
+
 	nvmet_tcp.tls_handshake_timeout=
 			[NVME] TLS handshake timeout in seconds. Valid values
 			range from 0 to the smaller of UINT_MAX / 1000 and
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index f876375dffd21..f0c18e1844eb9 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
 #include <linux/slab.h>
 #include <linux/async.h>
 #include <linux/err.h>
@@ -48,9 +49,24 @@ MODULE_PARM_DESC(wq_unbound, "Use unbound workqueue for nvme-tcp IO context (def
 /*
  * TLS handshake timeout
  */
-static int tls_handshake_timeout = 10;
+static unsigned int tls_handshake_timeout = 10;
 #ifdef CONFIG_NVME_TCP_TLS
-module_param(tls_handshake_timeout, int, 0644);
+static int tls_handshake_timeout_set(const char *val,
+				     const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, 0,
+		min_t(unsigned long, UINT_MAX / MSEC_PER_SEC,
+		      MAX_JIFFY_OFFSET / HZ));
+}
+
+static const struct kernel_param_ops tls_handshake_timeout_ops = {
+	.set = tls_handshake_timeout_set,
+	.get = param_get_uint,
+};
+
+module_param_cb(tls_handshake_timeout, &tls_handshake_timeout_ops,
+		&tls_handshake_timeout, 0644);
+__MODULE_PARM_TYPE(tls_handshake_timeout, "uint");
 MODULE_PARM_DESC(tls_handshake_timeout,
 		 "nvme TLS handshake timeout in seconds (default 10)");
 #endif
@@ -1799,8 +1815,10 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 {
 	int qid = nvme_tcp_queue_id(queue);
 	int ret;
+	long wait_ret;
 	struct tls_handshake_args args;
-	unsigned long tmo = tls_handshake_timeout * HZ;
+	unsigned int timeout = READ_ONCE(tls_handshake_timeout);
+	unsigned long tmo = (unsigned long)timeout * HZ;
 	key_serial_t keyring = nvme_keyring_id();
 
 	dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
@@ -1814,7 +1832,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 	if (nctrl->opts->keyring)
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
-	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.ta_timeout_ms = timeout * MSEC_PER_SEC;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	ret = tls_client_hello_psk(&args, GFP_KERNEL);
@@ -1823,10 +1841,10 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 			qid, ret);
 		return ret;
 	}
-	ret = wait_for_completion_interruptible_timeout(&queue->tls_complete, tmo);
-	if (ret <= 0) {
-		if (ret == 0)
-			ret = -ETIMEDOUT;
+	wait_ret = wait_for_completion_interruptible_timeout(&queue->tls_complete,
+							     tmo);
+	if (wait_ret <= 0) {
+		ret = wait_ret < 0 ? -ERESTARTSYS : -ETIMEDOUT;
 
 		dev_err(nctrl->device,
 			"queue %d: TLS handshake failed, error %d\n",
-- 
2.43.0

