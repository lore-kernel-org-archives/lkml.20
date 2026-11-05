Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912214;
	b=ebeVX4+am10HJAbJANxwvexv79F0tk3qEz1PK1MYM311cEUgKbudMfYU+Srjn/upNbGU
	 OcEZ7Gnq2wvXe1D9vmcXLS1KikwrkR/f8VgIsG3pAMYuiZoupYmN65ORhnWb/ZbxCuZBH
	 QIatjl2QJgUJByRNLTgFnAasQ1lXe7BXDvJav6imixVUa2kCdW8myei7A3qtc1beef0ly
	 zAgu3ROmUtetWMzSyFRX2kObbCNIQ4c/0J8JMb6kee2vgL9W4hTP9J6xj1rSDsomgX4w8
	 m3Sr/gICFA9lP75qayb4eQVMFpG46+R0MgxyxjeZXHvppi7CrtIK6QJtZJ4AqbzJWww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+X2CCzNc2pO0e5MDk8a84L4z7/VlZM8Ywfuz8Cg0lE8=;
	b=YblGERamoGsiVaM/BiSrJvZ2e/GBA4W5feL6IooOTARNjlkv4etLscX4KYa4hMcceBFD
	 8Xv9KfjzwtfAHjMZAnIEhgTGpooxPAtpYuWalIZ0vy6FxqPnk+alyMgoVaQa77C9YZYo7
	 7pNgVTTuwT1kAs97rfatiZQv64UPmUWxh2jhO9SfqaSeBzkA6BgTEk7SczkHPauSJQsGg
	 2lJ0dEKITJk/hvF9xhF61+Hr7FRr6LWcKFuFrzOvlMVYU6SFKDxQzRZ90iWazyn60weLc
	 UOuquip3EHbOJfsob2Hm/8pg+r4W+aWXqzP7bcajcKvgM7DlnMkTTEOMtj8/xXYC1mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRDX4tG0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47486606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47486606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRDX4tG0
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c49c32650adso201041666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912213; cv=none;
        d=google.com; s=arc-20260327;
        b=RVWDvbbPnRVjX6Ev1wo/QHJh2Y3ZMtq8GR6oaRfyGhuZZV7ETeH+xoGty7xZu/IJIJ
         BzojDSOiskWBmrbUWtv5QoK1nghgMWkRYJv9bTY0aLFSsPCSID1HQFv5qjD0lyAVQ3RE
         deBLH0LHAYeWDoEU4AG04PrECak6RPXXkRrCGh+V6XJkpOUGNkrNZ7zVEceIJRj8gWgq
         I1BoSRiONUYvnVUWX4s0CUxvx6aXdKrUZGFmjmyU1vQQBfhtjG1ZfGCwNVibG7tkPwxY
         QSV0eg/vIkmXbGmI1HtD7xLNkz5iJXk3qc9VOA9RMrBxEs9aPcjLb1JU+LeNAhn83I7B
         0yHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=+X2CCzNc2pO0e5MDk8a84L4z7/VlZM8Ywfuz8Cg0lE8=;
        fh=YQnwOe8+LCImakUZw/Xuv6IuQ1KBVqAKnflWqYwNzpE=;
        b=JZ+Mh2sTHKtTU6MQP/kd/A543QSuSsNtRqKBjcVsPZ2XGFGUSOxMKxQZOjaS55N00h
         yeT9Ha24DTj8hogaDV1MDVf/c/0SYUks/PBqwQRupSdGN+VJaCZ6bdON5g3Z4uwWl8OF
         RjAMzJ9CHhvQKLq/aXA5OX/vZV3nDu5mPjpYD+BVl7cyWv9EpYywLHNXpaNuQ9N6fTi9
         w6Cl/HvAW7+NiJxNmOrB3WaZXycH2vZlB3S9vxcJ14sNIDWJgcbD6a2sGnd6HxpeJGb0
         3XRnz3yJjPrTxD6sFd9+3FNwhLmrHLlLISLhYE0jBBnaQBSSipjitjgb4rV1k5taQSWJ
         mNew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912213; x=1794517013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X2CCzNc2pO0e5MDk8a84L4z7/VlZM8Ywfuz8Cg0lE8=;
        b=CRDX4tG01TV84ABnzavhVBHA54LoUdMWazs3/A3VV5J0YlDJZdmMQ5Yj+9E0vI0Bu/
         lJZAaucC4zZbUvkL3EnFKI+oLbotCIdR/qrrnl4R9yvUtx0YLKiMLZqbt/vxQJwwxpfX
         W3QAtSfQ+wV9SeLMoSjmEZUOS6et3V+LimB5rH43o+PpWBS7OiCz4TZqZ9Y9R3k8fXyE
         bOoh9eGWAWL9ejUyukK+GRfsCoaC5kdc4gKhKReVkeGhbIr3woJGwG9ShQIyDFbjMdGv
         gQGLeQiqsSL6u59ac9tztlRqbYWLPlWSFVFEYkxYu/Jl7A/xmfW59wvp1KVHHQNX1cAg
         K6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912213; x=1794517013;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+X2CCzNc2pO0e5MDk8a84L4z7/VlZM8Ywfuz8Cg0lE8=;
        b=NT/0QKZTXd4bkAZot9RjzwBCW3dGwnxwdq3RHHxRbWFKaWg0K4gzc3cN9Cx9bz365t
         NDjZ/3xWBEa2tVVNwZ8l5Zz/RlaQsgX/EeBdPgTKlSm8oE26B9h3EuU5EjUgkB5jSgkH
         hrMWf1LSmz89h3B3I5bhz4c6NOMVG6josLSUNgZeQh0ESJNY5ftOXWvi/dHIj09PXHSc
         eh5goNlwV+NJTVGjSOOzkLWdjx7aK8rxoxTnL9eW2h6j3U2WKpCQdejAXFaHLa0T4kkO
         RItNiDUFxxAvsZknkyXXVRQ8AfDBA68OXOzWB+7yFyMePd3uMAaE6BHYJxYRTabz56V6
         kIdw==
