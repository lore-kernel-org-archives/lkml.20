Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB13BB115
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305066; cv=none; b=ZogEgmCY6N/wePBfRwcz8fgL0CXle8y3lP7XYzJXoUgG1ArLuP1zPB7NcUb6MPG2KA4ivvektMbSLULDnNRwW4LiJjp9tCNYX29Q3TmpFesaRhlP973nZ+3DbVEvI60ncOES/FSwSpb/w5DqvKUxKjJ7yJ15PxlYkR6aVorId40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305066; c=relaxed/simple;
	bh=L8eVSAOLEfbkYfzN/MbFbcw8l/TW5VdgDcUQL5h5hQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeycpMPZjRg8V9NA3x/ENxkfsU9FlQvVo9IEGsDIgmR4elsE7iHyP7jXQd2vEhNZ+NiVnA9GxFj+aerRFuayEFIpWq9/HjLEnkSfvVAAfQ+gTCswO2FNQjAYsf8xMTlclW2DGxpn53HG43Fx8W3M8RDTivV/p9cSzvW3oQtd5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LS6he/HW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qi3q0GUE; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LS6he/HW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qi3q0GUE"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id E82401D000EC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:31:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 18 Oct 2026 02:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792305063; x=
	1792391463; bh=6vSkvhn/aDU03wMamXx15mFIeTv2UoU3aIJvQYVQmCg=; b=L
	S6he/HWLm1MjYp2K4vD4MZEJF0FsnwsRfaYC5eRDz+4AtkOb3XToZNsgeOxBSn2g
	wjk024OGygwPkdDAAfWyraLwUAvrM5xpFxR6FuQJLu8oZ/gdADN3uGUXcopzW58u
	XNu+wSU8QYht920lF661cu8PXZptokmYNa/1OBEzEd7MMxh8aBVW7Khir2g3F96r
	q5reh0wJKjr9y/S7CcifVLTBN9diWLesu2bVmsW3ALNS9YHrHNwyWwbAEIjeOLE5
	QTPL6z1FypeXUiCekawuvwqKvjudNRhQXnu7mO5EkFgfxss3Bq+2tzmGv/5xB/6A
	mox2jn5q0lMoJpACZOkRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792305063; x=1792391463; bh=6
	vSkvhn/aDU03wMamXx15mFIeTv2UoU3aIJvQYVQmCg=; b=Qi3q0GUEVQrGEgQzo
	gfqzbYxSCAKd5B82NLE2oTlF6n625DcpI/rDIuFOtLh7T6n8CuQrrfJ+aBDjSNxP
	bkLeW9vVLIebp/L4LQsepkMfCyOVFE8Buz6MdMYuNQC8XAZ5UHIRZVRj7PZgMZUo
	9v+mafmnwCY3vRfE/Ut4r+rlHrzedNb50gWH8q7pdo2R6xGuAD3XsCQYghqanxz0
	0pDdl+031QmUD737QjuUD1tzdqvCSkFw3vbDfdiPC3TY9GofqDqYolZXwkEYjC/E
	c8CvX1RSHyZniZYOdi7KYVI9iqk2zhRrlBbSVKip3bxob8l1JTm5qowJmcpXJr0H
	KrXJQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792305063; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:sq4RM+1EJVPKjpic7athGbDXmOWOeMG5SFDbaZsbUm3qBmg
	/qdQedAGu9DY6OkckG/p8C6sjze4q+Oz2ltjIGyDqYtjtLql9BtZLpEtWQLZJwBE
	k6F9q28B7EM1lTF8G95h0qVlNsHVv0Ysph9tomZo5O5zp7AlzQptfQC+yTeGZQ2h
	dYBbHqVcqz79eqMk/6XqJpjD+131/gCKoj+nSp4qVjC37xXzI1PiFxxq/DTFM7tu
	iDdVeoP4XhLApr2yv9IDo5lV5QoOiIACJFmb9t37X+KOFW2iYOjSuavdMd0UCKXw
	AA3sVZBssp11beE69DFIxiBEYoUlJmOq+9+pabQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BUg1hsgPT/aPBgN47govM1/4kMscH45nMHsoR57Q6YM=:L8eVSAOLEfbkYfzN/MbFbcw8l/TW5VdgDcUQL5h5hQY=;
X-ME-Sender: <xms:p2fUam8sjKLB143DJ31BA27HDrxjBA9A5lt8Yp5b2YIo4Dr1dvvyKA>
    <xme:p2fUakruyIWYLyeO92yFW18PrU0jm3TZwUpXGxe6AY2DTIOJyvAsO5BBVXEh_jMbt
    amGEjGC7RgCp1X3LJj5_y9EY6k1ZGu_2VV7RfJ3_s5PRCb7CG2sF4xN>
