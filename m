Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994696;
	b=KAeF1wFynPvwPsnMhRDkLyNFKur6pimTuCBfAUdBrRFP+AkEvttiqxN76HQ8Fo44ZwDA
	 NI8yeT7dfk9QEkdGWs7A/hwkJEqs55nTapWIJjRs8jLFpZiZ6OhCOakGKQTg5i345/z/q
	 lqJJV6nuUHntg/JBM49DNzk+vUnvU+KaJd+4kLml7CJRjXSP3OxNrX0xbC7GnY2pAu17M
	 O12HTbFOpG0Can7/vBSED99ZfjJ/TJnPosbl0h/1VsV88Oz+r7Eo/9pWa7JO2MSNBE5DO
	 c2O25HmiE8qjk5XM+EcyVxnhzI8VBiTqmJ/XGCXohMw1R/KCtUn9yK/Mx2ubISrwlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ffQKOr7UnubupJZqlvLZWc1enNvauuxfHnatBigPms0=;
	b=nyx4oVlNo7QHG7GyAImYqhkE0t8f4PFs0YpD6WToDhAEJAQdTe1z/iKd5FnxrK3U2iEa
	 R5XXL9ZTyEXp71tsq7JrbvWm1+h/MAMheerzkBxpX85j+P0vtQde45lB8PUzXGhns48Mf
	 4u8uKJL0hpsQrnPzVTCFcQ/D5X8zJu1VoWQ7qrOR4UztGA5mh2jfcP0bFw/ELfUjq+e7/
	 G7EqrorVayCUTOwLYyOEAltXGhKOmb5HGBtXoHku0bM2wg6jXe709Krq8XRYFWadxJp30
	 1jxgikU0dL7GqvsgdhcRt/zWeyH7sNIUeYvTHytT4mh89FY8vujgJtpVyJd7TRaapKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXVOwGKL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19713606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19713606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXVOwGKL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7638335e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994694; x=1794599494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffQKOr7UnubupJZqlvLZWc1enNvauuxfHnatBigPms0=;
        b=AXVOwGKL0ZQ/8MhHgGtDkNLemGqJKsvgcFOBO98XdAtyAOsf6P5JaiG8DLsrYU43cD
         kqoWxmklZs3+Wpn4wacCbFsr4zrTlcksjpMGgWzY3bK2RZJG+kp8h3DaMOZKm4oLHaIH
         2/VXKg6+ewO7v3fcWV61iLbPTa5t8juelzLgI5w2MdSqtvBB2Ckdf8VlUz5NfK0Fi1rb
         Gn2M1F/bC7XDrmEq7e0H3BM/f73CThA69XLc1jQHpo1qPHiFJ8wKE1jEoLK9Ret4hPMD
         u8zGMFfcfGHc+zHuVY9Rj0iKsfaKI+twppjE8I6FoyeZ4A3YjeeRM1/m79h74QdRzBYp
         LnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994694; x=1794599494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffQKOr7UnubupJZqlvLZWc1enNvauuxfHnatBigPms0=;
        b=qfqttgRapnGLHLD/Hc7brOkSr88iEBz5Gs6m35jxK3fR3Smk0Jn5mHRJ2hZptm6klY
         k4vvzilbuae9hwHJHMqUmxIY4NQcv5GUIXXVZtcXAkJnsXCl4FRT7ZZhI2NcD55aIv4O
         4URNmNNVifs7OL/nDXIUCFpiglXisKkgK+hwBoWNQFRflsgprMu5RQtUPDgQJgNacBUd
         BiAXZ+7jNkVattkmD0HQ8R6CNcprBziRdVioFH1YjLSMcoS2C8SGhCTdifLcf9xBK4CB
         fqTf98YvskxH0jkTqLLVtpK9D4noR3nFdeMi+Li1x920Vp/jUgS4rGqaBBvYRojHsfW7
         2eJA==
X-Forwarded-Encrypted: i=1; AKwUvByelJ+zoLjRNeCv0LpYG3N1kBtDSmkRlKzL9AKFR1yMFS7urYyGr/JSORKaoA8URyK4XrhNpdI/abSQR4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OjUbHFJX7LROAWA460Vah52JI8P0WuxvnxWAvyTD+/wrLqq/3
	7J0/QjWOXljwTnk44laz4mHjlz9ieyxULJBGsN0KeVaAp/kZjK+8lVwf
