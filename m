Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1F2C15A0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832215; cv=pass; b=MXpPLZDMFzb+Cc+40XF6QzyuGdtR1h5js4OSr3vklbVAysO5yNtsgQFPAZqTd+SoBkLs9LcZ9MWa+jwiBMbU1zZu9QnAm/wBBUtqmS2VQfVLxv06edxsFZ6ZRWqcvKmnwJln4gYTGmFlHoUbpbWKV3FFfnhkHmy2gldLxivHTnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832215; c=relaxed/simple;
	bh=q8xN7t+uh8bhrZkvmaPFMSophby0E6lJ/dJ85UWlerQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LlcfiO17zQgR7pGgdxFZRLZ4cIEqpV3dAUltQEC+QfnF7u2VCrxD6raHJkEZjnX7p8JslaI/cJUicm/WMs3yiFRariQAulnP3USh20OCRTv6IsyI3nL91tIldixzs11Z498/ktPBXCb/pxDrzxvGflt2OQFJaa2flPdc1mdoMSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaX88Ji3; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaX88Ji3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso94566866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789832211; cv=none;
        d=google.com; s=arc-20260327;
        b=DLPHETgmO13gCtIL03FoDPLdHcRo58DpTI2PNv0UNmypokf/OIXAK1UikNOLgNZAEb
         i6P6fRzbp18ocVyUMN1Av9taPfcFM8ap3fg+uosGgFJMpHKM3n6j9oFQqxFJwfx9zdUW
         f7F1JajJnm6cnMdkvBW31lc2sLCMHaoWU5uF3cpj7EVjAmOAi9JA31snSy3w2e0jyOlL
         oRAv4OmAsCLr2TcUJeKQv7A82iPP5e2CP8zFPvZ/DtNxdQJAdW7u4FHFe31TIRgjK0z9
         4OIaXi1+alJbcMoqgTztm4bi6o3XPG75Cm1lJ7SDGExRmRXwi+mG/ehRQEFzcuOyk+54
         5phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0jTQqjg8Tx9uNXn0rQ3bKfba64DQL4udXHafA60tFco=;
        fh=kly/4wnodOU3QYPEkaRNsDKIJnp+V2/6+wN6wYw9aTI=;
        b=Zuhn1bzY6M8Uqmn3q4pGUk2NWVEsko/JjJUGghJbYdqZnt+tZwijGvwsCLNrYq9sou
         vwBwq1lZJLZg70/GsyW2TxF6BLxu+q32xy07TUKgn7YTbtPiAY3Rph22HV2d2ZYO4oB4
         qPoz5y9uSO+RTuqhWF8jFCdkv1C4U+tHsjoqtggCahUmo45lsmaPYGXLM2QwlcUh5RfI
         k6WNWZv+2ZXO2LTBMmtV/+m6N9ZcbVT6SMPA8c+/bVLVO2jn+yVymnS6r8Farmzj8DTD
         lot5xgupEOpJEPWL/rgeS14gZC4pQKzfjkhD8z4hJPD2iuAyweTgiKm6170Lh7cXyd8u
         GYfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789832211; x=1790437011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jTQqjg8Tx9uNXn0rQ3bKfba64DQL4udXHafA60tFco=;
        b=MaX88Ji3BLOsaFg9mkRU9LDNF+a7ZerALqW7Ky4LpdSxbr55lnt8CcGKQchc+Nd6U4
         1Uwextm6ohHpM0N4kjVgTXykIsT83KPAFcqxBoFL1nDyPhn4CAR1wQ5+z9/avXTrODpH
         MJjlIXrQz73JpN1Wt3f5b79+f4BjQNNfEyGeV6l3twueNUfIt5xZFzjUnbhM+Hai2K5i
         J/P+v4LZOw5Gq6Y3YL8JWwDLeuSWTPViJ8NnO3743RMgbWP7JCYk1xtoqjNiAuG6jjxF
         8zZ7tbrD9QY67ueNtcQffK9pjJjt1mPG/r/NF8Sc49yrhAuKqnMgB65gs8DElyEOuXyp
         L5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789832211; x=1790437011;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0jTQqjg8Tx9uNXn0rQ3bKfba64DQL4udXHafA60tFco=;
        b=qQAwUQglxv64xKdNJ+dA+48Wl/t8YiU4u8vVssGzcaZttV45v0wUIgJFLktceDgoxB
         pWsZGhHxdhvjy2ZKD40npOfRiq0NdL4SAeo+KSlP1vadIAQvJwz42WLMqHQ3A9A/dWOM
         lhfDzHXvrVh98wljD/lwaV8CGjr/nvBQWhxm3sDG7xKvqZYLSJnTJBwxAAIdFis03CIh
         PtZX53FJ3nMi++xYDVJrttVtAsJJwrnBwELFIAdvv0gCTShRQE9vZ3KbvANwbSsal2Cb
         UN/hIiOVdE4byk/q9ZcH+r3jUEqXl2Hp4yibIVNJ1V0yvN72x28ZqpAkOMwwDtLa+Rnh
         C3vw==
