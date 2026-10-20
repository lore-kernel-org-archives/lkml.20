Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489154;
	b=NBjxUcUivvt1XHoh3k35DjBmGMSxeGIr7UY3syuoF8ZG8wIQbXXLdm8wzQQOxpEa62vt
	 iVe6evro5aNjqnomPSlecU3UPkvxIHbNvu9MY8WnvpdtKX6ykroqS0Et3f8SfM2ULJ65P
	 0AbB5AD4BJkjH4JyYk6lKvvSKo3eDCbkR0A+juTd7MFITJ3dheZ1Cx5OPQLrQt++7wQ+o
	 37EQ1YLW1db7/REYQaLNa16iUXQmx1spXOVbFY43ga7aS98MrFa0MYHZE+eJAjChnaYba
	 peguCB5zxjnoeW9rMCzYMtuLmHXfJSMLdIEqA4Zpp/nz4goTcRrXSMJ9k0/C84c/3Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489154;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=UiMRkhpx9tlueenKCNU5oX+f0lzVMx9F/X9orrtCMYY=;
	b=KRAAqBON/DYN6rWnm72mI/8+v2vR1Tt/jOp5q+f5YIix/eQZTZEmRvWKmvBYpwHW1lN7
	 IQpF3aC2/M+JTZ8IqJnfpVRqceQqmaf9LoxLQ0LJ0KSRaxUzrE34yvADfBqc3SSTn70Wf
	 VHkry+VtKnd1pj4wCMoVtu6CXMPOJ9ffI/mXQeqMOcZgr4hOwA4mbXaj2RJA14GVFoRyQ
	 y7F9B3W1AcVe3APKeI34tVqwkWsuetsDblevzkX6kjbZn0itj+thJfoEHAXvVGUJ+2d5k
	 ofuL7UTp6XBVlIrBEU6zSi8mIGkLRWs81C59oZS4nWe0KzXAEjbXNzN+gxccXmVwj/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b="fCFnzE/q";
	arc=none smtp.remote-ip=57.103.79.121
Received: from outbound.st.icloud.com (st-2005j-snip4-8.eps.apple.com [57.103.79.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583160A260F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3583160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=fCFnzE/q
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id B564C1800698;
	Tue, 20 Oct 2026 09:39:08 +0000 (UTC)
X-ICL-RepId: 01a158ad-d0b8-7d56-870b-19f80073342e
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGAF0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489153; x=1824025153; bh=UiMRkhpx9tlueenKCNU5oX+f0lzVMx9F/X9orrtCMYY=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=fCFnzE/qhfQ0D5CJLGvzWwcf1K/eG7pCeBSYPpCrN3YFJ2xZdYYljEhwuX54W8Ap9GWc8ZtGCBoNWc14gi8BQ843XES/pVDrPhxAEgPEA9pjRMqg+Wmkj15KNAyw4+ZThNf+XmJdM3EQUDFpKRctcxtT5YwtnnC960ijy+ywHOZXqGDkWD+Iu7BYwd3eNDyooewbZGdTnOlmXtJx7J7LlHMeVOjsVX5tJ1pB7n1D/skYaVEyqPoXTqRLGWk4n7kByaSGstMbtW2Jhe2uyWb3RNQi/+H9FUeFtuW69M3Ad7y/gXqmCCnBhZKE6vZ7X24yYkbd9WWUxXg3InXKcRLMXg==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id A3DC81800206;
	Tue, 20 Oct 2026 09:39:05 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:43 +0200
Subject: [PATCH v3 02/17] media: v4l2: Add P210 pixel format
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-2-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: vkrDs2Lrw2bl6Nj1nShFY3z2WnMjhpUP
X-Proofpoint-ORIG-GUID: vkrDs2Lrw2bl6Nj1nShFY3z2WnMjhpUP
X-Authority-Info-Out: v=2.4 cv=SOVPlevH c=1 sm=1 tr=0 ts=6ad736bf
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=SpoKuckLgBGHDaJ8CcoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXxdY2cbwiiEoy
 ChKHy/MiJC7InzyOlnss+Cv1dy8q8+KgJFd7oyplfLs0IPd3PJBdUe23fHdCkNSv6eaE9mzMrPY
 JjzbcakcPRoVDl1OtoUiktcndJqioJrXg6U3hy5NzaFnstX1YIBn7AO96pnXOiK57IV525M4yLV
 htpD/s5lnwPzLed3LlrEUN4lrVatEQrvjC4X/0QgV5OFFciAJrFt2By1auIQx+QTWqKUA4+OzhH
 J4ODBubrAIxHj5pG0jDMVpbWNJLJG5UyaVWxg81DHtKKVJARkn54/jfxDoJBZF1xua37JCb0G8c
 sPsjgkEnZKeyx42A29N102QtFvmKu3dCfKwkyZgDc11G3GZGYB/hVsdQVQKTts=
X-JNJ: AAAAAAABN4W5jMAkPOYpVVD6E3k+NbzUhMNAYQ2efhWvshh0WguQWF1EOHAo2AW7BaOo9PJJEUmZ22O/hV5+wY38fg7FxpvPthx8/HrsboEoyUilxvtP7OL+h3gWGSVShGxwXsolSn5XraMGEibzVEZ3sfTsdwgJl3VbNm+FMBDnldLZWPgW85wZ/f34/LUD5MXoXLBewiFYUN81VAg7sPYFata1L1cx31wBJniOW72qQLK8AHJtpiZCVColKZuSiCrIVkiCUaG2upJq+Sm6niiunw8/ZqPJC+zS2Itn0tgsgGos8pTAKT93tVuADYjDPJgvf2T5mzDSt2MbtbrzA/gu8AHYOrNdqKJyfZdUObEt0eTerl2EgyEGRGPe8ve65F0dYT7Hk3tVpiGMuYoTA/3PaTFGcyibpRuE5CAYNkKekeuXghVVzc21qAF5jtQ5ExcL90KrT0LrLANZE4KgUThKlPhZuhRpQuTKJ9KbY4k8IMYOT5/PAZt1iA320bOsKLAHusLB6bj35Mz7ro1v8qWkbVtA61Tshy0Q7ghTrkRhhG0w5cyKGFVK2jqFHCrBPhZuMXDOhAmhGTx59dErVfQ9Vja93HMRnZ2GVInfijl1W/StMI62h2QU3TSp/edBTCfctitwo+CdT2SK8HxlT+GBwLVLuMywbHcfWHav4CW00LqlQOkLPkpKvMuUS3EK46s9hwWCSssPzY6CmHQ6RPmtU8J1uSsSvQMrl5qR+MEYnzPfhZmOLr2/t5pqJ8wq7fUduy/rk0Q/ZJJs+Ztc63EugwG/bZyzqrKVW/I6IO+ll1uZGjnHAh38LoEPG8yColvTuLYbvJesF1bgKSXVf+lp1IGWGtFalg10ING4n65zw5DvzaDeKHLPK7Vm1NXLGKn1

P210 is a YUV format with 10-bits per component with interleaved UV.

Reviewed-by: Neal Gompa <neal@gompa.dev>
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
index 11ab684024c5..43ef12d073a3 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -325,6 +325,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
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

