Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCCC223DE5;
	Tue, 13 Oct 2026 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860104; cv=none; b=BQyzFXOHEFb31Bo0sTrsBZM8OwuxSftnOLkwNGFHLeBWYSCdBGOg+Pbki/NDCfYzQbwfsxW5w99eq3AI1Vaz+xnDhBr7pvVrLR+ELQogIWkXiA0zCLeaEM6OhOa31i5GWh/Oacl//nfLyOjaSS0VX59LkNj1jso0ZIm3O5vZ2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860104; c=relaxed/simple;
	bh=dEQvCGUPJ6gjTfJs2TuyXRoJZgIt9g+HnVrDLtKutS4=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=V+s+SrJSsNhQcdOxImMqyXXQrOtKxfKcB4VdTGTn7Tlbgs4xu164GuIilrHrhtG5qtAAtPGzrl5bL0Tjl2RriV2DBvuxTBo3TA4l3oz/1ojyQfCIfyNnxx1kpoS6FFG82ulYVF0//9MkH7QK4i8GOEpYXa+t6wQ0Rvgnb7q89lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=Udv5xJs8; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=sj8KF3HG; arc=none smtp.client-ip=23.251.234.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="Udv5xJs8";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="sj8KF3HG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791860101;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=dEQvCGUPJ6gjTfJs2TuyXRoJZgIt9g+HnVrDLtKutS4=;
	b=Udv5xJs8QFXCh7oSTEIe52eeuGczl7QRbY/O0QAGjbDxxlqiRHKAgVbtWENKG7nO
	4R1lCDIdNiqeN3/sKIjvUDQtf8Wykw32hd+ufwGZQWQufc1GlGpeGhyv81JmabG05fq
	X9m6yzGMncIbdQbraWQcy/3T2zUmu4ENWHND0oI0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791860101;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=dEQvCGUPJ6gjTfJs2TuyXRoJZgIt9g+HnVrDLtKutS4=;
	b=sj8KF3HGs8QjjTN09rBRUwGVx+iGifcNaTTN4TxTCLy2u5x4180m1x+yr7HyrLij
	FIyvtArD+Si56gxEFl4myIJMdsz14Xb/M5b4JqGhasWyIHbkWj58g4Wrd26BrA/LaeG
	4tAg3L2bYMixEgNNOBx28o+1Cm+ZmHXvJbK18pVk=
In-Reply-To: <20260918221832.323751-2-pm@petermarshall.ca>
References: <20260918221832.323751-2-pm@petermarshall.ca>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Peter Marshall <pm@petermarshall.ca>
Cc: benjamin.mugnier@foss.st.com, sakari.ailus@linux.intel.com, 
	sylvain.petinot@foss.st.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: vd55g1: correct VD55G0 register access
 widths
Message-ID: <010601a1332f51fe-f5c0bb2d-cf7f-4e99-9feb-1e8f65057945-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:55:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.58

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
Changes in v2:
- Add base/prerequisite patch IDs and =
make the unmerged dependency explicit.
- No source changes.

This is an incremental fix for Peter's unmerged VD55G0 support, not a
standalone change against media-next. Apply the VD55G0 prerequisite
changes first; the register map does not yet exist in media-next.

Prerequisite series, VD55G0 support patch:
https://lore.kernel.=
org/all/20260918221832.323751-2-pm@petermarshall.ca/

Rechecked on 12 October 2026: Peter's vd55g0-camera-support-v2-9
at 4a04accd5f68 and v2-8-on-master at b42bede8bce8 both still have
these three definitions. This patch applies to both source snapshots.

Validation: ARM64 W=3D1 driver-object build; descriptor checks against
the pinned ST reference driver and adjacent-register/gain-read tests.
IR capture has been used on SL7 with this fix in the downstream stack.

 drivers/media/i2c/vd55g1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 =
deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c =
b/drivers/media/i2c/vd55g1.c
index 1a93e0fde5506f53e4df62568b913a4ae8633596=
..b20f086f259f3abb1d193a1812e70da3ba65e4dd 100644
--- =
a/drivers/media/i2c/vd55g1.c
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

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
prerequisite-patch-id: d4474f51d7a10cfd10a316ec2b09936490b14a79
prerequisite-patch-id: 0017cc56bf769ab00e67bdc0c5214951447cb716
prerequisite-patch-id: 95a2d9ff8168eb17010538d80f4b5428e2b7b798
prerequisite-patch-id: e717e32eac916ccafccf9e7a552ca0030085daa3
prerequisite-patch-id: 8fc4f7595aac33a2164adb41c139dc3218be5bc6
prerequisite-patch-id: 52bde56940b545c0e5f44d12811f9b9676bc311c
prerequisite-patch-id: c0b93409e330d4b874b3702d67b57e2c4b0bde32
prerequisite-patch-id: dbc6f65015852bbaf31e5f4efbee52c60bafb79f
prerequisite-patch-id: d5c9bb074014a20938df8b55bb9088aa7b26d37b
--=20
2.53.0

