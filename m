Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802157;
	b=ArEH5UjCc+RHo3Dgz0LBWvEWpkMkPPSuTiXgPJAieQOS5LCdSGzBU4lUEncbEWNXjL5N
	 5IF9CbWtlhivbfDqSJLOLWiHsq8HLQIqbT/XpJL/yfLS+F7UXSXNkkBJwJ7jXXXFwgyvO
	 VMffbvO74X5TltR1qgrptXAkmCKpjdqfk6aMGIRrSQAQhfBCeDzIR4kPOZXWtL5RSZHJj
	 mNrRtwLueAXZV/YpfzJ2PGAHEDiX9gf8dK6Yy2jaKGiAhQlyy1PWToNZMAaTJ/vxAmnNc
	 BZfpBusdkCwCRR50fvD0aYp5bQI/4s4GCBBd8Cxg1LPOtjOiOSzCp0Y38szGikRLLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L3WVF7wLC1qtA/cSTgOZWvmgczBWmPyJaRon0cMtZBA=;
	b=gUU32Yx6Mvr9n/I9xYQp1S4X4gnueGx1XcACtWMOfn8QWuUrjQqQQkx6ZSDGFZBUxhow
	 N1DjAjyu1niuCl/B7R2/C+9Tbm0GQ8wi9T5+pz+w6lIGM3NYLQQgmjK6SC6rIAXrxUXnn
	 eA7AHAavGN+nAPDRCkrB+PD0yf7HorYcPciFhkBhCh3q/OBl1M/tfuV6fIz5KSGpd7YMQ
	 yNGEJmcxWaX0iwlvPgxx73PWiPHn98KwR/T0DHBzJAPMl3mCRxUIrSHt3XQ+hh3ZAfhRg
	 aXtD6TAI8RAs2HJipJM76WGULR4XIl/9wxYtKVqh3idM5WVIlX0tx3oPoJyang/X3+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQ89i4GD;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD1606A88B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DD1606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQ89i4GD
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1474805a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802157; x=1795406957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3WVF7wLC1qtA/cSTgOZWvmgczBWmPyJaRon0cMtZBA=;
        b=XQ89i4GDeUGrmobSBrgAgCJyjBqHSYDeQrqPnJsgqzEZmR95js0IRuMcZfSVJ6C4cQ
         mZO1iepGZQTQ9H+5WfDyPI+i6vgJmOGXLqJaxAUSaIox4QqNYjJeT7bmt8jgELUFLBY9
         KW4urgqb659PON6uC+UX66haOIKLcHnpH08lEVp6wnZ1VQpKxsvX7pxznDVVDbv+pBak
         fRlK49AHf2//mHZolKWGW54Eoirwkp12fqYs20pG4oShb8WwBgv4R2hi0W7UvlKqXKWa
         yqnKJ4ggWcM2Kr/4th9nPwjp7OryjITegrYW1DD8GdV+ailoQpNU4LaoxVlp0uweW8hM
         Dxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802157; x=1795406957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3WVF7wLC1qtA/cSTgOZWvmgczBWmPyJaRon0cMtZBA=;
        b=UBE3Qa72gUrBgeV1bHt8wa2tu9ueLUIfH2jlSzphUmtjZCM7AwaQbH2UKjwJ7/6cfm
         Cdft520YpAdYxaPoJxHHGaZ5HPMnBk9XhnylQ0CukjIi5g4eRywMuw+0vwIPnzmPKL3x
         lmirRtTRzRYTsCKo/I3UgM4WawJSI3tdGvQ+z83S4Z0edRNPZf3uX469ttQOewXzvK4k
         GK6eHr7tCzSVH8YgnAu78x6LeCEOS0o84DNVpWtGkOh+1maf4K01dag5Z4j6/JNFCsPO
         gALeWc45lKYeAh8yhAZCCyuzeJYl3UgeZxJ9j6hlYUWSKmcTDnnxrGiUpWf+b6jcelOm
         l4jg==
X-Gm-Message-State: APuU4Z9h5s401o6ntbeQacgHiWG249udF3EuGxmuVuFWeI4czzm9QJ2r
	WNCPtF+cvoB/C7ggUNDyLsKVK63t/YNLlaID+NiIRBrB9+eBayOFA2W3VKNPmA==
