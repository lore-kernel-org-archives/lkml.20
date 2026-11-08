Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177366;
	b=4huqxgFUcJZO6kIW/hEuyO3qW5y/VkyqW3QY/jcvlK+bNwWpYqC8DwU8nAEET+mvrDZU
	 pK4jJ2bf88mm7LgRGbzZFg3ljHgxG3eitDlQIWiYmkUDaEGO4zjCZkktMebnFjXKjOWeY
	 YiK8Dn9raiZXzELKTGrhGVpjBMRvXLZo1n69IXxuRi/UUxB/titeZJ9dgg68CELPA+VE2
	 aEs4LeiMvk5U5pXt6bCSCT3h0v1suOiMHtQPH/jJLo+3uY8DBOoYMiOFJZ41FShhFRs+C
	 JGqk5ZTkP++OjiZXKqfHkJljDHFtg44DDkNGLIjbB+vFHOYGKMoNIjYN7rEp6j04RlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbPoExABZjsxSOH96VExzW2VKSc6vBBXRW9rdJVDw3M=;
	b=sQMlvyCoAeLuAG/ENx958HVkHc6pvMhvctQk1X1MB+4N1EqWG8xZi/y6gCJxavIKQsa6
	 bBB632OPkO9KNxa37QFzO2uJYiVIb/etgI5G/O/4tyYhaNK52Thskl5WEhVrz4x3uVccv
	 W1pChUgG2i4C57Up58KxMeY2Gm1MyJplq9Vsi1P1An5Sw8FIH0a6dLOcEvybqYSsWE6ia
	 zMl0ZS3e5FTn6q/+ktxC3GxcqmnQvXQ3OhOtSelK/cRjFWW5uuMN2I2GTFrmqlm2xegEK
	 BVBeAdFIXb52ZS0TBeEs8b1TJVV0hpAq5r3D8HGenIxtRJhmmB9ibZb8EtjvkuRee9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uDo/U2rf";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B19606D837
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B19606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDo/U2rf
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so398956a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177364; x=1794782164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbPoExABZjsxSOH96VExzW2VKSc6vBBXRW9rdJVDw3M=;
        b=uDo/U2rf1e+6v5RgXFGgvxAc2iJROjXy/N980r9+UqjEUK2yjXUgiZ1U/msUrU0yDk
         NVrxWCwdywGVFgLM3lvgSwrzXWR2p4ujGCXgGSIblvpQTcPwWxLLKl/yZiHtB+UwX3kU
         h+bdb88YCT0vA0KJypYQtjN3TNEHwFnJ8yBIvBQG4pTwe3UC+Kdl6hQjnW963KPusMI9
         ozm7brn8MFWiaTQVscfKjRf4oTYOAHJsqcyXGFTP77f9PLIFhoUGbLQoT84TCNT7cc+i
         FrO868ThdVojhzNS2CJZEYyV+HYrZevx1StdK5bdStO4z12xLO81bbTgQ9lM5/ZUsZWr
         9F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177364; x=1794782164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbPoExABZjsxSOH96VExzW2VKSc6vBBXRW9rdJVDw3M=;
        b=pc3ITguZOP+0UxhK0+GCjzwS8kKL829oT7eHTOlbU/gO2i61emkP/GCJar3F+5LtrC
         dLmUkPRXBZXGNeJKpyBR4OxYmRqgRnCI5KRI0+Mdpy0YrrZ3egmeyOUNQv7Xm3Rfk9qX
         ahVbv/Ae31yYC7iiq3q8SEeBRP6l/10d7WgKcmhUsmwYLZnJto28ICyml/Vf7O6/V9xu
         RjLrqAywPqG1NDIe7DmmdMEM0JNgmVO4lSZqQowOfJQcL93i8ZuFThwXfLTx7DI1QL2T
         coxaX+yMk11k+QfSjlmE5AyIc64e5VG0YaGXJKFV6qs8Z79z16bF49gn6DBiPbA1FJlH
         MKdg==
X-Forwarded-Encrypted: i=1; AL+hErH0W0tMr9rylg+FWmPJN1mhI1XfAXZdgXGkVJrCfd/nPJhzjys0zxc16axN6q0iy7GCGNQGJXnmkOuMHu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PPFvCRtQcOwyrrLBw5hIw/WZL4O6CwKEd23jUrtZVRyxBeW16
	pBvMetdkt2FieBZDFTYmJep7SvuSPcgRkOjKk8Bl09N/mUjOfLpGT9TFFtrAugAn
