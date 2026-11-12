Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494310;
	b=VYWBY6dZpBieAwdbqDSwqN4m/1COD+IthR7H0r8xlFe58EUGknImtes8w1rDdNizSKol
	 3W6mprrLsbxSW5NSUL08pyDJb0S7GTQI39nrYL388v4GPAPAenT1NHeOKFrluamGKayhs
	 P3ZOSJDEAQsFRGXopasE/aWoT+B+lFiUqFRdzOPFIBlwOFf0/ypg4kYhlcvsajPN0R/D5
	 MR65OcYcGaLY5gpnDlZRg6DjkRtVuNEK3KkQnYs78oJUFvNpvT0keuzT28ech23kWSUzP
	 o0ph7+IB39f8e9XnE7Nl/YQ0BHAy977sUX9hCbJJpdWIvrNQ0TUG3gc42c8HXNhxQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pZVnsGpsllJ3BwCa9H7SVmcidWV76cNTLyaa8xLLihU=;
	b=bbnAhBFY0Xdnl6xQ4MiGmiIM0jW1Ghm6NYcpDC3VSXaXhqtISoTe7WUZD9LFp+gpUYxJ
	 EZgzQDIfbRP4DP1mLa4Z3VhRArP9OWdXHqL+ASPOlXmqtr+7zl3hvaB6BbRlt6b6qBi7j
	 SwrPIBRhh+aNU13C0KFv0lcGBMBqjnXa3n4Zjsbm7nF0sp4lamA1nOth8MkmnUsERxFPX
	 vmupb6bxd7GzJhdjgL1E5lVsQJCnuPFnz9FkfsqHnO/TVdvPpoIkf2HdhqAJoGr0HVqD/
	 RI98siFsqoAVahXQLjMGIwyJPSXn31AC7jWnRHZ0zLUWExhKN5dAekgxuz6XFvSHF7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k+U7hhLa;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF160A2626
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDF160A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k+U7hhLa
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c505eecba6cso192677166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494308; x=1795099108; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZVnsGpsllJ3BwCa9H7SVmcidWV76cNTLyaa8xLLihU=;
        b=k+U7hhLamgj9Kb3JZZczsRWCaJqlRDFECC7i9a0ILfghmobpLaTmDVPF0rCiSM3/mf
         Ol1vX3zKSppuiFCSgQ8FaQ7kX7S/pc8eR9uxJfwNz41cUANd8kY+NieRpiBaEZzoFUO7
         Wi8leipJH9RAYJ+nAQeX9IdJlBu6reS/iVbhlX6VpLxEuamHLEZFFj0mCWeBAAn2Wvl0
         4tzYjwV2Yu4jWEJklaOsjc2FBiFid8N7lJZuJ1YXOulFPnfe1lRa5poFgbnbQG/42bE+
         l/Pdio4e36VAEh3fYMt9VcYKnY1+DTzDa0GOilBZTUaT9iUCc1qNBMmmFEMB9qvFTaaQ
         ntvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494308; x=1795099108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZVnsGpsllJ3BwCa9H7SVmcidWV76cNTLyaa8xLLihU=;
        b=QNztWAE2BqnkhuZU+GxzIVwTPlr9wr/ba9motKQvaeN7uwzfQQiHl9CwJ/RFfFoGVi
         tzza15OaC+l/n8/PT1tlYksXHj7yG+WyKqB1yXKHdvF+ICXgaXFWZB7+3RBD6ufzKw0t
         lVZHu1DltDZ6O/sWzbYXKdod+4fL15vmDh82JxYUKJn77Kymeub7DbNzVXCJ2a0xqFfV
         ezMoq9tMHWKD72pVt1nR5B+mDZuy2i9Mxccc9yv34H0qGps8mpcAttw6FPUoktf/miZ1
         VSziX0u+lJEWcLC8CtvKA4pOfq4PFpsLE/7NpWIfG03B4EsmMbtR2afq7u7sBRy7F0fT
         XXcA==
X-Forwarded-Encrypted: i=1; AL+hErEhzVlBCiyjoeSKOvGLPDcxfUmaru6ayQB93UxG+j/jfbcai8FJd+wYaT0rVPgQo/20fvK3rCMe5ZSXrUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uPpu7YIiiRQXVrCrwhLAKyfmzZGE60ikusEEVgECP/6CJKKND
	jSNuL8MlShSDBDGex5B0xdULm2j8To6pwE0j6tEBls1DK38GR7jsEu1CKPulBqVU49MEvpnbQdt
	tx+Tmh/sWZsWZOH/cTjY6uHxncrg3sA==
X-Received: from ejcsa5.prod.google.com ([2002:a17:907:6d05:b0:c46:aa24:8716])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f597:b0:c50:6505:624 with SMTP id a640c23a62f3a-c5066d83fb3mr434447266b.43.1794494308088;
 Thu, 12 Nov 2026 06:38:28 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:49 +0000
In-Reply-To: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-4-jprusakowski@google.com>
Subject: [PATCH RESEND 3/9] f2fs: keep old block address when out-of-place
 write fails to allocate
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

If f2fs_allocate_data_block() fails, do_write_block() ends writeback of
the folio without submitting it and f2fs_allocate_data_block() sets
fio->new_blkaddr to NULL_ADDR. f2fs_outplace_write_data() then still
calls f2fs_update_data_blkaddr() with that address, which replaces the
old (or reserved NEW_ADDR) block address in the dnode with NULL_ADDR.
The block stays accounted in i_blocks and valid_block_count, so the
in-memory metadata becomes inconsistent and the old data becomes
unreachable.

Only update the dnode when the write was actually submitted.

Allocation only fails after the checkpoint has been stopped with
CP_ERROR_FLAG, so this does not reach the disk, but it keeps the
in-memory state consistent for later reads and for code that rolls back
failed writes.

Fixes: 7d009e048d7c ("f2fs: fix to handle segment allocation failure correctly")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/segment.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a5f9de723a70..a26cde2dc60e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4257,7 +4257,12 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 		f2fs_update_age_extent_cache(dn);
 	set_summary(&sum, dn->nid, dn->ofs_in_node, fio->version);
 	do_write_block(&sum, fio);
-	f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
+	/*
+	 * If block allocation failed, fio->new_blkaddr is NULL_ADDR and the
+	 * folio was not submitted, so keep the old block address in the dnode.
+	 */
+	if (likely(fio->submitted))
+		f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
 
 	f2fs_update_iostat(sbi, dn->inode, fio->io_type,
 					F2FS_BLKSIZE(sbi));
-- 
2.56.0.567.gdb80ae8cd5-goog

