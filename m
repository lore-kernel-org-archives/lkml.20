Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F6385503
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391407; cv=none; b=IgeI7xMPkiqG3ZfiII12PeTg8JmR9mLch+UUnWvAylJPntdUaM/dNZEvMi5dYgMzLanUBZ7PdmQXjuB6xi1mmBO0yR/aJen+jzumargxH1kurEyiezERIfAAo6Sox4FNOJlUdodv2xFepojrKnW12By3NPW42jU2c9WnjCNju+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391407; c=relaxed/simple;
	bh=WuXXhpmjZm8njkmGlYAovirD4wrKxVKLtTAj7ZR/P9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2zOFqC3mjfoG0T5/spCKFBxNLAtbLaaz/f6nnNyR9TZF9ZtuNDKfgEdDmr1v6yy5IV5GiiNOyJhIIC29wiiu7kxYQwI0xKr+g71VRuYzvpiBlTFNV7TcB4aXZsB/KA0h9BtZtWF/db02ec7FKRpniS1+5q/aaM712R7TinLRmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfDt0ZUa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfDt0ZUa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so13630705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791391404; x=1791996204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RlhzqoT3cJ+6lZeccmZxuRb0fn+HLK2OHg/odNv83M=;
        b=jfDt0ZUaLaqfIgjTSCBVbDFPYZlVdkyvubwuDg4yWzZxVKJaMujB4SRh5Pz7Ud7VhS
         8PDk0S3lRpmrKQVkySEGq8w0hVBGzFUvki0s5X6Acnuo5nT10A+fUnxOtLcprtSgz0if
         mmgb2a3jvCixjdm89BBgNcHOn2rCA7zSDMTHsSsxIkUvCbDhiH2M8D7rjYmyRH0scY8y
         kpLB+NAn2wO0Y58KvDbv58ps4yao1jn0qDG7QNn4X54UIl+i43FdLZMcyhXpqoxmuHkz
         0s9j3c4fsHx6+Ft0R40IOj8cysAfrmtnw7tO5RA/Ty7O4wXloL23DeW++rNkEtMR0oKk
         nA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791391404; x=1791996204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RlhzqoT3cJ+6lZeccmZxuRb0fn+HLK2OHg/odNv83M=;
        b=bDBA0gBlI4P6YTVydfPSgx6wnV9HScOtpveW3ZSNzE75q/dmpa28yuR0u5H2X5yK6s
         QOQNpFwJsUJji4dZ3xqt8wGQdRNXApy0lzPXf27dNr1N2X9409dBXX+dRq2soq35Kc4Q
         EqsU7v+FgPAzPh7/c4cnUO/PinHu5lkEq/V/9r1kMJCHW4oJuLXoob4hzOD0aa1k3Ngl
         lP84kJ8mPFHrbXC0xSFv36Sb/5vyn+jO03jGBr6HoIh3MDqLSkwp3TrPou63nyr+SAKi
         QXmTVU3QtjmSwOy1fRutbqRpzQCGbGED5Xh7fbaKvrU5OVjacJBsTE/IHOHyfIxmo8uD
         4y2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSi0GAZYi4dviLf9wpllUBne2aReW8uSy8B6lweJ1cBRNNlwU6L/oF9St6BQY8Pp8OWtoJf3SqRB5Pvwg=@vger.kernel.org
X-Gm-Message-State: AFuF++lj846PwPYIHLYXZqVJtl2xLbpgQ/5qlymhPaWxb83VpjGDkM3u
	u0NKHO0kVKa/b5woBga87PAKdArzOcCHIjLd/vzAVMZHNph2m5b8KDxr
X-Gm-Gg: AYBFou0QNzClp/CRHT1gvw6EIhJD68GHQkYUhMhSsAgP+Hk7jqYj6mpJ9blOqqZu28Z
	5SOecBXhuShsJfUxkaPTZihgkvjJ5y/U22gaXY6jG1L0Y93Scy63He01Dext4hsI3DKEJ005Cxt
	31PC3MsTW+DoUjR3LTvgBy+Vjxnuz6WMzaIlGppujNSTYjHo15AQvICGasQ5IGl9vM+v+6ozGK+
	sfNKzWoKWS4mqDozdToiYQtvJSD0Hp0F29AMOW8Uvydu+szSmrYupvJhxNFoWx/epTz3tdMVAr1
	I+w7VPifDN7yTH31Dt00KSPBiko/c5hDWavDRh4Smmtn9eUF5UV5FJu7d5zVyHSf252GTrC2dvP
	3EyPgopiaH1SxFHur2aaPb8qrslSFJnULwDM9zuIAF9jVvmMdhFEZ86iu1QRGpgSIpF1WHGfICk
	Bln9FDK7eAGXMBGkOG1r6JoOGHjXICB1aspyJfUlURwt9I5X+sq+Dn2lvvQUhTy1gQTiGvhHDVb
	wWdk+QuBIVG/rUxix1NFBICwmL6jMUYITARdLb0h9kx/0My7wWK
X-Received: by 2002:a05:600c:1c03:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a180423bd2mr56190855e9.16.1791391404162;
        Wed, 07 Oct 2026 09:43:24 -0700 (PDT)
Received: from ptb-02009389.paris.inria.fr (wifi-pro-83-031.paris.inria.fr. [128.93.83.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2eeb6sm6373096f8f.43.2026.10.07.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:43:23 -0700 (PDT)
From: Ella Ma <alansnape3058@gmail.com>
To: julia.lawall@inria.fr
Cc: alansnape3058@gmail.com,
	cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	nicolas.palix@imag.fr
Subject: [PATCH v3] coccinelle: free: add a checker for `__cleanup(kfree)` usage
Date: Wed,  7 Oct 2026 18:43:16 +0200
Message-Id: <20261007164316.15102-1-alansnape3058@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr>
References: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr>
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

Changes in v3:
- Edit the error messages to clarify the reasons and results

 scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 scripts/coccinelle/free/cleanup-free.cocci

diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
new file mode 100644
index 000000000000..48e47ed2186a
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
+msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
+coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+p << free.p;
+n << free.n;
+@@
+
+msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
+coccilib.org.print_todo(p[0], msg)
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
+msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
+coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+p << cleanup.p;
+n << cleanup.n;
+@@
+
+msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
+coccilib.org.print_todo(p[0], msg)
-- 
2.34.1

