Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792421850;
	b=vmfE+8ziEbsZfosU+vDVQbrlVF0G09LeOr8DvaiHVNlsgryga16SmR6V8AB4CJsOI5FQ
	 mg3aYYgg06+Qx9VzBCbK/z51NNt+Y8ja/YA1CKBd0eo4lq8j7VX83jFuYTn7180xjeUXu
	 zRAC2q+9xdKr0IWZWoAhC2L1fY0sUf7wdRlcXidO401diKDXZ/qSKpG05Sf7zNybS/Xu3
	 pWQZr4fGcsuhnHSbQxgd6nbzXp6HCjRJuY6lQ8RA/4cphQgri73WnaxQQfF5D5KxsIekY
	 CywijYmp0MJs2LDFY2ntQBr1iki2zQDnxoI8/ZoiqWxRXW6uF8JR8s8Z9eozg0JDPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M3PcnN3aKQnlUzuhBU8dosYVkkzA4/AToXSbAxao4Cg=;
	b=tkCmIF8c6IMJAhqfrrd86i+nb/CrpnZZqY74Q9CO4OxtJM5zK1/m0hQcVyNCMc7CDyhf
	 L0UAe1dkjtyG4K+52WxVfAkX1Ae8ZJi00O2NwcWbo5gcVOYWlQ47yzvUiKhAHKN5qf7fd
	 IjieDPMQik+z37+kKUpS3qjeWzX0VoIpSErwmhtQaEO7bkUXEgFYX3CtoaDfzVspZpzUv
	 4GTAKAY+Q7rdvj8hdidBnMF2Lc5rRNdoapUHsB1C9Z7w9iii7c8UB2kSewGkjRVVHACL2
	 FsWJuvKBszHpK2+fjsEgAczJ45LQ1/dFupZtqGrfiWgUxV5W2qhwlgKIsxGjWGvnDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E6LEr8Y5;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6512A60740AC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6512A60740AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E6LEr8Y5
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070755c8cso388737b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421849; x=1793026649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3PcnN3aKQnlUzuhBU8dosYVkkzA4/AToXSbAxao4Cg=;
        b=E6LEr8Y5Kg2fXeP2nlPF3U7B0wZx2u75WLmFzUTZWMclb0XLuMfgaPUpumZ0nDWcfP
         ahoYtVu3zhM31RC2xGTem9im3XVFMSziW0xnv1P9Nu3RX8+xJwVuWPqyyI3QCLMhh6Su
         KVGQ759PrKiVIqWTQ5CIDzCIfcoPOzs1Hw7ZURuOn367urWGrdpGTZpWXYwH3rzom3gf
         mHJCUVz9+ymm0caUsGGTSWNZR6J15r7iGc1sRLnV2J22kU7OT8L7KFP1334TajEB8Kb9
         m1QAqnLHLaOWfkOYfoytCf2gV3yea3S/Ft9RqM71ga8gfggAYgiFL9g8fSC71QxnEdaQ
         xDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421849; x=1793026649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3PcnN3aKQnlUzuhBU8dosYVkkzA4/AToXSbAxao4Cg=;
        b=Z7KZoTutlvvaEr9E+Qkfwcf1ut952HBF+GNr1OLt0qTl10b5Zckmodof8l4V9GeSeJ
         wJBakeRyvDut/xUeP5bGcetxXZApfMvdOsdjeGMYkxU0kFf31UXSJxQxMJq8EkbCm9Jf
         RM2UqajP/QRFcfGyR8x6Qvl/podLrlwldtUiqozazsNpP8hH56yro7sEuZumRKiKNA7+
         uCaWxwCCkgn4UM41UZUh7VVwrcLM9XxMCP87i/z7v50dFz4ZdjXYRIK9AdkJayatJ0n3
         aaUWYETPVuNG+vIYwf1SyV/R98RIP1PvNFgP8s75ngFYnw+QjMN2vh2LPaCRgzJrlFAI
         2OgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpXqAm4ckMzj0SknL43aDoucJAmcAPaJOvpfxbDFmLz8S1J596EZ30R2jXRWDs/MOzCV8cA9vMiR4018E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ/093Qeiqa+2PBQ0rjgqcwLNF9vK7uqD9nuqfE331z3V881EY
	xgNGITH9+rGuy8vZ7UCZg5n/cPGLYAZGYpaB+d3196GeYrviqlxY08+S
