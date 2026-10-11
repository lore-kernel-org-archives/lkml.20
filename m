Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D383D9557
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700316; cv=none; b=ZEswgO0eu/814aKtivDJ7zSNcZkLeZ6hNDsbx0TG5cAb+Xm6stmoVMbuAUPhBXcE/K6mR7mXE5gqn8YnGhO/FgzU0CYGo0LCB0AmpD+jVSd7aE+kiThV68ATlqI+HRygel4+3t0bMVaQfpzVwalo5HrkjSDkjSYjErHe1/6rhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700316; c=relaxed/simple;
	bh=KT9IngrjyccQuPO1Sk0aNfHScPodvVSSVZYyXQuYDx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtFWHcES9j1h2AynfEvdusjcdSmTFqWzo+x5PNz1/CviVLgPrwR4zZUVn8ZgRW2Tvoj3CC7ORhpv6cKKMhZlLN9c6AqIl2a/VXy14Zl5VFW9eW7SSK+N0k3RHutRgbAyHurQtc8UVA5WifpLQ1RbW/nSRF/1vXc61GZ3UUybNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=u386YnY3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mGtOGrYZ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="u386YnY3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mGtOGrYZ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E0AF514000D7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 Oct 2026 02:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700313; x=
	1791786713; bh=KsbZeiIfLTFg6k0g4o3xrDnz8ihfNRjBPJ9FTxqE1x4=; b=u
	386YnY3MTHdpF/h5zeW9ieYDstOr0pt9hu52b/9wZ8ZzCX9L85FA9QPwjIbJWkEA
	zUy3ra/jgngl5ffbb9VpsNqhaHkgzMrKKxUyefbVwCNnkQbjTvzorJy5U4az2zMW
	R49aXBMFdPxkK86PFnbgUziMFnU5VFDqkbnDG9hjiVeBrPUHrTAfuIgfsW+bzsWf
	LNRdBo11aaxXVrSEjZ+Jg410muUXE6YIMH8mOO096Smr2CxWdoM+Z1db5I9lTjS9
	cT1VSnCp0ZsWRs/YDLZq89bLOfcv74324KAGN056pMa36Al+64JeMlCnP61VcFFY
	rj+TT+pdwwpFJeQFZ9VoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700313; x=1791786713; bh=K
	sbZeiIfLTFg6k0g4o3xrDnz8ihfNRjBPJ9FTxqE1x4=; b=mGtOGrYZU1IiHE68T
	577SMMvYmiMRSEcJLBQ+kdEyPwuP+NeKktEDTalQkx3uH/frBgQwkxWqldr39r0P
	yuJl+G9XE7OZ4TZm59G0Y6SWEGvJJRXIXTq7Nl/fkImJ6+sHzcRr+pW9DTOrwj8U
	BZKoX8SIkOy49msUJKAWxF+ESSMDiB9T8fO50tVODIE8Hlr38pE3RG14zRzAsPzg
	+3huALBeJUS+9jhb0C1DcNcZJgKbeQMOjwfvo5WZN79IDXAJyyR1dlYfFSTmqE73
	392aGepnoptfEQOwIi0TtExcmoDgOqhrjHECKTvSTSrlTbayJ5t+kP9h6VjF54dg
	Nfqcw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700313; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:EnrzwS3GZoeQQwVjifeqOKKteFHP73ElKm7aLQtVi4R+ubn
	tXjsu6QvlFjL1XxkC9ZrMAXOZZn9zOVVBGVu3Me3YRLtxlX86KwYJxS71QDUe1w1
	QxHR3w3j9zFwraRSQyaqEupKjLziEAE05Tlwl1jOrFUELxJwaZUuEoYmG93HQ5ks
	ULBLcflXh5gwckq/LHF/7licrEzs7shWU+IXp/RxEN9O2o66qkkxfL09dlHtiI3r
	gmvooO5UfNmVzBhPEB/6OSy2YdrlN+vVlRAQKBIecGjbQs2xqBHf0ohNmt4pkh8g
	3o+NphN8wtFntrjv5lOlKI+N3VJMyBrZdROowdQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:UwW+VPSP+BfHwj4unmiTFfEcZ9OKOiuHqDlCV77HgRQ=:KT9IngrjyccQuPO1Sk0aNfHScPodvVSSVZYyXQuYDx4=;
