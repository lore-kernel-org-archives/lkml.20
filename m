Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC34E56F7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412769; cv=none; b=HCBl5oQuAUZmwksst8clqx01HLhIcEJsVv5jpm/Zuu7IlLgqvpP/7/3GMdyuLIgyM2rNSLjUCngapV5xpyKiIK7MhDBxFYUFeT2kd5E7F6+U2VuKvQYsD+yD8DartdAkKssEsvHbhxMZezT+kb8yn6QnbZfnw4tHEP0sc/87Pxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412769; c=relaxed/simple;
	bh=zeLjrccV/Jb1VNCLNtzInCeWJ3yYsx7wmfkaw80F+ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEdifETGRVRlmEmebr2EW9SJzaVvgr1mFg6KteSg1qPSh94JK6wt5+gGODVyvuThtB6ZNp5azjUTOu9Z5yHD4Sj0vT+2VOoX4KbqsxEGSl3TQfYN1iTcKMIPZNB1PcWkbN8DMRzvspfonV8dXV0fiDS4/YUFsoOrS6+YcwAFSA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=FUyfNUaz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nFH3dorV; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="FUyfNUaz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nFH3dorV"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id B22801D0006E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:26:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 08:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792412761; x=
	1792499161; bh=y37IPqYp35cQYDyGdgEXOkGlXipadfKsVjSX44qfXXQ=; b=F
	UyfNUaz58Ets0FXhPKY9p7O81x0ajCAOhARKD4+zCAHKM49WQKOKRmXWyTQBbvQH
	Ix/r0uCba3CVu5p5c555v7TunZKselwQ6Ue8tz2HGi6Bh7pN9FzUgRJi0dlgMUX3
	t0KxSggCK9mLlStvikHXgxaL6h7iP0POUklciFnEgmsiPneBf8MB1lfaN3vx3Esf
	bhBRxS4+MTSiKo3T5ZlbK9EscPn2/IS9f/WpEpgMPgrgZGtKNsHB5u8jasG+Wt23
	rBTiCtXcxhPRwfpIHaVsitiUubhYnxy2mszACsVkB0eaHIY0Wp+X+avc0nxMJHRg
	lWKxRO24Otfa9kXYo0n7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792412761; x=1792499161; bh=y
	37IPqYp35cQYDyGdgEXOkGlXipadfKsVjSX44qfXXQ=; b=nFH3dorVn+Kr86x1o
	Lb37sI7ASuoAH+Orj/vAYULLLDgvstQrN+EotsaUAE3AE7tqfsObNNqmVzyRTEJ6
	Zs18NpzfjfqTGwnjPZG2B0ZrmBP2/skHlBg9v1AhukH+jaRjXxsCL4jePh+AsQIA
	WHnbUV8AkbTMh6PtRvu2cSdfTL+t7aFMmuMql+BnMO5VUtvOW7doF2FgmQUMQiVz
	Um6siLyXVDEZMA4k4/8+TheV4Hrv7SeRzQxkjKgTBVtrAxTO1f3nEgQ6a7FrYo3R
	ybu5GQoY9qNJNVV8dvAT7BfI3A98Mwk1P65yzIzvxYgr9uUvouwbUUTDNbP4k1Wq
	FPiEg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792412761; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:wbzrlPUrWwk3DMF0OWFTSZhGoFtlI134vIEUKEv5SbkOoX/
	tKna48vdAGEDoycXZKQ6vMUxno4n88j39n15Uk8709A/uljFuq/0ZgNbqnTujDY4
	U5uiOA8wIVhYnT+qq7m6x12X7Sq3f4QNBg2qBkmPeaZ8mIRHhV1LmkLeoDQS26Gp
	nfnEWLcPzQFa1ehofE+8iSO+ff9p0bp+RscT361XhVbO5jzlTq/kBPItxtIdxwJ4
	aFu+cmsw42uSisCmeOSaBKXWQSuwTxoLyie1oLdSlD/zksqNVFuVoYD9pkAtr9eX
	baN7wD1mQb7nEy9YLFbxGuK/7kMiG0vGO7UkU5g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8l4W7xXAUu3cVJokru0QGocOgTOi4N55OMZPZb73neg=:zeLjrccV/Jb1VNCLNtzInCeWJ3yYsx7wmfkaw80F+ik=;
