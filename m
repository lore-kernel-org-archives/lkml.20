Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680185;
	b=jOyEGoB5uFH/DOfFIuRDSrWuTBKg+mcOV6tDGHb12tdGTAbwbM1mi5qgMMDeu45QpD7t
	 W4v445QLGlONlOuYjrZHWjRR0rNca/kBXd/dbk+qXeSt/nUsXMwjUx+7iiyOd2on6zIBE
	 /Og+lSqeHyYpVrVdYfF2MX2S5Jy5wVnNqxZ0s8GvCjMIqxx1/KkfnQXhBbPYvkF2uZlDs
	 ion6v4ChJNC+5SqLlHqxcqT4k73HHMqzBvH7756YXAhg3LVB2oZj800Sb2XF/IXeMehp/
	 qI/Ef7lLtuQgVvtVd5m/0Rlb6VQftwNkaYCMSd0ixQXzF+Z74fq5BwYposHmHpBmyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680185;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=4ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=;
	b=QPHTw1Tr8ygc1RLjh/Wq9vBc5d5ynoBMaGk6tYpXWt7u9Vpc+llbFsVJEi3+i6+MKzih
	 ANjZbHyNeMOrDSKWAVbSb+BPeEQ3ltrXQabqjf8hCyjujmcytbmh55sJcwOVH7Hzm6bYN
	 rgFT/bZSQa52YK1KeLjw1+V8rFL3T0nDpVWYk5OVNeITFL1jlb8GGyDhERtCrMIYHt83S
	 3DbYBleUCXX+SXBdJn7phIw5oT9O5vAojmDUzFHq0z2GgAMEUSDX8cwvtF6ghIJjM13p/
	 AdTxZLDFXpA+QFUTOK+K50e+hn07mq5SpYHSreskGVaBjafRKYSEd8WxWC9MbrWrDNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=m9We++mY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oW1ycDrE;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595A606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5595A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=m9We++mY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oW1ycDrE
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 340137A018B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 02 Nov 2026 23:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680183; x=
	1793766583; bh=4ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=; b=m
	9We++mYcwbfdO8UHYliWdNoIlqxQIMiy2nFAP2uwB0z6Wv6JkR0s1wMOgdz9ZXQs
	ijp9WBJxMha5DDvWK+N2b9MXw0b1jxcGYdnO/DkDWoJEHPxOHrDhE+0B4oUpi9sJ
	rrrTShJb6nY50GAE7CQCHsMvtEH330KdThSwrncyEoYoNNLKZSZuUjjjPsMjtmH0
	94Z/S/dTnAJ9Vp4YoyuccCXPJpWYS6Hn1Zu7ku5Nb3RDX7sZIQ5zwIL8Dc+aZ5f5
	lqdfwc9QD9l5bm0iulqtNtPvsGHolp2HKm+L+3Q+yit0pRoJ2KLw/rN1/LjGH7vT
	jJlhJHbwxEADFL0DMhOMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680183; x=1793766583; bh=4
	ZJ80wecbBxq60oEk8qDq4iPX/zE1zlAQta/IozJtn0=; b=oW1ycDrE4le0uVczv
	2puU9TSMYtK09jjHGPkhKeUEVfTioIPaF+QwAgbzsQg3TAhUeZIP2+fPTMBgvjdq
	BUKHoUaIKbWKdGqaQMbb9E0qpvUvRAHNGMAndos9vomLmvrFzn6ZKiXlR60qb35I
	uLPkHq1JH9gGUAugxkzC76qq5DNVtliMYjJu/wOxofo4V/RVQYUQOOWSxwi92oVy
	s/PRNMOHKgIvxvzAaTmCOvDT1XVs89QdooEYXNoNDeLacukqKZAdUFwDQOi50yZF
	CgTNRpyI68I0vpQYkyiaP4zWOOYwzc3VU7ZrajN2Pz4he4sUDN+jx4QAy1u42Fue
	n9mfQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680183; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BwWtDPF1rUmjPPxMYkoui6UC9h3uIej/OHDBQ/SDXof3xJt
	8GDQXv2BB7QPKy6AmBlmLKS+Y8ptVFBWg+ySVo5BNI4ql5w7ssAzX+SltBGu4kYg
	l0i4TRXYfXl2YeK6HSG3hb8I+SLBKIAZaNvDY7bXcBwKma+2CH1AwF2y9bqLS5Wq
	HgYzt4HaafKNnN6DYiqXUziVNk1zdRMs3TUjZApe3tFEgfxwWHmaJmxmabnyQvuH
	eJYjBjuSD21RMAVaxYdqcy28K2piYi1ucdhJm6lD5/vQpIhpZ3Fojsl40FkiywQR
	lR7dGk7RM4RjwNLbjriueovIJj81YGJ2MCv4JwQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AFJ13fWbCb51mkxP5oxVaG+9nYNtHCzN0IdZVZYu2TE=:a5sbIlLKP3k0ed2XgkIlGE93zUA69C50kmzebp/nl54=;
