Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678004;
	b=x4DvNf6IbZk4Ln+234CLyOJoztx0wNqgYAlet6q1rHXz9k5bOdhuKw5fvBzqg8B1cOr3
	 OdIczpUsSJw4pXegtFUAf55Cbxos7oKU8Yei2+SNuPgga/pxnvTHLjgVI7oE/hNVM4WdC
	 LFgqlqWHC/2itTpNYTlWQAuo2cOgv87ZDZIQJcw1tflFaMlgelqW9Q3sH3POtBPk2nQqS
	 edma6IKB+JuAPfu4hhatovM/XEDZy8DrjS3/bGlmmLTjHs8xuOi8ZOAhiSfY9XpjYYKl4
	 XcHEbvYaZTOgk0flD1hYIKXKhLy2Fl/96NiPBDAjnbXhZeMzYA3Zz137CPHp2cTUzgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
	b=kB7FvJ5PbewXtpwlBP6YCCTM+KM1a9mVGaYKmclCHIrW7B+I9/dVPB/vd32lFRJhzMZj
	 OHYrgKqddvvH3RgiXjFeGHSDlL5xPdINrFm4NRYeQ3/QBiin8S+qGXbshlSrSRkVslVuw
	 nWQZ4wH9Bm8pC60KG7d/g3YjdAbYRiU7CDW/IOjv6gdY80eYbQCMCzbp7fF2S3xWvrC48
	 c+uGtb9xhRHP+pCFJW3m+Vitz+CnsM6dgvO8KEFdUfS8D70zc0x1ESyO79XiRzH2Y0cYM
	 OhgId3pIBTPlKnMA3DUAP6dfnszLWnudw4auGZdOd5NTEkcXkZ28i60ZIYa/uz4flHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1260A261C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B1260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67bf3c6654fso2130207d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678003; x=1795282803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=NDe3mNXQCyKWUsPt59T+7jGbsgmo5mW1rT6AsgZyh92OB21xDOtjpHJvXNkZ1b/3ls
         Yo27iCN6LI3Ky2Do0u3f3eDvQX+7XCJM2Ri18VIQHGTCYNXz3lQl8gZclD8JLArc1UD4
         YB7SipA/xm451JLDYpO2IMY31S4xnqURwQZnqD85NYbEKzlnAyDVPjFAxXSCmdIFmYZb
         Mvl0W5rTQwYG43dUOeHHPeDVIt/TjOisCzi0vzHmfkxd4BGsxrJt7pWvoo2PrXlZ/2gI
         6PmxtuWoIZvKvFKbPUubTPA1Sw+CcUkVwMKLLvOpn6w3pdNtcf02S1OLoEsvFPNHj9j0
         0RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678003; x=1795282803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=SpOBwgO6aanTkEKj2hlwZ1Y78SZnmiVoukxNrkSSFQGRzszjw50+yfGs+X9nst+SVm
         EBOllUczJTutIjSi+BBTTL2OS50ASuS9B0Rjkq7VkHBv1ZX7BQysp6Nm++0yNtYlA0Ji
         6iD+VzIpul1dpT3KXHGtvWvQD0NGg3Eh9p0UTbVK+2e69UsHRJgEmjyG+wZ5y9pWkis4
         IoIdrassJIqvQXUmS066eaa8rftH7OMSJLY+Ly3Q9EQt23fDvhlTYSUldxgjQie3T9Qk
         o53kFnJgWnvcZZrKxDyLVwieJocAHHJDPjqfh2v85ato//59bSlW9DU9ULCHgKBXQVFs
         YkHQ==
X-Forwarded-Encrypted: i=1; AL+hErHwxbEPnr1azNUJYoUzG4ytqYn+cayDWfpvbB7iR0AmFcNMAAgxHKjIPLR3PG127VfPYis7SxlOe2JtFlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W3SvXUSIbjzlhvxhiKUxFPmXnkb3BRu1aV28/VbNesLiRqdZr
	ynTUCXDFOkBcsvmiLP1Gqk9wVbbvM3nTZHDyZPsBPmzuuX0YbkMpIqOO0y0rb0KWaEg=
