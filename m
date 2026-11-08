Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165566;
	b=KITXZFOkEQS2ulj3ZHimDvxL+r9YAgCIIAz+SgFJrmebUMUZ+QKoQ+JOd0qk2ICCqN6X
	 QjF5G7sHl9qR0J5J4nbMOk3lt3yx7IYV8JuFuwZxooWF5AEB9IU4QLyUssZnT4ZBzPIlN
	 SJa1Pk6ZrYvkFHbDb0QToIaTLspfHPQdrGaKQimVOBZ0KF7LwJf5GW+81ram90AOmFgVY
	 m6w5JnBVg5VW2jPf2ou3PQp67Gl57QskxMsefGXdAfsfZRPFx3TLu6ZeTzipknymtqaza
	 edKd82wLwqDlw13eQlSKGAsHc5Tyw5vu1yDBpMLD7zcU3ng9plLNKqirMclM5yS7GpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165566;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NUbO3zepgb4GPK6Cjjwmam/+HO6xrAFYhDZ/eHrfskQ=;
	b=y5jFKwWZJX7y9UZSUbOGMDYEMR16o8ixTSGWwCX4GXpdlX3I1zQe/0+UK9Xwo8DbFprk
	 h8FqrbxuIronOsclq2GIZQJ3bSXWo5Ln3dpQ7nAXOwFRdNb4WRwqOuadyhHw179LPQJt/
	 rFFdY2CT9CjI32z31Alx8XKPCg9YXoEPlK0movOm0DjOWj/UsC9Gs3hpva3yS+OGAyu+J
	 JHH0erbyUcqaQUP52ZrF8+B/6LflNkUa5c+zN+CFjSVDwNG6yQAeQYSXKxmk55RVb78dj
	 xpek1JAKw8Rvj/eCaDoOdVazuy0hCUMJQoUpjOZoF59RABloJNkdae/RI5rHgxi6asQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="TPriFu/T";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="EbXA/pF+";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA65606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA65606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=TPriFu/T;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=EbXA/pF+
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794165515; bh=NUbO3zepgb4GPK6Cjjwmam/
	+HO6xrAFYhDZ/eHrfskQ=; b=TPriFu/TG0Gvco+hYpXdjgSL1088yTd4pZ+JOFVilw/A3EdjfJ
	r6C4RoXsGqzGHxG8BnEEKByO9ItKeBL3N4cQDhXZBQMIEeiUSYwvG8yExzySIf+dPfNKG6ni+Pb
	eUTjX/VZfOPdDQGYBG/XsL+t0loL5HDizVWAAvt6/MCtVII/0nvukJGMJ/j7U5kgXRMb6oIvMI3
	SJ3Hq2E4wptuncs1/66/r9eXy13NarFKORtvkjRsRTpGCivPJ9Hdvu2u+tvtf/z9Ms39Wxxfsuw
	6Pgw0cUmptBrXea1s0SUlI4CVqKFB0NfmbLw1MuyZpsSQcJgWqwHz1PafOTyQgpHrQw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794165515; bh=NUbO3zepgb4GPK6Cjjwmam/
	+HO6xrAFYhDZ/eHrfskQ=; b=EbXA/pF+e4c6qV5RcpTkMazsoiitJrlrAgDlfoEtb0fHXQRd46
	MkoUgt3zWbETW+jyXqE7N1ppXcz8IQxRlgCw==;
Date: Sun, 08 Nov 2026 19:18:37 +0000
From: Bradley Morgan <brads@mainlining.org>
To: longman@redhat.com
CC: frederic@kernel.org, linux-kernel@vger.kernel.org, peterz@infradead.org,
 tglx@kernel.org
Subject: Re: [PATCH] cpu: Fix online housekeeping CPU check in _cpu_down()
In-Reply-To: <20261108180849.1268263-1-longman@redhat.com>
Message-ID: <9B3FDEBA-C79A-4584-9966-641C7300B348@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 8 November 2026 18:08:49 GMT, Waiman Long <longman@redhat.com> wrote:
>There is currently a check in _cpu_down() to make sure that there is
>at least one online housekeeping (HK) CPU left after the shutdown of
>the given @cpu parameter. However the cpu_online_mask used for the
>check may include the current @cpu to be shut down. So the fact that
>there is at least one online housekeeping CPU at the moment does not
>guarantee that there will be any online housekeeping CPU left for the
>sched domain after the shutdown.
>
>Fix that by making sure that there are at least 2 online housekeeping
>CPUs available if @cpu is currently a housekeeping CPU.
>
>Fixes: de715325cc47 ("cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"")
>Signed-off-by: Waiman Long <longman@redhat.com>
>---
> kernel/cpu.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/kernel/cpu.c b/kernel/cpu.c
>index b3c8553d7bd6..ed641ee6b37c 100644
>--- a/kernel/cpu.c
>+++ b/kernel/cpu.c
>@@ -1415,11 +1415,14 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
> 	cpus_write_lock();
> 
> 	/*
>-	 * Keep at least one housekeeping cpu onlined to avoid generating
>-	 * an empty sched_domain span.
>+	 * Keep at least one housekeeping cpu online to avoid generating an
>+	 * empty sched_domain span. As cpu_online_mask includes the @cpu to be
>+	 * shut down, there should be at least 2 online HK CPUs at the moment
>+	 * if @cpu is currently a HK CPU.
> 	 */
>-	if (cpumask_any_and(cpu_online_mask,
>-			    housekeeping_cpumask(HK_TYPE_DOMAIN)) >= nr_cpu_ids) {
>+	if (cpumask_test_cpu(cpu, housekeeping_cpumask(HK_TYPE_DOMAIN)) &&
>+	   (cpumask_weight_and(cpu_online_mask,
>+			       housekeeping_cpumask(HK_TYPE_DOMAIN)) < 2)) {

Well, this patch is good, reasonable enough to me, I may be odd sometimes,
but this patch is sane enough.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> 		ret = -EBUSY;
> 		goto out;
> 	}
>

--- Thanks!
