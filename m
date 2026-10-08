Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B723BB130
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497041; cv=none; b=gQI5ltDBjhci+MVWnf/AOhHAw7tsYDvZAyOXBGtqQr2/3jvphDJIBcFLMO3qnnFAl4SsZaokgGw7IpD+++NHQPhnrJmHDCwc7oddpUY8+H2esVFoZgOOPVyR73Rf3ORvFFLVrDnSlT8u4RjOSqH43Y6R9LoyVzBGihm3W6dmOJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497041; c=relaxed/simple;
	bh=8k95RK6Zf52oGbmUpDyrJ6APv7VVAvduP/WK/ehltQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqHDzzG5ItkQyc4vbIy02BzAzuUrqs908cX8Tkqx9C6RoowppbZQ6lVw0GDbOOHdWKrGm0TJoKN9Axot6RuRFDTp+G7oPNf5nisR6SGf6rdgCTNAcTX6jJbgKCAzJJEpWQUkzd/8Ve1PkR9S1W6XTphzts9JVJ5DvB+/PS3DQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=EMNwUsoe; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="EMNwUsoe"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-351767ef18cso1671243eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1791497036; x=1792101836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6q2ZgKyEielHB9fMBeVKRfxouhNXO4dRwouPOAg0k8=;
        b=EMNwUsoecb4mr40PrkXg1/eTQp07fJQlWDR1lv+XSM3fGLJfaUIj2Pkgwn/fWHm3/+
         F4RcfSXa6WRAkIyirgDp5qs2ogbX+6iAiCkfHQ4WUSEEeTC5GVoJTjSKjdYPu/3+iMBP
         q9wyBKeKNdDkB5KIAdO2MtcvLHdHDgo4KdogXjR3/GGACeST3356QL6UQ3J5rqAz2m0Y
         w9+hecJ5diiaa9ZPuCyqRyuZaKk+qultA2cC2eebFyqwlkI/mV7YEjxGqWKQ8eLrg4TS
         a72aFuEJ8gHZh4EDXkMKVaAVePuyYm42EgaEnuTYCny1ZUd2um2HS9lNmB+hgM0/CiaR
         Hlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497036; x=1792101836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6q2ZgKyEielHB9fMBeVKRfxouhNXO4dRwouPOAg0k8=;
        b=sir4zIZg0fBDUVvQN3ozo5fEzqVs/sDWJVxJ4c4p67JBkXJTa465u6piALWNudRWDL
         qYMj7hedzApcu867wqSxQsbNnp0h+NyyD9R/HTLz1N/3relRD6TQfJiEnGAOIrFFw4No
         Rbghb8GEnLNN/lb3Pjo1BdBJh5yfI6QPyxPDBUdGU3PzX6pHw59XE9AD7IhgrzgI7y+S
         KDvGbfHkCJJ5CcP/jKNjE8f1SxmGB9VbAqZcnfSsNUHWJVFtO77xUCyhTk1msVb/qrv9
         ksID/ZYFQ0/wnUbPjnt01Ha1lJz1KwDRzLF2+VvkPJcN6+PdDlRTR2frsarKZ2NFPapo
         Wxag==
X-Forwarded-Encrypted: i=1; AKwUvBxG1g+c5DL56PGK7CKAOYjs5HCIiuEEhVnXIsUSm2ScgGY9E/1RMN7MI/G1j4lHL5m1pIq3TA7u8nKyi8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe0e4/aUHOYRDHlmrvchjVcEoDxlCCjL1Sbsad6d4oFGOEh3Xe
	kOr0bb4/LJFVu4NgEjbPXVZXKNGwpNNfW7PCsBBbJf+hF5S0EGIeB3gYoC9G8Om+38M=
X-Gm-Gg: AYBFou2niF886Xr7G4Zsw7c2X1Z0AO8hUalsVtt9PISznxy3TNq0/j4ZLSHMNGNByN6
	Yy+6R9LYo6uyFF0EGUSp0ousq0kO/LW6Ynoh4IelSzdo9lqCh7k9N1aJ1Mg7gPXiH5JEFYd7hFt
	Xkl7DzZ8korJKUwj92vXfrdQthXd1g3PsH8UBOWSpEqhlT3gQNKdJ7nDrtv9/q+35cl53h/vGVp
	MEJIef3PbyH1IxdaGvFj6oCRF+AzFlCiWiMgbFkh8wZ5IGsW6tpXqWgJx/rCtk3Mh2+2rT67i6Y
	hw9G4AM2cQkmcARYX3oFCamvBskIGy0zcIKVYk1Usugx6ZbM7iPMc/ep0mHyqBC/AjDlAvScYc5
	kX2mpmWitQOMLcUblQuvhqDDMnCgw8jj2j2/Hdx4VrVYjt0uuzONwmGlJtPFXlPnkzLibkzzcSZ
	ivVda0lACy2MOFC+yB6vG3X3UF3HH7rwMG4NxGOyrZoj+FsXMffhkBix3Apl2ZjtteLFw7Xe5qQ
	7io7cMTczo=
