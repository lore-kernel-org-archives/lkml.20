Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D271F875A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788397947; cv=pass; b=nq0dIej36kBHdBW7Wgh1p0+dQciHJJj3iSTBf9Hqxx44UdAf4ZghnKArUPLMsH4tgI4LMhyH1LWy8Ouh3HSHYpfKjOQ6JgzTaQZtqkspGNElVS9oH62i5ZLSx/VGc7WNDP+vhgkXD7fn/bLrm648WXggmNdKDzdGi+2XdmbYE9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788397947; c=relaxed/simple;
	bh=lITyG/ugOeRl8PmRk5pIGyxQLnZl/RN4VVvJcS6zP4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MY7ZJZFiHBi4Btxgvv5sXWIc+ZrK8V7oHWY1g81AifNViUBCDaF+n1s2h0Z8vuaEX/228B6I7B/7q37NJbSHBMS4oRQb/oNhXZcc7BbKLW146yZfJ7RTLLBGzzjp6j6T7Y8wrBWJ5qlcA+yBhR2FnKotxNNvvK5oC16LbxWKlU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UUuHtaWt; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UUuHtaWt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1685938a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788397945; cv=none;
        d=google.com; s=arc-20260327;
        b=lUAD3fg1rWrfaxdSfcY8rrhZz3f4xnnGUcMfrgO5MwvdK8zY+CMsDlb8mIJg7Oy3nE
         rEppAwiDKB/Wtm3RBvNsOFBvXmdp/vqt46k/JwY8NEKazPAr+3eL//YsAaAsZ6jOElQq
         ghWxqMCdp2vy/IOCKjmWk0fWIHmlQxAbkbJSYYhgGZrGhTLn6ql5S1ipkkRg+pMCLlGP
         hU+Wd/kvzmqbL+Yfvh7HxlTBOYCXqvBMfWmrfjjVRQqYrAGIQNPs2N3slIyw44hT3D9w
         td4pP7S9XdbRrHlasa+qjiUPs1pnHCjFszpiN6ulagzZB+Vh5CUHDQJB7hBfFW+brjbN
         XODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MpHxOT42sl3piuXXJ896Oym4XTgE/f5kuK8w0b2FjU8=;
        fh=mfI4h7wKxLDKTcHJyc6AdAAZB85r0a4IKlbbdJKEuHI=;
        b=h2QyhnBu2dqwzNUvfxMvpaS6V8QDAndiBA/fYoqO7JODXXt3pmx8NcbxLYIsaE01PO
         XwOJftoa+y1VAjfPQkoUdQgGuyF/c4WNx2Vw2tFWyvp2vJxZZeqURaybBJqc1gSr5jM9
         0n2pPwE8gssgtdCcMv3S9TIoCBmd9behdQYnk+kvvfAJEyfp6GKbRVSLg+m/GFdGNbLO
         3O37sjGPLmyd2ZgM/DTBFYFqKI/j8IdCtW4DBSjtsgSblSUj5b1Cd1RNBNL+8dJl91tc
         CcW4WZWLcpE6pmDRlOSPOZYV09eu8J+htHyIOjAEknykf/DVKpg40plNy2QwCAtBztXr
         8NqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788397945; x=1789002745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MpHxOT42sl3piuXXJ896Oym4XTgE/f5kuK8w0b2FjU8=;
        b=UUuHtaWtl7+ELKlXkcq5WRkQQ2hRWgfjpHHS9hVF7m5rEpt2iGNmXUg01mhsw7xhfp
         HE4dFRg91KhldYtq0QN6qBcsF3SP+iOvJrXz0PttTLCJj9MJnAgvvjo1Wbb0+vDsVz+8
         qOXdJomj+jNw/oIJ2va4aqamh839ds+7HZFviRPli3CNUgbemao8j2yeRhUTkB4sQ3h+
         eBaRKNDSRFoY8ikYt2u3RRY9D5yvJCZdJk/lehKf9EX7aMbDmB+MypYB4DAms3dccHJY
         M5nF+mZ9NxGW3MwfJ5VUlWNrsOrwzeoceJI81I11cbbeKX/ASE8MZkYIpdo2CZk1PJE1
         3jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788397945; x=1789002745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpHxOT42sl3piuXXJ896Oym4XTgE/f5kuK8w0b2FjU8=;
        b=I65i806sYmjmo4DirgoD1ZmqyBKd8mLGqI7XmxtcQsKxEFCAVXfCwMzOgsTAd0ohNB
         mjsZjX1D6fY+dcsfT60sFJ6RhP3zup3TqrMD2/CxdTG6wiVGVkO3U/FPWud4E5kAD+yy
         NdhS+H/+QJ592d0yUcrMYa5nNDqVVHnJ+rIvycoiAhErGxW2i6yfA/ElVY3Qg9X42L0p
         NXftEbCPrDghE+HVfoItdHd+jf567bUxKBm+bQS3DiFAjfLVggWc0eL9NC+9DnutZmL1
         phCUbU+WYqG22EmGIMa/+OA43sML7lz7idqJBtu1BHM6f5g0uQGr/eUT465WjW3gzo2d
         iv2w==
