Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E9468C20
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150805; cv=none; b=uwM3+jZg4AOSPu5z2KJmIOxlNQnxCIe4+9fjdwsJOZFCgep8+wtNKF0cSTknNw5av4HRlxCAt/hrOtmfYQ6NPnBGBn4KQWs7M5KH0XTRTymp+z2yqY5zc3Q4nl8PnYzMq83dHAWc9IxMzQLGmYhl0TL/Xen3sSq3BND1urNavDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150805; c=relaxed/simple;
	bh=nINVdHpeegjZbMF05FpoeGyNb7oZWEvbf8iL9ES8+Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpKY6RBAJLcOchonh+rwBqS3Vinye/jsk0FOgpijmKYWdhKnn90yaL4a+EC9eHop6RxjvdTyxIwxxvQXAEUXTTI/PcDinGkuSofZ011Z4MIOpB0+WcM4KR+ZwQ31l14gJafMZCMr/S/0fBSAlQWcLTmlNi3z5qXPWqC4/mHX+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cmdvvvej; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cmdvvvej"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so477448f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150802; x=1790755602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT1Pv4J7yBTtJtITNEIgiikLudfOmUZ+CuCDcjNwO28=;
        b=CmdvvvejejbKnCdP4QFfXhmvQQ6a3ZeWiBC5jQDgD+kM+nXC2TB6ZkQedhIthtz/i7
         QWAWHXEi7k4K3iVN3laBB8WJSlIF9TiwUD+Nqbxqs9Z0/sW1fXhLJ1gLpkV61N9HkHax
         VmrM6oEgOP9nDMC58ab3ziJSgYftR+1CYQgWDUPqMyiXYGOWWbE8bGfljKhv9VkrPlDU
         1c0bC/R7wIRyVk2RSw+7fYp/62Tgi4f6qRJDVVmoQo2lnYx5VdPGrcHW/3Vcvyfcu7pr
         vD7YAsk93IWAc2PMknFnncFwVKSnNzxJ7LhWIjtERZnAdYEoNsVL+Xcd+TJ18p6Tt5VO
         8V8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150802; x=1790755602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT1Pv4J7yBTtJtITNEIgiikLudfOmUZ+CuCDcjNwO28=;
        b=ei5eUTUi/jJ4SEBgzykTL0yJ8DpcKEPRbqFENmSkoD4yqPNoI3wJJj2augSVtTJ4oT
         ddZF6A1t4KwHUctwMHZB6ZytEdCncoZeennLfZUz3di2Dgjc0TM2CBTTWvUkMX0CWU5c
         c2/8z/SSG+RuPwV9NKTN4bl1fMBLfoyABd0BH5cmT7sLSIQN1djI1n7tw3mdKpPZ8EKI
         +ijb2sVnEcu34UOQzD6uYDF0VrXdhKFb43ngvvd/D7H40DRmMOwgqNwnAik0wmUD7UqW
         BMKfKmgPIWeGOqBURR8V+u6tP39Kd4xGbXsxQBHiJbDtVaXPBTGT1YwqbqBgCkjyhmiC
         EWjQ==
X-Gm-Message-State: AFuF++ns8HjWPohdROluuVUBXFEFN1kOnRC1Iu6Uk7qoVS4QtU7L9PUf
	/EmQNwaExVxYGtJSrIiKMfd9vCQVnGSRy9vCZwO8mL5ExqNgoh605ygS/EPHcYWM5ZgOAc6uLNF
	ScgS+4Q==
X-Gm-Gg: AYBFou1BMBpHUjl/X17Pa3QVjSEJjLCsHcKt/rVJN3PJmF9+3e6HK1UuSSCv8GWfLYX
	jql4HN1+qDyvMkUCs+P1KChn8olkJttbGU6EK/PRmrpIPU9269VFnL6GYz2W0lQ6ybP6aVG2I3C
	npQFEUrb8RUVWujpn+ioeT62POrlblUxnLfIwV7IAc/PoA6xGgS4ysZjl5SEsD2C+s+5lCbwIyU
	4bSe4449cr/o54/By3UAkIhMkcXX5KHe3WXxRAXsRU/yFxB8CmgchaYvLYAsoj58qroC/I9ASq+
	SdhZarNrLpG+gDVG7Q0tQ7GiLC8CKC0aIt7flUqNjOFf6W97pAh7xqarMTF3WxGCLPM/nCAiBiW
	zXBYaf8sDlPyB+U/FcJJlNA3AtVvZiQc6uOmRIKyPc+AXmDE1UWmAPLz49MMtSkDQX6qWzW3Dqw
	rbp9cXmmLA6IGOZWlAGxoF28G2pJl96F6vGL4s5mTfxUl3EJGKAv4iBr2Ivfph5QaTojoeyy6hX
	oDbiq5f6Lip1FCyEfjFjJmtXiNCkrBo52JJVY3tEMeCMoHz28RwoA==
X-Received: by 2002:a05:6000:40cc:b0:487:21a4:f617 with SMTP id ffacd0b85a97d-48867069105mr2943801f8f.19.1790150801786;
        Wed, 23 Sep 2026 01:06:41 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm5442336f8f.1.2026.09.23.01.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:06:41 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:06:37 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] ring-buffer: Add a MAINTAINERS category specific for the
 tracing ring-buffer
Message-ID: <arOIjWCRhnYxkUcR@google.com>
References: <20260908094035.0b180833@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908094035.0b180833@gandalf.local.home>

On Tue, Sep 08, 2026 at 09:40:35AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The ring buffer code in the tracing directory has always been decoupled
> from the tracing code. It had a clean abstracted API to allow it to be
> used by systems outside of tracing. The API even allowed the ring buffer
> code to be drastically changed without affecting the tracing sub-system.
> 
> Recently, Vincent Donnefort has been contributing a lot of work to enhance
> the ring buffer. He implemented the user space mappings and recently
> created a version to allow pKVM hypervisors to use the code to trace
> the hypervisor and expose the events to the user.
> 
> Create a separate category for maintaining the ring buffer code so that
> Vincent can become an official maintainer of it. His work has little to do
> with the tracing code itself. In the future, he may even be the main
> maintainer of the ring buffer.
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..71bd2f57055d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27778,6 +27778,22 @@ F:	kernel/trace/trace_irqsoff.c
>  F:	kernel/trace/trace_osnoise.c
>  F:	kernel/trace/trace_sched_wakeup.c
>  
> +TRACING RING BUFFER
> +M:	Steven Rostedt <rostedt@goodmis.org>
> +M:	Vincent Donnefort <vdonnefort@google.com>
> +M:	Masami Hiramatsu <mhiramat@kernel.org>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-trace-kernel@vger.kernel.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-trace-kernel/list/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
> +F:	Documentation/trace/ring-buffer*
> +F:	Documentation/trace/remotes.rst
> +F:	include/linux/ring-buffer*.h
> +F:	kernel/trace/*ring_buffer*.c

as it relates to simple_ring_buffer.c do you want to add here undefsyms_base.c?

> +F:	kernel/trace/remote*.c
> +F:	tools/testing/selftests/ring-buffer/
> +
>  TRADITIONAL CHINESE DOCUMENTATION
>  M:	Chen-Yu Yeh <chenyou910331@gmail.com>
>  M:	Weijie Yuan <wy@wyuan.org>
> -- 
> 2.53.0
> 

-- 
Vincent
