Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE9633F5BC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005581; cv=none; b=HQ4aIcO21v4ADFt7BC2s9Fbn6jl2iBKSgTYN3LXQFq8JP2T0vI7nILd8LSwNoO+FLO+FyFgvrGoCjFY55CHiMia+p01GJjk5FUn9wQgdC7Iz4GdINA1bC2+9GP1AH2OUhNpbjwaOiSHyFtzS4uicD8baOts8QAXy+K5o2RQyTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005581; c=relaxed/simple;
	bh=QLHD71bG8sWEFx+QTSTbN2i3igcwCws5mkcWYxMIzWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oK/ylKdE1njNipdAWrXXQjkHdG1V5GUUzXkDz9I8Kb7Vp/rFdh4MWvAC4M1bKCm/6F90cJvMXnFlHoAoA5VvfdkqvzflALXEEqGd6QHLwWsGIkG4DT59P2/6EXnLhhA5GIHWTwNVdYxgrIiebh9wF7hM1sYcQfSN+Lo6sEVOdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=YSqAXqtc; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="YSqAXqtc"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15354aa70e8so3743732c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005578; x=1792610378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EolNk2P8cfuJX7YBRRAXbmqx1FX42TwFCmuMkfr/YQE=;
        b=YSqAXqtcgt/BwzJe67UkG96OZH2R0ugMLGLyzn6UztMv9K9JCUSFErK+yEeNG0OaAW
         RvKUnmgZFpvsxsQz54VuczBDaLs0Nkcyz3e9XdQX/QJcbrXaF7Pelk4sL1v8vMWLeDPl
         867OxJwFrGEIyLO1BzaePuS/oz61rwXCp66XM7jkP4XHEIbv+f7z7vRJ6z4qX1uSxOrV
         Rq9OmfYDCwbsGGB1015wz6CJAeuWQNGgi4xEUkT1FkprWNTs3Xs4+O8VJ+4JZ3bSDzTs
         j/sUDPURMHf8hDBuFf0Ks/Jj68vxDg25DMxSf58mrnAyRzLlgE8VnT3VJOvHUXUI6Qib
         jRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005578; x=1792610378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EolNk2P8cfuJX7YBRRAXbmqx1FX42TwFCmuMkfr/YQE=;
        b=pEfQlcZX+6G+GObD1HB/guLIEQOZXKcEEzksE3zH8sKVrShaA9LdutjKr5/TsyxKHP
         g3dOCgsenDHHWLz3l6a+Gu55FvUIxlyc+1Mg0zDXH3zBI4+fzCv+VuslPeCeoijT/5fy
         eBWumDYuKS5b6/dNYTER0B/EnU3m+wE4+WPEzaed/YXXGcYFViGQP5Tsz+wRR07Ht7IT
         Tr+eY77qwhIM3mAQ2hA47K1IyXZnWcISPER8hnVuhK1aNwHVcSzis5WkAhv6i5VzZNWO
         SWlN/OPQR6Ddh+BzGmyVvziwFZByyZhueqVJHqbOQirx2hbEHWi/MiRxi8du+uKktn9+
         w4Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwKEAtAd9uOw1M7FU7ka12Nqidw8RmdP4k59NOohYCrdCiALYHFvfeJUZiXLkTV5PKzI/4qarB+GanFmg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkwcNgQqHuc0RU7FILvnore6EGqL8OisW80DDwYUQbB0lzlXhj
	Z7LGrd3w5BOEJnX5CnxBu1qWd6vXFxFv8dybcCuxN+SPTclkXzvq8pa0xbRQl5o5CeM=