X-Gm-Gg: AYBFou1x0Z1FX9HbjsswDM4hPtEO1lKREoVX+/9Cm6VVWNgjREeD6NMgRGrA9XZDgAs
	bMa0Y9vTawq1ZNKG28ZgtVEqghaADijaPj9PbG/GyZsn391uOd/orlHh+CmjLjkL5ICB3iP7X5O
	3aIX9LDkLoipcA0LTg4D+bUOmTmxBD7LvlriU3zBvOE0tzP6B/lKYgUz80MwKFm1cU6GGrPV0U5
	qML7Fcj3QEM/BPfj/PMsRVz3gb2WTCa1bp+nxvlPRKL0Z9B+OVWGqndLGGlLyapywY6WlwxSDQx
	J2EJuxOoYVAWp/+aPvpHz93EBAVRQMPJTo4pmI0+obfCY7IeUs169LqAsF10i5tngU8QTnwAI2+
	vhz4qj4xaqepavrc3pK3WmnRkwEIAl7DDcFj5W+VZH+JA98JRjey7ovvIzkIpG7MdRAu2e9W38R
	Fog1oHYZuiNDO7DZ216jD/palVfzvievuw+HAun4wPEq9oKZgnpeMUprlqseUburyjew7xEBmXa
	0aaA3/RsSrzHm13s1VUbhFSM88Wf69FN6y7zo8opCu/ib09omD7BP39ZxXjQDCCxhiW4th29nO8
	jsgjpIqcTPRALHJEJGk/K18L8xa6d81enZyC/p54K8X0qgVOOvqEK4TaMhL66JC22q01tqs=
X-Received: by 2002:aa7:d788:0:b0:6b3:f05e:fd5e with SMTP id 4fb4d7f45d1cf-6b722483d5dmr1158730a12.33.1794177363626;
        Sun, 08 Nov 2026 14:36:03 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:36:03 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 6/9] sparc32: colour-align private file mappings
Date: Sun,  8 Nov 2026 23:34:16 +0100
Message-ID: <20261108223516.1125534-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_get_unmapped_area() aligns MAP_SHARED so a file page is mapped at the
colour its page offset implies, but gives MAP_PRIVATE an align_mask of
zero. A private file mapping therefore lands at an arbitrary colour, and
on a virtually indexed cache it aliases any other mapping of the same
page.

Measured on an SS-20 with a 512 KB VAC: every page of a private file
mapping sat at the wrong colour, 64 of 64, at three different offsets.

Align them as sparc64 does, whenever there is a file rather than only when
the mapping is shared. MAP_FIXED is left alone: the ELF loader places
segments with MAP_PRIVATE|MAP_FIXED at addresses that need not preserve
colour, so rejecting those makes execve() fail.

Reference: MBus Interface Specification, SPARC International, 1997, signal
VA[19:12] (MAD[53:46]).

This changes alignment on HyperSPARC, where SHMLBA follows the VAC size.
Each private file mapping can consume up to SHMLBA of extra virtual space.

Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/sys_sparc_32.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..e1530cee15b2 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,6 +40,15 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
+/*
+ * A file page reached at two colours is two cache lines, so a kernel-chosen
+ * mapping of one sits at the colour its page offset implies - private too.
+ */
+static bool sparc_needs_colour_align(struct file *filp, unsigned long flags)
+{
+	return filp || (flags & MAP_SHARED);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_unmapped_area_info info = {};
@@ -50,7 +59,11 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
+		 * cache aliasing constraints.  Private file mappings are not
+		 * rejected here: the ELF loader places segments with
+		 * MAP_FIXED at offsets that need not preserve colour, and
+		 * refusing them makes execve() fail.  sparc64 draws the line
+		 * in the same place.
 		 */
 		if (!file_hugepage && (flags & MAP_SHARED) &&
 		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
@@ -68,7 +81,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	info.low_limit = addr;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
-		info.align_mask = (flags & MAP_SHARED) ?
+		info.align_mask = sparc_needs_colour_align(filp, flags) ?
 			(PAGE_MASK & (SHMLBA - 1)) : 0;
 		info.align_offset = pgoff << PAGE_SHIFT;
 	} else {
-- 
2.43.0