X-Forwarded-Encrypted: i=1; AKwUvByNtrBJCfI4l1xLqYqrqx3qKtRPYd1uZ+B4OOeYEDd+R19Th3QNq40OpKjp9twwJNsrXg7kjmXQ1ZjrYnU=@vger.kernel.org
X-Gm-Message-State: AFuF++kDSY4ubbo5lPOGiBBoO+bT4ZmZq3N4A+QqCZdXKN7iqbZwiPtv
	jOyx1atS0ceh+eIGUl4qwLTpj6eCJhXorQnPfwVELI3gCMMv880IZEDmXZHQ197ISdU8qwZ2q14
	N7UH+GGEg8aZG0szKIMUDz9bX+XBnoDE=
X-Gm-Gg: AYBFou18VPePyslLQgoCU68K/YWB6IYRcGu1+AIsiBbVBT/oIjw8VAAR4Qy9kmZQSA2
	5m9RbLyMfmO2lPvO/Dt+D4s1iOvxfJBCxVwhHwI1mHVIH/ePs1OcaH3IxRozm0biseLlTEZ3C3M
	YFRUb4FawErDCiTUcnFL86lCqxO/Z6dI6smd5vSILoXiemB4bioOA3PuCiTlOAE3xr8YGtnhzo5
	qPzWyL0T8cDcGo/S/dQgsULxtDQr9u8HzVkw0rdwO8+IW0IoO7VGt/nuGWNpGw4PWpuQNgUC6t9
	sAG5fFXL51ybN4QUcH9Vaax+nfjwJqa91aLJ1AP97+Nk8z3BYwkNtVBPg+zQ+qNf6Rdnptj1/yP
	NVS6JWGFGOuOVyF9k1LfxOFYUpsj/Dbqmmg==
X-Received: by 2002:a17:906:f58a:b0:c26:478b:ac5b with SMTP id
 a640c23a62f3a-c2a165e2e21mr561450466b.23.1789832210413; Sat, 19 Sep 2026
 08:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Julian Blaauwiekel <julianblaauwiekel20@gmail.com>
Date: Sat, 19 Sep 2026 17:36:36 +0200
X-Gm-Features: AcwNN1Wl7mLiTszZkPROK5zohs_QG5gORFE_3itmRqm6ygkU-ZvI808pH89U5Dk
Message-ID: <CADNJy8DbyKti51DesJd8bCX0evNPpJkav+TNEuyh_rQce=oGHQ@mail.gmail.com>
Subject: [RFC] sched/fair: bounded Dependency-Aware Scheduling for causal progress
To: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

My name is Julian. I am 16 years old and I am actively developing a
custom operating system called MUDOS_64.

As part of it, I designed a CPU scheduler called HEDFS-4. I
deliberately used the Linux 7.2.6 fair scheduler as the reference I
wanted HEDFS-4 to outperform as strongly as possible, while avoiding
the usual trade of substantially worse throughput or fairness.

While doing that, I arrived at one mechanism which I think may be
independently useful to Linux.

I call it Dependency-Aware Scheduling, or DAS.

I am sending this as an RFC because I may have overlooked existing
Linux mechanisms or previous research that already addresses some or
all of this problem.


THE PROBLEM
===========

The basic observation is that a runnable task can become newly
important to system progress without undergoing a runnable-state
transition.

Consider:

    Client A
        |
        | waits for
        v
    Server B

Suppose B is already runnable.

A submits work to B and then blocks waiting for its completion.

Before:

    B is runnable

After:

    B is runnable
    A cannot make progress until B makes progress

B did not transition from BLOCKED to RUNNABLE.

There is therefore not necessarily a new wakeup of B communicating the
fact that B has just become part of another task's causal critical
path.

EEVDF still has the correct fair-service state for B, but the
dependency itself is information orthogonal to B's lag and virtual
deadline.

DAS explicitly represents that information:

    A -> B

