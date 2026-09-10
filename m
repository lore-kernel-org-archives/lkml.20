Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FBB5632B6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063003; cv=none; b=XDcM+PfhVjEa/p9fds9IPJuesgKw674EbmMSdzXUpggCcgnTGR3ifiAQhT05fnwbCAXMMeCiV78TbW/7Veq+M6f0m1FpAdkA/gw/jqg+H35ZNpMmlRQhW1cFUNt04XHTjAvpcPPErNjLEq4OQ2lyJ8FHEWNxcdkTcrTHUUBo4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063003; c=relaxed/simple;
	bh=vaBOM7gJFJP/iDNYbksPS4xPwihltpK6FFy2L5l2j5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=LyJTM4ZZhCWcKJoMd8nWKc6c43wH2Ll9VxIKpiaH2P742t48Vl+VIgpCpiBlnY3qCsgjihcsiFEHjNogn8saNAFI2CmmV5giZReNBxHib+MRWEvzjZNMe9nhphcNKbaCILS+VnOJwO4Po8tpK5liX8zSB3gWoiJz+gexKQr79vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WCYtnWaE; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WCYtnWaE"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso9657808a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789063002; x=1789667802; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnzBeOHTZJ3ZGeQaPHN7X7+9Lkvg1S3DJgXkiyBoNCg=;
        b=WCYtnWaE1kA5HTFfLxCC00A7wyHFRtLsUy1Z4xpd+aMfOPZO3DW7P6VUAHUtjNNhof
         3FJjaVw3k9ciNiVYYaKVVNkpcCKpeDmJWZutNiChUTvi5qENuFDgu7XG1ANmcyJK4d+4
         in8lUQ0+/a6FbVkYRwZK6rX4ZnMJJ8UOf3GD6DYCayWp0sBCCJdGyaF8D1nR/s2719us
         8hUrLkOLBKs5YNhMPN3Sht7Dyswa2WXv13ccAmCvyvoGdfsQigcHu0ZEJKd3b5wbhYDp
         XK9n4uMIFJc0IyoWEHV5RlwS8bp5j4ApD6msH/baPQfpbnb8nlFE/TqTzoU4QJEykrkj
         d+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063002; x=1789667802;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnzBeOHTZJ3ZGeQaPHN7X7+9Lkvg1S3DJgXkiyBoNCg=;
        b=QgvwShHDPtVIPdhZBUxp+6W9tn7KQzmau28jzdjb1i8SypJV65VT0yeeDmTESQ2vMf
         +dXGYnYVCSU3qRgPWMY3lNWhltF8Zn2gPAcke7Jopg4UnwgmlXRo+gWd2tjkyeFEBzTz
         wlamU1BW13Qvqa2bX9A6Dol+vekcSY8n3uYKS6Pnb9LdU0lXODyLBAigf7pCrqNM2d7p
         mwLEHxBvVM6vzJcVaP+4bRR8y5qROycgYqGvkt5OvH6cZkuwwaawLpYwwkFGJx9ir/qm
         6DIOL9iDj/ef/l1ZlTOpLEO0YwVFGi60qh/Y8oi0x/X0hWgahkTM8VP6P2sbpnHpwtHM
         v29g==
X-Forwarded-Encrypted: i=1; AKwUvBxOTJry+NTizKuToRmfQp0bNW4moA3t59L7to+Ka6MfkPrO8MueNDNybniT1HmCcSN4rytX6P9BvDKmGog=@vger.kernel.org
X-Gm-Message-State: AFuF++mgOwgqJd9k8c82NM8kkwXWsi2s8I4aASSjYnyGI2suPQTuINrD
	Nse1D5KNHq8rLUdrNoan8XgReG9u0bBqeE+CudMNMFRXYfskxSjxO7RqzHb085VeUjhw5s5WKFG
	RMyEaxYE2Dw==
X-Received: from dybdb32.prod.google.com ([2002:a05:7300:b0a0:b0:33b:9d11:a879])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d88:b0:39b:92bb:9ef0
 with SMTP id 98e67ed59e1d1-39d70b46171mr11858633a91.20.1789063001455; Thu, 10
 Sep 2026 10:56:41 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:56:34 -0700
In-Reply-To: <20260910175634.3014018-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910173715.2996571-1-irogers@google.com> <20260910175634.3014018-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910175634.3014018-3-irogers@google.com>
Subject: [PATCH v2 3/3] perf header: Fix potential memory corruption in cpu_cache_level__read
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

strim may advance the pointer assigned to cache->size which causes
later frees to crash. Fix by performing the strim and then memmove-ing
the potentially shifted string back over the original string. The bug
was introduced by the transition from rtrim to strim, as rtrim
wouldn't move on the left.

Fixes: 13c230ab6e56 ("perf tools: Ditch rtrim(), use strim() from tools/lib")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/header.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index bdd79d7542ef..78b16a098148 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -1267,7 +1267,11 @@ static int cpu_cache_level__read(struct cpu_cache_level *cache, u32 cpu, u16 lev
 		return -1;
 
 	cache->type[len] = 0;
-	cache->type = strim(cache->type);
+	{
+		char *trimmed = strim(cache->type);
+
+		memmove(cache->type, trimmed, strlen(trimmed) + 1);
+	}
 
 	scnprintf(file, PATH_MAX, "%s/size", path);
 	if (sysfs__read_str(file, &cache->size, &len)) {
@@ -1276,7 +1280,11 @@ static int cpu_cache_level__read(struct cpu_cache_level *cache, u32 cpu, u16 lev
 	}
 
 	cache->size[len] = 0;
-	cache->size = strim(cache->size);
+	{
+		char *trimmed = strim(cache->size);
+
+		memmove(cache->size, trimmed, strlen(trimmed) + 1);
+	}
 
 	scnprintf(file, PATH_MAX, "%s/shared_cpu_list", path);
 	if (sysfs__read_str(file, &cache->map, &len)) {
@@ -1286,7 +1294,11 @@ static int cpu_cache_level__read(struct cpu_cache_level *cache, u32 cpu, u16 lev
 	}
 
 	cache->map[len] = 0;
-	cache->map = strim(cache->map);
+	{
+		char *trimmed = strim(cache->map);
+
+		memmove(cache->map, trimmed, strlen(trimmed) + 1);
+	}
 	return 0;
 }
 
-- 
2.55.0.1007.g17ff1f9808-goog

