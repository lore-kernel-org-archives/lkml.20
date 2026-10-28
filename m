Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201176;
	b=klWJUCQwRXYZrolp1alTOj4kdQpG4AUWq0zHylf8klUIFShkqpMV+pJ4T0JiFuEWr4eY
	 9IM4aNBb6Ab1J+UJw21DQ5+q76og05dPF/Svgtx6C782UwfvjAgIYIouNqwUPZGc/X7XI
	 KZbYtPeAcmyiDLLqgRu3+YGaZp1ufJR7CsjpAbzxNGNHNCUnXqvP5+/NmouwsuvUxS4dx
	 F3UnjOSwjyMgeS+bsZri0Cea0fet/APcFp3GjSDSw/wFR/Z1M/DuBoSnJYm29E+zeH/y4
	 4AKI29MpUZmQaX014y482Q4e20bvHqTjRAfEU0TBXA6EGdiHRXV6Nxj7L6y19ykz/eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201176;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CAt0d5ylylt8eW+LlxYd6ss54lXkb9DQcvfjrPX+Thw=;
	b=YA2lP3TW6GcSwWlVJpC/RrtJ3xxWVAsA/lvNPzuWj0QXeYkzWui34Z0Ysyl27gDy0IxS
	 ytqosy+6S3ac5EhlcxPTvlYNKm8xVpbrELW5RQYJMMJN9ZOKFnpSdyxLf/UGsBzCjdl/5
	 NDwsD8jNrHGvjRJNQFjtWWNonK+sJOwoZfcrffYJuGDtrwrbAind/1PKl8hD3fGeCu2sh
	 qNhL1zgv1uGaAIJV0PXUTRvNN0NdvumHn+H3wFQlx681qZB3eRRBCrcT5oCUtbJFJ7l11
	 rzcj5cwSL0LOL+NXmkyoZZFC7AgYnlh85aBTb/bOlyeRn/MwAnWW6lqX3+2BeTT/AjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvmFqyUy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvmFqyUy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678FE1F031E1;
	Wed, 28 Oct 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201176;
	bh=CAt0d5ylylt8eW+LlxYd6ss54lXkb9DQcvfjrPX+Thw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DvmFqyUySHpUvxKNU6qRygBZIY+lpdJ+uHpVbKHq9HS5UeSmcmMC9dUBwX8iplhrZ
	 wCHmTngQ6m83iipwvMqWvn3IUGbaNt9zogpn9Tp+Ob/VgyZ4II59nTZtZQLAfuvfwE
	 0hpm1yZ9gjXNlmyOeHYzLeThFwP82DNITlZLKDF/L6Zk9rec/VtkPyvQvinfK5KzRv
	 ONFcMyomZVlIuh4f8id5FMbupEKeJ+ijJdHaY6AQGVVCnnkhXNe3dL4ggz9L4g2fyw
	 VEeC6jaaAeDUVADLBMab9KSR8q0m7UId7hfUpA/1rIw7Ltv+XiGqYhBScioArXDrCo
	 vZlyQ1qegZTpg==
Date: Wed, 28 Oct 2026 16:26:13 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING
 post stop_machine()
Message-ID: <auIUFQL35gon7cU2@localhost.localdomain>
References: <20261019130856.49711-1-frederic@kernel.org>
 <20261019130856.49711-50-frederic@kernel.org>
 <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>

Le Fri, Oct 23, 2026 at 10:05:30AM -0700, Florian Fainelli a écrit :
> On 10/19/26 06:08, Frederic Weisbecker wrote:
> > Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
> > all the teardown callbacks while stopping all CPUs in the system. This
> > doesn't mix-up well with running RT or isolated tasks.
> > 
> > In order to transition smoothly from global stop_machine to finer
> > grained synchronization between teardown callbacks and the other CPUs,
> > a new stop machine post function has been introduced to be executed
> > after the main one with IRQs still disabled while other CPUs can exit
> > stop_machine().
> > 
> > It *looks ok* to disable the cache readahead globally while the other
> > CPUs are running.
> 
> Yes I think it is safe given that b15_rac_dying_cpu() will run on the dying
> CPU and any CPU that is left will basically re-enable the RAC afterwards if
> necessary in b15_rac_dead_cpu().

Good.

> 
> The hardware to test this is quite ancient, but if you give me a test case
> to exercise, I can give it a spin.

I don't have the hardware either. Otherwise the only test I can think of is
to simply shutdown a CPU and see if that explodes.

Thanks!

> 
> Thank you Frederic!
> -- 
> Florian

-- 
Frederic Weisbecker
SUSE Labs
