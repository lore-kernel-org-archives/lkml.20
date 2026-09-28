Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137D34E4C5E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622276; cv=none; b=RM7RZhYNQV8D+qzsa+d7ziN0JB7mjsHz5HvHwhP3frTejjVSSz8fw36eK62JmgHORVCR7kHpE1MPtPpemeyOs+dtoQHLlbDsuwiwiFlHVPWpWFODBrDlB0h/61QRgChk/DIw75JXMq4CRlH83x/CwFXzdkjOn30ARwBdRwCWnPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622276; c=relaxed/simple;
	bh=pK+7XCkdBfalcoLQB4C2MorhZtzVib1xqhWjiQSG8Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePI/e4HzYIfPvbG1vvBJsZBUc74DJJrlNPbmHhQXRfESdt84p3QRXa4Rnnc6s+Z1eLmzZp6psbEF6VDU0PRNmCH0eEA+iZtLl32QfytX8ezeVZ9yu7ePW/9QOhuCJw56aFy1GdEOxvmgColx9gLbmEWEuL03sMGfhslTg6K84WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com; spf=pass smtp.mailfrom=cellusys.com; dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b=HMVpCAxK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cellusys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cellusys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cellusys.com header.i=@cellusys.com header.b="HMVpCAxK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso25399055e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cellusys.com; s=google; t=1790622270; x=1791227070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFkyXhwW18GAT053qn0DCfTNGShaOy7jAryC8dH6Q/8=;
        b=HMVpCAxKz8NLN6JL4VVSoh7yMjynDyGX9fWEk9BOeHv18hoD2KkMzwGqqJK6kD4V4T
         V3gBGsycfzKmc/gugln52UCoq5HRmkZs3T2Za+YuleREgm2p1qsTcOmYmPPiou/Vo2tG
         Derf8W+vKHctCbPfDEeNQzSbQz/1aLqaMs2r0scpHFJ8WW6tOyq+H2aA1oHZSJnGs17k
         ZMXaxxJGUJivTTDYcmtSaE+QgxQAoNLjN/qm1VPgcFdslBlzhbHS0H+EC04WvWchAGvf
         Q6J3ynajr5l8rWDFVnMaP70EAfx25k9uf2lPhwPJ+j4hbf4bzEQCV52AflNWbyY+juUg
         y1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622270; x=1791227070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFkyXhwW18GAT053qn0DCfTNGShaOy7jAryC8dH6Q/8=;
        b=UV65QVdJ3oqe9I0H3H7fwerkMEcLmavBfxaRi07UUw1LcTd9gYWlLsvXCGgy2Ar2zL
         e4LiEseu+K5l+1hvtKQgrjxTcV+OwdXghbzmcneFnE5swqASCNEVt4TFZdRbNFbSiOOq
         hroQgL71pU+cXMmMqan03xgu4HI/HZZa1gbtemO83ozQ/aoKhWfEpsdg8Iq3Kn+l1df2
         e7mKiHDahHF/9xy6NJFECWdgUcdAQi+F8sKF3CZvraCAGS6iuWLQtE/2tMKX1KOHxE5v
         L7GV1XvyyynBpotncDaeEMv/Mh2yYQTy1rnB9DGdyUE95ouSSa+qNVmaQOsrqAb4jTP2
         3UXw==
X-Forwarded-Encrypted: i=1; AKwUvByBdjUwRh4KYrzCaulkEyAymC2zIoV0WlzisH5bLfJwywKk+o25RSS2SGGRuLDyO4pQyBODx9MPJ293TwA=@vger.kernel.org
X-Gm-Message-State: AFuF++laI0qUJu3yVTaR/m/McyZ+1A330dnFmm18AQjyN8VXoHVCb/8/
	7i7e3fCtnsaT8r6CzaIpPzYuoCJL+YhF971OcXG6FnjUs/WgphZ9OMVBjT55P3mcmXQEX5+14UB
	/xc9HuSr2UA==
