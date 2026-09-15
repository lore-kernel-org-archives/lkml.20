Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E1237707
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465906; cv=none; b=UnSqN4Xfk6P/Ww3liizFZ2DJDCywm6f07/aXkB8V8UG+JPULB89UQr/+USNhBk4GLGpxcn0ZMTWNZrCCpKMTGbnoDBF0IxsUiufPtwAODbSW63NK8iGbk+GTxkb5YrHZZB/2L1eKMxIQDIqOLRgsSP0ShRRgZuiGowy4nrA2+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465906; c=relaxed/simple;
	bh=SjnPd3F4xaIZYIfBs7KNh1DDK816y1zDiNw5ZDtQAPk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jnN+Kc8DUig1MNdoQ6tkyguGFWl3XMooJEIx8Hukv5+C+SUInXyMhisSsUCxR5XQzTAUNrOdBODoLEOmXr3bkRuJlz8iHdi9+HAJYeVjtLzleyO+Eic8ds3mQCIB4+qyT4ZSPyA9e7LDsmLxg+tFiUgBb+FB+W77nwwA6mj4SkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeNI27/T; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeNI27/T"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc44f8f356bso105471a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465904; x=1790070704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zczTvM2RkZrNADCe5tPZcKwAKp4jsVncoMtfbJjwrvY=;
        b=FeNI27/TAYWdUo/oMlN1jpikw1GJKysuU7I6dQ0T4qes5BycbsveuVYZ7XKodMuhOi
         +uZWpKhVIw7fO+uTp31bU7EUCQPV6l7cgGdYK+E6YiyvGeWGkNY0VhY5poWSm1HvjlLw
         AY+F8dSGOJ+hXBVKT6pT83rzgaVfpm4QTErlilhJaUcKuE9yDTOOjrxOwSe+Zmx9A6CT
         oS8xMhApQreYSOyLrLAlzRoP4s9v5e0S9bc0xApqbQ2N40pkEXLZl8RVEqvLKvH/+t7K
         iazTiqhxYyRPmDPAOTamrTPTBZkr8pnnkgUyAM3gKmfHcY4G3GskgY0zBwhdyDDSLlt3
         e1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465904; x=1790070704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zczTvM2RkZrNADCe5tPZcKwAKp4jsVncoMtfbJjwrvY=;
        b=LWSm69XilVUYm/qGq7QXVCUycJAA8pIMpn/sFGQsBjKKsQC+xamVaAb2STtkwfhwXl
         w1EFjzzXiGqTHJB9FBBw84mCK2DdtMIbDQkI8wrMyFr6qcBOrvceu3CCf0L9wSxKu1JQ
         REG72W20jvPkrE29F41Tx94JQrPEJ1PU7PWY8t8k+4cqWH3eJgOxWwp8qoKhDzudv9gd
         v++XOnZ383/036keuJ4R9Zgkv9BX782j3Jz3rlMVs1u3c6bBb75WY6++6BuwLtWBD5gC
         FCWvdENTcOVxiHvv/2ZgPSqJkG87LKVqwfikDFEqenZ4bElLwQAJJO05lCAssDSwSLcM
         o/BQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6+CxZNohCpy7qAez4WBLnlXPBLiQYvdR0Hv7f5uvPpPjzPu94rNmdmxMue3qD2YuXyD9cJwzw2SDdc3M=@vger.kernel.org
X-Gm-Message-State: AFuF++nvZIDPhMqz6Q8D2aimommK0XgiGvCcS0NMPFBz05/MdhhXMQVV
	G7mbCvHGUuWwL3KrciPN5b/oKJ9v8nC8Q1rw1h6xtov215GP7Jf106KO
