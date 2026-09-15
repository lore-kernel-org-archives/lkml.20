Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CA48167F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493139; cv=none; b=JmTKANU2BsCZrvIkZbab6JQC//nN5HOm2hA1xbSlEjWphx4zDwTvlCMtnhxVk82QtC4Ud5YAIFoMFF54cCUze/u4XHt+fe1kbTZRKDp6wwymTXcnEk9BDXyWVnBDwE6mOBpCxFYPXvdEZ6rSHROD2qZCt1qPKlDTrdqKr9Jfevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493139; c=relaxed/simple;
	bh=2irpDql1A56MW3Cg8tLm6fuhkBE705xYPamH+cyoiP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/pTF/eyIUaQCUYzr9SQPk4gmgsi9G5wcB9ypaLu+KCEBG/XnSSrOSSi0TS5p17+VB0SJxdkurzZWgxySKu1pjanV4cFG575FXGhHjRiBqpuIFizBrp7lStYtcn42L5+f5onqSc1WRhC3rDx3DkljJiv2sVLcM287fXQKQpBniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jILWqfNB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jILWqfNB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1680555f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493136; x=1790097936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/fc7nKbJQEUnU9yBTBsz1Pj86Zdczq6/uCNWPdWiiU=;
        b=jILWqfNBFo5clM/tr2J4LTVGwvdbwnMVPeblmA90C5PfOo/BPGZ3rRKy2+tdtGmA34
         GThSp9DnjvE0yl+FSEyzXcJ2UyznslaC8kK6rR6TZgartXoD1+fZMvehW3lV2LkkcZN9
         fuy6rZ5Z1WMEXKWZodDkXYrELRO6q/OKUN2C2rav67SfW6JO+VsSBKT5kmrnwmOcjiE1
         k1fqCPMUycpGuuFAbc28MbckhaMqzEFrQN6nhYbt0pRu4oqTnAb/Yq+Td6/+43wU/xG7
         n6YwiReMNHOKoSMo5EXAcT1DSKwd8XkLWTck+8FM6SO6+EwgS3VzzYpIsX5YgRjpDtxq
         Xrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493136; x=1790097936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/fc7nKbJQEUnU9yBTBsz1Pj86Zdczq6/uCNWPdWiiU=;
        b=N3RxHr8EXQ8IljueuEPYWIdngTymgFHzUY2XKl3ye0PLeJQ1QW9A29AMgkrJBcjomy
         qjB5n94SHpuql4n6YImEwwzyiHf9LWffHX4+6S/kaL5ugiY1hGAmw7GxGBJeO06vUir7
         sO7ZtcjmQXawFFb6ARCiyneeXLwgzuuQAS+9BzJSnMRbfSmD9Ac6xqKD3clOH38SHaaJ
         WiOtPOuLMIEP9U7P7ZZeXe92/nQZzniq9rsr+SqPtY3fGRhVEVGdQT6jllvu7JJrlvVn
         go6U5V30OcjWZF+tl4G+YwIU60mQWBZWMQn7qX3298hGc9bGFpya8+WcWTGel+s03m1L
         +CLw==
X-Forwarded-Encrypted: i=1; AKwUvBxZY6KmjohvlPml6ME3BWG3rQmjVFwyPH7bOdTFrHdHtlpi7Iss2Kjo1c2X62ZIRorTgKZL9FPAQEPEL+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nwtjpCZOJkuCGqGMUJfwS8UZSu1oXwg8YUWPDPV9PgNws9QZty
	dNPMryahJeZZcfKXSg5gBO0tq4/dZjMPEphvZ99XCgWDLajtzC5ylWRe
