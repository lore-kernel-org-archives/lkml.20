Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2364A0EFF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519804; cv=none; b=tGhAt/tQPRAddpKJqb7/3bKYZyi9DahbgEuOUHuF/U3W4XxEJbAs08V4KE8cz4ahi+hlqaVdag717X3k6BilDi5pAOFJpI7xDbReu6AQsXmOvVWwMwcGX6jhTjpiIugmuiMjpRYVLknUIN3N6vtKTniWSBLBthOMQoV6tpmi7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519804; c=relaxed/simple;
	bh=/YAx8MC10uzdTgsDitdwzw6jiSPZxT0069IctUl7Rb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KulnXg5L2o77FPTm2eyntka+gWC+7NGp2hY27xzvdWSZi8wayfqw7Tj/iJzMMS5rfeqWzSabqSGln5EX9qjACir/fgGwqY0AWrv/wechXnX83jGFBcJqN0gyYjBAYwlIEyrDOwQ8i/a5Mnq9bfjF5VKf+SKdq3WdDZhMccQvQ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TXuoX34j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TXuoX34j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8687630fso8066095e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788519800; x=1789124600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAzMXnghmszFTGloo//dFfYy6w4a4fM9ms+SI1CrG18=;
        b=TXuoX34jeKGK/2iXIkvFxyHZgpOeFsiff3tD6SrETvmAx0IjMmoXTzrYFosXL5vNmD
         hou2j7BiLqVoNVgjuRT2HB1qqipZtHsCEJMySHYCn9d4y035GPwxNexeYWLs1/bC/djP
         n+yH0Y6M7AVKUrxIsgNgOHb/XR1LVkR0ZN5QIZSvrRgmHwXO12+8pj7MEZfUBIxFJj4w
         9oynn3WTYzP8LqddN8KhoO5w7KCelxPm1juXQZkQiGiUpobz/6Yp8iTgFDSVrIJB359b
         ECQj8gxdDGAY5Z8MVsQ3TW2XnVa4RA3hiZKOjmp+wh1UBtmbA3GGWzIG+twzdyWdW2Ta
         NKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519800; x=1789124600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAzMXnghmszFTGloo//dFfYy6w4a4fM9ms+SI1CrG18=;
        b=ZPY/M+ha3lak/2BSPx+lwbB8DjEsf/OnTn/i+LDjzSWklq0xbtpen7dlkEbq3SwAwn
         mXQblB96gk0Ny4ieuvplBOWya8yFxG5N2ZKRYFP4WadcaW4gFrozFinwi5jAgsXQR4Z2
         DHOj14WQ4T4yWUzwoy3Jwov2Rc4PwWglgroeQUyevDGtMIgf8Qe31DAF/14i7ePS63Ah
         fuwt+PZe96YzxXaLd7rUKoT+YBdBPRFhZvZdltusZH/7nc3yvsmDvCVIv0kZQ1WGcl7P
         /2xES76mcrRgWlDappXm9dg31zYPDNmnD0+tRqFw0YNOchptEf3VsTTw7k8ehscpYSu6
         jlAA==
X-Forwarded-Encrypted: i=1; AKwUvBwCClE4+VuTkG70ZcNXa7aQhbEALR3UCqeZjXmhnPd2Il1BQgjYQFCmjf9NP16N8sCLNrBsHx+IaV8cTI4=@vger.kernel.org
X-Gm-Message-State: AFuF++myLHiWeZ5fQch9G2BYn0C/biSXJTEjhbwflDMROESzgHxNJiqO
	uIHiVeZYDbDMw/H7BPsvYaoI7GxvTr0OItYhYiHWbDPOAvEeaT0Iw+/oyXG3rCngeh4=
X-Gm-Gg: AYBFou2GnqILLu5UtinN2GY9M5iUvW809k1loZ6udtdReqxnJgXitHAGH3FUyw2G/1Y
	IG7I+GgboVtmv/RQ3NSevMLxlir3X3Je29mXvEluRUT2YXDtonbH9XaQRXvpDAAG1OydqtWSP03
	YPLwXKCs1G86ey81BWH/BLdZ1CUzs+04nLXjtxyoEjmxC4E4HpCkg2qWZG8Tl15hBIbwr5Gpt1t
	FhiuenorZDIBllW8nNoXino6CMjypETaF53x08767IvkbdQczW9yZ2603kY9YAA6vFcEus2Onn9
	WhgOoot1iGp2Bz2HG5ICPu+u4VmfXcPqcawqvoNgh2iZwo43pbAWETDCEZz+nNsXXgj4f849v5N
	VpFsoMWZaEe8AUSgYmbBgN53YnQ8Uojt0c/lIJSzD1rOcCng2ZrH/xiAPMZ+Z49WiuLFZWfCSfV
	CE+3xMsrN12+roFTmQ+XTWtWpR+bz5qLU5PPt/YEGe7TKX+WL/vDQ2YN9gWyaMevDz5ubr2qOZg
	w==
X-Received: by 2002:a05:600c:1c24:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49cf824894cmr51170215e9.8.1788519798302;
        Fri, 04 Sep 2026 04:03:18 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cc7sm64453115e9.4.2026.09.04.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:03:17 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:03:15 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Ye Liu <liuye@kylinos.cn>,
	Yi Tao <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <apqlcw1qJd3QjsMq@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-2-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-2-ye.liu@linux.dev>

You want to CC Oleg at least. Now added

Also prefixing this patch with mm is confusing as this has nothing to do
with mm.

On Fri 04-09-26 16:29:53, Ye Liu wrote:
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

Apparat from potential naming changes this makes a lot of sense to me.
Many users really need RCU in the scope of iteration and this simplifies
the code and it makes less prone to bugs.

I do not really care much about the naming TBH
Acked-by: Michal Hocko <mhocko@suse.com>
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
> +/* Careful: this is a double loop, 'break' won't work as expected. */
> +#define for_each_process_thread_rcu(p, t) \
> +	scoped_guard(rcu) \
> +	for_each_process(p) for_each_thread(p, t)
> +
>  typedef int (*proc_visitor)(struct task_struct *p, void *data);
>  void walk_process_tree(struct task_struct *top, proc_visitor, void *);
>  
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
