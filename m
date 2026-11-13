Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596237;
	b=vvW7x3bvVMZmzySWehqkstQbSG6PUvwdop1cghfd9qhBSLYn9VoGDiFNr0MzBOMFyRQm
	 itRkmZY2nuP8rA3+e8ocwdHbT26jSMaL/C7vGspR+SQ4io7eUsuYQRSC6buyyfwDks/YU
	 uzWtL5lI3QQWKkcJPac/Jq2OTxAeROD2qvfzd1uTx64GPvWWlMhfmjvH1IoJsGnM4oin4
	 yAvqFDY6f2omgMEZP5hsbA587wqV9rp8Cg7ABeXPWL8xcRKVYZhYhipwLQ0S2/gGd34EY
	 snnNLe+miyZjWBnN8+rIyg510zSmh3PDkFgkNumXGnqQxwmQWwLcPpVNuDveea7O8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
	b=DJfqOlUtEnJtTef5c1lzp1Zyxd1nzSysgENzxJliLB5WQQgoqcOTOKz8zk/Fzh1/NUGY
	 RIoqflkSoHF3Qj3iT/hff0Vak9+j9DXL+HY6pNHWV8KvRWH5lHN/4RgJoVvYcV6xdNQB3
	 kuHoVllXfuH8HT/SZpcjFjWrJDvp2wTbqVzUiFExYhsQUhfOWrpbuyxqH8lbIi/R9QJ+q
	 VPVJSeLY80XoNedJWjwuz8Lq1xZHIofNQfvHmh4FPAzX3AGpC9dwVlTUgkgeCEWv82PrJ
	 1kBaaoJ0lQJTfAvEeuEOwfhXwajMo3Sgio6XRtKEg5K59GGxsBpDYKEPqxaDDZiDYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAiexfq+;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D55606E34F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D55606E34F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pAiexfq+
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so646622f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596235; x=1795201035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
        b=pAiexfq+qkYC8Fq1X7QMI0FkAE45sJ29FhgoXsJZyIINsos26BRua00qV4G/Ra4s05
         JK1xgV5wLCLZ4uyFA0zVNpjbslakkFNqgtb+PAQv91of1E4diO+ippy4O4QZP713HiHE
         SWA4KMBVlZxaGwL0WVHg1yzIIIT8yQQGH7aoJioARZNk2yGYn6AIGls3dOO8gOa5HKYw
         +Zs046YXbPrmgs1gYCIT5cwzBj4mUvxPmCU4/079AOpzDnhtJcG70z/55m8esGnpN9Z+
         gk9GfkwDuEq4iKjp6RQFsMsi1LQuErLcF9OONRW3PtB2VUOeUqHWuEi5FlhoViOITDnA
         yQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596235; x=1795201035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
        b=U2QjMw9EOCurXn9qHmx+SoLR1lhFuDGbXUCL6ycp6BW9W2MGmuGCMQA8xcrZYPo/3G
         9ObypA3WA5Ma57tUGa6pgyJHsTTu1wql4SfjambyFFPa917KWAlnqgz/yFALwVrKI/0j
         MPqd0UTWQEOBXIDZruFLxUiS4WhKuC0Di8zkGEEnNl5SP2lHELLgVSHjcGNXvmH6v8Yd
         wTdIGhSTpseAORe1J1P/l5HO5t9Lo6W1zR7aivrU6KzHPx+8Myxcdz8YuSE7of6M2yAf
         h1tbqm63stVdIE58E/lG+jzagdM/f2b6P5OI0BjA0EKNvrspYj6NoQk5AUBZD2xlCdyF
         b8Xg==
X-Forwarded-Encrypted: i=1; AL+hErEo1aeAgplrFFUg1dnxAFTz14jTRYgInAmwUVqbTC5oSSHImdaLBvUL6UVXazs+XAfmMk6IgfmyU9gsxuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X8nSxhaz5bQAWWscW2fPPy0NmTE3/5foW0RBLHifiQMKEKfkA
	H4L/IL9BBHCgwQRmVaoLQjFduWQgDWl6sNxWpduL0GpUsjAVSPKSj0UNafrXqwAJtcU=
X-Gm-Gg: AYBFou04zILjGfJsKuI4ACfiQoiNp5Sklfz//TmDGzbzyND15FdUNWVl0iMF2KMi1O/
	mxHQj/OGXmb1xPoVpZYFeGRhcxwiIFXPjAYO12B8KQ6WsWz8Fxl8N2CANDBVe52pVXO2i/mWmbT
	Ao4bVBtvfK8yMm2nRJ03mw8uA05FS0w/EGFvm6JgikLyNy8K/4db8d7q3Pp7nsgd8qvbqpMW7sO
	JVhT5cuHjFPakT3VlHcvs+nlGJAqJAla+Q+5QBzt8P2gipyFEY+wbl2L6twJtPr/7jKl9donHcE
	1u74Ps1rNd5vMuejW/LigXRi/rFkWv1fJtkmECTFva3FOXvk5molJ0+ACwJeYmcl9eYpST0DtGy
	7X0JGdRC+SXJ6ehiWrjruCDPbW0km37C7ipujhtK9JgIYEDYb4vgu5zhBhYv0Fxri2HTxI1bt+y
	RP3zBN6/a6gADD7ay0EqLLyhGJwE1pTZBQ7txno+cchB5DBt0PQUODKNRR4w2OQeYcfhTZN0W2u
	YgOUJI9l4m9/TTm1TDjfyr5bTq3U8cb687P+Cf39JHUAXDBAXdV+WGy1LCC1ClxJ117YHWyr5cp
	lytL0Jta3e9aim7k9X1Xugnw7fR9Jw==
X-Received: by 2002:a05:6000:41c6:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-49c6fc9e5cbmr7640880f8f.1.1794596235203;
        Fri, 13 Nov 2026 10:57:15 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:14 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 06/10] mm/page_owner: Read stack traces with stack_depot_fetch_into()
Date: Fri, 13 Nov 2026 18:56:58 +0000
Message-ID: <20261113185702.1332171-7-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

stack_print() reads stack_record->entries directly. A later patch
stores compressed frames inside struct stack_record, so rather than
decompressing those frames let's use stack_depot_fetch_into().

Copy the trace with stack_depot_fetch_into() into a stack-local buffer
with PAGE_OWNER_STACK_DEPTH elements, which is the maximum number of
frames page_owner saves.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/page_owner.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index cfc31c92d765..16429e70e00d 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -1068,8 +1068,8 @@ static int stack_print(struct seq_file *m, void *v)
 {
 	int i, nr_base_pages;
 	struct stack *stack = v;
-	unsigned long *entries;
-	unsigned long nr_entries;
+	unsigned long entries[PAGE_OWNER_STACK_DEPTH];
+	unsigned int nr_entries;
 	struct stack_record *stack_record = stack->stack_record;
 	struct stack_print_ctx *ctx = m->private;
 
@@ -1083,8 +1083,8 @@ static int stack_print(struct seq_file *m, void *v)
 		return 0;
 
 	if (ctx->flags & STACK_PRINT_FLAG_STACK) {
-		nr_entries = stack_record->size;
-		entries = stack_record->entries;
+		nr_entries = stack_depot_fetch_into(stack_record->handle.handle,
+						    entries, ARRAY_SIZE(entries));
 		for (i = 0; i < nr_entries; i++)
 			seq_printf(m, " %pS\n", (void *)entries[i]);
 	}
-- 
2.43.0

