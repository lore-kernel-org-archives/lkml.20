Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D953E1228
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294445; cv=none; b=Zi3E5UfgXxWwHXfL9c2kV6PQn7Nk9y6tMYBk3xrZouTvpZn9sBYJx76cufGJVe6t6G4RFGQxuAl+4NivO/sSsx3sSi3HFaqKOlDJQOFBn8GgO92sPhZKtPQ5n3S9vjRyLsgQ1DNIq4cMZgzXat7SvcPuy9GjsLvmR0gP4K7WwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294445; c=relaxed/simple;
	bh=VChGRxaG2c4unI55GPmtmcfb7WPColSjPRgjppEoNDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGtQrrC4d9tTGWBugU3HxYSFvG/3ruZgtCOBMRMs9dHZTxHgs1MPgqMypxeN2qH9BYLg/lVfyfX4hPxcRny1NmUC0Uz8CgqvjOMNPjZYXFj3KYqQltjcjzztzADmG9hNudHyx9MJVY+b9EszwFKugMeXk9UaugjaXfMcQNEegS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fCInQmIy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DKAKGmOp; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fCInQmIy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DKAKGmOp"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 74BEF140005E;
	Sun, 13 Sep 2026 06:14:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 13 Sep 2026 06:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789294443; x=
	1789380843; bh=1kjEhTOI5iRMtpqhlTPoCMN+ls1HPxyWnHe8hUHPglU=; b=f
	CInQmIyYTaz5uPCMpIm3yS8sNnt/KlNg2XhYGFdZjJYjuOX5miGhie9I9NR3pOla
	12aU+qn5mFvRgIfrKYKpHTQFTB9Q6PNNPTmHuhApWtPnmQ5LWk/GFM6LcOXVPAkX
	ujoYcInZxwyHcIlTOG2hZlYR0wc9lLJmbPffQyJAuZsbouzEeMVNd7+yuaDg/wo5
	XTFCUZSiVuGhHGYkqrjN+CE3hL+3+dc5oDOW9SiNjVPhaiklFRbsCzd9S0ZibD5f
	RoKfAYgxGYJ3y5CgTqCe1XAvzBOAaSruaxENh+/rBnHsqnPT4SeuMgUlSPeDsLzG
	qMTzTIFBJFX0q5oxEAyhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789294443; x=1789380843; bh=1
	kjEhTOI5iRMtpqhlTPoCMN+ls1HPxyWnHe8hUHPglU=; b=DKAKGmOpDI65nhvvI
	UnuYtasR9pcqw7oc5rhg3fnmvpJlL20Ied6MxVSPFbDnR633PNXPaWgvDU+s0JxP
	jS4J+9I9K4vqkNR3xy5SaEJ4xQnRfLaX+uCmuxnN1J2KHzpW4BkkUXyfZjPFApkw
	H0LqS4CZaqfnSAkFAAvs5UrLMP+sNFmSJEVxrdjoTfdUiu/FZFgh2MbOMDTkts4c
	1KTeHY0pk8mhDlTIKtVxsMI/ZGfw8RUmuPpcK8x6sUj36eFhkGuXTIO/IR995Pjk
	W66VC1naYezvNaw+dmL2qnfmCvwSy3GjQ/CkaHbwT850xv5XGXP8lv4sM+dZYCBe
	QRldw==
X-ME-Sender: <xms:a3emahsE3PRJHCTumP0gHKqpL2dbcrGX2rBrMNxVVa3CtrPziX6FGA>
    <xme:a3emaoZKHEi4PQlniilRjuanZFt-QvrW4wbdbbR2tKEHiE6ds55bbpzTjdhAV02lc
    J2GqBM_pszW3ziofNhT_zymRVJ-XhbLYqur-HIYMrJv5Io6a9zUXAc>
