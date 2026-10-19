Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560537F728
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412773; cv=none; b=Le5d8iMdqM1vaNKktebd68GE4pGx7V5r19K/9n/BENlN/oNQlhyE/49cl6qFCb3/GiHi+ABfLz6o9VID5Jv9B6Bbz1Wsyo0kc/tic7PfLguWiBxQwfS27c8pMCSw66/ABVBZNAKotkoLH4U05DYuFs1P6RcALNxIq4054d9ZmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412773; c=relaxed/simple;
	bh=JTv4vmVwf3YI0G6LZiFuWJKjJ9bsumh3Na6XWqourl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=St5HP7JjZM9GejIHEYZrPzvMUrfijx3akbVD3ae3QzY9U2CYee2XSd3EQmLWve4XKRhToBL0ul7T61ksYch5NlQ1zKozX3t3xURWUzcJFF3af2opL2tWNTL7vJfKdMROuYjGVH9RYMaXp7zHsuzG/i4nzl4wa5QbC65b0sljznU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=UsR11Dxf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a+gASbu7; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="UsR11Dxf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a+gASbu7"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 500F91D0008A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:26:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Oct 2026 08:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792412762; x=
	1792499162; bh=7m4FryPsrzDHsgj6RFyxTUshrLgd7or7psYPszwlyNU=; b=U
	sR11DxfUfHq5HqLe5Q0SaAcMW79drY6j66XBpcyY79rzY7lauuI7kEcV2mPw5ZzW
	StJDqkZVY8jn1TjrrSEKOH9ZfaKbvoO45CocpLDhwevwMF1Oz2w0mqbDkh5jKjZ5
	zoKaNRSnF0Tc2UfpAiodso2515TtPdUyM4pb/COo7rOEHpAYYGVT+9yJFnCW7YrF
	Kkekl6SNxcceJlzu+22JOJ0FMkkW5cXpL7sDZTE9VJ9Nato9Gs3k+5kA7QVujyi6
	y9J6F2HIOmJ6SCbi8KTgmiKtDl7I0y2K1UsJ008N70eH83eS0VxO+e466QhvCs7R
	HXTCUlk8G6bHNFFBpbVog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792412762; x=1792499162; bh=7
	m4FryPsrzDHsgj6RFyxTUshrLgd7or7psYPszwlyNU=; b=a+gASbu7w8hy8P63L
	6uCbGly8JO0UeWGvMPoGbTGo71Pu2jjXApxZ27ZvPgVl5CRmbWuWOVh0w8HpPWro
	werbYEtayXOnJqWlUOrB+tPWY+swOHNkrzcZE4qhYgujwFaNIXPeKZPg36vple/o
	wlFWEnvNDxamPZUcn1KeGSJamJlIGHWoPqsn0M3X0O1XvJrDkNwCKiy7BK1MWzoV
	aQvcTBwl9n8OMM67mYg2tIky5TzvGGusHXSo6poo9c+hBnt2DxLHd8FNm11e0F2w
	5An7RRP8VMWmxts/pbCvmW+biTreqvupxtqeWkGlU8z4YuqpFXKGPzrvapH8LFBh
	a1WJw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792412762; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:gn7tK82JRYkHkJKmPsI5agJ5mNU4tpw67FlCigxRSOb2tP2
	oO9jNclXv29SwU2X2HIvO5UBCccX9ww1j85XG3SIDgPyXqVdz11wOAdmyIf3PBJg
	B5zWwTt62jTu3vwHIqsUOyL2hs7T5s0gtXg0v7c+3Y/RD/iRv+Oh6LMTz9afAKEm
	fqWE6ZnN8Gw1vXpKptqKQGiYrQV/SEL9/rIkLywoLOgNLiDHOSLPcOHRM3/pzntU
	4XmCE0LH+B0DZCt05jcIY3qFdTj0eC3Ra0lDP8dvAvwUxE6G0x99ipL76AoV/nu6
	3vV55XXeUckVqVIBP2irzqKmkai+UQXqGUp6Hhg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:l7gE/+TtGbIoz8jnpexdcZWF6sPzecoW4T/MJOoSVJc=:JTv4vmVwf3YI0G6LZiFuWJKjJ9bsumh3Na6XWqourl8=;
