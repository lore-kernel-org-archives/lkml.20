Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438599;
	b=A4RlDnmvBdInzslihF5FnUzNZMaaIOAs+U9yyQo124rTwkvBDFtWe3ENSBjJs3EEhr9R
	 hMmf5niO59mVDn7QQ6Laq2YbcYCT9bQyRhmwi+qjX7+REV+2GmSKd1JX+Tewg6XE1Z4Id
	 H92gEZDZCKOsTMLDlN/Yel9t4vD2c+9RnXVu3QGRpAlWbQJsnRobf1nUnjO8JusJVgLvr
	 0fcmrIAMLKZooJGvKpG5diKG7BjQ3CnG+JghXmZgYiDsixa+XomVLKvamupSxSabjsuWA
	 WyD/YcjAtHSh0ypHJCDreXI5BqiOU92o41qL3/v8LLnzvq0vCWahP+VdBX7jSGB9apQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438599;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T6aAvyR5GJ5zooxqgGF21JtukohT4AaHPFBTAxtWZ50=;
	b=u+Jyj3RuF39lahzoib4BQSSVPsd853Tv8KI9+jarFlc7GaZez+vjZhxVSlH95LncHqVH
	 GkCaKfI7QRjOyI7movXAOY9qXwzCwdY+tCWMXGmd0iH9gTFAmVpuuiu7+ciM0kCITRAEZ
	 Y8vmCoUhw442t9+f5Q3NQeuukNEsxAk/zKYsof6nlX94R+Tbnx+F1Kt5jH55Cu8GkTEYo
	 WdtCyx2swhH8kP5kUcsXN0MYE7zV+Fk/gPvAHPSgj76QnYA7R7rC/1rAiEi+VTrlmdFEm
	 q2U0ts7YOXwL3k+kQ4kEcNhto0Kpa/Edn7ZDReDXMHdH49Napx7bBg84h5th57uRgpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=f60kMJkX;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=y+5kh57j;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB82606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB82606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=f60kMJkX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=y+5kh57j
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 9065FEC00DA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:36:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 15:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792438597; x=1792524997; bh=T6
	aAvyR5GJ5zooxqgGF21JtukohT4AaHPFBTAxtWZ50=; b=f60kMJkXUtuVK1dDNG
	XvJBzgUnjcz79VSme9iSmPaXMHFHpuoghJ0as48YMvvD0zWSh1OYiSqzBWmyPfIZ
	xDAXdjbUJTFSrD3Ndmz+rKdXFJVAc6RhrztMVmnkz3y+VuYgKQsnUMn0J9JW8xna
	OCyRo5lj/v2atfgGPInleA9elZfpsF6QNfYcI1Ow77Gr4ZtxyPfPZwT1BXlVWVFA
	9wBPdln1FHKOY0Y/i5jbemoNZy+meIA7xmXCfxWTXn/Lrp/YLNFValcNl0WfzG3s
	48v9yWYqZ90kK6zxI7jeqgzc8iJB7Sl5hM1gQ9edKkveko5klXFuBnLm/WTLY9FP
	hixQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792438597; x=1792524997; bh=T6aAvyR5GJ5zooxqgGF21JtukohT
	4AaHPFBTAxtWZ50=; b=y+5kh57jz1w+XfqZ7vSX5XnShLWwYO932/2Sr3y74Ej6
	lh3gbIHWcRUTjyrZphR7/mkpXgNNiKhhNubkULHXyRgcHbBzjtSHb/o916O7NWGp
	treQDoESBANR519HyvVctJiQJXhTa8B7hMrxlcPyBKiedx7Anxjdgs5TADnIvG5K
	ZDEOG9ZD2rO5gwFVToZO62uRq5eE0zIcioOZK6xjSclfZEJl1rDaPQL/Xj8U6kNO
	Qf9a2Wvi/v85asweoh32Qvx7tfqjatKWgnRdOFbgDp+Zy69JVV/INMkUI0sS+PnY
	yTm757TzjIiH1HmiGnbcOD/U9rjuQCxXMa9zzMzrEw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792438597; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:JzZSozu/OHtS0lBaxM4DgvxkVPUFOZemh/NZrftsx+NREwX
	Ov9aOlmGkKp9yqmHaUl2cAqEG8pSGpkOw+kuNS3wvFelZ6LhzSXNjCfHCj06ZD9c
	kLAqMh6DsYXxAWuQnawlY8MuLDZFPZLmtgg74rcKp10j3T4ugQ6GawG9VWKoLt54
	sap7DoCzHzObmLsnUXnc4huXgwLgqT9M0xyZJE2jebn5+hkYJ8UdZDvbsqqE0ZBn
	bnqfvtlDBSrA3eug7l0JeO08hFaFtE6QlUw2hLuEKE7OjpXE+c79pdPsjN2MbcEr
	JZySgH9e/zS6ZCyAdrbCoVl1uq040jbO44a8zbA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:7MW1dV7hW2ta5ORbkfN+eXL3vzqHsDcdgGdewD3ALVE=:tRvaq1Hc86SnIMQ4u8N0D13wQgOqHSgMP3x/d00FGJg=;
