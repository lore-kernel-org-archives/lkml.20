Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527200;
	b=z1Ad4buJuq8z9+Z2m7dc2KxJJhkyARvH82e51hXN3bcfWW4HI5+Wb/xmqvb5B3dYKuYV
	 aIekO9tf1189fY96p1B2diRmXfpZmxPsMYTapA/t1yzL+KIgdQE+CJn8IQ5Bbvv64D/Dx
	 HmLF3hVD+6UQsCIc02z4YJpMGx7BnrTBsQ1SNkI/oB6pnqsXk2xEHySr3pinSimSsHit4
	 YholeyMrnjO2a5rJ+jbVLJdI6uJxbkuuoQGr3mmQKVp4jyPjYy55LC3s3RLcvX/SfTe7A
	 cQzwH3+2ybgNHjp6wnrkpQYLwgrDFozM0bbcpO4V7rSMgNSGYxGJneaDo5rjus/V2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527200;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Qo9Ppo5q3VnHIO8t+aXj5yvwX/4F+oOdxjtXzdWzdMc=;
	b=iLjmzMuHHwPmtN0BU1xATUKFnPpHBVy8bX2aBaAPy6aZFfwpGDPQ8qlGy6kBtu86y8nY
	 fOu+/xPNYwxm/Klww8O2S4nTdvDcpn/ocl8AYT3yRM0V84phGUzKwmigTZwxzOQqlyX3H
	 Gg2YGshaWfQr4QgOAUI/tguxo/iNwOVPV1rlcUfEYqui2IIjqu19CYz2pH19fchcMfz4b
	 OhVAlS+I7VS2za2SQ7TT93+Amf6DWN/P5u0q9UfToB2OvJhDKni22o9tKrW5Sg8tcS7Te
	 PJRjn3egIcT7tyQXO9tBdGwltvHnOMFwjMKAZONFLsDaYATvMBrH+7vPumNowma0biA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="EC067VQ/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C6606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA1C6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EC067VQ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792527198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo9Ppo5q3VnHIO8t+aXj5yvwX/4F+oOdxjtXzdWzdMc=;
	b=EC067VQ/5bqeaxkQ8rm43FqNJVnh0wSqGIxIuwdGIABb5IHlok0qHfpcSHST/cqbCdat7n
	xyR4ukZw1t6HvtStwxm/inNnB/dKe7NWhugr2ECVxCq5Fl8FKTdzkkEzw89z6IJXB1HxB9
	ToVHLdFCP0yoL2sgDgAmY3xOn+xtf84=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-274-GzR7d1bVMoONPaFrF8I47A-1; Tue,
 20 Oct 2026 20:13:15 +0000
X-MC-Unique: GzR7d1bVMoONPaFrF8I47A-1
X-Mimecast-MFC-AGG-ID: GzR7d1bVMoONPaFrF8I47A_1792527193
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A4B0194510D;
	Tue, 20 Oct 2026 20:13:13 +0000 (UTC)
Received: from warthog.com (unknown [10.44.48.29])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 948B5195608B;
	Tue, 20 Oct 2026 20:13:09 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeffrey Altman <jaltman@auristor.com>
Subject: [PATCH net v2 1/3] rxrpc: Fix the comments saying RFC8958 to be RFC8985
Date: Tue, 20 Oct 2026 21:12:52 +0100
Message-ID: <20261020201258.290827-2-dhowells@redhat.com>
In-Reply-To: <20261020201258.290827-1-dhowells@redhat.com>
References: <20261020201258.290827-1-dhowells@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Fix the comments saying RFC8958 to be RFC8985 - ie. The RACK-TLP Loss
Detection Algorithm for TCP.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeffrey Altman <jaltman@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
---
 net/rxrpc/ar-internal.h |  2 +-
 net/rxrpc/input_rack.c  | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..f0c8cbcc5dd5 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1264,7 +1264,7 @@ void rxrpc_tlp_send_probe(struct rxrpc_call *call);
 void rxrpc_tlp_process_ack(struct rxrpc_call *call, struct rxrpc_ack_summary *summary);
 void rxrpc_rack_timer_expired(struct rxrpc_call *call, ktime_t overran_by);
 
