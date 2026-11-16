Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861663;
	b=A/QZORe9dnDoXEmVp51oZY21duwvCTYDi3YHk/ISR9ZOIWgWVyZJbcvvzW9wFSjje2FN
	 KchG5JE/tO3xSgpcvCPFC3R2I8ZpfuBM4J2mSqyN8f5djnZ5Dm/cxfaDRdMeCS2pL9yAZ
	 0Nv9Ed8rnbAigXcLINjj+zri2qqPvI3WpDDR16jLlbzHORabY6798QMFODzfzDtiQwPmG
	 vWw3ZeL3ZqtnOAIHiTfYFeWf+H4fzhhQGKJm679g4sPl5VOkayWN+5F+NdQwBqvodyqSw
	 7sn1ZalEZyh1VZ38X0cbg3lVZvxdm5RZtKJQ+XMoypg8OCJal/M/9OC5QRqr9eNGwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
	b=g5sIDsG3DyzeYxsSWmN/9wI71/eLo27OSUvf2kZGxLE+uwbOfLLYr9SSdH5h0yPvdLhT
	 e6BNW7pD/fRxSt0AS42IsHSwITgmXff6pR6qQjsH7CKNgTs0qwbfHteGs3FBiu2rB4Q4G
	 0yeD4DtXtxQ6jAimZ0esnzynmSD7s5jyEsA2zjAjWKTYUhl8Qx7WAdInZexOXitd+qkkE
	 CSTGLigQI+CBZeFSphlrrMCIyiYDvuBHc48iXsX6Vk/0/5BDLQFSm8VvcH3ulSVQB9Ph5
	 wMwlK1Af4266PdNpg39q7gJP6ecspMNSAzm+uuaC5IojK0/ANj1357QLbonE1axlyhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFalh5K1;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2CD606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2CD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFalh5K1
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1898143b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861662; x=1795466462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
        b=BFalh5K1fJnVTgGbTTwXxlSkb8rqVoe8PZ7HShQFHdQtO7g4CK75+sfkRVEe13qjxB
         vTE+lPqrTwbrqNasqet/y6PQMWjvxuV/RQSwsmSoGq2OdOOUnyyAb6Xar8FQmQGmvKSI
         Bch1CDtUTPs3reYQ+ceU+PoZ8ad3N+s5RdmtoDDjJ3OAY3JuqQ0OkloJ/U3zmwIZjHGP
         7WaWLsE90y0jOocENm7PLCcZU9nV0fZBnASZOG2NnbTMX2pp1xGGNDxopISyciU32uYl
         lURcSAHPrFFiXZVJUiGdPXZgqAkjpud6DogXUmF87l6mTVDfBX2FharuAJy4NqX9G53o
         QdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861662; x=1795466462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsAuHpeK88xiJOqOPnGB32buPpp/uRAvzb9s3d+OSJg=;
        b=xZQ3XsWzp7Z9xKnAD+c2cIB+GkglfhndlR9dja6Z+kOaCznNFKOCEpk4CW8mbfGt6s
         Hhiq284Wj0ON3kNlFQOl2H6dKxKG+NZ9/6eGxI2ynZcIr+by7OV9SJGAPcdLHV/8xQqG
         e3CKbLaYoj86QIc9ZAcLRsnQUZUgWMP8+1LOTKWV0URB/xPNz1+KtnNQzrkKml4hecLe
         qt1bQq9u/GcBCIWzNAD9HchaXWRpVtChUbceUILju/ZZihgGo9dWfv8dMpY8Xu3wp0yz
         zvbrobxjLszFcuiu7pBsgcm+DNeWNZCG9LmKDyFYZrrUUq3+55oShOq527J6kO+PIJnE
         sH6A==
X-Forwarded-Encrypted: i=1; AL+hErFB/3grKRUO7aGwiMjwCES5G/XdQ6xbHcXDu14xBlVPejrQgmQY+3cDelO/9/qovpYIfZDb0LBmSBUpDJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4VnFluCIRRWrpcHvqQO7vTfaQya1jTfUcaagQQpYazG5aZwHN
	tbb4hryEt6NPF7QcLOTvFuCt2HBePj9RTh2eeTjyynYZm3tqhlPQh3o8
