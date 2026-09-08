Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B255D876
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873246; cv=none; b=j1gRJ2S3piaNL8o6/DdLeA2SjHRugKYoMyFngMrhSSktXBEsdLthSFgYe1bJY29exvBFQXloO8U3tLAIvwaapDkX/Cop29oXh5pEsVndnB4q50c8Q55UdGn2Qd7bnGWYyJwXhmmiBbOiHNCeM4raAbcDhEbAD1kMQkKDqEuF39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873246; c=relaxed/simple;
	bh=KUMLl8Nlf4ganKmUfRpSqfk9SbXFsUXlAZxjeBAClCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2TAcPhQfKuIlwmsYQnkB2+DAKmjJTovyc5/mRdiWzYD1y6dOsQH0El8BT3WcivCRizL/4Pmm8r5zneEfdwTAdlXFewoun4b3rbE0gDeABdzxOUR9gz6Oc3pOT5rioBPqa0oYcSr3O4DEp/amfUc5fIquE8tLXe8+X8S9pWKeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jev4xhHY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jev4xhHY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c250f28f1cdso741367166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873235; x=1789478035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbEf3V3BeedaNXPvyc7QWrrndht5k6QHT5mMZYzozBE=;
        b=Jev4xhHYniEvbnzhUpYQDjzQioIO7WIey59aJFO6uB9+0oc99TAVPQHI6BysaDkTHJ
         sa21McQS7Y/vCj5EjkdIysJOPnf8Vw8VL6sTVs6oVtCbwZivSVoUVGoCZDR9y3OFY2R8
         3NwSKRM7oDfxIT8trrTcmuGrAmwmecYW49X9tTEK0qmUL5tdKEEdCx3ZjlXLXj56RSw/
         dY5ZH5vOKAVtED2J+o5H1P1/uDYaf3nS69H87HP/NNtidF+IIzDfb/JRIXrkp86v7cJE
         n23xcW/YNW1hrVao/THqTPXSAYTbLYh0drggKHMCujL+KFvnQtu1LD1ABEn3ziRYnxzG
         n+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873235; x=1789478035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbEf3V3BeedaNXPvyc7QWrrndht5k6QHT5mMZYzozBE=;
        b=TBWkiTQRj5oFfgRc5/u1AiKKPQh2jOjRYT5qV8ic2tC1fZN7TXi/YWXKrnfLgQLU6L
         qzP1QaY8Tgfbxsny5U32b0fw25CjUs33sAAHLjr2rUGBRbMoYT7sbFJBCU8cFXt+umXT
         dH3v778G2YVkY2Om7eqWWIX43NtS4QnSRVon0y1vfw1bOjI4Y5+/dmzkrRUnW51F/DMr
         Ka2tsPmseWBppb8b/mwotswjRoiTPv0z/KL2gbSRGZbqUT/v9hP2jIrnWaAM6vM5n8av
         K3eb+sY5uEnC3WtUTlNEqS3N+L0JWvGnlrxPkWcJIBCg9wT1xFu426POLZc2y/K+v/MD
         SOxg==
X-Forwarded-Encrypted: i=1; AKwUvByEugnY/GkB/CbVufwYUUNFLUd2H6bsJT+QBmvNq0tQH6vvKRKuM32PvP8TTxwzDkG/vj2v/ADxeQblAF8=@vger.kernel.org
X-Gm-Message-State: AFuF++ldyhQrmlTYcwoxNX7EieuNkg7l3mKqHPDrJW9LxYFlG9yP1xa1
	nT4BGmIOY81NoYeTEGkyIJnUT0OFsgSQXcQnb+TNroUcVWmuX7HHEaQ2
X-Gm-Gg: AYBFou3B8XzLF1T5934eKNmzwxp9CCosamArWrOGUjsG/mn7nrxR4UQ8HnFcn6aOKy3
	VbEAqn+3qykk8L/JDclqu62/RuucZSOGcb/Q//XROi9OX3cZl+sDWcv3gxReX6/gXOO5RscVMnp
	pBt9+sbknTeCqYV+ZXwGvUPdC4VZ2ibioBEOmc5T9B+uTZqX8I+3rO8hm4J6n5KSy2yjakOxM3p
	Zzz1HgQSsgsxRePh6PsV8jbl/89FA/kOczaL8uisUyJUrSt5eM9QO8nNVmGV+sVVrCsU8Y+0NhW
	Tl5XxoDaS1PqjxXfyRiq/oV19/aTZUmNoLB6DxXsK+7Ieeebjy0i4VbyEDP0qshSVEH8hZkysya
	YHsWeyipVNc23RO22qVtkZwXZrRwAxdlH9ULtn85CeO9qcQq75MXv1izmUp8VWwNAPbfszipP8Z
	FRJm7q1njT4kWNtO6CiFF4M8b+0UuaUq/8m50FTxnlmfFXvPG1+g==
X-Received: by 2002:a17:906:1004:20b0:c26:2205:e8b9 with SMTP id a640c23a62f3a-c262205ea13mr572772266b.25.1788873234617;
        Tue, 08 Sep 2026 06:13:54 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:54 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:37 +0100
Subject: [PATCH RFC v2 04/11] mm/kmemleak: print trie-backed stack depot
 traces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-4-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

kmemleak stores allocation backtraces as persistent stack depot handles.
When trie storage is enabled, stack_depot_fetch() cannot return a pointer
to contiguous stack-record entries, so leak reports would omit the saved
backtrace.

Use stack_depot_fetch_into() with a MAX_TRACE-sized local array before
formatting the report. MAX_TRACE matches the save-side limit, so every
valid kmemleak trace fits without truncation. Preserve frame order and the
existing report format for hash-backed handles.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb..c42741a88bd4 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -378,10 +378,10 @@ static void __print_unreferenced(struct seq_file *seq,
 				 bool hex_dump)
 {
 	int i;
-	unsigned long *entries;
+	unsigned long entries[MAX_TRACE];
 	unsigned int nr_entries;
 
-	nr_entries = stack_depot_fetch(object->trace_handle, &entries);
+	nr_entries = stack_depot_fetch_into(object->trace_handle, entries, ARRAY_SIZE(entries));
 	warn_or_seq_printf(seq, "unreferenced object%s 0x%08lx (size %zu):\n",
 			   __object_type_str(object),
 			   object->pointer, object->size);

-- 
Git-155)

