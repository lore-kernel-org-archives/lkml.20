Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709444;
	b=iB9yYJbXEuiuREH2k9ag27z1BvOLYKJF30j0pTOTcg4UxJAXetVzkBimLV8dNrjK7JGV
	 WjpqbUu5l0MyEYbTF6JS3D6GGVhoA+sw7RlaHUoOc8UK3prsn2mZEYluy0PH7ehRTGl4s
	 qTvUirao5AeVJY4OvMI7Aa/I7SvrygMLPdDg3RAJthqAWWlApcRyWOjpq65nwofIuek8m
	 0vngxQBsD1QwvcHnnUN/wb4OewvvKNH8+OEFegsCrW79dtMySih2guweRWRwZ03a28JQw
	 hLcvtiH0aA9l5xnRlTjJ59ldpt06pXCIwiVKZhstn69gZVMXIVzchfDCe87DN6KqUtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
	b=zDghpJwLFULR4mmaRtRY1wPG/I4HnoSJZvDLYlSPV+LwqQz22nog4OrKuyxEoYlIj0kz
	 Co5lV4Ua7IUrAWKgcCDXA05TcNA9+Zd88mXcTfKsviPXsdH3aRxdOUV0xblUMwjZ/VEdY
	 GJ139a8+JGe9krmEW8V+FiED8B/JBJ5BtUUo0mczfSfOZvjHi/gwCxB9Ea7xrrDa0dR5W
	 I1CnSEWBd8XpFjsrTaYeTDDN2aZjipVik8AY4fvwLsaU9292X8knyOs/I5bCFcQSbRGom
	 VrS2/KVV8KNV+kg3UN0PG5i9zhyAgv7+iEoKBkA4Q2B2r3fcspNdqtWWsDshhtewF+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UoTAISlE;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036B60A260C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C036B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UoTAISlE
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so208303a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709443; x=1793314243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
        b=UoTAISlE/91yBob+bwMgrlWqYNQCNr5RPpY50/0+tAhyyo3bQJqYclA4fjAygzqX/L
         bBHtrpBc/5EVuBGbYFqfqjS4m2bAFg1tefkCVk9bngP5/tncX+6Om4JtWHXo8CROXcX7
         G907zBUFyc8vJV4hV9kDzq2PPI3b9CLx9TYYsB1tfSr7LhzCdWxpzpRUQN9zJ6MueZag
         N8X1/0DBEkrGJh+meVUw3FYC9DHMnLLXvaiVtfDS6pHSFFPLnxibV6m2IZVN+sdYra/n
         EzF8ODBxxhvBQWQh58Xkay4AuciFYq8Yf0IPN1PXTu6oeJhf3px+v7SL7D8WTkCkqU5E
         3GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709443; x=1793314243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQzlgw3emE84DnnF0oN4ahYTo145Q34I7Y43hlPChX4=;
        b=bjWT4fvIMl6pW8ugQw1IKe0SU6Ws+iuKdjK+U0MO6EDPE8NwgesBG5qHlq0MM1BtvQ
         OgxBCMjnfUvROrIvsppMQTE+cBLjbYLRHmx0KoaJsjSOV/AnEEOyOxRlo72ouA4TMPbl
         6x0MsYXc00o9PesQFZLbOnPdFxQ4+j0x6OVc3D3gIZjPRsl2Fbp8dIUpRQnHEq642gSU
         SodVF60vj0anBytfbQRqRIwPBP+wCx2o/bTFcwR+wVa/0iFltqWOf9qwEb2UQu/7r/wZ
         0J5iid0s9MsPBANCqOafIZCbsRLLkAZsSBaoGYJqUDL2V4UlZKTXhbKlppPVAeU6Lw3x
         +tZg==
X-Forwarded-Encrypted: i=1; AKwUvByKyCCeoQCETvDL2VYgoviyXNbEG7/TISNc/JoPy/0zAkE8KsCrHLN2qEPZuM4ylxJ2z8AlPI9ZTGccees=@vger.kernel.org
X-Gm-Message-State: AFq9FYIboif8A+qwTORxZSjNeADUyBiyhWt67l4gJtjw/P5w03ERZtUL
	i0CfdJSYQIjG/6EVbzNVT24o/fNqjjRvMqA2FFqF0StgMDrw8tU/O8UPdtsZ3mtTT4TO8oM//hc
	9KT9lJ3nLrZXMrg==
X-Received: from pglu36.prod.google.com ([2002:a63:1424:0:b0:cd6:b233:e4aa])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2785:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3adce45d4b2mr203170a91.44.1792709443059;
 Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:31 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-7-dmatlack@google.com>
Subject: [PATCH v2 06/10] mm/shmem_luo: Don't make early retrieve failures permanent
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

If shmem_luo_retrieve() fails before it starts restoring the folios,
mark the failure as retryable and return the error without freeing the
serialized state. Nothing has consumed the preserved state at that
point, so the retrieve can be tried again. If no retrieve succeeds,
finish() frees the preserved folios, like it does for a file that was
never retrieved.

This fixes leaking the preserved folios when one of these early steps
fails, e.g. because the file has seals that this kernel doesn't support.
The retrieve freed the serialized state but not the folios, and finish()
then skipped the file because its retrieve had failed.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/shmem_luo.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index b8d86055912d..bcac1bbb3db3 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -390,9 +390,9 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
 	struct shmem_luo_ser *ser;
 
 	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
+	 * If retrieve was successful, nothing to do. If it failed permanently,
+	 * retrieve() already cleaned up everything it could. So nothing to do
+	 * there either. Only need to clean up when the file was not retrieved.
 	 */
 	if (args->retrieve_status)
 		return;
@@ -526,11 +526,16 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (!ser)
 		return -EINVAL;
 
+	/*
+	 * Nothing has consumed the preserved state until the folios are
+	 * restored below, so failures before that can be retried. If no
+	 * retrieve succeeds, finish() frees the preserved state.
+	 */
+	args->retryable = true;
+
 	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
-		err = -EOPNOTSUPP;
-		goto free_ser;
-	}
+	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
+		return -EOPNOTSUPP;
 
 	/*
 	 * The seals are preserved. Allow sealing here so they can be added
@@ -539,8 +544,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
 	if (IS_ERR(file)) {
 		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
+		return PTR_ERR(file);
 	}
 
 	err = memfd_add_seals(file, ser->seals);
@@ -552,17 +556,20 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/* The preserved state is consumed from here on. */
+	args->retryable = false;
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
 			err = -EINVAL;
-			goto put_file;
+			goto free_ser;
 		}
 
 		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto free_ser;
 	}
 
 	args->file = file;
@@ -570,10 +577,10 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 
 	return 0;
 
-put_file:
-	fput(file);
 free_ser:
 	kho_restore_free(ser);
+put_file:
+	fput(file);
 	return err;
 }
 
-- 
2.56.0.257.gf7497c7d27-goog