X-ME-Sender: <xms:WS3LaqS-O6rr05xxli5TxBrpyS8KllMdKzIbr5-I8t09U__RIJ_A9g>
    <xme:WS3LatvMwUeM-uOSTVT0TLVvswfRyPoH_hY0Fx9kRhGfVxUc4H6GYN9dfZJENMRS2
    90rkKBZcX85v-I3keEy65CWvGi9CUxFPPkaNmMm_4DZhFmfuYtkFUo>
X-ME-Received: <xmr:WS3LavZ4O1nM4LmiZ7_DEaMZCPot_kil0nqG-gemwdyAtRHOWTh3-nqbtOP_YgJQ2wivsatfSB2b5-q5pqo_4mVej1d9WEkd4BNR9r2c2Xa7gLw>
X-ME-Proxy-Cause: dmFkZTErquUrQVdJjR/SbHguF93gtTGh8C8GoykUk305k23yXhj4JpLOLWDIAEQldCVd4t
    BXJvDIObTmTdjV4xw951YRj/J7h3BNNjLFmhAyN+lN/m5ChBCbcOuhvsepGQoH3KP8awmG
    l7m0KMt/DoAPpKD8s2M808fsiy6DNare8q9SmMY8bXAnwCQlIXCLg+0IEeOD8X3yMb8sQm
    IKlrjQJKxKbCGpp32JTGc/kTdb2cH2rtMifChltcvDo6OnqtFBRE2yLVG+mhKHBeAxEKP8
    g8chzkfvjBrF+MblVgqed3eH3MF9+Am6CL4HWssPl8F2CJmU3gT935RCa1ldHQg/XZ/HE9
    +SSZarXky2QedXL8BXGDkMrx+MF5ERiIpR9++7ATo+Pwugy1/RnlevCdbO/p6+VovyPrhk
    FLa9jmA3TWybcdB8tE3iytWF8LBh+fekixXv+8y/iPNASJonLrW/MPLqp15SRLXaPuwN5L
    pE/sg30794XIPX0oeQf+Jep9n5sYz//YYg4TO+rCiSmFMoRp97MVX3tGP1sgESs1v4qYwy
    T4AbQw7m/Y0eyQQn4Wg27mNwNSnI6rFAt/AcWc60J1zUa/SWhveNRjLS1GgFzOjIkgiITP
    1xN6UDydVVErJ2Icbo0rYva0GtVggE2ZcAWIxYc72HFi1Gi9d11AfY/eodTQ
X-ME-Proxy: <xmx:WS3LaitwX-Ex5IFmmN4yoNnvTmqqSXzZTIPJi74gEW_8vS4Hhhhpcw>
    <xmx:WS3LahEXokHj6BY3u_Qaq-B3IC3h1ldckO5_U1GHoE29keLltPwzLg>
    <xmx:WS3LatwPO0YD2o-a-vYPI5rS3_YtqioqumPej9cMdN3Lt-vdiC5W9Q>
    <xmx:WS3Laghxs5J8JPjtvnEJnqk1Hik3SubxmeudWfqXOiA1z62Hbbs41w>
    <xmx:WS3LamHv6Mo6ANV_STqFfzewJQlrIKUQFmvvPcDkGbFm7UkxO76fklA3>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] firewire: core: use context analysis annotations and lockdep checks for transactions lock
Date: Sun, 11 Oct 2026 15:31:43 +0900
Message-ID: <20261011063146.497455-4-o-takashi@sakamocchi.jp>
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

The transaction lock protects the list of pending transactions and the
transaction label.

