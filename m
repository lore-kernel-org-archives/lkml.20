Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758462;
	b=1lXFOarsAAS1m3xNiGM5sefXQJSlgFqNCmUsqGgPBMw0jXIVoQYT9HZHDfNnxqoIGlXW
	 JMYpk1TL2V5lrG9NqVaNlWxbFzvj1s4o63kVSnXkX0pgNDnqlMtXlq+WQeAdSNja58ks4
	 ild84GLfu6KoB7iSkoLKcwUmEutqi/UfbLxu71LayjP80GpRocCfm+iq+NQ6K3oZbKspU
	 9f6783ZJVPERC/PuzJKIzKs52Ci9ws56o1uzX0etcziSnFwHqSxpRSXMcDF9Ptp0s5XYX
	 syuhZq6Iv2t6zX4Kp8Lp16t4Un8G4uC/sM+/yY3dSn/zBgVjVGz2hyxnIOmoEPq6zcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kQRkHn5yKaAdkSvzW1LOnqRKeYkGthj+jza5xxN1gEk=;
	b=Q1q0Fg4Lcg+jCkiSk3OMvqdWoutfyxI+yzPLXeMLfmGx9BDtG+HGn7+s42N1MNhH5UpO
	 WsDXYiZyR05GtQsBECJLSgrUDMqgXJMJ1J+1BCiGmQ/FaLR5xyi1FoY4FxQOZL8/UDgeT
	 LIFGp52TnbYf3AItYGL/LaIRDzo9+amYPGYN5X6Sj6emwPZnDfZ5NpJJD14Yqg+egtY8u
	 g0UE5h8edJ2rlTVyKQYBPxzBKzLMuBNnAjHs5N5i6MRVXVx/OBou9wG/Bc9+TQVmII9Ym
	 qbZ31+j27v38Mztvygaw78yK+5uRp62kGGMj7MNhEMF0V11xSsd9CVz4XS8QFKkFyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMBjXx2u;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1014C606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1014C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMBjXx2u
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9f6a16aedso1068145ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758461; x=1794363261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQRkHn5yKaAdkSvzW1LOnqRKeYkGthj+jza5xxN1gEk=;
        b=LMBjXx2uClDkSh56yde79rrXj0XM9/iiOSgerllt7NLaWaj6hrg0RXE/pYS6LjdyHx
         70fwp2wU57BwDq4qG7q9H6cTp5ahuzUunJm0X+3B5NnR3FVWyD+glsum4i+C8DWpFoXQ
         HcowhVg/YE36o5WLf7qKDZ9+/nibJ7k7LJR4L7qnZFS8y4LZe88VQQK51Vg1OUUg4Pg3
         zhx9JAn1CU71oTNN5A/61sNjEK/pCPORdeqYhVowm6TVk/JEFVQ8F+vuZeHHRGcI6v3q
         kHLFuSFSsf9gU4EVJEunK6vYIXUiCTIXcJCAn1GO6bPfBTLrHgwQuza5WkEftfgyFYQG
         E5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758461; x=1794363261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQRkHn5yKaAdkSvzW1LOnqRKeYkGthj+jza5xxN1gEk=;
        b=2EUEiJcyVtudbwTX5hQaE+YhauClMdp58UMXH3z/M1EuiYAU4p9dsa2YUoTJCBbNst
         dQ+JLOLpHs9DZ8i6Zwxuy3kC/7JoS94jIaAJR1uXDYfa32wp/b9fOv7CfOtSS4HiqMfJ
         /A/rE2zu9hFXGQq8WFhJX6hd5MhFsWogUT+nAE9l5ryUi6o5D2dZQOToXgAnoqXX3fLZ
         1RCJBI1SiiudV8ukhRjZOhIqhpGRI5bu9a8UMzODZC4aZtAsC7BEkUQHR68AYI18BXfJ
         uRwxreeEow23dZXATAU3DPKrllbzx2XwODzm9xijHevenRaIg6EXG3fLNCPxjfOL5jLT
         iXuA==
X-Forwarded-Encrypted: i=1; AKwUvByqpwNpXWCalrl+qz/qsiYGO1SVjV73AwrGtt0WJzTOIjfH5At52yVqvVRfO1mtYs46WZpU0p8OyKjkv90=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWkol2TmlMmltzMn/IuUT0xUiG5ToL3EH9067MIAsjqzz++E1
	1pS/nfCl/gRmV7JDsaZXXP3cWbHJB4/i/9H/keZv9rYW199mZ2WXXp+7
