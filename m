Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880626;
	b=R7ZM9y0k/h7z9Qw1N2nOkb6bUKJiptzY6ok23ED5lt6Z1Mq0r0ace6f0Eb4UV4g8L1R+
	 gKDFpCpDNNfYRMXrFkWRkG3moGV5vWPGbolb1px4jMJJ1sFJGon4USVo5D74h/s9UQ1rm
	 qqzSEy6dX1yuA5e+KFvVmspjVU3jMgcMYVLz48X2/XAjXPozSvUfKOUv0DuXy/sPRovBZ
	 piMY+ScsyTE1q1spbj2UqtR0XjSSohICsnhyjZvkoMHo4yk6lShTJt9ukqB9PvW3mmxTG
	 UfTbHiAijKJb5BDFTRIp2QvozVDCOjzXOXmJ98ZK9qpesM5j0zv1caOsQOnAtBzGb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880626;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=x7AQe7KFeXSU6fqII5BxEjVO6D8yW5Usa+EB19K5zIo=;
	b=G3Gr9T5QGmpDlBcYqsP+gmP6fr3OWFoOuRAC5oFV+Nmyr975MTq52AI+ME4ehaCb2jFX
	 4iUeWwGNZ/QGkWLzfSAoPiWhHQ19v1VRHkv5M63LlQ/5xo3m/PP8889TdXeO+MO7TKWu0
	 1u/s5KIQs8gYi6bhiA2KyUjBhIvgM1tQ/sL9De+KvIm5833NNFuWDYkj2WUNva2LeKsPA
	 zEMdrOEblbtUmabgu59AXMqjEtT9kmQ7ik8/vhYPGKR2FJEqB5i10oVjFB8d6JlHprBPa
	 BMw85xIBrxSrZwZ6XKt5uvAytFbf50YPxGREgF05MPpivleMjZPoVuIs5S3xQYHbLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M3Y1LsuJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE90606EE88
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M3Y1LsuJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813641F0093A;
	Thu,  5 Nov 2026 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880625;
	bh=x7AQe7KFeXSU6fqII5BxEjVO6D8yW5Usa+EB19K5zIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M3Y1LsuJGddxQx6RpgYOmHLg3jdZxzHoVcNi3cJBuZHJS/OTjb68gQbASBxc/4Fg3
	 iaf5IvtiqxOrTQExd+EbBE3pJaugt8pRrzQYlYeMTPqpRckuWzxL8It8F5denkQpxk
	 1S/gBZ5MpOTjIPtZt4STkTVfERFhvPTfBkWCX5IwWkA+grJFjrL2TA3pV7JAUvyali
	 3iVfzKOWNKsYAFmB624rxO9ambgUDUWBTbzePHuT2T4RWYxT9pf76YBdA//zDW5gwa
	 UiOr3pNOD0Y0GcY52QZb77qzKBa4UyBJP/+oNQQkiV8Sez6CrIvdotjqtcinsM9uu5
	 mBfEgvxin0nDg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:10:17 +0100
Subject: [PATCH v2 1/2] ARM: configs: multi_v5: Enable the TEO cpuidle
 governor
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
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-1-2df7a17f4835@kernel.org>
References: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
In-Reply-To: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
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

The TEO governor introduced in commit b26bf6ab716f ("cpuidle: New
timer events oriented governor for tickless systems") takes a different
approach to idle-state prediction from menu. The governor gives a
better behaviour than the current default for tickless idle systems,
and for the multi-platform configs that enable tickless idle, this
should be the default governor.

multi_v5_defconfig already enables CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, making
TEO the default governor for this tickless configuration.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index a0d2fb2fcf9a..5e5c3dba1d72 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -34,6 +34,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_KIRKWOOD_CPUIDLE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y

-- 
2.56.0

