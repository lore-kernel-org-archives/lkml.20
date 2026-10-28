Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793153860;
	b=QkKj/qwTkIooXOP7lfwmHsqAIBBkIftUKjKMO1626iWZaMBK2AMfw+NLADZB3Uk16c69
	 EXgI9KP5OBn75inGLDBj4cEhVMdUSN1q7pWH/+SZOycLwVfcM3/tkFlJMTmgOqZS0MbkB
	 LC6MLRw74+BtvDJkK4ee53YaxX7CU2RFtJvoEdc9lUeT7GAlNN2XDRoe6gpHaPOo9QoU4
	 3t2aSF2uzDxRnFm32fdBOTZ6sG9W2V1UzYS69q4uv+itudISp3NI3Wzv6dQmR20FTR2gc
	 d2csGi+MMwvcNNXeZLpTilJxDCLKav8/5r9tzgIr8vbxGSWfxV59eLyOa+bFp0r36Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=75/rV3MuGn+QlyFkS3b8E6MzH+wxlD9J56EXGGNEdag=;
	b=c0aKtC4vNjIRUgPQYiFqqs3VQQUCghyUVlVxmCHOqSZdiFX8qUOuEwGIfwfU4eaVljCd
	 7GT9LsV3xG8C33+R/E3uuIlkeCocLtChuBT3LvWBy1q7HmgZx/VytOXKc5ujJ+w+vrwE5
	 yBAd5N3EoTu9kX+YXSBlFFiXZQtQPvOnq19HfD+WeeMGo/Xr2dPgobLux7Cno89h29GR6
	 i1KiVzV3QNtKj8K6V79XjCFi+3NOFOX6YYptqlxn6LfwLzwWEtA1nlZnp5c61no+LGAyc
	 Wp05Ga3AO/GkUOg5fsmQW8Q3i4l3BryrRAcJVPjBS6Iga8mgdMJSitb80BkvsCwEZtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jehQ+UIv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jehQ+UIv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso2381345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793153858; cv=none;
        d=google.com; s=arc-20260327;
        b=Cnwx62sJ5rWrNV2+nVMqoXCdBE1c/QBgnR+yhvGdXgYqvMtSj6xtIbDPzm9fs4N/BR
         2/C1bXCs3+QiIqFGW5mVHitg41uC5amz5+BitZrCfkYv6z2KZ5d6i4uJ8gQXgFPFub8u
         rxD6DhKfPLfLFhoBhsSn8g+6pHWXI/xVzB/sb6SleTTakKO7TwHFKeZzc0ni1Epqp786
         WsGXd/5H45mT39EYn5RzrKVhIPE0RXX2K9yRu+hJIb5ubGvYSAIQhvgKUbqPXwC2d1Oe
         6H4w64Tm6JK1gg8zCqUf3BfFyV5/1kn6YMN3Z3koaOdLS5PTL8OqfXT/+yg2UtiKBiTc
         QvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75/rV3MuGn+QlyFkS3b8E6MzH+wxlD9J56EXGGNEdag=;
        fh=kykj9iwAhTkpAMhj81VD/MCCGV8s2B5o79eUwHw/vrE=;
        b=GIEijomWmwrexthgs6CPkNXZkMa8Kte04mJ+7oYN0FjOINEZkWFHvlHt1G2RrC+byT
         hFM5+SJhjyEYoBFk5PPwBGvbFDLOm68P+BcgHHD6eGLYQSsc8y5dG/LaYS1C207/7HEt
         VZf23T4kW6ZJcOk1cOKoNtjLKsVhmDLrj2kDZmHdPFaQqnuMiRsrFLWH1YeWZBGCmI2e
         2zPlBwjjG0n/nQ/KtqWjczHM9uD+Ifw+2Y0ElIqCAobsQZAHz3Re58FkxhCeVqxhDQCh
         6NK5MHnM95LkC7bxlsp54GrmhaZ8k6LQ236zQy7dRpk0Psw0Jpyvny7GttgdpMe+ApyS
         RLwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153858; x=1793758658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75/rV3MuGn+QlyFkS3b8E6MzH+wxlD9J56EXGGNEdag=;
        b=jehQ+UIvvhz/ikT+6UkrkYGYoAMsZppHqw6XC2bXKio8sXZYxwoz8WVrcr0BKFefM/
         Ra7nmTUNgvcAb/rwtBwg5MQz5tknhGe4tjCsUbMR9lgZFG/sSs02Waz9gtdQhJRG8wn/
         oGue+ho22hpsgYEUKnvNSIOgo/E61bNVcBG9eVqHkD966NL2dTPBey7QGAREzGBLucrf
         tKwNGF2e+ATBu4IhLuwrtGlry9tNlYHR8SNjsk169ZR3ePpFgqCWnFuBOWWwc2Qtgjw1
         ccznn/47kSSwuqe1NItoYPPX0Wq8EZAvjr86o1uZemjqMy5GUoUgWy5EmDCwQ5ico+4/
         0xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153858; x=1793758658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75/rV3MuGn+QlyFkS3b8E6MzH+wxlD9J56EXGGNEdag=;
        b=YKZMy5Ql8sFmRUG9Auayc3GNr52BLavyvKry2yhqAGO955txP/qOyX08kax0XXF/aL
         1rvyR9h5zNlgrKSO4lZBQ2ifj8vFtFT+dXnC+jmElQDxSOAabSwdO/5Mr5KhoT7d3300
         7N2X40AiRpuaxHtN//WwggKOAD2AYlN55h1ZWD8B1XxY3IZh9uzYI6QjgvY7xvNlkUGw
         AOLJeRwGHClpYiQ8cs8g4tN9AOrnFZkArGBGK3KEkO3HeHaWP9KHHIRIgCw9pXRwGC+6
         3V0MT2NGMPQ3POC4Q8gJZXlNfLlsC+iOE4ezXo8ta+AW0p6a/zGtrjjnMT1+7r6y5qBT
         2j6w==
