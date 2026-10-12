Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB63644D4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785816; cv=none; b=vAVBGPiJtF8NKPAwI1gssU5vlUSWYQihQ5JXHiz8jw1iMB3pvA5mzszpSN6DU/Gh6SkUnT75jEKTzsduTBlMVuW9Om+Fb/IFFWE9JO/pN8OcSetAZsM2eNZGlSQXj0G6ZJjCdg5URIceXdZnJM1o5rMSVB4n4AotED9EJ5xQH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785816; c=relaxed/simple;
	bh=snM8WfXNnH3pDt4D2M/joNrGQEf4z8EjAt8k+qCcXb8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6/mDByjoqMmW71mXUVi/bN1wi8Bd0xPUDzJqyGB3gfIQKu3Rf5VW9N1DDIWP65nStqLlMqpi9YZ65+9MaIlhIIfReMOsa6AYaPMLiygAcoZtZY5fu14O7Goa5cf9RH6+ty+/b0/e5v2npiZrB25gl0T3kmE6bz9XuDzyv/Ct4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ULk5RKNx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ULk5RKNx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1819024e9so1411905e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791785813; x=1792390613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1x1HBT+V5Jzo4Yrrf6P1gbvWZUJLbFZju+Mc+bmQL6A=;
        b=ULk5RKNxmJ0rxgSgWa6N7iMdIsz1Qajo1h1b3pmSONgeoyoUfu7BvHR9y3098ZNdbP
         dkPDecBi9oF8PgeTlWjIxUmUoYcZE8dD9KgLQL7d8XPsuBs8JWTHElgEO4kGOrZ/Ywa2
         ltjaW0u3K9YxxiINel2gQ2vCGhApMlvICi+AucVqkbTi7dF+W28zjYkHpPKOydunAwz3
         1aXTv+A66p4fVpElTWGpLKA3UnVj50wH00AOw4jaM11Ks4Q1jUnYVgxLqSJH9ZXwX5Kc
         C6GV5TgIqgrViGtSZpfcl1UNp8tkHbjI7gOLdK+ibpDaKwnE0PHRh/XEk5usgat/SVOB
         GwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785813; x=1792390613;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1x1HBT+V5Jzo4Yrrf6P1gbvWZUJLbFZju+Mc+bmQL6A=;
        b=AUAISt23q9WkifrO7Xr205+Blxk/wYDyZlWvBmQi1WdjyKxHw1ARmhMJHV4CU16kcr
         o7zH27Y8tgYVEtgXpsg4lplFzIhX0HqaPPALtb4pGoJxXFilvzaIdT78y6nOdHkzEut6
         /IwwjSmk7v8KKH1YJc8/KjeG8ipUrMYwyEi/e0rDa7zz/LbBTFoZwAywZ8OdWf4ibAv4
         XkpPIMyXN6xHZppip54p7kT4h0B8Rsws6un7LNqCIKdV/hFLx11O+vCTNn4A1cX1P97O
         CfOM5sNTOTEcOrTNIdOk7IqMf9gNnXD+51+HZQWQYlAys6LmomqGSsOWP/JlYpLnY5q9
         waPA==
X-Forwarded-Encrypted: i=1; AKwUvBwfH5lS6zO/WIBGdBfgvrAubxqabv8wgS1RM3r2mDn6hJwa1SRWXOpzsOaz5SJjdR5BNe3B796eNhKbE7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBI5RWu95dOwwf48VhjngXZ62ZFd8ywEl3oK9ie8UIz+mn4YYO
	CaWOORnPBcMWHp+YIF+WFRmIjdQy3e1JPUBrnWgh8ihYCNlQPSZA821cqhJw/DTDbJk=
X-Gm-Gg: AYBFou3uaSagHmcy94IhXGEjd0dm75I1XuZ7CHKseX0+cIRhx7fzUWp/d9GeJVh97CN
	ygSI4EcwbkG26HJ/0IoZSp2Es3RMsygkmxezztvgzO3XYy9qjdhux2piweT1ywFElIa1AjPksWt
	oJm+k/yIcl4gZeyiZdE31rqefYOkgDg0PwPIwNic+eNAzIZMmhqth4LraPhxuYuSea8c4YFCatU
	2aG76YIE8HXPX78/1jz3X1bZYWzekCGwEiwEx7ZlZlPZPN6EshNP7k164vnmYzKlJ8aBm8rR8CB
	ZCGIdaqbumNKoq4GLj0Cc9hCZkU8rwUZ3REXryVwWZrlxqxXQ3jLmmpJoOqLOaL6lUOX7ih1Y1i
	6TMFjTVaGpl0qjGLa+Y7U6ca+4B6BjUVj7QNZeL2l1/5+S1fcoedWRXNOqmCU3w0ybNWDNL/Bux
	/lr7BkKycRfHpe1y9mstqE9nnsEmWJZBQGudBSACY1QrZOaBdrPP/uoaJ+eNxC6KwZYw==
X-Received: by 2002:a05:600c:a086:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a18e3ea887mr138006205e9.0.1791785813436;
        Sun, 11 Oct 2026 23:16:53 -0700 (PDT)
Received: from mordecai ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dc1abcaecsm13993931f8f.18.2026.10.11.23.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:16:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 08:16:51 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Hans Peter Anvin <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Subject: Re: [PATCH 1/3] x86/tsc: Replace magic constants with xxx_PER_SEC
Message-ID: <20261012081651.355a5bb2@mordecai>
In-Reply-To: <asjuNlFdLGsNUJh9@kernel.org>
References: <20261009100436.1133518-1-ptesarik@suse.com>
	<20261009100436.1133518-2-ptesarik@suse.com>
	<asjuNlFdLGsNUJh9@kernel.org>
Organization: SUSE LINUX
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 15:37:58 +0200
Thorsten Blum <blum@kernel.org> wrote:

> On Fri, Oct 09, 2026 at 12:04:34PM +0200, Petr Tesarik wrote:
> > Make it clear that these constants refer to the conversion between seconds
> > and milliseconds or nanoseconds.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > ---
> >  arch/x86/kernel/tsc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index 723347e2cf7f8..bac81d37a90ce 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -253,7 +253,7 @@ noinstr u64 native_sched_clock(void)
> >  	 */
> >  
> >  	/* No locking but a rare wrong value is not a big deal: */
> > -	return (jiffies_64 - INITIAL_JIFFIES) * (1000000000 / HZ);
> > +	return (jiffies_64 - INITIAL_JIFFIES) * (NSEC_PER_SEC / HZ);
> >  }  
> 
> Maybe use TICK_NSEC here?

Note that the current code always rounds down. TICK_NSEC rounds to the
nearest integer, but since it makes no difference for any possible
value of HZ (100, 250, 300, 1000), I'm going to go for it anyway.

That said, there are other occurences of NSEC_PER_SEC / HZ in the
kernel, so I'm going to clean them up too (in a separate patch).

Thank you!

Petr T
