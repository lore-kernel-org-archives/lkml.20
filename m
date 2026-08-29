Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7769391E5F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043379; cv=pass; b=lwDGI6jhJDzH68vFElBwDwYKhKkeMmnNF2h0okI6bVvXkOpsV9n3seZGVflkaMoh38EaoTn/zK30SMW7+TFkVdKfvw+iUQiiMMaKbluTSdcCV2GEuRlfjWdPiiZqlrbOPJ2MT4FCmlC/nBS3T56+9l943lTS+ag1ZWHwDszI9l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043379; c=relaxed/simple;
	bh=P3VIKPzccwdE39eYG49Cwe9XMxUf6ZSMpHzmniXQ02w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWGxqE4gc+UWBQz8iqEzukhwjTwmn7fNmKbtgSSqMXOnLvYqbZwLcNPUWtZG9bGYlkF2bKtseaV1jlznVIRM+T5JqfvDjW5nGRuw+5yhOz8s6RnS9WKjiwNKfgBUX9KxQ9dcWzg3EfpW+XGT6RFd447BDQNVFuJNoq7CwiIc5Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C6wwDHyz; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6wwDHyz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so295543966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788043375; cv=none;
        d=google.com; s=arc-20260327;
        b=EVnJhHOc7qwRRJ2/Fati1oxzOndyYctPSHgynfzONXkPJKbopSclkU4qXdW2HijZAU
         DCUyyjcSU/HTPxfXTS4pdQ9WLkYuY5bQJuGoETQcyB8FVKF+g7RiRKSpBB+9/aWQ7wYy
         +uSVTjHDdn6wLWMJCnxFiKiuf9qlhBytWS7jVIOjkRLra5QGqqya6v9oKMWmedQpqQbe
         GesdEZvv4v9CiC/QGccWmXQMXiHhjiuD/95WUCQPAUX07NS86fspI2WJsr44LZ3k2SsH
         MgnSX6makS60iImdRptDEnM7Igm+gRxr6fZrqAmPTCPCYlJL7Lw/O7Spt7vLKwQJqVly
         2fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ot9meQ2x+XafL3in17NjfxNo+B7nr1dugooPYCpLqKo=;
        fh=QkbvmN4NJnHp2B4LhJK4hoxvN38lP9uAofmxHYdabFg=;
        b=e61hScVrWO4/glV79VAkybdd7ytXphrjWJtnCnXLYeYIhKYhFMJr5r1WjP1vLljj5l
         1nOJqHYnFVMm9dIcNB3vWg8RuvLPDfycppg8Xs4hE6aY5pfB+bO5SdSKyTlaHNNcVWEA
         O/8RYrSq5VQbNzhbd86gZ+gqjtzVOCEuUTiwdTuvy6yo4DuXOP3E6ot3kUxpu+m6ziy6
         4hmwhNKEuGbAJ+qx+M0uiUhCmtDXUMpxcfbkygjzP7VNIBOgW/YdZ78CjsEsVI8sm7Vx
         4JjbtuW2yMmynX74AGO2GRZAu88UcHMHmnGsZYs/qyNdWZIsKceJf4l4+XrEDpfIDb0H
         BPdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788043375; x=1788648175; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ot9meQ2x+XafL3in17NjfxNo+B7nr1dugooPYCpLqKo=;
        b=C6wwDHyzxAZ/Ixu5iIvfcJW5q5gyILXJQLJhtpj9Q9XiVSb8UDbUQRjAX7eZzDsUiI
         6LlsjF8Vd2qzT/ivMQBoP3RZrSATpTAfbTAT9SlVkicHfyeUthAtKGara6i1oUelI8TY
         A68TPhKIS9ERmzheuvNCFjEOoxFRvtInZMOCotxRMSw2yFhjHsFlnJ9JHUfEU9GZuES/
         1DwXbbQPb2f7R3dI9P2mWH4EeJGd3kb4wAWO/xT1npN7YcktJC7/8OPsx2X0XVGMgKLd
         GXL7ZX0hIsMoktkiC/6PHhUGfH9kNi/BV1G/rwWeSxKTH/BRO6PuU06aT/bGs7zq23Xr
         oHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788043375; x=1788648175;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ot9meQ2x+XafL3in17NjfxNo+B7nr1dugooPYCpLqKo=;
        b=IYBgk7rp3r2ewkWcXfE/PxFyCG7P82o05xAYUNnPH04r9Klj01G7A+IoWi5QHkO0mK
         wFbk5O25c9mbyPrkXOcf2ROBuprpkfafTZ2P0SOeBAm5nUMmlrY5JK1o+v489fF0IPLe
         SLb3mCPGQoOpvUdRUWuI5hoJlrXRwx/iHJlFeMWy9xxvNDdRbBw2hKvFkoeVLn9Jr2Ja
         C3jeG0VikHnHnz/ZcYeH9K+GSkCZOozWJC2IalqZJDmwkHJEJfoQHwDZNdwZca5iWQZr
         SU7wbFmbv0m/jIhzZgu/2uUIaJ3YMhJ0VrJxV/W9uZuaYC8DZ/YrdQcrNL29Bm1K3Y+W
         7JGg==
