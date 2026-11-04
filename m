Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794567;
	b=HmgKfz79cYeP9XKzIZ9HfpU3Jx/NYhaKVCnw1hNmSxao1vSX3KhsmrJmuvuJBmHNIi4Q
	 1M7qRkHHUt8m37+hX8u5VpFJWombijCypWWMPAjSDuUggKWI1Q8im9bxm+IDxUO4MObGE
	 Y1gOZkJTmaYGN2jy/6Q0eDgYSjsc3N8IM4Ri7n1mZpUVIow5gGn93FU10ivb0GZ9KQfHe
	 2FVpoBvZm2hX6g19YL0S9lAiZUDS6y6JAewo0Nq+6XQ4oaVCVZF9Q0XOpR1qArL/W1rUx
	 nvTVOZsxQQhalAKcOq91OTtc1oYMa0+AwWhfzWdE+5fqctbKFZz46VIy7O1XPfAM6YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794567;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=QzREGEJSVqjauamhHrlGrhsC6OsN4XRohPnzT15eiL8=;
	b=C7xwKJOSR3Us189S0zHUPVtAJbJzTz5b9yvMY1emq84YtxKbX9F4FsPCY/HzyH4bd4db
	 1YCZeYn+SOJNoLioo9t9SAcGfQid4PbXcy+xT9n9YSgcJyfh6Q39lf+ZeZ3x/Qk5yMKP/
	 EeDY30sIIfO/qhWIx10YIUARm2pAREaZ/Q9XJm1n3cNuFOgEMWbq+S5ksGTWYNzC7BMrA
	 VSDoj7nHjtKxoo+rqFSHAB9usUxJQA2eITKk2O6Ax9IdUsrXigHul1TLz+Qbr8k6Ekioc
	 xi/hfHux8i+IciXI1ZHxALwc0MoPHo0WECVMWogddHAhjoJFwbVYNF2W93gjkwqfJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCksLcyU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCksLcyU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A40C1F00A15;
	Wed,  4 Nov 2026 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794566;
	bh=QzREGEJSVqjauamhHrlGrhsC6OsN4XRohPnzT15eiL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SCksLcyU90tDWcOxApx/Xx5QXCJqa0z8zNZuNd23K3VIGll91Cq1Cocki8t2Y04Zo
	 L4njwwnrzWxf2r3iS9aBgEfh1YG7HRWbVOoEoA204DmLkMNcNvuIeIoveSyO33MaHW
	 6R36tlLeAB+HrKPHmeYbbBQhAgK/2mC++qBzL4GntHH9F++lozWro1Q3yHvVy5FFM7
	 0ErGb2HQmZPiXcBLh0N2dSieuaLh2ot3wgNDjSbiumQduPwaTeHK/7dZFubPYHJsnV
	 CH2TPZEkgGFAf3fYLUH2mE0lTYep5aR3Q5B9YAIvYw5VKHrPNf0OYwADgex3nbx2cA
	 FnuW6IEwS8D6A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 13:15:55 +0100
Subject: [PATCH 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle
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
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-2-c7fd14706715@kernel.org>
References: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
In-Reply-To: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
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

The multi_v7 defconfig already enables cpuidle and idle dynticks.
Select TEO to use it as the default cpuidle governor instead of menu.

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

