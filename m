Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667751;
	b=WGDVckaiT2VS3qhIP1vEXVfpqCeTI1OhEMCpwzzpcm09McD26kYbw0dxT9fCXZ4ri5W2
	 u2aR8DAb6lxX7i/ipJJNqVCR6TxuCC+5l44U/NtjokrMVZ7On3loXajebfNAEGYa90iQp
	 azkPuK9Ju52sMQcVAYu/ptM9j2Rqp+jZmQjBKZRM4snnbeQ2++jlnGfU5xQFeGdF9nmC2
	 D1f2HS54m2vAMESpjnh1JRJXlAM6Okl+UmThCzrCXxvly4rGcQ6alqqVNtwyWHpBaQbNq
	 1Bf5AoehVipLyG1tFM/5D03Nb16Dy8fEhMaj4ypv4yfQg/NJJcD1WSFNEsnCSeWAC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
	b=Vv7p8ZSO/2pOfvAKolW2jIz0XB2JiE16znv0ohCLZa47fm3G/J0rzy91qTMbIPhllnke
	 HKF9xBfj5mMAXTY5iMe4HAwlGQClxVlPBF3h4Cj52Durbu5ckPvrcIHsAlI4fQlZxBg2R
	 W7NUqHrZ4tzamK2iMu7R0aKYlWLnesBL7d1h4TzKeZmxYLS0yi5dymV6H5KuxSpS+RMOh
	 3vGqY2rR57E4PW8lkpoTK7ZD0lcPomPyXoYhjhuZ/EnR7Ka2v8rhTnzY/lb6x+cgcEgXa
	 gn5oCX48L0NZQWO2/fSsd5D2E/HBaY+mfx/CUvASu9uRLBUiJnHyB9snhexeQsJoMyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mJbpzdJe;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0049606EE86
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0049606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mJbpzdJe
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2469036a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667750; x=1794272550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
        b=mJbpzdJeCyu3yLHXZt69+nxo7Lzx8OIPb7UjQxO3/IG0xDecGkx8g7oBQj+L/Vmgak
         hFwhFvkjkivAwFqBqFjI6cR07zDgZ3xu4sKysNz8o+rbZGiqP5XmkQ30RXBmknw+JocO
         aN7ppu+Scs1Sou3v80lw6C+mkOI9RJ2vclculwNEBgoI/j4eqvEZWR1/NL8luKM1yR4f
         i1PJ+VrhfbufiLygLzqdMEcDRDIA3j4twQyV9uX5jetASmz1Xkb00cl4QFLaXfRCFlV7
         6f1llRizf1eCppAtXWBpdhZyODADSkRrFX5nrvxYHExc52yN8D2Pqci1rwboebJsRX0w
         s2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667750; x=1794272550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNS9XkUpb0odYgcS4hw74G9m0QCGpHkW7/U/VrcLoMQ=;
        b=nFcrHEUze+DNLKVB5Cp/3XCOYRoycrzjudfKqprxjE5fJ5J6Fa4A1tn11mZ3J9NHAV
         n/ZHSEdxxbKgEPCTNlOcwyCeix+5ztTZ59lNDjWiZHBnBp+oFM2SDiuBiFNZb/lIh8cG
         nQqG9CtLvIxIpjOh6F/ZnR2vOiJawIPkDF1nve1ja5YgnBjbMXXxlvU0wzqv4edq1GTq
         TIhMZqzM7FtJRDlF/V8Jc33/bWdcRglQ+akUWuomyy+3f0nNeIj/F8LgYZ8v2gFde5eC
         cIFMipVJFCByMtV19ByYOm5EkUluqm+X0hqOsjRHnxG6EwfAYuuWppnAsMqgDJsdOQ45
         EWGg==
X-Forwarded-Encrypted: i=1; AKwUvBxPEUIoTON4TBMfq6GvxXWuXdxpHYhafDrKkzAohNWni3vpmsDgE8CaBu8LCD+cbBo9IwHNb/6Ue4i8n24=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZpzFwRYIo3c0dGRrYwMtoXERKFZ2x3NHgRMWqfpEpxZk1otaP
	H0NdggiNGlpc1QsdxfKLNHeaI9OQClKMpkmAVfCIbv75XyabWwRQI1wChZSFzn8CxMJmwtrreR7
	LbZxpy1+AmLR3Uw==
X-Received: from pjbgd1.prod.google.com ([2002:a17:90b:fc1:b0:3ad:5136:109b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr9335117a91.66.1793667749818;
 Mon, 02 Nov 2026 17:02:29 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:12 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-7-dmatlack@google.com>
Subject: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve failures permanent
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
folios as retryable, and return the error without freeing the serialized
state. If no retrieve succeeds, finish() frees the preserved folios,
like it does for a file that was never retrieved.

Nothing has consumed the preserved state before the folios are
restored, so the retrieve can be tried again.

This also fixes leaking the preserved folios when one of these early
steps fails, e.g. because the file has seals that this kernel doesn't
support. The retrieve freed the serialized state but not the folios, and
finish() then skipped the file because its retrieve had failed. There is
no Fixes tag, since the fix relies on args->retryable, which was only
added earlier in this series.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
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
2.56.0.385.gac671c819a-goog

