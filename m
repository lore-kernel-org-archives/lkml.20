Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9764921B4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453559; cv=none; b=q9misdRwLIL6PkRbP1i/mPtpgJcf9gdbFETmxo8wgM/QJMgF9PlhccFCwegdQCAdFNkvfNlTw3voSJVtl4qX01KlyTqI/jRarkFCZwGriCkvrIn5VNwFgZBjmR4y/1RLex9Z3RO+qiBHEEKVSa2S28YugWckikNHr2BJhL4f/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453559; c=relaxed/simple;
	bh=voQk96wKfjEQzK6ffvfGxfHHprbrWZR2CjkaCZRAIqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6gkgqOa+4MYrbGLbTMMG21UQRh9DZqXLpONlv2mdrshmY9Rbk/GTHCuYQhdQDAEbDryVaOd1Nc0GM5q1Uv/55l0YMsDsZAJldTv9g8oaqxtw+ZzgFxgo64rM194nJvhOZK3BWUcR2SLddQkE2cH/bdVv5P4Hl0oL2NHlA0ixmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9LH0Jkh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9LH0Jkh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a886d6ad51so2058366a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453553; x=1792058353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGixU0FoqHB3DXAMrtXSEoNzgdLmkIaJMSKNAw/x9yo=;
        b=o9LH0JkhNqDPiv94BapeqzldJZLJX94816qkLdp80NMjUfUF2+X3K9izaP8/Ci3iDW
         QPCTSEOiByS34YH6nNRg04wQx5tyUx02uYJ1oopGQxHpgV0d5KaUgGnMi/yVOUrAGr8O
         EmgV/O6CAPvzEVT/sz6ZonDH9vBL0JeopyDayumMKVXkz8fxI9E/dyrKv5dqtnAT05oP
         tEbxCJTc62vPqHrW3J7Sk/Db7pB7+LmATmvEFfT07mTUWEopQcRXD/SRwDaPFrzEbFZl
         x1radzichY/AiDfi5K6PfMf22ixLsRYQDO2n6Dpezsbfw71fQOjNdWnofnm7g212NQPp
         W2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453553; x=1792058353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGixU0FoqHB3DXAMrtXSEoNzgdLmkIaJMSKNAw/x9yo=;
        b=m/E6DRFyP9a0B/A07pextBHLV+fYJ+vjBOWIexAdsmoH6VdWzhHiR+cMsti0W5Zqin
         UA2TSIYhzoFbfjp/lmhuukX3GujS/Ld+suC+K5RD70K84fgheQb84G/Daiu0+g/Qj7WE
         8Lk/ka/xie6uwA4zjmF6wX3IjXZc+6jgwagcG4V7U0iJIrvZDggtpnM1+zpet+jSxrvF
         k1Z/Z4tAgh4PE+ujwuMoGlp9aYcBAM3fMP9UVY68qtUJbd+pWnAIkWRKg2dO8gPjrskT
         6yf1Y8x/RoF4QGaUGqluiXlGgeGmZH7OfDatqh13Thw249ewz5rc3RQuOyfzHc4/jpHS
         31qQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7mPKACKaKVAlL3dQMk2+jQ2j2Cqb3oIsYmORrsU2zNSlRXQZNGgsLcn58CfSxLLQkQBWFIzxRAjGhrVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6nPDPAWjamnCeiztsH9/e8n2JKoScG9rKsipG1V9dzvbOI7VY
	J3cGYrPZeoiiY2pWUJcwKOgiinUGRGs9nrfb5xJ1SpuH8V3kC5BocFBB
X-Gm-Gg: AYBFou3Op0Z9DAyyf+VSyJmTM95LOh9DSCtdQFPpJgBeId/IHGDYJr3MosRko02Keid
	ramiMjO+UprPo3JnfWKK2h3uNEQ40TUtQQtqevolvvf7MCVGz0E9vbGhGHzebVfdkwGx/pgDbD7
	Ri9eSNlAFUrNgShPXiPpXv9eGoaBZr/HAaa/+TVBU0FJorUOEHyMR41GKCUvWD7M3xdqfogPduH
	mmujWCn8f48/qRAy1Eku1wO/iBm7wsBcgAZgWQn+mJaVJiD8TH9LzaitrUtfVLq2frPl1CyKwXj
	5Vm+sZjSI//jYj6BX5klcfSUbQSlZvoPelCUD0kZpWSGh3DYGTk1BMsk07h4lq4/RMvV0XDsiZz
	NdLHwQNGnfut3d2Kp/voGF7lRiGxpCvC4mTOKIkdQ0WW/yBGjEkz5Zxo2+qQklp5tjDr3A1quiX
	yXZ8/OcchqfP0V3kHBwCy/U0RWQYdExDVlEjk3cWj6bZd0PU6LpVeoEHLtTbUYlx/7oXFVQ+HHM
	cSDwrcvuEk+Cbez9bQoiUr8vOWbK5igKaDJJRZSphdIhsSueDfG0N2D
