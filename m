Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837685;
	b=Iss4IjQhHk27mFypMtHVf4TrSfJTvvsTqzerdrQBq4kJf6dTl+WHo9sm6w9Q1tUdEsez
	 rCl2IDCXF5AmZ6OUglJZe7tzTOV/4fMpcfWKECXZ9j2/EHJeDByoYNfeRrtblNT3tFTmA
	 lyyF8S9Hg8BmwlJ2TOgHq+8gJYP+QQQYzCg2n6KQIM1myyg7kEEfoWBM9fS8tEHZuXt9v
	 Yl7sZT9EN+Vm1lrO7j9HcjaCSBkJfkyjQc0fN6txqvG1k2Ioc9Ocl+Mw42LvTnu+9Fg0Q
	 h3AZXm5fyyzP5q3/TSKdTE48QaZKBqxLEzJ93mGUlNCFCK7mDpkoiXbPhLkOJKUKyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
	b=MUcJPAE3pQtojw3obOirttoa4zHDIO3b/iNv+kC4R5lLNHljN12HeAcRvYa/1xZSsv2e
	 59jMZavBZCY9/yYM0HUq3ukjdYEftsyNzNfoQsTXoYFmCQxfqwn1yiQtWudnsfAXOzVqT
	 I3k0ijHawZF+hqoOTja/dJjZccbuXzX/SgkqbjnSLlsqDiVSNoqgk+x7Fbiu3C+LIkrLx
	 oGRNuiOiNxdplQe/y+GrYWWMVRCvTOEYNb6l77E4B4PFpLCLBDwDO4nAecHe3jeUVqhJh
	 lPNSPvHoPrYK7wduU3IgTXqZ1xtdGxmTG5vuAzQZMdnc6xwN02Y6u0v+IvgVLgQ2kjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V6qybNv7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79907606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79907606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V6qybNv7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so1180404f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837684; x=1793442484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
        b=V6qybNv7xo0fC7ai3ZiY835zdKjAQDhIU7NdoTyXea2t7zlKgfDV4x2XB7n0pnam3F
         Ni7k89DraHY3DpkpWSecWSop9BPvuPLTGKdHb1+SfRqbrSeOngxyZP90iaq96bou6V+8
         MIoD1H7gvTvBiS/I+eAZwFLiZwzWV0yRUxrHGxqdxOv+e5zWpldyIW1jRUw05Cjv6qe1
         6IyEy7FkFuHnKtHb+5nYhR1t1hkssKbbMpWur1VObrDOtKVGhVSI+IrT2IcSX5UQQLOj
         USczm0QIvEKKCisyCIbIvNeR26YWY5JO8H4CoIfSIkrOsZcRecDBKUE1ZeEK/tUL1QVu
         g9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837684; x=1793442484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
        b=st0wFJAms8aawqJ0ha+GNh36dTen27GfxS86dxNB487ytZLyI0jdvQ2KvLRI2Wn+nV
         8qbkNBdK80IhV6tVSsT6Lox9zlMZ5RqxRIyYbwERD1gNzl4dHIHDVWUgRuCpwrqsaXwC
         cgmv3YkIPGoyhhF3UfyopEYIwrfWAwi1b7Oz6gh2GiQIHj2jddbTaOwWZcJNjzYtGEqE
         0sLUrbsV/LpNp9LDXL6yEtX9l94BWJ41QIo4BZas8XJKGPUG+vbngC2PldU7S+Q/Cmrc
         4UBFBMi5yY6lxk9+trypeZKk1aswVKASEvk/c8Gf79xwPWQpg08kR/0EtRy0lgXQ+rka
         rGMg==
X-Forwarded-Encrypted: i=1; AKwUvByldvo6f8YqhNFkpIZJ8BRJDehxR1wSS5G4+3v/lTDf3Hrs7c2COSRcC0/y1/7P5aOWbaIR3HLKmFROD60=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvyD+3MoKGvihl7FsKUJpHp3Kw34v0vDubu+xZwM8YiKGDlBhW
	Vj/mBC2eKYOTD+Sn8+Ydj7D2h8IeJ3kiJBDEDoWw8waIosXTWD64Kqtq
