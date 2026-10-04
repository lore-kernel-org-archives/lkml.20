Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FD21FF29
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791114684; cv=none; b=MRXpNChixOqLYxQpvPDxJmrZGn/M5pejYO29ncqTuYYmytgYOLAGFJ3w8AEGZBHq4ZeZNxeR/ZNi7zDqA/W9fAm3OL1VOwIBZ7S6tZ8bIOOXZjQBf36amjyN4hTIjsNzswdOhq6O5vibOCgaXV67b/1OEiM2Z07fQcWfKCrLxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791114684; c=relaxed/simple;
	bh=zkoEMMXTgNkY1ooDFjvy1chWQaRL2eOQmpiClCRAQm0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsYFnobsc7MF1A8XJtchTw/4HjFp5B+2dcfZuehCqE0gCxkz7AwhC7SxVGsYjM3+Z+7GS2OhC3HzYIoML9R621TEeo0INqpno8lWlhJlnuCB2FmfeNNJxbJ67UOgQsBVGHzfstrCEUJYKYfPG1UhKJ4JdovKI7aZj+xPAqt987U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MP0tiU3r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MP0tiU3r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10806015e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791114681; x=1791719481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yqh8LUxzzpa1HYsVx6sjKglE359Jnvg6AJY3o+3mto=;
        b=MP0tiU3rvIH/AZ9wdaaWQq54O63p1HG7qy0vRqQ/NDus5HVBcdF1zcwjWniLzIpxcB
         tToV/F1Nc+R7lEQm57tyiLI3xsLBBK5pKfeduMD6yXZvCc3R0QvbuviV8Qelca582yqZ
         t+zNIUHa1TNK1uU9wO0ICB29JfeFaycPrj5nbR+PoVVKxZIcGy7q0Cg0b/uuoIhl8YRR
         0kn1Qj6uG/0aqXOdTcKJds6TZQPBM5RLJ71q9iP8D+3T5NcHLDn2OSSVjTA/Z2tYTPkZ
         LizVFOX5ZJMxPmF4aTamxq/nz8deRSHiWbYCcWBKslbz+C6Ot7IwbbFKKUT2YrNxf26N
         4paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791114681; x=1791719481;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yqh8LUxzzpa1HYsVx6sjKglE359Jnvg6AJY3o+3mto=;
        b=Vxu1dTGLJYRV8e+3bbxxxYrjIE7pJ7obeJSnhBsoki6vkEzj1PRU+ZeVhqEt7lV0nX
         aemY1lkBlE2sZwxwOOb9gvtpZjXOevquf4+DZtYpBlxeEN3Bwz1lyD08objkGbG1Bwjx
         9KowrFQDgsVe9U3ObIzOSpjl7/rGKLa4GuqLavA/KfmJR1/7C9VHU3Ofv/uKjUKQiKxg
         F3uw9UDeo0Q5tHwVFX/wPhU32FXwy5NjZMl1dWChX54CoxbJThOY6C4/rcociOb1bhNe
         OLo1ogHYGjysZyxGqd92vFoD60OHq4Ss9Ea4IQjUbB/opmYmsjGJePFtJ3plnnvjb+B4
         e08g==
X-Forwarded-Encrypted: i=1; AKwUvBzqQxMownDxaprgAdV65nYOmOyGfm5kYauNh8omZkQNOmR1Ut2nJuKvZJn51641ukGix83ERP8uPNdHaOo=@vger.kernel.org
X-Gm-Message-State: AFuF++m5ryyBPUgiIj/IouegTqXCJ3FAKVLGPJHDyFk0W6nIlWs+SjzE
	BDRSMK4qiUb3xoYPupTqx73qch5gaMGfWsPYu08UzaAeq8sWeXyXgCxhEeMcCkNE
