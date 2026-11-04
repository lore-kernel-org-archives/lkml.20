Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816930;
	b=0PorklmDreSfFBds+o8WCrl4IJcnw5MLwelgKJ93V632osZrQF/yjs36BfqytRZ7kp+u
	 4V42O9cNZ+qP+jVIU1OSiIJ5Y3AHXqlsFOJVt8y+g6i3MrwDagYj0PQR4ng84EzT3C7Or
	 /cyVYBEgyejEXAktaOLvkhSKv73Q6b3AvqHJ54MQmV79Ldw/isTSNHkwZt/N8ujL6gP5U
	 r5GqJ61UN5XQgWeDaEUp08YrpQfukzdGxD2UbwAyWFMnhdznGTfT9y3jaePZ4ivoiVfub
	 PVsmABnCEyovo/fw9dpGBMPfpbc9MT+I4l/cKjPVkxank3D93OgKuB8tWBXqqpL9rfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfV/MIPNusOwxGNpLw6806W5l7124cFpZSpiDn2muzo=;
	b=lHezdeuuWa8hcEfWKrpkLCWuTI3Hv6BscFI/kCjO+N9wsjr0Hi//R/XceAWF0oD6nO0I
	 XNtO4IkjX4V/LiC3Yo4UGUyi8mraPcj2+8lN7hE/Wk2Qqx7/F22jqbRwjOnOQ/um6OIG4
	 8XcQcYawi2zuO1GO2HyrgZ1YE2JbW0lYloss7ibELEgS04kBm6gSuclHnfXpo4eTQ/e0a
	 35kcz0Uc/UMAnIyVf5ShZz8uJoKD6TcCUA5QM9Px2UJkoQsLzjHRG8LuwZJX4fFtHspWc
	 Dj/inwjsYkKIPi9+HAD7XHwhQqtoc6heFXzRryTV3SgYVPjU4kZ+AKNHKrseJQc9SXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKijh+zr;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E16606A8D2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E16606A8D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKijh+zr
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b2ff7cb617so2970727b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816929; x=1794421729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfV/MIPNusOwxGNpLw6806W5l7124cFpZSpiDn2muzo=;
        b=LKijh+zrxR0KzT3Pe3wS3BowJWj1KgLj1Jlrj+30oyYQ9jT1KGrjNromsNrgcSmVSj
         9UFypbc7r5t2JPM6byoH7E0yC3plnVagYffApOuCITZ7O5ewBrIxfgusuP7Ew6FiBXls
         YT7v6aCHXThL0OH5hTa0VoKfs+e9GJM5kLUYgwSgDp+MyR4azScvffbSXz+8ECVfuwdc
         PZ0t9qVL3e5J2WYKqGUmowb5656ZbDERDcV6GF2741KeeK7XHt3s3bCuJybO2Kkd9/TN
         9Mk7pcRg3h5aREBYU7MuOmFXdw1zj/aV9XBdPy3T4mogxUupwxFalplpTrIxz1MfYKq3
         c4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816929; x=1794421729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfV/MIPNusOwxGNpLw6806W5l7124cFpZSpiDn2muzo=;
        b=SOkwFAOYGr9z9WLNOvzFHdpHRlm1Hw8jD71GpXAja9bXygEo7w3s4D8l3si/vdXPfw
         mHsYJ0fwjZwUtuPDWALmu+dz7xqGVsPr2KyZUhehHRMHxpRpOaWtydsQSMeAlbIorKRc
         8Z7+ds/ymPloMBNKPY1MwJwpFZgklgsH+7+h/mIep4u0vaC7PAz5DfY5MhS+DEROL98P
         bQN4A5kqhpAdOahiBpsNTPm+oRdtaSnezofZv6Rkkfrm4KLqDM7eTrVvBph5tn784XaB
         6YQ7TGPQvyQ5KlvwE+Xou4MdfGtSOQZTV0eg4faOQ6Oopj0gfrD0X58ipku0uGY+nv2T
         9+Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxqo8N69QER0lmfCtXQpz8QlO9sc3sHUiGt/Sn6LtaFk9VEZIT+mH+69gxcwQSotidyUaHT3pAE7fDU0LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OFy/mQnNCo4NkTPgXUEBXqqOR7t9UWzUSkJCOqz/ve/5lTidh
	u2l+GSZQdneGDBholYo7yK0w75EADc0v6t9KNTEyNO63rNPmB83GyiNLoJaMolP2opw=