X-Forwarded-Encrypted: i=1; AHgh+RpdKLtkNmVNkj6trszc5nkBhZEUe3BcU+Ih0bnkpL8RWAZeQKuJt9FDkhu6TXZXx3yqdA6Ib/rqMbGMGT4=@vger.kernel.org
X-Gm-Message-State: AFuF++l5YedjtlQzkMumz1RhEAj2bj5mRXl8/6yU0py99l7gPXfI9Ejn
	knGpdKXQ5IRdBoHBgtlxIZCEqCgkMOb16P12VdEsy8DiY+BclMDl8e5IFQC3RTzpgcnu0dNOxBZ
	T49Rbk9ORv2+xh12tzV+nqGKqjKTppkDJ7oyZGRcP
X-Gm-Gg: AR+sD10IwpdxIdviOG1bKpXSHGYDGK989CNsilNrQcXVfDCkBUZfgr2dUrigZLefbat
	o/ck7gxLqmhmXs/MFNnRsA5VPEOwH6vSyN+U68N4fNqIiiFtnlyZT6W1xNM001SOuu8KBFsclkP
	D0Qy+5N2CwbF/GD/P+HasvhZLY8b7Zq2u4/q/HRoLDLOb5Ke8Ok2kQEwtKEqUAfSVwgW8N+wx8y
	a6BBxgJ/IShr+Gy2oQhYkCJ/xbATJDav6U/RT4W0QsGL3OY+rB9HKaYu/tHw1MMMyire0oEpOy6
	uxNd+kx89UxsgCM0SroQ5/92h3Mm8Y+B8g+ZpsHhBbpEtTbQfXSJKk2olS8rUDbghNP9lhuyphg
	3AKeOF3x+RJsbn5WkIftePCr4/pChLKw=
X-Received: by 2002:a17:907:3c85:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c255742216emr1125683666b.19.1788043374863; Sat, 29 Aug 2026
 15:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828153349.8061-1-odion@efficios.com> <20260828153349.8061-4-odion@efficios.com>
In-Reply-To: <20260828153349.8061-4-odion@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 30 Aug 2026 00:42:42 +0200
X-Gm-Features: AcwNN1X7LMPiNepjUnuMT4VMqp-CRgMuKZwXx01J3KtPOugYRb9tnQa7DBdcPDk
Message-ID: <CACT4Y+b7-U_R3rEN_J1R66+42oczKggUG88TEiqLuSkacCMdUA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] rseq: apply operations on exit to user space
To: odion@efficios.com
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	David Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, 
	Sean Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, 
	Florian Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, 
	Chris Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, 
	Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Carlos O'Donell" <codonell@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 17:34, <odion@efficios.com> wrote:
