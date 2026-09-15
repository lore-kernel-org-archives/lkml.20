Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60E34A76F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493826; cv=none; b=W15GQ5yiKtvOY7oqbCOajd21cIPRikWYzjKO9GMlO2x1VucJXD9BuPy8lBTkgW46CWMaEh4rTK2XcB1z7lEFrbIxwOr43xdrkSoRifKr70TT6OCX6wNVnTthtEon5RAddTv8aEw/n+Wc7zde+md8haiVtxshL7+nIGg1vhGsUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493826; c=relaxed/simple;
	bh=CsJmHcJgnXB0adBDIVdbbcL2PBJUigfuWbcXGzCCF8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atIfn0ZDUiEKngV2FLsZsFsQoNBHGVh26IjI/dSLfctRn3fLWR24NZISXJSDUYAZvUBX4IUXXh1Avs9xrH81YJhMFCoewNi10JIFvTJNpyFU3NIs2txXZFoAu3Mc4Wmu6XnHe1R52Cycbbf4cc3xxEBkaZmdqoYKIrxXuuaNZPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBz3NPsb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBz3NPsb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so373585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493823; x=1790098623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4afyGrHNMZ9o8hHNONJcpBfmLUGi0v9YDlGTnpUUz1s=;
        b=GBz3NPsbGDkRTTNjG5q1hMN2y6luSTaReKMYnhoGmI/rk593fgb2R6izpv2gk5I6mH
         rf7SKHm2mjuCpT/9skEDJ8l4CK+Q9zD5we8qTmRiin9De8pqiPHbI0TiAbsplVphmwRE
         9VHgwCSnwazous2wru4QCb40TKfhVl5iMPeii/qzTQMxPUocBxel6ld2pjHCgX2bHG1K
         cmHbAObpwWo3lnpuHdvt75vMhxtWBtWjHyMVBdzMYKIdn3wSEE/9fBbqd+w23F3O7fzv
         EtGxxQb9/sBor212vWJ1KL9DXg3YbfXQ5RIwHGGtEvkxUFMRH/Ljw+TmKQfyqY+FLWE7
         in+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493823; x=1790098623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4afyGrHNMZ9o8hHNONJcpBfmLUGi0v9YDlGTnpUUz1s=;
        b=wXHzr4E9++9g8ug2kS3FToQa0tFqJnU7aEHAfxF/E7/vvvqzDiJZBnCGkDwP4IC4O1
         JFbsHIIbn9R66UUFd0B+XIGSQxd2D7St0BWfGhWtuik1HZ1FXzmA2j+vOgWiLdmw1ilx
         FCIxS2bfh1zLTKotbVTbyk6tQAn1p0X+DTy789nMFXtTeoKdbROjCrV8MYNO8NetSWqr
         9tILCkZXGBxm1skeUB68DJLKFNdexgw+Zl+2wLyrA+UrPQAJzHKEmjCrOdsQGCrEwy6P
         dJ+skMxOfrwk1+UqRuLOiVYHsrSiup4lXtco0K82ZCHcpv39hUwbE2VsPKveXiPxu2y9
         ZR5g==
X-Forwarded-Encrypted: i=1; AKwUvBxX1yzzqzYzGUftJHdpIuQnkyOT/7bTD3IItziSjhWnhlLbQOqpSgK01NjF6d15nqtdwWy0WH5mf8iVwNU=@vger.kernel.org
X-Gm-Message-State: AFuF++le3HYej48OQiEEx6UPIRnWqyKesLOl1db1TTLGgUVOItb08d5C
	JjWp/lkf7ghG+ic1pRXazTBLHxXvIQCTngx/9Km/y/p9rqTxmJSq8OLI