X-Forwarded-Encrypted: i=1; AKwUvBwGPajjIoHqd7jFU81WcomP+itr8whfBpamJ0zM+Xzx/3RYvQqgLluecyVpgBzqPZLbZ+R72tz5mN9Nmcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xuCTstbZFz9mZTOzezkIACsKvsvwQnB+f/lydja17JIly96pn
	H/gbRAcq8NFBYUNptlDH3rLRCaHrf8+lxPiBNfHhUwuSxqnC7RUrrq+Vq27j5FF67QV5Bh2r5Y8
	BqU9gyENfVuzIfN6edcygIUnEbHE5APw=
X-Gm-Gg: AYBFou2N86BP89+ux5QM6wHLZMWngzzJC/+hW5+FbjmZZjf4x6tjHGOHWMtX0btE9iz
	MHdOTDEAGP+yy8aLDTKVV53PI9nvZ6+rWdLm2sRZWSiG4wA+hDuBBj8MR0zG69wR1F5u7O0toF1
	mlNo4DsobA/D1ZyAtfy2TkJcvi7OrVhuHAgEKONScfEyTaco15TJLZIxof4FFbjmHb6vNcOaUjb
	9Ql50BdMMPFxraY0W4YjlErk0cLbsCyr7RmPTsACVDY/Y2UuBe2aUHGfntu9MSRBqxNXcgSgMiw
	7SAydWdAG1fCz/0SVo/zd8Oji1m28pMFeVz7GLG23S8v+n/Iw0RmUc8JK64qExGo4/fCHd8Lzyx
	O5g3G2mV7Izx/5uGstebOI+HSc/NjpwaR4IDzuDHRWLtKxYmduXi3tvWFoQ==
X-Received: by 2002:a17:907:3e0c:b0:c40:5de7:33d3 with SMTP id
 a640c23a62f3a-c4d34c99a67mr62789566b.35.1793912212470; Thu, 05 Nov 2026
 12:56:52 -0800 (PST)
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:56:50 -0800
Received: from 374130946952 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 12:56:49 -0800
From: Joshua Warren <joshua.s.warren@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CADjP6_CC-jv6nyEHaLj=Z0eyjubOJZuiKESqszW3LgTJTTQ_Aw@mail.gmail.com>
References: <CADjP6_CC-jv6nyEHaLj=Z0eyjubOJZuiKESqszW3LgTJTTQ_Aw@mail.gmail.com>
Date: Thu, 5 Nov 2026 12:56:50 -0800
X-Gm-Features: AclHuK895C5KKBs4nmSrxjqf1VGW67u10b4C9T9Hu24NVenn9zuP_x2G0Umt0hI
Message-ID: <CADjP6_BYHrO4fOdYWpnHjjoP29Pih3bxn0eO2F5tbHCwBpP9Tw@mail.gmail.com>
Subject: [PATCH 1/2] perf/core: Avoid charging mmap aliases twice
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