for as long as the dependency remains actionable.


CORE INVARIANT
==============

The central rule of DAS is:

    dependency information may alter short-term service ordering,
    but it must not create CPU entitlement.

DAS does not need to:

    change task weight
    erase vruntime debt
    grant unaccounted runtime
    permanently raise task priority
    move the task into another scheduling class

If B executes for delta_t because dependency information moved it
earlier in the service order, the complete delta_t is still charged to
B normally.

Conceptually:

    EEVDF:
        determines fair entitlement

    DAS:
        provides bounded information about causal progress

    accounting:
        remains normal

I consider this distinction important because DAS is intended as an
ordering mechanism, not a hidden CPU-allocation mechanism.


WHAT COUNTS AS A DEPENDENCY
===========================

Possible sources include:

    waiter -> mutex owner
    client -> IPC/server worker
    consumer -> producer
    requester -> completion worker
    task -> explicitly known completion target

This is broader than conventional priority inheritance.

Priority inheritance primarily handles priority inversion around
resource ownership.

The condition DAS attempts to describe is instead:

    "Execution of B is currently required for useful progress of A."

That can be true even when:

    A and B have equal priority
    B owns no traditional lock
    B was already runnable


BOUNDED DEPENDENCY PRESSURE
===========================

My current model associates finite, consumable scheduling pressure
with actionable dependencies.

Representative values from the design are roughly:

    initial dependency pressure:
        ~0.5 ms service-equivalent

    maximum total pressure:
        ~8 ms

    maximum effective ordering bias:
        ~1 ms virtual-service equivalent

These are tuning values, not fundamental constants.

Pressure is consumed by actual progress.

If the dependency:

    completes
    becomes invalid
    stops being actionable
    or cannot currently make progress

then its actionable pressure is removed or suspended.

Long chains are attenuated rather than recursively amplifying without bound.

A simple reference function is:

    depth_factor(d) = 1 / 2^(d - 1)

therefore:

    depth 1 -> 1
    depth 2 -> 1/2
    depth 3 -> 1/4
    depth 4 -> 1/8

Fan-in is also sublinear.

One reference function is:

    fanin_factor(n) =
        min(2, 1 + 0.25 * log2(n))

The objective is to recognize that a server blocking many tasks may be
more important than one blocking a single task without allowing N
waiters to manufacture N times the CPU entitlement.


DAS DOES NOT REQUIRE GRAPH TRAVERSAL IN schedule()
==================================================

The first version of this idea would be easy to implement badly.

A scheduler which rescans dependency graphs, recomputes every ranking
and reevaluates topology on every scheduling event could easily spend
more CPU time making decisions than it saves in latency.

HEDFS-4 therefore uses a lazy decision architecture.

DAS itself keeps only a bounded actionable frontier.

For example:

    maximum active DAS candidates = 64

Dependency events update this structure incrementally when an edge:

    becomes actionable
    receives service
    resolves
    blocks
    becomes invalid
    changes relevant state

Maintaining an ordered frontier is therefore approximately:

    O(log k)

where:

    k <= 64

and the strongest currently actionable candidate can be cached.

The hot scheduling path does not need to traverse the dependency graph.


LAZY DECISION ARCHITECTURE
==========================

HEDFS-4 generalizes this idea with a Decision Elision Layer.

Each CPU maintains generation state for independently invalidatable
scheduling domains, including the state relevant to DAS.

A complete scheduling decision creates a cached Winner_Certificate
containing enough information to prove that the current winner remains
valid.

The common path is approximately:

    Can_Current_Continue()?

If none of the state capable of changing the winner has changed:

    FAST_CONTINUE

The current task simply continues.

That path is intended to be O(1).

Conceptually:

    scheduling event
         |
         v
    current winner certificate still valid?
         |
      +--+--+
      |     |
     yes    no
      |     |
    continue   known causal successor?
                 |
              +--+--+
              |     |
             yes    no
              |     |
          direct     local
          handoff    repick

Only when the cached decision is invalidated is a real local
scheduling competition necessary.

More expensive CPU-placement logic is separate again and is only
entered when placement may actually need to change.

The resulting path classes are roughly:

    FAST_CONTINUE
        O(1) certificate validation

    DIRECT_HANDOFF
        validate an already-known causal successor

    DIRECT_SUCCESSOR
        dispatch another already-cached valid successor

    LOCAL_REPICK
        perform the real local scheduling competition

    PLACEMENT
        topology/capacity/NUMA/SMT/etc. reasoning only when required

