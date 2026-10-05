Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C7847F2CA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199558; cv=none; b=ZvuyCDqji7zlPHPS/EUUSo8ndztRcKYKEfDUEPF7q5f3Ox/YEzO4LjOr/jMahUMYPbpjTF5/VAa+Am/KTnlDcbDcQ+q/oH8T+2UkvYoKbU/BpznOa8vBP0Ek4qMbLvGk5royQKCvPwHf9JPut3mBIVNIA7aCbknI4KaUrpRGEfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199558; c=relaxed/simple;
	bh=hxkbPu9JQf/csbIfMJDGvjPLMKKEenY+dJAmR1XdQ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+no7MGgtRia2jAUrSeG9LwI9WagJu6hFHONqDKMlt4oVTgwA4xgGTra5wGTQDfjYGh03Y62qavbKOsmOwa04J7mGEjBXKBOowBSJUc4FlEFanQFQ+lI83hRYXvSZkIblTSVt3/wEE8Dk0TLVtJBd7LsDtdJ3HCnPfdLx9M8lVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Wh85OpP+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D4cSWdm/; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Wh85OpP+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D4cSWdm/"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 2830E1D000E3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 05 Oct 2026 07:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791199554; x=
	1791285954; bh=pd48v54bhACYFUGFMEg2IfPz0CdwzVQfeuA1D8fRHVI=; b=W
	h85OpP+bXFCb3noXwJRPsuE6BdcuneIQXn/7S6QYtRIHm1hIRSOAurEgkE7Yajw4
	JUoNUztvWNBi9fIGRuj2WIoDEpO5KsqyTmN9fJUJIE6qOnmcCyr47FUB9Hqx+32v
	rdik1R/OVZmiJyMzMLmZ+NJNblePYVDjpL2CR6Geg30Vv5rAF/nEEV67Af+NrAQB
	K4yr7LNUCjKKWznoibtYHye3LUBGmj08Ilh8+PK7BqJfxBU4qZHaItmvReTBzOPE
	Y+8EB18kHJHEopjM6nhA8aon0qnKzO70s5CjVa0+hJcpv0Uh6J7D20QuTus1G09f
	Cj+geNV78ZND8eUvJDl2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791199554; x=1791285954; bh=p
	d48v54bhACYFUGFMEg2IfPz0CdwzVQfeuA1D8fRHVI=; b=D4cSWdm/vfaxrNz6K
	M8z/P0kk+UOEEDyx1mVoA1eUo3GEt5dCaloCiWYGjC6pLKWbIU67VH03hqPjpdDA
	A98RE3ezlmui1qsJG62dI2BFHHxaLsW7nAnZvfCB6e2RD3ki1Y9DDAefgghEBbaO
	YYKu981H7Gayq++P7urDdvICBhB80ceuwWvNNYFMvPIQh7yf+4uhOOt+ZpJ0dFwF
	W1TnbiiEO5C9fwoLfM/iy8WJPRvw/f9fXJGIHTfNNZnrAlAW+4d6adkIZS2QSLDD
	LnIoGTGC3zmjHZOk0CFeKtyIC4GEkdq/pUB+S5pDGwWhlN/XbCyeMMILQtM9HNII
	BJw1w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199554; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:VStjMKdP3E0XkpImqgHAAABST5R4zBF87gpmOHfAsFAGO0W
	o4Nd6ueVsvYuOsnXvWeu+nBQ7ovFFKaCaao1YDLdxKKzjx4Ryp9o7Xs1QmNczGpU
	n6VZLQRbPZ0oARSw5keXyv8zNj2Qvnv9GbfASWurm7OO9wfFb9T0wG39nD0IrBdG
	OrzcqOROfFjzJeSi5w4cfUTyBaEHxWKEHGmvefRfRnG1bNjzpsvej4lMqSQHgAK8
	Le4HrTcNGM/xWafKTD8Qmh63yGVrYuDdhUpM8d2+tqWyEcmpF8DhsRjRSb9OgPzk
	sGRtAYw72Uk5wnfAC9cs14Lb5rZBqiO/oUxz11g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3iAOBBQueybxMYz00jOWEUmFPAY+pi3OlllSPgBYrMw=:hxkbPu9JQf/csbIfMJDGvjPLMKKEenY+dJAmR1XdQ7E=;
