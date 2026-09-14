Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80B34D4F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398734; cv=none; b=q3QXTj3n+j4u1G6yMpgaKPiYFxqBnbuHrGHvjhyUCoNK8vTV4YpdAmh5ZsccseBDyuL9zmTmp9bdNgqTvo8yPR+LXBGe0O4nk2uksX3ieYUBuhz07i4weM+XaOEOnrsb7Wc1fZ+MdarP0euKy3WlMGeTX/8dOSx7mZsh6aSv1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398734; c=relaxed/simple;
	bh=zC+T78M0EmMknZ+BVReYEbi7SdxDtLv8dyAUHUUmRGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNHSFki9yRhcE4egaV44T6EVl7ZTw6K0Sgjyis90KvUzjjKafC019ZXS68XM2qJMskHXpyHa+ntxK6XzKPJzFMFNcGeSlB6JK50/XUKC7NaHLhIxUex1D2p95PYTC2EjxVrk6oxJjqsID6MPQwsT8+t5sQRPCilKKb3NLGZun4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojDLWt2d; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojDLWt2d"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so507541566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789398729; x=1790003529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbKMiLOc33crfrU5bcQxom00qh7LV3rqb/B4HYkvqSE=;
        b=ojDLWt2diNd7BoBzyd9Cnwo5MuX27ZuSMaB1kTwVRbuRKC7bjmkz2KYIdEC74yDG1U
         QSwHiZu+96r9VJi/GnFVCB1xNorSRBlxCy2X6LrOpaGPruGH5OzvZO9KNwFEzIywO2J2
         UR1YKWxY/Dgi7c0Hi7XQsHANITHcQTVumZ86ZuWR5hUNow7pzlTmNKsa0UNv3F6TfC0c
         pBpU4+gq2lzFBCF9SlUznNrFOGDPdFFlSiGUX7P7F62QnxYFLSnCDKYAsucVSkM7uctV
         eXgGTFvesX0dT0Ifru1yIkQQ81vJjT3GPI5OhsOvsbcZnm5F/QOiBrdgY0aIwvVfER3z
         2bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398729; x=1790003529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbKMiLOc33crfrU5bcQxom00qh7LV3rqb/B4HYkvqSE=;
        b=su2DU1cC+4bzfXDVQ2dYrI7TRIqQR2XjOsq/KfKqhLbd+WxuAGQwyoRoYsBM/dM4Zi
         f0sP6dbxoHw7V2s08bUwM5LP72gatIAFOBtbCRRh7n225E42TPBnRw87IjqjitcIVAGN
         m5Xt6WQF1zCGLIrncdnje/T0AsJPTewEoSbreE1TkYepRn4cT4Yg5TT4Fn/tsr298zT5
         gBE8voqSfOmSsTI+3IB85wQ1JxT8sgIAJRqiv1yjC540tymjlcS4AgqsdcftpEB6fiLj
         K3xWSfmXbzSKpcRvQutu/+Eocb97X16fWoT+WGHTGk54HPV6dhE7f0TFucpUAxqp9XBi
         TTvQ==
X-Gm-Message-State: AFuF++ldfSJdeqIK/qaF2DDBzMyj0ypuDtOIQPZ4KYvWvVxt9R1v3PwR
	Ti4L7it47TB2oFx7pCIYr/GaARxWXm3uR5cM53V6v+oEgqcQL4pFS8cV
X-Gm-Gg: AYBFou3DszBR5roGYeOTXxOwJ6+tSQW7mEbtcC/l6XGnTdEF7+MV59X0kvJQ2OB4pVA
	x7/L2gmeTFK/Cx/1k8M3GL+Ze/YxFFzTV0YHsu28mAW/UVaLWYs3J+94SRYL81IEe6/4PFK3Y9H
	1EvhpuW29TIVE0kXUaWK62GH8M4GW/aeA8L28g6imDjFc/9MwxivjrGjbc8du2lofmyZV2l/WT9
	AKJctChw8o3Tk+v6tLrehdl4zFhn2B17dhYqNwGiBOMd5Sn0X9ggSeH2y80Be19ibrJUDpVr6Ri
	NirlBXdXTJl6RBm2WSXQzonmYP9BERAUeHbS+aVYgtsia2ht4VKKp/zwfivC+5gQm/fphgAPpVC
	l5ncHMcKKkbvgSPdoKUH7GrAeftpHoH2fD5EXDH7FXpM2ZKwKM8iiYfBJ4+BAYfcIDqB6MMzeJW
	HGpZq7VrT5D+TjqhPATclALr97WAAuk7lLpuzLIJk0EV3ljUChAJyc17KsjrriWIVDqPKwqrsjP
	tIjQYdgdo0D8dUFpVKrfxOVzPHxsdc9OsqhURro/BnKAHmpsg/Ld2aDX3Id+hd4AZtzeKJyOQ/L
	76bdl6jH9RjdFjMViAV/ZJY3IY+JbOFbLc4kpTdsuxb8JIRUmeB8ufVWV4jWHcgIxco9QNr2QSn
	tPOOXubTMPg5/TE2b6L3Wrig9gI4yJ2oBgC3j7hCL/qLsuokDAKXCYdFtDdAWADoylaJKJEY/zc
	nV53QZagoP/xxs4bdUmZ0e7VHNa8s4FWQ0KmGn060EUzJNUbHLYiWMDKEalVC8VmV6qkLjzGV3b
	n1poGcSVetFQOtE
X-Received: by 2002:a17:906:6a04:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c29b865bb71mr195478066b.19.1789398728795;
        Mon, 14 Sep 2026 08:12:08 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (196.177.12.34.bc.googleusercontent.com. [34.12.177.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm446317666b.28.2026.09.14.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:12:08 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: [PATCH] coccinelle: api: add a checker for pm_runtime_use_autosuspend() usage
Date: Mon, 14 Sep 2026 15:11:45 +0000
Message-ID: <20260914151145.1328-1-joshua.crofts1@gmail.com>
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
 scripts/coccinelle/api/pm_autosuspend.cocci | 62 +++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 scripts/coccinelle/api/pm_autosuspend.cocci

diff --git a/scripts/coccinelle/api/pm_autosuspend.cocci b/scripts/coccinelle/api/pm_autosuspend.cocci
new file mode 100644
index 000000000000..2354396d9344
--- /dev/null
+++ b/scripts/coccinelle/api/pm_autosuspend.cocci
@@ -0,0 +1,62 @@
+//SPDX-License-Identifier: GPL-2.0-only
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
+pm_runtime_use_autosuspend@p(dev);
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
+position has_use.p;
+@@
+
+* pm_runtime_use_autosuspend@p(dev)
+
+//----------------------------------------------------------
+// Org and report mode
+//----------------------------------------------------------
+
+@script:python depends on org && has_use && !has_dont && !has_devm@
+p << has_use.p;
+@@
+
+msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend or devm_pm_runtime_enable()"
+cocci.print_main(msg, p)
+
+@script:python depends on report && has_use && !has_dont && !has_devm@
+p << has_use.p;
+@@
+
+msg = "WARNING: pm_runtime_use_autosuspend() called without matching pm_runtime_dont_use_autosuspend or devm_pm_runtime_enable()"
+coccilib.report.print_report(p[0], msg)
-- 
2.47.3

