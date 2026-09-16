Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365F372EE2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560023; cv=none; b=Q6kRCRkQ3cfiRWN2vGLxeubIXUkvGP4Oyid4y3yaXGtVxRpIFHnznEPKZ2PDogJFt+OSXnxFX0zu7EXhlmxf5pc16aWNa3TBMMswHRdXCqPQUb7q53IGp8y50/KzeCivArnoHyTDSAxvpoO8vlXPy8SF6xf+bda/zmjdGqvR3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560023; c=relaxed/simple;
	bh=4ONM5VS6QPfAIKUgm6ed48PmyuZMxx+zucJ9QdHw0zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDNUsgojWjih5HuOPD91R0CJ9VeW8EiEr96mRzINaq7xuOoiTG3zM+OekqdFBO7Ko2Hf5sloTiEwNas5ep6vJgEI7BL0Ue/XtSgjG3dBB6LHXxU8oIR08cnWvbdcLp3mjEJoakQA90ksC7XyxL0F7u9a3hmVrObulo50bi2ZD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiem9CaU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiem9CaU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso7472105e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560014; x=1790164814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7cL2Gp18NYRYCb91RHJeYep+3bFOMgxuk/o+xCqY6c=;
        b=eiem9CaUwLYrAGCfxf+an7Z7oG0ShpB6vxV4/O8FU3Vz5lbY0/aff3CClKXrGMtLVo
         azrQ1450WCxjY132p91oWV3bXf4PwJDhv/KKPW812CtVQCEGlSCheo/xLGm/s49mgrOH
         XIeT3hkQH4QPHKlkrpCy7w/Vu/H+SkdejBSj10oL6VDYg+7Qq9a4QOobkjBwdbMObsve
         J3C1K+jiVFfKyB5IrIcZ6o65uQQMwpnNxLk71u539iwOy5yR1l211Ko7mckoPP5O/1rd
         dP/Y2LFGg38TI6d7CxT6Kx+amx3/ABUb6sIGtk02zspEORqvp9qc3RLC7MVQarqitJcK
         ryLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560014; x=1790164814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7cL2Gp18NYRYCb91RHJeYep+3bFOMgxuk/o+xCqY6c=;
        b=ywXPGgUCPJm5QwMfecBtb+AcBqYGQvlfDd80aerqA3z2rG9lNNlfatQ1rYZBvsNMqs
         CFSIYrbetUgIaJI3BQp/JRjpc9aya0aB9N6CW8/lDBHECVpT0+kfZbX4vK3tPln5BDoX
         DeEdWvLcU45pLQBarCVhdLArHzkWnn9IpaeCax55sSxM4sP0+QHQzb4sJsVfnCR6Girm
         Y+Snnd9P2zCbUyAgal/Q3EIGxfLR8k+f8gJrkl3/CJaJt/HUs5cOHxrkwCxO6qSRR5eu
         HYtSvuiXvHSp+0My8kILrxbOZdrnAHHAO6eOsv9F7IHpRX/4ZK7fe99UH9UMgDq2q0ie
         m8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBx3OLuLIu6WxEt9RjnwzAw/3pZYhv+I10VEfFOM0jRrRYBucU/I7xJtIgee6PDDO3SLX+5XI2u0Mp5k8yM=@vger.kernel.org
X-Gm-Message-State: AFuF++kPeyoErvwx06RqxvhDwyr4nrFZTElY239nH6ziaW6vQ9fl4zzu
	nq8ZbBlaVadpEE6ArOX4t7fzrU5tJTEjpIrHl1oSf2ak9nfTk7wlbdp6
X-Gm-Gg: AYBFou3CDd8hHyZfcDtDAY0fORuNHhzHHHU3myTKOREg8IWugjBIlpxUUr/RsoPhVKm
	JmmOh5K/b83zae35oHFns9C1UoPEyRqoZdNCMCipFPb0pxwRsN7+N5dp2EUh7Ks7S9PLZPBeHkw
	spTHifz3k931EYEmwY80G/WOyD0uWB03rrX+ghzdx0n+F/49kxSlYY+RjdK5jtwO7GiHId0oJV2
	VMdd+P1wwZ/Q5vASms5ZaM5qCrP/fAVW/WCfqdCZf3in1odgNJcySd2OFBK4T/b3jur4Xnf58BU
	v7RKEugWUJG1VTuXGjKmnaJWdIBY+MbMG0we2hltvnqGDHRrRVEHOwW6n0SBj6JSnb1Nj3cpT1Y
	a45XmLUrDjGEiKD7wHIPKjj1ZdyPCF3nHMCnYd1zzm3gv8QMB0zrg4bQLudtCMdJHft6Gqbdo8p
	KC2Igql4L2psMg3C6KtTsCD+JlhTNgAnpkCxUGp//xfJ8kDXJVc+PtMIO2IS/VpaByDPJV4O5eR
	/e/LJ/YsERvQ1qmvCrTmk18H63DQhmaoUGu6SZWeGb4nDbVa3iVGINTML3rPJnvyeakvEDI6gi5
	s7A5CL/NM2c8pjuZIpX12rEGOK7kI4Q=