X-ME-Sender: <xms:RHHWapLjPuUpuexG6ormGZInFHH8RpeCbHx4GsBGsSJAC0jBvaNrAw>
    <xme:RHHWah1dfpDVJ5YaaFaD-SwEOxGyQlvUpupFnolzMq4TcT_gDhKHWpL3oprxCG7BO
    lcAwrSEBqMKpudNfASAQHsoYvNLujYQVkBmz005RFTYSeJVyN_HN3Sf>
X-ME-Received: <xmr:RHHWalmWH4SiPDfG72SBXhmtVq7UCYWX7FY42bICUAkh7lFa3Jrja6l1iDYCEQRSiusqc467pdaEoYLcuu_IoQAVcib-bPI>
X-ME-Proxy-Cause: dmFkZTEJRfLlQv53UjQFq0K75BeNFYwR8zcPPdt3Z9BYyYKoZYFxlOwdgBtyk+USRjbpT5
    CR4QfaqHfVRBTDZr+/Ho1tj58efLzfaN6VAho6nQNr6tD6p0uB+5i3p0uEa4JlWwFVnGFU
    OKqP01wBJqxoSV5g6xn3Vb7snmQ0lUbvtml45MQeH+CQyvDCms9Buy5gxg2FGz5egQKlnL
    SWGzgUDOiaprVf7GKc8CT/S/uJd/TIS1l6yLAOPGhsqq+B5SrseiOxo3qgxC+rMyqjuoBA
    xqHOCcn5LI+9o11z+kcCofeVHTfK5mXzTPvFj78xMn9C/qJGP8V0gDfkd/Z25t9Av+FwtM
    pbHnvrT6Wc1TqVt8+ENulAFGLQxlyad9ad8xTLAtT7ZULBFlxPlrHEJKCyKNf+lfK2BsPz
    z1oMMtK6urH7VLY2aQzNUsIGkvN7Tc1quc2GXYqbtPEpAs90D6TR/MXYrApiISX+M9Ga6Y
    AZdQnJPJKB9zzrbaqZHwtATF6OD8q4XC/niVAgbewFaTN4UMoCB8tH8F6nk+zzIG8lnkpZ
    d0qB3yx5UoGJLmHPEr23YLzFkNS9itGuqCCzFyN+WBjbTiJaUxEmIXb9vInsSuRhk9q1OX
    VakCM+otzPEa9lZECZNnsf2F7U5xlMHPPxaxp7RQfNs4uGm4HW+y8Ss0RwyA
X-ME-Proxy: <xmx:RHHWakjtWAgB1Hb83eMN6Cg38gBuDEcQPUTmS99l_2gRu14oEwn02w>
    <xmx:RHHWakQF42gLEfUSVH1p-8nJXBBUc0eWin-LXPqc9aWU2dOzS7C2BQ>
    <xmx:RHHWam-dlKKsV5B-ZX-YQdnx7w6YSoO7RGmRtl6DuesoyInyBg8qeQ>
    <xmx:RHHWalNKd0LG3nzydTABQcDYyZl4D8do22RSVliuhTWJO91tvQzEZg>
    <xmx:RXHWak0MsEi-bO1I164WnTzL4vN8lG9CEF3t_qLi5KrQGyRjEBLrt-WL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 15:36:36 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] media: rcar-isp: Add NV12M support and fix stride
Date: Mon, 19 Oct 2026 21:35:38 +0200
Message-Id: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1gZs/EHnKuJCbaqRoTO0WgTx7
 lZdfov3DvDshD18kgMcB/HysxEqTWCcezsxio4GyqhSmSoxFF/CXmu0QRE2eVlrQ4OpigZi83d
 sZH9+bffab8PC43pP4DwvixixaXEAAAA=
