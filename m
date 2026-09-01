Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11C3BBFCD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291789; cv=none; b=banMaGp9zQjehMzdCxy6aGmwWxqrMgvgCTeNMx9chKkNknMwq5nj/unORY+zogEAKqlPtIOKKchPFrJpIityoceB8Uw/YaqWEOGsrzzxKyqUG3XhvwVgKqiiWGTSRnA0/O/6mr6nOXgESQ7UIu500ZZbuw+AgESLLQJ4MtiXRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291789; c=relaxed/simple;
	bh=76JHXEX2AU/IpGsXr0oEBjO+a7Axx5nmDDqBixsuIXs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HnKZ1CU2+OXKB34LsL8qLVTeHKcsvsj7ETBVjeSvVUfgxuMXJ34M4Ooigpm1yQYADWkwC1Kzi9TPh//b9nR+xuaq53gbuzJ3+5SZfWf7kOz6qxC/Jb+aZ+1DmmNJRtztYWKhEQGImg6SQtAnsVe6fHdwbdoPqmgONhIjSL/rya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPc87fvH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YafigSfw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPc87fvH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YafigSfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788291786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SjIdCA2FPdJkQ/Kw2HHmsaF2RDA/+DeHSFh5iDV0LQ=;
	b=GPc87fvHeeDW49dtpoDB+whPoU+/hOk/dISD6Q0ObI5e1dP81lDCS8CX6R90GRIpSBw7pM
	4N3kYN+SkI6xW1+m8ZGYgBdsG3O7KNQaVNluYpJd+U9w9rlyorNVPPiq6IpHCZ28ajoGZm
	Xr7pg5VTXhN0U55GFeLTJFxQsqZqQJc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-bZ6I7lpAMrSJNCrg1yiBBA-1; Tue, 01 Sept 2026 15:43:05 -0400
X-MC-Unique: bZ6I7lpAMrSJNCrg1yiBBA-1
X-Mimecast-MFC-AGG-ID: bZ6I7lpAMrSJNCrg1yiBBA_1788291784
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so4143211cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788291784; x=1788896584; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9SjIdCA2FPdJkQ/Kw2HHmsaF2RDA/+DeHSFh5iDV0LQ=;
        b=YafigSfwk55WCXOiw0ygsGKD2tO8LnlhqWa8ohSTv40CgJqqTPvZ6lwNNPOeRERvA9
         aDarQOAXCOmkQw/HMY9G1QAD3wyl/YCbPTClo/2Q5M2Rc44qcxRgH2o7rs/0rAE7QIYL
         5pSptg8SYbhcu2WlD1r0cuLZxSOhG3qI2JPUCeU/4aL9DN/8r/GX8fzgpHAEqQZ+vbGk
         5X0Yoog1g/B+JQrGl55G66+3jN6gMIGanURmsSvYdNA4rs4WZMZs5GHvGbWS6nEeJXsS
         yReSUJdCA2hLNxhIhG35Dt+FWrqaqwrQmdqrjlHwRTryeFfcBtl8vuu8vi+b55W9kyA9
         +ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291784; x=1788896584;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SjIdCA2FPdJkQ/Kw2HHmsaF2RDA/+DeHSFh5iDV0LQ=;
        b=o0fqRg+9lq1YbMXvDLwZKoNP+JR0e3AEuDRY+wDNxn8Qu+hCxlISmFP8C0uhrOxnnw
         B3lOo51OM81edMrM5nx3B2soz3smxivF6jz8zNGmmDcSU2fNoiquRmzsEYFBK+XVgNEX
         ZM55xia/aLqtF1Socl5CQd2nVnTxD8R4v9TMr1h9pBhJfIErt2PI3G3xANg5O3Py1mRu
         j5qmoxoblF/Uw5OF7EN844/nDhcfP18i41ydlQfgLfrqL3QIhxFf/69vFg0DwSkzoYEf
         JNrGDRYoEurkP8N4R7le0U2gzXAVgz0S2toFyWcuhk52SjJyuQAkfo+kNr33fAMSOs7u
         a9Aw==
X-Forwarded-Encrypted: i=1; AHgh+Ro287pYSxEOYpcsEhoXQTLpxlNC/CWVc6CnRs6SmDZd7qvddDxeQkAcZ93gxg+8Gs2ZNyVsWUHrFLOPtIw=@vger.kernel.org
X-Gm-Message-State: AFuF++kFzWM8RTh1iIG2egptQ46Jrj+LsnlO5qOn+TRkLotNC3GtogZd
	C+6gjKaYgiMYNZes1xYi1rBvuGWcoTzlWsqdajC8p+4D/CIS2UBQO8h8m3L56R9hFH2tB14CTQs
	6M38SX6Z7LP/RyBwdhRqA8X44wFxkGfZagx0GmvxY6jogxo/FN3+8DfEmis/PMeILdg==
