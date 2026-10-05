Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15B47DFBF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199552; cv=none; b=KB0JOheOHMW5cUbV086WFv28Djhvts7Y0ML/aRbayI19k8pOoBhIDupcvub87gFG5tiac1UiJ3YqGaTqZokL97AfEJY6Ixz9ZntrozFO7JfzqdeV0muPF00rACjwa3JXfP/VoDc92eQVZC6s+vgNzIypVecntP25pQHxhgkMcsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199552; c=relaxed/simple;
	bh=bxSxArcyQtQe3voBP71/q4OgGUxE2uiaWEEnjQbfxbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+333o0FSF9zcS6BZF7NhmVC58NLsoiCysyqui7k0VpwAD269YSvvCN+nAlwGvxP4BE8xO0NH5xO1UuDC2OIPEviqCZtaPm6ZO+eJy/bdt6acgkVJWsSQQ4Rk1mz1Es1K95yAlxFyT5/81o81ZXwBCuRCqbdoG6pNqBjCFn+c/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YGQK3/EA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i+5h0vsT; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YGQK3/EA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i+5h0vsT"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C70757A0119
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 05 Oct 2026 07:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791199548; x=1791285948; bh=bmhfwJXI6a
	tBqyqsLTAeE3KLinZWOW5ILhFoqPfj3W4=; b=YGQK3/EA9cuf5ix7r0k0EYwvW7
	j4Epis/SpkxFC6QILAfcgqDpPcH9j4KNHEbYhvbzrJuN7VqzMnRpsKx9ThONnthI
	r4eXt/8WDU3/Kia7PS6+kCHEJGtaLUdYhpmXSV38+6erTTX/P41g6O4g4K0vJkYj
	gI/RZdMCnUbrpZsgW498zoKC4Uj2G1A7TtE8jgr+XijFfmroVY+fjTdUGT8j8Wh0
	sXc0C1+qcl6QKut4rGCkQS2lmY/69Nq36t8y6Aja4bve9xLGE7W0IBeZki+UclT4
	Amp3Mkv9Jcm1cuZM4IxrPkT1CFCItvbKKMJfWf9PEi20rtLdQTZX05MtPqJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791199548; x=1791285948; bh=bmhfwJXI6atBqyqsLTAeE3KLinZWOW5ILhF
	oqPfj3W4=; b=i+5h0vsTl4IneAFeaHTdxTuqEYphdIBUV0ac22fcEdKf0+RJxQQ
	D+5bCpvx5O68u0sPdBpkxpp/9WaV6V9UgE1LEdCohSocS4ySIpw4gLYViwxbUhi+
	xony1tG4CT2soV2wvySvnXcbnRt7xfawfYXAIh36OlTCkk8b/ypju+rMmPSaXuxr
	OTCXZcB2HcNPlrZCPY2tOn6s9q8EIGhUjmHgdK1txu1xxCrJjD58Yb2fDfJm2bAN
	PHqqkkjDPYQGzfueHJ7iRJzjt5ivtN0iDrkaSW/V6lzxVbsF8HJYGq5mT0DERPZP
	CckZJNnCUNakHwUrF0zC8qiqr6JCVDwYSnA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199548; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:IjXc3k4ckbn9cOwMu03Bnhh41wFu1Y2zJbZcmjAXCkWvpBy
	khedaYXFsvlHc1fBDC8AuGoCnv+hd+nVUpbYpda38xZ7h9HC4Hed1ng8Yt/T7GHc
	vaNdRduyj1c+6g5l7II5RMqh1XrrvGaJs5lQGvVkU0LerkPhPmw/C+4pfwL6iTJU
	i/xkOUBTRgDDwE9tzbGqdCZo9M7QeDS9Nx998UEM/BS+MzGUvqW2/isNqIlgwVhh
	PPj0xvAgdYSwsVX5OsAKCrFnXOvArZmCNQx4mmAtvW57KSM29D8/90M6s88avK74
	L56cxrhJHtdUOFbeoI5HcOoDk9PUN2on8lDi1NQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:J4Dx3m544rRWprRUPyZl2hjoaGMSaEIB+cOAj/Edtwg=:bxSxArcyQtQe3voBP71/q4OgGUxE2uiaWEEnjQbfxbI=;
X-ME-Sender: <xms:PInDag9TqWKkhNG8q7NzgVc420GE0t6Z9bBxcly216CczuQvfLTc7Q>
    <xme:PInDamogZt516ImHoeyzXTqQ2iku6AODcFSlIeUBq7RGFfPBu_ZudPeoD8mVMtiAj
    F-hJiksUKxxnCPntSRyjJshRZKjvrTHi-QurmoGNHnE1nWQ8Uhq2jk>