X-Forwarded-Encrypted: i=1; AKwUvBwL/19/6Rs8QAJ4IpOjO79lMeIuVgA/lpT0goAhNqKdSaW2yDrsfbIi9FNkhc7ksqwf2J6kG5bjFFFJuiU=@vger.kernel.org
X-Gm-Message-State: AFuF++l3IZ4+SOBm3d4yCzD4h76/27MN2PjN8CkQZMldH2SX0Hw4XV5C
	ozg4YjDGZpTtOexW0n3MUi7GFQiqKggNQfPYFecHiIDm3RuHGWKRVjZ2tLZEZbKBLyfrfccm7Z6
	UhQvJCQLLEnc9WJ3sDw/E7yAvyCDFhio7dohcFyMd
X-Gm-Gg: AYBFou1zn12Zuq0SyXDDPSv6c1Wso37fKk2Mv/kfYm4cdOQyg3E9gR1zsUFpH9kziIy
	Uli+EOF8qXpanJBLhlJidbrU8E+ztRFPj8ElScH5O1FFeF+AXfd76KnjkCXumKfumijrTXbKb28
	QWJmryrsECAykiVoYrjRUSxl6RoNo97RnxI8EBsO+MQiZNpBBI5hgLgEmINI+QDoH166tdsuw8Y
	EbXMGDqj31Dcmlp4leN6/Y9T6G5jQ8d7bLdzXgZBEeiyWA5J6ELtT+faVHAmaGnnwmM4x0+Cr4+
	03zdUzh6aeguRFrdIQzGKQMBEoDDPVe+m8/RRBqd4SaFHjvcFI8iOkFpSE3kO7coR2foMGp/FXR
	1eIMhR6Xz7JYagxKg/Tl27g2NjKdJ9CntfhDicCfUipol4+iXhJYFLl7SL99KiwSqSLZ1LrSK1X
	O+1vhhXwL6x7xu
X-Received: by 2002:a17:90b:2d4d:b0:399:1b64:e0d7 with SMTP id
 98e67ed59e1d1-39aee108918mr14077532a91.19.1788397944284; Wed, 02 Sep 2026
 18:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKT_hvzXo14ER3NOc3pWhNmXbp0suVoQ8D+KmC2YzrfrBhWb+g@mail.gmail.com>
In-Reply-To: <CAKT_hvzXo14ER3NOc3pWhNmXbp0suVoQ8D+KmC2YzrfrBhWb+g@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Sep 2026 18:12:11 -0700
X-Gm-Features: AcwNN1W56uQoHrTLYe3Lblfc6qZZHWnzS6UFiwHe5mYgxk3-gzZs2Q0kf4Z-l-o
Message-ID: <CAAVpQUCMxvcsAkcyxLp5D57ztMeH3ZqF7BxsxU9529NHhVGDGQ@mail.gmail.com>
Subject: Re: [BUG] tcp: NULL f_inode in listening_get_first() leaves listener
 spinlock held
