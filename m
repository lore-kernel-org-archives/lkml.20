Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884358;
	b=0fxfkxQQUlVI4Saj3ecoWMgfXk+3JE034zMvaDhcO2BxsqTLsmZx5K5G16oQivMAawqc
	 HHlGZFYF/zT/5sfhPYKoAu3FmEXvlq5Du66d7feE8z+Othw2Wt2kVAvflE1L3osRiRB+s
	 GVuM5BAxAeKlDb0Ik7w/3glg8lZEenZ2hcj2O1XmaM/2KBahrG9JLNQ46ds5DGYCQg9LK
	 UTLOn0u0xrULhD95ATN/CC+5DjUMjjaVIU7dvOThSPEaly0Z+bjt6jbqNy4OB5/ju+uFO
	 1wWNhlGYbBouRLA7jN49LXXj8Y4jCsi5EBFS60IVM6MWWCNIu1Yra4LqglC6zFOl/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
	b=sHABoV0jmkAhUs+gRb0B2FN7fNG2QNSBWZLeZ9Qr0++HPxu5fQs5Yox3Pb7tLgZrH7Jf
	 mZnriidK8X++DS1T+l/zxNgcGk/55ouCZD8tbKdN8AWz1T+8AsP8osIKxZV2iwNywh33i
	 No+VkI3xwEpTcyCIZQkWWme7FTyFRhxpYcJ65ck97CJuUKjDRgQVkO4SXg5MTCodSzZp5
	 63N/0pth65agpvdBsaBKlxC7RUuJO2Pcl+0MiEN32pNEvS/4s5BUpd/LI7fGZxe/5ew2h
	 NaOeNui9gvEnnYWwjshvJOl2pl2L0vBLArbk2CY268JfgVEzCyw4BZDgzeV2L7wMpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgI8tVpW;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE67606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE67606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgI8tVpW
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b305d38bafso27715127b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884357; x=1795489157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
        b=SgI8tVpWo1un1bWdg/jAyoaT9kVe3EWLk+5y1DaQZiREawkJBJCSuZ/DRQSBy+gEX+
         BhixvHU374OKVIOPif9SoDrpcgOjzvs5GbREGURAnNI/YYv9a/ZRa+zxaf4eIPskI6gF
         ZYDdp9NJyKNpqDwYSa2S3Uktkd1GSp/38BNzDkTY73FqseWVaRZHaUfWNe9HR7zhy5wt
         feBOCkvd69cslnTdl6jN5Ah3C7LyzOQTvF3AqZ0LQwIbPDOjS6iPFFaLZFAR/o0cPkHw
         hHPpgvgVs0NPH7+Tb10culaBi8mmgv22EQqqjCfNLJiMah3h2vmf++AhAiKCpEeFB5qx
         zKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884357; x=1795489157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
        b=nyC2c0cjPPF1bVtWLZCemQdKV0vHZUGgNdxX6d5VuxThd5MfVXzcPqr3Ys16bAex9i
         57EhJL44SFab15GMJpmNXHcQR2PZpYHNjm/gXqTKllABwYGZgfkr/85Y7ezYYFgmpgh3
         34a5RPCB3sgsn4nhKQgoxWb7ssgKjx4pXqSL1YYY9FUJQ05AbfbsOblwBunsQ7r4txmG
         8zNlc+g6ZU30tl3/DQl3C32x8ByoJtu1nDyxQo2cYdMA+6ulUkbnJcSfyx9ZhQElOrmZ
         KpgGKibby9zeY+xD/EfP7MLzVvHNzb44sSoobKVSGaO4qmtTHVrplrucpgnnBLRM7Dnk
         +/AQ==
X-Forwarded-Encrypted: i=1; AL+hErE1hPHFWUFo2mBwUS2ERT7Di4999+MkssKa1qePNDg4Y5zd5rNeDyQBMsS6bs5BXCQue2zZ8u1/TM3k8As=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QzrULjIdnfmuGwL4xr6APQx5lWFpbDw/C8CJnPFl0Ib6CD2u6
	Xe2VNAO57nkOezSMKtMJfEO/wyHhzHsQ12VAbdQOScNb8x6igHqy04UJ5L7gbXYRzB0=