X-Gm-Gg: AYBFou0ggUfx7tfcISBSDb3ZZKBUN0xfbUVNok+MghAIzvGDIR3ytebdz18tHhaXDfw
	tbQUqw8IhIpubz/qy0Fk8cnX5oER8xCCK9zVvbDt8tHRvPvP2x3u8VdAkAIM7IpZ4lONWXSQsHO
	SCOGD5+VBhOqqS5xz025EK9MeLlMc7OapVmvi39YtL2o1RNqcLVvJEjqu4JSo8/1VlQi69o5+O9
	otA/g/dr16ACPeWHEfPlPl7jcQdBbEXp/kPDbdpvWXKaGhCf/UWCBqOm+Ih9ZyGG6/P2ORxSZt4
	r9PvM85ZWYbmdlW8avx7KVIl2C9aXI+E7kjRvwq7KNNHhtD6B0BcBrZBSDOe7GF7CRkpuYUcMun
	+/csxQ7u0PDsl583HMX6mPtE4inRPk0ja1Z78dhDa9Jz7LOjOEi8gbF1WQISFAz8V9pS419aqDN
	ZpS+RznJgFovGpayXjH0IkN1y+oLR0eZKyAu+Ye3nHhSkDocwVXjAoouIX+nhCHd4jBw==
X-Received: by 2002:a05:6a00:4acd:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-8a04ce2f07fmr6548575b3a.37.1792421848612;
        Mon, 19 Oct 2026 07:57:28 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e508sm4143469b3a.28.2026.10.19.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:57:28 -0700 (PDT)
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
Subject: [PATCH v2] keys: Protect the read method check against type removal
Date: Mon, 19 Oct 2026 22:57:21 +0800
Message-Id: <pm-key-management-objects-candidate-0010-v7-fc85721ff5cfb9e33ac6@gmail.com>
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

keyctl_read_key() checks key->type->read without holding key->sem.
A reference keeps the key alive, but does not pin the module containing
its type. A surviving RxRPC key can therefore be read while AF_RXRPC
is being unloaded:

  KEYCTL_READ task                    Module unload and key GC
  ----------------                   ------------------------
  lookup_user_key()
  permission / possession checks
  load key->type
                                     af_rxrpc_exit()
                                       unregister_key_type()
                                         GC: down_write(key->sem)
                                         GC: retype to key_type_dead
                                         GC: up_write(key->sem)
                                       unregister_key_type() returns
                                     free_module()
  read saved type's read member

The final access can read freed module storage. The read invocation in
__keyctl_read_key() is already protected by key->sem, but the earlier
method check is outside that critical section.

Move the method check into __keyctl_read_key(), after key_validate() and
under its existing read hold on key->sem. The check and invocation then
use the same protected type for length queries and every read retry.
The GC cannot retype the key until the semaphore is released, and type
unregistration waits for that GC pass before the module can be freed.

Return -EOPNOTSUPP when validation succeeds and the type has no read
method. A temporary buffer may now be allocated before this result;
allocation and copying to userspace remain outside the semaphore.

Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---
Changes in v2:
- Move the method check into __keyctl_read_key() under its existing read
  hold on key->sem and remove the outer check.
- Perform key validation before checking and invoking the read method.

Link to v1: https://lore.kernel.org/r/pm-key-management-objects-candidate-0010-v5-c6b7ca2813c6913e500a@gmail.com

 security/keys/keyctl.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 5a5efa26ed0e..36ffba0ebba6 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -808,8 +808,12 @@ static long __keyctl_read_key(struct key *key, char *buffer, size_t buflen)
 
 	down_read(&key->sem);
 	ret = key_validate(key);
-	if (ret == 0)
-		ret = key->type->read(key, buffer, buflen);
+	if (ret == 0) {
+		if (key->type->read)
+			ret = key->type->read(key, buffer, buflen);
+		else
+			ret = -EOPNOTSUPP;
+	}
 	up_read(&key->sem);
 	return ret;
 }
@@ -863,11 +867,6 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 
 	/* the key is probably readable - now try to read it */
 can_read_key:
-	if (!key->type->read) {
-		ret = -EOPNOTSUPP;
-		goto key_put_out;
-	}
-
 	if (!buffer || !buflen) {
 		/* Get the key length from the read method */
 		ret = __keyctl_read_key(key, NULL, 0);

base-commit: 89f5f41d296889f3b896c3ca67fcdf7d42bbdf10
-- 
2.43.0
