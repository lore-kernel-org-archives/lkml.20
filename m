Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602273;
	b=AV4BqsccOpFpWtNSlL0nTJhCCzZBKEKrlBrEvuW7awSooW8HjxR3JXb1IZ+4WSNomZ4q
	 5nlc/nHJff1p4poIZVQXuz962fWJITq4xFtgM5vZa4i1SJnxVy3BGE4oV3hOExtpci7dz
	 cVbL5/85Rsdz7kloDb0XMOdnUPi6Cbgv8cCkei0kZdL7SgmDgZGKlbeup2aCmgLHZ5QlG
	 8t6dahlvVpU77cboScU1GlImMuFFsjWtHiBvFW0N5d5yhs3gpk5ZO02XJcCAchxZauUHm
	 CT/jNaBZGzWy1sAWAW0PxDNwtV5Qyip46wOa3ev7uKi0KmMtDFaPvpeZ3bE50GeeNYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=;
	b=TOUzszvB8XnKx8NtLI7sEAFoOqd05XERlfrVFKuF4URYrUHniTXSAQSH8LU5zcWioS83
	 qHoXpYvQp/2tlWrBpQldTJ4ZhZA9ae0j53Uwr9KB0LOZE6iqf7rTB5VakXOClC8yc2bfj
	 gVlDfV+MrMmx4P4y8ojJ5pIDkBBk5SiKxNED2xbtejxR93cWuQoCfUXgEp6WD77Jt6c5n
	 TmVXr4G66sgmah/6AmK8j59dnoAjQaW1Mox4mUtuob1iUXip09y2r/UmYNKBhbJdAkRa8
	 hCQDRu3wFmZMt7wRPHxT6cuotyovOu+sKT/IlK/xHyJ3GvAOgPmMXc3CkajN2V7HbEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INPVgOja;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F259606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F259606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INPVgOja
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-717028b412bso521803eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602271; x=1795207071; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=;
        b=INPVgOjalJDp9evLK3wR8TOFBOSZM1s1z3LrdFyxIC8+s/DMCUt3S1A43efz5JTwvm
         E+nqS86Mpxo5hYJDp/TgezrtPlIK+gjggLiJv01hd1IgVnTEXr1y6Y5vC0fcjd8zy/jT
         p25tvlYT51fNzJ8Xow+DgF+1LhNfeps413rG5sX7bm7S/DBLAZCFwhiQeYyVgwQ3z3cT
         IdZxiYaTZAwdTxwSGNnyLzcSIDx4RyGJiZMr1vkuXoau0VYKcE5TTmxr/rXQtC3p1hSe
         J2WEkfoyRZlSlTdflVyoEzlvkfOLcKBwk96j60cmTvjRM95GgIpqiXkfE+8La0/x5SVI
         mfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602271; x=1795207071;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=;
        b=rsbRaeUZ6Kmw7djrTpQdx4VeA7cJoJqGx34vdbOOsxg+Okf9WSZzmT5AhTbu0rfSCv
         654oCvas7Mc60JC9N9kVvye3jEzSfNX08dDQ5GtGogIomYiQO3UANE5gNTxqwcr/QnCJ
         0+2N8Jo+ncN01zWarAhVwipBT8nA2Ygs7wwaciu5PCfUm8pMO7vvlMxZA7N+Ql08qMXV
         JkmzsGK/zYg5DC5ZEpSOmV71IpFmr+U2+08K+xJLDeCZt1mje8nFOO8V/ttVGGsHhqcZ
         v+W6apsgC/Ae3tgvYupPghBB6Lhhow9xWpLoB9rolLVd4rnJsdsSQC8ih5xnsct0bgc9
         Ucqw==
X-Forwarded-Encrypted: i=1; AL+hErHtaiyN05LatLshy/zfLRY1vGJyFoHU3Vjkmccsmj2nxjoCpMXY7H7sUpyphGt6NYm5B7T+J4Eu1f6Jlhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tlZbbfZ76YLDqnVP8vMY+PJ7+lZFyYX0Ht++e5cEmOYJvsZsy
	v+05L+GBAxkQANN58YR5tvl9PEW+ZVShsZs7q5TRftN09h5rGA5fDpHr
