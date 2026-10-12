Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94248B39D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809698; cv=none; b=dA0tOaRQqxYdNSN9w/pj2Y1KPeeS3hZC2yQ75fGtK7XPs6wjKzLNZaQnWvOsJmMa8amuKOGMkdnUGUa7yBkzA0TlRB1hYJnUNyPDQv5lxJcYPGG6G9mApmjA5t2ImMGb724tC4iWzqXASptK/3Jq4YnAm95hy5bxVuhEtCB2gXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809698; c=relaxed/simple;
	bh=hUacMIjrG/5XKywSifSJlhwT4/TXyu8FFU/RgZKUWWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVGqXXhW+vBwirD0qhImvuLOkR7qegEYR0B5iIiTNCrLZmwyMgDgoiTY/jvkQguwuzS28U6CgwW+bv/a2Ygd5+0ZmYx9ZCQh1YXZza9sF/2V9zclRj9PALslk1NSXFnN5YMNwwGuv4ti/4Wtwtms0f0ku31lFDc5XYs4QhFGgIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q71UaQ5e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q71UaQ5e"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e73611928so24345145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791809695; x=1792414495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T3Dn8fCU2BvPny/c5KSPlVlXRURCMzHNVV/6jsS8JIg=;
        b=Q71UaQ5ee7F4gXxH2NR8f/cKRPpkZSpCxX1VvgbJ/ql0+6/AyHq5RF2PbqqZl+1Pfz
         Q71cjEcjGDG6Np0zPi3mXp0sj+sm69mLplozmKDXX6MtwNqHwG72qdFSZBi+RjHPp9Xi
         DhMgrRRNPrKv1QOuVQ5BoJGg7hV4Sa0qM8k9nccQjQsJP5Rb9k+krLTKn13WcImO5suP
         T8he2MRTJ3S2zlbsrIAxOHxdn4p7GFS+qk2OsMaxKXhfoLEj7BbU56kdi/NieMDci4BR
         JeBqbgahLQLFbfiCHBzK4T1NI8pq7kv+MyguE/xI72x1td1QJf4QZkhY85kfIYGY8wrX
         a3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809695; x=1792414495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3Dn8fCU2BvPny/c5KSPlVlXRURCMzHNVV/6jsS8JIg=;
        b=zLjq63OicVgQcrntOSvCcBEUENP/ITdf4DtuBUiGz/88BVX+aeslAt9ORvJHyWbwZr
         9l2R7dgymyyuZraBi74FHNxw9yukYl2iMJEAmx0DMehN2WCTh9AWFK3sfZmlR/j8IcNf
         m/q4lOoEn6ogB1Ea2LDFy56a+kir+GP1RS5mQiRgwR4eWuXZe06/37jh5nTvMKfmgXGb
         MkBSSabJzx73BoCT2njZAOlzZpyCbLvhXUmYsx5DWzoyCp1MxPqtUa4+g8FhgZxfrXEo
         xAc8ePjwss9dtz5zjk6axxfU8wvofK0vOicPawczvpaGZ2nwkP2TvCWSvCNCHaMsjyqK
         FuYA==
X-Forwarded-Encrypted: i=1; AKwUvByARw88AjH0ROUWVTXLcCelNzXrCcHmfL4QdqVlMpxp8TzTy3RSjInTAA+Fd6dRDLISHi8AcdnfjKr0k/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhbpp6wOAi1bPkaX47MK8FSpDXk5nRR+wznSUmpxynFleBHRrF
	8KNmyGmYwY0Km/PnaiYZpEN9VZsCevDlkFo/Gi6JaHz1gzWd7EsAtTc0
X-Gm-Gg: AYBFou2kfAiR5viXWRe0H8aCEQHM0SyQlAQoO0uAOJDW6Fm9sjv7x9UKh4fIwct4oWm
	g7Snf5CaXIX+BaPc0y09Hal8pWw8XXTTBipDGLUnP5CIp+6hcDHikZog0XLUiehUwBHQH7RzHeB
	HtyKFYjUh30YUvqyoO8Qj+s69flJ2aRb50EsbC6pMInoIHT8xu0YMzSSPpViCEcr7b9f3fFjC0Z
	HXq1KEJXg89g20TuKd7+IEGooqflB8zxmDjQJwHhT1p+jaZ+ek2JtX6w4CnKaH24QJxwByflz+7
	c5XaOQcauv84JoZRmH83EBpBc82WIUaZaEs/kIq1yK5pyfmjujRra0qQysz0faTQE+Ui8MUvzJT
	vx9ql7ttXvrLgubpn7tteEJTOhMmKsDVHzL7OlqaFidG8HmEQWD4YvfAPYHs1m0fo5mE16JDYlD
	p5un+gzfDCNR8sZCRJAA5DWMoSAZHJrnRo9XMb/Igl7VcWUsJ5dZHG+QRLxbqBaHBiWcE+SX2tC
	Qgv27Udjw7kEXlIZCP9orEfXuRFYJuH16k=
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr160368105e9.0.1791809695318;
        Mon, 12 Oct 2026 05:54:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm399676705e9.6.2026.10.12.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:54:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:54:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner
 <brauner@kernel.org>, Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pid: document that do_each_pid_task() needs
 tasklist_lock
Message-ID: <20261012135454.4eda3fa8@pumpkin>
In-Reply-To: <asuaU8H_5MbO3-cW@redhat.com>
References: <asuaU8H_5MbO3-cW@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 16:16:51 +0200
Oleg Nesterov <oleg@redhat.com> wrote:

> do_each_pid_task() looks "obviously rcu-safe". This confuses people
> and we already have 2 buggy users: send_sigio() and send_sigurg().
> 
> The reasons why it is not are not obvious at all, add the comment.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  include/linux/pid.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/pid.h b/include/linux/pid.h
> index ddaef0bbc8ba..f5476d7140a3 100644
> --- a/include/linux/pid.h
> +++ b/include/linux/pid.h
> @@ -187,6 +187,15 @@ static inline pid_t pid_nr(struct pid *pid)
>  pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns);
>  pid_t pid_vnr(struct pid *pid);
>  
> +/*
> + * Needs tasklist_lock if type > PIDTYPE_TGID. A lockless reader can:

Think I'd be more explicit, so:
	... if type isn't PIDTYPE_PID or PIDTYPE_TGID.
David
 
> + *
> + * - race with a change_pid() that moves the task to another hlist,
> + *   and continue to scan the wrong list.
> + *
> + * - race with a copy_process() that adds a new task to the start of hlist,
> + *   and miss the new child.
> + */
>  #define do_each_pid_task(pid, type, task)				\
>  	do {								\
>  		if ((pid) != NULL)					\

