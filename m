Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1E559CA4;
	Thu, 10 Sep 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061003; cv=none; b=rltAX1rcDJHCRZqoE6c+mNSiD6S6vk+L+AKIhDSNbh0gf7CqHs+qQliagLpKqBShl0ljcn6WV0h5HHtMBFvJE5cfGjIYgZ+BxpdwHqiIPhAaDnLEIasRA6oGcRjGerUth2eplKDMV9QpCbv6f7iJg39Tmi+Y8+7Yo5Xk+zQp1vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061003; c=relaxed/simple;
	bh=0i1ZuDWJZaz5MMWRd0GrPaXINLwVHS77wKNYd8g3Dto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oBb+1mDUu3GsVuCost9j3fwYBTB63oTdN91k5sUhR2B48pID+wXk0qYgl7TSkDPHcCK29dHz9jfpYn9L55WsoL0uQ1lTs1hpyXrhCic0dHjL7mll4zcY9WFXlnIkJR76SLW/UQ9BpxCze7DZjR1rPP65vB2fGmHISj7+lccR1kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dnVl03/P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=yMCD8L5I; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dnVl03/P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yMCD8L5I"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 488C314000F8;
	Thu, 10 Sep 2026 13:23:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 10 Sep 2026 13:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1789060985; x=1789147385; bh=fK
	VIzIdjZnaRUC9oo2/LyAVtsUAGpzKJcQxaMm2EPFE=; b=dnVl03/P2dKa89dpsm
	+wOKzwWBp3B4GCUpoJ0KCtMGLhxvj8MRPXAjcKvB5UCq5E7LNjdoYDxsxM74Al20
	oWdh3nIkkPfQrISgsz6DC8GZ5MagC+kz5PXllktCr8DU1jGBDyLr4a5HaCx5TTyW
	t0VaNW+qweqEoIlUZuLdMFL+zU7ugLPz3hM+bDlYSpix0vkU9oH3Rq89wUdAbmKt
	RaUMy1ewjeBtDaao8GO2P7a4twxjN0ByW6cbzNrVnoGoVcCdtXZaHNWxNINzkgvI
	BammCZwY28lYfYQWabBwJsm/VGq2UAHU8YTp39ofaBYVjE8xgp3XWeMd2xQMwZO3
	2eBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1789060985; x=1789147385; bh=fKVIzIdjZnaRUC9oo2/LyAVtsUAG
	pzKJcQxaMm2EPFE=; b=yMCD8L5IeKZ2DKHev83staF52SN14NtnTXrRPwXOPhOE
	NOpiu4dsZ0Nl03b+sobGI0uwAtwQ7y9LGL09SRkS8MomLJY/oxoCZ3kZlfFkN+Xi
	3A7ge9TDxATRniv14MkTciMEgSg/Hbc5dVY8UpWfbj9mTI5DCOY5byDN5MO2pGmI
	4rtpm0e4U86KQyYhQGDSrAQQJdUiBf2XdW1ne8d9xemJRqeU/F1NK6LM4xPU1S7k
	LadzuQxX4qdPd+3fyrdNKadvA7RhL20+ywfxn9BnOD5MwRQwFyoRD9o0nLMN9b8X
	TqRykdWOVnesc68xidnGfglS9R8min+5g+unBozjFw==
X-ME-Sender: <xms:eeeiakgXggaQoNEFizinmpf9jeWo-BItccZSUpYgDgzU_Sejb5hNiA>
    <xme:eeeial_zqpDkRddz-tZ9PYA7N_haCb_ewg3lqe0dWS6R-tODPudUa66HnBGIwWQas
    5_0DjjtQUCu1UvTydlgwmX_5srMLPjrAwb8UQ0r3ftlLsDJ_qjlxWLu>
X-ME-Received: <xmr:eeeianpBPkPQVWHgMOOLZY4ys0GAZBoF4aPWXdVh4z5s80cT3MV2hIuqff618Auiyq89ANsmSGSBgqq29OfsDHNpvBUpaNI>
X-ME-Proxy-Cause: dmFkZTErJRNFLhxqftw1ZIVWVZkByeCy/0yNO5hvVsGMUdpjpf5UJS5JIcIJ9jP0jMUnVx
    Qt5LTiPk05v4iY5Cd8FXFMu9t2LULoqyWK1noL/b1L/nUVSAiNxHF/NsZeEB+PqxZa5xiW
    loSB9WUmkXO2DGc/YvYZxrduvb6MGSVcEEoLLCcfnZcTsxj3dFhtZE2nPB+KE390h8RXID
    ecrHkoPP1nXxcd/MzD59dl8vgPv4l6prVE91pKSdi6qtX1ZeK5bL08jh0LCHFEoU4Urp9g
    K6HPghD5VbrspfZu/Z637t1qvRjN0SERFN/HSt4d7+KvPx8z58fUhs4ks9igLwXmZftkO3
    7tAQt6KVtsW3o8DOlWK8kVk8p/uPH4zrcMkixGSAmfawG2nOH50/lMboyxgImRDd1BACLe
    5TtYZq3oD9V12X702rQ4FAPsS87Uac/lN7VmfTy/Jh6gxKKLHsL3wvbL8AfwAAJvqc6c2N
    vnHKBmI4OXxCU1ntla9qbOpgjVXKWm3PIutgfoU7IzvvTMDs1mdiyCkjSyPRg9FnTbZG53
    inapWOkGuHdC0ovYLzAG8t3Rmvxe5slutL8cL/H+27rttNpLfW8++YGg+vFHqUZQQ/t38i
    IJbYzyDBgnv+1heqIwm6Uu6uH2PWzxTve/TI3GEyvQRA2DBghQZ6Mr8KSfJQ
