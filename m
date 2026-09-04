Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C344999F;
	Fri,  4 Sep 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531847; cv=none; b=PPHO21Dp6djfdTwepJlkw7B38NfSk7yH9+aIKQfgmScZWH7qF07B5dbGQEPQh66sMXnDo3gZAd2WO9iwu5z9qLzpogi2VH/z69VAxOCS59slVCsAkHQMQK9w1GJ2qSa49lqqlqKOn8O6iHY5z8XElFdhKbl8CiErJtYrjq/AKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531847; c=relaxed/simple;
	bh=8SoOAs6P73WEvm4s5URytNP/T1UB1wZKCgqgjl0OJMc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tVXMGzFjBW+/T2N9mxELFzVh5vOnzz8pwm3+MhsXgbS2JyhGiGNU8y4eaVmPR/QavgGf5D2L6dsE+Vv7oDBJcD0s6uZaOBj6OonLfmseRYDf1KHjW7w/68EijEtcO0P24vUPBtg64OznltOiEjJoKCnUSHX/xdWZ38DBd8KP3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TL1xXDcd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7g0Jgm40; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TL1xXDcd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7g0Jgm40"
Date: Fri, 04 Sep 2026 14:24:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788531844;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whzepCPzZyY9K6z108eVpQznhXkiqb1y0/RzB8nFvXw=;
	b=TL1xXDcdqIIPS6Rpkf738qC/7ga0nJv3y3Ixv2e/0gHfHYu2l+KkJrpdXtAz12hBCo7HzI
	A99D4+l3d8baxMNXJMVCqMkbt/ZdrfYG1lJk5KMSzQM7VRuJj50WeuMvZIaQA4gCQqQANJ
	STd4FJlUgCquFWRNRGXvSTUqO55ZXlWWvlpL0FkXrBs3oejAJ7K2fStX9kVMktEIoe6Qok
	qQ8Hx49VX3grxWmh/UeNIldZBAmEzw+rHq6L+e1t6xqKreQ1RJxr/Y4J0+YiwlV0W5l36G
	ret/gNdOE4BIYJot1q/xxvUghfbmUAPswY2WxxD1y1kTcEd/NCyliRaGQ92XFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788531844;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whzepCPzZyY9K6z108eVpQznhXkiqb1y0/RzB8nFvXw=;
	b=7g0Jgm40FbQgkjD17KICESjdyg02BsTP4wahJzDM49wpa8mu/x4rOdm8wVttULasgcUork
	0ya/F7G0F6X41ODQ==
From: "tip-bot2 for Maulik Shah" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178853184226.3717435.15723787173998149166.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515
Gitweb:        https://git.kernel.org/tip/13ca1c0b7d8a3ab1e59cb3e780c1dd7441e=
22515
Author:        Maulik Shah <maulik.shah@oss.qualcomm.com>
AuthorDate:    Thu, 06 Aug 2026 14:26:29 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 16:21:02 +02:00

arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualc=
omm.com
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/p=
urwa.dtsi
index c698e6c..4348dd3 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -224,6 +224,11 @@
 	compatible =3D "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
=20
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible =3D "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg =3D <0x119 0x2>;