X-Change-ID: 20261015-v4l2-add-nv12-9358df2bf649
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3066;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=tRvaq1Hc86SnIMQ4u8N0D13wQgOqHSgMP3x/d00FGJg=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq1nE4doLG+W+zV89qwgFIDWRrFDgmTClHqzmxK
 Tsh7x9Cu1SJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCatZxOAAKCRAJtP95BPlN
 JE3wD/4oxKSomCcye3QxkHybTw5MrYgyuLE1vKJiYFaYcdFWNd71y40jQg3h4bApG3hj23uRSXQ
 YUuvaU8rSsTv1JxijVrNktuKlIpTY3QktKjLb7Z58SILMyfNZ20Wgl93zsHw9p/9X+5b5PhNp1R
 Vsu/wsKVj5lRFPH1ZhNFWMw4uQBAaEfWjrgOHQshb4ccGQuwA1OXOambEv+xsOTkiDE7phFuIrk
 aPqhe5WcwFIYCObWw/nXqYUC0XPrzVcjpkVd7WIzMPBckd30flMQf1kuN2qFIUp2n0XzUU91zW9
 Fv7rkKB8HyxsCm0nZJSmwkDVaMpDk+PiOXb5tjweIHZQULRD6B4jeieGYN7SQRa814azCsM5G57
 GWtdIqXxjGOFo2CdJlGAHAaU8eBwUJNQbZDI5EBdMBiVwg7NdWlEKmqpgjSjUDe3LRnoyVk4oRv
 EVbI1Q0w0LpHOfn+csgfdFH8RP+dsTq1DV5Fb5y3Q7m3kLH8dWibVUHY5J2CqcIFqEOaGJOE9zX
 jvKUbiF3ft0XazO6gDKH50+QnNjQtsZXPPFO+e714X2LmSHH7WpKvYVr/Nipv2p7Exkg8nBQwYd
 ZiXtiLiBv5iM6agzAd+slh8tlhRH8jUpVrjnP3B9VaSTw4FikbrGxwb9U5CN0LDBx9BHqus+Ghm
 /SjIxp7IUIPki/g==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Hello,

The main part of this series aims to add NV12M output format support and 
there is a small drive-by fix to honor the image stride from input 
images in patch 1/4.

Patch 2/4 address a confusion around how much data was needed to flush 
out all pixels to the output buffer. Later versions of the datasheet 
makes it use clear and how it relates to image strides. This is needed 
for NV12M support as we need to tightly control it to generate valid 
NV12M frames.

Patch 3/4 is a quality of life fix where the current driver looks at the 
pixelformat to figure out how many planes are used. As it only supports 
RGB (1 plane) and NV16M (2 plane) this worked, but before adding NV12M 
(2 plane) look at the correct field so we don't have to maintain a list 
of pixelformats that have two planes ourself.

Finally patch 4/4 adds NV12M support. Enabling support for it is 
straightforward but one snag around how the DMA-engine works.

When the DMA-engine is configured to only output CbCr data from odd or
even lines it still outputs blanks pixels to the buffer for the line
where no data is taken.

To work around this and still produce valid NV12 frames the device needs
to be configured so all blank pixels written to the buffer are part of
the line padding. In addition to also keeping the same number of padding
bytes as the Y plane.

The DMA-engine is able to do this as we can set different strides for
the two planes and haw two DMA-engine lines (one with data + some
padding and one with only padding) make up a single correctly formatted
NV12 CbCr line.

For readers comparing the DMA configuration with the datasheet this
driver takes the CbCr data from even lines, compared to odd lines in the
datasheet example. The reason for this is that if odd lines are used the
first even line adds half a NV12 line of padding at the start of the
CbCr plane. To counter this the CbCr plane would need a padding line at
the start of the plane which is not supported, or we would need to set
the plane start address half a line before the buffer actually starts
and potentially corrupt memory as we write blank bytes outside our
buffer.

Tested on V4H SparrowHawk without any regressions and the output frames 
looks good.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Niklas Söderlund (3):
      media: rcar-isp: ispcore: Update image data flush settings
      media: rcar-isp: ispcore: Look at number of planes when programming
      media: rcar-isp: ispcore: Add NV12M support

Yuya Hamamachi (1):
      media: rcar-isp: ispcore: Honour requested bytesperline on RAW input

 drivers/media/platform/renesas/rcar-isp/core-io.c | 78 +++++++++++++++++++++--
 drivers/media/platform/renesas/rcar-isp/core.c    | 45 ++++++++++++-
 2 files changed, 115 insertions(+), 8 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261015-v4l2-add-nv12-9358df2bf649

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

