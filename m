Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1850AC11
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540322; cv=none; b=i9E5YZJ3b+yl5MBAQ2L5vRGqEtp9c0GGPphj1KVx8yjZdI3nSdBwohEEbrZxyzckqAQxtw6pl7t/SX9o/GUGsST82PjVaatbv9E+dGwK5SK4OlKc6a3Jzy5F3rAcwgnzxQOY6XoukzR8wm18rUq/IW6eo0OFxVBKysJCmAaVTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540322; c=relaxed/simple;
	bh=LbKIi03ISeCz+kO0+SjDUGksD4whdOS1e3Afuc4ZIvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgykknoXDRQId2cy+kgo09VZRi8HXwtasFH3I4ACA3g+IFxVvjpzbii7gk27r2lMBg5d+7fe4uMvBghxY0Dno6mKwdNMBoRPqz28mp4C7nqIIzOPOtSM+AP5eY53FXXBSNe+YCeLq/4UhB8KbiGyzelxdqWHFIUEBJBVIDnuslE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXqvt0Us; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXqvt0Us"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so11460915e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540319; x=1789145119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yah4I9qe1gWdvzoT8BPLgON6ATUn577HEvNphRVkQcA=;
        b=VXqvt0UsDlG2YP9Xs2Eyz1Bhb+CYYSTe+Dyw1JGz1ySt4+cHyBO5DYYSsvpmk1E0KM
         hFd67a5DvTBygTIl63GIcZ0AB+XbOxdw+Na/IE4m9yMm2kZAXiupweNe4KPcSDLPlOHv
         aFZqfFDDNgF2nm4u/AgMikPIHkd9kq5+5OL75L0kqaW7sQEeXbbZLUDaaA0myqxr4Nf2
         w3JzgFT7IkqCb0aWPZmccMLZviXVMGrUfOCUA5vynNIU+p90rC5/7BO9M2FgOd5ofoha
         a/HZ63Dt7r9wTW2nzmxwEfhfis7jd7+auMUv8+C5iXMdnRfzcElX0MpO4aXpUJ4Ze5A5
         YJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540319; x=1789145119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yah4I9qe1gWdvzoT8BPLgON6ATUn577HEvNphRVkQcA=;
        b=cDigvFTHhmGaUBpg8D/ogzpSt7aMMj3aOi9nN0EyJZZyiDXDvFsJOI8jwWDszR1mCq
         5l4ulO+07+3hu0+qKQdk0ogZ/J8ef28S0/zO5iaVwflNNtJQ76VBs4pri9rB3zuwJoKf
         6V0qHX1oVPso8jaAkPskZhNwftV6A4MKp85pHlsVzmLoxkAesyYZQbPcYGvw2Wh3BE1r
         5w4qNrQWVwtk/4vwTGONfIcT1ES61PLv3i8bOllXBzKuvGD+cNjG0XYucvb0Xvo3/BG8
         g5IC1eitYHA7NequfsuWQPJEygnNlWUK1UjJ2zaMBaKHQRP/BDxrGwu1KqY62r2dKG8C
         p8Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzpkEzhen0AfVqEj5S+R3Ew5crM7EEw+rVJYVlUt5QiqvXnSZnzl8jpZl3YhH9lWUDVZFWc/iWxPGzc/9k=@vger.kernel.org
X-Gm-Message-State: AFuF++kzwSd3WlbpJl/L3/nq6IB6m1Ei/vmedisDfeLxi+A9176dPCU7
	vEOsUc+pnPxo6jsWajjHLTzyhRbIS82eOTkjZcZkDwUI/Y62xm9QGJaF
X-Gm-Gg: AYBFou3PcEDKdgBCTVPB23LfEKNJWw1LX50imaMBBU7KKe2I2xUCHBTUG+4WOl1/vFh
	utfjo1WdgQt7fQiVIz6eLDz70tx9kdOW3XC83bxFh3ayweeMWZcGdixFVuWRSmY+yNuBsEHK5HW
	R0cxNpRa54F92xaZULXxRWY6DRdEFqCRlwuWLsDmwvFn+aUnVPvM7VWeCbsBmUzY41/S1cQSHNr
	qYMqpZaDBcFmdfhGtVM/Z+roBhtszz9dQFCD6njlfBbzVMqpPGEr9UcoczcQDNJKpp+gVhSevk4
	xLyr6tuGj4toHt9cAEFWs5dSZBgJJuX+8H3XX6DKeLRAm2QUbASIenVq2dZd/rJ9gPIqTQBDSFg
	2zIBwTg10zTrVtJxj3VTN7czklRgPxPd6KSG2MKwp9hibRBUmwz/xiI3CI5t24PTp19Olcd0wvg
	EOAGknGg5NQyBIP6OTbwXygVWrluZb1V2sbZvsJh/5839VbgN2HcSOV5VCf+apb+86LRQg1BhJp
	ebkpsMVdEB8fVR2FR/IZ19ee47r0q4t4AmLZKkRYymKiUSKlE2gQb80FId1NUpove6wc92Aq7sx
	GDzdAUqrRtHbmL3sZcD4KBkOGcyuPv9SLjeQkrDNReM1ipqM5aM6M/VSbn91qnZibtnz4Txvk0r
	6
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf828cd70mr68770285e9.16.1788540318646;
        Fri, 04 Sep 2026 09:45:18 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm182752585e9.13.2026.09.04.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:45:18 -0700 (PDT)
Date: Fri, 4 Sep 2026 18:45:16 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] softirq: Preserve interrupt context during IRQ exit
Message-ID: <apr1aTzIZmQPZbQG@gmail.com>
References: <20260903112737.49551-1-kmehltretter@gmail.com>
 <apmQrTzP0sTSReI1@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmQrTzP0sTSReI1@localhost.localdomain>

On Thu, Sep 03, 2026 at 05:22:21PM +0100, Frederic Weisbecker wrote:
> > +	if (softirq_count() == SOFTIRQ_OFFSET)
> 
> Any other value should be forbidden here.
> It should just warn.

> > +
> > +	if (softirq_count() == SOFTIRQ_OFFSET)
> > +		lockdep_softirqs_on(_RET_IP_);
> 
> Same here, you should warn if softirq_count() != SOFTIRQ_OFFSET
> 

Good point! I'll send a v2.

Thanks,
Karl
