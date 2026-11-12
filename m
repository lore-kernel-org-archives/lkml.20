Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448632;
	b=gwOOZ9uVlV7tPUE9hb8H34gfJQq7oJpPqsigBH0S8h4qIC19osIIRwXpUgB/CTC1TSl+
	 osiBuvccZwPiUIpvy0KG8mAez8HmzmpXbpdlWd4UO4ZvWD3+xBpwuC/SBomZb4+/AyIt2
	 Ez2bUAa0C1bKlTOBAwOxEDp2eCxeuPiIBITOf2TLOGqCeseYZuYmfbsyjqlbWg0sNY+DW
	 PMReDY2zzvf2REUFGQvVG+5i8tmbU7bModIfrSc4ccl8PCdE3e+tKk4Km/LpRkVvenVlp
	 w7CSYKGjQ2g6dziLY7ZN5JQxY89w1KEq+YtgAGfqI+1/4V1huTJaVVXcYW+dWfhMI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OrtaQyuTJFFAhzdaHFSf3W8ZQbcXIMUnYPchIxz0jsw=;
	b=4mRYUXtbZ2EJvJnwuO2tyaBf5RW/0Uy4cTPhfORQDFaCEmX/wUmn3sN7S/fkUkTtxbBS
	 iWyV5YZRN6NoCKaDhPnLIOyxOk2PJHFisk+PYoSu4BOUUHx8iWvJlrkvWBLhSZv06kfXR
	 MBRMQm3N5Dxu2eMmTr0Hber+KOHgcK9ksB1nrMIsXzsymuZP8G/tDZaPxo2vgW9OPvom4
	 h82RNOvkweDU9EJNpLkSAnFa+DoHfJVu/tHJ4HosNKuSVuUN2xrMlGmouScRIsHpGYj+Z
	 po1DulZkOpalu6Sbv0D/2UmwanAWhVYo6WiOV09gLsK9dknpRjOLl3QpGZtyBrx1Vgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTdbobRp;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEB2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTdbobRp
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3ada81853so3470374c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448631; x=1795053431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OrtaQyuTJFFAhzdaHFSf3W8ZQbcXIMUnYPchIxz0jsw=;
        b=fTdbobRpDuVRCAF+7aJvzt0PliYzTw9X2tkMI+KDsGQFlVuBw1KZF9I9zYYWUCts+R
         gUpNxTbHin4gFwGqLduRpYcrbfZbYeAtALfV9ROrlbTJZE9thaOBc4uCyDuVHX6ZzYYO
         pZ4rEiMXrsiHrdFgy8aB++2Y11a/DHU7/0keDni0G32zdsYdWBq0pHJTKxyKrG/iQdq0
         BCshj7P8P5yMdJ7L891YD6Vqn6YUIliU+RzBMwovtRTQAn/h68GHAa6pQvwnmfPk2UFF
         8arZysqgIfRfLS4bfueHAyOpMpZZWSzJKZcVRa/Tynyu1mDZE/4Dc4DjqtUmrLmYqOIJ
         CQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448631; x=1795053431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrtaQyuTJFFAhzdaHFSf3W8ZQbcXIMUnYPchIxz0jsw=;
        b=gCZ6/fePgkdy+CfNsudO64K4yGA5eT+dZd4/J8/i5LVzcPs937h+eQCzP7pc1ENsVC
         IABHGV9tiuLVfQv8Ahv4pO7OL5gRjHQWDsNJl/4Yc0HTHxIX8tmzk81CKRcGdyUu7Vaq
         uJi8vAIgqpQYoV1h9cD+T41/Saht920Bir+gBx8tdSUh1Bx/nSG60ov1UM9w9Nix6XOz
         Bs5d8rqtqKK56/PS7r4OEM3XFBHwDx7gs+P0rx9f7pE0cfHSQj9seEOlk1rEogn/5DHA
         K8CBta8fuNOhku+G/m8VkRB6tC2FZ3irHZYr5pkKKcLQuRGqA/lTcE7ujLu2iMmtoCe5
         mAZg==