X-ME-Sender: <xms:N2Ppakfq6w5yc5ZpbZbPWAcqyAb3tffSpuoANZlSivp8WaHFEWBBwA>
    <xme:N2PpakLTPAIPWi6YtXeirwWqas2-ODS0QNfVHgXKMUNz1eMndUKDFqlzBjjTMeyQr
    41qc4LS-cbJ8xIhRE1jVCUKf5n0hW6ClnllOqxdJyzHKeln8Qx6UIq_>
X-ME-Received: <xmr:N2PpatG8UYAa5Xo0xRYM7cRu9IW_3enJPRAkKE3I83SE8EFxdvDexeIRfeXPtf27ZB9HPO26hDQssazGotrvTyp3cvK5DIH1NQV4ppXJ5oZa>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOqd
    2K4tFwILFjNTpApy6JX0+hIwhiC1xj09SzwjfJjsatdaq2dJjbegyvnPXTz6nmYlbOcr5P
    Sz9bw6ffMuhE6j/8MSF/plfOBI+70pFbBs/EwXWu2K4/CSJ9aW+xkeSx9UTUOJHloxZls7
    U1tJmYU4rOr37bW2803P5Kwmthg4Yg1SEqUZjX45Z55ofzDWbN2YiviCX7+lW7T4N5BK+L
    zmKBlRpHggEdTVrXeCOL6UkRwKK8nk0vIFd2oQdQ6RMdFL9YNrG6BKOZ/5g3Wjw2ML8gng
    BLg0N+jjB5RgAwM1GUC8Rog4g946KRqWDCqVJaixSrLSgU4E904bvXpF+4sA
X-ME-Proxy: <xmx:N2PpamoWtf5A3d-xRJfDlxJ2SK_mAVtCJq2-ZWnY-hfG067ENfbWcg>
    <xmx:N2PpauR5ipYMH61pubrSme_AWrUnmdL827S9V_Hz_ZKScd0iJ9H7og>
    <xmx:N2PparO1ekoEPK1LnreKf4ry1I6cNlzZD2O0XAyMJoqUQj3IxEK5yA>
    <xmx:N2PpapM3AOVRyeQwNzd2VaJrcsmEqvUOINnAaus4fhdPLBtqO-Q4Bw>
    <xmx:N2Ppalw4iUe1MxQ_oot-Ib6QPAYP3VHUopQI92F2mVQ5PPyO43TDmon8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:42 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] firewire: core: add context analysis annotations for address handler
Date: Tue,  3 Nov 2026 13:29:32 +0900
Message-ID: <20261103042939.1231773-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address handler list is protected by a spinlock when handlers are
added to or removed from the list, while readers traverse the list within
RCU read-side critical sections.

Use both the spinlock and RCU read-side lock annotations to describe the
synchronization requirements for accessing the list. This allows
compiler-based context analysis to verify that the list is accessed under
the appropriate synchronization context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 0ebe70a4d440..8d7e0f03aa6a 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -590,12 +590,18 @@ void fw_send_phy_config(struct fw_card *card,
 	wait_for_completion_timeout(&phy_config_done, timeout);
 }
 
+static DEFINE_SPINLOCK(address_handler_list_lock);
+static __guarded_by(RCU, &address_handler_list_lock) LIST_HEAD(address_handler_list);
+
 static struct fw_address_handler *lookup_overlapping_address_handler(
 	struct list_head *list, unsigned long long offset, size_t length)
+__must_hold(address_handler_list_lock)
 {
 	struct fw_address_handler *handler;
 
-	list_for_each_entry_rcu(handler, list, link) {
+	lockdep_assert_held(&address_handler_list_lock);
+
+	list_for_each_entry(handler, list, link) {
 		if (handler->offset < offset + length &&
 		    offset < handler->offset + handler->length)
 			return handler;
@@ -613,6 +619,7 @@ static bool is_enclosing_handler(struct fw_address_handler *handler,
 
 static struct fw_address_handler *lookup_enclosing_address_handler(
 	struct list_head *list, unsigned long long offset, size_t length)
+__must_hold_shared(RCU)
 {
 	struct fw_address_handler *handler;
 
@@ -624,9 +631,6 @@ static struct fw_address_handler *lookup_enclosing_address_handler(
 	return NULL;
 }
 
-static DEFINE_SPINLOCK(address_handler_list_lock);
-static LIST_HEAD(address_handler_list);
-
 /**
  * var fw_high_memory_region - An address range for high memory.
  *
-- 
2.53.0

