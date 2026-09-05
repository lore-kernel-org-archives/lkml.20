Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8BC379990
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570440; cv=none; b=MDmpNvR4a7CAPq3N6lF5Cz+v2/8T/G6PjInk/QUFMLM3i/vojdEw3M1UyxC1QwgEwSIrhjnQhu5KAAkf7KyE9GUfPnx4hEsN5jez3NEIHsX6DDughu2W9cuqBvMe/0/J0QcLkwAFT6AeU2Dx4uugFiLW7SUktFb1TRCU7Y5ZKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570440; c=relaxed/simple;
	bh=EglbqXi5LkNp5XA0SdAdE1SDNtn/R/F03DiG2hMoAMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HqsMWVBqdbxPQh/UploAg5GVJX9HiB6mP/yfHG3m4wl3pXGK07jJ1c93RBsLZmm6baNsBcbSdyAPwNUMPk+BjpEQD1qStU86Cg7EIpdcRrGwk/5guEriCAHw18GuZyA9O2iCz0vqrDGiLHDGJ+5Eq1wvyq16TqblqgV1zl+yma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRdmouKW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRdmouKW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8687630fso14871945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570437; x=1789175237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zr9fpDIO6FHp21CzkCP2RgEnzt+svRUnC4ckIWi1ofg=;
        b=WRdmouKWyohjJTz2OkrmjAfof7MvG1MiMudP8rxj7YDvbvkYXI3RaOIJMDmph4+x8M
         /yQuItbIWe0u3jmCbL9L5eSwvXuPyPtEQjTz95GJNHpFUKp4XKjlZvjSui3wLliC8+iE
         HrkBfwN0MmE80ETdBRFAXF75wd07RJVq6KcQErNdWu8zP/IdSl/i72CB8NyAtNqCw058
         Nx4xBoY2Eb9nJww34YlB/WNBk4tphDALAJDSeFYZFepZ4b1vRS8z27uLpFtbNPy3FFHi
         Wjjy5VtbJOEPkC5q9Q8Hu7rf/vQPzjqROvzxp3wZMHBHPOtjpdSxONWG6M098umufEoh
         PN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570437; x=1789175237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr9fpDIO6FHp21CzkCP2RgEnzt+svRUnC4ckIWi1ofg=;
        b=SWlRcM9FL5U9jDawHRhFBwuUxMruAbrUdf0FK5pIjnbmuKxktXSQyx5xErkf90pCiP
         HJuI9fjBlKjWTbzmO9dh04nFyGZf5MaFOD8tPd5ZrTxghb8ipWNvSuRbVxGKtFwFyDv+
         RX+K4JECo7gX2z9NyfgjeWcTtS3QK3XTF2OK1F2Cmch7C5i4vw1kBZLRrdeY8r6zUy7i
         r/TTLjW3Kl89vZ/b76GBdpYsUoSwWfNuipgfpXbCcpFmjRSSQieV4FTpAI/CSJtAIRF+
         QyukLUnNhLG56uPKjzQESLM240AUP6khXV2tDZvR/sqVfVasClV79vJbT2cIIcemkAOQ
         GCfA==
X-Forwarded-Encrypted: i=1; AKwUvBzWAYFRRKfU8ngreFvOUcnhWUpecqkoWMSj48bS85mg70bX31+xkQR9pppI3TlLzgPDe793c3+gdbkU6qU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfyWdTzPI9vVKlDXSkObHahX4xde+Tv4ppYbuWGXhM2rymSYMt
	JeItLsGVMDFWYNAJWN+7S7bjRHb9WPX0keKxsvuAx7zeIgLKr9rkT2AY
X-Gm-Gg: AYBFou1l9HROdNYcc8zyG2Ja3cwTuiHcS+Pfzu5mz1sRunZ0eY1txOpanNNWbr5U68D
	2ulvcZjG7/eZLTnmN9s84FyF5i2y3q/ZTbrQ+WdHhCs9/2WQNB+jxp+y+g+eR3UBFDdxiW+qCDn
	u+9kJabZKdB9XKwJgEJoKDd4+A1i+W+4Z30v1p/WI8GkfGT+SJeW1OzGWEM2HaD9nxMyoK4CY52
	rZCwv6ttNloIl4hTEayzot94ZOC6RN2qlOrRu/cvmGXVV0hNCKk7Uke8WOSfyr5A/XLI4ig+piq
	g0cD3CtvHyxOuAsqmUB2WeRxlRJTN3zTvdwW5HavsjFZVr9LrH8SLVH8ZWbUw4nbHnWJjJOXDyt
	xbyDRZ3jnzDKxaCAY3m+6kBhb3GpH2D63QVWeYdp7r7c/cl82uR21kOWtDMVKXDGIYdEDSeK+Wk
	31B1jKh/5R2LFJ0hK981GVihefgBySpNbb4GFaSk63BXApncTe17OGw4x5p2eoYJzHL4FPyAgQB
	2RpFASNxOaU8RSrF5G7a7+Y2zbIXfUkPv/KPSMh82i783bqHKGddwdNuF1kKl7aR4/0ZnVOp/aB
	PzY5NDcXWpFdGHktruFc/3akOVbZbF4RhymCfsBuEreJrTqpokZl4MEvYN2gIoI/XO0=
X-Received: by 2002:a05:600c:628b:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49cfa21e956mr66582325e9.24.1788570436399;
        Fri, 04 Sep 2026 18:07:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm195777265e9.4.2026.09.04.18.07.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:07:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq/amd-pstate: Remove obsolete amd_dynamic_epp documentation
Date: Sat,  5 Sep 2026 03:07:06 +0200
Message-Id: <20260905010706.57380-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amd_dynamic_epp command-line parameter was removed. Dynamic EPP
is now selected through the per-policy energy_performance_preference
attribute, which is already documented.

Fixes: 32692fcf61ed ("cpufreq/amd-pstate: Remove "amd_dynamic_epp" cmdline and "dynamic_epp" sysfs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 Documentation/admin-guide/pm/amd-pstate.rst     | 6 ------
 2 files changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4a12805a50ba5..1fa37bce5bb3a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -499,13 +499,6 @@ Kernel parameters
 			disable
 			  Disable amd-pstate preferred core.
 
-	amd_dynamic_epp=
-			[X86]
-			disable
-			  Disable amd-pstate dynamic EPP.
-			enable
-			  Enable amd-pstate dynamic EPP.
-
 	amijoy.map=	[HW,JOY] Amiga joystick support
 			Map of devices attached to JOY0DAT and JOY1DAT
 			Format: <a>,<b>
diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index 6fd72ba52df20..4c5d3d8acf645 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -481,12 +481,6 @@ For systems that support ``amd-pstate`` preferred core, the core rankings will
 always be advertised by the platform. But OS can choose to ignore that via the
 kernel parameter ``amd_prefcore=disable``.
 
-``amd_dynamic_epp``
-
-When AMD pstate is in auto mode, dynamic EPP will control whether the kernel
-autonomously changes the EPP mode. The default is disabled. It can be enabled
-with the kernel parameter ``amd_dynamic_epp=enable``.
-
 User Space Interface in ``sysfs`` - General
 ===========================================
 
-- 
2.53.0

