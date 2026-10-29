Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300878;
	b=u2bRtUJpGfxXGBIvcTdNQ+Fo3srRXPGI/HvL9k8PInRAglBnnSh7nkoP2rWrK76yV1e5
	 Rp4z7NaH/Ika9COEqsJ+oDPK8Lxs3m2aM+SpxtsIiDYmH4GpTuGR98gMSfAEdZWckhZyA
	 jwK2TVyHVIGyFjSv2DQtjcmL2JNNId8uBas96vM5nUD0y0fBcj2k3wcWoGk0rnjxSKdhj
	 7IMtI1KyhgphtIiaIhsAOLrOmofdh/fnuOr4PvPrChY/vmQfGC8AakrK1QYFDafzjYTvf
	 my5g8teze48ob2Hl3xbapcmxgJlx9bN5hbt5xt/bncvV37zgcL6E770du+aRN0cGfTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300878;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GzRHNEcbdcK56XP+ztMWDKHvJmZyAZtVfDYgvs0mefU=;
	b=KiDfCOtE6JwP8RhuiELhk0/9f7dJq1y3HcpwNHvTTxKmGpxqTnukeCd1p8SXEXmIuaeh
	 aXS6Q7PEKOp+MnRklOZCB7bUHECN5SjGWxO4/RmpQQLKMTlZjH0dsNJC+t8UQx+z0caSO
	 MWqbyqFrPTXB4kmXogZKRu1D4CTSs9qVCdRFsXW/JWBRlXpLeqvfPA72aVUrGLmjjxyEH
	 s88j0QBIMyO3Lz8shh41KA7vJvxx1vXUzXxB1YtV78y8rB5c0YUzXs0t6UHJrK/Or2Q1U
	 OnO725rxa6xh19lOu2W/CjMtGobirS03UGzbTJBikCzJ/hkskR2bGYcg/V7vqOsz4sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBwSyuQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38821606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBwSyuQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C081F01816;
	Thu, 29 Oct 2026 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300877;
	bh=GzRHNEcbdcK56XP+ztMWDKHvJmZyAZtVfDYgvs0mefU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IBwSyuQG3n9WjKZe884Ex+E8ScE7lSiqlODLesKI48pgws3z5wsQd75lFYZhgv7b8
	 U6Aniv5s/m924KT6m2/3zVzZdG3nbPWVI6AKKTzH7oLdOc9UE91r94hs7haX1Mxqg2
	 moATFN0+4Q8Ipz21zGgrw76G8n/w3/CVZ3XxqtdBLWfZU0W+QEkVqUusESBixBMy4q
	 wHofTQVcOk3AZgdvhkCTUOWOF+usw+cqwmc3uYFMk2lAf37ZU52GeSvSYcjqq3ddsz
	 sht7XOKMD6vKpcpMMeebSDlWnqJZMqNd2LDcWSrQPIG1UVlvGuhT7O0hgkYng1cwSH
	 s98t46xmhjgZw==
Date: Thu, 29 Oct 2026 09:07:56 -1000
Message-ID: <56db993fd60efc4892e1cf1e38ba48e1@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.5 v4 2/2] workqueue: Keep the limits of both max_active domains current
In-Reply-To: <20261029-wq_final-v4-2-2985ea9f24fd@debian.org>
References: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org> <20261029-wq_final-v4-2-2985ea9f24fd@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Breno.

On Thu, Oct 29, 2026 at 05:33:46AM -0700, Breno Leitao wrote:
> The planned PERCPU affinity scope will let a workqueue switch backends
> through its attributes, and a switch should land on a sensible limit.
> Derive the other domain whenever the limits of the backend in use are
> set.

I think the two domains should be separated completely at the interface,
each with a fixed meaning regardless of the backend in use, as discussed in
the RFC thread. Otherwise, it gets too confusing. On the sysfs side, the
existing max_active would become compat only, with max_active_percpu and
max_active_total as the main interfaces. The kernel API would match:
workqueue_set_max_active_percpu() and workqueue_set_max_active_total(),
with the conversion to the other domain done in those setters.

This patch only makes sense as a way to get there, and it's difficult to
tell whether it's in line with that without the actual conversion.

> +static int wq_user_max_active(struct workqueue_struct *wq)
> +{
> +	if (wq->flags & WQ_UNBOUND)
> +		return READ_ONCE(wq->saved_max_active);
> +
> +	return READ_ONCE(wq->saved_percpu_max_active);
> +}

Maybe write it as "if () return X; else return Y;"? Neither branch is the
special case. The same goes for wq_nr_effective_cpus() and wherever the
choice between the two domains ends up.

> -	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
> +	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))

I wonder whether this condition is right. It should trigger when the
effective max_active is 1, whether the workqueue is in percpu or unbound
mode, but this only looks at the domain the workqueue was created in. Once a
workqueue can switch, the limit in force may be the derived one, and that
can reach 1 even for a workqueue created with a higher max_active, e.g.
after min_active is lowered.

Maybe this means there should be further restrictions on how low max_active
can be pushed. For example, a workqueue created with max_active > 1
shouldn't be driven down to 1 in either domain, however it gets adjusted, so
that whether a workqueue can end up at 1 is decided by the max_active it was
created with. One way could be a floor of 2 in the setters and the
derivation for workqueues created with max_active > 1, while one created
with max_active 1 can still go back to 1, e.g. after being raised. That's
just one option though.

> +static int wq_nr_online_cpus(const struct cpumask *mask)
> +{
> +	return max(cpumask_weight_and(mask, cpu_online_mask), 1);
> +}
> ...
> +static int wq_scale_to_percpu(int max_active, int min_active, int nr_cpus)
> +{
> +	return max(DIV_ROUND_UP(max_active, nr_cpus), min_active);
> +}

I'm not sure single-use helpers without any comment are an improvement. They
seem to obscure more than they help. Maybe open-code them with comments
explaining why? That would include wq_nr_online_cpus(),
wq_nr_effective_cpus(), wq_scale_to_unbound(), wq_scale_to_percpu() and
wq_init_bh_max_active().

> +/*
> + * Derive the saved limits of the max_active domain @wq's backend doesn't use
> + * from those of the one it does, with the current number of usable CPUs, and
> + * publish both.
> + */
> +static void wq_rescale_max_active(struct workqueue_struct *wq)

Would it make sense to make the rescale a part of wq_adjust_max_active() and
use that everywhere, on init, any config change, freeze and so on? With the
separate setters, the workqueue could remember which domain was set last,
and the derivation would always go from that one with the current CPU count,
so calling it again couldn't ratchet the limits. BH would stay out, and
hotplug could keep using the saved values.

Thanks.

--
tejun
