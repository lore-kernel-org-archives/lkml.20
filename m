Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72545D913
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588016; cv=none; b=dtBtKEAHi0k/fJoQed8cVFVObh+KCQtFvlfLsPDIXdE5tdtwc1e3IswcJEHpu2zf6km1dwFGXmDCNvnXL5A+9/cXYKR/q7Sd4mRmms2zAFfmkwNHP8ULvplXx8s+6iQIVA5/3fCayGAGiatUR3jq65CBoiGgrCRyag7enmNIZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588016; c=relaxed/simple;
	bh=8gbpNOHKzNBpGGxA/5V1OfCM8Nqx4rLf9+WeS8m3+8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlvV1+o9/lzQ2J7dj0Ng2YP8eTN5w/jxYf5t52zAIsjmWSCKFvsQXsBzKGV1K2GIFWm6YVCLBdBtpe7f2xT4+1boY7uYKjs6eTU1wOrXAK0wJikhp5nwZt7hDVq1wzLr2oR+v/GiMP0vlU2Gf4LCpOMagMwEn4IzxVAA0FWAUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IL3Z8DiM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IL3Z8DiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8g
	bpNOHKzNBpGGxA/5V1OfCM8Nqx4rLf9+WeS8m3+8w=; b=IL3Z8DiMrT61Jg/3PO
	LpRaihIqLOX1+QQ0nuK3u57FBFncTcP1F/MaiZqZQjEmd9Zy/Ac4kUjOyx9x0lbX
	bGh1v+UBKLLx3PSoj6A5Shh8LiiRC0T47tfSaxctlwrwxj749I4KFPlR5T0mKZfM
	5gQaBmoHL0tbYL52ZQ4JGqe3g=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBHC8Y+NLpqTCS1Bg--.25014S2;
	Mon, 28 Sep 2026 17:32:47 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Quchaosheng <quchaosheng000406@163.com>,
	Ingo Molnar <mingo@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/proxy: allow SCHED_PROXY_EXEC with PREEMPT_RT
Date: Mon, 28 Sep 2026 17:32:46 +0800
Message-ID: <20260928093246.1994257-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922064110.GR4121339@noisy.programming.kicks-ass.net>
References: <20260921080922.1586693-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBHC8Y+NLpqTCS1Bg--.25014S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4fGw18KF1fXF4Duw1xXwb_yoWDWFXEka
	4vyw48Aw4rJFZ7KFyagw45J397Gw4Fy34fZr4kGrWagrykJrsxJa4vvFyxCr1xJa1xZrn8
	Xr13tr4jkw1SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbf-BJUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-x9l2mq6ND-CqwAA3t

Fair enough - I will stop here.

To be explicit about the current state so nobody spends time on it: the
series is withdrawn. v2 only made the combination build and boot; it did
not make proxy execution functional on PREEMPT_RT, because a task's
blocked_on is only ever set by the native mutex slow path, which is
compiled out when PREEMPT_RT is set. So the option would have produced a
kernel where task_is_blocked() is always false and find_proxy_task() is
never reached, which is exactly the "build option that is effectively
broken" you describe.

The build failures themselves are real and are still in the tree
(kernel/sched/core.c with both options set), so the Kconfig "depends on
!PREEMPT_RT" is correct as it stands. Making SCHED_PROXY_EXEC meaningful
under PREEMPT_RT would mean teaching the RT mutex implementation to
maintain blocked_on, which is a separate piece of work and not something
I am proposing here.

Thanks for the review, and for the earlier round with Sebastian.

Quchaosheng

