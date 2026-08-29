Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA335C696
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043858; cv=pass; b=GfEQ9+NlQM0f3mYLRxXSD5SM0iSbTbnQ7bU33PIYlTDIt1sc/lg5RPNDjo33WaCH++Q69Bhv0nLq+0MVJ2dHRezj7yXj7RiToc8Fx3ujcDpGR4+sf6geUccaXI18NfUmffQAWAb9U+1zXcaplQUBtiDqVxidt0Iflb8FaOyID4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043858; c=relaxed/simple;
	bh=u0FLgPS3MGGbv5rhOx4vCsbPcUiubhLTeuH/gwMv+U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dy3Crdk3icAvLOy0QSXrT0wR8mEX1ztJ6rznvay8ZZZfP7yORfosiMO20UySLq6X4MRfVDh2mf4dwo9RZhdnCYY6O2XfUi/M8qiDhiZh0+0P/HAui2VAA2k8sQD0ibMpmeWSgY0muvNtkz6c9jVk8AsN4QDA+XhdWex+3J88QHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gWJeZM/B; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gWJeZM/B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252c7270faso399722566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788043854; cv=none;
        d=google.com; s=arc-20260327;
        b=shfGuNNGPHGuBEeM6CiXuwC3bKyGmSEMk4le8ujnxZNhc+pJCyzIIDnV6yt9TSSSmQ
         AT7n6bO6kNBMgmkWWkdPGh5Js8MDcxtbfBA03RBqgaghW3mf0xBk4qfeIu6m95D4ic/1
         Q+FhfTcClcNccVXcs1BvB7ETe6Zr62iB5SCF9qGEM0goA0WzNE8KqkEEFP8dEwwZwTfK
         UaNezAAnH0SOB1YVSmnTZF5clzMJgWJwsoRtBRw73fgRGuB5SdXYqN9f6PAFbXam5oeN
         4ejauVWq97BQ+xW92jmyziaEAb8zj7Se93Buh4xM03vp0iYING5KhmOpbhLfEWoYINSt
         5Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/eu5xQer5dyMqr1ChCNx1AV3xiay7w/H3tpukAqpy1U=;
        fh=ZGzyEGO5HW9zTaxiMu+YTDqDVwyYBP4hRZrnidnA+I0=;
        b=Gpa9QSvYI8YsGg+hIJVCqdOkAJczokxyHh5ZvDaybiX6D5JrwDg1b1kmaGfsPMqwbZ
         Cqc/KdTnLEvlHPSKV/beiYuP6fBne7OQxl6VSc8qWcYQSB4tcL3Tbc/FvMCltYfkMCk8
         9UKqK+Vlsg49tf9e3ZEPQWsdNWWEO6yuNWT/uBXVCekd0GOEAlhXHNpN1r3Csyarhudq
         S1yXTwA7itc612J3ZnWhTCOFkYIHhLlaM3HRjRsyMH0qneK4TX62SW86vKtXudpdAJfa
         rRWmHJdozzgC5f8FZWJOyzr/n/ZXjB+vIJXijosgZCo3BmgKdzyhZIo6m0jJ2HsMTUD4
         JckA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788043854; x=1788648654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eu5xQer5dyMqr1ChCNx1AV3xiay7w/H3tpukAqpy1U=;
        b=gWJeZM/BLV21ULQVbFP33EAj2Z3EVTXn7dXbFUIQjFlfKebIX5vaqZvyY2mckkgvX5
         1Xs1KBQGnSPm3vCbEAfsylo8aIdn8WM0IEoRkvi9SDBVA0FubimucaFjne13Kw1wnF8W
         d8MXmTT/S1QbeGloNS27I5+EKGxIYQ1UxHQ8+72d0qgVPeqpz9UStl4qK+oxWlWGZ29E
         oXlCcL+Ofm+mrNDX59GPd7qRgXwHA2UI2htmxFZxVdFRECrwyc/uXMxVfOnaosma+0cU
         OleJzw5aWnBdNqNi5ri2eWSP6QkvTniyP5XiSCIWHDRiRPnvEqFU66Dcb1jNVvEnidtW
         IvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788043854; x=1788648654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/eu5xQer5dyMqr1ChCNx1AV3xiay7w/H3tpukAqpy1U=;
        b=RD5ZEoiY7kTeF2NlIr1P6Nt6Gt01C6g8hnZQ0PgBTSdCfoJECEoMsm2llBTn0Tdagg
         2TORHv5tCkeyR9gy1B4gqG0E0ceD2XIh0Z+mkeQpL5cJ9owm+JAZGwGk2JsK4XVynkg8
         k7cRavee6SMhnPi8w5LYRBmYgNQo+lLIahzZF1ozJX55tOBVYKPXkhP84no/qqL0gJuX
         tGs8LEzkXA8u8Pi21BKMsVVQpN55qsa0XNYVp+/jK0SjDak6CooG/NV0L0rP8eCx6ll7
         HdTFng4pCakAgLbQqr8lmUxMzOYOpewyELrTOaq1WJqhtiFTjOsLa58ZhXNa0ICBBk2X
         BM+w==
