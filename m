Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA21F3BA2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130829; cv=none; b=tugaV/wOF6ptdjvomBd4lJyAo1AbCee9/KgBaZ3S6snVtcPbF9MONobvL47tJ3nGiJy4kiWi4a6vt/5VXdrURGeHagGH/kM67MhDYI7AnGlZgC9L6jHD2D426klXOGyd2xUd4bELLri6Zxz88nmf37g/06nv3/qbkEgbDVnQgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130829; c=relaxed/simple;
	bh=ybC9y483wieKz+ewn4dd2GfE2AaLWKv0l2RaDWNQPEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BA75UU8DfGwSk4Dm3b4zTt0fL/aD2hT5KP6NySGxLQHLSqah/J4fa9XGkLMzyvG1yl8oMQ87CXsvOvd9qxsucIWXlUvB9kx76N3EMbdBhllZ5x+d8yZtzdd1d5SCUTZbEgXnohVV+Iia5f1xf3YQfDDT7AYNX/kHOz+Obdyu27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOaAAc7C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOaAAc7C"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so25476315e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788130825; x=1788735625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhVOVfNqbME67sfeHpsvdRhcgU8hm6ZNstYat/TMXWw=;
        b=NOaAAc7C9Wt/mvm2SE7lUrZCXmqoB+HAR7mmWvPs8kQZQADayzvB4YbKN4vVX8P3K+
         IhAClCZZ5uTiuhpLEIKyqGv5IkG27+osqgpeBxq94/U6m4erC917Ewof/08cE6Zp/rzi
         U+1iXO90CecC5NO9Rbt6oBchicMS0gnBm66YGwtkwZHE3p0fhohRo5Crxr3SdIpen3pc
         O76fX+kH7g0QQ/baDb9FWMsI5VBj2/X5iBUNchcwVQ0emZcOMWlniyo3pd03q1cv1hn8
         Ib/VRkOUmm/OWYqYJv5GQDhje7nMdf0UEqkTU4NEbZDktvbsPcwxaBA3gH8RC905pcmC
         izeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788130825; x=1788735625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhVOVfNqbME67sfeHpsvdRhcgU8hm6ZNstYat/TMXWw=;
        b=rWmZ4zC5O5fMLVcubZEyiT/tSXgy7h4itD9Z6+vkGRIhyR3vXl2oF6jqLdlQ/eddrn
         wodAPGlBJe/lLiqsCDWWGuiTxoyHFo9oVA/WOnMuryaHdiUngMNPeFZhwi8KUmJ4mNDv
         iwgTIF9yftdSPzRUaQKPowWKCKEOu8vXh56HkzAuTYZJHcC7xIM2aSDLu/KP13sUsCOj
         fsjCl+qQNVxbGD1fQv5Ok0TKbdHZRfFGq+lx5onCK4mJFLvb7FPhyAEOx4KcnCgbNGxz
         /LsWdEdmr0F8eTBfHtDDymT/VN0btcOhhVgK4SE04kFfyRLRLb2yQnelfbewmQaYc7WB
         IfBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9mecEO/PMUXyQOgEwxEVNE5RUnDhbsinqcHEuAKxlyGfknSYrurmeBuqZASeTjJWnutLkBlpDKP1ckwE=@vger.kernel.org
X-Gm-Message-State: AFuF++lKkCj0+EyPLx1cvzfKZozdzrQoRwSl0reSys+guNE/37Kzkd7b
	hCKQxBuytxNqFfINMxrD4a9AYEdfqGmxMee2y+a6zz3rdhLIGxt7bKlk
