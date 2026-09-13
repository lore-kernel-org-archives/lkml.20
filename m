Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E0D3DE434
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294444; cv=none; b=QTVRj2PYe3c+AqGPMBV0A4JKOie8Xu+9C4SAypd9sbQWbnaQwwa2Pyoh6OmY5y6COqo0Bhk6ROOzrXWYWkTYH3oc7XQoxTLamzWDijdOh3+Beku6bPkQ3giPHQvEvPkUhEYt+VQUCaKsBHyn5SlJDnYZv3vCD6KMmc3DPRJYWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294444; c=relaxed/simple;
	bh=sIRyTDL4yuapJ9WXhCs4TLXjICKrJfmA/btxxDSbpDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVk/WrmG0n+v7grIY74rrwTQBnWyazgqBtMStIRh7uIpqiPTNJ4+NTfgM/onveoo6SgWmAIfFd7qSFpFfyFY//dmjZ1GI7QPVzCG4jkNxc/WXBCfmETkDQvm3WkQg+q0ZdWUSAbcYSAdPyzsDs3MydANk5QZIlfYeIkp3HgabFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=dR3DDnDn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jcd7n2vq; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="dR3DDnDn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jcd7n2vq"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ECC9D1400089;
	Sun, 13 Sep 2026 06:14:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 13 Sep 2026 06:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789294440; x=1789380840; bh=xL/pppDBKZ
	KsZl0eShGKxhkVQ8+yLagKVisSVgRW7BI=; b=dR3DDnDnifIuDA+ZqO2jVe9sKV
	bHXuDegMZxybrLM7MADeXKSIn/mO4fr4FPz6v6LIYvMtTZS5a6CgZ/9Zv3rmtfK4
	6tkgCcCb22DcdEOuxLaKc3YN64vVRGZpTqz3lbC1OKvfU/RvZgUDz7FlFckb/uci
	MCKffag2lorJHDuA5a35BhevxnK+D3uRY819wOipwg30BzqeyjsPNDapsiFxy9Xs
	V/ZaLbfdu5xdJUCeF5B8DSn+Qhyncx986p3Rkan2KR3jVJBN6WzqRsYlzhdFKsGC
	O6dupkdsE2txdxuSO7hivybAbjzW11CFhEgLPmngKjUSgtjWJP1xZRTGy25w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789294440; x=1789380840; bh=xL/pppDBKZKsZl0eShGKxhkVQ8+yLagKVis
	SVgRW7BI=; b=Jcd7n2vqYyR8PuaDY4rvwtkRXOfR9ktCffAzyRMFEQM5GM/pzZ/
	cS58/5ULAnnVHfyzeielgsQ6da/bAG3CUwQlpudfxBhKaHW/MsD4fT+qGnhkJmX3
	iFmK8IJTRXFln0ZynkODaT88gSvE8sH6N5P55MLjMw2XcvrkmLRBmVwoGKEfCPI0
	RzQUChZVevmuACRnmLLX9MyXLuHDC97RCieW2Vl+KbaDeYj+2OCPH3Zuo4Ow8S2f
	Ub2UOlIVH9lwEc6ruMDSQhnZZaqjO0U0IEmStqr4bcdGFDPDiJe8vYHQkRrbNiBy
	M+Gddpp2Oc/ETWerjD6n9rHRq3UhQQGZ1/Q==
X-ME-Sender: <xms:aHemaj5q_mKcgZRjoCGHngRIzcZkm9VvfBKg-Qqll3gyf_GOnHSPxQ>
    <xme:aHemam05yZYmAcAceHjA6MpaFjLHkqEgezPEZxZHklWvWkM455_9ljiwbrLzlcKac
    VTFmeP7R2wskPyo6n7KD7dyU-EVQkA1U4AAPdboNX4eHHlPab0bccIg>
X-ME-Received: <xmr:aHemaiDfh10g8SiIdbOqxpY0TX6ILqroWJUW-FBR3NUIQpL85tumIb9W2oQm40fT81lVLA64Z5jomdzYKk5GFL9Pk0LEKbwYdapz0_pdZ6e5HQ>
X-ME-Proxy-Cause: dmFkZTF8Jm+xhDYr8cyNyq/6AZz8k1HKOuRajGHEr8NLUrPsYP9SUrtxeeOj6yDmFMi72C
    eLpkljtW7SAKdNVoy/r+ZvYmkLWYmrIGC4oQW7YdK0LY8LxYE7mKvN6p6IU3l2YkZXsvKF
    NIC7TSXw7JjUx1GCjOP+38csIGz3Ktni2oA1HscTscDnQbENTewI2YpaRHwA0wxuPxcZMJ
    wNP8r9z0flw1KwMzsY6zgD3yuzGm4kEXquA4VzaxWyxuGvpBQChC2Lq9aAq4lFOTiUwBft
    HYi0QSTkeA+d7MMiTCrx+HVWAoGQDqU1+NJ10nZgumteKpbtgnm7mTfYfeCj9I+yBjn1p0
    CxArLQMdCnACAM5CBRq7uEi2+bu8G7FVfjyvuKh7vgiT1cvaUp619hMw/OkzA4uMicol0S
    rFqw7Iqk7YShIlIQIP2mv5D9JY5NoScvrEAWOjgNW6QhrBCM/f634mu14vZedrWLSvR70Z
    EKHRmgSQ+CgSEkjpn8CsU2jfKEc0wkPdEzwlwBOxUNpvy6Y33TEjNVLkyQI+aaluXyzq2i
    fNbgeJCcjdtlf2B3Irn4oHaEhejP4IylkuTVl4NCrOulzdcFfGnvSzq+bLQyLJIlDoePf1
    sKIpwb2M/+DxUH/E240z6ozsxKE30egt0wuBGEGq47syZMuqkVkQQXJE/hQw
X-ME-Proxy: <xmx:aHemag2saPTfkcrRbEWf7s6DzYwmLRy-vgbdOJDcuON3sI_z4QjV6Q>
    <xmx:aHemakuitdi9sHXqRCcLGgN1T3da5WefqwlSCKeuH94xDmTpoMazcg>
    <xmx:aHemao5zG86kgMCG9NEXz87fduMR_bKZGnFKLZ5U8Y6CU5pjNTBD0w>
    <xmx:aHematLP50o6ddjGe6ADgbORNRxzNPNZcv4bYpQz6q2JlNKv82k39w>
    <xmx:aHemaktfo6D7oAauF6UVg7ziGKIYAytW0jAMPaZUZ6gl3Pwym06r5r9A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:13:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] firewire: ohci: refactor local AT request/response handling
Date: Sun, 13 Sep 2026 19:13:51 +0900
Message-ID: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the handling of asynchronous transactions to the local
node in the OHCI driver.

The current implementation has several special cases for transactions to
the two CSR address ranges on the local node. The code for detecting these
cases and generating the corresponding response packets is spread across
conditional and switch statements, making the handling difficult to follow.

This series first factors out the detection of the CSR address ranges and
local AT request/response packets. It then simplifies the response handling
and separates the request and response paths into different helper functions.

No functional changes are intended.


Takashi Sakamoto (5):
  firewire: ohci: use in_range() macro to detect CSR address ranges
  firewire: ohci: add helper function to detect local AT
    request/response packets
  firewire: ohci: refactor multiple calls to fw_fill_response()
  firewire: ohci: refactor local response packet handling
  firewire: ohci: refactor handling of local AT request/response packets

 drivers/firewire/ohci.c | 137 +++++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 59 deletions(-)


base-commit: b5da1bc987ce48b61cd623c7821f1e7172b0e597
-- 
2.53.0

