Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672A470EA1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759593; cv=none; b=Jnf7i5/wWYzjgPcmLb6hIiJ9CtIJyY4hCA5tAgt/6RhgT2yZfkXiCILK4k3crIkfI72QUao73pSB6f1O0SNI/U5zvIgZQq0kM9ndfLTA8ohrknqRq2kL0XgX3KWaiqcHgYvzkBBqSAUbw2r3ed4cUNoqUXcs9LPzu+Wc+ZSMPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759593; c=relaxed/simple;
	bh=qobQeXpRTl+w3E3Mgv+CXQ5I/Xvi/dYHDAXj8cOuJvU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dauPKI5+XIwKy5QQr/UjLLGzYhMvWpg4mqXHT2NpaOsIcyfTAlKkRuEJBYg6yqCW0gu6lsG4m14Sy2oJsdCfOWGwK2Cm+9rQp0HWM7/AXWXAUkwTmnt9zOaMjT+Ip+UsXrdlrIG1xeNB3JOP36VlewLzo9w4A64EDCCwO9uIYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5YsHlCJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5YsHlCJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so38521825e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759590; x=1791364390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9TKM9qGe17Jk+sMm66qJ+r/rf6R8Q2F3mXd7aggg48=;
        b=A5YsHlCJTveGuuwMcIg02wMWMGDawx+op2ft3BneTMnpeYWt89+kCs9CSuaCzbiiPc
         ih6EhpbBwEAxoGlL5/Ivg6CHreD0Hqz215hErRPcbFt94eeH8u2IDLs9SxRrR2Axv/Cd
         sN6/TF9WuB3tmcCgP/tq8MOCwfTzhM6Xre1Dna7OFXKPI+HiN6mU1sMR8ABoq5j6d3XU
         m3e+bJjwMWC0Trc5Lv1AhorOGD2YxekQ1wIqeUqlifH0O0IPuqTneKNJyYUKFKkkPvLy
         CHV0e/AqviseUqynkcxES+kZROEITu/pIOFCJqaNvcofcqXjLLD8REfp0tPoI8fLYm93
         WWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759590; x=1791364390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9TKM9qGe17Jk+sMm66qJ+r/rf6R8Q2F3mXd7aggg48=;
        b=BsZdHVn/a1LIebHPlGEiUMcLjiCroZSKNv/+Zjv03Lw7OqkpxJKnTKMTwA+x7d5eZo
         rnob6LJEZKUse3+vDELEe75TRaLSJsafcshXOE5NH1ThCGAdRVsil4ahCPKBWnkHFjOU
         cfF5k6DnzE9jf8gJA8yNbo8ctYXh+4kT4+7oylSvTygzCni4DlGbHsiN1AsnY9IUrWL0
         hsogYBJ3QGQd5xZtReclhKPFQzPZcqpwJkvobK6V3ju8RQgrmTCNNk0yyO7ia/3BDJg0
         Mq1rcUiyJS/MwuYcZBD6BRPVc6dVWpc9qttFhSxkG3fCcyICnoYunssCVvQ7ZdJZ5arv
         xJJA==
X-Forwarded-Encrypted: i=1; AKwUvBzXy3q69JjSrcaFqsKHS8MTsjTwOVPfDQEQekxNR4rX6VU2JziWiaHHD+MAfPGzOf8Tu2DBekqNYMVQJxI=@vger.kernel.org
X-Gm-Message-State: AFuF++ngjp32WhIK8ml4ORfFWagdR59JRfQMgjqzw9nw6xwwJRVVYBpF
	A0EKdbksgaBYDumwnmQDohErjAFC38S3jPxw82I7rQvBJHrc2YwtQG2F
