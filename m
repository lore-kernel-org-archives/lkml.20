Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4335F184
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432479; cv=none; b=ixEzP2jvm6g4UTxGJlqWVNWIn/rWisCTae5RVCwdodnvQEs78zD+zjkECtoORoGKe99JC+7OOseBTJbuEt32y7Q1+gWUntt3WgVumzRYEb1gFe1XUnRFokZLQpEipjblbEGt62WkJRRmLu42OdNCPRsW8fiJVHtqRPTWZPK679k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432479; c=relaxed/simple;
	bh=eN/CZ0g8dEhhAB4TCIZ6bYboNzAcetSZ5y4UbmprSTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXAxSiziSYi5fJywZsktNDKq78qFGJY+dcnp9MNcA0DC4dMP3PudiwkuDr/cAK3V/hbutQKqKPKnHQ9jSkUeTcZ+4njlb1X4iNZ93SYT8Xv9+cq4PnMp5P9D99O8Ci+fVfa0js/JZoJyR82ctZfgs8GzgaocEAfaOYFQC4Uf7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwt7N5aq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwt7N5aq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so54447575e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432475; x=1792037275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RXN0pRoDPRt/4/q4G7QWKtdi+MOFx+4+xgS3NP3upU=;
        b=Dwt7N5aqm5cYyDc+huAxA+bLXtiDg6jeXvEFkMg+ckSARoR0cYQeAG5KUuatz6Whia
         DviSzTI5DvX07Ci7/9M1oIBWOp5/+tvj5oKk/ghkCBwGZDMGlSVF0a2C0kgsxjJNUdO9
         M3nXtMPY4Nb62XKtRO0ewmUKyA5167h5X+QBwye1Q39eGPnDG7xtiX7ULXKd0rUB2us6
         OZ+3x8ckeZFfZzHDEF0xtEVHsyJKF2JOwN+QRZC1JQ1o+0E+j5LbZZUxB8kC93dJCHWI
         gZncDi/V3Q3u6jmCzMO1po58UHwtvhhq68zNa5iAzukzs5ijvtq3rGSXTAsHPkthPEBH
         M0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432475; x=1792037275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RXN0pRoDPRt/4/q4G7QWKtdi+MOFx+4+xgS3NP3upU=;
        b=Xp/ODYzk+pJ6guhmICIJrJ5D2Fo7xYiDWD75Laj3yH2qIBxrl1uCzAzLxeQvjNEvXq
         4+yYLg3hCNXEB8rMz4qmdv3xLw6ItuiukAscAezR+fQIWDYZCQ/Nbt8rqCYW5Ds8RLIm
         vtcoMenCcS63n2t5rKObJZzCTmjt4d4iudbH9hoOsZc4s+oAzEH2zD6sUfS36u33F+hn
         qf5HH5Ei0++jwk+GoIN8T49V/wfcDjgHMCQnA1QSEtVOHZJxEcXqs6/hDX5p+aYYb/K5
         hs0SPOXgbeUs6Uzoz5lZ4luexxjF0sI0H6zifCdxovV828gHhyx7VBmwc4m/v+xqt68k
         LiqA==
X-Forwarded-Encrypted: i=1; AKwUvBx1tHasdo2xjr2bor3cwd3NdLUMN9QWa/ys+mWwfBOnsXDxnja+YDgeI0QgwE4SLkzxXKHKZP+7bYo/9f8=@vger.kernel.org
X-Gm-Message-State: AFuF++nzQJ4n8KKgOVGevBpqdHaeQ6sxScyo0MUiCzBhlF2vaAHDrm3u
	r5pbxmFImZ3+8O3zaDPtyUIu+5/OECu+MySbIWWScVrxM6c/nP/rC08P
X-Gm-Gg: AYBFou3SWbroui7D31RG36pdsYn7MKlYKOoDrEmxMqPo7oLQj7ii+D37njsG8uS8xTt
	68YKRSYaSjIeM5U0MRZcHIHbK+TeRW9nawbX4PogpCw4GpNBTTwo99Uj2RemTWzHpr3n62TIAAt
	6I+6qgyBz7i178hx8cjAUR/+2j2M8xOaH8x/Y4DHFjgTkVgCcS64AWYwPIHj8M1YuXm9y12qWj3
	270kcij5IM4Az6TXLpVwlY1xKruj0jrziPDjgJ5eTA6htiAcOwk+z3GOH6jpFsE9cSVw+fiXdin
	XagWpalLKy8FEwqI+x4QmNUN8LtlGcfc9bpvYbuFM33sWGGK6KCE4tzyafSJmyTkPkNbQKC25EB
	BdY3CoNUMxugE/mmxpUWkaJKyDpi4XF6dQj9LApQTXXKVWV3OKDSF2I/OZL5il1szlxRTZwfCzr
	d+N9HShrzZK9quPBOfmxPuN2oHn9sZVovzZKTf4TVtdPmV77LKjkMbdYm3crc+DuaStmA=
