Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294776;
	b=3j+LLujL3FcOzEphvpXCdqBkyPkmbwrr1aNYpXuBey9FOiLcSnj6ATtl/QCs19tzgIMe
	 I5BuCPk0OFjbNxAmMY0/rbYNbFd4mrqTr4UIKX1JfYbZwme0O3Uq8I8mF1GBgZvjs50Yx
	 2jfDoKRrxjPr4sEhIrKrCr9TMDvrXvbszpXVWvEbUB2Azg/AfUihrzqeXLIch3MY6GqY8
	 5ny32NT6pOC40jS+qsv0EIxw6QPxTJf3NN2MoACORF1yzRbylwykUfFwFzqvH7qwSgR8y
	 vUY8xA23yzoubmailbtY1P9RvCE2BdgYi2Odk0+ouD8ky5IrB7565ZtJ4MY2hTBWVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=R9gXbOeTpbZuWe2yIPQcNtZrgS23nXQ+wWuvRY3jxBM=;
	b=3vXvRt26mJi/+wHyCF4S2gDDxZfPIgYTqubPXWdTytcyLEJxmLdxRwGRg+Q42fYB41dz
	 NBh05EaEpL3Plr4BWyl/tfZJ4/lWrR1uGJpqkchZXot0DL7mwf15RXMY0hKVxgJm2NPnr
	 FhNYABDAPa8WztD0ElhCQY3oqZNwlBcgGPJ/7e+lARvuoXQCPoqOevV1hTNjfsU3rTqcV
	 Z21B5gP4DGlJvSL15V7kYvRcyUPsy0LePdBWjHVvWqbTOH4upufmpfJBXS8XyCK/ZYCVN
	 fhl0x7M3uFAXI+u/xomQ0JZBqCr8murpOmhomk1OmGFvzlxpQPD1kp6qjPwGA+Rpd6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HmBo4XM0;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A692F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HmBo4XM0
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e601800e58so36942135ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793294775; x=1793899575; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9gXbOeTpbZuWe2yIPQcNtZrgS23nXQ+wWuvRY3jxBM=;
        b=HmBo4XM0keFzi449eNoOJoycWwntk7K2g7yGqHUBvxgL6z07MM2yfZ0/qhXk9Cq+/B
         7yMvarlYEUpPNLYASJOwhiqgwB9jhmn382mKkF9RtloA1MjytXeJBbNDGzuch/8FwDKD
         8+9WVrO/7UTllVn7k2T4v54vchjKoLO7keejckWQzYSS9uOAsccU71lJ9QN8sYtJp7qg
         McHY7w0cWEfJNMeiQuLhbfgAjT9rpOFaBv4YGDOJfnz780e6dn3x3yA+1duuohiR7rP8
         TR/J7cFMXesT7m3RC+mNcRJZnXe86z8dax1X8slhBF4Whit2CKxWgL1JbfOLEscavRuQ
         XzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294775; x=1793899575;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9gXbOeTpbZuWe2yIPQcNtZrgS23nXQ+wWuvRY3jxBM=;
        b=saWyMXVkWztWvmmPodF2z0/xBLZD1uOSnQigGueR5f2U3CrAKJmzl+skyqeh40OA6j
         BXd0ZdMYTsBKuTzO9A6/quuexMLEtt9lAFiup8EY4deGI8wvuxF/wjiUc/OYe1cuX2VR
         7pjnfI/XeK/k68fw2T8eG/CA75uAX24LCM/Wruj19/dQ/Y324DKVjN98wRXlBdB35SLQ
         VBLdahabtHJCUwDCme8VBR7ytoXgSiFUEIcYJm9s1dYO7Gin3JxfsxGh3VXoFPHivvbN
         wQYpWgAvlJniu9DspXUInNZpphFGMO/pjp12gMyPSt+PRG6EQ1Ht1OJKqr2AjzWYw+TJ
         jw3w==
X-Forwarded-Encrypted: i=1; AKwUvBxDl8TwiyhjhQmvHLa48x/qIaD2h4D+vHLZIhNFNh1K43bY+qtTc79Ne68GftzHR6BQeBMyVU9ZJf6rfDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhoXtow6Yg2IzfJ74yydROLIsichuy5bvt72nMe6mdwJj0wNEd
	NFoX/UwaNyFT8ooPIlZQorEUqHjSgpGibVY/S9bvUuDUeeVhpeyTDNE9QLmgeNA3O+mhen+iPrX
	GZGrhNg==
