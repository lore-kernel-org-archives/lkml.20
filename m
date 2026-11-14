Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625511;
	b=tis4s/TF8tXr6pPiS3auosbLT7KAR0DerNDjSMogNkygCP1iBWG8Yr6cSRb4WEdFm1HQ
	 +J1V94eMQVqqLnpPk00eC8UYz4pkZ4DKEFbrKe1a1QElf4fpK0qBUn20+JVUmRnRubXNL
	 EHsqdAwwgJIvW8reeg8Yz/Gc/Ko7JzCIR2cNeVYErSrhs+RCPFnozA5EqIxaFHZ1xkY+o
	 aRdGEyjqk9WskEfL8EhgZPIqzRYCtVYC2BfCx98241ZO4Wr45WhbOUdFv6Ju/uaj6wvm1
	 90wRB2TjYHmLF9FJrCf4r/sJ6k60VyyxRk3zDfEJdWhFXshXNmODu4AXDgK3rfGsj7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625511;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ho+Xd5M3MLddX0wCUHHcPTNzdHoU5y2P2QioqmPkh7Q=;
	b=GitCDhj5b57mTsoYUjk6t2+Fdo8rdB+BKfW1zO04vIfU5ndKa/EAseGff3gAmAQ4G3Ko
	 iPObGtAmYSA/BQz/QL5rzIkxjy2/xqMKFK3K+zOLPFsekp6wDvfHYDT5jGIvWeukQnZql
	 vC3kal0rlDpztYU8Zu4F5VPFCwUh9e3I6/ETOWwR87OYGfW4pwxitEUXtSt7lyBsqmQlL
	 ethlPp2SDp21JfnF6V02BMNs1CEG+ut308J/RfH3FERoqFiF2albuL5iapZ1jGETO0+2Q
	 fckfUH6YulFCbrFEwmi+0w/+pkML2hpBGdxrb1KwWeKaYYxb5gsXTUuN/nWUdHfUGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=chmphiGd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0hsfnHAH;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E4606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=chmphiGd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0hsfnHAH
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 5AEE01381A1F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 13 Nov 2026 22:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1794625509; x=1794632709; bh=ho+Xd5M3ML
	ddX0wCUHHcPTNzdHoU5y2P2QioqmPkh7Q=; b=chmphiGd2w/jmFcAHc3fc6rk+F
	bwxAvDx9TKZA7IT5uwQtXpttn7z7DVJBMS0dhvfNaMP3KQO3XuJtnoKRps3lk8cO
	LmttOWiTUTLl2tjLOGixxu3bUb1mY8lPaum6dV9tZLzIzv24jZKcLVQIVNFwRfA/
	a6jGs4VT6w9v3swt3DEgaydnFe5WklBqd7Yasm+8MMB1/ShtLOpX2NKh3PPkgg4t
	rNsu8W39rKCjrwW/m/69sNYqtJwV4a61nt3L+wLQhTJGhadxCPsXZTuipbameLie
	4AGlBn+dvCJ47fE72NeU2FXFhcYiXEIkDGEVbaZmYKA0C09oOLBs5xyjtPBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794625509; x=1794632709; bh=ho+Xd5M3MLddX0wCUHHcPTNzdHoU5y2P2Qi
	oqmPkh7Q=; b=0hsfnHAHcLXU1QlNCUZUerfsdF5P+76hk1rbWFigAbYH0EKhR6X
	Y/bFbjcLXrvKFlLlgqhB6/J1QLRTj1I8O7a2GuyhOLoRuwTx8PZYtzcEdhTnWS1d
	k67qxBJEeWrQLnPd58QDQfTqanfA38F7dqG0jrEYNrwLHZG2Uh7jpQhW9DYJ1ArP
	/037unhI2Grxsr66JWruWwEcH11kbvRdCVSC3zHBE16Ekc+Ps9EEQdw1wIyUHJfD
	Ig27fmKDSvDsh6YUjHzHlfwkvyNPyB8KzJrNLSeBbtMePcH7avGLRItyzrhWr9yR
	N/8wtxxWwQIIYCW8uni09+kFu7OIURzyT0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625509; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:PP2HHQPNAZ+iDPaze4rOPIdHtl0x+Y1owOCG6jeqI8ChkWx
	TMQXck5O3OSd+zdJcssWRA3xLRtH7VJOflnVhCuU8nQ2RGbFZUs4E29F1itUxnIK
	Ul0CW6zUKLu+zSGvkOtGxG9COcdRz6iMvnOKs9jdOVX9NMTlrLA2jLwU8ivleWVa
	7WvMcwhFfCEFUaG9NTztp01f56bCIR+nPRFyrZUyy8SJPCeKw/Osl3IRQhG3UZTr
	0zQArQ4y7Ezs/ZmYdWCWHl1d8NpNTG/NhcF4vJFlueyCioSPGj01h444oYjGZmp8
	I1aed4i2XuoViN8fivo81La8K4+u2SKCqikFXPA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:zMNj118Rl8rR+gwXIlnuBWnpyerlZLoztdEwTTKxavA=:zP8NGW8sziDBFTn5S18gCH5sO+fygkTvKfZ9mQamyRI=;
X-ME-Sender: <xms:5M_3avvqnYai2NEbloT90WOolawWpyHWQTDj58JwE9cboZjz00qDAg>
    <xme:5M_3amDucS_sQyOT57Pdr-qkCmL3U5QT766-WQf2fSEzOaOo3eyzLtitrQO8lmqlW
    2At9G99M212KVBWDZ9BGlNf9PxJn2RFJI4ndl-qJPc7_CJaXBlv_uU3>
