Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0B3DCD9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495562; cv=none; b=YpA4iAA/DA7+VlNr4XXdgXQK2lJVY1y7T+lB7zf9+4ZTtiT8DmTOb+2gAT1ZsMCqLmpNXOP6btJdjP/SA9ykTu4RsnJSsed6v+NHHBNvI5MqhZwxNqAT/zlG4yB/mg7265bBYbuiXAodMf4SCpJbI49TcDEw3wDu2U/VzjDREyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495562; c=relaxed/simple;
	bh=MHo3SVN3JzTzB3Ql8QrvRVmVeVwVBI9gx5VnZOQtbLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPis4EgunvwGQW/WU8WAKjSoFyI3+1iM/eXxydXFfnpbRKj/unuO9ninLrNd2pQecCiQ/wir+n5MJ5fS66S7MAIM4tJNEfOz0BiV3cO8nixRLNjHPlQay3ALTOLw5Dn+As1AFcgjS5PpoJ2IFDKaGlw5R+F5uZTujBU0EDHrvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPlnzpg/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPlnzpg/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso2483959f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495559; x=1790100359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmeya5OBJcKfgRicqkLy50yUpMs4UjoGw54+LR7wm0I=;
        b=KPlnzpg/lu3yRM4Ps/nc3qEkXmIDD4Sd6fkR4qHmQxF1VCOOqRzFgWGF6x2WwTDoJx
         6/GP5VDC5AAilONp5J4DV7Wo9/B8hCnaY82rM2GcXaOr4VDSQMngacrDH4g6iSfN0erq
         Yq+HjggRKz4xih2Q6nHF82I+fN+wKu1Sjg8Nokc1+ZVxWpopUiFnckkm3X22DODioPUx
         OpEXJU/1ybFvetL6ChiviZC6k1gNQFTViKFpVBI3ELSTIn+SME0v5zpISzyH37Tj0oPl
         Pn6Renuu2GF3dC04JTKcAZBasEp67NGMHO+c0XZlIU5attiEyUGc7/wZcNLaIWrI8Rlj
         4MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495559; x=1790100359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmeya5OBJcKfgRicqkLy50yUpMs4UjoGw54+LR7wm0I=;
        b=nT5OG0r6OsxojRGKjIEUcB2a0jsSKM9UmAsK/ntQn5XvJU6S2QmJbA2tENTrFP5gUd
         hlEHx67zUSxT81dZ0f6N9LvOLel0+D6tlSApRumyb7PAHg9ozvMIVDinrgnQmtLX7jHn
         TZD9mPsV5OHuvy/M6ATvBcVqkDCKzwZxFYEYNQifHEhu4fnC47kkYNXCNgVWo7mQgW/7
         JjV6A+KOjsOjxHzEhCx6Z+eJ5/tz8Z9vDjnyrPOa9Mc447P7sRlEC37Gm/ybgKLujd6A
         1nOO9GNEkr5bE4lJB/fJRF2aviTi4xN21QCFUXX8QJjzXDfur8vJhYTWDL1aBXziM1hB
         pUdA==
X-Forwarded-Encrypted: i=1; AKwUvByfw8GhIzBXztaJNi06ScWo2jEk6w6yx1QVEiM3iY/87I5O7gFPmb8m/BY0Opkwt9iVE5rJJH7nJVqaE4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kWqXRtlMEV0qvZ9U+lb7z/QZBfV75cJmFACU+M9uRrCzAAur2v
	A7xfyOhBynf2yWOxGNdzAKkZZ0CnFjMoMCuWnGRgJUY02O6GF5qqMhET
X-Gm-Gg: AYBFou1gDfRTE7AK8Mg6k6C5C/Wl562vDZS4SBmua1sTz+0agvOe1Uy0JZX3kJxLPu0
	LHf3Z2XUDXOJYl7zge0Jpn4QoR/BSsq+QmPRTAGhAO9TzGhIhvdyt027fqaG4y7dVKJI0cwG2EY
	yFX+5RKffwLBoTSzaMs+St4ZxUMbM4bqBtJ8pQ6/+1I64/ucd0re8nUZBGusxrjOK+eJfxufFwu
	6hW/qnqrZt0iijWFW9DYh0JSvRPYbwJGjYIVoQXATI8fzKkAE13NtEI39ta3Vl/Ny5UyeoLkmcY
	cStLxVQ0MJVKI6wmus4hvPjTIO7+lbeIy6gozu8fFPJV0sUMY0MsIqvAa1ClitBRb339Y1VMkKL
	d7OWeHEQDJMUf9SWPNRPABdWGTdAyIHlEDJkgpJtLWWSbWo6MJupy0f05U+TC2e6h4JHXxPhn1v
	EsymItaCuVgJqbsz1dy7g7zNLvqQGXKd3Ae0WEVbNBFTWy1mE1aR8c4aLuanMCcS/rBpsaxHoUN
	94iPEsbaif/3Sw8vwzr5DmFkbMeFbm8HEanidKI55JDZi9DqzYn51inMfDF7To1QdjavCgPrA==
X-Received: by 2002:a05:600c:1c1b:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-49e7a692563mr115056015e9.26.1789495558736;
        Tue, 15 Sep 2026 11:05:58 -0700 (PDT)
Received: from PC-Ubuntu.home (2a01cb0082e4ed0062a44cfffeccdd1d.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:62a4:4cff:fecc:dd1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm681883f8f.34.2026.09.15.11.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:05:58 -0700 (PDT)
From: yolezz <yolezz.secret@gmail.com>
To: mario.limonciello@amd.com,
	yazen.ghannam@amd.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	yolezz <yolezz.secret@gmail.com>
Subject: [PATCH v4] x86/amd/node: Release reserved config regions on init error
Date: Tue, 15 Sep 2026 20:05:43 +0200
Message-ID: <20260915180543.112708-1-yolezz.secret@gmail.com>
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
v4:
 - Remove unnecessary braces around the kzalloc_objs() error check (as suggested by Yazen Ghannam).

 arch/x86/kernel/amd_node.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..a1db03d3777b 100644
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
 
@@ -315,6 +334,7 @@ static int __init amd_smn_init(void)
 		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
 	}
 
+	config_regions = NULL;
 	return 0;
 }
 
-- 
2.53.0

