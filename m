Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981080;
	b=YUecpYWkvCeetqTVaTDeYVJ/BAq/HI60CKTlgM1OenZQ3GBdDGRvP8q0FFrugptf13sh
	 aTbJxxKo+hesMxkk3NNAdPyBTmTvilZL0XOlE78kWTpU0dbgM97IjAaIyMRb58sOFXicZ
	 Pwlgt0khWRZDg4bnLgitsi9QWNwVkUY/6aoeDPGAOmfMq9zKCYPPb+SlL87sAVXIuq3S2
	 XZcXzFHUNUI/V7qIcgNAbxwUwecyCb0/t4vqJUgGjxdKooAN2afEbUgqLWOUl8pCMNzyH
	 D6szgL1W+V4J1DlVCyndsL9Nt4n6aSbHk6qiHoH+2J4bp9GXpl/nkxwnwjEnncwfJdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrPqOBbmQTC7cKWIEZPDDl/+MmJimjcBhJLEmrI30vM=;
	b=RcJBB3aNnPWoCbSYEs6Es1bp2sBu3U1DHs0vCtd9Q/e3Q3PYIBhXtsO2JAk2TW70jA9u
	 DGS7pEbcLaGU1eLrlgpnY25rAJey65OKaX5oYBzdqazQBui4JX0qZzUtq+zeKjikbL8xs
	 mYUrMXAVL5IQC+2ArcuFuXACp8btmQIsBFVvwVr7/8jnj6OnZL2LAFtBylykQy14q+SUF
	 Uf8KpR5yMk0Kxt4aIObKYBbMj4x+uPFQNhgJ/WpGnmjf5/4KH7ZuLArLf7E9CEOrM3/sF
	 83IVrLwJ3C8oCJbXFmo8jNht3KxS21heEZEAjXn6OCzA3vCNSxtRXzHQGOzp/YbnAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ff7UR6zH;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFF606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EFF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ff7UR6zH
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0d126f631so6908717b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981079; x=1794585879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrPqOBbmQTC7cKWIEZPDDl/+MmJimjcBhJLEmrI30vM=;
        b=Ff7UR6zH8D/UYE+JNHj2vEDlM3salg3JzD1PfqLOOq12vE1XOB8Vvs/asg27NihOm6
         K+csszUNlCm4+bG+3OemETdsEFrsxQ3YLKf5mCeKol5MlkcRqjF4CPE1V18SsyX1n1JN
         QFfASz6m/ekYiqsYcjr1nOcHE7ADAe/1Q5Sv1YGsyZT6EGXvospr2lMykh1TnnT/lxLG
         6Q7C2J0dkHXxADXJ/xwcr+mFJHPsky4I1dNsVAs/WHa1dbWkUUCay6kNGGamI/UaLjtm
         w+3qKRTkV3k7Ov5ug/C+PDxWRkzras9X5JVzMXf5YRcPRK5rJo1jEy1HCEjyDmIf3mWl
         iMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981079; x=1794585879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrPqOBbmQTC7cKWIEZPDDl/+MmJimjcBhJLEmrI30vM=;
        b=u4tgtpHVZKstWs7PQ8beu0i46yIWEygiMluXe+JcKhYIgtpUd++oTuE2hH/DsqhUdW
         KcKCXA0i9H+drT/IvF54ekGmCHOiDxSmH6zTMNAdYErjdHQXuIEycIhQkQgE/y5TfUiy
         yAbDVvXKfv2WVOksZoRfyq9iu8TL8RpRG2xu6sU56Y02wpguVX97vRIDvKrAT/cy9jOY
         34cWPfco6K8fDwgmVrU91vBtiadeV/ujKRQKt96cLXYQxeBC/Z+TKUbVKhqNv4JGC29g
         6bFkNKSp+VQQ6Dex478ToNtbJ+hRyDf8qaqtuUBTqaMutm03ONxTN6A9oqPMAZH1jUqw
         aLpg==
