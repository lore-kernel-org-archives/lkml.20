Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665700;
	b=akUwH/9Cn1b2x7foeeXMU8JyHc1U1Rv4p/VJhrpXJU/ma1wK5px5I/SS8RZUnOubjhO/
	 Nf1qfqh7FBIk03IPk7W3YD1MVJDME8lJC8eZrZt0HLBpx0R3v9vi2cOUN5MV9yypg+dmP
	 2/walUEk0p+jWieazprF0g5fKKBJBzSkYcZ4ZZiBhd4CiGp8guQ/O1i5oldcgFgVdJuWs
	 HTyAdZElWMf313VxOx8/19+QtF/PFenX2XEW3RgIpQvw9w8nTfOXZtvje1GMkFjkvgIiI
	 B35lGHDYE+WXEwmI9YkbdFNVW8Bb9mqBavkNL0+KsR0uNJrWEnpWW5l3lkQTyFgSFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665700;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cx/wI3buiGf4YDSU60un1yV9Fc+jLcwGahk4e80mOas=;
	b=LAD4L8Ibbc0lv0zme/1fHd2f/86Pl4XCxFpJZhLq1y73DMfxGGkpRMCmU1JQ0qWp3Avz
	 V/5QccGoBHL28plOWpMFBA6tI05inLIrZX3S72dwBaeFiLHIljo7yIqJ71CzxRAwqoGik
	 +2CRejfyI8hcA+szLa5NiBotj8Cu0mOjZqxvOrhM0p3FSeJy6V8/nLPMU3dFw9rPxwKh1
	 GCZiSVRHpqbvadKC2Nq1xZI54GQ9EN9TOdL2oj/q1ER63EdPOkXjxCbhQ5CzBahKN5Tim
	 qUX5Yu96zTkGb+TYVWNR11iE2ZAvcuvrryNczNlD8EofKTOcK41c8WCAFuzcbv9a21Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.108
Received: from out28-108.mail.aliyun.com (out28-108.mail.aliyun.com [115.124.28.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF5B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=SUSPECT;BC=-1|-1;BR=01201311R431ec;CH=blue;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jnPtPWL_1792665687;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jnPtPWL_1792665687 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 18:41:28 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: peterz@infradead.org,
	Li kunyu <likunyu@open-hieco.net>
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: =?utf-8?Q?Re:_[RFC_PATCH_0/6]_sched/fair:_Introduce_the_SMT_BUDD?=  =?utf-8?Q?Y_ASSIST_feature?=
Date: Thu, 22 Oct 2026 18:08:21 +0800
Message-ID: <20261022074044.GA4120091@noisy.programming.kicks-ass.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20261022100821.981VXwAZyKKAsG00eaxoDO9kollDWxuTGq7ALzXMQDc@z>

From: Peter Zijlstra <peterz@infradead.org>=0D

On Thu, Oct 22, 2026 at 03:40:44PM +0800, Peter Zijlstra wrote:=0D
> On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:=0D
> > [Problem]=0D
> > =0D
> > It was found that on servers equipped with the Hygon 7447v CPU (Model 7=
,=0D
> > 384 logical cores), migrating tasks across LLC scheduling domains durin=
g=0D
> > load balancing caused significant performance degradation:=0D
> > =0D
> > 1. A low L3 cache hitting rate (due to factors such as non-shared L3=0D
> > caches).=0D
> > =0D
> > 2. The traversal overhead of higher-level scheduling domains (e.g.,=0D
> > cross-NUMA scheduling domains).=0D
> > =0D
> > Similar issues were also observed on CPUs from other vendors during=0D
> > testing, though the degree of memory bandwidth increase and other=0D
> > latency effects varied. Consequently, a series of patches was developed=
=0D
> > to address and improve these issues.=0D
> > =0D
> > =0D
> > [Solution]=0D
> > =0D
> > This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling=0D
> > feature. The main work is as follows:=0D
> > =0D
> > 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.=0D
> > =0D
> > 2. Skip SMT-domain balancing after a successful push and avoid pulling=
=0D
> > the pushed task back.=0D
> > =0D
> > 3. Restrict newidle balancing so it does not pull from higher-level=0D
> > scheduling domains.=0D
> > =0D
> > 4. Compensate for the resulting load imbalance with a burst-task wakeup=
=0D
> > path that sends tasks to idle CPUs.=0D
> =0D
> So you're combatting undue LLC migrations with brute force :-( Mostly=0D
> this looks like something where cache aware scheduling should help, no?=0D
> That ought to make cross-LLC migrations less attractive.=0D
> =0D
> Now, I realize that cache-aware scheduling as is won't help stream; when=
=0D
> build using OpenMP the whole thing is one big process and cache-aware=0D
> mostly gives up, when build using MPI its a ton of single threads and=0D
> cache-aware will ignore them.=0D
> =0D
> Still, I think you really should look that way, perhaps investigate if=0D
> something like:=0D
> =0D
>   https://patch.msgid.link/cover.1787955777.git.tim.c.chen%40linux.intel.=
com=0D
> =0D
> can help you.=0D
=0D
Thank you for your suggestion. I looked at this patch series and think=0D
the way it exposes the interface to users ("always" | "advise" |=0D
"never") is quite good. We will add the related interfaces in a subsequent=
=0D
version.=0D
=0D
=0D
> I'm not sure why you're doing the SMT push thing; but there's this=0D
> thing:=0D
> =0D
>   https://patch.msgid.link/20261002154415.2270586-8-vincent.guittot%40lin=
aro.org=0D
=0D
I previously looked at the relevant patches, and my implementation=0D
approach was slightly different. Here, I mainly focused on quickly=0D
distributing tasks to the SMT sibling CPUs; during this load-balancing=0D
cycle I could still pull tasks, achieving faster CPU load balancing=0D
(mainly for rapid local task dispersal, and it does not substantially=0D
 conflict with the approach in that patch). In subsequent patches, I=0D
also made new considerations: checking the cfs.h_nr_runnable count and=0D
no longer focusing on sleeping tasks.=0D
=0D
Task pushing at the SMT level is part of the overall functionality.=0D
Combined with the changes in select_task_rq_fair(), it achieves rapid=0D
overall task dispersal.=0D
=0D
Combined with the aforementioned user interface, this makes it easy to=0D
enable or disable SMT-level task pushing.=0D
=0D
=0D
thinks,=0D
kunyu=0D
