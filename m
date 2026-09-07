Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC81D47AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824087; cv=pass; b=dYLrE6kpA+Y44d4Jm7OkWBFufojaR/UzzwG/Pjwa6dWZH8xyfWXPYdabx082xjhM1YywgueD2LTHPdD/w2S3agK1SShV5r8V5dlZmwqvlux5ehySwvlqBqkw75TZlGZRty5Jw4qFGWB0G/8zWmrESju3yEtTQODS7g8E4JHpHr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824087; c=relaxed/simple;
	bh=l6bwwoVueCaG8E45kbLYaQURVS5qLWt2C7NdrvXHikY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1gzLZMjo1sNYSDmGDC2F53O2PkNMttaGKAFu50gA3dRR3eQ/fgfl0xT4jtp/VhwyCoeYsej7yr3vRh2xHrQQLI68/kCVMamIqcHwhzM45LvugPMIWqiWy7Wb1tn2OlZ+5DqlDmr7DbKa6x398/z8pVs3mgYw69eEPzkFPlF1Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LueDEPZr; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LueDEPZr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4654718a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788824085; cv=none;
        d=google.com; s=arc-20260327;
        b=GDXv6VkfAVM8Uk7zZDOzgdC4VagNXLWvKO1OFqFdiyxN6fUufOEToKsVamyimN7BtE
         w2l2htJX6v0lKbuX0HHcLgGeFNMDuZopyBIhapoWXTctnNKbmOZaT7TNoG+/HB61Lnl4
         CdxjDBSRdfPKLPZmc/b81JPnKVtPgE7pKJPy8e3hbIeE2uUt3pdZuzYnE1w8luGIJHnQ
         ZQP9qGp6FFWzKu+K0ZLlicvgW6bIh1IttLsRjMYaCQTXiY68US3Hxlf0rmRfyoFJte/S
         vTNbqAf0wqhsQy6EGvCXNaWFeKUaLU2zYEvhtwWEu0CAvq1DV0EtQ99uWsjHCqYYQv8S
         rE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        fh=YBTLswKLSM/gq7LEN77DxA+yZhBi62YXfdmTE4ejIpk=;
        b=GvN935uTtw0FIp/MtzrtBg4yxYFMU0f3twxJohHnqvYQflTdB8UM9xShM9jO7Q/YYl
         cePiVLvf37YhvviQks/WPBgeICfHIhxUFkQBsfYTsxaJjma7fL+ApA48C3srWZshWYBF
         p8oe6Ac8Dd1tBWLMzE5uTOs3pMXL4Xp022mB9aAbxRqaLEiP2EZ/8h0dvFZpskb2RAHp
         hXWuOKlf2QQc27WL6b95yddQ1dON9v3kQ2lLH+4scaM/WBX9Gop9QxEvqpmSUcVBdB2C
         0p5RRRdOEyACTOiH9p6NheJK7xy0y6b07tT96CoFkrhebFvG+AeGlu9TuD1NY9/GMeTj
         q7ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788824085; x=1789428885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        b=LueDEPZrwERRQSqM4jQrV4y5AcPQiFDDOxYgL798newQ1GTpIjbL3H5vEICl9llvd4
         Y92DZADnXzh2vJDaQPscrI/URK4PCO33pne9encxE94MXh6t4BQ2eeu+mDP3InZkgve4
         7vbvzttqw0aiGB0pI082mmpMQBE2Zo5Ef4cg0YlV8Pge0uITCSJ9YqYDpUUAKteDsOZl
         svnjiO2HuX0cHbYXpXQH3gCGtMYzg6tTM8oxMt7tDr4BSffy5A+mdjJHoeBAzt3qqeD3
         o+4c+M2UC0vgAZQBjKcwNV1eF2Vr86KKswB8/Ttv80E5547Og37X9ZGnyt2tL3d1RoBo
         rmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788824085; x=1789428885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        b=RrzDmo9Hg/has96de7Xb38SpclABN2lKhRQb8723Af1I3rGEaBVmXnh3AIFr3ggCDL
         c1X8dIh9olsmltbhpYQo4bN74oAoaP9yNMLPdzHzH12KVf04xXvR3t6fu7JTBrS5U9ay
         UDqqLarnrRxjRuk4A7AFIPd8XUyFYiAM/Gmi98ycz5CrBROxzDQgnTMY5n1uZe3XNrk+
         BrVNRkPGDBA6Hk8W+eOszvfvplNi28DptdGMx1QAQzsvqEF76MivijABDZ3dbjUMS5DP
         0NxOrTC4YTIRCsCWWQuFXRdS7vlIFDlpIWZa89p1aZKxBdSbibfmigYOb4F0ljRMKEBb
         n3NA==
