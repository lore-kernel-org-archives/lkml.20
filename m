Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C36E3B7B7F;
	Fri, 16 Oct 2026 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187597; cv=none; b=QhCASDyOg/GUStYq/WREJlMmCZFADAF70dIW372cp3QDVx8B+wk1I+Ewr8/SBQ9g/vTS3S7brUMw8t89Oeum3nNivxCUz+VdJ9p444EalK9a30HmTC/PRwpKS0LWWBwH1jWNhLTGfij0dhutERpDCqj8aHU2gY7MQIEEV6hVWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187597; c=relaxed/simple;
	bh=QBy0HwD0lLTpQ9uwTj4TWf7LEA5pfjIqOIdiYDu71Ro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DsTukguRB9Sd+LMFWrUL/9pqgi+hOKkMwM9fxr2T6FSnGnpy2idprZXhdFop0gc7dGNqO0t7ajJNw5Y5sbzbNJHM4K22cSIrW6fxASGgaWYGhekwOnmwDslbCbNFCJerr++0uJm8YXlmAXCqpJyxnmpBzoqSN3jKsHZxoX1sKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwC2iZd/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwC2iZd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46F71F000C4;
	Fri, 16 Oct 2026 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792187595;
	bh=9yyDzOBMSD5wdNS8DHMru0KPEHgSFgzy5ujz0evy5Po=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nwC2iZd/0l8zgQPbx+jIENTjighTql5B+zHMFX8fQQL7ECVJB5x2XpABtoroCpFBV
	 T0W9Ak7Ckxbhhrijm4qxD33o2YRQc6YoKHTbs054u3QVyuHajMOmVMIMKmCyiCibhe
	 dIfw+Le9BrWYeJHuNNlVRzYgE5RD849yyAt7PaVvHRUKviJV1bDaNxuEJfYHqgJW0e
	 TIEgtj4EEijI+bE5P3YJ+2KKNdZIf0Qn1WS3FJ30g0+bjGKALs1zTXwjUVrXwygjy1
	 5ULkTOGMB5ALB5SHXP6dAW7nOyZzQPPD3z5Gw6FKoDIkyE3h2TqXaoOB5E9AyECJFX
	 Fjh8V1XDXTmKw==
From: Thomas Gleixner <tglx@kernel.org>
To: salil.mehta@opnsrc.net, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, James Morse <james.morse@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Yicong Yang
 <yangyicong@hisilicon.com>, Jonathan Corbet <corbet@lwn.net>, Gavin Shan
 <gshan@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Salil
 Mehta <salil.mehta@opnsrc.net>
Subject: Re: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in
 cpuhp_smt_enable
In-Reply-To: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
 <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
Date: Fri, 16 Oct 2026 23:53:12 +0200
Message-ID: <874ielcnxz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 29 2026 at 19:41, salil.mehta@opnsrc.net wrote:
> From: Salil Mehta <salil.mehta@opnsrc.net>
>
> The CPU enabled mask describes whether a present CPU may currently be
> brought online. cpuhp_smt_enable() is an online operation, but currently
> walks all present CPUs and only filters CPUs that are already online or
> belong to offline NUMA nodes.
>
> This can make it attempt _cpu_up() for a present CPU which firmware has
> not enabled and which has not yet been registered as a CPU device.
>
> Use the enabled mask for the policy decision it was introduced to
> represent. This keeps present-but-disabled CPUs out of the SMT bring-up
> path while still allowing registered offline SMT threads to be brought
> back online.
>
> Present and enabled are separate generic CPU states, so callers which
> intend to bring CPUs online should not assume that every present CPU is
> enabled.

The 'enabled mask' was introduced two years ago to deal with the ARM64
oddity of present, but disabled CPUs, which nobody else needs. So yes,
it's generic in some sense, but that's not the argument to be made here.

The argument is that present CPUs might not be set in the enabled mask
and therefore cannot be brought online.

> Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
> ---
>  kernel/cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..988b7a1e8298 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
>  	cpu_maps_update_begin();
>  	cpu_smt_control = CPU_SMT_ENABLED;
>  	for_each_present_cpu(cpu) {
> -		/* Skip online CPUs and CPUs on offline nodes */
> -		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
> +		/* Skip online/disabled CPUs and CPUs on offline nodes */
> +		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
> +		    !node_online(cpu_to_node(cpu)))

Seriously?

What's wrong with the obvious one-liner:

-  	for_each_present_cpu(cpu) {
+  	for_each_enabled_cpu(cpu) {

That would be too self explaining, right?

But that change is only a small subset of the overall story because now
the hotplug core looks at enabled mask in one place while all the other
places still utilize present mask.

With your second patch, that will then try to bring up present, but
disabled CPUs in bringup_nonboot_cpus(), which might be a silent fail or
not. The other instances which use present mask are probably silently
skipped due to the hotplug state.

Just because you did not observe a warning due to that does not mean
it's correct.

Thanks,

        tglx


