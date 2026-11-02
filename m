Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592772;
	b=zsltYxDG3W4C3sr92SgJDyXa8BSY3WBQOlhSaE+Rpar0MM4DUcqWOATyE8ecS9NB/sQB
	 aLOJb7oqB4+leQbZvwIQewMS2Ef53zyImujymUs2einAj1BNEIiQEZepqtUjIIlUB+X6j
	 V78cqY8kJe/MBukDYqTWQ2TeRpW7mYB9yNugSEXTlZtaTUICF7JesB8RptchV5Qv3KeXR
	 kn5bRK/d4GvmK/Qq9palomtBRKS081YUfMFJyJK0y1kJv0ZMaBkgdZXr/So6mr4B/TTTX
	 /XHtdLDzq8dNzD5AeHXojIvHuyJ3Bbtz0Npj5cQQf/Bs6Gv7xCNOoDl8vXHv+6s8sSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HXExBpm+HM1+xWx5ZxB/Ym/VbcYfOrarlbhjIM0wW7c=;
	b=oHh/yvLDPUXZcEme/ezU3ZdIfFlC8NHiljFMErKjP7xEKkJxnRKgnXvLcBSP8KCaGTFc
	 bMoyeRBe4XrNf1vD4AGUs3Jv0+vDTe41TFkBCPabBYH62NRBXok6MUFbbJoQHT7vLsCRT
	 6Z5l/EO3TKnB8UMZN8fh8wuOqj0UnZlT5NTAkTcYkvQwyUDk79T9TDE4hAa+sXdf98TK5
	 0LxQhkeh/J3LGioc8nvQ/zGHvr79g9pw6o+lfhthy5QeM3Ir0aPQ2omPgxxWHE3JKcY3b
	 hF+txYPZau4vAqPw7OCvjlinCITHVdzqWUYu4xwIGDnz3XVQ4sJmx3bN3hQwkwCDcNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa7mrpCG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD15606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD15606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa7mrpCG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so21240105e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592770; x=1794197570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXExBpm+HM1+xWx5ZxB/Ym/VbcYfOrarlbhjIM0wW7c=;
        b=aa7mrpCGldWnEQLXDuzCewoZYuwZbP/krSOo6/JETJMUb+lwaO6GFj6n6mDYXVSTKE
         M++mXUITlllR3iygNFBADPy1vOAgyhcpdV/iJKRDvrefYPPkpB/dbjg3oeaBAcN3E+Sq
         9H85TSzdQTeiizFZY8yZMZUvuGz0WxOFiGHSDyMrJ9ucDb7v3jah4z6TGk9cGt6fN2hV
         uCviq57AdJNRAAuZTmdQYLnCF8V0m3y7NOKR9lgA451H269NMBoM7PUnHvnr8+nJkUtt
         RJ60m7CaVxdQUhFUL13Rg5bYLOJ5WdInnGA/hQNZXKdwB7b2jdA+syu56LCNF9mwqD52
         QIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592770; x=1794197570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXExBpm+HM1+xWx5ZxB/Ym/VbcYfOrarlbhjIM0wW7c=;
        b=eZxdF0MFYnTfoTr7tIawKOgMuLbnu2eEVp5BjONLxverUu8jFQHU9S4Fyo6QMWlL34
         Z3VMdnPYzLezXoW1uxwLs3IzS8htrvc1E6VUA7turNlvObuYUwAVh4ktlDwHfRQULuQw
         iG7uQ2auueEytXwSLF9qtffz4e43Qqo8/CqecS1b5mlzsOmxCKQB8mx0XvvCqOgzWLjy
         A1LQhlcq/GC94zD7hGqoHd3Q0X33TQCytFE0BcMyQR6PUGTUc5AviL4EkXcRlgo/U1Qf
         zqfEzErO6xmQzPcGIu5fVb6FsBll3C4qVpBF33JNVs3gBL2tOUYsqq+doS24YDFt0G2/
         Vm2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFog2jstQUkSHW+lHCUbFLpkvUj/YXNuyZsiOapJN17F5fjb9sYOxkFdb/x3BC3spjIWQVM9j2hIaRSzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQoI5lYsSZ6W+Ps3Gs4J9UVxN4HJ8qCFpkRxaAp3q7SGQLQtB1
	cr/X9pWuoD5zbfuogWfInYU+CA0rhP/ylWRUzvvm98xaw+KLjs4LTF9k
