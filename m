Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172BF4BD7B2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547869; cv=none; b=ihMUstZo8AIVxIN0aXun04ro6VEn8c9xIheEzjzmaBItyjfIhUWxTViURVoNYrI62STaMnwEf89hQnExaSRkdCulpqk6W9vl9BNuvGFJJOxV6fscGbJd1PJRfwNFBw5g+5ADG5Xma5NUzwzX0YSpSv2RHJT+2x+0Lbo/LSOR+LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547869; c=relaxed/simple;
	bh=5STEbl6rfkVtlic908wN1mxZAtvzMyzUzkcV4f6troY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AI5ZkoMtUAYBOveVHul0jnV5df0Pb4d0IRc0mk/6TSRySwQuLezmN6lFNU/t50hMh/ckXhrGNjHr2jZ80VO39IWcOH2eMZMW4euMzybbgWLimXlqq2E+3S0Oym93j7Nr1WuFaBQ1tsgcTxRqWqgyFaaYVVxYZz7ZxqN5XEvwgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=U4vIsCCN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=w0LIREUD; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="U4vIsCCN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w0LIREUD"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B910C14000CA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:10:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 08:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791547855; x=
	1791634255; bh=VlfzuFb78jVSUgRvucTzFULHUpSYtPprwEqDm6o60zc=; b=U
	4vIsCCN8avp5d9e0uIhTdZAEAt+pLT624RWB5n+Ceh7YbJgIE6nHqGXs6E48usLL
	Ny8nmONY+P0KW/kJnv1tLmggCH+rb0a3YEqzXAv9i7liyxxeSTQzjW45hCySwqiU
	98jYw5EAhLJ+fjNQZ/m+qN/xYZ9tOLvEOOJiEePMNCxLZkTOthfvokgzmbSGpQBj
	HXmLYtJnZyRvWB1GjtYu0uAsMvQ0BoOCQnyf9x1Idw+4e9KxRPjrJnau7k1jwkNe
	IE1a4/D6xyMmvCRPSfvS2P4rewOXUxkAvH8US9eQoV96fKVz3T+98FkAQ8m9hyv2
	OMlg3p26PYQuKW1NflUEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791547855; x=1791634255; bh=V
	lfzuFb78jVSUgRvucTzFULHUpSYtPprwEqDm6o60zc=; b=w0LIREUDsfRho2Xr6
	i4sZ61VXoZBxloIr04aNQ9WFh2Ins0w8gkvb93oithZHJIr1ripWnYCbSMHDmv5C
	DNydKyFEM3JN3khpewdvhiTetuVz7ipxRT0aJ9fE1eSJ/n+Dp8GyeEAGmYnnZ7OY
	f9v6yQILby8wiZtBOhDUAfcky2bDXtDHrX16VQOrKPjYEBUraoyZsELknT94qDN5
	uo9wgy8c5MD4d4VVWcMqbOAMVdlt1t4Jo5w+yuk0lPqYie93h3qPJMFcf1AE5twF
	OjtILd4UB/p8Hk25QMffmZ/gXjRWEBxK1vQAn+MsA1TY2uDhLRzAfpN9g7EDxZC3
	JGpkg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791547855; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:b7TnAjsrko297B6Yi+k3Ly3YoxxULqdYtefA8NewtHYc1T2
	txerW3YATE/VsNZxQo4hFFFjtiOPMceFXvKv0NDHUXA+gEce5IVGEq+CXHBWTt+P
	9VxLFyWZ6iQ+0fC00mztCK1Sk6Iko+JAPLDsrj5Jpgui57cUBpfiU6cUK3RL1vMc
	ETKv943DlryCk8wc7CpScyTg106uFr6dW6hUYV9BXLQm6eM+WuRzlnVp3ACpwCQv
	kXaa3SDYMUHmlJYeP3JjaQOvY6PQYJnnEod2TtI0W1d+BpFVCe9H0HQAxpnkCYLn
	fkpsHTWw8jd4Tfbqh7E1Cy36XQ6tDlFSbz37u3g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:HPEnkqcXeU3EJniKrgTgajyLnMJ4aOstj8zJjC4vqRY=:5STEbl6rfkVtlic908wN1mxZAtvzMyzUzkcV4f6troY=;
X-ME-Sender: <xms:z9nIajE1yLDVNGIVQl1PU2D7fIyqSh3CyQDaYpBYkq3x8b7KPuT0tw>
    <xme:z9nIauT0DtRN--YDu4KauCco23XYUcvbUOv9jU5uN3nrUBGM1HdD3rbTRMv6PF-7v
    s83_Bqk4BN43ds8pzTObQjrrLqj_qRBRdrNQK12doVNXJ500p-NxQ>
