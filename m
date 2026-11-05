Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793847331;
	b=2k2nJL1YeExxLS0LseHy6mXJLj9mJo60koOFN+70IUlbesJG4vPvN78Rs9wQBXRLYHeZ
	 PJbUY3bd0NTJbBsFFcvVrK7VXtWyXfCgb3rHiAzZu6cnREGiBJQticFp9ttFxCx060CQ2
	 eAVi4dR7XuCeLfkKn2ZDXgUS/ymIp/jl7AQ+aMwZuzCw9366uC5tU1bSt/acelxRdbgSk
	 gA1i9IIZ3K0BqHSAqPIAG21XJmbdDoAPmaLGb8r60ci7hh5PKr17QlTqQ5qrEqVmfRcnr
	 E2cv6kuDcd9AkLM1OeKpg3glpoWzVVOourVRUO/0bZP1syyWD2iPbQtnE2Fqz44g+jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jR7loNAHPL1UfcJr49MgWtfYGIhpgreosCIZ48GmVGQ=;
	b=RHtOBdPK2dT+KGIlwsK+xeLj0kKUPGyIdgRXqbbpYAeh/uKHqpb7tJcpnTfbOBL2hmK8
	 KdjwkPl74gryaApUYBzE9H5Z+8Oz6Aa0LyRMNoywforsR7G1x2eYfvaL3fHHI4+kDEOe2
	 LpUD1dwmhmwysanSGgVHxLCpnwNNfD/DZGuAacetiBusnCRXj+SGQgJ38JcMobYHVzWwH
	 nlW4Dy7OGBEpdCP/yWplpjZQogDREMGji741vI2csok02f1hTseZ+ss12UxQOFbs5ppP3
	 v0xCgcwnLTsDjuoEKLSrXyKqxSJx5Ag2wRh+mgAiZniSEFig2xdi2KCPEBL1IyitThw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCp1JIxC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9323E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCp1JIxC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11094675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793847329; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6cbgY0ddxVYTqIu2iSNkA4A6YjSHWpc/aIhwRh/xxx4a/XRDl9Az9AC/wufxxr1WM
         1ua5GX+nUQTwl9n3bBer0UT29SxknzSEAvTBr+e/oxawTaX5fL3yDcKe+mLfZagR6AHS
         Bys1YzQWFWTyK9hK18VI5fqyA6DjiOuILAgIAO03rJohAJb7zWLtU0iOJil4VNDdxvEt
         ZRYMOIUpb+PpH+NW2fwy/NZ8ss01upEhcGWyrQ3OdSAEG5q/nY5iJgTZyHVa5mXre+Rn
         D+ijj02GvfoGbqF0sr0biwH/hPuyieajQZq8QKskKi3cTY7f8hl69pJDBAmQ/wGfH0pp
         21YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jR7loNAHPL1UfcJr49MgWtfYGIhpgreosCIZ48GmVGQ=;
        fh=R86s/+lHZsQUWU7tP3AhHN+0NzLF8rO+vaqAX2Y6xSg=;
        b=Qpv38Q9tkwtp7w5q05C3QJRutOBMRhI+wxeYGWT3aI4+OdkMtGXg9OgEbjkqh4/PgT
         ZuHyHxvaog6KejUh+cOGl6fkmgVRh0r9m4FZILbZrW7Ivfeo0p4rpKhIxMsDyk1B723v
         bYFrscE5/SXomZfSxjkfWR6ljCUAL60aC9//ERbPy1QCEtB/sq1cQciWjwUQzhUxKSFE
         bEddchelg/jyqtEONIMWQsQ1WO+5d5tQcUoYiJ4x/R/lX0/v2OdiptnYISlfuK/Dh3xx
         1EVdIQkMzKQNYGJZka6lLXn1NJ4JCTGBeZOHMUsBAhdryZMyQ5hYA6dQzV8p5mQEA+k2
         +jzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793847329; x=1794452129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jR7loNAHPL1UfcJr49MgWtfYGIhpgreosCIZ48GmVGQ=;
        b=XCp1JIxCz0JiH7VJnEPqhrFzh7f2B3ku9NmKDzaa+kU1MTro94csImVUBu7SiXupbe
         bZH/HuvFqTOGINWY6rYdyQpdGarAug0MMkAu0GEbv5PMxqs57U898UepqTiEeRoDJvN+
         BnlM0vUl1nyks6zkS++X7ZWD5ETzMWS6dkgXWh9f3z/j6ItN9i53UUa+iS8TVvEUt1MS
         1T2niWLVZskoR/LOuTPqTPObNdL7WPHLOroTnv2esbgrR4qjuuJIIvEZhWb9kC82aujh
         VyFazFDBFq/IA92ONa7wUUf9JsKGAlYcrkbnGWBW8i80W6R5obtkEYdppm2YMH3xDze7
         Jl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847329; x=1794452129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR7loNAHPL1UfcJr49MgWtfYGIhpgreosCIZ48GmVGQ=;
        b=2LT0+/7dHl20xl4CObro+0EKiHSci1sC0qlh58eXg6q0WsX1CZkJDdIQZcSGCzuW3m
         CGEE+YbJUIFw9apoS1jrXTwHJyK5P8NldwZed21A+ACP0i3DO2NrryWy19yBHnK79jmy
         tm6xfs2J6toEEAj89VajudPo42lnyN347/M7mC2je4fJ0Tne1jws9JgbtOuCP9iJUIe4
         APdXhzqtzMNmkTkx6JYIWLlSKnOontndzzPrUbiL8mczbGymtfF4/Nd03E+8zyAWVu97
         /GTk40lsNHHChs+qwr8dqBUfCSCOC5QWu51rwHPd5kR8ctyJ54tW1nNKIn37taDdAHH3
         s4Zw==
