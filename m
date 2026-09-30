Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com (e234-56.smtp-out.ap-northeast-1.amazonses.com [23.251.234.56])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832A3F824D;
	Wed, 30 Sep 2026 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751515; cv=none; b=d6rnM1Cd69X46dV52orzF8fXxKI7coENiFIdEBORAJusQaqhOqzvlc7LHQqtSuL3vM8x4miQFRyvNK2fKdpZpwkQ2KvB9DeYza+5TwcSo85NjBnvc8W0S/VFQQ3I2081Oxy4xWDWIBKeAhyXj1q1TLGQ7Fmz60ybBdqRY/iAr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751515; c=relaxed/simple;
	bh=7seAitZWid33P2/fIz1kQ1bYxFdxPMHTdC6jHBhZkwU=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=B8FhuamE32GYczmQMUVXm4Qi3vAP50jAz9xP727GjxrNgOJEK+OyPnS62ky5UsI+kdgWn3wpAfD1Aqil5YEp27d9YuMyW7iY8x8w50GaPHhIsDwoXoZpm+i6INJqUrwoqFhPeXT4g8EekdJdtQQCGpwiZVE27trahNH7dqiam5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=R7CVvdNm; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=bij///TO; arc=none smtp.client-ip=23.251.234.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="R7CVvdNm";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="bij///TO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790751500;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=7seAitZWid33P2/fIz1kQ1bYxFdxPMHTdC6jHBhZkwU=;
	b=R7CVvdNm2aJwj67uL4nBeInnTnuAHj/QMT7NkhGG9NZW3r3OLpFI5iZb82L/f5NH
	HW4pAqhHbdwwnXpjbWfVkfYI3vJJlIiLjo2xtEhOQ6M5Rhdy6nxz/BgIBpI6CUZBoFb
	TS01sdZqvfG0epSvfE9h4TpvH6IJFEtd90LmnYIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790751500;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=7seAitZWid33P2/fIz1kQ1bYxFdxPMHTdC6jHBhZkwU=;
	b=bij///TOTK7+2xFlVpxRwJFAWJUbTeT7/HZ4aR2VbJHqOU0uRbM1NdgXxCzWq31v
	YG+deUdyCHUfue5M6Einelqy7MBv+pKOM0A1YHwGd64re8gFch+Moog4ZXVGuM6tmpT
	OCt2mJmQKRLf3eo/Bewp+u0t1vlV07QOWTwA99pM=
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930065712.99862-1-fqwqf@fqwqf.xyz>
References: <20260930065712.99862-1-fqwqf@fqwqf.xyz>
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: qcom: microsoft-romulus13: enable
 touchscreen
Message-ID: <010601a0f11b66f4-60579998-13bc-4174-93cc-c5338145611e-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:58:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.56

The 13.8-inch Surface Laptop 7 has an ITCH MSHW0468 touchscreen on QUP1
SE0 at I2C address 0x34, with its interrupt connected to GPIO38. Enable
the bus and describe the interrupt and its pull-up configuration so the
existing HID-over-I2C driver can enumerate the device.

The HID descriptor is located at register 0x0000. Touch input and
multitouch gestures work on the tested Romulus13 machine.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
 ...=
/dts/qcom/x1e80100-microsoft-romulus13.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1=
e80100-microsoft-romulus13.dts b/arch/arm64/boot/dts/qcom/x1e80100-microsof=
t-romulus13.dts
index eb7580dd9684692067f1e8000ca32930478c1178..=
39a5b3e1e02bca71e10118bf811499f09292ac4f 100644
--- =
a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dts
@@ -11,3 +11,29 @@ / {
 	model =3D "Microsoft Surface Laptop 7 (13.8 =
inch)";
 	compatible =3D "microsoft,romulus13", "qcom,x1e80100";
 };
+
+&i2c8 {
+	clock-frequency =3D <400000>;
+
+	status =3D "okay";
+
+	touchscreen@34 {
+		compatible =3D "hid-over-i2c";
+		reg =3D <0x34>;
+		hid-descr-addr =3D <0x0000>;
+
+		interrupt-parent =3D <&tlmm>;
+		interrupts =3D <38 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 =3D =
<&touchscreen_int_default>;
+		pinctrl-names =3D "default";
+	};
+};
+
+&tlmm {
+	touchscreen_int_default: touchscreen-int-default-state {
+		pins =3D "gpio38";
+		function =3D "gpio";
+		bias-pull-up;
+	};
+};
--=20
2.53.0

