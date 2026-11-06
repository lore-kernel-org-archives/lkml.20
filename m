Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988994;
	b=eo1LlvAkoHAzU+PTI0opVlIlu48227zPnqs00RgoXkxKNqRDgg6QEmJEzg5+XE3rBYTF
	 ebAUyxD/0fSz3ol0HyRCCq1BkpYarYbIHowumQJK0keRxHTOboe5jdWNKUjAgeR/h72fN
	 Vem4k0V4IaNmBxAcAWSgiVRDocGe+aXFNiSxmyDdmft/8s6kRiqbOtDH3FF+iBZMQ8K1a
	 j8VzNDB0nBRwi1LGlJaWFlMa6cAeeayXnzRTEPFII6WhUvEDzeHYRbaBBov6evaGTZYJ2
	 n2j7J3PHJSFTvE74erycG2a/XHhc9guE3sZhzMu+VE/wViqhML65c4IKmj+9Kv+dHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988994;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=np0rBc7IjhEQu4p09VCEWlO9o9RBufgirnMcmCHN/No=;
	b=yBceXuDr8divBw06ySIdPX07wd8p8yaHARl3VV8N1AQm0iEh2ASXFLjfA8GgISWJSrE7
	 Ch+orpt1wxNReJrW6u0ubhNPdAxABdITkQPNZD6aDohzIterWmpJr9EYS4xw8LLIS8FD4
	 0m+JpZZQkPzhmQCP9VDyhRnIphb47A8vP4AcX15rMqu/XysYeZKGMrLeNNr4qR3WQaCsq
	 q3MYXyw+nnbKs/UFlmjicyKhLr6BKwBDOZzsOY5VYD9AuouOITdY4O3x+a6RtdByCz//s
	 rjIRTEz05t3pE3EMPGxah6sm3vWYhkOxEHJhwBxDK7SsDcM3UJmJHG/IHKiM+TOqj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="d95EKw/c";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF59606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF59606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d95EKw/c
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE0E1682;
	Fri,  6 Nov 2026 10:16:29 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F2B3F673;
	Fri,  6 Nov 2026 10:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988992; bh=E0Ux+rJXBJFRHQCF+PiknD1DijpMrELS0VMmKTqZ/Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d95EKw/c2iQCv93H00PxABDJ9kn1MVxtlxP3CD2v2pOefm8L8SnZROUPuT75jGECz
	 FiWX+xTnOiS0ChTukXnbcxOAwocaOMf2G6SdagNl8JqWw2/kjzCGqKv5pEh+lv5McW
	 HPQvygA8GlxZMRkHs5bw7kwl+PDlEUmoZ7rfAi8A=
Date: Fri, 6 Nov 2026 18:16:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, ada.coupriediaz@arm.com,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, syzbot@lists.linux.dev,
	vladimir.murzin@arm.com
Subject: Re: [PATCH] arm64: suspend: Only track cpuidle context for idle tasks
Message-ID: <au4Ze0u6L91ve4u7@arm.com>
References: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
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
In-Reply-To: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>

On Thu, Nov 05, 2026 at 08:19:45PM +0000, syzbot wrote:
> From: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>
> 
> Commit 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic") moved
> the calls to ct_cpuidle_enter() and ct_cpuidle_exit() into cpu_suspend() so
> that arm64 cpuidle could keep RCU watching longer and manage context
> tracking internally. However, cpu_suspend() is called not only by cpuidle
> via psci_cpu_suspend_enter() (which runs in the context of the idle task),
> but also during system suspend via psci_system_suspend_enter() (which runs
> in the context of the task initiating suspend, such as a process writing to
> /sys/power/state).
> 
> When entering system suspend, current is a non-idle task. Calling
> ct_cpuidle_enter() invokes ct_kernel_exit() from kernel space (!user) on a
> non-idle task. With CONFIG_RCU_EQS_DEBUG enabled, this violates context
> tracking invariants and triggers a warning:
> 
> WARNING: kernel/context_tracking.c:120 at ct_kernel_exit+0x1b4/0x1f4
> kernel/context_tracking.c:118
> Call trace:
>  ct_kernel_exit+0x1b4/0x1f4 kernel/context_tracking.c:118
>  ct_idle_enter+0x20/0x34 kernel/context_tracking.c:299
>  ct_cpuidle_enter include/linux/cpuidle.h:134 [inline]
>  cpu_suspend+0x264/0x474 arch/arm64/kernel/suspend.c:136
>  psci_system_suspend_enter+0x4c/0x80 drivers/firmware/psci/psci.c:544
>  suspend_enter kernel/power/suspend.c:468 [inline]
>  suspend_devices_and_enter+0x88c/0xd0c kernel/power/suspend.c:533
>  enter_state kernel/power/suspend.c:618 [inline]
>  pm_suspend+0x498/0x698 kernel/power/suspend.c:644
>  state_store+0x14c/0x1fc kernel/power/main.c:819
>  kobj_attr_store+0x6c/0x90 lib/kobject.c:842
>  sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
>  vfs_write+0x51c/0xa0c fs/read_write.c:687
>  ksys_write+0x12c/0x228 fs/read_write.c:739
> 
> A corresponding warning is subsequently triggered in ct_kernel_enter() via
> ct_cpuidle_exit() upon resume.
> 
> Fix this by checking is_idle_task(current) in cpu_suspend() and only
> invoking ct_cpuidle_enter() and ct_cpuidle_exit() when executing in the
> context of an idle task.
> 
> Fixes: 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic")
> Assisted-by: Gemini:gemini-3.8-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+79883955da3a62652a80@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=79883955da3a62652a80
> Link: https://syzkaller.appspot.com/ai_job?id=5359e16f-013b-4850-9cbc-ddfb3bac95e5
> Signed-off-by: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>

The patch looks fine to me but the authorship is confusing. It was sent
by a bot, also generated by a bot. Uladzislau tested the earlier RFC
(thanks!) and syzbot decided to make him author while dropping the
Tested-by. The original tested-by:

https://lore.kernel.org/all/3e92ccb0-2952-4317-af4c-45457c15efae@gmail.com/

I don't think #syz upstream should automatically translate to
Signed-off-by.

What do we even do with such bot-generated fixes (which may be correct,
so can't be entirely ignored)?

-- 
Catalin
