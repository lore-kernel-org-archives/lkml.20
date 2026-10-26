Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051581;
	b=tPXp5OR31L/ecoG/3DrjkobH7K9FXbGBPMn+SiPDSmxMN3MM6DVM5JL5nZjLIQ3RZzzB
	 QqQnSo06Y8DtSsPkQwmSxNM+zYt7D9yoH76hLliXXTbUeSE69c/kxZRyzU1RPg6OTSoKx
	 M46m2HKqcPS7KVikxlkReEkjH5a/SlPhmWmMmwORsnByknH+eHd6+jzr/Lo9j2eB/TbgX
	 GpYNSPUj3ntOPMRAxCPjzolRkfW47oZWYTU+AnydDZ24efKH+rv40mf3JKOa/Edgh8RRa
	 8RVf4LOKt+sUAXGq52eIRBsQ/lL99zSTCklUcA8xIzcqSxWvpxb6hsLsKmtM/J6mDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CxmWryDZw0sLLhu4Yu8pG4ro8w6TSaSVJ3F6CzsZUrg=;
	b=ioR4WO0CztR4FpS1kUdSSNSphIyYfkqXegUmSDRUTsULHz+Dv+//QcP/ViYtCQlla7ZD
	 g4sgq9qCQhzZRzG8X/nWJunHjdB+BJe15Hx+eBb44wk4aSudkhWQUxvV1Nr9gBz0omg2a
	 f0BisfFn8nycevID2zg/4HomIy9ZQezHc7IZAlkppKpCV6dr2kuCb3MuPn17BqB4i+8P5
	 B1AurZQ3f8ExUnVV6PvWwtc0QnQ5Fld+ViWiuwG3dPv1gHVw0xTGWgKfKI1S80c/DRTHB
	 mIQYGzhHzKAgko/8HTzx5iMsr3VWkBLYl1S33Srw+YcNAse6QBcSRLztl9kkW4qkTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vwBVk4Eg;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C360A5BC5
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453C360A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vwBVk4Eg
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso3742018a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793051576; x=1793656376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxmWryDZw0sLLhu4Yu8pG4ro8w6TSaSVJ3F6CzsZUrg=;
        b=vwBVk4Eg09FolRMa6tRB7d5lsew1CjWLZH1mRph6PMJYmgjTNheP7Sd4o5eGAMvAyY
         V6sX3O8qxifPaSM8SAimDe/+474bzlMc2Hcqs3VRVifNP9e/pO75qbo0cfoBQ/27vhk+
         JXvvG9sZISWS1NB0aufLlMc0OIIJHXqaCUXAPnJL4/0XCYPBLthPEcFHCd3d1mhXVjBH
         uW0/e9bzH62zgLC2NePzoB0tOVy9OUIaj99j0tsvFGNNDGBEBfG+TbAY7CA/G1KN9e2s
         0j7vDCaNYVA+byW3gUlOfgD/e4GxYBsUCGsfK3BvvvyuSSHn51A+ijlMc9HrDdl/yQvB
         Gu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051576; x=1793656376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxmWryDZw0sLLhu4Yu8pG4ro8w6TSaSVJ3F6CzsZUrg=;
        b=lMH+pRYwjiqmI2khm5r/IHGSByToov50JxKJLFMc5aCW17e1pJtM0gbI7LMUGiZQB9
         mF7cYjfNC4d+B/4iuE/80On+uma0XiC3PYP4/bHl/GQ2uipDIG4DZ1q1h/dvJoQfXCgx
         ulXa55WDTXkkgCLpACtQstpJ7vxJRPDfNKA468tksuL4Kfox9tPoZRNZtfEDp8D0MqrS
         G2oCvsENM5HZRekp08McWET8UpRHxdRx68rlNg3bVXu1WWSyRXetUkAYpWIqmduxqB0s
         sndbP7HwmIKVVAK79w4NIas51iT6EbZNv+/2enkhaB3bSSOn7ycxxH74zXqXfz9a+cQP
         G77w==
X-Forwarded-Encrypted: i=1; AKwUvBwZuZAiz48L9NpAs/gUaa081Vi2839jNc3A25a03rur6lJNodfl7pHdIHCALvViW5I/aMVC47R6afbaJUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsClxOafbY3br9kNgzXY2oqghbyF5WCeRwJU+s6ox8xJfURtad
	K9S6zsfq7RLNSnWyoVUbMN82O468ihEWdJk++8xqb1ueEIwU7oGoK7EIdWxzmdcIAuVfntl6oAO
	kP3EigYpWady/9wfF+0UvBw==
