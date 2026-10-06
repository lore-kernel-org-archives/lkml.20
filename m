Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57F36920C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266510; cv=none; b=LhVAFfvCZqBpbU3J+ODI01Zk6yPcpIqS1wYhBtbyNLiesI8VTqs+Uy+Dm4JR3hzfXkSf5klxMGnnlMfFp28LnjvfynOr4mBZqZxnVF8b9ah67XZLdBitNJ8OdrXqiNp+B2CschbcXEP3Mw3rQZwpmKIMu0gjgBuMQ70B7DytNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266510; c=relaxed/simple;
	bh=qFfPZZhbChgmtuc8g8bCU2zjESAKk50aYwARcV0yTnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AQthhEKx1dZcMUvQJdSOVH/fDynH9fognumMSh1xQddqNqo83Oi7j6n9eVXUMsAexXGiR77YDro9i353pfzvXunHX5SROY8o23Yb/bOAyO1MB3FWDC2hCn67J9CPfvBfTY6LfeQ1kcfZo0EPGyV7qDgbT24g74+GZDxED4x/Kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwnApu3m; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwnApu3m"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144f7915346so536687c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266508; x=1791871308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW+mqH2re19ne9O4KJFVEoTrC+YDZvk13b6+8e/Lv9w=;
        b=rwnApu3mnIKEfNwLG9O/sPpz9nHLMe/TpcfV70EapjxVwiJLvv86QgHbd3vmKMyunY
         scdGPq8MCrMVH4mi+VGh89unnYNDCqcffiyJyxdbxw0zfPmSbyYh4EpdopPD7b69kRqh
         QPb8ozXPpqF5deP/IiijnxR/Pg1NpqZw4/yFUjidhs+4CPJ/5z7Reawg5evPFcRvNens
         Z8fvXaFPuZO7Qivuyj6B/bw9kBwQG51pSFTi2GgIGz1Yv0x+bkrdisZXPheNoo/FhV/C
         7P4vj4jlahTnHiCTaW1aL9/MtE0YcrKfaokxcqrnf6MbcRY1eCbbNh5rgJ4gjBMsp6TF
         Ls7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266508; x=1791871308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW+mqH2re19ne9O4KJFVEoTrC+YDZvk13b6+8e/Lv9w=;
        b=wUPhY268PgLYLmmU7vcgyw4ljn/kwq0S9jaG+DQIi4FSQ9gfHgNUhgeYym/HDBX5Y9
         pQ+rhXMiLN/eK4mzKNOG6QbA8RVeZf7p7QQTBUBkrskGOAS/X9MrVzdKuuK/PmXlfkAB
         iRURFuT4+aKzaA3O0heWdIqx1Y9jw4/wOEywMf/Nwr4MeGIzJir6DV4+JawghwjF2KRS
         QCL+VhcgBirEEcgm9/DfA6Btf6x6Sl8iZ/M8SBs+Hj3WOVM4RjRtRCXTL6f/0kHxoS02
         Oiet8oNoMxjD2ZszlE3jzyZmCmR+N0s7lrefX88iinGUNSszQ9mVpng/sZj6p5xP6Gx6
         vQ/w==
X-Forwarded-Encrypted: i=1; AKwUvByGS5mqwkqQKEiD8tpkLkJhIMY9KUfasfnTZwcRXg7tZDDN+12DpJCuhpTiC221qdIChcNG1rIwUm26a6w=@vger.kernel.org
X-Gm-Message-State: AFuF++lxHG/Kbvc/7yXz/PoNe5jlVnAVjb/RkdWDkorwaKeg7vPs20PQ
	+Akvmlfu8PzM3g7Lxc40Q/bWrVjgWHqCG+xZr6onee//vj1HJ7iunZUi
