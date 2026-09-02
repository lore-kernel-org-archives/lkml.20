Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0691638A711
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382224; cv=none; b=gq46DtnBsIQiMQsTcKDdCq2IG7/fwqDC19V1MreSOSUCTTPAROVHPEk4yfcf4b+dcYJLPpbRtVe2onv0XCcif7WAzKQPpoEaMZauf91ZGXOsj58ZlecuWYRUVviVn+Dr5EGs+w3YRETr3LUMrc5Br7GzsoyV9kpj/3uxYmw5dO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382224; c=relaxed/simple;
	bh=a8eeevdkAPcsQz9OV+y8lCbMCUswARD6b4ZmitHXN+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fByG3gqy0wq0yj1e+muJ/n1Jw2h1GDPdjFtGY4zfPqF5VndKFDjB86liDsPLF7TjnJBPL75G86KQQH3w0GBha2r/oVPrdbp8RKqkaGyTjFAPkJb/X7rRYb5Hm7RtoahJNwC9BMoJSsDaCzT3PZ9gnjPWsM3UPP/+83rP0L6r3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBOiUSVW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBOiUSVW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so13082915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382221; x=1788987021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wt79yX3yhCJt06l8bFQ7uNChssQL8fYSyExutq0hios=;
        b=hBOiUSVWjfbFLcMrBe3nqz0KAdl/aCqbg0r6GyIoSBg+cvrA00VNQAV8+VELV2d1qY
         h+9+uNjY97wntwurQSl5CCauDyLqCQvkZ9q2XNVcmkBJzokfSFIsZmEhWcsoM2+jnzbd
         13xwUX19NvrPs+Plv05IxlI6dkb21d/qEJcmomlmaYUbWDj9lSzAoqZW9V+SVUrCJD+f
         zw2lLSP2WU8A0rbJ0kk+vAYHt0LROPUtqZl0YZIl642Lt8v+qO5gLpHBm94/o1dt8wKR
         q/YjJUr8ad1A8DQMSzESQqxjoOHzHiHevfAWQQQAPYaVA9i+asenWELFdZ3unJXvzkjs
         uBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382221; x=1788987021;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wt79yX3yhCJt06l8bFQ7uNChssQL8fYSyExutq0hios=;
        b=pJnxBPT+5gA/jkgUVBxc8TxpZYGDtnErfXnGhRDQyu3nnd8jZDfwSRI7u+FO5nYPhO
         7Wp8ueWQYanWjgkIkfeIlQwR109GOJ6sYYqzDIfy83HdzlOkeS9kp3+8YvY3JOh8Hidp
         G5FDhvIinFRnvn7FGm8In/RvBa4opeA1NGNhrZ/y2ILy+PLzyFPhN87xEhZuhai3owTl
         TuF66JzsNC9WMaC/9IoLdL1+HMOaIKuAUsxY0GV40WUAvG75jenfmTKv7S57Nfh8w1N0
         mAISCXKB0dg4xUw8qnsCi6xnrBmOBYex5Aw79MRip+En6k0dSSs/j8orIBjjZE/vPMPa
         tyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu+2Q7RpNP0gKLPFv2oMtZxM0QZH6CUjCIhcqcmoXp0YSFNYC8YjS09ftDQZsrOgcw/4lji+msVy8osSA=@vger.kernel.org
X-Gm-Message-State: AFuF++ku8C7boYls0duzpbOKQ19NOyAxN5MKi7wGhSTachRoe8q3qfjX
	oGb5T3Y9j5zb5YknoddUALghIZTT8a0icWXT1FkOwk0oLLfUewx6Wd0T
X-Gm-Gg: AYBFou22JWAr7xh254bz274HIG8GxbMD1RNgY40dJ0lyG0mOPfMfRzuQ0ThCnKTcFwi
	RGVv2YTgM6J2E1eI6FQ9e+H8rAu1tHs76DNFhMB/H1uqs5fzp4JYhKtshf6EBJXD/spVpMplp58
	iM3I0NL6cTEQXKKAwvb/nF+KWcD+NQo3NFruTa0E6tS9cHdb7siW/Oeu/fBMzM+pwjSHhcssuL7
	8J7ytdDPX0yY3pz/4YCAHm3YFZ2guvb2IL6CMZMk23ATplxUFtvQQKoQitKkF/FtdoSx8idWsLy
	/lM2wtJ86I0Fk93wg6Db5hGRVOceTeBS94Kpr/UaDPVdzhghTOw0zrBwmZZ88OrfTEBlVYVolSU
	mHmbsSGtidH0hN720mopE5Cht152NbKEhzfcyq8/hEJVIlXX2rLcRI1Zgkb6ONTEMt4yIeRv9Jt
	TfaE7lYzzWxgmCRrEcmxI6wmIPsPmFmqj/DXUS62KpsnOgL62RErg8m65dt5bjdMtw+g/HU0Xln
	gOg+7EyKCw6iOW4f7icfS63Tw==
X-Received: by 2002:a05:600c:154c:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49ce57f4d96mr132509275e9.4.1788382221015;
        Wed, 02 Sep 2026 13:50:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f914bsm19601605e9.3.2026.09.02.13.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:50:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 21:50:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902215019.5d0c930a@pumpkin>
In-Reply-To: <20260902142107.511e71f3@gandalf.local.home>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
	<20260902092437.00dfaa25@pumpkin>
	<20260902093644.5b0e8a64@gandalf.local.home>
	<a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
	<20260902123933.5c3c8fa3@gandalf.local.home>
	<e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
	<20260902190632.16e9c66d@pumpkin>
	<20260902142107.511e71f3@gandalf.local.home>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 14:21:07 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 2 Sep 2026 19:06:32 +0100
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Wed, 2 Sep 2026 09:44:49 -0700
> > Bart Van Assche <bvanassche@acm.org> wrote:
> >   
> > > On 9/2/26 9:39 AM, Steven Rostedt wrote:    
> > > > On Wed, 2 Sep 2026 09:31:41 -0700
> > > > Bart Van Assche <bvanassche@acm.org> wrote:
> > > >       
> > > >> $  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
> > > >> include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
> > > >> include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
> > > >> include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
> > > >> include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
> > > >> include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
> > > >> include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)      
> > > > 
> > > > Perhaps these should be converted to normal types and assigned with
> > > > __force. There's no reason to have the value in the ring buffer be of a
> > > > __bitwise type.      
> > 
> > There are already a shed load (or two) of __force casts in the defines
> > (further up the same file) that handle some of those fields.
> > They probably go away if the __field() used u32 and any casts added to
> > the TP_fast_assign() expansion instead.
> >   
> > > Yikes. Typecasts in general and __force casts in particular should be 
> > > avoided whenever possible, isn't it?    
> > 
> > Anything __bitwise is pretty much going to need an __force cast before the
> > value can be actually used.
> > But the syntax should have been __force(type, value) so that the compiler
> > doesn't see a cast.  
> 
> Linus has made it clear that this "fix" will not make any changes to the
> kernel. Sparse simply needs to be updated to figure out that the existing
> code is OK.

Actually it wouldn't really to any harm to nuke the __bitwise on those fields.
It seems to be an attempt to generate strongly typed integers, but it doesn't
stop you mixing up the values between the fields - there is only one kind
of __bitwise.
There are methods of ensuring that the correct constants are used for flag
variables - usually accessor functions that token-paste prefixes.

David 

> 
> -- Steve