X-Gm-Gg: AYBFou3E6fnuspfsd6Y9Ow3jsEfVHJhB/GVNlEm50n5EY1N1io3inchKlONgalA/nhS
	OgbzTPezgui5BXMjvFn2DBDufbI4Qh4sk4voQaWBrnP83/3iDEsooFJ04ot6UheMmySMDzw05KB
	CscPPy+F8QSmzFyORGWYzlbAUV4B6lg3xpJn/pN8iHu6AOK9n7S1KvPdzWtGFkoCrU2YCLf5pHK
	m1zqBP0Ru86rwDBDZUX01sHW7Vpets+pjy3XL/cVwTUU4D5rcibu572aNp6Lt6pO0uZ0Q/jcdZi
	ih++SeWem5mfp2I1D+DX+XxKCmVWt+uw4zDEYoocf6GpiTcSz34Fbf1y9AL7SAkGlVsdK7hbf8/
	0M9tnW2KYjtt6tjqI6oefxuzCzWAA4p6HIeoPTaVqV5APtEMmmqsD5gQ0d6MrALCVuzxGVPdhlv
	5EosRkaTRqpaZtg9a0qJ8cyzD3xxhQgsKd1nnK25fb4xc/EZULxEEfq0/rB8yV6EbxfOolaLLRt
	MQ9iX9lxwByQWnV9h09Yh9fUlT/nGo2eRvP+o7JQbHLz4oFX8kfBNcv8Lofkh0E8No=
X-Received: by 2002:a05:600c:8b4c:b0:49e:8184:f63b with SMTP id 5b1f17b1804b1-49fe66f3a68mr242422195e9.16.1790622270200;
        Mon, 28 Sep 2026 12:04:30 -0700 (PDT)
