Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870511;
	b=bURpH1zdZ3FcHnKLjkmSkzE4dEsymcVamTIgUQJaJoQjjbqheAhG3Q32mCdrAOXKD4AR
	 XF841HZjZiiNFTvPiIuG1Sw1hhJDoNBjZO6GsvtylhKOTWq/l8MJaBR4z1gYuuydUs36N
	 2rCa7EOjyUp8DzbOm3N6t/KD3RCapMliTZLF6bJ4eQYFtX8apEFWGvLvwy6Yfa4MjY/ej
	 I4nwGstCl6ioDnGwiZEXgJ0hb4vHmcXmNMhmWSBqRqBCAbhagXDXm/I72+hrZWkm3Z1uc
	 XN0ekuJ+7Zj1c1f/jOzEnQpLuSSfGw1OO7Zc/8P1O52M21fPiWcd7sMjojAd3wEH14w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ak9x5pn77LYpbrOAvo4GHkz6DjvrPWIAs7V9DJYOPhw=;
	b=Dp4nRLC4zLMc9ufVPqOGxvQT3rRGQcvy5gkF9JIu0mvO2t7lHiPAjqEBSFmFdDGFr4JT
	 7raYDGS9W63mzAuAQ3L/CtADh4kCOFf3+QEWhcUEA4YfDXzxhQ3QN33uqtnf29h6p4ypP
	 /r9LuZBh/YM6kaDzEu9NeyMlSR9abvaJgSdaKj9Xk+douHa6YafZYMfsH07ElwfBDuNj6
	 LjSely+FdS23QikCc/7FiiQKcLRjUidBBgKDFM6yEd3sfsVd8W9b5Bunv6e083QzdeFwb
	 PYEpln75Iactpe1IUjCE0bfYt1XzG3XGMZk012NimK+qYIsybaIbc9uAwbNQtFOiXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g11l1Mql;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22AA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g11l1Mql
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e4831c028so1472580f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793870509; x=1794475309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ak9x5pn77LYpbrOAvo4GHkz6DjvrPWIAs7V9DJYOPhw=;
        b=g11l1MqlFn50b/Mcndil8CxwZ+kNwuc6jd5CyU8kBUAll8lMu7vxnu9Zu0Uwydeema
         6RkzfBszlD5SqNS9+6GMk6gALC8ljV2+YeILbQgoFJb28rydlN3OzSNbiBvzoFhvRWcL
         R1NTa9y8eLArb8diFr/txy/0tSodCipp0CLNMW7s+jppTYoOjg4LmS7xF2L29vwcCiRX
         8Z0RMHFxuLwxmXnssan04mSWakR2KVI5dLQ8JP6uMChNFoWBjanEmDlIuD24OE2uY8eP
         nn/5Pl4IaQcir3agR9xcs67x3Et7mU7TJG9VBGMWpRjI6Vd9MjZMndICusp7i5cQnK3k
         uPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870509; x=1794475309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ak9x5pn77LYpbrOAvo4GHkz6DjvrPWIAs7V9DJYOPhw=;
        b=gxy1Tg3W4Ym1d+W2maUOz7CHe/UNA/9YkrjuUn93+RAEMFskQKwNIou/5UspP49482
         5E58H/ezvvv8KAMEiKC5SvBUNkgPOTyRYAarlhs70qDTx30Ks0I6zevFacbHdjPmZeua
         w2nyC8FrVKsx80iA+HjQ6WKJXxwmbo9n5fUbBn3607VhslqzfcQ54qnGk1xRynKQtwln
         loZpct8W8rxl3KpSswTx3yHuyDGx8d87BqhFRTG88mVk3RsOdTH1L4B98G0LXRF2f0hp
         yN6y3yeKsnht6LI11NCHcHNB/5YRWTVHcDnFcTWo6/8ZpHq3tebV3RyrEMY4Pgad2Lkw
         IxTg==
X-Forwarded-Encrypted: i=1; AKwUvBzQxUtbCCaEaVjslt7psPv6wigg1bzR4to6S/FU8qLjcB7a0+/mGkjxRwwGqy4fcYMLrVsCxsGn9Rz1Ky4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qWZsxPfEnGNnNTqGuT2ltYK65Gnq3lS6lk8d9QcHxOwYVMrxk
	5EB2S9+irKgp2V53QmGeWI4RYTKsMx4y46hS3k6Ge44k2FuLKlVIi2d+VecTiO+jcw==
