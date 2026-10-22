Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670930;
	b=vuazxWQz26wAys836zBQlggCHuc2DpX6fjJ7KsR35Hi2IBXUuYGwI8IQRQCtjIDKbBV6
	 PzsCK1V6zLZ94I37HHV5N8WcNJDrxQZ/+2mDUobWt2FaaZ1SY/uvi87x5Knz6x24N7fNF
	 xLSsyh+4ylkE1MUi1IPI35fFWPFXfEG0hwbKwmzY81f1aKApsSd4D4PmzUyljlJ5VHrLl
	 vYM4WiIzQ1oz3/pjkqrQsfjEt9ojaruz+NJDa/Kr7vclyLqQlCnX9xGOhY7wBRjpvZn3y
	 qInfY4Pxaf0OQy6ylIqSp9c2LiiC+jhSJHqtmjTHHn3zeiFpDJWUZYto3pxc3PLF5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N+7K+g7Y1asdLnQHE4wpaKr3SeOPLMqo9gr+h5TTsW4=;
	b=ZhEf91algNAXVv7iKGHr+XVdAFI+zqZXSZ9gLrLcJTHFHERo+fPP5WDsXTHyEXisUFOh
	 ALEGF+HHeVc5J92D1OfL69Q0/qq+835WZ6yTOipbJrpTzrZ35JnUQfPYFO9JLRGeWr3DG
	 G0cKCEJ4atITyajUiFP3HjScqlgQEg+ADsKGEqnktOtS9NlAyG6ZE9eHeqCNp7sw8uSHn
	 iv/6pSFBVnlGyRQZS2NRooe5s+uQ1NUa0QKvGZlE5AlCI/+aaQ3aUNuz9WvD0kY1wnIl0
	 HSFBzTdDP42i/9VKcFea7UmXHhk9So68tV3Piulf8Rhe9/RPiMq4wZerIwidyMy6XXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kgk4iqux;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA50606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA50606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kgk4iqux
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so2372781c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670930; x=1793275730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+7K+g7Y1asdLnQHE4wpaKr3SeOPLMqo9gr+h5TTsW4=;
        b=kgk4iquxFgYXjtTTHWGpRRY9DZVAal9dM88gnVTLPb8BMzxHQ5h19povlCpMP56vHc
         n+VnX2aCifiUGM0Ofj9g6aSmkFzRMHkIjzOLK9u1fJFmiOahEBda53RBPT8ZOFp0i6R8
         vDgsHLXHg2QI7jUewciB3o4G2+BeNJkZSuAA6+JetKAYPbUXnOw5/Uvj9mbcboNiOeBl
         Rokd8UKBgGgLqcBTxmetCKQgBJ9hJuAi0TAQg4Pjb8dkOr8tTjG8qduofM+GS2WRdWUZ
         JtQxc3oIlc2hkM5KrZHXOb48tDu+7mjI3wInhHSwWBLkPrEUX5EnH4o34swFlKffgCxf
         VXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670930; x=1793275730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+7K+g7Y1asdLnQHE4wpaKr3SeOPLMqo9gr+h5TTsW4=;
        b=daOFK8dgjkU+Qb9X2WufbD0fIpIRe6MretNdo6fxrndwL5VNWdsPDKJkz9p4j5IiFX
         We/PBIITwE4YKduPNIGedE8zFQ2wEJ4Exd6yd6j2HlPkEdxvkeCLPzCPXW1q2mm0lTsI
         0etO/TpChvvBdQ+dsRoGofSQzpYN1lVO1sV5ZG0upVNvVVmZpkSP3eKgcVNyo5HtfOZW
         GWaCkQEFnw883cyEmpiw9bgyHNH6qpW6Hv9CQZM8Mq4HKtKHFrPViDqjmyJ9soG//AUx
         JnrDS8QPaH5R5Psqy4ByuCzfmj+MVcTlYJGbopOTIZkSBUGu//ctLnOaJw4zhdMaIf9Q
         uNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRolNBRagp4HoSREz/VaSBUZOmzliG7w7UTWcg+wHAYxxutrFGsQhhad+vCSbhioRvX+8M/zn/CohTg3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhLdvZxnlMBIyJEBLGpte3l0cA6n2gXBZ4PYziRjuyQlLxxUcV
	Z5DwipWJo4rBgLj1WpztUWCScszK9EOOTWof0bcH+kJ6/M46+MSuSxR3