X-Gm-Gg: AYBFou3rw5BdRp4xChC1wERng6EeZrvAPqwJ8jA+Suxc7FYIswL1QC9QT0ujroJn+NB
	692T+X6PbiXWqQG8JQ0qMKKqoHso9eYjRn2dGnVjUKk6oMt9kwMpyq3POIC1sjAIgfqWaKPByCK
	1gRLJRj1wSjp+l9YbFMvIXiUvWZf0pEmX7gP6WElqZmHnL2IA2YgQ1yYfo+oHKoXly2l66CPd01
	1CqszPWEOAqy7o9o2NbmdZmlFr5tbrhwumHAaTt5Da5+vXJrq/mSNKiwStSLNva18jcdYbgPDK+
	t8oSjEhThiBkRQsNmYWSPONZoywbfcJOOEbDxvwMFRTK3xdwByMCvKsx4d0e9iDCdiOfFP/UAkO
	3o7bJecpyFt36chYIK+6inHnZ5bsP9pOrFvM7WaqlI7o53jFpUDiJk9n783L0sRT5dvPqLWsJif
	0myIf8iqgdJFSY5CKq7wEHvrmdEI9FE/VlASHxzp0OniS1FWCIYRtHAEJCh82Id0Kl+YinC3UFI
	RglZzbCqv1YMPDRmw/0RJg7OcDGBUW5qVaZZvWoD7PGhIu7aXMbE+fsTGKmSu5C9ss+5059u7PN
	FBFvCbJ7b6LG3W5aQJryntb5iGX3+dz1fN3I4psC80BPoXIF2b5ZTNji/9d4BlFTPuLxAuhi3b+
	H9LgxpNGXuoAMv6Q2oVMl5ADMSyUZ3MTWpqxAjrLLHgfC77hbjpjtpLVaYA8=
X-Received: by 2002:a05:690c:8f:b0:8b0:acc6:8e89 with SMTP id 00721157ae682-8b2b66ce839mr104568597b3.11.1793816928629;
        Wed, 04 Nov 2026 10:28:48 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099291d7sm24336017b3.16.2026.11.04.10.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:28:47 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: willy@infradead.org
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	lczerner@redhat.com,
	tytso@mit.edu,
	hughd@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] mm: skip empty finite ranges in truncate_pagecache_range
Date: Wed,  4 Nov 2026 18:27:00 +0000
Message-ID: <20261104182700.88789-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027211505.22044-1-dennylin0707@gmail.com>
References: <20261027211505.22044-1-dennylin0707@gmail.com>
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

For a finite range ending before the first page boundary,
truncate_pagecache_range() calculates unmap_end as -1. The unsigned
comparison then treats the empty full-page interval as nonempty.

For example, lstart == 0 and lend == 0 cause unmap_mapping_range() to be
called with a zero length, meaning unmap to EOF. Punching one byte at
offset zero in a mapped FUSE file can therefore remove mappings outside
the hole, causing unnecessary page-table work and subsequent faults.

Set unmap_end to zero for these small finite ranges so that the existing
unsigned comparison skips the empty interval. Explicitly handle lend ==
-1 and lend == LLONG_MAX with LLONG_MAX, preserving EOF handling and
avoiding wrapping in the endpoint calculation at the largest inclusive
end.

Suggested-by: Jan Kara <jack@suse.cz>
Fixes: 5a7203947a1d ("mm: teach truncate_inode_pages_range() to handle non page aligned ranges")
Link: https://lore.kernel.org/r/20261027211505.22044-1-dennylin0707@gmail.com
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Compute unmap_end directly as suggested by Jan Kara, keeping the
  original condition for calling unmap_mapping_range().
- Handle the EOF sentinel and LLONG_MAX explicitly.

 mm/truncate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/truncate.c b/mm/truncate.c
index 733d2713a87..2c1f4a6c336 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -945,7 +945,15 @@ void truncate_pagecache_range(struct inode *inode, loff_t lstart, loff_t lend)
 {
 	struct address_space *mapping = inode->i_mapping;
 	loff_t unmap_start = round_up(lstart, PAGE_SIZE);
-	loff_t unmap_end = round_down(1 + lend, PAGE_SIZE) - 1;
+	loff_t unmap_end;
+
+	if (lend == -1 || lend == LLONG_MAX)
+		unmap_end = LLONG_MAX;
+	else if (lend < PAGE_SIZE - 1)
+		unmap_end = 0;
+	else
+		unmap_end = round_down(1 + lend, PAGE_SIZE) - 1;
+
 	/*
 	 * This rounding is currently just for example: unmap_mapping_range
 	 * expands its hole outwards, whereas we want it to contract the hole

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1 (Apple Git-155)

