Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B274A3D46
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461911; cv=none; b=ABW8Kao24cFLjAxx34OEcQ0OiKse9L1a9qaO6X5tdfaKKmnZe8e5OT6zZmj6S8kdmP44s/ZZjsUGsNtO3phhd/tNvKTWr5AuU3zEJcq9NJPkAy97WMQOmUqizCxU4Nu/dwtirAX8gpTV7h+JYUgxeIgeFN7lhey8dfoJvkZdCsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461911; c=relaxed/simple;
	bh=pLp32tAoUOy00uCEiYMD5HR/iTyFQrXmjSsM/RDp7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVSfi/8RhTpxI/G1EPXKrFWaWGwncdBBDacU4RuSaeUXDJma7bXTlLd227jLoVT9xqT0F7vTMvsP3IGFTb4cYQV8csKEBp3NM0p670EnZS3dK4b+RX32xS1K5HqUYHnhg8mqMCyItAIWx8WDTG7MJo+u7XXSVX6+PoAykqCFWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orRsSsMY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orRsSsMY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db858d60e0so37511165ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461909; x=1790066709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zXHsB/KfJwBbRNPmMoCi7j36VYfrXZEr7cEEFDuLOM=;
        b=orRsSsMYz0m1gQ2twQRgGIcleGquvAxTQncB4Bm9YZidkDXVpAbxFQnfygTSHEiZSL
         1q3Ewiu8W4yDr77koPQpExsv8fLBlGZ5CFC5Kj4XPvfS+Th+gkokrbTPp7qRzY3TNLlH
         1m6klP/VfSKknM2EXyh8RkyzFNoNmnp0CPtAxBDN6d158l2JRIxTWlC/LoXjnf4byDei
         eF4gdI9aW501xAtIl8LKPvRcOG0xCbh72CStKzkkrWirXJzNNjy8UwpVzqojsS0wH2wC
         ohdclFIuAZHGFwrZ2WcNS7+RGlEN6IG18HU8BVepsRRLIPoRUUTuh+fbo4v+iunxyBPL
         OMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461909; x=1790066709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zXHsB/KfJwBbRNPmMoCi7j36VYfrXZEr7cEEFDuLOM=;
        b=J1rw0QMtH6HiXvdTPKq9YX7rdd2TxDuo4Yq1HvDi9kHjtQ8W8lsPFW4Y3naX9U4d6N
         CCBZVgk4PPEKAjSXoSSBzKZ2+AZgsq3ph2OAaMLYhdNg3dX/MAsv3JDTZqL3DiVHptbK
         6r0LaT7v2OlBncuwGg8tIvDF5w6leUCeDIfQcktgPpc3tiEUJec5MBXTnrC0iEYE49Rf
         O4qVdyNyYuU9E9yoJgp6lDepbcYRebB5VYdr5M33aT5fJ84YPr0fGe1TiuzFz5+V2O2Q
         1hj7tOF70x+bT2b7mAzGhrs5Q+vvWu/h/1sAVtqOP2xc8swG6Dp0qnluu1MaBwHx6vo1
         7hTw==
X-Forwarded-Encrypted: i=1; AKwUvByfU0d0KwnO1CdmAFnmv93VRWCDNVuOxgw91IudKIKs2vjusA3lmfCzU2XpKU+n3FvKfn51TJAiwrfCu00=@vger.kernel.org
X-Gm-Message-State: AFuF++kR3Ct9ZUW8wvoh7S7ZcJnlxkOIfuRjJy1mk+OxGpVRiHuqyfnD
	/rUoHuANPJ8N58yfItK+GNtGRQU2GJSf1lUe7K9zzUK9fiyzdFVRx7o7
X-Gm-Gg: AYBFou3+Pg8eekFC85wlHNLQFVHlvLru20je6s75s0LNi1m+xhF4Dm28ryE0sTUgGNT
	T0X3uDWYdhUiBT116SIU7GPwrN6Je7MAqG3LjBnNF50smGSzoLD9MrgJ1Z56T3CIEE8MlXYdp/Z
	iSatQpMOurbmS1HRlSc+JKnvkrrppMrfwqOiAbWuEhZaoW/r6rOXBitqxxDfE1BxyX949uWoVBB
	kojnUlwSfo2UCC2lC2nSTwNUGgjp+WTejP/Ys/32iljEk0ZKGglE+88+0zGRX07u3ogV+GxS8lN
	3eA1a3ZSc6e5J/a4qlTRJcVjOFn6LMv73gXyTyWqmXnJ76LUqNvLyd5iENinRvFUk0bqcTZkmrJ
	9GvC0UsxUsr6dpkSt5pX7nk9VZAtxsUJ+e39Fgjs//HEz2LhRSEAJgK0HAVwOd4r5jj24m9JKBx
	GiANTNtghsGNt2yySeqflZM43oUAbBLi2GU/8Cq/5nbhMdQtfgVbr4EMhJpWLNp7+ZvW/6DXgMG
	SX5r9oDLqBxJV9jkC2r7vQCUA==
X-Received: by 2002:a17:90b:5886:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39df253ee28mr10940715a91.22.1789461908851;
        Tue, 15 Sep 2026 01:45:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 14/23] ALSA: cs4281: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:15 +0530
Message-ID: <20260915084424.1007757-15-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/cs4281.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index f51f4bb63766..27ceda6278c5 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -324,7 +324,7 @@ MODULE_PARM_DESC(dual_codec, "Secondary Codec ID (0 = disabled).");
 #define BA0_SSCR_XLPSRC		(1<<8)	/* External SRC Loopback Mode */
 #define BA0_SSCR_LPSRC		(1<<7)	/* SRC Loopback Mode */
 #define BA0_SSCR_CDTX		(1<<5)	/* CD Transfer Data */
-#define BA0_SSCR_HVC		(1<<3)	/* Harware Volume Control Enable */
+#define BA0_SSCR_HVC		(1<<3)	/* Hardware Volume Control Enable */
 
 #define BA0_FMLVC		0x0754	/* FM Synthesis Left Volume Control */
 #define BA0_FMRVC		0x0758	/* FM Synthesis Right Volume Control */
-- 
2.48.1