X-Received: by 2002:a05:600c:474c:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49eb72f40cdmr26055415e9.11.1789560014265;
        Wed, 16 Sep 2026 05:00:14 -0700 (PDT)
Received: from PC-Ubuntu.taile4b802.ts.net (2a01cb0082e4ed0062a44cfffeccdd1d.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:62a4:4cff:fecc:dd1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a89258sm77063705e9.2.2026.09.16.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:00:13 -0700 (PDT)
From: Ilan Bonneau-Zamon <yolezz.secret@gmail.com>
X-Google-Original-From: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
To: yazen.ghannam@amd.com
Cc: bp@alien8.0.org,
	mario.limonciello@amd.com,
	linux-kernel@vger.kernel.org,
	Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
Subject: [PATCH v5] x86/amd_node: Fix resource leak in amd_smn_init() error path
Date: Wed, 16 Sep 2026 13:59:54 +0200
Message-ID: <20260916115955.15965-1-ilan.bonneauzamon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In amd_smn_init(), if an error occurs after reserving PCI config regions,
the already reserved regions are left allocated.

Unwind the setup properly in reverse order using traditional error labels
and goto statements, ensuring proper cleanup on error exit paths.

Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
Signed-off-by: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
---
Changes in v5:
- Drop __free() cleanup helpers and custom release logic, switching to
  traditional goto cleanup pattern (as suggested by Borislav Petkov).
- Fix changelog attribution regarding brace removal (noted by Mario Limonciello).
- Update author sign-off to use legal name.

Changes in v4:
- Remove unnecessary braces around the kzalloc_objs() error check.
---
 arch/x86/kernel/amd_node.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..32038bd8e243 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -248,10 +248,19 @@ static int __init amd_smn_enable_dfs(char *str)
 }
 __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 
+static void amd_smn_release_config_regions(struct pci_dev *root, u16 num_roots)
+{
+	while (num_roots && (root = get_next_root(root))) {
+		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
+		num_roots--;
+	}
+}
+
 static int __init amd_smn_init(void)
 {
-	u16 count, num_roots, roots_per_node, node, num_nodes;
-	struct pci_dev *root __free(pci_dev_put) = NULL;
+	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
+	struct pci_dev *root = NULL;
+	int ret;
 
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -261,7 +270,6 @@ static int __init amd_smn_init(void)
 	if (amd_roots)
 		return 0;
 
-	num_roots = 0;
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
@@ -273,7 +281,8 @@ static int __init amd_smn_init(void)
 		 */
 		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
 			pci_err(root, "Failed to reserve config space\n");
-			return -EEXIST;
+			ret = -EEXIST;
+			goto err_release_regions;
 		}
 
 		num_roots++;
@@ -286,8 +295,10 @@ static int __init amd_smn_init(void)
 
 	num_nodes = amd_num_nodes();
 	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
-	if (!amd_roots)
-		return -ENOMEM;
+	if (!amd_roots) {
+		ret = -ENOMEM;
+		goto err_release_regions;
+	}
 
 	roots_per_node = num_roots / num_nodes;
 	if (!roots_per_node) {
@@ -298,6 +309,7 @@ static int __init amd_smn_init(void)
 
 	count = 0;
 	node = 0;
+	root = NULL;
 	while (node < num_nodes && (root = get_next_root(root))) {
 		/* Use one root for each node and skip the rest. */
 		if (count++ % roots_per_node)
@@ -316,6 +328,10 @@ static int __init amd_smn_init(void)
 	}
 
 	return 0;
+
+err_release_regions:
+	amd_smn_release_config_regions(NULL, num_roots);
+	return ret;
 }
 
 fs_initcall(amd_smn_init);
-- 
2.53.0

