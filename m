Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880629;
	b=WNNwtf/POM/SCL+TaeZk9D2AyrzyVhGhu9yuQ60bIj+1tTWJrqSD+BW2kWl4/HAgA+rU
	 BIXlewe8ww98Pqj/ab3c5Wb23nXW7rgkX46hxIydkMax0D/c/ge+D2YkZYClzaHvMiV+C
	 q5+KfwX9z5ASO+W8tjdk2Bk6eN96DGBqSVGKN6kWhITN8/3fvX7JsTyJzM3h3Emk5KVou
	 okX5tMYU3KX+7e0KJCjOcnv9jriMs1V5qOzDcR0wpkXNhua6XFM9ejRyo+yFYyYC2SdSO
	 +8H7vrXcr1V2FAlJt2rNWDocbUUkrlD1DLp+HF6ailCIwp0C15eFQgd3dwqEGWHoPLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880629;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ta81+Z++sWj/P1y8Fz5Mk7NOm+/jZXd+XAZM1x+41E4=;
	b=j8rdZMmo269wh+akWjEJR2udwR5uJmqOx4BzVJiGcvbsE/QNQKFgSl30kBdXCqP7OWg8
	 yuSFj2LUUkVisLcbY6HbzTUwK8/UR9FGLbcamuoXxUSzoV2x9HkJO+KwnxM17BiLZEvw+
	 5poku5ai6jvvZRtWNhYl+K3d1oEq1xKnjxahqqzCZH4pp3/7hX5hrs60fW7zQ7Vw3Ma0f
	 6zmX3985ovvCHO9Tu08zNHHA76MmXfOMpMfpSXk/IbTYnbotudSZRwWbwTD/YvsYnCd8S
	 cBs4s832aOe5GqksW1ZqFJC+s8kIwjTIRNIYfPVcIHtFP02sGd8XXCwfPXU5ZYJuOGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxX4qJGB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD03606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxX4qJGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F571F00A02;
	Thu,  5 Nov 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880629;
	bh=ta81+Z++sWj/P1y8Fz5Mk7NOm+/jZXd+XAZM1x+41E4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GxX4qJGBjlSoOGGXopFcjOH7BqAU7ALzDiRXFS7xUNLWmq8N6lVyv6LMEokhMnc8a
	 eUFqftWF895xAt9pT0Y2258+A84XCqxEQvOpTfRJ4Q2QiRU1BnAbCBCKTVW6+nC5Q6
	 k0sY7mmBc/xixrazqYrkYl5qg8Y1az7i0mIFMC9+ln9vB+MhD8P8OhBNg5b6RPMv/F
	 /M+bLBGe1C/dTFcounfg7MmRzkcHBGJTkPtNzWjHcEX+4zjnCGkCiD9njPtA5ur44G
	 VWLJM0b0XrHCp0Ny35UBI8K+CHMRA5NhQj2TITuCt1/nntfr5aemvxW6TaJp+mVYPC
	 4DNieZPTU+rIw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:10:18 +0100
Subject: [PATCH v2 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle
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
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-2-2df7a17f4835@kernel.org>
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

multi_v7_defconfig already enables CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, making
TEO the default governor for this tickless configuration.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..b583c5db8210 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -121,6 +121,7 @@ CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
 CONFIG_ARM_SCMI_CPUFREQ=y
 CONFIG_QORIQ_CPUFREQ=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_ARM_ZYNQ_CPUIDLE=y

-- 
2.56.0