X-ME-Received: <xmr:z9nIasuaWR431tohWy3HRtA-zo2uziKrIA_-cXJEkzO7qJW2lH_rrhzKGaswiso35R9_CVDzVJwx3DwTQZmw1S2atWODlbW-bJJiUYNzdBCPhg>
X-ME-Proxy-Cause: dmFkZTEebFEt+pFrP9koh+qFAZ0KFxcdRzYXR8D5//vpTuK4xUtd7uNM16Xh6kh4X+VLKf
    3KZsS0L+nnqf77o9X/1Ewtl2JmxmA2WTTBVlDyew2mwxgoE8jdNIO/UGqgVZ5lP0sPzu5e
    DbozLadpVApv65vXrE5zskhqqIgaoR1M6k3wdcSczgsOVHbDF3x4xzN1TEJ2zaVroB4qii
    63DxsZI/GYx0hq1DmoL13O8njYH1HlaSVb43jFWlg4HtP0sqOO+cEAaTvm8o3t3LM9W1zF
    7GHBEWwMxkAHSY82lr09+EGLevqCE+dCO4p5nfIncXrfWvxQ8KPMlWwOAyobRGHaOd4Wpq
    3Q171rQ7HhF16nZc4qBTBIlDuJ3HwNxNran+kYz2rZ2Wqpn/IAAP//gw6Lm9IZT8twuRwJ
    N48+NDh2tyG4G3RR5ShXQp1TqsuNM4Tztw5oqfvigXcsmN3lh73tld8ps1G2850WcfNcUR
    sLkXQYXi0wr6anDoScgeVbspFmM2rPtuLnyqsmPvgHuuLwxnFrHUutozhYqLJojQot9H4E
    RZFK20hBs6N0wkLYl2s8GlHiuzP2VDxqaRYS9HXDbRuiLXnHqc33xKb63MqLLnTpZo7p3A
    EqV0GfNjdEg3Pec7TdLbs1yH94UIfjIg7o4aVkOSabI5d3U4yhtG5eqDCNiA
X-ME-Proxy: <xmx:z9nIatw19cexxzgG3D8aA6oR7XAwfia7Fn1PTdipTG-Qo7mll0Opaw>
    <xmx:z9nIam5JMLxVi2pW5c2evdu4ZCVKu4YzVQcaX-hxX4OwadRJYlLb6Q>
    <xmx:z9nIanUPwknxPzUYY7Tm6t_LBBoBx262-oyUjh3w9ucmJdCuaAHoEg>
    <xmx:z9nIai273asIFNFrc-IhGQF0WWYaF-dL36TvqrufE7HzgDX9NWpptw>
    <xmx:z9nIahZelOMuXnpg5sdJvcW3U3EI-N948pZ5P6woQHyJppGkQb0-1EpS>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:10:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] firewire: core: use sparse annotations and lockdep checks for transaction lock
Date: Fri,  9 Oct 2026 21:10:45 +0900
Message-ID: <20261009121048.282982-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
References: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects the list of pending transactions and the transaction
label.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index be8b2b7b887f..2692e875b00a 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -38,16 +38,21 @@
 
 /* returns 0 if the split timeout handler is already running */
 static int try_cancel_split_timeout(struct fw_transaction *t)
+__must_hold(&t->card->transactions.lock)
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
@@ -65,10 +70,13 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 
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
@@ -113,7 +121,10 @@ void fw_cancel_pending_transactions(struct fw_card *card)
  * pending transaction.
  */
 int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
+__must_not_hold(&card->transactions.lock)
 {
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// Allow the call of struct fw_card_driver.cancel_packet() to wait for any event.
 	might_sleep();
 
@@ -161,10 +172,13 @@ static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 res
 }
 
 static void split_transaction_timeout_callback(struct timer_list *timer)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t = timer_container_of(t, timer, split_timeout_timer);
 	struct fw_card *card = t->card;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (list_empty(&t->link))
 			return;
@@ -174,9 +188,11 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 	schedule_error_callback(t, RCODE_CANCELLED, t->split_timeout_cycle);
 }
 
-// card->transactions.lock should be acquired in advance for the linked list.
 static void start_split_transaction_timeout(struct fw_transaction *t, unsigned int delta)
+__must_hold(&t->card->transactions.lock)
 {
+	lockdep_assert_held(&t->card->transactions.lock);
+
 	if (list_empty(&t->link) || WARN_ON(t->is_split_transaction))
 		return;
 
@@ -189,10 +205,13 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
 					      packet->speed, status, packet->timestamp);
 
@@ -388,9 +407,12 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
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
@@ -1152,12 +1174,15 @@ void fw_core_handle_request(struct fw_card *card, struct fw_packet *p)
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
 
-- 
2.53.0

