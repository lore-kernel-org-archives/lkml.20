Received: from outbound.mr.icloud.com (mr-2005j-snip4-11.eps.apple.com [57.103.71.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62641F34E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428572; cv=none; b=PNlCBI7Waq02UDpCP8X3X6vHH1GTUgKOXGim7/FjcHXZos412cu3YH3zWVVk4H+W6JJWJfvhzQ++y82sZKnNhoN4TqrNL5ea+5Zs8Q3B5w2wlhoQNjUKbbAoBBIuY3xdryvzX9AorAliPbU2d2m47PxErYGqtKdZtfe8e5+FnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428572; c=relaxed/simple;
	bh=bD3DC8kWx26DUTbRaTyFMdVidCmTH9Wl8IDAE2cj9nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaoa9YpwXRZku7Y1w50ZHpJLygDiJjRTNO2Jj/lfkFQcf7rseSXiYFwaL/m1Rxl5dFaP5vl1cVOYpcFfWG63P+smuSmistDlf3BHR/+RLH3hlcdKFKxoXxY2BD2exT1TDfKByy5wdPAGnk0QgUWQ4gHglsnrdVGWwJcpDdS4ZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=kSI6kBHo; arc=none smtp.client-ip=57.103.71.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="kSI6kBHo"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 0BF0718019FC;
	Sat, 26 Sep 2026 13:16:06 +0000 (UTC)
X-ICL-RepId: 01a0dddb-d5ae-7c4a-bda6-96e155af0343
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGAF1cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428570; x=1793020570; bh=SbjAO6RCrxPvhLUjb8LVZwbaasaaTTV8jKAHmhfN8Y8=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=kSI6kBHovO/zvdlA/XXBRhXOiGquhld6cVQZ+tgUonU1LeD2it+kgQBEdXLgG8z2bevatw0TAsKA2lX4m7mWHykCnZT7DRPZOFMbOjA1630oP/pP4cy56G8F/m9raQDrzn7UMac0oNbYlAGZWXGKTdQQJpePqfSJpdNv6F1SXGzc+dxhH0VJK2dsyooZAYq0vaP2NJtMK8Cb2RRMWYkxI/ckmOP29OjoyqYq/ZxGm0o1Fw/fRqRz9A6nnt8C7FkvqSyIo8UlEe/lsnWRArcsNbzJ4C2rj0a61Ll6wG/o2DL4MjAm4Tc8gu1x+SP2hk7FIn+lJP4wMjnscEUkzQ/Zhw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id B31E71800561;
	Sat, 26 Sep 2026 13:16:03 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:41 +0200
Subject: [PATCH v2 02/17] media: v4l2: Add P210 pixel format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-2-ecebe6a3648e@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX4OvueoAjfGvP
 QhSI0gJXUrRy6NrZMFPgegicnwGF54s7DGTbB+bCKBuZUoaMEBDUkf+f8gC3xNmC8W6UIZnJXTo
 tBaz40OeG1fCN0yI5i6RR6UEPq72W1GrB8Medhy6IoK/WcTI2EzLmTThJtkcdosz6XfGQ8h0mLT
 5X8teE54R95Pi0kdTbYphUSGC2JWttRWOT+Zeh+aL4/JYUeXI5UPgTgP66hZXpCN0Iwyr4Sk3Eh
 APC6yb184kv17P5xohAUiSB/FCINnMHsTjrdbiL1X3TznaWqR8tLzyAG/6IIuEmMYlWd5NPUMsZ
 1FpQIsaEeQ92YkPMpU6lpX1sEb9vsxkuRa/hLIs2iTumPGsiCJJY8xpYQJekc8=
X-Authority-Info-Out: v=2.4 cv=Cueys34D c=1 sm=1 tr=0 ts=6ab7c598
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=SpoKuckLgBGHDaJ8CcoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TU6flb-C-9bfHnhEPkGy2Orw4psOvjY5
X-Proofpoint-ORIG-GUID: TU6flb-C-9bfHnhEPkGy2Orw4psOvjY5
X-JNJ: AAAAAAABVsmIbxZnVkp53me1UNAV74zABVixJIEdZlm+bElrWOF0OLmt/PRJ+ggWbUXGqHqhUuh+2vmRSdmYguP23zrjfgOAzbVq/a9l/M92gm7Dw0/rzL+pXcrgpE9wfQG4di+zly5K/SlM/4sBm7iEHkPtPMBd0F5gd8G/gKvFN4F2wlBNxjXGKeiJhjnpl+JY1HmfHlM7GJRQL1YIavThbwc/nxjsyHQlQn7jJvx5IYrr19q0TzO9juJ5I/RUBvYvNwjkRKehgpm5z7nYlGBgfVzbs6BrHMQv7MI2sCcQRGh6Put22g2fRblL9YbgnBEbmZ7xOUg4rfwqQ7YXZZY//QVZNOynjWJNz1/IWRbGERfi7a1RDxJo/UwH1oBKItiW4l1kJ7sYrIcYOCLA5UftNVfPZnXhGeSEVcH8VqgtF5fDEwBQASYnQAECvZ9d6+F3rdJuF66jYTlmag6M2/fPH/k2XwYsIb4uCtqeYmxbQmwd1drdbZZcP7ZOpe6Zhq2xF56tjijlgwB08cfahjoed0Urm87fQ0YNdlMICOhSqxuRwmirwSl8w8nTObG4yh5m9i0erVel5jDIySXTsZg24eRPaOIzatyd+cWDuJRbQV5FDfobKisIQb/oj2gA3YsEQSh4ic4fJOqkrDPCEJdx5GRjKprmm9eTnep5r7pua+tRhR3fWjB3sA8IMayG4a2h5Q+WWtkCAl8WFhvzFvY9gwe/TG37sWdi4kma2bd+iATK8RuamdYfvzTCIVRVCDuiMlu7JS/5fRBMdcNY4kqq2dzLkhKIN8/GnFpEO8GOHzDDxlhAlIb4u0JMwMJmybJNKT4cftrYMaDqkpJNKDY0DmzHYPhoS7qVUYF5GySxcIuMTUvv3g==

P210 is a YUV format with 10-bits per component with interleaved UV.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst          | 14 ++++++++++++--
 drivers/media/v4l2-core/v4l2-common.c                      |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                       |  1 +
 include/uapi/linux/videodev2.h                             |  1 +
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0631919bd667..f2d2e79698fa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -138,6 +138,13 @@ All components are stored with the same number of bits per component.
       - Cb, Cr
       - No
       - Linear
+    * - V4L2_PIX_FMT_P210
+      - 'P210'
+      - 10
+      - 4:2:2
+      - Cb, Cr
+      - Yes
+      - Linear
     * - V4L2_PIX_FMT_NV15
       - 'NV15'
       - 10
@@ -834,12 +841,15 @@ number of lines as the luma plane.
 
 .. _V4L2_PIX_FMT_P010:
 .. _V4L2-PIX-FMT-P010-4L4:
+.. _V4L2-PIX-FMT-P210:
 
-P010 and tiled P010
--------------------
+P010, tiled P010 and P210
+-------------------------
 
 P010 is like NV12 with 10 bits per component, expanded to 16 bits.
 Data in the 10 high bits, zeros in the 6 low bits, arranged in little endian order.
+P210 is the same as P010 but the chroma plane is only subsampled by 2 in the
+horizontal direction.
 
 .. flat-table:: Sample 4x4 P010 Image
     :header-rows:  0
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index c825820fd481..b78fc0845a16 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -325,6 +325,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P012,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_P210,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
 		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70735..1f2519ffeb2b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1369,6 +1369,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
 	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
 	case V4L2_PIX_FMT_P012:		descr = "12-bit Y/UV 4:2:0"; break;
+	case V4L2_PIX_FMT_P210:		descr = "10-bit Y/UV 4:2:2"; break;
 	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/UV 4:2:0 (4x4 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fa..5472e433ed06 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -659,6 +659,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */
 #define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/CbCr 4:2:0 12-bit per component */
+#define V4L2_PIX_FMT_P210    v4l2_fourcc('P', '2', '1', '0') /* 32  Y/CbCr 4:2:2 10-bit per component */
 
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */

-- 
2.55.0

