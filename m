Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A857ED8A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194769; cv=none; b=a0IlGn87gSp1z1wYxpwgwiU4qTKFUqJiJu44NIDpQNemliMZcou3AYYQMsucpjs/YV8jjMMC3BJu3eryu33ghWtclaVom1OHuNQ2m0V1oDaApDxZk8mxVPBNRXEsj1mQWguJqF1w1eiB3TeOT/WZ3y1lELDrbJB5sGlDHn3we7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194769; c=relaxed/simple;
	bh=U5kUJj8tfW2V7b3/nuO6sQr9QzMENF2JMUJE8N1DAT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgDXv6ITSqBrzGrldoxKDbEzb4oH1KffeaFDSyhkF3V3JG6mmWwpqIAEZP8LKYsj77HftFBYejKAqMgbGboMvhiNI8bgp2ixFSOf1LNQQnAiUK6kYfbWda2bL+oDHk58TAcVWgJLcSPGdYccMH46WV5VhcEYmAK3zmJBrt4txIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8kuizLQ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8kuizLQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so183424666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194760; x=1790799560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBkTioHa1njfgepZWcJOCl/N0/x0qKl0Yu1MlhUgAqw=;
        b=C8kuizLQC8LCFKyWH7dW5kw8KLBQb5SSI0MEX8MNeeytGa8CpsoaPVJ+MSNFnBDfUV
         CPRjiyhiK1OzZr3W0aTd/ZXtalDeCVtyR/T3M0pywi6QEJvPWsV4GVh+aYmXP1CZ2XDM
         5ErssEnjlRN77I8EZCrLs9ZfMDLwTjSr3U7XZyAYlg592cvQ5U4hdklEqvywbsOOFMF6
         BjPHllK2+M5kA7A4SGcr9AvLH50F/e86W11Wf0yQxZ/ZCQGqNZvWUClaZ/Y+Vu3YKkOY
         jpw6kcITjuo2RkGkQRzYdRniePG2Hvi7errGaD4t2/Z2UYHcmsTEd+QY+77VcHFlW/I2
         V4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194760; x=1790799560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBkTioHa1njfgepZWcJOCl/N0/x0qKl0Yu1MlhUgAqw=;
        b=1//nXWEl5h+6SQ6KTZaRquHK5fgPPfLvbmK5HlpR2Lh/IVnk5AIebLSHd7Wg1m7IG+
         WLN+20Zw7yF7NcA19ZcF+LMqX6lEPe8+c3I8QViI/s6QEw7oi6UG0WeiVR0EL4zCHu6x
         P8bBmJpept7W/Xxyf+QN4Pu4HPyuDnln1i2uS0S9bue1zHCVWIXmdQjQu6a3NHGRT56/
         Ck5bnpCa+pzMScYhd3kqWA5555hkIUPXTjKbjtXOWxZ/6uI/pfmJyR5+8umvlpUh8LkK
         UuKDtggfzYPv02/sBvq2ev7fpbS60iGiDFMOHxfEbObLlLneNXq6UeRcH70XfU8fxoHm
         5b5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeeaV6BtEYwgVopxvB3RnN6gAb3s2wyKkEsiyIF9H44KKRa0ztpzU/f3DDeybwMQ6w7a92SOi3y6fnKzE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLOAqpSERhLvkBbrGS45zI5xH2tcJzZP/+NOnDk839wlNakaKQ
	OgwWuWUCLbPC+boeIE5PooaYo6UEFjYcFLF1VPL0jYqnnDksnra+S34F1ouXKw5p
X-Gm-Gg: AYBFou3U0JffYKFX3F77/kXTv++YSC5mmmgjqnLICFtJu7OySFeHUDw+OTvW7+W6rBK
	8pbSxdNDzy+LnzL4mSS0c7+gcUZhVtK7ybYgBuz4xIMn+8BA6uFACNbpa5eOmU+4qfaEx/V1y1S
	nlYeV96KAjjs9V0Csz5NefNekAwt2zLVn9Gf/AojuWfj9WkzZWlpnJ76Yd5Oy4TSPcy+ySw9l2S
	rF29k9JzjLJH7OTNBbGmcY4A0xEwbY+54ZOtZljOd1C120Pnpt1uqzFdb1NM3uYEXvyTZZiVAgP
	dMQ2jaRUmghtsxDv2HWXHJ6puWn6/5cmIv+IQu9uer94yZ2N/ZRA1O1om9lQ07ASzDBWRjaTrka
	SeGX4NUNrktrUdtsBJ531lfmR2dMeSXl6LeCDncprhfmSRNoUQMF/NghQRohBxYvaI4X94gPdmF
	gjShfeb8v7sc3xI2UhlSKFETLMxZk2wtsOHYWj14Is2OntwxmwKSqIaFq/KqwM8h4X4QdQLf+cH
	7B5iY8Q4bGuOgn6ll2nMO/ZTPHnmjOCpZ80StL6
