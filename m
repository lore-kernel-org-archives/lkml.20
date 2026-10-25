Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792927233;
	b=JDGm464kjjEye7bZ+orq95VrBsJmr+DE90w5pizQJQDywL3LUbyby0E/0+1whqi1k9Uk
	 AsUrLAn53FRDsnypETK1y2+km8iEyHv8o4hhIJ3H8uCpDZcNfl2EXYeyXTFR7KfAt4CSk
	 HFnxH4gnRe8ZbXo1H1gXroAhXdyv7tnYkaqncebLVuGf6UYZxqPJjDReo+g5VzUZEJMJN
	 +YTJcDLIyz7PqLMAdISRgUrcKSgZzebLVf87RgSkN4cj7AfrcWrWHQcfZeGGmmi3WzJ8v
	 46BZwWatdVrwgzem81zO6CQxYlHeX5S4WCzOu0vok3FItJUeeDDb8Fd4pAhPqiL41HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927233;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mSBExiX2NQwZLNwSjCl/EhfPOaTLUD4gLnGVEkO8r2k=;
	b=jeL0Jqm9oS87g8x7ik9x8aYWdDrsEDPv0Dkkz+0vBE1Mi0urhsIfq8elWe8Ie9wr99Uw
	 326az2KOyAbZGkS8SS4jPztRGcLnoFcngaNCksae9L1Y6c5CFuNp46cAewLH+VWzcIqu6
	 /hJo0exFaV2Ly+LSViZ1klvTa7yLMeIu60l2TKc2WMXFLT89MISaRFdQcNBrhj8GqiUnH
	 rjlCIfgv51ki8I5Na7Z/dChDOc3qXBzDfRzVr9V7403tkxYuS1IJjIRaxpIRHuI3utq/p
	 siF7sqIkS8nNqKEfR08OG82S7BGVvZ0t65IQIGmSfFMHrEWo0FAH4KcouNno23ouFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lA9nwdeO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29743606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lA9nwdeO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA15E1F01825;
	Sun, 25 Oct 2026 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792927232;
	bh=mSBExiX2NQwZLNwSjCl/EhfPOaTLUD4gLnGVEkO8r2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lA9nwdeOIa1EIlUAjpRf0nhgwjl8ZLbOaC5G0zPfx4zvvpl5pU1iIuurnf/ICbTUi
	 3LFR0CQFjMvnMs1JFUwYL6pRAauKRR5h9yC/3noCM+z35xsm4XELwpaQ99RiZqD02z
	 t2kT5vQVA9A48Ez+JIP2quAwZwGMM7GcyC5UjOydbFsGIx/HOIWwXDnrk/h6k/JNmC
	 yhAzN8S0sOntPfD/sARe6nvajwv/FmCE4xrhH7W7ORdWuK8DSPGmA2epKJ1htTOmnp
	 2myqO0nj9XbvDvwdJC8ZZMk32Zht9O7U6rUFDCgXelggTs3xr4o+YIlV4LnZjJC0Ph
	 aMstUf0jMsT8g==
Date: Sun, 25 Oct 2026 12:20:27 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [GIT PULL] scheduler fixes
Message-ID: <at3l-1cmp86nIe9M@gmail.com>
References: <atSQkrxwvS17naGH@gmail.com>
 <179234732347.1771961.17707846016194485544.pr-tracker-bot@kernel.org>
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
In-Reply-To: <179234732347.1771961.17707846016194485544.pr-tracker-bot@kernel.org>

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-10-25

for you to fetch changes up to cac037a85c1971ec75c4d3edf5a28af9ec2a089c:

Scheduler fixes:

 - Fix MM CID affinity-triggered switch back to per-task mode
   (Hui Su)

 - Fix scheduling regression observed on AMD Ryzen
   AI HX 370 systems, caused by cache aware scheduling
   incorrectly overriding asym packing placement (Tim Chen)

 - Fix stale get_pref_llc() prototype for !CONFIG_SCHED_CACHE
   (Yafang Shao)

 Thanks,

	Ingo

------------------>
Hui Su (1):
      sched/mmcid: Fix affinity-triggered switch back to per-task mode

Tim Chen (1):
      sched/cache: Honor asym packing over cache aware scheduling on hybrid systems

Yafang Shao (1):
      sched: fix stale get_pref_llc() stub for !CONFIG_SCHED_CACHE


 kernel/sched/core.c |  5 ++---
 kernel/sched/fair.c | 22 ++++++++++++++++++----
 2 files changed, 20 insertions(+), 7 deletions(-)
