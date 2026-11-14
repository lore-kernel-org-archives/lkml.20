Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686136;
	b=ycSTBwcwMw8r9fhTTSEp49Nd8hSry504ov2RUrc7DacZsoR1ZEsouy7jIBYc4I72e0Ib
	 re/GMq1pzTulLaPa4NjuEDhYNQ4s2v2kjKi/f7Cb8f23RJj+wxfenI58+0JFOG966a5Zh
	 +cZKbLRgHkLpJ27sWzDZZ5oAlRstX7u/j3zg7nLmnQpJ+lqrfjB0l6NNte2IpqEqcMozL
	 kyRXT4RSPrJIjgRGzD0havpu4fARScjhiH+cvjhHFkvpqTC/7ywFVghM3aMAxBv8uDpFl
	 axp45b/T3OYhJPlj6eCfNvy8vHS41g+TeD3MxiSShf5SIA6zC/d+SATn+YbBUq1a2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686136;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/supVMiqLKrAx2+a3SFWWGQs1EnqsaRO1PX9nIu8J+c=;
	b=JNhHQ/LBT0kaNlvpRPCe2LSbEz6ZuwkE3moEMwdpClaOUPEIcLlVLEtQ+TtAMJx82syY
	 Nqb+FJEvRbbQbg2RJTq9Ni4qm01fD2QGDLDOs05yMth3HWoybUEaexJWLQgT/3PrAWhYn
	 q5URjfDeYt6x5QH5QhlYdmSE3eKlUtCAGLjr7sCrBAfLd0obbUkvQ6begwEto4kywL2TX
	 caczKNij8MlSrMMKuCIx6WBD4Xk0UQAxQ4PBc8AcOPcH/uibYK0PcdLaWPNjxwuh3CdmN
	 n3/AkbtI0ZrCI4s/kJKqrPgAwagw+/NmuFAfhb7pg+2apcYcWV2eDCF/rbjr1tZqiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="dwR/pCQd";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0CVvdz8j;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7161D606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7161D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=dwR/pCQd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0CVvdz8j
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 9AF69EC0169
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:55:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 14 Nov 2026 14:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794686134;
	 x=1794772534; bh=/supVMiqLKrAx2+a3SFWWGQs1EnqsaRO1PX9nIu8J+c=; b=
	dwR/pCQdCfkhvlIwCyIH9wvVFgMU6VRkNuDk5uyHO3zrI6wXhu22A0eUx28XiDkC
	Tm4FB8mWaj4hbYO5ZVOGDHw1XINGBggOaJp9QYHSpCgqBtwMq5jP2rgbQnPYJMBe
	hJUGGrafIIyx1sdtrQToY4TYpnIirnOByPZXbFV2mEn6RfvMDOpQ9c2xvuCaQfEM
	9EV4HLkHLKsL/6jz8Cikn+C7lbzAT2s6qfXOGlc4dQm4R2Nl5Qb6NulspOd7je43
	ICSACL4lcf8I1lf7IKI5+gQfdPR5ylnrLxlFh0m5m676+xG7ayESvJS6i1EVi3x3
	FTRDjR8AVgiAx0AH/vk0Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794686134; x=
	1794772534; bh=/supVMiqLKrAx2+a3SFWWGQs1EnqsaRO1PX9nIu8J+c=; b=0
	CVvdz8j55wSA5UHh9f2yFz9oIZfYJJlDlbSzvI10cJgNV5D6nAM6Ic+xPFbAHLBb
	ZS3jAvQf6w/YVvFVDAAg4nTYoe2gh7kEzk6K88XFtYL7VHMP7wDjqjfTxTX0zcvh
	TLx/hOidiEJecN2I0mBrxY7UYBXMFduzh1GSDX1U6Kw4lr/Oj6zxMp6w9VXiN4kb
	HS3qudj8AtEMpoH8ON0FDeamOuFgrgTS5FLdOZHtJiSj+vhbxdnmOcNpF829J/0F
	76vvrM4T0pgLrBoeY9/x7HrE8Wy1h0g0UazuR34ImzrBRx+Gyv/TkFhPC4KWqAhc
	Zt30jtXChcSjTNp/DQbnA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686134; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:b3IZCl1gexNulehIMizKeKaBmwLy6sSodEQ1PYImeKfXmou
	iOpJ4RVg9zg+B36H1FfNvh/3nzPlquTw+UuywMOCXQfUKVKWYkgjuw9juTluawQd
	21w3DNmH2xIfi1c589kxsFZfmQCnN6txjvZpidtBGiVN2piLX2SjMDmbyoN5v/HF
	a3XN3J2n2L4kxn1lfD400zpW/IwWMRIPSkSgsT8IgbuWEcYUp6Hx49yViill8x3E
	yzk30tP3uU0M0rd5fW30C1oPy5b0gKSJpcCVA9uGZq0KhX/eRE5PXrdmWFQeWtV9
	Sse9dasd+ioRWIGfsQt64r24fxkD0pIaFMRDr/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uJ3Oh10zODP754hdRws05PoJfkWNzwxSIjupGwFfU2o=:CTu8cmSAoTz/1vJD6O+2D2cCgm2qpkvScGyxVvQbF2k=;
X-ME-Sender: <xms:trz4al0fsitM2wG8kKgy89iu8JZ2zReXXkR0M-414ker8KL3wjUHmA>
    <xme:trz4aow0a0BNsFAEzynTHn7ixslpaOTrgWo55UcQRru0kT2tsTVSN0pUoNnOY1VN8
    7h44GI1KmREykxD9rBGeoWZTw_ipiLNfB7leSch7yJ9Zv0rQKrAP78n>
