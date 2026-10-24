Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843635;
	b=XiEfEVo/L+ta6obaGud0tFw8VBTr53JrsxHToGRv3KZrGvRn0IewyljQkF2sJ7iGUIlW
	 iVqy+4+Xsoi3hvi7bpiwGTaPNQpBjpySek9uS+cbD/WE6f17Ese44Z23HOJOB/eBC8bKN
	 1aEZYDpztjEIU3nouepIND5r/XzxXW43URz3zntQQO7PY53pZtqV/3ouBXpUtEWVM5BlX
	 G8Fd2aQ5zofCaEcskJoIXOoaEI0rK5Rj9M5n6dnG+94xJwhTK5WWsud+7SbwNrPpcrsUt
	 PosA6uZeU/IwHmEMlGOzE1IC2M9LFhbuGa1XBreVP9+5TTEFBjrgRkOfSEb+PQzF5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zLNM9fxN8Q0mYWX/OgajYSxuCiy7NImfGuJpx0sAOuU=;
	b=AUGacVjqzDaEK3v4Iv6gGto1/Ke8Z/nnwMzP3VXUQ5/R2n3k0WiaXp1jsLQceq+2G6oK
	 KytT37au1DuOO5QKkQ7QSTW4+tgSeYHr8iz7NlGvHlnX40zV09dBHg7dtlqxRRUVDjkIK
	 tjSyoJMX1J+uwbOA9WqrPtYYIzUqIKPQfOfe5VHC4OmFFOsiMRRekBhpHMPctwwzY5d9n
	 HfOdbxXUfZW3MI+QqvmdXwl1f+w73gWYxrWellalD3w9TvJxXfcZwl4ETxs7jGp+jKkCx
	 h9Ok4mW/NEITyIxYk/zw4WuIA+Q0xcYw0wDQkd/AV5FMZcyM9vmEA1dD4cQj3rMq0yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbkjwaQH;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3D606A335
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB3D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbkjwaQH
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so320737eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843628; x=1793448428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLNM9fxN8Q0mYWX/OgajYSxuCiy7NImfGuJpx0sAOuU=;
        b=jbkjwaQHOM9PvR1//nhAnjt8kj/2TksQ4yOsFvy5FOP0dbrbBcz3Za7a7PKHXZYz36
         sZS1qtulphs4jCdlYqqjek2qB+1vZoV295ubms5R1QFlKO9i5SOOdwRgoOCqdJ9yQ7Wy
         dpB62kKcPiBHBqfOH/T2NltriOyz6mN+AW7DwZo64Jqh2VbJDp+FpLwJRHrOo5O8kf0p
         zPTNtlOkmz0p27ORnExmYq3J0kTMWFAwJBF1D88NpYt4zj/8VcEH8VG4meK23sNTM7Ft
         JvtEWROLMn7nXRvCnQ8gaLABalcEMonDfO/0KQGgHgHOWPSl4ChKdJBIz7VemKTH5n4A
         7xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843628; x=1793448428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLNM9fxN8Q0mYWX/OgajYSxuCiy7NImfGuJpx0sAOuU=;
        b=HxgNjeKzl8CMQ/6aSEIh2OqNVCu6yLsCaMas1QfsNwGFhr3JICsGho0GXsbUeTUkDT
         tHIdlWckxRq7dBZrXCIal8wXConZxZtIXKsWZEMrBuEOQlndg8X9CFqFjZUmDTZkinw6
         gTXfr/hxGslesrE1icA5YV+VeNheolaLoiWjwkzI61tsA1PRIMEnx4xHuxnPzaiaZ10p
         RfTjw56S61Xra2Cg9AaFc2TbQ/jvF/uNSo+PGZgf1LPIRsCF9pClflF9vkLuQpKMYTC1
         G5mhorSYg/+Nd4HXKGPOTB2bSWxM6HuJwfKGvB1bcoRfH3ViMqEPE8TD10vnSXg35Evj
         PssQ==
X-Forwarded-Encrypted: i=1; AKwUvBx61PbxZsKDOgyCfVyQCaaiIMgpwx6cxmNBVn5JcMnhCYbNuocE4j4ZnIyqFZq5b9G/49k+sckjxOncNHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7ER4UGhpB1ArSQ1uBYNOXT1gfNOCVdrca7m3XDmrBKYlAecGE
	eXY2ENptZ/T0c0VVQdyPJkLM/wCzBzlqD1HBD+rSctcfYLhtKHv0Z8u8
