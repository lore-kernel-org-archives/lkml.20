Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A347F2CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270379; cv=none; b=F153E/VqrXehqfI4wRmw0RQe+xoivv7ImMo826YLKGjUa7HBfbn9JYRQfhibKj0IarXLPBH8vyXNOgVYw4KbiEK1a7MTNyB+2zbEr2zGNVVspMxO9w8KWeJEQT+xKa0wSPRd7RV0VgAQvoeZbZf1t18u98+OT1R8ggBFzbYd7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270379; c=relaxed/simple;
	bh=vTuXdHjoahpfvREK3vR0JpIpWmDjOwvXZYApg71J5w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pY1X7Cadj67wDplQtBYe+3YN7O12V43JkEsRBXc7LpJXnRwf4GIB5oYF3h2DA8e4eSlTa+oI8ww1lnyAnd3SqvawtMPtB+ogHbixw8rXBsfyYZ4lnoY+nw3T5An13GFJF+HxpHUW3+Yho4AfC5rFVZZQoHwfFqMyDoh349bV0AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQubPDbH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQubPDbH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-852c481415fso6067852b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270377; x=1788875177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVcj/Jgo+entMeAtqsoiHxTBvbTk7zVsLySF0C5WcdM=;
        b=mQubPDbHp2C4r0ur3ETgpaE3iTvn5Q2owz3zGfUibQrN99R2igaGfQpmfnNHcvH+85
         p7pX6URJbq3XijPUATSZbnvL+CovUQTu+uWYBjffuvp8Q7FrvBbGaAyMUZaSDnOgmE8V
         e3rUlOJWBM2MBI9Vdime67UDhyTC4qKa1FZWzZ+SuE7ifAQjw9mRBN6L1ilTBZKbCfqD
         o2O576aQxFOFlnqFEuc+Rpwv1HlI02BmGB8v16OGfUKRiyQvH7zV+qaPn4Mkb1NqdbyI
         BLxuGX+W0pUnp692Md5Eya6mZocWdrO1FHUpyxRXERf7ow4lVFX8Db+bYP6da3ODzBT+
         UOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270377; x=1788875177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVcj/Jgo+entMeAtqsoiHxTBvbTk7zVsLySF0C5WcdM=;
        b=Kd9VvwKv+1BHr+yMNekSR+uk8VG9xpMAfwpDhtPDiQ3A+ZYSNEsAXn1/mzxRcIIik3
         9kZeSEhhgjNCyIshQ1xntDdAniqlmc4FRBJtfGyMhgW4/JIPmi6KfgLqA1zAzVC4u25Y
         vMRwC3tyaGv1Z78q/fNpXbKs3oK24ScZB+wE38ze84UXBmK5cUP1vDk+cQ1A8UjxYYud
         nBDrMHezZUp5mILXb2kHLnS+C3XPyzU1yr54DwvgpBOW9IVRK+m2p4orHK++wNNxdLWf
         N94j7G4yKh1XJfaWl90swuGsXOZxq5C6R30ruMeKsqQbiGRo4XkFw0ZhjyLP9I1/xlG5
         LOIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZsSTBzGHCQF/k61l7jhkNFIPmgYZIWlm+wJQcN2OP3dvf2o3M+hIiHPEzXmkV0D+6k/ANS77y6WZqX7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mKVBVCEJsIgAYPQk5q8zsbw7r+zr4Ntq9AGC+zrn3BHhWV5xyE
	CtoU4Ewvvf6+CzVOL2J7SdDrypoTH+pd8oyfeoth9iF0Wb6jbESInIuc
X-Gm-Gg: AR+sD13FdFAtqj5n4qhpAnV0SaGOqb8wyi516T2J4m7TbQ/T7ZibvZJXrTQnon2jTRB
	2dz3PLr+yUCvRKd57poFmKLiKp5V6omykn0sVOovp/S58jiApTAHjfj3bLSZd1Fc83ynirHrxBJ
	0JIpxRvqvZvQwYtjQKdH64gHKqslv/pVzfpjfVjwvCa0kYBdo20NbYO1/62TZ7Z14TSiiQQaet8
	C7dZdj7eGR/jnTIzGpyr0W32Pp58YjqUudy4jK7vz+EY16MbNPMBW0pUwVSpH8vVeignspLeP83
	D1fSJXweY21CsWMWhFms4vSbTAlDsdeFNZJ8+8JHgkWH0+m2wW1qcSlOI+hDBErSwPrRIdJJuT1
	8weWtrp4mizzM64hK5FLhqVl9+qbp6RFJmkER/2RCbdYN9Pf01TkJmQOamH+X30dtFXlIOQBAMt
	gvX/oY2xUBx5kTbGHxjy8B/DQVfMSFCThaAdoINu1y8MPkNEs89gTzryhZbIg+Xcwd9i71XKpsJ
	Jua
X-Received: by 2002:a05:6a00:a221:b0:857:7337:5db9 with SMTP id d2e1a72fcca58-85773375f9cmr32559402b3a.23.1788270377256;
        Tue, 01 Sep 2026 06:46:17 -0700 (PDT)
Received: from pengdl-pc.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be8f52cb4sm1132502b3a.39.2026.09.01.06.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:46:16 -0700 (PDT)
From: Donglin Peng <dolinux.peng@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	dolinux.peng@gmai.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengdonglin <pengdonglin@xiaomi.com>,
	Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Subject: [PATCH v5 1/3] ftrace: Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled
Date: Tue,  1 Sep 2026 21:46:02 +0800
Message-Id: <20260901134604.4052265-2-dolinux.peng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901134604.4052265-1-dolinux.peng@gmail.com>
References: <20260901134604.4052265-1-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pengdonglin <pengdonglin@xiaomi.com>

The trace_btf.c file provides BTF helper functions used by the ftrace
subsystem. Make the compilation of trace_btf.c solely depend on
CONFIG_DEBUG_INFO_BTF, allowing features like funcgraph-retval to also
utilize these helpers.

Additionally, the redundant dependency on CONFIG_PROBE_EVENTS_BTF_ARGS
is removed, as CONFIG_DEBUG_INFO_BTF already depends on
CONFIG_BPF_SYSCALL.

Cc: Steven Rostedt (Google) <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
---
 kernel/trace/Kconfig  | 2 +-
 kernel/trace/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 0ab5916575a9..d8faeb659cfc 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -770,7 +770,7 @@ config FPROBE_EVENTS
 config PROBE_EVENTS_BTF_ARGS
 	depends on HAVE_FUNCTION_ARG_ACCESS_API
 	depends on FPROBE_EVENTS || KPROBE_EVENTS
-	depends on DEBUG_INFO_BTF && BPF_SYSCALL
+	depends on DEBUG_INFO_BTF
 	bool "Support BTF function arguments for probe events"
 	default y
 	help
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..28b08f31e7e5 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -119,7 +119,7 @@ obj-$(CONFIG_KGDB_KDB) += trace_kdb.o
 endif
 obj-$(CONFIG_DYNAMIC_EVENTS) += trace_dynevent.o
 obj-$(CONFIG_PROBE_EVENTS) += trace_probe.o
-obj-$(CONFIG_PROBE_EVENTS_BTF_ARGS) += trace_btf.o
+obj-$(CONFIG_DEBUG_INFO_BTF) += trace_btf.o
 obj-$(CONFIG_UPROBE_EVENTS) += trace_uprobe.o
 obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
 obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
-- 
2.34.1

