Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90ED331EB2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305064; cv=none; b=n7XOMReFfUgauiZZiXguirxjJ08u1HQK82R4Sg44mG1QX6NF4qSHYI+w+hOkER/LRM23n1Dmy4srtrY3SBnWeMCWeYhz3AAn7NCVGe/mILPVMGQRVGj48L4Rv0Lst1Kefjs1vCySR6+N9TNKO3YumRyPbfTpIaeT+6/C+v53trU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305064; c=relaxed/simple;
	bh=VObivlGkdFZee0+XTL5qTfemyZiwe8bc5UDJ5ng5Aw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/ztDH7ZE/UKPMDR7i165G1o2V8F/2VyaLGI1g629+Z7hghnYTgvHo2LXzs5ZziMnMGPyEZN1zZq+7cwdbsbmnUMdhERVYdd2ADwnc4TgFJo6zqJjVp8iFKuNrjlrD1WJ1PKPsQPHe38mR6agqBxw+fDGXbAOYpBbMegRZd3aXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=TZs4pi3z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e2lK9uat; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="TZs4pi3z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e2lK9uat"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 97A751D000DC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:31:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 18 Oct 2026 02:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792305060; x=1792391460; bh=dzuTLjw4yf
	h/q4M1Npgw2toNR9+lIrLeL1oL8Cwp5Mo=; b=TZs4pi3zmokk3MYIiiwsexvLJr
	XPEbI5w9GTtHJRFrxG0gsNFVp8M/zmX9yFT5TIQ+l1kQ1HUIjdMvBC8ppBFFC/D/
	tUynGlk8AWaBNSdygmidat7ra5rsdcAbZAdqJsRmA1qrZfIapOfIwXeo0MgWp5jq
	2tiD9o4v1idB1aB3pWhOOJDAeYtK3wVU7sXzKf70PXANpIrghAaWVcCY1ZQn8r41
	DlWBliHv13WK2nwmOVrAu1mNKW+kYomYAMGUpSeR8NUrx99mxLJMR9rQ74vKdUfu
	y4Y3aSpquWSneXcbBeRkmQca5d+koZ8nizoW2EC9eYlVKOUfmuJvKZh1UMzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792305060; x=1792391460; bh=dzuTLjw4yfh/q4M1Npgw2toNR9+lIrLeL1o
	L8Cwp5Mo=; b=e2lK9uatnKFNviD95ybeVCbn8RIQeBwFT1kb6C2PSB+Wr2kUufr
	9iknWdbJtBtqE8CB2GPYtXp7v98PG4aLKg4hrUPImVcUmgugXk7V5GguCFMo8T+j
	qX9NUwkExmWxCj0qYH569EOvvoAU2aRq1/GsUIbHQWPGBK9kklHvpGSS7clincHM
	o2Kfn+74kXPE2FrXIFS98hqeWFUJcnrTFFm02CK+2m+iUIqW2p/OeoVS47Gwvl57
	QrtamB8G3ovxTRe5n1FkrE0MLeUW/pHYuLzObR8Qb+Phpquck1N4d9AwvQ0M3Rcz
	aoCHfajyrby3tezyyxH2xDOYRqYG9FR0OQQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792305060; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:QuZVP5z8JAkdA+GyBAtIPJ7jO6IA5toyIZG9V6c0BQEwz05
	YsyUK2r2EADYTldNsBRRHXHi6WeZqEO0BAiAfHDdwkT/VW65Ac8GQkB9z8abergw
	fudaXnPjy/JxBFpV3mlW5ha3BXXVHOEcBR1Cm0OVSbOtyZk1MoVHI23iAsg3ZpwB
	sUy53xhoOk0xmqiDLQj9a3eHmR/wJcJJ/Y00ZBngri+APsnUb+4tApCegno7nB1S
	xe4CLom5HKV8LJz4AZyulFxjKn+5BSlm4dP1WFqED9Qo9afkP6Qtme0MR8NGTQtz
	+pZJnOFnD/GnHC2hJ+pLou7gq65UYuQQWo+vhpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:R8f772QHq8uwMtQDxA3Da7rRO5tVzJWOgrQw8Fs7UqU=:VObivlGkdFZee0+XTL5qTfemyZiwe8bc5UDJ5ng5Aw4=;
