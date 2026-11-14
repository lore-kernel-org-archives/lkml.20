Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686135;
	b=k/mKJcURoHruu7p68xM4Ust0IEcf/fvfWNAgq5NH1naJXGhcGKtvTSE8g8bEGEyc2Pvv
	 QA+iocyUClsAmYbb7/gN7EI4RW+iDr9V9hr/6akdXGJDpb23R/7LQg6C/02kXDdOaor9l
	 qXOS91OuRRkAI/gls/JV3xexB7TgMqanNJ9rrKUQcVCfInq1Vp9S8Fl81dqZdKAzNUhN2
	 YKOE30uOYqj4vpbSqoiIxs9f836q6WlvczLESz8LAqd90x1aCU8srW5af1JnGCRBTXBPr
	 mjoqWfhySpuHbsqoSuKf5tvEyhFMBfhILbFpwUBcXGbSE8z+PuyDU8+aapu4mtLo9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686135;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CGHfzK9DVdW1OuywE7fKmBb196O0xyRdQNcmj/l+ASQ=;
	b=mp+X/d1M5CkCD5rASlh10AkzHieBA5I30dOqhUAqbFA0EwdpD9VtOw1rYtX5Z+06H1Bt
	 q8alc8tqoE4R+cY8HhFmTh+NpHOzcLILsFnw6vknBf9PMzq6hHsJ4zhWaU58XobY6Bdsa
	 9T39Um3SRh7t8VmOq+HmJu+dLlTsCEQgN/WIXQWDwyZ8o8zxf/YwiRs07pQjYAk7/AhqN
	 /6w4QavGlq3u2AZ+qjEEyWUUpt454sj56BlBZkiuWaXs24RsrefR1tm97rMQS2UsELe8F
	 OoXy7aDz17M5PgSONVumT+Dbf8enRniQ25yi6J57TdWjS1IMB+LO1V6tOG+PmEOPmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="r8HVI0/6";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=583FW7p2;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9909606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9909606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=r8HVI0/6;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=583FW7p2
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7CDF0140006B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:55:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 14 Nov 2026 14:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1794686132; x=1794772532; bh=CG
	HfzK9DVdW1OuywE7fKmBb196O0xyRdQNcmj/l+ASQ=; b=r8HVI0/6XIWHVyVoii
	hSK/ccUovz1cUNotPbHAx4jtpE7v/5mY5PlBrLaKCWa3RQHl2nTz8oJeoKcWn+/g
	ezOEeN5d5i5A0cgKJFkL7xRUvA1vWxcsPNY4N7UFkeeq2h9K5XcZ0wRHp383cuAC
	lwzTbPp+QxiTZeh4HV01xxK8ryUB+xCSpLbgwD2L2dk2pkkdff9rwsHNA2OEgeG+
	QW5mTPet7yFTOOe/S1y9gdCIJHm3yvOAeCdH9ruG7EAe6OmUuh1WMY33GdiNrHU1
	wi505AcrHhnj/ud5rnLuWjFtPxRdNES7FxRwitmY98qIvesgnO/NPe+EXVLIamPW
	ZR3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794686132; x=1794772532; bh=CGHfzK9DVdW1OuywE7fKmBb196O0
	xyRdQNcmj/l+ASQ=; b=583FW7p232koGj3tkWVN46aJBsh1Huv17bRD8LdwfB8T
	cAZrrNTO2n00fAoRR85Op+AhuADNW5kvL6jQgmT1wXpZ/mQ4LKzKAUVtPUrWTI0r
	Uu8eT3ciXHY0MGRbtcrTOJYP/1aQpCRtFdT08t6+ozzay8Y7LPvVWFHdjEk5bR+r
	N9Tb4y0iJkG2rUiwx/aq2rBaNw+ytgiL24Gbx2rztkYfaB1h7BwXsa+oNYfq67MW
	QWX9wtPBjLiZUtcEE0aQDwiqsvHba9BNCbCYsLm4TIm4vHXf5efHeCtOUmYhmtl4
	XQddI6hSKoOPL4bXzhKcgMEvmbXa8TpYQH/tcdySdg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686132; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:0Drh5uIWlIWq4+lzvRezr5PP+56K20aWBMQau8Hc6AbwiXB
	uph6XsjyJXlluLDGmEiKkJr12ID4UgapM/VbmorCnI5Z4wyTrrcYiMUMAt8eEcSf
	yKpPl4Etc+14kunIf6EmAPdub2NPUi+6ocVe4c9tb9CfP56DrUW9roKl/4w311Qf
	HnmEIjBQ8jbvWsuO9PKa1H61LR80k3z/uoCwCJaYHIEqcYMySzfGnCCAW5A/Ej2J
	zC1WjIMLcmfgNHjCgV9p45k6puqXP9dd3YUlEN5jTHJ8ri0kW6UbtOqUOQVKqAN8
	BSJJgwBW96RSXa+Sy2Kcbl/ZCuoLBDz0cnrSfsg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:oLcULGJ/G4VKqC5FTZToWUdzDBfzA2orfj2qWlLA9pA=:W8z+AbJUry3Qqffh80Ky4DrBQXEzHzJTdTRfDg63nHk=;