X-Forwarded-Encrypted: i=1; AL+hErFgc0zzrIevsTwj+9AOlpgAKBr/Bqo50eT3Fs1fkoTWDhssMc3Ol6wLx9RbvQiyyNBoZg7EO7qY31RjDLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YQegM/6FNLF/dlZYWd7rKTbsMFqaqOrzHnE+B199tjovmnza/
	Q4NMtrsysTl/KMx+Ibt6bh9agxt3MjB6/NgLNYlqHvPfcqwr/zBQdIRI
X-Gm-Gg: AYBFou1wUfPpEEpSSdiFnlbqRH/PXmHxhjVXv7pUZRRydOzWemI6uSBmqIhfRjfpJKg
	OR6LBZ9QzKyEbF2qh8p5+UKlNQMb/ftQeF8SX11uqBaouDmWheBTNAHvSykScIQny4dlGdX2wed
	3NIXkYu9/M5q7kTeqLvlag/Z2bi6jUbIWAu2BS6LCaNu9ejDQxUcq03sThrSqiZYhggjjVCrXzD
	QwwWLvomw5Ln2VZFdL9DUi73vnWksKaoxkfSH/gjILf5DuqTytKfasslWY4uRcDt45N2+//74Gx
	BRgfARJW8iJU1D7d5ggpwaXay4zNqMwYTgSKP6pkGlBOiOusodbKUewlzhFsUHcgJAmxNpgjBRO
	cyOKy+sT8O6mBBmCvd7rBKnLpIJW2s8avZhVWRg+4X01Zxd/rSxOcivob4WKce6m5wz87tcj+hC
	+H8gamf30jIelyN5vYlKozqR+WRt6jyImWERphJ+RTKERmKJme5AHTsBoVhKvSq/h6AP3N7CwyR
	3Fg11iUXan1nTqHxHyFhozM7PsCHX1PBeXfYQ9mAhTTswGCLxsqIv7BGop8+mB5PxIiX5Lkqt3n
	hDe+j0vdOvJWNA3PGPEp2gCXK1hUxv23D0dqo3cZ/IJeODBhm77JztBHvFaSUpq06I5w9MJvMTg
	bj0plmK5Wipe8diRWOcuFSQ2gMdByTG1jmy4awg==
X-Received: by 2002:a05:690c:930a:b0:8b0:ca83:c5a1 with SMTP id 00721157ae682-8b34157e11bmr14898427b3.0.1793981078714;
        Fri, 06 Nov 2026 08:04:38 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:22::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f7cb4eesm21953687b3.16.2026.11.06.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:04:37 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	brauner@kernel.org,
	chrisl@kernel.org,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	ljs@kernel.org,
	mhocko@kernel.org,
	nphamcs@gmail.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	weixugc@google.com,
	willy@infradead.org,
	youngjun.park@lge.com,
	yuanchu@google.com
Cc: stable@vger.kernel.org,
	ryncsn@gmail.com
Subject: [PATCH 1/2] mm: vmscan: allow writeout of swapcache folios without anon mappings
Date: Fri,  6 Nov 2026 08:04:31 -0800
Message-ID: <20261106160432.2552507-2-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106160432.2552507-1-nphamcs@gmail.com>
References: <20261106160432.2552507-1-nphamcs@gmail.com>
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

Unfaulted zswap readahead folios can be dirty and in swapcache without
an anonymous mapping. pageout() rejects them before swap_writeout(),
so reclaim cannot write them out while their swap entries remain
referenced.

Allow swapcache folios through the filesystem folio check. They already
have swap entries and can use the existing swap writeout path. Anonymous
folios outside swapcache have no mapping and already return PAGE_KEEP.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-181078@kernel.org/
Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7db6be53f3a9..4b014e3c07bd 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -714,7 +714,8 @@ static pageout_t pageout(struct swap_io_ctx *ctx, struct address_space *mapping,
 	 */
 	if (folio_ref_count(folio) != 1 + folio_nr_pages(folio) || !mapping)
 		return PAGE_KEEP;
-	if (!shmem_mapping(mapping) && !folio_test_anon(folio))
+	/* Anonymous folios outside swapcache returned PAGE_KEEP above. */
+	if (!shmem_mapping(mapping) && !folio_test_swapcache(folio))
 		return PAGE_ACTIVATE;
 	if (!folio_clear_dirty_for_io(folio))
 		return PAGE_CLEAN;
