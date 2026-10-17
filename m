Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533B4315A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224992; cv=none; b=MSazMqbEwT4Sqk4jgy40dluDjo6cFCmoI8dIZ21ugTdrXsfFcq45Lcn2vzaF4I4IA3fwtXgEPBYszLPrFPhisBKUuH6KkGo81qouMLo+YoqFo1tIeeG7UOhRpDJtdMPMF+mxKG9qQ4E0GA+BIKyQr1PIadCbgxUDJJEYfI5Wx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224992; c=relaxed/simple;
	bh=KOss2RXNEsYXOLGcex6zn2KON6+z01gxh5ch8cLaMJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VHTHshxtPcu5lZc5WsMo2KgWZDhFxbPD+3pmuJMrZ36IC0GKF1rLvhWByipFyz9P2BYEEgFzBCRxPYsD6Ss3kg3f22KftKzAHzAn69awnfqUBjAgBfSs81tNl6uhDsUwIQm16g9pit5oboyvWC5yty89W9XyzpOIv3K5nJX4aUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxvn0DrB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxvn0DrB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so2476805ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792224991; x=1792829791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Rvkgh3Vtn4gb/N875529l68oF+mXegyVxx4uqGo40A=;
        b=rxvn0DrBGA4lUspUCoMRnhQoLszSi69RyZVnC97bvR5v++ZzYwPFMWx8o3uQ0O6ZqU
         J0Y36YYqGq43zUk+1GugNgHhflWfd3vAKJITCTkpYPjxoJZ1HAUGhx4YUQkgA8g+9yz0
         joTqo9B8chmNRu3cY/PXnkOskC2xxitsrRg54Kh7tJXm38sbC2juv2T1mmR0rhhyajZf
         KWclV2A4WiVZvPfS9wnB/3I5gJCJVToNiyT6YtIYhz024vsu7gq79fE5khitzfcaKEqd
         rzRdaD+a65oBybA3b+jBSXYxFpG5iRVp1ZN6JUR22o0XPLwQe60Jwcog6quxl3bBBSrQ
         h6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224991; x=1792829791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Rvkgh3Vtn4gb/N875529l68oF+mXegyVxx4uqGo40A=;
        b=HFCehs4Jsq0Ilc59t3fggq5mB8ZWFkHgQ1GsgyjldcsKpqyalMe2c8aOgvU8lxWkr9
         1RCWSH0CeHuWGe9CZ+9/8ptqkb+txgEyaMUUH2vwtE8vcv+huMy5KpTPATjQExsUhxsK
         iFSnLslekvOrQckTyFf/9BxqhECAG5xTinoq7Mx2eSa2kzVBrh3xy6FonDVJSTAF0aRP
         DUG4Eo0R+nBONm+rX4uu6Zwry2T1X6oosRGebUtYywk+PmLPCLXexGLWcZLC3YSJbb+6
         Huip9QS99/2V6f8vH+LnPQt7Ad/nLrAxJNPMYCxrXmMRk2IX8p6IW2jeIwVJwdmIcOfo
         jiWw==
X-Forwarded-Encrypted: i=1; AKwUvBygp0UYWaVtqqQkZSpyrBMF6I/QkKBu7q2tOc3PUuTJD1ZpDo+TXWit4gpg+yjvat+kdOJnUlIQ7lYuEJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOloRj9BmhZ5O0226bHBZ4/1YkrWGzmBp5j8pZzEZlU9MwSIiP
	9GRHePJtJdehTtcd62j3JoRLXHrGEMCrJ9kppyauI8JprIG0FayNDupeUbZpf0d8
