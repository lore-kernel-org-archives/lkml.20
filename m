Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17148987B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837875; cv=none; b=Jw5MeNnsQ8f/92Y/IIoIkd/lOaC6myFf0UHCc09xGOPoe0SmbdEE3btip6hzwzrC2QxC8DfKyvWZec+LroRT9VM8jqTX8UODFKvsRLP7KnzVnM+I78n77N6jE/mC9L/70F+SgV+rkjkeC6i8S58igly5sj41Cnzeqb7gfSzXkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837875; c=relaxed/simple;
	bh=LgGoDxD9QQwhwkXxmY2/np1ME4QMxNQVluFC+Tj0ly0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVxxw6gKT+CVbJZByKuAL+RXfJcOllQFjH5QEuGoiXJ7PBwNv3mJOFuyHnulkDAlLRgT6Atd2MUlWOCn+O4K1NbhEOJrS2gjnFi/OLPZplmZMYcyChAyhSx8QFUezHvWLxd7hUiMnLRAeH1Ok6yxNeR0MKAWJ6lLXmWUb2cGS9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7U+2vM5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7U+2vM5"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1602320a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837874; x=1791442674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1rzJCEn/PqQYXJoEBGqCyOeQp6LYxfEwiJe7Zi6fNM=;
        b=R7U+2vM5+Ts/+mKuPEznZuKzNRU1LtNxFbbt6sNgCHVsR9lpa1XtHK58XiJBThamir
         YPzvCkq0jonP7TJPab3XDeEU2QADy0BzzBmoqksSAizsZ3vDlIfc1xSHacoVoUSupVs/
         C0W8+BA4C17Geh8wEaFexGbBo62T0hHoij0mKLe3w9yv4ygzZSJk1jZmrHxk0eNOACeL
         +l1SaYeY006EWiQQiSUopQKzCev/mt/ywUFa7pw638xApIl4+RgbQuO6D2y5WQlUM8Kr
         +/tTT/YKYPssQ3/gHNy0aAExzXtq47u//s+qjKHaDCkuD4SAocTqDlacGhzrBZednR7t
         UETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837874; x=1791442674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1rzJCEn/PqQYXJoEBGqCyOeQp6LYxfEwiJe7Zi6fNM=;
        b=kca+KBcQvT6vYsYK66cTCEaKSkAcMNWPTKjYzZ+H2UbNwOpvKXfJBtvPQwVcCwvJp8
         QsKul2yTLW00ENiX+O/4JBjoySDXuUtXzhTWyw88QYa75DKxXikItEG3P/VRPYbcwO/F
         LfQ4Kj11tUi5PjGQFcK3YgoIbhH90aWQG2Ig28SCR5b7/zqeXF4sUOfCjO2SZ/1YYoub
         XPjzsCre0ScHeZ6jdv8O4jltkyd+yurCI16+tMV22s926smjbYe3TkXHTz6Euv/1LdwH
         JeUPbexWu+JaF2av+GZQKrL/bqFn5Y8zBdp0A+AW06KJO7z+Q53aiqSSWp2t5KO3PAdp
         7vUg==
X-Forwarded-Encrypted: i=1; AKwUvBwoJ/uXT4XSbk9UHcA72FUIWNHWpfPsxe7RljFQnXLBU+U8hYQeRTc1OzEXFMCuHjaeRv69m+uLwUM+Ghk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy80RopGF7PU2HX7CyB6bqi/4SZZGXJgcgCWKBed5CiS1CYhRv
	FGLGQW6+k7vl4RKLaheS8S7IKL3b9P+DLxuXSb0qAphltDPliNwIWOmPWscb26Oa
X-Gm-Gg: AYBFou0cqUpx6olAKRfhRG48HHl6vUrmGSAlmWaIS7XuPCp5htoKiDeei8ghJfi5WDx
	Qc2QURiz2KSlHzaGUcQ/OpjTUj7J6cNUsuPjRKZMnNw61W7EyEKkkS17INwhUn0dh/YTKfw+v6N
	odGfaxfGLeYiUAOXXXfXDlhuMHQ5fK3fjB/9Cr80+OmVi9nMbJLxpcMUuU2fZLbhgdQuK7vYzvb
	ae/guKuOmAX9dyiRnZdXvZ1LMpl6+0KtcP41PBqYofmhqC/ipFGyvWJc6ap+u3zqguHK/+o/Fod
	lftoJJ8KDXOoM9azJSCXk7eSMc9/H8oCzMqXGnT4IlnwKw4Ddc2sK7dA959q6q84AOydOiTIpYf
	pqKdlPOCk5kOgSfHY6wNQzWqa5HKJj8XO+0ZLmBbLdmMfOvJXxWHFK5vQ6nmtEfHv2JhmvNiXoA
	GuPUZZ3RoxzXI+tqfbX1dR8++IDn0wrhKbeDIJVI7tC9dFhTVo2rYM4t32/XX7zTAHgeA68jZBx
	3LFsIiJQE+66/M/TuJnwHLECI2zNzdljdOU4pVZtygWNL34