X-ME-Received: <xmr:5M_3asVGfqQWo9zr3jAMIppuaTX0gKrNWrAa4ojY7WcmufUhWRe0wfo4Oai7_6Y5qUW9Yd73>
X-ME-Proxy-Cause: dmFkZTFwQh0ELJpE6112s8MyRWshLM3h/+unzmFMo3mwTz5nZkBeMQm0HKaSVwMr5DQl8i
    cnVbEPsE00HX2qkiRUfUrcn3ir9I7B2BH3l1asXz4XB5Ihe8Yi7+6HrFGUUbGaDao+m4Om
    Tota3AHf1W4XjVrWufU7/BBsqAvi6QvWP4UBYXR8PYArHIS3AC4VgAfu3vXuyMfQxlKUuu
    ItVtx8Fb+ewAAONKPHvpvNnEs1QRBpp4uESng/ED1OHfyWKT+dQTir24TDL64AGWxvfdqv
    woA8nt3G/MJPF0+bhvrZpDATkQXockdH2DB44KlDPvz4/0semGzD7o04zs2S5L5hfHC1t2
    5nBGNkvpDR1fqtlYRBdFMhHGHz1lattA5aQ3bdSnaapZF+PsxJjXj/EfUTYlEHpGALLzt/
    t2XOR1rRJRabAEyDA9EZ23HxMrW924dc9mDsaBGCmkRR3ONFVelAVaybSiw2/2HdtWQMgs
    0arDPtmXZJ+FPGUzlHVqGNaVjK+IIVRBQvQqfRzTOX7UrmTafFMFsbJGzoUwxoDxAhg3re
    RQ+tiZD+QFxdLCrB9iQRxm7cxZCN6yz6Cnprk7hfu7qn54+mGKWRTl3YVaoPOC3NLrOLQb
    piEYr+t5ekaInd9k4GYsIYzaAHEMyPnAM6/sNJULkMrZRdCG079nSytl7kZQ
X-ME-Proxy: <xmx:5M_3avFde3C6VhA1XP7NTz9qTjwqS7DxwNDfe4xkbsNMuJTHSYs1Sw>
    <xmx:5M_3anOhFckzaHS55yU0nrQn6Rbtl5VkRd-Uyd0qM2-Tj73vDs8cxw>
    <xmx:5M_3arVbrW4HEVG44FqTSnOWhaulIJfiH3wOQe8ACQO_QoSINhsYdg>
    <xmx:5M_3auznDzH6TLevsWLbHT7DR96qWybOm1FywEpGJcW7WiPm9l1PLA>
    <xmx:5c_3at3XiXCcCoS_mIvN9ggNR638ejcC9jscmMkPis_i9ZlnwUL5cLc4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:04 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de
Cc: finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 0/3] pmdomain: rockchip: RK3576 NPU domain supply and settle delay
Date: Sat, 14 Nov 2026 16:04:58 +1300
Message-ID: <cover.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes how the Rockchip power-domain driver initializes
domains that need a regulator, adds proper regulator handling for the
RK3576 NPU power domain, and adds a settle wait after power-on for some
RK3576 power domains.

These are the pmdomain patches of the RK3576 NPU series, split out and
rebased on Ulf's next, as Ulf asked after dropping v15 7, 9 and 10:
https://lore.kernel.org/all/CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB+8sm6w@mail.gmail.com/

The accel/rocket and DT patches follow as their own v17:
https://lore.kernel.org/all/cover.1794615324.git.gahing@gahingwoo.com/

Based on: Ulf's next (844a13010b0b)

Changes in v17:

- Reorganized the series as Ulf asked, and split the fix for regulator
  domain initialization from the RK3576 NPU regulator handling.
- Following Finley Xiao's (Rockchip) review of v16, the RK3576 delay is
  now 15 us on NPUTOP and VOP only.
- Fixed the subdomains of a regulator domain being left in the wrong
  state at probe, reported by Vladimir Bely (1/3).
- The RK3576 NPU power domain uses DOMAIN_RK3576_R, the same macro
  Leonard Lausen's GPU patch added (2/3).

Testing:

Tested on a Radxa ROCK 4D, with these patches and the rest of v17
backported to Armbian's 7.3 kernel:

- With the NPU disabled in the DT, NPUTOP, NPU0 and NPU1 are switched
  off and idled at probe on every boot (16 boots). Without 1/3, all 14
  boots left them on, and one of them hung.
- With the NPU enabled, 30 NPU power-ups after a warm reboot and 30
  after a cold power-on, with identical output and no SError.

Logs: https://github.com/gahingwoo/linux-rk3576-npu/tree/main/board-logs

Tag changes:

- 3/3 changes the delay values of the v16 patch and is organized
  differently, so I've dropped Abel's and Heiko's Reviewed-by. Abel,
  Heiko, could you take another look?

Jiaxing Hu (3):
  pmdomain: rockchip: switch off the subdomains of a regulator domain at
    probe
  pmdomain: rockchip: manage the RK3576 NPU domain supply
  pmdomain: rockchip: settle RK3576 NPUTOP and VOP after power-on

 drivers/pmdomain/rockchip/pm-domains.c | 115 ++++++++++++++++++++++++---------
 1 file changed, 85 insertions(+), 30 deletions(-)


base-commit: 844a13010b0b93f8561ef2c088f843647d5e552d
-- 
2.43.0

