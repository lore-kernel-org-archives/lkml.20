Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438605;
	b=qIOSI7RfASn9XvHZ4D2owSFBrdWfCBePiF87D/+5fBJJ/PiC6lRzQa8Gf3GcYZ0y/03k
	 8BL6EBlOe4aO5MOa1zOfntUqp/6OhSDkqrDB1UjXRRwth3+zdXiljBJGT49oQD8y0qTtJ
	 aarfd0oAH41n7EZm0bihtB280MMgd+7HAd4Yy6I8+GHT/bDhJc5HRo2tscELyMt45iAgT
	 p+5TD9QBW1BjXEI6zG4i6mRXoOw2tQSBwyhTTmLD6cIclYuwApGkWgXKf31esLxm57W61
	 uFrDl4WkM8/cRCTx8qKxdKZdGnOXhThv61Cm9hlC2a1wXMlPvPN4OglbaQHSrv9HZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438605;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zlIhbw9cgU2oqzf9CbImxVBJ5wgdlHIw0TxLtlJnIoE=;
	b=RKXn9sZ/el+rhsmiXzST7TyViGvnpqGqX8T+fYFIuFP5ohSQpn+gca4xL5TbqCnHQ386
	 5LTWc0phaPLmBTHz1BVmO96qWo4j3QbK+1wsNVLu7b6PAOXjYUZKKZZy8KDs0iiybIVXv
	 X5vcJ6YONpYvIp3orilVLCSXKZoun17phwSYiXvV3U3qf/AV1gq6QIooXCHTeVcWe1clm
	 XI5OBmE/NESIds040FYXoUdjMwpApxK0DWXvA+jeRoBoDz3R3qmnPwmhfTCxx8V1DJacq
	 NR52ukhbV32F5YCg96aP0uqPqnTcdo13fLIkay0wdki0bZSSwRNalNfHVMNfmqS9PRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=IjUDQZgY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Gn42joZ8;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E37260A2616
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E37260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=IjUDQZgY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Gn42joZ8
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6A8F0EC00DA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:36:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 15:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792438604;
	 x=1792525004; bh=zlIhbw9cgU2oqzf9CbImxVBJ5wgdlHIw0TxLtlJnIoE=; b=
	IjUDQZgYbmuBj0iJyMUllapT1zhbrQvqA9KSRte86hxn5bAi3jHO+JlW5OCRwduX
	/He7xKkl7n+7+j6o5QpzacSHpmMwTBG7zytB0p6lbERTERNNoLyaAoUZ7qzo0Goy
	NTpqfnqfq8eiYylyOgD8QHSE2oN6tucibomRGA3QmBlCEXqvGaluXTEIz/n0XMOW
	Fe8GsIiKU1/csziLQwvLBTy71Wisu8K/E61yQHizmbwUyA9jhv1A/Hvlzc1dG69G
	1TSmiszpNJHPR1gmvXLwosgmuP+4FLn2p8JoRukk3u68HTd7UWlPEeabq98LNY7B
	m0RIy2MHetbdQbHXh+5rQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792438604; x=
	1792525004; bh=zlIhbw9cgU2oqzf9CbImxVBJ5wgdlHIw0TxLtlJnIoE=; b=G
	n42joZ8RrgG3ITsmqjzLnXqNezOg2RxFOIy/R87s4EzjzqvoTMpSpLxGUFNIHvHa
	yJbKUgn6RPfBzmC7Lka1KXMp7e2e8N3kmu8QF+0H+d2a8VHxMRRdOeX+NznUc0yL
	FQCUpCktQjoshOqC62BVM1hXSItu5Pv6OiPbXZKNKct/9ctOb3hwa9s7/Zmhi83z
	mxhfFONB8tnose951NyC0A03s/HaIn1kzQgHdTx3v0JYj5t9MnVVlpwnSH0TdsZ7
	xZAgEwFwS8GHsZf4urSbUiSwX4VZ1CtsYTor88mLGGbSltZTovWqjtIdk8qYrxjh
	ugjlZsvXgsQ4dMHbV/hTQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792438604; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:iYgwhInXS9u7ZCE4COLUN0mwqTHRW2hGPkdtBtMWv+5fMW1
	vZLA+tazWtP8UuBzrQQFL2eeTiLhbkFjN1NZJMloxFyMehqe3G9AKuQITBK7FYzs
	bbvoPR4OSe+OsO/QgcAASWPT1y0NFY5GqeJ35aNbCfUCLgnkrCD0eAJCkXr6vDCj
	LyoRd1BrhJNnvS8J30FweFdbgZwlQrCEQfu0BEC7zNSc9U1ddOt50i6BMXbhyPBo
	cTPWT1jU+IcrR61JwQgbDPLuNtVMQd83WcyRob/CAPbl9IJtFOfx3aVcUXGjI9QQ
	1W6Lr0WKdJ2wBKq1BPgs+ouW+EE6JriM+LRLHHA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nnYEglc+4ko0BrHukFJEMA6ahWjy79HL6eDfWANkHsc=:7872d9crNkarnrVG/KIr61f6AU6L+fPbD/Dqg5LJL8U=;
X-ME-Sender: <xms:THHWajbTge5JKC1bDOcK8vl7QUPp49m39v5Aeg9uPrZbqTFdoEVK-g>
    <xme:THHWavG9e8iD_10a4FR6BYHYzpeU2y1TZSfNG2uX0M09zhiKEc_oikKNqVVJSTT0b
    daNtlgnYExD5mkRNiHBdj__6rpusrg3yP5D765uhnVYbvGPZqxjwJqOOg>