X-ME-Sender: <xms:tLz4ajOoqT-N3RIKiJ4TQaV4rs_Ew_pw03y2fL7hPNV4ZVlksdkpRA>
    <xme:tLz4aqq7CN80RbsPQ5q5ABbVzhInJdVVjymt7iq9t3SI9vHjy39Q-JLsTcLOV3BtQ
    1ZZUpnduNVaV7wQM3e-Tq1IIPuduOVavZQyCxLMhioTPHT0eL3YQGpF>
X-ME-Received: <xmr:tLz4amKG-LWgP5_63i3NR9LjQ8Kg6xLDqFfwMj1h0DZ-oE2YDg_dVpddheeHAJkFusu5sNbIzv2KEKJeBVfIfD8w9Z8P4V4>
X-ME-Proxy-Cause: dmFkZTEvP+5YKsP5V5F1HdOHyOu2XSfVTF/x1WnEj3ce3BdxRBNf6kEWLfq8F2DoL9jYax
    jrpexpkHDzZeeg34mQyx3w8dCdP4c9qQeblL8gi9pyCWbDhYmDuva5F82Z5iTj/Ou58ksF
    QMPeXxa/OgMnkuheF58ntV2bizU61EDL3LLnv49yZzV4AfGkquSriuCI4WgfjHpBRc9uIU
    /vuHcADuIxOmI1xLnXuyD4tvWqlGGlTC7d8p433IHTUpsm1EYM6tKsTg/YX9N34lZ0DT35
    NXB+hcHR+9vk1uGlEVBSHQbant1uvnRyUqflcixQnX8iljPpJvof8yXIB8hH2UyU3sGrTu
    pCq2I0b7ia0wkAInGz01msI4CZ0KZTYTtzPenjmvi+D4lpmDNLEvvzCt8zMQaURWFMe3ll
    oeVzWnxDndWYw61F47Oell5rjaRTWW9MSR3RrmcrdsSApLYtE1rSfH16DULqmb35eNhmzA
    iQqve4dugEz+JIOmVbsaZZXUKUtVujzNHENDaq2hFC8DLhx44VA8ArWPUGr7O25aO0qBEE
    Dn9VXOB+2zjYhieiT7SMkuZtlwxgDuJsqmylhTPFRxoql8nAy5FEbOGyPOWaOIGSG+Thzz
    gnaY4TMNDBZOIqtPjPBguOa7eNwGkYxSm8UTiiukNkX8cdG+8q8w+ndyBJRA
