Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541244;
	b=PZmZT1g6JzYMWS8dgDEt+2fLew/tWucXBM7zqJhtQMqDKFTRy2YcsAlru0ml3sXV1anB
	 lrYswie/vdlYcT5CkgA5ZsHdvBvGi/maHVBKZfSX/nghKkvW/WeDLzsjSkJ6mRpmpJndd
	 k1VmiDsMtyTlVXAW8tdCXlWe5ez5j79zH6fCUha+N09aGpY1/zhnZf5BFH2XfcCtHZZsk
	 lKjXN5QjGEPO15W3xL7Yk77z/Fi3T5mWLleEBZGXbUWA+VDK9itzW1pionTsbaBxr3rV8
	 HUsBsDIxMWYHb6OpB+tGWvtTmjSuf2AeTSImSpr+dg2KE/TNhZ9wyhwJA8wT2kt+VxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JURDH1Ef+kAXVQHZ24OyOfHYXwmX/CvYK84q+N+pCZ4=;
	b=yXXpsd7W/SoF6bv0Rlq6+lcIGOBGchLwae+IRuYRBlOhzFtpv0jyuBM6oK91iNqci8Ce
	 8eTSSYiJjOwb78WAVLeAQQV2Rm8L8nw4S1/RBsUa/pQlF7aVIlOBKOHUShbkspX7j1Jo2
	 C2r3HsEGVzaC40pMP+OlMls1nVTDc0F1zQXboHm/Gp9+fYgSbE/VSUVIxOnWoQFmAxDrg
	 rgt8nmsvkQinGFPRauJwJVoO/0l4p2YZiuYZ7rXqivlXKuWYayIIXlmB2HobRMXM0m0h5
	 ZqV4RSlUZ37s2R8Wlr24OZ/dxTjunrE0i0rCWDsYAKOW+LqaaPYmxFK9GdV3eDuqXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=LsMerxoG;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CAF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=LsMerxoG
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab43af5e97so23337067b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793541242; x=1794146042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JURDH1Ef+kAXVQHZ24OyOfHYXwmX/CvYK84q+N+pCZ4=;
        b=LsMerxoGBqiqKoBcaGCNO1mksPlEOZfWi5ztLYpPxmeCrpVRtpUfYHxJxX60YQhQMY
         Rdg74suCUJhuAaQgfcnpGi3mXhOsV+dYuANTy99gTkec5kXmYlGIS6rdIAjvc/Rtuo8R
         ohDb3SVnEu1SxL6C9GtswQ4LQfxaJduzRiwH4oKd+9R6ntYN9TM/XMAg7Fdfo4FDOZlB
         TEvufIe6lJLgQY5fCBSeI3f1x9Vf9Qr/MprMgi751gDD7wxxLQGy0HvryVjCsfpYrXIt
         zbfaJzeEtvLtWK56BdWfq+PfTPWXmIeIWenze80NDxYk4J3yBOf14xPfp85ci06s3BMZ
         OTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541242; x=1794146042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JURDH1Ef+kAXVQHZ24OyOfHYXwmX/CvYK84q+N+pCZ4=;
        b=N0XOH/ourzex6/AAHdzDIvkBIA//Q8nJ30jc+UxJcN1zZJNKXUxl/CX2wEB9pOK9n5
         jfqNpt9uA3I4UpCXLcXiEFevkpeZfwPtPZ9q1hDUQcxdEq83uHh+ecL+TiOlJibjMO07
         fBNgPsRaX+JRxOZiOv5ipn9e7RFd6INCuNr5UZSJvbc0g5/9+VDlcFvKZsMEBdy24CP2
         wSnOen83nf6NWBQOPDy9tcaidz7mclmP2XXmWsWxpw50HIlY2B2/ygpXMO+dA7MrnIsL
         zczWKX8uT0AsglbPvoFExw70651osIHKqDvmmGYW6whCJsFjTwQMm59weMYcSGngzK5n
         Pq9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwc1LE6uAsl8BSK7AsegGfT3UnwalIB0gQ7d6Cga9SYz5HXejc/iIFRtiOeklzJXzJos0BgFEvwHyY/D4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4hVTQNY47eSoWwr7tm/g07Ng/GXNBasuu0EH7vz03+XvU9dc3
	ylKf4hDFeEBqwSB31CKtD+aVfeAXLMdulpzfpMkSX5dOqkJ0w2H4tCC1PPUS/8BXTI58v+ZPjGc
	zP8FYUFn7