X-ME-Received: <xmr:THHWap1IcBskzMLXoh24qiurgMA_eDFfMA4S3aYrd5ETG1221C2pRsMqanUKE9X-Y10m6k-KEyAfGTcQnbFcjVYxjs78Ztg>
X-ME-Proxy-Cause: dmFkZTEmBQwo+sf/j1ocKwc2/RsLqnHk33Sx/VCjkHynw/c/caELFOiXGalx/mofXmjPnL
    wm+KKOhmvwpj5rVueT42yNXbD5vQKy4cgduUgU3N5hgVFpyQGcqUyfn+XWe0Qez0wARhd9
    J+uV5sHaLIZEa+WsGRYXGsjXjHEHd+4axWXR5FmzONYIBUSInuSF4nSBLTDsmDjDV+hlcY
    bJgeQCs0NPbBjuuC4044qPHRbczAJXvNb+umMO+yXtWH3/B4nWGn7WyYrseYv983I+eT59
    3yqfjlVzMtGd7Yk0/rb/Ct8Xzf6bUKGFQLeCY8mVVP6lI9Ll0Hls25nqi0n3NaKV9xv5Dz
    Y275496ZyJndy3F0L5Sxz88U5TcFvwHHbXxrEXoWFktGw6xL6+7j2TuDu+pRG6nHk/8J1R
    q1hQ5OyuxvOVBF9DWFHjU1jnyBroObHnlc5b2ZLfzgFzgI1o11DgGyjoyZgAeiUTnLhnTj
    PmMfmq21OIlAvhrMt5ZUMuROyi4Te4OtvtmG2sdMVub5fwj2ZE7clsW2zaD1fAua9rkcXG
    8P0W57LqwYmZhFhCIYSf9DquW+YEHkLrgOa+scMsppNJh7LS9XcopLSkbuw61BJSv/58I/
    Sxj/IRkCyBZdFoptgSKLd9rt+QzfBBXlC14TsLVlMRkpdo7bbUD1CUJBb68g
X-ME-Proxy: <xmx:THHWajzsjUTjkqW9eWjeBp6GlWIoZzwkOXkgx270vNKdBZ0pq5IK1w>
    <xmx:THHWaijLckk8HvMmVmPGCRPLHTW6hLutL9wW73_MMx-rMg3faTXxrg>
    <xmx:THHWaoO3xpGaxDAZ107ZmbMhoAizkJhfSkjLNa1QaTca9kW5i6yhUQ>
    <xmx:THHWatdcqoBytQNT9LfwvlEeSIZrauCFuLu3fXc-4iBYA32by7fxNg>
    <xmx:THHWauE8Scd2f1YhTs6JF8JibIrnz_BcGCabMPadvNZenko18GORAwn7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 15:36:43 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Mon, 19 Oct 2026 21:35:41 +0200
Subject: [PATCH 3/4] media: rcar-isp: ispcore: Look at number of planes
 when programming
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
Message-Id: <20261019-v4l2-add-nv12-v1-3-4a84736803b6@ragnatech.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=7872d9crNkarnrVG/KIr61f6AU6L+fPbD/Dqg5LJL8U=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq1nFBiOJbwqMrg9IUdd/wySRsRCUWHWnKTjJnE
 rU/IGRmodmJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCatZxQQAKCRAJtP95BPlN
 JNJOD/0XuRYFEk0ag7we9vxlnmNbBEJrm6HXGmnjyR3XmcpRsNAbjM/uku3k3OuZmzm693emucD
 Ce1jyq8xucc74WRE2eMYcyasAGtMTcR3cP9LdLNEiXjOGIdNG7RA6b1v7OoEurljgXeAOylm+x3
 hAcELcP30zMhE79Oqx/H0c4ZkTyH9Po3NoTxvnP7Lr/xvoKMVkByjJ85jStWkeyOD8ND3hVxI2v
 zs/dPCMqTHkJb9lfU8BJcXR7Yx5XEubpcukBpEmSj9voNh6eQRzk9bJnQzxsRsfH8yu9M148Q7S
 1ucGHwueDo0UYJeGkbyVCm82aK8ayvczn8RHfPVrIofbkuCw5bHMErf9J2rdPJCdrK5jqgmS6hh
 lMlYi6bkmw1Pkdpxn2vGUBBoVq8/LsrjnM9x8NMpi/fFNXuCfbv4Vtz6OJEKj9CTSo0NF/VRQZ0
 ZUAq54WDuYpWmB4q0/K2DigQGBik+iovB5uJSb8FlaRgT57bwty28dhS0NW8RxCZinaEWYD0QtU
 ogd07rrhVJZkI+OGAgKiKU7T0YMrD8AQj3S6pAE1kyVAAVErbFEte4B7NNKzHJCHA11DGz57Z70
 Nt2rbNFkRmOiNnnfB99W+FOQny270oj34Ahx0iGYIMck2aRxZzdCJV/jyQqTfrXyeivl+8eROqs
 TIfgGBT4VN73j7g==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Instead of expanding a list of formats that uses two planes look at the
format information directly.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 3e135e84b75b..cb9d9033d0cf 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -126,8 +126,7 @@ static void risp_core_job_run_output(struct rcar_isp_core *core,
 		mem = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		risp_core_write(core, reg, mem);
 
-		/* Only NV16 uses 2 planes. */
-		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV16M)
+		if (fmt->fmt.pix_mp.num_planes != 2)
 			continue;
 
 		reg = ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP1(0, frame);

-- 
2.55.0