X-Gm-Gg: AYBFou2f1g80qPEuA+0c2iW/NsMUHmH1AAU2h3nPUQBLn4lzjPcK4OU+L5Sf6LTSXA9
	zt09jUKBcuNIQSbl7qVkm0WBGpDib+ZLm81XPo9BVykcRNMwyBP3sT8iKy2wKMhDu1KfuhbI3od
	EqAelfeZLecprdP/nLh3JvaDyCsVpaka8zdcH9CycWGiVa5QTHwWDF0wkTt4EOvahl3gttZyiLu
	R4I3rzMsWUh/6XXs6ZQfT+M8o2VbS5NU0QS04FGsxCSGStGrePrMMDWzswhW4UwcNgX8QbkT8uW
	DtfJO5RJHhvaYOKoPyVv+U/uL7ZF4Vo14zk3iMIXdKZcYB9qbWPvZCItslW0BXMo5atmQCRc7QV
	nlps/KVOv6r+PuFgjUsansyaYfAIRP6ZB9NH8G1Z6yXm2b0OdhN0fwnqe9GzZcKh6vgnHHSozh8
	jN0pHzItbD+oTf2+GIdgHeYOZhwbEnsVnCwD0YYXwUqong5kAkaRy5p1rnvFVROD5kMzY5khIVf
	5OPA1uM7YeSM+NcS+GUxjlxanSpbAWc+3sZzT8rvnTjfMRWLITkJN2bjugVNSTGoGvXCeQbdgl7
	QTumQQryuL+woddogBht/ayT4qJeRCLEGvZfM8/247n3xcn+GFplXoSdAUuHc+JB
X-Received: by 2002:a05:6000:288e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-49145bcd7a0mr3470214f8f.44.1793870509058;
        Thu, 05 Nov 2026 01:21:49 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm7877076f8f.32.2026.11.05.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:21:48 -0800 (PST)
Date: Thu, 5 Nov 2026 09:21:44 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ring-buffer: Drop redundant
 ring_buffer_iter::event_size
Message-ID: <auxKqGjWEZa-7iNt@google.com>
References: <20260922072944.1281427-1-vdonnefort@google.com>
 <20260922072944.1281427-4-vdonnefort@google.com>
 <20261104140723.1251aee1@gandalf.local.home>
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
In-Reply-To: <20261104140723.1251aee1@gandalf.local.home>

On Wed, Nov 04, 2026 at 02:07:23PM -0500, Steven Rostedt wrote:
> On Tue, 22 Sep 2026 08:29:43 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > event_size contains the maximum size the iterator can read for each
> > event. It corresponds to the maximum capacity of a ring-buffer page.
> > During non-consuming read, resizing is disabled. It is therefore safe to
> > just use rb_subbuf_capacity(), making event_size redundant. Remove it.
> 
> Hmm, I don't like the code dependency here. Yes, we disable resizing and
> the event_size isn't going to change, but if in the future that is no
> longer the case, then this becomes a hidden bug.
> 
> What's wrong with just having a field that keeps track of the size
> allocated? It's more robust that way and doesn't have any hidden
> dependencies.
> 
> -- Steve

Ack. It was just an attempt at cleaning up the struct, but indeed this makes an
additional assumption we didn't have before.

I can drop this patch.

-- 
Vincent

>  
> 
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  kernel/trace/ring_buffer.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 1a158a24b3c8..3129589e2d0e 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -680,7 +680,6 @@ struct ring_buffer_iter {
> >  	u64				read_stamp;
> >  	u64				page_stamp;
> >  	struct ring_buffer_event	*event;
> > -	size_t				event_size;
> >  	int				missed_events;
> >  };
> >  
> > @@ -3558,9 +3557,11 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
> >  	 */
> >  	barrier();
> >  
> > -	if ((iter->head + length) > commit || length > iter->event_size)
> > +	if ((iter->head + length) > commit ||
> > +	    length > rb_subbuf_capacity(iter->cpu_buffer->buffer)) {
> >  		/* Writer corrupted the read? */
> >  		goto reset;
> > +	}
> >  
> >  	memcpy(iter->event, event, length);
> >  	/*
> > @@ -6488,8 +6489,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
> >  		mutex_unlock(&buffer->mutex);
> >  
> >  	/* Holds the entire event: data and meta data. */
> > -	iter->event_size = rb_page_capacity(READ_ONCE(cpu_buffer->reader_page));
> > -	iter->event = kmalloc(iter->event_size, flags);
> > +	iter->event = kmalloc(rb_subbuf_capacity(buffer), flags);
> >  	if (!iter->event) {
> >  		atomic_dec(&cpu_buffer->resize_disabled);
> >  		return NULL;
> 