X-Gm-Gg: AYBFou1SVF7dTdp0+hA7yhDuFBmJqXwip7HxJieg6KLS2P8bvBaWaBbbPlCysikZTvb
	3flkYvw9UxsFWxXGgI3qo2ODI2k4GiglNbXTAP2fj4JkxxY8Te2iz2Z0x7iyc+yTHVtwbIt5+9F
	+OrxsVAt7Y4i4g49eqU1wrFJOLvEu+khEzbX6f81Znk2PrizcnvB0dht/xIS+d+mDQ1M3IMdcZs
	nS76MtBEzKSJuLIqMVGniWKrs3sN2kgYiubIfkCN57N3Yu5tnlND3U9sF+dRkF9l6LvXCk8g7cF
	isi3cEDKbhAnhWV0lH8Dpi2L6dyaC8uyCrgAZlFD7tk49c1rJKT2jGvTbXKC4UqltAYGbZupajp
	SYCpc6hOVQXK9BpAFc4PJAN5xyBT67R7KTwU5FnMvJfqYgqrewxWdRDiWgvui36ZFwX8D5A682/
	SG3vFSihJycOLISyHkSAtN2+wSrbIZXYPAWJOv6ql36q3BS3KsdcJbALVyYPbDnVcdOg==
X-Received: by 2002:a17:90a:e7ca:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3acef14859dmr1938332a91.32.1792224990592;
        Sat, 17 Oct 2026 01:16:30 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc980a548sm3607125a91.0.2026.10.17.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:16:30 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] keys: Avoid owner account dereferences in /proc/keys
Date: Sat, 17 Oct 2026 16:16:22 +0800
Message-Id: <pm-keys-proc-owner-uid-followup-20261017-v2-8f8f34a41eb1bbb94ef0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The namespace filters in find_ge_key() and key_serial_next() read
key->user->uid while traversing the serial tree under key_serial_lock.
That lock keeps the key allocated, but it does not protect the separate
key_user from ownership changes.

A /proc/keys read reaches find_ge_key() through proc_keys_start(), and
key_serial_next() through proc_keys_next(). The lock stays held until
proc_keys_stop().

A successful privileged KEYCTL_CHOWN on the same key replaces key->user
under key->sem and drops the old owner's reference after releasing the
semaphore. If that was the old dynamic key_user's last reference, a
/proc/keys reader can access freed memory:

    /proc/keys reader                   KEYCTL_CHOWN
    proc_keys_start()                    keyctl_chown_key()
      spin_lock(key_serial_lock)          down_write(key->sem)
      find_ge_key()
        old = minkey->user
                                          zapowner = key->user
                                          key->user = newowner
                                          key->uid = uid
                                          up_write(key->sem)
                                          key_put(key)
                                          key_user_put(zapowner)
                                            kfree(zapowner)
        read old->uid -> use-after-free
    proc_keys_stop()
      spin_unlock(key_serial_lock)

Use the inline key->uid in both filters, following the approach already
used by find_keyring_by_name(). The serial-tree lock keeps the containing
key alive, so filtering no longer depends on the quota owner's lifetime.
This also uses the same owner UID as proc_keys_show() and the permission
check.

For thread keyrings, key_fsuid_changed() can update key->uid without
changing the quota owner. The filters now follow that current owner UID,
including when its namespace mapping differs from the quota owner's.

Fixes: 454804ab0302 ("keys: make procfiles per-user-namespace")
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---
 security/keys/proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/proc.c b/security/keys/proc.c
index 4f4e2c1824f1..aea06a74d0fe 100644
--- a/security/keys/proc.c
+++ b/security/keys/proc.c
@@ -68,7 +68,7 @@ static struct rb_node *key_serial_next(struct seq_file *p, struct rb_node *n)
 	n = rb_next(n);
 	while (n) {
 		struct key *key = rb_entry(n, struct key, serial_node);
-		if (kuid_has_mapping(user_ns, key->user->uid))
+		if (kuid_has_mapping(user_ns, key->uid))
 			break;
 		n = rb_next(n);
 	}
@@ -100,7 +100,7 @@ static struct key *find_ge_key(struct seq_file *p, key_serial_t id)
 		return NULL;
 
 	for (;;) {
-		if (kuid_has_mapping(user_ns, minkey->user->uid))
+		if (kuid_has_mapping(user_ns, minkey->uid))
 			return minkey;
 		n = rb_next(&minkey->serial_node);
 		if (!n)

base-commit: a626e44fd64c456d373ae8c28b939197b9446a02
