Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793522386;
	b=Gfdj3ITDbuxeZP4DTDapBxCsAUIQ7O6PsGjGmmXlG1hK6vP8kgSRJVEe347iq794pXJG
	 GSlyuoIgqGaB57/r+l60la7in7mKjM4mAqm7jkSz9oQNeWBiuRNRyIwpVqucpvBlf1IOL
	 y7l1W6IcyIYTWVF0YJiOcsgKPOXzgjjUOVIzO7HTVf/4TiX6tzZoLBprjK9DaJMHfVdG9
	 MDEYxRJWpch8/iCdHv9XHO9DxyD/SQ+e3/UlDNFhVD1nVesQ+lk2uTohGsPRDbkWgTzos
	 VgT3bo0IB+lUV03ZM1yHH7gCzWPULpgfogyLOjSpOm7Gs4LnGqfCsSDFoZE189TeyPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FGhXGbB6V9XN0Vm9EMZ3W56UdEjS2FFaY0yHUlQ+zlo=;
	b=1+s959cGQr9hApPdz0uuVpK9fJo+zbMz7r8WQF0OH3wrAXvsgDolVYKw+XSw+vFM6BGl
	 xKh25oMZz6YVqGdD/bw2DVdZyPztz+/WoJjqhfWxunSKmOhgpUbQuPNGyQk1ZxNaWo7bE
	 uxwDsmMrykNZbioGepmKH9CD9kS97/vD/DztwRzHaZjIXXEbmLiUtAHENS5GO82C3dFkL
	 ISFS84OZMr/OTJn0gfRLxg1l6ZPVR5wBL3pGLQFtvPE/32youmdwJ7lA+ooPnaVDjN41s
	 pWIX+Qqgf9t0Pq20/auth2KmFQMmo0oVljfcLKkASJLD9S7g0CLefipkB2cUj7ljdlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJmVALpa;
	arc=fail smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC4A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJmVALpa
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c7a0c1617so36030486d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793522385; cv=none;
        d=google.com; s=arc-20260327;
        b=ftc9j6mevPcIQcHKMqUWAuPUOd/Ew7li06bzjc7C26IcAqvFnkwvqvEmLoSKEuPxw2
         7VkxuTkmjFqeIm0zPQgQJa0RGWbll7kamVTz2HMrptpsdwWnRd3BVDzFRystXYtVC4RM
         wBMFqxxD024O+lp+QC4MQU0ituIADpBvzoDIYOHVZjJdKhVQCuwD7+a9TNKk9rbh0u1s
         MNh5bxYcZ52NhEQ+r3FeLITF68fPGsA5hpy1FW/drpKPgX31K+T7rKyPo6b825o+xhhN
         8FQ5ZYBw90sFgmyWhaqThspLW4mrN36lqJMixioa79mjjm3Pw7HV3HNxKPHwNE06rvHs
         YQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FGhXGbB6V9XN0Vm9EMZ3W56UdEjS2FFaY0yHUlQ+zlo=;
        fh=pdctPq45nwqN50RsBBo1H/NW2oMMbx+Rv22okiZNLI4=;
        b=JoVW4GDrNnG7FG8kBEm0kcc087EFhTLHz+P5RC2RZWPd5TmWpiRyoT5GGC9W2IzV2N
         ph2rMYc9GgmcoPzJYr2QkRUGNHUbyrAImE88IV283+XsGuvVwiolhmcsdlRv17EAnob/
         pSO+1Cx4mdirvSfN9RlmgKe6J7uOrpUoJblHPcfzWNtMtcDNoDCGbtQIrH0fbja4XkM7
         q4MIMqMPdQ2GzpV4Ws1XBntrNoIIfevrMOANlPIM8674D/q3g5lp4n5bBti/eSAF/bEy
         Twq0DkgZpBKsas9wvLCe424ObV3EHEAQ7yxaQI1hKFbkm3rsqHfxnZ9mnPMRXM07rHuL
         D8/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793522385; x=1794127185; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGhXGbB6V9XN0Vm9EMZ3W56UdEjS2FFaY0yHUlQ+zlo=;
        b=HJmVALpace5D4ZTuPReY6psuslQP9IsqDZuFl5oB129APu2MQKb3xvTTvwTDvzJku5
         dpzeN1NJM3jywR4BJvD5k/4uUIW2Hzk7Rn/nNvpHmlxtyW7uuErURgO0eYqrZgmbZY5A
         P0Kdpfl28E0TK4bxjsNBHcVQA22CuZsaoP8UJxSRT5CSrzGscpif4ifpqHNBiQIgxl92
         QVVbIMW+GRsd6rUJIFQbT0GSSPZ++dXjQkIsQxe4/P1bJBNx8M17S4Vlq3gC1vzKawZp
         lIy+HLst3+KK+ZfRIaTwc/wlwvm6Tcbp9DE7Mj4VJDue/7kPOvShBKItUnhvWYUsBUTp
         UFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793522385; x=1794127185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FGhXGbB6V9XN0Vm9EMZ3W56UdEjS2FFaY0yHUlQ+zlo=;
        b=vtRJNd5KaxBxvWYJ2QPBrarGPHnexC8WM0Ml/msNMNx1klq8cTe5sQf8vYsiR5vn1V
         m3tLBrcWRQkFkmJJcx7F/RJ5hj3ZB3zVE64QBokCIpc7GFKQ0LoItRj7cEnbiDERZFUC
         wGRGzNUUAnsIgTwOWdQnVS+ZfzyyndJflWtyPwLwsAXSs9Qb5njAcqv9ndaToXIiOBVj
         C52JAoPhcxoiWWXvIZuZkcgktudm42fyXLYz457nBYSC5AeMOZ8kc7hBlC2kBjVzJoEC
         1pFkzIwfgGWUtkiS47nJWOAtiefTC99QgVsxW5RavaEcFr94mNMlIIzoqmxzqIEOnEMw
         1NRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4VkH0WNdQbBg/LRd2V/ZJBvNTbw5Zhai81JfAdtm11nEkuLtoYqb6BMdJkbzrEEo76Mk7fb7B7bOr3/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXALBKjibf+Q0JIHSeRf+ryrDynFdJcaeTX52nl4Lpr/Tp+Jzw
	RQ9MSo+smMPFJ2I4ugDC3BcZZOCdZw7LaNTEff/CqK/sbHGBBF+p4+R0CdlwlN9LCEIMvX9gvLv
	XzPe15F5yqk0i2tGCbM1xT/z8Gp50gAI=
