Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D9C4AC15D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552589; cv=none; b=q3MB7EemwBbuk5ngH9ZhgobkcPxHHIn6Mbd5MbrL7/kjkVzI6eF11DFxUtlhE2IOiwzTofUUddS8Z2jzHh4Wf7GoteQWghuqoWydFFQuzgATH1GZvq5mDn8L2Pgbd7OeVMIs5O4WyhRdsY1lniCG0wEclS6eQC9OE/wd3Bi1bSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552589; c=relaxed/simple;
	bh=vRU5J3c4msjb8IzePMDAKsiMixctA9UFffFVf2m9SFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKo95KOEyyMyPQOrhaYTuB2NgjCoTQxP964TIxmCMyV9Oh+9lAE6qARpQCoTOnblzQmZ9Xgh4oQJzK++444cnVWWb6KRuXApmPkeBEOw2Dlui4Y/CKCNhlS+kfgloimcsyJuSm+w47keK8i9eD4uwkIcFU9sXQmxEXf8hO5jmkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtd/2u59; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtd/2u59"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so121681866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552581; x=1790157381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vzELjvxkLjKklSg3OZap3PZaxFxyxgcG6xlOQMfPgM=;
        b=Wtd/2u59AU+m8KG147PVyiqbJUoFudOG+QoZPJXLe2Wt09xgnzxS0yUR+zHVchE0//
         q/EY6PrNyuSr0KkHnY059iGjuZa6Bvg8GDyZO6XhpO7yqkrY9lWfjVs41HIldNik4R6u
         zBg8gfH0CtgoGYtTDoBCRuWWiQ+Pe5hdeS/O3VV03gN9jccMIBV0ZhLZDnJnav2KcjwZ
         IhMNPnUSVZFDCLrSkOpVNn0wObAc5lmas7HaiqL2od+sdA138YGLh+iBOu56Pf6uIUr6
         QWlDM6Tf8qFEaeVyCEUzcE0DM6UWvwZLJaHoz9GXq1feT2fsbBrMgHRnGa35IlDjUJpP
         S10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552581; x=1790157381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vzELjvxkLjKklSg3OZap3PZaxFxyxgcG6xlOQMfPgM=;
        b=ejCe9iSAGArsjHfi3HkgBfu88zP8yO03oy9qEa7qlF7vDhC9t3EVwKgqGKxiZ9D7nj
         NNIPbCfWLHuvN05jDfKYPCzWeS0yjtu2irzzg/1C0TTjfACVY26iTSUpiLha4BWbi870
         JN9HH6Z1yDH79mldqKJWdfkwX1jRHK4eUusRC14pV2z1olzFRfa+xE3Xjsgr29WDZ6sM
         U2LszoiQM/Yi0CzvsYQfhM/KOG/DTs25tOve2duLt2qULAq8YfnA1Mx20F78ytz4YDd8
         +QphwkXxONZIHsD9LTsk/2nm/xLu9/BN1+F5973ZNTQoj7pCIErXhTNrWvMQseZU38Ca
         JR9w==
X-Gm-Message-State: AFuF++niqEK6cqhpnddTW/fVK7MG11i6fMsMd45hq5hey8EXdPtFE7xx
	mFeb9x141rziZ1u0ZRnGaMmWfxnZe4PKTqXkB2AzTmtPTAnzHolUyuW/tO6PvX6kj+g=
