Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734F175A9D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525613; cv=none; b=plV87El21CeZSi9JsjI/ff/YNCdEqQSifW2sjjGhZgTJPNdYnnxsP3nQcTXXZZWFUU4DvvdyRaD1klGKxW0V/qoyNekcdhLgfCfp0keMgpU1AENdbg1GcMlycbm0jP60jopmaRulqeJr0CIDxKxO8fBkOMCS3nRVdHzEFcxyLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525613; c=relaxed/simple;
	bh=uciYnRl0uPEr9p8I1LpuzJ9pEw6dFHOvU/IUnVUXIBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5fzKwK8FWMs4eFINFg7H4SyJYAXQY4dbUNObMylPs7HC/WmUgBat5/fAEaEkjzvYp5Gfrrd2AABctxgXfr/h6jL3oD1uUkHbWmq9R46664ZGM3uPfcv33q5Hmxg9NAJ8PC0alPVehPmAF0LDcYK9eegZjai8m2hcnUnAIg7aHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVclztb1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVclztb1"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b39befc6a8so547203b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525610; x=1789130410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnWviPGJcuOpwc58xe8Mm1wrm70qy+paoU9rlvZTyTE=;
        b=YVclztb1c5sOzrhOaBIrLUA+ZfaX4foHimrnc+XUzr86F6iHGeB0DTo5+Jp/0rtbSH
         GlhJGSX3x0hb3lScoEOkmH7rYcxjItGv+EIKOxledGJnr8Dz7k+2OZQbvGBVrKXSWfqb
         umS2PGCEZfQf/YFh43W0pCw3Jypok59CNxURXsYGGGhPqH0TvQe4cyexuHjP8uWEu6YO
         pX5YRBFuTDeXjN10dSNX+MpZCH6prNmD86ubRGdcL0Kpf7OgwtVoDB56VqpNvCQgd/x5
         X/K5hNAA9MjePqVC9ZqKjdK9IgjLdCswO++8ZRGFVkAxuNGFsnvew4XuF+kkX2aLIHks
         WNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525610; x=1789130410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnWviPGJcuOpwc58xe8Mm1wrm70qy+paoU9rlvZTyTE=;
        b=Mrhdm625yKJjU53hQMz2JdBYjnp6op0Oc+9S2F67u53YZtKXTavs2vEag49klhuoPK
         tlAQ3IwuYWhfP6EWFrvfdG1lNcddwT3P+SUR9NBHREavHrSIeWgCIptgQ4/zHMlJz8M/
         VFjEtfvlxCI+YmGpMETIqZtcwLvI1gbbPYC7T+l2gt19R2PgAOIqW/cmGCCGVV3dHins
         E77ptTneWzZJwKKhDJzTqlKrfDJrfMo5a2hJSl/e6hmvRPv0xmzF94z4ZbF/KhQi7ssv
         HpBOuVzXZ+9YfMIj53xY6Y/ZdaAga1VltouJkxF7xbLeb8+IPRP61W9yX8VolysTXPrs
         lAtQ==
X-Gm-Message-State: AFuF++mgGqkTa0L3wZFmXmc/HNilCD3NArB7PnYPLv1pqqQqOKUPWSPX
	Gyd9jA+u8FyEu+QGRtIQOoSmrh3Ytu/RC3A8YwKSHv+HmHpsD3/oncfD
X-Gm-Gg: AYBFou2g/V7kjpKr1QsGYKQ9i4eYUXtpAIIQbbdBaFke27f4WMZY+29HCBaWw+1hbLx
	3PVzN9OYatbanmd25KpozOhQfeyUixbR0lFl5mK+cHffB/omkUPVfZPKFFi45UihB1wKnENscUP
	t3np0WvHsFCSZCcHPupLrj+rrRoi29kwDWCVODIkwWPvJp+spuFGoaD5oZJdZZc8h6z82paAtYp
	hIusHpf/Zc0a2ZwO3nwN4XM3yDFNX3A70FdAK6+HTb3ssYQMgkSGDy1Lz8DAx/3ILRkOFs5fgF0
	thsNblWg00V95oWgOxtwBWJfhVVjECnkuElEj+WN+KJ+tzd9pWXEAu9GRU36BR9bFnsef9sX92Y
	jQHDW9loNjFbbvk0m1Vt+jlSNnFlj88TaJNVM/9U7fMSHN3GTdZKEeIQ2Y140Zc2gmn4PFMQC4P
	WilEvnt3IZQRre8kmJV3uDU6p+7Wa0+75yjqkCtVuIJ+5OcuYqlnD2jVuamu+RVvv3oLSmuBR+d
	8r3xGzFt9DW3s4=
X-Received: by 2002:a05:6820:c97:b0:6b3:5475:4861 with SMTP id 006d021491bc7-6b6fcbdf251mr3392454eaf.18.1788525610251;
        Fri, 04 Sep 2026 05:40:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm6667107c88.8.2026.09.04.05.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:40:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Renninger <trenn@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	"John B. Wyatt IV" <jwyatt@redhat.com>,
	John Kacur <jkacur@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] cpupower: fix typos in comments
Date: Fri,  4 Sep 2026 18:10:03 +0530
Message-ID: <20260904124005.3270-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c | 4 ++--
 tools/power/cpupower/utils/idle_monitor/mperf_monitor.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index e8b3841d5c0f..b15371e3e6bd 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -72,7 +72,7 @@ void print_n_spaces(int n)
 }
 
 /*s is filled with left and right spaces
- *to make its length atleast n+1
+ *to make its length at least n+1
  */
 int fill_string_with_spaces(char *s, int n)
 {
@@ -263,7 +263,7 @@ static void parse_monitor_param(char *param)
 			 "try -l option\n"), param);
 		exit(EXIT_FAILURE);
 	}
-	/* Override detected/registerd monitors array with requested one */
+	/* Override detected/registered monitors array with requested one */
 	memcpy(monitors, tmp_mons,
 		sizeof(struct cpuidle_monitor *) * MONITORS_MAX);
 	avail_monitors = hits;
diff --git a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
index 5ae02c3d5b64..62b8cfb02040 100644
--- a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
@@ -276,7 +276,7 @@ static int init_maxfreq_mode(void)
 	    cpupower_cpu_info.vendor == X86_VENDOR_HYGON) {
 		/* MSR_AMD_HWCR tells us whether TSC runs at P0/mperf
 		 * freq.
-		 * A test whether hwcr is accessable/available would be:
+		 * A test whether hwcr is accessible/available would be:
 		 * (cpupower_cpu_info.family > 0x10 ||
 		 *   cpupower_cpu_info.family == 0x10 &&
 		 *   cpupower_cpu_info.model >= 0x2))
-- 
2.48.1