X-Gm-Gg: AYBFou0Gh4kufOGbidZm5YbYS+Ipl4SRZFgKV1zRCeXzc52X8VPR5fGTIXhr1+C1ueT
	yiCOLopRD4TRd8uEfNWwchwcDmqNGDJ530wUHSTDWEuabwKp4ivx1uhNPAQjW595oavXxfc0oeP
	y+vXtF8wAjnARxuJpn7FvNIAH5fbOjNevQCCWzCTFamyAlygE1nwQ+uyHi2Besg7zty41aved0f
	VCx8m54QHIhmqTrQkNbbz+GegHY+pRnRe+OoeQvRfgjc5QLq18ktCIQBhf1bDMQVNBm98GdZII7
	vUxb6wM3pN1R54IIJpep1b/z3u3G9NEGlBLDbS1b3OBgqSQ0Iv/M6yOj4ppN82rscPEq+MRoxji
	zsqs7ISZQsO6H5J8YBDhZqnFBf23p2qaWQ7/YtJxtkNga6qpavJ7Q6OBri+9LL6rJMyD9Vj4sai
	xc9v1H6V6eIjI+PwESpxv1D6lH
X-Received: by 2002:a05:620a:414f:b0:93e:9171:b83 with SMTP id
 af79cd13be357-944216970c2mr1129754285a.43.1793522385162; Sun, 01 Nov 2026
 01:39:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGD-p3J3nnDhghOMCOy6jk0UQzBysut1sbS7wn6bdF75KZJPbQ@mail.gmail.com>
 <20261031152321.789132-1-roland@wcopy.net>