X-ME-Received: <xmr:trz4apwK2RFoBAnKU6BrqxlnXryVUu8lzq0KOt98wpVhyFev8qi_-1oyTPbfXk_1-GGy1iLJAVhAfRx0jqn0hwtgJz7hXiw>
X-ME-Proxy-Cause: dmFkZTEmPVUMPzW/uVzvu9DgDp3nMJm61oFIDaC3QPBTICH5cN89yMpUl1KStN1ZjXFY3b
    Q2f1Uao/0Tu4woRnv05g2Zw725oyY1evcbi/fXJRPSHudv2BWLJayfP76gcySWs1MdJbDa
    nw1+g8tP01WTLuevWC8sxiVhzaqTAne+YGNsrWKxD5nO01v21Yq9+t2O3Ju/VRoR1KdXYA
    U+pSLj3qv5ZtCuWmo1OMXOPF1jpXZf4cZV0HWVzYz174rrwu1OZoPP7BFmXwIkZcam7yRj
    Trwfkt7fWGKlwNIgBXWBVTugFcu+gBLt7ByUQJeonsTQQVAJoRwXtoNqfNN8I+gErAoVCr
    elO4K+FwsN+9hPDjvEjz23sYaRCHYTnDMfLFT0BoUP2Q3XRdgRN2QL7CQi/aVOpXmGDZ8z
    L82MZiSuyHZKjkIG5YYvRtgMJRPvhO0OAwE4hj7bs94T9LtdDFsv97br2sMrk+ZP1xCte+
    0D8Wrbh7cNVhr5OJIDXH8GbtQ735JFXBPHae7wXuultrKGvdj5MwC1OJKp+VQ/lqgSLutm
    8Cojq+cFc0yt00YeyB75jMDd/OLecdDmvCrOvC7ZY0Vx1JrLYxxg7XSaQ6iI5yeC4ZoYZW
    YabKcA0n5FzmZNatQfVHblElfh36ClV31QLRwPiP5tiLwJtBHvXJgqJbbpNA
X-ME-Proxy: <xmx:trz4as-fh0ZN_erby3c3rTjLzcczSb6d75iI7YjyQMPPKX_HX5QCrw>
    <xmx:trz4ar9Snn3B4pPh9u9c3bvOWl3HUaf6GhPUyDeT3BtC9CNtJPeuhQ>
    <xmx:trz4as4cVdVyqUMQlXaXVa9iXgcUAUXKThW_GycljCjdjlBX951bbA>
    <xmx:trz4asbfcJ7VgNvDOuaCNkXhfyP4paHIJJR2-sIz_VSSMauV1RxEpg>
    <xmx:trz4avPH7TNTHp5cv2GFRjmW9rxukv4ofsDF_ypJlLIKNUZvEElfA1ea>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 14:55:33 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sat, 14 Nov 2026 20:55:16 +0100
Subject: [PATCH v2 1/4] media: rcar-isp: ispcore: Honour requested
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
Message-Id: <20261114-v4l2-add-nv12-v2-1-a3f5ecfd48d6@ragnatech.se>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
In-Reply-To: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2463;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=ZD5pMWqZ2EghJ7VnMbE0Bwj0Oys1dyLdRIYmsw76V2w=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+LyxPXpCndO5/fsHVtmbhTy9RI/vYSo3NmzK+
 MgazYIaLYGJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavi8sQAKCRAJtP95BPlN
 JAUYD/4jz6M8NgJTSOCFsqqZMqnjrgFe1ZtrjYtnCZNzCTgVzym5TQ5nZ73WsiBUj1A6h4PC9LH
 tat9xkM4T9jiVGvXwEeaffcACogDWo/np+2Yrtr2yy391UrOgkDBhLIEtUcWB5SWu3areXxYI8r
 GH6PAkjPJrrXf2NMclLofJUYdUku3qNGNet52lWhmaLZHjTYLyBn5e+EWhQFeVjG59vHZaSFiJf
 Fv4mySnBWsaPXo47wNpaFVmreVbbeSKxntP/4wjz7b49EqD1snZ1dHvfOxDUSPY4oDuWYTZcx2V
 3+aI7kVKdq0IQqgnmETOBuWRUEMRmdnKXfa/x5Hx2HzgXWa9CbtnPda7zSVjZ4xB9N4cOW+0T8i
 yCmIydunz2BX2Ky+82ylVXGl8gMxqNHN/uT0DIQKKIiKRlYCvmfue9vXaNUpoGFp45cS+aCM3at
 hjC8GXg7ZdLbrheiM/YC9X2W6JU/xlNhqZN54MZYU+lT5Wwj8b4BpgD3RLJBq3eRXbNjMDUW/4F
 p4Yj6LraOJXPpwIQpJuqxgrObVm3eYEQUm5DHQ9I+YhVV5cyhzF6D49uf8Jcb4HGbQjlJw02b87
 3AqGoDShG37FdhG43OAAVX8D8gjPWX5GTaKGHqxud4mcy70t+D6/FHFvmeMziczbf2o3BpRDwZe
 +1qonX0TRPIO1PQ==
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
[Niklas: Use clamp(..) instead of if statements]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use clamp() instead of max(min()).
- Upper limit at SZ_64K - 1, not SZ_64K.
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index b60b91f43d42..cc538e984aa1 100644
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
+	bpl = clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K - 1);
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

