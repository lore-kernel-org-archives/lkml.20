Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80631AA1D5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790480631; cv=none; b=XrVJgnUJR4Xloi5un4yJ6uOhWkaCDKTuMC5Kg5RfkEIW2sPu+iCvGkX8I/cavTnddrxcQE318sD+pSyos4y/v36/Zssp+SOs/NrEeUf5rgw/RXi8lr7OlZNOPigvY+EaxpjLOnBbHgn9+UglvXD8eVXy0alpXBe1w3CFdR7d9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790480631; c=relaxed/simple;
	bh=4dMqe55YrHOCAsVGSSWUADtAw5X9S4b68TFLM8vQM98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3hPSGW4NebfEJcPeObb8o/t0wcTBmFQQhtB7VuolTExSLkd45u23lNib/8UXJw3eNq6ZtsoGrj874NEvxWmycud0SMwKfmQW7u/GuY/k7o3XeRt7XGkrH8yxgwMAOUkiL+6nDHtDTxwkivu+Glu7LEItzG1o0c9ra44MX71jjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Hj0aNk/y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a44beL4l; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Hj0aNk/y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a44beL4l"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D3E8D7A0065;
	Sat, 26 Sep 2026 23:43:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 26 Sep 2026 23:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790480627; x=1790567027; bh=4tfOdb0ZBY
	6Z118i8Qux5oxr9QGxnKjtNuF9FtAYUgA=; b=Hj0aNk/y3Tht/yNrRtUJLGykUX
	V7EWam6tVKPBafaGXaQOV57LB7z1SVlYMxvSh0dM9uZwyiu0AwMg0yN1J5PsRCMa
	0X1d5opdHx5mX20vWAcO9v+Marlv7oCkxTWqB6kUdCStmaICywZdaqblPT5jIo3A
	fzrcQCLVmD7YuStIX6G7SELgTeuQNT3+69QaUSyHQUQ3B4VqdUpV1lLjE3SpoKGR
	ilmXBzGVGp0hTbsp72RDot/bXu14dVs2SFke5fTlxY5gbhuf88xd2KpSBw570f+2
	Lp0spiKB8rihv5HcC/dGydIZf/LpLgFlI6ImD+PhFV7V6q86CwAZKkwEft1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790480627; x=1790567027; bh=4tfOdb0ZBY6Z118i8Qux5oxr9QGxnKjtNuF
	9FtAYUgA=; b=a44beL4li8bgSsF4W1EogVsTEPf2vmcCr7vGdbL/55iGcQfot83
	TR1H7mQPilkMslt2WNnMDk5LvqnYmjgYuBdODh/8hh5CDtCitk7Kv7X8IdocPKGa
	+EmcI5PSo6RdMMdq3g2v8d1A/98ZjZKMIIfTyuuzJjdk3KGCeKHyNuPAMYQECXhm
	8Skmovkr+ZkJ7DwUn4u6E04sYNMEL6e9WgxJDSi9s12OQWBvK1N3zVUpKxJPUwZL
	ynJ+/xTkPzzXuCv1y2IoR0ShqxtAQt70A71dpsos1i4IBMRG19vi40uMe2kLThFJ
	C+8KsADNm8c+zkGjuiOM7eBQx7hteRxaiVw==
X-ME-Sender: <xms:85C4alqknodVdu4Xa5Adh80g4GdsPpIfE8xIwcfjmATZS_M6xF5fuA>
    <xme:85C4alkfB_0SRijlCTy0S2_J9SOFwMrvp9spxad1WQlBYHgfQE9OMJMJQs-DVzQJA
    0E_4oXJEHo3u4J2aRUhu1Mv_IfhHqJkc3J40noNx-Lgk97ZGLBL6e1E>
X-ME-Received: <xmr:85C4apzMBCBh3lvkLeEXg6ygeJ_5d1ktJEtELgoUOdqf_URKH1De9MEZ-tqu39R-tlE-2FbNy6rgqBz9KHwojeseHs1nsQPuxhJIM4nr_zwlhg>
X-ME-Proxy-Cause: dmFkZTEwRfMz7XJgssz0/DfzsJNIIuG4uLjd+iSPojoUuKAoJrdU9be/TdWKOdEKnTRnoO
    itD1Alf3kZvL+dWeGWRaYbpnPmktI0LAXNa+xqG/oZmMuM/qfTqn+Y0KiTe85pT7drB4M8
    ycmOnRBq0ilFe09Ow4zM2F1tALApIhCAvyo9O5wP4OeWQnFgqjB7TfDtu70X2lk4jQAobp
    KC5RPoL23uu/3tvhjJ4u9joZo4pfUBeLZAeezLjAjqx4TNQ2Iy+m2MAg+h9j7xayDWL4xc
    X01vsMDv8JEcKVMDzm19/TryUeBBL3b1Q4M55mAzGRKtzK9thIZ8wpNmG72DFgAQC27fiB
    BE08sAGCEdgZX85mp+e777hLllldGKt0oKO+X0t3JfcLjqWaNwhvYXZ5pl/ZtIx43Ls9A9
    PBTDK3PvyX+I6lLcLX1yC1fgQZbkNvrEXozJKg3/OubzVU4O+m1TulfVVzFT0zjo7BlbB3
    dM14MVlHWQduvrjAQXs/Ao3jP66gDrZPe2yGyFWAwH5nl8Q9770JojWE6jqk/xnGOcMY9N
    DV7M4/bZWkJUUfw8PVjiyneq/obmAOBxHcmwowjAi3RkWQVTiZkJifFTJ61KZrUnWljsoe
    BqzaZ+yQCqjN/LJE1cuPNn6w+DyoRA0TnARnX6Mz3HI8PFskR0I3hKYdxVzg
X-ME-Proxy: <xmx:85C4atkxR3eX26x9V-DLlxa5EMBNRhlbkwzoLnF0Ek2nYgh32TvO1A>
    <xmx:85C4aifiub0Fy7UxqmyXZozJcNSAzsmoDbdpjOqUH0l8HOQ5BW49Kg>
    <xmx:85C4ajpMGskEGy8e9gt2Gxy-ngL55_djqU9tai9orqjxMqd4zFcJlw>
    <xmx:85C4ag6ZpAbFjkuu2FbmR6EMKfdyMB9Mfpe4JSGW5UzySNuD_US05Q>
    <xmx:85C4akc3REKYDbvpeKOsP5zp_nTGLcGGEHbgwkGoEm2PHffdWq1GS1oe>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 23:43:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] firewire: cdev: code refactoring
Date: Sun, 27 Sep 2026 12:43:39 +0900
Message-ID: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The cdev implementation includes some useless locking, goto, and waking
up. This series arranges the implementation to remove them.

Takashi Sakamoto (4):
  firewire: cdev: remove unnecessary client locking for fw_device
    members
  firewire: cdev: wake up client from queue_event() only when any event
    is available
  firewire: cdev: use xchg() to exchange pointer value
  firewire: cdev: refactor event copying to remove goto statement

 drivers/firewire/core-cdev.c | 61 +++++++++++++++---------------------
 1 file changed, 26 insertions(+), 35 deletions(-)


base-commit: cc43480ac04cf909387d8b722f7491905ef7a7c3
-- 
2.53.0