X-Gm-Gg: AYBFou00Xt1n3m9ah4/4V61wOetcmhZ9E62xyWSAnWtddgZjWLqJa13NpEXD5OBSrk8
	QL8iyiQ4sAgCBLoeR6AdIbW5fMkNp+mzwv5cYijNAqtGHzWGbQ8PGfyBS8H4CgFEsPtzZvYRVVV
	k9rKpm6KoL5xntoOIglogeGCb0DcfdfTm6MAbJc3LLCkOQq7bc9MI5WtBqVE8MGHtomtzA5ccBj
	3Nan5Dxqm32qD1KKBXb1FIXz5H6QRJig4xPYvAiBMIDppbUFOAAQGlTr2EYrZtpIxWIU0v7DPtu
	NVzWcemGA1s2SmOVGv53NeE+vH9BHgciKnIMHwRcVqlqnhbVDh7hg5mj8LwtNqYkqK7mL6s0W75
	fnICvoSXMoUIjsMXeISS42gUz/xfO3V7TU7qo3kzG0M2upIlIoYlfQNDbFxLDb7aPMhj9qHodjk
	JZfof0+Hucyn15f8ygbKAKmdoPZnlxcicPK9wPdVas3gM/sG8MYHzckUFECegl7B2B96uEhPkSx
	aKLyko36uK2VOa7v7ft/4o=
X-Received: by 2002:a05:701b:4287:10b0:15a:4155:3daa with SMTP id a92af1059eb24-15ec93fdd16mr672452c88.15.1791266507680;
        Mon, 05 Oct 2026 23:01:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm5486567c88.13.2026.10.05.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: OMAP2+: fix typos in comments
Date: Tue,  6 Oct 2026 11:31:39 +0530
Message-ID: <20261006060141.43425-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  One further misspelling of
"peripherals" in powerdomains7xx_data.c is fixed as well: it is not in
scripts/spelling.txt, but it sits on the same comment line as one that
checkpatch does report.  Only comments are touched, there are no code
changes.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
     - Also fix the second misspelling on the same comment line in
       powerdomains7xx_data.c, which checkpatch does not report because it
       is not listed in scripts/spelling.txt.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-omap2/omap4-common.c         | 2 +-
 arch/arm/mach-omap2/omap_hwmod.c           | 6 +++---
 arch/arm/mach-omap2/powerdomains7xx_data.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 5d924b85b694..633451b6f548 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -96,7 +96,7 @@ static void omap4_mb(void)
  * interconnects.
  *
  * This situation can happen only when the idle is initiated by a Master
- * Request Disconnection (which is trigged by software when executing WFI
+ * Request Disconnection (which is triggered by software when executing WFI
  * on the CPU).
  *
  * The work-around for this errata needs all the initiators connected
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff87..0f4ba19804c6 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -646,7 +646,7 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
  * @oh: struct omap_hwmod *
  *
  * Prevent the hardware module @oh from entering idle while the
- * hardare module initiator @init_oh is active.  Useful when a module
+ * hardware module initiator @init_oh is active.  Useful when a module
  * will be accessed by a particular initiator (e.g., if a module will
  * be accessed by the IVA, there should be a sleepdep between the IVA
  * initiator and the module).  Only applies to modules in smart-idle
@@ -674,7 +674,7 @@ static int _add_initiator_dep(struct omap_hwmod *oh, struct omap_hwmod *init_oh)
  * _del_initiator_dep: allow @oh to smart-idle even if @init_oh is active
  * @oh: struct omap_hwmod *
  *
- * Allow the hardware module @oh to enter idle while the hardare
+ * Allow the hardware module @oh to enter idle while the hardware
  * module initiator @init_oh is active.  Useful when a module will not
  * be accessed by a particular initiator (e.g., if a module will not
  * be accessed by the IVA, there should be no sleepdep between the IVA
@@ -1706,7 +1706,7 @@ static int _ocp_softreset(struct omap_hwmod *oh)
 		return -EINVAL;
 	}
 
-	/* For some modules, all optionnal clocks need to be enabled as well */
+	/* For some modules, all optional clocks need to be enabled as well */
 	if (oh->flags & HWMOD_CONTROL_OPT_CLKS_IN_RESET)
 		_enable_optional_clocks(oh);
 
diff --git a/arch/arm/mach-omap2/powerdomains7xx_data.c b/arch/arm/mach-omap2/powerdomains7xx_data.c
index 921cb1b29cb4..18cd74915b4b 100644
--- a/arch/arm/mach-omap2/powerdomains7xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains7xx_data.c
@@ -223,7 +223,7 @@ static struct powerdomain mpu_7xx_pwrdm = {
 	},
 };
 
-/* l3init_7xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_7xx_pwrdm: L3 initiators peripherals power domain  */
 static struct powerdomain l3init_7xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.prcm_offs	  = DRA7XX_PRM_L3INIT_INST,
-- 
2.47.3