X-ME-Proxy: <xmx:eeeialW-PrATDfRKPk42H5Dz1CBLLc3NoJcw-IilCjAW0pklydxPAA>
    <xmx:eeeiauDC1t4WwZ-Bo95eW9ImMAcnOnMvHAGIUlROqxax5Qf4zGUuow>
    <xmx:eeeiah2p8577JqwmPHFP-59MIBVrrg7JwAV45DbWu3kNIkeTKucWBg>
    <xmx:eeeiao3e4ArYt4p8aKHBgR7BwiPXbHAYS20b0_AwxsVBf9C_R1Lijg>
    <xmx:eeeiaj_TNGWJFAhuKvVKopnAOhd2exSRIxMal6SxTFAVwPr8pD4jorlo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 13:23:04 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: uapi: videodev2: Add 20-, 24- and 28-bit bayer
 pixel formats
Date: Thu, 10 Sep 2026 19:22:30 +0200
Message-Id: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQDFbUq0gXcTLqiKgkrQri3
 U3b5Vv8f0KUoBKhzk4IsmnUZU6wjwx4cHMvqD4ZyFBhKlPilk+EznsMbsdVD3wadtaWxOwJUrY
 G6fT4LZvX3/HTjsLv7weu6warR1UddAAAAA==
X-Change-ID: 20260908-v4l2-add-raw-pix-50ca1182ccd2
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=0i1ZuDWJZaz5MMWRd0GrPaXINLwVHS77wKNYd8g3Dto=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoudxV9f0EinnjeqXPA53I9Dlx/o3yCa5b2VsU
 TCfh4o8DXaJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqLncQAKCRAJtP95BPlN
 JHEGD/0UHTFzYt2a1Q58EKCS4ycYFNoSLLMsetFF7EnB9LMOdRLReFkvhRYGUj1kUMOOSPruuWd
 INsW8+46lJvYPqH4SWWOhOLcngJD3fjwNjnZjjvCb0gqUAudv45Flr9f7vzbGklvDQyZl2d3quR
 3N7JmZ2I88JJ89RSGKY0P+yAHl0Uq/n8cJJVR+pZmod+mfs8JQswvxB9vRj6Bo5bImmHrU0+uqh
 sShfyQK3k4q/hJB5JHFco0ZbkHXWkFE1Wd5HRzywV5MgB4/eCILUIoknBdfQJJVDpGKmdeR6/3M
 5sFzminSZCJ0OBLlWEYkNS3duI+kSEq5WyDNZQQ0+s0ONcGTgLK/7Pi25XjzV8c5hKbDyOx6Lrl
 EodS05O/bAGxnrm0RP+FxCzaYGTCq+ldkBqZb3HcT2QsZVWAQhLS/2rNhT5TX2ysXQaJQO1FpA7
 g48Y20jk1Ibb+LoUPLwlf8ozqpZ+vmhzWT0bmwDxL1nmKvQhyeQ4yPYmayp//YTNfUUAmsXUdra
 l5IrYT19Md8OKJOIFyUwlqdMAuI97Sm0Yu/bDG5uLo2OMkQzSFCgmaJ00E6cO3XIXVN4ekiDDEP
 DdXhw+smOFEY81l7nVUXOOTAIVs5eO6DY/OW2r9VyjF5xJMVog88X2rL1846tIVRbKhQmh9vVYs
 ObEU6j1o2oBSbIw==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Hello,

This series adds the pixel formats and documentation for the 20-, 24- 
and 28-bit Bayer formats. This is done in preparation of work on the 
Renesas R-Car video capture pipeline which will support these pixel
formats in multiple drivers. For this reason it is posted as a separate
series before the driver work.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Niklas Söderlund (3):
      media: uapi: videodev2: Add 20-bit Bayer formats
      media: uapi: videodev2: Add 24-bit Bayer formats
      media: uapi: videodev2: Add 28-bit Bayer formats

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   3 +
 .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 102 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 102 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |  12 +++
 include/uapi/linux/videodev2.h                     |  12 +++
 6 files changed, 333 insertions(+)
---
base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
change-id: 20260908-v4l2-add-raw-pix-50ca1182ccd2

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

