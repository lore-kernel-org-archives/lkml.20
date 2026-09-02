Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C14AD7D1;
	Wed,  2 Sep 2026 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377749; cv=none; b=mKnATmQc7+D/c4J/VcxRy1f4GNPyL+aGsM2IcaHsDx5JoDHq+2lNQoF/iPiLMsgxFAbpOUGB7AztZGQlNYNIX0K185BDdqgKczetaNtyeP14LwTmw+gobPYE5mPBJkdBfQdwv/CtJCzwg85akjnJWz97DvCIZ9R8Oy0ayojZGLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377749; c=relaxed/simple;
	bh=rJk8En0QRMfoYgXE17eaF+YhzDIvo+oJR8JOMBR2Rhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijuVONbvLAvLUuVULtBcCeYudHKm8cSwwpRYHZqN2Rg2Cf/wIf0rn15rFUUDHtqTftJjIZbTnhTah5ncD1OXzznO63oibM45VBl1Ask+RU+YmIkdT6c3ddIFufYHKPXvTLQ3486imoIKqKrPNGBK8Bpwlvzc94WeU0FcTf9xNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=auzQuNEi; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="auzQuNEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1788377722; x=1788982522; i=christian@themurphys.eu;
	bh=Z03m/SL1vQzfcmZbSGUSRwDN4feMUCxdiVscjLVEFHU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=auzQuNEiuYXkYa9ncStK4okrnDpFcEoGPEShvgquWWnQYW1cqeanmTWI7P8o5atl
	 35cNjhNDd2ORp1RaA4LG1rcUzSYRwf9nR10SnuBC9wFEXvqaekZuKg3rhg26IaLdF
	 j7f8zLPlOJQvz7PqidOslhiOXcAKVGPZYYZdmh9fwnvJg+X3oa3rUms5pO+LIyv65
	 4UwrPoqPDRQ0dTltlQEANgAhMKFJU9DfQCSVYebNLfNOMfM37ZEgfk302CE+gWEcw
	 dyddPCF4Ipy1jLSihp+4Ov7FHqXJC2QFznTE2H+PNeawMErj2MLCqolcSMt+uJVB2
	 cC2g+2vYgEZA6+UnOA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MdNTy-1wSn2Q2Lse-00oSQC; Wed, 02
 Sep 2026 21:35:22 +0200
From: Christian Murphy <christian@themurphys.eu>
To: linux-media@vger.kernel.org
Cc: hpa@redhat.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	tarang.raval@siliconsignals.io,
	jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com,
	Christian Murphy <christian@themurphys.eu>
