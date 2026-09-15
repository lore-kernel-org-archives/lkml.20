Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7104399EA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454675; cv=none; b=mb3T+G9hY3KXY2bKNP/FaPuc9IdyhEC0ulwIDZSXCZlAvdkuHiic4eCDRlVlwIPr0tA2dOgOsI+eHGCHeDvibMYOdAkMyZ769W2LXW3a8JOz/rd+60iGelC3g0dGaWnfd5FfzwJ5Owow1/Aaswks9iVUDYvuIzvkyEUZ956fuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454675; c=relaxed/simple;
	bh=29YjrgnvRWfUscbdlUq/epB5ISARP+Ib6TYRUWMBLhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cwh4kvYsdZKtioJjG85yJWg5FKlGklQwPJ5CT4lNduOg53R4LdgcEtFYtPvQS94A977P1ybPrBjsAslv4d67e2gvzGOawvxZ/oZZRsJ2bMgs7sqR5RZ+I1y1/iaN5n17rHh1oqXBtCPnj2b3JPwxN1L0bCkclY4YoCiIiMn8/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=poWxVqhv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="poWxVqhv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso5007134a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789454672; x=1790059472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzY2Gx3kYKcibKIt2+RyfZ1K0b9WPd5KwFe7/f1Irqk=;
        b=poWxVqhvK208p104iCYbQgko/+EdVn/x/FO68MGQxePsEIm8iLmDvQXjK4/gIczzeo
         GJLWOmqHM1XC0Bl4wyO5aFZYJeMqKZyDFo3HCJmt8EmGBQeXlkq9nzbmN9FP9TuNqL9P
         oA6U5uyVCbk/2T16fFNE98rRA1lYR8VE779Hxi8uAtJoB3lPztToEtbbqbm27jO5DUiy
         B4lK2OvP1HVyccp16LBXatkHajrNcK3xjNg8R4aS7U3ICW1a2tBlh/KE7qltl7Vqdn+1
         6ThSgjHyhxmY40loD564ApSUlFBkOceo0F8hiGT7PqCkQaenlefE/aOcSmpjSr2QRgXe
         r20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454672; x=1790059472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzY2Gx3kYKcibKIt2+RyfZ1K0b9WPd5KwFe7/f1Irqk=;
        b=ULyjU/JgkgGOWlOBvjDLBluqRMfhWe/HdhF3eg6v2A3pz3TK0puCJ8GKsxXS3juJ0q
         ldT262sZPjXMbWJOw3815JcN3+xxps/4GBMZ0pQ7UJhSNJZNwX/73w7dxDL/t7ouu4zH
         c9s8odF0OXiIHe4Ntq3IskkJtPhGYKapZDmL/vaJnSAzM4Acj3+ASkykRXZjlkeiMlzr
         0nKFZTX9bhexpAhl26WIzsKHPfE4GrMhWjEOykjsKfGflv0FxBzY+iFXv+Ch1KEoVlex
         Roku8A5kd0qxYNWXP/JXMXv1E51vKQBviTAe6oluQUIFn4omBg1PRVJ4rNoGBYGIWK6+
         5jZg==
X-Gm-Message-State: AFuF++k+VLOuJu71pY78RkeBQNPhSpjRmDHjXYdI4c0MM6Xk3oYd807x
	rBfDfyfQmZcHOfrIwYnoyrqieowBee+5k72i0LgXzLWKXODOQ9Q6nSx1
X-Gm-Gg: AYBFou1BcC3PIaX3JFCcVpMgEi7a4YCNpa/5/+sAUv2V21MjCuh9GGTR1sQI+v/PI5c
	iXY+68PXAO+ublUaLht4KOAuNPLfx5SBsXp0nMQF89IbuNFUcQZHWm9DsdrlIoE/ibyd2imxAxl
	HWrIih7pMIF0Wcd746nukkVhM9aIt/vLlrITkcZXdPbwmmaCcI5cYuoCUieIW+LvmhnqCaoac15
	2ZfqT4gVqKi0XtyZGz2S/JGi9Ub0IEF1q/i1aJRW3whnpAZLOTAOcD0ppmByQv+BqUtcoioAVGS
	V1n9hju4ZiMxI5UGNe9VqAF3blLHugiQFoH65yi2NU32/Xy8BfFGHAcFxwGrjp19mSJaSHFCCjO
	SviFv/5TqDIN5drvnQOOSAPJebbTja2qPqOK8p2thiamMxkbhFMmJL2icrCI09boiWwg0N4xXMc
	tdMlhx6uZGsyWKvhSC8xqY7VQTsc4l8x+Hw9R4W17U92pVu5vs/JwbAXuxCaYguE0lK37/c3Iqx
	lFfsUUV9WCCInehrjaTjpFFKqFsVFpzDMOIeqgxkIkiBrsIi/YGW/Ocnozm2r7xYPk1SCMPMbL5
	T0uQRJfdx77mjgIOxRCYP7R8nM9nPGP/V91LAR8c5fD5GXjkYRj4hwTU/5rV05N3SfvtuZgQuAL
	6D9tfqxtizWL/BIcuj17UoZxdMLfR1jzJg7mGJW0YcycUq3DXpGjrHZCsxxTjdCbHGteFMRztoA
	NVOaE+xHE2X+i8hHUuZeY2SL/zGN9fEbk9FNQ3Zmc+5SR9/OqYcp9EneS5ACvxWSvseSMCzzL9E
	edG+EXPrIIN4+GqrK4=
X-Received: by 2002:a05:6402:43c5:b0:6a9:5669:9b77 with SMTP id 4fb4d7f45d1cf-6a9f641ad5emr3599248a12.44.1789454671796;
        Mon, 14 Sep 2026 23:44:31 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (184.149.204.35.bc.googleusercontent.com. [35.204.149.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm5081640a12.16.2026.09.14.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:44:31 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: [PATCH v2] coccinelle: api: add a checker for pm_runtime_use_autosuspend() usage
Date: Tue, 15 Sep 2026 06:43:27 +0000
Message-ID: <20260915064327.1377-1-joshua.crofts1@gmail.com>
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

Without _dont_use_autosuspend(), removing devices causes resource leaks.

Assisted-by: LLM
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
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

