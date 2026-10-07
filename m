Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1918A3E40FF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365583; cv=none; b=cddkrh815jFkIIcDqELa2gaBoitfmyfG1bRu154QSLSNZD00BYARfJdQgWwvWIf11i0usnv/H1K+peLjfRqIMPbBfBVgCeCAK//dHVed/1r0SH7m682T2SBQYqVkmt2TUY9ncB4OJIplr3yGDBh/eJINqvNMJB2PdD56krZXaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365583; c=relaxed/simple;
	bh=bVSu5TJg5ke2ORKx+3gsCbfz+i6zVy15xDiA7ttnD5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRf3EuXK4Ks4Bxz5JAdbAqGXn0AzHf0NOj7fEIhXx35UV7K+h2tssXd18XAsUXDBMxwrZGO0ZP4UDmLvgudA+w4gLcE1FcqtLyZk6EvJlwYVEWes7ZPBTBklyyuPXxPCg3Kgu9mVfSYpEVsGlCjDPujSov3yxtteo2mDD+3rYhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=jX2d23Zq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hF0PWrKS; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="jX2d23Zq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hF0PWrKS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1C3147A01EC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 07 Oct 2026 05:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791365566; x=
	1791451966; bh=zE9CTsG5DarEcv/HL1DMtU/L7Rr7HRBBOHuF64cCkB4=; b=j
	X2d23Zq/gbttQYg9O3fIVwQjK71nIFwxalb7OVMwcEXua8SBssyJsOKhheMyv3FQ
	6Xz44pAVilM4VS0q+TX8pYQ01EKKZpNegoAjMRyMjK2SlrCcTTKPPg8VDQ0xmaqc
	NzQlPJvb7PHoU+8mO5QaEM8YDTWfYV3DRtI0+kQ3Ldl0FyGtTT+Bib/yESX9cPUs
	9tkEe4/iQxDyHAgz3jdRbpjiDcrADnBDcq/7YI9OYHXzTN2aHtXCOxz/39V/gnCk
	oOlTjAxybImeB/nDfE359Nq/iBPOak+vf2VvAjMaaVoRihUiE1/uLcOIeCQjsAOG
	hNoeQUO5CuwbTsQZyrKpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791365566; x=1791451966; bh=z
	E9CTsG5DarEcv/HL1DMtU/L7Rr7HRBBOHuF64cCkB4=; b=hF0PWrKSnN4yXZpl3
	0AS+hb8aIiwit6tOaN/phD8pD7+SBY2QHxG+cN2ZmHSxbRvzWvy/LFKvDHKiqYGy
	TnnFqEAEpEJaQ8LE/Z6VwvpWIbgaJ83IfjCBwLoyABTrCwsKuYAZLXCzn2HFlozr
	+7GgOdOgMdvTYZDaxVPLTw3EEUZ8y79ZF1oFvxdrbfec9dYlqBQ2WycX3z+RM8Jy
	7mJSm6hbrbeEIZvW/4S3Eu88G/tT5teneg0CDv4QodHcibP+ZFHJX4P0TOgcYepf
	kfSynh9UTzpi4FASwD113LFfSob39sxWtUxydyS0XJ3N+97e6NLAtPp6r+JevXDY
	+zNuQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365566; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:pD8cdeF/p2kyiQ5ivbLu/fm9iVFGU355gwUWsbN8siPg/u3
	ADsfU0DMbtjEjl5rsQ3I4Eax4Pxn/kGUjqEisuMxhe4kH1lCpevfAgmO//t/xHE9
	4qbTGi0uSBgD4sL+qHPQzsZhWN6Goe9nVtyKQwQIQ6KYXonV7tEKSvTZp3JqW5ls
	VgyE2Laq9qGj47RGBfGNmdq8rQTnPErTdvkhrQ8p5FNGEa+meHYHBsaiwFMDF3H+
	5zLmBplAo6BqPrOtcq04+9t+25YGzxS0eVfnDkoSAi6TEfn2UwFZBFKNaS+Usvnj
	mNDGScY9HPicdwb7Tk+3KkXe7Z3KWa5aiTxuEOA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:38ZDIpn2DmGEE5QZ9gNke13+f+e9LOLNRMSyMztStyk=:bVSu5TJg5ke2ORKx+3gsCbfz+i6zVy15xDiA7ttnD5g=;