X-Gm-Gg: AYBFou0aH3x8yZGINHuBVK6CiiJ6WXGbzvIXRw8hu8ev92pqcyivpFPd20EhADe6ANR
	ZVcTI1xLDDs2w7UY1+xqM1M4r0GRipzCT3FbIkZ/TgG+FdBp4fyXJtRc47wYlnicP8KMJdwrRMs
	D8g4oIwbc+WmwKeoo31+fQlzygpgd4Ao1xDtuTtB1efCP7Omd+QdA1KOJtQoDPTmu0/TeqIJ0Dy
	YEk6AZvklIB9KiQcylRZZGfXigKbkkgpwAGxSv60u5459kSrpjzQj48QsshUWIVUhSLyVU4eLH6
	q42qCgo9mx7Q+Qfe8rwSEqXXEI71DVZ8syPyQCuAj4wC8e3uHAL1i96rO3rNQO59lv7JW6SJYYG
	mt0XNhpA/EBAyjRApfLyGvRK5f0BgqF56K+9Wk6Z+3IqGqDl/yu91nVNVDrF4a6B+SCypPG/bbv
	Yd8MqcIz2LQpaoW5SFVBwPdXP9GwvNNv1E79y4AbdtwDA/gcdKq+MGQjkci345z1I2/OdHKjrTE
	PVqOKIRtgK44bHFLV03IewdscEZPqrkJzzExayB5PcrhxVOE/DTbA8zWbXk5vgf3WDTXkUVRXft
	L/f+lkGx5rxWxpyocbCWHk3DbZYmkic7yEK5aNJQCifkTws=
X-Received: by 2002:a17:90a:d383:b0:3b0:97b8:d6bd with SMTP id 98e67ed59e1d1-3b097b8d83dmr437238a91.12.1793758461354;
        Tue, 03 Nov 2026 18:14:21 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm6727440a91.16.2026.11.03.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:14:20 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KEYS: Protect pkey method checks against type removal
Date: Wed,  4 Nov 2026 10:14:14 +0800
Message-ID: <20261104021414.50696-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aun7J2NGn57RGS5J@kernel.org>
References: <aun7J2NGn57RGS5J@kernel.org>
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

keyctl_pkey_params_get() looks up the key, and keyctl_pkey_query(),
keyctl_pkey_e_d_s() and keyctl_pkey_verify() then dereference
key->type->asym_* outside key->sem.  A reference keeps the key alive, but
does not pin the module providing its type.

unregister_key_type() calls key_gc_keytype(), which retypes every
remaining key of the type to key_type_dead under key->sem for writing.
The pkey paths read key->type again after their checks, so a concurrent
module unload can turn the checked callback into the NULL key_type_dead
member and call through a NULL function pointer, e.g.:

  KEYCTL_PKEY_SIGN task              Module unload and key GC
  ------------------------           ------------------------
  keyctl_pkey_e_d_s()
    if (!key->type->asym_eds_op)     unregister_key_type()
                                       GC: down_write(&key->sem)
                                       GC: retype to key_type_dead
                                       GC: up_write(&key->sem)
                                     free_module()
    in = memdup_user(...)
    key->type->asym_eds_op(...)      -> NULL call

In-tree, turris-signing-key provides such methods.

Hold key->sem for reading around the method check and the matching call,
so that the type cannot be retired in between.  Each keyctl handler takes
and releases the lock itself; the semaphore is not passed out through the
parameter block.  User buffers are copied outside the critical section.

This is the same type-removal problem recently fixed for the read
(925c84e3cc21) and update (aef3a8a4f988) methods.

Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
Hi Jarkko,

Thanks for the review.  v2 keeps the semaphore ownership local: each keyctl
handler takes and releases key->sem itself, and the parameter block no
longer carries the lock out of the helper.

The type check and the matching ->asym_*() call are now in the same
read-side critical section.  keyctl_pkey_params_get_2() only covers its
->asym_query() call; the input buffers are copied before taking the lock
and the result is copied back after releasing it, so user memory is not
faulted in with key->sem held.

I also dropped the out-of-tree rationale.

I saw your "KEYS: Pin the backing kernel module for a key type" RFC.  If
that lands first this local fix should become unnecessary; I'm happy to
rebase or drop this patch, whichever you prefer.

v2 is below.  Tested with the same KASAN/QEMU setup: delete_module() now
succeeds while the caller is blocked in memdup_user(); the caller then
takes key->sem, sees key_type_dead, and returns -EOPNOTSUPP instead of
calling a NULL method.

Thanks,
Bea

Changes in v2:
- Keep key->sem ownership local to each keyctl handler; do not acquire it
  in keyctl_pkey_params_get() and release it in keyctl_pkey_params_free().