Add context analysis annotations for the transaction lock. Compiler-based
context analysis has difficulty tracking the locking scope when the lock
is accessed through an indirect reference (e.g. t->card->lock), making
some functions difficult to annotate. Use lockdep assertions to cover
these cases.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 32 +++++++++++++++++++++++++++--
 include/linux/firewire.h            |  6 +++---
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 1b9c642abe43..4466499dc1c9 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -36,18 +36,24 @@
 #define HEADER_DESTINATION_IS_BROADCAST(header) \
 	((async_header_get_destination(header) & 0x3f) == 0x3f)
 
-/* returns 0 if the split timeout handler is already running */
+// Returns 0 if the split timeout handler is already running.
+//
+// card->transactions.lock must be acquired in advance.
 static int try_cancel_split_timeout(struct fw_transaction *t)
 {
+	lockdep_assert_held(&t->card->transactions.lock);
+
 	if (t->is_split_transaction)
 		return timer_delete(&t->split_timeout_timer) || disable_work(&t->error_work);
 	else
 		return 1;
 }
 
-// card->transactions.lock must be acquired in advance.
 static void remove_transaction_entry(struct fw_card *card, struct fw_transaction *entry)
+__must_hold(&card->transactions.lock)
 {
+	lockdep_assert_held(&card->transactions.lock);
+
 	list_del_init(&entry->link);
 	card->transactions.tlabel_mask &= ~(1ULL << entry->tlabel);
 }
@@ -65,10 +71,13 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 
 // Must be called without holding card->transactions.lock.
 void fw_cancel_pending_transactions(struct fw_card *card)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t, *tmp;
 	LIST_HEAD(pending_list);
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
 	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
@@ -113,7 +122,10 @@ void fw_cancel_pending_transactions(struct fw_card *card)
  * pending transaction.
  */
 int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
+__must_not_hold(&card->transactions.lock)
 {
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// Allow the call of struct fw_card_driver.cancel_packet() to wait for any event.
 	might_sleep();
 
@@ -160,11 +172,14 @@ static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 res
 	queue_work(t->card->async_wq, &t->error_work);
 }
 
+// card->transactions.lock must be released in advance.
 static void split_transaction_timeout_callback(struct timer_list *timer)
 {
 	struct fw_transaction *t = timer_container_of(t, timer, split_timeout_timer);
 	struct fw_card *card = t->card;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (list_empty(&t->link))
 			return;
@@ -177,6 +192,8 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 // card->transactions.lock should be acquired in advance for the linked list.
 static void start_split_transaction_timeout(struct fw_transaction *t, unsigned int delta)
 {
+	lockdep_assert_held(&t->card->transactions.lock);
+
 	if (list_empty(&t->link) || WARN_ON(t->is_split_transaction))
 		return;
 
@@ -189,10 +206,15 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->transactions.lock)
 {
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
 					      packet->speed, status, packet->timestamp);
 
@@ -388,9 +410,12 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 		int destination_id, int generation, int speed, unsigned long long offset,
 		void *payload, size_t length, union fw_transaction_callback callback,
 		bool with_tstamp, void *callback_data)
+__must_not_hold(&card->transactions.lock)
 {
 	int tlabel;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	t->card = card;
 	t->callback = callback;
 	t->with_tstamp = with_tstamp;
@@ -1152,12 +1177,15 @@ void fw_core_handle_request(struct fw_card *card, struct fw_packet *p)
 EXPORT_SYMBOL(fw_core_handle_request);
 
 void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t = NULL;
 	u32 *data;
 	size_t data_length;
 	int tcode, tlabel, source, rcode;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// Allow the call of struct fw_card_driver.cancel_packet() to wait for any event.
 	might_sleep();
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index dbb5c825a1cc..89db958dea2e 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -92,9 +92,9 @@ struct fw_card {
 	u64 reset_jiffies;
 
 	struct {
-		int current_tlabel;
-		u64 tlabel_mask;
-		struct list_head list;
+		int current_tlabel __guarded_by(&lock);
+		u64 tlabel_mask __guarded_by(&lock);
+		struct list_head list __guarded_by(&lock);
 		spinlock_t lock;
 	} transactions;
 
-- 
2.53.0