X-ME-Sender: <xms:vhHGaiRizCYWDicARkt-RwglUQCIlKXRM6aD8e_LjJa5nNR-OEnWkw>
    <xme:vhHGaltqPP6fxs2rTl9ee_poqd8UOElmPpx06auimx-eTTBy0m4E5HT4zHzZkMDSH
    mpmIqdDhmULtWMJYWuokLBVYCk-TZM5g5yBO4IDPIUEaMB9Uvd5cUar>
X-ME-Received: <xmr:vhHGanaI8WYHfoEXZbPl30SbUx9P-m263Uu8a9DTJDvURyfrvM_FuLc3QcJzpHkYShYgDOH-jsDZfgLQ7KYhR5FX5erQfMWo4yfHsQo-HlW_AA>
X-ME-Proxy-Cause: dmFkZTGcZk5UZhE3hGZPA7OmThxBOMabMoTeTRs7uMWhJ/AlLirFpVeSE0QEDfoedniWIU
    ZC3DGn18HpH8zVVM9zuWqf1/mPFrJw2iy+AvZvu5gmVbbymyM5m1Wq3Wv9xFLWPLH7IbOs
    Nh6KFHEDLJyjlWCpRHuzCD1uTKb13DwmAyHJfx98dR3KDEwcu44eFMsfwTkQ3ma6OCGZsh
    QktnbdkGnSQ9iEYJLBJscA9evP3JNnWTpMdAfXnr6kjTSGMVkwnJhk3N3oGyRvdmd/+hSW
    12fuie37IKYKeoIXLNOHtjEypnVUmkYCPw6+cABH8bp5p8NdiJuBV2pjanIu2YdWgaaoCb
    wSHHh7NAnb6PqeJl4P73ez/w0SOAZB2ScCqKHxCcQnutMqUuQ5j/RoZqmLlezll4S3BJ/H
    XxJrvuwo4XZ8cFCDeX0KUB+e5c4jXX+wmvhZV1BalxAGOARZVtkLGpBCgIA0IfCvCmdE33
    lN/e/JvIEnCBDPG4dQN0fTVHnFt7ymJyIpoo/+4EZ1hHb9HC5kUgjDovV6EYqXc8Qy6WW5
    R6z7xk4+2YJtq44cajiguQnnDPOtsWNOZDVgQq9eu7Pls9pxcfRe+DPl9Zh5LbCfxjB949
    F+aONxTEQyim4PGgUR5awfMWh7wZAFyG73tEWc2imjK1U6s8y2cSTdL/yDuA
X-ME-Proxy: <xmx:vhHGaqsJ0ZMcucE2-lV_2szgxtYbnLBQhLzHmxbv1QL64s4JTPJe3Q>
    <xmx:vhHGapFy6c0G58BUQ08MPE-qFfZ-AAQOCyRTSlm4hIZc41c2rcipbA>
    <xmx:vhHGalwF0nYubBeK7nIeOofBDHrdg15IFCFryjthBitg4PTg3Qo3fQ>
    <xmx:vhHGaoj4ijUwluHtxjvEFnAyhUDdsKdJW83L_deJ-0eVrSAAy8aWNw>
    <xmx:vhHGauFOoL0yHfAY6Mj1aS0PuMX8w7cR7jrfFPyx-wKaPNfKernBi5Co>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] firewire: core: schedule callback when cancelling pending transactions
Date: Wed,  7 Oct 2026 18:32:34 +0900
Message-ID: <20261007093235.175742-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
References: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation invokes the transaction callback in the
context where transaction cancellation is requested. This is
inconvenient because the context can affect the transaction callback.

Invoke the transaction callback from a workqueue instead. Use the
workqueue for error handling.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index cfd7d682c595..05c54887b4a9 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -106,8 +106,6 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 int fw_cancel_transaction(struct fw_card *card,
 			  struct fw_transaction *transaction)
 {
-	u32 tstamp;
-
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
@@ -127,9 +125,10 @@ int fw_cancel_transaction(struct fw_card *card,
 
 	// Timestamping on behalf of hardware.
 	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
-	tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+	transaction->response_timestamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+	transaction->rcode = RCODE_CANCELLED;
 
-	invoke_callback(transaction, RCODE_CANCELLED, tstamp, NULL, 0);
+	enable_and_queue_work(card->async_wq, &transaction->error_work);
 
 	return 0;
 }
-- 
2.53.0

