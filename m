Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285F4EE84D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539078; cv=none; b=cJV+vXP6lRq4xoxq62aEDMGtSFhDkr5/1+ke4x5LxvZMyDK/s9SP4RpmKpSWjVjSzqloavFUW8xsBFgk2Eufhs9V8QbEDNovoM8iDWlqkz7lmSEOKeIUOeQy3fxYX4cKVw0s2eA4pIVKqLsSIHUwOcJJxT0RT6CoPNMAVJ7Lqaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539078; c=relaxed/simple;
	bh=jzg5fo1gm9O5grgWkNzk82QwUT/s5qXEwN59hnQjBnc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUA7vNSO52Nz/bLSRvyvNnmxnouVuDdte7IKviSyTq16f4dbd0jXFRblZgSIYvh6OUI+SMWXTpH0oaENcgRKvfOLa0e/YrzpoNqLUpv7PksGc4skG9Krla9xKzOjeQJu8NVBNKYcqQOIn2b69QftvOss7FU/0TBqPGWoMGulP3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=vaZftFJf; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="vaZftFJf"
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id DA2ED1A013B;
	Fri,  4 Sep 2026 16:24:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id D2F4031;
	Fri,  4 Sep 2026 16:24:30 +0000 (UTC)
Date: Fri, 4 Sep 2026 12:25:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver
 <elver@google.com>, Ye Liu <liuye@kylinos.cn>, Yi Tao
 <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>, Christian Brauner <brauner@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <20260904122536.1079b279@gandalf.local.home>
In-Reply-To: <20260904083001.553587-2-ye.liu@linux.dev>
References: <20260904083001.553587-1-ye.liu@linux.dev>
	<20260904083001.553587-2-ye.liu@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: phj8gw9y4r7hse95f7zdhq8f8gbhpghr
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: D2F4031
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+DgCb1jW/moBB4arwK5GlRDfn58cXQqc8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=+Ex9Rkg/KO6cLgnqSsw+Vjqk0fF9NzG4lVkIirwCvJA=; b=vaZftFJf8DlrJd4qbW6b0AYwvOOAvVfNtv6Ib+Y9UTdNwVNveOyxV+v/E8iHXSAQjwfnferHrJXsUdm9+JjJ+iCWd2XBzfk26hsF3nZedoqx2SaqBLJIqBBZ6waX2sBGNhD8DMnQE1jQ/VBokW3rLNfEZnH5fsOnuJeE2d2L4BQ=
X-HE-Tag: 1788539070-798385
X-HE-Meta: U2FsdGVkX1+yzuW6B1LZJmnrshWIJ3/Q+osE++aApAVu0kvBN60tkNOah7OouiyfZaBFuXS2funzoG3kKBYVEy5jS4g3DOIc0D/+AyHCBqYTViDy8fdSp7JKy3b8hySztpmbnd6DaDc78hQyOVkJ2TRBy6wJZILihUJmpOEDHfyhQN2gQqE9xHzj9tgzDDNz6szPsalbtAg/wNdLbCVjE9yAzc/YSOnE1HK8E1ddkhJJzLEnJPiufCs//Y2BMrCcX5inkgANTD80tybwZxBx9Y+rnwV5sp+ECkpFe7OU0oBP0DpCsnGHiGyVgIc27WbX

On Fri,  4 Sep 2026 16:29:53 +0800
Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Introduce for_each_process_rcu(), for_each_thread_rcu() and
> for_each_process_thread_rcu() macros that acquire the RCU read lock
> before the iteration starts and release it when the loop is left, so
> that the RCU read-side critical section is scoped to the loop body
> instead of an externally managed rcu_read_lock()/rcu_read_unlock()
> pair.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  include/linux/sched/signal.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index 584ae88b435e..fe0c41dc99a1 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -2,6 +2,7 @@
>  #ifndef _LINUX_SCHED_SIGNAL_H
>  #define _LINUX_SCHED_SIGNAL_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/rculist.h>
>  #include <linux/signal.h>
>  #include <linux/sched.h>
> @@ -663,6 +664,24 @@ extern bool current_is_single_threaded(void);
>  #define for_each_process_thread(p, t)	\
>  	for_each_process(p) for_each_thread(p, t)
>  
> +/*
> + * RCU-internal variants: automatically acquire and release the RCU read
> + * lock around the iteration.  Equivalent to scoped_guard(rcu) combined
> + * with the respective non-_rcu variant.
> + */
> +#define for_each_process_rcu(p) \
> +	scoped_guard(rcu) \
> +	for (p = &init_task ; (p = next_task(p)) != &init_task ; )
> +
> +#define for_each_thread_rcu(p, t) \
> +	scoped_guard(rcu) \
> +	__for_each_thread((p)->signal, t)
> +

I would rename it to: *_rculock()

as there are already *_rcu() list iterators that are used to be done within
an rcu locked region. Using just *_rcu() would make it confusing to know if
the rcu lock was taken or if the loop is expected to be locked within RCU.


> +/* Careful: this is a double loop, 'break' won't work as expected. */
> +#define for_each_process_thread_rcu(p, t) \
> +	scoped_guard(rcu) \
> +	for_each_process(p) for_each_thread(p, t)

I would not do this one. It is prone to bugs. As it is a double loop, the
way to "break" is to do a goto. That will be bug to have a goto jump out of
a scoped_guard().

-- Steve


> +
>  typedef int (*proc_visitor)(struct task_struct *p, void *data);
>  void walk_process_tree(struct task_struct *top, proc_visitor, void *);
>  