X-Gm-Gg: AZFdTZdfw2TPRereka0FHO7gwTP7ny1KAC8sNwHjpCIL3upmKQUog6I96fmISVaWtIY
	a9PoBDW9bQ9m0LCEG8HALqQb3kl+9IeK5soR1lhRHfzKnveK3VAr2qoMaD3JmALgbTbvfFadbu+
	0iaQ+ef4MZA44Yw6lnx0LRgs4x7eR7Ch4EsQBLgj2vZs2efHjCE63kZLYmHdyr4KQS/yY39Rqun
	X1fXvQTNq9QRTGc9hBHDsUassFwWrbI4E8WHlQ5jDmtiXJSBs+KKnUfLUQGD+91uo+OHuG+blB2
	MiUUErich5HfLpw/hAefW2uCFUXYf2WEAhOlySvpLxpCwLMF5EekYout2sUDIXKn1CPV0dBo2L+
	3PmdxZI7M6T7cv72M70m+hc+RmaeVtvZ3lRYCo2g+5a3R2MTZqk+DMRsMORm8heCQdodkmgwMwY
	ZhO/ZrCLZKOV1AIfAH96bNOiqNEGM9YeW1uRlZfPefuj2Ud7tH4xRj2wuBZPZOdmyS7SQHiVLMe
	ATXwkuB3+c99J4p5whUCNzkPWWilWoR22dfTLmyxXLxHABqqrmHEH7T3q5VGh0mzLnlsxvx5wAD
	mqP4PVKMNuWlyaFRTt19/b/dZiQ53mtnkfxsqNMkG/6HebD0YI/iyT4zqQanRF72hOgfJZIPrAo
	CfEKqTID5nSEDDXxBTIACZuBtKMOG2kc98SFyzYR+kUU/DgQerdPfWHtvxUBZZIh98Ug4krXomV
	gNSK+U4YkSS+dIBOb3zw8bMh0=
X-Received: by 2002:a17:902:c410:b0:2e9:3dd0:c7d with SMTP id d9443c01a7336-2ee0da7f48cmr101188275ad.20.1794861662240;
        Mon, 16 Nov 2026 12:41:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] platform/x86: dell: dcdbas: Actually wait for the host control SMI
Date: Mon, 16 Nov 2026 12:40:49 -0800
Message-ID: <62690b76d5cb95113b01092c8e3944fbb21a0922.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

For SMI types 2 and 3, host_control_smi() writes the command status as
-1, raises the SMI and then waits for the BIOS to change the status:

	while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {

apm_cmd->status is a plain memory read, and neither outb() nor inb()
tells the compiler that memory may have changed, so the compiler
assumes status is still -1. The loop then has no side effects and its
return value is not used, so it is removed entirely: in the generated
code, the read of the control port is followed directly by the return.
The kernel goes on to power off right after raising the host control
SMI, without waiting for the BIOS to accept it.

The type 1 wait polls the APM status port instead, in a loop that
counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies on
each inb() taking about a microsecond.

Convert both waits to read_poll_timeout_atomic(), using READ_ONCE() for
the status in memory and inb() for the status port, 1us apart for up to
TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the name suggests, and
return its error. That is -ETIMEDOUT rather than -ETIME, but both
callers ignore the return value. With the delay plus the port read, the
type 1 worst-case wait grows from about 10ms to about 20ms, which only
matters when the BIOS never answers.

This removes the last users of num_ticks and EXPIRED_TIMER.

Fixes: 90563ec4129f ("[PATCH] dcdbas: add Dell Systems Management Base Driver with sysfs support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 28 ++++++++++++++--------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..69365627fd8f 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -20,7 +20,7 @@
 #include <linux/cpu.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mc146818rtc.h>
 #include <linux/module.h>
@@ -377,9 +377,9 @@ static int host_control_smi(void)
 	struct apm_cmd *apm_cmd;
 	u8 *data;
 	unsigned long flags;
-	u32 num_ticks;
 	s8 cmd_status;
 	u8 index;
+	int ret;
 
 	apm_cmd = (struct apm_cmd *)smi_buf.virt;
 	apm_cmd->status = ESM_STATUS_CMD_UNSUCCESSFUL;
@@ -407,12 +407,12 @@ static int host_control_smi(void)
 		spin_unlock_irqrestore(&rtc_lock, flags);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = read_poll_timeout_atomic(inb, cmd_status,
+					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					       false, PCAT_APM_STATUS_PORT);
+		if (ret)
+			return ret;
 		break;
 
 	case HC_SMITYPE_TYPE2:
@@ -441,12 +441,12 @@ static int host_control_smi(void)
 		cmd_status = inb(PE1400_APM_CONTROL_PORT);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		ret = read_poll_timeout_atomic(READ_ONCE, cmd_status,
+					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					       false, apm_cmd->status);
+		if (ret)
+			return ret;
 		break;
 
 	default:
diff --git a/drivers/platform/x86/dell/dcdbas.h b/drivers/platform/x86/dell/dcdbas.h
index a05d7f667586..d5ad2363dd9e 100644
--- a/drivers/platform/x86/dell/dcdbas.h
+++ b/drivers/platform/x86/dell/dcdbas.h
@@ -42,7 +42,6 @@
 #define MAX_SYSMGMT_LONGCMD_SGENTRY_NUM		(16)
 
 #define TIMEOUT_USEC_SHORT_SEMA_BLOCKING	(10000)
-#define EXPIRED_TIMER				(0)
 
 #define SMI_CMD_MAGIC				(0x534D4931)
 #define SMM_EPS_SIG				"$SCB"
-- 
2.56.1