X-Forwarded-Encrypted: i=1; AL+hErEuy63u98Y8RbnihqEG+Q4keAZdjyWSvwNtp5IfZvzbOGlpQdX8gfztSSlSGpEzpDE//5L1bAjau2A+cEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PVPo2apfCUfDNkJypvF8MW881naIs2dif12by8zl0ZXvKLZqU
	J6/0/3N5gzjdVDFe2J389N3U+BpMFE/fk63Aki7OQKGCRFHiuVrIPncA
X-Gm-Gg: AYBFou0vvWxWXk16GHvHC9sRv46nQeVaJQ/qYHnAb2oOsdPGp5FRWdiZDGlaud9Njy4
	wPP24zYC3oKO1JRgM9ilI67/3IBuwk19yONC7JujkhtrI6dlF7A3aFUA7eUDiqMWoRgQwuxdOhX
	O+cRZv/OSW0buMcMrnn/Mf8vUd2eVrXzoRgQnZNo8CMreMpDf7OYe/QhwRiqTSeTwrf1Q/SJc/K
	MPALBE/DzlWAWliosXKr+87yiaPc+BqDCsRyyvKyEKcfy6AXe6KFcHzx3VuzT//ubnpB6eT1aml
	mCBsGYxI7g8vsENZoJG5qWdvjyO9JYUK5AYCeKOSPwW7LlFyd2z2pmw/DoyIdeRb8uOhL2pMJ5U
	CR/Zlw0DR6wKNqpFGxvSHKmuTiZmxCfvBk8Gxho0V0HHekstOhcshOUC1uW4Xm0yedQ+niUtiqe
	7rRMoDsR1F3ujRHmAJEJKTX/ld0Fgny0mXe2u2LF03y2+GjTFpbeWzza/CaSb74okstr8wJOCnQ
	p8yU7QsWvarTy0bhxlK03Wa17UYuySMPIcJlxmjFlCyLV7ZggekMItgGbRexSU1SWKrm87Dvoau
	oYtJpkxLJQgnDuPjy3FsLCHjn+lO6A2ts+X+6OzGMqGNHykqcq6gWnB3WEJZSF56CN8a+MRyJ/u
	O+qbt1stFGZeTgQaDHyQZv57E/cKUhFI6H2ISUldrbjg=
X-Received: by 2002:a05:7022:c93:b0:176:a225:e364 with SMTP id a92af1059eb24-1b3c0342f80mr3366158c88.35.1794448630948;
        Wed, 11 Nov 2026 17:57:10 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm18841201c88.8.2026.11.11.17.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:57:10 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com
Cc: mkp@kernel.org,
	dlemoal@kernel.org,
	axboe@kernel.dk,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dm: avoid double-dropping the zone reset submission reference
Date: Thu, 12 Nov 2026 09:57:03 +0800
Message-Id: <20261112015703.2437757-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

On an error in __send_zone_reset_all(), the submission reference
held by the dm_io can be decremented there and again by the caller's
error path.  If another clone is still outstanding, the second drop
can release the dm_io before that clone completes.

Only drop the submission reference in __send_zone_reset_all() on
success.  On failure, leave the reference for the caller's existing
error handling to release once.

The error path was reproduced under KASAN with an injected GFP_NOIO
allocation failure while another zone-reset clone remained in
flight.  With the change, the same failure was reported normally,
without the observed use-after-free, and ordinary zone resets
continued to work.

Fixes: 81e7706345f06 ("dm: handle REQ_OP_ZONE_RESET_ALL")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

---
Changes since v1:
- Dropped the nonstandard Assisted-by trailer.
- Added Damien Le Moal's Reviewed-by tag.
v1: https://lore.kernel.org/r/179378374219.68809.15920762511563622507@gmail.com/
---
 drivers/md/dm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1881d86111fb2..c373cd3f635fc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1929,8 +1929,13 @@ static blk_status_t __send_zone_reset_all(struct clone_info *ci)
 			break;
 	}
 
-	/* Release the reference that alloc_io() took for submission. */
-	atomic_sub(1, &ci->io->io_count);
+	/*
+	 * Release the reference that alloc_io() took for submission. On error,
+	 * that reference was not consumed: dm_split_and_process_bio() releases
+	 * it on the error path, so do not release it here a second time.
+	 */
+	if (sts == BLK_STS_OK)
+		atomic_sub(1, &ci->io->io_count);
 
 	return sts;
 }
-- 
2.34.1

