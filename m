Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3619E360EFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359230; cv=none; b=S1aAXDT/A7lSXI6Xbai/N2ikG6mNIuV6TgUe2DX79eYShru/MAMvAvOtgtC88PQE6j+c+6m5JjI0fw8atd118+kNmKZuBTptjjIyIfQ++tyqm0l7WSVkb3iwpGLZ1bbhMeXwMm12YSyXGr9keFNlnF27fyiuxfwA52nnCIG8yHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359230; c=relaxed/simple;
	bh=n6npgSmBNifImp8W3NIguLO/9tg1tliNBHKDMIQsXqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flwTL+SJ9PxZjbqISuCoqbqwUvKET6YomofWS3UPKpmMXMAfmfeYS6PwjJ14jxaLPUzV2j3a5/Lm9H3IzjgwtRRkDj3NrxjWlFvwV3WQ9c7NpOiKIudYI06+h4JGEQxSDL181MCARs1mYoR771qJNVuHG76UWDjG3ljW2XvoF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsWoDCCu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsWoDCCu"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1060224a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789359228; x=1789964028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/eutc18koqEJykqXSKdaf4pI6am7bxBMT6hFPvEeQyE=;
        b=PsWoDCCuwKB5qsibDQnf2kwHID3c311drD7lCvi0Kmur2w35Z1RAD1lrfGKj6CUt4T
         uAxna2wycLYaD7O+K/6Cj0uk0R6r9IxAPwGLQvrhziEBuQXx/tUdRkkrN5rNWB37Cq+Q
         KhOnDEKtkmIWPUoWhLxEB4g45e4MsOLTWNJWi+1Oh5+q8lRWLSY5bUHrUKHaZxWGHiFM
         u+ObAuMDTeHBt9Ri8AgH3ntuiA8yxpwOQq8QSVQsrG9Qu9ApI7sq5hJhvHEwEOHZnk7D
         zE8yz3OIzovtR9hD2JYL+r48++hsY6P5aLG6CCSCYQCQlsNpihrQp4JzIsNTl1X3iqm+
         8h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359228; x=1789964028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eutc18koqEJykqXSKdaf4pI6am7bxBMT6hFPvEeQyE=;
        b=R1q6KFLYb9+QXR591oh+R4jkvAJzsxQ7rAtOHZeq3kLcQb+vAl2t0AXIa2co87JmM6
         +sB5kMcqMLRCxPv5Q26TPzIHxGi0hFJyNK7FE+g0fJVp/AOghnEhZVj+IvO728HeYjVl
         t22y/Ycr5i/SaJANP9hv8kVZKcH3upFNmD5Z6yZbTer6V95YRFPgSil391mIRMEg39+Q
         /D0whIuDYnriuT9MK0PMyw2VkBDOmeVqwzAmZJNNQy/oShv30MebYLtT+CxUoytO2RnY
         cyysCq8LUW8KN80gaUaewhwYTcvg8NOqNmDffFgNB5v9eY2rjFXOOyZ2jyQ+jGaJuHMd
         VsWw==
X-Forwarded-Encrypted: i=1; AKwUvBxVAgmTwwYtpIQuGmx2XtT2cnpHFVRkg9FT7OdZxhtPL/uTn2q+FBWkkNtXfDyyytd5UyLY8SZHA2FORFI=@vger.kernel.org
X-Gm-Message-State: AFuF++n1TUQg7Jwh9URPhSuEKsj9HBtlP1Uq3fIybWcB6QeIFewGIBTN
	QyRtpw436JChxaOransbvux+lUhCTtZmVtM+s2x+zejz/6SZ8lpyvbdX
X-Gm-Gg: AYBFou0gQcyArKC2Yvq8S300hLvsjqlyJGT/sGCwKQy02VJz4HeUjzhJk2djFNCgDcZ
	MPX1b5R2OGqTqLRi4DU2oydj7abKJ7FdheWakLhBx0GCNPLbxb0l0f/skA25Y9lW9gOYBQlKBwo
	oPXEarMIlkYrSvkw9PBUnzVYP1ZROBU7cPjJbW+k5raR/6OIP4gcdnzlyzEtOo8KeJpmfkK/Ssn
	6xf2vt6e3CvdgTEBTRO4xXic/yX7V8KsFbzvL+pzaZOxlEoOq2b9haU+C9PN3X2S76Lk2WqiKoH
	+mzXZQcy3IWRnx58mnGaZdqrs6eXawJZu4NTXRVijWtrOfohKITZV2RyLCyMGBJh40l7yGwcf3S
	cUVEujHW5M4yuETjr3+gNd6/3valZPS/oUNV0iNwP6FA5dYEda3vhjUaXDuhbmRZRJrmjhhr+Kg
	TcA39ONDBxOf+7hI3RlUVb88WIipczoKJGFgILDO9ERho4iC4ehFxjOo99QXHuo13G2A==
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr1939982a91.18.1789359228512;
        Sun, 13 Sep 2026 21:13:48 -0700 (PDT)