commit 0c8a4e4139ad ("perf/core: Further simplify perf_mmap()") hoisted
user_extra = nr_pages above the rb and AUX branches of perf_mmap().
Before that change the alias paths (mmap() of an already-mapped ring
buffer or AUX area) reached the single charge site with user_extra = 0
and extra = 0.  After the hoist they carry the buffer's page count, so
every alias mmap() charges the perf mlock gift (user->perf_mlock) again,
through perf_mmap_account().  extra remains 0 on the alias paths, so
mm->pinned_vm is neither charged nor leaked by an alias -- the duplicate
charge is confined to user->perf_mlock.

The excess is never removed: the final close uncharges exactly the
first allocation's charge (perf_mmap_unaccount() for the ring buffer,
the AUX close path for AUX), so the per-alias charges stay on
user->perf_mlock.  Alias paths also charge without passing
perf_mmap_calc_limits(), and an alias mmap() that fails in map_range()
is torn down via perf_mmap_close(), which does not release the alias
charge either.

The inflated counter throttles later mmaps: perf_mmap_calc_limits()
clamps the recorded user->perf_mlock at the perf-event mlock budget
(sysctl_perf_event_mlock scaled by online CPUs) before adding a fresh
allocation's user_extra, so once the counter is inflated past the
budget, every fresh allocation spills its whole size out of the perf
mlock gift into mm->pinned_vm and is tested against RLIMIT_MEMLOCK
there, and can be denied with -EPERM even though the real usage fits
the budget.

Charge on first allocation only: drop the ring buffer alias-branch
charge and move the AUX charge from the common tail into the AUX
first-allocation branch.  Aliases share the existing charge and the
final close releases it exactly once, as before.

Tested with a host-level regression harness that compiles the
accounting code straight from this tree (perf_mmap, perf_mmap_rb,
perf_mmap_aux, perf_mmap_close, perf_mmap_account/unaccount/calc_limits
and the internal.h helpers) and drives full ring and AUX lifecycles
over it (single-user, single-mm, single-threaded; nothing runs in a
kernel): the unfixed tree leaves nonzero user->perf_mlock behind on
alias and failed-alias lifecycles, the fixed tree balances all 22.
The harness is tooling, not part of this change.  Compile-verified with a
focused x86-64 defconfig build of kernel/events/core.o; the kernel was
not booted and no runtime kernel reproduction was performed.

AI coding agents in the omp harness wrote the patches, the reproducer
and the measurements.

Fixes: 0c8a4e4139ad ("perf/core: Further simplify perf_mmap()")
Signed-off-by: Joshua Warren <joshua.s.warren@gmail.com>
---
 kernel/events/core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 457d75ea7..c8bb805bc 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7332,9 +7332,11 @@ static int perf_mmap_rb(struct vm_area_struct
*vma, struct perf_event *event,
 		if (refcount_inc_not_zero(&event->rb->mmap_count)) {
 			/*
 			 * Success -- managed to mmap() the same buffer
-			 * multiple times.
+			 * multiple times. The alias shares the ring's
+			 * already-locked pages; the existing charge stays
+			 * as-is and is removed once, when the last mapping
+			 * closes.
 			 */
-			perf_mmap_account(vma, user_extra, extra);
 			refcount_inc(&event->mmap_count);
 			return 0;
 		}
@@ -7443,9 +7445,16 @@ static int perf_mmap_aux(struct vm_area_struct
*vma, struct perf_event *event,

 		refcount_set(&rb->aux_mmap_count, 1);
 		rb->aux_mmap_locked = extra;
+
+		/*
+		 * Charge the AUX area once, at first allocation. The alias
+		 * branch above shares the already-locked pages and adds no
+		 * charge; the single charge is removed when the last AUX
+		 * mapping closes.
+		 */
+		perf_mmap_account(vma, user_extra, extra);
 	}

-	perf_mmap_account(vma, user_extra, extra);
 	refcount_inc(&event->mmap_count);

 	return 0;
-- 
2.39.5