X-ME-Proxy: <xmx:tLz4ah03qz9d75LLYv3ZzRBUbAy44qFYd05-vtcXyzPqApv2cq1s9w>
    <xmx:tLz4avXSnatu0X9et9HRE94g-2hsE-ariFNgvJRam8eE6eKTEmUpCg>
    <xmx:tLz4asw3F_7q1VRWZubT0VzT94yiXoloVrd0_3WS891AVCvh_yXe0Q>
    <xmx:tLz4auyRfoNZElVgwqYQIV6exx6E4Qw6N-dzkWdXh-OKJIVrI3v74A>
    <xmx:tLz4ako_T7AY_GdQ-rPdT4GEYd2dKizuplIRhXoDilCnpJZCduWBhcC4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 14:55:31 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/4] media: rcar-isp: Add NV12M support and fix stride
Date: Sat, 14 Nov 2026 20:55:15 +0100
Message-Id: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBAFf4Xs2TVtKbV48j8Mh0IXWmOKabHRE
 P5dwHjxOMm8eTMkip4SnIsZImWf/BhWEIcCOmfCQOjtyiCYUJzxCrO8CzTWYshcYF1W2vai7ZW
 sYd08IvX+tfeuzZfTs71RN22RzXA+TWN874eZb96vXf+1M0eG0mh5KpVmZasu0QzBTNS5YyJol
 mX5AGJ38eq/AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=W8z+AbJUry3Qqffh80Ky4DrBQXEzHzJTdTRfDg63nHk=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+LypTWTGPayXMwQBoSKwTKL535qDut+sCf1Hv
 cqCso21Q1OJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavi8qQAKCRAJtP95BPlN
 JBAkEACA06labhwFxJNn7kC041LvI3EhLOKfhksg+hlqVLpWaOEhle5NLsVJpoR2eIFCMaAMWIF
 lVpAM1uzLAgiVcOLeaDyAE04Bo9pjMqXW00Y5EIsZxBjaFX8WyVKBMZfyE9bQTMGMS9BvTQLJAH
 3UH4PGUIvFAukYoquYvPy/ivZR6pS5E9uw901YkulfZ+ejLlX07QAQEoYOWjkJRV67/Dkq0CgSj
 8tjmwvJEa5EDRTqgsGpjdK881CxHc7t0hC3EblAXMzUnD1Se7oSq75b0WVESNLCaxetr/6Vc61X
 S8YVA9HQXtCZbrym3FVOJiKnL6BgTnskU1JrsQFuuDX0l+2r2TRpbc7V9ux/ZhHea0WqGCRS/+6
 tX4Mgvd4xnTdteR6vABC8BGL3ERbcQJ2qoqaLmGuTS2BoBXMcDs3ZRcD1gCoTiW849G+57oVihr
 M5shPutdbh7X0j3GP3dmLib3rE7KSjyiH+fWi03OvoKTmgWBnQ6d5AIpUwER+r/rnv0ThdxOMk0
 dBOU/6NcNOArMQK23/ujDQsB/hHXuv5Lvf36zNd02WGSC8dxgr78QHfA7E+4SrgjUjm/NDq4AV2
 4CfEtudOvq/DHn/zC3wSqqQDtsSbcgoP3GQuYBUmKZwpfBAlHg7A+SRLzldrDXHjVW+trHRYFfN
 njKvPNkD3elXtNA==
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
Changes in v2:
- See each patch.
- Link to v1: https://patch.msgid.link/20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se

---
Niklas Söderlund (3):
      media: rcar-isp: ispcore: Update image data flush settings
      media: rcar-isp: ispcore: Look at number of planes when programming
      media: rcar-isp: ispcore: Add NV12M support

Yuya Hamamachi (1):
      media: rcar-isp: ispcore: Honour requested bytesperline on RAW input

 drivers/media/platform/renesas/rcar-isp/core-io.c | 82 +++++++++++++++++++++--
 drivers/media/platform/renesas/rcar-isp/core.c    | 45 ++++++++++++-
 2 files changed, 117 insertions(+), 10 deletions(-)
---
base-commit: bf6c63ecc20a54aaac7a2fcbd6adaf6498388825
change-id: 20261015-v4l2-add-nv12-9358df2bf649

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

