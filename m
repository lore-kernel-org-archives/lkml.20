Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494309;
	b=gFQCvhX+HPZAD/uL/zcjWV6eLbrwbwgBX88H+TzcbR6rzsw+VQ9Zk51tJDaf7iOY/AbC
	 5IPjzS2jB7ETrl1AwiH+Zm9USEUkJ02+blCwWAKBljhjCYrTVnfKReuJ5iwfsZketTpeg
	 +GKLaDb3ztjy2b17BjJJFV4G3We5ZsoqX5Xk9HWIgcd2rdByPP97zIalAhQyj4w9Xf39F
	 ct3COWfvo6JkIYE7Edy7OaTAcoc0lzO6GRf2RclFraN2Mj9pyFEQoNPD+4lOCY/gpeXnC
	 Ct7rmt99Xrqgd38Gu1j2UAlZfwWW0mqsROZ/p++iuI/Bc1+gSBHnSTNEbZa6+jtxWXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=chdsKhTOicvCPxU1lZpBQEsB9QRDWD9pdLuqQmhmbG4=;
	b=T6d+Ib18TRoN52+ZA3G8zB+ERMZHoPWZLuMX1SvopbBW8lcBBIFOfsGMWpm+d6vb/p56
	 b1eVJQzTDvBMyDQlq9PMN8CIC8J3oVzNbuD2cN3GpzwoZmgYPdyTkU5ODabnWoPUo1Vy2
	 rbwLllOXnVPQdS++5utqzzG1k1lEpFJfy/GDQ06I5bchE2q4gL1ViIc+wVQGh69qTGeHl
	 0FgqMXgKvX3hQyz5yeatj21qYF7HWvJeHDi1F1z6csvuyS74DAwzOeACCxvdaTBflm0qX
	 vLWvk5G0D7IQ99o6s3SCWY5o7XzBMbmCD/TN5nKgRQUGygJlliJGiCx+vQfICyT/fVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uy7eJxfr;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0860A261F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E0860A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uy7eJxfr
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b6f881bcc4so499021a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494307; x=1795099107; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chdsKhTOicvCPxU1lZpBQEsB9QRDWD9pdLuqQmhmbG4=;
        b=Uy7eJxfr2biDAryevpPFsMt0cPwQWnFvyJieQXzUTuQbmaXgAEmhvVMIyi++GsAMRM
         l4BlB1HqgdONllMHIjZGUoZtsxe1TCxD3DRdnUWYdtXM3Oyq/tFNqZD1LWqWzdw8AXSM
         z2LWlPXw8+s/Y3kN0eqHCeSZUkko0Lug96bMi+wkFuvvnX+z7AcaIJTixb/+Rq/4rXwR
         6fNpfdQqy+t7IqOEPiCReTvjT6vzaDfNtkNcZMIm2db0fcZSU1yoi/EZBWe34fxFdedi
         khKU/JbPBearK24/uTEzx885/9bfiaH/N1AIYYhuKJA7Dh04VXzQyvLMAXRxXaxzioqp
         QN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494307; x=1795099107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chdsKhTOicvCPxU1lZpBQEsB9QRDWD9pdLuqQmhmbG4=;
        b=zB6BxL7EKrmUSR1f+ZjaQeq8AKUxYAl7BNc1lLTxmIGTszRZyxCW61abgct3Uyy6Zm
         UOtFjgwsXfl6pPBdxG7hNeV5HtyV2c/1nN6wL5v9Yd665scP9OL2Gyi0RirgO/17mQmy
         0kvUym25tDpnrAFM/xMPB3KUNkTd3dbVpy6CTNQ/D3Vt0gHpX+iryVCrcenjnVuHit+k
         QoV/nX+pCX267ItP8cXoynk4vzTbpJx7XmAunuqA+3FrhGMGRBXFWzZWkR2gABNMXctG
         aUOlPOcR0MM9PscpUQJQozB+tePkZDpT+oIwMDUz/3U3p3Jofm+mrAZvysEUJ9xFoXhD
         G8vQ==