X-Received: from pleo17.prod.google.com ([2002:a17:903:2111:b0:2e8:ab6e:81d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8c4:b0:2dd:c053:a6f1
 with SMTP id d9443c01a7336-2eb364e7e09mr554585ad.35.1793294774832; Thu, 29
 Oct 2026 10:26:14 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:26:14 -0700
In-Reply-To: <6ae372ba.f57e0135.1770dd.0070.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <6ae372ba.f57e0135.1770dd.0070.GAE@google.com>
Message-ID: <auOBtkWSVJO1Ty3k@google.com>
Subject: Re: [syzbot] [kvm?] WARNING in kvm_vcpu_ioctl
From: Sean Christopherson <seanjc@google.com>
To: syzbot <syzbot+da2a2f350196c7a0a389@syzkaller.appspotmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c339f4010dea Merge tag 'platform-drivers-x86-v7.4-1' of gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15f440b1580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=119e5f4d0a8d39cf
> dashboard link: https://syzkaller.appspot.com/bug?extid=da2a2f350196c7a0a389
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12952929580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c339f401.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/ff23ecfc810c/vmlinux-c339f401.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/6554a89077aa/bzImage-c339f401.xz
> 
> AI-generated root cause summary:
> When a VM is terminated or marked dead (e.g., via kvm_vm_dead() due to an error
> in enter_smm() or migration), the KVM_REQ_VM_DEAD request is raised on its
> vCPUs. If userspace subsequently issues the KVM_PRE_FAULT_MEMORY ioctl,
> kvm_tdp_page_prefault() bails out upon observing KVM_REQ_VM_DEAD and returns
> -EIO. However, kvm_vcpu_pre_fault_memory() in virt/kvm/kvm_main.c considers -EIO
> an unexpected internal condition and triggers WARN_ON_ONCE(r == 0 || r == -EIO).
> In a production kernel without panic_on_warn, execution breaks out of the loop
> and cleanly returns -EIO to userspace without crashing or corrupting memory.
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=da2a2f350196c7a0a389
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+da2a2f350196c7a0a389@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> r == 0 || r == -EIO
> WARNING: arch/x86/kvm/../../../virt/kvm/kvm_main.c:4465 at kvm_vcpu_pre_fault_memory virt/kvm/kvm_main.c:4465 [inline], CPU#1: syz.0.17/6063
> WARNING: arch/x86/kvm/../../../virt/kvm/kvm_main.c:4465 at kvm_vcpu_ioctl+0x156a/0x17b0 virt/kvm/kvm_main.c:4744, CPU#1: syz.0.17/6063
> Modules linked in:
> CPU: 1 UID: 0 PID: 6063 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:kvm_vcpu_pre_fault_memory virt/kvm/kvm_main.c:4465 [inline]
> RIP: 0010:kvm_vcpu_ioctl+0x156a/0x17b0 virt/kvm/kvm_main.c:4744
> Code: 9c 35 8b 00 be 01 00 00 00 4c 89 f7 e8 4f b1 b5 03 e9 c3 f8 ff ff e8 85 35 8b 00 90 0f 0b 90 e9 2c f2 ff ff e8 77 35 8b 00 90 <0f> 0b 90 e9 38 fd ff ff e8 69 35 8b 00 65 48 8b 3d 99 02 36 14 31
> RSP: 0018:ffffc90003957c98 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 1ffff9200072af98 RCX: 0000000000000000
> RDX: ffff8880355fcb00 RSI: ffffffff81831d69 RDI: 0000000000000007
> RBP: ffff8880459f8048 R08: fffffffffffffffb R09: fffffffffffffffb
> R10: ffff8880459f803f R11: 0000000000000001 R12: fffffffffffffffb
> R13: ffffed1006abf960 R14: ffff8880459f8000 R15: ffffc90003957d70
> FS:  00007f7bf8c946c0(0000) GS:ffff8880d458e000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f0b9aa1ee9c CR3: 0000000037636000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl fs/ioctl.c:583 [inline]
>  __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f7bf7d9f559
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f7bf8c94028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f7bf8026090 RCX: 00007f7bf7d9f559
> RDX: 0000200000000800 RSI: 00000000c040aed5 RDI: 0000000000000005
> RBP: 00007f7bf7e36b20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f7bf8026128 R14: 00007f7bf8026090 R15: 00007ffcdd24ea18
>  </TASK>

#syz dup: [syzbot] [kvm?] WARNING in kvm_vcpu_pre_fault_memory