X-Gm-Gg: AYBFou1lItI5lKVKw7wpPI0cG8QdbRUWVLPATZkQGHkj8KmfXD7JCViscEqtSr8Y7iW
	MtCEcURW/fRXT1rAE9rvfSTj/TJFfCdi+mBiUfANzDH3ZWxQ5vtI6L3AWfRw+UlweEsqNibmaiQ
	FFOrLBWRXuYB5/EtmNLzh6574Z77xBOCSHp96+VZJXq44eea1/0LBKrMO0ZspVQo2Xl8Sg/IP8P
	uPq5fLellomFzWX/nAwNwcu20Vz9qa9hRfGDQYOTBbj41FzEk8fL73JQ7ZTbO+0l1ilIWYIgnFu
	rxV7I5HgcYtUoP58Nl4jGnvVq+XrAdFYtETzxVEq1pInGul2MzsjWoITjyPXEX1UaFZCsKfnhcf
	BofK2+3RgkcLyFiLPXrk+Mc7ZV7phs5fpX4JM5T0oqT0LXLn5ObSuAZ1dolx4sfYjFQtsNttNBT
	s2Jxhdi8kmtRtm65pnD27gh1YxJFD+U/bOI6YKDl1TaVn6XfXGicDAtbBpzcU0GIXxGOV3oHPmM
	YqI5tcIM2Ko2yenlHQ+/PfCjjReEluJSx+OFwRCvPIEk8/B7WERjT7TWIYleGnM2xUQZPg=
X-Received: by 2002:a05:690c:e3c9:b0:8ac:c329:682d with SMTP id 00721157ae682-8b2b66cb3c9mr55705407b3.11.1793541242323;
        Sun, 01 Nov 2026 05:54:02 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd57sm36440147b3.23.2026.11.01.05.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:54:01 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH v2 RESEND] ufs: Defensively handle NULL return from ufs_get_locked_folio()
Date: Sun,  1 Nov 2026 22:53:56 +0900
Message-Id: <20261101135356.2204803-1-ingyujang25@korea.ac.kr>
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

ufs_get_locked_folio() may return either an error pointer (when
read_mapping_folio() fails) or NULL (when a concurrent truncate has
detached the folio from its mapping). In ufs_alloc_lastblock() the
NULL path cannot be reached in practice because the only caller,
ufs_truncate(), holds i_rwsem and so serialises against other
truncates. Still, the current IS_ERR()-only check does not match the
documented contract of ufs_get_locked_folio() and is fragile against
future callers.

Use IS_ERR_OR_NULL() to match the helper's return contract.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
Reviewed-by: Jan Kara <jack@suse.cz>
---
Resending, as there has been no response since 2026-05-19.
Rebased onto current mainline; no other changes.

Changes in v2:
- Rewrote changelog per Jan Kara's review feedback to clarify that the
  NULL path is unreachable in practice (i_rwsem in ufs_truncate()), and
  framed the change as matching the helper's return contract / future-
  proofing rather than fixing an active race.
- Diff unchanged.

Link to v1: https://lore.kernel.org/all/20260514193256.2556905-1-ingyujang25@korea.ac.kr/

 fs/ufs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ufs/inode.c b/fs/ufs/inode.c
index c9ff8673fa668..fec701330d67f 100644
--- a/fs/ufs/inode.c
+++ b/fs/ufs/inode.c
@@ -1051,7 +1051,7 @@ static int ufs_alloc_lastblock(struct inode *inode, loff_t size)
 
 	folio = ufs_get_locked_folio(mapping, lastfrag >>
 				       (PAGE_SHIFT - inode->i_blkbits));
-	if (IS_ERR(folio)) {
+	if (IS_ERR_OR_NULL(folio)) {
 		err = -EIO;
 		goto out;
 	}
-- 
2.34.1

