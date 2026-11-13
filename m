Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580658;
	b=sUmBgwy6Xf1LGsRUh8m8OAiuGMRojymzI/k3ffCdnDjud4jAXw5rjqwczrVhcjj2BlDM
	 vjha4Ud6aaKVukDazhGOiotEQbyKzJ5GdOrSjJRr3cGa41zr0OSeiSpyuPU1V3NNq4u04
	 1/atPz0KBnwHSU8T55iOzUwAPhv7Eq7HCKfHdufpguwWDqTvmNtP89s0jIMoqLk5W4Uxk
	 5IcON5nQdqYljQUSlxScStZJizTN2FG/WPlxCu3MftLLicFfPSM3gS8iRzsUHTYI3Tnj7
	 oKaIyWju3qps7+sUFE0wzlqh2QDmnoP/Wmbj5Iwms5wTA5CCvCVXzDRak7Fnf3M+JFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
	b=3DRWt638UJ6di+m4CxpIsCBybfZ98ShbBI/5yC83EM9ncRSbxZtOh002x76shVOeQ3J3
	 23+dI5lWkv8ezRPB4BeY2PctNxGqHPaj8E7Ti6gLYoCLqun77QBAW/opdXSn2+iejNgTx
	 W9DNFTC0N/pJQixsrIE4l98piadWptt+C15hIKzUpjAgCkpMLywn7ER1Hlf4WpuEuqMEs
	 tOWLhkx2seEvwfum0/JU7ulpIithWd18wSu3clem1YVXxZxBJZ/WlIvSJNCGYipdosT/A
	 TBqcaHDXHoBOgE2iCVr+EzNao4KVsy91/7g5wyM0H9NGA6SAyb+4USYOmYOK3j5HS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fR/cvMLW";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91185606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91185606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fR/cvMLW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7283595e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580657; x=1795185457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
        b=fR/cvMLWcPQ7Dt0s1+l+PfgNjFp5LpZYfttC9dV6TdHJWL4PCPHyXvFUDlUEimVhzi
         Gdr+lDiT6lDYge68ePK3Ty92DDjuhcAfG8YuNwYR/h7JcbN3HmA+QtSwI7xCIbtyvXNj
         kc4/cb6T2zTzepYH8xEwRbPsEJ+nE+G56111bbFyFAY6dRgjRNmkqorydJ9TlWfDdWar
         puYwABjAHaipF6mOpt9k84MYN/z7UR7b/QfX9yQ41xxCu8zyE+C790qhqfUtXduF8gOO
         ScJt/R4Q1NPpobtpIgQ5zXaE56yXLq7qcBT5qmPUmLrTp5fGD4UZWC3sLZtutQs6SJzO
         8Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580657; x=1795185457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5Ue2mVGxATydDR5iWTMkIC6d9KHtdsgRln9EnTdDBs=;
        b=tPt0b6SJrUvqD7vEpAaMdK9/ku9P1E/myRCgIAqzxjQMwEswYlPSumEhyxPDR225aL
         m/ORHUBa8mLFn8ogVJgeAD5nH7HQ31ZmqX44vbLbRRU0q0M1WtRaImFcx2h2c/1ApW3Y
         4vxKmjTKCKGgWXEpiJjVCHfmYEwNoO/jX1pg2FLVm1OuGCrQL90MAfCIsnIGVQRM5N0K
         pYaTC0UCbIqYDUp18us+f94VEMH0DMY5JaZsh0amD6bh8hdCCtVQer1h0jBudyuOZDI6
         R9rf05NnWwiX/HN5XdSBCyLv3XkZE2g6qWxojcyxFDULYtjcbYELFf0OrR3p47h2jdqb
         eLew==
X-Forwarded-Encrypted: i=1; AL+hErEc84Rn3FqKnbRriTv4JZwy08Do7wNLdEqB7y7z+r+SGCxz/l712Gvp8UP6fJ4qrcJYpJkmhc1C/UU9lqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aGCmWAmXCffkan0zNDga4qUrUPaWhFWHiJzIrWSYPA3Vx1/gK
	09DA747PiDaqMbxfHNSa2maLJ6E/CvPSROT16nfIChrEyhOxcFsoUT/d