To: Ville Poutiainen <villeaj.poutiainen@gmail.com>
Cc: edumazet@google.com, ncardwell@google.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:54=E2=80=AFPM Ville Poutiainen
<villeaj.poutiainen@gmail.com> wrote:
>
> Hi,
>
> I encountered a kernel NULL-pointer dereference in the TCP proc iterator
> on Fedora 44, followed by a persistent listener-bucket spinlock lockup
> when another process later read /proc/net/tcp.
>
> Fedora bug with sanitized logs, exact kernel configuration, and decoded
> vmlinux analysis:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2527805
>
> Affected kernel:
>   7.1.10-200.fc44.x86_64
>
> Architecture:
>   x86_64
>
> Initial failure:
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000230
>   #PF: supervisor read access in kernel mode
>   Oops: 0000 [#1] SMP NOPTI
>   CPU: 1 UID: 1000 PID: 1634 Comm: pasta.avx2
>   RIP: listening_get_first+0xc0/0x120
>
> Call path:
>
>   listening_get_first
>   tcp_get_idx
>   tcp_seq_start
>   seq_read_iter
>   seq_read
>   proc_reg_read
>   vfs_read
>   ksys_read
>
> The userspace syscall was read(fd=3D16, ...). The process was pasta,
> performing automatic port discovery by reading /proc/net/tcp.
>
> I obtained the exact Fedora debuginfo/vmlinux matching the affected
> kernel. Its Build ID is:
>
>   4c9470ef910bac97b4554b740c84f337cada5950
>
> GDB against that exact binary shows:
>
>   struct seq_file.file     =3D 0x60
>   struct file.f_inode      =3D 0x20
>   struct inode.i_private   =3D 0x230
>
> The relevant instructions in listening_get_first are:
>
>   +0x8f: call _raw_spin_lock
>   ...
>   +0xb8: mov 0x60(%rbp),%rdx
>   +0xbc: mov 0x20(%rdx),%rdx
>   +0xc0: mov 0x230(%rdx),%rdx
>   ...
>   +0xff: call _raw_spin_unlock
>
> At the fault:
>
>   RDX =3D 0
>   CR2 =3D 0x230
>
> Thus, as far as I can tell from the exact binary and register state,
> seq->file->f_inode was NULL while the active /proc/net/tcp read was in
> progress. The fault occurred when the code then accessed
> inode->i_private.

This seems true based on RPMs from here,
https://koji.fedoraproject.org/koji/buildinfo?buildID=3D3085139

$ echo "listening_get_first+0xc0/0x120" |
./scripts/decode_stacktrace.sh
../usr/lib/debug/lib/modules/7.1.10-200.fc44.x86_64/vmlinux
listening_get_first (./include/linux/proc_fs.h:125
net/ipv4/tcp_ipv4.c:3305 net/ipv4/tcp_ipv4.c:2470
net/ipv4/tcp_ipv4.c:2497)

but it should never happen; at least f_inode should not have
been NULL in proc_reg_read(), which also uses file_inode()
for the same file.

[513008.658057] HOST kernel: RIP: 0010:listening_get_first+0xc0/0x120
...
[513008.658179] HOST kernel:  tcp_get_idx+0x2d/0xa0
[513008.658189] HOST kernel:  tcp_seq_start+0x70/0x230
[513008.658195] HOST kernel:  ? seq_lseek+0x8d/0x110
[513008.658203] HOST kernel:  seq_read_iter+0x10b/0x4b0
[513008.658211] HOST kernel:  seq_read+0x12e/0x1c0
[513008.658218] HOST kernel:  proc_reg_read+0x5a/0xb0

Maybe the third-party module corrupted memory.

Please do not report stack traces with OOT modules.


>
> The listener hash-bucket spinlock had already been acquired and the
> Oops occurred before the normal unlock path.
>
> The kernel continued after the Oops and reported:
>
>   note: pasta.avx2[1634] exited with irqs disabled
>   note: pasta.avx2[1634] exited with preempt_count 1
>
> A few minutes later, "ss" became permanently stuck at 100% system CPU:
>
>   native_queued_spin_lock_slowpath
>   _raw_spin_lock
>   listening_get_first+0x94
>   tcp_get_idx
>   tcp_seq_next
>   seq_read_iter
>
> The listener-bucket lock address in the original pasta Oops was:
>
>   ffff8f0d05894ec0
>
> The later ss soft-lockup was attempting to acquire the same address:
>
>   ffff8f0d05894ec0
>
> The watchdog subsequently reported the task stuck for 26, 52, 85, 112,
> 138, 164, 190, 216, and at least 253 seconds, together with RCU stalls.
> The machine ultimately became unusable and required a forced reboot.
>
> Crash-time userspace configuration:
>
>   passt/pasta:  0^20260728.gf8df3f1-2.fc44
>   RootlessKit:  3.1.0-1.fc44
>   moby-engine:  29.7.2-1.fc44
>
> RootlessKit was running with:
>
>   --net=3Dpasta
>   --port-driver=3Dimplicit
>
> which caused pasta to use its automatic TCP/UDP port scanning path.
>
> The first Oops was tainted G OE due to the NVIDIA out-of-tree/unsigned
> modules which were loaded on the system. I have not reproduced this on
> an untainted or vanilla upstream kernel.
>
> This failure has occurred once. I have not deliberately reproduced it,
> because once the Oops occurs the leaked spinlock can lead to a
> system-wide lockup.
>
> The machine is now running Fedora kernel 7.1.12-200.fc44.x86_64, but I
> also changed RootlessKit to the pesto port driver. The current pasta
> instance uses --tcp-ports=3Dnone --udp-ports=3Dnone, so the original scan
> path is no longer being exercised. Therefore the absence of another
> failure on 7.1.12 does not establish that the kernel issue is fixed.
>
> I have not established whether the underlying cause of the NULL f_inode
> is a struct file lifetime/reuse problem, other memory corruption, or
> something else.
>
> The Fedora bug linked above contains:
>
>   kernel-crash-public.txt
>   kernel-config.txt
>   vmlinux-analysis-public.txt
>
> The first file contains the complete initial Oops and subsequent
> soft-lockup/RCU traces. The vmlinux analysis contains the exact
> disassembly and structure layouts from the matching Fedora debuginfo.
>
> I currently do not have enough spare compute resources to run a
> controlled reproduction on current mainline, but I can provide
> additional targeted information or perform a specific test later if it
> would help identify the cause.
>
> Regards,
> Ville Poutiainen