X-Gm-Gg: AYBFou1OpWz0Fsu2lI3KOvaJzifncPZ8q84wGybhRptk/7S0MNthDeytaqp4hd2huKU
	8pmWKMY8NVxk/umVm6PkWJ1S02QRrv4KBOKYYi3OkLoKnzmJHQL2roHo5VZfMdm3/qQGoCY6IA2
	uRIjn9V6x9VprzJMXOmAUAKew342O8+CJ+xIADRy+b2+6/mFPlYTlVGwqMxyrxsBwBUlrDfVgAC
	/o5SQqwAgrZFzj1rUMr43Jz74SUPekl3l2rIDeJaxTVX7eOYCX9qbA480DR+K0H36cx3pTZGBab
	cBhwsU6jJj5iYijl7w3+0VaM8eQR18KUqxvFBB11ZR9w+2fJ8PAnReF7lnZqedCBUumOZzeJzeE
	chMZLgkRbHxgff0RtamM6QVYi+AvZ9e68Px6SuueAtV0NE5W/mFkgsrdhEN91WBOQoPhyAQK4DF
	zbz9jXamyeVsIqt/QN8TJ5hUOegCQdUqQBeiojpjp0TztRtLLh3uhC4Fy259lL0y7chcnaFJQtc
	EMr0JHrd/VBVucy8QR8ZfVU8/5K1b6G/ZNaofSZ3YVlVQdBsdIPonVXMJ0qi5J6jm2moDFtgpbm
	WSWHZaajoQ==
X-Received: by 2002:a05:6000:220f:b0:487:a36:b2db with SMTP id ffacd0b85a97d-4870a36b301mr2775613f8f.49.1789493135519;
        Tue, 15 Sep 2026 10:25:35 -0700 (PDT)
Received: from PC-Ubuntu.home (2a01cb0082e4ed0062a44cfffeccdd1d.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:62a4:4cff:fecc:dd1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm436806f8f.33.2026.09.15.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:25:35 -0700 (PDT)
From: yolezz <yolezz.secret@gmail.com>
To: mario.limonciello@amd.com,
	yazen.ghannam@amd.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	yolezz <yolezz.secret@gmail.com>
Subject: [PATCH v2] x86/amd/node: Release reserved config regions on init error
Date: Tue, 15 Sep 2026 19:23:55 +0200
Message-ID: <20260915172355.104902-1-yolezz.secret@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In amd_smn_init(), if pci_request_config_region_exclusive() fails or
if kzalloc_objs() fails to allocate memory for amd_roots, the already
reserved PCI config regions are left allocated.

Use a __free() cleanup helper to automatically release all reserved PCI
config space regions on error exit paths.

Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
Signed-off-by: yolezz <yolezz.secret@gmail.com>
---
v2:
 - Use a __free() cleanup helper instead of manual error rollback, as suggested by Mario.

 arch/x86/kernel/amd_node.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 6a96d888b5a7..20451f0ad8c7 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -239,15 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
 	return root;
 }
 
-static void amd_smn_release_config_regions(u16 num_roots)
+static void amd_smn_release_config_regions(u16 *num_roots)
 {
 	struct pci_dev *root __free(pci_dev_put) = NULL;
 
-	/* Release the PCI config space for each root device. */
-	while (num_roots-- && (root = get_next_root(root)))
+	if (!num_roots)
+		return;
+
+	while (*num_roots && (root = get_next_root(root))) {
 		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
+		(*num_roots)--;
+	}
 }
 
+DEFINE_FREE(amd_smn_release_config_regions, u16 *,
+	    amd_smn_release_config_regions(_T));
+
 static bool enable_dfs;
 
 static int __init amd_smn_enable_dfs(char *str)
@@ -259,9 +266,11 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 
 static int __init amd_smn_init(void)
 {
-	u16 count, num_roots, roots_per_node, node, num_nodes;
+	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
 	struct pci_dev *root __free(pci_dev_put) = NULL;
 
+	u16 *config_regions __free(amd_smn_release_config_regions) = NULL;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
@@ -270,7 +279,8 @@ static int __init amd_smn_init(void)
 	if (amd_roots)
 		return 0;
 
-	num_roots = 0;
+	config_regions = &num_roots;
+
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
@@ -282,7 +292,6 @@ static int __init amd_smn_init(void)
 		 */
 		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
 			pci_err(root, "Failed to reserve config space\n");
-			amd_smn_release_config_regions(num_roots);
 			return -EEXIST;
 		}
 
@@ -297,7 +306,6 @@ static int __init amd_smn_init(void)
 	num_nodes = amd_num_nodes();
 	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
 	if (!amd_roots) {
-		amd_smn_release_config_regions(num_roots);
 		return -ENOMEM;
 	}
 
@@ -327,6 +335,7 @@ static int __init amd_smn_init(void)
 		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
 	}
 
+	config_regions = NULL;
 	return 0;
 }
 
-- 
2.53.0

