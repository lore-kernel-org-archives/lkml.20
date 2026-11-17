Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923087;
	b=LR7Yxmg7VZC9B3Yox8AafP1cQAOT7MsPBIc0bIdGPGjx0tIdqJESwaU4PLBs14dwaPcn
	 lOauUt7BW7pjqJlM+O3sZZ9+TVMVhEeYfF3aP3ORxpYUyCaoRI5ubooOq6fPhb6TURDiu
	 +2pYr/jG8iZdHOa7CGPM4sO8/SWvjeP8ZwTr3Az7ujyLU3akUkQVS0VD/hDZfQWVSrguV
	 GXPmsIkS2KxKiTwogeZ2Mit9KXv9/MQY7r9n3O4sn0ucM66o+RnWpwSUPbEQN5V49o+YH
	 7X4fvrQVVURlJuDVHaENRAEFoA6rPwfy37nYfQ2yEa/cKaozTWakdTliJkIesUGRnQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=BmDrLi2pcPmmicbvGZOk7xz6dC3kD9mXgbhjrRNLcYE=;
	b=hLLU4RJymtkO5aAGiLjUyVXBk/dnZI83GizwlKwogTgVv2p3GB7eIfhE0PXeG/RVfuCL
	 G8SuQyNNqCGaLzjF4//Wy6FkAIdeciqJlbDTr59dS6UF0y2BHyw7i7UFjm7aqcdAcKx0M
	 /KH2Dm4wcNZgHkfeKeEJFnzL+Am2qLiwJnMAdF8Web/o73Mir4jkc5WtLn2r6fSEUF3vy
	 Igq/r8oMcUwQX+4lCCiMFRDsSBrGXQPnlOmLgVwqgbgT29loKY4r1vOUf0ezesizxlSct
	 dxNQ8YCk2ezBYghXfFQOmPwGfnotrgrcIWg9rDB3gPaQKCVeYhjDIPO/mseQ+skJTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+6SOUXD;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53927606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53927606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+6SOUXD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so12656151eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923086; x=1795527886; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BmDrLi2pcPmmicbvGZOk7xz6dC3kD9mXgbhjrRNLcYE=;
        b=y+6SOUXD+y+9U2mxjAzDJ40qtt/rQWj5B3oqwNolk9yhK8E+NHT1RalYx6mUKtbYSB
         kxfaGtBANPTitjIBE2lhzNuUobblK0+h+qn6GmeqKN+v3x+hP9wdwoAq6+rzo7i1OnHJ
         2TJeayEdCy5vkxO5WkjPjscRxODSW7GG5uctiq5Edz/tiX5BVZ54Y14mLYdZqkL54SzY
         m1hnpbd7tsG2Rc7Ay3sFcY+h3eI6mJrOwbzRkNUIL41c+1KPl1FZ1vOH7aJ5btiUsaIz
         lctCRVNDa2x4LfeBSb/25xSkEIbdN1UCX6t5/dCyO8LKtNMqSugSNcSc9SZIuGrojTDN
         GeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923086; x=1795527886;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmDrLi2pcPmmicbvGZOk7xz6dC3kD9mXgbhjrRNLcYE=;
        b=rJ+Bn4NqrkLTBqV5TbKceZdKdFSwagJDrvW9exa5lD6tCEYmvgh+oBVxacJojpugch
         FcGJcVgY9XhODtoGhfF4t7/Q6wATnChUFDtvSk+3Djip1tkwfm1civShnwo6kIQN1fuy
         w/hogk5r+tNv09MUCzUZuRjBtD3eLIW5ktVGV1H/pwjORvFs5gPXvBXJflzguWesoh1v
         wHFqgRGCQ69g90y2JzSkd1OwdITvqIi3DF8Ffn8cnHM7KRJAFoN3YWH8xoIlccNvCvt7
         4rh7Xh661Gah/E3NEAwc2o6NFpHWvzGmT4GPFUSyDGAxpFB+atNWL3j4t/l4oBaG0Fcd
         uSAg==
X-Forwarded-Encrypted: i=1; AL+hErFH1SgEwvU5BrAqSektn5z11dyPex3/RExR/aDuIPoVcVHnttxox4dcETtmHnNkcEdk11DNsj7F8oODfzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6ZRGAf+P+z6X2VEioEa6wny+lhCqlXiafn5N1xecqJJWaIBM9
	1r+xley9n5Z9rD4q5ZXON6HqUUl2WptOcl9maa9BuOYuWHqpXBSHCdhm