X-Received: by 2002:a05:7301:78ca:b0:351:750d:dd3b with SMTP id 5a478bee46e88-3537dde75a7mr339836eec.4.1791496985629;
        Thu, 08 Oct 2026 15:03:05 -0700 (PDT)
Received: from jkain-desktop.corp.nuro.team ([64.124.43.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm920601eec.20.2026.10.08.15.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:03:05 -0700 (PDT)
From: Joseph Kain <jkain@nuro.ai>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Kain <jkain@nuro.ai>
Subject: [PATCH net v2] net: do not let defer_count outlive an empty defer_list
Date: Thu,  8 Oct 2026 15:02:56 -0700
Message-ID: <20261008220256.1844072-1-jkain@nuro.ai>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__skb_defer_free_flush() can leave defer_count at or above skb_defer_max
with an empty defer_list. That state is absorbing: every producer then
takes the nodefer path without queueing, so the list never refills, and
the flush keeps returning early without clearing. Deferred freeing stays
off for that (cpu, node) until reboot, and cross-CPU frees fall back to
the page allocator, which is the contention deferral exists to avoid.

Two changes from commit 844c9db7f7f5 ("net: use llist for sd->defer_list")
combine to produce it.

skb_attempt_defer_free() increments before testing the limit and does not
undo the increment when it rejects, so a rejected free leaves the counter
raised with nothing queued.

The flush clears defer_count before llist_del_all() rather than together
with it under defer_lock as it did before. A remote producer that queues
between the two has its skb drained by that same llist_del_all() but its
increment retained.

That part is not cumulative: any later flush finding a non-empty list
clears the counter again, so lost increments do not build up across
flushes. Reaching the limit takes skb_defer_max - 1 queued increments
inside a single clear-to-drain window. At a small skb_defer_max that
needs nothing special. At the default of 128 the flusher has to be
interrupted or preempted between those two lines for long enough, which
is where PREEMPT_RT matters: local_bh_disable() does not disable
preemption there, so the flusher can be scheduled out at that point.

Once the counter is stuck at or above the limit with an empty list,
nothing lowers it again, and that half needs no race at all:

  sysctl -w net.core.skb_defer_max=1    # frees increment, then reject
  sysctl -w net.core.skb_defer_max=128  # does not recover

skb_defer_max has .extra1 = SYSCTL_ZERO and no .extra2, so 1 is settable.
From v7.1 on, 0 is safe because proc_do_skb_defer_max() flips
skb_defer_disable_key and the producer returns before incrementing. On
6.18 through 7.0, which carry the llist conversion but not commit
08dc30de1a40 ("net: add skb_defer_disable_key static key"), setting 0 and
restoring the previous value strands the counter the same way -- and 0 is
the documented way to turn the feature off. Recovering needs a
skb_defer_max above the accumulated count, which an operator has no way
to determine.

Drain before clearing, so the error can only under-read, is bounded by
the producers in flight, and self-heals on the next flush. Clear the
counter on the empty-list path as well, so no count can outlive an empty
list and an already-stranded counter recovers.

llist_empty() has already loaded that cache line, so the added read is
free; the unlikely() keeps the store off the hot path, where it would
otherwise bounce the line against remote producers.

Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Joseph Kain <jkain@nuro.ai>
---
v2:
 - Reworded the drift description: it is not cumulative, since any later
   flush finding a non-empty list clears the counter again. Reaching the
   limit takes skb_defer_max - 1 queued increments inside a single
   clear-to-drain window, and said where PREEMPT_RT actually matters
   (Eric Dumazet).
 - Noted that 6.18..7.0 strand the counter via skb_defer_max=0, the
   documented way to disable the feature, since they carry the llist
   conversion but not 08dc30de1a40 (Eric Dumazet).
 - Dropped the paragraph describing where this was first reproduced
   (Eric Dumazet).
 - Added Assisted-by.

Built for x86_64 and arm64, with and without CONFIG_PREEMPT_RT. On
v7.3-rc6 with skb_defer_max=1 and a cross-CPU TCP load, defer_count
reached 1918118 unpatched and did not recover when the default was
restored; with this patch it peaked at 1.

v1: https://lore.kernel.org/netdev/20261007180056.1394868-1-jkain@nuro.ai/
 net/core/dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..043a7f9166a9 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6938,10 +6938,13 @@ static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 	struct llist_node *free_list;
 	struct sk_buff *skb, *next;
 
-	if (llist_empty(&sdn->defer_list))
+	if (llist_empty(&sdn->defer_list)) {
+		if (unlikely(atomic_long_read(&sdn->defer_count)))
+			atomic_long_set(&sdn->defer_count, 0);
 		return;
-	atomic_long_set(&sdn->defer_count, 0);
+	}
 	free_list = llist_del_all(&sdn->defer_list);
+	atomic_long_set(&sdn->defer_count, 0);
 
 	llist_for_each_entry_safe(skb, next, free_list, ll_node) {
 		prefetch(next);
-- 
2.55.0

