Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006B3E2771
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700321; cv=none; b=YfHiWrg5vWOHoPRRHHBv6ClDvDKzkIs/cu6rfzLeMIK6nCuKmNUmHEvmgZu0RIgbJRew9Wh2m2DUogS5eJZTZWDrWex/1eoWobKZJ8fI6ItVNO0atv5W2YtnqiSL1+4p7k6ND30E4RIjTjvQAIh85JamULKZBaZ8L38va2MMap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700321; c=relaxed/simple;
	bh=T8X7kqySyCiWp5Rsejn02dZN45r2oU2T81vjDxH59ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5L2x6mSaNELa0DnaYR6PbbEZERZvmE1LrAf2rBEPyRMq777sdM60xIJlYrDcrOuN9eAUar335gxg0SUyOp36qBDDzRME8he08KDUUtIL41xDE/Y3LxZfcs8ygeyt6GHoo1B7ZaRktJCW4h7QZiJkUCdWnCaco9li47P6kkgF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=p5JH3RRm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fWTapTvI; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="p5JH3RRm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fWTapTvI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 74C15EC030C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Oct 2026 02:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700317; x=
	1791786717; bh=TuqA9hCu2f1Rvno7hKFMgwSWSw+DbZw81/MyGvfB1ko=; b=p
	5JH3RRmvxSZajvcH3x3NK0lOaf0TA/GG7kRas3yGrnMrlIffSIom6e3K8C/q7IEE
	f3ZyssnvwiI8dfPAqGY/AsQkJdJb8ghpw9u/XpWem9WxfALV7O9LJ0hxfKooWvO2
	y6qvLA108mci/rocsBPUWcfcAQ9HyFRjgmaekGaRewTSeWLvydW44xGBNHJkzRVM
	i8bDtfNXElQlsFI4QIRmIn9EKQz3d26BnN5Kv22QOgWlVxnCfRdFKmwTe5MJxKMZ
	6Im9vnJIJswCfAJ7RNVb3qxXqiqgGQNuY1XP8OTP2Y9+q2100n0KxrQP2YdDPJTv
	F3LVNupr1Z528YSbmD0OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700317; x=1791786717; bh=T
	uqA9hCu2f1Rvno7hKFMgwSWSw+DbZw81/MyGvfB1ko=; b=fWTapTvIFhMqtyb7r
	/EljBNPq2Q7uTpbkGL1mfH9itFSxpC87fa2MG+roPJw1QXdYB2ecfIkIslpaCiIx
	GRVVbFdGrMm4HNjxW0RZ8T8TdOONlamI+wlFlrTD5olMxxe2/HMdvkD86di4TG71
	V/l/bXKtKxZibTWHc5yQsMt2ylXo4eHMadjWCM2pXTHEnJW9ClNsCQNInSiFURxT
	sxA2QlXY0lomgTSsRUsXRtYCwYdk+unoJhb7nO3JZJhHraa0U6dIiFGyvu4s78t9
	PovVmmv+ekJNW4lrkLkdUU4Yr10X47vEyYOOCOM5aIk+hryLYfu4BZpr6iUfQwjc
	L0jfw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700317; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BYy3UvR/GqUIkrVnuQCqrPhIBdoP1XXwHFqj89DaQ4V5E1r
	Uw4oeHi8eSd+bAhDr/7fX5N/FasTwWham19/2myPLISGSq3exYLWA/H6ngX0EPMR
	Tij8bNoSC1SEbm/CVeQ9Sk8Tk9rdTMjWU0nadgpWQXy3US7NzPZYXkLI4N5gs+P2
	uyn31jfHcOwwWb3P942dncEFlyeeQwqU8iKZKldSQW7/3p6T54D1xEtp2wv9LQ46
	epIPYiuy7Yv/0ilvzVq5v/CmeBqPe5+P8WiXhLCvaL3WkMXtnUQxNpMNcdPCw3KO
	qeoPhMHOqAgwp80NsUYwqERbJdhfOMsaUL9KLsg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tgC3xu3TZxJ4SaFW1oqhSuhc5GcptDsr3UReDBz0h7A=:T8X7kqySyCiWp5Rsejn02dZN45r2oU2T81vjDxH59ZE=;
