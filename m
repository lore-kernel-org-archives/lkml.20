Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751E4078E0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267195; cv=none; b=sgDfeFznbYAEwjtNWYicApAIxcp448YoXHpNyD0EI5XYjuDRsz/8oQHwrhHnpPAQSksFENUYtp0mZxkB2zGWbEsgOtICiQpUN6C+5eLrnhvTxtzNlNaIkxWWWy702h8x9y5VR0/qZBQ8SM5dPtcMFeiNGcENTrrqPviH3JpDSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267195; c=relaxed/simple;
	bh=ACEGPt0xRwLMJvrhI2+ev2/k5NDL3JfS2F0kF1tJoMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQuzUbxaCwUnm4LrL9l26yN0ckQk/N6QoHzs3/zx1iQmdewXLtsF0LEngDhs2DZEFTT2+dZBfNp9TOQpmHb9uAmacIvqiLm4m7HJFE9o9WtP7Wuawys3Na5Kr9IIp3utAq1Uz6ML5Ecy9/qB2Opoor1YNfSxMZC3gVmBtQ0Hrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+wqBodz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+wqBodz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so139025e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267192; x=1790871992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWSaSv8m1xTsAwBFAkhn0LN3Bdbe0QujogDORt/K2BA=;
        b=P+wqBodz2TKOVi+Gn15mdInCC3yhyT9Ugrh0zkAQmrA7GbXAoZaNG+pL8BIWVMxyuM
         HZnJrPWGvJVqRiXnK2vQiFdntoNplJ476NgJqC8JLW+dnCV/+zhVy8uZH1VqalWSdrZ5
         GDZW9bKAqMia9+jLNtYgOW8+lmreECNODcCoxdz+Hc5++kWgEZtPou2CrnkgxoBhQtyq
         il1sCClRsT1aPQlBQ7SQ0jpCBl8rso/ehs4QQu8PMh1iNxlhqLVvd909FssGo+q4Ujq+
         ON0rWrrStpiP4qKSS7u6o4TA3j/dSrqknaPhjJeAV6into6j2BZVHX8tpZr0Vsx/26bx
         ufMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267192; x=1790871992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWSaSv8m1xTsAwBFAkhn0LN3Bdbe0QujogDORt/K2BA=;
        b=gJfgnGDJW2hBBBlhzK2FBQ9OQ6B4Q2c35tDsdkenZV+PhQ4Z+THhQv1+ewMkmoUUx0
         qBT1BGPRNQl2xv5+67+SNtetQjQTD3P3qJLWxA2scSi0IdquStAIOvlPreLtzPQj/DdH
         rWnAIW1nyCcaiwsu/Tbu/vWuNPQuxGO6PMFAAH94B3iXjvN+N4IaIIl1e5U4M8wluTXA
         PTJ+z3XlPFBlz0EJGcCimeBxN/q700rGDgyzBHraNnC8O7ZdEH1V4CBzZk1DZLCuTo3C
         jojLLRIWUqcPgvIhAWiuHkgx1csd0BhUKzlVIJtHJL0loy28xUUJ3tQeerKwUAReGQeV
         MTKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3QXcCamfTfytDATRWgOm4waFSngXyQ8WLSIP/0rm6kfRJthYI1SmDLYyUFFEHvT1VtCuPQZK7V43Tcj0=@vger.kernel.org
X-Gm-Message-State: AFuF++maUYtc6NrHQuPouNoTOKKU0qG5UaTxcffedw0po/9zi5vjuGTq
	qnm1ZEvHdvNM2lZyF5mfqjBg+MFY5d7yhuRaaMpaI2hv7cSE2wZc5Aiu
X-Gm-Gg: AYBFou2sE9HN7UyQvUAZdSW7hZtfF0OyliE+ibS7eITFvGxs8oGnrVuWxU1WkXnzazZ
	Pn4tohbuudaPFV3FE0gTO37BTTVkQRQQROGlPfgY+0QRt5VwQRVI4nwus8yDUNBcYHt1yqN3qHW
	qBDPatbzW2c70Iw3cfi0T44xscYVV1TN8sluKyH/etpa8EEI2F/+B1ZslZtn2RLE/uxw+pnDla9
	/Viqqta7PyfPP4SpoQyIJkKjNM8/8ae27UB/aIKoBqQqooW6RV2l/4+YikI9J06aLgJbgt3pt89
	6wG1D3KT1V16kmEQ9VVpCzj9yVHHlhW/MPnitWBpAHuuJ92l7VOl2OdoaiLOsMO75oWypom7zgq
	NjVQO3diW60e3YEo/s+Y+20H7NRrA++CJln/3fG8hsfVELcdlTiwd3D9bFnkXWpDAGvl0zZ/DT6
	SmhcHrnrTZuLmTWZygqQ40jkfUY8Zv3g4FFboUzmVuI0rEtjbDGrNtJe/9Le7ALozEfGbW6VZ9P
	Z72F1GyViWvHpO5K5ZmP400hQjboKpildnrgKNbF5Ljjp0Q0FL3
