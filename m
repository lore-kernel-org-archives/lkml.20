Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4047D460
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818631; cv=none; b=sL0GdtUfAOyxIoeqxyoeJtinsF/MFP8l6MVlrUtU5gSCKCVxCqYFbFaQOHj2AFAba5orJY14D215rFwUrtUyTZVHj0tFPbFqjhy4sN/Ew8exPMJJ9DS1wML/z+i4Vj/HoYOLswhTbmEh148Y5R2zS1QDUpGXuDx/889dc+jP4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818631; c=relaxed/simple;
	bh=3sU7FHne6Ujbz24+0q3MMiyp++APGuJer5ZTELgQGzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXWaqAogXjrvUO07pIdtOzXvK9QnVd3v/fZDSjwUQatgRSjbOebv4SoZ5b2VsC3AA/tULfU0q60WQDsKfapKndNUHuMS+F1jfe2Cd0nbrcgE8BedUDhR4iLoNtgm4v8Zlm5PSicKugrCysQlK1mT7nlnojczi4F6BdYQRAUpn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=6qP6WbDP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i4v5Nn4r; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="6qP6WbDP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i4v5Nn4r"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 7548B1D000FB;
	Sat, 19 Sep 2026 07:50:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 19 Sep 2026 07:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789818626; x=
	1789905026; bh=zIiTSPIMnM3VniafWsB+2trRFTNSk43qE18Ut0enLXc=; b=6
	qP6WbDPy+YvmwjnLDdzLSng1Oz7zmoqiSdIuskQsINun7Yw97mgDs29NnMtSGAfC
	5HazREhbJpmuTgnM6O9EJk0bvzQ2gI4OztmksjbH/DEgli6TV8gyxlZzBlOrZqbM
	nYqSVOku3MUPIfWOF0KGFHz+0ZkFPbC4JOjFztdW1xrTVuOLWZtpg2gAFklozcxV
	xPq7cM6a+czmeYYGkG9O1SbjfnnxzZRZNocuiVKzAN0Cp5tOz0A7Ufu3yQfwU/g6
	oz/pxLO0oIebMlTU4Oep30S5eAbn4uHulVQqQ78ili2wBICra4PN1OJadPYwOQdu
	ihjwfeQ/CYUmU4Lo3RFJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789818626; x=1789905026; bh=z
	IiTSPIMnM3VniafWsB+2trRFTNSk43qE18Ut0enLXc=; b=i4v5Nn4r9i0i3oeNA
	6j/nU/zLumZvfjHDTZCLyxpEkv55hyxgu7i8bL78CA0inqW9yb5Qbx7WvYYQZd7F
	Q93ImGlbWki9K1B6BvZK8XpfVcTbK3V/bp0/YBJmjuKdnD9qjtp8zhggAJ4ydvum
	CUiO7TPWYbG+TeteXMxo9Uq7zAwZJiviE2wIfrLlME9GHEQpar1Klmrep4u/nb/Q
	nJlIvpCBxrNHaJTbkA0BdfwEl4EKwa80TyAye15vMPq0V8jKB5ETfEQVzLJDO4TV
	sRHUunfVv+ralC5/SAYUeh/9a4AmWeqUoZOy8YQr24nmiJagSpJCPOj2RXa1g9Ap
	ILBFg==
X-ME-Sender: <xms:Aneuatfe0Hb4Usty68w1Ig_BY23kqkzPiEfAZk7heMmBCrrjRLi2ww>
    <xme:AneuapJUMkd35QPviUw4_438HJ-qOpUvJREsmTUFqPscqwtp5wug2BK-d7jk0Gw7M
    6y2b0cnESZOkpjPKod0eGB6GRnYjA5yJL45z3qOEIbOFO94pE7Evn7B>
