Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880622;
	b=Atvfwx+1Qhi2SsArQg9htzAbmQK4QgrS3tOako83DXzykIB/v/CFscS9qcaUITekxbaD
	 WXg7O0ywfPO66vysa+1owLZZbl8abu32QsGz2o67cbecZ+1F4PYhEQrKYEOfuIxdOVQ2z
	 EFolSbxlfJyxk4pcFMxRuP38sbQMoxR45wf2MNi4WW/3twB42MSIdyauHo3Acpbs1cxxt
	 AzQEm53uJs16HgHp16blAwe3Z9K/j8XQu12FXu2pNO4yJJnxZLyw73olTYbM1ZhghFq7c
	 qf5lo/anTuLOMyubDiKz1xAmp1fLwvxyK3YlOASh+sbnoxXgT5VksjlBbrFEznobAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880622;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=UT2bhfJPakwe9j2dLSC+DY8J4CfLe5CxwZabWLy4JS0=;
	b=X1oB11o+dTjxKDy9v9EA0XFpUKBkuYv/D1/CyVOCiW7xu9NYxV8XEPgM+2tzsfimzOYH
	 OOhefl6Ev7MtD9drB7qcQnlGviwD405q47DM/xYYAByc/vPIbj0iVJJEpBCiaA93kklKP
	 Ftsz9qLKgWb9l2TpTqtxYbUaDaOlRFrkCI92H+MlFPQGPnYgYmCUGrWjqk76CGVo6k76y
	 JiPQ98MZv90qKVJv+ia4kiEahpQKGlzmqfwgIsJsCJAM/qjLu1+x/zEDyUBC7nZPHMZc4
	 tz5epOU0hgms3yOzoWDL8dSyRTLxTmVpeyHRdCy3hQWN6szOmJFAZ3oBsYK9HcYMjLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQi2mDqU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8A606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQi2mDqU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084021F000C1;
	Thu,  5 Nov 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880622;
	bh=UT2bhfJPakwe9j2dLSC+DY8J4CfLe5CxwZabWLy4JS0=;
	h=From:Subject:Date:To:Cc;
	b=EQi2mDqUszZHlnoDVptK+pRNgC/HdzxBpLEqckFPfRXrryPL45UVNlnIHA6PkghVh
	 eJeXcXUTOLFn2l2F7TCkHPUINMxNSJYJmLBCdclZrOFsKWWJR4J+4r3Bpv7lkXGm34
	 4fUu63uF47PrnV4iuEqlRDPmIU+BHZ11+YgadcaC7Pel+x/YI9wLaC2+G8NMrSINCZ
	 xu7qhUoM+cd9Sy+p/hjXBWI64qW9kCW/gVaVYEoqXHGh0t/qN/W+ZZ0v74L8wXq1f8
	 qw847BFuPN31CMPhHiWBTnYmEGSYurikcoYcKs6dZ5Ey5IzZFaNWC1KoM+UWiM5RCT
	 GCBIWDaUlovBA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
Date: Thu, 05 Nov 2026 13:10:16 +0100
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6DMAwFr4K8rqsk/NSuuEfFghIHrPKrA6gV4
 u4NnKCrp3mLmQ08CZOHe7SB0MqexyGAuURQt9XQELINDEaZTGuVYL90M+PMPYnHelqc0PtYth1
 haisTqzi2t6eDoJiEHH9O/aMM3LKfR/metVUf75/iVaPCOndWJ7nKcp0WL5KBuusoDZT7vv8An
 RghUMkAAAA=
X-Change-ID: 20261104-multi-timers-cpufreq-cpuidle-5da23033d9bf
To: Russell King <linux@armlinux.org.uk>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Enable the Timer Events Oriented (TEO) cpuidle governor in the ARM
multi_v5 and multi_v7 defconfigs.

The upsides of the TEO governor are described in
commit b26bf6ab716f27955e2a503ffca1691582127cbb
"cpuidle: New timer events oriented governor for tickless systems"
by Rafael.

We need to gain some traction for this governor.

Both defconfigs already enable CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, so TEO
becomes the default governor on these tickless configurations.

Leave multi_v4t_defconfig unchanged. It uses periodic ticks, which
select the ladder governor and give it a higher runtime rating than
TEO. Enabling TEO alone would not make it the default.

Configuration generation was checked for both patches. No hardware
runtime testing was performed.

Prepared with OpenAI Codex assistance.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Explain the TEO selection rationale in both patch changelogs.
- Link to v1: https://patch.msgid.link/20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org

---
Linus Walleij (2):
      ARM: configs: multi_v5: Enable the TEO cpuidle governor
      ARM: configs: multi_v7: Enable the TEO cpuidle governor

 arch/arm/configs/multi_v5_defconfig | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-multi-timers-cpufreq-cpuidle-5da23033d9bf

Best regards,
--  
Linus Walleij <linusw@kernel.org>