X-Gm-Gg: AZFdTZdwYYjGaYWNSXaWoXLBTFqplgc61DrqgZnc0m6BuJQ5P8/QvvfE/Xr8KOFW8rI
	4APQOEppyrPas2CdN8J2PmGYJhnPo5XL7lNcpKPkRcbZVBhBq0GFZ5GS4lLuAvGRK/LMN5waz1l
	znx5Ax/dfwxkmNeGDna2r8dy0CATGePF+Pe7OO3FTmY9waVanZsYS1TFVtU1pAtHIbNgax4kTHY
	zq8VYdNUAZan0pKRUPklpFoN+k+BlFkx9SnZiAIxcD8UTr3oQvHoBYm8DeaAvOt4lg5mooCCIIz
	2HIcl8AZmt5KoeIY8cAbjTK1wV1qlofmQjYSrDJ+Zh0dCZCycanVeHqdUF4J4Dbqg2xgqFQsZ/Z
	GHpurBtbP4qWDsChm78wPxu5Nc0GqT5SNMS10e0qM6FoZSyg48VDPS+6jnzuDwdcMLmnuY+ZXgB
	2/b7zuu0IDXRkJG5rk9Y6oEsx0767CcoDqEABjgcCCmzoXUjPrWvi/PF97PGlGf0HFj5s4rZxME
	C09HzSiHlNEPgQXL4TjC5tQv3iumMePMraE5Yqq57+brV0iENVw/uGBeY2fjYaC4h9XLzRzmBFC
	6R0uWnblXCBU2ooq6JAQvjusj64RDtJeg1dkk+99ZOnQKJfFBztylcKiw5iVeGO1lmtCU9wXwk3
	C+jyYnmI+zY4caQb+TBs2KD4gVbn0QWJsIgdWMg6I+sWWxPoyMuoZJuRRTiDUsZyXdd3RaXLvPv
	1wJu1C8Yi5ULDTcTvwjA==
X-Received: by 2002:a05:690c:e094:b0:8b4:d584:6182 with SMTP id 00721157ae682-8b4d5846654mr25619447b3.41.1794884356807;
        Mon, 16 Nov 2026 18:59:16 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ed01d566sm13181047b3.38.2026.11.16.18.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:10 -0500
Subject: [PATCH v2 3/7] alpha: marvel: refresh environmental readings
 through the console
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6487; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=cy0Hm6tWEv4iz+cwupzbWBz9P0vxI5XyH7aQNeBvpgk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzTPxH5OzZPRXvHMM0BOT/WvGUF1RP/7DhVpvIh
 ca5N9k9Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYa570M/93/F16SZM
 g+Xv3A+fgVse6nYbzlU4PuvJk89UbW8eB5vBEM/yvLihYYWPJ/XeRRc13AV+fjbZWXPWwFTqe2m
 NTZHr8pwwQA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The SRM console keeps the readings of the temperature, fan, voltage and
power supply sensors in the power and environment (P&E) nodes of the
config tree (GCT), and refreshes those of one node when asked through
config tree callback 0x28, function 0x1f. The Alpha Architecture
Reference Manual reserves every callback code it does not list, so this
is a Marvel console extension; its code and function number come from
Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
and marvel_cfgtree_partial_update() for a sensor driver to use,
retrying, as Tru64 UNIX does, while the console reports busy.

On an ES47 the callback takes 13 to 300 ms per node with interrupts
disabled. The console callbacks are not reentrant: a refresh on one CPU
while another printed to the SRM console killed the second CPU, and the
service processor reset the partition. So export the srmcons callback
lock and hold it around the call.

Tru64 UNIX makes this and its other runtime config tree callbacks only on
the master CPU, and the Marvel PAL TOY calls are already known to work
only on the boot CPU, so make the call there as well.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/console.h    |  5 +++++
 arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
 arch/alpha/kernel/core_marvel.c     | 45 +++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |  1 +
 arch/alpha/kernel/srmcons.c         |  3 ++-
 arch/alpha/lib/callback_srm.S       |  1 +
 6 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
index 1cabdb6064bb..4f5cf589aff7 100644
--- a/arch/alpha/include/asm/console.h
+++ b/arch/alpha/include/asm/console.h
@@ -4,6 +4,9 @@
 
 #include <uapi/asm/console.h>
 