The point is not that Linux should copy these structures literally.

The point is that DAS does not inherently imply:

    dependency graph traversal on every schedule()
    complete policy recomputation
    topology reevaluation
    or an unconditional context switch


DIRECT CAUSAL HANDOFF
=====================

A particularly useful case is:

    A is currently running
    A blocks on B
    B is already runnable

If B is:

    valid
    eligible
    allowed by affinity
    legal on the current CPU
    and not blocked by a stronger scheduling requirement

then A -> B can potentially be dispatched directly.

The scheduler already knows the causal successor.

There is no need to perform a generic search merely to rediscover B.

The reverse can also apply when B completes the work and wakes A.

Again:

    direct handoff changes path/order,
    not CPU entitlement.


SWITCH PROFITABILITY
====================

Another part of the design is to distinguish:

    logical preference

from:

    profitable physical switching

A DAS candidate becoming slightly preferable does not necessarily
justify an immediate context switch.

A switch can be gated approximately by:

    estimated causal-progress benefit
        >
    estimated physical switching cost

where switching cost may include:

    scheduler work
    architectural context restoration
    address-space effects
    TLB disturbance
    cache loss
    topology effects

This prevents DAS from turning every small change in dependency
pressure into another context switch.

The task which continues running is still charged normally, so
avoiding an unprofitable switch naturally changes later
fair-scheduling state rather than granting it free execution.


EXACT NEXT INVALIDATION
=======================

HEDFS-4 also computes the next known timer-driven event capable of
invalidating the current decision.

That may be something such as:

    request exhaustion
    eligibility crossing
    parity/fairness boundary
    dependency-pressure transition
    another exact scheduler state transition

If:

    current time < Next_Preemption_Event

and no asynchronous state capable of invalidating the certificate has
changed, another full timer-driven scheduling decision cannot produce
a different winner.

So the scheduler does not need to repeatedly ask the entire policy
engine the same question.

In short, the architecture is deliberately:

    maintain rich information incrementally

    cache the strongest alternatives

    invalidate only what changed

    recompute only when it can change dispatch

rather than:

    rerun everything on every scheduler event


WHY I THINK DAS IS WORTH DISCUSSING
===================================

The case I find most interesting is still extremely simple:

    t0:
        B is already runnable

    t1:
        A sends work to B
        A blocks on B

    B at t0:
        runnable

    B at t1:
        runnable

Nothing about B's runnable state indicates that its causal importance
has changed.

DAS changes the scheduler-visible information from:

    B is runnable

to:

    B is runnable
    and B is currently on an actionable causal path

without changing B's long-term fair entitlement.


CURRENT EVIDENCE
================

The complete HEDFS-4 design contains DAS and several other scheduling
mechanisms.

In my current simulated mixed workload, the complete HEDFS-4 scheduler
produces approximately:

    P99 scheduling latency:
        ~80% lower than my Linux 7.2.6 reference model

    throughput difference:
        approximately 0.x%

    fairness difference:
        approximately 0.x%

I do NOT claim that DAS alone accounts for that entire ~80%.

That comparison includes mechanisms outside DAS.

A Linux-native DAS-only ablation would be required to determine DAS's
isolated contribution.

I include an analytical sanity check of the whole-scheduler result
below because it was useful for checking whether an ~80% P99
difference was even plausible given the scheduling timescales
involved.

It should not be interpreted as a proof that:

    DAS alone = 80% improvement

or that:

    Linux always has the modeled latency distribution


WHAT I WOULD LIKE TO TEST ON LINUX
==================================

The experiment I think would be most useful is:

    1. stock EEVDF

    2. EEVDF + dependency-edge tracking only

    3. EEVDF + bounded DAS ordering bias

    4. EEVDF + DAS + optional direct handoff

with at least:

    throughput
    fairness error
    P50 latency
    P95 latency
    P99 latency
    P99.9 latency
    maximum latency
    dependency-chain completion latency
    context switches
    migrations
    scheduler CPU overhead

measured independently.


QUESTIONS
=========

I would particularly appreciate feedback on these points:

1. Does EEVDF or another current Linux scheduler mechanism already
represent the case where an already-runnable task becomes newly
causally important in a way I have missed?

2. Is a strictly bounded causal-progress ordering signal compatible
with the invariants the fair scheduler wants to preserve if all
resulting CPU service remains fully accounted?

3. Which dependency sources would be realistic to expose without
introducing excessive complexity?

