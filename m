Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25E413796
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222308; cv=none; b=Nrb9ypBGwg0Avo6ByY+uqswHuXFEVDlu2vYlTBgTPLqkBvSPEn8DxAQYtmHVL7oYh0whvA1NGnu05+dLcab6ZJywCeObOSqNNpIdJHThE5uz3I5p3nLK9x0iC6z/RcA1xJJrzMM3ZIIrAokkKpcJC2WWZ3yzIPhvDm3QCZQ4MvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222308; c=relaxed/simple;
	bh=ByjrDEW+cLHIanPR1r9ZCilmfQtfffG3r6vZkp1Qvgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rG+KGwqCP0hSIDJNVbwLlxDt92LTVC4sWV7nRAV0EGfpWb/+IE3jeFd7RW5rkiuh3QE07elAUuXimbsSWzIxRXuQzGN/EmKoKbwjxynRd43IiL36k2nU+vLOXWBr5h5bLhBQdBEI6MbhnjiyPTcaFgMyyBPTPXKAYoM/wFbeH48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1RSJXnZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1RSJXnZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89d4030cc57so340352b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222305; x=1792827105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hGJqskAm5ijlynAeAUmg/yteXxLufBW9O9YFEmU6Qk=;
        b=e1RSJXnZ24+lkTH1+xssf5wkeiBfq8/U7/Az45uAm+zHRUOCnti2GFO+tpQRpoARM8
         qS/aTL+U8kIr2G5waPe+nVn8M1J+P9ZNNpbpVRfR2WzQEMiDBCL+XSM7DLP/6ICgUVLC
         bxgt16biVtowpz63XgIVCHuMZGR8T8zPENSF9rU1YG8Von7HB9M+eZZKW868xFcKwRki
         XQlp48NaN6+5Mq3EV4kmPxMG6Cpv2B4JR1EjAx3967kjsnm88ZlddJeTXMngC1y5ZUyP
         fsa+8BSZ+VwB0mSXiR2iMVw9M0PUtq+C8X4YlaYvCncLcAjWK8rsiaqSP4ZMcGMqux6s
         eQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222305; x=1792827105;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hGJqskAm5ijlynAeAUmg/yteXxLufBW9O9YFEmU6Qk=;
        b=doUSU9rlcHB3+4gpE3FuP7VjMFdh60VyJfi9gZNQrctmzOehGMdEqiyhSpml2CD0a3
         g9WOlA2LvOilGh3bCRmjfJEdPAYCgvMgBO7yHl8m/MRz2h7tsQr/LNW+q8RBbc2jltuT
         dsCrdtVfkP6h1bbJBSWTytbSYWYzCXjkNuVxnPq3NR4VaV+D8BJuDleiBk/oE5RHA2rg
         kq+rsb7ADhPoxGU3hzR8ZjAU1/SBMw8UlbCCirPio/wERD0Z+sW8QJc88aX7U7NRPHeg
         DTMttl3s3T5v5opeTkHCdtOjbPE9KDZipJSv6sw/OAWoha/tz5cOYKlJPE5gn6P+x+f3
         zfUA==
X-Forwarded-Encrypted: i=1; AKwUvBx9rlfPWCkj2zf4D3snS8X1XwkwUhpGKXiDurv4f2Q9K+QBI90D/5meOcm1kb/gTUd3OMrfml2r9FmNPN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Fo6P7DmHKu183fvLHsw5eK3mXGsO3+Rn/6+2WrE5+HQyQcyb
	knC7d71RHjTuwfuUkJhoboFSYFocPydJ3FyAeAgDteaSlZdsdkwnT5/Q