X-ME-Received: <xmr:p2fUajlvoj7T3X5ZwvCI11ZnPOTs9Nd7mlP2oW9XOZsnDI_JPEA6jitABAelgqHFbzDBcA2b-oBBqlMEtteqP6uk79Jxwk6-nk4LFRjI88yN>
X-ME-Proxy-Cause: dmFkZTGtx91XyfsD+m/0kuClog5SfD4cYmMeAEQUA8jlo8CHfckL1LoLTMaKN+T3qgmzJa
    tiZQ9fIF8bzzQqOPNxMsNQYGDc0jOgHmL25s8fTkrIYQfJ/toZ0AQSAo7HoNVmC2jRpfg8
    /bXQpzQa1z1L3pVIcHAI9VqV0yDAQ4wHrqtjdQnqQrWz7gcAJyFx4pKGWxGSaZRa1T97VQ
    JTdzn87nd/llK6OSm7jpGPg/jlm/ZEU+KColtSkSfvMLBd0r3HrJnCfotOjocJA2kt8Brn
    DLdQMEwVSF05T0dezdalqitZ7H0Nk9EPV/l32CR12qtDbhRIX7Jc0ygfTG2U+cTyNqaFeT
    UwvTYMIdbQz7JcUMAxsp8f3kWdvGrC5yvrVIkAwW2eaDj+Vb/4lNoPZ+OZQwDY0IzcWJ+x
    alxq2rBAmbWiP+nVLeasF6tCNgXJGsc+UfIRVfUpNSjrt7bYnVNy+qW/SJc1CpT8a78Yj+
    DfkBo3w4MMbht6mKlV8Ldsnsw5jUY0Z5Jt+4/YG7F+tG0z3RPZlQNbQkN5anNYNrnlLU0S
    Jj9zcInKsy/so0eElWHs1CwJkW8HjH2qgTKSaBY4Orlmo2GTAEW1HmWb1Og9Hs++TyXSii
    cpslHo/1zgqvlVXtBaE8yY9a79egsPE371ViDsMD3n+wOIv/v/HWyMzEpLnw
X-ME-Proxy: <xmx:p2fUarJ8Oi-XK-_cARDCL8IS8aJjhh9yi47k9vwAKqrzuZLGnasuvA>
    <xmx:p2fUaoy2m9NGb0BskOX6WhVCsgaGvXCxzKFNfoj9BRwaeBxcBcyyUQ>
    <xmx:p2fUajt5MGI80PFhG31Fu8_nDBIjkKT1IGsdPoJVfem9QEyaScZzHQ>
    <xmx:p2fUanuocHwG0dhZUKJ84jX5ELUbX_QmHc9cSBVR1qgW2v74OqaYlw>
    <xmx:p2fUasR5e3Wj3wHJYZAViRKIfP6i23bzblAGj8gDHoXsf0iODpaHD8qV>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 02:31:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firewire: core: check precondition when scheduling error callbacks
Date: Sun, 18 Oct 2026 15:30:55 +0900
Message-ID: <20261018063056.329226-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
References: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation requires that the transaction not be on the
pending list before its error callback is scheduled. A WARN_ON() in the
callback function detects violations of this precondition, but the check
belongs in the scheduling helper.

Move the WARN_ON() to schedule_error_callback().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 31cc440d4218..33f3f272e99b 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -84,8 +84,14 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 	__t;								\
 })
 
+// Ensure that the transaction is not on the pending list when scheduling this work. Cancelling
+// the work after scheduling makes no sense, as the initiator must be notified of the transaction
+// result.
 static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 response_timestamp)
 {
+	// To detect programming mistakes.
+	WARN_ON(!list_empty(&t->link));
+
 	t->rcode = rcode;
 	t->response_timestamp = response_timestamp;
 
@@ -153,16 +159,10 @@ __must_not_hold(&card->transactions.lock)
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
 
-// Ensure that the transaction is not on the pending list when scheduling this work. Cancelling
-// the work after scheduling makes no sense, as the initiator must be notified of the transaction
-// result.
 static void error_callback_work(struct work_struct *work)
 {
 	struct fw_transaction *t = from_work(t, work, error_work);
 
-	// To detect programming mistakes.
-	WARN_ON(!list_empty(&t->link));
-
 	invoke_callback(t, t->rcode, t->response_timestamp, NULL, 0);
 }
 
-- 
2.53.0

