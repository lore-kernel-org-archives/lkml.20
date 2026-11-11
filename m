Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413919;
	b=GO0AsCkCODqH11qIV2vjy53HHISkFudiKfQ0SKLM+kmnhxp0Lv5H+bO6pCqxMH4o1VM3
	 t6RhdG1yRU8juVaDTiyyQb2ySW3Jj/A5Uy55YcCMZBzWQPzE5QS2VoK97ToxTEXOYTgYD
	 OJ0XPqnxl0eYczcjMuK4ZHSCUtpLkJ3V6sNZADWRmnHeFb+pgSXZgIsZRGcwk78rH7GTw
	 HEBfD+f6YmkdGEfjhZ7AJb9D+SuCTRfveYiqfXPf7nW+cZiCsmqYNrdjy1A36MClklDsW
	 7O+Vlex7FFEZ20R7xnvitaCp/grRcRTZpxwxnmWbr9D4QD8V8v2hizPxGvJjtnMtweA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1GD4Df7Fux7pFJTIJwvNlT1oVwGjVEElYOnH6LUdavM=;
	b=AGftCMOKfV3+K7HewwIeneZeffZecI7aryNKQnx19JZdKLS9Sli/mEh9boWlTFjkm62v
	 yr67NhP0pLeZYIKi1Rw+Re963DBx0QtMZTV2nTmseCc7vqmlzhOZIF+TdbliaPf+FyYN0
	 7PLjw9lzgcj6plcnWFl79QloaH8tHT3k865mpqKwdweFxCKHAVgDA69yYfvhVQhjZPULO
	 U5dk+6yH+2/7HLDzp9zFLE1Rq5opcdPkKgALn5XJmL1n7VLHSy4UWr7MwQtSwLkfR1dXE
	 1gq6dpNHuvhHQwG57EocOLMy017iMIEpOOg/fvOVxEnFAWOvSU4U71RkbKj/C42b5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=TzwoMaCz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1B606A8A5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A1B606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=TzwoMaCz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so41822165e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413917; x=1795018717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GD4Df7Fux7pFJTIJwvNlT1oVwGjVEElYOnH6LUdavM=;
        b=TzwoMaCz9KlhroQfTJItRVBaooOxRed9KVWymwHFSAxMvTL3OfEZFzwDH5SFH9pu/2
         pjJ7J05cK1yCD98UZ0GpRNK7YSqSkWVm5ybdDdD+OuGN8faTepKsNYC1KJCQmfRZslEQ
         Q2q88uZN3KMiQcXYLlQ+piVHe6GE2UYMseYc3Z63fWJ2ZaRT0EnKVtH5GiucikqrwsSz
         /Oya2PJfT1S6kvAQxO4n2zF6lDy3a6i2O/C2eP+Y9xATRQ4gTATcdVvRq+mMCNmFFazS
         3EewfzxhEq6bu9QQ09jkGU2hzRoLQszfILnRTU8pPrYvyQ6sqNqNK0+CSwjWVYU1eILN
         t2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413917; x=1795018717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GD4Df7Fux7pFJTIJwvNlT1oVwGjVEElYOnH6LUdavM=;
        b=mjXDFYCq0+QTS/Yt3UOY/MTRmN52mwwEa/qa5U72c4Wv+bLBLEFlLch3FN2d3hMYrN
         0ncpH4dp7tOFKuuIQO7Vv0ppWj+hTO4VIGPiXTKRNZjMS9wOhgOBPx+ZSm7hDIPjz2nN
         LVQcgHrvLnqCb8noydooWXodFC3g2U/qu3kFPkS3F4Gm8H5noM3jVKC7YEyRrwxhpMV9
         TnMS5yCt3L3hnXRWfsvTFjlT+LpcXaYLyg9Bl0j+qMfqdoGw63dHkhb4+PsBu3/mEMyM
         ip6KOp8ef1nxtGrabz28UltFQRNmQoe6BX4xyU/weURcvNzPfJLUYtJ5mD1tWS/ymxes
         cRAw==
X-Forwarded-Encrypted: i=1; AL+hErEfqnXqEp7k7bwK4Ze0z1TaTgl42yvhMfh6q27oC+nJPCXyHekQhHKR9B8Vtz3hAr8fAGhCifnrtwInTbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UsKY+De9/DFopHm2zNrLvSQMwHWX0nBGjW+rvKqU81+WwJxGS
	tjp/lyTnr3kAf1gEMceHlMK8hRwt04LWxOFtJWSOCRn0SXcgw9qBbQHL4SF5szZzmzY=