X-Gm-Gg: AYBFou0h0YLXmcnB3vhE70P+Xad2HaHTAqkB0OJx54vT5o06J3GTLmBJyfg++6WQfRl
	kZ5Fi2uTUWqsjp6b7R4mxwptk0MCodHVUBPPahDR0MTBQ+Yql4jJRY5pxpgDXDBvXm1OYvBgNP0
	4GBdqwy3CGOiQKlVwbvcKecdkpwe02mEKK5ilmpbjwZYDHb74YmoJlzbAV6YdXbry4M3HbPQGDR
	O/3pDLrqbfLhduaFQypQQ3SHSwQn7TeqWklAaLopn0hpOysEKj3sxsf9LWBmeFDMMDylpXhVVhU
	gnTIXpObXooxq+8jGN8HtzmXjMz1DAea2Cf8FuMWRGYvSdq1Dg461brSIeN6AuXc0/ICvjVMg2d
	7m44p/rSukM77rx6Sx79PW3k7iY+Pnvkc+XA1WDNPrLqEtw2q6roV36r38otHoywnLgWx3qmOJ/
	HHFT0BGrk+EDpt+QbSDdNuxJKF3nNvNGLTQJGjql6aO8IFivGqZccxwQGQKHn84ECQVg==
X-Received: by 2002:a05:6a00:4506:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a04d350f4emr1539150b3a.58.1792222305449;
        Sat, 17 Oct 2026 00:31:45 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5820b344sm2051607b3a.53.2026.10.17.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:31:45 -0700 (PDT)
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
Subject: [PATCH] keys: Protect the read method check against type removal
Date: Sat, 17 Oct 2026 15:30:56 +0800
Message-Id: <pm-key-management-objects-candidate-0010-v5-c6b7ca2813c6913e500a@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The key type must remain alive while its read method is checked.
keyctl_read_key() holds a reference to the key, but checks
key->type->read without holding key->sem. The reference keeps the key
alive, but does not pin the module containing its type.

With AF_RXRPC built as a module, a positive RxRPC key can pass
key_read_state() and the Read permission or possession checks while
another task unloads the module. Unload is possible once the module
refcount reaches zero, e.g. when no RxRPC socket remains open. The
reader can be delayed between loading key->type and reading its read
member, allowing this order:

  KEYCTL_READ task                  Module unload and key GC
  lookup_user_key()
  key_read_state()
  key_permission() / is_key_possessed()
  load key->type
                                    af_rxrpc_exit()
                                    unregister_key_type()
                                    key_gc_keytype() schedules the GC
                                      pass and waits for it
                                    GC takes key->sem for writing
                                    GC retypes key to key_type_dead
                                    GC releases key->sem
                                    unregister_key_type() returns
                                    free_module() frees type storage
  read saved type's read member

The last access reads freed module storage and can fault in
keyctl_read_key(). The later read invocation is already protected by
key->sem and key_validate() in __keyctl_read_key(), but neither covers
this earlier check.

Take key->sem for reading around the read-method check. The garbage
collector retypes the key under a write hold on key->sem, so it must
wait for the check to finish; key_gc_keytype() in turn waits for that
GC pass before unregister_key_type() returns, so the module text cannot
be freed until the check has completed. If retyping happens first, the
check sees key_type_dead, which has no read method. Release the
semaphore before returning -EOPNOTSUPP or proceeding to buffer
allocation, preserving the early unsupported-operation result and
keeping user copies outside the semaphore.

Oops report as below:

    BUG: unable to handle page fault for address: fffffbfff8048bc5
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    RIP: 0010:keyctl_read_key+0x1aa/0x600
    Call Trace:
     __do_sys_keyctl+0x2a7/0x4f0

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 5a5efa26ed0e..756368422b7c 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -863,10 +863,13 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 
 	/* the key is probably readable - now try to read it */
 can_read_key:
-	if (!key->type->read) {
-		ret = -EOPNOTSUPP;
+	down_read(&key->sem);
+	ret = -EOPNOTSUPP;
+	if (key->type->read)
+		ret = 0;
+	up_read(&key->sem);
+	if (ret)
 		goto key_put_out;
-	}
 
 	if (!buffer || !buflen) {
 		/* Get the key length from the read method */
