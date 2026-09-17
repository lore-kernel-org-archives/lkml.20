Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB06F4E9C35
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677740; cv=none; b=bqdQ+hstXX5wLbS91mZuiVBgKkKTNdVobop9OT8uFm/S2JXzLTyFluN8SmyQ6bfk3+HVXiScEevqx2LF62xUq+jlb+ntN0RyfPWOhGVWO8ARu5i/zSChfmPCx0N42rBiFg+oblehJxjm8pw2s1/WA4m9glFKikasesmsBOEzcRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677740; c=relaxed/simple;
	bh=kZtK+sVq+OakP0n9604KZpM7r41BPS7WKoDg0NZh8xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPOMsc1TVdiTPxWdUWgaFYDSzF9uXNbQUBF6xcXMmj6g/+LUq0I12SQ9Awt4rLG8UFMRrl5A7XpNfWZX825mdzsuaXEi/feHOnCW0IuvACK0CWUpLn0Ql2eqVoV4100/jpJmOW43NVS95mai32QtKwm7HaDNoT+r5dWXdA0ZQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CP1TPdtQ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP1TPdtQ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52fa9c055b5so12986311cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677737; x=1790282537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38H1xf2/ET/SoNjoIYflqfRDEtEJGG8vw0YM1GLHy9Q=;
        b=CP1TPdtQF61VSBDhw7T6xOw4woNmurF1GSWogVHDp0M9X8uPG0p9a+GPpo7xb11f3N
         d9i0rgqqBs/ATuuCTLNYXGeDsSdau5JgcohHzaIhGwjZlgGfh2DYMORX2CT7qdmpzvSv
         astxVyvKa8iTjvqpX3fjZcRqiUGB7NQV5IVksjgnGubW8Zhe575s0TOWHbi3oenDrVs3
         NbeS0/+m1nIvuxx49gdwBWDZTCAKhtYEuZVKz58Ina+s2andDJyFTOf/LXYuT2zIrh/c
         bfiFEpWFX+thpiY4pH9KXSUZSOmrtlUmVXp+Wi9aqN2ikvnaK1FPe5TjlLVFbhhVfJ0M
         F6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677737; x=1790282537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38H1xf2/ET/SoNjoIYflqfRDEtEJGG8vw0YM1GLHy9Q=;
        b=l1QExqzhKGa5tqB5wcJdtE01mVSsGmFJnOdga91D9HstAlKkTVIXyd0orlBY1h+5as
         jp8gC+aWtiJjKg2+zmMOe32qtXU3tjb79SjctNlB63frcvWhwCOTY9BHC3kC8dWhck0i
         KvcnW6O0mEoVW9mtb2yGCPrkpYFNZrKAK9yWckH6EwYjc1RrPmL3qcH1qEnYFmvZIlPW
         Sr/qfzovLD8hGz4ZPjbcA4PwrZqRRBtThYhwzrdXRvkRifBQlwQYXMo4FGQrLx6rWs5o
         VfvhfmC9V5rUqlAScyrpQSIahnWY3YN5TjNQc1aFOk4tmMwv77ykVae3KvKzhMCuWMZe
         /ucg==
X-Forwarded-Encrypted: i=1; AKwUvBxfexWed9HEmkF5/ZLedOUqRE++Ox1dObMoWO7v8siKVpop3cPNiZ+PUZ8jchucdqo/jEjveKiBn1HoEec=@vger.kernel.org
X-Gm-Message-State: AFuF++k6diMIYQ6ps56FcGYWOaO7dw69KeAGJ+fDncqc+tm9FiAM+AgR
	tBSKfCM7C8/JYQ6cJ6UOf3Os5fhD9tTaYvn+P9VArJ1wKNc8Okcau5gRMuM0BHU6t3yJ
