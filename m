Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003263ED5BB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906970; cv=none; b=AIWqeKbin+EwuhUh3hpXkTMaZmm45hgtTt1dPtqxUzxV8nykXiACFVIOCyigk28p0ilYgLE90av/YerVJfzjyc9wMaB9vkZDSwMFDjNi/G3++GWJy1ZDSE+iKpT2NGSegxge9MbQg0fHCNRB2ijpChST0Ah5RcfEZYzbxCkLUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906970; c=relaxed/simple;
	bh=aF+HwRDc7hQ9JdXPAY/9oNDGTWBJsPi3vCyJSEJrCBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFBs/YwSiLiLukTQ//3UNs7FWa7kvjXP8yH/xezubzM9FrYqvJNCoGbNgLSvIrpNUoklhpWAeBDr8yP+hqHizrYtbs+csJlpKeB4BTzYhwJt7L3SAUWxsVLqd1N/9O5YxHBV7dU7FY5wlhRHiZsjmv1T2bXsjm3kY1bzd5d5fCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck8XAj25; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck8XAj25"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1372222a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906963; x=1788511763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoRqUM+47pfba3G9EFhzXQlo7kPydRkr+L2gqXTvUTw=;
        b=Ck8XAj25pP4PgvKCS8PfjLFC5AI8BNW6ifldXyvZF3v00oUV/Wghoiq01+aFZa54oz
         ZInqJ11Pgoucxjy4wwWGlauE1+i8cJLadHju5jEF4Y4MYqu4gDaX+pmvO4NSa3y9jTUt
         AWLDjzE0U9m5dXR2kGvUkYlnijxqh7iWIq8TkVLcEJfySkkp3eoEY8o0YDkleNziHFee
         mFLLp+1xQz5ugKCWprgzJVb250xj6P6EjfV3fI2nY2ThZprnyOOrn6nVjwoPEU/2w4gi
         uMD630HSuKmnXiDNi29o41ozQHhqbpjhQTVQDVvItjyLl/8oySf2zefoPmbgBTqt8Nxl
         klqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906963; x=1788511763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoRqUM+47pfba3G9EFhzXQlo7kPydRkr+L2gqXTvUTw=;
        b=hYzR7ViOi7N+vERaRgqcl6diWEYlV8Te1YNeYyLnboAvU5scF4vi2/bI8fxoX4yb1g
         A+n5WZJqVmoHe8MpzLWfA+qvqG+0L9DeW21xuzVhKXnBFJT/ibQuKxoc2IXmyJVcD4KC
         LpE9QaSLUyp8IM3f6ni/lj2unoezgJs38I+mphxLGP5PRaq7dER3IuCE0l6R4ng/ghUa
         +IgS6+NbWLNxL6DFwzkecO2O1Inhgoy4u5njh0AltUBuHpslr9Ujw00UbFyRrUEDWyjI
         TphTFecKKgMzYsl2Tr5h303c/xscsVoAaKY1kF3mWogBvQADG8e7JrZTnBE9bjHMv3v7
         uvTw==
X-Forwarded-Encrypted: i=1; AHgh+RqlvBwopNyP0cb/jk1smgqI4LDa0HWhgkYGIs2N0Na2Q778YqC5rK3cR9t50bVsBQUEm1hFcHq43k2pkYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lsoIbZReqDtxYeSOrrRf+iVff/0Nxu8zNkFIc7RMp7XSEl3R6g
	mpgsg739mZS3DQbnf2/BWyppA6v2Um1H+sRbzzkXswvlz28W+iZM6/Vd
X-Gm-Gg: AR+sD11/LQkZyWibgPjYxM+CtG0w3ySfPDY6ICPg0WovYZjevITNBikZJIp2OTNhgwr
	NLjFc09YmIWIdrbDwPxMRS7dSOCG4V7e8K4/jqXmLEIC5It75+sm+iChD2bhb8W55unTll3sV6l
	lLCyZE4Dwq/lhN/K7KWYfP8Ws9qeAxz8kYsMNrNeuHo6PMRk3dSWiGUDBfm9Ko0hzQtXHgh/MAs
	Na2q/MTcYBEpKohKExb2taxnI2sqivJIlK+pnnRAkQOa30MncDKhCvVccrUN6cBVifdXPMwy3rx
	trcfP6QFJIZbW18j8yoR8B6uDvqTvlATTKnO24e2Dpxw1/hyzqSEd+Zn09aQYyAZiuVbIxIBgEs
	8Q2raV/q7LAM6Mshuxdtt1KIaZa6FID0OZLCvpRkCaFlnLXeNETtBgmadf7WakAVsvl2oo+QTDz
	DrYuyfwVYZdgHBBch3Y4SCH3A2x+u0JDMgE8TNHq2Sr8N7+Q8tQxA1sAzyXa1iTYMje4gy8g==
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr9370873a91.11.1787906963332;
        Fri, 28 Aug 2026 01:49:23 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm3975657c88.2.2026.08.28.01.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:22 -0700 (PDT)
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
Subject: [PATCH v4 5/9] crash_dump: Only use kexec_dprintk during the kexec_file_load syscall
Date: Fri, 28 Aug 2026 16:48:51 +0800
Message-ID: <20260828084900.1496839-6-coiby.xu@gmail.com>
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
index 91b7a5413b62..9ccc7b5320a3 100644
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