X-ME-Received: <xmr:AneuauGrxwRTsefIQ6QjUj3Z6MkdcwMShGCsZrQItvqaJ8vxB2sZ7lkd-lK1mb16RIOpr-HCumIZBH2rTZcS4LcLejdfL8TZIP-FqJqKmZB6QA>
X-ME-Proxy-Cause: dmFkZTF89Q54GLsKvm4RbZqlKDuUewYy1TCjGEnhC1YTwWhDVU1Gg8XUBhEJm2TFxVZvvI
    zZEWEbHGf2ZL/pZjpc45k/hrCyAQtJRuufvPYfjuTBfotRHi0VhVl9zEH589EBWb5B7mV/
    tfUd2RmdbhW/gTVcrpgviK+UD+Y5c9VHkMn0OFtbpmRapD9LbA6ckmj6VMUOy2adwzCJaQ
    BezE15MGm6MTQkkQRzD5EoBdxPXwsaCP1b5MkvdulSTaCPXedkrrOZFrvrHQtWUmA/MQcg
    pYWPbDXBkfElLnA8ESdXyHxJfOUX3+Xp1s4Nd0Jf5roMulsmIdACOHs9ds8uKd54CVcFWm
    y61BwCodlfJLgZGzFJjNxMJ7Cb7vYM5v4dKceqXpPk1lyxIduMqyZurmAdqgGIlttl9Uem
    evhsTpIXA+vuuxbI69sKmTsHDM2ap+A95kGAsEg4o5xf3e01t8mOd7fpH4TIg58ll6GBbO
    ybSGOVUgD5oZssoyJnLXDn1L/+w/XJV6qoSfmGLBBFNk0m8puasrsnQrVn//URNuw7Zalt
    sGWIiY45dVf5sGxBW21EZ2TM1fUnQTZuaBdvFQUDUbDw6XwAiUmPoFA0eIWdJBEL0P0qHj
    f0NvLZWKXLKdxF5rPoU+AOKj0Pj5uXeQ1qb8Mgr+7hnDU5NayMYHhiFbDX4w
X-ME-Proxy: <xmx:AneuajpAdJwS3jWEHSMuyyZx5YP2pj5n7rZFSrwZcdsrlQmoNzhC5A>
    <xmx:AneuanQnQGxECGma8nnlYK-ZxLnJihXUZPhaLkJ8xCdSy7C6z0OCNw>
    <xmx:AneuagP8hGMo34v0aGMyc5cgmzv0g5-qEaPa8YsThAgtLNhFbZMBBw>
    <xmx:AneuaqMHTPuYyc9Y2W1y343y0ziKRwjDPhxTOhGlNvbe0XIka8ZNzA>
    <xmx:Aneuamxd-o9QtOhfgnmf4TJ15ql56UwPIIwQyDtTwOuJhDvET6ne0YGm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] firewire: ohci: refactor branches in at_context_transmit()
Date: Sat, 19 Sep 2026 20:50:15 +0900
Message-ID: <20260919115017.859169-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the branches to consolidate the handling of local requests and
responses, as well as hardware queueing errors.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index dddb08dbb45f..710640b759e4 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1667,22 +1667,16 @@ static void queue_work_for_at_local_packet(struct at_context *ctx, struct fw_pac
 static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet)
 {
 	struct fw_ohci *ohci = ctx->context.ohci;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ohci->lock, flags);
+	bool use_work = true;
 
-	if (destination_is_local(packet, ohci)) {
-		spin_unlock_irqrestore(&ohci->lock, flags);
-
-		queue_work_for_at_local_packet(ctx, packet, ohci);
-		return;
+	scoped_guard(spinlock_irqsave, &ohci->lock) {
+		if (!destination_is_local(packet, ohci)) {
+			if (!at_context_queue_packet(ctx, packet))
+				use_work = false;
+		}
 	}
 
-	ret = at_context_queue_packet(ctx, packet);
-	spin_unlock_irqrestore(&ohci->lock, flags);
-
-	if (ret < 0)
+	if (use_work)
 		queue_work_for_at_local_packet(ctx, packet, ohci);
 }
 
-- 
2.53.0

