Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA546384CEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833629; cv=none; b=s1GHImaXLFb7WNuL5TcNX5570RQHJAnF7vA3R7S5n3ECSKd2wDABRIQQ5IQg3nhBqUHcSKzIjieY3PvZGyYsp8NGxb+RItbuaZUclxIe+PQRraxDPbFCDydRLWPIlTP4Fzqpzn/Zb29lxtDtH/9z8WTLzWqc2S3jYVeUBoqH1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833629; c=relaxed/simple;
	bh=J6CDJfDrHs9Xh8xm7mF4JVU7BUMT89ttkfJpwjj06p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foL9YK5b2D/bC9yYsogMG7jJz2C+dcVvaYF6KYF0EIEFoiQTYY3aMmmhSpahmR8FJAXY2KSw2hW949cN4ivli23vXQpMiqztrpTetQfeuxtjShO2N9Pxk1wRjgY5IHrzRnSoja+KatzupwTHqhokNNDGLaBeQlo9uK3uhlnXYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwD7LtRm; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwD7LtRm"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so835374885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790833627; x=1791438427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ole5s+LPcjnPZwgGNmuzsjKHTKb0fD2/ZAwdN7H+e4w=;
        b=EwD7LtRm+QdsLN1rVB2nV3oa6TUh8JPA1zIm+wENinQnq2/v3jIg8EaMTubh55Hw/J
         3qmBgpeBr6dqyLkR5c+judV5Psg48LOKCNZr3iIFKaHCO9I1x3uArM/vYmAmZfhhmlVQ
         p0mXjsR1ff4P31r6fw5UfnzO2kG7CYaC8VILjnh0ak1Mbrps5CJq4NtZAIUhRr6/R3sT
         G2E6ToaR3bcs9b/u/YWTVkygA3RhmP22AG1ZcMbs1WTZbsswnkUbqeNS0fesrXEWZhY3
         0wY723tmJvqPxOsy7SWBC2FB1yc6xJI+334CnTMd3Qp5FUAkXHfTrUn6ScZ8ytj+UyQC
         UiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833627; x=1791438427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ole5s+LPcjnPZwgGNmuzsjKHTKb0fD2/ZAwdN7H+e4w=;
        b=BqWHyaN0N9mgBjdJdAL5VZOqrIyp3Xir+CPuwFj85ln8Dn1G6MAh6TkXfGpbih7PiC
         EkLvl/JN/cI38rKPEQyOvsNHXAXQYB2ky5lkVNTgbSHE0KCLA0aOKkC3d6LzABXzY6w9
         Qs9Q1zhk+G8uEoF/2R2kRs5Fty9MLY8AgjWH2DpLU7J0ZJdNA4NcYvolItQ2oul5IrbW
         lxFrazL8rwe15kZnKAzLhlsQ/wEP44Vtk19/19jDBnTkLo2mLQxdhwrGblcPF2MWWJoc
         aabwWc9e6Pv1Fg0WnexW3kHPu0U9Tb4gF+WvhjM5N7zVOUem+WPGFRGzeiByKZSAK1Vx
         Fomg==
X-Forwarded-Encrypted: i=1; AKwUvBzFNQW1mH6mLTPo816EjnlUrFJT4Q3+N5VSFbgo1QtGTtaIVrBTAxt+RSRk67n3NYDUgc8+r+U1iRT3XoY=@vger.kernel.org
X-Gm-Message-State: AFuF++nFk7stGJw/X/OEM4vYz2Ml21v3uJbkd2QQVSap09Td6DOuv8cA
	eX/4RGnH8e2ahcRgXMhXl7fbcT06zz5aCo+/B7M0KbgAm4/on6TbAq0/
X-Gm-Gg: AYBFou37byAVXtAMZ3HZiBrQ0MMQ1j6vUNzIKtvWJgI53wZ75gm3RKqMdfFkS9W84LY
	PxvGKnvqKXaJDmIasQieY8kABqi3enWpwbU5Pb8nFr2P7C05scHH5Ga2ridpameyHpT1u/un90U
	8NXEouXOTlUWQvzKF0AvTFkB8gtVw7WK2V0kC7rCGTri+uVNA/Vd1QWR3WAihIRGi2AcHtBEKCE
	hQZflijGhtkY7NoS9+9RQ06lO+fn31ZUZLc9wyOgOo6ri2rw/bWudJF/6IoCMfnuv15BQApdpD6
	LG1atCfxPF3sASdhPgr+4JVj04qcFlVQbFCaQaJWSPuTVd7mJQ0N3wEOrc8kbw7CHfiEV9rewPO
	BS9UrFDr1RldOlHcOQsddsbSl0wpOkr87mIoRXHtOgIE9a81CA9s3yGmAhbmD+ZOUmd9zbXyD6u
	qzMYskgPU3k9BlX6CSx+RTBOQU/ZLgpSqFlbkAFRG+hO28EGSZ6cxgMgP9Gw3D9on7l5uXcALLY
	sdGPe7Iimbbgeg2gGAvjsiGVdpk43Dr7b15pdDsyY5V7sjYK1mqEb35G2B3GCeN/HoSYtgBavHp
	exISk+R194csZBY3BpoF144NsYsWQXXOIc3oRym7vlajnvIZAldqvf3R2uj+
X-Received: by 2002:a05:620a:2b96:b0:93c:7b3d:38a9 with SMTP id af79cd13be357-93ca94f6521mr633545385a.2.1790833625365;
        Wed, 30 Sep 2026 22:47:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cb64eb59esm140040785a.22.2026.09.30.22.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:47:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v2] clk: tegra: bpmp: remove kcalloc
Date: Wed, 30 Sep 2026 22:47:01 -0700
Message-ID: <20261001054701.39160-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to avoid allocating separately.

Use __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix subject
 drivers/clk/tegra/clk-bpmp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 067a8555c4e7..15b976162b59 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
 	unsigned int id;
 
 	unsigned int num_parents;
-	unsigned int *parents;
+	unsigned int parents[] __counted_by(num_parents);
 };
 
 static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
@@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	unsigned int i;
 	int err;
 
-	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
+	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
 	if (!clk)
 		return ERR_PTR(-ENOMEM);
 
+	clk->num_parents = info->num_parents;
 	clk->id = info->id;
 	clk->bpmp = bpmp;
 
-	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
-				    sizeof(*clk->parents), GFP_KERNEL);
-	if (!clk->parents)
-		return ERR_PTR(-ENOMEM);
-
-	clk->num_parents = info->num_parents;
-
 	/* hardware clock initialization */
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
-- 
2.55.0