X-Forwarded-Encrypted: i=1; AKwUvByTz4oEeoYjJjobdF6sfQkA3/7FGC+dMM8c1i++mkq+sin1zH/4hBTdNcvpGy5mnqMX+CnOR3TZNLkeOGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMKBIDNXpJ9nLmNq4xjY7SHx1KcJvmTkrMPZYqbtLDQfgxl9r0
	GOP6EDpti65qeJTEiZoexhYY/3ja0aPjvxwCXCMHIF1E959aKy6iVTEYTw91swu0a0wst9DRKQO
	/MIC26PRlWTlRAgh4ZDqrBmkVqPgP5Mw31VdPUFY=
X-Gm-Gg: AYBFou3G8LlTpFtDPGv6m7gEQkdcqwmTXkFS4Ah1zir2iUD+05YvD+rKbwKgKDRq7LO
	3jurL5Z3fP390kD18xV38ER0fJ70kLIRNJJYOW0DlLlDNum+SSJmvUoZoGsJFl1rPG+mciz/K0W
	AyPUmb++ngbfHpsYPlMomQvMfam8no6TBgAYbzdOxlAYx+ayKUH/cYySpjS8eun3T/YgNgg2TDC
	GzYzdq9FoSkts39okcDl0isbCGu3q9ZGICfR0jrotJhSUCU4HkjZbuIswGSfG10pbLbEeRcwFNL
	0F90bI0f8JFyqekytpwKflOIAolM8xlmlumEuk6u7im9lcO4oct7sEKRg/Cc9tK3vZA1/NYDdax
	9AJJ4Z4tOcOKeKRdlUoQNY+njBYbF5wJSzWAnoZISlH/MIOhhHrFcUGf5GKfxCXwz2xrtlQ==
X-Received: by 2002:a05:600c:6989:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4a9640f38bcmr17926875e9.1.1793153857997; Tue, 27 Oct 2026
 19:17:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027070923.3054462-1-kunwu.chan@gmail.com> <20261027231315.GA3580680@joelbox>
In-Reply-To: <20261027231315.GA3580680@joelbox>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 28 Oct 2026 10:17:25 +0800
X-Gm-Features: AclHuK89zdU2dhzaFrjvPFZJZcFsH9NI5CzwsDVal3jyUsdF9giWMS2YSMVjliQ
Message-ID: <CAN_Opa9n-iqRgQczQ5_ZpTMHFbjmW-6+ZYsCgCYdNfuprXLyFw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] rcu: Improve callback diagnostics and validation
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: jiangshanlai@gmail.com, paulmck@kernel.org, josh@joshtriplett.org, 
	work@onurozkan.dev, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:13=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> On Tue, Oct 27, 2026 at 03:09:13PM +0800, Kunwu Chan wrote:
