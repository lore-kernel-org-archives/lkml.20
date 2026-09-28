Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DEA4E3248
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615670; cv=none; b=IP+bdRq27PHlKyWnYaIPL74G3eX1Q7eetnaGqit12fv80b60jBOysUyGBNhvvdVSkPrQXwFnQWbWyxw0FbbL4dkWOrIZ/rDUOX8kuos/WMN7JV2668RwI/s/d2FtM1W5P1C/x3bu7Cnp9UqVZtCHI8aBN/+tszdww7q2CXBmqgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615670; c=relaxed/simple;
	bh=tehroZN3KtgNHaPozWMKAR0G6Rqm8qcNfVMBdzcofAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kpwc72rCkF3xdlqfm+qM3KQmhlzvvYhUSabq7hX/VYiUCjLE3IYy5gRa4AdPMUWNckmLMSRLqOFg5xXJ3GmicCr+Rp/aj03H5XHdjQLVzo59t2SBybmjo3sAt2rgBp2/qnjP/9DdCLGTNHAlyd7JaNgHLvuyb9ph3N+ude3J9Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSYe76pQ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSYe76pQ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b46bc1282so613243a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615668; x=1791220468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvEKnO6S00JYk9QppCVl3/HoC/Fjv0c3U2lycj2T5RE=;
        b=RSYe76pQcKyuu5SwzFTcq9kPXd5aZnRmnBdqyP37oa1QYRIwezgoUggFcywmCARuUh
         QNX5EFvVezYqY/zog7oSBkjJ+oZwwp+7FbtXGuArILqdihTUsNToaxpqPCLbt8BdvR3o
         WUsYujrYeLtBIqeP2Jo4bPWX+kn2+gLv++9cbP39uf+CWPJKxhQWdTRdCnmUUajvPuXT
         zze27PdPtwVH91STO2I3kY5Beu+a01JvuwvmaK+5/dgFjoKO4ynwz6pboNsOYZ2X4Fwq
         dSGzeiExPefZLx84Ux+67uNm7bFObLIvEy72bRYr2mrREP96UqdRLjksYQrmD0pig7/t
         fBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615668; x=1791220468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvEKnO6S00JYk9QppCVl3/HoC/Fjv0c3U2lycj2T5RE=;
        b=ouZBN1OJa28GpyqlY6il4Bm8ijinOIpXpn4d3neoAKeErFThVkdg/qymUBS1c+x+xF
         7FdXJAyE4cMpv+NwH2PAA2ET8JeQgNkS2IY3UVv3aX8Kz/Uu032NIkxiPUK4MJHvPzK0
         J5a4K06vXRdJ2bTtjnQ5Ru0HglXcq5atrA5Ts3kZJDs5KT02fLks1cs6IgCJU6j1l11+
         wFNAJJ0JoVvdd7a8ZREJiwXlmIk2kTQWIS9MpykiL3r+n8S8OcANakKpiiMTsqHaJH74
         RaWidZYzFy8Xjupnula8RPeaq1fD3iOKrUOHb9PYa2a2DPIsSaCEmb0+/QXcHVoA/8Gb
         HoAA==
X-Forwarded-Encrypted: i=1; AKwUvBzLvCFv5eVlqQ7Jv5maYZ+B8VDaIaeNxBRJI+x96IZbPmoWR83htYgjDdzMeD1lvrGrK8mB6Xerxo5+kI4=@vger.kernel.org
X-Gm-Message-State: AFuF++kkmN0b/xumvkjC+JIk3bgIpGyLl+zxoW/Kzh2/vOIaEpUiYio8
	ZphURe6o4qbZ3Q7Vv1bu/8zf0v/e2xcg8n6O8OUH/XQLpKO+JaZnZcpNR1M+2A==
X-Gm-Gg: AYBFou2KhELyG2OR6QfaHVT7lxvNxBqO3u4a+sJFU4shJ+7l5zvvDOp4jAQPxX/pr89
	nJdGOc3xv1wCKd8reMKj5Fp/TVcokDFpUjvCiBrMR2sddc7e2lxOir4PouqA9PLu7XjVJ5V/8Fc
	OYmGY76FYCqnFMJMsnZYaacw2OP5ipEJgC5+Hp0OJ56bgt/TLHvyoMDY5SoCe9DjWY3uDuuHlCF
	tlkMYEWAXnNm5vaAr+kzsATXw78L0lvSXqSyYy0c3Xgzy2Wxd6peN+krodnk6tkDVyZJjDWowid
	RVwMYR+8XSQ91Fi2fqUY9G46Cea2hxCK8SyxLwbtZHhskHRtqZPiqDnChxKL397SWyiXsoGCmIV
	Z56nAs7heY2a8sGP655HtmmdeKKHZyKinkv28RiivJFVNZcgvs1aK6wDL78IRvlbJ/XIlRZpU6K
	mkc+Aw8mkhmo0Qaz6b+GhC6nEuMOorzvfr6RGesZmu5ts6Za69ikujl0Ash1/mg22H4D0JsDx64
	RoSWWDarqhMoYChw8yX9qURk8zx3uKw6+Ff4JQqgg==
