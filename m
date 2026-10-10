Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2E3DD84C;
	Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624197; cv=none; b=Tfuc+M5sf52z3utjWpiNspUffLwhJGE3smmJOFImyYwxCqYWhPQrN1TpQSp0i/8scOTRHQO4QQsejWww0SFf42XP8TWGyxnfpN0acSBMxhz6zDlXM1/Y3q6gDnJyrlC6Uxx8r6Aw7Ec0bKn6QiVl2tUyViOpZi23sV6YgXMdao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624197; c=relaxed/simple;
	bh=35UXQOKsSUyzUmRm4QXI64G7KT0RcraqiIbU8K3I6e8=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=PyaIT3vOBcSVd1th3vc7hCnDWY5rKwhNus0sYyDggLpOROFQozelI6jmTs+fTED0Ci+LwbMhzyq8WFeVepWxcX1J55jDBnjhdQCB63/QMOpYTdX3Txlf1iXyvgXWxoeafNQ7HcoHrItJ6MCm6oLgXxp2cy1zy8/TdRyLEGxKsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=HFgyheHQ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=qaFA8rNc; arc=none smtp.client-ip=23.251.234.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="HFgyheHQ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="qaFA8rNc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791624193;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=35UXQOKsSUyzUmRm4QXI64G7KT0RcraqiIbU8K3I6e8=;
	b=HFgyheHQf/u8ixsbfD5H0wq9/H0tYn39TNGD21NqTT5AkKePhV1n4VhQjwH0F+1b
	ZMjTRgIaTlHGDCuMVY4X7b6aejIENJhxnyN9rCpR+MlqEkErtbYQPieCJzwe4U+o5VY
	LhWqJg3vh67qyas9VhKJuomhvARTF7ES4qNpo7PA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791624193;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=35UXQOKsSUyzUmRm4QXI64G7KT0RcraqiIbU8K3I6e8=;
	b=qaFA8rNcRUzvPj/hVtOXa+88q8kmmI3x47kv4+DJ6jgX/IOc4K8e0TVJjqT6Mr91
	2y+w2AiXf6gs5k9R8jJK1k5rUk7lth0ayCTqxoFB4NmKAK2F0ufk5mu024qvVqPzGhN
	URXsrk5tBFTfNNnOXFUsWsVDdGGwLKKGVzV9oFpU=
In-Reply-To: <20260918221832.323751-2-pm@petermarshall.ca>
References: <20260918221832.323751-2-pm@petermarshall.ca>
X-Mailer: git-send-email 2.53.0
From: fQwQf <fqwqf@fqwqf.xyz>
To: Peter Marshall <pm@petermarshall.ca>
Cc: benjamin.mugnier@foss.st.com, sakari.ailus@linux.intel.com, 
	sylvain.petinot@foss.st.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: vd55g1: correct VD55G0 register access widths
Message-ID: <010601a1251fa584-0a1ee46a-7513-47e2-8591-3d203253ebc6-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:23:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.10-23.251.234.52

The VD55G0 frame length at 0x0458 and cold-start coarse exposure at
0x042e are 16-bit registers. The current 32-bit writes also overwrite
the vertical start at 0x045a and cold-start analogue gain at 0x0430,
respectively. Use 16-bit accesses to preserve those adjacent registers.

The applied analogue gain at 0x0066 is an 8-bit register. Reading it
as 16 bits also includes the next byte in the reported gain value.
Use the access widths from the ST reference driver for all three.

Link: https://github.com/STMicroelectronics/vd55g0-linux-driver/blob/a05627=
b0f6d8775aa54b6fa306e91f425f2cbf9e/vd55g0.c
Signed-off-by: Jizhou Tong =
<fqwqf@fqwqf.xyz>
---
Incremental fix for your VD55G0 support series:
https://lore.kernel.org/all/20260918221832.323751-2-pm@petermarshall.ca/

The same register definitions are still present in your
vd55g0-camera-support-v2-9 branch at 4a04accd5f68.

Validation: ARM64 W=3D1 driver-object build; descriptor checks against the
ST reference driver and emulated adjacent-register/gain-read tests.
IR capture has been used on SL7 with this fix in the downstream stack.

 drivers/media/i2c/vd55g1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 =
deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c =
b/drivers/media/i2c/vd55g1.c
index 1a93e0fde5..b20f086f25 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -182,10 +182,10 @@ static const int vd55g0_reg_map[REG_MAX_INDEX] =3D {
 	[REG_MANUAL_DIGITAL_GAIN_CH2] =3D CCI_REG16_LE(0x0454),
 	[REG_MANUAL_DIGITAL_GAIN_CH3] =3D CCI_REG16_LE(0x0456),
 	[REG_APPLIED_COARSE_EXPOSURE] =3D CCI_REG16_LE(0x0064),
-	[REG_APPLIED_ANALOG_GAIN] =3D CCI_REG16_LE(0x0066),
+	[REG_APPLIED_ANALOG_GAIN] =3D CCI_REG8(0x0066),
 	=
[REG_APPLIED_DIGITAL_GAIN] =3D CCI_REG16_LE(0x0068),
 	[REG_AE_FORCE_COLDSTART] =3D CCI_REG8(0x042c),
-	[REG_AE_COLDSTART_COARSE=
_EXPOSURE] =3D CCI_REG32_LE(0x042e),
+	[REG_AE_COLDSTART_COARSE_EXPOSURE] =
=3D CCI_REG16_LE(0x042e),
 	[REG_NEXT_CTX] =3D CCI_REG16_LE(0x0478),
 	[REG_EXPOSURE_MAX_COARSE] =3D CCI_REG16_LE(0x096c),
 	[REG_CTX_REPEAT_COUNT_CTX0] =3D CCI_REG16_LE(0x0476),
@@ -194,7 +194,7 @@ static const int vd55g0_reg_map[REG_MAX_INDEX] =3D {
 	/* Context properties */
 	[REG_CTX_STRIDE] =3D 0x30,
 	[REG_CTX_EXP_MODE] =3D CCI_REG8(0x044c),
-	[REG_CTX_FRAME_LENGTH] =3D =
CCI_REG32_LE(0x0458),
+	[REG_CTX_FRAME_LENGTH] =3D CCI_REG16_LE(0x0458),
 	[REG_CTX_X_START] =3D CCI_REG16_LE(0x045e),
 	[REG_CTX_X_END] =3D =
CCI_REG16_LE(0x0460),
 	[REG_CTX_Y_START] =3D CCI_REG16_LE(0x0462),
--=20
2.53.0