Received: from omen-arch ([147.46.174.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d987e755fsm18783377a91.0.2026.09.13.21.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:13:48 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:13:39 +0900
From: Junseo Lim <zirajs7@gmail.com>
To: "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Leon Hwang <leon.hwang@linux.dev>, 
	Sechang Lim <rhkrqnwk98@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Hengqi Chen <hengqi.chen@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf: Skip detached progs in trampoline images
 that are still in use
Message-ID: <aqdrwVpanH3WGurX@omen-arch>
References: <20260912095924.866254-1-florent.revest@linux.dev>
 <20260912095924.866254-2-florent.revest@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912095924.866254-2-florent.revest@linux.dev>

I think there's still a correctness gap here.

> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> > index c18e005a41dbe..9c166bdfbc6a6 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -2429,6 +2430,10 @@ static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_node *node,
> >  	enter_prog = (u64)bpf_trampoline_enter(p);
> >  	exit_prog = (u64)bpf_trampoline_exit(p);
> >  
> > +	/* nop, patched to skip this prog when it is detached */
> > +	skip = ctx->ro_image + ctx->idx;
> > +	emit(A64_NOP, ctx);
> > +
> >  	if (node->cookie == 0) {
> >  		/* if cookie is zero, one instruction is enough to store it */
> >  		emit(A64_STR64I(A64_ZR, A64_SP, run_ctx_off + cookie_off), ctx);
> 
> [Severity: High]
> This is a pre-existing issue, but does this still leave a use-after-free
> window between the newly added skip NOP and the __bpf_prog_enter() call in
> invoke_bpf_prog()? 
> 
> If a task on a preemptible kernel executes this NOP but is involuntarily
> preempted before calling __bpf_prog_enter() (where rcu_read_lock or 
> rcu_read_lock_trace would be acquired), it hasn't blocked the RCU grace 
> periods yet. 
> 
> If another CPU detaches the program, patches the NOP, and drops the program 
> reference during this preemption, the program could be freed. When the
> preempted task resumes, could it load the now-freed program pointer and call
> __bpf_prog_enter(p) on freed memory?

I reproduced the scenario Sashiko pointed out in our environment:

     ==================================================================
     BUG: KASAN: vmalloc-out-of-bounds in __bpf_prog_enter_recur+0x3a5/0x3f0
     Read of size 8 at addr ffffc90000055040 by task candidate/110

     CPU: 1 UID: 0 PID: 110 Comm: candidate Not tainted 7.3.0-rc2-00014-g15071f2a1263-dirty #2 PREEMPT(full)
     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.17.0-2-2 04/01/2014
     Call Trace:
      <TASK>
      dump_stack_lvl+0xb0/0x110
      print_report+0x14b/0x4a4
      kasan_report+0x108/0x130
      ? __bpf_prog_enter_recur+0x3a5/0x3f0
      ? __bpf_prog_enter_recur+0x3a5/0x3f0
      __bpf_prog_enter_recur+0x3a5/0x3f0
      bpf_trampoline_6442509193+0x37/0xf1
      __x64_sys_futex+0x9/0x410
      do_syscall_64+0xb0/0x530
      ? srso_alias_return_thunk+0x5/0xfbef5
      entry_SYSCALL_64_after_hwframe+0x76/0x7e
     RIP: 0033:0x42a21d
     Code: d5 48 8d 3c 0a eb 91 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
     RSP: 002b:00007f1befda9128 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
     RAX: ffffffffffffffda RBX: 00007f1befda9ce4 RCX: 000000000042a21d
     RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
     RBP: 00007f1befda92b0 R08: 0000000000000000 R09: 0000000000000000
     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000021
     R13: 00007ffd400508a0 R14: 0000000000000010 R15: 00007ffd40050997
      </TASK>

     The buggy address belongs to a vmalloc virtual mapping
     Memory state around the buggy address:
      ffffc90000054f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
      ffffc90000054f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
     >ffffc90000055000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                                                ^
      ffffc90000055080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
      ffffc90000055100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
     ==================================================================

I used SCHED_DEADLINE to increase the likelihood of preemption.
This seems consistent with the preemption window described above.

Best,
Junseo
