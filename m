Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E6356742
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774950; cv=none; b=ZDKuI/1ERLHwUwD0mn24KRu12EbXkwcb0Ar+a1hcw/yHbNYKcs73m/QlURBR34inZ6kmRjLwPp/kH278lbhJ1kUgJ8Y0RWzK5YHFwT3tJT/P2yzKpbf4toQCyUMRMUxedSojkOHgsQ/MmqRAOqys1YZGj3MPg/J+QdyEOXUhk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774950; c=relaxed/simple;
	bh=/Pqk+MxYSM7qEqsc7/T6y58J6L1UCkNUahOnup9HLUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KITkwhdMR1w/Q+e1NQ4s77emynGc9jP7FvHUDC5GvsR2gsD0P0MtkFCtAKHq/gPHm5x2GaWE65qLUVJ78fNepbLPIt9M/ip6WqjphdLITfEZr5yfUXuuDt7yDFj8erJOLjTbnbGKdHvjJFEn/gIu+1mK9ivnCVXOLX+Bz7OQgOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpquA/re; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpquA/re"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1560085ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791774949; x=1792379749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/g+XLRzJejSDXfAa7rR8UMy8PVmPcCGHEpvcLBzrYU=;
        b=lpquA/reFSggbteUwAZ6cq4Cjdk3sux/KhvZonNOoTtvbm6PXYBLw2ABGRJfL5Piu6
         xSNp1oR7WdfChTL3Yxm2vCppLvaXJvukChjpI5VU0CWPOcGPY9tpGEdv/ZibyK1kq4YG
         fWjhZ7hmcyt8RhLWHH9sMlfo1i+kxcKs371hRS7rmdB7eRqAoeTP0F6gwYH2kZPTfpWc
         H0yZTAQzXgc1ODdLoO1ZybSRxcJLbRUWUbX4+1dKJQYYhfBgtDAA9LoYw1WIBg6w34to
         1ADYxNA4EizVogK5USQ0TXxJMQgWhophVx2Cth1v9lN7LUsbrgDPwSPII/EMw5L0CakF
         PVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774949; x=1792379749;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/g+XLRzJejSDXfAa7rR8UMy8PVmPcCGHEpvcLBzrYU=;
        b=VFUvgqms5ai72rFrFeVZ0Ykki05EaDzothao05v7VwFJ7BctyFmHyTE3laHC/FSjpN
         29MoQSTg2lOurQD/3wd9gESQv9edyIYturCsMTxhKsi+75jXpbb9PSQ58i1OnDxPb4FE
         gwN1g4bl743MARqWP2lckx15Sz2PZUZf4mXDfWZaZa/gElNBVJs8AxkGeMyPfNQwo1qa
         ovL8kiwnzikI1Vj7xrRsCiX2YkYtzvbbl3sTqyg1Va+WOH8EoD6H+H5wQTmv11aAg2M5
         ruomxLSMnTDaiVEn4dL/GEh+lDOBZeqD1CItep8qcxZx6YAmFvXvBvkOal1cmf9YJ5BF
         ir6Q==
X-Forwarded-Encrypted: i=1; AKwUvBziQcJ2iSsziu6MyZJnMr6Ey9bznueYlYm73hMkVDyCD8euiNzLLv3TLN2sHhovZYIUwiV4wRNAQU/ZcZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU8YPVVXGr6l1U+YuIqrARNS6KlVJ7tMXRsBAoYmT45F3Z8zJd
	mgQ4T6P9dRLdEzJ59E4kOJh/Mo37rTG4UByp87QTa2oPfkGN09dY9Qw+
