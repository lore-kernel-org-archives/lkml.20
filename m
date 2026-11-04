Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794563;
	b=BBs3M0l/u+p1w+biRalnbVaIiV5QXVy0m+5Fd8T3RBTDDrjFeRFmo3s1MS4c9ZdF3OCF
	 oiT/p+svtayXaFJ4Boab2goBRXNBRGxgyExc4AvV7D7tpm2YueWJr5wKzsQOUWAU9mjIu
	 PA5DeSwHsJiVF7HoJf30vgav5oidu7QijFLda3TrNqlQ3BBBODG+QakwRf9z2m3vOlya4
	 P7kGn5Ujtyx8n/gYEunad3RSnccnYe6O0bVAWcFuocWdBJBe1ysJgqLixqX7RaBRl/xSt
	 bxirMar/NsGF2LZKN1oAmQ3Lun6k5uZRyjzrClui+1gP2cVXSx9FHN22bMd3SMPwtrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794563;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=vf9Ww/+0wywlaEvzewNdTh6CXvRx2uONOk0Ka6cW+ko=;
	b=yfz66RqRI4HOupp8JhoqnIEapIGDCOYX1x+jm3sbshJ/DEuJZsQGSDrzcOCnCKLsQOsu
	 YBjcFSY706YNo1YPoYFD81VtdrQGE0JiP5iE0LHYTVhCzpjBuzbzHm9WBPSgQDmcrnlvK
	 MM7EHP28aIG6orRXLFvOjqF7FbYo5GIIGtUY27At4VmefVLactKIgpbHZ+bnW/esVjo8/
	 MokpGZ+OdcafziCSo+W0PRUpDSSeeXBL/JLEeWgzy+8g8b9f4BkJLWapl644Q9nfBFjog
	 POkvH7Fy8XZ0WxEm/aovqBmUyXsqYtplMihSFrdEOtt7FdbpHaB4pQ2oeRucGvJzI9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3YnGJGA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45566606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3YnGJGA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1497E1F00919;
	Wed,  4 Nov 2026 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794563;
	bh=vf9Ww/+0wywlaEvzewNdTh6CXvRx2uONOk0Ka6cW+ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G3YnGJGA0XR4sIMBHklqB0vq8l9UuYP4kUgHy61YAhjEc4+RAV31VCIYgYxNPRJpB
	 oh0vvLsVdbigZUzUkbQqZMSixo8QNh2EW/jMcaVmSzF6gHbhi9ylFsZ0me0sys9wG1
	 /xafNqu/db2fAigWWhL7zF8g4Ndz1FDa5C6bql8ha5ypHugF2oWWROO1hLKCbko/EW
	 UaAjNkkg0JYIc8nC/eszcHJJxN4Cxp/LrY5JfXjC9y5DAaSMUIHyVcRITfZqM0QAv5
	 HikvlIH9h6ByoeFSVKuzsZft3kRDXDzyAElLrTDLhP52r9K2lbtto+mweq9gIyWuLe
	 njEWxoU0iGeFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 13:15:54 +0100
Subject: [PATCH 1/2] ARM: configs: multi_v5: Enable the TEO cpuidle
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
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-1-c7fd14706715@kernel.org>
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

The multi_v5 defconfig already enables cpuidle and tickless idle. Select
TEO to use it as the default cpuidle governor instead of menu.

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