4. Are there known pathological cases where this approach would fail
even with depth attenuation, bounded fan-in and normal fair
accounting?

5. Would a minimal prototype restricted initially to one or two
dependency types be useful for evaluating the idea?

If the concept appears worthwhile, I can formalize the pressure rules
further and work toward a small Linux prototype against the current
scheduler development tree.

Criticism, counterexamples, prior art I have missed and problems with
the analytical assumptions below would all be useful.

Regards,
Julian


APPENDIX: ANALYTICAL SANITY CHECK OF THE WHOLE HEDFS-4 RESULT
=============================================================

Again, this appendix is NOT a DAS-only performance claim.

Its purpose is to test whether the ~80% P99 difference observed in my
complete HEDFS-4 simulation is numerically plausible under a
deliberately mixed workload.


A. WORKLOAD
-----------

Short/interactive work:

    Input:
        burst = 0.20 ms
        period = 8.00 ms

    UI/client:
        burst = 0.10 ms
        period = 10.00 ms

    IPC/server critical work:
        burst = 0.25 ms
        period = 10.00 ms

    dependent worker:
        burst = 0.20 ms
        period = 10.00 ms

    compositor-like work:
        burst = 0.35 ms
        period = 16.67 ms

Sustained throughput work:

    Compute A:
        continuously runnable

    Compute B:
        continuously runnable

    Compute C:
        continuously runnable


B. UTILIZATION
--------------

Input:

    0.20 / 8.00
    = 0.025
    = 2.50%

UI/client:

    0.10 / 10.00
    = 0.010
    = 1.00%

IPC/server:

    0.25 / 10.00
    = 0.025
    = 2.50%

Dependent worker:

    0.20 / 10.00
    = 0.020
    = 2.00%

Compositor:

    0.35 / 16.67
    = ~0.020996
    = ~2.10%

Therefore:

    U_short
      = 2.50%
      + 1.00%
      + 2.50%
      + 2.00%
      + 2.10%

    U_short
      = ~10.10%

Residual sustained compute:

    U_compute
      = 100.00% - 10.10%

    U_compute
      = 89.90%

With three equal continuous compute entities:

    89.90% / 3
      = 29.966666...%

      = ~29.97% each

So the modeled workload is approximately:

    10.1% short/interactive/causal work
    89.9% sustained compute


C. LINUX REQUEST SCALE USED BY THE MODEL
----------------------------------------

Linux 7.2.x uses:

    sysctl_sched_base_slice = 700000 ns

or:

    0.70 ms

with default logarithmic scaling:

    factor = 1 + ilog2(cpus)

and the CPU count used by this scaling is capped at:

    8

Therefore on 8 or more CPUs:

    factor
      = 1 + log2(8)

      = 1 + 3

      = 4

and:

    r_linux
      = 0.70 ms * 4

      = 2.80 ms

This is the request scale used in the simplified analytical model.

Linux EEVDF still applies its actual lag, eligibility and
virtual-deadline logic.

I do not assume every event waits 2.8 ms.


D. SIMPLIFIED LINUX TAIL MODEL
------------------------------

Define:

    q

as the fraction of latency-sensitive events which encounter a longer
non-immediate/protected part of the latency distribution.

For that delayed subset, approximate arrival phase as:

    W_linux ~ Uniform(0, 2.8 ms)

The remaining:

    (1 - q)

fraction is approximated as immediate for this simplified model.

For:

    0 < x < 2.8

the CDF is:

    F_linux(x)
      = 1 - q
      + q*x/2.8

For P99:

    0.99
      = 1 - q
      + q*L99/2.8

Therefore:

    q*L99/2.8
      = q - 0.01

and:

    L99_linux
      = 2.8 * (1 - 0.01/q)

for:

    q > 0.01


E. HEDFS-4 LOW-LATENCY REFERENCE PATH
-------------------------------------

This part of the model uses HEDFS-4 mechanisms outside DAS as well,
which is why the appendix must not be treated as a DAS-only
calculation.

For the short-burst workload, the reference design reaches a:

    1.00 ms

short request class.

Take:

    D = 1.00 ms

with:

    B = min(D/4, 1 ms)

therefore:

    B = 0.25 ms

and use:

    G = 0.25 ms

as the reference urgent-response preemption granularity.

Then:

    B + G
      = 0.25 + 0.25

      = 0.50 ms

and:

    t_urgent
      = D - (B + G)

      = 1.00 - 0.50

      = 0.50 ms

So the simplified comparison uses:

    L99_HEDFS ~= 0.50 ms