X-Gm-Gg: AYBFou0A8OnIP7kScsVoUVJDwoHLFLMRrMN60Z/T4/1TRoyMBc3f+FfQLw6BPTqhbZ0
	SmIqU7XlJymRo8E1OMFqA3z0ISCqg1H4ZD0k69VP9FNCqsiQJZp9/+O5F/r1hSwkmei1kD8eCz5
	879lxj0RoLEFExdC8x4Ku8AjLYQnjlYpQpkl+lu4xf/NK2EGmBVTYRDFlTdftIxDv451QzJTYob
	MAlHuBiRIl1NVgN8/3BRlhexJJQkHNauwsIgUFzkZMEk8s6wnLt48uVXFA8UREdAzQQ0qYy7swn
	/IW5c1gKVB5LXP7xFbLIZTMKHTJUS2xO+ymRlxUOon4XpVM2Q0x1lLw+g6+v6k7SLV9G6qNk+Zi
	/tKNtyHF3CdF6u03qO/r81QWOW2FJ/vIcl+nqe6OPXvZQqpEWizewoiWRVFPLJ1eJBVbStH+xuo
	SIaqyeR1KW0B/K8b9ywsX5/T9NKNmyVv8rlUQKF/TrDXgJVjHk0MEWdHY+sCuzwyY4lAtZ02KPh
	qDD+kUoviCN0AMCRLEjqcUZ1ilUEBRIp8t+
X-Received: by 2002:a05:600c:4705:b0:4a0:1c16:d6f6 with SMTP id 5b1f17b1804b1-4a1680ffe47mr71128365e9.24.1791114680803;
        Sun, 04 Oct 2026 04:51:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm343384425e9.11.2026.10.04.04.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:51:20 -0700 (PDT)
Date: Sun, 4 Oct 2026 12:51:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>, Christian Brauner
 <brauner@kernel.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <20261004125118.7de53b47@pumpkin>
In-Reply-To: <asIwpkNr9bF6gk6Q@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
	<20261003182224.2171b574@pumpkin>
	<asIwpkNr9bF6gk6Q@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Oct 2026 12:55:34 +0200
Oleg Nesterov <oleg@redhat.com> wrote:

> On 10/03, David Laight wrote:
> >
> > On Fri,  2 Oct 2026 01:21:41 +0000
> > Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
> >  
> > > KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
> > > under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
> > > WRITE_ONCE() are enough.  
> >
> > I just looked at change_pid() - isn't it completely broken?  
> 
> No, but...
> 
> > __change_pid() uses hlist_del_rcu() to remove the item from a list.
> > IIUC this leaves the 'next' pointer valid to allow for concurrent readers.
> > I thought that had to stay valid until the end of the rcu period.
> > But the following attach_pid() adds the item to another list.  
> 
> Yep. That is why do_each_pid_task() needs tasklist_lock.
> 
> This is the known fact, let me quote the part of my old email
> https://lore.kernel.org/all/20200512150936.GA28621@redhat.com/
> 
> 	> Currently the tasklist_lock is shared mainly in order to observe
> 	> the list atomically for the PRIO_PGRP and PRIO_USER cases, as
> 	> the actual lookups are already rcu-safe,  
> 
> 	not really...
> 
> 	do_each_pid_task(PIDTYPE_PGID) can race with change_pid(PIDTYPE_PGID)
> 	which moves the task from one hlist to another. Yes, it is safe in
> 	that task_struct can't go away. But still this is not right because
> 	do_each_pid_task() can scan the wrong (2nd) hlist.
> 
> Somehow I thought this was documented, but it isn't. And this is not obvious.
> I think this deserves a comment above do_each_pid_task(), will send the patch.

I guess the rcu protection lets the task exit without holding the lock?
Is that really significant given the other things that happen during task exit.

Could do_each_pid_task() use hlist_nulls_for_each_entry_rcu() and rescan
if it got the wrong terminator.
Or does scanning twice cause grief as well.

David

> 
> Oleg.
> 