X-Received: by 2002:a17:907:c48a:b0:c29:f5d5:5a9a with SMTP id a640c23a62f3a-c2ac241cb87mr18810766b.36.1790194760417;
        Wed, 23 Sep 2026 13:19:20 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae63dc17sm183626966b.33.2026.09.23.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:19:20 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [RFC PATCH 3/5] sparc32: implement futex atomic ops with the compare-and-swap locks
Date: Wed, 23 Sep 2026 22:17:19 +0200
Message-ID: <20260923201830.865553-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201830.865553-1-linmag7@gmail.com>
References: <20260923201830.865553-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparc32 had no futex implementation of its own and fell back to the
asm-generic one, which on SMP cannot work: it needs to update a user word
atomically, and pre-v9 sparc has no instruction for that. CONFIG_FUTEX
was therefore made to depend on !(SPARC32 && SMP).

Now that the kernel owns a compare-and-swap on behalf of userspace, the
futex code can use the same mechanism. Where the cpu lacks the
instruction both sides serialise on the lock array used by the trap type
0x91 handler; both callers go through sparc32_atomic_lock(), so the two
hashes cannot drift apart, parisc keeps the same invariant with a comment
asking that its futex hash match its LWS code.

Where the cpu has the instruction that lock cannot serve for the
read-modify-write. A binary built for such a cpu does its own casa and
knows nothing about the array, so a lock, get_user, put_user, unlock
sequence can lose that binary's update between the two accesses while both
operations appear to have succeeded and FUTEX_WAKE_OP defines its update
of uaddr2 as atomic. arch_futex_atomic_op_inuser() therefore retries a
casa until the word is still the one the new value was computed from, the
way sparc64 does it. Only the pre-v9 path takes the lock, where it is
correct because userspace takes the same lock through the trap.

Both entry points are called with page faults already disabled, so the
user accesses fail rather than sleeping under the lock.

With a real cmpxchg available the Kconfig dependency can go, which is what
lets FUTEX_PI and robust futexes be built for this configuration rather
than refused. Their runtime behaviour here has not been tested.

One gap is known and not closed here.

futex_robust_unlock() clears the futex word with
unsafe_atomic_store_release_user(), before the hash bucket is locked and
without going through either helper added here. SPARC32 currently uses
the generic implementation of unsafe_atomic_store_release_user(), which
ultimately performs a plain user-memory store. On a no-CASA SMP system
that store does not acquire the lock used by the SPARC32 software-CAS
implementation. It can therefore occur between the trap handler's load
and conditional store, allowing the CAS to overwrite the unlock:

  cpu 0, trap compare-and-swap        cpu 1, robust unlock

  take sparc32_atomic_lock(uaddr)
  read *uaddr -> T
                                      store 0 -> *uaddr, no lock
  compare against T succeeds
  store T | FUTEX_WAITERS -> *uaddr
  release the lock, report success

Neither order of those two operations permits that result, so the missing
serialisation is what produced it. The flag itself is not gated
CONFIG_FUTEX_ROBUST_UNLOCK covers only the rseq fixup path, so dropping
the Kconfig dependency is what exposes this on SPARC32 SMP. It has not
been observed in practice; it is reported because it follows from the
implementation.

The requirement is only that these two operations agree on how they
serialise access to the word. The macro is overridable, so SPARC32 could
supply its own definition and keep this inside the architecture; whether
that is preferable to a futex-specific interface is a question for the
futex maintainers, and is asked rather than guessed at.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/futex_32.h | 137 +++++++++++++++++++++++++++++-
 init/Kconfig                      |   1 -
 2 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/futex_32.h b/arch/sparc/include/asm/futex_32.h