X-Gm-Gg: AR+sD13Rc6DOCv6QcEU6i2fgAuCODxJu85M/FRiSmPg58fui64oJv0mTNKSDx/9KE1D
	72d/TpquCK7MsDLx9JSXN4CmXBTWeqd/JjaFQjxpQ3oiRleypiKK6TkeHxjRDqnzSLr6+CU9L0N
	pQTPFBVwIa/wvKM1qxxruH2xcGWdOyOi6+qE26Vw5Pmjyyc8R/AvyTlaGpdPe06EijdlbUcoXlb
	QRaf7gbxU5IUuzefmSzwQykDqGGZW6NDD7tCMm54TYwtHGiwdDOBzZ0a1xaMNpQQl2ye1w5LDTd
	py11QR4NNNlYRFM7FnmPJuhVMxRvMmDNhpUZZvt0gz4HPugk6Dldq3zcKOICAfSLALzwM7hQmWW
	fG5c4UtzIfX2d5dcLRZTZZAXqn8z7RPNic63gvm/1R6qz+YpTbkNvNGk+2RlCV9L4cySowVD0GF
	S+EoHyPGQbri7F7LMFywApGjcgapIYEAyjLzf7e1WmWijD7LlcixJ5sEARo7zlKV1D0TU9wasQ1
	ygFurtYq01xMpW33AFdEK4rO72zxtKY0HJiJ/zWXUVNwRjRqzNc
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr293066235e9.7.1788130824697;
        Sun, 30 Aug 2026 16:00:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm506042145e9.2.2026.08.30.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:00:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org
Cc: arnd@arndb.de,
	tglx@kernel.org,
	xur@google.com,
	kees@kernel.org,
	peterz@infradead.org,
	thomas.weissschuh@linutronix.de,
	ruanjinjie@huawei.com,
	gourry@gourry.net,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com,
	jani.nikula@linux.intel.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] arch/Kconfig: fix dead conditions by removing dead options
Date: Mon, 31 Aug 2026 00:00:16 +0100
Message-ID: <20260830230016.2730093-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two 'int' options:

ARCH_MMAP_RND_BITS_DEFAULT
ARCH_MMAP_RND_COMPAT_BITS_DEFAULT

are used directly as conditions for defaults. 'int' options should not be
used as conditions, because they will always evaluate to false.

Let's remove these options, because they are not used anywhere else.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- add reviewed-by tags from Arnd and Jinjie
- send to Andrew (seems nobody in particular maintains this file)

Link to v1:
https://lore.kernel.org/all/20260729210546.394392-1-julianbraha@gmail.com/
---
 arch/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..72890200d049 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1238,13 +1238,9 @@ config ARCH_MMAP_RND_BITS_MIN
 config ARCH_MMAP_RND_BITS_MAX
 	int
 
-config ARCH_MMAP_RND_BITS_DEFAULT
-	int
-
 config ARCH_MMAP_RND_BITS
 	int "Number of bits to use for ASLR of mmap base address" if EXPERT
 	range ARCH_MMAP_RND_BITS_MIN ARCH_MMAP_RND_BITS_MAX
-	default ARCH_MMAP_RND_BITS_DEFAULT if ARCH_MMAP_RND_BITS_DEFAULT
 	default ARCH_MMAP_RND_BITS_MIN
 	depends on HAVE_ARCH_MMAP_RND_BITS
 	help
@@ -1272,13 +1268,9 @@ config ARCH_MMAP_RND_COMPAT_BITS_MIN
 config ARCH_MMAP_RND_COMPAT_BITS_MAX
 	int
 
-config ARCH_MMAP_RND_COMPAT_BITS_DEFAULT
-	int
-
 config ARCH_MMAP_RND_COMPAT_BITS
 	int "Number of bits to use for ASLR of mmap base address for compatible applications" if EXPERT
 	range ARCH_MMAP_RND_COMPAT_BITS_MIN ARCH_MMAP_RND_COMPAT_BITS_MAX
-	default ARCH_MMAP_RND_COMPAT_BITS_DEFAULT if ARCH_MMAP_RND_COMPAT_BITS_DEFAULT
 	default ARCH_MMAP_RND_COMPAT_BITS_MIN
 	depends on HAVE_ARCH_MMAP_RND_COMPAT_BITS
 	help
-- 
2.55.0