X-Gm-Gg: AYBFou0FA5QunPkNuYvVe3cYOwXvVMNvwzLfHEmSU/Il2gZfjAH4z9iuKl8xh5Qq9Yd
	NR4ctLI5vkXQdx+cj72h3cD5qgQpsDHoptN6n4Uq/EhSsvpYYdxXq/gp8UpocJUG/JVO46/QALc
	C2zaS423HJrT6T83mRpFK/Xqdq7aNF6yyRkwm/jnW8C9Z6GTykZhw5e6S3549R0LigBJ8HASSw1
	omWy/2wkZdkE630wu+2cS+Ut5mjy83p8SspVQIGMovV+kmj7qFgEyyNkgyHZ0rJoyOrFojdUuU5
	254fsq52UzeXh7XTkoG+uCc6H38hUkPEn5jjQgkQzAh0aNVP6+SGX3fULhi94fBl7jtUhLvgP/J
	1pIo5cB5mh6nZVQlvDzc7BMkyuLMngLbVuu0PGnKcWi3TbBx3x7zb7xzpnG5Tt3O1pmmjfDvha4
	ax2lq/nxMACW/Rjhl+OyzzWnbUi6CzNSHJICrrbDHVjvLZib2MpXni9p7u/ulz6iDqsLQrSlqkA
	rLmd/I7tERhzdON5Yhq3MPQBe/DhajM38pF/vsEreovnkOf7VnyOLC6LZs/D1Xy4hm0xgC2cLg+
	ci6j1tNxBKi5tHYHBOAW6Uik3fN1aayQDisFHs3qP1+f903BKqQG4JPhf+X+Wvfc9vlNz7la9QS
	MrfcpZxwWgIWgdxsH/9QWw+xQ9C9WqjiO+SIpy8fw67uCUNmi/xksk52+
X-Received: by 2002:a5d:5d10:0:b0:48d:e62f:db70 with SMTP id ffacd0b85a97d-48e3eb9c239mr2514461f8f.48.1792837683543;
        Sat, 24 Oct 2026 03:28:03 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm3506285f8f.16.2026.10.24.03.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:28:02 -0700 (PDT)
Date: Sat, 24 Oct 2026 12:27:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-trace-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] rv: Verify generic IRQ context transitions
Message-ID: <atyGqz5lcvYQvCYp@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
 <5b3ff014bf2f571b935f9519f422966a1c665c32.camel@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b3ff014bf2f571b935f9519f422966a1c665c32.camel@redhat.com>

On Fri, Oct 23, 2026 at 06:05:30PM +0100, Gabriele Monaco wrote:
> On Thu, 2026-10-22 at 07:07 +0200, Karl Mehltretter wrote:
> > This RFC adds events at the generic hardirq and serving-softirq
> > boundaries. The irqstate RV monitor checks their order and agreement with
> > live kernel state. irqexit follows the owner of a preempt_schedule_irq()
> > invocation across task switches and CPU migration.
> > 

> 
> Hi Karl,
> 
> thanks for your contribution!
> I'm probably not going to have much time to look at this soon as I have a few
> holidays planned and other series to review first. But it looks interesting.
> 
> What points my eyes is that you didn't include any schematic graph in the
> documentation.
> Some folks don't like RST, but I find having a textual representation of the
> model there easy to understand what you're trying to do without having to build
> the models.
> We use graph-easy for that (and adapt things if the model is too complex).
> 
> Do not send a V2 just for this, but please keep that in mind for next time.
> 

Hi Gabriele,

thanks for the encouragment! Yes I continue working on this RFC and use
it to check for my related early irq cleanup series. I will use your doc
suggestion.

I will wait for further input and liekly post a v2 in a week or two.

Any broad strategic direction for me and my LLM are always welcome.

Regards,
Karl
