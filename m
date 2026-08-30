Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37F3B71BB;
	Sun, 30 Aug 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111249; cv=none; b=CDHIuevVbBryW3dCfaXjWc5uuGIAioCFCPWEemiuSrqHmFnmsiPG4bAT8bzX92mCUWGL8PgBe1lAZQnSfjs4tdz2fdqjET7mtDII6PTGUz0DTQD25kMII9xnohoC009/3dhs04IzjvQcvEKSQADNLdMamcicXTkX/kxaQTKeu7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111249; c=relaxed/simple;
	bh=s/92348jRP6269mIxI1Kdv+Oa/BEZJNWF1roWsEKQqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4HvlEG5d4Xlqk8fJJNhhpSnrD2ev4lOXo09BEQ0lbvqjaeQ7SqYXgiTrcQZxUuQ/DTJjOMLL56aG+FQ078kGbN3VsMXK+etJFDwGFjhXov0SsgsYEMjPrJK/kRuuXJA9rkvhh0CXYRReCZpzhpO8dSXq9yuzggy6ag37YW9A1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=oln1DZBa; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="oln1DZBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1788111231; x=1788716031; i=christian@themurphys.eu;
	bh=zrfOUbmlUBAPXl3rgn7B1xdEsiBW5cG3AtqHwJQcP7Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oln1DZBap8wjoTkq9x4N/0Adwf2Jl9DHH2bOG+KrNSbXBnvub/q07GnsnR0NWQG8
	 S/jedwVX14y9DZFxKXMjQ1vFlm69uViIoYAQYWLi8oCu224InLaewIWbAbrqatxAZ
	 kCCo20dOLfA2LIPuQAY9+dW5iJNGhZLnp0SjBDpQLyd+AsQ+bogYBbNDeEoVIx1/X
	 8k/32Gs+JvDBzeX1B/Uf3nKn3vh9VJbR3IuTNG6gQKKxhw74IjeqVvbGjsuZE2XrA
	 A9tHPZkleaUGw6WBJKloWheuVCefPaPwcpOQ4Wg6OtwDLiuX6tuF7T5kRlNWDGAx7
	 8ZwWRA5tYsNd2NPh1w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MCJvA-1xA34P27XO-00ALkg; Sun, 30
 Aug 2026 19:33:51 +0200
From: Christian Murphy <christian@themurphys.eu>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	tarang.raval@siliconsignals.io,
	jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Christian Murphy <christian@themurphys.eu>
Subject: [PATCH] media: i2c: imx471: Fix pixel rate and line length
Date: Sun, 30 Aug 2026 18:33:45 +0100
Message-ID: <20260830173345.15886-1-christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K8EECfPEYaz01tXdH7HrMV8Dzy8hCR1JnN0+zg9N8zQM+2RbKpZ
 w0PetQoE79wAL/rP0k6yoHn5sJrEiLUcQ9kge6yEqt7m4N36cCsVnsd0/YPLEyTlfO9sL5C
 hO/6RGfb+IZOHmtWwOMIzrdpzrp+Eb228pZ5oXzLOhxvhOAPP8JBgsHT7t2v9rdGvaTqNAT
 b+f/tlQIljokgPh0/lQzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cb/u6g1eO/0=;+7Tf0AX5aWxf+F66MtOFZFGTJkb
 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
 9RsuHjC9A==

The pixel rate is derived from the CSI-2 link frequency, 200 MHz * 2 *
4 lanes / 10 bits =3D 160 MHz, and the line length is the binned array
width, 2328. Neither describes the pixel array.

The VT PLL gives 19.2 MHz / PREPLLCK_VT_DIV 2 * PLL_VT_MPY 121 /
VTPXCK_DIV 6 =3D 193.6 MHz and the array reads two pixels per clock, so
the pixel rate is 387.2 MHz. LINE_LENGTH_PCK is never written and its
power-on default reads back 5120. Timing frames at several written
line lengths confirms 387.2 MHz at every value.

With the declared values the line duration comes out 14.55 us instead
of 13.22 us and exposure is overstated by 10%: libcamera reports a
maximum ExposureTime longer than the frame.

Set the pixel rate to 387.2 MHz and the line length to 5120, which
changes HBLANK from 400 to 3192. No register write is added.

Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dri=
ver")
Link: https://lore.kernel.org/linux-media/20260728042013.23707-1-hpa@redha=
t.com/
Assisted-by: Claude-Code:claude-fable-5
Signed-off-by: Christian Murphy <christian@themurphys.eu>
=2D--

Notes:
    LINE_LENGTH_PCK reads back 0x1400 (5120) from the streaming sensor.
    Written to 5632, 6144, 5008 and 5120 in one stream, the line period is
    llp / 387.2 MHz at every value (14.5457, 15.8680, 12.9341, 13.2234 us)=
.
   =20
    Tested on a ThinkPad X1 Carbon Gen 14 (Debian linux 7.1.8-2, libcamera
    0.7.2): controls read back 387200000 / 3192, 17.296 ms frames, maximum
    ExposureTime 17.057 ms. v4l2-compliance 46/46; W=3D1 and sparse clean.
    The driver is in no release (7.3 merge window), so no Cc: stable.

 drivers/media/i2c/imx471.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..7a1335873270 100644
=2D-- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -282,7 +282,7 @@ static const struct imx471_mode imx471_modes[] =3D {
 		.height =3D 1088,
 		.fll_def =3D 1308,
 		.fll_min =3D 1308,
-		.llp =3D 2328,
+		.llp =3D 5120,
 		.default_mode_regs =3D mode_1928x1088_regs,
 		.default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_regs),
 	},
@@ -691,8 +691,8 @@ static int imx471_init_controls(struct imx471 *sensor)
 					   0,
 					   link_freq_menu_items);
=20
-	/* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
+	/* pixel_rate =3D 2 * vt_pix_clk, with vt_pix_clk =3D 19.2 MHz / 2 * 121=
 / 6 */
+	pixel_rate =3D 387200000;
=20
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
 			  V4L2_CID_PIXEL_RATE, pixel_rate,

base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
=2D-=20
2.53.0