X-ME-Received: <xmr:a3emasWcTvARcoRfAAavybl-nnpPap-Y5IrIv7LwGsFCouST5ZbP9u2TxoF-2kocK_uoHVEfn0irJMScm_84SrJh_H44eggNLuS70ZWUL5Os5A>
X-ME-Proxy-Cause: dmFkZTG2/vy8D0TbaMZOOhOpGNWwOGVtNK7N3/Ngp133it+bhfjOwGH+I3f6TifYcbFCix
    d+aExY2U0cYC7fsd7F/Fw21a1yBHo7Ftaz2iRM2h3gfR5T7dXWR8r+smeEK8E28yK4bIYd
    ixLHKJoqK4EZNfSK1zEMlMFiFzl5g6Jx8QVFNKC3RJa2Os6FyyhShJlD7ix43o2qA7rLeH
    OUwVltsbra+ufek/Q756DmmV1U+01AJ3ER4g0bUtgnCg5AB941tbiwQ3ExpQ4AI1Dh8OQh
    oY6X9VjBXg0YPP0riUEHb6zHa1SaebZS3x/r/3AjkMhIWic2pIMC15GtHju9uGnUtrHKc1
    DJdCNhX4BqTHdsaaUltlYiav5LZoG62e1dVmZw7XgJuUOH2dFaByuzDtmFHr4h890MU74V
    Q13ckyqExYDzf+bB7iNd4Y7ZgmYQ+rzRcgwe0RpnmYDmDZEM9yj3PcGViqudyaPsSAOz/8
    dC6bkjJRwXmdnKc+tgCT6VIIhaPEWFQoC6rmUsyh++6nGtAZiuw8U0l686tJw8AmyMfgFd
    NPfWmUMKBPaIqVOaGIozCRGGwKlZytu3JHo5Om+V5DuWDavIReY3qHzUZyvbU37+jNjhwx
    WINGSNlrLT/kKAEI+sJDhZfpmLrIN3Oj/y/5uRa7c5I5lre4C0sTPsRzRwPQ
X-ME-Proxy: <xmx:a3emak6phesFJfY_yFezM9-qMR26VxDNpz-XmkPfvYmSQG6dWed8fA>
    <xmx:a3emavjcgfG7VhwN5qK5LQPI1qqu1e0ALkCi-yweNgmmcUFT-SxPFg>
    <xmx:a3emajfdQ_fdYimeA4p6GmW3fOsDFbJuIE5VwIa1Anj792zMS4M30w>
    <xmx:a3emasei1hUx9Fn9J6kzSvLFP2Fiu8e1jfDMOZLAC9tVV36SamIHVA>
    <xmx:a3ematAnPpUwljV8ZUAymy15w3yXMUgb4AOLDh4d_dz0d_piCN0KpP4W>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Sep 2026 06:14:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] firewire: ohci: add helper function to detect local AT request/response packets
Date: Sun, 13 Sep 2026 19:13:53 +0900
Message-ID: <20260913101356.156420-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
References: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation handles asynchronous packets sent to the local
node specially. To decide whether a packet is destined for the local node,
the local node ID and bus generation need to be checked while holding the
spinlock, since both can change.

Add a helper function annotated to require the spinlock to be held.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index c8cb7bdcb4ed..290bac5112b7 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1574,6 +1574,15 @@ static void handle_local_request(struct at_context *ctx, struct fw_packet *packe
 	}
 }
 
+static bool destination_is_local(const struct fw_packet *packet, const struct fw_ohci *ohci)
+__must_hold(&ohci->lock)
+{
+	lockdep_assert_held(&ohci->lock);
+
+	return (async_header_get_destination(packet->header) == ohci->node_id &&
+		ohci->generation == packet->generation);
+}
+
 static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet)
 {
 	struct fw_ohci *ohci = ctx->context.ohci;
@@ -1582,8 +1591,7 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 
 	spin_lock_irqsave(&ohci->lock, flags);
 
-	if (async_header_get_destination(packet->header) == ohci->node_id &&
-	    ohci->generation == packet->generation) {
+	if (destination_is_local(packet, ohci)) {
 		spin_unlock_irqrestore(&ohci->lock, flags);
 
 		// Timestamping on behalf of the hardware.
-- 
2.53.0