index 6a332a9f099c..35ff08a6b2bd 100644
--- a/arch/sparc/include/asm/futex_32.h
+++ b/arch/sparc/include/asm/futex_32.h
@@ -1,6 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_FUTEX_H
 #define _ASM_FUTEX_H
 
-#include <asm-generic/futex.h>
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <asm/errno.h>
+#include <asm/cas_32.h>
+#include <asm/cpu_type.h>
 
-#endif
+/* These share the compare-and-swap trap's lock array and must hash
+ * identically to it; see asm/cas_32.h.
+ */
+
+static inline int sparc32_futex_op(int op, int oparg, u32 oldval, u32 *newval)
+{
+	switch (op) {
+	case FUTEX_OP_SET:
+		*newval = oparg;
+		break;
+	case FUTEX_OP_ADD:
+		*newval = oldval + oparg;
+		break;
+	case FUTEX_OP_OR:
+		*newval = oldval | oparg;
+		break;
+	case FUTEX_OP_ANDN:
+		*newval = oldval & ~oparg;
+		break;
+	case FUTEX_OP_XOR:
+		*newval = oldval ^ oparg;
+		break;
+	default:
+		return -ENOSYS;
+	}
+
+	return 0;
+}
+
+static inline int
+arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
+{
+	raw_spinlock_t *lock;
+	unsigned long flags;
+	u32 oldval, newval, prev;
+	int ret = 0;
+
+	if (sparc32_has_casa) {
+		if (!access_ok(uaddr, sizeof(u32)))
+			return -EFAULT;
+
+		if (unlikely(get_user(oldval, uaddr) != 0))
+			return -EFAULT;
+
+		/* Retry until the word still holds what newval was computed
+		 * from, making the read-modify-write one atomic step.
+		 */
+		for (;;) {
+			ret = sparc32_futex_op(op, oparg, oldval, &newval);
+			if (ret)
+				return ret;
+
+			if (unlikely(__sparc32_casa_user(uaddr, oldval,
+							 newval, &prev) != 0))
+				return -EFAULT;
+
+			if (likely(prev == oldval))
+				break;
+
+			oldval = prev;
+		}
+
+		*oval = oldval;
+		return 0;
+	}
+
+	lock = sparc32_atomic_lock(uaddr);
+	raw_spin_lock_irqsave(lock, flags);
+
+	if (unlikely(get_user(oldval, uaddr) != 0)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	ret = sparc32_futex_op(op, oparg, oldval, &newval);
+	if (ret)
+		goto out;
+
+	if (unlikely(put_user(newval, uaddr) != 0))
+		ret = -EFAULT;
+
+out:
+	raw_spin_unlock_irqrestore(lock, flags);
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}
+
+static inline int
+futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
+			      u32 oldval, u32 newval)
+{
+	raw_spinlock_t *lock;
+	unsigned long flags;
+	u32 val;
+
+	if (!access_ok(uaddr, sizeof(u32)))
+		return -EFAULT;
+
+	/* casa is atomic against userspace's own; a lock of ours is not. */
+	if (sparc32_has_casa) {
+		if (__sparc32_casa_user(uaddr, oldval, newval, &val))
+			return -EFAULT;
+		*uval = val;
+		return 0;
+	}
+
+	lock = sparc32_atomic_lock(uaddr);
+	raw_spin_lock_irqsave(lock, flags);
+
+	if (unlikely(get_user(val, uaddr) != 0)) {
+		raw_spin_unlock_irqrestore(lock, flags);
+		return -EFAULT;
+	}
+
+	if (val == oldval && unlikely(put_user(newval, uaddr) != 0)) {
+		raw_spin_unlock_irqrestore(lock, flags);
+		return -EFAULT;
+	}
+
+	raw_spin_unlock_irqrestore(lock, flags);
+
+	*uval = val;
+	return 0;
+}
+
+#endif /* _ASM_FUTEX_H */
diff --git a/init/Kconfig b/init/Kconfig
index 8583d9f06c52..9eb8086af7db 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1875,7 +1875,6 @@ config BASE_SMALL
 
 config FUTEX
 	bool "Enable futex support" if EXPERT
-	depends on !(SPARC32 && SMP)
 	default y
 	imply RT_MUTEXES
 	help
-- 
2.43.0