Subject: [PATCH v2] media: i2c: imx471: Fix pixel rate and line length
Date: Wed,  2 Sep 2026 20:34:47 +0100
Message-ID: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dyFEuayzvkRv3OND+I/4Y+IK0jiqPAVT0WQaC1zlgs1Oe6+xiBD
 /EYeXESwlbVBcLUtypP1VKs2i1IUC9lmu0MX7V03v129tOFc1LW4fqauFcEv7vnBVhauiFO
 RozleVtBi1CUyi+/idaWHlXztCecp/yUglTJ1OCRhO6CeU/3S5Ol1cVJ3pwFfTcWhFJda4O
 iG49AktRVWBb+im6+a5YQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i255daCXgws=;sla8u3MQHdfXULEYFty3qV1H1r7
 AO+IK/lfkhJkwTW05d/0jsZxeUKTDrn3mZbFRnq/5qNB42MIn4H67JIHIdPQ87ID1hQs8PLms
 r36jSkYhfbGU75EvM336qEI8FKCIXY+QrPLZMT2MyotlMH45WbL5NmwPKoRxnbFEIzBKzASw5
 jkF/zBFU7gQdN7fhqQewBnp/qyW8BHr1i8416vp7vhowp+aY0yQcexY8L8tdpva2wNCvIWGjZ
 EfsgT8LTiR7CQSUWf1BI7QBF/5PnPQDbwYyZMWjn/ge/5Dvvl5zXZ1FQwmKVGMtxEPA7DmH4D
 pSEffhpq6VDkh53gtmru6WfNn1VGLcazD3KJaekBuzdiETNxl0FB8H3bRSm1N6wdChCwD5CBl
 3gx/H+a7kMRj1yvJc1QQBXQ9rEQRLI2/lqKU5TOgW4M/8YglvjyE6Rok+tEB+kXoKMuVS1afv
 +jjetF6JubaLXIZC1Bqm8uTlE6jXpG5IXLNWh4JzKVENtGgRUiSilHmYZrVoMTKoIJVmKvnzR
 RfL2JWokWky4hnRrcvJk5ZA+ZAtZ25SpljqReZtdbKnQUpUiDFNQgvbY5r9vxAJ9QQlxUXLin
 j4CntV4+/u4mRTbz5+o2atHhjVk44HgI48FoKg3HPqMKtRHhxrx5kGEc4JAhpbDFPI72XtOGh
 DTQc/izx0igleM9u5pH8PRhqZvsDu3tcG44Dy+iL7clpcYN4WRsOpOP6gh6MdR+ccmRONKZae
 92N/kvkWSYl3Ws9KiOP1F+wVrDn0+vV80aTv/JEDq9fz1pUs2HxuQiY802Ys9yyzURqXRrTEo
 N1FOzqU+QUYJACMC18ZRA2tjN6qWqGU4DNXjh20Fu1HIIidRt5HHDKmBreuABXNzn9T3cSxCQ
 e7ELR6cgCCxifi3FplUiL3UxYVbRA7wQiFATC1qb3ncKdL15KKLhSegJRQS3Tx901ZUkHtuEG
 ttNvKi8JAI/tmICxxWFdcRonpMfGijQwcl2hf5XhzfZdGx79T2lfd1OVqr6iggzhDOMCde4T0
 +I71KTJD6D9kPvIJY63cVT3QM+mavswwrp1Vyv3rvdUzW/OJK+0bs9gx7gpVaN4TCmFcLKifE
 z+ASw2oJ2PTVv+mQAPU2UBZTrqtHQzLY011XFbYvoFcCbiBgIWR1A3DcBJU9Io+lLaGOAlzzs
 cEZRNLDvm/EPFgN2OFWC3MUcBFBhO5WeNdmkxd66TJpQNfydlUoDNwgs2j3kYH/Wlw76nvaxV
 K8Sg9zIxbCuSyGXjicS4npiNYoRjW5XJPfE+5bFrD8q1Yo0JqieFS3qvi0cAonCoRoKPNIQRH
 eSVeIbj8jmJ9dtWT6/dCLuglqc2uc/9eLw3m9GYHKUY1/Jq9Kyp0XqArjbJLx1oIMcqvoxPZY
 1nQn26n9RPrU+plu0YGyu77r2rsPXEUI4v88hH9qHT2HkVX6gpPPakSGSC75UVT+YnAOwZV2g
 OJOaUJ/R9yTiFuRohM7AW5S9Kv+LHoAum0P8Xq4xHQFs27uh3I0S/g27OJ4CYPQmxhKlAeIQt
 sxCzpK3s4xNWaJur/hlqFhRGQTIA0G6ZrWRtZQr7V3iOOJ+VAvjsFlkaDe27LS4cdp58epOuZ
 LiVRO/UnDLRhT1Et2yu/j/OOINwtZSTJtYahKZ9QxWfc0INlUeAJVsjNfB5E7n0HAQrq1X95R
 hQZ1zgSuCx/Mj9AzQ3I1RpqcZuU2GdzKzu3+8+ePNWrXzAnvL0F50hH1axZbRQKYbbIvJCGKL
 SGAGZ7eEp9C74bgKZFdYQ4mAUAcRCCWNmV0QvUrcQCviK2meO5kAIqPq160qlL9lSn4JOYZQC
 G6iNUD1FsVrJwI/sWE6lrWiPhllD53DzgKb52UU8YKZjBC/CwC4zCWVI7SVQeIOBhg/g7SX/S
 RqoAUuajI/291yMDyl5SbIqG7AErVl+0C2XL/zoKSJlkYWp8PybktcULuDsnXra0d1NDhh49f
 wIcy2tu9+Sk9s+TDoYDjQPf4nIzL8M/ZWl+mOqJ87DtlSjHSahYj2tKCHM9WNSIo0bf1gmFZf
 PBg2sobsMUiGBIobcjyk6CfWUAb/5Og3xC2qOwMo6etwpb5MNu98RrZuPBScDdQaQvumB1hXn
 2FkBBmhyO47tiWKc/kEfonvyyPi7TKaDO/Aju7xeqQzYmNFVFO7EilIAkwRrD50sTnT7PJcMP
 M1TbmKzvlpNtuH/MKTJZ7808vIcC5jtoFCIL14CRDZQ0ikrBgEGDlRI49IPJa+CwVAX/8/5Z1
 FsqPTLuJ1ndm42mED9hZtJ6QkGv0lQxxnNG2h8uG2MuafHMqRO75wC01QLqGG1zk/hFZPI2vM
 S5LbBI5/7iynvwi4IboEkJbySBnt0+zpNCjnNq7rWMLQWCdA=

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

