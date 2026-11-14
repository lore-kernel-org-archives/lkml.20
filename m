Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679385;
	b=EjeDPenjJk4IZsUesIJiY15XGRGo95jlq8quUuqlGVxw7irMP1DoLZexwNgOESxXbH2p
	 APyO6HjjU8geSw+NMPCynR9Ur7LC7lmr849fVuG6VL0EZQByveLyaI/gr2RhL9r4bWQiw
	 2W0odfhaxGDF0JNtDvMZ26u4q+1vL0sneWelYH8De+2q64jB6vQ4DruA7rr+sPkOR8FKz
	 We4hd7f84B8uHsWVIwH0DShGc3W8g+iP6aGeBzwprSvdX/WnjHHXFcP29rHylCNvKP3Nb
	 4LXWzlgNxH1wAlrQVWQssDs/7yvxeYXCJ1PgR8+1qEwtV2GHDiA5X9OeOZ2odN/SjIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
	b=UOOyKMhthXx8wsyFPg5L/T887euFzE2sNitnhTOj8ve0gaVKd98RubDotXS+eEVZkzez
	 HY3RyNfHjzPI4dbcHIEZBiF+Udazs9a73DHJjxdEXElY66Dbbc3J+A/+eRhaNsyf/8wie
	 zxFEzPjSsY0CtAAUQ/KhZNdot9E/OxHidmU9e8SBcthnlQ4ngCF9h43WH15Mxm3ty566x
	 M26ReknH03/gIQ2g1Pivk7PkGDvEaWEVrHfB3dv6UjhNJ/VQwiRwYMeiblLhjnY44asIm
	 /Z+9odl1grE8nR/UVtCrvT3QCm31RMFort85XKynngmM9BEs++XglrZRmaqdSg1fcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7ni9Co9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2F606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE2F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7ni9Co9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so28371785e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679382; x=1795284182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
        b=K7ni9Co9vimifkbmxN3A/WMhYEcZTJAa1C52yWXd006xAi9Zd15s4JP8+mnRQMKbRR
         +lI9mw1x5iD1SyXapJ4LLXbLbx0W0aTPRB+ELwPu28rr9fFezG1vashJxl7czosPv08L
         /0pUylFdOr2pWdxDutsD1m2S7Mzt2PWvApJGbLVCFAwm+T1ANSQ0s8rM4K4t+FCaXsyV
         bnvoafdIa6uc31zELv5pQwpf8FGTBWABEwD5NGkHFBEaoyilWoOhogh92HJaGfDsZGNj
         lXmn/CT3BOXSka24PJrVu5INE3MABPZ5wIaSU3A+Z41k5D+mIHS6zyJ8qCRvBVhDc7yC
         t9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679382; x=1795284182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
        b=MpdbAY8vuX55k7fJVDvnhc+fvMLjJJtITAXc8MFxkYIXTCWpQeyHPjGTa2tXyPVy7q
         7l+UVHyjofclKBs9Gs4NVHV4T8/9SFfk3UQ/U7mm2am1XRTLWtcUcYdbljVPWszrxJq9
         RdM0EV2jefcsumQVfsSXdY+1YqO4KYMNtMeDX8jNK5mjS8LO8uE2A2jZBzOIeqiF0N/F
         t4hGXUitH5ugWqgkHP31A4bcuX39Ska2lYly2j5+l9xKDfRh7Stjvvvrg2Qf5K1HHeu9
         XAzudJBRKBs2A3AzPjxIoZd1k0Bpn3VmjrqHIUd9bvR4DXllVMnOKN6hLo6wa87oe/lh
         KFUA==
X-Forwarded-Encrypted: i=1; AL+hErHpPSVtLg/dv0amoa1k1NG5STMB0CnKIrmbZKrxgFdbC5pOsWaoYZj7zRStWMkG6Zu4l61u9roaNcYM5x8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XjeeyC3h5QLBOxOgEa8q1XWnhlNKLgtxOeNUZRMep5jCUyUjf
	9XXWkS8lvEwNwRAY5VL8pJ1kmp0/WgUa76BrxmQ9vtgntVdxbblwfN6/