X-Gm-Gg: AYBFou0Q6Q/UaBaoufNpbP4ttuIsz5cXpUiie4lhGMyEuqFSsg9EgRlPuRnE59aKoZB
	HPidMfPt7coqY/MBiVwHsnOgKgQ6EQXOEO1Te7RWYVLGtELAePsy7zmWx+t3sqSCP+7rWH4J3c2
	7+t6s/RkNL7M257iAmAKnFDB3auwEEHPNwQGfAvOoOmfFDU47K67h+uBdjVLApnQIxSNKEV6Mfd
	892RUuKgGdK2IJzAWoLpKXYM8kOs6H4iEVbZ14yjo2sibe3mXvDUeS6oJXr+VCoC2fvcMyPqTrM
	MU4g18zyL36FXztxDqB1j8vDalJWOaqQ8jeAEcVTRaa9cF+ix54RUzY1eFsQ1HEHqIDkLuWDhkB
	fjDyXDI6R8zeCbwLjmGvNSLOv7fJ6Y1eCtxQ4XuQlAfZy2Rlu4ySK0GZABrC+F44TErI2qn5aWg
	drbnl/yss0CB24oQamERmHbozvXI24tJVeVk90kh9ta0KID/vb86922CuXiGImIv4n2Le6S1JLw
	SvNp+F0STOi50vDSWydCmgKDc4jqWNS4YVk8bmmId9mzVbswLQK+87Zeqqmn0pKv/iT6tFveYzg
	RlN3lRzSv90/w4WSyPUqGJY9r+IbMNlob2gQPW9NSWmzKeWi1fP+e/W7IEhzfJAUBAIe8uoOnVf
	KaTKmaB3g101WKAqPywT7nuzUrPsyNbJ1frtDu3poLfY9QnkUx7Sd8E53yRNbUHtZlfagCCogn4
	CdricDIDCj5m9t2NOGWlROj8Wzoy93Y5U+OjUjv+vIQW2a4PbNNy6vvAhk0wRvrMGYhcGJwgX6x
	zamgxhSHbaRd6xd6lHpL3AR
X-Received: by 2002:a17:907:97cd:b0:c25:192:99ee with SMTP id a640c23a62f3a-c29e51f199amr125936466b.19.1789552581020;
        Wed, 16 Sep 2026 02:56:21 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (129.63.90.34.bc.googleusercontent.com. [34.90.63.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de455d58sm102564866b.16.2026.09.16.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:56:20 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: [PATCH v3] coccinelle: api: add a checker for pm_runtime_use_autosuspend() usage
Date: Wed, 16 Sep 2026 09:56:16 +0000
Message-ID: <20260916095616.1394-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
called in a file if pm_runtime_use_autosuspend() is called and its
devm_* counterpart isn't present.

Assisted-by: LLM
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Running this in drivers/ yields 195 results, due to
pm_runtime_dont_use_autosuspend() not being documented well enough.

Changes in v3:
- Remove note about resource leak from commit message
- Link to v2: https://lore.kernel.org/lkml/20260915064327.1377-1-joshua.crofts1@gmail.com/

Changes in v2:
- Send correct version
- Remove unnecessary position variable
- Remove metavariable
- Link to v1: https://lore.kernel.org/lkml/20260914151145.1328-1-joshua.crofts1@gmail.com/
---
 scripts/coccinelle/api/pm_autosuspend.cocci | 64 +++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 scripts/coccinelle/api/pm_autosuspend.cocci

diff --git a/scripts/coccinelle/api/pm_autosuspend.cocci b/scripts/coccinelle/api/pm_autosuspend.cocci
new file mode 100644
index 000000000000..581e874cd10b
--- /dev/null
+++ b/scripts/coccinelle/api/pm_autosuspend.cocci
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find drivers that enable autosuspend via pm_runtime_use_autosuspend()
+/// but never call pm_runtime_dont_use_autosuspend() anywhere in the file,
+/// while not using devm_pm_runtime_enable().
+//
+// Confidence: High
+// Copyright: (C) 2026 Joshua Crofts
+// URL: https://coccinelle.gitlabpages.inria.fr/website
+// Options: --no-includes
+
+virtual context
+virtual org
+virtual report
+
+//----------------------------------------------------------
+// Detection
+//----------------------------------------------------------
+
+@has_use@
+expression dev;
+position p;
+@@
+
+pm_runtime_use_autosuspend@p(dev)
+
+@has_dont@
+expression dev;
+@@
+
+pm_runtime_dont_use_autosuspend(dev)
+
+@has_devm@
+expression dev;
+@@
+
+devm_pm_runtime_enable(dev)
+
+//----------------------------------------------------------
+// Context mode
+//----------------------------------------------------------
+
+@depends on context && has_use && !has_dont && !has_devm@
+expression dev;
+@@
+
+* pm_runtime_use_autosuspend(dev)
+
+//----------------------------------------------------------
+// Org and report mode
+//----------------------------------------------------------
+
+@script:python depends on org && !has_dont && !has_devm@
+p << has_use.p;
+@@
+
+msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend() or devm_pm_runtime_enable()"
+cocci.print_main(msg, p)
+
+@script:python depends on report && !has_dont && !has_devm@
+p << has_use.p;
+@@
+
+msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend() or devm_pm_runtime_enable()"
+coccilib.report.print_report(p[0], msg)
-- 
2.47.3

