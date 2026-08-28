Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA843E0090;
	Fri, 28 Aug 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913488; cv=none; b=k7w9zR/Qld23DaK04HzFdfzB4jgzpwpxyLQV/+MRM8+uuavaPfvL4RyT6ofkIU5pmxUwc4aj2K9FOqISi/E6c+DrRUv+NOaON0dn9IHFeFmTA7jj1VVE3GCEMZ7T4HV9ssGr+HcuSMeoLFAEpNMqT7OY4rrcBwYA4RpJhQp053A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913488; c=relaxed/simple;
	bh=zb6aakf2219BRtDcoxOwR7gMo+t4rKIYgKOy5NGa0lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FznpgHFLsk5cKd3Y7Cual49kKU3LcVKD0ntP3W1ycnUmcYJYvxXpJp9berinEwJPyYWJ5gs9nV496Fj+VCiuZjE25+UJNRmKQ1+cEwMzs4K6MrsWKGyAE1HXHlUqBj+Ibd2yIv1aOJ0kwyoc2OewFAvuE9H7jx4JJjJvx7Nt4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hVMcwYP3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fzYpZfw2; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hVMcwYP3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fzYpZfw2"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A57357A0129;
	Fri, 28 Aug 2026 06:38:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 28 Aug 2026 06:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787913484; x=1787999884; bh=zN
	0t7D1RXFxbiQhtfsfU+yV7UdHvJxCBj/hwXUiXUEc=; b=hVMcwYP3ZwlQXkqSLq
	U4UgqQ0fcEirNCqaI8peMuIh++9toVUb0Hg0UZlzv2a+l00Mizl6pqr1SkBU8okK
	rSEfwDn1F8S6T/noLx+28o7v7PR8szCcHvfUPQLniBg6OuGOxFVqTfsk6hpazL6C
	RBuYBA+wHQetsi41M+o1SgA4XdZg+m3ACpB8dPYeia1RlR8T5ZCwKIInkkzn+yPw
	tBFlpRj1J/DKSFfEN9+nn98oXwGIst2pardrCtxJwcCl+OmjKQ8xYzH8lHLO5Oe9
	jq2md/y9i/lpNXwZ2blaFYrJYcKlxtUIEfqnKIlWfd7NTMpB0Pbj6kqKZy8EQzs7
	AnJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787913484; x=1787999884; bh=zN0t7D1RXFxbiQhtfsfU+yV7UdHv
	JxCBj/hwXUiXUEc=; b=fzYpZfw21UGCs/e0nhmJi5JvEgBEdrPiKFqtGn9p5BEx
	QhkQfPyR3bDFgW8GrgbJlEiJE5NqeditG5d+vGVU4W8KLVhrARgI0FJswQXot8wY
	oJcJ/U9HeU8lLqWaQl7earZNaacNtRS+vIV9YQL2TUloniE1Nwc3BJyodAaguxH8
	+kwLsN/VO1D/oqM3WoSy+xPkCcV0U8DzLyp/mp7MshN+yAI+E019JXXFL+lo/4vg
	Q98NGxP0g42RvZnnOta902/htPH7OxzC2brLLeCVKTZlNG3z5UBk9b3vSC4+JOGK
	dMZDftlwdSx4BKBRsIIfY7DEegrY4+nOvvtQHMlyjQ==
X-ME-Sender: <xms:DGWRasTsmIxM2edtjHD2UtgH7aI5p9vNXJeiKXWY2bvJ38zV6UMf8A>
    <xme:DGWRalzlPF9ZJm7nNO5BN8C4aei4cO1iB-Zsjve5EBZNAnO02BK2n1xA3p-hhBZYc
    tFF_xhxdPT4QP2FJ7B1ElyRCLcQlI4tjDbnoJEauxOFSJLaGF19AuNf>
