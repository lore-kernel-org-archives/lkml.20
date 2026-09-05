Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDB222597
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 04:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788582847; cv=none; b=oI8aYWUGlfQzPdB2eilQxwrucmvXMPTH/7OfnqHN5Bs8XpM/NbT1AYKIbNY/XnutUdRsgs/9iSJiJ1hz2pZJz4QlvW9H+TRrbJXwHsvTwASswiYLLtXSmf7o1jir8XO95bY12hMmV9gFVQhCDam5NJcOsJPYCJt5HeYKZHBXwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788582847; c=relaxed/simple;
	bh=raNBlipIEmVe9/qzVGMLi/MJtDmnEFz9d7UowjATLsU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Vf/E998dyr0TdhQHirhJcClKgow0WmtT8JfcYQVoXGH/seh8snMrMuC7Phy4vUEy27pZKtOU8shJYRs5bxqyHk3wF6m0D5pd7YgtsQ9SCjEthRloFEJczAJw19GGNItGG04nZ5AGe2R0BKSkrxuHzCwl7y9M70jA/kFEpwuByrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfQ6yC6V; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfQ6yC6V"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1704829a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788582846; x=1789187646; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7HIfRyXPFfY53dpCllCwbDTWA+5luzyqK8OcV2My+DA=;
        b=gfQ6yC6VnndvUBI0nO7zScXuo9t8UNZmVNN+Um+I9CD9PmISaJ3tR+AK2EH2Rm0lJa
         3zZxH3KFOmKNTo8mS9o0vTTuyVFSH6/QbBp8aYwbs9pNzA4iKGOYufEaYD0GlcXkzbSe
         Ny0vcrseJA0xrZu9UbzNftpf4XNQiGJVVt/T4uXp6wT48EX5E78ZiaoV7B0UvyKhNP87
         bpjVuKCQirNlEydxeCgParvib7l/0CEiEfMAe9T9PrvF5W75tGWp0DZCxMfFiq/QjNMe
         uM35ogP3UkrPYWszBR/0/I9jvqxGjTtfDVIvMkZqXhzjswX/RVODEG7CsNPqOy30SDma
         8KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788582846; x=1789187646;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HIfRyXPFfY53dpCllCwbDTWA+5luzyqK8OcV2My+DA=;
        b=hiRWjENo58uwk7Pc6aNtHyjo0bDx1mjVUYUPmlvBYMlFoRSFTVlL+OUax9fYVgvW5W
         hNjMD/wTtjHKxk161EnfkhNfIFlbBgFSbj+4UMYbVym11B3JXLKVWiIrs9Yz2xny6xet
         o3QiCRLAThIeRCLU3dlyqtsJs/+5NPnwS7XIJ3ygx8CrLE4/GQ13wEQC9alt9msfqz/Z
         +s5Ho5qNAB14qXRi6dFeaaC0B6vkUQQLT9UHOE9RL/9qVv3hSZMaGH4/JEBX88zOhKGZ
         j4iCksSZ2CvG1qHHUg9UaL6qBY0g9LDcf0/TuDdLgXTW0PhZMkJLwxDoVkaSa5rPbDJZ
         jdoA==
X-Forwarded-Encrypted: i=1; AKwUvByogjEXh0ypYlcg9b807n74Z6Js8bVDxX/6UY7GSnMAgdmlxCgaPN2RBByacpIK+dY00c83FdKG6B2pXko=@vger.kernel.org
X-Gm-Message-State: AFuF++nHceCYRfg2Z2yaqgrnO83dkvwe+zOP7Xo7qJam2n/h3RKBOjq2
	1dq4Gm5ddRx+0zZLeG3mrW7K+gMNsR9SBQ94p2Jy26AKS44t5sCC50i/
