Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54F511187
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897384; cv=none; b=cFAhCeTRSIWIvP1llpob+0OgeWT021BFHUEEyO6HrBAW5v3xGc1gPpo2xoUu4spVyuO3uajqskh784iT1STzg+9jxWz3Y/Bw99wtGfzq/HHr2/oQFZr0fUUw8jrccNePDE9THqiUrbQcI22Nm1KUvN4c1kalwH7oJ9AMTgAJip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897384; c=relaxed/simple;
	bh=oIvq09ruaNnwNoAu3ihnhF//iHvx/s8Eq7IQvNsRbiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIf3kY+LSkwuaRxvmbWAYWNu58UpA5c5m0bTVw+WoExlFEv7nntqHKxmW4xPdBZuosZYrytznyDRULC1sGSIxc8PCig9d53FGIjW2Z2dlYF1Yyp/KqvxHlCzB/42HOCHMdy4nfIDPis98M3rbhyBcj5Z0dN1KrkgNISrih3o8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2lsTiYR; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2lsTiYR"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67489c8202cso2213275d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897381; x=1792502181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Q6uCkX+rlTkR+bq8MdQcJ9FUDBjBYXnucYbcKrw8i0=;
        b=B2lsTiYRsFRVJeqbHCzfOsvCkv4ajaVGd7f0lWEWZ/8cWSAY3tPc75InaTTFwu5yDa
         X6FxcxtJQbv+MMTPa7P5/U5WgJ0TxOAU+lnWPpswwPgo2MwhzSaejkYXxvRh/8xq0mUi
         7IGzDN12sL0iY1hynX/hzFcW7nUwD+QeZo8ZaVmPxQnbvI1wEnBAjPpn/6UG/jZO3bo3
         h57Ak+gp9/Q2KwND+15E8ntFBxhaR/az8YxZIGaoChxasGp0IXxMdKRvOVfXYda8Ci5F
         qQUf/9YFjBffovS9fwDIipEDb+Ku8zSkL+mwSeKb7pJR43E/rPxFvfLSGCbp3Y8KQzxZ
         AyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897381; x=1792502181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Q6uCkX+rlTkR+bq8MdQcJ9FUDBjBYXnucYbcKrw8i0=;
        b=BiFtHTN0RaaS7bdnCgILZJSIWbkSKgiswGlof8MihaTBDIC2JnQrUQFIUcvrOV9Tlv
         Z8jgNXBvoKborxZSouD7NJhTQtsRpuFTo3zVo/sO7SaYEl+xnEtPHngMlS4iLmNK/JC+
         gOq9Y0Z6ub7gOo4cMyNHtzt11Lo082dSSn3VEHuElKcWX9JHx8C8fRWbediW2L66R6z+
         7HgcNNYonMYtDxpij4ahO4hgKlxqxxhbtm1dKgweoN5c23JUEUQwcTOH69YVy0TpwIoW
         kbsiWekkSfq2Z3XWG44HhXicLMNzw8C4I/oMmRDTOe0pa+Gub7dKIHJM0/n46DE2sMAn
         45bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU54X/Y7n8lDBUN0W1C7Z0sMnQsIlYjOQ4cbbCjFO0Js6vFoLyEtTsQEGV/1KGt0mztbqs9a4nmtGaTIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjK+VfOxfAGDMbBCF866DAP55ZJYoI8rSvkgInYGEMUh7ma1t2
	t44vKebQgkHvUnUkPiQh4sF4Yg7jbSbi8c3zNNNYkV7ywVLovE9W2kja9som7w==
X-Gm-Gg: AYBFou0QV+Zc7nHLdeLi7+1Wo99O0npqRQrH3/IIoR9znF6BP+LLlBMkrv95wYR9uXZ
	2aNUC2jiPXg4CXMIrBT1iAFAU0syjsfoZupvjWG5avsaJSdbsSsEP3N7LwP6L/jvAXdxjHRHjAJ
	j4ofp6xbEl/4vmnP+FtRvpmbSO9RwN+ZPOah5vYP+AiRpVuAdJen9uT+MxbtMYtCFmmvilwstsz
	xV5o5qdPutzIIbQ2VJ7/hxtBj52OSocFNl54Z6tKpLV4cu+KtP0PqZq6D2fYcC9n72UlBi2+hlz
	BruvblyUKXovIONfuNHiauJZ3gcAJxPUY1KYa3Aa9EWQ+yk96Gl75Omdwhm16DkAgyQXKqYFzx5
	+NZHfNA6ySXCB6vO3L8Go2C17ZLuDXH9oLZfilBMqLlNNYIhkiOzislSiswPdOqIcfXKd6c8geS
	14iXCPM0qviZM7XqcFf7UioihopN+4lXFqFTVEgXDX+ZyC7NCZsXKwiObLB3BVzTwv+SK7g2pV1
	FPRNu3XMfh6QFJunE7baLxyvF0Y+AMKQWs3H/pk3hQd
