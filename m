Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65B3921C6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790955; cv=none; b=hRy3vkbh4yP0SsYoJ8NyOIn5pvTWNQsT6OmmK/wOHbBiJUgu38CqIhvUmIjXvxVDKAz8xo4IONvvHMh0LJum/428BH+0s9xGYbGA5wY8OaaeMZ5iZQPCIHx9+kpGdQ9lVM4seHt0Lc+VUoP5lyw1h8yJIw2OYNFBwydyiRwZ3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790955; c=relaxed/simple;
	bh=ETt+eXJwyTapb9YHrKVDAzaP4e3JtDlrePvD76FyjQM=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=QisZCcweCNkv4v+l5bTmvliz7IUI1qz0jCLPXyZYVI5AoNdA6aCzhVfDeFg8NmZsfePWGd12NCof/241PPo/uPd6GvupqIpUudFGh2P2TlQogjNN9lcxDwQxtg/NxT0QrFJsm/OMsaJSXa4ySZeKReXzt2ovtSs1T9IZ+oS9BcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=gtAfAWnN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="gtAfAWnN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c252e703fa3so546027966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788790951; x=1789395751; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrQGe/+l07Pnb5/py0yrxKfx5ESJVlaN3S8EQmXHeAw=;
        b=gtAfAWnNWmNwvCQUC2ghJpgfgvvrXBqe+EApq5neWkQYfUI/iR7uSsWEoMu27ECKPT
         qHSk1OXvNvo7aTRUYocYhcYQimBXgEnqrJVYiZ6RNcB6I2Pw5N0KzxEf0nqk/Yr8nYGa
         J6YnJ2BUHC/LnEA3d51lW9FvuUATUWpqsMNJugW7McdVTI2hQe64TrtDOFyhPNunEPqw
         UwQvUJGSCUyf3LWr1zCltI5OrnH9V7668fvtYO5s+X+IwtIGrRo0dRrMBra8yU2zZ92t
         LbnX+ZaJMFH6emvf1TJJkW0DYHH7tOEfafygnQHaLVQthcuwxUx4vWT5T8oiYaBJnD5R
         ENmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790951; x=1789395751;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrQGe/+l07Pnb5/py0yrxKfx5ESJVlaN3S8EQmXHeAw=;
        b=NUhfCkKWmJ7U6I/wyjsEYhfBsvrARK1+0JQ9m6EbQsdKsEM3YUW1fIV1BXI80gakFD
         7+7U0xwmXBaQ+W2WQmdsJV9UlB32iWUNa/zn3dmzdK7cFlFR/yxWQISbE0rQlLHCv4Tn
         79Ikwl3b8ZNTMHTYaoZrO/bekI8pranZsPZgQ06KbcYxuo+psv6Kp6GsCHklQw6eo76g
         sPLDgcGASNCWqjSlSDFf/68kkVIFRKAiZgoa7XddViGFXaPgkZPo9UjgufD2TxMEhtzr
         sOu+Y7K0qSrJdVBf2K/9SSqP7O85o9PcS86CDZvxIoi9hAAWSrQ8SbjeEUTS2bz0R2mG
         AX4A==
X-Gm-Message-State: AFuF++mCgSfD5LUdTfRPNvDwPkVsGKTuskmAiLXQZC9qUbpUuBLEKfjV
	8QS7I2u61262Sucnpo98sHdCXQM7Oww0IatUS3K3SIJ+XNU9YcOVIf45ToZKC3NqJro=
X-Gm-Gg: AYBFou28ByMLYAyctEEitm1+YxybIz9yL8VVCy7azh1rheAuKDQIYv/GDxh5xxp27bS
	8/IU432cA+ecv1H4mGCrmiiG80INuqzO5wKAZlf5qbIqHaD29oBIeQ4s6XIA/GxxoAFVeKVGsIf
	461HBDM6U/kMbJFBVHKn5ouKeuFTFsrcOjTqR8fOJCwTsBn/zuFzpUwY+mlKn6x6kCVkfl2Ge/v
	ChbP2ACpkus+QtRbWBTpW8m+FnBWMG73gM6wheolAgq6hNU37oz2azlTzWiDotJkSJKzHH+IrdS
	Moao7jUxfXe9HKsCqTFthu0KplYIjWljJVG+xHF4QvjTaCIuIvjIDxciYA3f8cFwtigDilbDoWW
	gdw9e5XQEHiQZ8jKZ46Ol2dbpsG05sCL46zc97ZkXPlYtK0/AzuxzTlhdxvAQ2B++mQucPj2Js4
	D7fNu6VtZBTBWfflzoRfjXUvLvZkdSlFFJzW6I1XzgcdXqEm03Wd5TNr2Fp/fpUpe7YRB4Yn5c2
	h8LijC/Qp45g70mpoixyy/lq+YSlmdzcys5eLVgOMIjahCdjjHGYzKVrQ==
