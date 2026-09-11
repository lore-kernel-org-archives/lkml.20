Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEDD376BE0;
	Fri, 11 Sep 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146140; cv=none; b=YYY3AmXwVuuloZyHCQMJYRdhWNAcAOSa5WGWtreGdSQMe5uj/wvAqU05xiOqkMpBxkWZqIs2IwGsmNo1ty4NlxjQfPVaCOwGGiqYhvwzbOUE4PbDsOghHdq6tvzyxgE+0lg1onaApX5RJEqr2eaxwZviZxp3MQNwrJP4kqtADs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146140; c=relaxed/simple;
	bh=gSjBIMWHca5U46ZxsrGHxju0cEEsz9xxV4nSDxxb9do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZzPQvyrcEoolPpm6IQY1DIaoodynF6ibL7Pasq1Wu6PZQOgbXWWE3Nt6RvxeBOZXiJ04oEh7MYoVbKVVpiTIzjQDSG1EZ+gh2q/IIB514LlzeBbBNfEsftOYmukTnHunK0+5YToeCvEEMFR/DHi8GS0ldiBJxPgQMZzQqnkhQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=K1g13/KK; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="K1g13/KK"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789146136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=;
	b=K1g13/KK5UI8evEeIQXEUSuMs02USPPzMIudRpiaZJi4NkU7J/oMGlIADehtdMtmkKfvg5
	ib+crH1GsP1U4Lj8LhRxfTOxUOk8hMlBIP0gyG0jaQaF0C4aWNWFFzB/WbbKo5wRvCE3AL
	c69F38j5muCCl26A3VmS3oBCcA+s0xM=
Date: Fri, 11 Sep 2026 19:02:10 +0200
Subject: [PATCH RESEND] arm64: Add override for WFxT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OMQ+CMBCF/wq52Zq2EEAnB1kddDQM0l6hDtRcs
 UII/92Cu3nT9/LuvZvBI1n0cExmIAzWW9dHELsEVPfoW2RWRwbJZc5LISIStswFJLIa2ceMA2t
 knqZGZ5pnBuLli9DYcWu9w7W6VZcz1D/fv5snqmGtXJOd9YOjaZsPYsv/XQqCRalCSFlqXojDS
 U0NUnzV+b3GAPWyLF9oolAm1QAAAA==
X-Change-ID: 20260811-idreg-override-wfxt-b2633fd4d04f
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>

Add an override for WFxT support within ID_AA64ISAR2_EL1 to allow
it to be disabled using the new arm64.nowfxt command line parameter.

This accompanies the idle=nop param introduced in a previous patch
series [1] in dealing with misbehaving WFI and WFIT instructions on
Apple Silicon SoCs, and eases debugging of other quirky WFxT
implementations.

Link[1]: https://lore.kernel.org/all/20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb5251242311..6a35623e4a17 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -587,6 +587,9 @@ Kernel parameters
 	arm64.nosve	[ARM64] Unconditionally disable Scalable Vector
 			Extension support
 
+	arm64.nowfxt    [ARM64] Unconditionally disable Wait For Event with
+			Timeout and Wait For Interrupt with Timeout support
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 274bc72ba98d..acaf56234973 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -186,6 +186,7 @@ static const struct ftr_set_desc isar2 __prel64_initconst = {
 	.name		= "id_aa64isar2",
 	.override	= &id_aa64isar2_override,
 	.fields		= {
+		FIELD("wfxt", ID_AA64ISAR2_EL1_WFxT_SHIFT, NULL),
 		FIELD("gpa3", ID_AA64ISAR2_EL1_GPA3_SHIFT, NULL),
 		FIELD("apa3", ID_AA64ISAR2_EL1_APA3_SHIFT, NULL),
 		FIELD("mops", ID_AA64ISAR2_EL1_MOPS_SHIFT, NULL),
@@ -254,6 +255,7 @@ static const struct {
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
+	{ "arm64.nowfxt",		"id_aa64isar2.wfxt=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },

---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260811-idreg-override-wfxt-b2633fd4d04f

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

