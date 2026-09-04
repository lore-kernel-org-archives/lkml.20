Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88568448BAB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520209; cv=none; b=XTqSIXDl+t+ZwPxF7Y2j2UnnxAnZ/Wg+i3c9/BXyBywuwpJN2U947308X2zrOaghq8ksHt4dQOL8pLTBitPvnOuhPPf747Xj3lMXwZL+V/KaNnu+gkz1U9sRb8c+CWTm+XuSe6WiPLFi9PmFiRR7/5KdGz8TN16+wYL229S/73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520209; c=relaxed/simple;
	bh=GYR7vyanVJ8plJU01WoNFSGTHSYQC4WumzJhgIObNr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=avLnhgGVp3LNc5ihZ2IZ9BTPYab8wAYN6qUlqdaSrGoME/PTAon4o7uD2EconyQ1QNIwauAQ4BH3nSAi3yMO1uqiRL6TfD6p1FWDf8v6fz0hpsFGuCAnfyTqj6aSpc8f7rTZvlevIcnC9G5hybICY1MK3mIgEeU0xqxpUlXi0vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXISd3ZO; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXISd3ZO"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1067896a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520206; x=1789125006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHrBvnDyQmGN2H5xjBYZYpnknekC9rCkGbvIkvPCYYU=;
        b=CXISd3ZOjTR0eHrmBwQpPnqqS9RhVQaEgTaAetkBnJ053K4FvYO3KVq0rwK5ecpmIz
         BrMhDLLACu0gxfF5nQtPVmbn95K5isLL1pMW6rbs3+KsR9JdueB0CAH4xSCngPdAI6+m
         gfAWjgq0vVlL3l+0MO0l5hB19RaAHJTvwrSDd1/b0tSpvudHXnDtMHe7hYlxPr6fbDuL
         IsXMYlO2uwVXk9FmgQeGgL0auAInH+fKzDrI0OU7AFZcoSehsXfWSOkWxJkRhx6x16Iu
         mp6qxXxNKaQ6M9e14XzF2zBe4hq8Vlbo5WV3lrqDsak/4I1hFsvSZKh3a/yvLeJlAfdz
         OhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520206; x=1789125006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHrBvnDyQmGN2H5xjBYZYpnknekC9rCkGbvIkvPCYYU=;
        b=jRihgYgRfqN89VjYJRzqLUC+OmTGTcVaismKWZXrq6z7/ksfrIMOb+DV/oDvDlbFre
         f+WJmfyCLGcudQfgN/EIGUI+0/maW2dQpDq+xQvK12H3k5JYp+VX9YylhR8oGIAqDIfk
         oV5MsFJba5X5f1NejhdK1gBc2Gpjn/Ty+czujXd4GOMgcA57rMO5PmkLwybu8BPylAvr
         g2aDaLf98rjU/JL8tcqh5KvFWmmfRgczRaLcTjUSqHqPPVKA/YuGgE3zK/fAj6j1/FQr
         SF/CDYrOeBm9j4xXu83lva8krq9S/9SGrk1Cgiiab3LW11PjgJe1xHkd71dphNC17JOB
         Wvzg==
X-Gm-Message-State: AFuF++ktrurZov+iC083tbueuYMqpdOqSqzJds+MgOYWQdzb1uYfG4//
	Zw6cvTNyOc5lgPg+s1qeof+eXlF3SaPD59TlTU+UnX/RuwtMB8L4ZUs6
X-Gm-Gg: AYBFou3ZRnnix3X0rL7YfzOdK1e8QDU06kdpLArycWSUS7CijIFL2va7OVMZA1kXiXi
	2ZecPTGNZoivZNcUKkuz7tTUWgT8p9zS51aIS1XoDbK7SPYQKbtJeUbbJTCNNz9KpENp4wrI+yt
	ugY6W/xaDswBH05LieXQubV17CGpSsJGOx15qUpMtRM/IyvRhWUj8uPlDuy+srgXeKNIWS98ZhO
	rLrwD3MKkxoJMYdPs84a4jI3oB/Fg3aPUBxp3cyfwJjowaL8aYMgVOLaKJJArgnTHGF9c7/qX34
	La8BKWk7AgjSIm9Ls9E2nTVxcDVoacuaKTBvWTtHOLtsp5oTDsuShnk1tQcJBWDbQEM85yPEi9b
	HXvfzmJQMwZeBfy8MlLEzbyUz/ZGYGQXJ6PI1089WcuaZhVxoh/rS/dFbeLoobt/8OxM/7z19tr
	Vy3ARjzGiJzO4Rly+JqwhMJZ5z9vpbIHmeNpdVcy334H55ioP+rCBMWT+Bj5FvEil+WAKevMjPs
	1J3X1PfN24G6DE=
X-Received: by 2002:a05:6820:162a:b0:6b3:6444:46e with SMTP id 006d021491bc7-6b6facde170mr3834718eaf.8.1788520206216;
        Fri, 04 Sep 2026 04:10:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm2492230eec.4.2026.09.04.04.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:10:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] clk: tegra: fix typos in comments
Date: Fri,  4 Sep 2026 16:39:57 +0530
Message-ID: <20260904110959.21527-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 drivers/clk/tegra/clk.h | 2 +-
 include/linux/clk/ti.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 73efd2ff37c9..afa93ba505ab 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -255,7 +255,7 @@ struct tegra_clk_pll;
  * @set_gain:			Callback to adjust N div for SDM enabled
  *				PLL's based on fractional divider value.
  * @calc_rate:			Callback used to change how out of table
- *				rates (dividers and multipler) are calculated.
+ *				rates (dividers and multiplier) are calculated.
  * @adjust_vco:			Callback to adjust the programming range of the
  *				divider range (if SDM is present)
  * @set_defaults:		Callback which will try to initialize PLL
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 54a3fa370004..61c4abf19995 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -51,7 +51,7 @@ struct clk_omap_reg {
  * @autoidle_mask: mask of the DPLL autoidle mode bitfield in @autoidle_reg
  * @freqsel_mask: mask of the DPLL jitter correction bitfield in @control_reg
  * @dcc_mask: mask of the DPLL DCC correction bitfield @mult_div1_reg
- * @dcc_rate: rate atleast which DCC @dcc_mask must be set
+ * @dcc_rate: rate at least which DCC @dcc_mask must be set
  * @idlest_mask: mask of the DPLL idle status bitfield in @idlest_reg
  * @lpmode_mask: mask of the DPLL low-power mode bitfield in @control_reg
  * @m4xen_mask: mask of the DPLL M4X multiplier bitfield in @control_reg
-- 
2.48.1