X-Received: by 2002:a05:600c:4e8f:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fe66d062bmr53610055e9.7.1790267192082;
        Thu, 24 Sep 2026 09:26:32 -0700 (PDT)
Received: from ptb-02009389.paris.inria.fr (wifi-pro-83-031.paris.inria.fr. [128.93.83.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm72242425e9.4.2026.09.24.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:26:30 -0700 (PDT)
From: Ella Ma <alansnape3058@gmail.com>
To: Julia.Lawall@inria.fr,
	nicolas.palix@imag.fr
Cc: alansnape3058@gmail.com,
	linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: [PATCH v2] coccinelle: free: add a checker for `__cleanup(kfree)` usage
Date: Thu, 24 Sep 2026 18:25:22 +0200
Message-Id: <20260924162522.912050-1-alansnape3058@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831134336.45540-1-alansnape3058@gmail.com>
References: <20260831134336.45540-1-alansnape3058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using __cleanup(kfree) will pass the stack address of the annotated
local variable to kfree functions. This will lead to invalid
deallocation issues. Inspired by CVE-2026-45959 and similar bugs
recently detected.

Signed-off-by: Ella Ma <alansnape3058@gmail.com>
---

Changes in v2:
- Add virtual rules `report` and `org` as suggested by Sashiko
- Remove `kvfree_sensitive` from rule `cleanup` as suggested by Sashiko
- Add `free_percpu` to rule `free`
- Add `kfree_const` to rule `cleanup`

Currently, the five functions in the `free` rule are all the functions
of `void (*)(const? void *)` type with a `DEFINE_FREE` definition in the
code base. So I adopted all of them.
Function `kfree_const` is added as it is of the kfree family and used
more frequently than other kfree-family functions (even more frequently
than some of those having a `DEFINE_FREE` definition).
https://elixir.bootlin.com/linux/v7.3-rc3/A/ident/kfree_const
(found in 64 files in v7.3-rc3).

This cocci script can report the bug fixed in
https://lore.kernel.org/lkml/20260617142632.3298984-1-vulab@iscas.ac.cn/

 scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 scripts/coccinelle/free/cleanup-free.cocci

diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
new file mode 100644
index 000000000000..63216ec5d865
--- /dev/null
+++ b/scripts/coccinelle/free/cleanup-free.cocci
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Find __cleanup(kfree)
+/// Using __cleanup(kfree) will pass the stack address of the annotated
+/// local variable to kfree, causing an invalid free.
+/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
+/// Such usage is impossible to be correct.
+///
+// Confidence: High
+// Copyright: (C) 2026 Ella Ma
+// Options: --no-includes --include-headers
+
+virtual report
+virtual org
+
+// Suggesting using __free for the functions with a DEFINE_FREE definition.
+// Update this list when new DEFINE_FREE definitions are added.
+@free@
+attribute name __cleanup;
+symbol kfree, kfree_sensitive, kvfree, kvfree_atomic, free_percpu;
+type T;
+identifier v, n;
+position p;
+@@
+
+(
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
+)
+)
+  );
+|
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
+)
+)
+  ) = ...;
+)
+
+@script:python depends on report@
+p << free.p;
+n << free.n;
+@@
+
+coccilib.report.print_report(
+  p[0], f"ERROR: found `__cleanup({n})', do you mean `__free({n})'?")
+
+@script:python depends on org@
+p << free.p;
+n << free.n;
+@@
+
+coccilib.org.print_todo(
+  p[0], f"ERROR: found `__cleanup({n})', do you mean `__free({n})'?")
+
+
+// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
+// The following list only contains frequently used functions. Supplement it if
+// necessary.
+@cleanup@
+attribute name __cleanup;
+symbol vfree, vfree_atomic, kfree_const;
+type T;
+identifier v, n;
+position p;
+@@
+
+(
+  T v __cleanup@p(
+(
+  n
+&
+(
+  vfree \| vfree_atomic \| kfree_const
+)
+)
+  );
+|
+  T v __cleanup@p(
+(
+  n
+&
+(
+  vfree \| vfree_atomic \| kfree_const
+)
+)
+  ) = ...;
+)
+
+@script:python depends on report@
+p << cleanup.p;
+n << cleanup.n;
+@@
+
+coccilib.report.print_report(
+  p[0], f"ERROR: `__cleanup({n})' will free the annotated variable, rather than its pointee")
+
+@script:python depends on org@
+p << cleanup.p;
+n << cleanup.n;
+@@
+
+coccilib.org.print_todo(
+  p[0], f"ERROR: `__cleanup({n})' will free the annotated variable, rather than its pointee")
-- 
2.34.1

