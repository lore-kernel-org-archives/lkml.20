Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489156;
	b=rP32otTrgLT5bqF8AWqhd6TqtwTlW9Rh6OBZNR3sZSPbkQ8fnF0JekBumwpZQwUCxvvY
	 tmobYHMWAttujbxeBqiA9JIikN6diHZefYpyyvl5h8d8kufLwSDn7o5/3VmTlTYWeYpFo
	 DjzKTFppXVYwKVOuVLnyXuveRXSnHciP4ul004IjRzvJLY1p8zeLr3bWuxtWVWRAnRXOv
	 jWKiMJadn4dFKzHz0Rzdcv4xSwxJqyh38N6vJl/PnEO7b6SkpqOQkQzJL24XX61a7pPdC
	 VJcm/d9ErL6tFZEiNHry8lqyubxVu+L6nX8cTnO3sJHI+z2muD7q3rEwD4O4TawTwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489156;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=ZZ1gM9yQSC1YZxCEwrTMNxYyiaO9FV3OF9hlcurnV9w=;
	b=5ps5x2dSO+4IhFmJw/iUMcn0HsbFs/EmCOxl+fS/VuTmbonA5vbBYVuN7OWfKOlZ10tw
	 lmgAffWkCDNXBOWkaEe4iEc99Cf4ziv/mGK/IaNSgWBWlmRC8njv13wP3lsucbh+Brd9b
	 AfDJEVtZESmlBzA3liLIZJGQr90gzbfWW3yfQQVA314K9dbHJmVyEaygueOCUGBXTImSw
	 wc9pD9YFhCtRv7wqS1R/d0z/wKFXLlnAMr8dUTmU3otaf14FG2KQ+Ij9B5a4+aM4Nw6DM
	 btENLEY3uPGWRbv9UYHXMRYDdsLN/AbkCSz3sS0BPHbvlB5Q0Aazn5msMUd/9Foq8jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=gyaqnAnP;
	arc=none smtp.remote-ip=57.103.79.14
