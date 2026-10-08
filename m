Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F0392819
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469621; cv=none; b=L8x55p02thKk4mRgPS+luZrk9pPH3K7Tt5ZAWiFtO5p5rkAN1zHj7AU6tMnfLUU0/VYgRNi2xQyJ1t5hVfMyM8wXsYDTwG2Ssg4bSwXyyWV/a/BHl84aPDrEyIW/KvSLOIaaDOIqwijpvNRh1xP0+gnVEXahmVSBI3RtwqyTR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469621; c=relaxed/simple;
	bh=Dzp81zKH00fiouFRLt+kpVFgidfU7yX2stkNLfmz3/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsyWx0bXXK/VV0l2N3qvrS443AHaF1O94A/4O0pm2/X+KLwhA2O/yywgY4yJF1EVj9SO5oVdLt8XqitL5P/CcHxbzssbZGPuCL5vf+JV2Oq1wNFUnHZPTJQDjzFt+ZlJu6xAFamRehNUsk/sX1/firaIYRjzBC1dPxHdsTgvPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPg7xpSD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPg7xpSD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso22708145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469619; x=1792074419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNF0o9YXeO0p9stG5/R43z7vztlln4NrtxYfCDjv5q8=;
        b=DPg7xpSDrLvIC3D4pLRjCePsa+WmiOsuPo/e6ygB2XAE8dBOKICpx76FbYl8v23onu
         n88PJdkDCZpXrR/hEdDO74YNn1X3+IKXqzAeA+HR/NZzrXXtUObRE45Aqy2aRQArFYQA
         f5XxjwAZ5XDvvOR6sMneffJT/CjT8apyO1GEb/KwAxzpDljF+FVPCjeLrAc6SIcpX5HC
         1EsoF/Mc9vswo0wxbAbJlePfoqT0yptOLgCUExJTImhU2jp7USb5guyu8AUE33BhNzL5
         JrphNbn440j6IVit0ZXkSKWgP31S994QwkdZ6IA6e/W5VlICkI4Bp7EzkPdgBT7HQKiE
         383w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469619; x=1792074419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNF0o9YXeO0p9stG5/R43z7vztlln4NrtxYfCDjv5q8=;
        b=1sji/kVsfLO+rXkidei7q3YkrVB7bIubS0MEnOxIgTucC5B7pLbUgC/v91sZvoyfB5
         5oS9GwCKq+hjWsYycnF58a8qlV900J3sADnTAkjVfDQnHjKwnAMIiPMDnOFBOhkeVVJM
         LFFnHYaUXb9cjHsVunTPPUd29jXduAAbLhwNBKcfVGEPMKrBZcmAvrrGd392j8o1RUqJ
         enSl7H7TxWNfI+NZKTpSVw8LhS3bk6idPURz1lkL0E5GCy6Z+5PqDfRir0gFdEJ/MMvU
         eDq9oljEcoNPelg43qM12HGQOdRFQxe7arKaBYiN/dbA+1WfngFdyY3OujnLSlmCoAzy
         2Wfw==
X-Forwarded-Encrypted: i=1; AKwUvBwmtsUtpoZST+hDsMigubK0UjBRLBtOTOS1T1VavN1Et2YC+qFXADLn9ulVveAIN7nwrQSpbHq9Cy3CadI=@vger.kernel.org
X-Gm-Message-State: AFuF++mOD+9zFpDyAECu8D/xuKPbtuUbGzwC6tPaxQNdWEMfvhvnFIA7
	mI22fuoV20J2NPScMnwdqt6oMFFPf1HdbCgMW2U817YM3p1vrRhfpV0A
X-Gm-Gg: AYBFou0ytZpVlAe7iV4CC0xM1COyhkEriez6rmofx99rv84XROqRkwDDddhcUE2FlLY
	bv3Rv/OkHbFsVzzxkqy1WYQSdlz9HwPec15MZhQEWeO6LrVIcsLH8jfSdiXxnW4cBlsa2kJTwC+
	C95XdRsDNFOq4Vyk4wQqM01WPDsSU5rGQxFN4LNdRTtpJCk35Y4zmiwbXX7yg50p8nAWQEYgk6t
	qdVV/glo5//trTWxsSEZsaklIVeAXEuOJrexgceiFd0D5wIZRYCkDnS1QSnjUSIZjXfsfflNnxW
	pBWC1cavRAJrfgZzjcXQ4f/Tmw5Bv1BshHoeX/FoHjou5ze3FHTqQF6fuQEo9j5ek6gE5745U6O
	YhNgdCvXAhQBLN8gVjaPPF4T9BIUQio0Edyqi0KmnwlN6Lug3LscHlgZPqAP3hNWQEZqnwKFxpW
	kDCg/8UeP2RDL/AyeYOBBXXsMcGMuyPIDur3+bnzSvdtMX9F6sfjwie9iFN+O9WPey78MYaaatu
	QyWYjui/1K2bYexbb6AxTU=
X-Received: by 2002:a05:600c:154c:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a18043c4a6mr107513645e9.18.1791469618401;
        Thu, 08 Oct 2026 07:26:58 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb256sm67266125e9.5.2026.10.08.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:57 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/27] selftests/landlock: Fix the reported clock tick rate in fs_bench
Date: Thu,  8 Oct 2026 16:25:35 +0200
Message-ID: <20261008142604.39107-8-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since time is measured using times(2), ticks per second are obtained
using sysconf(_SC_CLK_TCK) instead of CLOCKS_PER_SEC.  (c.f. times(2)
man page)

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index 78d1efcb2d20..05082562d272 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -32,7 +32,6 @@
 #include <sys/prctl.h>
 #include <sys/stat.h>
 #include <sys/times.h>
-#include <time.h>
 #include <unistd.h>
 
 #include "wrappers.h"
@@ -206,7 +205,7 @@ int main(int argc, char *argv[])
 	       end_time.tms_stime - start_time.tms_stime);
 	printf("User  : %ld clocks\n",
 	       end_time.tms_utime - start_time.tms_utime);
-	printf("Clocks per second: %ld\n", CLOCKS_PER_SEC);
+	printf("Clocks per second: %ld\n", sysconf(_SC_CLK_TCK));
 
 	close(curr);
 
-- 
2.56.0