X-Gm-Gg: AZFdTZc01xdx6Fze+YuhiUzABocdHjqd9PU9cFWyktLRG+JbdmZcz2OaSQ3OILxgclF
	Xdwc19uRvuvPk8ZfS2jhSr2XSayhhWDQvddlmsdnjP1ObDDAEjTsQb1gwX/3TS+5bo+6Hht1qc3
	aiBXTL2Zm+qrKE8ZaKkOxoBezKWRPepppiGvQ+kB6FXWMVQT6tw0GjMQrL125trTdRL0iQS+vrK
	9GB+GgOdFVjKSS+eqz8OX2TjkAvPzPhiUlBqVijscGNfz386hXA/U4gKysqTS800knwJV6dUidz
	QHWZgHVDQfx/x99EU9JYXAl3h0mjcCtadqPHhI1r1hn/q7NZbuKPOFVKfFPUseHtqgXyLgzwcOD
	lN5kJCXUIII03eqsIgD6k+CA4e6GYkTc9jxqmFlJS+mg5zPz7VePn/4SQ8tvcUs55YiseZuuzlN
	spVKS5/KYEjIFRhmLxIq36sZtdD+r4xyVUbCnZxNJRfDF+a2lx0YMHH0G/FeskaMKp1ddXcic6c
	5dWV9i+KBrXDtXegY5SrkQ4+LVioGXgHOYObrvEYxT/xGlz0AONGRdAFqA3yhmc0yw2wGMf+JqH
	7YZXhgpVu5haE/v5GypNYjEPVTjG
X-Received: by 2002:a05:693c:65c4:b0:381:dbde:dae1 with SMTP id 5a478bee46e88-381dbdedbf5mr1079702eec.38.1794923086299;
        Tue, 17 Nov 2026 05:44:46 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm39085303eec.4.2026.11.17.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:44:45 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: Re: [PATCH v4 3/3] KVM: PPC: Hard disable interrupts before guest entry
In-Reply-To: <20261117131612.707038-4-sshegde@linux.ibm.com>
Date: Tue, 17 Nov 2026 19:11:16 +0530
Message-ID: <wlqb7eyr.ritesh.list@gmail.com>
References: <20261117131612.707038-1-sshegde@linux.ibm.com> <20261117131612.707038-4-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> After applying preempt disable patch, i.e PATCH 2/3, Christian reported
> a subsequent warning stopping his board to boot properly.
>
> WARNING: at .kvmppc_fix_ee_before_entry+0x10/0x28, CPU#0: qemu-system-ppc/4667
> CPU: 0 UID: 1000 PID: 4667 Comm: qemu-system-ppc Tainted: G        W           7.3.0-rc4-2-powerpc64-smp #1 PREEMPT
> Tainted: [W]=WARN
> Hardware name: varisys,CYRUS5040 e5500 0x80240012 CoreNet Generic
> NIP [c00000000005dc3c] .kvmppc_fix_ee_before_entry+0x10/0x28
> LR [c00000000005f298] .kvmppc_handle_exit+0x5b4/0x5e8
> Call Trace:
> [c000000086587780] [c00000000005ee10] .kvmppc_handle_exit+0x12c/0x5e8 (unreliable)
> [c000000086587830] [c000000000062068] .kvmppc_resume_host+0xb8/0x10c
>
> It triggers below warning...
>
> static inline void kvmppc_fix_ee_before_entry(void)
> {
>         trace_hardirqs_on();
>
>         /*
>          * To avoid races, the caller must have gone directly from having
>          * interrupts fully-enabled to hard-disabled.
>          */
>         WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
>
> This happens since kvmppc_prepare_to_enter does first local_irq_disable
> followed by hard_irq_disable. This leaves a small window where interrupt
> may occur and it could set the irq pending bit in PACA.
>
> That local_irq_disable was necessary for PPC32 to track the lockdep
> state etc. On PPC64 hard_irq_disable is good enough. There is no need to
> do both. With now hard_irq_disable, doing local_irq_disable for PPC32,
> just calling that is enough.
>
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Fixes: 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/b8f82519-9ae5-c247-e020-e79c627e57df@xenosoft.de/
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Reviewed-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kvm/booke.c   | 1 -
>  arch/powerpc/kvm/powerpc.c | 8 --------
>  2 files changed, 9 deletions(-)
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

