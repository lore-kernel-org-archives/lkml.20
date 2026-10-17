Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3C29B77E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251226; cv=none; b=JVTqpmP1Ck6g5OxQcSYrxMIAClMWy5rWuuRTCTa89A20KU350QZgUr/MAXbENk/++n5sqkETbXSchzo3s8iVo5PTqh/5SRGh3M58jpObGwxUAN1YpdqbSD8lADsYXpnwR72+My3FzLOiJRaU34fv2YZ4hJBqag1cLf/VC8ifxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251226; c=relaxed/simple;
	bh=Ah/G1+AN7g52aO9NxYRLithqtdh3YvfFYvLJ0xR6oWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQkknQs77XZ1owvnWner94UbvQS3J2q+PfUjKgVf1VERZXe3Szj4GHjBYlOlzcVF8ORzaZodRz1A/TriC4T9PVjZol2i1zE3CCQpxeBvGFHBkKp4buNTexGu6sYS3COkDdgkJwDlZ/8Jek8cYknuHAaeHc0y6EFCE77hi/4XXZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Ux+H8Ne4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q/aWTY/m; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Ux+H8Ne4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q/aWTY/m"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 543F51400067
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:33:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 17 Oct 2026 11:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792251223; x=1792337623; bh=G7kkYyQeHy
	myLoUaYjseHxq7mL/Tm0mSHoQq1IeySus=; b=Ux+H8Ne4uR6fMiuqPaKCYexOoJ
	SDWPHxRO75ptkM3ypJqPCBux9KQi2Np6Cnx9VDo2twibdDBLZQA9lFBa/Q27+qfQ
	l4wKx2VKuMpHmqfZlbCC7JbaE/yBq7e0TCTPb/ZLl6vfOh0kgkIqDr61SleNHYt7
	iUx9FpCRizw1w++a72dHmhK1TxwUImwSKlbc7OLtKX+mNGobcJaj0tzCvR5674yP
	LtRE829SX2yVZvn8UledIIARKwemjqrZNDYPVkh20kFmboh4KyW58rlxWa+bBSIm
	nMc0WiQCoUsTWvuZaOCJ4MX/YxYSIZeDHz6XveIKlqfliybv5S3w4kKMrRXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792251223; x=1792337623; bh=G7kkYyQeHymyLoUaYjseHxq7mL/Tm0mSHoQ
	q1IeySus=; b=q/aWTY/mj5cDrSKl/Pqm7QSAVq897C+uMaFAuruR2flx+IcDFOo
	/Dihf8LpF+fq/sx1zhwWycO4SCvZuhqUOf++P977qoNyIK6DAysvfO1HaZ9bO7zs
	sDv9N2zzXgTTemMjwAW0DbnBYNxoveKqqZ0ZeN1Nkofl/7BQg+EQm6L2DDFrRXFk
	k+eNvNxM8FPA8KsdY8NG+gkwrOQLAwWlnuLZ87nxzyMT3Qf8jj51KyYNiV4VfU1Y
	x7EcCK1BSI0+OAuTfiZv6yaPi7mlPkiLg+bkgfQhIMR0BSJgj6JMxGVeD0ozyAUP
	gTg1fd7BpE1uk8IfuGwhfbbkBHJ/+04yi+w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792251223; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:YQ+jTYUz3S2IEnAKyxir03PtUoFsUez0ur53eFSs75qTPZ7
	mr8++syVn8YDMXEaj9qvb6eTrTPggX1zt+ydYbS3LnrPBBeHDkwP+zVLMeaGVa08
	iJVrp/e4yd9GVT72Qn+3Ti0tcSrGdYIQT/K21dzI1wN6STlYXwnJ3cVoomKvcEgn
	dUiEmN2/78jToOKc5H9QOENj3r1G/XM6N/+D0NdwR0YtvewQW2M+D86x4ZtZG+1o
	vfoYZaMt/qcPISEYIfZOyDYfWJ8sahNRxFIAyhZXzc9IXR5nH/godK4z4lEvPdZ7
	o2D5WSCleps26rJGzY29Erc42LGv6wkg6jnl1zQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:+MwcgLkC7ZegskLUFNXzG8pukmoQqzkXl6b+4LbSaQo=:Ah/G1+AN7g52aO9NxYRLithqtdh3YvfFYvLJ0xR6oWQ=;
