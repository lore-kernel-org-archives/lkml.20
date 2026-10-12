Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838C4CC62D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838518; cv=none; b=B3h1hZgi4R7BXrfL/zAQRjyrh6raZTzJNufbBSavEmsp4SL0hnyyCvNMOkjfhEpPeFfNK7QFr4VU6drzQTDHp4UQ4bL1UVx/QJi8KdoCKgxlI7e10mquF7mhBBTE1N8h8WwwHeOwBQoTC3EgAOKE+6drm3LT7nCreH3gPTCB8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838518; c=relaxed/simple;
	bh=h0PplBiawVa7S4Amkyri+VVGvaJkaMBRAxOzxD4sNhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7pK9a1TLMtEPyCYuGVZhHga2CZO0HUP06jx8TVFeFzsx4e+Etq/W5FWkheZOu0sDvvA1xuHdZ4p5v3HupZWHGbPTxGfbmzfsDD5xX8ayv3cnXzUH+Jj4K3ygjVHxzVHKluM7yISdAzwSg/fF6O91B9ulK0RNZYrg9eor4lgkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=EAxlLg/r; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="EAxlLg/r"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so1713985f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838510; x=1792443310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoshf0ayjIN/zktQbCOgmhPRix1kYVIFgS6hIX67uLk=;
        b=EAxlLg/rA/rWDEK+pNmNcuCs+2o8ET638Ur5t7IwLX5/ReuQbiIEjZU9G+hL2pJSJn
         kLIgFXGJ1tvY5wIIFlNy1pKMD53hadXi2fImC5jv/i0r46fjSHyOmDtPFyVIm08W663R
         ky4/pKQ11FHKCOS51MIa233YaLn4IKNpmCr8WIgjIU+w1WpDmCgQq0CbXLY2y4iNgCVw
         gRCHwlTz0/RJzNc8YnJHeJ9ZeVYopdImO3K9aoG5ZYSHwBM+Gzs9AbEK98rX0whJzM+o
         3rSgOGD/imilguoQKTnVLR7v54yBS/kdUDjHgfpgPhtIg/LTqkF7AZIVwnXNRJSUJia8
         btig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838510; x=1792443310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zoshf0ayjIN/zktQbCOgmhPRix1kYVIFgS6hIX67uLk=;
        b=lgx/gePCvuBZ4+bTO/zZvC8vYs4dllGtnjQQn2H3XGz0q/dCVFKB/wEcWjEHxIThaT
         trqRuUTFwBGuQR/BcatgvhpPe1uC0fea6l37UAHHQKUkAqvx1XZbxDlYHEtTPibmNjIT
         OYFTrL9uegV5ZNiM/Iy0oU27mQBvoNeLakHyRNR8XrHo5K8vQHgvUnMEPjFgCpCf7D0x
         FP1eeTLfjKO+v3a3basERvoa0/ToaJCWmVvIv85mf/NLTyMVT7VvdknDsxAzR4PDng/o
         BcFnOV+Yc2VIiLS/15ftIBGT+yjMt0fAXH3oN3jSr0USS6hV25KV6BO0qjeSYnrLTXE8
         jZOw==
X-Forwarded-Encrypted: i=1; AKwUvByNUy/3yPoCWBQLBwBI/idhM3fEKKIVTDlCcye0mJ2ThxM9F/iLEpGdecFyx4iboKpgnpe289CdtgstvZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs5oOb2QjSZNlq1AHsr+3sm4T8T8rjrP0yf16k3JL+Pl35hcz6
	15IkMTPyNwo8NyCr/3Az+msz/4l0C4hF6Xz1sudRRnygA65FV8JBmZ1MzHkgdzpkgdE=
X-Gm-Gg: AYBFou3MWOXK+OO07MXDkrzehJf7CpSpnOUqvajHCkMCKJ76p3njZmwe3bSBzj9M1xU
	BH1yRZdevgU3hft4sOZKEujQDpdOGc+OK+h0MEDKidT8OmIn5B0a38WZf1Bq2Hz3ym6va+xM/23
	LBUMqArdZazbmOZRLPDMPT080Ozn0Yh7P3yjy9tYc8ZNU/4U9Lrriid1Cw22U+ELQowhn9LIOif
	4gfUKU9mA4Y/TFbX6p3XQScMfUKkUOBaeCMMrXg511BZoKuIhOTPYdu0n4Sy98lsuX3l1XGn/hk
	IyLpxnx9UpJys7CWxW9ECPZSWwSPzCJTJbi4fZ2JhHtDAdOTKekjlK5utAM0GGrvhZmiFvy5tTd
	FdweVZwcv4XB6GWZicFPIPn8Z1GbYX2vA0btB0sTxw44p1ZY1U/nYJvnRcN4Tw4nu5/UDh3DNw5
	KEFPxF4br2n9BXG3FQKVykhv3ASA34q789/9ngW165EoJLmScOCbSLZIE9rYmjfw+ROERCWOnfL
	mShWlXrzLtLhzZLb5stLeAAT99EP8pJbLmtYUJCbSd4nJ4YfEgyV4v41NcPJX3ZKpD4Ys9Sk8A=
X-Received: by 2002:adf:ed50:0:b0:48c:7caa:12cd with SMTP id ffacd0b85a97d-48dbaae379dmr12995250f8f.22.1791838510474;
        Mon, 12 Oct 2026 13:55:10 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:10 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 4/5] mm/mglru: avoid redundant rotations of young memcgs
Date: Mon, 12 Oct 2026 22:54:46 +0200
Message-ID: <20261012205447.2717801-5-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012205447.2717801-1-max.kellermann@ionos.com>
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Concurrent reclaimers can request promotion after another reclaimer
has already moved a memcg into the young generation.  Requeueing it
into a random bin again adds list mutations without advancing the
old-generation scan.

Therefore, skip `MEMCG_LRU_YOUNG` when the memcg is already in the
default segment of the current young generation.

In my micro benchmark, this increases the request rate by 36% and
reduces the average duration of each write request by 27%.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 69976df5d537..922c59eb9629 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4445,6 +4445,14 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	else
 		VM_WARN_ON_ONCE(true);
 
+	if (op == MEMCG_LRU_YOUNG && old == new && lruvec->lrugen.seg == seg)
+		/*
+		 * This memcg is already in the young generation and
+		 * reshuffling it again cannot help the scan of the
+		 * old generation.
+		 */
+		goto unlock;
+
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
@@ -4458,6 +4466,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	if (!pgdat->memcg_lru.nr_memcgs[old] && old == get_memcg_gen(pgdat->memcg_lru.seq))
 		WRITE_ONCE(pgdat->memcg_lru.seq, pgdat->memcg_lru.seq + 1);
 
+unlock:
 	spin_unlock_irqrestore(&pgdat->memcg_lru.lock, flags);
 }
 
-- 
2.47.3