X-Gm-Gg: AYBFou1ihaAL8QHW4SgGloSgIwZNK5ghVd16NK+2pZXLUKSw1rfsNaKJIHKwIjbwIE7
	HH5OvP463rbkYrYfF8FUY523TDAcFDtYZF+pigJjh7O0dMVXkXYqcsiZX1+VOkfK8lgYIIkhmlZ
	OvEzK+5eAlqZv/WEaLWgf/zskBexWEoZqoKeAsxhP6yYhbMLDJLNu/eSK+7JijUmaycu2SvLOnv
	8p6kudWuS+6aP9WuYyNQm5qzQbknEtEQl5nj1strkU043JkncKO2MiVvie8eQj0yyzhdoEyOa+C
	rrtSKBVI3KIsosh+T2bYSWABJBWhoU7BoeyvJ25Fy71cv6+9qRvwRMg2T7sl0Xu8lqXBY+ACpcU
	bRDvrCJWDMTMhSFEsJODUOBbBzMlg27XrKGfgByJsvwqDzgzvkJbUmQF7x/nIc0cFHpwOrP7XPy
	oWCUDbsDr7G3NVk06SYfofsnLkx7I27ZJUuqLtVFvsT0di1rkew3MCmp7zkGOR4tO4oGQ5LNwxv
	iUAtfJiBNGfnzXemH61SWMKgNwM8L1GPz4myHB/bh51Yn5jl3WctRvnKj7j/LlaM4/rQ2oUp2IV
	ukSkzcbPt6qU8OGsqF6dpenpn2gQMsrBElYy
X-Received: by 2002:ac8:5ace:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-5328cedfe9dmr79101391cf.3.1789677736834;
        Thu, 17 Sep 2026 13:42:16 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204ad36sm58764301cf.18.2026.09.17.13.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:42:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before unregistering ports
Date: Thu, 17 Sep 2026 16:42:09 -0400
Message-ID: <20260917204209.97699-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
responses to their partners. Port teardown only cancels port_work and
then unregisters the partner and port altmodes, leaving the separate
altmode work able to access released altmode data.

Disable and drain each port altmode's work before unregistering the
partner altmodes. Disabling also prevents a partner callback from
requeueing the work while its driver is being removed. Use the common
port teardown path so probe error handling is covered as well.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Validated with static source review, apply checks and strict checkpatch.
No build or runtime testing was performed.

 drivers/platform/chrome/cros_ec_typec.c      |  1 +
 drivers/platform/chrome/cros_typec_altmode.c | 15 +++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c077067294935dd5602c1aec636cfa6 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		if (!typec->ports[i])
 			continue;
 
+		cros_typec_altmodes_stop(typec->ports[i]);
 		cros_typec_remove_partner(typec, i);
 		cros_typec_remove_cable(typec, i);
 
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b532d3bae1de322a1cfb1205e0190f..2492058d98b8ef2a4a1a9bee87ce0574f4f0a736 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -37,6 +37,21 @@ struct cros_typec_dp_data {
 	bool pending_status_update;
 };
 
+void cros_typec_altmodes_stop(struct cros_typec_port *port)
+{
+	struct cros_typec_altmode_data *adata;
+	int i;
+
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		if (!port->port_altmode[i])
+			continue;
+
+		adata = typec_altmode_get_drvdata(port->port_altmode[i]);
+		if (adata)
+			disable_work_sync(&adata->work);
+	}
+}
+
 static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065af709643ad653df487a9987780da4..9e67f82ba031d67dfbe3a0549a7987386c33d120 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -11,6 +11,12 @@ struct typec_altmode;
 struct typec_altmode_desc;
 struct typec_displayport_data;
 
+#if IS_ENABLED(CONFIG_CROS_EC_TYPEC_ALTMODES)
+void cros_typec_altmodes_stop(struct cros_typec_port *port);
+#else
+static inline void cros_typec_altmodes_stop(struct cros_typec_port *port) {}
+#endif
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 cros_typec_register_displayport(struct cros_typec_port *port,
-- 
2.47.1
