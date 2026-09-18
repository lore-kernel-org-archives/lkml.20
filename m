Received: from outbound.mr.icloud.com (mr-2006b-snip4-8.eps.apple.com [57.103.70.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5834EE877
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737353; cv=none; b=PWOSal8xfZP6RK1ipNcbQ8ITDG6i9Ai35iFzYTnkPTAzsXTbtQMdP9XATmjAo534TnsNGhp5rpO3GzbxqBmIy5R3oFcpcEbLiGRkwGg5hmlupZyRv5kDBqYN0CqsrFhBDAHDXXWghqXQTGAuuV7UgIvD6yyyMfE2niYlMSpXtE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737353; c=relaxed/simple;
	bh=TpfVzg/o0+flcrP5jGPn7glWbOb9l8ozS11Mhy5QZG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pU5G90uGAhzCkc5aF5dFNsBEWIBXpmtGWzzlgpIbH+rKd7UgKe25NSZ0xbz/kMeRwUSj4REGDvKPJnG56YG17tYOkqax0rGYgSNEow8rm1H/e6S01KmWcJ+BYoGBm4PdfukQIRMj5FyOOLPBnqlWggwpSyhInVQY3J6xt3cut1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=n3SIX7yN; arc=none smtp.client-ip=57.103.70.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="n3SIX7yN"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id EF95B1801878;
	Fri, 18 Sep 2026 13:15:44 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-9f61-7b78-8aa0-6d87e68571e2
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGA10NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737350; x=1792329350; bh=2ra59WfJb1Td+zzHnAJy6s+dAtb1vmFdzxQdY4PbQxA=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=n3SIX7yNVHty7ZdX6XylCdP4qakGokQcjr0o76FWr8olNpeSP4YI+F/i10/PDlG2xhm8X2xv/xcISNKfzN2eSdDH36CHvhIyu4I4Z5pcTvhI6rHzD2VcDsHh4YEePz3WIMUCD1naIxmAcqNAnpSZm42xZl9qzAX3OryeSq1IxHstefVyblZfw07pivnmgKHGbc/vckD0PLTsxI2/T4lIZW8ciUMM9Q25iuvuj7T8tXU/3m/SvtFkDqUGiaSYpOCdLOgThLWyGYaX3Psi2uY4HfcE2Uka7OKD1ulDn/MiSat1On2LaeW02czJZMR6SGdRZI1T3DPRwS1Fp9cZbVHIAQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 6F45F1801853;
	Fri, 18 Sep 2026 13:15:41 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:06 +0200
Subject: [PATCH 01/14] media: v4l2: Add P210 pixel format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-1-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: kzhGWJTcw42M2A7t4juD7sN9WIJU03rY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX3Fy6A4xlhU1e
 PF9/pa5E2aM9Y2TTdmRxgOwD6kJL8wM+6iqalxLUlj1JPyi/57DQOyn0XCFu4tJTk/xnME9gAK0
 HCEB1Ns2lClGHzYxIdM6H26MgwdOLzDbr5ygBj2EDSurPs0QltvBFd9sh0M+ACTynBiOOQQgk/9
 DDZ7dt98OHB9kZgBpbWpSlw8p6po/lCICk/O2sAdqkhReV1yPG+KRYi1zHPwplzLjMwNMTlHkpX
 0MQGGqsMHG6Vj6l37GBZYA8KJVHJ+GlUkmIzjTvLRDhuR0Eu2snINJzk78w0NI/xWPkMh1ZYrPF
 MrR+F+bdEWRccJW9Jy/P9PL8n6js5yRIMqliDGKx0e655RJ1ybn4z7teHjUYww=
X-Authority-Info-Out: v=2.4 cv=LtafC3dc c=1 sm=1 tr=0 ts=6aad3985
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=dTfWxpUtucAophMp4g4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kzhGWJTcw42M2A7t4juD7sN9WIJU03rY
X-JNJ: AAAAAAABKZT68bqb9BXh7HQzfM6clOzkIqYw9/alC7rbs2QEZ3eMDpXlZX9rKY0yn02O/PEmO9LZ5vo4811XlxRmAqcIA4C42KdNavU5LxGc5srdz19RV7vhDJKeTaPerjJlagjMxkcIwjINDufqCKM1fHPnm/YB2yKNZWqPpsC9gCBr44SpuCOl5D+qnUt4LFZF44Gsv/oT2faWVRyN8o+dkYk/onPzTNqbmmQaK1a700rfjzvNXW9KVc2B8QoiX66o5AWLT+LHG0ps7WnB/lR7zTijYdyr52BuB3rZqSkA51HzKLkqnVkmjyrbiI0KixrXGN2B9lMkhArepnew9cNQJ66gFcD6MgUObdcJHqoUu/0hoOpP5/V+ngZRPzD9q62YgqOMyq46oG0w7GcEYk6ccA5N7u5xTFKncA1oS+xKJUwuDMlOuHBTTUsvONww5wU8IuMQbM/wERYWpwIVDJIOaaZ+7spdZEJkV2X1UyC2/vTSTjoz0fv/I4zrCMOAjnlVjjgNltSV56vOm1TFG2HnHTW77QaK8CGNjf8ct+OhvNLAjNv7OP6c7+VgZtPI6CLyMhDVeQ3HfbD0nmN97+h+/fFByB8BsB1noMN/M9jKsm9ihDtErNNwV/+Wb0KHIr9l+0OenmcjL+W7yAFYQHE5OYvmCNbU/GH5XyE8sQCLty1eXy9pnslbGylA8erUoF4Hp65lUI8RKY74ReJ/7nS8nRofNq5ThjCkDDi814xuebz+fQd12QHXsnNfJTNGI+LiP6kyz2t1p2RkyfTBaMb/Zy7tih8cXRz7OPZatACgIx9I0J8Pb5Ly4qfA9FtFVJkqXRplUExOmWZ+uVhIGJLjSznqD1UxDj8SQrSrQId2

P210 is a YUV format with 10-bits per component with interleaved UV.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 10 +++++++++-
 drivers/media/v4l2-core/v4l2-common.c                       |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                        |  1 +
 include/uapi/linux/videodev2.h                              |  1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0631919bd667..8509f2415c9b 100644
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
@@ -834,8 +841,9 @@ number of lines as the luma plane.
 
 .. _V4L2_PIX_FMT_P010:
 .. _V4L2-PIX-FMT-P010-4L4:
+.. _V4L2-PIX-FMT-P210:
 
-P010 and tiled P010
+P010, tiled P010 and P210
 -------------------
 
 P010 is like NV12 with 10 bits per component, expanded to 16 bits.
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
index 5373dba640fa..b5949c378f2e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -659,6 +659,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */
 #define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/CbCr 4:2:0 12-bit per component */
+#define V4L2_PIX_FMT_P210    v4l2_fourcc('P', '2', '1', '0') /* 24  Y/CbCr 4:2:2 10-bit per component */
 
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */

-- 
2.55.0