X-Gm-Message-State: APuU4Z92mgyPkzQq69yZ1n/hFQbhO2hhy6OzhZ50aRUNaq+BDr82P+Xg
	RKReX21P9l6Q4t7NGtxnDCybUc5tLpAZfKJKPapT3+qsnCSrtWnCJnNEwkvO8KkB/ATU5iemCHg
	VkRaAmDfrI3muke4SroV5FVmEc806CGc=
X-Gm-Gg: AYBFou2kcKWzX6f6BQNWUMzcMVgR/b1ClN8nOzmAnJ3+tnB8W6pPp88uuAgVkm7HI01
	PrL8PHYvWMVZzv5+GrcgBzW7c4PWxkIHgRiiYKb0/8Lelx3iINfMyCLRMulYTpNtaUmbzSu7FMm
	wMrJQZEDrBM1F+gDfwu7yJekEp56/I0OlFBcKggglMR9B+UQ2Cp3UOPgy53mmrlPHEhi1Afe98y
	H7w0rNnKw641jfrNCydnRbBDbJnD53jABUYhofLmfHBrYYV5Xs+Fxz3jCiacsYAPbHLWvJk0GiC
	biEG3IueyHU8TyZ6PPL9dbWfir5XmTUAeCSgqwxXWd4/hVVG7QijjC147FJ2uwqxfRH18Q2lSK7
	uXw1tJY8YbGWDynGx+BtpSo4yoapTilDLDHtmqw==
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id
 5b1f17b1804b1-4ac175669d8mr434677375e9.14.1793847328397; Wed, 04 Nov 2026
 18:55:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104153046.965890-1-joelagnelf@nvidia.com>
In-Reply-To: <20261104153046.965890-1-joelagnelf@nvidia.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 5 Nov 2026 10:55:17 +0800
X-Gm-Features: AclHuK8fWNS4iqHr9EC6eqcHPc25Ps3rjrWEn5ef_l6R_L-fgVDB7DVBIpfqaWA
Message-ID: <CAN_Opa9t9gL3O2dkBTiHKHAnJCbUNOYBmQkzWevCFr8r6ypGhQ@mail.gmail.com>
Subject: Re: [PATCH] rcu-tasks: Track barrier callbacks in debugobjects
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

I ran into the same warnings while testing rcutorture changes on top
of my earlier series,
so thanks for posting the fix.

Verified on x86_64 with torture_type=3Dtasks object_debug=3D1 n_barrier_cbs=
=3D2:

Without the patch, each barrier round triggers:
ODEBUG: active_state not available (active state 0) object:
(____ptrval____) object type: rcu_head hint: 0x0

With the patch applied, the warnings are gone, and 300+ barrier rounds
complete cleanly.

I'd like to include this as the first patch in my follow-up series,
since the new
rcutorture tasks coverage depends on it. Please let me know if that's an is=
sue.

Tested-by:  Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu

On Wed, Nov 4, 2026 at 11:31=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> rcu_tasks_invoke_cbs() now unqueues each callback from debugobjects.
> However, rcu_barrier_tasks_generic() inserts its per-CPU barrier heads
> directly with rcu_segcblist_entrain(), bypassing the queue hook in
> call_rcu_tasks_generic(). This produces active_state and deactivate
> warnings for untracked objects when a barrier callback runs.
>
> Activate each barrier head before entrainment and undo that activation
> when there are no callbacks to entrain behind. Successful entrainment
> is balanced by the invocation path, as for ordinary callbacks.
>
> The existing n_barrier_cbs=3D2 torture test reproduces the warnings befor=
e
> this change and completes without them afterwards.
>
> This fixes patch "rcu-tasks: Detect duplicate callback enqueue".
>
> Cc: Kunwu Chan <kunwu.chan@gmail.com>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  kernel/rcu/tasks.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> index d5d060a5c4b6..a20db323612b 100644
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h
> @@ -470,9 +470,12 @@ static void __maybe_unused rcu_barrier_tasks_generic=
(struct rcu_tasks *rtp)
>                         break;
>                 rtpcp =3D per_cpu_ptr(rtp->rtpcpu, cpu);
>                 rtpcp->barrier_q_head.func =3D rcu_barrier_tasks_generic_=
cb;
> +               debug_rcu_head_queue(&rtpcp->barrier_q_head);
>                 raw_spin_lock_irqsave_rcu_node(rtpcp, flags);
>                 if (rcu_segcblist_entrain(&rtpcp->cblist, &rtpcp->barrier=
_q_head))
>                         atomic_inc(&rtp->barrier_q_count);
> +               else
> +                       debug_rcu_head_unqueue(&rtpcp->barrier_q_head);
>                 raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
>         }
>         if (atomic_sub_and_test(2, &rtp->barrier_q_count))
> --
> 2.54.0
>
