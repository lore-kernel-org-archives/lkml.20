Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DB448D0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770521; cv=none; b=PEZx8R0wykR/SzFmY2ludVIsYnk0JQop9+4Qbf2NAZIx5TSvbkjYxawnrVYchKjN7KdT2Sz68bTX98ggjoXHprwRL5/N4eVs7FquaWtl28XImT0FFYk//KvcJQJQwWx6Sl13URjyrfVYXXxbnP1n+PyDkLxLSmA0W4usicuj//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770521; c=relaxed/simple;
	bh=i1nvPkZL8AYjVqF81FIyYnrrcNRmKU4Rb1W27F5h+8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NjUNpK+T4AinYnuIVbnCKzvqbMMGFI3u3RJGiwgevlP+fCyXZwTkVvFkxM1M3uHMloe/1k7POb2XM7xG/141K/gNFRR2RfcIPVaLpwUISMl0rSNXyhNojta/YBEEabaAaJoZ5+347x53BFyT57oXiJYlbIP3FA+QcjvXEP44uFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4vrBGJm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4vrBGJm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1832036f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770517; x=1789375317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aebnt8Kz95RzOuAHiVC9YDlZSkH27kAJite7oJqhniU=;
        b=Q4vrBGJmWjwtww+BUWpv/8w6JiSYu+NbnnOW+fX+NcvbKWVGz82harEIoNP3zvgznj
         OZ0ohv3xFp92bIur1ULntY7YMkupH/SfdcThKw4Km7ZR4kvuHEoAqhF3hnyfWX9OeIOt
         swSATzVf+JXUcz3qHlWTmSKst7SI7VZm9bMOdkXjZRnoSN+5IJnLG+eU4etKp1gnJHJF
         qfO3YkfewAkUTMWPQUx2cMXcTlXJVe4uvdwJF2lcro83m5k6mqP42eYY7TSBSiTK5E2d
         fJXYScq8Ebe9HS/oBABxaDJp8E63481qRG7QYyj759hdJze1/wNf9B9Ed6Xt/g1KKClP
         d9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770517; x=1789375317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aebnt8Kz95RzOuAHiVC9YDlZSkH27kAJite7oJqhniU=;
        b=D1VWO8pmTtJUkG+4MCJyyrjHo8jUb27uRsFhDWN/hsC5S+95iN1yqj5IkWdXLFoaFn
         QmmoQb75kdFtRcHfyR6JKRz1JLdPUJebR6mW00CiIT1AvVDlzSOjwJOtcZMUB3fSEOZg
         d66gkZ8oJRJhw8kZgH7weU+qRQyNUFYcwM1hk91hza1QqIuTx/KNwXL9PTv1HTVzFN7l
         DMyKB5SuGadilgoNYPgU3sv6YDh3fWDTuK2FRbCLSyf+qTQiEjqlIpfhM9lpvf8+ubH6
         FPulHkwkUiyeeCdMMuQ5i5oB5vlOwhaOa0fQ5vSinWNyzKR9gfh/8yB1sp/G3hNb6QXM
         y9PA==
X-Forwarded-Encrypted: i=1; AKwUvBzMmTbyg2Y/lGer2/ydtbdNsfr6Sj5iHSEjNIGQga2pfyHkOV015attVwps0KMtNuA92ejB/gLRcYGi6hE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1FBurq5yjXS9sBdUwFvz8Cpo1lNB++AnHH63xLE6XbUe8UVmC
	kYZ9DkUV5ZAEI8eBBLyWJ9Rfzdu5szv4o64Rbr77e9qjuLD2smfNfN0s
