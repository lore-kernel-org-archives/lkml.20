Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538074A6898
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061300; cv=none; b=RvRkNsjiHJCMZMBZ+hWE/4DO3h+94jo2T1T3uVfXBJVX/78D6UFSUsEBTW2XDozOo2tSbDp8UCft/QWS2gfubIdPG+MgRI/UyY3OSKUxN5ZW+NyA0j75Bl+od418i0X1F+QHAPJHxMzTVAmSxZkceuNuP9XhqLwq6VziMTQGo8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061300; c=relaxed/simple;
	bh=Rf/9b7lCj58KFxVkCT8nPcKaYhvwKdnF4BCBIc33WDQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CwWiRAZRJhVMgYdJHNWPOzwc4t+bEIfPBREzbtTaBziHISAwgep4bgI27M/YRBf2REygazp7OlqDIi6G+w9NsJ1pSArXORTOJk8jaJmW+3auFMKilqx64DvvWI3DyD+H/yU5x2rDSiCGVm9hlU58MDtcs5zp3nFRGLbgEB/pEHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T/w3+hZZ; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T/w3+hZZ"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so9021722a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789061285; x=1789666085; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ9gff3elma6CD7alw1MFbs/3CTLYpjs7r/GlI7Hiek=;
        b=T/w3+hZZv6S6t+/utbx6v/H2lb7WbjueAZ/zYHFqZv9BzNsaQA4jXgC0Mu7QF7L+4d
         EdYcGGeyeddI+PSHzBk/ZgzYNPYf/TXW1IltiOt+pMIFz8o/Fl1JyWsny+3zpkVM8ecE
         fND/sM+LeMjb2gNIoC+EE3j4zMIZk9XK0KTwE3+iMQHkN6Sq+3Bqc2sqL28TGTupn9n2
         AUcKElW7z7n10purdwiY1pIVivcJWzqXahBokEYgWvm8YvbhGd5JUvB1kN+fsY/5Nv0+
         t1r3IYadjm2qw2GjrAmfbR+MLYJRdlk7UudaS9hiy8WGwds+9h1J0NXxiAFhaVGAS7Wh
         RZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789061285; x=1789666085;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZ9gff3elma6CD7alw1MFbs/3CTLYpjs7r/GlI7Hiek=;
        b=r6+q1uXckFd4mltnRYkHvkAQ2pDnksvQrM0IulUiQI4jTC/eNOw4DPPy7vSgu8RAsS
         bP4FNSH++WFr+42yEJ2r4e5/m3yWGz95355AEl1iRDOpYkv9UOMUkBKWRHXaM0sqZnrx
         b5zFp05vgKdvL2gvIEArrDufVhdil48s/aTLBMOXznSOgY4HrVnjUjA8Bi7mLLAC8ACX
         sQwIf46bJmW2VMSgVJgW0WCXcrhQlzfeHJJIoA1/T345x07ociemivw/KisqZl8ntx6E
         KIIuIhgDC4qeCaY1q5NXphtejoPsOwamzRBp7RSa7X0XnZ9zw/OUQnpoHxTZLd1TBFVN
         vu7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxKZkrGwJLqyzgMLhxjoBE6Z/aSSqBKTghgxysY7zilnY0PVVfytXBUC9s/wDeTxFbUJbK+y/Shpw2e9E=@vger.kernel.org
X-Gm-Message-State: AFuF++k7+DS6ITYMTgQKjpUaTzlXvGvHcxka4vQiqIFo6W8F6E8++Ml0
	53ZON3HUHA4t80oWyo+06AsMha4iSYqYONuuYnksQ4ca2YXtMiuiydqd/Kc1tSx8xCC2doPKZ7M
	0nQ/7Pg==
X-Received: from pjbck19.prod.google.com ([2002:a17:90a:fe13:b0:39d:9aac:4a45])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c1:b0:398:9bd1:3214
 with SMTP id 98e67ed59e1d1-39b262dfa81mr59413528a91.21.1789061284766; Thu, 10
 Sep 2026 10:28:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:28:04 -0700