X-Gm-Gg: AYBFou3BtCdNARlRaEo5D/oJRR8VAqjaXXRyz3CxSH6LJEAo2WWq3hJWDkKMms0B2iu
	VrFvBlpJiFfjitRWdM9HoM/+GUQ2kPb5qldTKrEL6Wt2L0UX1OdqN0O5c4NBk2PF1OdwS+yhlAJ
	1YLmIFBAC4zfD6EYXose7jkeBQtYa1WoQ/9E6CjIsPasjdoYlKdj9yY5qgPdc4wVV0mNn+o/66B
	d5BVBKLWy1ikNbz3B7g2A/JcJS4Zb5zNPphXaky1EhGy4ua7b6AqS07QyHnZE1WrG9wZeUS/UNM
	uyXndo0/hUB5/uHDKcc3DQY5Y5OOLJXZw8rcy0VYYN24ZKJ977i28BsPXv1x21zQa7G0GMdCueE
	I4v9mDhC9Mwhaxzk7RSotytrRyJYyI2hy8bcTslwc/myHxE1hsrMyqx+YIRDsyI8c0WmqhhO2FD
	xdqkF7DlRPVLgblbeTO6rJ+TnqWxFDzaF2irBWZBtEBoA08Ek9fKel7lnUMQakw4mbLmRpHRD+p
	SnQhC2ZUA3OGwj6oyuDqyoiIrB5xnHLqSlzfCV6PciXvp74AdTrx/zpKxEwkevDhizj6hizfLV8
	OLKWeZ98uwniRPqZ5U1rhYLsF8O2zwOBgUc+a7cK/Y+QUgnX+3tXaASouDGGRrD+RtjFk++6XmV
	fD5TnlQV5xLpXRLA/oO8M5Q5eEMKsbaIugbgJQh4kw7IvyoLCdvG3zM8Gck+5Xb7AeISw0BGTNW
	LE9k5eHTeKMQk2Yu6SiOVtOUR15YEBtSE=
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr1309225e9.0.1794679382371;
        Sat, 14 Nov 2026 10:03:02 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm13422619f8f.0.2026.11.14.10.03.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 10:03:01 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Helge Deller <deller@gmx.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sven Schnelle <svens@stackframe.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-parisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: Fix register corruption in 32-bit dynamic ftrace
Date: Sat, 14 Nov 2026 19:02:50 +0100
Message-Id: <e184f942e0933a1618f161abe672ad8a90bab529.1794672077.git.kmehltretter@gmail.com>
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

The 32-bit dynamic ftrace trampoline allocates a 64-byte frame.
ftrace_caller() saves %r26 at offset 20, which overlaps the third
argument's spill slot for ftrace_function_trampoline().

In the failing build, GCC spills org_sp_gr3 into that slot, overwriting
saved %r26 with the original stack pointer. Tracing preempt_count_add()
then passes that pointer as val and corrupts the preempt count.

Allocate two frames on 32-bit, as 64-bit already does, and update the
generated trampoline instruction to match.

Fixes: 6ca6366220ed ("parisc: add dynamic ftrace")
Cc: stable@vger.kernel.org
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with GCC 16.2.0 on a 32-bit SMP kernel under QEMU 10.0.13:
function tracing of preempt_count_add(), preempt_count_sub() and
update_rq_clock(), followed by a combined function/function-graph
workload. No warnings or faults.

I used an LLM to help isolate the failure, inspect the generated code,
write the test harness and prepare the commit message.

 arch/parisc/kernel/entry.S  | 4 ----
 arch/parisc/kernel/ftrace.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index e04c5d806c105..b0728dbee53d7 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1949,11 +1949,7 @@ ENDPROC_CFI(mcount)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
-#ifdef CONFIG_64BIT
 #define FTRACE_FRAME_SIZE (2*FRAME_SIZE)
-#else
-#define FTRACE_FRAME_SIZE FRAME_SIZE
-#endif
 ENTRY_CFI(ftrace_caller, caller,frame=FTRACE_FRAME_SIZE,CALLS,SAVE_RP,SAVE_SP)
 ftrace_caller:
 	.global ftrace_caller
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 10fd5b3e63e75..963a741faa42d 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -146,7 +146,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 #else
 	u32 ftrace_trampoline[] = {
 		(u32)addr,
-		0x6fc10080, /* stw,ma r1,40(sp) */
+		0x6fc10100, /* stw,ma r1,80(sp) */
 		0x48213fd1, /* ldw -18(r1),r1 */
 		0xe820c002, /* bv,n r0(r1) */
 		0xe83f1fdf, /* b,l,n .-c,r1 */

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.39.5 (Apple Git-154)