X-ME-Received: <xmr:PInDatmGGSreWHmV5pZpBcwQCVe51imGJvEd_d8_9QlkyFyvtZpliR0bELX5BuFNFQDnua2WKpCWB8pRp7gSsuUnToqqaIjyAyCi8kJ038MikA>
X-ME-Proxy-Cause: dmFkZTEiOfDoQXcZreQi1DJ7dcNLAX5hyLRx+VczFOTf9evluDd3NB9ngLYu7j9NfykTcI
    0XvvXHczCktwmnjnXbYnmV31SS1JJ/jtgUCvqVGtEX/PPXJ57LXxNQvX3vtpbwJNOsIn0O
    O6QEOvRriS3Yl+ySDKlQqUAUXhs6jIO3NTbXJC/YGwmdM/lmnsOXwCQGLxYbf6Q0dPTeDp
    hnrxnPZtHD4a8ebRV7uv2zcsZNaozdAHfpLpXsqP6U+CCKtOWB2X/qi/xMHDQU/VDScL55
    P8xeuAZKHquimH9jqglLsfCRh8HFbJF10WDes+/q5M9NbFL/tVf2hZ0VpEipngzX55Q8Rx
    G9qa2a6L4yEXr2cTk/Msx81V9yhtDp6oAcJX3jXw3MvFL4G/pJ0EwbYv7/uEvx1pkBjjR2
    GOWV84Xa7OAOVmvAE2Jx0VPKXS7FWBVjuJ527PvAUNrJun836qg6l4XIYcBfvTN93vcdex
    JNGd43jlA/hwkAEX+VqPv2oXiUPkEf0YmetoEQhRRnBeAq93iYtfjP7Hy36NFWrteMEfuf
    DQzF8WbfcZvbs9jvI00k48RemaErv9LFQMJUwEvQfK7NvYSZtBOhTyy3vhksyoyhjauU0V
    Zjavjgv3owlgO+Ma87/YAQ0LtmJcIZFkUW/i9+4n7F4Lo+Pdo9m78J/ORzIw
X-ME-Proxy: <xmx:PInDatJLqffI0c60qgwYYAECHwnwlBqKC6IslsJj8kn6pMOY75Cgng>
    <xmx:PInDaiynYGp32gcJGGXdRv2x_-VIFLR46WRADrk_IC8jHcekJRagmQ>
    <xmx:PInDalutuhct5T19Ym-wvxHD0sH10XKNR-Ys6Df-BUVuxlxhIiZCGA>
    <xmx:PInDahuancDpMJPwewQGDa8goLW8k4-aZvzJJJAUNGCKWC_-VBtxFg>
    <xmx:PInDamQNlKwPbm-RGe_z-rmxWOvUEvTbS-S6PDaNGkEet7Skhu8YgHme>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] firewire: core/ohci: defer cancellation callbacks to workqueue
Date: Mon,  5 Oct 2026 20:25:39 +0900
Message-ID: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The current implementation invokes both packet and transaction callbacks
from a workqueue when they complete normally[1][2]. In contrast, the
cancellation paths invoke the callbacks synchronously while cancelling
them.

Although the cancellation paths are guaranteed to run in process context,
invoking the callbacks synchronously is undesirable because it makes
callback execution depends on the context in which cancellation is
executed.

This series defers the callbacks to a workqueue when cancelling the
packets and transactions, so that callbacks are invoked from a workqueue
in both normal completion and cancellation paths.

This also allows local AT packets to be cancelled. Local packets currently
use a separate path and cannot be cancelled once queued. Make them use
the same cancellation mechanism as remote packets.

[1] [PATCH 0/5] firewire: ohci: invoke all AT packet callbacks from a workqueue
https://lore.kernel.org/lkml/20260919115017.859169-1-o-takashi@sakamocchi.jp/
[2] [PATCH 0/3] firewire: core: invoke transaction callbacks in process context
https://lore.kernel.org/lkml/20260921031931.287429-1-o-takashi@sakamocchi.jp/

Takashi Sakamoto (5):
  firewire: core: expand close_transaction() into its callers and remove
    it
  firewire: ohci: schedule callback on workqueue when cancelling AT
    request packet
  firewire: ohci: allow AT local packet cancellation
  firewire: core: schedule callback when cancelling pending transactions
  firewire: core: fulfill kerneldoc for fw_cancel_transaction()

 drivers/firewire/core-transaction.c | 91 ++++++++++++++---------------
 drivers/firewire/ohci.c             | 57 +++++++++++++-----
 2 files changed, 88 insertions(+), 60 deletions(-)


base-commit: a6e7c3836b81235df08814bd409f7a23efcfb34d
-- 
2.53.0

