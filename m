Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656FC46AA6E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044928; cv=none; b=XKIEJawBSGknUPUqex03sUMlteEtsjZvO6LJsi8tkMOEKV3FxVSuAf65z97qwIb95WaqSo1O0tDYgPqUgzwjKzejlbCx/8qj8Dfq++rvkEgw7ehb8xJFdP6o9c4Ne1CPNd8gsoBBiDxi3i4pblGl2e3tq9oGQAkSC1xxB6XLSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044928; c=relaxed/simple;
	bh=smY6yBPbHEvgEFgKewvO2VX1mQwpxkybfqc6pFJnwSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyjlUqVs81LU3lZJ7TYTt2H/sKrpv9Ue+xL2xxe9/vk1xcqsZZuJJ7tJ81L9FbqI3QTYdhkx8R9KCVhF6Z62XjrcTVhcDC43ynhYIdiVKSC7e4vduLYO1EYHPEmsa3uhQ0A0pC4gIUlXBFSrHEVmMOX0JQ+fobthJ4vWQ+KRQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQqMXMPD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQqMXMPD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso3072074f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792044919; x=1792649719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ar2lIaXGZYKNwi8B1Llnt5LR3QyG4oiCO9BSq6FLNgc=;
        b=rQqMXMPD+ndLFK7DAlWSIS3ZNoAKO4xigZr6Bcsh1bZh7MJ2vl/5ax6QV+n9ez56AQ
         NQv/A+mq2ci1ZpzJvGnQQChiHw2lJNMBN7H9CnHrJ4ghDI6he57GK55W4uzmTxi6lvo8
         HOHR6Nt5PmWwwzeR90qu17Q05pWWzJSWDNLYoxjE76OcfXZ5IQ06VP3tAsRbTp/9hfqs
         ktsUhxRgqbLM9DLEtks91U9BQw9qzHa2EqBiXCthAfjy4jQlyMaPCtG879elpPIN8vUj
         GHdKXEhK/V/CMpdaxHBaXgXrREQ4bUHgoY4fyeL3XAmeqMEuGuoEj/n4y0wV2i/ISKcd
         QEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792044919; x=1792649719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ar2lIaXGZYKNwi8B1Llnt5LR3QyG4oiCO9BSq6FLNgc=;
        b=amh7pFUDC7kz2Mp2JcJlNG/nBW4hE0pkDJ4VTk1wx8rvz1wGq5nuJjEz/K/aeEN2IV
         Fzm4uQikmgqFtPIOSiqhN2OPGCatHK7TwwOcXVXYrxAhdMKJhUtwhVjW4DlQgN0u6rJG
         rJJp5TYNN8OtD0hoz2ZOzvS8sdQNO3IZTuhnQ/W8Q3OiU/rAPgwP71MOP683C1IYFoqn
         fFJfS6z/La0M+6qbct8bmOgDKG/MNTo7AMauLnM2/5XmyYtH9ICcilQ/OUSBePLZO9dm
         CMI7UUdOj3pCimf7DKFkfoVBHzpzzcbmWbd4ZhbCljEZduALwgeeaStp8CaEK01q4P5P
         JsUg==
X-Forwarded-Encrypted: i=1; AKwUvBynXTdXa6O6FHEIx7C+oaB+wv+zUQxTtzOVUjIOeFXnS4XHYvhLZyH7GDc6esJHyg5zdqUB0b9YS+KK2+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4htgQJbBJRHtKGjbke29SwK8XDK6eGE4jRuT2chdKJRX5rCBo
	IKW7vJv9aRPBWRF/I3G49MQn1nbV8xZ454242L7TE2YQ91a00mNn99Yy
X-Gm-Gg: AYBFou0Eq+PEz9wsxElsgassBYeTQ/Gr1CPpLT6RyACggh13fOM8YeUGYSLjVVZRq2S
	kw5UnHCOxKae9CRT33RXPLuZwuNEMav4t+mIwjloZh1Qw+NZgDHjQ3g0746+WqjRk1l0/Pvppe+
	35l/84z3l4XTCDmjSX+1ml+eL+kzyhx1Ebrz3Y7yVxHoEENPyT5kXRbiEQ4g2bAFRQQswAeRXPm
	CO0WP/a+EMEh7oEbUo/35/YTY8FplfwyF5DI/VWuMH8Tk+VxVZQnIVcx7+FoNqiMwkPI/l5k5H/
	Z7f4/am8CrkR7jY6F7OQJZAimUCqyefBDx56f6AxmkaO2u+QCFFkI3GIsNa+36U9KMSYecA1Idg
	KQepfa85+AurMlRtCAA64G2GNfq2CVQ6uabB0WiFvTgSF1FyCkVzHo9pqtNtbnEdpiqOOZvlhMV
	o54MB1Ago5fjGfA89Jtb8DKbUvBGoMOKcGO6QAdRj2rR/2KwnMtQjgUCd5/xCNtNx8izY+xZhOF
	8Wnbcz3GusC07BSOBdlEFor/aAk+BdbD3roKgtJ5VHbr172VRiO3enbX1akrHIBtqiU0esvNAAx
	cHL7QgJ7kdw8C90e8bewP4P7jsAUamhhm/XwJK6cMbspmUWiVUH0/rhVFRa23FspJb0Lzcp8820
	=
X-Received: by 2002:a5d:6f1c:0:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48df855d30emr211551f8f.57.1792044918908;
        Wed, 14 Oct 2026 23:15:18 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd733fsm16578043f8f.58.2026.10.14.23.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:15:17 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:15:15 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] netfs: Restore selective debug mask handling
Message-ID: <atBvT7c8ZF4szPae@gmail.com>
References: <20260905051738.11317-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905051738.11317-1-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 07:17:38AM +0100, Karl Mehltretter wrote:
> The netfs debug macros test only whether netfs_debug is nonzero.
> Consequently, selecting one debug point enables every entry, exit and
> general debug message.
> 
> Documentation/filesystems/caching/fscache.rst and the NETFS_DEBUG
> Kconfig help still describe /sys/module/netfs/parameters/debug as a
> bitmask of per-stream function entry, exit and general debugging
> points, and the fscache_*.c files still define FSCACHE_DEBUG_LEVEL,
> but nothing has decoded either since the mask handling was dropped
> when FS-Cache was folded into netfs.
> 
> Restore the per-level and per-point mask decoding.  Files that do not
> define FSCACHE_DEBUG_LEVEL, which includes the netfs core, fall under
> the cache management stream, the same default the FS-Cache macros had.
> 
> Fixes: 915cd30cdea8 ("netfs, fscache: Combine fscache with netfs")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

A friendly ping on this debug-mask fix.

Thanks,
Karl