X-ME-Sender: <xms:WQzWakeBp54alC-C-hHjASj58231mQvapUCG0dyP32-p6gh8v_z9cA>
    <xme:WQzWakIexvLb4Gaa4GmYcwj3a39fMA0KL8X6rm4oHle9jeN75Xn5Jjndr-lNSuwzE
    bGVCIbO2IDIIqf2s224xsAy7dbyM6WQADC6xthVxCRake5y99Vaca5H>
X-ME-Received: <xmr:WQzWatGrKGgZUt35gm508od25Uyll9BSlBPOwV0XwCa6yE3fP-fHZIMEt8kuunsAOSac5QAklSwO4QnoNnarNLaXGso2jelRlx2Q5lvbmMUqkg>
X-ME-Proxy-Cause: dmFkZTGIaJYW7c8nkscE/6yoBCDqt4FtIo2vXofxlF45kbLCxLiMGgj0y/rJqt5sNqNXkU
    diK3CiUA6CmEmaayux2SpOkdXTymB6cHtdVhrSShiYlWrPK4/igUSya3MkZXdeeKKtom1U
    0H1+CZinAW2WKXOMgK1GBMkZcCfSjfbZPbHaIFESGj8RkBzU5IEta7lcedm6RTXtXYwQWc
    5kiqEDbIj9wRiQkE4UtEVpP76V2vrLITNcFRUTe1bFiIAxAB72SVZLHKoeL4VngynAS23u
    VBTsasNhwHU5sDJ3Cgyd4jtMsnQeC2fxpSr7yGw2i1/NA5LSJ/duYKoDqfOdTQ+hWc4Rpe
    Ad4vlBeEo7u6UGcql8jgrULgMcdisCHCclZF3apZ3KTjlXmuoIbPhL4Joi4+mdXTRUsDGo
    ME40bVtbMiGJHHh+TbmzohE/5kHLL2domdstFT/mDzSdf08Xng2mr950JA2CPKly1NTQk+
    A6CqELCay4kXp6IxafTIM2nQ1+Iswpyi5xugOdH8CmAwgKtnX6CrEmmUlexlp/l2m+5s4k
    +yWpBH1ACzY+6Prm6wCoyLz2OPsG1Q5ZppbgxzMJ/eHGuZpBAk/+EIPXC+qp6aMEyZFeIp
    WrLM7uE1ui17r3lGODdHVzPLTgMNjxApJHWgTLLT/tmZqOVMS+nMScsjObNA
X-ME-Proxy: <xmx:WQzWamrZ8iOhKZJWQU6zALBawyH5GRDUEtYWjowhQmRlyZUcT_uajg>
    <xmx:WQzWauSACLPJrc6k3tF-vidtvgIjH6ZOY5MU4o-9a2xS9_CofPKXAQ>
    <xmx:WQzWarOwbRo5Ogqadvgppy9phsppfGonVt0lWtrl1RXFthMUufhrcA>
    <xmx:WQzWapMW9yDvcVbYrJ2D4MCo6BD17ipB6SWaS42vOToSagEToHWxdg>
    <xmx:WQzWalzHwFSM7XWy9RZBLaG8e81oFFdKHx2pRLkOfbJuD8H_luLn_WKE>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 08:26:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: core: adjust context_unsafe() usage for lockdep checks
Date: Mon, 19 Oct 2026 21:25:54 +0900
Message-ID: <20261019122555.328060-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019122555.328060-1-o-takashi@sakamocchi.jp>
References: <20261019122555.328060-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

schedule_error_callback() requires a lock to be held by the caller.
However, __fw_send_request() calls the function without holding any lock
when retrieving the transaction label fails, as no lock is needed in
this case. context_safe() is used to suppress the precondition check in
compiler-based context analysis, but it does not affect lockdep checks.
As a result, lockdep reports a violation of the precondition.

Acquire the lock before calling the function instead of using
context_unsafe().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index e24fb6b97770..0ebe70a4d440 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -438,7 +438,8 @@ __must_not_hold(&card->transactions.lock)
 		tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
 
 		t->packet.timestamp = tstamp;
-		context_unsafe(schedule_error_callback(card, t, RCODE_SEND_ERROR, tstamp));
+		scoped_guard(spinlock_irqsave, &card->transactions.lock)
+			schedule_error_callback(card, t, RCODE_SEND_ERROR, tstamp);
 
 		return;
 	}
-- 
2.53.0

