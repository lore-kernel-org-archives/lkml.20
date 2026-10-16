Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5949563FC5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171269; cv=none; b=kFmIzSpCF3duHu+lVQXSiSs/dmy/NfdU+VW+FBRMAJPobM299GaDc1lKziIza+bjFFFGF4S0uUxaX8WYmZVlupCyh3EBNSP0L4lf3JLgFRKH56JTe4RTotNUQdGB2wqxY6o3Q0jmjz7yaX3GrHhSmIscYgrssilJl4E8FvtBZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171269; c=relaxed/simple;
	bh=OPjIiBAWUmpGn4vlZ4s8G5r/0OarsY9GSUSAzUIGRps=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8v2iLpy18zpYsH+lCS9dkwnX0w0ObkpqYqFHGCZ8D8ibYkUCxluPiYKK0AWDxvZLhjSbeMH2Hj8hAYcCSLJj6ji9g8BPDJNx8PB+TteJua0FMYuvVWsteGgntcYMbV5zYXwH6wvVb/O0RNMZkeqeMw9WpD2souG6Glez+qXSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwDQzp16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwDQzp16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED961F000C5;
	Fri, 16 Oct 2026 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171267;
	bh=oWj0qslp+f7UQZHGeu/i1F0xd1Yi2qOc1wqwv9lsr8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QwDQzp169uIGAsLMUmcBOWfTEi/F0p+klqsbJOFV6na/5addF6qmdOwBCXbpLFRvi
	 ut3EWYrcaKUMm/FWvM4Qe8SyT/7KT6OlRfX1smJaj3aYHUzU2Nc/xpuUU+UJF/lhwa
	 kI3arMM9T/2ZVRmAZB0HH7H1zZrH3x20lvd64r6MFIthfCGAIUnOX11DCSob2zQNWh
	 0hcjxshYa0/TcaM3M71vs7OTgN1T1gsk6xC8ZmCtZo37D2A5Bsk/P11rYKhIdZSIPi
	 G4gvsRd56pOm9V0P/CUgYGFsDS2uDr7HWAlPebcK/ysWpaz5DgCAsHXZxAHwW/wNgl
	 jy4VJA1hkzBZw==
Date: Fri, 16 Oct 2026 07:21:06 -1000
Message-ID: <654ec35be0b19332d2e605d69ed57910@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v3 2/3] workqueue: Keep the limits of both max_active domains current
In-Reply-To: <20261009-wq_final-v3-2-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
 <20261009-wq_final-v3-2-eb0b095b9de3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, Breno.

The following is a Claude-generated review.

On Fri, Oct 09, 2026 at 05:18:35AM -0700, Breno Leitao wrote:
> Given that we are introducing a new PERCPU affinity scope which will be
> able to do CM, we want to keep both values set, so, the transition from
> scopes would be able to succeed. This cannot be done under the flip, given
> this is RCU protected. See discussion at [1]

"CM" and "the flip" aren't defined, and concurrency management doesn't
come into this patch. The limits are WRITE_ONCE()/READ_ONCE() fields, not
RCU-protected. Maybe say directly that a later scope switch should land on
a sensible limit, so each setter derives the other domain?

> Use the scale function suggested by Tejun in [1].

The mapping is only in the cover letter, which doesn't land in git. Maybe
spell out the conversions here?

> N is the online CPUs the unbound backend of the workqueue may actually
> use. For a workqueue whose own cpumask has been narrowed, that is
> unbound_effective_cpumask(), not the global wq_unbound_cpumask -- the
> latter overcounts and makes percpu_max_active come out too low.
> wq_update_node_max_active() already distributes max_active the same way;
> match it.

N is sampled only when a setter runs. Narrowing the cpumask afterwards
through apply_workqueue_attrs() or sysfs redistributes max_active across
the nodes but leaves percpu_max_active alone. max_active 256 on 64 CPUs
gives percpu_max_active 8, and it stays 8 after narrowing to 4 CPUs where
64 would match. Nothing reads it yet. Should apply_wqattrs_commit()
rederive it too?

> +static int wq_user_max_active(struct workqueue_struct *wq)
> +{
> +	if (wq->flags & WQ_UNBOUND)
> +		return READ_ONCE(wq->saved_max_active);
> +
> +	return READ_ONCE(wq->saved_percpu_max_active);
> +}

The reads are marked but the setters write these fields with plain
stores. Maybe pair them with WRITE_ONCE()?

> -	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
> +	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))

The description doesn't explain this and the max_active_show() change.
For a percpu workqueue, saved_max_active now holds the derived unbound
limit, so these readers switch to the backend's own limit. Maybe add a
sentence?

> +	if (!installed_pwq(wq, -1))
> +		return wq_nr_online_cpus(wq_unbound_cpumask);

This tests for a percpu workqueue indirectly. Percpu workqueues never get
a dfl_pwq (apply_wqattrs_prepare() skips it for WQ_PERCPU), and unbound
ones always have one by the time a setter runs. Maybe test WQ_UNBOUND
directly?

> +	 * Which domain a pwq honours follows its pool, see
> +	 * pwq_tryinc_nr_active(). Keeping both current means a pwq is never
> +	 * metered against a limit nobody set.

Today a pwq's pool always matches its workqueue's backend, so this
describes the future PERCPU scope. Maybe state the contract instead, that
both are kept current so that a pwq on either kind of pool has a valid
limit?

Thanks.

-- 
tejun