Received: from outbound.st.icloud.com (st-2005b-snip4-1.eps.apple.com [57.103.79.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FC60A2623
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4FC60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=gyaqnAnP
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id F41B918000A2;
	Tue, 20 Oct 2026 09:39:10 +0000 (UTC)
X-ICL-RepId: 01a158ad-d982-7938-a70c-d8f875207c59
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGAV0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489155; x=1824025155; bh=ZZ1gM9yQSC1YZxCEwrTMNxYyiaO9FV3OF9hlcurnV9w=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=gyaqnAnPnfk80LBjizf6fCoblcR9Bs98+VXxMepQIwk6Qz1VavwCc2b89x796OcIJNpXKtK/sgQp+GtChjoZKMiD+C2Ccx/rgyHdFbza5U+1I7NiezC0t4W/iFgIOC2sa/oOZIexeiwyfwqmcKxkZlcr94Jrpuqinb/HFfSDJPAlwZyXatR53VbwZFzwvYAUX1k/RBV3xL2lZtU6oBm1RqKSvLTdScQWYrvndfCa6H4xom6szxFxb4qiTwqyPSC6wICsJOy2eVF2445rfpjvPMguhq91StXCDFX7DWn51fKKrbsPWg18v7KZVowP5pqrQGxGii8DJG7jSqmwBM0PWQ==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id E3D42180068C;
	Tue, 20 Oct 2026 09:39:07 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:44 +0200
Subject: [PATCH v3 03/17] media: v4l2: Add Apple interchange pixel formats
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
Message-Id: <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
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
X-Proofpoint-ORIG-GUID: ShUZm9nVtYPLhwaxrpcjSNr-Vm9fY-kM
X-Authority-Info-Out: v=2.4 cv=XZWEDY55 c=1 sm=1 tr=0 ts=6ad736c1
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=JxlP3y9cMaH3t_qTuRMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ShUZm9nVtYPLhwaxrpcjSNr-Vm9fY-kM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX/QoyUth7FEDo
 lK4VlQHubmvHjvPa6fxpCLEqY3PkyJUeVteFuIBGtO5jKMEazZZTf0Ri3Q25dIRChZQxeJleGFR
 IcqNMRyYL2tpNMWpwPFlxL/tr6G7Q8SytQSho961ueO7SJ9cAgjIXT70TNzeGp4Jug+3cCov8zS
 X1zvo8K+jsr9tMcVS1d1p9Sg7qjxeaSGRK68lZfD4+gvam6UwEy6Snu3UnUZfTF85SXns6zU12q
 D9tX0fgfIkMgTlKHFkqCR+4QYMzHdMaEOHoN7M59BwWS0j/na2PCVZRCMrEpGmJv7q4fPwKIkOF
 cZ+WFwA+Ww4p6rSjaWBoZ3kh3CwsMCQM4W3zSFgZ6BAQksIXzJo+lvQKuJ2svs=
X-JNJ: AAAAAAABptJXr7kv4h3fXQ/GMTqKZSReIcd0jBM9MfKA2Tno+8PUG6mkyKmCGhLIQEyXMRzMEfNdqPFyIvyNWjZ9qnuA8IeO/DKEgjdKifynokGHqVChffs/lLjvC5i2RW3bA7dz0zN2iAB8N1gVXF0/8qTQaudgl6neECk5oQR7DkaENRJK1F+1WVVSHwrZr7WPFi5uo+yX3a9CVvvTk7QpHSsFw5n99E5SUt3BOmwN9/efzjaVcd12XUD098meT9SEal2epdTEWNPEFJ9ne9gPmpE7qnjjNUluwO54WP7/u5sJq3XFFQeCycen2lPE6JAcQaQfG7WNjGFKZql39GE3/NS2Lo7CjdBlB6515xa1NHOF249bXtdDpsNu7G8UzhmNi1L24zZNQqvtyqXF1YOWqyDbDjAGy01f1g28QDtrwTU9cdZalDPMEtytw91MZKsv/auYJkVZKIeceCl3AIHinVhGyC0ESzheSon8SxycW7aBlOMgqdAjXJv2PPAFEv1WdxYvW4urQ95yLgbifMye5pv+QttuCm2BU+TBzZDRXribRgKLhf1TZRBXWiRRnc5GBtih3i0zHx27IHHxktef9wJnAbwTTCi9u8WsHzi3fMCw9dduzFpYHhcE27jPvc9n18Q5YCpUBt0a/2Y+v4+MKNKiCeILl8vlptIqpZse0imOntXDvAAX5d6RdB+MLXM/Wfc9KwwIwo1ZwfksnclUtjG74XLQo0HZ+F0nEmhVEdYYejB+gFkqBvGQinMb7MUgRamzYufWOFvMGLfIYOngDCOcPUifTsCorLhai6UkG2f12jnekmoY+pjuqFChiccBmAvHOy0/x/j/zrNjySDicUeIrvSof5CSpKBU2zV6NiM3uhKJDgDoZymiYj9yXLu72JOZaPvWdJqK+YWLLS4K/vk=

Apple Interchange is a compressed and tiled format modifier.

Its intended use is for sharing buffers between hardware blocks (GPU,
display controller, video codecs) on Apple platforms.

Add it to the v4l2_format_info table to help with calculating sizes.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c  | 6 ++++++
 include/uapi/linux/videodev2.h        | 8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 43ef12d073a3..896c07d93032 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -336,6 +336,13 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
+		{ .format = V4L2_PIX_FMT_APPLE_AX12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_APPLE_AX16, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_APPLE_AX24, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_APPLE_AX03, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_APPLE_AX23, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_APPLE_AX43, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV15_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 1f2519ffeb2b..e40e2ebac241 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1561,6 +1561,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
 		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
+		case V4L2_PIX_FMT_APPLE_AX12:	descr = "Apple Interchange NV12"; break;
+		case V4L2_PIX_FMT_APPLE_AX16:	descr = "Apple Interchange NV16"; break;
+		case V4L2_PIX_FMT_APPLE_AX24:	descr = "Apple Interchange NV24"; break;
+		case V4L2_PIX_FMT_APPLE_AX03:	descr = "Apple Interchange P030"; break;
+		case V4L2_PIX_FMT_APPLE_AX23:	descr = "Apple Interchange P230"; break;
+		case V4L2_PIX_FMT_APPLE_AX43:	descr = "Apple Interchange P430"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5472e433ed06..f218f4fb26a4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,14 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
 #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
 
+/* Apple Interchange, compressed and tiled formats */
+#define V4L2_PIX_FMT_APPLE_AX12	v4l2_fourcc('A', 'X', '1', '2') /* Apple Interchange NV12 */
+#define V4L2_PIX_FMT_APPLE_AX16	v4l2_fourcc('A', 'X', '1', '6') /* Apple Interchange NV16 */
+#define V4L2_PIX_FMT_APPLE_AX24	v4l2_fourcc('A', 'X', '2', '4') /* Apple Interchange NV24 */
+#define V4L2_PIX_FMT_APPLE_AX03	v4l2_fourcc('A', 'X', '0', '3') /* Apple Interchange P030 */
+#define V4L2_PIX_FMT_APPLE_AX23	v4l2_fourcc('A', 'X', '2', '3') /* Apple Interchange P230 */
+#define V4L2_PIX_FMT_APPLE_AX43	v4l2_fourcc('A', 'X', '4', '3') /* Apple Interchange P430 */
+
 /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels */
 #define V4L2_PIX_FMT_RAW_CRU10	v4l2_fourcc('C', 'R', '1', '0')
 #define V4L2_PIX_FMT_RAW_CRU12	v4l2_fourcc('C', 'R', '1', '2')

-- 
2.55.0