-/* Initialise TLP state [RFC8958 7.1]. */
+/* Initialise TLP state [RFC8985 7.1]. */
 static inline void rxrpc_tlp_init(struct rxrpc_call *call)
 {
 	call->tlp_serial = 0;
diff --git a/net/rxrpc/input_rack.c b/net/rxrpc/input_rack.c
index 9eb109ffba56..072e1d9ecb2e 100644
--- a/net/rxrpc/input_rack.c
+++ b/net/rxrpc/input_rack.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* RACK-TLP [RFC8958] Implementation
+/* RACK-TLP [RFC8985] Implementation
  *
  * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
@@ -57,7 +57,7 @@ static unsigned long rxrpc_tq_nacks(const struct rxrpc_txqueue *tq)
 
 /*
  * Update the RACK state for the most recently sent packet that has been
- * delivered [RFC8958 6.2 Step 2].
+ * delivered [RFC8985 6.2 Step 2].
  */
 static void rxrpc_rack_update(struct rxrpc_call *call,
 			      struct rxrpc_ack_summary *summary,
@@ -98,7 +98,7 @@ static void rxrpc_rack_update(struct rxrpc_call *call,
 }
 
 /*
- * Detect data segment reordering [RFC8958 6.2 Step 3].
+ * Detect data segment reordering [RFC8985 6.2 Step 3].
  */
 static void rxrpc_rack_detect_reordering(struct rxrpc_call *call,
 					 struct rxrpc_ack_summary *summary,
@@ -143,7 +143,7 @@ void rxrpc_input_rack(struct rxrpc_call *call,
 }
 
 /*
- * Update the reordering window [RFC8958 6.2 Step 4].  Returns the updated
+ * Update the reordering window [RFC8985 6.2 Step 4].  Returns the updated
  * duration of the reordering window.
  *
  * Note that the Rx protocol doesn't have a 'DSACK option' per se, but ACKs can
@@ -192,7 +192,7 @@ static ktime_t rxrpc_rack_update_reo_wnd(struct rxrpc_call *call,
 }
 
 /*
- * Detect losses [RFC8958 6.2 Step 5].
+ * Detect losses [RFC8985 6.2 Step 5].
  */
 static ktime_t rxrpc_rack_detect_loss(struct rxrpc_call *call,
 				      struct rxrpc_ack_summary *summary)
@@ -239,7 +239,7 @@ static ktime_t rxrpc_rack_detect_loss(struct rxrpc_call *call,
 }
 
 /*
- * Detect losses and set a timer to retry the detection [RFC8958 6.2 Step 5].
+ * Detect losses and set a timer to retry the detection [RFC8985 6.2 Step 5].
  */
 void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc_call *call,
 					  struct rxrpc_ack_summary *summary)
@@ -255,7 +255,7 @@ void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc_call *call,
 }
 
 /*
- * Handle RACK-TLP RTO expiration [RFC8958 6.3].
+ * Handle RACK-TLP RTO expiration [RFC8985 6.3].
  */
 static void rxrpc_rack_mark_losses_on_rto(struct rxrpc_call *call)
 {
@@ -285,7 +285,7 @@ static void rxrpc_rack_mark_losses_on_rto(struct rxrpc_call *call)
 }
 
 /*
- * Calculate the TLP loss probe timeout (PTO) [RFC8958 7.2].
+ * Calculate the TLP loss probe timeout (PTO) [RFC8985 7.2].
  */
 ktime_t rxrpc_tlp_calc_pto(struct rxrpc_call *call, ktime_t now)
 {
@@ -309,7 +309,7 @@ ktime_t rxrpc_tlp_calc_pto(struct rxrpc_call *call, ktime_t now)
 }
 
 /*
- * Send a TLP loss probe on PTO expiration [RFC8958 7.3].
+ * Send a TLP loss probe on PTO expiration [RFC8985 7.3].
  */
 void rxrpc_tlp_send_probe(struct rxrpc_call *call)
 {
@@ -356,7 +356,7 @@ void rxrpc_tlp_send_probe(struct rxrpc_call *call)
 }
 
 /*
- * Detect losses using the ACK of a TLP loss probe [RFC8958 7.4].
+ * Detect losses using the ACK of a TLP loss probe [RFC8985 7.4].
  */
 void rxrpc_tlp_process_ack(struct rxrpc_call *call, struct rxrpc_ack_summary *summary)
 {