- Copy user buffers outside the key->sem critical section.
- Drop the out-of-tree key type rationale.

 security/keys/keyctl_pkey.c | 71 ++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 15b6bf6399..e553f6f311 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -100,9 +100,6 @@ static int keyctl_pkey_params_get(key_serial_t id,
 		return PTR_ERR(key_ref);
 	params->key = key_ref_to_ptr(key_ref);
 
-	if (!params->key->type->asym_query)
-		return -EOPNOTSUPP;
-
 	return 0;
 }
 
@@ -129,7 +126,14 @@ static int keyctl_pkey_params_get_2(const struct keyctl_pkey_params __user *_par
 	if (ret < 0)
 		return ret;
 
+	down_read(&params->key->sem);
+	ret = -EOPNOTSUPP;
+	if (!params->key->type->asym_query)
+		goto out_unlock;
+
 	ret = params->key->type->asym_query(params, &info);
+out_unlock:
+	up_read(&params->key->sem);
 	if (ret < 0)
 		return ret;
 
@@ -185,15 +189,25 @@ long keyctl_pkey_query(key_serial_t id,
 	if (ret < 0)
 		goto error;
 
+	down_read(&params.key->sem);
+	ret = -EOPNOTSUPP;
+	if (!params.key->type->asym_query)
+		goto error_unlock;
+
 	ret = params.key->type->asym_query(&params, &res);
 	if (ret < 0)
-		goto error;
+		goto error_unlock;
+
+	up_read(&params.key->sem);
 
 	ret = -EFAULT;
 	if (copy_to_user(_res, &res, sizeof(res)) == 0 &&
 	    clear_user(_res->__spare, sizeof(_res->__spare)) == 0)
 		ret = 0;
+	goto error;
 
+error_unlock:
+	up_read(&params.key->sem);
 error:
 	keyctl_pkey_params_free(&params);
 	return ret;
@@ -230,9 +244,21 @@ long keyctl_pkey_e_d_s(int op,
 	if (ret < 0)
 		goto error_params;
 
+	in = memdup_user(_in, params.in_len);
+	if (IS_ERR(in)) {
+		ret = PTR_ERR(in);
+		goto error_params;
+	}
+
+	ret = -ENOMEM;
+	out = kmalloc(params.out_len, GFP_KERNEL);
+	if (!out)
+		goto error_in;
+
+	down_read(&params.key->sem);
 	ret = -EOPNOTSUPP;
 	if (!params.key->type->asym_eds_op)
-		goto error_params;
+		goto error_unlock;
 
 	switch (op) {
 	case KEYCTL_PKEY_ENCRYPT:
@@ -246,27 +272,18 @@ long keyctl_pkey_e_d_s(int op,
 		break;
 	default:
 		ret = -EOPNOTSUPP;
-		goto error_params;
+		goto error_unlock;
 	}
 
-	in = memdup_user(_in, params.in_len);
-	if (IS_ERR(in)) {
-		ret = PTR_ERR(in);
-		goto error_params;
-	}
-
-	ret = -ENOMEM;
-	out = kmalloc(params.out_len, GFP_KERNEL);
-	if (!out)
-		goto error_in;
-
 	ret = params.key->type->asym_eds_op(&params, in, out);
-	if (ret < 0)
-		goto error_out;
+	up_read(&params.key->sem);
 
-	if (copy_to_user(_out, out, ret) != 0)
+	if (ret >= 0 && copy_to_user(_out, out, ret) != 0)
 		ret = -EFAULT;
+	goto error_out;
 
+error_unlock:
+	up_read(&params.key->sem);
 error_out:
 	kfree(out);
 error_in:
@@ -307,10 +324,6 @@ long keyctl_pkey_verify(const struct keyctl_pkey_params __user *_params,
 	if (ret < 0)
 		goto error_params;
 
-	ret = -EOPNOTSUPP;
-	if (!params.key->type->asym_verify_signature)
-		goto error_params;
-
 	in = memdup_user(_in, params.in_len);
 	if (IS_ERR(in)) {
 		ret = PTR_ERR(in);
@@ -323,9 +336,19 @@ long keyctl_pkey_verify(const struct keyctl_pkey_params __user *_params,
 		goto error_in;
 	}
 
+	down_read(&params.key->sem);
+	ret = -EOPNOTSUPP;
+	if (!params.key->type->asym_verify_signature)
+		goto error_unlock;
+
 	params.op = kernel_pkey_verify;
 	ret = params.key->type->asym_verify_signature(&params, in, in2);
+	up_read(&params.key->sem);
+	goto out;
 
+error_unlock:
+	up_read(&params.key->sem);
+out:
 	kfree(in2);
 error_in:
 	kfree(in);
-- 
2.43.0

