Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500771;
	b=5WDwwRs74vlT7fBS3uzOy/0oMFfQgdwyJcqk/es6Hc/PhOORktwJqP2F9nyyFOzr/h0P
	 9AcdUHpr1DTLH3jZOoWOMdEPGIsqj1uPCWMxfgQULDhh0kvIjgKnxE6i4cnRuWazVzl5X
	 MbPfAkk/+fW6pQC6N4lMP4YM5m8Xo2UjMDhTTtP4MHZ1nvydAsv4NFKx2Dbqqv+U3cNnS
	 hlLKHFWbBJFuxy8lBXoWDqq+piasNykMgCeKCK4dWpU5KRGD6kCoi/gU7wcT93yAq7HNP
	 0I8tyiY3SwtJPaKmoXudM+wwkUBSU5aqALiXK0THvXpgUSGkuIBIpNU14MceFEWNslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500771;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=11oaeN/8N1hoT44N2YuHBHNc8eMWNhQWc/HCa490GyE=;
	b=zosAzUmMulZqcOIgHSlK9+VvhBeyLpTbZ3HUEGmU1RH7HH1bDGpGRyeuahQwRFqLE2Xd
	 pzmUCANKqAk7ajdKyys7XJGnJuSdvJ1VjkUmPwQxWOqTnuovpqFDd8SdurSxsXiqn+HEN
	 +505z0UYmltAEZohn9hLBlAVSK52tWWwp9Ygpk+54LJmXNQ8GBe8mTzmkpzHqwrCcsiSu
	 xKaViQPEvhgQHg77D8IGXVOQqO/EEPrBbQgMVn88EIQ+9cWSgdA7AwfIUKquKjTHSHOCv
	 X8IbJsyGqZOwNORPLajGTCtgnchIX37aWFIQpm/GaW6BOfeB07HBCRNDzJ5lnJmo+vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTLAzpdg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="T/AfZl//";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A2606A334
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4A2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTLAzpdg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=T/AfZl//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792500769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11oaeN/8N1hoT44N2YuHBHNc8eMWNhQWc/HCa490GyE=;
	b=dTLAzpdgIQsvTx6Q5Dm7mR9tFBynXfBnEsyoOmbM2gBkJ9U+MYXDa6IBhNmzuE/7o+oPru
	TXbpBaA4xBCTB4Sk93lALFcIiyYIL1i3Z89EFzY8Wd/yDrGAWgXRri0Vr/TwnRwLjx+TLr
	8CJ5bIA4GT5lQLELf1VyhJ63MvWKZn4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-vOHpbxVVMPWuFm_VS0k7dA-1; Tue, 20 Oct 2026 12:52:45 +0000
X-MC-Unique: vOHpbxVVMPWuFm_VS0k7dA-1
X-Mimecast-MFC-AGG-ID: vOHpbxVVMPWuFm_VS0k7dA_1792500764
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1c762be1cso3206064a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792500764; x=1793105564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11oaeN/8N1hoT44N2YuHBHNc8eMWNhQWc/HCa490GyE=;
        b=T/AfZl//r11NPAOFNc6kxNyuPPkrEHu303Itf6+ltvC/eN3J3A7jFZbeSBI2Uo23W5
         en3bqsNlpGaL9alJ+YnCKafbmF3PBw2TNH+r89LMbRLkwazf70J46GtwYmOhtnxwOER2
         n8f+u+j4LevGrryQc/gb82PQs7Sha+aMmdhEKK5oJBIpdrfIOG+P6Rkyk5US2m/yTC4s
         YtDwsRXGvMO1d1IXMr0DWs+meKK8baEkSTpJJThhonXzCYIjnjqzs59eH/CRpcf89pro
         ATuaA7rBlrrO2eubzPQvwvZZDUm+kZo+aFuOEw1BJSz9YKUPh+WGxQ9N46Pzp7rOUUlv
         FCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500764; x=1793105564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=11oaeN/8N1hoT44N2YuHBHNc8eMWNhQWc/HCa490GyE=;
        b=eJN+W+8L2DqSyr4aWsjgZ4cIs24btgBClXieuhmCl8cIsNqMANsYh++yOumfVwXUpx
         kmt1N0l1HMjN+Z4G9w5o0WZhZne8KWEACLoKBCkhn3aOdxy6U7lxwqfp4NPjqynsj72W
         WzCtAAveDTuXEZlSQb98EwbQBPrvYhOlVg/BwF4jR5X5LQzOviSiwmVZ5l6fTTRLCUju
         IDB1kEunshMpfI9yZ/ZbyIm6MHlDxXSivwRrm7dhfUdxod4kOz7hu+enLJeCHOscu6VK
         keaVKH53kxZJTOKCI6KRJSJ+R6WMvVi3vMdWMPexP7Auj8CbTT60ozOjt4K6KVJ44Sfc
         eK3w==
X-Forwarded-Encrypted: i=1; AKwUvBzuWxdT/sN1eWWjZKg1i9EUY1EQTWj99mmfoCG3T+pUurs5m7CyTSE+j3yvIbLLEM4igdwCEyhL49xpzwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRPmtOTP6lx4eiTYj2yF0GNyAxJOGIj+23eG9SaDnr4e2Yt3+B
	BJ+IQ7WQSWr265kGuZ+0enBcZajYDtaTdcjpaqLf6cvJHJX8k7kmrRo8PZQlI00mAC7ni0bFGc4
	VL4zQu/7jnsW2Pjv5f0yfUKZu+f+8yS3tfkgPf4LrlKHiQx/W+ZHgD0hsvpW9Z0rUWA==
