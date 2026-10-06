Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED22F8E99
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259059; cv=none; b=PRvsh3emhpOCftLnJKe9yY8Q61NorovN0A7efWvQccEjJj6nKsHIBYxvAfrUOquPyMOHSM0dU/JvLyLpu5f1+1DuEACV+OUvauxcu1AgV7K9v1aRJT+hEzdJawiyRnh9d4PZw86ZylOIyuk95lGDW/vrn7vSsAvPgmdMvV0Rp8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259059; c=relaxed/simple;
	bh=AKFO+6kMRIf999SHyvoUrdjxxCfFmmXdHeh9Zljcz8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xu3RkujDbBdlwt7ENTb/BGW+6WpQ0+UHEUExWww/XUIKMwWMYxuNnToxlCKAWFzbfLE5zotjmX8lHWtNvCGK3r5BIy/D8YgD1wF+5BVUn4uB7O2DG2i/PnODhLYNNQSj0S1D6R+d4XckXhKpwhREuAHl9zzPwLH1QQW3vH4YKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=A/TeS+UP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="A/TeS+UP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3c37877so314254a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791259056; x=1791863856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIg2j8cR5l8EWHD0aFToxc23c2wafCfRdD264dRHKCg=;
        b=A/TeS+UPM7Hf6RVDsa6bMDIVInNY/OFvGiGMCyc/V8mzMOsZMJNDZhLqy7nhZ8jJ51
         cse1/L0bshLdtxVk0IG11eJSwm6VuMaM28U2klq0L9gR60tarieqrqZ6f2YhzjZ64gF/
         smYqw6yQ9U++fGglI6kxfBy+Vc/xNwbV39CwR/HiVuTiYt7fdbnvbuSjHcSXwSkgGmG6
         fd6J7ltLV6jarhA8c6M56S2D7oIe5zzyRID6LLQMWxU/fEZK5jWFaGIcIQ1umZNqyPlk
         zUT03frKTf5Q1V/xepxwYE8Lu53Ln2gAiusd5GjabK34jsZpZq56MjhNCbQFLvcNfvgk
         FHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791259056; x=1791863856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIg2j8cR5l8EWHD0aFToxc23c2wafCfRdD264dRHKCg=;
        b=F4KbbkajY8soO0Q4vRELf6vg6VG8hSQ16V3oLrMEX6L69JgY3gwsSvbevItj52fkEE
         N49yReORK3DBP9Sx/AA9kbSn9oL6DDBMKJ+xv1Humt9BabL6Xff8iDccqAC9k5dRsUWU
         7/cI4Qf8sEZRQpnP3MnnD6IvQfs0gKoN78bM6Afdwgvow34GDKWuxBKAFCilwZ1/pBwe
         kzHKgTWtH4i//koJRcL4NwsaFvyK3nzRGP0VCEtNYm89eJ0HcRhU7Mh8GoOfTPspnxra
         jSjijO2u8Nfx8h5pxI2KLWvQ9TWhwvSeL76S83tmodKLKaU7pVG++y6ML+G2eltVWy7o
         UnkA==
X-Forwarded-Encrypted: i=1; AKwUvBwXyN5RXoPdSVM49p/R/02vKz13/jZAj8tsaSIapLCmG3FmC35XQN/eCkD2CYOh8755f2egt6zZ2PnKMYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlNP6Em/01emSZ6zbhFUeyOkTQoUOmq+9cutr2Wtum5IwpytOs
	Un/taAcqffMWr1Ybjur/crlKO8WWDRG6mGeylxRJjQ0sNYxYgCM69KeLlPwcJL3H5W0=
X-Gm-Gg: AYBFou3F2ujn18jOvFxKQmkzjkBiy/I5Dmyu/y8AVp4dPGCO2ujeTjz/lenjqyv9UyW
	B4w+V+nUsaVYNt8n4o4gnJ/dRh4sTB7D+3mB5CV+eGMKh3SkM2ZFlVr3I60brUdw9yHQDzbApNn
	oPfPNGRma72clzkQZS/jAmIMMbi+REsPHz2eFkHr1CJBKFb/09bPdR9u8ACAe/8qgRL5OU7XUVY
	y53ncvw4Gy7h9H8aLCaKI4UBl6OeVmfsXgOBQEfBg2zgcVhCdJ649QyAHrvSCHHRDwldFs53/1a
	B5qDHBG8RStVy0HILk9EqcvgNSL68vHRO5UVjD6FBXQ5sZr8Exhpf7+BDk2lT72sCQqlPuOjHPT
	YRcoUg60VC0yMiUbhMaoto/sSq9gPWp1QJd8u7XP89MN9hrjs2jAsiQ+47PGJMCn2GULfrlO07x
	CuvEjojn2m7V5LEfGZx+5yEfA4Mj43FkwL5OUCkJLHM6OJ+Aik7nrnCV481/C8UAfciprzeHngR
	v7ndwjw2eqnDnoscCRHdw==
X-Received: by 2002:a17:90b:3d43:b0:3a0:7591:ad7a with SMTP id 98e67ed59e1d1-3a8726b57a2mr111120a91.5.1791259055781;
        Mon, 05 Oct 2026 20:57:35 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5364:bba9:2adf:d611])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm2543601a91.5.2026.10.05.20.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:57:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] drbd: reject an out-of-range offset when decoding a compressed bitmap
Date: Tue,  6 Oct 2026 12:57:13 +0900
Message-ID: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recv_bm_rle_bits() decodes a run-length-encoded bitmap from the peer and
accumulates the bit position s across the runs.  The upper bound
(e >= c->bm_bits) is only checked in the branch taken for a set-bits
(toggle) run, so a clear run advances s with no check at all.  A peer can
make s run past the bitmap with a single run; it is stored in
c->bit_offset unvalidated, recv_bm_rle_bits() returns "not done"
(s != c->bm_bits), and receive_bitmap() goes on to the next packet.

The following plain P_BITMAP packet computes c->bm_words - c->word_offset,
which underflows once word_offset is past bm_words, and drbd_bm_merge_lel()
turns the result into an out-of-range word offset.  drbd_bm_merge_lel()
only WARN_ON()s that and proceeds into bm_word_to_page_idx(), which
BUG_ON()s on the out-of-range page index.  A malicious or buggy peer can
thus panic the node with a crafted bitmap during the bitmap exchange.

Reject a decoded offset that is past the bitmap.  s == c->bm_bits is the
normal end-of-bitmap signal and must still be accepted, so bound with '>'.

Fixes: b411b3637fa7 ("The DRBD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/block/drbd/drbd_receiver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2135c14354a85..b3da2bcb646a7 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4559,6 +4559,11 @@ recv_bm_rle_bits(struct drbd_peer_device *peer_device,
 		have += bits;
 	}
 
+	if (s > c->bm_bits) {
+		drbd_err(peer_device, "bitmap overflow (s:%lu) while decoding bm RLE packet\n", s);
+		return -EIO;
+	}
+
 	c->bit_offset = s;
 	bm_xfer_ctx_bit_to_word_offset(c);
 
-- 
2.43.0