X-Gm-Gg: AYBFou1SY9g6Wj7SrcCrzxAdVWZMcId/Q0bx5/HEiwmYA2vacobCFomvOLP8kGvvGGJ
	UBTJODsoZpFrtzBBX/WYtu6eE644xYtdtSfhw7URI38ZnhbvrQMI4Ta03nlDdGLvyz4aF2+vIy2
	Zk/tSqFK5nPTF+Vby5Z0JGCRM/TQXE48TW5hPYoQoNSRxWdNjhWv0Um8RCSMmoE28cAlYU5cjZ+
	Xe4X/nPwGrWB/G7wHISKyTKMSyqcFd0Lt+odKFck8T5/x6gRAGZVSRw9Z3/QevrkgPBTYX5uLCJ
	RhqnVw0zrjUYyhSJIpM2u25MAt8D9CwKKBFGMvSHYKeKtrjpAJ0Lh3R28cNP9RJMC7L2O9E/J+9
	GDJ54q9NK32G1G4/lxLJLcNEARxRejm8oshqBeb7Nml77epfP3aygadJvJYZ8Ha9Ymak4UYGyDT
	k98SqvRSFgl0zrZsu5S/Jb/w0Qi8mnn1bUh0mI6HRf6MODjV73LFwsmXbZU+uuSUNLbbD55N6qu
	hFrG9cMiFDl53A+hxtK7njO0Akz3StICt0+iSdEveJyUdmqqTWh4QZZqhE+k1d5j6CcbChgdkEm
	OJ4NTp5s9QO6u7X9MmBOYAL6+H6KF8FFKsd/SjUjbnM3Hh0BxKNglucPurBxHoMaFubNQjkkkez
	GjPLw/2IY5lQzb0RuvfwyIo5gdXncpvf7BSBItgVQiRSFdjQdPv4sz3bd4FVkBw==
X-Received: by 2002:a05:690e:48e:b0:677:cb43:4b3a with SMTP id 956f58d0204a3-67d8979ac95mr2046603d50.156.1794678003167;
        Sat, 14 Nov 2026 09:40:03 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm48618117b3.1.2026.11.14.09.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:40:02 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:52 -0500
Subject: [PATCH 6/7] alpha: marvel: notify environmental events
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
Message-Id: <20261114-marvel-env-v1-6-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kn6qAKEjNgVefdGm65LCAkz/4DlKpjG6hjl3uYO+Iy8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnss77lqeSh2wWmTuuz5si0HdjDcu3iJYONOorrM
 vcfZ+Cz6vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrtK4zMvRfP3jms+
 d67XBGN5n1d9xmlKT5mqfP/6nwNV/Bp9T7ZzfDP2t7OfsvB/YFG81SKZA4/Vi/knVPmLHUhjsh2
 1u1mniPcwEA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 583dca6c02d1..14b05efa6f51 100644
--- a/arch/alpha/include/asm/marvel_env.h
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -2,6 +2,8 @@
 #ifndef __ALPHA_MARVEL_ENV_H
 #define __ALPHA_MARVEL_ENV_H
 
+#include <linux/notifier.h>
+
 /*
  * Ask the console to refresh the environmental readings of the GCT node at
  * @offset from the start of the GCT. Returns the console status, which is 1
@@ -9,4 +11,7 @@
  */
 long marvel_cfgtree_partial_update(unsigned long offset);
 
+/* Called from machine check context on each environmental system event. */
+extern struct atomic_notifier_head marvel_env_notifier;
+
 #endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 46c521cea9a0..6e0b0aabdaca 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -17,10 +17,14 @@
 #include <asm/smp.h>
 #include <asm/err_common.h>
 #include <asm/err_ev7.h>
+#include <asm/marvel_env.h>
 
 #include "err_impl.h"
 #include "proto.h"
 
+ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
+EXPORT_SYMBOL_GPL(marvel_env_notifier);
+
 static const char *
 marvel_env_state(u16 state)
 {
@@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_subpackets, int print)
 			status = MCHK_DISPOSITION_REPORT;
 	}
 
-	if (print)
+	/* The frame is processed twice; notify on the printing pass only. */
+	if (print) {
 		marvel_print_680_frame(lf_subpackets);
+		atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL);
+	}
 
 	return status;
 }

-- 
2.56.1