X-ME-Sender: <xms:pGfUakI5_tut_KNaqa1p8MMiQEt9qxsnY24YipZ2IOzugBZG4CbSAg>
    <xme:pGfUaiH2YT87Pr5-1FtRW9TiA8gNcGcO38ltQtotVOEKStPulL9Re7T1DXYM3J2FD
    jrCrDwzHl-I6eGvN7VlX6gaLpjmLYnoFP4U1dUicXcJD8ui6VdU5g>
X-ME-Received: <xmr:pGfUasTvCW5rFmUJolc3Y6XQ9kEXw8ur48Cuqp6Mr6Wd1YLHwoG_EhgXQsyXkqcRa65iWqpfCHI6MjPCzLmHOkq5nIIywZXqGoMEQwIcIJUx>
X-ME-Proxy-Cause: dmFkZTEegWdMRooeKmd2eyr22l3v8mzBvZWk7nzW+a6EZyoxXNc63M9AVpmVQdCOH8jbMo
    PjUgeTDf7Mq3oSZZFz6/gxoWe1CzdaTnDIcbSC4eQxnk/1LhU8CJ/kNpc08EHeKSG6HZPM
    7BB5/54pKSCTPqWSTmrXMF+FDMWbuqFX6bVv9gKsiR5cQh96aoPm3VpeuW9YUNrWpG9LO6
    pQuvn7CqycfZCi8w9+xDhmDMzVmPVC49B6tL1ohRMSJ+0jDw0G1fweH3zX89lWuKjI7QUn
    Pc37/emOkpa1Md/yK/iF5qtEhm9CLG/P4Pz/zTn2yagQBfj5Vdj/XWAXM9jcD23+btqEV4
    eO/qGEk6i7J2aAmSOaWKTuR6RxDvDsxmpQh+6zWAEnfNUZBFFjF9EQDD8l2frfjaJZuodW
    6zcR18H7+FlDHJ37HFn4UH3xyJWzfZkO6R/eP5UuT3aK7c3F4cFYmdinHSfg50WF0qibo5
    geN63Me57U5ddd1BjxyEUA5+cYWwsuxMQfZr09jLA3VJIseaobNLpSBVBxEB//TumuZDKJ
    akuWTHKUAbLE1aTM2zvbuOU7JCDosXLBBNz2FlEuXOb3TadOP91sE/RNvh9V6gwtCtOMWI
    nmkr4SABGt6GgDoQWJpY01FSgpaakKQDtDtLodk/70/iisy+aKd4HXfgrh8Q
X-ME-Proxy: <xmx:pGfUauEZ7WVi1X-lEIdoHLbDUSBIc7dSLQn6sFVBsWG9bAzzHqe81w>
    <xmx:pGfUao_dNEDXQ-A5MtW-fiPVsq8Wh20NRQua8hqMiLyS-anbxhjjPQ>
    <xmx:pGfUaoLHNsm5c08aOF1Yd3iSee9CLV7jl0Jw5t34iF-OoZBN3A4Oyg>
    <xmx:pGfUarbG578RY9XijDGVXPj8gu93RO0Nm_hLWIJVQ-Fw3sbidZamsA>
    <xmx:pGfUam_xQ6EuIoDB0-F2s4bDkTiul2tboHNq4rRB9A3SmqPW_d5sNdb3>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 02:30:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firewire: core: simplify pending transaction cancellation on card removal
Date: Sun, 18 Oct 2026 15:30:53 +0900
Message-ID: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series simplifies the handling of pending transactions by using
workqueue when a card is removed. It also improves the checking of
preconditions for scheduling error callbacks by moving the warning check
to the scheduling helper and using compiler-based context analysis to
verify lock state.


Takashi Sakamoto (3):
  firewire: core: use workqueue to cancel all pending transactions on
    card removal
  firewire: core: check precondition when scheduling error callbacks
  firewire: core: use context analysis to check lock state when
    scheduling error callbacks

 drivers/firewire/core-card.c        |  4 +-
 drivers/firewire/core-transaction.c | 76 ++++++++++++++---------------
 2 files changed, 40 insertions(+), 40 deletions(-)


base-commit: 7b00b66bdb92a0028ecb7fe343d4517dc1e95017
-- 
2.53.0

