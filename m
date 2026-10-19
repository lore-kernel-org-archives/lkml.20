Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438602;
	b=KLm/5NuZpE98hktouILULPLlu4l3+c/zuIIrOORrkvsk0thMuKYLoIcOAhAZu2pLr99Y
	 pffLNvLMjWGeATeGTpUHF8gAW1zGvz5GQhJPXzcciZ43izV3cu2TOs/gdELhEs0L+THrV
	 neokKvw8aP7TUYKGPcsgFVdDGS9DCFsqJ1wbkRIcZX3dD00cSBsz0V4asRJx2W1UrozRZ
	 Ol710Hts1IlrgRL0ngXYXAUUTh3y4Cq9JeDL2vNrXLmOtRyMCdPbNSmnev1ZfMvX1sEoa
	 8HiX5LkezV2mLjFPwM9XJ8NQm4iFf3/2uGU6Z+UI4NmCni3PgaIXSwM5nuNaCKhhk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438602;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aeOV6DuhkytjuJuM+Zesl1xHEoJhEfS1hsno21OSBbw=;
	b=lBMGO930jxtnavUeiL4PsaCQyblg0TcVqGYAvLVayPecs2bAxzxvHBHitPUA81KUwvmV
	 t2eL59/ghnvRgr5JXRhUafGH76Hj5X0BBpjLunrhtDHLx9uK3I/Y2mUpAoLz/D+BIIswL
	 SMs0YvL/uI+qiXmShIS80xuM4IaGSYEkWo0MB+Xg5bBIBTSTFzNN5AvNuj6CR1naNQ9+q
	 eAZIftaBCCUeFUXC1w0sYX/zHt7W/QeneeqegV/M01ZYPk+BhCYtBClpQsjLKNhMlci6s
	 jn1e2m1sEmrEm/4lqllIaSVqwTrCHBB6/T84PrA6o6VMtc1FJGpx6eYlG/kWfI6qCdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b="QqvBk/k3";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WF9iB2fG;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C665A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=QqvBk/k3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WF9iB2fG
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 06FA8EC00D1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:36:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 15:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792438599;
	 x=1792524999; bh=aeOV6DuhkytjuJuM+Zesl1xHEoJhEfS1hsno21OSBbw=; b=
	QqvBk/k3woZXRQyxGOu6F4lIv6EGW+CtXDbZX0OvYg0KeOamgGRHBWfcdRYzim0o
	P3bYHWbokTXLPqPw1UW+mumF+iOisNCau9DEemimK5CvQ8O25oDiQFQKozO/jAkR
	Q1Biu7iVOlPuOJ8EMiBfBLc99OEuoCQorXdsjF1k6JfqZsssF2U++79KD7OwoOoM
	oW03ZY7Rr8WhO62HEMNT0h0GVoiwyWhv8Kczp/OyQuvPIagMaT8nRx4QUztTtoWY
	oKz/8WoLrY9RiiRbUD4at6gF1DZxfMl4NYSdYtU6PowjRMlrbnMnGoeK3Qarla9w
	lympaVCpwNid+jDVhUg9Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792438599; x=
	1792524999; bh=aeOV6DuhkytjuJuM+Zesl1xHEoJhEfS1hsno21OSBbw=; b=W
	F9iB2fGDIw+j6Kk5huVIkDyJht2sBZgsEJ3mtOi7ipf3jXeXbt5HcdXgo1VcG4o5
	xapJ0+Cbc/Eqah0/Qw+/KP54MSbRRKQRN5YhzNJ64bb6YuRrPktcQ9ol5fGg7Qy8
	MfS7rUmNMBJGtDxmwrXlBhM0F/1/zSHsWuVyunkokXNDS3PBYaT2vLcKzKmfHple
	eo1MvkQZgPskiqLtwBnDf3/Zc6lhXqkQpRdKV4FpeJifUX+FJXUUJxIk2MQqm6/G
	49KbiAPBbYGBKT+Nny7963sLr8vx+KdlWEjAiRrRs3phynTF9jCgCCOxtjR7+AS6
	X+kJ84R/zXMIzCACACNPQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792438599; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ILx+fsuztAS1LEkDesLOpu+BHT3LtcJH0JJBx6e48VH4qe8
	Q8keRJknuYzoOTbXfNQZurR+wH0nkpNpJytf0yA26rgGkC5Fcz4bXTKI/cqQ0jhy
	n9YeR362C1sA+tAQi3Qj1eLxXxSS4LYrCvaOAtgY96COS7P67WhTecHVQI6ScJE8
	ZKQB9o3yN/TN0u2gdawTc8WuJRjw/1sqhaefq3YSnpLV2R5n8z5LLFcUXQkHfQ8V
	TKhEXZ8Beg+Ec+0r53X2254OoKKagxRbFRX9jctrTtK6QWRTHhwUIJDy4Ns7plqX
	OGW5E1W2vUDbp1cjI3vfEOYUK4/rkHoEMSmH4zQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:p5c5nIOqYyQ9SHZFgLsae65c+5n6X4F2wMq87HgC8hE=:gOgfo7CNAnIzBfgDqfseWhqvxPyAr1j5hGNiCYsbBUw=;