X-Forwarded-Encrypted: i=1; AKwUvBzpXlqH2V231lxq/bQif/n47RzyjrdIuoF7RcUbRHMP76/Zm4TUC5bpN0SZs51P/IDaLAkjKuosrs/V5FU=@vger.kernel.org
X-Gm-Message-State: AFuF++nS7AR1f6ulHo3/QAyyfUoJROZJB87/W6NB1TZ6zXEyo8NM74Cq
	6vEQWManzeepJkwsEN2C7jn6jTwyOizlWyJ2w05WPs/UJKHuswqzuglz1RDqnKQvxvDo6joQ8xF
	jPQbjFB1+SaKsX4mIxzxW3/V/anvAgsPLkHgwivU1
X-Gm-Gg: AYBFou2yByjJmsoo7NJ5gGVPruMYuE18mMH9REJqfqb1anp5FrY0xcRcfmMkkjFCSWt
	f6bJi7AJUqX99s2yg5/gMoJbGIVOfQJtX4yZX1MwBuu1Y2aGUtvcA4NG+stN75rOSS2cKAm2HZo
	sOMZfhDsl6kc2Ixta3ZRgSPBQmyQ4avKWOe3AhrFx7jh1GjcP4i1/yKceOpsGpU300zwhh2+jh0
	6AEHlv2X5XHHsnl3kh/Ps2erFes9BqS45ZA5NJz+PrIiTVMjxCTMzpktPfAphcCobAKbNDft+kX
	pZsKjtoXMQNfDtBkTefLK3C8AnB6rjEhsYRgBYJTdqiDB+AVkk/Z6XkNL4ebEs++Ig74C+qhTEv
	9u9kukpJ21SIh7hia4ho34xiJ8FO+zh5kxKHf56j5+XkGXz4uKItaQY3F
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id
 98e67ed59e1d1-39b260de5bbmr39739841a91.5.1788824084339; Mon, 07 Sep 2026
 16:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906074135.185212-3-jiayuan.chen@linux.dev> <0aa6425f9e8f32705ae827f6325b29079234c3f3d0c7b2cdefba3e5b50432766@mail.kernel.org>
In-Reply-To: <0aa6425f9e8f32705ae827f6325b29079234c3f3d0c7b2cdefba3e5b50432766@mail.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 7 Sep 2026 16:34:32 -0700
X-Gm-Features: AcwNN1UK4ePHf92C8dfodAq8wlNSEQxGqv1s9W_oplqA5uHsM2tjuHOURyVXA5A
Message-ID: <CAAVpQUBztYDHyiCN1fnhdxCPv_5AZ09yCMQfNW96SzZyw0LhHA@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/3] tcp: Skip cond_resched() in
 inet_csk_listen_stop() under BPF context
To: bot+bpf-ci@kernel.org
Cc: jiayuan.chen@linux.dev, bpf@vger.kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, sdf@fomichev.me, martin.lau@linux.dev, 
	ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ncardwell@google.com, shuah@kernel.org, aditi.ghag@isovalent.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:23=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
