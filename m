Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854974;
	b=r2Hs0U8jmn0YIIpd8MSqH/oo7KN3Vx8afNNEPU6hOQoA5VxNN0Qt2SxqSCWHqIheCuOz
	 EDrZnIc6nB2oKmuIRvc7HOTvsrldZEOuGvObIMOwhJWPcgHStBJY1bG27VidCks2nQiSm
	 Okm9DPs+FRfEyMyhjfAKO1YytMK13d8zUGq/lv0pIbxbXMFo5kkwLMRSKqBOnEPTf0B2Z
	 a3FGd6QISvGZj/3rKecJNipLdMMUmF77FX/nmcZ0oIk6/3nyDbyDlWc9j9iKZPaCkPeVu
	 F/gpQ25IAFGxUQZlj69k0HAfqxFvFxFgWCH1nSi28vJ3MtiO/Z2vBnBkmFjjCsqtG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TF3dG/II9qrYEa2Qmqny+KjCxq+HEK6VEhmgidqtZ9g=;
	b=Q/Ar3GiSRwc1Tb6kl4S55WgTRCD9U1eACCjufMELU0Y3Ga19ahne/knBTqkPFV3VJOcE
	 rZIm3qM0koUx3X7fqtbmwVmzSXeS/+usrAyR6kCPUNhRqJbrXrw0gynlCCoJpEOTmgkOL
	 m8HwMgZJUNYhMmpUk38XYEwQsx6V+bwKmZk3xYnFMxIA08ezQqClEhkOs4DEyFP7ejTf/
	 2MOHcHMKmDIR0Y3qQRQxcbRUlbpkZdNRvvY+2vaL1K60XHmmkWyBuDA0/cHmmMqo27MnH
	 neYbLZ4oZnuumYY5bbZ6pS1iusvI2SseZ5H4LOFmwoEN/9Pbm2fRnM5Zk9qAqC+4Law==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvcXWPBo;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62B606D828
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B62B606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvcXWPBo
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so2537285c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854973; x=1794459773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF3dG/II9qrYEa2Qmqny+KjCxq+HEK6VEhmgidqtZ9g=;
        b=jvcXWPBo4oPsQGKrdvmfRGUxrtNptrfBHwHbDuBYiWoBP/PbA/e0/6vIGvZDg1o4KW
         xBy/ROcm1nDKrffPpwBo2MOmMNxacoz4XahOMl9+Q6QY18NzDS+UGvKiN4hB0MgpuyiE
         omok6Wmkl4sB+merjoI1ah8wVRDErhWLA4ULo4HvU6Z5CK+dhc9AANDHEbCKt9qX3Wnd
         aw76kTwCcRPuODRqwWbp61xLxId0Rc1feEQPMjIQl4uMbqvXTyFXwykSSrZdwBZA7T0x
         B0gkdP+VT2UfpWtb+2l2R34ZWlN+FTT8iDpHsAR53SfKFu1DeolJO+Y5JBjpv8a8PvzN
         +8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854973; x=1794459773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TF3dG/II9qrYEa2Qmqny+KjCxq+HEK6VEhmgidqtZ9g=;
        b=w114m2Al2q37nO+wgmWT3Mg1UfJDsBvyghdKJUo7DDjyxjuxBIeReKK8MDuTwRYsKo
         veDQaAi1aRBbzfzFPyvrbT/lJlH703aH6/78WkVFRMxnzKInGxAILeCzJToNmQE94097
         k+vnnnJT3SQJFvjRKDDDbf8aHyru+TRjcsiR9vkdIDgLRf457PpRBycrUnYSdDlwGk1q
         kDO5nwqCaKsn8aDYz50pUq5SPCR28mJvOpi0sgeXW/ue877bqXUDu2xHNd3mVwSGMFi+
         gUXiSzGBXVOSz11Oy90/3QEYpcfk8YCDsO/l7Hylq3yZ8rjOMlV2MWthixJJ+AZ6J8wr
         99zg==
