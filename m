Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B524FC8C3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059666; cv=none; b=QZvY+/pyoY+TZuPzYssx/JkFZSTh0cF/0pni7Qc90HOo+t35Ago00+7eMKeYWMSGkI9uiwHUXWnSt4jVCyhncovA/oo5UArH2XIQZkZP2+c1xhN/XEtb8HCbcvOgi4U8FBglbYUdpbPY55FjPsj6rlv5OBN03B2cFZVEz3+rROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059666; c=relaxed/simple;
	bh=Llh5B20qiT9l+CISLN3EMkjfjjA3OY1FAbjV2PjhrNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTNaPEXt8m1UCKMV5EwgLY20TPJHAGVPpz4+DNrZexkhGt2HMNtLTWOWmBW/KyLxgyAIAMByx5r27YIDn+cpF8KahZ+RbetJZNnnvZqYWYb14XXBeENhmu+NYhvTlxJY1IpPMK+Z9kdHMRauTtB2dLYKOaorh0vewHGXNPZ6JaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2MQqVNz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2MQqVNz"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1510187a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059652; x=1789664452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/NIUjuuCPvMzukokndyP3uQpFaIojJ8VScY7Mca6Ns=;
        b=H2MQqVNzOtPdbQPbWmo1HS/090XyrsJvAn7/RMXXnI4H1yGLD82flKuziiQNtAosGV
         775f+gJGPC8FbEIPVJ/R/XbgrtdfE+Nr5mgU5KPAUpEfCNnzQTNmxSNAv2jd2hwUogQE
         erhRg123odsPewAsSlQI1NG80KWlD9d70UoUCArgNuZahqrNSTObNl0EeT2+HZcZPAJK
         bXeCwbsB1/djxUsrzcFtG4ekZsGJKHf9l+2+YQCHVZQmP+/yI7YckjPi/LbQ8YgHZ80B
         4NbAoIilIjqOBCzOvS30dR3D3tTb6VlKG+iIrEobpMkV1Rv38ZbILfA+Wqe/Y49xQlOP
         bFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059652; x=1789664452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/NIUjuuCPvMzukokndyP3uQpFaIojJ8VScY7Mca6Ns=;
        b=l1FiyJsNpAzR5i9trHJLksoyON6RvRK/9JeJzCnuo/4B0tlemlxwIH/C4yAot2wqpO
         UtfrFn+h3ULjy7F9e7DfXVvK3WBz8lujeJWDGxFXOEVwLlUwnJHdMD3o+3pKQ/J4IBQW
         e6Hm45IAnrcnW9rw70zdSAGx15JS515idztNW29QO6j8c11peFg+avS0XIiZPwrcvC2W
         bY9cfJHvDWW486OhV642oKiIVuZXEth+X9HqJsbSl38NLdWjJQVpA8lfh72Em2dpgt2I
         sQcVt+QfrgT0T67IwO/w6G+EfNdz1djFz7JmT3SAuwhK0UgoxvOrFIlGdKRmPDFdbFPU
         nWLA==
X-Forwarded-Encrypted: i=1; AKwUvByKTfbBDzStvzWL6Bskx+4qjn+D6QfsFMLZytGDmaKolufe8aoqgJWhlqs4jRsKXeZwAMotDws51swZtjk=@vger.kernel.org
X-Gm-Message-State: AFuF++n0hFPl2ISl0LgG5XxIcAiAbnrUz1Eo67PejI+joquOEwnTUDFU
	8FIprBXcxk826rm2FIzANsi4YkX5Ftc4XK/dJbeo1IQQ2DzsLij8zlfl
X-Gm-Gg: AYBFou3FfTpikhnZwFQ3bjg43wsCXuMoCEvhd0J9o9ZMv2pMqrcnxPrVRK/KmaqnD3P
	7H0OUzCwqwZ4fpW4ds+uYMy9Jvl+1VVRrIssaGGmhLQIxFCXxZx/08NM+9OdGKRkZCRBeoPkKVN
	VveX8HGQ9HtGE42E2SIGeGMC0haHesME9CJDNtgoeIdclT8MwykrMkPQf9BTG7Y22oUxzN0DkIR
	FMsvv1kAZJ3Jxjvir6iQDzGEe0cnmv3jNReTPr/zNYFcjrNyWieS4L8ZjEki7rLLYH5H5gsRbYj
	D3yXujs4yDGWk6cP1RrMjSvpZLcHJMqSHtznj1KcFOfqwHceoM+HkcZDuGsptMOyKjrI/sGqVQX
	iDrOCfISFny7ULExFF3r1oRLjFQB6tbmY9cq/aDGZNEaW8/nOK2p9rDBtFKmXklx6fam/ZQJ9M0
	eZFn6kERP/ADh67rrwsvoDy8mM/5VBePPpOBZWLfSDzPcn3HJgDt+JT3a7CewglyIRXrEO1j54+
	Gn8QE9cTYOYmVWPj76m/8hatcOHZYkxTfNxe3/V6kgStQ89T26Wh46cTG8MrYwlJ9+Grlxhg5F4
	x4Jkc7DrJIfJwpHkZozLz7KnPd83disMxxE/f99/fhmy1TFCHbfLnck3U4kVHQo=