X-Received: by 2002:a05:600c:c165:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a181b33928mr74752385e9.22.1791432475504;
        Wed, 07 Oct 2026 21:07:55 -0700 (PDT)
Received: from arch.local ([105.110.78.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm91191145e9.4.2026.10.07.21.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:07:55 -0700 (PDT)
From: Akram Boulahia <akram02st@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	linux-pm@vger.kernel.org
Cc: Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Akram Boulahia <akram02st@gmail.com>,
	stable@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] cpufreq/amd-pstate: Don't fail active mode init on read-only auto_sel
Date: Thu,  8 Oct 2026 05:07:05 +0100
Message-ID: <20261008040705.10600-1-akram02st@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 9dfd13f80c85 ("cpufreq/amd-pstate: Toggle auto_sel in active
mode on shared memory systems"), shmem_init_perf() no longer returns
early in active mode and always calls cppc_set_auto_sel(), which was
needed for shared memory systems. However, on firmware where the
Autonomous Selection Enable entry of _CPC is a constant integer rather
than a register, that write fails with -EOPNOTSUPP. The error is
returned, every CPU fails to initialize, cpufreq_register_driver() finds
no policy and returns -ENODEV, and the kernel falls back to
acpi-cpufreq:

  amd_pstate: failed to set auto_sel, ret: -95
  amd_pstate: Failed to initialize CPU 0: -95
  ...
  amd_pstate: failed to register with return -19

This was seen on an ASUS ROG Zephyrus G14 (GA403UV, Ryzen 9 8945HS, BIOS
308). Its _CPC tables are revision 3 with the entry fixed at 1, and
cppc_get_auto_sel() reads back 1 on all CPUs.

If the write returns -EOPNOTSUPP while active mode is requested and
auto_sel already reads as enabled, which is what active mode needs, the
refused write is harmless and initialization can continue. Any other
failure, including a refusal where the current value does not match the
requested mode, is still returned as before.

With this change, amd-pstate-epp loads on all 16 CPUs of that machine
without warnings. amd_pstate=passive behaves as before: it still falls
back to acpi-cpufreq with the same -95 errors, because auto_sel stays at 1
and cannot be changed.

Tested on Linux 7.3.0-rc6-00037-g7b63ef2d55f2.

Fixes: 9dfd13f80c85 ("cpufreq/amd-pstate: Toggle auto_sel in active mode on shared memory systems")
Cc: stable@vger.kernel.org
Cc: Marco Scardovi <scardracs@disroot.org>
Signed-off-by: Akram Boulahia <akram02st@gmail.com>
---
 drivers/cpufreq/amd-pstate.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 8bfd46d60843..05b496946d13 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -500,6 +500,7 @@ static int shmem_init_perf(struct amd_cpudata *cpudata)
 	union perf_cached perf = READ_ONCE(cpudata->perf);
 	u64 numerator;
 	bool auto_sel;
+	bool want;
 
 	int ret = cppc_get_perf_caps(cpudata->cpu, &cppc_perf);
 	if (ret)
@@ -518,14 +519,23 @@ static int shmem_init_perf(struct amd_cpudata *cpudata)
 	WRITE_ONCE(cpudata->perf, perf);
 	WRITE_ONCE(cpudata->prefcore_ranking, cppc_perf.highest_perf);
 
+	want = (cppc_state != AMD_PSTATE_PASSIVE);
+
 	ret = cppc_get_auto_sel(cpudata->cpu, &auto_sel);
 	if (ret) {
 		pr_warn("failed to get auto_sel, ret: %d\n", ret);
 		return 0;
 	}
 
-	ret = cppc_set_auto_sel(cpudata->cpu,
-			(cppc_state == AMD_PSTATE_PASSIVE) ? 0 : 1);
+	ret = cppc_set_auto_sel(cpudata->cpu, want);
+
+	/*
+	 * Firmware may expose Autonomous Selection Enable as a read-only
+	 * constant. If it already matches what active mode needs, the
+	 * failed write is harmless.
+	 */
+	if (ret == -EOPNOTSUPP && want && auto_sel)
+		return 0;
 
 	if (ret)
 		pr_warn("failed to set auto_sel, ret: %d\n", ret);
-- 
2.56.0

