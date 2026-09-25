Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF0B4071E2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337095; cv=none; b=XDZWOf9hzyNwg4iwfhjLn2ykznMDwQqBmCAHZ+4myXJtmLveTil/Wmma3HmWpGy2DCPXaUl6qwwwWir4Pwyh/o7wkrg1Ag/4qU2dQfR0ic2wHkGCS9Vgue6R4nNOBurp4bqB2vZCGXFXmfF0mI4OIVvNJq90t6LQ7NWqDVmLHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337095; c=relaxed/simple;
	bh=iVtiOX8u/kXTIM0DwIluX1QQOzwDY0+H1VCpCPXuNHQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=omDMvFwHZOXWTjjBmEk49gJKu94KHLPhhKh+VrjRaBAOLj2yWckt1KbH5apppszaSwLK5lXXg31RMkC+tTjA8/wVM0aifXwJ3wmNnoIX7iVxZ5gOqoOdsK3stnBGURPE1KjI25zFnBWpba+viuVMW/FwPmnWnGW5CE0jMwSDta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ewrFBkar; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ewrFBkar"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4887f5e8e23so440389f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790337092; x=1790941892; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZjbSgTrSX0LpMu4ps7o/SXlWGnyzPNXvmV986ovar4=;
        b=ewrFBkarvovDRzPzC9fMox2THVv+2hMnAja3CWvTAa2OjJZ6DJunEiACadPT8gdk7U
         M3RCnHCdk68vwTmLs1H64g68250iVnPV6kkRYmaUBfHb7AA67AorFa6kii9r++8flLhk
         tx9Ayk2Pl3g6lSlomP8OiwOREmX0qBoJInYPyKcD8CM0SaplMr9FyDtK6LgIdeqgmVRx
         HH7Mj2dtEpAXEt1aCNRBUVwFNMVVdmFeMmlfbazwVRiJQYx6r3Tiu7zvNe1AV433O0zA
         6KRc79d/8g2bCoEXo6aFtfqWo8MAp2d/Ey+7i1AecIyWgl3137AUlh+B5CT9G3qq7pIo
         qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337092; x=1790941892;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZjbSgTrSX0LpMu4ps7o/SXlWGnyzPNXvmV986ovar4=;
        b=eH2TWe8MZ4pny6WhE9s2Azo0RRVtL7ltkC/1QikZ2en5jLqCn5s0zzau1kWjCcC7AT
         n/f9mvu6LjRvp0UpqlysBPOSxg6uFenhl2WnDBAu7TbDx34XkNdBlwQeBe4vEeZ4HhJ0
         remZWSTMd8oiJ6Q50661j6nke0pTKc1g61OmDagCzohmCBccRAq4bdRp7aQgajvxsFgy
         AFKrE2FfkQ+zwEHFWlWCqUKPlSOH5npRRLHi1hoHxYvIDdKsQmPOq+aqr41G9eWZAWiy
         8YdB7V/CRBZ8rHZzLGNIPotI0AwLE60RmT4D+ZrJ/HYZ2XOP3qSB4cu5orzyZnnN2TAP
         SHCg==
X-Forwarded-Encrypted: i=1; AKwUvBw7jQvFRTJt38vnr5OF8/4jGe0NxQs/4v63vlJK4JK7QZxgzXdNFmXwfP1nBurNOcXtaVlgFYZ/ATRBYm4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXTtA2DC0RGUkfKNUCuIVculKUaPB09EuY0Or/O2g6mHUfdPkB
	B9DO4zTN4EeuUWnnHpMqtU1HbkvB/2ty7xwj6xJZOHwlAjGuBG312I2POcf9hb/l1Jiduu/pxNI
	Piw==
X-Received: from wrbft16.prod.google.com ([2002:a05:6000:2b10:b0:488:613b:9428])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:25c4:b0:485:8c16:5efc
 with SMTP id ffacd0b85a97d-4887197adcamr9710572f8f.54.1790337091978; Fri, 25
 Sep 2026 04:51:31 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:51:22 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925115128.362186-1-elver@google.com>
Subject: [PATCH] csky: Implement _THIS_IP_ using inline asm
From: Marco Elver <elver@google.com>
To: elver@google.com, Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version.

This also fixes this GCC ICE [3]:

sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
 1202 | }
      | ^
(insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
        (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
            (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
                    (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
     (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
        (nil)))
during RTL pass: final
sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
0x779b51e2a1c9 __libc_start_call_main
        ../sysdeps/nptl/libc_start_call_main.h:58
0x779b51e2a28a __libc_start_main_impl
        ../csu/libc-start.c:360

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Link: https://lore.kernel.org/all/6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net/ [3]
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/csky/include/asm/linkage.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/csky/include/asm/linkage.h

diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/linkage.h
new file mode 100644
index 000000000000..04afd3583e25
--- /dev/null
+++ b/arch/csky/include/asm/linkage.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_CSKY_LINKAGE_H
+#define __ASM_CSKY_LINKAGE_H
+
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=r" (__ip)); __ip; })
+
+#endif /* __ASM_CSKY_LINKAGE_H */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