X-Forwarded-Encrypted: i=1; AL+hErHo94gUvTZiqI4AgULlEzInZ1XP7sNSm9ptTLcHjl/ZFXQYGqictbzBIgS0j+hHCw0qVEGpdk2UC7awOlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Ze+/q5nJgmAHLsS0tsKGee9HpBLy22X6eeizkEGq/w5JTZWd
	mLeL99NiDVXYnoZYk+3mfG3wtbux9fTvkAfT0zcUEDgUh9lYmlTXO8nyzvHfdCBHdshGgeIBOu4
	PhsBPTrKqX3fYackPvIbQ1eBXfj6JcA==
X-Received: from edqw21.prod.google.com ([2002:aa7:d295:0:b0:6b7:dc3:c9b6])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:310f:b0:6ac:8ef4:177d with SMTP id 4fb4d7f45d1cf-6b7773fbc5amr3101064a12.20.1794494306680;
 Thu, 12 Nov 2026 06:38:26 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:48 +0000
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
Message-ID: <20261112143355.2923939-3-jprusakowski@google.com>
Subject: [PATCH RESEND 2/9] f2fs: compress: abort on read error in prepare_compress_overwrite()
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

prepare_compress_overwrite() reads the existing pages of a compressed
cluster before they are partially overwritten. If a folio is still not
uptodate after the read, the function releases everything and restarts
from the beginning.

When the read failed because of a persistent device I/O error (e.g.
dm-error in generic/250 and generic/252), every retry fails the same
way. Commit 3147ee567dd9 ("f2fs: fix potential deadloop in
prepare_compress_overwrite()") bounded this loop with
f2fs_handle_page_eio(), so after MAX_RETRY_PAGE_EIO attempts checkpoint
is stopped with STOP_CP_REASON_READ_DATA. As a result, a read error in a
single data cluster shuts down the whole filesystem instead of failing
the write with -EIO.

Return -EIO as soon as a folio is found not uptodate. Keep calling
f2fs_handle_page_eio(), so that repeated failures on the same page
across calls (e.g. from background writeback) still stop checkpoint as
before. Both callers already handle errors: f2fs_write_begin() fails the
write, and f2fs_write_cache_pages() stops writeback of the inode and
returns the error, leaving the pages dirty.

A folio that disappeared because of truncation (filemap_lock_folio()
fails) still restarts via release_and_retry, which is now a separate
error path after the success return.

While at it, unlock the folios in cc->rpages before dropping our
references to them in both error paths, so that a folio is never
touched after its reference is released, and drop the check of ret
before the success return, which is always true at that point.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/compress.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9453254ff522..c5758da7c621 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1160,23 +1160,27 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 
 		if (!folio_test_uptodate(folio)) {
 			f2fs_handle_page_eio(sbi, folio->index, DATA);
-release_and_retry:
-			f2fs_put_rpages(cc);
+			ret = -EIO;
+			/* folio i has been added to cc->rpages as well */
 			f2fs_unlock_rpages(cc, i + 1);
-			f2fs_destroy_compress_ctx(cc, true);
-			goto retry;
+			goto put_pages;
 		}
 	}
 
-	if (likely(!ret)) {
-		*fsdata = cc->rpages;
-		*pagep = cc->rpages[offset_in_cluster(cc, index)];
-		return cc->cluster_size;
-	}
+	*fsdata = cc->rpages;
+	*pagep = cc->rpages[offset_in_cluster(cc, index)];
+	return cc->cluster_size;
 
-unlock_pages:
+release_and_retry:
+	f2fs_unlock_rpages(cc, i);
 	f2fs_put_rpages(cc);
+	f2fs_destroy_compress_ctx(cc, true);
+	goto retry;
+
+unlock_pages:
 	f2fs_unlock_rpages(cc, i);
+put_pages:
+	f2fs_put_rpages(cc);
 	f2fs_destroy_compress_ctx(cc, true);
 out:
 	return ret;
-- 
2.56.0.567.gdb80ae8cd5-goog