X-Forwarded-Encrypted: i=1; AKwUvBwg7E7zZi0OKnZKRJIeTQTiXAIceDPWKqMoG+pxRVx/j9BSs0+Ej8+p0N8Q2UMHCL84644vsqMVsHS7/8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lnwFYHUl6KPndH+9iEvB/JTPkzKcjR86A2xeIeXd0eKXjluQK
	zcKPExNeWY/PjKhMwjOjhDgEdxJkFhH3umPfit7eAgROqOMx+BaDvPgE
X-Gm-Gg: AYBFou0VLks58NIqk5Uwwy2xDTQZscOiGl5M+URUHxskMKCuENorUlY4l4+kmNjYjQe
	2cYnUT5mpAYUUGz3Coak1MuZazQD/Gq8/QKTvQGlKSgEyEgH8iA5kdxOUq16bIzyOjpd7phobKT
	gZI13vWUii8IfO05nlmk9W0CwKaTYXKYWbuPh+CdVmUVwRBsE6FfePeHVSK0XhdWGhlUnzXCjGf
	7OIpGTJTrdzFuqr07/gjc1VPk4UCrhSTUnHU2PbGDQDe5+lyEFHAD6B8WnwCEh+rBnoikNmPH5K
	jLDL64gdMgubSaPYw3G8gHU67fY5SSzFLke10CaGhzxSPk9Z+2MZMDqLEjiMJns96m8B4y+nfUn
	VkXZGD93piw5G9sxRMMGuHPKrJRiSU5Y7uwyz+/OIWaCK4n7clCTCWza2QgwhFxAeV4RBpUcYr0
	YV/6c0S/0ZOgMex3l9+MW1VC1syQzvGT/vF76GrAEPkwRmEaZugFyaoEVXMUrWRgc2UbiXeiW1r
	rsVb1hA2dIMmGnxPe8H9jVPHIthq6XUmzksPVKfLOo9U8Vm4Wze6VN+tH133J9vKV6Ugih933xI
	Twg8yPWOVi/wwcc95Wmi++NmLmq+/6F5XrbUCm9YZK4kwb36KqycoxDy7lo6J1RsEtqJKvYQfIA
	=
X-Received: by 2002:a05:7022:3b88:b0:143:54c6:6a5 with SMTP id a92af1059eb24-1ac5c8379a3mr26747424c88.37.1793854973017;
        Wed, 04 Nov 2026 21:02:53 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:52 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 3/4] sctp: fix I-FORWARD-TSN handling of fragments on other streams
Date: Wed,  4 Nov 2026 21:02:24 -0800
Message-Id: <20261105050225.49292-4-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
References: <20261105050225.49292-1-tim.budding@gmail.com>
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

sctp_report_iftsn() incorrectly frees queued I-DATA fragments in two
cases. First, it drops any queued fragments with TSN less than or equal
to the New Cumulative TSN. This prevents reconstruction of messages
still being received on other streams and can fully block an ordered
stream. Second, it calls sctp_intl_abort_pd() if the New Cumulative TSN
equals the highest TSN seen. This check exists for association resets
but can be inadvertently triggered by any I-FORWARD-TSN that arrives
before data with a higher TSN, causing data loss and, if a partial
delivery is in progress on an ordered stream, an aborted association.

Fix the first by freeing fragments from sctp_intl_skip() based on
stream, U bit, and MID instead of TSN. Fix the second by moving the call
to sctp_intl_abort_pd() from sctp_report_iftsn() to the corresponding
reset handlers.

Observed in real use as unexpected message loss. Reproduced on an
unmodified kernel with the sctp_ifwdtsn.sh selftest added later in this
series, which passes with this fix. Reproduction and fix done with AI
assistance.

