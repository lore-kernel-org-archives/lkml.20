Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356661;
	b=rmHqSu9LR3tmV9xT+rTk9aLWfBlefYwIpVSGpWekOMnVyZ4f9fQwwEqLP7c2s6KNAFCB
	 VQaqMN6qe8JgbIYLWzaU0qRAAV56Wr98E6EuAGFHyka3NAyAJgpg6neHwvx8N2jYm9vVM
	 Ca2TH2ETVz4Vljhir9Z9c7p6IL/y1vqVAhtmJhBIgzG2sZGejj5kIUYPDyFWojoNypDpr
	 cAsk5uBeONLfM6336zyXzE1JqDtLXi8hG2OG1Ukwsr/zInqP0pKHSDbg4617Yx0VDSzi6
	 HVw+Ha/JKrW0D3KEU9qo2gVImQV5wIsN45NPJQQbf79h7gswkvmiQQly1cUKoycTtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
	b=5Mla7mux8dQhoYV6pvNumcbUlTqA/47hFv+zS4+wz7CZtAHYZfNszwXpXXLmAUrP5nww
	 /KoHDZcdmZPZFmo2gk+rB5fz5HLtihwF99Ey2YDOJjKlzpPCzTSPc4Vov3e0bdjxrVVUl
	 G9U5Vf6WLInmVn8i0TcqSHvZXwIEmnWPNT88+KNAY79ir8FgA7DCLlM+b1qiKNed/MJct
	 BIZIQEzXwGapCaR2bQpym+QFcdRmrJtc+5/fu0r/sOLEfX3l4Ahkklkn0WPtzeHk/RZeq
	 YA29XSoAu5ykrO9WnrKbxcOUFWyhyhO52WemP8r/v8rj/YoGql8cGqXUblI5uW1s8YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE160A5BD4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEE160A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktF0P4T4
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-84586110393so2971721a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356660; x=1794961460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=ktF0P4T4IydsOsl2xKIG1UXcZe/yOkI/JJICUYtlWGIBVwTWWO7o2nZ5KvH9j8kTYG
         GfxgLbXlsJYm+M3TNZ5Cqt3ZaV2NjCvE+mocIarmHq5R3wvo2nhGbpSJlwGp7TLZKsWt
         715AvaUxCYdXyJYti6WlxqKA/OSG5pKuEgJBSPxxivofhIHT+6VfCiUZygZBnmSrbG08
         trzQFkw7qExOlUqbIY+Oniq7qiUlzPYi+UPaNqL5Pn/3pRaQGe3xFQ5J6W8xcd7P+A82
         pOvFO8tM6AKrqQTj/ny/ItiVySKg1BC838ht51HntBFxK7leytHsWbv5KO7HHM1pBvH7
         2fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356660; x=1794961460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDGpajhrmdSjBCrv+9z48USF9DLlcre7dauJ37omj8M=;
        b=vsy49PcrKBxNqrpHGinj7OJP36phRysKkYzbAyWX0cP1j9rkfm0fXBD8c+NcmsVuEO
         O4Juhq4I8b/2iJlQ4cB9hLJ3l0NqsPhliqVM4St7PT7leztiJd93wiuM2k4pxNNd+GOc
         nHxOSDGmHOnjSHXvMPGRnXM+toGxd30jv20htLp85uZ4ekWcZqROgb1+WMJV4fWi1jWc
         zkmoU98ZIBhJJP22SeAw+jvoxes9ImX7ri80aJGdlLBQpWDoPrHZL9+f1eChSCWHHsoM
         SGipvTPd7vL1rBwp1yYxzRdInirTEcgvfrqEHFcDW3JttCrH7yCIzSlW25acGBSC/UKc
         w3pw==
X-Forwarded-Encrypted: i=1; AL+hErEwq0E5vqcG44qJpTQiXMg7kYySbUfFQ0d9DXcyk5mN76NAbmXiT+wvtkY29OnODONkcsG2HcqO0DRn//Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qR47YVEVQRbSbAEojUcMdQk7H6aAxd5o8DI5+PL+61InDj3qx
	la3UnHbhdPm/s+xNOUbHp+MDgKX3jDeM3DL8OnYRvYtOrPVE1MngtR4Rkt+zh0tu00YdAMftuJc
	pbn91zeDKXr3SqQ==
X-Received: from iobgl21.prod.google.com ([2002:a05:6602:4f15:b0:9c7:70d7:1521])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1581:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-56b98727e41mr556110b6e.58.1794356660168;
 Tue, 10 Nov 2026 16:24:20 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:48 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-11-dmatlack@google.com>
Subject: [PATCH v4 10/19] mm/shmem_luo: Don't make early retrieve failures permanent
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Mark failures in shmem_luo_retrieve() before it starts restoring the
folios as retryable. If no retrieve succeeds, finish() frees the
preserved state, like it does for a file that was never retrieved.

Until the folios are restored, nothing has consumed the preserved state.
Leave it for another retrieve, which may succeed, e.g. if
memfd_alloc_file() failed with -ENOMEM.

The exception is a preserved file that this kernel can't restore, e.g.
because it has seals that this kernel doesn't support. Retrying can't
help, so keep that failure permanent, so that every later retrieve
returns the same error.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b48d7f460493..dc6ede528822 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -552,6 +552,14 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
 		return -EOPNOTSUPP;
 
+	/*
+	 * Nothing consumes the preserved state until the folios are restored
+	 * below. If the retrieve fails before that, leave the state for another
+	 * retrieve, or for finish() to free. The checks above can't succeed on
+	 * a retry, so they fail permanently.
+	 */
+	args->retryable = true;
+
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
 	 * later.
@@ -571,6 +579,9 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	err = shmem_luo_restore_folios(file, ser);
 	if (err)
 		goto put_file;
-- 
2.56.0.542.g3ef89b7020-goog

