Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BD941F359
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443166; cv=pass; b=qtHwbsiGKi2zNfHAJF98I2zCGQSfD7mvPtaHypXjy4SOO5XCLSw/38E/pkMey9uKWYBpFT8hcF3UWnafpyezopRUaBhSRMChBNhUB5PzDhzz4CLNjGTI+Kp+567StH0z6cG0p/uoXZiawTpJiLPL98jHMan7dL3C/kIIFcMVy9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443166; c=relaxed/simple;
	bh=cNyUgiHAc1OpzVC4kIHbtZu2xQfpQFZZ2m7gUGOvwQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzgNKiMYLnbTqIpY6kraPAFhIolfaRicrIbbToEcwwbEw3DUGUZ0OA/Co50GhWWERkgX07OoZM2oCFRDWIstDAOcyGp8CZFaxpfMzsfVZLROfDYO2eh7Au7XtRPr8Mkjnlb+wobKvPCnQUC3RHSHHgmoCjqZDEvsJW5n0NFiOU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vwne6rWB; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vwne6rWB"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530301ff353so28364231cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789443157; cv=none;
        d=google.com; s=arc-20260327;
        b=TKfenO9zijSa26Rl9MO1MOXCWMf3mndA63GyuChn+Jlnc1iPTgeJ1j5g6wiT7gowoU
         2HMgaRbDyWtGK38QgtDI0NvK2eAEIdaZZi7clDWE3tXFZSl9w9UCgDiQriuXKlJ2F4ck
         1/eSpuSa49g0H0UBi++XZZJPUbl01UYcHdl3jQQiOb1dA/EU6NyXPCj6XBtYy2a6T9+P
         /rAMe3hUkivI4HoNdvwDa5jEY0oJPV53inxdsGc+RlzvqYfvORyms/PiL6xnKfhfISVG
         v30Q7ZSfOtj4gKWbImA8YoXMswHmo5VaO6T+e/fkvHvho1DxNjFXzfCPKxFSFhEHJ1eW
         grBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWObjhMohUFlVKMQj21hIxDdB+FomHl/XtrzQrYZUHI=;
        fh=jFVyAAFyxWjPJzx9/D6Oo8iXe0swd7fDzHoERArmzpo=;
        b=iCnrNAJ6Gn9XNrDnPEWN8bgpog36TBNvDxyCLm0/QmDe7b82+h6lS0Le+unGS6aE+n
         AsXFJzew5h5X8+/Zs5PWnbvTw9H32qVvxncX8WC+i152XPWdrYCOukNPL4ahmPoMJ9CM
         RwzKE5NXdKPF+UdWqCcAeqVGnbV/sXZBCxuVbR6tklavuqvxyj3PKenRC65XLcRqN47j
         at9ydUzk2z4um1jmuwCkKLM36+Bb/1FJJPY/nvBvmNP8I88GEsKgmvivbTgxht91tVHS
         7b4v7V4a7l1VJsIqIwPsTQ4HY57tqqwoxtMLcqg4fS22w1FfG1Yelr/hc7GbU6MS4kW6
         /zhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789443157; x=1790047957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWObjhMohUFlVKMQj21hIxDdB+FomHl/XtrzQrYZUHI=;
        b=vwne6rWB+lbWeAqX5iKv9O4q3y69ilJ2pICDnLHb4aMPkYzkvBhgeqY5kS4IUF6a/C
         lFFHigxz+a66GVMNOzgD0KWLWNVoRKoRvTF/McDJfnFJAMUSf1yauXPCHaED/4vxFa2a
         c74nDD56lMfo7JLlaOmSUM7n+MXvSzRQ4uILT5NV1sM3qR/wJk9P4fNNvyUMPNzJudPH
         /6082qtIrNV88zmrXenxlkLxtAsleZriFYlrkepwne7MTNeOj3FwEZMP5cv1faU9+t3d
         i7WTSnP+kk9Ce/kor52/wQxo3vuRcQoWs5eEs/xqiNecYUs7e3jWzXc7ah0xvdybG0F0
         eAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789443157; x=1790047957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWObjhMohUFlVKMQj21hIxDdB+FomHl/XtrzQrYZUHI=;
        b=zVI2+oiis4LXufGCkYHRt42G5zTBbu2Yu8ULS+US1dTRz31H3/UKRFDzII3vjEaimO
         xScuS9Q5dGnUbwdRBrd/SvxxhhbVLmV3dFk2jJ5kgBClaRxx/yAKExFmo4tRpASRRN+8
         +r5lVLwQe2tWhql6zLOIKfcX2FVlLM5vPH6cqiYBjIZyg/Yw2OVPymSWlmsS7kSBF0Rs
         u2Q1GaXfWZcqcbthhioJ1BDxwJ3szKk5r9O0NGKFOgkQbRpHpzPbU7WFNb3m0NaZeDwP
         sQNrci7yx+2/aX13ZGOIrwU1jbZosAhJIGrrgqJoAdyGz+E0IiXhcMAdwd/ykyt+KFpd
         7jng==