X-Received: by 2002:a05:690e:118e:b0:677:d21f:b632 with SMTP id 956f58d0204a3-67935f1c7b5mr5301132d50.2.1791897381320;
        Tue, 13 Oct 2026 06:16:21 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6793570cfe3sm4726812d50.25.2026.10.13.06.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:16:20 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:46:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, 
	"Bernhard M. Wiedemann" <bwiedemann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] powerpc: Remove unused thread info flags
Message-ID: <as4vCZiuc8h4zjQ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <4c1da7f31a6603455ec452960af529e4d77f5334.1791826411.git.msuchanek@suse.de>
 <dcbd135c06fcf013b8aa902fbea8f6b1827d06c2.1791826411.git.msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcbd135c06fcf013b8aa902fbea8f6b1827d06c2.1791826411.git.msuchanek@suse.de>

On Mon, Oct 12, 2026 at 07:38:29PM +0200, Michal Suchanek wrote:
> These are no longer used with the generic entry code
> 
> Fixes: 6ed60999d33d4 ("powerpc: Remove unused functions")
> Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/include/asm/thread_info.h | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 0e8dc71c8d3fe..4b7ec1db30349 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -96,22 +96,17 @@ void arch_setup_new_exec(void);
>  /*
>   * thread information flag bit numbers
>   */
> -#define TIF_SYSCALL_TRACE	0	/* syscall trace active */
>  #define TIF_SIGPENDING		1	/* signal pending */
>  #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
>  #define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
> -#define TIF_SYSCALL_EMU		4	/* syscall emulation active */
>  #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
>  #define TIF_PATCH_PENDING	6	/* pending live patching update */
> -#define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
>  #define TIF_SINGLESTEP		8	/* singlestepping active */
>  #define TIF_NEED_RESCHED_LAZY	9       /* Scheduler driven lazy preemption */
> -#define TIF_SECCOMP		10	/* secure computing */
>  #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
>  #define TIF_NOERROR		12	/* Force successful syscall return */
>  #define TIF_NOTIFY_RESUME	13	/* callback before returning to user */
>  #define TIF_UPROBE		14	/* breakpointed or single-stepping */
> -#define TIF_SYSCALL_TRACEPOINT	15	/* syscall tracepoint instrumentation */
>  #define TIF_EMULATE_STACK_STORE	16	/* Is an instruction emulation
>  						for stack store? */
>  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
> @@ -123,7 +118,6 @@ void arch_setup_new_exec(void);
>  #define TIF_SYSCALL_RET		21	/* syscall error value set */
>  
>  /* as above, but as bit values */
> -#define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
>  #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
>  #define _TIF_NEED_RESCHED_LAZY	(1<<TIF_NEED_RESCHED_LAZY)
> @@ -132,16 +126,12 @@ void arch_setup_new_exec(void);
>  #define _TIF_32BIT		(1<<TIF_32BIT)
>  #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
>  #define _TIF_PATCH_PENDING	(1<<TIF_PATCH_PENDING)
> -#define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
>  #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
> -#define _TIF_SECCOMP		(1<<TIF_SECCOMP)
>  #define _TIF_RESTOREALL		(1<<TIF_RESTOREALL)
>  #define _TIF_NOERROR		(1<<TIF_NOERROR)
>  #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
>  #define _TIF_UPROBE		(1<<TIF_UPROBE)
> -#define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
>  #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
> -#define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
>  
>  #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>  				 _TIF_NEED_RESCHED_LAZY | _TIF_NOTIFY_RESUME | \
> -- 
> 2.51.0
> 
LGTM
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