In-Reply-To: <20261031152321.789132-1-roland@wcopy.net>
From: Kris Globtrotter <kris.globtrotter@gmail.com>
Date: Sun, 1 Nov 2026 09:39:09 +0100
X-Gm-Features: AclHuK-CiAD492gom2cKp5nZ6QEHaUhYiLxNN7EQW7fEKfz5faSk0ia7eYqIdvA
Message-ID: <CAGD-p3JJTjkZTG=Z0ZN-j0fRvph+oANSyPLqWDpn_diN3G5oRQ@mail.gmail.com>
Subject: Re: NULL indirect call in xs_read_stream_request, leaked socket lock
 wedges all NFS traffic
To: Roland Wunderlich <roland@wcopy.net>
Cc: linux-nfs@vger.kernel.org, x86@kernel.org, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 31, 2026 at 4:23 PM Roland Wunderlich <roland@wcopy.net> wrote:
> Kris: which microcode revision and stepping are you on
> (grep -m1 -E 'stepping|microcode' /proc/cpuinfo)? Could you try
> clearcpuid=fsrm?

Hi Roland,

Answers to your questions, plus a third oops from this machine that
was never posted anywhere.

Hardware: ASRock Rack W680 WS, BIOS 21.12 (10/25/2024), i5-13500
(06-bf-02: model 191, stepping 2), 128 GB DDR5 ECC, bare metal
Proxmox. NFS client is the host, server is a TrueNAS VM on the same
host, NFSv4.2 over TCP via a virtio bridge. Workload: a couple of
dozen containers doing many small, concurrent RPCs on the mount
(metadata, random reads), not sequential whole-file reads.

Microcode: 0x3d, unchanged on all 30 boots since 2026-08-02 (journal
"microcode: Current revision: 0x0000003d" on every one). The BIOS
ships 0x35 ("Updated early from: 0x00000035"); 0x3d is early-loaded
from Debian's intel-microcode 3.20251111.1~deb13u1, i.e. the November
2025 release, not 20260210. So all three of my oopses happened on
0x3d, and the 52 days without an oops since then are on the same
0x3d. Microcode is not a variable here. Whether 0x3d for 06-bf
corresponds to your 0x3a or 0x3e for 06-97, I don't know.

Timeline (all on 7.0.14-12-pve):
  #1  2026-08-24 11:23  Oops 0011, RIP == R12 (stack address, NX)
                        -- the one on the Proxmox forum
  #2  2026-08-27 02:56  Oops 0010, RIP = 0x8
                        -- the one that opened this thread
  #3  2026-09-10 05:17  Oops 0011, RIP == R12 again, full trace below

Since #3 the host has run 7.0.14-15-pve (from 2026-09-10 11:22) and
7.0.14-20-pve (from 2026-10-10): 52 days, 0 oopses, same workload,
same microcode, same NFS mount options. The kernel change happened
six hours after #3, so I can't separate "kernel" from "coincidence";
I'm not claiming -15/-20 fixed anything. The -13/-14 changelogs had
nothing touching sunrpc, which is why I had stayed on -12 until #3.

Oops #3 has the same register pattern you describe:

  RCX = 0
  RAX = RDX = R14 = R15 = 0x1000
  RDI = ffff8dc102fe1000  (page-aligned destination + 0x1000)
  RSI = ffff8dbdd3c1106c, R08 = ffff8dbdd3c1006c  (source + 0x1000)
  RIP = R12 = ffffd2d32e31bd68  (a kernel stack address -> NX fault)
  first trace entry _copy_to_iter+0x27f

so the 4 KiB copy had completed and execution continued at the value
of R12 instead of returning.

Not thermal as far as I can tell: CPU package 30-55 C in normal
operation, no thermal events in the journal around any of the three,
and #3 happened at 05:17 under night load.

I haven't run clearcpuid=fsrm: with no reproduction in 52 days a
host-side test would not be informative, and an oops on the host
wedges production NFS. If the x86 people think a third data point
matters, I can run your dd loop in a throwaway KVM guest on this host
against the same NFS server, 24-48 h with and without clearcpuid=fsrm.
Say so and I'll set it up.