X-Gm-Gg: AR+sD120e2LwHIGfP4wm77Pr5U6KRtIVO5GUQ+BVQZE6//rg/9GallCM0ftXiAsDfkz
	4NPEah2WDc7IT+NUAVSRpcCoVNhk650ctU0Lr1dweFJOlLniCViztKTcjjVXqzQQTunBegjEEpE
	SsboCOFN6wfvG+z7oUULl6GjTJZ1eAcICLRh5VDq+ukYHPYj82MG/fA+hOkYl/6ae8Hibk9GeBB
	vc2yRuf4fcxpMnot4lYnRqOE4NqDTOMz99m4WyOwpW1D1kGTt4K7xFhpkU/IBgYfjppuC3dhUVO
	j6g3FgD9OYs5tcCHybDJ4oBb83YFp8xXp8QL+cZj4/+r5n3hrxzDowpRWHtwekxONKzDCzHL
X-Received: by 2002:a05:622a:2d5:b0:51b:f857:cf82 with SMTP id d75a77b69052e-530341b9aeemr9798031cf.8.1788291784387;
        Tue, 01 Sep 2026 12:43:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2d5:b0:51b:f857:cf82 with SMTP id d75a77b69052e-530341b9aeemr9797281cf.8.1788291783790;
        Tue, 01 Sep 2026 12:43:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eee7f12sm1264426d6.39.2026.09.01.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:43:03 -0700 (PDT)
Message-ID: <2d4fde433e0982eb2595e6f08a7a181ad98d9291.camel@redhat.com>
Subject: Re: [PATCH v2] interrupt: Disable interrupt before modifying
 hardirq_disable counter
From: lyude@redhat.com
To: Boqun Feng <boqun@kernel.org>, tglx@kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>
Date: Tue, 01 Sep 2026 15:43:02 -0400
In-Reply-To: <20260829213412.14303-1-boqun@kernel.org>
References: <20260827181106.30090-1-boqun@kernel.org>
	 <20260829213412.14303-1-boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2026-08-29 at 14:34 -0700, Boqun Feng wrote:
> Currently a softirq may be pending longer then expected if the
> triggering interrupt happens in-between hardirq_disable_enter() and
> _local_interrupt_disable() in local_interrupt_disable():
>=20
> =C2=A0=C2=A0=C2=A0 local_interrupt_disable():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hardirq_disable_enter();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <interrupt>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __irq_exit_rcu():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // false because hardirq_disab=
le_count() is not 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (.. && !hardirq_disable_cou=
nt() && ..) {
> 	=C2=A0 invoke_softirq();
> 	}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _local_interrupt_disable();
>=20
> , it'll defer the softirq to the next interrupt which can be forever.
>=20
> The order between hardirq_disable_enter() and
> _local_interrupt_disable()
> is to optimize re-disabling interrupts if they are already disabled,
> but
> as 1) local_interrupt_disable() is not widely used yet and 2) the
> proper
> way to achieve this optimization may need fixing up the counter at
> entry/exit time [1], so reverse the order for now to avoid the
> softirq
> pending issue.
>=20
> Because of this fix, the part of saving the current state is
> separated
> from irq disabling, and the logic of local_interrupt_disable()
> becomes:
>=20
> =C2=A0=C2=A0=C2=A0 local_irq_save(flags);
> =C2=A0=C2=A0=C2=A0 if (counter++ =3D=3D 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu(local_interrupt_disable_state) =
=3D flags;
> =C2=A0=C2=A0=C2=A0 }
>=20
> Therefore change the helper function _local_interrupt_disable() to
> _local_interrupt_save_state() which only saves the current irqflags
> (when interrupts get disabled the first time).
>=20
> Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/=C2=A0[1]
> Reported-by: Thomas Gleixner <tglx@kernel.org>
> Closes: https://lore.kernel.org/lkml/87jypbfu1t.ffs@fw13/
> Fixes: e901c1510e24 ("irq,spin_lock: Add counted interrupt
> disabling/enabling")
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
> v1 -> v2:
>=20
> * Use imperative mood in the last paragraph of the change log.
> * Add "Closes" tag to the email of the explanation of the issue.
> * Apply the RoB tag from Bradley Morgan
>=20
> =C2=A0include/linux/interrupt_rc.h | 19 ++++++++-----------
> =C2=A0kernel/softirq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 17 ++++-------------
> =C2=A02 files changed, 12 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/linux/interrupt_rc.h
> b/include/linux/interrupt_rc.h
> index b9a7f05ecf42..e68e1bedba66 100644
> --- a/include/linux/interrupt_rc.h
> +++ b/include/linux/interrupt_rc.h
> @@ -20,11 +20,8 @@
> =C2=A0/* Per-CPU interrupt disabling state for
> local_interrupt_{disable,enable}(). */
> =C2=A0DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> =C2=A0
> -static __always_inline void __local_interrupt_disable(void)
> +static __always_inline void __local_interrupt_save_state(unsigned
> long flags)
> =C2=A0{
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
> =C2=A0	raw_cpu_write(local_interrupt_disable_state, flags);
> =C2=A0}
> =C2=A0
> @@ -36,9 +33,9 @@ static __always_inline void
> __local_interrupt_enable(void)
> =C2=A0}
> =C2=A0
> =C2=A0#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
> -static __always_inline void _local_interrupt_disable(void)
> +static __always_inline void _local_interrupt_save_state(unsigned
> long flags)
> =C2=A0{
> -	__local_interrupt_disable();
> +	__local_interrupt_save_state(flags);
> =C2=A0}
> =C2=A0
> =C2=A0static __always_inline void _local_interrupt_enable(void)
> @@ -46,27 +43,27 @@ static __always_inline void
> _local_interrupt_enable(void)
> =C2=A0	__local_interrupt_enable();
> =C2=A0}
> =C2=A0#else
> -extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_save_state(unsigned long flags);
> =C2=A0extern void _local_interrupt_enable(void);
> =C2=A0#endif
> =C2=A0
> =C2=A0#else /* !MODULE */
> -extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_save_state(unsigned long flags);
> =C2=A0extern void _local_interrupt_enable(void);
> =C2=A0#endif /* !MODULE */
> =C2=A0
> =C2=A0static inline void local_interrupt_disable(void)
> =C2=A0{
> =C2=A0	int new_count;
> +	unsigned long flags;
> =C2=A0
> =C2=A0	WARN_ON_ONCE(in_nmi());
> =C2=A0
> +	local_irq_save(flags);
> =C2=A0	new_count =3D hardirq_disable_enter();
> =C2=A0
> -	/* Interrupts can happen here, but it's OK, see
> __irq_exit_rcu(). */
> -
> =C2=A0	if ((new_count & HARDIRQ_DISABLE_MASK) =3D=3D
> HARDIRQ_DISABLE_OFFSET)
> -		_local_interrupt_disable();
> +		_local_interrupt_save_state(flags);
> =C2=A0}
> =C2=A0
> =C2=A0static inline void local_interrupt_enable(void)
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 7980a4a232f9..5d02c36c40e3 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -91,11 +91,11 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
> =C2=A0
> =C2=A0DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> =C2=A0
> -void _local_interrupt_disable(void)
> +void _local_interrupt_save_state(unsigned long flags)
> =C2=A0{
> -	__local_interrupt_disable();
> +	__local_interrupt_save_state(flags);
> =C2=A0}
> -EXPORT_SYMBOL(_local_interrupt_disable);
> +EXPORT_SYMBOL(_local_interrupt_save_state);
> =C2=A0
> =C2=A0void _local_interrupt_enable(void)
> =C2=A0{
> @@ -749,16 +749,7 @@ static inline void __irq_exit_rcu(void)
> =C2=A0#endif
> =C2=A0	account_hardirq_exit(current);
> =C2=A0	preempt_count_sub(HARDIRQ_OFFSET);
> -	/*
> -	 * Interrupts may happen between hardirq_disable_enter() and
> -	 * local_irq_save() in local_interrupt_disable(), if
> irq_exit() invokes
> -	 * softirq here, we may have a softirq handler calling
> -	 * local_interrupt_disable() but it won't disable the IRQ
> because
> -	 * hardirq disabling count is already 1, hence we need to
> prevent
> -	 * invoking softirq when a local_interrupt_disable() is
> ongoing.
> -	 */
> -	if (!in_interrupt() && !hardirq_disable_count() &&
> -	=C2=A0=C2=A0=C2=A0 local_softirq_pending()) {
> +	if (!in_interrupt() && local_softirq_pending()) {
> =C2=A0		/*
> =C2=A0		 * If we left hrtimers unarmed, make sure to arm
> them now,
> =C2=A0		 * before enabling interrupts to run softirq.