X-Gm-Gg: AYBFou1i5BYDFF63v1LSrnPzErfKhTbD7IDVsqvtITwpq8p+HxoVuCOjR1HmqcMb9dx
	I7Nk8DYO6dBAGSkBElHcbaPPg8bUSS3xsbf0Oa0jtsQ9cvs68iUpc6GJ9sJ9YmS+oLOe+mv9vPe
	TEb9lLcxXNKjh+t5qjzVVc3KGXXrntwXYHWEmS/i3z7VeV5JFQ7Y1iLnviUi5H9NR6xOWVfliyZ
	azPUTEggALXyCsTOPIxUm9dvsDNR1CGIn+LyAYyh+pQ9zV9tomd+l1ZVCSNIeaeFYf2C6/AD4mI
	nZppbrfFJxJOLyQX46Pz2lL3RSgPTlPJWrlfwSOWsezEcj1eMgk+HA7GE9XtmLnfgNzlB2tyhD1
	C1b9Ch5MpZOy6cjyo+2tyR3O+ALBbETidL2zttA0cTbVc0C9Bv3Fy0n5mFR3ALACRhKZju4ta7S
	G5E/+wG1K+vS8Jw1CpMeB/pTVA7RC2gE8SOLrtlT8/rHez5lkThfDiEv1oP65uujeMR31pMch9m
	JF5ttG8bE67Mrs2XnCoA10wNksP2Gj59Z2FCMPVrs1EVcs/rMNHvL2C0MFxLbPVnvE6Xe+f9xzU
	uMlwjXSi1ZX6sQS+i98luWe0RA==
X-Received: by 2002:a05:7301:4205:b0:369:d793:328d with SMTP id 5a478bee46e88-369e84bd8b1mr2964461eec.31.1792843628051;
        Sat, 24 Oct 2026 05:07:08 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm8120722eec.15.2026.10.24.05.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:07:07 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 3/4] sctp: don't treat an I-FORWARD-TSN as an association reset
Date: Sat, 24 Oct 2026 05:06:26 -0700
Message-Id: <20261024120627.837568-4-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024120627.837568-1-tim.budding@gmail.com>
References: <20261024120627.837568-1-tim.budding@gmail.com>
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

sctp_report_iftsn() handles both a received I-FORWARD-TSN and the SSN/TSN
reset request and response of RFC 6525, where all queued data has to be
discarded. It tells them apart by checking whether the New Cumulative
TSN equals the highest TSN seen, and if so calls sctp_intl_abort_pd(),
which aborts partial delivery on every stream, skips the MIDs being
partially delivered and flushes the whole ulpq.

However, sctp_tsnmap_skip() runs first and raises the highest TSN seen
to the New Cumulative TSN, so the check is also true for any
I-FORWARD-TSN that arrives before data with a higher TSN, e.g. when the
abandoned message was the last one sent, or after a burst of loss. All
partially received messages on all streams are then dropped. A stream
that was in partial delivery also has its MID skipped, so the next
fragment of that message fails sctp_validate_idata() as stale, and the
association is aborted with a protocol violation.

Drop the check from sctp_report_iftsn() and have the reset paths call
abort_pd() explicitly. For DATA chunks this changes nothing, as
sctp_report_fwdtsn() already aborts partial delivery and
sctp_ulpq_abort_pd() returns early when none is in progress. For I-DATA
the reset paths still discard everything as before.

This relies on the previous patch, which makes sctp_intl_skip() abort an
unordered partial delivery of the skipped message; the check removed
here used to do that at the leading edge.

Found by an AI assistant while working on the first patch in this
series. Reproduced on an unmodified kernel with the leading_edge test of
the sctp_ifwdtsn.sh selftest added later in this series, which passes
with this fix. Its reset test checks that an SSN/TSN association reset
still works with interleaving.

Fixes: 47b20a88566f ("sctp: implement report_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream.c            | 2 ++
 net/sctp/stream_interleave.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

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
index 77fe0db5ff77..f49b534ff78f 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1225,9 +1225,6 @@ static void sctp_report_iftsn(struct sctp_ulpq *ulpq, __u32 ftsn)
 {
 	/* Move the Cumulattive TSN Ack ahead. */
 	sctp_tsnmap_skip(&ulpq->asoc->peer.tsn_map, ftsn);
-	/* abort only when it's for all data */
-	if (ftsn == sctp_tsnmap_get_max_tsn_seen(&ulpq->asoc->peer.tsn_map))
-		sctp_intl_abort_pd(ulpq, GFP_ATOMIC);
 }
 
 static void sctp_handle_fwdtsn(struct sctp_ulpq *ulpq, struct sctp_chunk *chunk)
-- 
2.34.1

