Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EC4137A2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526364; cv=none; b=mcfS0ml0hWSWT0+546nCPZranp0dvxAVURkgFK1VMBxP+v95kMrGKC39WQMNqW8lXYns4L+XGjGLPoQypDL4Jv5UJaXSXuhofa2Ves1AN2IOJpylAoQCwILR9mlz8KU22R+E8JS9yTrG1qgLyhE6+0ooqbqWQLC3NfBgcJnnMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526364; c=relaxed/simple;
	bh=w7hXOZR3kGcBhr0hjg4B5lwGJGB/KZcZNRTsshLVPPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaR5FT4+1Xm6jz7GmS8H6EgoHmlLyRw0U7sqMc5cNU6twGQKWia69WvgrsKDxjzIG0hRdpUKUAurgJOSuaFdhJN75fYEETfJ8ma1wJPiLrP3MA2rznzTwGximqmC0elcYm8/wOSZZm/0o+BtU+n2JShbdjLf/nn5W2F2gxp4Wb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7exR3oT; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7exR3oT"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-141a5cf1371so129945c88.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790526362; x=1791131162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3ycCXPKuJpAbU8om5dCwVVH3DJubz8qaLeZTTofQWI=;
        b=B7exR3oTA2rtdJVTHBE7Acu8x7bnuCAqkFk08S12qAvZWwp8QVYfUl+ztUKhoVtLTj
         vnG13LeURACVwp1m6PzG1DvWdspEel0XinKQvk14tbR3xo5UpBMKYoou4vOp9CVxigmV
         cQmcZLeQ3q4BtrsIKRAT/fxyRg0sn6pCyNwiZF+WmYwR4jAVD5ujH/yIl4lx9OTt8/ch
         cFNntNL9wadNBByttKaoBGBoS0R2LSTiBnFSudl3RWvxQ7+fWiig4fjVlTe49zFRp7oR
         cSshj1LjLmT0ZEGXHWN3OM7yVJMRRQl84xc0C7m20z/bsbangzmgk5+6YjEVW8beKldq
         stmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526362; x=1791131162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3ycCXPKuJpAbU8om5dCwVVH3DJubz8qaLeZTTofQWI=;
        b=bJemxg2UFkISiBuya0RGUa+nMAV2yyUXel7pjjafVTIAP1/qaPlaf9Kxod5JTxYEyu
         He2Xp4lgG08/wxFZnOnkt0c0oo3cVx3G8m+y9ZiG7/e1xCSF+kgWfcLCkGDlJJCQOdN0
         zvKte4wDwzHkIKR+tZBpTBNDJs3gR6hwIDAqLm2hyCtNwozWhCUbLrO7mrAscziSBfCL
         tesZh9+JLCO0Uj9tyki9fxCw1E7UFQr/PMKSlCeoVqZ100+4NGdLAmuRhIs8wOsiWT2v
         cnsJ2JvU6jykDRYMtTwb1kEeCEyJtuDLpfD6nnHpKDvwadrO5P4e1enRtMu5ECt5EpkM
         q/0w==
X-Forwarded-Encrypted: i=1; AKwUvBzjWps/g79nNzaNcHtq5bEyREl9VIZRK0tR2/EFTbCFrSnnCsmIn8qbGp+9rUg20H29K381UDSdyIT+eJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++loWoJhaSTpFvRphwCq0s4ijy3xsMj6udoUqIeHYzN5Qk7E/JrE
	c0eK1V2DtJxVsu9OfjF46YqOYgfQEll2lHZDKmb2ChgdE/83GnO1SyQk
X-Gm-Gg: AYBFou0QS+EVQuQVt+EGqgR8LiFYPAw00/WC/DRk25e1hN/ONbObbRy/24Aw1pcAdLs
	ELqUl+GQPKJEGwy30n25sla2ceBN/ku//GUgspXHphK471mO1q/C8AJNR3hnOchD7C271eFAfKc
	RYsyqKUcK9Nb1Ep+p55rAFSNg/sKdaEYdKpp0fhbDjjIZK5RhU9aQyFf9sjgjUsMiFVeivJgr9D
	aWFW7r9xFx0VinzG0Qsdwa/iFhVftpsOu9vBA/TlwmtQqACVtuRQN1dklTcYVQB1GzwoM07tVoj
	Cfg1abDcSgv2E9YB24ylcNZSy5zCKfsDgLlalIhnebjyD6XnCGGLOE3k8n1da9d+Q3pR6HqYngv
	1A7FZ5nHNdKhWzUc08HRuIy1jKe3t9sN8uY4MCMO2eZsg2xjQa6Bv7HsAXJ/OsMy7Sx6nlVdLiu
	ZN1EFg0ME2+Gs01o5d3Ad8C7OHf1SW8ZjQNnJfg5DG88QHs2tWrnwb7jkBRoq6tkyKi+VRv9Wu3
	lbGufazGRWeD5zSopVRFXvWK7CMeWy/zcpklTOaM0cxKcrITRY/1xwXAQmh+Db+GYnZHA==