Fixes: 47b20a88566f ("sctp: implement report_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream.c            |  2 ++
 net/sctp/stream_interleave.c | 32 +++++++++++---------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/net/sctp/stream.c b/net/sctp/stream.c
index e4354d58f20b..d5e71a2027f5 100644
--- a/net/sctp/stream.c
+++ b/net/sctp/stream.c
@@ -749,6 +749,7 @@ struct sctp_chunk *sctp_process_strreset_tsnreq(
 	 */
 	max_tsn_seen = sctp_tsnmap_get_max_tsn_seen(&asoc->peer.tsn_map);
 	asoc->stream.si->report_ftsn(&asoc->ulpq, max_tsn_seen);
+	asoc->stream.si->abort_pd(&asoc->ulpq, GFP_ATOMIC);
 
 	/* G1: Compute an appropriate value for the Receiver's Next TSN -- the
 	 *     TSN that the peer should use to send the next DATA chunk.  The
@@ -1028,6 +1029,7 @@ struct sctp_chunk *sctp_process_strreset_resp(
 			LIST_HEAD(temp);
 
 			asoc->stream.si->report_ftsn(&asoc->ulpq, mtsn);
+			asoc->stream.si->abort_pd(&asoc->ulpq, GFP_ATOMIC);
 
 			sctp_tsnmap_init(&asoc->peer.tsn_map,
 					 SCTP_TSN_MAP_INITIAL,
diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index e239da686f68..1113b3455369 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1203,28 +1203,21 @@ static void sctp_report_fwdtsn(struct sctp_ulpq *ulpq, __u32 ftsn)
 	sctp_ulpq_abort_pd(ulpq, GFP_ATOMIC);
 }
 
-static void sctp_intl_reasm_flushtsn(struct sctp_ulpq *ulpq, __u32 ftsn)
+static void sctp_intl_reasm_flush_mid(struct sk_buff_head *reasm, __u16 sid,
+				      __u32 mid)
 {
 	struct sk_buff *pos, *tmp;
 
-	skb_queue_walk_safe(&ulpq->reasm, pos, tmp) {
+	skb_queue_walk_safe(reasm, pos, tmp) {
 		struct sctp_ulpevent *event = sctp_skb2event(pos);
-		__u32 tsn = event->tsn;
 
-		if (TSN_lte(tsn, ftsn)) {
-			__skb_unlink(pos, &ulpq->reasm);
-			sctp_ulpevent_free(event);
-		}
-	}
-
-	skb_queue_walk_safe(&ulpq->reasm_uo, pos, tmp) {
-		struct sctp_ulpevent *event = sctp_skb2event(pos);
-		__u32 tsn = event->tsn;
+		if (event->stream < sid)
+			continue;
+		if (event->stream > sid || MID_lt(mid, event->mid))
+			break;
 
-		if (TSN_lte(tsn, ftsn)) {
-			__skb_unlink(pos, &ulpq->reasm_uo);
-			sctp_ulpevent_free(event);
-		}
+		__skb_unlink(pos, reasm);
+		sctp_ulpevent_free(event);
 	}
 }
 
@@ -1232,11 +1225,6 @@ static void sctp_report_iftsn(struct sctp_ulpq *ulpq, __u32 ftsn)
 {
 	/* Move the Cumulattive TSN Ack ahead. */
 	sctp_tsnmap_skip(&ulpq->asoc->peer.tsn_map, ftsn);
-	/* purge the fragmentation queue */
-	sctp_intl_reasm_flushtsn(ulpq, ftsn);
-	/* abort only when it's for all data */
-	if (ftsn == sctp_tsnmap_get_max_tsn_seen(&ulpq->asoc->peer.tsn_map))
-		sctp_intl_abort_pd(ulpq, GFP_ATOMIC);
 }
 
 static void sctp_handle_fwdtsn(struct sctp_ulpq *ulpq, struct sctp_chunk *chunk)
@@ -1260,6 +1248,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 			sctp_intl_stream_abort_pd(ulpq, sid, sin->mid_uo, 0x1,
 						  GFP_ATOMIC);
 		}
+		sctp_intl_reasm_flush_mid(&ulpq->reasm_uo, sid, mid);
 		return;
 	}
 
@@ -1271,6 +1260,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 		sctp_intl_stream_abort_pd(ulpq, sid, sin->mid, 0x0, GFP_ATOMIC);
 	}
 
+	sctp_intl_reasm_flush_mid(&ulpq->reasm, sid, mid);
 	sctp_mid_skip(stream, in, sid, mid);
 
 	sctp_intl_reap_ordered(ulpq, sid);
-- 
2.34.1