X-Gm-Gg: AYBFou10A9ix7AU0KSCBvuKImjKaedlp6YB2ZnDLFxX3GNVHF2ccF/5ca9eDiLYxsc4
	dvs9WZvHvngHtsGGDGQrnCPymbH9CONyq46ECIOJ2afyoOSrcBCI4R9W1feZ/t+a0n/2i3Bq+n/
	8iVLHkJtnmOenlFFf26WdKtTeUH1rsFkwT//ZcQEJNYTfFL/A+BpYLePHnXS6RrHJMjMxpXzdz4
	3uJ1gp4dXLOpp0QdKsNpBPSwbyUQSv1kVpaA/wxKPVNGHgvJlfti93OGAsaeMv81X/zVSVDgZjA
	zG9kLb81bl2kD85mYYFY+8Rup07hsvqhXPuTXQFTpAHIqO/8ogq5/seawvkrpRclmxFnU2X36jp
	HjLBq1meGEMJdJ0+7n3S5b4/nTYZcpinzdTyNzPAZdVSYt70k6zKr/S1qierSgkGDrcV8FL2VtJ
	bY0YEP0MQFbzizRM1qXgqAK+0fzT1XA97hR4dSXc9e6jD/oI5D5sBbsjyAN8nCeUFw0iRdpiNM7
	cvfA6/bObZMtrx3Y9S4fCFndYMLDQnpb8m6KBf8FjrfaSdcjAwN92Cr
X-Received: by 2002:a05:6000:2508:b0:485:8e8b:7bf4 with SMTP id ffacd0b85a97d-4858e8b7c78mr18050026f8f.33.1788770516952;
        Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 8/9] locking/osq: inline encode_cpu() and rename decode_cpu()
Date: Mon,  7 Sep 2026 09:41:32 +0100
Message-Id: <20260907084133.3696-9-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having a function to add the 1 offset to the cpu number doesn't
make the code any easier to read.
Just use smp_processor_id() + 1.

Rename decode_cpu() to cpu_spin_node() to match what it does.

No functional change.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 144eb446c867..8dfd729d1a81 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -40,19 +40,10 @@ struct optimistic_spin_node {
 
 static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
 
-/*
- * We use the value 0 to represent "no CPU", thus the encoded value
- * will be the CPU number incremented by 1.
- */
-static inline unsigned int encode_cpu(unsigned int cpu_nr)
-{
-	return cpu_nr + 1;
-}
-
 static inline struct optimistic_spin_node *
-decode_cpu(unsigned int encoded_cpu_val)
+cpu_spin_node(unsigned int offset_cpu_num)
 {
-	return per_cpu_ptr(&osq_node, encoded_cpu_val - 1);
+	return per_cpu_ptr(&osq_node, offset_cpu_num - 1);
 }
 
 /*
@@ -74,7 +65,7 @@ decode_cpu(unsigned int encoded_cpu_val)
 static inline unsigned int
 osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 {
-	unsigned int curr = encode_cpu(smp_processor_id());
+	unsigned int curr = smp_processor_id() + 1;
 	struct optimistic_spin_node *node;
 	unsigned int next;
 
@@ -118,7 +109,7 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 	 * When called while unqueueing in osq_lock() this completes the
 	 * backwards link, the forwards link is done by the caller.
 	 */
-	WRITE_ONCE(decode_cpu(next)->prev, prev);
+	WRITE_ONCE(cpu_spin_node(next)->prev, prev);
 
 	return next;
 }
@@ -126,7 +117,7 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
 	struct optimistic_spin_node *node, *prev_ptr;
-	unsigned int curr = encode_cpu(smp_processor_id());
+	unsigned int curr = smp_processor_id() + 1;
 	unsigned int next, prev;
 
 	/*
@@ -140,7 +131,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 		return true;
 
 	node = this_cpu_ptr(&osq_node);
-	prev_ptr = decode_cpu(prev);
+	prev_ptr = cpu_spin_node(prev);
 	node->prev = prev;
 
 	/*
@@ -189,7 +180,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 			/* Lock acquired */
 			return true;
 
-		prev_ptr = decode_cpu(prev);
+		prev_ptr = cpu_spin_node(prev);
 
 		if (data_race(prev_ptr->next) == curr &&
 		    cmpxchg(&prev_ptr->next, curr, 0) == curr)
-- 
2.39.5

