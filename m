Received: from mail-wr2-f7.google.com (mail-wr2-f7.google.com [74.125.225.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4518859B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289071; cv=none; b=PcounXloyuNK+/z/pa/35nmgPspRgqd+bHGPB/MJTaPyUUoIGU5BZIG0CqjZTif/TEjPNryIEbFGKc7RG6m++DymzLYAjLt11O4i3+PMBdMVTvjRmK/OpYqqRz3hRee5F9uHtHbA8Mp7POU919GqtIcY/sYDVjjbUhE7Nrcm3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289071; c=relaxed/simple;
	bh=caZTDHt6UILp09QROvQ0YGeBMVOn9q8m9mcI8/xIScg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCfpp2yH0M9ZV8lP2mDf57xG+URBfBNmreOI8j+eqKKXuKsQIvBXHLqS6slF5z5hBFsMxsbJ+Xb2IDrZxWXnJ1QAPqH4DiXVGLrb+JJMsA9SByk2HVrqpCR1A+zUb7EhGe+mV07sojf6SyIph3zHwyB6h/HbWjkJfUVSYazNYJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCcunluZ; arc=none smtp.client-ip=74.125.225.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCcunluZ"
Received: by mail-wr2-f7.google.com with SMTP id ffacd0b85a97d-48df951fd31so522440f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289068; x=1792893868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcLGhS41qDyrPASVGx39Zak2pOFp3aGzMbLkGewPdag=;
        b=YCcunluZXmQmIH7LYN2FluxxcbbuP1wT5IE43wlgbMAjAnH2pA3CJO8fhfdhSxolIl
         UPTDHRkP7XXg7jwBV1h/6iJanroaXFzr6//Yv7e28AD2mP+e5LyansN92+of54BYl/rC
         SDkNVxTy5UJi/hbhAMGwxKjXhW77TdcAFkLsTn2X5Xsw3Sjf0Dh4/ZZcOkp69s60TGD0
         eJVluDeIO5451KCNPLRB37ATWpl10heu57Vixa/bOaUVCkmout0XYUade6EHI9sLj6V+
         tj270ACZKj7BJq2KVFRyt2QC7fC68LBeXmgNOwQ4Ky7jbCtc5u4R7HSRlLw5njLwMQqJ
         9j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289068; x=1792893868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcLGhS41qDyrPASVGx39Zak2pOFp3aGzMbLkGewPdag=;
        b=uTaOuD/+e9nPlELRZ4EpffkUX0pMDengl77sjCkxsH3jsYHrBSzdoxQJvuz3iU8IZ5
         3by37hcab5Hm85FaebQsoakVcPZZBMj9chwaVy5FX1HMl1WGp+amiUOcos56UuiN20TZ
         oX5SR5Qf+Xvg7kKAPLlI2HRJgLUvuUFKlt6qa4txYl2olHDoBZxTiMTIoNZrlyX5OvLK
         mfp/0B4qh86NsnBv/hyG2T4dQkh2EtImGUcN5uQChNB41zLp0ibo9PnxpT3iCAeYM+r6
         n9bSkBrIgSu5vCsgGUcs1d/YGTxI3nE0bpf5uO2COesN/QiCZvtaUxbc0BhIx1KnTHai
         57yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuBJYGAZ5QvYrGQQeSCVEVZlpD5cQzbpQQAIaQYDMEyL5lFoxIXfAwwS9jW8oXE48WdkkDp34ADZ8AgHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyAmg0o0skERZKdNUwAaXxLmL3AasyvThB99kGcX76AQwAdSXt
	/uLFjeUwuZOUjmvf8lespHMcj2ND72GUHnVVoSHteoV/JUDpAaKz9jPe
X-Gm-Gg: AYBFou0BpeQVGcVSNp6e/F1qIibl4N6VWg79spQwQ7UwxMr4SX6PfeddwtQ7VtiXh6i
	tsTUL5Cn0Ynf7uQLajuxqWMsZqEbQgpBHNwS+een9UH5P/raVPwzmpd3Pgv1A0gToP0owDT21GQ
	KtzU/JkDzsFzzBjrfu+1fEIMO9RfCqu876+By4+Hju/XErBT347NEHzC4Lv+SBwx2HPlD/rIqSp
	bpOllY4SOK/JHNFbd7P4Thd4s1AfidRMOoMBiMUHGKIlcMQEsMaUGGk65deOHLple1DGKA7DmHT
	cgkWAHhQPzhlB+hUFuN9wApCDy6kEIk/XYRpZ60B6o3L904kJWBD1mOVpeyLudawJtn5GQxlHpC
	yWaoHPhZm81YttjuZxNeZE/7jDgM9tCmqFyBoTKKaGpeASkbmN07pQ0h5XNsz6V3e/qqBuddHzY
	Ft1oTM7jOTXU6Oz2c4LYC/JgNG7lKg40X35jwErKEtZ+ZKarwXeEN5r68mB3bwjhs34R+pHRQ52
	CRly2a2JxbUrmv2/m6AAlEkGKzePVShayS247ZS9tW7FJIDRaih+I4jzZgtno3ewSiAUztD33Oy
	xYIz8E8g9uVTpT8Jdm0f9wZNwN+9E1vljQ==
X-Received: by 2002:a05:6000:4381:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48e07bb5a24mr8947014f8f.13.1792289067693;
        Sat, 17 Oct 2026 19:04:27 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm15001449f8f.25.2026.10.17.19.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:04:26 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: SJ Park <sj@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/damon/sysfs.py: stop obsolete_target shells hanging the test
Date: Sun, 18 Oct 2026 04:04:15 +0200
Message-ID: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The obsolete_target test spawns three 'sh' processes as monitoring
targets.  The processes inherit stdin from the test.  When the test is
run via 'make run_tests' from an interactive terminal, the kselftest
runner executes it under 'timeout', which puts it in a background
process group.  The 'sh' processes then try to read the terminal, so
the kernel sends SIGTTIN to the whole process group.  This stops the
'sh' processes, and also the child the test has just forked to spawn
the next 'sh', before it can run 'sh'.  The test then waits on that
child forever, until the kselftest runner kills it after 45 seconds.
The test passes when run directly.

Fix this by passing stdin=subprocess.PIPE when spawning the processes.
The processes then read from a pipe that never receives input, so they
stay alive and idle as the test expects.

Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/damon/sysfs.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/damon/sysfs.py b/tools/testing/selftests/damon/sysfs.py
index 66c826189320..ce54fa21c09f 100755
--- a/tools/testing/selftests/damon/sysfs.py
+++ b/tools/testing/selftests/damon/sysfs.py
@@ -390,12 +390,12 @@ def main():
     kdamonds.stop()
 
     # test obsolete_target.
-    proc1 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
-    proc2 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
-    proc3 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
+    proc1 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    proc2 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    proc3 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     kdamonds = _damon_sysfs.Kdamonds(
             [_damon_sysfs.Kdamond(
                 contexts=[_damon_sysfs.DamonCtx(
-- 
2.43.0

