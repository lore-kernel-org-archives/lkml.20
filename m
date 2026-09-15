Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583183546EA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489373; cv=none; b=sfvMbExAXgwE5sro0V+hyBt+1hFozstucQOF1rjwf/sPmjEcem4k6lx0F7W2nJOWsfi/niBk8rmGXilmbx10Fjfy8j2URNkkB/QELOFK4qSM9ZvSeJwRp2uYvWSCnm5sW6yRgLBgcqpgFLg6CiqGb+K5bETat4PSBSnAd3S5ghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489373; c=relaxed/simple;
	bh=GQUkfQFQFGZn2w3jKrEqNsocI/XlfdUSQTzN2BHhBVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txMnHtpPXZYOCGmA68oQ8qVN7cG4YcUxrgjIMZDtb3sOhELgLg+hVsZAQF3Hvfg+okPLTey8lzu73FYXaN2yvqs7vTICy2bwywlBWUzEzujcbWVzfAVWOSmsB/S7QpLyWA5XWfjV0ejZLHrY9MKDwQ+csVBYFa+KFKB2cwr2cBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhp5fEeB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhp5fEeB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so61725e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789489370; x=1790094170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mqTf5D7sZAS6lXrOCj344iOLKWpe0jGLWsm9zi+D0M=;
        b=Jhp5fEeB1pyGo2dzeCaOxNYD/oBHXmoQ58x1qxLHaOu33YRnOwVctwjqTUwso3V1pm
         uBA4W/RSBufNewFMaET9X8SbC/MQiys1XrAVqym89A802KhkZBhuRMxMgkDn4vf0yFrj
         7IRWf80VhLtrfKcz31nqh8Z00gKFlYLcbvMSsymr4fRQZO2/PFdkefdH00KaQEWLYwrL
         QRjAvX+R1D8YEAYeKPtnpMLJD2VnCcuVzUZ9a8yCNAOldd7A3HtkTfWZTtzmAHlfDdze
         WEB2kFQBih0uFC7c3+hT5zf4lGwT5oP5G7wpI5FyX8GKuSezavp6mtMc/42OFpPzUyJn
         eyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489370; x=1790094170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mqTf5D7sZAS6lXrOCj344iOLKWpe0jGLWsm9zi+D0M=;
        b=HvS1zC/UOhFpWFn2LXahMYYjmXgV8hgeawhYyPLBaRcpcKbiMYeUgz/pflrKNBiwUc
         UndWd7tNe8GB2ULPxuogLEuvdO4H3IXTY3QDBl+DsKs0XP0f/4LKw6pZyhqPjilgix2M
         wWtBu6NWkMMmAmborgsDeyYUCBAPGGJQYAy7AmXJiWoCL/uyq3LJwPWKY8nx1KXTB4xE
         WEy5o0E4+8+ok3nGi4CjOKr8QZWyKbpNfy9QOBuDtBPxBgsVnwYrp6E5MGb8a2B+WTjB
         aH4s20+v4jzJr41Rfjgnbq1KUOZoPIgzk5eDJK9kdwG+FS8CFQCoRW6B1o6OJ7YSTwEQ
         Y5UA==
X-Forwarded-Encrypted: i=1; AKwUvBxTsXklqcmYqTVK0BnGiqjqWqivtpQKHMwPevmv/s5tcUVhv29r6/7BBu0jzFj3L588AF6EnJPblng7Tfc=@vger.kernel.org
X-Gm-Message-State: AFuF++laZdGM7m1wu9xpmZKy+MBuNJw1ZJsV80S18XJNtNQYPle0xg2X
	0sT8hzVtxKRIlrv5mTOMNS85bOHJGQ+BbTN63lIeCo499tL+d8HwClyq
X-Gm-Gg: AYBFou0Pi9y86WY7JsOWDP+DyeFloi42b6TmyASMzh/D+nvkqV1pgVFjbxGpRd01Qzk
	XdbdDOp5rfvkA64GDEkWDS0Xla8H7nJI2bzWl/O9YObuREqUGMPx1NwCVZAE2L8Yl7ktYUYqE03
	SloLk38WRqvNgvU8Xn16gXbOJOtwnxI1qFnOa79E1GlvM+iPl89iRx8unVLdUwgE6SjWwHNoCI3
	jxmYyU1JF6pjSP+oaqj+6LNJ7pGIrOQ3AtWQ3UCcpINeJHMD/XYX5nsCzgmzaUYi+QVQWwjQ1nL
	zoR5XB1D8PbBSG5pv/CCZ+itkljwqFN9BfOOxD9tBM46LAXK3sqRPetJpr1F0w8XqNhLTGz9MZ3
	Sz/hPYrl0fW3eM7lyMbCCWqdjMXipGpSYm4OBGimypEcRc7T7QX+4Ed6FyavKmXpKpNUwz7mCwC
	rkDaCJX7bay8fRgiErYobN9qRbVLLIghTA1ZbyummOxdW19VO1zO/+gMNeWthmULEsAEdZhDtM5
	tUVoWS6u3l3PIsSyuBJ2L8sSvO4lfTGNpKg3Lid94g2/8rYoJg4hlCPQFP8A1VQt1I/O3btKQ==
X-Received: by 2002:a05:600c:138e:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49e7d73329amr60389275e9.7.1789489370262;
        Tue, 15 Sep 2026 09:22:50 -0700 (PDT)
Received: from PC-Ubuntu.home (2a01cb0082e4ed0062a44cfffeccdd1d.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:62a4:4cff:fecc:dd1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83f3fb4asm167495e9.2.2026.09.15.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:22:49 -0700 (PDT)
From: yolezz <yolezz.secret@gmail.com>
To: mario.limonciello@amd.com,
	yazen.ghannam@amd.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	yolezz <yolezz.secret@gmail.com>
Subject: [PATCH] x86/amd/node: Release reserved config regions on init error
Date: Tue, 15 Sep 2026 18:22:38 +0200
Message-ID: <20260915162238.77474-1-yolezz.secret@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add amd_smn_release_config_regions() to clean up and release all
reserved PCI config space regions before returning an error code.

Signed-off-by: yolezz <yolezz.secret@gmail.com>
---
 arch/x86/kernel/amd_node.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..6a96d888b5a7 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -239,6 +239,15 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
 	return root;
 }
 
+static void amd_smn_release_config_regions(u16 num_roots)
+{
+	struct pci_dev *root __free(pci_dev_put) = NULL;
+
+	/* Release the PCI config space for each root device. */
+	while (num_roots-- && (root = get_next_root(root)))
+		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
+}
+
 static bool enable_dfs;
 
 static int __init amd_smn_enable_dfs(char *str)
@@ -273,6 +282,7 @@ static int __init amd_smn_init(void)
 		 */
 		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
 			pci_err(root, "Failed to reserve config space\n");
+			amd_smn_release_config_regions(num_roots);
 			return -EEXIST;
 		}
 
@@ -286,8 +296,10 @@ static int __init amd_smn_init(void)
 
 	num_nodes = amd_num_nodes();
 	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
-	if (!amd_roots)
+	if (!amd_roots) {
+		amd_smn_release_config_regions(num_roots);
 		return -ENOMEM;
+	}
 
 	roots_per_node = num_roots / num_nodes;
 	if (!roots_per_node) {
-- 
2.53.0

