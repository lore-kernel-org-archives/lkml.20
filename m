Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADD4949FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286048; cv=none; b=VQJt0UoCy6NI6XPLDe/rRDV4n0DY/kNLqVLcZ7nzF93wRGWCZsy6rxma/P0mNzGRPfibb/Vzp8WxgZLvqIgA2XAHq3aOq6pONriDwLVhYVWwou5eXAPdo51sfQxLxtKpWklhgzF6066Jd1hPYQIJLiFZqQ9p+qgPxQOUWt7UI1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286048; c=relaxed/simple;
	bh=1rC3XR2fF2fywHIrzahWsEG6/t6CZ5/hmiLajevTnlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tfiRtSQ0yv1dWuWSyGHRcPgC5QasJqO0PNYZZqaKLMPDPtgv2Yy6iOjBZGRK1dfrSSUQ6PAdBvtcyZrwgEpTE5QK254ivILLnTLwEwf0JfyRju0gAWSyIWlZuskPeeBcB/oO5k9rGDmj9IcINkOskT2Qu2e2E3ZVAA7etBCX/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nlb4bEn5; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nlb4bEn5"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso142592a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286047; x=1788890847; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P31f4AxefLaMEsH/zGccMYrThdu9slSJRJY7f7YnBMU=;
        b=Nlb4bEn5Z3tUak1LXT7AMqJe8AyvClqEQLWJbJulA1OS3NWt1RY9mmheVpMfRbOk2b
         YxRdrnPUOQMVErLGff53RdWnx1Mgvl4fmKnxgdYx79k4JcZUuaah3f4C81WCFHs6LUuj
         nIokspRtnkp1YBeutz6mGPFAbbCxa0ELffd09ZS+vJO6GGgL786FTPFNGh/ifZr+JoS6
         yBl5rIj0Vz0ab4xTYkZSiTmDHulp22adMIaMMOIg0IUoVh0J1KTNgp+egzcsrFdb79vG
         biZR/YeycQgHsTy6kIeXSGUBgRcLKAPYpoCLJtUDtnhH/SC9mfqeDmdKut6sH5HgTay1
         P8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286047; x=1788890847;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P31f4AxefLaMEsH/zGccMYrThdu9slSJRJY7f7YnBMU=;
        b=hPq6wS90cc+mgBQacnEi6tJyMQ3sBecdITFJsjsgaZUpPph74oKodWN4gof6Z7sL84
         XgE3Hqr9oiD+hG4vE2fRUkhOlwupTQbU/koJafC2+PMjr7Lonaiu4zBG1DzW7c/FxePP
         boItnhnjcGsVF9w7H0sjAnFdVSf7aX3ytrJDn+/lYbSGRoZ2pEt+Sd969+BGUZ+dMKii
         djqV5Sicw/InbReGo0sxcwevWX4zozkQPDwqK7TR9N226HZlpVlvSvW3BXnkLKPhi4OP
         RXO3JqTZV4dIOHHR5PbrA7cgL174MNZBj2kiXyHdpdFQ41l0De76Gx66jirw8z61RjHW
         2hFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrjp4gN7A0vOvPTvdK1nA7de/ETuSuyMwfbMzxaEkZNulb2IvGT/OfgusBaM/G1ZjRH6OmlbWIJjUnJrjo=@vger.kernel.org
X-Gm-Message-State: AFuF++k38g26UxKWchu0ld368uNSo18VMK/XGJNu9Oh7FNQn9W3wCPX8
	7URu2Bj9kfvLaVTCgyRXN2dMxqlpZnNyqOGRoG8uXm3v7B7XSbXDlGFUhdyJTGBgL/88DVL6eJx
	YvGrqy2PW5/MzUA==
X-Received: from pgea25.prod.google.com ([2002:a05:6a02:5399:b0:c88:b675:3609])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:31c7:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3d7afe35cddmr15820173637.19.1788286046490;
 Tue, 01 Sep 2026 11:07:26 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:11 +0000
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-4-dmatlack@google.com>
Subject: [RFC PATCH 3/5] mm/memfd_luo: Implement retrieve_into callback for
 shmem folios
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement the .retrieve_into() file handler API for memfd/shmem files.
This implementation uses the standalone logic extracted previously to
securely drop physical memory into an empty target inode.

Userspace topology delegation requires injecting folios into existing
file descriptors. This implementation verifies the target descriptor is
a shmem file and strictly guarantees it is empty before locking the
inode and bridging the KHO folios into its address space.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/memfd_luo.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 59de210bee5f..dcda5bf98646 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -590,10 +590,58 @@ static unsigned long memfd_luo_get_id(struct file *file)
 	return (unsigned long)file_inode(file);
 }
 
+static int memfd_luo_retrieve_into(struct liveupdate_file_op_args *args, struct file *target_file)
+{
+	struct inode *inode = file_inode(target_file);
+	struct memfd_luo_folio_ser *folios_ser;
+	struct memfd_luo_ser *ser;
+	int err;
+
+	/* Security/Safety checks: Ensure it's a shmem file and is completely empty */
+	if (!shmem_mapping(target_file->f_mapping))
+		return -EINVAL;
+
+	inode_lock(inode);
+	if (i_size_read(inode) != 0) {
+		inode_unlock(inode);
+		return -EBUSY;
+	}
+
+	ser = phys_to_virt(args->serialized_data);
+	if (!ser) {
+		inode_unlock(inode);
+		return -EINVAL;
+	}
+
+	if (ser->nr_folios) {
+		folios_ser = kho_restore_vmalloc(&ser->folios);
+		if (!folios_ser) {
+			inode_unlock(inode);
+			return -EINVAL;
+		}
+
+		/* Inject the physical pages from KHO using the extracted helper */
+		err = memfd_luo_retrieve_folios(target_file, folios_ser, ser->nr_folios);
+		kho_restore_free(folios_ser);
+		if (err) {
+			inode_unlock(inode);
+			return err;
+		}
+	}
+
+	/* Fast-forward the kernel inode size to match the injected data */
+	vfs_setpos(target_file, ser->pos, MAX_LFS_FILESIZE);
+	i_size_write(inode, ser->size);
+
+	inode_unlock(inode);
+	return 0;
+}
+
 static const struct liveupdate_file_ops memfd_luo_file_ops = {
 	.freeze = memfd_luo_freeze,
 	.finish = memfd_luo_finish,
 	.retrieve = memfd_luo_retrieve,
+	.retrieve_into = memfd_luo_retrieve_into,
 	.preserve = memfd_luo_preserve,
 	.unpreserve = memfd_luo_unpreserve,
 	.can_preserve = memfd_luo_can_preserve,
-- 
2.55.0.966.g6673acef38-goog

