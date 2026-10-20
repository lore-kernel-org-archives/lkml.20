Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484787;
	b=qauwuN5snOuTbAFuaBRBamXCHWLqORzsUwlGmM1DpUx7A8L0zkWaDktnEoMa31SjL/GW
	 9nPBQ9pzzIxUwKtuB3wvnYJPlxQjiwOy2/6jhni06dECM5ISs/glR9d0O7pb++Lsva3dA
	 cdoedrfI2L0IecNe1E4ASO+EhGfsD6qk1cUinv5/qtAvUNjBbMi4wd75RoAJ1qBGewnk+
	 qAO+IvRphTZ0ofnJ1kjJ+KeHe/2nThFnQX3jBGVEMT/3i/380f6NVBa85JH9nKEgqZ7iu
	 k3WyRaBT3L28MrTeQlHZ424tw9D5IgQCslJ9bIZeAML+G4Y+KbEvU0wqP7vBrBnwxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484787;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=UPsBf0a4D6sRxsXgpBC3hV9i8GINHgTtfiNBGW64TEE=;
	b=4XEnCDbAbgW9iep5t8aGxR8Eug8amT7BtDpAdxy9Rds1WJrUPzuwYrZaDBRT1jy1fubg
	 78fdP28G4xdUDFmbMnyg6CtDOr5kewHHMP/QgC5P1FUMbs+3eI1zKMxJFPpG3IL9gm5/U
	 mG/7ZUN9qpMgbAppk4wP7Rq7eE2AZVjgmEgmkiVyc7gaESO+DKeofvDZY7kK4saduNbkb
	 u/6Nk7Kac8LBcXUA6yNiYGiGhHL83i+64d0+6HO49Bus6eFKbtiYsqAs7HntSd4bf5Vfe
	 b3mjqgmlSG4YG41TI8eOMvbMyEyKH4XN6qQsZeCjp/ez2uuYkr4sQzKRjR6PVC/jcqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLzDHdBI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C50606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLzDHdBI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA16C1F000C6;
	Tue, 20 Oct 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484786;
	bh=UPsBf0a4D6sRxsXgpBC3hV9i8GINHgTtfiNBGW64TEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MLzDHdBIVq6HXPXYKSfNyIf4EDQyNOB0Vr8KNkboMMO2sCueys/qJ5C1xX1k8Q0Tr
	 /bzDPwrl4yxZ4gU6EDGpvKC7e/uwrUlhekjcN3l1mI5ixkIQtkj96B5BahWf5TWXsU
	 4YSDhKYmq4oWRw2sUW5928rhmt9WJe2lxgFfTdcTN8jMHVOwO3I64QaRxKK4E4HOGH
	 Of2JtfiVqMiNw3rozTKfrdmc1MjGcO3p8yc8V1IO0heRN+UIgG9Cl7/m/kuwAmUaU0
	 M2Pbyrgg2s4WDmG029tw5ujg93P2YM0+Pnlc3MkxE0CMuJLsnZK/uWxJZBfb6kBWLx
	 LAi90KWy1Svug==
From: Thomas Gleixner <tglx@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Hui Su <sh_def@163.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, vincent.guittot@linaro.org,
 juri.lelli@redhat.com, peterz@infradead.org, mingo@redhat.com, Michael
 Jeanson <mjeanson@efficios.com>
Subject: Re: [PATCH] sched/mmcid: Fix affinity-triggered switch back to
 per-task mode
In-Reply-To: <10d3d3bc-ef34-4b48-8dff-f544266181a9@efficios.com>
References: <20260915155953.2856524-1-sh_def@163.com>
 <10d3d3bc-ef34-4b48-8dff-f544266181a9@efficios.com>
Date: Tue, 20 Oct 2026 10:26:23 +0200
Message-ID: <87pkx4bwwg.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 15 2026 at 12:10, Mathieu Desnoyers wrote:
> On 2026-09-15 11:59, Hui Su wrote:
>> MM CID switches to per-CPU ownership when the number of users of an
>> mm exceeds the maximum number of CIDs. When the affinity union grows,
>> the per-CPU threshold is recalculated and the MM can switch back to
>> per-task ownership through deferred work.
>> 
>> mm_cid_calc_pcpu_thrs() incorrectly uses
>> min(nr_cpus_allowed, users) to calculate that switch-back threshold.
>> This makes pcpu_thrs no larger than users, so the
>> users < pcpu_thrs check in mm_update_cpus_allowed() can never succeed.
>> 
>> For example, with three users restricted to two CPUs, the MM enters
>> per-CPU mode. On an eight-CPU system, widening the affinity union to
>> all eight CPUs should produce a threshold of four, but the old
>> calculation produces three and returns early. The MM therefore remains
>> in per-CPU mode even though the widened CPU set makes per-task
>> ownership preferable.
>> 
>> Calculate pcpu_thrs from nr_cpus_allowed directly. The users bound in
>> __mm_update_max_cids() still controls when per-CPU mode is entered, so
>> this does not change the threshold calculated when switching from
>> per-task to per-CPU ownership.
>> 
>> Tested with an x86_64 QEMU reproducer using three users, an initial
>> two-CPU affinity, and an eight-CPU affinity expansion. The baseline
>> did not invoke mm_cid_work_fn() after the affinity expansion. The
>> fixed kernel invoked the deferred work once and completed the switch
>> back to per-task mode.
>
> I think you're onto something.
>
> We should cover those scenarios with selftests in
> tools/testing/selftests/rseq/.
>
> Thomas, I recall you had tests for those state transitions when
> rewriting rseq mm_cid. Were those local or did they make it upstream ?

They were local. I thought I had a test for that affinity widening part,
but it looks like I only tested the affinity shrinking.

But yes, the patch makes sense. I'll pick it up.