X-Gm-Gg: AYBFou1bRyzQQpi9BL8+J8VHpVt97rkw8xPjgvjQvAVzTbM8gXAtU8f8RI3XXhV+f0W
	SeyajZCSQBZEoj/C4UvmCC4I+lsUbd0qAtHZqdc5648VCX7zARQhCj0VsO/iglWAbLULM6Mdr8G
	qIsjOrGXydBZLAYLgpaNaBhaugFIvzlBGprTSlOcVRT5Jk1EPLAlB+XEXTtiavnUDcWnvy4U9Oo
	Xp+VjsJxYgsRpzthDtnClgGTZivDPeoKq9N6FX/VSy/Y2rR+lKJEQSc1Hg2RN9OrYzdngTMqh4i
	7pMfronxpqaIND6xnI0ykGADXw0hR0+cnHBqDYlPIMs9iHOXOxugNpJnWKiQmo8UEBv+fxLvpvb
	w1D9Dp55gbpiuhBD9oY+eGnSAQJe2zk1Y7bDV8MqO1nd4k/LfUhkUrF28cW6xvCrRyXcX332myU
	H1dVvBFWgJdJs77MGONRIHqaNoi2a2PfHapuoAPQbQzrBYMcA78BniYMjjeqObGG1/5kVdhyGQr
	UX+LK2m60yTcsbQUSlVfY/2fhmvptuCgD0gphFKUTsXXGUO6bEcssMqrkDNrpWNLiMnqWQr
X-Received: by 2002:a05:7022:7f05:b0:149:49c:22b with SMTP id a92af1059eb24-16a57733270mr21122525c88.1.1792005575832;
        Wed, 14 Oct 2026 12:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm65121744c88.23.2026.10.14.12.19.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:19:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: lenb@kernel.org,
	lihuisong@huawei.com,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lirongqing@baidu.com,
	rafael.j.wysocki@intel.com,
	rafael@kernel.org
Subject: [PATCH 6.6.y] ACPI: processor_idle: Mark LPI enter functions as __cpuidle
Date: Wed, 14 Oct 2026 15:19:31 -0400
Message-ID: <20261014191932.24129-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li RongQing <lirongqing@baidu.com>

[ Upstream commit 956ca5d72c76504824c8eb601879da9476973e15 ]

When function tracing or Kprobes is enabled, entering an ACPI Low
Power Idle (LPI) state triggers the following RCU splat:

  RCU not on for: acpi_idle_lpi_enter+0x4/0xd8
  WARNING: CPU: 8 PID: 0 at include/linux/trace_recursion.h:162 function_trace_call+0x1e8/0x228

The acpi_idle_lpi_enter() function is invoked within the cpuidle
path after RCU has already been disabled for the current local CPU.
Consequently, ftrace's function_trace_call() expects RCU to be
actively watching before recording trace data, emitting a warning
if it is not.

Fix this by annotating acpi_idle_lpi_enter(), the generic __weak
stub, and the RISC-V implementation of acpi_processor_ffh_lpi_enter()
with __cpuidle. This moves these functions into the '.cpuidle.text'
section, implicitly disabling ftrace instrumentation (notrace) along
this sensitive path and preventing trace-induced RCU warnings during
idle entry.

Fixes: a36a7fecfe60 ("ACPI / processor_idle: Add support for Low Power Idle(LPI) states")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Acked-by: lihuisong@huawei.com
Link: https://patch.msgid.link/20260616072617.2272-1-lirongqing@baidu.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Assisted-by: LLM
[ Backport to 6.6.y: Omit the RISC-V hunk because this target has no
  RISC-V ACPI LPI implementation. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-80611 to 6.6.y.

The code changes are identical to upstream, except the absent RISC-V LPI
hunk is omitted. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: the x86_64 ACPI
processor-idle object (allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 drivers/acpi/processor_idle.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index d755c266e3586750968ad7c4e01c5538ceb631e3..5db34356328c7e4e62b30fb53fca375e9e7d972f 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1175,7 +1175,7 @@ static int acpi_processor_get_lpi_info(struct acpi_processor *pr)
 	return 0;
 }
 
-int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+int __weak __cpuidle acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
 {
 	return -ENODEV;
 }
@@ -1188,7 +1188,7 @@ int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
  *
  * Return: 0 for success or negative value for error
  */
-static int acpi_idle_lpi_enter(struct cpuidle_device *dev,
+static int __cpuidle acpi_idle_lpi_enter(struct cpuidle_device *dev,
 			       struct cpuidle_driver *drv, int index)
 {
 	struct acpi_processor *pr;
