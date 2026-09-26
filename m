Received: from outbound.mr.icloud.com (mr-2005c-snip4-5.eps.apple.com [57.103.71.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5343BDA4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428579; cv=none; b=Ahi3mbxxrvt/ac1I6uC2ryvQG0XtphmwmSKjOQ60j8LQEUb9diQj8JclLsSRv+cnKss7LBks7kARIH//RGn5GkFbHWq2YuLr4btKz9H8+PwjUL7mgzhYLn8UUJ9nSoGW75NvbeNhgZtHJZlV5aHn1aGLvFzpDFM0+J0hh72JQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428579; c=relaxed/simple;
	bh=P1dH9KuOeMeQEqbLrELlmbOTJ3DodkoEeJO+cctEBE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQKDu20gcEJkO/SGnfOYRxv4BlwNXjo3ahE5QL2n6T2d/E0Kh6lXwPsMKD14qX2GPCHhhIN+Rh1Nnkfvv0M3uKR/IlR6kGCQbxxtPZ+arWyT/YzJRtNYwwWbcGipyPzn0DFu9KftTFJU2XbtqrK/7R1pfXUDRPWIIMMkYichlT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=iIbqCwNu; arc=none smtp.client-ip=57.103.71.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="iIbqCwNu"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 1BBBF1800141;
	Sat, 26 Sep 2026 13:16:12 +0000 (UTC)
X-ICL-RepId: 01a0dddb-ed5d-75e5-b563-5afa38ef5de3
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGBl1cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428577; x=1793020577; bh=NF5Ymoy/TFPz3j54SGIF4Y0ccWVyeDNfP34JYyeetsw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=iIbqCwNu3RfjI/XzpYr8TTpzK0XDDBfHxtsT0qkUFHeUSLJMbXNaH+zJA+Z1ZBLCfMVWPf1MTtBcpeT5Ndmta8kLFl4r9gT7xJaZ4cX5vwdW1ZWaI9PGkzjg48TpwykHPpj99+H+Iv5JACdc1oaji+s7EUMUmcvgdyQqdu9iWp8A0Th+vaEQ2DLv8r+4XOic1hz85U9GRUUClxTyXSGLzxN5b3HLRHTS8DdK1m9MhPSxwt/iNE6ec+5sEfzLLXfemDKjamJrFhzUOVobNLvviy7NwJtknOCofKEjo6RL2B1mfHa49LhAvTskUsWEHvH92eis4TZRC/9mNpdyCfXMWw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id AC4C218000AB;
	Sat, 26 Sep 2026 13:16:09 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:43 +0200
Subject: [PATCH v2 04/17] media: v4l2-ctrls: validate av1 tile info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-4-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: EXEbBxQSGPv219gzAIejN7kHD4X1x9k7
X-Proofpoint-ORIG-GUID: EXEbBxQSGPv219gzAIejN7kHD4X1x9k7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX7N347PWavLXX
 /7bmHwGhRsYM1JQ+FRd/rq+5dunWZd8xfYXNLOGqNqInR/OIz5W71hoKNf7r/zd3v/KpCIp/3Vr
 eGBOtiugS5TyWmcRtkUGJ6/FGT2pfgUG0W2bojP6zdJMW4rtBst3YELSUHUHKclqLLgNH2pvyo1
 q0AQ9ww443NQNDi/AOjNNJYgwd8/OD7kEIfk4/LyWzrhcO22qFi0ERLXgnWGs7HVPeEzUyU44Fr
 mlFBJtlw122uF5/AmdSKYUZ+qPEYqabk+XZKReucBvsoOa7bwnhfZKnynclH7owNblEp140fgS0
 e8FamSpLR4eovQdFYmeYo9gwxmCku9YsSQYZ9SxZ3lnRxlKizKVPBJdOpaS9fY=
X-Authority-Info-Out: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=6ab7c59e
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=IjdaWMjaTc4ojD0rA64A:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABNg9U4mSoExiVij0CMQ5fENfFpih5oCmLPhApk4nc/+PbNYSdq2JqrFBhCRej7uoHn4Q80x4EE1rXuF/27sD/PVeCM92ztz+WgXcFVp7bbwgkQgo10Uz86iN9dPAGabiVd/OSO6wnvC59XS0j0hecYDfA8Tntk4DCbGv8FA2A2VhSMDaP75QWW10/Ln95i8WV8B6Mif11ofojo9zMn12LvF0cDtf5fHBaIjsa/X5gSdaZ7wgtp/ROFdfpH+4Ov+i8MtfentAAHbwE4pfBXmeFdVq7N4JNPxrNHYs1x3pcqrN4Z671lQsKQa7FYGTF0U51zi5Ge/UlTmj/cWINZTqL1c0b0W/jRr72f9yiYB4ObxphkYkWAKcPHrdJlpdlyA1aaBHOoVqFq6W+jy5j84rlrbgLj83rx7CNbSVeMOqrLBIM4mQ27VZKRgAN8ZIXq5wqR4qAafd7GDt64VHWajXLBkPA5w5SUuTusdnXoQ/kMtzgGW3EbDnVyHZSMikbdchH0i65sVhUZsWIffusUvWHs3JDPvAY4aIZP23ErGA3pBOAZpWKAYXmc8hHZdD89RBOJgUvB3h+PnMLV9KW4eP+l2QkCrbgao3eHaFfkmp/Cebr3OSTbpoDzWQHJNJ3FkpxS7+PEPCEoMDfDsVuqsDDaYBySU10dBH1Tbx40cW5w7+Nyk0paPeE38S1YW7S7S7L5XWKjvSwseeIqWSbN4QGAm/GT1FXWO146TOd5scpYQkZuIyetT1BBY7EeAojTA6xQ0+bKAGKUykr9mbNh4fajhQUzAOmpAY577FOR/91F4kJ1cadmkO9dTcQs41EbYrMIwoKSLvGY9y+dHRtSAM0QCC7ddm3hi6lOERqSj0KBvZgSrx7EBVrGAfQwpUJ3R4F8wAzRtiUK0EWoa6gCCBsKJHXvlST6eDkYZA3iJFMdod/

Many drivers use tile_cols and/or tile_rows, so make sure they are
valid.

Increase V4L2_AV1_MAX_TILE_COUNT to MAX_TILE_COLS * MAX_TILE_ROWS

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
 include/uapi/linux/v4l2-controls.h        |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 661a3a25da52..c3e7262ba4d3 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
+{
+	if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
+	    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	if (ti->context_update_tile_id > ti->tile_cols * ti->tile_rows)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_tile_info(&f->tile_info);
+	if (ret)
+		return ret;
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..abdfa102a77b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2939,7 +2939,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_NUM_PLANES		3
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
-#define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_MAX_TILE_COUNT		4096
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002

-- 
2.55.0

