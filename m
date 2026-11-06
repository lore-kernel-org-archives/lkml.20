Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977872;
	b=hq7xfs+KjhIklVazNKG8Es/4+TN5ba8LoYT6CC0NPcyKXBv1weutNA9hnL+8zeH0qWA3
	 QpVuENDnWsYn6r9osen3GbgF1LosIui1Tc28ccezLZR2uWwpxmH1EXOKmqfWegcW8NHb8
	 8/+aXLjvzTnQMPJ0ac88RmJDWcSS1ZpGEiR9b95ewe4ZvWKe4Zowumy0awT54IrWKztHz
	 wCz4bFUGLvQlviIU7r/oBICMZLdZMDK8nfUKHJ0nOTOLmrVS3Uv1XS/gf4cfcvi1kqXeh
	 JjD3IfWqOVoJLl3ZxzKAk0oG/Lw1Lgg4GL/JiT/k4UcXVjhUYZyociPkwhM3IXQnigQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977872;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=rQZDBBxnMVWwIQJXsnwXukNkJO7Iim0hYQsIKvwO2fI=;
	b=kRgGEYcrXdUp0s5M5HOCHeggvx9lM1N+s2jc4D6TOb/arHxByKdqj7Yeta6YTkMu4rgI
	 KOu4U0NIDGGu2LKcW6iq1KTanmzaiCWVaAreNxWLPrcnfLFlLDYv/iX8AOpqx9IEMpQ+I
	 02I9UfxDMQwnDYcfzqup/Bs2GHfbjTv3V31S2Tg7eOawK8e6Om2LkI7ceStimpa5uHajz
	 NSrwfNG8Wsh/nq5XaHy2XAX5UknpP5PHd5c6tpClGj09BfAuFiSiegwHUNaGDNQl7MosS
	 4xqjawTo7WABHq+s/7X+g9YpwQDSVT7muhhxwC0OsdOWiJBsQhFh5F09c0eSFhjiVXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=N2RuBHG2;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=N2RuBHG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rQZDBBxnMVWwIQJXsnwXukNkJO7Iim0hYQsIKvwO2fI=; b=N2RuBHG2nGAi2xTxfQzJr7zz6y
	9X1UEDE1FYcTOPMFQcfwNxBl26SSizrLGWOqzd+nihcLWo9VreKnxVkSnnXKqm/wAr1n8hnP+pOUg
	/R4ILRawpSFQLGdWOZrM+dv+YypwesuVrQvldHqQIe658OelZ8u4kpszcEYw6y+s4AD4shec/Fx9C
	7N44hn6v4Lb4xAsig0wFeO++VcMfy5Frax+y99aX6yRMWHGG3CF8Khukl9rg5FV8WNFELMhK//OLc
	RhRlNYnTXYkbEPeIF2T9onK+jcGaLWnJIl0BHW2JNHXB3MGAXIhH6wb1o2SnFAyPicvU6HcW9wDQP
	tC0EQl1Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPLam-009N0x-0T;
	Fri, 06 Nov 2026 15:11:00 +0000
Date: Fri, 6 Nov 2026 07:10:56 -0800
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.5 v4 2/2] workqueue: Keep the limits of both
 max_active domains current
Message-ID: <au3smjfpG3_ic2Me@gmail.com>
References: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
 <20261029-wq_final-v4-2-2985ea9f24fd@debian.org>
 <56db993fd60efc4892e1cf1e38ba48e1@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <56db993fd60efc4892e1cf1e38ba48e1@kernel.org>
X-Debian-User: leitao

Hello Tejun,