X-Gm-Gg: AYBFou2YpRtJfd6onXKiwDIz5OFNHWRYPGn496Pk3AEVNZuiobJYCrSkq7bAAxx0yDy
	UJMO3CkFa/QVxkOA0EIM8euQcAE4kC6LE9LRqUawQAcN/HeEt1KSR1l2pj/IkoAvuwShcaN1Vo3
	OwXQVxT94e8o4+hS7jCLUs+jp2XIeGjaM6OHiMJ9e6sDpnd0EpupyB/cEpTekgZhC5p9uT+z5FZ
	nQziL0t9QElxm+jlmGMntTCnbjRsgFxpTTyN/R4NDJcCnDnhc6IB5b52l//fm9qCnc08882MjHL
	nryCOuKGFwz2cDviLSm5XglttmMQwnFJB18figxOMHa+BgwCH+IjNtVUScXws0fVWwaYNUYRHqo
	w2nAAM1/mQQMrG3GeP7NOCY9bB8Jl4yIZGsRnBL5YIdUSy40AgcRnVl6iRJEnmUw8+dABieZVE6
	O5Y14lkf4cA74CBeV6qvaukkGiUdeO3bNmAnS5LBQpanNDCJBwidhgGpz3prF6Ui9kTJbu9JIhM
	3yGl4k8SYrH0QuvQJCc7ryoe6Q7gKHath5WbnW8t4aG0JHJfzN1FQSmHNjECViHBllWCbr0KzIU
	BAd+J2RidhzkJoerWqAYU8C8zK9Xv8UJG7OV8qNdz/zu9XMGNDirCApNKGQWLIr6dg0c4bQo+Oj
	51YPmNpB9uzW/b1MnnuIm0n9dualJEEzVQ1OxTcv3NwlOrhuKWegbMuoFOSqq3TLR3il5KdaLWZ
	6CuhpD8My+99hY1bIFcZgE9Qv7YpkhY48=
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr210442005e9.22.1793592769795;
        Sun, 01 Nov 2026 20:12:49 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9d0-ff01-e89e-fc6e-08de-7401.310.pool.telefonica.de. [2a02:3100:a9d0:ff01:e89e:fc6e:8de:7401])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm179710785e9.2.2026.11.01.20.12.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 20:12:49 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Schwab <schwab@suse.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nam Cao <namcao@linutronix.de>,
	Zishun Yi <vulab@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: traps: Fix si_addr in misaligned access SIGBUS
Date: Mon,  2 Nov 2026 05:12:37 +0100
Message-Id: <20261102041237.80873-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

do_trap_misaligned() sends SIGBUS with BUS_ADRALN when the kernel does
not complete a misaligned access from user space, for example with
PR_UNALIGN_SIGBUS. It passes regs->epc as the fault address, so si_addr
holds the program counter, or 0 after a fault during emulation, instead
of the address of the access. POSIX defines si_addr for SIGBUS as the
address of the faulting memory reference.

Pass regs->badaddr instead.

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on QEMU's virt machine (d73149283205, -cpu rv64,zicclsm=false) with
OpenSBI v1.8.1. The kernels are abf8c33470f7, built with clang 22 from
defconfig plus NONPORTABLE and RISCV_SBI_FWFT_DELEGATE_MISALIGNED. Not
tested on real hardware.

The test takes SIGBUS for lw and sw crossing into an unmapped page, lw with
PR_UNALIGN_SIGBUS, and amoswap.w. With this patch, si_addr is the misaligned
address in all four. Before it, si_addr is 0 for the first two and the PC
for the others.

The first two still report PC 0 in the ucontext. That separate bug is fixed
by Zishun Yi's pending patch:
https://lore.kernel.org/r/20260511124101.3202094-1-vulab@iscas.ac.cn/

 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda0..0af1cdb352 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -225,7 +225,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 	}
 
 	if (misaligned_handler[type].handler(regs))
-		do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+		do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->badaddr,
 			      misaligned_handler[type].type_str);
 
 	if (user_mode(regs)) {

base-commit: abf8c33470f78e2226ee3dcdc69004660020ab47
-- 
2.39.5 (Apple Git-154)

