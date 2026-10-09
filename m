Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79874493D22
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547859; cv=none; b=k36pAibHqrG0cwA8rIlhOfDABOsRX2yvrleqL6GAvq0CpdpHDbu57O8sVLxgV38a4N9C1oxpADA7Diyj4c4Qd14oFmZCNcyGZXaljJDJ0SSdelQF5HsgVy4dzU0x+Zn9dzoM+8Ooiwc+/b6NgqZzulcZGERPuEwV1GTaHvfW0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547859; c=relaxed/simple;
	bh=z+lhOHENUa0p5BGFRdV3OmjD4S4JwfZowv9tiNX+jA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5BT+jGwYM5vvk74SF7MtmSr7T130fVaXugyyc5T0AQsXtpEL7CcsnP2hUUSYAQliFM+CLYnpj+3PruEeXphRghlNCXcHfdmZYcq8rOHAY7zLXVb4TEYmLYuhtKgKEEhH+YhfvfemKgo1BBb3aAuVAidQQIDTyCE5yYude/L1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=O7P2rESP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WnUvHdr6; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="O7P2rESP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WnUvHdr6"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 519ABEC09D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 09 Oct 2026 08:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791547853; x=1791634253; bh=LeVa76QPyz
	MAJrE5OaG8mQBW6lP7rg2tRoE8Elhewhw=; b=O7P2rESP0dDNpVZNI0ou7REhwP
	vSCbsSKzw/qdN72FD0lsbURcEPPGPy3pZVZ/cyvWEnr7UQzyaE3WrkMSUh4ulO16
	yW16f0hPtyVPsKmx4o4dUwCCjY+4Ib6GnnUmLS6vpThjCEsmOqShcvtMDJr8pTN2
	+A3YJdAwqpZrHeodlf+Am+HiZ9bMk3N2fOBzStJhsD0D8dHXCr4DJp2nkndCUTeo
	UmYRQljPzCCYn5FDNfhenl3VKEkXldm7xulkLF7tGu70cOOccsEkbpqoiDm5/PCY
	K54/+L56PPcrNGzTetxbzAjTRKWx8Ei5tQQgFwa78I3lCMEAJNtq/CSG8xeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791547853; x=1791634253; bh=LeVa76QPyzMAJrE5OaG8mQBW6lP7rg2tRoE
	8Elhewhw=; b=WnUvHdr6GQNJ2vK6EwPq7R14/HoU9+XEguK+ctCxatmL1rm5MR6
	5Rvi37PkMWPx1m6dlz20WO36W5AGH7s5H9U/V7li5g8Io0HhS3VBkCYQBxJdXzv/
	/0TKFbabGKTZK1UopvgpjlxHvje9oN17YB9yFkPe+qG/8ZjrhuoVcTtg27/15Avl
	ulrzrV/1nBbFDm9r9XkH26MzBc0+g5yxJDAH9dYGJyh8TavySR8SrlujFSjge9zZ
	MknCmtt84fUnaORrnO4Do5sIywjaXwpF9LDuWVaJsiEyg1st96v5v9yd3Slc72hZ
	WLXSThoulK+n1OVoKkVlJCNjEil7DwB9H/A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547853; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:toSL5WsTV6jR2W6mTcvZIQgjeMQAg4LtUskK3wLdjl4Lt7X
	ATclLA9rA2W+T5gs3YeJbwAKgQIpKEMndP0JrSfL/xyNC1CBs5IFTRgi3j6evKe5
	pTn9QIBX1vCEP+V48i2zdpWMGkXOKXTX0VRkhOXC4AzbZVzJMgknGDmbaY2HnY03
	mUSc2eHl8Otb7bJ/p20GcE5OVsY9N0RyAZU0M/LA+tO8PNy4+rzaBGAkEy4XIQdA
	6GDQAMS5EBnUAmpwnqwOB0OREeaq+CR6M1N/vOrLPLkBBlotXwaxG0tb0EFH3tE7
	WtxGSvaK+zuSCfFKOoaz19HEdqBUg427vxPo65g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:JTuFmj0jffQbK9lpJ6k8Io8mLPMD+NGf9jFo0gzgGgM=:z+lhOHENUa0p5BGFRdV3OmjD4S4JwfZowv9tiNX+jA0=;