+/* Not architected: a Marvel console extension, as used by Tru64 UNIX. */
+#define CCB_CFGTREE		0x28
+
 #ifndef __ASSEMBLER__
 extern long callback_puts(long unit, const char *s, long length);
 extern long callback_getc(long unit);
@@ -15,6 +18,8 @@ extern long callback_read(long channel, long count, const char *buf, long lbn);
 extern long callback_getenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_setenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_save_env(void);
+extern long callback_cfgtree(long func, unsigned long arg1, unsigned long arg2,
+			     unsigned long arg3, unsigned long arg4);
 
 extern int srm_fixup(unsigned long new_callback_addr,
 		     unsigned long new_hwrpb_addr);
diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
new file mode 100644
index 000000000000..16ccd2002a11
--- /dev/null
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ALPHA_MARVEL_ENV_H
+#define __ALPHA_MARVEL_ENV_H
+
+/*
+ * Ask the console to refresh the environmental readings of the GCT node at
+ * @offset from the start of the GCT. Returns the console status, which is 1
+ * or -0x4a on success.
+ */
+long marvel_cfgtree_partial_update(unsigned long offset);
+
+#endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 92e3312e786e..7525f3ed6b62 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -20,10 +20,13 @@
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
+#include <linux/workqueue.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/gct.h>
+#include <asm/console.h>
+#include <asm/marvel_env.h>
 #include <asm/tlbflush.h>
 #include <asm/vga.h>
 
@@ -1094,3 +1097,45 @@ marvel_agp_info(void)
 
 	return agp;
 }
+
+/*
+ * The console refreshes the environmental packets of a GCT node through
+ * config tree callback function 0x1f, returning -26 while it is busy. The
+ * callback runs for up to 300 ms with interrupts disabled. Hold the console
+ * callback lock: a concurrent callback from another CPU, such as SRM console
+ * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX does
+ * for its config tree callbacks; the PAL TOY calls also work only there.
+ */
+#define CFGTREE_PARTIAL_UPDATE	0x1f
+#define CFGTREE_BUSY		(-26)
+
+static long marvel_cfgtree_partial_update_local(void *arg)
+{
+	unsigned long flags;
+	long status;
+
+	spin_lock_irqsave(&srmcons_callback_lock, flags);
+	status = callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned long)arg,
+				  0, 0, 0);
+	spin_unlock_irqrestore(&srmcons_callback_lock, flags);
+
+	return status;
+}
+
+long marvel_cfgtree_partial_update(unsigned long offset)
+{
+	long status;
+	int tries;
+
+	for (tries = 0; tries < 100; tries++) {
+		status = work_on_cpu(boot_cpuid,
+				     marvel_cfgtree_partial_update_local,
+				     (void *)offset);
+		if (status != CFGTREE_BUSY)
+			break;
+		usleep_range(10000, 20000);
+	}
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index c418333d0b89..b54f4fd69a0f 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -112,6 +112,7 @@ extern struct screen_info vgacon_screen_info;
 
 /* srmcons.c */
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
+extern spinlock_t srmcons_callback_lock;
 extern void register_srm_console(void);
 extern void unregister_srm_console(void);
 #else
diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index d19e51ec711d..45a10d539f19 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -24,7 +24,8 @@
 #include "proto.h"
 
 
-static DEFINE_SPINLOCK(srmcons_callback_lock);
+/* The console callbacks are not reentrant. */
+DEFINE_SPINLOCK(srmcons_callback_lock);
 static int srm_is_registered_console = 0;
 
 /* 
diff --git a/arch/alpha/lib/callback_srm.S b/arch/alpha/lib/callback_srm.S
index 36b63f295170..6d3c9ce6b815 100644
--- a/arch/alpha/lib/callback_srm.S
+++ b/arch/alpha/lib/callback_srm.S
@@ -94,6 +94,7 @@ CALLBACK(reset_env, CCB_RESET_ENV, 4)
 CALLBACK(save_env, CCB_SAVE_ENV, 1)
 CALLBACK(pswitch, CCB_PSWITCH, 3)
 CALLBACK(bios_emul, CCB_BIOS_EMUL, 5)
+CALLBACK(cfgtree, CCB_CFGTREE, 6)
 
 EXPORT_SYMBOL(callback_getenv)
 EXPORT_SYMBOL(callback_setenv)

-- 
2.56.1

