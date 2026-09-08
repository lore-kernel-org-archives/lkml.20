Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562C4B488E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906880; cv=none; b=t++aFDQThvwDVP/0P73lhFtJvrZiqfVe4xvdzkyVeJfc/x/DXTBSOv+7F07XyTRiBNj8sekSnuXOqyX+GHVpjsdYFfdPKZ9lt+CxUq2o16k+MaAUr6di2koC4V+CXwmrkWIljQudlQ1aKFLZpYkW7bYi5Y2ffXMPTWqk1JkFI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906880; c=relaxed/simple;
	bh=htNILk9Kpq12336HFpWbDN67/SR46TQMYtfCjV9wRxY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=oXx2aCQFFOhXSfsq677i6QoMXUREWosg8k1aMsE22RAXFHgcrZ0eXo1uTCDnR2PBwUP/Aw1Has2cec3q5I8ECUmwpvIm96q/T5TI7f3a5egbR1nUXUhiCpJjKpKbK/ZobhJvVHqdCfjHJqkFY8daG+5zcqs26JSpqWq6tar1lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uaYTHfPu; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaYTHfPu"
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4566537e644so8010937fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788906878; x=1789511678; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=uaYTHfPueU0TDrIv7KfTmvg3C6htsYvnOGJ3Qni25YFImkYLkV92Wh/3Nz4Oq2/CKl
         RPPNGU417AnV7rHYhfb6+9CGAUxH3qKjPJ/zZt7Imwkr6AJwZ94eOudhGpHCCDrBR+A4
         cstus1mk+P7bbepGyatAXAOmVVFrPFNGOx7ZbhCVXZBpEpoygqjRHqAe1ssYn/72ItzA
         u5GLCMjx7HcsmJamW6aKZkPpk5ZIwfFyfVC/0A03jh+RLXmbRDiUC/l7kFc0sYvgQ4mZ
         HQETneyJDLiJCe+L1xN6IIxELlBKPd325sE8ZsVwKKzWTGUun6yJv87MUQBZNkUy/pVJ
         oN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906878; x=1789511678;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6DHdss8MRJ7r65GA41ught1FKJ932kAtSg2l2oUqQc=;
        b=bzqXLWyOS3rgofL0F1Gznpoxb9u+3NtPkuvRF9uSHUuFSxSpzV5H1J8i+gG3Rj5RmO
         f17EmdH3sCsE65Zbx97Zf7x9zsVl8lwLZGLcmvNj2mmRe5HNQzQ32FaOFE/6nlo4ovM1
         NCDB6QDxPGr7VJi75dkXTAbEJDXhPUVicUNOLakEGowI84Uhw0yMVZTStLWkz7VdDB6b
         eTp58xYGJb1yLUCPF83d4ev4YuR4947q86oU0JY5n6Er/kvJ81snVPLwE7og6xmruXOx
         cuoHucB/3v+VgMa0ZaVqSsM/O1nLXU93nvGkbKW5FFWO9+wOq5dePQDfZMG/4qq8EkFX
         fgbg==
X-Forwarded-Encrypted: i=1; AKwUvByHWO4eAvMb2skKA01NLD4sTsa8Iufny8YJ6qB5scSoVj+ay2awu0OcbK7j3BpHReP2ddXUwAwuosNNTR4=@vger.kernel.org
X-Gm-Message-State: AFuF++kF8L/G/y2c/r/wE0SYWqUgth1DWv2H/f2BPzLRqqkAfXMlVUSj
	Ghy7aDivr48v0QGCILIgQd0o5rUw7v7k8E3LvL1G5u6ov9PFFNu84Od8pEab22oiS2EihMssXkA
	GIEzT8SG055f5quLDs0jBx+LarA==
X-Received: from japm26.prod.google.com ([2002:a02:cdda:0:b0:5f1:325b:8e4c])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:179b:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-6b6fcbdc9dfmr18638803eaf.22.1788906877369;
 Tue, 08 Sep 2026 15:34:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:34:35 -0700
In-Reply-To: <20260401092027.GW3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <aqCMIFRHEQ3H9qad@google.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
From: Justin Stitt <justinstitt@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

Hi,

On Wed, Apr 01, 2026 at 11:20:27AM +0200, Peter Zijlstra wrote:
...
> 
> So I would like to second this option as being interesting.
> 
> But while pondering it, I did want to note that all of the options, with
> the exception of __ob_wrap (which is effectively what we have today for
> *everything*), will be 'interesting' to compose with _Atomic, another
> one of these qualifiers.
> 
> Now, in the kernel we don't use _Atomic, so strictly speaking I don't
> care ;-) But here goes...
> 
> Something like _Atomic int __ob_wrap, is trivial and good.
> 
> _Atomic int __ob_trap is either doable or impossible depending on how
> you define the result to be on 'trap'. Specifically, the semantics
> proposed where it keeps the old value makes it impossible.
> 
> And _Atomic int __ob_saturate is equally 'challenging', since the
> fundamental thing of 'reset to min/max on under/over-flow' is rather
> a non-atomic kind of thing. Look at the trouble we went through with
> refcount_t to sort of make this work.
> 

FWIW, I've moved to simply disallow OBT+Atomic. We've got this under
-fexperimental so I'm well within my right :). The idea being: __ob_trap
isn't workable with Atomic (depending on storage semantics) and
__ob_wrap isn't very useful there either, plus I had some parsing bugs
where specific ordering of things could result in OBT being silently
dropped with _Atomic and those magically go away by disallowing this
pairing all together.

I just opened the PR over at [1] and it is still pending but this is
probably where I'll go with _Atomic and OBT :)

Link: https://github.com/llvm/llvm-project/pull/222179

Thanks
Justin