X-Gm-Gg: AYBFou1+EQXU+coMTiKGgDLHB/dJH3lOwF9lmn6/Wd3m6JakIcCGM4FwAhbuikheUpR
	RBO92L3HLigk3FxKv9oa0Psv/01J44IZVmgYGmTvVJyC+rU+zATn2Lax5ToMU9XoydE7rXFSyaK
	y7QgrizG0En9D98ieI2ddFgrK1b04n7PqkYBjE5kjTrGvOzJi+Jt/lRmchDBB+9bajrgpHUxU5+
	nvpKiceQmP0iqZTIaTbVMM80PkhgDZaHjHjMIj9zOo8kklCRAxtDG5v0SbkY+nsMJzDiIkZWQbA
	dOg/Oc078LHvPUhN7rY4ftrrAuo8QKMWoGvIv6ePdMyFIUXn97oyBJ0oygVXJjCxAsP8BThVFY8
	YFnezF9S9/LdCe04EwBFnxuQMv34ejdQ8vlLHKCANHIshISdfPVSVW5rqxZ1l3ejSzjuOD3ZZTh
	ttkpNrGwnTluVpV0S716j+BghMNJz69KdDE2e+lZ/uPpFugjokGe87X5hVBfaJ2e7TfFosQB9FW
	u0yBUMQmC5al9JcYkvX+tjAgxSFDoYhrKZEzdMf4WBbOcHpudnklxdM2IGsFv79Iv2MRIvWk/9o
	R/qBWIxvpDoikSl+LSuH7Y6jNWdG2HqNwK8VukbjNXvmvb6liEBIaZmPpPNTmm5vHmAEyleLLo1
	Q8xmf/jS9b5ioWyiihEO/+9f2nBsXBA==
X-Received: by 2002:a05:600c:c167:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4ba093acf6dmr49528575e9.33.1794413917166;
        Wed, 11 Nov 2026 08:18:37 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:36 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/9] ceph: fix mdsmap use-after-free in __ceph_setxattr()
Date: Wed, 11 Nov 2026 17:18:24 +0100
Message-ID: <20261111161830.1336485-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

__ceph_setxattr() reads mdsc->mdsmap->m_max_xattr_size while holding
only ci->i_ceph_lock, but ceph_mdsc_handle_mdsmap() replaces the
mdsmap and frees the old one under mdsc->mutex.  A setxattr() racing
with an mdsmap update can therefore read freed memory.

mdsc->mutex cannot be taken under i_ceph_lock, so keep a copy of the
limit in struct ceph_mds_client, updated by ceph_mdsc_handle_mdsmap()
under the mutex, and read that instead.

Fixes: d93231a6bc8a ("ceph: prevent a client from exceeding the MDS maximum xattr size")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c |  1 +
 fs/ceph/mds_client.h |  7 +++++++
 fs/ceph/xattr.c      | 10 ++++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 15df9d22008d..da40f2cb80f2 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -7247,6 +7247,7 @@ void ceph_mdsc_handle_mdsmap(struct ceph_mds_client *mdsc, struct ceph_msg *msg)
 	} else {
 		mdsc->mdsmap = newmap;  /* first mds map */
 	}
+	WRITE_ONCE(mdsc->max_xattr_size, mdsc->mdsmap->m_max_xattr_size);
 	mdsc->fsc->max_file_size = min((loff_t)mdsc->mdsmap->m_max_file_size,
 					MAX_LFS_FILESIZE);
 
diff --git a/fs/ceph/mds_client.h b/fs/ceph/mds_client.h
index ff9ba09f3b59..bd97f73ede20 100644
--- a/fs/ceph/mds_client.h
+++ b/fs/ceph/mds_client.h
@@ -495,6 +495,13 @@ struct ceph_mds_client {
 	struct mutex            mutex;         /* all nested structures */
 
 	struct ceph_mdsmap      *mdsmap;
+
+	/*
+	 * Copy of mdsmap->m_max_xattr_size for readers that cannot take
+	 * the mutex; updated by ceph_mdsc_handle_mdsmap().
+	 */
+	u64			max_xattr_size;
+
 	struct completion       safe_umount_waiters;
 	wait_queue_head_t       session_close_wq;
 	struct list_head        waiting_for_map;
diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index c6085191c29a..8f97b6448d7a 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -1211,6 +1211,7 @@ int __ceph_setxattr(struct inode *inode, const char *name,
 	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_cap_flush *prealloc_cf = NULL;
 	struct ceph_buffer *old_blob = NULL;
+	u64 max_xattr_size;
 	int issued;
 	int err;
 	int dirty = 0;
@@ -1260,13 +1261,14 @@ int __ceph_setxattr(struct inode *inode, const char *name,
 
 	spin_lock(&ci->i_ceph_lock);
 retry:
+	max_xattr_size = READ_ONCE(mdsc->max_xattr_size);
 	issued = __ceph_caps_issued(ci, NULL);
 	required_blob_size = __get_required_blob_size(ci, name_len, val_len);
 	if ((ci->i_xattrs.version == 0) || !(issued & CEPH_CAP_XATTR_EXCL) ||
-	    (required_blob_size > mdsc->mdsmap->m_max_xattr_size)) {
+	    (required_blob_size > max_xattr_size)) {
 		boutc(cl, "sync version: %llu size: %d max: %llu\n",
 		      ci->i_xattrs.version, required_blob_size,
-		      mdsc->mdsmap->m_max_xattr_size);
+		      max_xattr_size);
 		goto do_sync;
 	}
 
@@ -1294,9 +1296,9 @@ int __ceph_setxattr(struct inode *inode, const char *name,
 	 * prealloc_blob size check below reflects the current tree state.
 	 */
 	required_blob_size = __get_required_blob_size(ci, name_len, val_len);
-	if (required_blob_size > mdsc->mdsmap->m_max_xattr_size) {
+	if (required_blob_size > max_xattr_size) {
 		boutc(cl, "sync (size too large): %d > %llu\n",
-		      required_blob_size, mdsc->mdsmap->m_max_xattr_size);
+		      required_blob_size, max_xattr_size);
 		goto do_sync;
 	}
 
-- 
2.53.0

