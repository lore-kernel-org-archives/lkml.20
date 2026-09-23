Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4B448D11
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149460; cv=none; b=T7pWuojH0rewGzSsqCHJbPc9lxDAkFEgA1lGPZ28NUX4WAKIW+pU4KNcchihJDcc/pdJtBs4E1ODwLp/r7/Z8l7mY8Tqy+US+FP9Lib91McTrgkWIS4wNHqcMzqMjbQte/8vVgQLQK0xk659WQGdpP7ojmq0eGT4TcNTzawL+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149460; c=relaxed/simple;
	bh=M9lMAFUnH2NTE62JM03Y7t5HyySwHMlsThVH5J/2ELU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvO5IA/raPWUfL16+HOHr7idIsTCYRNK/3yjftQhQHcWjVI9w+1VP7EO3vOaD9oAR2IPZi3Ks7h3Z0OjDB0xjwnx0Wg3WQwQx+/ZevseP/LDphyZy8PWAT5o5uLXO/lYmaO06iLGRjO7A0rgLWsv9JGlGRNagrgvbTEXI28uPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e06pX9Ws; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e06pX9Ws"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso3570915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149453; x=1790754253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAsvDchc+x61ynFxcLSRLs5AAyNrnPoee4eK2EySr0w=;
        b=e06pX9WsWvTdRwAAMUJKI6Jq27L/lD3MT5v+XoOJr4n9lSBrr2uXn+e0/W6FtByr2j
         HER7lewG3BISPp1VByK8q8VI/je159qx8NyFPRjI0fTLnC+U9WB3aSwk6STXh1BTcLGP
         2P8EBvI5STfshG7g9TnXsItow4PSEO3KshIFkGdY5LlS9K1ONBliEkvKCa2wGzz2SD1N
         PUO4TYo2PpWgqlBDkSl1CLrO+uZP9NGbTNURLlm1qz76om+E5W+eUAoBLpnes8b0Zegr
         +YlZyc7g2wRfVByOmzdPNCWotnjKudlPREFyjAjeozlUxWwIvfWUAatbcmWMpSF8edH8
         fIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149453; x=1790754253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAsvDchc+x61ynFxcLSRLs5AAyNrnPoee4eK2EySr0w=;
        b=GU7PBAAnyD4576SJ79r5ApQUA/n7s4r2kJvWf1VF+uOlEAo19pFCxjfGyZGKvQZx4O
         BwK41LGz85rLYTNYUBbHIe/XthEZQtjBWw3so6NX/gWxUY15xBwAskk1nGpNUnK9MWjh
         5EYcBfOWt3dmK/9Vt1chSxaw2sLY7UUC26vPZgOeNli7fI37vrhnCTpQdc9Xg0PB1P3v
         CCJHgCDeZ6ytgndrLMsmaDuY+AQfXFGgV9wCQkbyDSxqikuVACUUr8RE8WCfn/T792t4
         MnMiLFl0XpiYKE1DWCtmq3L3+45HGfr03jMf6v9JN7GztLL7WCzh1Sibe6JgtVzdgA+y
         vZ5A==
X-Forwarded-Encrypted: i=1; AKwUvBz65HuUE8oQK+FJ8qMqZ840Zskt4c4KNAQSxcdSeEyWlWFoQeCIcqMHYFX7fImUbBIt6I0hO460L4+Vn70=@vger.kernel.org
X-Gm-Message-State: AFuF++nCPfzEKuMqACoF6mrokLCrYMcPs5udLcl0TtolA/X58P5rhUgz
	qAFGRLVzwPNwlG02W+U+9fradTIl+oa7Rpo2x5TWYQWgdwueWh3nzPcTVTYgqzntzIxNUBIqCer
	gZweFmA==
X-Gm-Gg: AYBFou1IFzOSh5fL9egXQTkDnh63JeL5vS0Dob18DQa6ciWSwjEo25hhuDS7IDClKwt
	7PZHETHWCs6Nur4l5PdLWM9cNv7bei4wg7igNQaF9bvM8bLlJZmwB3p1m2D+H/LUHfystmN4Qm1
	Roz83iN05lJdOlAO1p3+zrmOUSJ3g/1Dz1tv/u1pYx5JvnSmqDMqQBOYajBqZzD7w2RnUXmHTtP
	ghqC27eYac/fLf9JLrAOKHRj4W6FqJ4XsJU/FlAWRgqz0E3E0PaAAdKk6aSMUl4jPl0LaR2WE08
	+qtQyI0IZ3s3qkCtvBEFCcrn2e8ECpk3P0GnZT0pbCxIMcmxoZBfurq09vkSfwre0B8Oahtfcw3
	C5mgbDLVlIlBm1t4vAEnest4/lzha+d55qmsTZ5Pe/P8W6bcBoLVAScp2RG2tXv5feR7WlhCIXl
	By3Rq9u9tNnZDlybAAkF5BbuTwfHB3tokBqgdgQ0qv4aURGBZG5tPO2vvg4nMUU2Yyz4VmwAvyT
	2DgzNz8VVZYxQgc2o7oX+1Y2T1/Wo6iyzqO38u82dA=
X-Received: by 2002:a05:600c:8b6f:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fdf13502amr22086715e9.21.1790149452550;
        Wed, 23 Sep 2026 00:44:12 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde198f85sm59969785e9.8.2026.09.23.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:44:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:44:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: trace/simple_ring_buffer build failure on parisc, sparc64
Message-ID: <arODSJcEFYShdkou@google.com>
References: <5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net>
 <arN9bPXyZFt0DV3H@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arN9bPXyZFt0DV3H@google.com>

On Wed, Sep 23, 2026 at 08:19:08AM +0100, Vincent Donnefort wrote:
> On Tue, Sep 22, 2026 at 08:57:05AM -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > when trying to build parisc:allmodconfig or sparc64:allmodconfig,
> > I get the following errors.
> > 
> > Building parisc:allmodconfig ... failed
> > --------------
> > Error log:
> > Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >          U __atomic_hash
> >          U trace_hardirqs_off
> >          U trace_hardirqs_on
> >          U warn_bogus_irq_restore
> > 
> > Building sparc64:allmodconfig ... failed
> > --------------
> > Error log:
> > Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >                  U 
> >                  U 
> >                  U current_thread_info_reg
> 
> Thanks for the report. I could reproduce with clang. I should have a fix
> shortly.
> 
> > 
> > I always thought this has to do with my environment and/or C compiler, but
> > it seems as if the problem appears to be generic.
> > 
> > I have no idea what causes the problem, why only those architectures are
> > affected, or how to fix it. If anyone has an idea, please let me know and
> > I'll be happy to write a patch and/or test it.
> > 
> > I disabled CONFIG_RING_BUFFER for test builds of parisc and sparc64 for
> > now, so this does not directly affect my test builds anymore. This is
> > primarily a report that the problem exists, not a request to fix it.
> > 
> > Thanks,
> > Guenter
> 
> -- 
> Vincent

https://lore.kernel.org/linux-trace-kernel/20260923074213.3077182-1-vdonnefort@google.com/T/#t

Is that good enough?

-- 
Vincent
