Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514197;
	b=R8PB2DB024HBO5rKeuhpdOOzlOMznqSC6IgsVShbvAyJ9f9/OwV31K39or1/apHHEDFl
	 AGiPFqmiusETCvkDHXxPjt6g3Us59bLK7jLj0PQu/KrBz6e9IpWqhP0AvC1A6CEPO6+7m
	 e5MrcNyuJD5XsZgnmT9EHoA5M22UDYpyDZw+ylfgbvhSQEgUwtpXWwaJqh47nFayJ5lUF
	 PI5I0XBUivjyXDQ/zFFxII6EZPDuid2KAPrkEQ0zx70ICyAJrqh5YzgJuwnZeVIV3RnQz
	 8V8qszFpt4XJ3v1cGNpc6sLv7NYzMhLCbW8SCbeVMZkGE9F3OXrnQbQchWDfAPpazIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5JhajIzD9ubXl5M8tJbplpixiasXJVLRaVa00eXAjQ=;
	b=ffRnoFKmqiCC8X/kEleRLImwBbiLiNOLvHsTxeaBh6uqkVN4cBHJTTWAA6Wu7wGKdJTY
	 Un49Rc91kjofcqSryNKwvXo9+L2TwMz0kIBNC2VfCX62qvpTyoK6/Hs++GG3VP2A/YH6H
	 rVMnRl8JlR1yPIUXfZ3Y+r46wCIbGlIzKd7y0j+qv1wjaKBgm/t80fFA4BCVOI9PxoHm/
	 XQ/lG4K+rwga1suNjm9G3LLhC7J5Ug2Lk4DCYrepimWcwdJlwdotENb2J6NZEcTqSyI0Q
	 T1ZPDqp9b+kLIiCGTRlZ++/K4EFkbkojzKFrRKREczMx85npk0L53UD3MLrMNnGC/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoSqufGz;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F418606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F418606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoSqufGz
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso939796a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793514196; x=1794118996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5JhajIzD9ubXl5M8tJbplpixiasXJVLRaVa00eXAjQ=;
        b=NoSqufGzNtrHCJzWqkLelGubERrGQOSlrCqyXZd/fOCZxBvIqDVAy/Wms1m4X6xNPi
         KQ8yi4bm7dkuXwOUpqCYlNYmCWY1Z4qnhRyrAaLLk2QHE4wsuC3XrN+kFq5YGxIhz5z2
         1lchgQn5znNJTSGVc49Q4+Bcla5oWygzotjQlwUQuHHR0bipU20tjMwqryKj+O9qLcn2
         ctYNi8rcuRASdkz2tvFLUZWlDiBqeBPrK9MFundNCtt4xHyr9eJAMh/EX2G2w5B2fTM8
         PAN4t8BWLMsBNjOcj03C4mHOfysX7fqZL9XE5151gQFvXdyrREmyqPQu6gzcNKtzYX1G
         M6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514196; x=1794118996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5JhajIzD9ubXl5M8tJbplpixiasXJVLRaVa00eXAjQ=;
        b=iPK4wJ0DK5khUdZoIFxbfglVgd/FWopMJ86XJJ0JMzfvI+s0ar9oEpnDdZa909Eqq8
         D5UPiBZDgN30iZSLkXGgr8d4LynAc+mAqo/Ga1uJLJZf5uyWGQ/Z8TrMXvTxXV98w8ab
         pX5PIVZQH74JBJuwZBJNSlhvYmtURICZXFet76fATHY5LpXqeiPaONCxPUF4H8eOD5G5
         TJBPROm2ko83klhfoBHTDftOfYQncs2YOOyBmKhRKz+2eeNCFZTSYlD9wKfWeLB6MAYO
         8WvCjKrzlnUJchX3DEgc8di9g7ddVzg6DNMcOqy5hdG/2vHY/0YKezl7HXJElNPQTGep
         KrXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVt1j+2FSf3MKRfJGZY9KvsdUhE3im/CmTrfeSRDbEf7plcdfW+X5cNN6BVIOsL7gzPdTAw+2qxpvefac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LTgShv5ceSPgQSodZ3unDUEhRyE50RSGw2NT2Ath6gOSj3SLC
	z9+InTu4+1+Bv10ygYLyI/XfeRFiC/NQpOQfZ7x/ktPye8IMdP0tvDcc