Derive the pixel rate from the external clock and the VT PLL
parameters the mode table writes, and set the line length to 5120,
which changes HBLANK from 400 to 3192. No register write is added.

Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dri=
ver")
Link: https://lore.kernel.org/linux-media/20260728042013.23707-1-hpa@redha=
t.com/
Assisted-by: Claude-Code:claude-fable-5
Signed-off-by: Christian Murphy <christian@themurphys.eu>
=2D--

Notes:
    Changes since v1:
    - Calculate the pixel rate from the external clock and the VT PLL
      parameters (Sakari), naming the three the mode table writes so the
      table and the calculation share them. The object code is unchanged.
   =20
    v1: https://lore.kernel.org/linux-media/20260830173345.15886-1-christi=
an@themurphys.eu/
   =20
    LINE_LENGTH_PCK reads back 0x1400 (5120) from the streaming sensor.
    Written to 5632, 6144, 5008 and 5120 in one stream, the line period is
    llp / 387.2 MHz at every value (14.5457, 15.8680, 12.9341, 13.2234 us)=
.
   =20
    Tested on a ThinkPad X1 Carbon Gen 14 (Debian linux 7.1.8-2, libcamera
    0.7.2): controls read back 387200000 / 3192, 17.296 ms frames, maximum
    ExposureTime 17.057 ms. v4l2-compliance 46/46; W=3D1 and sparse clean.
    The driver is new in v7.3-rc1, so no Cc: stable.

 drivers/media/i2c/imx471.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..0559195bcdd2 100644
=2D-- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -65,9 +65,12 @@
=20
 /* PLL */
 #define IMX471_REG_VTPXCK_DIV			CCI_REG8(0x0301)
+#define IMX471_VTPXCK_DIV			6
 #define IMX471_REG_VTSYCK_DIV			CCI_REG8(0x0303)
 #define IMX471_REG_PREPLLCK_VT_DIV		CCI_REG8(0x0305)
+#define IMX471_PREPLLCK_VT_DIV			2
 #define IMX471_REG_PLL_VT_MPY			CCI_REG16(0x0306)
+#define IMX471_PLL_VT_MPY			121
 #define IMX471_REG_OPPXCK_DIV			CCI_REG8(0x0309)
 #define IMX471_REG_OPSYCK_DIV			CCI_REG8(0x030b)
 #define IMX471_REG_PLL_MULT_DRIV		CCI_REG8(0x0310)
@@ -232,10 +235,10 @@ static const struct cci_reg_sequence mode_1928x1088_=
regs[] =3D {
 	{ IMX471_REG_DIG_CROP_HEIGHT, 1088 },
 	{ IMX471_REG_X_OUTPUT_SIZE, 1928 },
 	{ IMX471_REG_Y_OUTPUT_SIZE, 1088 },
-	{ IMX471_REG_VTPXCK_DIV, 0x06 },
+	{ IMX471_REG_VTPXCK_DIV, IMX471_VTPXCK_DIV },
 	{ IMX471_REG_VTSYCK_DIV, 0x02 },
-	{ IMX471_REG_PREPLLCK_VT_DIV, 0x02 },
-	{ IMX471_REG_PLL_VT_MPY, 0x0079 },
+	{ IMX471_REG_PREPLLCK_VT_DIV, IMX471_PREPLLCK_VT_DIV },
+	{ IMX471_REG_PLL_VT_MPY, IMX471_PLL_VT_MPY },
 	{ IMX471_REG_OPSYCK_DIV, 0x01 },
 	{ CCI_REG8(0x030d), 0x02 },
 	{ CCI_REG8(0x030e), 0x00 },
@@ -282,7 +285,7 @@ static const struct imx471_mode imx471_modes[] =3D {
 		.height =3D 1088,
 		.fll_def =3D 1308,
 		.fll_min =3D 1308,
-		.llp =3D 2328,
+		.llp =3D 5120,
 		.default_mode_regs =3D mode_1928x1088_regs,
 		.default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_regs),
 	},
@@ -691,8 +694,9 @@ static int imx471_init_controls(struct imx471 *sensor)
 					   0,
 					   link_freq_menu_items);
=20
-	/* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
+	/* The pixel array reads out two pixels per VT pixel clock */
+	pixel_rate =3D IMX471_EXT_CLK / IMX471_PREPLLCK_VT_DIV *
+		     IMX471_PLL_VT_MPY / IMX471_VTPXCK_DIV * 2;
=20
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
 			  V4L2_CID_PIXEL_RATE, pixel_rate,

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
=2D-=20
2.53.0