X-ME-Sender: <xms:R3HWar1hBSTZoWJx-zpe9nRlxRYcl-jsyesayTiDw4ecCG2BgyeUig>
    <xme:R3HWamy3ADqZeDINagLTbht9qBq8lvY_xCTnCfcubbgFhSLC7rc3z3ljdm6Z8bvzv
    nWvy1zPlnLMjoxkQUI9u3L7OMEyVwSJmA2QaV-_6Az4GG8oJcOORXn0HQ>
X-ME-Received: <xmr:R3HWavwDl5D3RW_eZeGPMKc6UWpFYfpbADkKWT-ridPKuEFmHo0ONEdacCoUm5sni7PxIdWcjqmFFFiRMLPlsAgK7Y4l8nc>
X-ME-Proxy-Cause: dmFkZTEmBQwo+sf/j1ocKwc2/RsLqnHk33Sx/VCjkHynw/c/caELFOiXGalx/mofXmjPnL
    wm+KKOhmvwpj5rVueT42yNXbD5vQKy4cgduUgU3N5hgVFpyQGcqUyfn+XWe0Qez0wARhd9
    J+uV5sHaLIZEa+WsGRYXGsjXjHEHd+4axWXR5FmzONYIBUSInuSF4nSBLTDsmDjDV+hlcY
    bJgeQCs0NPbBjuuC4044qPHRbczAJXvNb+umMO+yXtWH3/B4nWGn7WyYrseYv983I+eT59
    3yqfjlVzMtGd7Yk0/rb/Ct8Xzf6bUKGFQLeCY8mVVP6lI9Ll0Hls25nqi0n3NaKV9xv5qy
    IbObvxZRzkmwUpsc3+ijSuGrmjpCNXn1Y/Px3KK89VYQc6XWOLqP7jNav5y6uZojfBFijV
    3icK7D190vkeg2zQWWT7I68tBmamQzJZi1ffBoj8NKuSBJICzrByADcio7jkyw5hBVC37D
    9O2zhUSBZhbuNHFJEbCDsf90gAV3xqvvkCFvRCyrkEFhWn7T2lfV0p+A2DKZP6g1FfWjA8
    zMSA5QXPxKyv7gP0accXXcSu1zGXXRF3Y1DcnEAhBzSKADjXoePdwjyNWgtAKRl7/5tb1i
    3XFxNE8sLA0d8kRDpJZu23VctsgQgkJth+tyxS3rOj0Nmog7S9avdu0exyHw
