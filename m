Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1952265CA8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960778; cv=none; b=NVM6GMmFixlNEZSIsUyB2nJMOha3TACYYVfKweYJJuYn29BicPRj9YFNNUtr3y3RlyqhZNOZKFe+LXM+5HgSyKthoMQCL0T1fqmGd2p6chizG+d9sniIXlq0eVU+Rm6U+kMrreynVySNtg9ReYeVxrMaZYtC4LrAb+TTxK/gK3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960778; c=relaxed/simple;
	bh=xGsAlX5xyIs2CCtLkoHwZNMrnNBjd26PvhmxMLqj+hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ado1c4VMMNJRAFCHy5CVCDvKiZqglsslqSwfZupSl4JQKqMCY2vEHI76XPtljUfFpXG3+vZ4UBi/5ppgB72+Jv+Pqw7ZR5CH7vw75BKnGFtgwj82iIW47NpRclOxBxanoQMCtkzICGmxVo9kWqSEo/ZjZk/dArJkVDosV0faPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OfkN0Up+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PUe0A7/8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OfkN0Up+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PUe0A7/8"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 2A2B0EC009B;
	Sun, 20 Sep 2026 23:19:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 20 Sep 2026 23:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789960776; x=
	1790047176; bh=zEF/dL+4Ow9v/upWemaVlCMlXJSOnPgWuRLUK9/MEyo=; b=O
	fkN0Up+rk2WJmVU4Y2Xg6dsD5i2sZCE85c2oMglrWKxuIk3DK5HoDzdW3NFGJDZI
	tQFRvLs2Gdol0YHMVP94MkgmEHmyeqLU59xT3kaqg4tvUlHSCI+yogz+3cL9zV+K
	+Tzb6vyFivTmCItlGmRYMAoJ2hNivC84Y7pbbFfxX1eNiGghgypLGC13HsENwv7f
	YSPBgObRMwsylFqoPKF3wwRhlzighPjC6bD7j9Dv3lhaRdqfjkEuqmKl3Lw0bbI9
	7XvRBh2m7e+R/DdBO895psyV0H1ThMtnCfz/hHauvv7ioV1k41MKlLo9lKIIDAr6
	G2ovDBYuCpO396nAsBbiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789960776; x=1790047176; bh=z
	EF/dL+4Ow9v/upWemaVlCMlXJSOnPgWuRLUK9/MEyo=; b=PUe0A7/8/DsFzbIBT
	+s3YIYOXwbIGaffmqxefJ7MQuuhbxtIQrIwbTuUthBCFm/KkOSaDvGVDSVnuA0Cp
	oXdDFGNLrw8L3KmvL6Kk4QQpXouhBVn3HljFqxXu7YFKinZPb7S/C7vv12iUIBAV
	r+X49mfFKoMBNza096bxU+AZlmxtzuAGM7EGf+57G8xygxCMinpqdJ2OnwHfmF7g
	GTQYc965c9sYjDNV2WmlC8+Nz3Dkp/pbhgfGLz/vkY2L94wW2BORaXbGp5bVuhGF
	cuUoELvMr623ADwZOT8f2AG3MxLHPG6bri+Wsq+M2tv/uJwjtF6Z/OnS2PlQ0uoT
	wZw1g==
X-ME-Sender: <xms:SKKwahmUmuRBJmKaCxNLNLLhcT1DForeGyr-SFhSRDJELn2KL-ATyw>
    <xme:SKKwaqzNxZMCqD7KFVkpLbH-dmsWOWDiXA36oQf5megQY0NjWZcQ319dvxPN2uSfs
    h7zrh4iOv1Jc5BVPOPRz_yCO7fC3OqzV1YAfDwVw-3KFzJ0OL7h3271>
