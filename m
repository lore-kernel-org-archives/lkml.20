Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275096;
	b=JAIRjrzH6nNnYS9ZnZxu++13Y0jrL7Yh1IzT3jvmMnZiruWKGwG+LD3OsCH5BqbRntSW
	 Bm5u+UnxgfSTTqRTklTVrZJlpTpQeYb5XeB8SV/8WxmhXEeFt/wJAFMHxXtsU56TyLKBe
	 42+rr0lDpjakBY91v2gaeSosDDrs/HrgkybILelrslHrjiHNjvCzej3Gne160ZYj7V5+C
	 8MogkTgcvHC148ytFR2s+GA2/EEcftU4yDSeXhA3XrLl1PERcQckrBxLELkPpeBg3tGcx
	 nfH2s7EjN26ryF0uRda6qMLlVHYSMdhHvAfWYrERCa7aajpkFXnPvdYPmaQ/D252/7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VEJxuw7v5WS1JXklJNxWI3IzTNd4l+O1vemEGC9NlII=;
	b=mRqWbMjODL/ftzz5B7yWDN3W+OYuHC2cMBTNT2x6uN9AUWHHuyVnfr5lB6orBcmJB0p+
	 G47qWXRw2MdOKYNr3d/XSX9mGwTMpgMpvN6NjCr9+LQCci6HwJplxDZ8SUrQ7GyvQDrUU
	 eY6ohKfsHZnbKvonefhVM2fOk7HtKYPW31JmxaJhSEvOdVT2PvNMrwaNP1d0Y8r2cAvPW
	 jBC4ioe+I4GCqeK3gRwNJeOUcPEPQFz9gw2uXnLn8yGGjzxj8syiUyCwGUefPa3eprWoU
	 HmHVeXx4ese2ZrbxnOwbsLOX/zlkYFVf2xBB/gAodYL5ifDs6uBCEY+GuIPqTFP2nZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZxOySYw6;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD31606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZxOySYw6
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e812e2b31bso12063605ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275095; x=1793879895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEJxuw7v5WS1JXklJNxWI3IzTNd4l+O1vemEGC9NlII=;
        b=ZxOySYw6NYmINxrUznhCRkoVM326b1kMuU0Pzv421sKfplb9XFqTFdPUjFvnQHH07z
         dU1dUS6CghARvfNo0xujIQxq0UtnRQXho6lVU2aBzH1dV6rzrbMl9qn+62l9uSeWGR/Q
         /n3DmY+eG/tVIP6NWe7zrqjdPr7Pd76YXeNf5eXZbEqjOJ2PUDQfZEl+Ikp76A9KNXfP
         QsrWwasvhfhgUFBKNVv9G9xmiIoEyYpocrWbBPlkb8K//1xwGGxZzz9aLI8m4SKuQcNK
         uF3tVlKFnZbXjuKX6XWmBEdXdDVFdsdYtBZHRWKe4Eb+43avQTJXnvK01TvDRJgQjdgA
         ES/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275095; x=1793879895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEJxuw7v5WS1JXklJNxWI3IzTNd4l+O1vemEGC9NlII=;
        b=lTZBw+ScBotov7UYN9eTIpskE4/xfBILPRBswMd5uRj6zRxLk+i6FsO16mrXdsPoM+
         DXj3CN5SNgWSEN5Ho4D99hVp+xsUCmkxCmYplM8cvSyvOeDJjl+ckA4Ni2WtPuITjvEG
         8e90GIS4410H3x4zQeGFSYs2SH+GhVyQlp3D35bUiKQs62AFUW8HTNJv7j4NuH+12cYN
         o1Gx6A1ieM0b6CE9wzD373TFGf1SDDZQl1WsCKCPK+WLkDDNKHLeL5uT7DWAfqDehGwZ
         AbdCkCRGd1LZV4ebAeE+g9D/pt4GBn9N477BjN31qLb0sbgDZpfSEIfg86v21rgYVtQv
         9ABg==
X-Forwarded-Encrypted: i=1; AKwUvBxq1lPQnYer9akrs3LKEcOkCUaIGGz2/T0edNDJ+Y48n1QdXZD/WrHQ02m+AXS/oxAdnhhmSXT9dZBAeaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYId45/lxbU+jAa4oK7SYxkBhupRiNDdVMKm9EhmGvvIlsrQ+KtX
	NplbVxR7C0f3qcTNFFwoPUC5qfQbuM0L/f1pPl7PDhHU/TLPUIAs03+4