X-ME-Proxy: <xmx:R3HWaq8N9w_P659toP9G7p5ZZqp1hT7mL5Me_J3GJfwgTXDAFRZnFw>
    <xmx:R3HWah9bR-lRR9VNELfggcHm8A2ZUAblsrhtxtd1stmXEIO81ZMuMg>
    <xmx:R3HWaq7tU4IQkF9txWfbnUPhGFRutaMa_h_yPmV5k487414u2_Hw3A>
    <xmx:R3HWaiYPGQW3Fecd78Z8ust5HZeatVdMrUGt2LF5OYX6ccqy0bOMfg>
    <xmx:R3HWamzzOb13jpr8V9f2LvFFmHOyUmJ9AlxGu2sE3voOxCnhRlVBOv8A>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 15:36:39 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Mon, 19 Oct 2026 21:35:39 +0200
Subject: [PATCH 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
In-Reply-To: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 Yusuke Goda <yusuke.goda.sx@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=SchXw1vVM9XTrzm2ss7Pvks9LcZSEmXSVUVYUdSqSCo=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq1nFBNurXnY4HDClqCZqqDUQJdgDoTEhE1y9sb
 Ax0Jj9o36mJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCatZxQQAKCRAJtP95BPlN
 JBAWD/0UCMTOkBKt/NSqoxyNNA4GvcTzQ1IqxYCaSklzp8cbC4WxW4MyospB+ybRC6CVJ++iuMC
 rekO2rVsQCr/wcIH9Sgx9UWkZpPnw5zUPrrUfS6fVTXeMM372U8xHScTk//ETX+4YJ19Zfx5tIh
 bjXAdk74IAejJV5iQKB5TtN1Y7TuPEJY0J0B7e/o28ENPMymBubiu4+Si+v6b3c5jHvl2HeQyf5
 nUGRQklW8vk/DszEFBlxE2zBWo69f3LM/bZTwnK88fXfk+FyzJGc+MWJrMyGNhE1A7NQA9sP6UW
 S62hSr1jl9nmxp37RODP702SZm76KbPBSHs9dm8yMm/1mYn7XTzZgeHTffx8YtbOs3aPgucGEq+
 7Gl6vuPcXVMbBha9E6ifPl72qHMlh/f5RGRuVJPbwrW0tXVeoai747KV27cpRN4o4akGTvp4nQZ
 PvWsD9q++8Thg1Ir6OgniSCJlyddojJT6yJyukPd5c9nQmJCoK8N6Sr1fdkEImB6D10s8x2kmuU
 N/eH3O2wRAUKV7OM9Xz9m4G6fgHQuuz5azq0szvWAOIT2iorl4u4p5ojsT/qnNUC+C2ENQ2vQoF
 HvkxK96oEdTU0ymF0kQtlOggPYgY8GmRDGO+Zk+G4ZEWvniF/yd10mIi1BJOadOAk7XLsQMY4bc
 mR4AeZ2+BPFTgBg==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>

The RAW input video device always overwrote the bytesperline requested
by userspace with width * bpp. The input buffers are however shared with
the VIN, which may use a larger line stride (for example 3296 instead of
3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
the ISP was then smaller than the VIN buffer size, and queueing it to
the VIN failed with -EINVAL:

  __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
  minimum length 4060672

Use the requested bytesperline if it is larger than the minimum.

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
[Niklas: Use max(min(..)) instead of if statement]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index b60b91f43d42..badde72352c1 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2026 Ragnatech AB
  */
 
+#include <linux/sizes.h>
+
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
 				     struct v4l2_pix_format_mplane *pix)
 {
 	unsigned int bpp = 0;
+	unsigned int bpl;
 
 	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
 			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
@@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
 		bpp = risp_io_input_formats[0].bpp;
 	}
 
+	/*
+	 * Honour the line stride requested by userspace, the buffers are
+	 * shared with the VIN which may use a larger stride than the minimum.
+	 */
+	bpl = max(pix->width * bpp, min(pix->plane_fmt[0].bytesperline, SZ_64K));
+
 	pix->field = V4L2_FIELD_NONE;
 	pix->colorspace = V4L2_COLORSPACE_RAW;
 
 	pix->num_planes = 1;
-	pix->plane_fmt[0].bytesperline = pix->width * bpp;
+	pix->plane_fmt[0].bytesperline = bpl;
 	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
 }
 

-- 
2.55.0