X-Received: by 2002:a17:90b:3912:b0:3a4:aa26:21c7 with SMTP id 98e67ed59e1d1-3a8a1974b40mr4654664a91.25.1791453553456;
        Thu, 08 Oct 2026 02:59:13 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.59.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:59:13 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	Wardenjohn <zhangwarden@gmail.com>
Subject: [PATCH v11 6/9] livepatch: Deprecate stack_order
Date: Thu,  8 Oct 2026 17:58:27 +0800
Message-ID: <20261008095830.26308-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261008095830.26308-1-laoar.shao@gmail.com>
References: <20261008095830.26308-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stack_order sysfs attribute was added to determine which active
livepatch is used for a given function. It is no longer needed because
recent changes refuse loading another livepatch which would modify
an already livepatched function unless the new livepatch would replace
the conflicting one.

[Commit message authored by Petr.]

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Cc: Wardenjohn <zhangwarden@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
---
 .../ABI/removed/sysfs-kernel-livepatch        |  9 +++++++
 .../ABI/testing/sysfs-kernel-livepatch        |  9 -------
 kernel/livepatch/core.c                       | 24 -------------------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Documentation/ABI/removed/sysfs-kernel-livepatch b/Documentation/ABI/removed/sysfs-kernel-livepatch
index 87d57ba27326..f094bd18379f 100644
--- a/Documentation/ABI/removed/sysfs-kernel-livepatch
+++ b/Documentation/ABI/removed/sysfs-kernel-livepatch
@@ -5,3 +5,12 @@ Contact:	live-patching@vger.kernel.org
 Description:
 		An attribute which indicates whether the patch supports
 		atomic-replace.
+
+What:		/sys/kernel/livepatch/<patch>/stack_order
+Date:		Jan 2025
+KernelVersion: 6.14.0
+Description:
+		This attribute specifies the sequence in which live patch modules
+		are applied to the system. If multiple live patches modify the same
+		function, the implementation with the biggest 'stack_order' number
+		is used, unless a transition is currently in progress.
diff --git a/Documentation/ABI/testing/sysfs-kernel-livepatch b/Documentation/ABI/testing/sysfs-kernel-livepatch
index e4874205c319..bb213ea9c135 100644
--- a/Documentation/ABI/testing/sysfs-kernel-livepatch
+++ b/Documentation/ABI/testing/sysfs-kernel-livepatch
@@ -67,15 +67,6 @@ Description:
 		either this patch's provides id or any id in the obsoletes
 		list will be atomically replaced.
 
-What:		/sys/kernel/livepatch/<patch>/stack_order
-Date:		Jan 2025
-KernelVersion:	6.14.0
-Description:
-		This attribute specifies the sequence in which live patch modules
-		are applied to the system. If multiple live patches modify the same
-		function, the implementation with the biggest 'stack_order' number
-		is used, unless a transition is currently in progress.
-
 What:		/sys/kernel/livepatch/<patch>/<object>
 Date:		Nov 2014
 KernelVersion:	3.19.0
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 91e6ea53b337..e86fd092e3e5 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -352,7 +352,6 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
  * /sys/kernel/livepatch/<patch>/force
  * /sys/kernel/livepatch/<patch>/provides
  * /sys/kernel/livepatch/<patch>/obsoletes
- * /sys/kernel/livepatch/<patch>/stack_order
  * /sys/kernel/livepatch/<patch>/<object>
  * /sys/kernel/livepatch/<patch>/<object>/patched
  * /sys/kernel/livepatch/<patch>/<object>/<function,sympos>
@@ -477,40 +476,17 @@ static ssize_t obsoletes_show(struct kobject *kobj,
 	return len;
 }
 
-static ssize_t stack_order_show(struct kobject *kobj,
-				struct kobj_attribute *attr, char *buf)
-{
-	struct klp_patch *patch, *this_patch;
-	int stack_order = 0;
-
-	this_patch = container_of(kobj, struct klp_patch, kobj);
-
-	mutex_lock(&klp_mutex);
-
-	klp_for_each_patch(patch) {
-		stack_order++;
-		if (patch == this_patch)
-			break;
-	}
-
-	mutex_unlock(&klp_mutex);
-
-	return sysfs_emit(buf, "%d\n", stack_order);
-}
-
 static struct kobj_attribute enabled_kobj_attr = __ATTR_RW(enabled);
 static struct kobj_attribute transition_kobj_attr = __ATTR_RO(transition);
 static struct kobj_attribute force_kobj_attr = __ATTR_WO(force);
 static struct kobj_attribute provides_kobj_attr = __ATTR_RO(provides);
 static struct kobj_attribute obsoletes_kobj_attr = __ATTR_RO(obsoletes);
-static struct kobj_attribute stack_order_kobj_attr = __ATTR_RO(stack_order);
 static struct attribute *klp_patch_attrs[] = {
 	&enabled_kobj_attr.attr,
 	&transition_kobj_attr.attr,
 	&force_kobj_attr.attr,
 	&provides_kobj_attr.attr,
 	&obsoletes_kobj_attr.attr,
-	&stack_order_kobj_attr.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(klp_patch);
-- 
2.52.0