X-Gm-Gg: AYBFou3+Fw26iQVW3+iAoqOEcn36qdC+O33Kiwsp4WIxCuUmyb6eO8CRMhWKqtVjrwy
	ePc2TOYSOK/tR+ADy+Wq9AFOAM20DImzvmN8FGJ2+jK06M0jzOUnAT3hsInkXnAI0Y37qY7Z3WR
	jzMKlUAhItRXXacZu6dmKFzOrYtgME+axa+oyC0mGwrvz2U/Cx70j41SLQffeqp89JrBTlbPhZ2
	0SrXaqFFHO6x2rs4/sYkWdmMfLHz/Tu/DAhDkmGzHDPju+Tb8XCjbmQxbgAespH9y1lhvBfuoS/
	/+G4KyfH+LxEOHNQGFqZpS/ws/j19eUZST43iPN0PQKMQuU7CqklimXZQnukyHphXJopAsmQ7Au
	2WbPrzTJh4cbil0jBVF0MKuwrqbL6adxreuHpCe5IjOiwin3gnQP8Pl0HNtdGHvP8l1N2Nw0mM6
	KiZBpo1yMaW3gUbJwGHUe37pBt/r9RcxVeNjeT2TdLwYhBAu93VUHAWo5mDV7vZ+jxlOFFBH4hF
	dKg4Lx2jJt2smVmPYUsLGqwK4fH+4+zGn9zU92PAGOikDdFq1p1LZAqjo4vuSjNen23e8MxIWjn
	EuaSqIQpSNtH5UCsQHWncDwP
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr62389165e9.25.1793994694120;
        Fri, 06 Nov 2026 11:51:34 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm5109746f8f.23.2026.11.06.11.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:51:32 -0800 (PST)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jun Yang <junvyyang@tencent.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3] sctp: fix ASCONF address change on single-homed hosts
Date: Fri,  6 Nov 2026 20:51:26 +0100
Message-ID: <20261106195126.1563231-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
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

Commit 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in
DEL-IP processing") refuses a DEL-IP of the transport the ASCONF was
located by, so that a later wildcard DEL-IP cannot use it after free.

This also breaks the single-homed address change (RFC 5061 5.3.2). The
host sends [Address Parameter L] [ADD-IP S] [DEL-IP L], the association
is located by L, and DEL-IP L is now refused. The sender never gets an
all-success ASCONF-ACK, keeps src_out_of_asoc_ok set and stops sending
data, so the association stalls.

Fix the wildcard DEL-IP instead: look up the transport of the packet
source rather than reusing asconf->transport. Both DEL-IP paths can
now free asconf->transport, and chunks bundled after the ASCONF still
use it, so point it at a surviving transport: the packet source for the
wildcard delete, the primary path for a plain one.

Found by manual code inspection while reviewing a backport of commit
9b2854f86f0b; reproduced on a two-namespace single-homed renumber.

Fixes: 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in DEL-IP processing")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
v3: a plain DEL-IP of asconf->transport set it to NULL, but chunks
    bundled after the ASCONF dereference chunk->transport (e.g.
    sctp_vtag_verify()); point it at asoc->peer.primary_path instead,
    as suggested by Xin Long. Reported by the netdev Sashiko AI review.
    v2: https://lore.kernel.org/all/20261029193454.1028626-1-andrey.misyrov@gmail.com/

v2: the reworked wildcard DEL-IP branch could itself free
    asconf->transport via sctp_assoc_del_nonprimary_peers() and leave it
    dangling for a bundled DATA chunk (sctp_assoc_bh_rcv() ->
    peer.last_data_from) and the following SACK; retarget
    asconf->transport to the surviving peer. The pre-existing wildcard
    SET_PRIMARY / sctp_source() point is left out of scope.
    Reported by the netdev Sashiko AI review.
    v1: https://lore.kernel.org/all/20261022163639.2566945-1-andrey.misyrov@gmail.com/

 net/sctp/sm_make_chunk.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index ddc31a5..9719464 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -3151,9 +3151,12 @@ static __be16 sctp_process_asconf_param(struct sctp_association *asoc,
 		 * packet MUST be deleted.
 		 */
 		if (af->is_any(&addr)) {
-			sctp_assoc_set_primary(asoc, asconf->transport);
-			sctp_assoc_del_nonprimary_peers(asoc,
-							asconf->transport);
+			peer = sctp_assoc_lookup_paddr(asoc, &asconf->source);
+			if (!peer)
+				return SCTP_ERROR_REQ_REFUSED;
+			sctp_assoc_set_primary(asoc, peer);
+			sctp_assoc_del_nonprimary_peers(asoc, peer);
+			asconf->transport = peer;
 			return SCTP_ERROR_NO_ERROR;
 		}
 
@@ -3166,13 +3169,9 @@ static __be16 sctp_process_asconf_param(struct sctp_association *asoc,
 		if (!peer)
 			return SCTP_ERROR_DNS_FAILED;
 
-		/* Don't free asconf->transport; a later wildcard DEL-IP
-		 * parameter reuses it.
-		 */
-		if (peer == asconf->transport)
-			return SCTP_ERROR_REQ_REFUSED;
-
 		sctp_assoc_rm_peer(asoc, peer);
+		if (asconf->transport == peer)
+			asconf->transport = asoc->peer.primary_path;
 		break;
 	case SCTP_PARAM_SET_PRIMARY:
 		/* ADDIP Section 4.2.4