X-Forwarded-Encrypted: i=1; AHgh+RpH5hZP8PnXcftiLsIouuDzQfJgLf5OrBZMzAqgCn0BjXAEkjfPHmOEUv6wWmmP9r+JllYUhzTpgpOSGTs=@vger.kernel.org
X-Gm-Message-State: AFuF++l6MS4Ouudue8CoEc0oLj3iUD9sETsI0IBAoNhhTWk/Mmbu2zJV
	5cM6Np9LcSEci4igBk9tFAR1szO58fIsLM6BnUSzURnLY3LLcBDI0EfPPdhi59niOJH3ei53BA+
	IPI1AkkaK86m8o74/6HvWFMp202WkPdwiLINd9xO5
X-Gm-Gg: AR+sD10yxwXs0UYccEglQK5nLM8g1ibx+O+/Y5uVr7WmmvkMA9El2eEMLnbAwxmZ56z
	JyGcHpcHJOnkr/PU7s69+D9iNZKoo/giIUPevZ7cmxk6hIOIofXS3Ksbqw/1rbb+a2oFnpssn/X
	p5vzEByTybtBbhUDLqCSKoe7nVXT9JTZ84OCLtiQZsUhoqNu4gPQFwzQt4MeGGu7rDAWedSmM4P
	8EDHhHet/PNjQwtxoFd2Sn9oz0HxQWcx5mI3dK9aWYyBQteqGFQJgIDja2F4DVmAh//SWNdNE4C
	7/ieO9MdsJrKJpCEMt1yaKCHHOvx+vfrcdNB2hLRax/h8duByH1ayv4S7TI59rXauieltidq2WT
	7qVQP3ol+9zWcfb5xARPhNzLPbV9hWVG1mqUEcBjtoyA=
X-Received: by 2002:a17:907:9b8c:b0:c21:752f:c3f7 with SMTP id
 a640c23a62f3a-c255715b98cmr1193742666b.18.1788043853602; Sat, 29 Aug 2026
 15:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828153349.8061-1-odion@efficios.com> <20260828153349.8061-5-odion@efficios.com>