X-Gm-Gg: AYBFou2TTA+rqsSjFh/BqYlsQ+KiIzK4jDVNsw4EEQlbXxaWiYXjpOlYKUaai9UE/HW
	d2eZxwfCCtsj7t+MuuiEw2ktrBlH4phJ4DZZ+VYig4GiTlYuG15ms4UIqca4eBbQXKZ2iwVqGwX
	wrCYcJU/P3NdHHw7IqwQriwfYPMTkDbByYqIQMRjceiY0gRHeHj89JcCRrcq7oyxpVcKmELAxJf
	gr7TsrwCZSO7iXf2v1OsFbRs7UBVPhMhqJ+sYe/oW+ppLN7u7JR3hQASJS/ahth0HrKxk4+Xiw/
	e4jcagenjbtQ3x4CBez9CqiRw8dMgBmp4Zsinp8VB8n/Z0h9sP8v6vlbUoQaI5lbPWuUJud+Osq
	ewUkj3rE63ClRauHpa1jElHiWu6vs98UX+RNKiYonw6NM7In1cLbXSu7wUYMYAMLaZigYhEXjvp
	LmgT4Zp6GSPMGRHHwwR0vPAN0p5N7BdARtDoFuWyY3O9PAOFj/vNWXMtDvGaQheUG8cc4EcrnRt
	xvoXo5hGvyaMt49DJk2MV+MzyiCAI7XJam3Aq2GGVV3
X-Received: by 2002:a17:90b:580e:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39b25ee242bmr14159129a91.0.1788582845678;
        Fri, 04 Sep 2026 21:34:05 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm9897983c88.14.2026.09.04.21.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 21:34:04 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org, "Nysal Jan K . A ." <nysal@linux.ibm.com>, Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/entry: Fix double accounting of user time on interrupt entry
In-Reply-To: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
Date: Sat, 05 Sep 2026 10:01:35 +0530
Message-ID: <cxustj2w.ritesh.list@gmail.com>
References: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Aboorva Devarajan <aboorvad@linux.ibm.com> writes:

> Since the switch to generic entry, an interrupt from user mode
> accounts user time twice: once in arch_interrupt_enter_prepare()
> and again in arch_enter_from_user_mode(), which irqentry_enter()
> invokes for the same interrupt:
>
> 	arch_interrupt_enter_prepare()
> 	  account_cpu_user_entry()		/* first */
> 	irqentry_enter()
> 	  arch_enter_from_user_mode()
> 	    account_cpu_user_entry()		/* second */
>
> The second call charges the same interval again, because
> account_cpu_user_entry() accumulates the time spent in user mode
> since the last return to user space.
>
> The two calls come from the GENERIC_ENTRY preparation series,
> where each step was a no-op on its own. Commit 09a9d3a8499d
> ("powerpc: introduce arch_enter_from_user_mode") added the hook
> with the user-time accounting in it, but nothing called it yet.
> Commit 893082ac769b ("powerpc: Prepare for IRQ entry exit")
> copied interrupt_enter_prepare() verbatim into entry-common.h as
> arch_interrupt_enter_prepare(); that copy was equally unused, as
> handlers still called interrupt_enter_prepare().
>
> Commit bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> made both live. On the syscall side it did the full conversion:
> system_call_exception() now accounts once through the hook via
> syscall_enter_from_user_mode(), rather than calling
> account_cpu_user_entry() directly. On the interrupt side it
> switched the handler macros to arch_interrupt_enter_prepare()
> followed by irqentry_enter(), which also runs the hook, but the
> accounting in arch_interrupt_enter_prepare() was not removed to
> match. The double accounting starts with that commit.
>
> With CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y this roughly doubles the
> reported user time of any workload that takes interrupts. The
> other accounting modes compile account_cpu_user_entry() to an
> empty stub, so they are not affected.
>
> Remove the accounting from arch_interrupt_enter_prepare() and rely
> on arch_enter_from_user_mode(), which already runs for both
> syscalls and interrupts. The duplicate account_stolen_time() call
> is removed the same way.
>
> On a pseries LPAR a busy loop reports 6s user time in 3s elapsed
> (~210% CPU) before the fix, and 3s (~105% CPU) after it:
>
>   $ python3 -c 'while True: pass' &
>   $ sleep 3; ps -p $! -o etime,time,pcpu
>
>             ELAPSED     TIME  %CPU
>   Before      00:03 00:00:06   210
>   After       00:03 00:00:03   105
>
> A 50% load reports ~70% usr / 30% idle before the fix, and
> ~49% usr / 51% idle after it:
>
>   $ taskset -c 6 stress-ng --cpu 1 --cpu-load 50 &
>   $ mpstat -P 6 1
>
>             CPU    %usr   %idle
>   Before      6   69.74   30.26
>   After       6   48.51   50.50
>
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> ---

Looks good. Thanks for the descritive commit msg!

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