X-ME-Received: <xmr:SKKwavOXV07Tv04JjZYHMv8HLerAOY5GxOim-XJYkuaGydain40MabPk1GU3hPiIxnmoafErclF1WNOEttnNQ9YA2MQSt_dbsnFM3V3zG9SHCA>
X-ME-Proxy-Cause: dmFkZTG4HxcRk5U6N4ypSfJUTdx+6umR7TSQ4g44xSCYOl+LSsOjyHLREsxOw5gpDWjGze
    ssZLXb8NQxBJAfAUzYHAbyvWaRwsq40mDR3QglpIIDOh4aDtOIlzcZNB62z4mDymKjq8jd
    UAw+qD5Fd6CAYTpex4syY5GNMZvis2cXIcCo2nhBw5bybLWSYdtPnUCp36inipJE76ak20
    d1oH1q9KObfdYrwOh4VrMfNbrg6I9B2GUYo2Bcgfzs4yTgdISuPHc8sFeR8xscqwDa+lNM
    zTDlL6JavrPbKQ8tH66oqgOWzXA9BieBgfS/eaXHh+GlACm+XjjsELkq75QnzOipCwA3Zo
    oMq+z2FbW8G29wzBeQzpbzYufj35G3lw5qfW/koDyMKbUP/vmmk9Js/89fUAspXthZ4hX7
    m+ERkHS18c3td5FSLpqRfryQB768sP738KQT9abQ5C1MJN+sLT9z74W5L4CWdkXXScmBSi
    ZxFPl3E9LuQ/BrlxBEAoeDgXQndzeJmFaDOUfQECkB6ttLWMs3hPOUofdP2O1dKDvDAxI9
    wCHm3ob+e2E81dI5Z0xfygcaDH6WMzJFr8ue1MnLQzNDWP2EHinM9RgCjCq/nps5djDIkH
    4wuiQYaWR+D1PgXx8nMwFu+OQm9hSLZGfdPi13ArDvEh3dgPVNyGJ1CMbcjA
X-ME-Proxy: <xmx:SKKwauTva3kzUfNHZjJ1Wh9dHKJLS1GpVQ6ZHuzlf_oKad50PJFihw>
    <xmx:SKKwatauQGYWNGEg-K4I16z-mOVOQylNnp_IN7A_24Hr5fYbPZd9Jg>
    <xmx:SKKwar2suBkoMr1jtmdws3YO_q3M346eHzIA3wGCjfo6XjRrVcRIFg>
    <xmx:SKKwatVijTdf1d8o8zfUeR6vpbnvJTefnM14_69gtLcEhssWq-7fCQ>
    <xmx:SKKwaj6yyM8NH2cLB_k0v_4RnG58Enexox-uroLOFVYiRmQZm-awUz8Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:19:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] firewire: core: refactor invoking transaction callback
Date: Mon, 21 Sep 2026 12:19:29 +0900
Message-ID: <20260921031931.287429-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
References: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two types of transaction callbacks are defined. There are many places
where the transaction callback is invoked with conditional branches.

Add a helper function to simplify invoking the callback.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 69 ++++++++++++-----------------
 1 file changed, 28 insertions(+), 41 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index a2a8d755ad0a..0cad55763a3e 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -52,6 +52,17 @@ static void remove_transaction_entry(struct fw_card *card, struct fw_transaction
 	card->transactions.tlabel_mask &= ~(1ULL << entry->tlabel);
 }
 
+static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_tstamp, void *data,
+			    size_t data_length)
+{
+	if (!t->with_tstamp) {
+		t->callback.without_tstamp(t->card, rcode, data, data_length, t->callback_data);
+	} else {
+		t->callback.with_tstamp(t->card, rcode, t->packet.timestamp, response_tstamp,
+					data, data_length, t->callback_data);
+	}
+}
+
 // Must be called without holding card->transactions.lock.
 void fw_cancel_pending_transactions(struct fw_card *card)
 {
@@ -69,14 +80,7 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 
 	list_for_each_entry_safe(t, tmp, &pending_list, link) {
 		list_del(&t->link);
-
-		if (!t->with_tstamp) {
-			t->callback.without_tstamp(card, RCODE_CANCELLED, NULL, 0,
-						   t->callback_data);
-		} else {
-			t->callback.with_tstamp(card, RCODE_CANCELLED, t->packet.timestamp, 0,
-						NULL, 0, t->callback_data);
-		}
+		invoke_callback(t, RCODE_CANCELLED, 0, NULL, 0);
 	}
 }
 