X-Gm-Gg: AYBFou3fxhtBz7JDJAIyKe50PgoznqfMWVHLuStz0bCY6XbP+SeSUe6C/5BMveNQ+l4
	qtcS/TatfbJxJRuoNczk4lxaFf0uisc7LBoQShc55iynh/Xu5wv1lBv2EeG+Pb9XYldneR9Q0gE
	QXJyjN7KJTPweLfFfJ8X+WT7smGoa+3IbrW39Tnb1kxadcPjV5WeOqF1L4YVD811oODzuD2pMze
	+HRW1lhCzGKUe5JjR2YRbhoc/whn8etFgBt3cGTZ9WeNRDoE3cqHWFYu6OBmAZudxROD46IuKlD
	E4zNM7bjXt6IZEoAY7end7djsWVMZAGcxx63jBym0ZQnv3BGRMy40HUa6sAjUppAKn8h6p73/45
	sra3xsD6mFkMvJLhBPZvYngZ7lixNDQEIOUJ2RiCPjzdBlofl1qzBXqQ0Flgkbdj+XJOjSTUzV7
	NC5UkmrHkoIq1G/Am00vAxb1ipJMH5qKVb4k/2utOcaJzfaASoKixFQiINA4G6SwtBT1YiVCYXH
	XQ=
X-Received: by 2002:a05:6402:4495:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b3a82153damr6927978a12.45.1792500764014;
        Tue, 20 Oct 2026 05:52:44 -0700 (PDT)
X-Received: by 2002:a05:6402:4495:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b3a82153damr6927967a12.45.1792500763580;
        Tue, 20 Oct 2026 05:52:43 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3c74eb8a7sm2982781a12.2.2026.10.20.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:43 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	ebiggers@kernel.org,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] fscrypt: allow filesystems to disable symlink target caching
Date: Tue, 20 Oct 2026 12:52:34 +0000
Message-Id: <4ef1532159c9312287a604efda1e6a3c0621112a.1792498351.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792498351.git.amarkuze@redhat.com>
References: <cover.1792498351.git.amarkuze@redhat.com>
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

fscrypt caches decrypted symlink targets in inode->i_link. The VFS
can return that target without calling the filesystem's ->get_link(),
so access checks in that callback cannot revoke a previously cached
link. CephFS subvolume quarantine needs those checks even when
readlinkat() uses an empty path on an O_PATH descriptor opened before
quarantine.

Add a filesystem opt-out that prevents both creation-time and lookup-
time cache installation. Leave cache readers unchanged: the option is
fixed before inode creation, so they find no cached target. Uncached
targets use the existing delayed-free callback.

Opting out costs a temporary allocation and decryption on each access
to an encrypted symlink, including readlink, traversal and lstat. Other
filesystems keep their existing caching behavior. The Ceph opt-in is
in the quarantine enforcement patch in this series.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/crypto/hooks.c       | 28 +++++++++++++++-------------
 include/linux/fscrypt.h |  7 +++++++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index a7a8a3f581a0..6bc7ac82ec34 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -321,11 +321,13 @@ int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 	 */
 	sd->encrypted_path[ciphertext_len] = '\0';
 
-	/* Cache the plaintext symlink target for later use by get_link() */
-	err = -ENOMEM;
-	inode->i_link = kmemdup(target, len + 1, GFP_NOFS);
-	if (!inode->i_link)
-		goto err_free_sd;
+	/* Cache the plaintext target unless the filesystem revalidates it. */
+	if (!inode->i_sb->s_cop->no_symlink_cache) {
+		err = -ENOMEM;
+		inode->i_link = kmemdup(target, len + 1, GFP_NOFS);
+		if (!inode->i_link)
+			goto err_free_sd;
+	}
 
 	if (!disk_link->name)
 		disk_link->name = (unsigned char *)sd;
@@ -411,12 +413,12 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 	pstr.name[pstr.len] = '\0';
 
 	/*
-	 * Cache decrypted symlink targets in i_link for later use.  Don't cache
-	 * symlink targets encoded without the key, since those become outdated
-	 * once the key is added.  This pairs with the READ_ONCE() above and in
-	 * the VFS path lookup code.
+	 * Cache decrypted targets unless the filesystem revalidates them.
+	 * Don't cache targets encoded without the key, since those become
+	 * outdated once the key is added. This pairs with the READ_ONCE()
+	 * above and in the VFS path lookup code.
 	 */
-	if (!has_key ||
+	if (inode->i_sb->s_cop->no_symlink_cache || !has_key ||
 	    cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
 		set_delayed_call(done, kfree_link, pstr.name);
 
@@ -442,9 +444,9 @@ EXPORT_SYMBOL_GPL(fscrypt_get_symlink);
  * This requires reading the symlink target from disk if needed, setting up the
  * inode's encryption key if possible, and then decrypting or encoding the
  * symlink target.  This makes lstat() more heavyweight than is normally the
- * case.  However, decrypted symlink targets will be cached in ->i_link, so
- * usually the symlink won't have to be read and decrypted again later if/when
- * it is actually followed, readlink() is called, or lstat() is called again.
+ * case. Unless the filesystem sets no_symlink_cache, decrypted targets
+ * are cached in ->i_link, avoiding another read and decryption when the
+ * symlink is followed, readlink() is called, or lstat() is called again.
  *
  * Return: 0 on success, -errno on failure
  */
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 28f2108e29f3..ab77e685c75c 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -107,6 +107,13 @@ struct fscrypt_operations {
 	 */
 	unsigned int supports_subblock_data_units : 1;
 
+	/*
+	 * Don't populate ->i_link, so every access calls ->get_link() and the
+	 * filesystem can revalidate access. Set before creating any inodes;
+	 * this option cannot invalidate previously cached targets.
+	 */
+	unsigned int no_symlink_cache : 1;
+
 	/*
 	 * This field exists only for backwards compatibility reasons and should
 	 * only be set by the filesystems that are setting it already.  It