X-Gm-Gg: AYBFou1t4dsqVCVJK/2HOislGPBQDYB2J87kuQ4SIodWKsWL8GMnIO03pWdiTYoB09F
	67SlaAcNsGhdUJJ92VK32IgsQPcDsnT+JyE7m3TwmpQbnzu1JChqR+fxZWkOPwWQMTK6X29Clwd
	ViGC7aX+B0KAbVf45md15MlwQ7ahF/ZYilDBlsPxD1mxIUyNRt9CwDTIHtiPdpRnccCEryKQ0Ah
	CzV3cnhUhjncR0H3riZS4avX6GESMXelq+rs6ky4+fPZWDI/Txu6X+8fNbKNhcb9jNrc/VWSf2f
	Zf7bkwWhau4oRFfqu7APn5KKo2oCeV47wb0erXW6reV8AAb8qlPysWhwZ0WvqTZIY102i+Rx90U
	f6IqPNZhh9O4N88ORJp00VTeTsH90cKECU5BSKYTORxb81E4FdMWWzomfuNHGkEC5h47CDSgXBa
	M6G2g0/ZvKAixEaraWFRyRAP+ExAURI89LFai+PbkmbYAe8zM6+HDipNs+8AVEC7/9ptu+sVuhX
	rthZXsyjGiZl7dt9RLPDXhdRSKa68bpCp8gTJgeagjfNgDqgH4cM+xq41Y7P+QO5mKf8TExonzy
	X1yh1CdxeJtg3HNJUiIT2J4C++LCDFzv7g0ntQgg/HOPw17axZRgJ+np+Dbf/wCDm44IKbc6c1y
	LA0pR0XD4
X-Received: by 2002:a05:600c:19d4:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4bb55a5af8cmr59550145e9.20.1794580656582;
        Fri, 13 Nov 2026 06:37:36 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm68940435e9.2.2026.11.13.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:37:35 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de,
	Graeme Harker <graeme.harker@gmail.com>
Subject: [PATCH] m68k: irq: Fix irq numbering in m68k_setup_user_interrupt()
Date: Fri, 13 Nov 2026 14:37:31 +0000
Message-ID: <20261113143731.167962-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
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

m68k_setup_user_interrupt() is meant to set up the user vector
interrupts IRQ_USER to IRQ_USER + cnt - 1, as its BUG_ON() check
assumes.  Since the change to irq_set_chip_and_handler(), however, it
sets up interrupts 0 to cnt - 1 instead, having lost the IRQ_USER
offset on the way.

The VME boards pass a count of 192, so the user vector interrupts they
use are still covered.  Sun-3 passes 128 but requests IRQ_USER + 127,
interrupt 135, which has been left without a chip, so its vec255
handler has failed to register ever since.  All of them have also had
user_irq_chip put on the autovector interrupts 1 to 7.  A machine with
only a few user vectors, such as one with a single vectored interrupt
source and cnt = 1, is left with its interrupt on handle_bad_irq().

Restore the offset.  Only tested on a machine that calls this with
cnt = 1; the VME, Sun-3, Atari and Apollo callers have not been
tested.

Fixes: 378f7ca6aa22 ("m68k/irq: Vector ints need a valid interrupt handler")
Signed-off-by: Graeme Harker <graeme.harker@gmail.com>
Assisted-by: Claude:claude-opus-5.5
---
The machine with cnt = 1 is a homebrew 68030 board whose support is
not upstream: one vectored interrupt source (a 68681 DUART, vector 64),
which stayed on handle_bad_irq() until this change.

The Sun-3 statement is from reading the code, not from running it:
sun3_init_IRQ() passes 128, so interrupts 0-127 got the chip, and then
requests IRQ_USER + 127 = 135.

Build-tested on m68k master (v7.4-rc2) with multi_defconfig,
sun3_defconfig and virt_defconfig.

 arch/m68k/kernel/ints.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..eb41aace61d4 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -97,7 +97,8 @@ void __init m68k_setup_user_interrupt(unsigned int vec, unsigned int cnt)
 	BUG_ON(IRQ_USER + cnt > NR_IRQS);
 	m68k_first_user_vec = vec;
 	for (i = 0; i < cnt; i++)
-		irq_set_chip_and_handler(i, &user_irq_chip, handle_simple_irq);
+		irq_set_chip_and_handler(IRQ_USER + i, &user_irq_chip,
+					 handle_simple_irq);
 	*user_irqvec_fixup = vec - IRQ_USER;
 	flush_icache();
 }

base-commit: 8c9ddebb300c719362a52a2d465f44e7d055778d
-- 
2.53.0