@@ -108,12 +112,7 @@ static int close_transaction(struct fw_transaction *transaction, struct fw_card
 			return -ENOENT;
 	}
 
-	if (!t->with_tstamp) {
-		t->callback.without_tstamp(card, rcode, NULL, 0, t->callback_data);
-	} else {
-		t->callback.with_tstamp(card, rcode, t->packet.timestamp, response_tstamp, NULL, 0,
-					t->callback_data);
-	}
+	invoke_callback(t, rcode, response_tstamp, NULL, 0);
 
 	return 0;
 }
@@ -166,12 +165,7 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 		remove_transaction_entry(card, t);
 	}
 
-	if (!t->with_tstamp) {
-		t->callback.without_tstamp(card, RCODE_CANCELLED, NULL, 0, t->callback_data);
-	} else {
-		t->callback.with_tstamp(card, RCODE_CANCELLED, t->packet.timestamp,
-					t->split_timeout_cycle, NULL, 0, t->callback_data);
-	}
+	invoke_callback(t, RCODE_CANCELLED, t->split_timeout_cycle, NULL, 0);
 }
 
 // card->transactions.lock should be acquired in advance for the linked list.
@@ -385,6 +379,11 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 {
 	int tlabel;
 
+	t->card = card;
+	t->callback = callback;
+	t->with_tstamp = with_tstamp;
+	t->callback_data = callback_data;
+
 	/*
 	 * Allocate tlabel from the bitmap and put the transaction on
 	 * the list while holding the card spinlock.
@@ -395,30 +394,23 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		tlabel = allocate_tlabel(card);
 	if (tlabel < 0) {
-		if (!with_tstamp) {
-			callback.without_tstamp(card, RCODE_SEND_ERROR, NULL, 0, callback_data);
-		} else {
-			// Timestamping on behalf of hardware.
-			u32 curr_cycle_time = 0;
-			u32 tstamp;
+		// Timestamping on behalf of hardware.
+		u32 curr_cycle_time = 0;
+		u32 tstamp;
 
-			(void)fw_card_read_cycle_time(card, &curr_cycle_time);
-			tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+		(void)fw_card_read_cycle_time(card, &curr_cycle_time);
+		tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
+
+		t->packet.timestamp = tstamp;
+		invoke_callback(t, RCODE_SEND_ERROR, tstamp, NULL, 0);
 
-			callback.with_tstamp(card, RCODE_SEND_ERROR, tstamp, tstamp, NULL, 0,
-					     callback_data);
-		}
 		return;
 	}
 
 	t->node_id = destination_id;
 	t->tlabel = tlabel;
-	t->card = card;
 	t->is_split_transaction = false;
 	timer_setup(&t->split_timeout_timer, split_transaction_timeout_callback, 0);
-	t->callback = callback;
-	t->with_tstamp = with_tstamp;
-	t->callback_data = callback_data;
 	t->packet.callback = transmit_complete_callback;
 
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
@@ -1198,12 +1190,7 @@ void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
 	 */
 	card->driver->cancel_packet(card, &t->packet);
 
-	if (!t->with_tstamp) {
-		t->callback.without_tstamp(card, rcode, data, data_length, t->callback_data);
-	} else {
-		t->callback.with_tstamp(card, rcode, t->packet.timestamp, p->timestamp, data,
-					data_length, t->callback_data);
-	}
+	invoke_callback(t, rcode, p->timestamp, data, data_length);
 }
 EXPORT_SYMBOL(fw_core_handle_response);
 
-- 
2.53.0