X-ME-Sender: <xms:XS3LamJnvJ9oZ45HG85u0t-_eEEuk_J746DmnSstQpdDfZezllQfDQ>
    <xme:XS3LasFZTLo3u3wzEZK2eM7oWYsqd-YLgnEAEIlSm1mhRJXXC7sRGrQBq_S558MT_
    f04M03V2g0d_kRVWGNoKjM_hunDDA6Nk4bBTYvn9flneHXuPGAkMkMx>
X-ME-Received: <xmr:XS3LauQa2PCXTqUOAIE5__v34CpsV8Gzfcr7PFG-V7fJpU2D58GFTx9TabPx3giPAVJY34xAEc_iraaqHto80NzYsc-bVlXDrNvFtGd7ih7zFRA>
X-ME-Proxy-Cause: dmFkZTGFMHSMzAUivcUy4fbe2Q1/J8RwZtypx/fn1StR7kXJ5kx7Wp2GifOx/SOUvOWIKN
    ydHQ/VrntCl46hc2VcRw7dsxMJ5Hs87BOHA75BImzZb7HJyPrQ9F9MZyekRX+TTUHf5cze
    uLj4K8sP0ByLsenXMbTc338AfPRc5kAWJmFGrM36/EXYbyVFGmjfzXe9ohhe2/buAD+OFt
    sqgiJZNYqIKkKoDF2pWliTKiO1gjZezUPAR7tIKXrWTcZMe7chmHmjzbYvl/6a5rzAsr6Z
    aLTnvwLceofpVovWbDzfGtdx5r2pvMIE1bHB13eUZQaELtcrCELwpV5M/uEDb299PA1Gb0
    BDfWy6XF4yFPa9ojh3E+UwRZDFQCNalCxIh54euoU57ZbMkQ8EM0dl8PFlHOHEzypXk67F
    xSv0Bm52vsN3NonGwvAB848dSswJc/4PaHwPimW4Py8JFD6sps/gfx4UygZ1mn+M1SnGz/
    IavcaEC7lN5gy/4elC4IKJ2paIYPh+I/yvU5FU70TQ2P/kTqtjt0jT8FFHQYRNWKtWFuVM
    JZ6cD/XRa6sIDEwkpRS9ir1sEsx9KjX8RcrgnqaA1LH9AgJ1RcNgYrcGRlpv0ZoD6J6Kx8
    KyxNbZ1bU3dTLLCL72spTl8PMaewvI1B55xrmM/QEJrTzyXgb/wl54pgonkw
X-ME-Proxy: <xmx:XS3LaoE29NNu0uuDon66vtp8CTNEhnP7bLI1j2moSe-TBmvZvVQq1g>
    <xmx:XS3Laq_Nc6ClMsF8gXFWi-_rRLYRrcIYVQroLwnEbsjU1flW-jtzqQ>
    <xmx:XS3LaiLFP216UKtdIRrZ9cUZlUsPvs2NJMbq_tgbYC1p31dTFdkgww>
    <xmx:XS3LataDGTu2CrSC4K73PDoAmyXBFUT4VMKQ6ejutdeTdL_trE68fA>
    <xmx:XS3Lao9oujiV_UiawMswBbs0pI_2yWYaKCjGVhU84fmQpI7SYHqMtSgV>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] firewire: core: narrow the card lock scope when accessing node_id
Date: Sun, 11 Oct 2026 15:31:46 +0900
Message-ID: <20261011063146.497455-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
References: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When preparing the request subaction for an asynchronous transaction,
the node_id field in the fw_card structure is accessed under the
card-level spinlock. However, the lock is held across a call to a helper
function, unnecessarily extending the critical section.

Narrow the critical section to cover only the access to node_id.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index ec04bd82831c..b55bcfaca54a 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -453,13 +453,15 @@ __must_not_hold(&card->transactions.lock)
 	timer_setup(&t->split_timeout_timer, split_transaction_timeout_callback, 0);
 	t->packet.callback = transmit_complete_callback;
 
+	// The node_id field of fw_card can be updated when handling SelfIDComplete.
+	int node_id;
+
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
 	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->lock) {
-		// The node_id field of fw_card can be updated when handling SelfIDComplete.
-		fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, card->node_id,
-				generation, speed, offset, payload, length);
-	}
+	scoped_guard(spinlock_irqsave, &card->lock)
+		node_id = card->node_id;
+	fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, node_id, generation, speed,
+			offset, payload, length);
 
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
 	// local destination never runs in any type of IRQ context.
-- 
2.53.0

