Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854560;
	b=nr9Olo9p+Gv5soDZiEM95Q3EZgj3f1zPIqQpavD0JYwOU2CP+lGsOVnMVT//nvw0ylv4
	 nfq56INBaCO6sjLLLgVIkXe0OFFMIJzE5BGjdzAAqhDwa3X9oGFyGWPSpBrMj08gOyMl+
	 zMzyC0vy5nQldtcTQsLs2z0Jzfbuc8vpw3TICFj1U/2vkd/ZS5kAJwegTPqP6q0jBU6jH
	 tfJvcB+VmLH3n8HSX/a9+BmuHZsTgl3TQq6/vEvcYcyGvSbStX/MQdxUpNFCd8e5PUr72
	 Fdo4K3PBk4FGykgPnIvbJ2UhuJbrTzMFaTLpVHEqJMVMNkPQJ1St0MIWrz9jX3M45xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
	b=5jDKERpP2QVvgZ6FcRY9AA5E02w/lxCY971dSUXk9BYNqzVPGnBMwHP4mdNDiC1Wxim5
	 SNKIVjKnvC+Ssa3aTM19mTG+k0+MvRzNpZjb8MuYkkMTLqc9Xl8rASAP+Iuo2NrbM4niZ
	 Gx7kSLr0dfq7H0sn+v61Jb6+zg/ejh4d7CreoOHUA30qzHo4zkOlNMaCr9xT46rAz6ucV
	 Vej1OP57NLniLoyemI7wtIKMmwC/eirz3BWKZWYoorkbjaDaZzvz+EP7NkaNSa+Phl1E0
	 7mtaWO1lB5OgHJf6akZQF4y06vEC8punkDGoXESbhM01RxGrC8oUJh8QIbMx2cNJ4zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKSPlzH3;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0E7606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0E7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKSPlzH3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37605faade6so405016eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854559; x=1795459359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
        b=nKSPlzH3BLgJx2O/d52RTsnCCsdJAG5TlR/mE9gMryBY4tjAi8tzoKd8YYF0LKwxNI
         KBsGNtVjvsxUOx2KCiOyE/wqPAM4a42lqFxmiLFTZsSr7RS1/Ootm9JmMB8KyeCIXWTF
         r5poNxeDJoh+QVvkorPkIqfpm7n5hhG7KuV4LG4Kb876kgyO07/+NkqEGs4le9sJ2/wW
         qauJ/lm1hIH080eZLrHLrXscODs8S7/JJeHraQj/g+KJKvsqWsB117vjzz8CGI8r6tKf
         LkKql+GH/xXkC9vai3hc1PWqxRXS+VONMhr6hxYHuKaMuwc/uPM16eV/YsgCe6rY04+w
         A05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854559; x=1795459359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
        b=00uX65YAd7sMb5quToQ4UM9GuvxppAw0wt7aiwLtl59eJM+w3LF+0E2EpLRQGgAaaw
         yu+WQLbkmGXQPgejELYN8kgRbYqDm4l87pjUXSG8bke1STOodDQZtoUESPPDChnNmtvp
         YfuRsih+9ARXXCGjusTHIg1k0aw6RAFXds47QunMpQRj6C/wLyV5TmQIDhr7QAhavNLS
         86eEsPKx3GpftPNg26eaMdnlD4y1g8JmSWoaMUB0B/v0ZLESsIeOUeWp88uOl0E049KM
         zrE0TkEFzLHyCPR/61IHiaueBJXFvBlIBunU8bjLU7LllO4q8fiWNQ1wqcfdcbsNynZC
         mtFw==
X-Forwarded-Encrypted: i=1; AL+hErG0YP2BXme3PjzfYbh6FrF/TEA9gshNykdhEBz9qZMKJ/hcmOwqYtgPHw5qPBQinUryvEWJua2dB70SJH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gckg4tXJLXTHLsOIcFLs5yJRv3PBh8JR7xYypJc2neCmsPNRa
	X66pqF/vPYQCiDUkL3T9mnwpEdrddKagT7b2QMFSKDjegT1kHKVLxw9a
