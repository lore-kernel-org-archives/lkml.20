Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423644A3846;
	Fri,  4 Sep 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529224; cv=none; b=ORFilxLyrIO8a6GaQU81DuBcx992jJTYbzYpuZCq7bZUPHh1vSrP4rdwQoT+QheNICIzuVd1iBpRFBbBu5tPh70x/WQ0LLn0GvATSZ+IVWaeESm1Pczqiz1FgeQ8lFJggRO6ngWv6a2bE7ObgoV2TurbjGDhqnyucopOx3pWFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529224; c=relaxed/simple;
	bh=R+Kl7RJi0IwOQK3ft5vUSSu+mKqKEVnQvYyJ0g+PQHk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PxepemoO/CRXX1cgk7szCCB+1lBo2S1izTi1YnRS3i8tY3y2bDYO5bh5KuEj7peZo51l3akhuvh7aCP+zTw6x67zgnqNMxKD2GyUa9u0RA0+PdHFZ8c0D5gTqV43mzrvAPaC/t/U2jrka2klU2JNd3ZdgxUfHb//EVztv16WjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PlWMgHFF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=grDZYoB4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PlWMgHFF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="grDZYoB4"
Date: Fri, 04 Sep 2026 13:40:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529220;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8dOGuDdnD+GIpJE83cXAJ3+EcPy8hUL+P2IugKRrBw=;
	b=PlWMgHFFkZojo9mb8jpn2YsxVQYNyC3byCz6tBVqtDxVN7ECYRLm9LVdfY7prvewcsZnBH
	v+L6yhT7w9O42J0aZsr2mNZ68QFJDNZjiJWhgf/HPRP4g79Mmtx5LSe+GOjsOBNQ3Hz6+b
	KDDekg6Eu2K48xaf2ezlpN9guWcsYiU4Y4h3m3CXeV+hS8sHUU5IIubyOpj3WHELhRjmsd
	VUcAyM8LuVkkhNbuCuHU0VjVCKfm4pLKnlJVVolCd+mLcQxSJdN6+8bMqKGKEMWJgLjdvh
	Kc92hgQ/RaEIa5xxZelZ8Z2wneQpPJZ7n6MVQo5BSPtV+YqkNC5prAMzb8MVlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529220;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8dOGuDdnD+GIpJE83cXAJ3+EcPy8hUL+P2IugKRrBw=;
	b=grDZYoB4tpP3d6770UKZjMqNe5pYp6MAB37dMkHogu+i8ZNOjP5Qy5xAlKfcTgwa8k76Q2
	U132L9gm3CYOsMCw==
From: "tip-bot2 for Krzysztof Kozlowski" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] arm64: defconfig: Drop redundant Qualcomm irqchip entries
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20260727-irqchip-qcom-defaults-v2-3-466f3c407937@oss.qualcomm.com>
References:
 <20260727-irqchip-qcom-defaults-v2-3-466f3c407937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921874.3717435.12918805943050940533.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     bd94bea7165be450903c6d64bbcb4862e36798f9
Gitweb:        https://git.kernel.org/tip/bd94bea7165be450903c6d64bbcb4862e36=
798f9
Author:        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
AuthorDate:    Mon, 27 Jul 2026 22:01:22 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

arm64: defconfig: Drop redundant Qualcomm irqchip entries

QCOM_PDC and QCOM_MPM are enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260727-irqchip-qcom-defaults-v2-3-466f3c4079=
37@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a..978e008 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1743,8 +1743,6 @@ CONFIG_PWM_VISCONTI=3Dm
 CONFIG_PWM_XILINX=3Dm
 CONFIG_SL28CPLD_INTC=3Dy
 CONFIG_XILINX_INTC=3Dy
-CONFIG_QCOM_PDC=3Dy
-CONFIG_QCOM_MPM=3Dy
 CONFIG_TI_SCI_INTR_IRQCHIP=3Dy
 CONFIG_TI_SCI_INTA_IRQCHIP=3Dy
 CONFIG_RESET_GPIO=3Dm