>
> From: Olivier Dion <odion@efficios.com>
>
> Add rseq_apply_ops(), which walks the task's circular operation list on
> return to user space and applies each operation.
>
> Wire the walk into rseq_exit_user_update() for both the ids-unchanged
> and ids-changed paths, gated on rseq_event::rseq_op. Since operation
> processing is a persistent per-task state rather than a one-shot event,
> introduce rseq_clear_one_shot_events() which preserves the rseq_op bit
> when clearing events on the way out.
>
> len, src and dst are re-read from user memory and re-validated on every
> application, since user space may change them after registration. A
> broken ABI contract will fault the process.
>
> Signed-off-by: Olivier Dion <odion@efficios.com>
> ---
>  include/linux/rseq_entry.h | 157 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 152 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index ed9da6e41a2a..df083b0ee14a 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -247,6 +247,137 @@ static __always_inline bool rseq_grant_slice_extension(unsigned long ti_work, un
>  #define rseq_slice_clear_user(rseq, efault) do { } while (0)
>  #endif /* !CONFIG_RSEQ_SLICE_EXTENSION */
>
> +/*
> + * Validate and perform a single reset word operation: reset @dst to *@src,
> + * or to zero when @src is 0. @len, @src and @dst come from user memory and
> + * are re-validated on every application, since user space may have changed
> + * them since registration. A broken ABI contract returns false, which faults
> + * the process.
> + */
> +static __always_inline bool rseq_op_reset_word(u64 src, u64 dst, u32 len,
> +                                              void __user *node)
> +{
> +       if (unlikely(!IS_ALIGNED(dst, len) || (src && !IS_ALIGNED(src, len)))) {
> +               pr_info_ratelimited("rseq: bad operation alignment len=%u src=%llx dst=%llx from %p\n",
> +                               len, src, dst, node);
> +               return false;
> +       }
> +
> +       switch (len) {
> +       case 4: {
> +               u32 __user *udst = (u32 __user *)dst;
> +               u32 v = 0;
> +
> +               if (src) {
> +                       u32 __user *usrc = (u32 __user *)src;
> +
> +                       scoped_user_read_access(usrc, efault)
> +                               unsafe_get_user(v, usrc, efault);
> +               }
> +               scoped_user_write_access(udst, efault)
> +                       unsafe_put_user(v, udst, efault);
> +               return true;
> +       }
> +       case 8: {
> +               u64 __user *udst = (u64 __user *)dst;
> +               u64 v = 0;
> +
> +               if (src) {
> +                       u64 __user *usrc = (u64 __user *)src;
> +
> +                       scoped_user_read_access(usrc, efault)
> +                               unsafe_get_user(v, usrc, efault);
> +               }
> +               scoped_user_write_access(udst, efault)
> +                       unsafe_put_user(v, udst, efault);
> +               return true;
> +       }
> +       default:
> +               pr_info("rseq: bad operation length=%u from %p\n", len, node);

pr_info_ratelimited here and below.
Kernel does not generally warn on the global console about misbehaving
userspace programs (which generally do not have access to the output
anyway, as it requires root nowadays).
If you decide to do that, it should be at least rate-limited to avoid DoS.


> +               return false;
> +       }
> +efault:
> +       pr_info("rseq: fault while applying operation from %p\n", node);
> +       return false;
> +}
> +
> +static __always_inline bool rseq_apply_ops(struct task_struct *t)
> +{
> +       struct rseq __user *rseq = t->rseq.usrptr;
> +       struct rseq_op_node __user *sentinel = &rseq->rseq_op_list;
> +       struct rseq_op_node __user *node;
> +       unsigned int limit = RSEQ_OP_LIST_LIMIT;
> +       u64 next;
> +
> +       WARN_ONCE(!t->rseq.event.rseq_op, "rseq operations not enabled");
> +
> +       scoped_user_read_access(sentinel, efault)
> +               unsafe_get_user(next, &sentinel->next, efault);
> +
> +       node = (struct rseq_op_node __user *)next;
> +
> +       while (node != sentinel && limit--) {
> +               u8 type;
> +
> +               scoped_user_read_access(node, efault) {
> +                       unsafe_get_user(type, &node->type, efault);
> +                       unsafe_get_user(next, &node->next, efault);
> +               }
> +
> +               switch (type) {
> +               case RSEQ_OP_RESET: {
> +                       struct rseq_op_reset __user *op =
> +                               (struct rseq_op_reset __user *)node;
> +                       u64 src, dst;
> +                       u32 len;
> +
> +                       scoped_user_read_access(op, efault) {
> +                               unsafe_get_user(src, &op->src, efault);
> +                               unsafe_get_user(dst, &op->dst, efault);
> +                               unsafe_get_user(len, &op->len, efault);
> +                       }
> +
> +                       if (!rseq_op_reset_word(src, dst, len, node))
> +                               return false;
> +                       break;
> +               }
> +               case RSEQ_OP_RESET_WITH_STRIDE_CPUID: /* fall through */
> +               case RSEQ_OP_RESET_WITH_STRIDE_MMCID: {
> +                       struct rseq_op_reset_with_stride __user *op =
> +                               (struct rseq_op_reset_with_stride __user *)node;
> +                       u64 src, dst, dst_stride;
> +                       u32 len, index;
> +
> +                       scoped_user_read_access(op, efault) {
> +                               unsafe_get_user(src, &op->src, efault);
> +                               unsafe_get_user(dst, &op->dst, efault);
> +                               unsafe_get_user(dst_stride, &op->dst_stride, efault);
> +                               unsafe_get_user(len, &op->len, efault);
> +                       }
> +                       index = (type == RSEQ_OP_RESET_WITH_STRIDE_CPUID) ?
> +                               t->rseq.ids.cpu_id : t->rseq.ids.mm_cid;
> +                       dst += dst_stride * index;
> +
> +                       if (!rseq_op_reset_word(src, dst, len, node))
> +                               return false;

Declaration of src/dst/len and rseq_op_reset_word call potentially can
be deduplicated across these 2 cases.

> +
> +                       break;
> +               }
> +               default:
> +                       pr_info("rseq: bad operation type=%u from %p\n",
> +                               type, node);
> +                       return false;
> +               }
> +
> +               node = (struct rseq_op_node __user *)next;
> +       }
> +
> +       return node == sentinel;
> +efault:
> +       pr_info("rseq: fault while walking operation list\n");
> +       return false;
> +}
> +
>  bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr);
>
>  static __always_inline void rseq_note_user_irq_entry(void)
> @@ -632,6 +763,10 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
>                         if (unlikely(!rseq_update_user_cs(t, regs, csaddr)))
>                                 return false;
>                 }
> +
> +               if (t->rseq.event.rseq_op && !rseq_apply_ops(t))
> +                       return false;
> +
>                 return true;
>         }
>
> @@ -642,11 +777,22 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
>                 .node_id = cpu_to_node(cpu),
>         };
>
> -       return rseq_update_usr(t, regs, &ids);
> +       if (!rseq_update_usr(t, regs, &ids))
> +               return false;
> +
> +       if (t->rseq.event.rseq_op && !rseq_apply_ops(t))
> +               return false;
> +
> +       return true;
>  efault:
>         return false;
>  }
>
> +static __always_inline void rseq_clear_one_shot_events(struct rseq_event *ev)
> +{
> +       ev->events &= (struct rseq_event){ .rseq_op = true }.events;
> +}
> +
>  static __always_inline bool __rseq_exit_to_user_mode_restart(struct pt_regs *regs)
>  {
>         struct task_struct *t = current;
> @@ -674,8 +820,9 @@ static __always_inline bool __rseq_exit_to_user_mode_restart(struct pt_regs *reg
>                 if (unlikely(!rseq_exit_user_update(regs, t)))
>                         return true;
>         }
> -       /* Clear state so next entry starts from a clean slate */
> -       t->rseq.event.events = 0;
> +       /* Clear one-shot events so next entry starts from a clean slate */
> +       rseq_clear_one_shot_events(&t->rseq.event);
> +
>         return false;
>  }
>
> @@ -730,7 +877,7 @@ static __always_inline void rseq_syscall_exit_to_user_mode(void)
>         /* Needed to remove the store for the !lockdep case */
>         if (IS_ENABLED(CONFIG_LOCKDEP)) {
>                 WARN_ON_ONCE(ev->sched_switch);
> -               ev->events = 0;
> +               rseq_clear_one_shot_events(ev);
>         }
>  }
>
> @@ -747,7 +894,7 @@ static __always_inline void rseq_irqentry_exit_to_user_mode(void)
>          * interrupt did not result in a schedule and therefore the
>          * rseq processing could not clear it.
>          */
> -       ev->events = 0;
> +       rseq_clear_one_shot_events(ev);
>  }
>
>  void __rseq_debug_syscall_return(struct pt_regs *regs);
> --
> 2.54.0
>
