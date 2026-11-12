Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794452639;
	b=DgIJ62twNFA2D6XEtqhZyzEcc3Sp4CwuMwSmOEspCxtNGpabGzZDEf34YI2wV/R9j1zA
	 //qDBvwKlmBfvygIXswpm/8yZ1Gd3VDHL4VFihTx3ER+6zZMMjzxVkcG+M5IsLjnzgyoN
	 IVO0ka74gLhx6Y4pdxn4i+OSnXD+6reTPyqqhhUbfBTR9zEk45ZWmkYvGaiybRB9N0nFL
	 81FRSkpMwnk3kZRfUbYbKRjcevY8qPHIz+go2GUhm0RbgK9NneItEl4nDmIqAplcxz5vm
	 xssa/L85AckysAy4NSUSbanbGSPHahqQKtbJkRGM3FfgVttuLQm6sYNWcQrcCoY+oKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GTeGZu2+9xZSrtftnB09MXJ0s6NLQku+8Y5vW10jAeo=;
	b=jC9R8GuqxxNI+d+vCNVJ7TM2whSrSVowaEmQw9w5lpAwwnHXTb8UWFkCkHEvqz6/Eba2
	 v7ALApm6DIvqA2nv784lt+wdG27N0gtwai0fyPc2WcHykToNjzFoGlkTZYxfZRLd3sONS
	 5fl46hA9lUk5caHZlAaOu3EUkzlm+n5hBn5GP2Da0Blge1gkJUmYNxEz3cTmRMPU094Yl
	 gQiS4JbdVeNf+HEnOgqtpf8qUk9YjoV5bJsZBK0OlH3YcB6mr3HrWI4sBRpg33PbTE26P
	 TN/vB4R+yWUS+7ryFAE3bglhLydhjU9DGbNrdnyTRpEEoyBa0dBdoGjSfT5h+lPHQyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYWQ+ASk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C745606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C745606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYWQ+ASk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso24303475e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794452637; cv=none;
        d=google.com; s=arc-20260327;
        b=FLaeBZM7XI/zaxcw5+29Od7u60F1tyX4L59Xt353a2No8KPdmwLdEzod2mhEA0WHhu
         L9IrTrjdZB0Ue0phpIeHO7jNt8FHsuTgzAhG4O5+0YyyIFQhyuGSyJGdLuhLgRUyJy7C
         K2WN618kGuTd7hJZGA6DW7sYIqnlP1W8zuGuuFTr5xrLv8i/fKVUF2xKaaK4e8NsfXzM
         +SeCwoBmDorVf+JIRD7X4OPU90kf0yhZD4++UIsrFEjtVL6zUSZSNQiLCoxaqCqTWBtW
         YpUgXrI+sRLIo5+I8SA2wagQcy+ok8MBVum5eT/72mcQlXua6pybGNszYsSZkMV7vd6l
         qEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTeGZu2+9xZSrtftnB09MXJ0s6NLQku+8Y5vW10jAeo=;
        fh=Y45Nekw0eN4o5ZwjdyzxFcXJkxN5ZGkMHv84AKCokbc=;
        b=r4Jw7W8AeHbLGvUX224ugW7hz7yWUl/TVdVjMDqaUot1onvrrLvNEzasaDhQDItDJ2
         WLFv11qcP24SIz3WmaNsAcVuR8dLHuzt9b0j6t7wE5WCeNsdKeO7+QbFzzQ8SEgZxtg2
         ds80869DrbF3zuJvOtuT3S1kb4TBgz2FdqFcgkXnVMrUFNigqQFFiC2fXeYyrEVktt+L
         iLeSrBfQf3DBWN7GqfxFtkVeY+6LgRMoyjUbR0FwYQtLPwl9pODAv6am4J5fzqshSq0w
         YjRo9Tl7hDVozx67fFDy//AJ/x6F3vnVzlFNnKMnVqLsrcLzZJ0qDgvOc3vtaLmkS6pX
         KlFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794452637; x=1795057437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTeGZu2+9xZSrtftnB09MXJ0s6NLQku+8Y5vW10jAeo=;
        b=NYWQ+ASkcj3iXlWnKEe9C54SGHbNXuCQpbfPm5kHOQWlr00Vvts9RWWSScfoYWBhei
         ABVydHzxQpQpz9CFkW+x+vIRmXP6tsCnb8FsZe4AtYu/QCtFAN1Lywiav+VRirHbiAnq
         E/3SWKWrfYKIUpcwgWTL76XevBO5cTZYDITBGiKw/47BBRNaoJ5bzgM5KSnroNHMUACv
         q2ZLQ9b6Q09XPcZzbzTqhjgVhS3o3pgxelaEsMmG1enjZaUqtvQ3hqBJk3Dj2BnBjAj+
         MP8iMKPAy8tzdpT30gE8HbFp/jdvSjztkiVHLAV+xKlQZoqY3wjFH7c+DKHqCS0Otjys
         dSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452637; x=1795057437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTeGZu2+9xZSrtftnB09MXJ0s6NLQku+8Y5vW10jAeo=;
        b=NKRbPEBerkq/N3lb/fX7FlTu0og/b7DPxA61QnnAm/iKUHGg7r1EHzQMxxkXeQ19rM
         8nZRpJhBj8f0cxPp3ne2xuQSr3a/BnQEQyCkdOW0oP7Jqkx+VUsiscpo3AgzD15FPkw+
         +FKoA+TqRJQ1oUvqel0BOjycwERHuN4qUOV7e2z6QfU3OfZnqfdkPtOG+mbnGoIS0iCi
         Lmum2lQFrqIukpbX3tUDNT5BHOi7UeqvjwkoxUsL4sja8WTBys8v1HKVDWjlYB9kknvY
         fe4bhFNn8F+YzH0rqhCNFk4zddBv+Dj4DTKZFCNLhGMWHsVb7CUGY6Z28h/+hXnX/eX5
         ysxA==