> >
> > bpf_sock_destroy() runs from the tcp iterator, under rcu_read_lock(). I=
f
> > the sock is a listener that still has children in its accept queue,
> > tcp_abort() ends up in inet_csk_listen_stop() and the cond_resched()
> > there trips the debug check:
> >
> > BUG: sleeping function called from invalid context at net/ipv4/inet_con=
nection_sock.c:1523
> > in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 628, name: test_=
progs
> > preempt_count: 0, expected: 0
> > RCU nest depth: 1, expected: 0
> > locks held by test_progs/628: 3, last CPU#3:
> >  #0: ffff8881158cee18 (&p->lock){+.+.}-{4:4}, at: bpf_seq_read+0x56/0x1=
210
> >  #1: ffff8881106bb858 (sk_lock-AF_INET6){+.+.}-{0:0}, at: bpf_iter_tcp_=
seq_show+0x32b/0x4b0
> >  #2: ffffffffb435af20 (rcu_read_lock){....}-{1:3}, at: bpf_iter_run_pro=
g+0x46b/0xde0
> > CPU: 3 UID: 0 PID: 628 Comm: test_progs Tainted: G        W           7=
.2.0+ #65 PREEMPT
> > Tainted: [W]=3DWARN
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0xc1/0xf0
> >  dump_stack+0x10/0x20
> >  __might_resched+0x3d2/0x610
> >  inet_csk_listen_stop+0x7b/0xbf0
> >  tcp_abort+0x23b/0x3b0
> >  bpf_sock_destroy+0xfc/0x140
> >  bpf_prog_448133d24601754f_iter_tcp6_server+0x81/0x8a
> >  bpf_iter_run_prog+0x538/0xde0
> >  bpf_iter_tcp_seq_show+0x26b/0x4b0
> >  bpf_seq_read+0x424/0x1210
> >  vfs_read+0x197/0xe40
> >  ksys_read+0x119/0x240
> >  __x64_sys_read+0x72/0xc0
> >  x64_sys_call+0x647/0x27e0
> >  do_syscall_64+0xe5/0x610
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7fad39b28aca
> > RSP: 002b:00007ffc381c61c0 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > RAX: ffffffffffffffda RBX: 00007ffc381c6a88 RCX: 00007fad39b28aca
> > RDX: 0000000000000032 RSI: 00007ffc381c6250 RDI: 0000000000000014
> > RBP: 00007ffc381c61e0 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
> > R13: 0000000000000000 R14: 000055f077c1bbb0 R15: 00007fad3a0f3000
> >  </TASK>
> >
> > The commit that added the kfunc already guards lock_sock() in tcp_abort=
()
> > and udp_abort() with has_current_bpf_ctx(), but missed the listener pat=
h.
> > Do the same for the cond_resched(), it can't reschedule there anyway.
> >
> > Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> Is the justification "it can't reschedule there anyway" accurate?
>
> With CONFIG_PREEMPT_DYNAMIC=3Dy booted with preempt=3Dnone or preempt=3Dv=
oluntary,
> cond_resched() expands to __cond_resched() which can actually reschedule.
> The splat in the commit message confirms preempt_count is 0 while RCU nes=
t
> depth is 1. With preempt_count=3D=3D0, should_resched(0) can be true and
> __cond_resched() will call preempt_schedule_common() for a real reschedul=
e.
>
> Additionally, in configurations with CONFIG_PREEMPT_RCU=3Dn where
> rcu_read_lock() is preempt_disable(), __cond_resched() falls through to
> rcu_all_qs() which calls rcu_qs() to report a quiescent state from inside
> an RCU read-side critical section. That's a correctness problem beyond ju=
st
> the debug check.
>
> So the call can either reschedule (PREEMPT_DYNAMIC none/voluntary) or rep=
ort
> a bogus quiescent state (non-preemptible RCU). Could the justification be
> reworded to explain that the loop runs inside the iterator's RCU read-sid=
e
> critical section and must not reschedule or report a quiescent state ther=
e?
> The code change itself is correct and matches the existing pattern in
> tcp_abort() and udp_abort().

or maybe simply remove cond_resched(), hoping 7dadeaa6e851 would
resolve the scheduling issue.


>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/340203=
53095