X-ME-Sender: <xms:zdnIaixAjQP4-OfmeF9RtZSTfxXybzMcFc5eV5m5YSZxgt906JQdLw>
    <xme:zdnIasMjNuNAudvs2PcELZLdIdPEkaNlNWAqqtMus6GhgvhEomSeeul0a2yR_WFrJ
    66DulXGR3eAsXTQStJB0gNznghOL6ZEl_MUl-V5I7WI7VCfGEu2dwc>
X-ME-Received: <xmr:zdnIar7puF2iM3fTF5YGXN24s5F4HTPxsZRAUWv6urUZJmVyx6DKEDGWkzR9N5At6J8tBGdgWjuXGHkpbH5j31vlTDnZz_QzV7uSlg09Pod6Gg>
X-ME-Proxy-Cause: dmFkZTGPk6D34MxJrKKck1M/JxkOYUAeTWmDgt2rqaeGUC1jhTdSH11MjlF9490/D+SqMB
    cMHGzidbqwkjCQUXQHDcZd+s/d9XozLYrIoROF1bVOZ52u6cslFVZM5p6bAWVv6hpW1MI3
    /D3ssWyCmwVb/q3OczJGBuR251kiu2beadofwi4IPkf/GZgSRJyGxgNsi8Z6U7ZigUVoP4
    Cwq7Bsw3UyGNZqufnG5j61bEqthjLf72xSW+DzCq0nZV8mn8sPPozAziQtkspt6GBN34cV
    QvJ7jRFpSzqh6EIa8ZonCHrYKBJ+Isuo6wDjbdTLGdvUu3dk0FxyTuDlyfquASAfpVq+UT
    uJCQTxkPSQtzl3D74Nm2hrCUgbKd4fD6h9ddtUaqexrBLgtVOmX/URoIohPPr6EfqU9irC
    Ragxe5qxdlkW3TES+LnKlaERETWhaUQPY+PKcgNfQY2wVMc5iox4iRjB6IXu38SKqlKfNt
    SyU7vkSqfAcgLuhraJ8RikTkLg87+u1zGLRVoj3dguBDXFrmZGX4rF61RFbHXnG/95BCoD
    6igO1RyLz7QEPOqK1KCQR0y77apwDr7LCh4i2K1axfoyEeiOZ17DBNqBWi6IpxYZ/Ev+AY
    2I0fpWRQ9PirExNJPOjeTUWCksu/bMK5D8fqng4bO7wD6ZbjAzDh8KglLujA
X-ME-Proxy: <xmx:zdnIalMlfObKMOenJFYnc4j-I0SWcnV0Xao4cilN9dPShGXAAflybA>
    <xmx:zdnIahkpfeoJ9-7ZoDoB9WeYtUE4-ZmYjjwdewVVbfxsTyjm15yO-w>
    <xmx:zdnIakTtFI0pcB-pF7FXIRq0wYp2fC1VDUAQiIIk2__XUw7aYveW4w>
    <xmx:zdnIalAmQsaN5lLzx3Oqfp32U38uVWoORzV85U1Q4ROfEx2mAxJWxA>
    <xmx:zdnIaimzHGN0CE3qA4I2YPTxfm64S6pkYOCdNB5Hnbo1SiUqcT4b9ELm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] firewire: core: make execution context assumptions explicit
Date: Fri,  9 Oct 2026 21:10:43 +0900
Message-ID: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is take 2 of the previous series[1].

Recent code changes have guaranteed the execution contexts of several
functions in the transaction layer. Based on this, this series adds
might_sleep() calls where appropriate. It also adds sparse annotations
and lockdep checks for several locks to document the expected locking
context and help detect incorrect locking behavior.

Chanes from v1:
* drop a patch to arrange spinlock usages for reconsideration

[1] https://lore.kernel.org/lkml/20261008234432.251412-1-o-takashi@sakamocchi.jp/


Takashi Sakamoto (5):
  firewire: core: add might_sleep() checks
  firewire: core: use sparse annotations and lockdep checks for
    transaction lock
  firewire: core: use sparse annotations and lockdep checks for topology
    map lock
  firewire: core: use sparse annotations and lockdep checks for split
    timeout lock
  firewire: core: narrow the card lock scope when accessing node_id

 drivers/firewire/core-topology.c    |  3 ++
 drivers/firewire/core-transaction.c | 70 ++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 7 deletions(-)


base-commit: a8cf19ce243bf2cd0d338823fa79cd927e34b830
-- 
2.53.0