> > Hi,
> >
> > This series improves callback diagnostics and validation across RCU,
> > SRCU, and RCU Tasks.
> >
> > Patches 1-3 record callback registration stacks for KASAN in Tree
> > SRCU, Tiny SRCU, and Tiny RCU.  KASAN prints the recorded auxiliary
> > stack when reporting a use-after-free.
> >
> > Patches 4-6 add rcu_head alignment and NULL callback-function checks.
> >
> > Patches 7-10 detect duplicate callback enqueue attempts before
> > queueing, using the RCU head debug-object mechanism.  A duplicate
> > registration is rejected at entry and __ratelimit() controls the
> > diagnostic output group (pr_err, mem_dump_obj, dump_stack).
> > Detection requires CONFIG_DEBUG_OBJECTS_RCU_HEAD.
> >
> > Changes since v1:
> > - Patches 7-9: __ratelimit() + dump_stack() instead of hard-coded limit
> > - Patch 10 (new): same change for Tree RCU's rcu_do_enqueue()
> > - Patch 9: fixed log format to avoid pseudo-function names
> > - Tags: Reviewed-by (4-6), Suggested-by (7-10)
> > - v1: https://lore.kernel.org/all/20261023101841.2910719-1-kunwu.chan@g=
mail.com/
> >
> >
> > Testing:
> >   rcutorture with KASAN (SRCU-N, SRCU-P, SRCU-T, SRCU-U, TINY01,
> >   TINY02, TREE03, 3min each): all exitcode 0.
> >
> >   KASAN aux stack (QEMU, CONFIG_KASAN_GENERIC=3Dy):
> >     Last potentially related work creation:
> >      kasan_save_stack+0x33/0x60
> >      kasan_record_aux_stack+0x8c/0xa0
> >      call_srcu+0xb2/0x390
> >
> >   Duplicate enqueue (QEMU, CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy):
> >     call_srcu(): Duplicate call_srcu() CB ... ->cb
> >     dump_stack_lvl+0x47/0x60
> >     call_rcu_tasks_generic(): Duplicate CB for RCU Tasks, ... ->cb
> >     dump_stack_lvl+0x47/0x60
> >     rcu_do_enqueue(): Double-freed CB ... ->cb  slab kmalloc-16 ...
> >
> >
> > Kunwu Chan (10):
> >   srcu: Record callback registration stack for KASAN
> >   srcutiny: Record callback registration stack for KASAN
> >   rcu: Record callback registration stack for Tiny RCU
> >   srcu: Validate callback arguments
> >   rcu: Validate callback arguments in Tiny RCU
> >   rcu-tasks: Validate callback arguments
> >   srcu: Detect duplicate callback enqueue at registration
> >   srcutiny: Detect duplicate callback enqueue
> >   rcu-tasks: Detect duplicate callback enqueue
> >   rcu: Improve duplicate callback diagnostics
>
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks, Joel.

>
> All look good to me, applying for further testing and review for 7.5. Did=
 you
> also test double-call-srcu and confirm intended behavior? Thanks!
>

Yes, I tested double call_srcu() under QEMU with
CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy.
Both Tree SRCU (direct and deferred paths) and Tiny SRCU triggered the expe=
cted
duplicate-enqueue diagnostic with the callback symbol and dump_stack() outp=
ut.

BTW, I'm working on follow-up rcutorture support for
duplicate-callback testing and
KASAN aux-stack verification.

Thanks for review.
Kunwu

> thanks,
>
> Joel Fernandes
>
>
> >
> >  kernel/rcu/srcutiny.c | 34 ++++++++++++++++++++++++++++++++++
> >  kernel/rcu/srcutree.c | 36 ++++++++++++++++++++++++++++++------
> >  kernel/rcu/tasks.h    | 27 +++++++++++++++++++++++++++
> >  kernel/rcu/tiny.c     | 11 +++++++++++
> >  kernel/rcu/tree.c     |  9 +++++++--
> >  5 files changed, 109 insertions(+), 8 deletions(-)
> >
> >
> > base-commit: 940793b926aa94bf65ec404043050888e3053188
> > --
> > 2.43.0
> >
