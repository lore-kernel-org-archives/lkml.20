Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF51AC44D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790484255; cv=none; b=m/nC4lcpMwwCZ5nqMnxsVpcPhGos8UKg6kh4bIgskhyJXbr/ndNUeI67JKjPOgRjAG0D6hxzjo0Td2N3f3i9WmCJPVweSNV5DqXZvObA56SqxY9gzr9JXPb8O/J20Qsb1CAC5ArXGgw9NHEgNwPtLhufOuNUTQlmD4ptaKIaYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790484255; c=relaxed/simple;
	bh=pEpb/7b1npE8UaAyMe8RYIY2gKmnOhxz8xT+IV/yTYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqqPptSoDvZCQuqsJPNh0xIwt+7NXWe5wc3qrL7dbv6BXf3nbf8vK+6mYGTdYn3iL8LvcJOejvRLUyYwJxc4wxs7RIY6CWYoxxOZTiwtBAssKAGhJq9R2FIfcilIckQPbOAa1Sf22zOGnfbfIb+iXN3SalkrdCgsbo1oX/3nfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=IqdMBzn5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DSTnChm+; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="IqdMBzn5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DSTnChm+"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 12FBE1D00081;
	Sun, 27 Sep 2026 00:44:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 27 Sep 2026 00:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790484252; x=
	1790570652; bh=PCEYsGjEADD2SDgkfRS+qckzWpF9ZFbDiZkdpId5h2E=; b=I
	qdMBzn5MvWNbsWwxd0+XcdNS+c6K67GIk+lM5sWKQTfTyhnh52TnUm3HdfDJQnp9
	shv7BNquXGP9ZdaCCVpE7IgbFRoXOe7dMEFCZ2sZxjJtOimVuTelyfwVWdfo8OQo
	pXPD0gXIAFJvNMiZZhQLNCDMLEaWOiSFaV1sKjKX2BoK5qS/1BuMH+I068qkE+W1
	VRF1Nk5xDSfgIwa5KCa+4sC0ePrs8S2H9tddMPFJB8ZoGgtCtXfxOkcXsts3YbFA
	oPTbAzDmgTKI8/ty3a/IoJ0HiquyF6dkt2TFP9kM1aikH3jjuJz7V3jIFQprIcxL
	MX6bQDF/ZkBSLJ22gzUiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790484252; x=1790570652; bh=P
	CEYsGjEADD2SDgkfRS+qckzWpF9ZFbDiZkdpId5h2E=; b=DSTnChm+V1eGXJZDC
	gftywfiQHYUG7LL30sjBoz+mc+LIICabCy8KqTBweSXgx9spdMW6tdp2F3zIVTMh
	CUo/oBkUVIxLSzAeVjh27wX5fOb+ZUNoB98zmFHPCLJCt+rUF0wTO/fdr45cMvxG
	6pFRqZ63P5888UL/V32iOeqWVCRlxJFwUKe4dTStiDTrs04Iuyj2mDqGaC02VpWE
	vfTdAjPvTQEhdMQZWHKxS1tED3QyG8iorpoIufJvi5ZZZg0GGI3YJeQOs9XVwAau
	2EF6Qh+jjfyHUIAVJZ6H0zDNW677yBCw+BgKN5tDCYlK9yEG2qoA9itLakN5DxpD
	J7W7w==
X-ME-Sender: <xms:HJ-4aoQ3rPZ355nw8V9VD_frqvHMNseri-Qa6TLPKH7hIkI4wdCGjA>
    <xme:HJ-4ajuEvo4HeDoaqmLBt8ksFJJJYGC4n-WsDjLHNIoTcyYIQ9eyab3MACgO4ETB9
    ecp4QWhf-w-9ADnjiJHg22Hfqt2Rw2YToUStOSXPkX206Oba87MNgan>