X-Received: by 2002:a17:90b:5283:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-3a4d151e992mr2891716a91.10.1790837873602;
        Wed, 30 Sep 2026 23:57:53 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm2873138a91.16.2026.09.30.23.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:57:53 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH 2/2] sh: add SH7305 CPU subtype support
Date: Thu,  1 Oct 2026 00:57:36 -0600
Message-ID: <20261001065736.753215-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001065736.753215-1-artem122novak@gmail.com>
References: <20261001065736.753215-1-artem122novak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SH7305 as an SH4AL-DSP CPU subtype.

Recognize the SH7305 in the SH-4 CPU probe using the existing
0x300b PVR family with PRR value 0xc0, and expose the processor
name through the SH CPU information interface.

Signed-off-by: cacioandpepe <artem122novak@gmail.com>
---
 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..e71b5476769e 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -467,6 +467,15 @@ config CPU_SUBTYPE_SHX3
 
 # SH4AL-DSP Processor Support
 
+config CPU_SUBTYPE_SH7305
+	bool "Support SH7305 processor"
+	select CPU_SH4AL_DSP
+	help
+	  Select this option to build the kernel for systems based on the
+	  Renesas SH7305 processor. The SH7305 belongs to the SH4AL-DSP
+	  processor family and is used in embedded systems such as Casio
+	  graphing calculators.
+
 config CPU_SUBTYPE_SH7343
 	bool "Support SH7343 processor"
 	select CPU_SH4AL_DSP
diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 2a0b5713ab80..96321c46ce85 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -36,7 +36,7 @@ enum cpu_type {
 	CPU_SH7723, CPU_SH7724, CPU_SH7757, CPU_SH7734, CPU_SHX3,
 
 	/* SH4AL-DSP types */
-	CPU_SH7343, CPU_SH7722, CPU_SH7366, CPU_SH7372,
+	CPU_SH7343, CPU_SH7305, CPU_SH7722, CPU_SH7366, CPU_SH7372,
 
 	/* Unknown subtype */
 	CPU_SH_NONE
diff --git a/arch/sh/kernel/cpu/proc.c b/arch/sh/kernel/cpu/proc.c
index 5f6d0e827bae..b6fbe27742e0 100644
--- a/arch/sh/kernel/cpu/proc.c
+++ b/arch/sh/kernel/cpu/proc.c
@@ -25,7 +25,8 @@ static const char *cpu_name[] = {
 	[CPU_SH7786]	= "SH7786",	[CPU_SH7757]	= "SH7757",
 	[CPU_SH7722]	= "SH7722",	[CPU_SHX3]	= "SH-X3",
 	[CPU_MXG]	= "MX-G",	[CPU_SH7723]	= "SH7723",
-	[CPU_SH7366]	= "SH7366",	[CPU_SH7724]	= "SH7724",
+	[CPU_SH7305]	= "SH7305",	[CPU_SH7366]	= "SH7366",
+	[CPU_SH7724]	= "SH7724",
 	[CPU_SH7372]	= "SH7372",	[CPU_SH7734]	= "SH7734",
 	[CPU_J2]	= "J2",
 	[CPU_SH_NONE]	= "Unknown"
diff --git a/arch/sh/kernel/cpu/sh4/probe.c b/arch/sh/kernel/cpu/sh4/probe.c
index ef4dd6295263..7f77fc64258c 100644
--- a/arch/sh/kernel/cpu/sh4/probe.c
+++ b/arch/sh/kernel/cpu/sh4/probe.c
@@ -143,6 +143,9 @@ void cpu_probe(void)
 		break;
 	case 0x300b:
 		switch (prr) {
+		case 0xc0:
+			boot_cpu_data.type = CPU_SH7305;
+			break;
 		case 0x20:
 			boot_cpu_data.type = CPU_SH7724;
 			boot_cpu_data.flags |= CPU_HAS_L2_CACHE;
-- 
2.55.0

