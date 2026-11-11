Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408664;
	b=gf+XCkg5h7+4eWGVTOnEr3a4XvIRpke65LPt2IVV7QcgxuOJ05abdb3/eqjjiBAdBU/h
	 aF3HuAPOMgjr/rcLZv7Z4ForyOQhbBO4d7YC2YkU4UEWpXSsdbjdcGUujX/mUKiVq3YIW
	 YXj7nzd6pLkflPdH266MfYa0nClQbWWMBQT3u9/1DzLFH3RvSyX2Crrcs/kKp2eVVp7dI
	 YdSiqtndcSD1m4Fqb4ducqkmX/rUGzczGmAI8qergSFipwoRH7sgLKxI1yX7pPnZhe58x
	 0oBS1jBG23s/TPVwUL6zCYGspljcV9SBoezSXG37R/Hb/UXmBODb2k7ihGc3Q+Kz3fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6WfCGz4ZjPmddG0dbi6Us4o9/q38fFN+mJXbhqZsP/I=;
	b=PUbsD8j/dW1zG7KYaLXtiKjJr93yHvfFFbijfajF4WGJYacUOUcjS0SrRBFxH/wLLS9Q
	 A6NtvWl4hvFaEmlcIbtQwhv1/u4IE5B/KBw6A2heAf3fBoSJPvI8bRCodJEzO/TAi40aS
	 +P820q7/NHnMe1SwfGhK1zVuT3xQhLCJ8UiCpnlfvBAHS50lGTsPfUt+tRFvExX3Bp+Sn
	 6vKrdEGcXK2EKnCDCa+w25hLKdF7WQCp28HA6G2QgzidlzKcdE56guLKq5zu8kocjsBN0
	 H9ocBeZfol9BW6VTe7CPlJU/CkJRHK4ee1OQgQiJU9wO2EhdquJZhM/jLhmDdvQMSjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFo3Cmz1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B72606A8A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B72606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFo3Cmz1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2861853c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408663; x=1795013463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WfCGz4ZjPmddG0dbi6Us4o9/q38fFN+mJXbhqZsP/I=;
        b=rFo3Cmz13G8lkK2BxA9LdDLJ32eb73Ah96Ugi3iVX2wy2UNzsz9vuTqTzUpfTR1w2h
         uNZOFdBEgt5nWqaPvTU3L4ZH0s7a/QVy1ecFeTx6rXaFNpf3FhxGXN0D0f7tuy7TA1Hi
         988lhLO08auSF5u6MjfG+NwWCROuilObQpFBBTYwAohQz10tHgwCtfEzzJN1IsgT6R2G
         Rjc4fsat6fv2RO6ZQaoma1aiPkUdNEHxRMlWhT4jNXLt90N7rTFHBPHlUE5RtMP1+Y1A
         DAx94KUVSjCZ4ZwB2qhaGEqQacBceVvyj70WQ+fshDg4LfYieKAWmnP+VtY6Wan08mRH
         mQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408663; x=1795013463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WfCGz4ZjPmddG0dbi6Us4o9/q38fFN+mJXbhqZsP/I=;
        b=Z2b/6TjJUZEx5p55DzerYwq71SNaiaeIApIpzQldKEly0I0oGXfJtkwlr7gW8iMbZC
         A46tHSeiaZfgnvRhmsqKOJP8WDkrn+j+EvkM7YyvDWWP4P1+IePbDh8P121iLNtIYQB/
         yafAofAZcmTNqRrM4WNwAdS6sYhp2ZElIFQcIyrocK08pBMDIB4YLynwZIKcoQz03Mvf
         b+nJ20VvA5VgqsJb3cEOyizAyh8eFXbd+k9zHcgSHlGoBR2FGxxCu2yyKIH8LDwT9vtr
         nEqW8cQBhTHogdsLW0p8cGAWitQ1U7CMuCcLR0hya4Odkdz4FTeGRbcIFrkod5l82znL
         SBvw==
X-Forwarded-Encrypted: i=1; AL+hErHFNlEjALGEY9md/B5ZMnBb6mtzgl+juEYJCo44/W2xHstPws/Z0zfu/9qzQ5F9nN/SzDZ4F4buFXw8cNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZqD3JQdxqURkNcG7RqrBo4lv2Sz0olPuxRippKp7jNfrg7nxv
	Gf03Fk86Whg2X/o6nuJCvzYzrTSEpgHvHDfxT5IDSQoTgSjZwujgccT1