X-Gm-Gg: AZFdTZc0JXqClNsxz5j1nKh2X4c+uIxCem/MIr6XEIlCPjk6XhYql5Q1E4NxkLzuYlm
	cnpcJ7IVYbPMZaoGS2j8w8s67UYYvyeBUaTBDGn7EJfo6w/pwFXwrXUBZhk8GvhkL8H8JyT0rPG
	bv8D+BCdjnB5Z75GN3bfdYAFL7//zsF3LhJ3zAgBKUmy8gW7S+8kwawHXyzvXWWFPg/Vnd1esfI
	aXbNdIrWCvIRazc9QVCuK/ws5VMIFwOMkw5WZ0QhGpuoXeyJ0C3lAT5znaqPZCMKXVhk3p6feWv
	QUKzHfjABdPBbspb4608SpFKaroOL+V710A4iLOcjjPazr670QfZqrdSDpikcf4KPAgECUKzYux
	ActkVLbizl9c4xMNy4YAH5WdqOZHYhJ/PRQ0+QKI58TESv52HDGokVo6Hvd5n1iOhY+Aa8ZY7/6
	6b63Zu+O9iPNdrCXvzZ6I4w/TVcO5nD8rUpOJ5XdGwYVze6eb996cNWQMBZThu5mKLYJoOUvEhn
	M7VyXgt6l/gnRfmiJ5hOcRR2S2oMDpxjJdl/l+j3bM0pGR7beLt2zSmi82rthfOsNXLQmgFQXMx
	f3lkXJ99Yv2vB203VlN5nsI7FPOUEYCJmNbm+aNB2YLBklFldK66STTfeicv6eoHTrlAb02g2G0
	=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr15977130eec.0.1794854559033;
        Mon, 16 Nov 2026 10:42:39 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm36893536eec.1.2026.11.16.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:42:38 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
Date: Tue, 17 Nov 2026 00:12:30 +0530
Message-Id: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The debugfs coredump and recovery write handlers compare input with
strncmp() bounded by the write length, which accepts any prefix of a
valid command (e.g. "e" matches "enabled"). The sysfs counterparts in
remoteproc_sysfs.c already use sysfs_streq(), which requires an exact
match and tolerates a single trailing newline.

Switch the debugfs handlers to sysfs_streq() for consistent parsing
between the two interfaces, and explicitly NUL-terminate the copied
buffer since sysfs_streq() expects a string. Tighten the length check
to leave room for the terminator.

Truncated commands that were previously accepted by prefix match are
now rejected with -EINVAL.

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 33 ++++++++++---------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index e8e7b6a3769b..ef6761a13c6c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -73,19 +73,16 @@ static ssize_t rproc_coredump_write(struct file *filp,
 				    loff_t *ppos)
 {
 	struct rproc *rproc = filp->private_data;
-	int ret, err = 0;
+	int err = 0;
 	char buf[20];
 
-	if (count < 1 || count > sizeof(buf))
+	if (count < 1 || count >= sizeof(buf))
 		return -EINVAL;
 
-	ret = copy_from_user(buf, user_buf, count);
-	if (ret)
+	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	/* remove end of line */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
+	buf[count] = '\0';
 
 	if (rproc->state == RPROC_CRASHED) {
 		dev_err(&rproc->dev, "can't change coredump configuration\n");
@@ -93,11 +90,11 @@ static ssize_t rproc_coredump_write(struct file *filp,
 		goto out;
 	}
 
-	if (!strncmp(buf, "disabled", count)) {
+	if (sysfs_streq(buf, "disabled")) {
 		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
-	} else if (!strncmp(buf, "enabled", count)) {
+	} else if (sysfs_streq(buf, "enabled")) {
 		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
-	} else if (!strncmp(buf, "inline", count)) {
+	} else if (sysfs_streq(buf, "inline")) {
 		rproc->dump_conf = RPROC_COREDUMP_INLINE;
 	} else {
 		dev_err(&rproc->dev, "Invalid coredump configuration\n");
@@ -211,26 +208,22 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 {
 	struct rproc *rproc = filp->private_data;
 	char buf[10];
-	int ret;
 
-	if (count < 1 || count > sizeof(buf))
+	if (count < 1 || count >= sizeof(buf))
 		return -EINVAL;
 
-	ret = copy_from_user(buf, user_buf, count);
-	if (ret)
+	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	/* remove end of line */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
+	buf[count] = '\0';
 
-	if (!strncmp(buf, "enabled", count)) {
+	if (sysfs_streq(buf, "enabled")) {
 		/* change the flag and begin the recovery process if needed */
 		rproc->recovery_disabled = false;
 		rproc_trigger_recovery(rproc);
-	} else if (!strncmp(buf, "disabled", count)) {
+	} else if (sysfs_streq(buf, "disabled")) {
 		rproc->recovery_disabled = true;
-	} else if (!strncmp(buf, "recover", count)) {
+	} else if (sysfs_streq(buf, "recover")) {
 		/* begin the recovery process without changing the flag */
 		rproc_trigger_recovery(rproc);
 	} else {
-- 
2.34.1

