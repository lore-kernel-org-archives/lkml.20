Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794483658;
	b=4MfYXFH01FwoQtZ4Gus+HhTit0ppkMyIhPeJVrHnD2YpOR0lX+aQSZLtIbAF7vVxWKF5
	 2j3hGjbpYglEpcpKnrgBUBH422Lhu+PQTKeOp4SwY4RZ8aQn5ChnNyYOAfPcJOvNvgOwK
	 ma1aOq/Y4aNQRLqRZ+cJK7daKMUR7k9kXwskjo590U4aBaHUUSd8igGsffMbsi84BBk0l
	 /OChtQ6zbFC5tjgP7t8ebAhiaQVjIqr2oHaWiIqooDFBA8G3ZwcCTrMCmjoxnW1R1/qUP
	 NNKB3oQVR2YMs2fM3zweXR64H5tNyE4fD3H012RKrYUjkDY09RDwx2BuEQ62lBVrDMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=wM24HzJo5SgoyahqH1N+mlIgVn3NmNC93o5DATtIpcY=;
	b=2aNKYBBSPcaMzSVqmm1XQFNwSFEjg5HE+GTGTrJaSBnO8YIX/EGIYoDuxEyoJbPRWHmf
	 Rqu97PZ6Y85Ozpsc3LvumHGyJ4KFSrIGEKYjZdAGAeloHbBiUstqWdhDvo1l6/MWSkQ0D
	 NxB5EpPTldtHCVdtJm1/EIMg7RnpKhZ2XlQ63/EO+/bFo8wg5CpPDPexgmj5hNmxaNouw
	 H4en/UlcfuV5C1ojUaYkukylwnx3zp8aRCLHxjUBloqSvyvFindc3GVSIkBUKbZkTyEGV
	 Q2Iwi6OAEI1OjYYh1L5UFSZ2N+1vSxtfpbFHf8EveqF3oA7XkfSAHL30vIBjVkB68iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ILZ1LtJZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638D606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4638D606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ILZ1LtJZ
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6D4A7200668;
	Thu, 12 Nov 2026 12:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794483655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wM24HzJo5SgoyahqH1N+mlIgVn3NmNC93o5DATtIpcY=;
	b=ILZ1LtJZF8jAjg3m7UGL2SZOXSBEszlnW4/1QCIMHv3cM3+xMvUmFnjB7gO9EeuVN9PTca
	tmsf2yhtfSGJU+iD5m/d24hxKd6VAMu/6DwUL4tefwuEQu9zM/5lOfCSTR4c4UkA4L64E6
	yY4APW32mRwvVCg+L1VUdDhvnZn0J/0+YhpX9n+ZAtdi9eZh2q+wJZgq4c9+uQ123ODBD5
	br7wrOH682+D4yxxpBuAVEYnnITk2ulc+c1P2bkPv5IqtGVKLMe+4cQH3ZO0Fjc+2D/XlI
	tCCVMXrt1kk/BPpKbxRwRb9yD95T5zLYpw93R1VD6YmmbpSdJf000hdef4myHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794483655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wM24HzJo5SgoyahqH1N+mlIgVn3NmNC93o5DATtIpcY=;
	b=NXupRJ7eQHn6Q05YqdlQoTUzErclt7wB93lrTE/KBOJfZtu0DSwi1N1+EbJiPi60bNJWnf
	K+ZI9eEpHUJcz7mHpMY30lZNiPia+VroKkE5fAnAu+S570KpBVv5ol7pJO5RnO3PoCXTB6
	z1jk1YSDn2Vqwtc43zRVDleuxhJcHxjASsP0Tv1fYZelRwUNCWQUefdbVxpX5sYSMptexc
	t5uGt5/yTOPFP1Y3Y8yQHtNPbGO/uNzfuHTFLxQyelovFq/yNGd1TnyLJSCP4CgkMKbucY
	B4l4l0qgiCnCIs6c9vqCsg0ebUE/EWNPbOdi5QKcuo3CtkNBFsdPkhT421pKkw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794483655; a=rsa-sha256;
	cv=none;
	b=OF7TiWDaMLiRSr95U+O3qm4ZDbjksuy8iFYLYoBis4ix7ESJNOVdYWPjtcTscuxz4ZgIeX
	MpGwf0xSDyeYJRWkrWLqGqUQTMcsKbj1wEKtXiwcAvPZ9cK4yWLKIs7NNKHAfQFwH6OWyF
	2vVQAAmciQFmYMAxSDtTXLcEw7t4MyXhHt4ws9Kq29WGy2H+xn5+u23SZxuM8pKblPQLjE
	TeKYhZlAYJ1Yz5neXTqGH9ahScAv8JpT4ODce/0HDMs+/yufsqky9Pb8ef3GFiwcjzfEbA
	7PO3yxt730EvgRDzrqZazfE9S7HfyaDVEhPnwPw7PpqNwvjcr/W7ONlBGYDR7A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xRTAl-003oEs-1C;
	Thu, 12 Nov 2026 12:40:55 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 12 Nov 2026 12:40:52 +0100