X-Gm-Gg: AYBFou2Lpgl6GyNA+ddEur6ESU6HaYDReXmpzGgAApql4fBwInmEsUT/JZr58XZxzzj
	jxDNt+od422jZ9j5y5U7VNlEjRsOxcg9+Pt/hUb4SnA12bVDS+QFrBQQHfvTZ2+GL12rRDBzqnC
	YYLR8pK1zS+OyXXeorFjgc26cXMPf2fSKcNBWCE0uu61VlMtaMIQIcVc351VyVWpbCcGejND1cW
	+ssm6bSJRgbCzGtUlHrBRS/SeJMCvMmckXfIimkUtBTJ7PLyxe8JAdoLA1Ppp7nL4ShRnxkIntv
	gK6mkPyBywh8bBB29cka7UB/zb950KzmYohKIWBEqmW5IB+krovMmlrPF+MtUaRqRP9TuFc91X0
	4UKXxUd1Scw4bQpk5OvvZogPQ5VcubER9E/t/avGbR9TjZaKF1czRFN1dEvOpNlpeOMrHXYwzG1
	m0daaO9N4P/DjoqfxqJGdGNAEvTemRzzsx+4zUBELc2rD5ZS0Y2AgF9liMe905Rd16SHgiwi6lp
	UdNvpWT7IgJ8uEG5Hufs1G2V7kJZvy3k2N4tB4trQ3s8r647DAdZtZtmRExyDUjdjjyBD2+eqaW
	n4dUYPJbW6ccvPNyzVxRcD4RN36Ft3jc2LRHYy/okI/9qg==
X-Received: by 2002:a05:7301:490a:b0:377:1ad4:193f with SMTP id 5a478bee46e88-3771ad41a6bmr1288341eec.12.1794408662831;
        Wed, 11 Nov 2026 06:51:02 -0800 (PST)
Received: from spidy ([110.227.61.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm17067180eec.6.2026.11.11.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:51:02 -0800 (PST)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Cc: Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH] rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK() during PMTUD probing
Date: Wed, 11 Nov 2026 20:18:46 +0530
Message-ID: <20261111144846.838278-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When rxrpc initializes Path MTU Discovery (PMTUD) parameters for a peer,
it computes the usable payload size as peer->if_mtu - peer->hdrsize. If
an interface has an MTU smaller than the transport header size (such as a
virtual interface configured with MTU 0), this unsigned subtraction
underflows to a value near UINT_MAX.

As a result, peer->pmtud_bad and peer->pmtud_trial become excessively
large. When rxrpc_send_ACK() builds a padded RXRPC_ACK_PING packet for
PMTUD probing, it appends PAGE_SIZE zero-page entries to call->local->kvec
inside a loop until len reaches probe_mtu. Because nr_kv is not checked
against the fixed 47-element capacity of call->local->kvec, nr_kv advances
past index 46 and triggers a KASAN slab-out-of-bounds write past the
1584-byte struct rxrpc_local object in the kmalloc-2k cache.

Fix this by guarding the subtraction against unsigned underflow when
peer->if_mtu <= peer->hdrsize, clamping pmtud_good, pmtud_bad, and
pmtud_trial to the usable payload limit, and only enabling pmtud_pending
when the link supports more than the minimum floor.
Additionally, ensure the padding loop in rxrpc_send_ACK() checks
nr_kv < ARRAY_SIZE(call->local->kvec) before writing to the array.

Reported-by: syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cd6f4783442ac67b56d
Fixes: eeaedc5449d9 ("rxrpc: Implement path-MTU probing using padded PING ACKs (RFC8899)")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 net/rxrpc/output.c      | 12 +++++++++++-
 net/rxrpc/peer_object.c | 20 +++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 88cad087f13b..a3dfba0a3bbc 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -325,9 +325,19 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
 	if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
 		size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
 
+		/*
+		 * skip padding if the base ACK packets already meets/exceeds probe_mut
+		 */
+
 		if (len > probe_mtu)
 			goto skip;
-		while (len < probe_mtu) {
+		/*
+		 * pad the probe packet with zero pages up to probe_mut,
+		 * ensuring we never write past the fixed capacity of
+		 * local->kvec.
+		 */
+
+		while (len < probe_mtu && nr_kv < ARRAY_SIZE(call->local->kvec)) {
 			size_t part = umin(probe_mtu - len, PAGE_SIZE);
 
 			kv[nr_kv].iov_base = page_address(ZERO_PAGE(0));
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index fa9a406e1168..a2f87137bb7e 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -207,11 +207,21 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	peer->tx_seg_max = dst->dev->gso_max_segs;
 	dst_release(dst);
 
-	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
-	peer->pmtud_good	= 500;
-	peer->pmtud_bad		= peer->if_mtu - peer->hdrsize + 1;
-	peer->pmtud_trial	= umin(peer->max_data, peer->pmtud_bad - 1);
-	peer->pmtud_pending	= true;
+	/*
+	 * Avoid unsigned underflow if the interface MTU is smaller than the
+	 * transport header size (e.g., on virtual interfaces with MTU 0).
+	 */
+	unsigned int max_mtu = peer->if_mtu > peer->hdrsize ?
+			       peer->if_mtu - peer->hdrsize : 0;
+
+	/* Clamp payload ceiling and PMTUD binary search bounds to link limits */
+	peer->max_data      = umin(RXRPC_JUMBO(1), max_mtu);
+	peer->pmtud_good    = umin(500, peer->max_data);
+	peer->pmtud_bad     = peer->max_data + 1;
+	peer->pmtud_trial   = peer->max_data;
+
+	/* Only schedule PMTUD probing if the link supports more than the floor */
+	peer->pmtud_pending = peer->max_data > peer->pmtud_good;
 
 	_leave(" [if_mtu %u]", peer->if_mtu);
 }
-- 
2.56.0

