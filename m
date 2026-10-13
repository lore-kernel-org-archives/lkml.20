Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7F17C203
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861251; cv=none; b=OErYFfc8IwNm/AVZ0N3cadCWjMwuID+ydV7ELqv+nYm7geFE9DPuuYAqoTnscdwkHjbXYoNarF8FuGNCM5epPz6tIwsze3FHjXOeidld0dDVgkBFPWoCfei6mfVli/AEmHuP4lsphnAU74kdYRJcbQfqV6cf4OKPBYH5HdTJKQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861251; c=relaxed/simple;
	bh=22LjuzCketjlkzgPm8qMqIEkXwfSP3UnBaL4SB50h+A=;
	h=Mime-Version:Content-Type:Cc:Subject:Message-Id:In-Reply-To:To:
	 From:Date:References; b=eTqddqbIg61F+L33ASyvQzI3XXroxJBdHxYhfcBpgdfAaIAizrd5ojlMN16u6fB2pyvoSzaAiPCzgfxbMEkYYayGzVA55ladJaclkTR8351mFpt55nwNhcU+iuOYQ6xJxKZdyzsENo4crW+ZiE96TJfEtFhj9vNw+898UepRPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fjitPJwM; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fjitPJwM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791861243; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=22LjuzCketjlkzgPm8qMqIEkXwfSP3UnBaL4SB50h+A=;
 b=fjitPJwMGer1CFveE8wAMhQdtPxqz/bPkZL/xLGwoOLVN37NdPJcwR9D7X+e1Reyy32Q64
 2tbrAcFTULrWKrcl41V9uFua51pLxXgxoYAxpovVWYBUt/OQ0EobOnsV+5FIkP8a1YbbPC
 tcMnqWJn61XtUjcf0Qd6pXW+eHQxT8Abl6JSIq8vt2CVxF5156Pk7E9+ONSxn/+0Z475GY
 PLjWEW3wS5+jUP+cZ1BWY4UjYxKf7zIepHKWVsbSxScgqS6kWKNXOaCw1e30AJlOh5erg/
 THknBh9GFjelc5K0KK+DdApXuLhgUtEd5e5YPlRBt/qBoX5IF6EA3D0vqwcYxQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26acda1f9+cc0e18+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <Liam.Howlett@oracle.com>, <akpm@linux-foundation.org>, 
	<aubrey.li@intel.com>, <bsegall@google.com>, <corbet@lwn.net>, 
	<daniel.m.jordan@oracle.com>, <jannh@google.com>, 
	<juri.lelli@redhat.com>, <libo.chen@oracle.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <lorenzo.stoakes@oracle.com>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <pauld@redhat.com>, <peterz@infradead.org>, 
	<pfalcato@suse.de>, <shakeel.butt@linux.dev>, <tim.c.chen@intel.com>, 
	<tj@kernel.org>, <vbabka@suse.cz>, <vschneid@redhat.com>, 
	<ying.huang@linux.alibaba.com>, <yu.c.chen@intel.com>
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
Message-Id: <20261013031333.10208-1-lizhe.67@bytedance.com>
In-Reply-To: <ldyynnd3ngxnu3bie7ezuavewshgfepro5kjids6cuxy4imzy5@nt5id7nj5kt7>
To: <mkoutny@suse.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Tue, 13 Oct 2026 11:13:33 +0800
References: <ldyynnd3ngxnu3bie7ezuavewshgfepro5kjids6cuxy4imzy5@nt5id7nj5kt7>
X-Mailer: git-send-email 2.45.2

On Wed, 25 Jun 2025 12:19:35 +0000, mkoutny@suse.com wrote:
> The balancing works with task granularity already and this new attribute
> is not much of a resource to control.
> Have you considered a per-task attribute? (sched_setattr(), prctl() or
> similar) That one could be inherited and respective cgroups would be
> seeded with a process with intended values. And cpuset could be
> traditionally used to restrict the scope of balancing of such tasks.
>
> WDYT?

Following this direction, I posted a per-process/thread-group prctl()
series for automatic NUMA balancing control:

https://lore.kernel.org/all/20260908122446.56708-1-lizhe.67@bytedance.com/

The series keeps kernel.numa_balancing as the global hard-off switch and
uses a weak two-state process setting: disable to opt out, enable to
allow participation when the global sysctl and memory policy allow it.
The configured mode is stored in signal_struct, so CLONE_THREAD threads
share it, fork inherits it, and exec preserves it. cpuset and memory
policy still define the placement domain and VMA eligibility.

This is intended to cover the use case raised in this thread without
adding a cgroup-local NUMA balancing resource knob. Could you please have
a look and let me know whether this matches the direction you had in
mind, or whether you would prefer a different ABI such as sched_setattr()?

If the direction looks acceptable, I would also appreciate guidance on
whether the current series has any remaining blockers for being picked
up.

Thanks,
Zhe