X-Gm-Gg: AYBFou36TnB4MiCqyFqr7GnGw2QndygloRqupBqbc0UzKbMgWBziGITiMH6BijfcEr6
	fxjt5ogxcUyZKVD+YCdJcApkaefc/S9A5eDrOoxe4YNSduW4TW+1FylO4jvIHY46TnGPW4qTF7F
	WWWwlSvUikAUx4OxTWU3bkdcSUEjvd/XVKLc91HFCHBqUyoh7yKCmmAQ5j8L4bNThEuYqTuVUtQ
	JGUae6dFne7JOOGYLR9n+lurT2NIWcLZnvCbreq2yC/ToGcplAKvvMmDkt8La9JspV8qrTXIevN
	eZHd87zRdU0097q4uIq0VLk6HOD6fKbvIt7ft1Q015g01luTkkJOl3hA7KcvHglYAvq1GA/dggd
	HVyuAvb0hivhsEcwDnzkfg1IUMyFDMcN7LNLDaEiXsmCc0gH0YTyT8bpS9T7yeo96K00Q/tKM5f
	Fk1ayiq7aUFEa1OGEhTE6fwzbdHIjnXn1CoFEKGIzDnotTX7zWwE5kg4aM7eQN2lf0uKtZv4koJ
	MPac3qmh4fVaWSNPN+wnMMT9RK2ZXJAWSBgLVlh7m2LKySAAbNzFc7bSHncnbnngeRpp2nmsQ==
X-Received: by 2002:a05:600c:1910:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e7a67f6b8mr180341525e9.11.1789493822732;
        Tue, 15 Sep 2026 10:37:02 -0700 (PDT)
Received: from PC-Ubuntu.home (2a01cb0082e4ed0062a44cfffeccdd1d.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:62a4:4cff:fecc:dd1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9e77asm5525225e9.7.2026.09.15.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:37:02 -0700 (PDT)
From: yolezz <yolezz.secret@gmail.com>
To: mario.limonciello@amd.com,
	yazen.ghannam@amd.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	yolezz <yolezz.secret@gmail.com>
Subject: [PATCH v3] x86/amd/node: Release reserved config regions on init error
Date: Tue, 15 Sep 2026 19:36:44 +0200
Message-ID: <20260915173644.107751-1-yolezz.secret@gmail.com>
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
v3:
 - Squash changes into a single standalone patch to fix multi-patch confusion.

 arch/x86/kernel/amd_node.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..20451f0ad8c7 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -239,6 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
 	return root;
 }
 
+static void amd_smn_release_config_regions(u16 *num_roots)
+{
+	struct pci_dev *root __free(pci_dev_put) = NULL;
+
+	if (!num_roots)
+		return;
+
+	while (*num_roots && (root = get_next_root(root))) {
+		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
+		(*num_roots)--;
+	}
+}
+
+DEFINE_FREE(amd_smn_release_config_regions, u16 *,
+	    amd_smn_release_config_regions(_T));
+
 static bool enable_dfs;
 
 static int __init amd_smn_enable_dfs(char *str)
@@ -250,9 +266,11 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 
 static int __init amd_smn_init(void)
 {
-	u16 count, num_roots, roots_per_node, node, num_nodes;
+	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
 	struct pci_dev *root __free(pci_dev_put) = NULL;
 
+	u16 *config_regions __free(amd_smn_release_config_regions) = NULL;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
@@ -261,7 +279,8 @@ static int __init amd_smn_init(void)
 	if (amd_roots)
 		return 0;
 
-	num_roots = 0;
+	config_regions = &num_roots;
+
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
@@ -286,8 +305,9 @@ static int __init amd_smn_init(void)
 
 	num_nodes = amd_num_nodes();
 	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
-	if (!amd_roots)
+	if (!amd_roots) {
 		return -ENOMEM;
+	}
 
 	roots_per_node = num_roots / num_nodes;
 	if (!roots_per_node) {
@@ -315,6 +335,7 @@ static int __init amd_smn_init(void)
 		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
 	}
 
+	config_regions = NULL;
 	return 0;
 }
 
-- 
2.53.0