X-ME-Sender: <xms:V5XTajeP4wPpvqi4JERv2uawLv8sWnkSAG-WZjgsYieCYVFJySNTRg>
    <xme:V5XTanKtHfsJ5_9kBEfv1xMYXorF66WwAw7EY13YTSZ5dauSA2GKhua91XoLL-9U3
    MpxLMYR4fPp7CHBuf6PuVUtGAha06mZ7TDLAp5BZVz-F2OtakgYDX4W>
X-ME-Received: <xmr:V5XTakHDVUBimXpZk9IttMcrmzl3daryG-T7-3aAZtYgyK9df92mTIgYtBRRfC4R8cf_g00xWYlRL_YS3Z4K-tRGMyVYaJVDa9MtiiOYjMLe>
X-ME-Proxy-Cause: dmFkZTED9k7UvT/3+6juuXbutc3O0Q656VKPv3OgC5UGhJWfFDMDuMEGBxNYTUnX+pww/7
    Uxxn+112LBEExoVRZW/WbfmAglkcrQO0U4v9ONV1HczgkjK9t021Z3Sg6oZab6p0odX7qb
    Pbz34Ss5y3klqz/9nuynknRt0eqwjPyve6jQ3/pp0uQXR4wLUEjgt1fuOktvvWlI+EocKM
    lBFx+0EqghK1RWT25Kcj4oJB4ADMR4240qPFCLeJBAAPi7bskxK4Pnq+1E1xVOqhkTYBlF
    jkq9r3AZ3AGRcuqzheX1R/guAgo0sPp8bE9XYH1y2mWCHsSO1iXF3UOHKbI3bbv8xcoRa/
    yR31wlu12TMzdgeCQJvpgOegar8qoA4/NL6Dqw/vgqSWnkXzhQaAoX5qj3lP1qXgRbUzo6
    a5aLjxN5Y4WPBK5cf6z2zAdnBbKM5ETC7SfAN96Wo6Ji55NV9KWrCRXm3jszv7CVBbmQF5
    TiSiHUnwYH8+ziD9Zsuv4v6H+6p9BZNuirAP1ydfaAkHHr1YQ67cK6EbPfgCy50RXkUuFE
    0RQ+ctBybqxTkZYFMTVuKmiFcDV1266i+a4Sfrh1AFsx4ghEQmoju91zuZ7cub8mHHqZ4V
    0yx448EWzo42MsM25/8iViiHTplLScbS2P/KCwDyyg5owu3jYyORLg06O9Wg
X-ME-Proxy: <xmx:V5XTahp0dG3FG_7cw7s_SnESdhB1lq3Qgx5Qxe4CIrahOwApwfIIfA>
    <xmx:V5XTatR9caruLgrts1OGtt1JO9mdpSGo7OWmC5Bbj4VPw_GRiKBj7A>
    <xmx:V5XTauMCoRKeYUKGjaJB1WDiLoI1xqdhG42PmhDNo1qnYrEW6BkgXQ>
    <xmx:V5XTagM16E7dg6Cp7sJojZzYiUrcid0BNdWqWHOcFb9kC_HL2dnmWg>
    <xmx:V5XTasyY356AbebA1bT6rEp5skof5JkMOlozrMcEa_oc_TqLjCYoH12h>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 11:33:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: core: remove unnecessary work cancellation
Date: Sun, 18 Oct 2026 00:33:37 +0900
Message-ID: <20261017153339.267337-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The error callback work is scheduled only after the transaction instance
has been removed from the pending list, making it pointless to cancel
the work by iterating over the list.

This series removes the unnecessary cancellation and uses the existing
helper function to schedule error callbacks.


Takashi Sakamoto (2):
  firewire: core: don't disable error work for transaction
  firewire: core: reuse helper function for scheduling error callbacks

 drivers/firewire/core-transaction.c | 30 +++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)


base-commit: 82d59eb7f5431771cfc6fb074b74f466cd4e3353
-- 
2.53.0