In-Reply-To: <20260828153349.8061-5-odion@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 30 Aug 2026 00:50:40 +0200
X-Gm-Features: AcwNN1VduBQkkIjwdGErmnJT4ZWu0ZaKexpijgX5AVHaiG7hB85zc1P0Wz66mME
Message-ID: <CACT4Y+ZbJShJeFiD=FRHTCouoY-9AcQCeDmB8pEKgZe4zKPNzA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] rseq: register and unregister operations via prctl
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
> Implement the PR_RSEQ_OP prctl. Registration splices a user-provided
> pristine node into the head of the circular operation list, and
> unregistration unsplices it after validating it is properly linked
> between its neighbours; the kernel owns the node's next/prev links for
> the lifetime of the registration. The 0<->1 nr_ops transition reflects
> the enabled state into rseq_event::rseq_op and the user visible flag via
> rseq_op_update_enabled().
>
> Initialize the operation list sentinel as an empty self-pointing circular
> list on rseq registration, and reset nr_ops / rseq_op state there.
>
> Apply pending operations on the slow path and on signal delivery, and
> factor the common "clear error and force SIGSEGV" fixup into
> force_fault().
>
> Signed-off-by: Olivier Dion <odion@efficios.com>
> ---
>  kernel/rseq.c | 220 +++++++++++++++++++++++++++++++++++++++++++++++---
>  kernel/sys.c  |   5 ++
>  2 files changed, 212 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index e75e3a5e312c..a277c11dae99 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -253,17 +253,18 @@ static bool rseq_handle_cs(struct task_struct *t, struct pt_regs *regs)
>  static void rseq_slowpath_update_usr(struct pt_regs *regs)
>  {
>         /*
> -        * Preserve has_rseq and user_irq state. The generic entry code clears
> -        * user_irq on the way out, the non-generic entry architectures are not
> -        * setting user_irq.
> +        * Preserve has_rseq, rseq_op and user_irq state. The generic entry
> +        * code clears user_irq on the way out, the non-generic entry
> +        * architectures are not setting user_irq.
>          */
>         const struct rseq_event evt_mask = {
>                 .has_rseq       = RSEQ_HAS_RSEQ_VERSION_MASK,
> +               .rseq_op        = true,
>                 .user_irq       = true,
>         };
>         struct task_struct *t = current;
>         struct rseq_ids ids;
> -       bool event;
> +       bool event, should_fault = false;
>
>         if (unlikely(t->flags & PF_EXITING))
>                 return;
> @@ -300,7 +301,12 @@ static void rseq_slowpath_update_usr(struct pt_regs *regs)
>
>         ids.node_id = cpu_to_node(ids.cpu_id);
>
> -       if (unlikely(!rseq_update_usr(t, regs, &ids))) {
> +       if (unlikely(!rseq_update_usr(t, regs, &ids)))
> +               should_fault = true;
> +       else if (t->rseq.event.rseq_op && unlikely(!rseq_apply_ops(t)))
> +               should_fault = true;
> +
> +       if (should_fault) {
>                 /*
>                  * Clear the errors just in case this might survive magically, but
>                  * leave the rest intact.
> @@ -329,8 +335,20 @@ void __rseq_handle_slowpath(struct pt_regs *regs)
>         rseq_slowpath_update_usr(regs);
>  }
>
> +static inline void force_fault(int sig)
> +{
> +       /*
> +        * Clear the errors just in case this might survive magically, but leave
> +        * the rest intact.
> +        */
> +       current->rseq.event.error = 0;
> +       force_sigsegv(sig);
> +}
> +
>  void __rseq_signal_deliver(int sig, struct pt_regs *regs)
>  {
> +       bool should_fault = false;
> +
>         rseq_stat_inc(rseq_stats.signal);
>
>         /*
> @@ -339,14 +357,13 @@ void __rseq_signal_deliver(int sig, struct pt_regs *regs)
>          * the interrupted context as after this point the instruction
>          * pointer in @regs points to the signal handler.
>          */
> -       if (unlikely(!rseq_handle_cs(current, regs))) {
> -               /*
> -                * Clear the errors just in case this might survive
> -                * magically, but leave the rest intact.
> -                */
> -               current->rseq.event.error = 0;
> -               force_sigsegv(sig);
> -       }
> +       if (unlikely(!rseq_handle_cs(current, regs)))
> +               should_fault = true;
> +       else if (current->rseq.event.rseq_op && unlikely(!rseq_apply_ops(current)))

Just to make sure: membarrier delivered to a task will also trigger
rseq_apply_ops, right?

> +               should_fault = true;
> +
> +       if (should_fault)
> +               force_fault(sig);
>
>         /*
>          * In legacy mode, force the update of IDs before returning to user
> @@ -436,6 +453,8 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
>                                 rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
>                 }
>         }
> +       if (version > 1)
> +               rseqfl |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
>
>         scoped_user_write_access(rseq, efault) {
>                 /*
> @@ -458,8 +477,16 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
>                  * registrations.
>                  */
>                 if (version > 1) {
> +                       u64 sentinel = (u64)&rseq->rseq_op_list;
> +
>                         if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION))
>                                 unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
> +                       /*
> +                        * Initialize the rseq operation list sentinel as an
> +                        * empty circular doubly-linked list pointing to itself.
> +                        */
> +                       unsafe_put_user(sentinel, &rseq->rseq_op_list.next, efault);
> +                       unsafe_put_user(sentinel, &rseq->rseq_op_list.prev, efault);

Is there always enough space to write these? Can this corrupt program memory?


>                 }
>         }
>
> @@ -474,6 +501,12 @@ static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u3
>  #ifdef CONFIG_RSEQ_SLICE_EXTENSION
>         current->rseq.slice.state.enabled = !!(rseqfl & RSEQ_CS_FLAG_SLICE_EXT_ENABLED);
>  #endif
> +       /*
> +        * A fresh registration starts with no operations, so operation
> +        * processing is disabled until the first one is registered.
> +        */
> +       current->rseq.event.rseq_op = false;
> +       current->rseq.nr_ops = 0;
>
>         /*
>          * Ensure the cpu_id_start and cpu_id fields are updated before
> @@ -887,3 +920,164 @@ device_initcall(rseq_slice_init);
>  #else
>  static void rseq_slice_ext_init(struct dentry *root_dir) { }
>  #endif /* CONFIG_RSEQ_SLICE_EXTENSION */
> +
> +/*
> + * Reflect the operation enabled state into the user visible flags field.
> + * Called on the 0<->1 transition of nr_ops. The kill path is taken on fault
> + * because losing this update leaves user space and kernel state inconsistent.
> + */
> +static int rseq_op_update_enabled(struct task_struct *t, bool enable)
> +{
> +       struct rseq __user *rseq = t->rseq.usrptr;
> +       u32 rflags;
> +
> +       if (get_user(rflags, &rseq->flags))
> +               return -EFAULT;
> +
> +       rflags &= ~RSEQ_CS_FLAG_RSEQ_OP_ENABLED;
> +       rflags |= RSEQ_CS_FLAG_RSEQ_OP_AVAILABLE;
> +       if (enable)
> +               rflags |= RSEQ_CS_FLAG_RSEQ_OP_ENABLED;
> +
> +       if (put_user(rflags, &rseq->flags))
> +               return -EFAULT;
> +
> +       t->rseq.event.rseq_op = enable;
> +       return 0;
> +}
> +
> +/*
> + * Register @node at the head of the circular doubly-linked operation list
> + * anchored by the kernel owned sentinel in struct rseq.
> + */
> +static int rseq_op_register(struct task_struct *t, struct rseq_op_node __user *node)
> +{
> +       struct rseq_op_node __user *sentinel = &t->rseq.usrptr->rseq_op_list;
> +       struct rseq_op_node __user *first;
> +       u64 next, prev, first_addr;
> +       u8 type, i;
> +
> +       if (t->rseq.nr_ops >= RSEQ_OP_LIST_LIMIT)
> +               return -ENOSPC;
> +
> +       if (!IS_ALIGNED((unsigned long)node, __alignof__(struct rseq_op_node)))
> +               return -EINVAL;
> +       if (!access_ok(node, sizeof(*node)))
> +               return -EFAULT;
> +
> +       /*
> +        * The node links are owned by the kernel. User space must present a
> +        * pristine node: next, prev and the reserved bytes all zeroed, and a
> +        * known operation type.
> +        */
> +       if (get_user(next, &node->next) || get_user(prev, &node->prev) ||
> +           get_user(type, &node->type))
> +               return -EFAULT;
> +       if (next || prev)
> +               return -EINVAL;
> +       if (type >= RSEQ_OP_NR)
> +               return -EINVAL;
> +       for (i = 1; i < sizeof(node->reserved); i++) {
> +               u8 r;
> +
> +               if (get_user(r, &node->reserved[i]))
> +                       return -EFAULT;
> +               if (r)
> +                       return -EINVAL;
> +       }
> +
> +       /* Splice the node in right after the sentinel. */
> +       if (get_user(first_addr, &sentinel->next))
> +               goto die;
> +       first = (struct rseq_op_node __user *)first_addr;
> +
> +       if (put_user((u64)(unsigned long)first, &node->next) ||
> +           put_user((u64)(unsigned long)sentinel, &node->prev) ||
> +           put_user((u64)(unsigned long)node, &first->prev) ||
> +           put_user((u64)(unsigned long)node, &sentinel->next))
> +               goto die;
> +
> +       t->rseq.nr_ops += 1;
> +
> +       if (t->rseq.nr_ops == 1)
> +               return rseq_op_update_enabled(t, true) ? -EFAULT : 0;
> +       return 0;
> +die:
> +       force_sig(SIGSEGV);
> +       return -EFAULT;
> +}
> +
> +/*
> + * Unregister @node from the operation list. The node links are validated
> + * against its neighbours to reject bogus or double unregistration.
> + */
> +static int rseq_op_unregister(struct task_struct *t, struct rseq_op_node __user *node)
> +{
> +       struct rseq_op_node __user *prev, *next;
> +       u64 prev_addr, next_addr, tmp;
> +
> +       if (!t->rseq.nr_ops)
> +               return -ENOENT;
> +
> +       if (!IS_ALIGNED((unsigned long)node, __alignof__(struct rseq_op_node)))
> +               return -EINVAL;
> +       if (!access_ok(node, sizeof(*node)))
> +               return -EFAULT;
> +
> +       if (get_user(next_addr, &node->next) || get_user(prev_addr, &node->prev))
> +               return -EFAULT;
> +       prev = (struct rseq_op_node __user *)prev_addr;
> +       next = (struct rseq_op_node __user *)next_addr;
> +
> +       /* A registered node always has both links set. */
> +       if (!prev || !next)
> +               return -EINVAL;
> +
> +       /* Verify the node is properly linked between its neighbours. */
> +       if (get_user(tmp, &prev->next))
> +               goto die;
> +       if (tmp != (u64)(unsigned long)node)
> +               return -EINVAL;
> +       if (get_user(tmp, &next->prev))
> +               goto die;
> +       if (tmp != (u64)(unsigned long)node)
> +               return -EINVAL;
> +
> +       /* Unsplice and clear the node links so it can be reused. */
> +       if (put_user(next_addr, &prev->next) ||
> +           put_user(prev_addr, &next->prev) ||
> +           put_user(0ULL, &node->next) ||
> +           put_user(0ULL, &node->prev))
> +               goto die;
> +
> +       t->rseq.nr_ops -= 1;
> +
> +       if (t->rseq.nr_ops == 0)
> +               return rseq_op_update_enabled(t, false) ? -EFAULT : 0;
> +       return 0;
> +die:
> +       force_sig(SIGSEGV);
> +       return -EFAULT;
> +}
> +
> +int rseq_op_prctl(unsigned long arg2, unsigned long arg3)
> +{
> +       struct rseq_op_node __user *node = (struct rseq_op_node __user *)arg3;
> +       struct task_struct *t = current;
> +
> +       if (!t->rseq.usrptr)
> +               return -ENXIO;
> +       if (!rseq_v2(t))
> +               return -ENOTSUPP;
> +       if (!node)
> +               return -EINVAL;
> +
> +       switch (arg2) {
> +       case PR_RSEQ_OP_REGISTER:
> +               return rseq_op_register(t, node);
> +       case PR_RSEQ_OP_UNREGISTER:
> +               return rseq_op_unregister(t, node);
> +       default:
> +               return -EINVAL;
> +       }
> +}
> diff --git a/kernel/sys.c b/kernel/sys.c
> index df69bd71de03..494c91b03c3f 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2889,6 +2889,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>                         return -EINVAL;
>                 error = rseq_slice_extension_prctl(arg2, arg3);
>                 break;
> +       case PR_RSEQ_OP:
> +               if (arg4 || arg5)
> +                       return -EINVAL;
> +               error = rseq_op_prctl(arg2, arg3);
> +               break;
>         case PR_GET_CFI:
>                 if (arg2 != PR_CFI_BRANCH_LANDING_PADS)
>                         return -EINVAL;
> --
> 2.54.0
>