X-Gm-Gg: AYBFou1w27XTMIfwEetM8JTLN2sq8PmtCX+94ujRaYafx3Dv32bVSZI1Iw77+Xs92ad
	vH5SHqS9zZScXudOaSrcIUXiCo1GrLyxxwF+2pa2z1T1zaygLD8N+yMuo5ygR75f+asc1Q8m3EV
	3/xFDBNLhSxkNEMnCAyfGfNX1T1eOS5c7ajI+8XYjkth1OiqrWMiGZNL/KiO6fUMsrG+YhK7P++
	9pqBikMV0Wfu5xW3+sSoesQ4z62ZNdJHisNe1orkLC3uQgNkmcBgSqG1/PCyGS6Tr2yuX5mTbrN
	ER7kHLvtlxGfy4UC2jKkVArFiIJPUDpIhjT9mtxIpc2+Ysof2aUN3tgozg2SMKltCMImVUz2zyj
	3+rkIexPkowm/g6c5gPayhxqyjF+KV+dsILDnS4LrU9ZI+gwZyq6us6DZ15XUNy+TSFMLlK3bBq
	UDeHeAF26f73cUzZXuI02XsBvixYcz+HmVEef4AxF4xVb8xYNgLoue5LRkPe99yeWRf5SH0vUPi
	40EutmomP5XP4UIjg8/lOb+poeYG0MlKCHZs0ECyfVvUEDvKnP29+a3mfJV+AbB9Qbm4KKdwv+h
	sfvldBMrfInSoonljB9eBLrl8eLNu91glTfzToipqeCak+ANAOaojlo747MnGMghm1EMwDMui9r
	BdvQlosaA74PI9s2L05YtPgiA127Cx5vu8FkDKIGvyZ2ru5rixOcDVRzfXDKaTwU64FCLu+xHim
	FAninP9TR3RBxt+g7BbFI=
X-Received: by 2002:a17:90b:1d47:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3ae897c3dc6mr5582405a91.30.1793514196302;
        Sat, 31 Oct 2026 23:23:16 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm9505181a91.12.2026.10.31.23.23.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:23:15 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] stm class: fail stm_lookup_protocol() when the protocol module is going away
Date: Sun,  1 Nov 2026 16:22:53 +1000
Message-ID: <20261101062253.16528-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

stm_lookup_protocol() returns 0 whenever a protocol entry with the given
name exists, even if stm_get_protocol() failed because the protocol
module is being unloaded. In that case *pdrv and *node_type are left
untouched and stp_policy_make() goes on to install two uninitialised
stack pointers as stm->pdrv and stm->pdrv_node_type, and its error path
and stp_policy_unbind() later dereference them to drop a module
reference that was never taken.

Return -ENOENT unless the protocol was found and its module reference
taken.

Fixes: c7fd62bc69d0 ("stm class: Introduce framing protocol drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/hwtracing/stm/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index f48c6a8..5fbea4e 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -468,6 +468,7 @@ int stm_lookup_protocol(const char *name,
 			const struct config_item_type **node_type)
 {
 	const struct stm_pdrv_entry *pe;
+	int ret = -ENOENT;
 
 	mutex_lock(&stm_pdrv_mutex);
 
@@ -475,11 +476,12 @@ int stm_lookup_protocol(const char *name,
 	if (pe && pe->pdrv && stm_get_protocol(pe->pdrv)) {
 		*pdrv = pe->pdrv;
 		*node_type = pe->node_type;
+		ret = 0;
 	}
 
 	mutex_unlock(&stm_pdrv_mutex);
 
-	return pe ? 0 : -ENOENT;
+	return ret;
 }
 
 static int stm_char_open(struct inode *inode, struct file *file)
-- 
2.43.0