X-Gm-Gg: AYBFou3BR+VTm0hdRWEolQsI9wYuIzs3GlkxzliF3mp+J6ppOf8W8tlAiJ+v56msZU7
	F7xBargJyg1l+aRo0mbAcN4nEYMoGJ324864RD5M9DrGgfUyoNqzem2Lb25bL0VWrzTJ6trP1zp
	k1ePb84byhQMQiRxguL06NehPCWzPy+LhV/GZCz7R+6OcAKVgtzj06sJ3syZPJE84bt5vJaI+MM
	oFdedkEMVZkdFD9VK+BjgIxI+NUALBkPFVSqsycmWCf21EwMY9A/PCCJk7Tnew+OQZ0CkTXxKut
	SQNrpzxDP/FbdV6sQ05ZJHHm9qx6ST+L9T2ipqY/jN+UliiorTxD9/7rBv2o6dphGd4lLVvWd/w
	zMOEfZd/WAlDnnL1EbmLtLaN1uGJ8xUqTnuGxGTf/ep3shymouH+30Fs0Xp5+pDc2DKdhwxqAGO
	FVPXfUamT1QYMppciIWR4LuDqvXLfkS+K8T+Xky81q4yKlGcMI4KBf9RmxzRLWjfOCNaEjvoKMN
	4OrLsFc+mBaKOdybh6ewPL6ong4KtW8nMbhmHuDSlEPGzm1WzRWqCYwI0jHaMaF9MjptrnZFVFl
	TIGhQQq42AXXhCpldrjp/mZLBNb1PowCBlJvQde07sLx/2spfVk0qG+tygbDifpAUvDld5Y/7sx
	FzxHP+NFduUhq5pkarfdbBFBzPccQc1oYHL9FlwDh
X-Received: by 2002:a05:6820:571b:20b0:711:1e14:d9b4 with SMTP id 006d021491bc7-71ab50733b0mr1707192eaf.39.1794602271380;
        Fri, 13 Nov 2026 12:37:51 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm3202582a34.17.2026.11.13.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:37:50 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:37:48 -0600
Subject: [PATCH RESEND v2] clk: mediatek: mt8173-mfgtop: do not use the clk
 API from power_on
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mfgtop-no-clk-api-power-on-v2-1-7170b91716c0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43OMQ+CMBQE4L/SvNlnaAtWmRx0ddDROBT6gKpQ0
 iJqCP/diIuTcb1cvrsBAnlLAVI2gKfeBusaSJmYMcgr3ZSE1kDKQERiEa24wLooO9di4zC/XlC
 3Flt3J4+uQZ1QpKWOZSYlzBi0ngr7mPAj7LeH7W4Dp08ebtmZ8u4tv5uVDZ3zz+lFz6f+P4M9R
 46GCp4obbhQal3W2l7nuaunoV58U/InJZBjtoyV4lqaJDPf1DiOL49qBzYpAQAA
X-Change-ID: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602269; l=6755;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=v3U93jt8orAgu7mG/6da04OsfMNjJZpfnJCbViyIMBA=;
 b=cU0Bo1FdR39xrhVHWXnJGjZfzo1uEaSkQm/WaAkCDpxeltTvsMLmcWVv/n1HBi7WqDJs5RIQz
 8qvKd8tIAIJCdwZBjXI03S/ak41novQye9/VhzttpqD+qQA1rGvfpZ2
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
that this same driver provides. That is a layering inversion which cannot
work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
-- this driver's own device -- and genpd power transitions run at _noirq
time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
-EACCES.

Measured on mt8173 (amazon-suez) during resume from suspend-to-RAM,
immediately after the secondary CPUs come back up:

  clk-mt8173-mfgtop 13fff000.clock-controller: 26 MHz clock enable failed: -13