Subject: [PATCH] reset: core: Add reset_control_pulse() helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-reset-control-pulse-v1-1-25cea105883e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAMOl9WoC/yXMQQrCMBBG4auUWTuQBOnCq4iLOvnVkZKUmVSE0
 rsbdfkt3tvIYQqn07CR4aWutXTEw0DymModrLmbUkhjjDGxwdFYamlWZ17W2cESAqY8HiUjUS8
 Xw03fv+v58rev1yekfVe07x+5ekjWdwAAAA==
X-Change-ID: 20261112-reset-control-pulse-c00ead64cde2
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.16.1-dev-53874

Add a helper function reset_control_pulse() that first calls
reset_control_assert(), then fsleep()s for a number of microseconds,
and then calls reset_control_deassert().

This allows to simplify a common pattern in consumer drivers that
need to pulse an exclusively controlled reset line for a certain
duration.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/core.c  | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index bd82a0cf56c3..5d7f92667186 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -9,6 +9,7 @@
 #include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -722,6 +723,42 @@ int reset_control_bulk_deassert(int num_rstcs,
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_deassert);
 
+/**
+ * reset_control_pulse - asserts the reset line, sleeps, then deasserts
+ * @rstc: exclusive reset control to pulse
+ * @usecs: requested sleep duration between assert and deassert in microseconds
+ *
+ * Calls reset_control_assert(), fsleep(), and then reset_control_deassert() on
+ * an exclusive reset control. The caller must make sure that the reset line is
+ * previously deasserted, otherwise this is equivalent to a delayed deassert.
+ *
+ * If rstc is NULL it is an optional reset and the function will just
+ * return 0.
+ */
+int reset_control_pulse(struct reset_control *rstc, unsigned long usecs)
+{
+	int ret;
+
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (rstc->shared)
+		return -EINVAL;
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0)
+		return ret;
+
+	if (usecs)
+		fsleep(usecs);
+
+	return reset_control_deassert(rstc);
+}
+EXPORT_SYMBOL_GPL(reset_control_pulse);
+
 /**
  * reset_control_status - returns a negative errno if not supported, a
  * positive value if the reset line is asserted, or zero if the reset
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 9c391cf0c822..8c61ca993919 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -76,6 +76,7 @@ int reset_control_reset(struct reset_control *rstc);
 int reset_control_rearm(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
+int reset_control_pulse(struct reset_control *rstc, unsigned long usecs);
 int reset_control_status(struct reset_control *rstc);
 int reset_control_acquire(struct reset_control *rstc);
 void reset_control_release(struct reset_control *rstc);
@@ -132,6 +133,11 @@ static inline int reset_control_deassert(struct reset_control *rstc)
 	return 0;
 }
 
+static inline int reset_control_pulse(struct reset_control *rstc, unsigned long usecs)
+{
+	return 0;
+}
+
 static inline int reset_control_status(struct reset_control *rstc)
 {
 	return 0;

---
base-commit: fbcd5a23e1472fd774c1b6f5a393cfb9371a751f
change-id: 20261112-reset-control-pulse-c00ead64cde2

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