X-ME-Sender: <xms:QonDaihKpw3TShXXNPXPUWKhxj2sE0qgdUJDYcFxrk8u0Kaq0DWm4A>
    <xme:QonDag_MlFH4kxG1_54wXYFxFl089CGwYVE2o5Z4bj-rxiRXtke8Yevc5N2E288AJ
    FvxcU9b4ic0JcTY-K3ho3Sd5EJe4ufRXEMiBO0_xabntCyyl-IB3j9bwg>
X-ME-Received: <xmr:QonDahraSnW77kUj4216jR4EV_StpjjYsgkX6u3CpUMPxXur5wxBtke0yiY6zHU009wWy3uluxcuuLosRxK6Xp7p027-WGrI2w4QQXmOUhBUiw>
X-ME-Proxy-Cause: dmFkZTErW16n30fVOtPPKC913JUt9GtZq5ToHZiOV9Th707EXjbLQ2FLorcrI3mzg5bsvt
    8jbaAQj4pwvoFJgMx4ngv6a5ZJblcfZBs6sWqUTOuNB+90edONGxhjfJD9ir3wPndtsQan
    mG0R7qJWxsifFFGXCXy1EJtw1nueGbYhSjPB3M/1YXjlWeq/9JvZU3vlqPPxSXD+o44WeN
    6pC3VmnbghbpVI5XtNDz3PxzYg1ZY7zDM43WoooJ6NahllBDpvbrsU/89zrT25KWFWuUxa
    OHo9GHH/nOJVAnpMCZIdtuKFFrQ5t8C2vjD5hAHjkjLoTJcA/InDdm3PFXOmg3HAnWzNUW
    p0UNzdsLTW2Qt1gxh271sWLf4a85UlxiLwYycWseDufBx2ZVlQcdAn3I99zZON9554tmxH
    liisipOPH4/bV3aO8B2tz/wbuJzzLHwi+W3ZPYop91z5RMKuRpshaOsdzbl6vfjDAYs1WJ
    3eyZ2Vh1hDyyBq3U7N+fdSD3BTJHm96iAcKjtdLJhOm+8XTPC3QK+1n/tgIovjuoBIqFat
    1AGTkRdLlk/Jf1ESdgUetBfWOjcD3oENdTbCI+FyFspugt3Ddk67v4v2rn4b1A9IpUeZjX
    QFSsD9OWorh9XYcEHFxY4YwNzX8XsK4+ENhDHqTusJXYeKN5UcYhTwCTBMNQ
X-ME-Proxy: <xmx:QonDan8kYmq5FXibLvrqmV66hoB8mgAxyYR7Op9KEstISOSGoeychg>
    <xmx:QonDatVWPBv4YwBB56DChqf1Uv-aYwpiio7byFg090b5EguLHhCw3Q>
    <xmx:QonDalBO4kLpKbaxrl2jTYn-2SXODjAtr7OkamePPDVDzlVCqQfhgg>
    <xmx:QonDamxA9ZIFZ7ct-Wb7r8NXmeaQLNbZC6EZ2TitQ3mRNJWsPFutTQ>
    <xmx:QonDagWCuYW2y4hEkBxang_m7DDtPwxO7ScP3EOv_71lq7IQ4cCUhkR3>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] firewire: core: schedule callback when cancelling pending transactions
Date: Mon,  5 Oct 2026 20:25:43 +0900
Message-ID: <20261005112544.240552-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
References: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
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
index 8c30a476f9fd..90419760d8b4 100644
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