X-Gm-Gg: AYBFou3Wvp6aKvHkHzR80Iz3zCgxy5MA9CtYjPpFHO0x3cNfHV1O1XlOxS4L6ZZCqJQ
	L1ksG+2KAV6G7/6SeaYixSrX8j28bv30BEwrED0JyjpTF7wGba6QLqC/Dm6Iq9qMdR2bPSoB4Cr
	tRyZaTIPVhJlxRPtK7GHVESFPyPAaUS7Uh9x6OtwO4eC7iJCTgcYXQwH59yvdeuql36EjbqKZOZ
	RbYllXVq1VSVXOLpbuJotDqZpe3zvZYR+bAOBanHTWEMUppyOjIOdBVH5Nwtq3rVb1PUMrSBf9M
	biSeh4ES+QNh6Qe8eswtMHobG9JgFUN2Dr3e4InNCUuD20nWOVredaWHrqxQob/B7FJ/Z21kOS2
	fo1WlqoFOlHQCxGoPcJo0wq6GW13Z3TEezrG25Vn5h97GXZjW/Aj9qmRx5URx2Ul5ar8AQ6ZSsR
	suNLh2RHVfGbLjk+RTDXUVIsiVOPIeA76eymJr1v1EXU533rjE8ewPQldNh24qoie2rA==
X-Received: by 2002:a17:90a:1582:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3ab9f1a4af4mr2179005a91.4.1791774948977;
        Sun, 11 Oct 2026 20:15:48 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm14401913a91.5.2026.10.11.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:15:48 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	akpm@osdl.org
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] KEYS: Protect user key quota access during instantiation
Date: Mon, 12 Oct 2026 11:15:43 +0800
Message-Id: <pm-key-management-objects-candidate-0001-v6-9876bf3e2116d47c065e@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The owner account must remain alive throughout payload quota
reservation. The user key type calls generic_key_instantiate(), which
dereferences key->user in key_payload_reserve(), without holding
key->sem. The construction mutex excludes other instantiators but does
not exclude keyctl_chown_key().

A kernel caller can allocate an in-quota user key, retain its reference
and instantiate it with a nonempty payload after publishing its serial.
A concurrent task with Setattr permission and CAP_SYS_ADMIN can chown
the still-uninstantiated key through KEY_LOOKUP_PARTIAL. If the key
holds the last reference to its non-root account, instantiation has no
authorization key, and the new owner has sufficient quota, this ordering
is possible:

  Instantiator                       Chown task
  key_instantiate_and_link()          keyctl_chown_key()
    lock key_construction_mutex        down_write(key->sem)
    generic_key_instantiate()
      key_payload_reserve()
        load old = key->user
                                       transfer quota to new owner
                                       replace key->user
                                       up_write(key->sem)
                                       key_put(key)
                                       key_user_put(old)
                                         kfree(old)
        read old->uid

Chown's final free falls between the old pointer load and the uid read.
The read can therefore access freed struct key_user storage despite the
caller retaining the key itself. Hold the read side of key->sem in a
local user instantiation callback across generic_key_instantiate().
Chown then cannot replace and release the account until the quota
accesses finish. If chown goes first, instantiation takes the semaphore
and uses the new account instead.

Keep locking out of the shared helper, which is also called by
big_key_update() with key->sem write-locked.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in key_payload_reserve+0x54d/0x560


Fixes: 5801649d8b83 ("[PATCH] keys: let keyctl_chown() change a key's owner")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 6f88b507f92791bd9569673c5d6534d76c58a978..b6e09921c11658c09eb7d7954b2abd5b2b7017c1 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -15,6 +15,7 @@
 #include "internal.h"
 
 static int logon_vet_description(const char *desc);
+static int user_instantiate(struct key *key, struct key_preparsed_payload *prep);
 
 /*
  * user defined keys take an arbitrary string as the description and an
@@ -24,7 +25,7 @@ struct key_type key_type_user = {
 	.name			= "user",
 	.preparse		= user_preparse,
 	.free_preparse		= user_free_preparse,
-	.instantiate		= generic_key_instantiate,
+	.instantiate		= user_instantiate,
 	.update			= user_update,
 	.revoke			= user_revoke,
 	.destroy		= user_destroy,
@@ -86,6 +87,19 @@ void user_free_preparse(struct key_preparsed_payload *prep)
 }
 EXPORT_SYMBOL_GPL(user_free_preparse);
 
+/*
+ * Keep the owner account stable while reserving quota during instantiation.
+ */
+static int user_instantiate(struct key *key, struct key_preparsed_payload *prep)
+{
+	int ret;
+
+	down_read(&key->sem);
+	ret = generic_key_instantiate(key, prep);
+	up_read(&key->sem);
+	return ret;
+}
+
 static void user_free_payload_rcu(struct rcu_head *head)
 {
 	struct user_key_payload *payload;