X-Received: by 2002:a05:6820:986:b0:6d8:6049:1247 with SMTP id 006d021491bc7-6d860491701mr3981185eaf.2.1790615667972;
        Mon, 28 Sep 2026 10:14:27 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d87d9060cbsm5492874eaf.0.2026.09.28.10.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:14:27 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Beau Belgrave <beaub@linux.microsoft.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] tracing/user_events: Handle ioctls from 32-bit tasks
Date: Mon, 28 Sep 2026 12:14:23 -0500
Message-ID: <20260928171424.199202-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DIAG_IOCSREG, DIAG_IOCSDEL and DIAG_IOCSUNREG ioctl numbers are
defined with pointer types, so their size field is 4 for 32-bit
userspace and 8 for 64-bit userspace. user_events_data has no
compat_ioctl handler, so on a 64-bit kernel every one of these ioctls
from a 32-bit task fails with -ENOTTY and such a task cannot register
any user events.

struct user_reg and struct user_unreg are packed and only use fixed-size
fields, so they have the same layout for 32-bit and 64-bit tasks. Add a
compat_ioctl handler that maps the 32-bit ioctl numbers to the native
ones and passes the argument through compat_ptr().

Fixes: 7f5a08c79df3 ("user_events: Add minimal support for trace_event into ftrace")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 in QEMU (v7.3-rc5 plus this series, KASAN and lockdep):
    - A 32-bit program that registers and unregisters an event gets -ENOTTY
      from DIAG_IOCSREG before and works after.
    - tools/testing/selftests/user_events built with -m32 (with 2/2): all
      four tests fail before and pass after, in three runs each. The
      64-bit build passes before and after. No splats.
    Also built with CONFIG_COMPAT=n on x86_64 and with CONFIG_COMPAT=y on
    riscv64, both with W=1.

 kernel/trace/trace_events_user.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index f658c3a77aa7..07cfbb5a17de 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/cdev.h>
+#include <linux/compat.h>
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/io.h>
@@ -2737,6 +2738,36 @@ static long user_events_ioctl(struct file *file, unsigned int cmd,
 	return ret;
 }
 
+#ifdef CONFIG_COMPAT
+/*
+ * These IOCTLs encode the size of a pointer and thus change their numbers
+ * between 32 and 64 bits. The structs they point to have the same layout.
+ */
+#define DIAG_IOCSREG_COMPAT	_IOWR(DIAG_IOC_MAGIC, 0, compat_uptr_t)
+#define DIAG_IOCSDEL_COMPAT	_IOW(DIAG_IOC_MAGIC, 1, compat_uptr_t)
+#define DIAG_IOCSUNREG_COMPAT	_IOW(DIAG_IOC_MAGIC, 2, compat_uptr_t)
+
+static long user_events_compat_ioctl(struct file *file, unsigned int cmd,
+				     unsigned long uarg)
+{
+	switch (cmd) {
+	case DIAG_IOCSREG_COMPAT:
+		cmd = DIAG_IOCSREG;
+		break;
+	case DIAG_IOCSDEL_COMPAT:
+		cmd = DIAG_IOCSDEL;
+		break;
+	case DIAG_IOCSUNREG_COMPAT:
+		cmd = DIAG_IOCSUNREG;
+		break;
+	}
+
+	return user_events_ioctl(file, cmd, (unsigned long)compat_ptr(uarg));
+}
+#else
+#define user_events_compat_ioctl NULL
+#endif
+
 /*
  * Handles the final close of the file from user mode.
  */
@@ -2787,6 +2818,7 @@ static const struct file_operations user_data_fops = {
 	.write		= user_events_write,
 	.write_iter	= user_events_write_iter,
 	.unlocked_ioctl	= user_events_ioctl,
+	.compat_ioctl	= user_events_compat_ioctl,
 	.release	= user_events_release,
 };
 

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

