Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4063E8C64
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906964; cv=none; b=IjVoHKL+pqBERQEZQJ+/nAKPdLN9OsEq0EhKgnKC+0QQWheupSE/3ekvR4bGwrKzXk5jrAXzO83D99Lpg5px0cyRfGWueUqNymHeJfrkTFCeWp0kZtuMdFkEd3Ng/22LK3rYxVcRak4s0Hjva+UlH7BcNx1psNcyubVFeg9mZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906964; c=relaxed/simple;
	bh=EhVRZr00r/8bTB6R+ZzURk5Ziajqh781j9UrGUVhL1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYxyHCrZ/z1orz7dnncKJKspar06PC1tP2capPzOqL0zhRJ0owrhRiBCSBTvlIxndXzERtgfjV1KrBMxHPYkhzLcT7uh0Udi3pNapdlz5XbVUqkGB0nVAQZwZIwlSBuGR2XRyB2OdsQc0ojINOUUVBHXxmNtQyTabaNfotjfe1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AinyiAP5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AinyiAP5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d71ae3455aso11214715ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906956; x=1788511756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ahU4MpfS6Yf/uSMGEJ479IVkDuuOkM6vl8lIUM4s9Q=;
        b=AinyiAP5ig0nra3TCkwv2OCADIwvkkJ3sjNK8B+diK+Vif3ALRGnOTX6mAW5ACcLBD
         8PcLbQioUecmsDYApMmOSE66/4aPiuGEgYBIrDCw8qW99YqD1hKi1cDCBIsRRahKQG4S
         ElHG1+/jYzzBxHhNBthnYh/B2tMVwlXGfknm4OwoiTFmkU/9fFLfv1Lvz0Tbn/J1Kovi
         uvZ9ZCtQwHlUN1LzVomtRIpcY54qlReL3TsswG2KtF1Oera+OhyWMWy64rbZlRMfwF5j
         UPyTAY+btoWvmtvwXzn3dn6Nrv35WH3/ZkyjZlISJbJlrtwe911sLCOa7aXlCwqVldgN
         tiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906956; x=1788511756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ahU4MpfS6Yf/uSMGEJ479IVkDuuOkM6vl8lIUM4s9Q=;
        b=AmgRwfyRJvvRIjhrO3poGKv9gG78Ii1y111rAN1W4+NTfSFMR9h8r5qbnycm2X43ni
         SGG3h1KTTiyvCsszju3ae4SxhA9f7/euphnRuyEwOqubothSboCxtWPoaiATkcrU+Dc7
         sBtEM+7zqr+PWoLJbk0r0KYrRKI8bNPsaViURbecgYQBTLM1H/mYWzErQD3PzUQu+lbz
         lMoYVybLHBDiKxKGBUgTloN0piEoAqqh72y7+01TbGiYBFqrgt1IoQM7de2ll8+NDAze
         G/D/SgB92cWGp/HPyARm43GrKTD6viOzADwaENJ4X69WebjidUMQswcWkD59AKB7h6A/
         sjOw==
X-Forwarded-Encrypted: i=1; AHgh+RpahvrseCUIyZZjPa5NCbkkYDJ8V2KZeY5ITx1sTgr0pqmVA/g+4RLP7x8TToXye3x06PYwD+vFQABVkiE=@vger.kernel.org
X-Gm-Message-State: AFuF++mMFSraEuo9FEt972th0QtiEvIzyCP/ZyPlpp0BbuHd7Plufeaa
	EI+TwBdcQKkVoTI0jt5AsEP4baDVh3HExdxFGBYurtTcGyrrbR9E4OQr
X-Gm-Gg: AR+sD12B7Dz9N2oWvL4cjDG7C6DV6Pccshv9JleAyTsKiduw49NYW4jgFcu8vszOi2b
	zcCVkPEA6NlTbItVE2QQ9IDPfrDoLIGesooQ4u50G+pkcsute6UTnE5d/QTmRYyjwAz2QDdMZj0
	z6VyyfZ7rlg56KsCedu7JNxUPup1NW779STlZr25M0Et1NwGW0yGINmwNbCxhhbtX+TQTnq7ERY
	f0+FwF/4hvz8v/kVU08hlNovW2qiG2IItvAOW/nidWYfr2jR5uxr/xkuxTqQF0WU8gnghJTJx3u
	2fj+T1JnVOoOYCyfcaslWLOZlhgwvEH5SXe/nhGh7E9zITWpWl5QnHVADDtlT0yNeo57I1EzZNk
	VTkGWX5P3Fkk9b+fUoQFzfggTwB88qVY3+q5FJ0qxhxOyV19XOiiGANp66HSiFTC3MJPZ1c7m2K
	S51+AP6LXOPTGo+Ks8ENh7ERnrqQFtTm1tNaV+EWlMOERW1BoHT4gAhbJ3J+mp
X-Received: by 2002:a17:902:d2c7:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d74ddc21d7mr99437415ad.11.1787906955877;
        Fri, 28 Aug 2026 01:49:15 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm3698598eec.22.2026.08.28.01.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:15 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/9] crash_dump: Read the number of dm-crypt keys from reserved memory
Date: Fri, 28 Aug 2026 16:48:49 +0800
Message-ID: <20260828084900.1496839-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case user adds/deletes the keys by mistake, it's safer to read the
number of keys from reserved memory.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-and-Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 026c7de4ad85..0b9e09c60745 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -89,21 +89,31 @@ static int get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
 	size_t keys_header_size;
-
-	keys_header_size = get_keys_header_size(key_count);
-	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
-	if (!keys_header)
-		return -ENOMEM;
+	int r = 0;
 
 	arch_kexec_unprotect_crashkres();
 	keys_header_loaded = kmap_local_page(pfn_to_page(
 		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
 
+	if (keys_header_loaded->total_keys <= 0 ||
+	    keys_header_loaded->total_keys > KEY_NUM_MAX) {
+		pr_warn("keys_header saved to reserved memory may be corrupt\n");
+		r = -EINVAL;
+		goto kunmap;
+	}
+
+	keys_header_size = get_keys_header_size(keys_header_loaded->total_keys);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header) {
+		r = -ENOMEM;
+		goto kunmap;
+	}
+
 	memcpy(keys_header, keys_header_loaded, keys_header_size);
+kunmap:
 	kunmap_local(keys_header_loaded);
 	arch_kexec_protect_crashkres();
-
-	return 0;
+	return r;
 }
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
@@ -447,12 +457,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	mutex_lock(&config_keys_subsys.su_mutex);
 	mutex_acquired = true;
 
-	if (key_count <= 0) {
-		kexec_dprintk("No dm-crypt keys\n");
-		return 0;
-	}
-
 	if (!is_dm_key_reused) {
+		if (key_count <= 0) {
+			kexec_dprintk("No dm-crypt keys\n");
+			return 0;
+		}
+
 		r = build_keys_header();
 		if (r)
 			goto out;
@@ -463,7 +473,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	 * cleaned up at the end of kexec_file_load syscall
 	 */
 	kbuf.buffer = keys_header;
-	kbuf.bufsz = get_keys_header_size(key_count);
+	kbuf.bufsz = get_keys_header_size(keys_header->total_keys);
 
 	kbuf.memsz = kbuf.bufsz;
 	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-- 
2.55.0