X-Gm-Gg: AYBFou0E/8870R6bslQJhgdIWOcaS8bfN+NdHCT2xDb+XtTdf/cM2J1dXrha8afYBH6
	W9qUSpvi0qvmarJTcIH+zYzsGgfjPtgCwDEVloyyblR5S/aWCGhoTd0qyydWVDKRJ/tSIduzvKK
	mra2B5vbQexEFdsFCfmvD++i7H7Bz842EHoXZS3vQPt98ID9kwzWkOwsCM3OxZQWydyhM7Kgzdy
	WP57tE0TDa2oVNjHxbQzdctpUbDuhgA7DJZz9h2ZqyJAJyCwANnLAvy4Mt/H2akCYjOhGAjaap0
	mqtvR+QQdTn+hzwGqLVusKbfKg6F9bDuUQqk/UxghC22BeZAnhGS1zswAIFljo5NLsOOJgox8p3
	4aci7XRcVmlHm6ASlldYQ/VNzVo0zTDEGWnYNpW3vfxoe2J7ztYOg7IZjx72UObQ+TMMt2Yz/x9
	zorw8l7faR2TlTfRIT5uH7U8filG3YLX02BO08gDmAXzJXZZkJ6VMsSTkr6k72gsJy6GOYMB3nv
	LWx1+V2Zt8r2X7puJuH9uCc6fGP5umEs2YU67rv
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39dec137c0emr9047736a91.3.1789465904285;
        Tue, 15 Sep 2026 02:51:44 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb8c09cesm1438633a91.1.2026.09.15.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:51:43 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: lucien.xin@gmail.com
Cc: marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	sunyiqixm@hotmai.com,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH v3 net] sctp: avoid livelock while updating retransmit path
Date: Tue, 15 Sep 2026 17:50:17 +0800
Message-Id: <20260915095017.942213-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sctp_assoc_update_retran_path() can loop forever when every remaining
transport, including retran_path, is SCTP_UNCONFIRMED: the state check
runs before the wraparound test, so the loop cannot observe that it has
completed a full pass.

Fix this by considering a transport only when it is not UNCONFIRMED,
then checking whether the walk has returned to retran_path. This makes
the full-pass termination independent of the transport state while
preserving the existing fallback selection semantics.

Also restore the NULL guard around the retran_path assignment. In the
all-UNCONFIRMED case there is no eligible replacement transport, and
installing NULL would leave later retransmit-path users and the debug
print with a NULL path.

Fixes: 4c47af4d5eb2 ("net: sctp: rework multihoming retransmission path selection to rfc4960")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
Changes in v3:
- Post as a new, independent thread.
- Drop quoted review discussion and the reproducer attachment claim from
  the commit message.
- Link to v2: https://lore.kernel.org/r/20260902025206.phbpyxmpf4zrtdpx@sunyiqi-llm-kernel/
---
 net/sctp/associola.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index c0512c827d0f..4521be3bd85a 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1289,18 +1289,19 @@ void sctp_assoc_update_retran_path(struct sctp_association *asoc)
 		/* Manually skip the head element. */
 		if (&trans->transports == &asoc->peer.transport_addr_list)
 			continue;
-		if (trans->state == SCTP_UNCONFIRMED)
-			continue;
-		trans_next = sctp_trans_elect_best(trans, trans_next);
-		/* Active is good enough for immediate return. */
-		if (trans_next->state == SCTP_ACTIVE)
-			break;
+		if (trans->state != SCTP_UNCONFIRMED) {
+			trans_next = sctp_trans_elect_best(trans, trans_next);
+			/* Active is good enough for immediate return. */
+			if (trans_next->state == SCTP_ACTIVE)
+				break;
+		}
 		/* We've reached the end, time to update path. */
 		if (trans == asoc->peer.retran_path)
 			break;
 	}
 
-	asoc->peer.retran_path = trans_next;
+	if (trans_next)
+		asoc->peer.retran_path = trans_next;
 
 	pr_debug("%s: association:%p updated new path to addr:%pISpc\n",
 		 __func__, asoc, &asoc->peer.retran_path->ipaddr.sa);
-- 
2.34.1