X-Forwarded-Encrypted: i=1; AKwUvBwHXNnWtKsehPRt1l/IZ8WJohosXQ/VyI016zeQDdoFzbxv+6oo3HUGXZXZ9jfYMWqCfd/XaIC1qsEeG5c=@vger.kernel.org
X-Gm-Message-State: AFuF++mjBHCPQ7OaTwHn6sC6ieyciYBERSIL1DwD6hrkZsc4qcymEM5P
	8giE60w28dZxDRdJurApK87Ab5Rj7l+9RMqagg6c3N444oxQJb2IkkKKbMZtw/ni1i5mOiaUTbV
	LRHhGmxJdD6y5ca3WEjvcffl4MUf+U6SSenQXwY6i
X-Gm-Gg: AYBFou3d4NIuoe8TLNWj/Yotv6g8tF4gQ7shs8RhW9mth9L4MqocjUjkgVPBKerKH65
	HL8/+Of9+jSvFjIu3Us/THSecedrR7uCEoxp68XOMH68xtcxAT+gTQ5WREdyy5mkFcVufuCAFWN
	aUiCwanx3iJgRGlC5lfcTKi8lBReJPah+m8t23gKs0Uzp592+7aieDY1OY3Ny/3DRaFKTNYa99H
	FlhFMxu+lQzNQrSV9U2CW/ysHSB16JXchqQWqdJC9023V16cEnQNbrGMVIgqnan4O0Vukx3FNrd
	JI1AiMx94pWzKEXfaPTb1QXGtntScQRPLuOwJEb4BHXSeoAi2kzM+Xw4hOKIqGR14TLSYogUyqJ
	2icDJhm1goiEhvKWPUL5aY4beap6LuFFLws9xveE4tDBmhuzlgKYJjaXs5oX/WOd21QU=
X-Received: by 2002:a05:622a:5a0f:b0:530:42e5:f3a2 with SMTP id
 d75a77b69052e-5310d03126emr77108521cf.43.1789443149347; Mon, 14 Sep 2026
 20:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789284524.git.petalzu987@gmail.com> <619733e91a715790da8c4efd88f51897ff06e253.1789284524.git.petalzu987@gmail.com>
In-Reply-To: <619733e91a715790da8c4efd88f51897ff06e253.1789284524.git.petalzu987@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 20:32:16 -0700
X-Gm-Features: AcwNN1U7GCotunQsTYXYjB_YxjMuP5n5dmEUyI1TjjIDjqQV_GEfLMGHoJFfqMM
Message-ID: <CANn89i+YZP4X6WWvGJ2EkV5RshSiT50A0pxZe4un6jB2YKah+A@mail.gmail.com>
Subject: Re: [PATCH net 1/1] net: tcp: account zero-copy receive VMA memory
To: Ren Wei <weir@nebusec.ai>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kuniyu@google.com, pabeni@redhat.com, 
	willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	ncardwell@google.com, vega@nebusec.ai, petalzu987@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:46=E2=80=AFPM Ren Wei <weir@nebusec.ai> wrote:
>
> From: Zixuan Chai <petalzu987@gmail.com>
>
> TCP_ZEROCOPY_RECEIVE installs page references in a user VMA and then
> consumes the corresponding skb. The socket charge is released at that
> point, so a process can retain an unbounded number of receive pages,
> including page-table memory, by advancing through a large VMA.
>
> Reserve the VMA size in TCP socket memory accounting while the mapping
> exists. This charges the reservation to the socket memory cgroup and
> TCP protocol budget, and releases it when the last VMA fragment is
> unmapped. Keep the reservation across same-mm VMA splits and moves,
> disallow expansion and fork inheritance, and reject inherited VMAs from
> the zero-copy path. Use a strict accounting kind so ordinary receive-
> buffer minimum allowances cannot bypass the reservation limit.
>
> Fixes: 93ab6cc69162 ("tcp: implement mmap() for zero copy receive")
> Cc: stable@vger.kernel.org
> Reported-by: VEGA <vega@nebusec.ai>
> Assisted-by: LLM
> Signed-off-by: Zixuan Chai <petalzu987@gmail.com>
> Signed-off-by: Ren Wei <weir@nebusec.ai>
> ---


This is not a bug, and this patch would be a serious regression.

NACK.

1) There is no vulnerability here.
vm_insert_pages() accounts every installed page in the RSS of the
mapping process (insert_page_into_pte_locked() does
inc_mm_counter(vma->vm_mm, mm_counter_file(folio))), and the page
tables allocated for the mapping are GFP_KERNEL_ACCOUNT, as your own
stack trace shows (pte_alloc_one).
So the memory is accounted, it is attributed to the process holding
it, and oom_badness() sees it. Your own log says so :
[  701.147561][ T5539] poc invoked oom-killer: gfp_mask=3D0x440dc0
The OOM killer was doing exactly the right thing, and was about to
kill 'poc'. The kernel only "panics" because your reproducer does :
    sysctl -w vm.panic_on_oom=3D2
With panic_on_oom=3D2, any program doing malloc()+memset() in a loop is
a "kernel vulnerability". Please do not send such reports.

Releasing the socket charge once the skb is consumed is by design :
ownership of the pages moves to user space, exactly like a recvmsg()
copying into an anonymous buffer of the same size. Nothing is
unbounded, this is bounded by the address space the process mapped
and populated, and that memory is charged to it.

The Fixes: tag and the stable Cc are therefore not appropriate.

2) The patch itself is a much better DoS than the one it claims to
fix.
You are charging *address space* to tcp_memory_allocated at mmap()
time. Address space is not memory.
An unprivileged user can mmap() a few GB on a TCP socket, without
allocating a single page, and push tcp_memory_allocated above
tcp_mem[1]. The whole host then stays under TCP memory pressure for
as long as the mapping exists : every socket on the machine starts
shrinking its buffers and dropping packets. Repeat on a few sockets
and you reach tcp_mem[2].

3) It breaks the intended use of TCP_ZEROCOPY_RECEIVE.
The expected model is to mmap() a large region once and slide a
window through it for the lifetime of the flow. With your patch these
mmap() calls fail with -ENOMEM, or start failing at random whenever
the host happens to be under TCP memory pressure. This is an ABI
break, and it is not covered by any test. tcp_mmap.c in
tools/testing/selftests/net/ was neither updated nor, apparently,
run.

4) Implementation problems, in no particular order :
- __sk_mem_raise_allocated() and __sk_mem_reduce_allocated() are
  called from mmap(), munmap() and exit_mmap(), without the socket
  lock. sk_forward_alloc is bypassed entirely, so the socket
  accounting no longer describes the charge held on its behalf.
- SK_MEM_RECV_ZEROCOPY 0x100 overloads a 'kind' argument that is a
  small enum, used in the tracepoint, and forces a change of the
  fall-through in a core function.
- Adding a .close vm_op silently disables VMA merging, see
  is_mergeable_vma().
- VM_DONTCOPY and VM_DONTEXPAND are user visible behavior changes,
  proposed here for stable kernels.
- The reservation is never reduced on partial unmap : nr_pages is the
  size of the original VMA and the refcount only tracks fragments.
  Unmapping all but one page keeps the full charge forever, on a
  socket that sock_hold() keeps alive long after close().
- mmgrab() and sock_hold() are redundant. vma->vm_file already pins
  the socket, and vma->vm_mm cannot go away under its own vma. Once
  VM_DONTCOPY is set, the zc_vma->mm =3D=3D mm test is dead code.
- kmalloc_obj() does not exist in any of the stable trees you are
  Cc'ing.