Thanks,
Kris

----------------------------------------------------------------------
Oops #3 (2026-09-10 05:17 CEST, 7.0.14-12-pve, bare metal)
----------------------------------------------------------------------
kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
BUG: unable to handle page fault for address: ffffd2d32e31bd68
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0011) - permissions violation
PGD 100000067 P4D 100000067 PUD 1008d6067 PMD 19278a067 PTE 800000194a6f3163
Oops: Oops: 0011 [#1] SMP NOPTI
CPU: 16 UID: 0 PID: 1935713 Comm: kworker/u80:6 Tainted: P           O
       7.0.14-12-pve #1 PREEMPT(lazy)
Tainted: [P]=PROPRIETARY_MODULE, [O]=OOT_MODULE
Hardware name:  W680 WS/W680 WS, BIOS 21.12 10/25/2024
Workqueue: xprtiod xs_stream_data_receive_workfn [sunrpc]
RIP: 0010:0xffffd2d32e31bd68
Code: ff ff 00 fc 08 00 ac 8d ff ff 10 c6 b2 cb bc 8d ff ff 0c 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <02> 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 5b 70 bf 8d
RSP: 0000:ffffd2d32e31b988 EFLAGS: 00010286
RAX: 0000000000001000 RBX: 0000000000006f94 RCX: 0000000000000000
RDX: 0000000000001000 RSI: ffff8dbdd3c1106c RDI: ffff8dc102fe1000
RBP: ffffd2d32e31ba18 R08: ffff8dbdd3c1006c R09: 0000000000000000
R10: 0000000000000000 R11: ffff8dac041d6100 R12: ffffd2d32e31bd68
R13: ffff8dbf705bf000 R14: 0000000000001000 R15: 0000000000001000
FS:  0000000000000000(0000) GS:ffff8dcb5db0e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffd2d32e31bd68 CR3: 000000130c63e005 CR4: 0000000000f72ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? _copy_to_iter+0x27f/0x610
 ? __ip_queue_xmit+0x19b/0x4e0
 ? __check_object_size+0xb4/0x270
 ? __pfx_simple_copy_to_iter+0x10/0x10
 simple_copy_to_iter+0x3e/0x70
 __skb_datagram_iter+0x1b8/0x2f0
 ? __pfx_simple_copy_to_iter+0x10/0x10
 skb_copy_datagram_iter+0x39/0xc0
 tcp_recvmsg_locked+0x836/0xb00
 ? __tcp_send_ack.part.0+0xf3/0x1f0
 tcp_recvmsg+0x83/0x1f0
 inet_recvmsg+0x51/0x130
 ? apparmor_socket_recvmsg+0x64/0x80
 ? security_socket_recvmsg+0x70/0x1e0
 sock_recvmsg+0xb6/0xc0
 xs_sock_recvmsg.constprop.0+0x2c/0xa0 [sunrpc]
 xs_read_stream_request.constprop.0+0x255/0x4f0 [sunrpc]
 xs_read_stream.constprop.0+0x2b3/0x450 [sunrpc]
 xs_stream_data_receive_workfn+0x71/0x160 [sunrpc]
 process_one_work+0x1a9/0x3c0
 worker_thread+0x1b8/0x360
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xf7/0x130
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2da/0x3a0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
note: kworker/u80:6[1935713] exited with irqs disabled

Blocked worker three hours later (kworker/u80:4+rpciod):
[<0>] __lock_sock+0x7c/0xd0
[<0>] lock_sock_nested+0x54/0x60
[<0>] tcp_sock_set_cork+0x19/0x60
[<0>] xs_tcp_send_request+0xe3/0x360 [sunrpc]
[<0>] xprt_transmit+0x1be/0x4b0 [sunrpc]
[<0>] call_transmit+0x7f/0xa0 [sunrpc]
[<0>] __rpc_execute+0xbb/0x4e0 [sunrpc]
[<0>] rpc_async_schedule+0x33/0x50 [sunrpc]
