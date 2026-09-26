Received: from outbound.mr.icloud.com (mr-2005c-snip4-11.eps.apple.com [57.103.71.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BDE446830
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428575; cv=none; b=LX5KHKy5RRgIimmi1FFpNRB9ia7Lx0Bj8THpujoxsCdS4D3k7KI4fFhOuh8vDG8s5h6CX3pev520yjcYVIoXwq548x4yWEQIJl1Npl2hH82xEU9K1/WXdbRljXa8L973P1DvDFHwm4zw/2d1CFIzo9VlgihjLB8pafn7/Rwx4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428575; c=relaxed/simple;
	bh=rwuJCUSAXEpOa18OmM/PcSKxYyqVXV2tnJKV5bOByrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFcKsnmvXgw1l/p/QL31mfndnnRI18v6mMRQPT56/dmf/yb8/7Bk/E4mx7Bm1c1hCoMlTEmpqoQmwYCUIJl8j6Tkh5Eo8pCJXJEBzE+jXKe0L5vOKhkWV+0ZyUiaRxBBffSFaM7bkzKWM+Nd5NnjqBEYqUBNGkJ7i/gEmWhyQNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=H4EdhRd7; arc=none smtp.client-ip=57.103.71.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="H4EdhRd7"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 007361805189;
	Sat, 26 Sep 2026 13:16:09 +0000 (UTC)
X-ICL-RepId: 01a0dddb-e134-73b4-bb7b-d8f519d5127c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGAV1cG1YPUl1TQw9MCwh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428573; x=1793020573; bh=IYxxudkVZ1VoNqwDsuEqFR76gpVJjA0lnUaaqwQi8ls=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=H4EdhRd7ntCnbZuBAUyr2TUtr0kx7bdrHj6Fg4N+tPNfUVUMiSfxxZEJErlSPMW82FdJp451WxzdVemC2VGRcq/2V8hPwVACMEmyWXXqD3K6+lcqeFZ1apG7zM2YNPr3JfxyYWeiPlaMKklLaQeguLEOLjy6ts/44IAUMELbD30zAPyxCdnSLT+s1ZIVAf2GkAm/9o1PFl6vyBKC7hu/W6uvSw9FrjCbNw61BGbpqNzDuY61SdHnvGDiu71UlIduNXuxDD9GGcPvQx1jZMisYBRAJYOwTZGb1fss2CM5eqqDNxxtyFQT4T7YEFMFcbpZ/2SegrkPR+oboFJLdHNSFA==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id AFC691800144;
	Sat, 26 Sep 2026 13:16:06 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:42 +0200
Subject: [PATCH v2 03/17] media: v4l2: Add Apple interchange pixel formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-3-ecebe6a3648e@icloud.com>
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
X-Proofpoint-ORIG-GUID: RZxpVVsO5u48ZfgybvBa0VaPXOV-y4Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX3lZGxroWTqfd
 oH/blGbdAuzAJKVGQWe9nCf+gN3nyhp8s+pgYl8mgs5GMjEldCXLsE2zklB2voHRHcqTAZAOBMM
 /zuuAjWXxfqrwDVW7AWohZLRGQq74KkirD4gplD6LX+25Mja5xuI9C0IoLcm4LVtDoieJvpAzKR
 /8OAbQAGVUZlo4xwc7IaiyrkwGuAEHlQkhXgjsQ/uEDD2Hcisz5O0kKgGg/PSp+t83mU5XWFNqX
 Ht6icTPIVr7w1Nkz1xcW69mqQCwvKznyHrJjUbmELlsUZqo67qxZH0wCtOMx+TDDrvVWBRphiBk
 n0HxXzV48Zm1/UDX+sz+S5wy37O3Clc2wUVxCJ0E12uhjw/MuNzFFcy4fYHzpw=
X-Authority-Info-Out: v=2.4 cv=LvifC3dc c=1 sm=1 tr=0 ts=6ab7c59b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=XfseLEjigXvjOB_hP-0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RZxpVVsO5u48ZfgybvBa0VaPXOV-y4Ht
X-JNJ: AAAAAAABChFGzoGZDGVrPPJyQR4WNO9HCGl4ynz/q7qHQ5r6QkvXaESA0fmFBgsmIy2NCVdDzZe5/nFZJmr9eHu/IPILRkouev0skqVKObGLe1c/XXwc4lLu+ZTOb2v8VdgdSp/31NcX+8ef/b4gEOcQglMXV4Cg2eWEhI0jtKRKJaU1jmy5u1L6FLMdoRi0BiqnKYlL9dGb8Rc0vZR4LIeFtDRC+n9x9GILi2YzPNydY9QQkuNsMgE8LUCR737lVzsfgp+OQAUJaRxd9VmzknDyMZRHlkvAU5AIhvxQMoHHIZZ06dMaMtJ35sZjE3rJYoTbbSTEZa6nlckoe9+/LCgIXx0sLVryq2K0NpiBXjt2Ide37fZFTDRXoX8bTW6FH1Lv5c4+0/yHKqzwtqFyVVZKXBZhxXWYFvQJ9FUmcEQw8aXJCU9gsRbz5aXtVsDithJyPH0b7JB0CijxeUBBkNr1U4mGwUxrxAzfyycg2uMI9+jvNLMV/5xz4IvAiTbDLZJWpkDw2ql3zdYpJ3oWYPdl3ZltXSBwZ+NaNd42LBj9y4M2WNcBNaJhikvDh5xv5LrP4URek642kgiK9tqmY36yjUDq0x5GI9zrpKvoPYcIc9I/PvhySvOPvKyChHObt9Kvzktj5LgGSh+e6ZJMxpG6ELrW1j5oRma256juqb2B6+5si+utRWP3Wviw/wrJH6HrciRCwkpmYIdyrOYqD543nEToGRB43Qz2qv5UuH/JOKg1CIg+HE+W7DPMuLFji3mO0Lg7QsoZGatkE28Z6CxhkZ6QBtSFN8+MDPXlCOJEYSTmI0CXq0q4YUjVeS0g8gDhcy3VtfTMb1lfGBKxrUGXKpeFRQ+oj+GE9YxHbKbWqmqv5LMhEz/vSrfxxwkNDohbfA==

Apple Interchange is a compressed and tiled format modifier.

Its intended use is for sharing buffers between hardware blocks (GPU,
display controller, video codecs) on Apple platforms.

Add it to the v4l2_format_info table to help with calculating sizes.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c  | 6 ++++++
 include/uapi/linux/videodev2.h        | 8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b78fc0845a16..eb2eb1c59fdd 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -336,6 +336,13 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
+		{ .format = V4L2_PIX_FMT_IC12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_IC16, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC24, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC03, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_IC23, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_IC43, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV15_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 1f2519ffeb2b..b3c49b08ef2f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1561,6 +1561,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
+		case V4L2_PIX_FMT_IC12:		descr = "Interchange NV12"; break;
+		case V4L2_PIX_FMT_IC16:		descr = "Interchange NV16"; break;
+		case V4L2_PIX_FMT_IC24:		descr = "Interchange NV24"; break;
+		case V4L2_PIX_FMT_IC03:		descr = "Interchange P030"; break;
+		case V4L2_PIX_FMT_IC23:		descr = "Interchange P230"; break;
+		case V4L2_PIX_FMT_IC43:		descr = "Interchange P430"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5472e433ed06..918e060b6fe0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,14 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Apple Interchange, compressed and tiled formats */
+#define V4L2_PIX_FMT_IC12	v4l2_fourcc('I', 'C', '1', '2') /* Interchange NV12 */
+#define V4L2_PIX_FMT_IC16	v4l2_fourcc('I', 'C', '1', '6') /* Interchange NV16 */
+#define V4L2_PIX_FMT_IC24	v4l2_fourcc('I', 'C', '2', '4') /* Interchange NV24 */
+#define V4L2_PIX_FMT_IC03	v4l2_fourcc('I', 'C', '0', '3') /* Interchange P030 */
+#define V4L2_PIX_FMT_IC23	v4l2_fourcc('I', 'C', '2', '3') /* Interchange P230 */
+#define V4L2_PIX_FMT_IC43	v4l2_fourcc('I', 'C', '4', '3') /* Interchange P430 */
+
 /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
 #define V4L2_PIX_FMT_RAW_CRU10	v4l2_fourcc('C', 'R', '1', '0')
 #define V4L2_PIX_FMT_RAW_CRU12	v4l2_fourcc('C', 'R', '1', '2')

-- 
2.55.0

