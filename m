Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154BC43E4A2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463794; cv=none; b=LBJEM++Hwje6/gSo5a5zq0/5pac6479EGPiLRQVLGcKDy92icvvBTKB5Px1WvoCrW1mYmHRsXO/sbu5rimSf4xAi8gZrRIOuh6vT7pvYxVX9/Vbsrj/OMeZJa80ySg5ibH+oLhC4iiQ1UyosGW4vs7jRDGgiNMlWtJHeCQfup54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463794; c=relaxed/simple;
	bh=B8O4UyYWgKHjCyiEvWQaDVeXppuTnbg4pu4xhsW+PqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+1iEgXCua1DjFzVkbfz2WZg3cKNLv6Sb2tV7EaTbMohBCnn4oGrxM3hphXIq9jux7mCK/sSyj2p27jJxlLSKw2zKNgyVgKQ4u1RgY1zajGrY1q+2xAsDOaRA8J2M1LiQnAZGfjjhazANc6RzhP7IxolG+Ezs7AJa8/kJI0ImzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=D5ep0zkr; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="D5ep0zkr"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15354aa70e8so1572340c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791463792; x=1792068592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aw49x50i74crGqe52PxPoi4v9QJFpR0yZ1MGPQQ+JH8=;
        b=D5ep0zkrEryGfnWxMX+RdZE+AwDV8kcEJ07tImzs2AmXudax4OdKIeG7qm+F/WVmCB
         UUGArDTPsIswq3R51y5L1TT59IqEFqL7WFsPMp71ttXUUDb3eaQr7K/uj4/MtH6/C+j8
         DeX1FqSSves4gKO5Tjx/UwaBHZPZ2WLwvzBNL52ENaW3MuPSmslUtY8xA1J66PdxcHpS
         c3tNv2ZrXvm8ovrbAwRrcIDFHZYBBe24Lt2ZIHRGV7jK1m5i5XHdQESohM5mzvZVjvOR
         fXlgBMwm4doEsob3JQgLunxoGmQBCDbzmnrLzOCGmEgVDnYHJUAyzDCFzdcPOR+f+EUy
         Ai3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463792; x=1792068592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aw49x50i74crGqe52PxPoi4v9QJFpR0yZ1MGPQQ+JH8=;
        b=qG61ORJg6S0kO4lDX9p9eu0WxbQh13xYXNZvOV+7HOd17HL8rn2foFAXMOM92Ft0gV
         hFEc0c/h6NxWWc85VG77p917f5bxGt73VODW1EKE8aLtcDyxHci1PeSDctRo76xGh0pa
         nTTbVI4eZiAK89X9T38ltDLvJNsIBxv65iBF9vgXVNXItL2PuM5Sn9Dosgyvry3//cZ+
         tbXus39rTerZGAhxTuZN8vB7RNocpMEd6XM7yYHlm+GJ5FT3m7knUcET+o76G8aMgKMI
         hizf/zTRXljB2oYq/CsXPoxqqS/xz8Jqfn8Ed2V6z1pjPnjpOl3W4ER4iu8tQrvGAZmH
         7MqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwni7+baEV7lyCoz07VRwJKZMd8xxsgb+1LH1ZSzZlmQLPQVpzd/1KwuS70h6Z2PaBR8Uk6crt7qWUQjWA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwF2Z2jobXHRn2Y9r5E5RPT/L3fkraqI9C/5pbXxRNfsQ43rOz
	AT4DrwrQbtD8FDhrVBPP6N5PoWnRejUMW4TrL572ojKzFU/7ZRaTW2cZv4/UixcEXGM=
