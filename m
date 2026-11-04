Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794560;
	b=e9WiUBLXT0pAFBIWBKr6nS4oYazXRmbUBogoZC7Nmuuwc0KCcgXosU0lQEIOeZgvkJP6
	 0iv8v08YLPj6zsLxmaNvEodTPw3SFxp6YkaM0yjEm8fym5FcpLswdoxtENCRjd55diH58
	 gW1eJEcM3oOviEGVfsME+X/r0106RqBYq8j5+/YoWJufrXFtBy3tlrWrVBzAlBN4TDEDa
	 V5FpYcuxCG52L8iQD7hzU9CAcHoYl8GK3rgw7E2XdpnJJ+v63ypAcQp+R/VfN1qfcK3Nf
	 dzm1Vc9o34zlQO2Kr6rP8sjfu9UiRUs9ACf6soueDkwOOQmpCKnguzCrlgTxuh6k05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794560;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=KbmkajyfFV3udbEtJGrmA3+mmB8dwA1xxk3Neh9mt9o=;
	b=Af5U9ZU8KMeVAnkh0az+KSyQJn6/OMG5LicwjHTWa7FKxP9Tzl8WErGPR5RWZ81lUtQU
	 ig66hkyI9MVIYgM0SBwH88nvHCYSlIvhAo4Ee9AmprtcJ1gzhOngysR/ZOEz8OMWqZmlg
	 P4JyJRKkm2kjQKw4nthZloOVMxZdP+P6WIoiJLLVBo15URj0lLx8EdSRAKaZMPRkvXEir
	 LSZU6VOWY6xG+lKe6Np+1Nj2+9zqXSNpNxuU6/1jX+dkrQxTTlwIUVEpfRkq3cf6d+ZaY
	 5MGMetBxtAaKFEPXRrhgWapAFLKNJtVebT3Tjl23oyGpeNi4NAPLSXlFjKcz0ftAr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EUEur2Jp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21541606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EUEur2Jp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31A21F000C1;
	Wed,  4 Nov 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794559;
	bh=KbmkajyfFV3udbEtJGrmA3+mmB8dwA1xxk3Neh9mt9o=;
	h=From:Subject:Date:To:Cc;
	b=EUEur2JphXwpoZ4tHxAj2WhlM0C5UdBaVipHPNJ080rKeMF2BCPCCK8bv4Uody99k
	 nkuTsM1stI7355+eJsS/UTQyky4ILP8cyOjCi9VheSX4Hyt+AU0nTo5SQQZo7X1+cB
	 1qbJZrukyHPwuOl9BTJ4ex0RNvIplJCFIKdnjQiqN6soqpaKhJdDWoabANpZOSTUz9
	 +FtH4IFYzZ92nmIvdK1K2aeWWntHQqBuQrN4nrK0WbctOMFKnRD9pX14Dkxppz2AL4
	 EwAuZrV3wXPqM/CVVfig81ZXBYCQLIiJ2m19oyyDG7Ds1Kg/AZCElCU7FYrvXLJp+5
	 Cy/eGuRmQfusg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
Date: Wed, 04 Nov 2026 13:15:53 +0100
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQrCMBBA4auEWTuQnyroVcRFTSY60NY6SaQQc
 vemrh7f5lVIJEwJbqqC0I8Tf5YOc1Lg3+PyIuTQDVbbizF6wLlMmTHzTJLQryUKfY9ymAjPYbR
 OOxeuzwh9sQpF3v77+6O1HW0esF9uAAAA
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

