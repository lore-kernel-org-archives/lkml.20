Received: from mta0.migadu.com (out-190.mta0.migadu.com [91.218.175.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79F4A499F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639484; cv=none; b=p4G+HU1ZHBjE/5s7npd7+CqxOjeqd6ydlVKd9kkDhO++jhJuv1gXwY14MjqSlMx/HucYTWPC2mXGgLXw4lofauGjOEIzCnEw9TOv6XE9MgabOsDXXRX1LKCa9kIWYIR+8zTcZXqa6HBFSQbVb0WdAq8JCtTdw33vfQwFu9POscU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639484; c=relaxed/simple;
	bh=PfSPfdA29QNftKronz+oB+BrYg40uYjBrvjokpDGwaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvkHAJtG9nPesOR4kvcnmO5Z9Ukm92u49Fi/FyrF4RlUqyvRHSqgOjztj92NY4DuQBrNvcL5YhGR/FZ0QSyTbnr0wPsruq2/OlQbIkSo+amhz0VghPTrhlquzj8HU/AUbdq5RK+1VfNrVbiKQm3XOAXqes4ogHQrhbyyGefk4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S/XL19qu; arc=none smtp.client-ip=91.218.175.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S/XL19qu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PfSPfdA29QNftKronz+oB+BrYg40uYjBrvjokpDGwaU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789639472; v=1; x=1790244272;
 b=S/XL19quJ5w4BP3O3tOd+6xeK1sunrN45Yp2pPc+JaA0sQexJiWu9YwZJIpFvw5/GWTd8hK2
 Fyq42qLii3v/Cqo0xDjvmYGewkFHldPKOZ0FPsbdqqyGeICbf7zrIi0joLhr2nx7xkTycmTRjfn
 GC6NzGoaY5hs9klgiXQG/zqs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 651d09faf20df484;
	Thu, 17 Sep 2026 10:04:32 +0000
X-Mizu-Trace-ID: 651d09faf20df484
X-Migadu-Flow: FLOW_OUT
Message-ID: <a48cbcfa-5b33-4584-a9fe-9fbb3c4d3039@linux.dev>
Date: Thu, 17 Sep 2026 18:04:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] tcp: annotate lockless access to sk->sk_err
To: quanyeyang@proton.me, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 Geliang Tang <geliang@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260912-mptcp-sk-err-net-v3-1-c41383878bde@proton.me>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260912-mptcp-sk-err-net-v3-1-c41383878bde@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/12/26 11:43 PM, Quanye Yang via B4 Relay wrote:
> From: Quanye Yang <quanyeyang@proton.me>
>
> BUG: KCSAN: data-race in do_recvmmsg / mptcp_recvmsg
>
> read-write (marked) to 0xffff8880134d391c of 4 bytes by task 2619 on cpu 1:
>   instrument_atomic_read_write include/linux/instrumented.h:113 [inline]
>   sock_error include/net/sock.h:2565 [inline]
>   do_recvmmsg+0x50c/0x580 net/socket.c:3049
>   __sys_recvmmsg net/socket.c:3144 [inline]
>   __do_sys_recvmmsg net/socket.c:3167 [inline]
>   __se_sys_recvmmsg net/socket.c:3160 [inline]
>   __x64_sys_recvmmsg+0x161/0x180 net/socket.c:3160
>   x64_sys_call+0x19c7/0x1ca0 arch/x86/include/generated/asm/syscalls_64.h:300
>   do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>   do_syscall_64+0xde/0x3d0 arch/x86/entry/syscall_64.c:84
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff8880134d391c of 4 bytes by task 2620 on cpu 0:
>   tcp_recv_should_stop include/net/tcp.h:3086 [inline]
>   mptcp_recvmsg+0x54d/0xd50 net/mptcp/protocol.c:2466
>   inet_recvmsg+0x204/0x210 net/ipv4/af_inet.c:894
>   sock_recvmsg_nosec net/socket.c:1151 [inline]
>   sock_recvmsg+0x11a/0x140 net/socket.c:1173
>   ____sys_recvmsg+0x14b/0x3c0 net/socket.c:2933
>   ___sys_recvmsg+0x116/0x160 net/socket.c:2975
>   __sys_recvmsg net/socket.c:3008 [inline]
>   __do_sys_recvmsg net/socket.c:3014 [inline]
>   __se_sys_recvmsg net/socket.c:3011 [inline]
>   __x64_sys_recvmsg+0xeb/0x160 net/socket.c:3011
>   x64_sys_call+0x1319/0x1ca0 arch/x86/include/generated/asm/syscalls_64.h:48
>   do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>   do_syscall_64+0xde/0x3d0 arch/x86/entry/syscall_64.c:84
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> value changed: 0x0000006b -> 0x00000000
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 2620 Comm: syz.2.33 Not tainted 7.2.0-g39d4f32c5d53 #76 PREEMPT(full)
> Hardware name: QEMU Ubuntu 26.04 PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
>
> do_recvmmsg() and getsockopt(SO_ERROR) call sock_error() without the
> socket lock. sock_error() clears sk_err with xchg(), which races with
> unmarked loads of the same field.
>
> KCSAN reported the unmarked peek in tcp_recv_should_stop(). The same
> lockless writer races with the other plain sk_err reads on the
> TCP/MPTCP send, recv and splice paths.
>
> Annotate those peeks with READ_ONCE(). No extra ordering is needed:
> the value is only used to decide whether I/O should stop. This does
> not consume sk_err; the check-then-sock_error() TOCTOU on the no-data
> paths is a separate issue.
>
> Suggested-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Link: https://lore.kernel.org/netdev/8bbee583-6f21-4817-bfeb-2d60057380a3@linux.dev/
> Reported-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/632
> Signed-off-by: Quanye Yang <quanyeyang@proton.me>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

There are a lot of pre-existing issues, though.
