Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056824CE69F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978537; cv=none; b=ACqJy6lRaM43tFPhc/PGXRZV4yCqkkx+JHds4pWzq0HQSlKx0PAMgUIvo5OHxyQkF42aEgypS/mAW7nFIBwhyOzagVzNNfB2CO873Fr43vQRV1a/lHcRf03rF25Ybw+kKRt0lKKrMpwz18sPjQxMbD9wGVxQTt5B/4C2t4FRidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978537; c=relaxed/simple;
	bh=B1BhwiUQ+2SbiJJEjS1Q2I5bIuXz3H0WSmOK6XPLouA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pnFO88ch6B+ImKYzkXI7b34aEliiK/mDL3x5wDJ2hWvh9pVkMJMFQCUd3yB5z6BuKud+jmeR/v3+jIeIAT5NYr2ycmMTBDBfgXOtGWbLySEAKJ4FJvMN2GzOlFXJ6k0QFUjRnxE1jTC/WtvclJLU95xRwH9+w4Rxw/ZYux5/Xh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkO6vnHL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkO6vnHL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e82462a3f1so4887985ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978526; x=1792583326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGZ7lXpMwGCCG5sKGnDsUSjI7naLKPxMxGZfTR/Ppl0=;
        b=WkO6vnHLG8rh8axtsSiZ6Zpi8d4xPyZwiRb+wvEFD1+Z7+GkDLnDkjHb00XlwnK53K
         00GYkM93cCWcp3BUmU+OaEu3F5ZNeszi36X8r0A2KXYxM6YXYyjgI1CPqX+5/nHtB87A
         e9ejM1IGkSZD1rBPRGEuVi82VsiEBu3qowdMr4Nr+lO6eVwm4MzYn9v0tWpS3lzBl5gD
         o8ihNLi0JdgRwmr63tV99BEM77TF5VwOZF6lx40pYDfanmwkkV6O9yfXGqNN1eAJBZTB
         nMexuEI5zThzMkFm7hsX3h7AOSwJHlvaH76UGgKYw0LKtTD9/qAVRBEYPsE3w4BbLzBx
         cEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978526; x=1792583326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGZ7lXpMwGCCG5sKGnDsUSjI7naLKPxMxGZfTR/Ppl0=;
        b=e6l2ECYTwdIW9cTidjNs9jlboP9jjmcQ4iN54xSXSaoRkUMdRABLpWcfNI14+AIEC8
         vj2FLFpOPD1sud+X0McVHAkCUNDHR5vL3VkY8c4CFFNMrpnoQuj1xV9Brcq58cUa40u8
         hACfkkmYErjLvVgdJzNYEtfG0RPZ3IGYu1jNr5xuV5TqiluJXcXu2zRl/4wXtJjoQGgf
         lMBLg9oh9Qu3XtaHp8Gz5oZE2s7Jdo7QW3P8wUMh7vfbKBU5vHjlxz5y2fkdMfHeeQ5q
         Wnf8CYTac1kkwaL9gY+bsNNKtHvFZXOykqhiRVuErCu9l2b3LLGGfq8M/4CI2LXfwhfl
         5FnQ==
X-Gm-Message-State: AFq9FYKaFXi2jVp4MPZjupWr4tOown7wqC3AVskr7mTYSovGDv4HHXY2
	EYyUHL0HTS0HE1ZCuzu/SQBzYotVp6B7YgUo1ZoBbiw0Yo6SC6Id5OG0
X-Gm-Gg: AYBFou2IotOc+V9p2Ishvm8A5c5T1LOmukSaCyVNvC20i7e7SOjautpXXfGQLkEq+xh
	5RycL0YSHy+GmLa2Obj8AkqLimoYT/liz6lS3M/aykJu2n30fySMIQYTqylXucKZhQLaT0FtBIk
	WveJ8cKtwjCcIHg8dSsZcwn38RWwAigjFrF0fJgmwyhihjQShiFWpghxK7eXB33kGggUpvf/gTS
	LHYn21mQ8PRh/Ddr9HR6lUi1l+sDDNtAGHnGS4PXx7JqeI8DpDEGJtTQwkF2rwHbxGcEYmZNJXi
	XwgYvSo8v4bU/cABS8bFYEEHck3ADQ7lVouX7NhPsHNk2niaerXp2uiGgvgDoyeU5op16ZCyIoj
	783wai6b9E0e2EH6oDBbap27ly5qUX4MOFjxpLZs/j3sZdr+2Bd2t9v/Q4MIkHvxf4YyyCKgdFj
	0xDJxmKHs9J+KbQNRMM7soODGC2lNfRGNVlDN53qU19zRPO2T/2WqWN42iY0XRHUzO6DQshHVCV
	B8c0PXV
X-Received: by 2002:a17:903:46c8:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2e842cfcf11mr131739435ad.47.1791978525818;
        Wed, 14 Oct 2026 04:48:45 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm68643175ad.66.2026.10.14.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:48:45 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Avoid unlink error on first run
Date: Wed, 14 Oct 2026 20:48:25 +0900
Message-ID: <20261014114839.6258-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the first run, ftracetest tries to unlink a symlink that does not
exist.
Use rm -f to avoid the "No such file or directory" error.

Fixes: 7dc1e125f07a ("ftrace/selftests: Add softlink to latest log directory")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 tools/testing/selftests/ftrace/ftracetest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 246d7e1d015c..95804610e079 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -243,7 +243,7 @@ else
   mkdir -p $LOG_DIR || errexit "Failed to make a log directory: $LOG_DIR"
   date > $LOG_FILE
   if [ "x-$LINK_PTR" != "x-" ]; then
-    unlink $LINK_PTR
+    rm -f $LINK_PTR
     ln -fs $LOG_DATE $LINK_PTR
   fi
 fi
-- 
2.43.0