X-Received: from pjuy5.prod.google.com ([2002:a17:90a:d705:b0:3a8:211b:6c8b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b8f:b0:3ac:450a:f9d4 with SMTP id 98e67ed59e1d1-3adeb16364bmr7181921a91.64.1793051575471;
 Mon, 26 Oct 2026 14:52:55 -0700 (PDT)
Date: Mon, 26 Oct 2026 21:52:25 +0000
In-Reply-To: <20261026215226.3713941-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026215226.3713941-10-jthoughton@google.com>
Subject: [RFC PATCH 09/10] uaccess: Refuse and warn on more user accesses
 without an mm
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Several generic user access paths don't go through the copy helpers
that check for a NULL current->mm. Add the uaccess_without_mm() check to
them as well, so that they warn and fail without attempting the access:

 - __scoped_user_access_begin(), covering scoped_user_*_access() and
   get_user_inline()/put_user_inline() on all architectures, including
   when masked user access is used.
 - strnlen_user().
 - check_zeroed_user().
 - The iov_iter user copy routines that call into architecture-specific
   helpers: copy_to_user_iter_mc() (copy_mc_to_user()),
   copy_from_user_iter_nocache() (copy_from_user_inatomic_nontemporal()),
   copy_from_user_iter_flushcache() (copy_from_user_flushcache()) and
   zero_to_user_iter() (clear_user()).

Only check for a NULL mm here rather than using uaccess_should_fail(),
so as not to start injecting failures in these paths.

Paths implemented entirely by architectures, e.g. get_user(),
put_user(), clear_user(), and direct users of user_access_begin() or
masked_user_access_begin(), are still not covered.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/uaccess.h | 2 ++
 lib/iov_iter.c          | 8 ++++++++
 lib/strnlen_user.c      | 3 +++
 lib/usercopy.c          | 3 +++
 4 files changed, 16 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index eae204f7261b..7d26d2de9599 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -781,6 +781,8 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
 ({									\
 	typeof(uptr) __retptr;						\
 									\
+	if (uaccess_without_mm())					\
+		goto elbl;						\
 	if (can_do_masked_user_access()) {				\
 		__retptr = masked_user_##mode##_access_begin(uptr);	\
 	} else {							\
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 21e2ccf1e8f2..a0769874241c 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -204,6 +204,8 @@ static __always_inline
 size_t copy_to_user_iter_mc(void __user *iter_to, size_t progress,
 			    size_t len, void *from, void *priv2)
 {
+	if (uaccess_without_mm())
+		return len;
 	if (access_ok(iter_to, len)) {
 		from += progress;
 		instrument_copy_to_user(iter_to, from, len);
@@ -277,6 +279,8 @@ static __always_inline
 size_t copy_from_user_iter_nocache(void __user *iter_from, size_t progress,
 				   size_t len, void *to, void *priv2)
 {
+	if (uaccess_without_mm())
+		return len;
 	return copy_from_user_inatomic_nontemporal(to + progress, iter_from, len);
 }
 
@@ -296,6 +300,8 @@ static __always_inline
 size_t copy_from_user_iter_flushcache(void __user *iter_from, size_t progress,
 				      size_t len, void *to, void *priv2)
 {
+	if (uaccess_without_mm())
+		return len;
 	return copy_from_user_flushcache(to + progress, iter_from, len);
 }
 
@@ -451,6 +457,8 @@ static __always_inline
 size_t zero_to_user_iter(void __user *iter_to, size_t progress,
 			 size_t len, void *priv, void *priv2)
 {
+	if (uaccess_without_mm())
+		return len;
 	return clear_user(iter_to, len);
 }
 
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 4a6574b67f82..45709798eb8f 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -96,6 +96,9 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	if (uaccess_without_mm())
+		return 0;
+
 	if (can_do_masked_user_access()) {
 		long retval;
 
diff --git a/lib/usercopy.c b/lib/usercopy.c
index e2f0bf104a59..9146c729c47a 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -48,6 +48,9 @@ int check_zeroed_user(const void __user *from, size_t size)
 	if (unlikely(size == 0))
 		return 1;
 
+	if (uaccess_without_mm())
+		return -EFAULT;
+
 	from -= align;
 	size += align;
 
-- 
2.56.0.307.g5fe7bd680c-goog