X-Forwarded-Encrypted: i=1; AL+hErE5j2ijjSJW1KgaWr8wJcBVrljp7jwEKn84/zyPdZEDShhSwz6HjfDdnrgQqS/sokOY60XMOD29wS/XULU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VXcJzZFzCLK0q45y2y72vyYd9KlKIeRQ1AMGkXb15+eusRWA5
	3XF4uZ2omXbfokLN9NSSndrRpIEkeP685/pFFQ5OixffcANkKf14HGf1YyH9KbMB1HYSqX8DfEO
	wNPhyGdg5yu9Y0x/ecMXDMb6hjrdizk0=
X-Gm-Gg: AYBFou13m+TLlzmJEuwU4SYQ5kbcUP0iFVytF97i4bkcqdiU+z+oYDeCWkXG132MdM4
	Tzby3EMWWeJa9g1DxrqJynQTcLD2n8GtzoTqcH7u8vnC8OtRf1kPKrVPML19e6e/BYmCfINbJ8k
	huDM2KQrB9+85bguoknQVKDuB6dNZTETdDi2oP5nN1zAdrVAwHGuprZf02DOxzghUyek9WWTkdR
	L/dPC3EpcnDyIbpnGXCgeXAxUnoNM7SSrIkXW4cvXO+qiLKvKINF0AoMk9C8Ki4t/Lo6viHG3GS
	atPubNrNSw4zcbXnYsetQDViPdmuBvEZjsHfVpezWq0eibB9/UwEtbbguQcFiGaDsGlJOQHVgPY
	Hq9XF0kHxJyRMfeJLRxnP5YG8Rj9XV4jBUwTgsw==
X-Received: by 2002:a05:600c:6089:b0:4a2:1612:637a with SMTP id
 5b1f17b1804b1-4ba09376ccfmr70937035e9.16.1794452636496; Wed, 11 Nov 2026
 19:03:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111145949.70845-1-mathieu.desnoyers@efficios.com> <20261111145949.70845-2-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261111145949.70845-2-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 11:03:44 +0800
X-Gm-Features: AclHuK-9md0vcPevHW5yCaXCA8-TIbsg6XxGXtCuTXXP4lXtaJiSsteqqebRV7I
Message-ID: <CAN_Opa-j6weQV6G1191vDG7hq2kkOfuGF=i83zpRQLvfo8cfwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] srcutiny: Do not call synchronize_rcu() from synchronize_srcu_atomic()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Mathieu.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

On Wed, Nov 11, 2026 at 10:59=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> synchronize_srcu_atomic() never blocks, so that it can be called from
> atomic context.  This includes interrupt handlers, and code within
> rcu_read_lock().
>
> With CONFIG_PREEMPTION=3Dy, the Tiny SRCU version first calls
> synchronize_rcu().  Tiny synchronize_rcu() does not wait: it only
> advances rcu_ctrlblk.gp_seq.  This is valid where the caller is in a
> quiescent state, in task context and outside of any RCU reader.
>
> The callers of synchronize_srcu_atomic() need not be in a quiescent
> state.  An interrupt handler may have interrupted an RCU reader.  A
> caller within rcu_read_lock() is itself an RCU reader.  In both cases,
> synchronize_rcu() ends an RCU grace period while an RCU reader is still
> in its critical section.  poll_state_synchronize_rcu() would then
> report a grace period that did not happen.  The caller within
> rcu_read_lock() also gets "Illegal synchronize_rcu() in RCU read-side
> critical section" from lockdep.
>
> srcu_drive_gp() has the same call.  There, it makes an RCU Tasks
> Trace grace period imply an RCU grace period.  RCU Tasks Trace uses
> call_srcu() and synchronize_srcu(), which are both forbidden on a
> srcu_struct that uses synchronize_srcu_atomic().  And the Tree SRCU
> version of synchronize_srcu_atomic() does not wait for an RCU grace
> period either.
>
> Fix this by removing the call.
>
> This was found by reading the code.  An rcutorture test added later in
> this series fails without this change.
>
> Fixes: a48669f0c49c ("srcutiny: Add an atomic Tiny SRCU")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/rcu/srcutiny.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> index 63a3f0a8bc53..d58f4160f925 100644
> --- a/kernel/rcu/srcutiny.c
> +++ b/kernel/rcu/srcutiny.c
> @@ -367,9 +367,10 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp=
)
>         if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
>                 return;
>
> -       if (IS_ENABLED(CONFIG_PREEMPTION))
> -               synchronize_rcu(); // Needed for RCU Tasks Trace to imply=
 RCU grace period.
> -                                  // And in Tiny RCU, it is near zero co=
st and doesn't block.
> +       // No synchronize_rcu() here, unlike in srcu_drive_gp().  The cal=
ler
> +       // may be in an interrupt handler or within rcu_read_lock().  Tin=
y
> +       // synchronize_rcu() would then end an RCU grace period that an R=
CU
> +       // reader still holds up.
>
>         // Usually, there will be no readers.
>         preempt_disable();  // Guard against lazy preemption and some oth=
er grace period.
> --
> 2.47.3
>