On Thu, Oct 29, 2026 at 09:07:56AM -1000, Tejun Heo wrote:
> On Thu, Oct 29, 2026 at 05:33:46AM -0700, Breno Leitao wrote:
> > The planned PERCPU affinity scope will let a workqueue switch backends
> > through its attributes, and a switch should land on a sensible limit.
> > Derive the other domain whenever the limits of the backend in use are
> > set.
> 
> I think the two domains should be separated completely at the interface,
> each with a fixed meaning regardless of the backend in use, as discussed in
> the RFC thread. Otherwise, it gets too confusing. On the sysfs side, the
> existing max_active would become compat only, with max_active_percpu and
> max_active_total as the main interfaces. The kernel API would match:
> workqueue_set_max_active_percpu() and workqueue_set_max_active_total(),
> with the conversion to the other domain done in those setters.
> 
> This patch only makes sense as a way to get there, and it's difficult to
> tell whether it's in line with that without the actual conversion.

Agree, I tried to separate them make it easier to review, but, it was
not ideal.  I will pause this for now, and come back with the actual
coversion.

> > +static int wq_user_max_active(struct workqueue_struct *wq)
> > +{
> > +	if (wq->flags & WQ_UNBOUND)
> > +		return READ_ONCE(wq->saved_max_active);
> > +
> > +	return READ_ONCE(wq->saved_percpu_max_active);
> > +}
> 
> Maybe write it as "if () return X; else return Y;"? Neither branch is the
> special case. The same goes for wq_nr_effective_cpus() and wherever the
> choice between the two domains ends up.

Ack. I was following netdev's approch of having `if (foo) return bar; return
baz`.

> 
> > -	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
> > +	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))
> 
> I wonder whether this condition is right. It should trigger when the
> effective max_active is 1, whether the workqueue is in percpu or unbound
> mode, but this only looks at the domain the workqueue was created in. Once a
> workqueue can switch, the limit in force may be the derived one, and that
> can reach 1 even for a workqueue created with a higher max_active, e.g.
> after min_active is lowered.
> 
> Maybe this means there should be further restrictions on how low max_active
> can be pushed. For example, a workqueue created with max_active > 1
> shouldn't be driven down to 1 in either domain, however it gets adjusted, so
> that whether a workqueue can end up at 1 is decided by the max_active it was
> created with. One way could be a floor of 2 in the setters and the
> derivation for workqueues created with max_active > 1, while one created
> with max_active 1 can still go back to 1, e.g. after being raised. That's
> just one option though.

Sure. Should the floor cover min_active as well?

> > +static int wq_nr_online_cpus(const struct cpumask *mask)
> > +{
> > +	return max(cpumask_weight_and(mask, cpu_online_mask), 1);
> > +}
> > ...
> > +static int wq_scale_to_percpu(int max_active, int min_active, int nr_cpus)
> > +{
> > +	return max(DIV_ROUND_UP(max_active, nr_cpus), min_active);
> > +}
> 
> I'm not sure single-use helpers without any comment are an improvement. They
> seem to obscure more than they help. Maybe open-code them with comments
> explaining why? That would include wq_nr_online_cpus(),
> wq_nr_effective_cpus(), wq_scale_to_unbound(), wq_scale_to_percpu() and
> wq_init_bh_max_active().

Ack.

> > +/*
> > + * Derive the saved limits of the max_active domain @wq's backend doesn't use
> > + * from those of the one it does, with the current number of usable CPUs, and
> > + * publish both.
> > + */
> > +static void wq_rescale_max_active(struct workqueue_struct *wq)
> 
> Would it make sense to make the rescale a part of wq_adjust_max_active() and
> use that everywhere, on init, any config change, freeze and so on? With the
> separate setters, the workqueue could remember which domain was set last,
> and the derivation would always go from that one with the current CPU count,
> so calling it again couldn't ratchet the limits. BH would stay out, and
> hotplug could keep using the saved values.

Yes, that is simpler, and it fixes the ratchet I raised on v3.
wq_rescale_max_active() goes away. The workqueue records which domain
was set last, at creation and in each setter, and wq_adjust_max_active()
derives the other one from it with the current CPU count before
publishing both.

BH stays out, and hotplug only calls wq_update_node_max_active(), so it
keeps using the saved values.

Thanks for the review,
--breno