excluding small dispatch/context-switch cost.


F. P99 RESULTS
--------------

Relative reduction:

    R
      = 1 - L99_HEDFS / L99_linux


For q = 100%:

    L99_linux
      = 2.8 * (1 - 0.01/1.00)

      = 2.772 ms

    R
      = 1 - 0.500/2.772

      = 81.96%


For q = 50%:

    L99_linux
      = 2.8 * (1 - 0.01/0.50)

      = 2.744 ms

    reduction
      = ~81.78%


For q = 20%:

    L99_linux
      = 2.8 * (1 - 0.01/0.20)

      = 2.660 ms

    reduction
      = ~81.20%


For q = 10%:

    L99_linux
      = 2.8 * (1 - 0.01/0.10)

      = 2.520 ms

    reduction
      = 1 - 0.500/2.520

      = 80.16%


For q = 5%:

    L99_linux
      = 2.240 ms

    reduction
      = ~77.68%


For q = 2%:

    L99_linux
      = 1.400 ms

    reduction
      = ~64.29%


Summary:

    q        Linux P99      reference P99      reduction

    100%     2.772 ms       0.500 ms           81.96%
     50%     2.744 ms       0.500 ms           81.78%
     20%     2.660 ms       0.500 ms           81.20%
     10%     2.520 ms       0.500 ms           80.16%
      5%     2.240 ms       0.500 ms           77.68%
      2%     1.400 ms       0.500 ms           64.29%


G. SOLVING FOR AN 80% REDUCTION
-------------------------------

Require:

    1 -
      0.5 /
      [2.8 * (1 - 0.01/q)]

    >= 0.80

Therefore:

    2.8 * (1 - 0.01/q)
      >= 2.5

Then:

    1 - 0.01/q
      >= 2.5/2.8

      >= 0.8928571429

Therefore:

    0.01/q
      <= 0.1071428571

and:

    q
      >= 0.093333...

Therefore:

    q >= ~9.33%

Under this simplified model, an ~80% P99 difference does not require
most Linux events to enter the long tail.

If slightly more than approximately 9.33% do, the 0.5 ms reference
path is sufficient to produce an approximately 80% P99 difference.


H. DAS-SPECIFIC ALREADY-RUNNABLE CASE
-------------------------------------

DAS addresses another case which the previous arithmetic does not quantify.

Suppose these are already runnable:

    Compute A
    Compute B
    Compute C
    Server S

Then a UI task blocks on S.

S does not wake because it was already runnable.

Using a 2.8 ms request scale, a crude complete-round service-gap
envelope for four equal competitors is:

    (4 - 1) * 2.8

      = 3 * 2.8

      = 8.4 ms

I am NOT claiming Linux necessarily delays S for 8.4 ms.

Actual EEVDF behavior depends on:

    lag
    eligibility
    current virtual deadlines
    hierarchy
    scheduler state

The point is only that S can remain an ordinary already-runnable
competitor even though it has become part of a newly important causal
chain.

DAS gives the scheduler explicit information representing that change.


I. FAIRNESS SANITY CHECK
------------------------

For the three equal continuous compute tasks:

    ideal share
      = 89.90% / 3

      = ~29.97%

For a 10 second run:

    ideal service/task
      = 10 * 0.299666...

      = ~2.997 s

Using a conservative transient service-debt bound of:

    +/-16 ms

the relative transient deviation is:

    0.016 / 2.997
      = ~0.00534

      = ~0.534%

At 60 seconds:

    ideal service/task
      = 60 * 0.299666...

      = ~17.98 s

and:

    0.016 / 17.98
      = ~0.00089

      = ~0.089%

This is consistent with large short-term ordering changes coexisting
with sub-percent long-term fairness error when all execution remains
fully accounted.

Again, that specific debt bound belongs to the complete HEDFS-4
design, not DAS alone.


J. INTERPRETATION
-----------------

What I believe this appendix establishes is only:

    the ~80% whole-HEDFS-4 P99 result is numerically plausible
    under the modeled workload and timescales.

It does NOT establish:

    that Linux always has this latency distribution

    that q has any particular real-world value

    that DAS alone causes an 80% improvement

    or that this constitutes a formal proof of scheduler superiority

The proper way to determine the isolated value of DAS would be a
Linux-native implementation and controlled ablation.

That is the experiment I would most like to see.

Regards,
Julian

This message was drafted with AI assistance because I'm not very good
at presenting proposals like this. The scheduler design and technical
claims are mine.