Received: from dscRocky-build.localdomain (ip-83-147-170-154.wfd.metro.digiweb.ie. [83.147.170.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm24710695e9.1.2026.09.28.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:04:29 -0700 (PDT)
From: Warren Briggs <wbriggs@cellusys.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Warren Briggs <wbriggs@cellusys.com>
Subject: [PATCH net v4] sctp: carry peer capabilities across an INIT collision
Date: Mon, 28 Sep 2026 15:04:01 -0400
Message-ID: <20260928190401.1641260-1-wbriggs@cellusys.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sctp_assoc_update() folds a temporary association into the existing one
when an INIT collision is resolved. It copies asoc->c, peer.rwnd,
peer.sack_needed, peer.auth_capable and peer.i, and nothing else.

The remaining peer capability bits therefore keep whatever the surviving
association was given when it was created, rather than what the peer
advertised in the INIT that caused the collision.

Forward TSN is the visible case. The INIT-ACK is built from the
temporary association, so it advertises Forward-TSN-Supported; once the
collision is resolved the surviving association holds
peer.prsctp_capable == 0, and the first FORWARD TSN chunk the peer sends
is answered with ERROR "Unrecognized chunk type". The peer does not
expect this, having been told the capability was supported.
ecn_capable, asconf_capable and reconf_capable are lost in the same
way.

ASCONF and RE-CONFIG also depend on two inbound sequence counters,
peer.addip_serial and strreset_inseq, which sctp_process_init() derives
from the peer's Initial TSN on the temporary association only. Without
them the surviving association would have the capability but discard
the peer's ASCONF and refuse its RE-CONFIG requests as out of sequence,
so they are re-derived from the copied peer.i.

The two address flags fail the other way round. sctp_process_param()
clears ipv4_address and ipv6_address and sets them from the peer's
Supported Address Types, but only on the temporary association. The
surviving association keeps the permissive defaults from
sctp_association_init(), so it can believe a peer supports an address
family that peer never advertised.

peer.adaptation_ind is recorded on the temporary association in the
same way, so the SCTP_ADAPTATION_INDICATION notification raised after
the merge reads a stale value, or none.

intl_capable is lost too but is deliberately not carried here. It
selects asoc->stream.si and affects the fragmentation point, and the
outqueue may already hold data when the merge runs, so changing it
safely needs more than a copy. It will be addressed in a separate
patch.

peer.auth_capable is already carried, added by commit 1be9a950c646
("net: sctp: inherit auth_capable on INIT collisions") for the same
reason. This extends that to the rest of the block.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Warren Briggs <wbriggs@cellusys.com>
---
Changes since v3:
 - re-derive peer.addip_serial and strreset_inseq from the peer's
   Initial TSN, so inbound ASCONF and RE-CONFIG are accepted.
 - dropped intl_capable, to be handled in a separate patch.
 - carry peer.adaptation_ind.

Changes since v2:
 - dropped asoc->peer.hostname_address. The field no longer exists,
   removed by commit bd4b28189469 ("sctp: delete the obsolete code for
   the host name address param").
 - wrapped the commit message at 75 columns.
 - added the Fixes tag.
 - retargeted at net, subject prefix corrected.

Changes since v1:
 - added ecn_capable, asconf_capable, reconf_capable and intl_capable,
   the missing fields identified in review of v1.
 - also added ipv4_address and ipv6_address, which are set from the
   peer's Supported Address Types on the temporary association and are
   lost at the merge in the same way.

Testing. On a 4.18-based kernel carrying this change (the code paths
involved are the same upstream), an INIT collision was created between
two sockets on one host, one of them held in COOKIE_WAIT, and the
surviving association's peer state was read back and exercised in both
directions.

Read back from the collided association, by socket option or sctp_diag:

prsctp_capable   SCTP_PR_SUPPORTED            unpatched 0, patched 1
reconf_capable   SCTP_RECONFIG_SUPPORTED      unpatched 0, patched 1
asconf_capable   SCTP_ASCONF_SUPPORTED        unpatched 0, patched 1
ecn_capable      SCTP_ECN_SUPPORTED           unpatched 0, patched 1
ipv4_address     sctp_diag sctpi_peer_capable unpatched 1, patched 0,
                 with the peer advertising IPv6 only
ipv6_address     sctp_diag sctpi_peer_capable unpatched 1, patched 0,
                 with the peer advertising IPv4 only

Outbound, sent by the collided association, with the patch applied:
 - SCTP_RESET_STREAMS puts a RE-CONFIG on the wire; an unpatched kernel
   refuses the call and sends nothing.
 - sctp_bindx(SCTP_BINDX_ADD_ADDR) puts an ASCONF on the wire; an
   unpatched kernel sends nothing.
 - a PR-SCTP message it abandons is followed by a FORWARD TSN.
 - DATA it receives in a CE-marked packet is answered with an ECNE.

Inbound, sent by the peer to the collided association:
 - a FORWARD TSN is SACKed; an unpatched kernel answers it with ERROR
   cause 6.
 - a stream reset request is performed; v3 answered it with bad
   sequence number.
 - an ASCONF (set primary) gets an ASCONF-ACK; v3 sent none.
 - the adaptation layer indication in the peer's INIT is delivered to
   the application with the value sent; v3 did not deliver it.

 net/sctp/associola.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 4521be3bd85a..77ac155fdb70 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1107,8 +1107,19 @@ int sctp_assoc_update(struct sctp_association *asoc,
 	asoc->peer.rwnd = new->peer.rwnd;
 	asoc->peer.sack_needed = new->peer.sack_needed;
 	asoc->peer.auth_capable = new->peer.auth_capable;
+	asoc->peer.prsctp_capable = new->peer.prsctp_capable;
+	asoc->peer.ecn_capable = new->peer.ecn_capable;
+	asoc->peer.asconf_capable = new->peer.asconf_capable;
+	asoc->peer.reconf_capable = new->peer.reconf_capable;
+	asoc->peer.ipv4_address = new->peer.ipv4_address;
+	asoc->peer.ipv6_address = new->peer.ipv6_address;
+	asoc->peer.adaptation_ind = new->peer.adaptation_ind;
 	asoc->peer.i = new->peer.i;
 
+	/* Re-derive sequence counters from the peer's Initial TSN */
+	asoc->peer.addip_serial = asoc->peer.i.initial_tsn - 1;
+	asoc->strreset_inseq = asoc->peer.i.initial_tsn;
+
 	if (!sctp_tsnmap_init(&asoc->peer.tsn_map, SCTP_TSN_MAP_INITIAL,
 			      asoc->peer.i.initial_tsn, GFP_ATOMIC))
 		return -ENOMEM;
-- 
2.43.7

