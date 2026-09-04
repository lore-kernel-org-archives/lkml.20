Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326324A33E1;
	Fri,  4 Sep 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529224; cv=none; b=DvhVpyDss2hpiKXI+J/trsHicvAU03gL9PkmWx53C6qJ2tHOqRJxnR+LiJFT0XFoyfABrAU0/X7XFVPi6XmwqDlY34stG1KladK9QiGoBGGxvhG04LIFy+AB2oLFQwXFABzw8s2knpfo8BCnB5rJEnS4T1DPv/59OQoFW+/KEZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529224; c=relaxed/simple;
	bh=0zBzw3JEFnzdAfwf38O8AnUkBD1IW3KiiwpzUtABBz0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=m/sJ7oUvnKDF2rNovylRoQRTmKjjRQdJRFhbO+0WpGwd17RycM8OT1L0uLrECq9Vmb7POZW7IqdUJpcgQp6mAAOMMLnqRUpbqRqRF+3ai8JmoXfnFW5JnfIG0iUXv5koFxY9SGTVsw3CmRPh2NnZh2/XnV3ki9DH1dfjPOnpTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iXl9bk/4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7H8sXn4+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iXl9bk/4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7H8sXn4+"
Date: Fri, 04 Sep 2026 13:40:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529221;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb2VbJKXWnHO0vEGo3hI9T9hiXMlJ49GuajtDDpubhM=;
	b=iXl9bk/4LFx/MjjMFE4+k7tMCzUSxxHRrIWW+C8s3+Xce/Nhm2ejZ3E1CocJvlbyZ6zy2n
	Dr09EyYrGyTR3wKBdxMpF1Rk4nizfX410+p9aWbpnS2V8y8/h8QSzBj7GYmu2Dj8KWtuab
	m2AQMdGdqFSC8slWwpWm956eGyLuY5plExP6LmurjRd1QPj3S/jceGTYpGunLG8NXiyCx0
	aRxdEY0iMtsXJat0G49XOXwkLhcZ3OioDwHf7ipX4JHmDheSUGycfxN7E8NYiooz3VxAtP
	abAek9XL+EPb7EM1rr9aDS1WXxJK8yZAt42Rea9o9wUP+RlJlXQfVkfaNRdxUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529221;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb2VbJKXWnHO0vEGo3hI9T9hiXMlJ49GuajtDDpubhM=;
	b=7H8sXn4+GpIng7PF7D4Wiuli7weStfDsS4MSMUTXp9zrFp8SBtrwVllsbCcj7rDEY0TeEZ
	8wYvJPrYyKAhQvDg==
From: "tip-bot2 for Krzysztof Kozlowski" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/qcom: Add defaults for desired SoC drivers
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20260727-irqchip-qcom-defaults-v2-2-466f3c407937@oss.qualcomm.com>
References:
 <20260727-irqchip-qcom-defaults-v2-2-466f3c407937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852922011.3717435.8122935752820647798.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     eeb693eb3f4c39e181a8a808f02732feb7b31022
Gitweb:        https://git.kernel.org/tip/eeb693eb3f4c39e181a8a808f02732feb7b=
31022
Author:        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
AuthorDate:    Mon, 27 Jul 2026 22:01:21 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:33 +02:00

irqchip/qcom: Add defaults for desired SoC drivers

QCOM_PDC and QCOM_MPM are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable these by default whenever a kernel for Qualcomm SoC is built.
The change has no impact on arm64 defconfig, but will enable QCOM_PDC
for 32-bit ARM multi_v7_defconfig and qcom_defconfig, which is desired
because SDX55 uses it.

QCOM_MDM is used by 32-bit Qualcomm SoCs, but there is no in-tree user
of it, so it does not have to be enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260727-irqchip-qcom-defaults-v2-2-466f3c4079=
37@oss.qualcomm.com
---
 drivers/irqchip/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 5a881dd..a8f8c42 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -524,6 +524,7 @@ config QCOM_PDC
 	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM
 	help
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
@@ -533,6 +534,7 @@ config QCOM_MPM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
+	default ARCH_QCOM if ARM64
 	help
 	  MSM Power Manager driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
