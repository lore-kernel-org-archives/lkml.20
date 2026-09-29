Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEB53B613
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709882; cv=none; b=RixcF6PtuUYJSKhtsDyUFCd55sImTKnCY99pVWhJX3vDSaeJrogTFqkLrNdzV/jU5xHG0RlqUpyO2FdMsxwRspK8Yc9Bfz5/cQMew4M63VZaOc2hJFIbRw7WDWHkaUO8gENdVRrsAOZc10Z+P/k8uL0vOA8nQdK+UlSU/8nqiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709882; c=relaxed/simple;
	bh=RvBlO2Tj+oD4izUACOcTsnJXXEePaYc3n30436iNNw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FmLuf4s7bykl7q6m1q93cgeCkrfqpsrOWdkOKs1fywwyYFvJ3HHc6xalz+gO/IhTsqNDanrx6ICjhiSJQpt3lr5gA5NWWgWMKEISNHbLYYaDpVsHw3sL7wQkSoW3ZG/30YPx2KUCx4/XwEzsMj8tLVpswmEeKvxolDFt9rP/pQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ086+nY; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ086+nY"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so14623655ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790709880; x=1791314680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lzp9+chQ6iocMfXVjqbrn94FQKdp8G+cswYdgKOgF0w=;
        b=JQ086+nY5kJDLHKyAbdl0+rEpv8Mvc4WKEGAZBVgQVlLfLm6bWyhV0R+cOZt82lCX/
         z+zeEHbkX4aTok2m0hyQ3gGCDbU8EnaSjqfV4TNyugBb9YDVo5M6GMnRfAM4x7rDIx2f
         aOAWZV6Mgp88HSGqP0x7TETh5reoEqwi/yLbbMNXBp3XAFGzr47tlD/Ro+yAOPQuQxGa
         8BKFHFCAgNiFquCPIc1rBmr1wtZFODks4LFMTAfiShjaGb9abUR4jokaWpryP8Wbfh4Q
         3UkNL89bfbMqDT9a5gQRW19Qc0LUzEMg3SWUFNgmoqUP9JmCvONCGPxDpwbobFpc26mL
         30wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709880; x=1791314680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzp9+chQ6iocMfXVjqbrn94FQKdp8G+cswYdgKOgF0w=;
        b=g1EJMlEKfTlaJ8RKgcr2JXgy0ZaSOtzbYZgncrehkRlWrpztDAzn/N7wiZZ4uwvxUH
         UqSIhZlMmf9iucSbVKMtfEUCf6N9YrLTgsPqVn73gHZ69DITrjERCA/uJcPQP/djj5z+
         /FXFFkUKqE/6FbEcRcgW0vX6CMx2tLBtCuOC6h6dA4ZefJgLQNoqQ7qZakCYR5bAZE9t
         omO7ir1IKrTSGD1xmdMu29kdq04d7SLWH22C/roeOY3jLNf99/yMdbGnJmxSUuBqS+xe
         shw49uv4avSB2CETgn3qPCl4d8O4K9FlCu6Sawk1DH25pxgbknGFTnxpUn4/6WtXr1iI
         Lipg==
X-Forwarded-Encrypted: i=1; AKwUvBxS6iShxPxt1fC+pEt/QZCQoOStGcz4jh53ykcB5tLbsccG7KiVNXIXsOihsyFFEVszqy95gFogXuPDW5g=@vger.kernel.org
X-Gm-Message-State: AFuF++njn+QdfpRemRw0/TrE1hSnJVmCT4mU5R2Wj66+giiIABTeo0TC
	LSzjERPqkfONbBkb7GmkTwkh1XaiAJzHsShzAMYuQpQO16XfJwG6Cnb6
X-Gm-Gg: AYBFou2SXYbCZrmxB/LnrJgoNtHr9INUOBW+pd3NMeU6FGCZk5bjoIaHEbISSphFKfD
	g1gJAh2feh3ElTPfCsUsNvRKrJ1ruVy9kFqtu+QI61NPernyiZY7ghv8ihIe7k2s6ku2JcvxbIi
	BLZCBrPbM2cpAdYFKu3kNb4grpXxnfrvnLFAgql5X9dJqZqI7Yyosfn0QKHwlUSWJ/z6ISbGKxS
	GcxL19ZDGpH6JqJZ7AOaYSnHm07/rze0FCjbRhwbdqtkE5I2ap0+qqsvSDnfJ23yQ3G4TsL/oP6
	sc74vbny/yzDr7xUvOiSJgdQYH+AcL/A1yvoHOehEVdVl+j82ItkjxJLGZRC+adQSqas/T8hMDR
	bjiBCNfqPDla1AjrgpsgV/JjLrcLf5+zsHsp43f7H+sNnKzL9ljsjxs2++Kwv3PI8GBqs9IyddQ
	a1cdaKsDFBMobobq3xiJANXLGob/rwDZZR2o6EsygfrD4svH6SrH5eLe4ysYETjF4dZHdSM1bQH
	mu1+OF/TWVXnNuFNPkTbhk7cvTlUdTHbioRuVgSk3SUqZeE4Qag0I60D+sVQtp4HtT42c93eD9L
	Jl6rgsyr+GGU7ikyFW6/5nGQnb0FYymo3GhiU7gfp4tgtcxY
X-Received: by 2002:a17:903:32d2:b0:2df:b5c7:d0f1 with SMTP id d9443c01a7336-2e2de565bcamr475215ad.44.1790709879930;
        Tue, 29 Sep 2026 12:24:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd39be7csm611795ad.3.2026.09.29.12.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:24:39 -0700 (PDT)
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
Subject: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
Date: Tue, 29 Sep 2026 12:24:37 -0700
Message-ID: <20260929192437.27775-1-rosenp@gmail.com>
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