X-Gm-Gg: AYBFou33OVjYFy5CxWCrOho8anDoC9gqbxoBb88wVpdoo2sRHXVuVU9+76HjqDwp9RW
	jQNbHu38S7Cfo8gbqJmIO9ULMKnRCXTsyvD4AdXCiNZ3RQ0FxSoPKvuG5xp5zfdSp7bdPnlWWQY
	dPzaJwUtgvAEkctDEetQkV+L5po6cZD3+xEygrpq6V1BrlJ5jCxhJOWdQK0E3+sw/kUvxYYj7tc
	+/u9tGdY2YrSH4R1vTBAFSyf4vdeQXGLM61t+KWuIlEU5Pv8VmbzUucvq+5Jf+g8Zkua/zWBV48
	19dIYVhWp+PHFMyC05Sj6+9W0fcawz89+mRznfqia7IFzFdMeOZdzFNYXNZThGKdPLdejQURn6l
	Tl3NVrqDVFJSVHXds2ZtAhtBBE9pDqhtZtwPdTE/BVlUO1wLyijUzf0B50njiMk93GnAG1H/mZr
	Y0Qx3FroGDTyuO/8kv9TVBWKM20pKtlQ3N8EGsV1jnvUFU+i01yUJvaxlM7EnPTIHmRXtDPZcFP
	ZKaLOliICUcoj3XU3upQ0azWjuWP1ZfOeiNwvJglQuwLA==
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a01c0ec65fmr5393095e9.29.1790759589700;
        Wed, 30 Sep 2026 02:13:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d5191sm41766015e9.3.2026.09.30.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:13:08 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:13:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: jim.cromie@gmail.com, Andrew Morton <akpm@linux-foundation.org>, Petr
 Mladek <pmladek@suse.com>, Zhen Lei <thunder.leizhen@huawei.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Andrey Grodzovsky
 <andrey.grodzovsky@crowdstrike.com>, Steven Rostedt <rostedt@goodmis.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Olsa <olsajiri@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v7 3/3] kallsyms: Unroll 24-bit sequence reconstruction
 in get_symbol_seq()
Message-ID: <20260930101307.4477e264@pumpkin>
In-Reply-To: <202609292329.87EE58BCF8@keescook>
References: <20260929-ksyms-tune-v7-0-be568ceef41e@gmail.com>
	<20260929-ksyms-tune-v7-3-be568ceef41e@gmail.com>
	<202609292329.87EE58BCF8@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 23:56:12 -0700
Kees Cook <kees@kernel.org> wrote:

> On Tue, Sep 29, 2026 at 12:07:32PM -0600, Jim Cromie via B4 Relay wrote:
> > Mark get_symbol_seq() as static inline and unroll the 3-byte extraction
> > into direct byte shifts: (p[0] << 16) | (p[1] << 8) | p[2]. This
> > eliminates loop induction variable maintenance and allows the compiler
> > to generate direct loads and constant shifts.  
> 
> So... did you actually see any difference in the output binary? This is
> such a small loop I'd expect every compiler to both inline and unroll
> it already. *time passes* I've checked; I was mostly right. :)
> 
> It's already inlined and unrolled by the compilers, but GCC weirdly
> didn't see through the array math:
> 
>   At -O2 GCC (and Clang, mostly the same) on x86_64:
> 
>   before                                  after
>   lea    (%rax,%rax,2),%eax               lea    (%rax,%rax,2),%edx
>   mov    %rax,%rdx                        movslq %edx,%rdx
>   movzbl seqs(%rax),%eax                  movzbl seqs(%rdx),%eax
>   lea    0x1(%rdx),%ecx                   movzbl seqs+2(%rdx),%ecx
>   add    $0x2,%edx                        movzbl seqs+1(%rdx),%edx
>   movzbl seqs(%rcx),%ecx                  shl    $0x10,%eax
>   shl    $0x8,%eax                        shl    $0x8,%edx
>   movzbl seqs(%rdx),%edx                  or     %ecx,%eax
>   or     %ecx,%eax                        or     %edx,%eax
>   shl    $0x8,%eax
>   or     %edx,%eax
> 
> So it's actually the loss of the "+ i" part that does it.

A quick 'register dependency chain count' gives the old as 7 and the
new as 6.
The annoying 'movslq' might be removable by making the parameter
either 'unsigned int' or 'long' (and might go away if the function
in inlined).

> 
> > -static unsigned int get_symbol_seq(int index)
> > +static inline unsigned int get_symbol_seq(int index)
> >  {
> > -	unsigned int i, seq = 0;
> > +	const u8 *p = &kallsyms_seqs_of_names[3 * index];
> >  
> > -	for (i = 0; i < 3; i++)
> > -		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
> > -
> > -	return seq;
> > +	return (p[0] << 16) | (p[1] << 8) | p[2];
> >  }  
> 
> I'm on the fence about readability, but I think it's improved.

Ditto.
There might be a get_unaligned_be24() but that doesn't help readability.

The code would be better if the value were host-endian.
gcc 16+ then uses a 16bit read for two of the bytes.
That also lets the table be defined as:
	extern struct { unsigned int v:24; } kallsyms_seqs_of_names[];
so that accesses can just be kallsyms_seqs_of_names[n].v
(Although even gcc 16 seems to do three reads in that case.)

If the cpu supports misaligned accesses you can do a 32bit read
and an 8bit shift.

David

> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 

