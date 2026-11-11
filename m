Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356649;
	b=jb67xjz2XXnC/mnX6giaiW71tAxUC5YI2og59cdlwY79cjLZVB88gikO2MhvwvsXt3ee
	 1rXk5vJ7hs2EAI8TVhDjTpdS2Qvd0xL5yL+IQ2V73O7sFoSd3NR14E2rzmvJa7XPyztO5
	 YlTqfH30jn3ED056hkeCxP2QKM8Xhpf6jU0VR8KX3QKH4RWJKRJqhLkHj58qbbCxXlEoi
	 SzvpvFpN+SxSgRDEDZmyVIMcpc3G4l1gd4OLmuys592lV+70LUUjfMDZ2FCICkcuvw2Fb
	 EJ5HprNx7siDzifYTKMlXu7zCeu6VxdoUEnNbCLt3BZmHVs9pI6FKuAoQY38aNIEh5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
	b=NR2pgJsFKq3j2QS7I6veJGiqvEIs28sAcZ4ZROIBLRHZi46HuAdDWpwJsPUVRFSLTupE
	 vZyMlTgQSZI+DbfJvMPy1lsG94DQ2UHdwXrl4nq39m8CFNKc3Op1bKWJlBR4+PoZBdt/R
	 3edYqbYZSzZ+MmmM84gp02887YpDcwLTE86lUQX0aIQpPSbHZC+8eIziwek7FlUAiLGfG
	 R0kTQhI534440an8kbY1Moqwi8asCQOnVayKIpblga3jMsvjjFCb1XnuL88VnA8P9s3GT
	 ks1vrYfsIQHI18CyLaXgC5oRT2pw8u+inSYfrDp6SZQ1+TOwF/6f30k8yRk9OxIWm/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKjKVt5f;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6144B606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6144B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKjKVt5f
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so3965372b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356648; x=1794961448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
        b=NKjKVt5f9XkfM7CuoIFDdkDQlHdtM0MKBEpsfvLZnwD9mUhdF49nghThwKCbg/tjdK
         hgfZT8pLuZum4ckqFw7SeWG0cAhsoRsXo83NIItg2fmhSWU9fXZgGxQwiwOgZtcyrvHJ
         73giSbswvAqqY7Na+Ukrt6vD3KdnejPS3opbZbg2vaB7dZzSAOQ7xRqyUohhuSOsT9oI
         Cn80aCNPHwY0z/1hteK/M3Po8gexhZdicfOfS3XXdFjNML2utHPdR4Be98oqzhvmZ5g/
         DGkADkkHabW+2AMRdEzsWN9Zsf/TGw5rTbQZljgGIebkGHoGyLULbzVzbfD9fV7Ruydk
         mZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356648; x=1794961448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hRjHNT+bDawf2n+fS4w87yYb1rrNIQllzNnUpN3o7M=;
        b=X2voiXMl1RXnFRjKJbUtZsTtFRFJm3+F4FvOht9Y/hEhjgvgmxW7ZsRzyIiv2yvB8p
         SOj8D7q0iKyVq7e/y8QRmlwEj/hajWexQfpBmY82CcAuhgot9reI3JRqzrBemhNJnKqq
         FqbjswcrWxSVjN4e150NeHFvjw9cjNtjnwbZLDh8gJ3RB+wkTselYK2T63MyuY3x21W/
         gToO5Czzg2tk18hUw3Th7qjFHxc07YbP/Bopn659lVRQaLthTitF6sO/fqvA3ZZFmL7l
         J8nrICQCHzDI21/A4EXUKwPvs9Op5XqjwgQuB+qB+1gD2L9BZq1+Of+glgikHIswLVYE
         2iVw==
X-Forwarded-Encrypted: i=1; AL+hErFJs0XmOi7LZSPnwW/CO9yJCoi8R9RkPE4s7uVUlcRrWwy6JujVHgBmRcVjutjbmYnYLNYawGVHBMt/SgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9brh9q8iyAvBsF4GGzR6leCYkGLSlzQAqt3ryFGxbVT7/u1z4G
	4NGsDT4XE5ANgzQ/K492lYnhlCGeS/OW+LqMeByU4nDVXbgGq/b1xZhUD+prA/MGM+ZAIirhDVl
	vqFauXN/xkkrqmw==
X-Received: from iohf2-n2.prod.google.com ([2002:a05:6602:a5c2:20b0:9e3:4940:4cc3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:13cc:b0:567:fd8f:403b with SMTP id 5614622812f47-56b97b17653mr680403b6e.42.1794356648195;
 Tue, 10 Nov 2026 16:24:08 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:39 +0000
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
Message-ID: <20261111002358.1842967-2-dmatlack@google.com>
Subject: [PATCH v4 01/19] liveupdate: Remove the list of steps from
 luo_preserve_file()'s comment
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

Remove the numbered list of steps from the kernel-doc comment of
luo_preserve_file(), along with the sentence that introduces it, which
repeats the first sentence of the previous paragraph.

The list only restates what the code does, and goes stale whenever the
code changes.

Suggested-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..a42b60356d52 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -214,18 +214,6 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * unpreserved or successfully finished in the next kernel, preventing the file
  * from being prematurely destroyed.
  *
- * This function orchestrates the first phase of preserving a file. It performs
- * the following steps:
- *
- * 1. Validates that the @token is not already in use within the file_set.
- * 2. Ensures the file_set's memory for files serialization is allocated
- *    (allocates if needed).
- * 3. Iterates through registered handlers, calling can_preserve() to find one
- *    compatible with the given @fd.
- * 4. Calls the handler's .preserve() operation, which saves the file's state
- *    and returns an opaque private data handle.
- * 5. Adds the new instance to the file_set's internal list.
- *
  * On success, LUO takes a reference to the 'struct file' and considers it
  * under its management until it is unpreserved or finished.
  *
-- 
2.56.0.542.g3ef89b7020-goog