The failure is not survivable, because genpd_sync_power_on() ignores what
power_on() returns and marks the domain on regardless. The clock is then
left ungated-but-unprepared, and the next power_off() underflows its
refcount:

  mfg_26m already disabled
  mfg_26m already unprepared
  WARNING: drivers/clk/clk.c:1048 at clk_core_unprepare
  Workqueue: pm genpd_power_off_work_fn
    clk_unprepare / clk_mt8173_mfgtop_power_off / _genpd_power_off

Gate the bit with a direct regmap write instead. The vendor driver
(mtk_mfgsys.c) also drives the four MFG CG bits with raw register writes
from its power sequencing. The runtime-PM path was never affected, only the
_noirq transitions of system suspend and resume. mfg_26m stays registered
as a clock for any consumer that wants it; nothing currently does.

Because the gate is now driven from the domain callbacks, its enable count
in the clock framework stays 0 while the domain is on. Mark it
CLK_IGNORE_UNUSED so that clk_disable_unused() does not gate the 26 MHz
clock under an already-powered domain when a consumer probes before late
init; the domain callbacks are the only writers.

Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
RESEND: no changes since v2 [1], rebased onto v7.4-rc2, with Angelo's
Reviewed-by collected. Jerome noted this goes through Angelo's MediaTek clk
pull request for 7.5. The Assisted-by: LLM trailer, which the kernel no
longer uses, is dropped. Regardless, the patch was still developed with the
help of an LLM.

[1] https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Changes in v2:
- Mark mfg_26m CLK_IGNORE_UNUSED: with the gate driven from the domain
  callbacks its CCF enable count stays 0, so clk_disable_unused() would gate
  the 26 MHz clock under an already-powered domain if a consumer probed
  before late init (reported by the Sashiko review of v1). Verified on the
  Fire HD 10: the gate follows the domain (hardware Y with the GPU active, N
  after unbind) while the enable count stays 0, and the GPU keeps working.
- Link to v1: https://patch.msgid.link/20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com
---
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
index 3f4a1320930d..614b21e7ae9d 100644
--- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -30,6 +30,8 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.set_ofs = 0x0004,
 };
 
+#define MFG_CG_26M	BIT(3)
+
 #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
 	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
 
@@ -38,7 +40,8 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
-	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+	/* Driven by the power domain callbacks, not by a clk consumer */
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, CLK_IGNORE_UNUSED),
 };
 
 struct mt8173_mfgtop_data {
@@ -46,7 +49,6 @@ struct mt8173_mfgtop_data {
 	struct regmap *regmap;
 	struct generic_pm_domain genpd;
 	struct of_phandle_args parent_pd, child_pd;
-	struct clk *clk_26m;
 };
 
 /* Delay count in clock cycles */
@@ -66,12 +68,12 @@ struct mt8173_mfgtop_data {
 static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
 {
 	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
-	int ret;
 
-	/* drives internal power management */
-	ret = clk_prepare_enable(data->clk_26m);
-	if (ret)
-		return ret;
+	/*
+	 * Drives internal power management. Written directly: the clk API
+	 * needs runtime PM, which is disabled during _noirq transitions.
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
 
 	/* Power on/off delays for various signals */
 	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
@@ -103,7 +105,7 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
 	regmap_write(data->regmap, 0xec, 0);
 
 	/* drives internal power management */
-	clk_disable_unprepare(data->clk_26m);
+	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
 
 	return 0;
 }
@@ -155,16 +157,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 		goto put_pm_runtime;
 	}
 
-	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
-	if (IS_ERR(data->clk_26m)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
-		goto unregister_clks;
-	}
-
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
-		goto put_26m_clk;
+		goto unregister_clks;
 	}
 
 	data->genpd.name = "mfg-top";
@@ -197,8 +193,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 	pm_genpd_remove(&data->genpd);
 del_clk_provider:
 	of_clk_del_provider(node);
-put_26m_clk:
-	clk_put(data->clk_26m);
 unregister_clks:
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 put_pm_runtime:
@@ -217,7 +211,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
 	of_genpd_del_provider(node);
 	pm_genpd_remove(&data->genpd);
 	of_clk_del_provider(node);
-	clk_put(data->clk_26m);
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 	of_node_put(data->parent_pd.np);
 }

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

