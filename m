Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A1492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914243; cv=none; b=cD2qbGxNpGvmATN++qbltE7++z1Ul147U9YuACaex2vdKpJWCmNnQV67qjKPUIkNqJDzNZ5z2uav+YD+Yjhf2Vz46c/OnssMOnpJ3Z58uzjD5xWzeUaSYWjTksju/mI6iOuefhBQzwumX285WxNe6X3hOHySU7mmYUdkzmzhy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914243; c=relaxed/simple;
	bh=sh73wjurFm5ZA8vjTUTYqVIu9dhhPMEbxuoNnMh2XS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzhiI8SooXYmRW2eHVb3bKRI2UETeg3YFlfncEuVcLt7/iqYdsqq3v1sBme/bkBZfbT9bELn9Sina2RnHc4wWXz1h3CvlAQrlo8bCO/sOlrEysebX50dft7IigiJyApMRkLc/5+MsOXWQjqrvxUJtu4S6/z3E6dsBRuLUy50cdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYbufhIN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYbufhIN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9520b9155so43781045ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914242; x=1789519042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=;
        b=FYbufhINoJtbtT0qwKX2o7zjDIG4F8PqdNiRUoKGAhVz4EcHuR+OANlFAvDMAhC/DS
         Qnb3cj1kPnPsqDhbioS+6hNOxr1ja6ITkrlmF8xSh60Axnm7UcdrGTd3hH6equJnvAg1
         7SzNmdV0AdoyCv3HIWL0rX3vZBydF/pLFPtdgj776e7LS3bIEMp42yAY6Y7uDVcRh+zn
         J8B9lLuZAAPcr2JLJq3RXeQqgYMUyx9BRiDPFtzT3ladEQbyj6WRB0CRLyuT1RT3sLce
         qBuCJvd2YNsf4UbtHS0rWQ9AyMGXIXRUdel4KZRKZ1zPi26szgUEts1g4pLsthVUtOln
         rEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914242; x=1789519042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=;
        b=Zf0sj2EIGDn3AhfomnItBtiZXLuu31ZaCXOdRJs1p5CzI8TIkB+zJ5pWJm03pqVH9G
         STl8asXp9z2QUOPeSlQnb0WD+QlSedWFmeY0cqvUHG5zkmO1MmLmvrovRgIHVT4P4saK
         P9GTKFEBYuWOODW3ZCujmwRX7hTSpGNSU3KRqo94QrNofQ/Qwz7CJvVNEn2/yIDKtei8
         +0U89oyUJNGciaFLYzdt2MKgD1Ig00pcb81txdZQfyY7g5LqMmIi2ujSdhX/iyJsS+e4
         R62JmUgoFMhnkD4crdmS4SVsqAMgP12HfWmBegCrzoVCzFO1YIdaH34zb2QKq5Z1NLst
         Ng9A==
X-Forwarded-Encrypted: i=1; AKwUvBy7tkbkp4PEMyhChy2ctltX45uoxjJGa/IOui+fLwTFjk+HpKG0W+KwD2o8htfaBZ5OCGIU5DNOWmtkB6c=@vger.kernel.org
X-Gm-Message-State: AFuF++mfKIyspDru8pGILqO9XAwbQNt2GqrhL+bQy/jGhbXnx+1LOplh
	CbpNfv/v4f+MH7XeccQTgRf1Zx8Dx2acYDLFnrTuGgNaYnce5xfVHY7Sss3uZPVRhtM=
X-Gm-Gg: AYBFou0IhkHr8bNfJIiqwABOcIVrU24o2MnHEseqbxEy6HsWJPfZWeKFAvNM6IASVKR
	HfgRJnRYsV9t7zlYnfnVO7Q8LC03zQ6wOa04QWLDhSs+kdrD75iU6+V7aoV7WPZ7aByQUidPany
	5mC7sl9/StCLSjJG8zxDeT3RlmDQVf6YqOAAFjkQzoqDwXa7nUr0igH4FcS2RR2Rh0E7dEu/faS
	4WXCczeSzU8Ohunj3lmmIR9GAn16F/co8C4UTPJcHlpwoBBalOW9jqyDHbWpiU8p600cly3U2yS
	6SZHt6QUNeQYZJ3TIgLtW1TPoEDSIutHvtAgJ1zfdJrKcV/omLAluUUw65g0ZYw3eC1N9w4BCqe
	S6Y/keiu8Y10FoKUHTmIOvfKFTcLWiAE7wPD3yrtsZBCxM9zCt3jZKGMv+m9aplVyHaT8NgwR48
	Y5BNJlgbjyYJkrwJK7AqlpJjYNgRDYeU7Gqwvpij8Y83+zItRyBHG4kQemyBZIXI5P5IUMZxI=
X-Received: by 2002:a17:903:2b0d:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2db1284b6dfmr457504295ad.15.1788914241741;
        Tue, 08 Sep 2026 17:37:21 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm62627875ad.82.2026.09.08.17.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:21 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 5/9] crash_dump: Only use kexec_dprintk during the kexec_file_load syscall
Date: Wed,  9 Sep 2026 08:36:47 +0800
Message-ID: <20260909003657.1570544-6-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kexec_dprintk will only be activated by "kexec -d" during
kexec_file_load syscall. So use pr_* outside of this syscall.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index ff6055a97a4b..9ad50ac54866 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -76,10 +76,10 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 	if (!IS_ERR(key_ref)) {
 		r = key_ref_to_ptr(key_ref)->serial;
 		key_ref_put(key_ref);
-		kexec_dprintk("Success adding key %s", dm_key->key_desc);
+		pr_debug("Success adding key %s\n", dm_key->key_desc);
 	} else {
 		r = PTR_ERR(key_ref);
-		kexec_dprintk("Error when adding key");
+		pr_warn("Error when adding key, ret=%d\n", r);
 	}
 
 	return r;
@@ -129,19 +129,19 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 	keyring_ref =
 		lookup_user_key(KEY_SPEC_USER_KEYRING, 0x01, KEY_NEED_WRITE);
 	if (IS_ERR(keyring_ref)) {
-		kexec_dprintk("Failed to get the user keyring\n");
+		pr_warn("Failed to get the user keyring\n");
 		return PTR_ERR(keyring_ref);
 	}
 
 	addr = dm_crypt_keys_addr;
 	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
 	if (key_count > KEY_NUM_MAX) {
-		kexec_dprintk("Failed to read the number of dm-crypt keys\n");
+		pr_warn("Failed to read the number of dm-crypt keys\n");
 		ret = -1;
 		goto out;
 	}
 
-	kexec_dprintk("There are %u keys\n", key_count);
+	pr_debug("There are %u keys\n", key_count);
 	addr = dm_crypt_keys_addr;
 
 	keys_header_size = get_keys_header_size(key_count);
@@ -155,7 +155,7 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 
 	for (int i = 0; i < keys_header->total_keys; i++) {
 		key = &keys_header->keys[i];
-		kexec_dprintk("Get key (size=%u)\n", key->key_size);
+		pr_debug("Get key (size=%u)\n", key->key_size);
 		add_key_to_keyring(key, keyring_ref);
 	}
 
@@ -315,8 +315,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 
 	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
-		kexec_dprintk(
-			"dm-crypt keys haven't be saved to crash-reserved memory\n");
+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
 		goto unlock;
 	}
 
-- 
2.55.0