X-ME-Received: <xmr:DGWRasCgkf4fsCZCNRuMbBSc2J347QQ54fzWm-kWkbwDI5XPp5XMjE0Qgny9I8iQ06HULdSq_b-xnjwpomybDOX78I_11uc>
X-ME-Proxy-Cause: dmFkZTEO3A7XOX9dyG2sBT83eTYRmxQ3uYTJQDKJfwuGBxXxyUJlxsZk7YIhJ81NT+OsVy
    QgbHr/+QXdCX25GmtUSFAu90dZSNzzwzpa8LaJ4+ZWqA9H/204YuJZhgkFofFA4Xc7Xpuy
    +lBv5foUuY5Zyf8HojpNATyHx0tCfULBV0sAiHGspUrSZEXS5Vv/Cb4I7PFZcqZfUzlVv6
    2o24yz0u6s3KVgWNIWY63pgyLa3KLCOcvCypNWOw/IhTxpmVCVAHU4MClx+BVpCd+n9u5F
    wDaamAjTNy6/9rw/6Jpy89FzXyakFpPl0o6OV2aY9PPajBuV3hLdNhrEFE0OmoLWlGmPRJ
    IdlFTIvvkeqt4c41cMvIYT1JlPZmdWmfLqO0At9UuIpS0rsX0B4rCWn9vEXAlK4/aOUDf5
    ic2TQuVZnYHnYvvoadtEq7N2/Cf7CreLvYFBZCtM1temBlQd0ckQzfw+2JZIYnm/yiw7f3
    IEaXO55QfK2Pts0pPic2qRAi538ylhEUhw2Ips0Y3AMUnfUkoPXkyGqKg27x8/9+OMy4uI
    Jq7y/iRsaHCQiGNGI3dC2e1nJKG1CXj7v8w+hyP6LsWQBXqJG0ARPFNB1KMnbghWsFt8B8
    dtH3KFdOIjTMlaUcALDedm1dHNqMurrFIYxOl6TEL1681rjeTYCa4VRx4vNA
X-ME-Proxy: <xmx:DGWRahHSIR5YzGSinn86ZO6mMXoArk0IF135wIl9Lp8zm-4kLpw59A>
    <xmx:DGWRajOM6yOVDL134ikeBpojst_ar_wwJUHK6KASS1G0efjf1tTh_g>
    <xmx:DGWRai450XHZ83Lsw5WfHv3RjSruitd_7jMDBcUbUSKTB0JRGDaMOQ>
    <xmx:DGWRamjcXIvH8JMNAnxWvFc2Wd2zxUCfSM747Rck3sY-Omv0uZTsOA>
    <xmx:DGWRam30g_v2Qj15lx4A9qB98tpiNJo7TTGTOQl-9dQrlkPP9Hs7LDus>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Aug 2026 06:38:03 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Fri, 28 Aug 2026 12:37:44 +0200
Subject: [PATCH] media: rcar-vin: Return unused buffers correctly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBvIIUK6SrRIm2paWGhJEN49q
 +XH4/03BPbCAdriBs9RgmwuQ5UF2GVwM6OM2UAVNZUmjVEcTnJhNISkWRlD9dAoDfmxe87TV+v
 63+E0K9vjTUBKD3te6wdvAAAA
X-Change-ID: 20260828-vin-fix-vb2-28e1bb24a618
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=zb6aakf2219BRtDcoxOwR7gMo+t4rKIYgKOy5NGa0lY=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqkWUJqk3KEDk+9yXsYWwm9SYj6fkG0o1SOfIQu
 DI2rWLG4/yJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCapFlCQAKCRAJtP95BPlN
 JCelEACQbQdNL+s+XuPaFEzmkN03cF4ILU/YOe1lUqbMINdfa0RRubPqRplWFAwJB43VnajKv/1
 XBQBbwQPjdNwmnCYQTcSHDrmF3BAnNdEnxarLrxAogfwvNR4R7/V+T40IttMEWbcTSYMbXNX9RC
 w1ifjxwhwhlMj0pGEBsZXRVlck/XV59y3vBnVDeBa+orC3rn3mC+k91f2NI4ysamYFdForc8H11
 Aq6Zq9uqrAHPJdO6xqz7zcf1aJeW44iGIHw4lCOHF0DNTiBjvvE0BEF+IYJrmvJ3FDoVP02KdEO
 uHanMOt1eONNq2MXod6NO6oBwQ9JsZ5rizQic4l2yevOA7GEdETqrja7VvOXpwS8e03O+KiFKEk
 mtBbZuG3OWWEDL08lNqJAkU9AzlbI0UDtxP/T41Y9FCbrs4vwyoj4m3kRbAWYE8utB+lFzTy6jC
 iRJ8xBi42fSUP1RItbBXk7ikclD+cwSlJBvSiLuNE7xwLou2bAdA7es/dSRJmui0oYEgMbm3dpA
 47awgrvN2p4BukEmK/gH1KHhw/frDC1IT0/JsGb050EYvX6WRgOvS3v2wA3t2kT/QYE6Yh6/2fX
 TBgXV1TIRyYKZu474uPQQPtUQJf2EGjAmBYK+t2c/fEAXFPu2UsZurkcDOAckwQyAuwSUnJ4yw+
 yyqMaBc78Uh2PqA==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Unused VB2 buffers should be returned with state DONE not ERROR when
stopping.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 73cda0e2d45a..f3003dd61890 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
 	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 			  vin->scratch_phys);
 
-	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
+	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
 }
 
 static const struct vb2_ops rvin_qops = {

---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260828-vin-fix-vb2-28e1bb24a618

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