X-Gm-Gg: AYBFou3n2Svb3cgYS9gaFrkqdcWkPC3LTBo3rHXh4iAs0sG8jG2bZ5zXl18L4/bomqL
	Kudv5VwEHXpa0JsZQS7e2/ehEoFwWfmmBYJk5jk9jE65oMDgENwYGmhw3nZw/LSS4fmWZh/X+Sk
	3u9jo4Mt+BnscOQZqf2BZLo80XAcOo/eFN1zAN86iaAYKKe8U74tHXsKP7v2JtQL3SiecqhDlEb
	LXZJx3X+iNwOHmcH1JFiXbzC+r6TnxOvVsuVPDnpLkBtpA3nCDVC/+09rAvFJFtJsRtM7xZulKT
	cDonHSztIoVyR91EjFgzCX1qkI9FCS1Zp3hJrJAoXfkyZAxxFPAe8petQGBU5sQ0SvCRMWVSFn7
	nrejd/avxGojZoGLf6KtYY1XQUP++jaLRuDxwbclopsvN89ZxH0tTFzZ+Z2qoJ6jXp8wemnEBhZ
	/xoSBYpQ2M0kjHyTaR2pPLgSepjRyr+MDIwpx6kvUF+C1DVJvig9PsPsyGC41AdckgWWPK0mFPv
	QmG9sJ3u9mInLMprBxgw+KTzxdg5ywC0frYemN8iBGzSPgbYxPY766+QDvI+UgZYb9f36zJ8owp
	DwY1otb4FyZcpitBqFzNIBEW
X-Received: by 2002:a17:90b:2710:b0:3ab:ab5a:ef06 with SMTP id 98e67ed59e1d1-3ae57f637cemr3901099a91.12.1793275094915;
        Thu, 29 Oct 2026 04:58:14 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm4137834a91.11.2026.10.29.04.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:58:14 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] keys: Protect the update method check against type removal
Date: Thu, 29 Oct 2026 19:58:06 +0800
Message-Id: <pm-keys-update-type-removal-20261029-v6-3d92b2f9693854230a02@gmail.com>
X-Mailer: git-send-email 2.34.1
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

key_update() reads key->type->update, ->def_datalen and ->preparse
before it takes key->sem. A reference on the key does not pin the
module that provides its type, so KEYCTL_UPDATE can race with the
unloading of that module, for example dns_resolver:

  KEYCTL_UPDATE task                  Module unload and key GC
  ------------------                  ------------------------
  keyctl_update_key()
    key_update()
      key_permission()
      load key->type
                                      exit_dns_resolver()
                                        unregister_key_type()
                                          GC: down_write(&key->sem)
                                          GC: retype to key_type_dead
                                          GC: up_write(&key->sem)
                                        unregister_key_type() returns
                                      free_module()
      read saved type's update member

The final access reads freed module memory. With the updating task
held after the key->type load, it faults:

  BUG: unable to handle page fault for address: fffffbfff804107f
  #PF: supervisor read access in kernel mode
  RIP: 0010:key_update+0x12d/0x550
  Call Trace:
   keyctl_update_key+0x6b/0x110
   __do_sys_keyctl+0x21d/0x4f0

This is the same problem that commit 925c84e3cc21 ("keys: Protect the
read method check against type removal") fixed for KEYCTL_READ.

The encrypted and trusted types can be built as modules and have an
update method. For them there is a second window: the GC can move the
key to key_type_dead after the method check and before key_update()
takes key->sem. key_update() then calls the NULL update method of
key_type_dead.

Take key->sem before the first access to key->type and hold it until
the preparsed payload has been freed. Once a key exists, only the GC
changes key->type, and it does so with key->sem held for writing.
unregister_key_type() does not return before the GC has done that for
every key of the type that is still in use, so the type stays valid
for the whole update. If the GC has already moved the key to
key_type_dead when key_update() gets key->sem, there is no update
method and key_update() returns -EOPNOTSUPP.

Assisted-by: LLM
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 security/keys/key.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index e88548f1a704..bac2333089fc 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -1101,9 +1101,13 @@ int key_update(key_ref_t key_ref, const void *payload, size_t plen)
 	if (ret < 0)
 		return ret;
 
+	/* the GC cannot change the key's type while we hold the semaphore */
+	down_write(&key->sem);
+
 	/* attempt to update it if supported */
+	ret = -EOPNOTSUPP;
 	if (!key->type->update)
-		return -EOPNOTSUPP;
+		goto out;
 
 	memset(&prep, 0, sizeof(prep));
 	prep.data = payload;
@@ -1116,8 +1120,6 @@ int key_update(key_ref_t key_ref, const void *payload, size_t plen)
 			goto error;
 	}
 
-	down_write(&key->sem);
-
 	ret = key->type->update(key, &prep);
 	if (ret == 0) {
 		/* Updating a negative key positively instantiates it */
@@ -1125,11 +1127,11 @@ int key_update(key_ref_t key_ref, const void *payload, size_t plen)
 		notify_key(key, NOTIFY_KEY_UPDATED, 0);
 	}
 
-	up_write(&key->sem);
-
 error:
 	if (key->type->preparse)
 		key->type->free_preparse(&prep);
+out:
+	up_write(&key->sem);
 	return ret;
 }
 EXPORT_SYMBOL(key_update);

base-commit: 9a2a4c51dccc3168c3dc949fcbaa360a478fa228
-- 
2.43.0