X-Received: by 2002:a17:906:c116:b0:c26:1648:a063 with SMTP id a640c23a62f3a-c261648b68dmr769104166b.30.1788790951116;
        Mon, 07 Sep 2026 07:22:31 -0700 (PDT)
Received: from smtpclient.apple (80.49.147.201.ipv4.supernova.orange.pl. [80.49.147.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5375d9sm477623866b.30.2026.09.07.07.22.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:22:29 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH v2] nstree: check listing permission before taking a namespace
 reference
Message-Id: <ABA32239-733B-438C-B95A-B13ED69FF0F3@doyensec.com>
Date: Mon, 7 Sep 2026 16:22:17 +0200
Cc: linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org,
 Bradley Morgan <brads@mainlining.org>
To: Christian Brauner <brauner@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

legitimize_ns() takes a reference on the candidate namespace before
may_list_ns() has decided whether the caller may see it. The
__free(ns_put) cleanup on the denied path can drop the last reference to =
a
mount namespace while we still hold the rcu read lock, and put_mnt_ns()
may sleep there. This is the same problem commit 2ec2aff3c8e2 ("ns: make
sure reference are dropped outside of rcu lock") fixed for the =
put_user()
path. Neither ns_requested() nor may_list_ns() needs a reference, both
only look at the namespace type and at the caller's own namespaces, so =
do
the checks first and take the reference last.

Splat:

  Voluntary context switch within RCU read-side critical section!
  WARNING: kernel/rcu/tree_plugin.h:332 at =
rcu_note_context_switch+0x238/0x2a0, CPU#5: a/3442
  CPU: 5 UID: 1000 PID: 3442 Comm: a Not tainted 7.0.0-30-generic =
#30-Ubuntu PREEMPT(lazy)
  RIP: 0010:rcu_note_context_switch+0x238/0x2a0
  Call Trace:
   <TASK>
   __schedule+0xcf/0x650
   schedule+0x27/0x90
   schedule_preempt_disabled+0x15/0x30
   __mutex_lock.constprop.0+0x550/0xaf0
   __mutex_lock_slowpath+0x13/0x20
   mutex_lock+0x3b/0x50
   exp_funnel_lock+0xb2/0x260
   synchronize_rcu_expedited+0xe7/0x220
   namespace_unlock+0x26a/0x320
   put_mnt_ns+0xd3/0x120
   mntns_put+0xe/0x20
   do_listns+0x13e/0x560
   __do_sys_listns+0x126/0x2d0
   __x64_sys_listns+0x20/0x30
   x64_sys_call+0x2366/0x2390
   do_syscall_64+0x105/0x5a0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

Fixes: 76b6f5dfb3fd ("nstree: add listns()")
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---
v2: include the splat in the description, no code changes.
v1: =
https://lore.kernel.org/all/34C54FF6-AA8F-4124-9B40-C68EADB26D99@doyensec.=
com/

 kernel/nstree.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/nstree.c b/kernel/nstree.c
index 6d12e5900ac0..831f279d174a 100644
--- a/kernel/nstree.c
+++ b/kernel/nstree.c
@@ -533,19 +533,13 @@ DEFINE_FREE(ns_put, struct ns_common *, if =
(!IS_ERR_OR_NULL(_T)) ns_put(_T))
 static inline struct ns_common *__must_check legitimize_ns(const struct =
klistns *kls,
 							   struct =
ns_common *candidate)
 {
-	struct ns_common *ns __free(ns_put) =3D NULL;
-
 	if (!ns_requested(kls, candidate))
 		return NULL;
=20
-	ns =3D ns_get_unless_inactive(candidate);
-	if (!ns)
-		return NULL;
-
-	if (!may_list_ns(kls, ns))
+	if (!may_list_ns(kls, candidate))
 		return NULL;
=20
-	return no_free_ptr(ns);
+	return ns_get_unless_inactive(candidate);
 }
=20
 static ssize_t do_listns_userns(struct klistns *kls)
--=20
2.55.0