X-ME-Received: <xmr:HJ-4atbMFexmQWO7zxCKlkXoWM1tcm5cytrADPNtP4BDqOwXUlXK3GELiUHHGhNoOekta9R-J4_AQyhYGLs-ElJFNcmYNRjqWQ4r-kU2H7d_jQ>
X-ME-Proxy-Cause: dmFkZTEnlIJ2mn+EkWbNnwf1fHveJ2wzKokm+zLmsGVU9hPfRZjH9y2xwzjljRNVRnOJnL
    9l0YotNdNVkKsujYo1vwEF3gssM7TP2tsbvagwR0DQLnE5kO+imWpB6feprhg2gqzt4TaC
    2AsGV93vOOH9CCt6zI8lgPBEZKGUsu/HTR2HQH9aSC7os0XYr7wWoYhz0mB6/qvOBmgXFd
    NQ3YXFB+frqabGD+NiScWd+GEiOv0wWKOy8CxQMxtdZXCHcffKPyFrQKDsXdhmqv++NLBK
    4pD3KgmemG/iMaBchgnKzoNkyMrRzez7RFFziAdtspBHKnSJuh4PW0bkFgbyCT/c49KbC/
    P/GPDCNdgH/+sGIaLe10c44gDalgtBosH4WxkOb1xEdiKMGKUFJWYyWC8sOFmUP/mGFB1I
    l7lR0E4M6tczCRxPr28KsxW8ptMjibsmSjVDf+auHmcK+s4C56rspVLLYT7FBif5aDRI18
    cCkEIWNxtiYtPMZQ+pl8o87Q4zqLl9dWgC5NhZEnoF6pPG5CQkpUgV+ej3qprOgSt/L5+P
    WcB4+TkGeQ0g3XBIkWINoewYBwLQ0UoWHsLpdCMX5NAEjqHnR9JQRvyw4hatKWEzFcxmb5
    WP4ykonUarOodjNojpFDx5P0jRf1oN4zdXMShcH4AwbvlV8lWJWAi7IFo3mg
X-ME-Proxy: <xmx:HJ-4aotmMCIaXd4oApQEPZtGFMN-JvwGYTml_Aol-3_FEVyZ379Ljw>
    <xmx:HJ-4avE9dfgIqPVhLNVLSRxFuSYAq9fTl606Wa_yiHZlBN96t0RIGA>
    <xmx:HJ-4ajzdj-m0io_HXAa9wVwKqUoNgPSHKxZoMk0OMULtuRpHyt5sdg>
    <xmx:HJ-4augi0-KoQu2jNapWpXC9T4fGY-2oJGHZFuelVLB506W4hT7QJQ>
    <xmx:HJ-4akGXIWWt8LR8A95xbPaVQFBhLECwQ7MExYCQiy8yZz9fSf51tgIx>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 00:44:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: core: remove unnecessary branch for timestamping when cancelling transaction request packets
Date: Sun, 27 Sep 2026 13:44:06 +0900
Message-ID: <20260927044407.65497-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
References: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fw_card_driver.cancel_packet() returns a non-zero value, the request
subaction of the transaction has already finished. It means that the
packet for the request subaction has already received an ack code and a
timestamp, so there is no need to check them.

Remove the unnecessary branch for the ack code and timestamp.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 8ef04d84011b..1e4c104c7e91 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -135,21 +135,16 @@ int fw_cancel_transaction(struct fw_card *card,
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
 		return 0;
 
+	u32 curr_cycle_time = 0;
+
+	// Timestamping on behalf of hardware.
+	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
+	tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+
 	/*
 	 * If the request packet has already been sent, we need to see
 	 * if the transaction is still pending and remove it in that case.
 	 */
-
-	if (transaction->packet.ack == 0) {
-		// The timestamp is reused since it was just read now.
-		tstamp = transaction->packet.timestamp;
-	} else {
-		u32 curr_cycle_time = 0;
-
-		(void)fw_card_read_cycle_time(card, &curr_cycle_time);
-		tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
-	}
-
 	return close_transaction(transaction, card, RCODE_CANCELLED, tstamp);
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
-- 
2.53.0