X-Received: by 2002:a05:701b:418f:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-146cb50233emr12002309c88.0.1790526361709;
        Sun, 27 Sep 2026 09:26:01 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm18498575c88.0.2026.09.27.09.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:26:01 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] keys: Serialize ownership transfers with key accounting
Date: Mon, 28 Sep 2026 00:25:28 +0800
Message-ID: <20260927162528.943886-3-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927162528.943886-1-nicoyip.dev@gmail.com>
References: <20260927162528.943886-1-nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protecting individual accesses to key->user does not make ownership
transfers atomic with accounting updates. keyctl_chown_key() holds
key->sem, but instantiation is serialized by key_construction_mutex and
need not hold that semaphore. KEY_LOOKUP_PARTIAL also permits chown of
an uninstantiated key.

The instantiated-key count can therefore be charged to the wrong owner:

  instantiate                       keyctl_chown_key()
  lock key_user_lock
  increment old->nikeys
  unlock key_user_lock
                                    observe KEY_IS_UNINSTANTIATED
                                    skip the nikeys transfer
                                    replace key->user
  mark key instantiated

The key becomes instantiated under the new owner while the increment
remains with the old owner. Negative instantiation has the same race.

Quota reservation can likewise run between charging the new owner and
replacing key->user. It then adjusts the old owner's quota and changes
key->quotalen while chown is transferring that quota burden.

Extend the key_user_lock critical section in keyctl_chown_key() across
the quota and key-count transfers, state check, and owner replacement.
Also extend the instantiation critical sections across the state update,
so chown observes the count increment and instantiated state together.
The existing per-user quota locks continue to serialize quota changes
against other keys owned by the same user.

Keep allocations, notifications and reference release outside
key_user_lock, and release it on the quota-overrun path.

Fixes: 5801649d8b83 ("[PATCH] keys: let keyctl_chown() change a key's owner")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
Changes in v3:
- Split from v2 as patch 2/2; see the cover letter for the full split.
- Rebase onto current mainline and retain explicit reader-side locking.

v2: https://lore.kernel.org/r/20260904080940.575882-1-nicoyip.dev@gmail.com/

 security/keys/key.c    | 4 ++--
 security/keys/keyctl.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index d0d583194b05..54c675b3b58d 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -454,8 +454,8 @@ static int __key_instantiate_and_link(struct key *key,
 			/* mark the key as being instantiated */
 			spin_lock(&key_user_lock);
 			atomic_inc(&key->user->nikeys);
-			spin_unlock(&key_user_lock);
 			mark_key_instantiated(key, 0);
+			spin_unlock(&key_user_lock);
 			notify_key(key, NOTIFY_KEY_INSTANTIATED, 0);
 
 			if (test_and_clear_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags))
@@ -613,8 +613,8 @@ int key_reject_and_link(struct key *key,
 		/* mark the key as being negatively instantiated */
 		spin_lock(&key_user_lock);
 		atomic_inc(&key->user->nikeys);
-		spin_unlock(&key_user_lock);
 		mark_key_instantiated(key, -error);
+		spin_unlock(&key_user_lock);
 		notify_key(key, NOTIFY_KEY_INSTANTIATED, -error);
 		key_set_expiry(key, ktime_get_real_seconds() + timeout);
 
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index c17924609317..83a9575b084e 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1004,6 +1004,8 @@ long keyctl_chown_key(key_serial_t id, uid_t user, gid_t group)
 		if (!newowner)
 			goto error_put;
 
+		spin_lock(&key_user_lock);
+
 		/* transfer the quota burden to the new user */
 		if (test_bit(KEY_FLAG_IN_QUOTA, &key->flags)) {
 			unsigned maxkeys = uid_eq(uid, GLOBAL_ROOT_UID) ?
@@ -1036,11 +1038,10 @@ long keyctl_chown_key(key_serial_t id, uid_t user, gid_t group)
 			atomic_inc(&newowner->nikeys);
 		}
 
-		spin_lock(&key_user_lock);
 		zapowner = key->user;
 		key->user = newowner;
-		spin_unlock(&key_user_lock);
 		key->uid = uid;
+		spin_unlock(&key_user_lock);
 	}
 
 	/* change the GID */
@@ -1060,6 +1061,7 @@ long keyctl_chown_key(key_serial_t id, uid_t user, gid_t group)
 
 quota_overrun:
 	spin_unlock_irqrestore(&newowner->lock, flags);
+	spin_unlock(&key_user_lock);
 	zapowner = newowner;
 	ret = -EDQUOT;
 	goto error_put;
-- 
2.43.0