X-Gm-Gg: AYBFou2foppVuBQK/fJNG7x0C6WrM1OZj1MfM/g+cqqMxK3OCzkfCdTIF7D+/9g7WzW
	ZF11iNpczIdC4NwYixdAaI0eAlWmJyJnxNjwHsGqvzUwvC40MXHaXGOijyGPs+I2HNXiBYgi0Y8
	raCNFEmuvT8HwuZy/pTKsG5luOIroRRbeYkEBvNj6gjmUP+hi8AOXpRqEf8ZvXY06vWxl6QNP1j
	OPBUYhlKwYmV7OuOBaIYd5Zy3VAWnUxqqB1XvjjuMaiUj6vIKZi3IHgI80nG/joDl7xp0v1qXv6
	hPunG8B5Lyr/+yAoXkiq7w2voLzn2mMVfxj+/Qio074dFY2v9l9oxR5Opn7Uq+IchfBP18Rvdie
	ebrwFeITgtv5HKn/daRWdBTXNOhihP7+d64n7y/np8W9gky9wUqbPv+ybsrFt+mK34QFmVNLGFU
	fMrmiF6Jb0CZtX8H7B3a12JOLjgdmkSpsEnxpkmdNtOGPvJUdmVNGZrwI+qpIfOG+E1HcktWslN
	WlAWashMQRQk3NFg9iQQGJNoiOBuxsPfuDoh7X7zaH+af3L72VFq6383jI=
X-Received: by 2002:a05:7022:f85:b0:14e:d0ba:7569 with SMTP id a92af1059eb24-190a0612740mr8360111c88.6.1792670929457;
        Thu, 22 Oct 2026 05:08:49 -0700 (PDT)
Received: from HP-Pro-Tower.mioffice.cn ([43.224.245.243])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm14930176c88.22.2026.10.22.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:08:49 -0700 (PDT)
From: lizhijun3 <zhijunli.leo@gmail.com>
X-Google-Original-From: lizhijun3 <lizhijun3@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: chenzhangqi@xiaomi.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	lizhijun3 <lizhijun3@xiaomi.com>
Subject: [PATCH] f2fs: fix to roll back SIT update on segment allocation failure
Date: Thu, 22 Oct 2026 20:08:32 +0800
Message-ID: <20261022120833.1698722-1-lizhijun3@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

In f2fs_allocate_data_block(), SIT is updated before segment rotation
since SSR needs the latest valid block information:

	update_sit_entry(sbi, *new_blkaddr, 1);
	update_sit_entry(sbi, old_blkaddr, -1);

If the subsequent segment rotation (new_curseg(), change_curseg() or
get_atssr_segment()) fails, it jumps to out_err and clears *new_blkaddr,
however, it does not roll back the two SIT updates, so that SIT may
record that:

- the new block is valid even if no data was written to it;
- the old block is free even if a node still refers to it.

Not every failure stops the checkpoint. For example, change_curseg()
returns PTR_ERR() if f2fs_get_sum_folio() fails (e.g. -ENOMEM), and this
path does not call f2fs_stop_checkpoint(), so the filesystem keeps
running. A later checkpoint can then persist the inconsistent SIT, and
the old block may be reallocated while being referenced, causing data
corruption. The same stale SIT state can also be exposed when pinned
allocation returns -EAGAIN and the caller retries the allocation.

Fix it by tracking whether SIT was updated and rolling back the two
update_sit_entry() calls in the error path.

Fixes: 7d009e048d7c ("f2fs: fix to handle segment allocation failure correctly")
Cc: stable@vger.kernel.org
Co-developed-by: Chen Zhangqi <chenzhangqi@xiaomi.com>
Signed-off-by: Chen Zhangqi <chenzhangqi@xiaomi.com>
Signed-off-by: lizhijun3 <lizhijun3@xiaomi.com>
---
 fs/f2fs/segment.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 63b712d3d599..033a3b8bf426 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3908,6 +3908,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	bool from_gc = (type == CURSEG_ALL_DATA_ATGC);
 	struct seg_entry *se = NULL;
 	bool segment_full = false;
+	bool sit_updated = false;
 	int ret = 0;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
@@ -3958,6 +3959,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	 */
 	update_sit_entry(sbi, *new_blkaddr, 1);
 	update_sit_entry(sbi, old_blkaddr, -1);
+	sit_updated = true;
 
 	/*
 	 * If the current segment is full, flush it out and replace it with a
@@ -4027,6 +4029,14 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	return 0;
 
 out_err:
+	/*
+	 * SIT is updated before segment rotation for SSR. Roll it back if
+	 * segment rotation fails.
+	 */
+	if (sit_updated) {
+		update_sit_entry(sbi, *new_blkaddr, -1);
+		update_sit_entry(sbi, old_blkaddr, 1);
+	}
 	*new_blkaddr = NULL_ADDR;
 	up_write(&sit_i->sentry_lock);
 	mutex_unlock(&curseg->curseg_mutex);
