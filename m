Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541227;
	b=fB7B/U/IdMtqplWQ6FwMY65EF0/csaaGb9uisHNeMTJ9nyaPpTsQquhrmVkmcmH2ykAE
	 GU8WMojVehcTtGgfHZZkBfwZE8ULl4bJuI1cJHsrwLqtIlUSheGR4gwQ95G2lg2+GD1vn
	 lP866kYW2Fe/tFkRNzHUxWLPl0nWFdGcfeHdQj/oe76+pHA3LjbMXLpiUbAC4fSWa9kg0
	 2G8coBTH42czwfk8b5NTldiWnmMMWsJlFfw7f2fvL/AE6k8OINbxu/sBUwGCVLimVo8YP
	 GwAxr3sodql3naDIUesR5oSxlTXU5XI36Vh8/FQ/VjNFpjEm6JtON9rSEX1yHVdYWKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
	b=vCOIvBVHLywf/KhFKOGWlICKtOHqrbSIuKqiMx6fnQIbTw6aOWR94AyRr4Cx2naC8JMZ
	 LcgHrxgh8H0xNgjOagElyMOGvfHOWSzkQI7sntrsk+rzuoOeOMoqXfbbkTCAg9XYpYX1T
	 GVXESgy4RRC+SXKwWw/gRjTaYWimm4AYztNFjLGwIM2J0/jN+eOAu1z1Ogz0qT2S+mjwV
	 LgEXqyj+9Py9eNhcDaH+Vo3YzcGK8Aol90w3bDt2VILXFo60XzkzlRJJ8/KrcxsdHh7o+
	 92W+cLMLjZ+rEwFOE5YApjXYj2gqZ+M6WS8ePK+8S27F4JQ7PT6LoNGQiMB1Pexaxhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b="kOnu/8id";
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F134E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=kOnu/8id
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d63f60bcso16678057b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793541226; x=1794146026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
        b=kOnu/8idxgf3nP98EBTacEr1UKbx35BwxgnGtNollZ1aNL6n5dpEi5sWp/f/dSodtl
         WnC4uMqpd3Pa1wbIw//Q5UaXZ4jNzcrwsWcyOtDN35s1zbY4nEGGHX+VixqCaGX63erO
         +D6bNiV3WNGOa5sU5oy1y9z1kw3J9ZAEYTHDZZf8QaEsS0iYi5zCfOZDkgg0FXJG9qlj
         w7IWfLlonBAG0RgmP0T0VnUHO2Z/2SKpm/CzJFo+cys8vCRcw3D9aFbtnhgLw/OPUnM9
         ReygVKilCXDpSlvP7wOa4QUioxS7utjQSIo+Tn2AH7h7vtMFDcc1xnzIaiVUap9tttZZ
         ILuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541226; x=1794146026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
        b=mGOqaiVW4uYzs5yPRWv7EHfslyTa4SNyjIAnjJdn7nK736K9E7KbYelmVYzTPkJXSj
         PvA7L276gpAC8e6p+LI7ux33+fogeq5c16wk0v1TGx+CGzfsHB3KrGQEWS7mfBVY/7Xh
         iCTUyeJn/kgBw6d9ze3l2Bx8PZRyf/f6tG7Vz1vuoY4Y6tF50hFeK2QgrAPoYrN+91tE
         iEWdiX+0kvWDJ3odRO+u0CF5crDvbrVZu/S3QkFiAFuhoqvYAbB/gnYA+2VACkapU10x
         wRWD2NsqrDo+0Gg6dZv6xueTwJ7wRvJW8OneyVuD5Fs0EPw6WSPLdFcZdaHtCK0rMLM4
         cyTA==
X-Forwarded-Encrypted: i=1; AKwUvBz6IrMgYdjcowiFNZoc0Bqg9Rg89eK3KfRhiYSpayCA36s5jNn88XTb72FkqGXvm0OUqVQnco6Y3hpQVv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W2EjqLtgtaiQIOppC5kOLrwiUsxIcVeSVDOOTzKlDkFF10p/R
	uhIoESm9bHk9MQbjsDuSSj3Ii8Qi99W22YoFGfN4xKV1pX/AazsnX/sZb5ZmpMI4h1ngCzil/pP
	UTGO2UNpd