X-Received: by 2002:a17:90b:39c4:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d70b7cdfcmr13420866a91.23.1789059649749;
        Thu, 10 Sep 2026 10:00:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm568538a91.0.2026.09.10.10.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:00:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: paulmck@kernel.org,
	urezki@gmail.com,
	harry@kernel.org
Cc: frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] rcu: make userspace barrier hook drain kvfree_rcu work
Date: Fri, 11 Sep 2026 01:00:39 +0800
Message-ID: <20260910170040.344864-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910101112.1648978-1-matthias.goergens@gmail.com>
References: <20260910101112.1648978-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The rcutree.do_rcu_barrier hook currently waits for ordinary RCU
callbacks, but objects may still be retained in kfree_rcu() batching or a
partial per-CPU SLUB sheaf. This is consistent with the hook's documented
rcu_barrier() operation, but incomplete for its intended use as a boundary
between userspace tests.

The immediate trigger was a false allocation-leak failure in the bcachefs
ktest suite while testing performance changes. Its end check writes the
hook before reading /proc/allocinfo, assuming a complete deferred-free
drain. Small objects remained visible after repeated hook writes and
20 seconds of waiting, so otherwise clean tests failed their leak check.

Changing the hook to drain kvfree_rcu() work let the same unmodified
bcachefs workload pass its allocation check. All eight checkpoints in
one VM, after 50 through 400 option changes, reported zero retained
reconcile_scan objects. The retained population on the original kernel
eventually fell as a sheaf filled; there is no evidence here of unbounded
growth or OOM.

Calling kvfree_rcu_barrier() from rcu_barrier_throttled() was proposed and
agreed during review of the former API in 2024, specifically to restore a
clean baseline between userspace benchmark runs:

  https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/

This patch implements that follow-up and documents the expanded hook. It
also removes the old ordinary-barrier completion shortcut: an unrelated
rcu_barrier() does not establish that kvfree_rcu() work was drained.

Four counterbalanced fresh-VM pairs with the full private-cache fixture
reported 60 to 60 active objects on the unpatched kernel and 60 to 59 on
the patched kernel. A separate ordinary-callback regression test passed
on both kernels.

The simplified reproducer below removes that separate regression
machinery. One additional fresh control/treatment pair with this exact
41-line source confirmed the same 60 to 60 versus 60 to 59 split. These
counts reflect the slab layout in the tested configuration.

Save the source as rcu_barrier_sheaf_repro.c and create a Makefile
containing:

  obj-m := rcu_barrier_sheaf_repro.o

Build it with:

  make -C /lib/modules/$(uname -r)/build M="$PWD" modules

Then, as root on a disposable test kernel:

  insmod rcu_barrier_sheaf_repro.ko
  awk '$1 == "rcu_barrier_sheaf_repro" { print $2 }' /proc/slabinfo
  cat /sys/kernel/slab/rcu_barrier_sheaf_repro/sheaf_capacity
  echo 1 > /sys/module/rcutree/parameters/do_rcu_barrier
  awk '$1 == "rcu_barrier_sheaf_repro" { print $2 }' /proc/slabinfo
  rmmod rcu_barrier_sheaf_repro

The first and second slabinfo readings are 60 and 60 without the patch,
and 60 and 59 with it.  kmem_cache_destroy() performs per-cache
deferred-free cleanup when the module is removed, after the measurement.

// SPDX-License-Identifier: GPL-2.0
#include <linux/init.h>
#include <linux/module.h>
#include <linux/rcupdate.h>
#include <linux/slab.h>

struct repro_object {
	struct rcu_head rcu;
	unsigned long payload;
};

static struct kmem_cache *repro_cache;

static int __init rcu_barrier_sheaf_repro_init(void)
{
	struct repro_object *object;

	repro_cache = kmem_cache_create("rcu_barrier_sheaf_repro",
					sizeof(*object), 0, SLAB_NO_MERGE, NULL);
	if (!repro_cache)
		return -ENOMEM;

	object = kmem_cache_alloc(repro_cache, GFP_KERNEL);
	if (!object) {
		kmem_cache_destroy(repro_cache);
		return -ENOMEM;
	}

	kfree_rcu(object, rcu);
	return 0;
}

static void __exit rcu_barrier_sheaf_repro_exit(void)
{
	kmem_cache_destroy(repro_cache);
}

module_init(rcu_barrier_sheaf_repro_init);
module_exit(rcu_barrier_sheaf_repro_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Reproduce incomplete rcutree.do_rcu_barrier drains");

---
Changes since v1:
- Add the motivating bcachefs failure and the successful unmodified
  workload result to both the cover letter and commit message.
- Drop the incorrect sheaf Fixes: tag and regression framing; describe
  this as a strengthening of the existing test interface.
- Credit the agreed 2024 proposal for this extension.
- Broaden the subject and changelog from sheaves to kvfree_rcu work.
- Hard-wrap the prose for text-based mail readers.

The code diff is unchanged from v1. The results above are the existing
validation results; no new kernel tests were run for this prose revision.

v1:
https://lore.kernel.org/all/20260910101112.1648978-1-matthias.goergens@gmail.com/

Matthias Goergens (1):
  rcu: make userspace barrier hook drain kvfree_rcu work

 .../admin-guide/kernel-parameters.txt         |  7 ++---
 kernel/rcu/tree.c                             | 27 ++++++++++++-------
 2 files changed, 21 insertions(+), 13 deletions(-)


base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.55.0