X-ME-Sender: <xms:WgzWauAVbwKT0t19jGiDbtbKkyJUun4399Yrr3naKn7-02tJM0C1BA>
    <xme:WgzWamfZTWknvgtk8BT7fQ20uAr99h2aS24DQsjnxv8pbdUmADj4uEhS1_9yVjMHp
    Z4HaMsUg2zUfJoZThNK7X81a76u_KE2fG9Ip7P5rd8y_wWlTTNLwj5t>
X-ME-Received: <xmr:WgzWapKYMm6rRNwz1PxGdT2jpw2O75I6mL3egjKstjoBNnXelPgk4rOhMVhG4tX7-XIF3NI82tPzoAubdq7Ea6wt_XmqQAuS-46cPybEbj-ekA>
X-ME-Proxy-Cause: dmFkZTGIaJYW7c8nkscE/6yoBCDqt4FtIo2vXofxlF45kbLCxLiMGgj0y/rJqt5sNqNXkU
    diK3CiUA6CmEmaayux2SpOkdXTymB6cHtdVhrSShiYlWrPK4/igUSya3MkZXdeeKKtom1U
    0H1+CZinAW2WKXOMgK1GBMkZcCfSjfbZPbHaIFESGj8RkBzU5IEta7lcedm6RTXtXYwQWc
    5kiqEDbIj9wRiQkE4UtEVpP76V2vrLITNcFRUTe1bFiIAxAB72SVZLHKoeL4VngynAS23u
    VBTsasNhwHU5sDJ3Cgyd4jtMsnQeC2fxpSr7yGw2i1/NA5LSJ/duYKoDqfOdTQ+hWc4RfY
    DXJldcuSgzMh7tPdMGs/jiD7QjKSWRrGDo5iO9rgmFrTEY+TCX2EopJqDO1MbG/Z/y6O9g
    A2rFpgzntXVGUAvBzX8ltJZ0oi3/wt0VTihnCKfyL5o6Q5rfQ2/o0oHn7WqgDQylLu2cl6
    I/twggnB1t6nr8nbF7UhmpqC6bTcJAR0T0KNqI3IdlaLzl/th4LJAZc0oQvA1r8mRh3OTG
    pSemo7LFxwBVLFZ8GtdM3LnUc8HG1xfFYPsUpsOeLtwFN/2ZjCZOdrCXI00YREiRorHcoi
    +4iLX8qG66SYcUeNEOqQ74uUfaP4NgwbtW6r1ZpPwwVVLg3Nol1sLXUx/N/w
X-ME-Proxy: <xmx:WgzWapcNzkCU6DN2XB9ElbhiTNhq-Mj6mzndiADRc1YwbxgAZTmLtw>
    <xmx:WgzWag0mugwX7fMg1gPKVGNdmixrAgj42_HV-EVM1_Nfss9YUBmJvw>
    <xmx:WgzWaijZP7U72cfjm2qb93b2YhNSaKGKzSpzAAgtO6Esu7FdrCMPTQ>
    <xmx:WgzWamRup56rsurZaEtklD92lGlM77GdobO0ZyPJ1BehL947XQw79w>
    <xmx:WgzWan3lzX1z-9p_FXxjmu0BJxoPxSffYtkTw7x_87I9gfKB8wJr0cvG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 08:26:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: core: replace drain_workqueue() with flush_workqueue()
Date: Mon, 19 Oct 2026 21:25:55 +0900
Message-ID: <20261019122555.328060-3-o-takashi@sakamocchi.jp>
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

drain_workqueue() allows only chained work to be queued while draining.
This is inconvenient because work can be queued from contexts other than
work items already executing on the workqueue.

Use flush_workqueue() instead to allow work to be queued from any
context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index b4d40dc7720f..b35e8901cc4b 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -841,8 +841,8 @@ void fw_core_remove_card(struct fw_card *card)
 	// Ensure the entire contents of the driver are visible to other CPUs.
 	smp_store_release(&card->driver, &closer.driver);
 
-	drain_workqueue(card->isoc_wq);
-	drain_workqueue(card->async_wq);
+	flush_workqueue(card->isoc_wq);
+	flush_workqueue(card->async_wq);
 	card->driver->disable(card);
 
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
-- 
2.53.0