X-Gm-Gg: AYBFou1v6zJ4SoHzn8FSaywH7sI3eLIBCt6MtxS7aMYfjGEGGB0SUNl7lRm/XA0oZog
	ZejdMRAdNuARSzv1tDvaCFNv5nQUACsGfNkKERB6DeB4/TSWT2wnUbozK4TCiaBTeI5CNthoRbQ
	QaeWsxicy4PR4TbnXxhvGGlGKgDsQrWoLl54RVSAJqXQbbLsRdB3Py7WyL1dGAvUpiE7Dlfxf5K
	N0zbC04ZncG3hEFYm9yvMJakCb+6KsEg5QH4F+PndLFpX8F/ahGd4B0Uz6MMGS3bAyGeueK3pTW
	7Dsd4Ia07kMBKWfx42SOJIwjVVMmWxP7U3J9qgrI3GmayKXoqvk53XA8cBuL5bA6nvXhxFgYyEn
	9n3HWSRkLY9759S5vULJZIl2ECDtosw7YU2fkE1hRf74FsQdnkAv5wJt3ZjzxEqonmioVoWuy8g
	25MyLH8e6vXtKokC2jZOnMUMzjbTLTUtbVEKVz6EU3hK2jeOAiVFSBPtAv7LCQMipG0AwhUUIcE
	upA4HFoBNAKBYFdRf5ru/1NfiLIHR2KizTdJsD3i0JOiPxNz0i1hERrerBkAgjJDvMSj7aq5+BW
	ZCO4LXsux4j58loLZ4MMw45ZdBb5ZJqkoDYxpeb2a8NZfQ7jJSNBG8JaZRNSBGToqStEqtbk+jB
	9n94X+/aipTgBJJGdPrMAqeREnm8odly1GZ5PGFjvQYrX8Kw=
X-Received: by 2002:a17:90b:394d:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b1b0ca9dfemr8786684a91.61.1794802156682;
        Sun, 15 Nov 2026 20:09:16 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:15 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 09/20] f2fs: support subpage blocks in pinned files
Date: Sun, 15 Nov 2026 20:08:40 -0800
Message-ID: <20261116040851.2849696-10-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Pinned files must not allocate blocks outside fallocate(). As write()
does, return -EIO from page_mkwrite when the folio range up to EOF is
not fully allocated, and remove the -EOPNOTSUPP checks.

page_mkwrite keeps failing a device aliasing file with -EIO, as it does
when the block size equals PAGE_SIZE. Its block addresses are only in
the extent cache, so f2fs_overwrite_io() does not catch it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bec7988ca54b..72c601d240d4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -142,7 +142,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct folio *folio = page_folio(vmf->page);
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	bool need_alloc = !f2fs_is_pinned_file(inode);
+	bool pinned = f2fs_is_pinned_file(inode);
+	bool need_alloc = !pinned;
 	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
 	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
 	pgoff_t bidx = F2FS_BYTES_TO_BLK(sbi, pos);
@@ -245,6 +246,19 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
 
 	if (f2fs_has_subpage_blocks(sbi)) {
+		/*
+		 * A device aliasing file has its block addresses only in the
+		 * extent cache, where f2fs_overwrite_io() finds them. Fail it
+		 * as f2fs_get_block_mkwrite() does.
+		 */
+		if (pinned &&
+		    (IS_DEVICE_ALIASING(inode) ||
+		     !f2fs_overwrite_io(inode, folio_pos(folio), dirty_len))) {
+			folio_unlock(folio);
+			err = -EIO;
+			goto out_sem;
+		}
+
 		/*
 		 * A writable PTE covers the whole base folio.  Like ext4's
 		 * block_page_mkwrite(), prepare every filesystem block through EOF
@@ -2285,8 +2299,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
 		if ((mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)) ||
-		    f2fs_is_pinned_file(inode) || f2fs_is_atomic_file(inode) ||
-		    f2fs_compressed_file(inode)) {
+		    f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
@@ -3828,9 +3841,6 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	__u32 pin;
 	int ret = 0;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (get_user(pin, (__u32 __user *)arg))
 		return -EFAULT;
 
-- 
2.56.0.611.g1030f0b940-goog

