Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFD486BA9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525192; cv=none; b=MP7krMJcXc6rbZbq7KQ3JETI9pn/MlEQX9cXlTWMwTWN/NGGkIDWWi0JSVyT7YW6uxH6O+h6oBwDjBiQcTOImRDz9nCYVw0SgxE2YGg4z/aIns0Otjyg8sSeuicy5hYye5E3Ug/Uzce4ZMEhBXnM5+lBUv+IJH65RndnnW83vE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525192; c=relaxed/simple;
	bh=zSY3tsTOZBtA2hVUkZvtvXV28oUZaPFPy3Vkq+ARZNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqIyOXDxNT32FfTLO/gm5+NXuDSelLLxuIgwgYcQmEZsQ9PcYj33nN2lObLAn4TpMapOrBiRSoDTwba/wgaB+y3KDCzkWjBNPLEXzfkNmXonI5Xmxm1LVe7VoLeJsQHIQ2DGFCJbR/4eko3X0TxOaNYJlw67SgKGSH5DF0F/PQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl0CzDLZ; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl0CzDLZ"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b12d146e6fso457312eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525188; x=1789129988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=kl0CzDLZ9eJeraix6CTaUU5m7OS0iHxOk3b0/hGHg38wqCxtfHrM2GTnT+sF/NFyQn
         ZHf4gZuC2I3sBDfGPG6+w7jSrWcNO+gtnrBzhT9GQcF3Ansr9wJtel0gIrHrSfQ9w6Zc
         0WrIN/BK3IlrrTS+3OpSh7GGH7XdxexT2a6YWuUq1Q/ZN3qlT9JqvF9ztdhg4zSbMMpZ
         sxF0pw5oeYpRMAZF6L49ZzToLq6QAYQmEo2/LSIFOWSK70DTEuO6hMn1whhuSUVvvYtM
         RrBSZYxEeLxJZbeoY1YNul39PtpPY2zjJzIrS3N8EtENvQTKsqxwEZswF87kYRe6RShR
         4r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525188; x=1789129988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=UU2lGHqbdi3ug9LtG9ZeV0Fm2u38oJLwg4R7iPKARdfKwjK7830mZrHYkmlCMkZUuB
         8hCoAXCaAxAjRxnkJ8qFCIakExHMXs5rMUi3H+Zi7jstrFdElKmpMicp/WwMU6Do2d9I
         XiE5joehCFMqVibq9e/XkW7wFfoBKtcTphUfUbZc9Nm/zOmL5VP0grPleW6YH1IcIXlP
         Ljhrth/dHbVQpyl+FCFRTQYbo5K0NIe2VePP+4kgUi5AhFplgC+6taWP4r5wBvWAWrLX
         0WP1rfPmcuPv0Kw9DQ1u/JdvZD9VTm6mp/WdpngPNeOrUpkda9qM19jyoZfoT+X6cDBm
         KKMQ==
X-Gm-Message-State: AFuF++mEcwyCI7Ms3bPkc27bK4yCuhSf5wKRyy7ePgiKJufXG8vtZeB4
	4knM3cNdGssaKaha1Bl27/qeIc4MnAb62jWcOCk1inb6AKR05s712dBu+ibFouPkaW0=
X-Gm-Gg: AYBFou18E6uqY68KotIOVCbdEPy3NYDp8VxZmDIK7RINj0/G7e3/LHsL4/hgzeo9gAK
	cyCRapIrucxLe5gZpKLWVEbBVYVtqMlNx7JUwSMOPCVwsnzr8zeIsrsS2Ot2E/XhdWdl+3y8cql
	A7egYlm9bDgTRma4cg9KBrAz95A04PG/heyjOw0NZpsinF+q8+jAYxyDULCIqEDpG2RLkJO6F0S
	6DWyCllQeTRuGLVBrfmARfjtthbkhLqcHzEU54VtTohwZ5prDiJvDXWdHW3krB6KhGDx6KCZrCa
	Vd2wNQy+XnR3qQuyv6JviVX4A6PZfMMJusBI2ET6+gJbAnUP28tgt25EiGnUzuClsjgUKjAKXSF
	fTSuZ8AH7Gxs0Q2WZzUzxaY2Ig9gVw1CLSxNn1VpU128o/JQCFHAPwsTY2dka2zOd8lnd0PFq4J
	98t2IjE2s5926rZ+liBhBeb9cO71w1xLjWEuh5XKc06HMHcSQv8D18piYhHoPlyMgJukzBqrbBq
	16c+o18o9dhNXHhZhn2P2sOIA==
X-Received: by 2002:a05:6820:151f:b0:6b3:bb82:2736 with SMTP id 006d021491bc7-6b6fcac57fbmr4027560eaf.17.1788525187615;
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] pinctrl: fix typos in comments
Date: Fri,  4 Sep 2026 18:02:56 +0530
Message-ID: <20260904123300.36778-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123300.36778-1-hemanth.selam@gmail.com>
References: <20260904123300.36778-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pinctrl/core.c       | 4 ++--
 drivers/pinctrl/pinconf.c    | 2 +-
 drivers/pinctrl/pinctrl-st.c | 2 +-
 drivers/pinctrl/pinmux.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1675dd36bd5c..ba6c71e6fc2c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -147,7 +147,7 @@ int pin_get_from_name(struct pinctrl_dev *pctldev, const char *name)
 {
 	unsigned int i, pin;
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
@@ -1747,7 +1747,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 81686844dfa5..ecc888b029d7 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -311,7 +311,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 8ce88e591f47..59ecc295fb8e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1148,7 +1148,7 @@ static void st_parse_syscfgs(struct st_pinctrl *info, int bank,
 	pc->pu = st_pc_get_value(dev, regmap, bank/4, data->pu, lsb, msb);
 	pc->od = st_pc_get_value(dev, regmap, bank/4, data->od, lsb, msb);
 
-	/* retime avaiable for all pins by default */
+	/* retime available for all pins by default */
 	pc->rt_pin_mask = 0xff;
 	of_property_read_u32(np, "st,retime-pin-mask", &pc->rt_pin_mask);
 	st_pctl_dt_setup_retime(info, bank, pc);
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c705bc182266..574fc95b6712 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -636,7 +636,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 		bool is_hog = false;
-- 
2.48.1