In-Reply-To: <CADQ=hX1Cra96=kVaw6FTUm9yJvherKWCSjWbFtQOaFQu2YNr8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CADQ=hX1Cra96=kVaw6FTUm9yJvherKWCSjWbFtQOaFQu2YNr8w@mail.gmail.com>
Message-ID: <aqLopPoTpF1uo-zu@google.com>
Subject: Re: [BUG] AMX tile data lost after nanosleep in a Linux guest
From: Sean Christopherson <seanjc@google.com>
To: yoch melka <yoch.melka@gmail.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, yoch melka wrote:
> Hi,
> 
> I'm seeing AMX tile data silently turn to zero after a 1 ms sleep on a
> Linux guest.
> 
> The reproducer requests AMX permission, loads a known nonzero pattern into
> all eight tiles, calls `nanosleep` through a direct syscall, then stores
> and checks the contents. There are no function calls while the tiles are
> live; I checked the disassembly with both GCC and Clang.
> 
> Build and run on an AMX-capable CPU (replace CPU 0 with an allowed CPU if
> necessary):
> 
> ```
> gcc -O2 -g -Wall -Wextra -Werror -mamx-tile -fno-plt amx_min.c -o amx_min
> 
> timeout --kill-after=2s 20s taskset -c 0 ./amx_min
> timeout --kill-after=2s 20s taskset -c 0 ./amx_min getpid
> ```
> 
> Expected: 0/300 mismatches in both modes.
> 
> Observed with GCC 13.3.0: 5/300, 5/300 and 4/300 mismatches in three
> `nanosleep` runs. Clang 18.1.3 also reproduces it (3/300). The `getpid`
> control was clean in all three control runs (two GCC, one Clang).
> 
> The first mismatch reports:
> First mismatch: 8192/8192 bytes are zero; TILECFG unchanged
> 
> `nanosleep` returns successfully. The failure is intermittent, so a clean
> run may need repeating.
> 
> Environment:
> Ubuntu 24.04, custom Linux 6.12.94+
> #1 SMP PREEMPT_DYNAMIC Mon Sep 7 16:15:06 UTC 2026
> Intel Xeon, family 6, model 207, stepping 2; 4 vCPUs
> KVM reported by the guest; host kernel and VMM unknown

This suggests that your VM is being hosted by a CSP/third-party.  Is that correct?

> A separate test also loses tile data in a busy loop under CPU contention,
> without any syscall while the tiles are live. This suggests an AMX
> state-preservation issue around scheduling, but I cannot tell whether the
> fault is in the custom guest kernel or the host environment.
> 
> Does this resemble a known issue?

I can't think of anything off the top of my head.

> Any suggestions for narrowing it down from inside the guest would be
> appreciated.

I would first try reproducing the failure with an upstream guest kernel.  If you
can repro with an upstream guest kernel, and your VM is being hosted by a third-
party, then I would contact their support (file a bug?) and provide them your
reproducer and guest kernel version.

If you have access to bare metal with AMX, I would definitely try reproing there.
E.g. if it repros on bare metal with an upstream kernel, then you can get support
directly from upstream.  Or if it repros only with your custom kernel and on bare
metal, then you can be pretty darn confident it's a bug in that custom kernel.
And if it doesn't repro on bare metal, then you can go yell at your CSP (and hope
it wasn't a false negative). :-)

In other words, I would first do what you can to narrow down where in the stack
the bug likely resides before diving straight into debug.
 
I ran your reproducer with a v7.2 guest kernel and a v6.12-based host kernel as
well as a vanilla v7.3-rc2 host kernel, and didn't see any failures across 50k
"trials" of each host kernel (100k trials total).  That doesn't guarantee upstream
isn't buggy, but without knowing the host kernel, and without having a reproducer
that is relevant to upstream, there's not really anything us upstream folks can
do to help.  Sorry :-(