X-Gm-Gg: AYBFou2a+149L897WDxYl1MvqXV9HmmWhULFEJBAbiizFxV6+B7QuQw4yRFfJXfPDR/
	GfxqcwGqXAE4zLhIuyTcHgedB7jFgG3APA1CLlBAKu61S4OJCql4RPA+GVBZDVq2083I62vrjtu
	QNeGln88mJ0la9qrevo5v3pOlmkAAB1mZtzbi0LA15dbF/0UF2bSnv0AtQoPmBHxlO12iIkMk2i
	SeBJtxovHTW4cwb2W1AUjcesP9FGONb6y1iIy3N8vXqfD6EBmLF6mwsbitjXI+FrwqnVZ8FWIkI
	YEqHk+GVAToVnO1ES32KdrFSTyNbChy71I0WtEMA0r437sOGkIkXyRgv/4HEXU3lzH1g1fu3/eV
	APTax3ntNcIazy6bgSR/j4R7ZTc/fDIA0A4OeccoEY/LwPaQ8RUASF34MFDY4+H4SC3k1Ul41Rr
	L4MG2+E7A6hhvR7j7SBm8rOznRk8vEzudjXxRhJRcMBbwd52TiKUu5wAu59FaW93939ybF19iVi
	xk1YIzkOt2EbIn1muBCspG5Qt42o9ghXPRNDNFHDOADn2z6BPd4KH4ojysS1lwLR9huS8M=
X-Received: by 2002:a05:690c:e243:20b0:8ab:b98b:b77f with SMTP id 00721157ae682-8b2b67497aamr30646777b3.40.1793541225974;
        Sun, 01 Nov 2026 05:53:45 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7125371sm36327097b3.11.2026.11.01.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:53:44 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH RESEND] RAS/CEC: Drop unneeded debugfs_create_*() return value checks
Date: Sun,  1 Nov 2026 22:53:40 +0900
Message-Id: <20261101135340.2197888-1-ingyujang25@korea.ac.kr>
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

debugfs_create_dir() and debugfs_create_file() return an error pointer
on failure, never NULL. Per commit ff9fb72bc077 ("debugfs: return error
values, not NULL"), callers do not need to check the return value.

Drop the dead NULL checks in create_debugfs_nodes() along with the now
unused err label and local variables. Converting them to IS_ERR()
instead would have exposed a regression: on a real debugfs failure
(notably CONFIG_DEBUG_FS=n) the function would return -1, causing
cec_init() to abort the entire CEC subsystem.

The ras_get_debugfs_root() NULL check is kept; that helper has a
NULL-returning fallback and is the legitimate "RAS debugfs root
missing" gate.

This patch supersedes an earlier proposal that converted the checks
to IS_ERR().

Link: https://lore.kernel.org/all/20260514193202.2397348-1-ingyujang25@korea.ac.kr
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
Resending, as there has been no response since 2026-05-19.
Rebased onto current mainline; no other changes.

 drivers/ras/cec.c | 39 +++++++--------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8efd..32c1be97bbd0d 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -480,7 +480,7 @@ DEFINE_SHOW_ATTRIBUTE(array);
 
 static int __init create_debugfs_nodes(void)
 {
-	struct dentry *d, *pfn, *decay, *count, *array, *dfs;
+	struct dentry *d, *dfs;
 
 	dfs = ras_get_debugfs_root();
 	if (!dfs) {
@@ -489,46 +489,21 @@ static int __init create_debugfs_nodes(void)
 	}
 
 	d = debugfs_create_dir("cec", dfs);
-	if (!d) {
-		pr_warn("Error creating cec debugfs node!\n");
-		return -1;
-	}
 
-	decay = debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
-				    &decay_interval, &decay_interval_ops);
-	if (!decay) {
-		pr_warn("Error creating decay_interval debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
+			    &decay_interval, &decay_interval_ops);
 
-	count = debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
-				    &action_threshold, &action_threshold_ops);
-	if (!count) {
-		pr_warn("Error creating action_threshold debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
+			    &action_threshold, &action_threshold_ops);
 
 	if (!IS_ENABLED(CONFIG_RAS_CEC_DEBUG))
 		return 0;
 
-	pfn = debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
-	if (!pfn) {
-		pr_warn("Error creating pfn debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
 
-	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
-	if (!array) {
-		pr_warn("Error creating array debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
 
 	return 0;
-
-err:
-	debugfs_remove_recursive(d);
-
-	return 1;
 }
 
 static int cec_notifier(struct notifier_block *nb, unsigned long val,
-- 
2.34.1

