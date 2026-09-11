Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3483815E6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104289; cv=none; b=IOyL7tq5nDiAfUtDf+dgLRJcq76q/Hc3XRPbxX9mMMtfsHJqkisfcAW3PDZUn5y0cGBB8Hbc91PQVSRQ7x2520aTPj0IZJwNNkBs4dKkCwsprqHE7y4xeLDckC3boQ4YGWeT/nCE/yUIyUH5J7HG17j+i2loXi90mGzkVoLipX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104289; c=relaxed/simple;
	bh=p6xYM0PLxH9VcuqNy+H/+Xv8xsyReBJbmwQjeYEnl+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c903TgNFJk1k2v0HduiCqnAdei77lY4LU+6WhGZdPgI9L8prMnLZq2uZ9TK/tKhw7KyvWq5P9+u4DAky932kvo5LK8MLNJyg2LCtLJS5dBsWjCHM0hdDjDw9TQL5L17n3vYyT1tgN+mxvYE52hA6VvfQCNrsAYF7aXsrDHp1OZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeyvG9sb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeyvG9sb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so385409a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789104287; x=1789709087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=aeyvG9sbKNqAIkC2ABl/B/3N/5pWD1ePWbmv1mFWJya9g1BoOcMtObLlTqZBWn/tms
         i+60o26WV+LANTMk4zC3sqSQeuIvFZMdnS9bdn65IdjlRyZEbfOjANNPz9NQE9J8yNEt
         wftKqpuT77Y5NLvKrkGprveC/foer8szet4t/udZE2l7Cr0LvgvmAiZ15aBHuvknmEL0
         CAIMflpbtHgwh2RW2/JPtKJIZ3s+2lwfxFMe8WwTwoF0PSwe0UTw0Oh3NMT4SVDXDjWi
         lZ1fqFcswu+4TA1BCOK0+pmjtM3Rr/NCtknqJMfOZOld7QEu5bOUj7wCpUUK5vnyhswq
         QpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104287; x=1789709087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=mcpvkLSor8tLYStdzmYnMPsbXSyHtkm8Ls+5vRjYk7J4J8OZW//Mg66kWZZyZQ2gaa
         2YR40i10wVDTE+om1mImFGDV3JnU9XqA86JMHb4KZ0VKFIY5xXWtpHr2JDXwoevlFkQC
         UrAalD0E5ghP/GAXx0WDcnbk6xCAmIUBSl8/6fDB9PmhYySOCFpSX8XDnVytAvgg8zMu
         fQZaiWkB25N6CmXf+Li7PXoZ7sjiygLt2vfe65/S5PkesdUhvRNpkTgt0xyVMh26C9HV
         jbZD0pc46KGmDZxF5OJJhgH55s1BWvGXADA6nlXyezSEQ4Yd5tryR9+LF28MRmqDf0TB
         MYfg==
X-Forwarded-Encrypted: i=1; AKwUvByTNDIlW5Q8Mr+YNT6MN+UrpLjYkrJFKSalF2tYHVQJih0xmY55Wb+yIO+nonP8ECTVMqKk+xxMvRRPLOg=@vger.kernel.org
X-Gm-Message-State: AFuF++myjK0MJcH8g74jyV5/4lWCw+VTfw3/wyie/Qj/qxj1rNmyVAnf
	pph5jE5FdxUr/PKsG77WOgTS3jYgfP27FrG58VlSCmIPqdE33E4Xnn10
X-Gm-Gg: AYBFou2Z/62tb7GSp7AMV5Kzj6yE6uiA+4nPqCcbsISPV2OhbTPCnu/5NUyitrQSxrf
	GsUOfn+kJ5MTCtM1IHuJuj6JfAa31oPwKBCpJBU4eJHxUgIV2cuTjJDLCnyCuHMtrOoyWD5lS3T
	XeNbKb7oUqmPZ54hDizknVTwIohN8eCSo0HCEFsUnKDUVCXHcnala+pOUhau2/KmfEZ4NXDJfL+
	251CyRRdYi9ZZ/7gB8s6wCPmMUDoVngnLiffnljhRleSwr3NVpWzgLTC3Zh4jgA1FT6H8XZB23L
	HXnmmCgBmEnDztHkdj2nmMzaeefKgEnJdBkwz4G94bgTShqB/pEqi4afk4gumNjDMVksgjlIaD2
	DRJzvj+RhFnxJjEId5M64eHYZHSVzRnvlMrqerWPGB3SKY461UxsrwR9tFjgu5mAHapwC+0NIiz
	XxuZ9UDE3fZ3ydwawqntxNy6OADMq3n5+coRr9TqLQ/v3tidIFD7Wpt1HECb+VSJKuqCFs8a2GA
	Kg/MjQpDVxGgE/cdQxCX+PVvTMXd3dIlrjUwPfb49wPyA==
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr3899237a91.17.1789104287013;
        Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm3416735c88.13.2026.09.10.22.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:24:46 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:54:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqOP8C7ahcxCng7L@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>

On Thu, Sep 10, 2026 at 05:08:48PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
[...]
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"			\
> > +	"2:	.4byte " label "b - .\n"		\
> 
> Ah, you left the b here. The label is 1b which mean "the first 1: you find
> going backward". Could as well be "1f" instead meaning "the first 1: you
> find going forward".
> 
> So I think you should use 1b or 1f as the label, not just 1.
Hey Christophe,

Thanks for the clear explanation, this helps a lot.
> 
> I would also try to use #label to stringigy the label in order to avoid
> having to put the arguments into quotes (untested), same for other ones.
> 
Ohk, letme try that.

> Cdlt
> Christophe
> 

Regards,
Mukesh
[...]