X-Gm-Gg: AYBFou1dsOAI8JCfUpfvo6EVVrV11IhmNku1oGx6cCcsiKZp2eB4xw9GaU8QQ0evGvv
	fib4RaQWDm5bpm7pxUCJfDdTUthLU26vadCZCeKkHTC/O9c9ipyjoRHCILCqyeChghg9NkGFAVa
	ZDZQbjcGkCvj26fnGbk6La36c4RwZ49DIxb7tM343FHnAzX1SFpR+clGFgJxUeZI5VI8HkP/WrZ
	aIS3yPWQnAlX+Xt8/pZZltFihTMjfOealcfXFOJ/lEb4dpxj5twCiCWDeyu6KvjqFKCNwKf7N9r
	U0b/tVaGrY6phnaBskTLChCwC3aBBGPtPPM9TWsZWh3H4B+jNvravGZF1wh26dvF6J97jdSH2Ye
	gtfDR7os5pQmw4+0f9/jMQ8pS0CwGF1sRtcNAYvs2Hop2JyjT/GXo3CUkmPWWw/5r0v5k5iVdfW
	bZZLM376vh3o/Cvs/h6iZ/dZT1mSg2fbJ80eWGgf+M4SM093G/H3XEGs/AFjtxN250Fe0jR1xhR
	e4yg9KwpkjnTDajfatYzGM+9m25ngh4hYSNOuo9qy/rjTSmoLmyDO501etAX9/TLVQS2XbYeg5J
	uE7YZNnc/rwPNw==
X-Received: by 2002:a05:701b:2419:b0:168:3243:c911 with SMTP id a92af1059eb24-1683243ccb8mr540174c88.37.1791463787193;
        Thu, 08 Oct 2026 05:49:47 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm11100896c88.22.2026.10.08.05.49.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 05:49:46 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>,
	sungbyeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH net v3] net/rds: ib: zero the unwritten tail of a short receive fragment
Date: Thu,  8 Oct 2026 18:19:40 +0530
Message-ID: <20261008124940.13371-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rds_ib_process_recv() accepts an RDS/IB fragment once the receive
completion reports at least an RDS header, and then trusts the
header-declared message length h_len: rds_ib_inc_copy_to_user() later
copies up to h_len bytes from the fragment pages to userspace on
recvmsg().

When a fragment carries fewer payload bytes than h_len accounts for, the
bytes between the end of the received payload and h_len are read from the
unwritten tail of the fragment page.  That page comes from the per-CPU
receive cache and is not zeroed, so recvmsg() returns stale page contents
to userspace.

Zero the unwritten tail of a short fragment page on receipt, so the copy
can only ever return received payload or zeros.  Fragments that fill the
page are unaffected.

Confirmed under KMSAN: without this change recvmsg() returns stale
frag-page bytes and KMSAN flags an uninitialised copy in
rds_ib_inc_copy_to_user(); with it the same over-read returns zeros and
KMSAN is clean.

Fixes: 1e23b3ee0e94 ("RDS/IB: Receive datagrams via IB")
Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
Closes: https://lore.kernel.org/netdev/20261006205204.1322102-1-tjdqudcks0424@naver.com/
Reported-by: Shubham Antil <shubham@octane.security>
Reported-by: Giovanni Vignone <gio@octane.security>
Reported-by: Robert van Eijk <robert@octane.security>
Reported-by: Paolo Gentry <paolo@octane.security>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Shubham Antil <shubham@octane.security>
---
v3:
 - Zero the unwritten fragment tail instead of dropping the connection.
   A zero-copy send with a small iovec segment can legitimately produce a
   non-final fragment shorter than RDS_FRAG_SIZE, so the v2 length check
   could force a reconnect on well-formed traffic; zeroing the tail avoids
   that while still keeping uninitialised bytes out of recvmsg().
   (Raised by the Sashiko review.)
 - Drop Reviewed-by, since the approach changed.
v2:
 - Add Reported-by (sungbyeongchan, first to report, and the Octane
   Security reporters).
 net/rds/ib_recv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index bd6cb3ffa..9695c7f24 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 #include <rdma/rdma_cm.h>
 
 #include "rds_single_path.h"
@@ -949,6 +950,19 @@ static void rds_ib_process_recv(struct rds_connection *conn,
 		}
 	}
 
+	/* The device wrote only data_len bytes into this recycled fragment
+	 * page.  Zero the unwritten tail so a later rds_ib_inc_copy_to_user(),
+	 * which copies up to the peer-declared h_len, cannot hand stale page
+	 * contents to userspace.
+	 */
+	if (data_len < RDS_FRAG_SIZE) {
+		void *frag = kmap_local_page(sg_page(&recv->r_frag->f_sg));
+
+		memset(frag + recv->r_frag->f_sg.offset + data_len, 0,
+		       RDS_FRAG_SIZE - data_len);
+		kunmap_local(frag);
+	}
+
 	list_add_tail(&recv->r_frag->f_item, &ibinc->ii_frags);
 	recv->r_frag = NULL;
 
-- 
2.43.0

