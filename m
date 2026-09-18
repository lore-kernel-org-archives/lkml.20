Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C213D45F4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702076; cv=none; b=OlISiWOfGgHrYKnHKOTnzwj6RI1pvsJ1lPAJzN4eSxdLEcqQDtfNo7i6M0cNBSsQ9N2mtXGEIaAxGHhwgly/3bVt9L5YHi2hHvswC8uPLyCX1+p4VW9TpPvJXBGKiAwhgz4JiE6Et4qbSTSMrGIFb5RfTKs4nckfxYfXf3vi6oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702076; c=relaxed/simple;
	bh=M89qwos8bIa8z8siW+8qSaPS6+PF/il/I2qmdGSZc/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzhGSeff6E0LgID7FFxbl35r9KIOtjHR08ea3NbcNXOlvFeihYoi36UsmNXj77f7bLOIn4+4VA7z9n6iX3i+Q0UzdZoY1vREiyaeo2ce9ZXbmc9OCqC2rYWWfAWL6B8fjzanwXhZdqrja5l1mWMHwYqymICgMea7HCRzxQCHlbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaAzE86h; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaAzE86h"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so324778b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702074; x=1790306874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ewbNB1JGp6SY0tvsl/Ra/3TEW7GOUpyzrYRK1fZD3I=;
        b=JaAzE86hd4M/t1jdek8fWLU3ScTLv1Q4sL8TAZBJX8zMAYZXInPgf0oNj/hp3Pto+M
         efRx55AAfHrM5fcDnSA7S9YLYteOouNTTV4oSgVp5fqUjlmsRhtHCMiWM9Wkrr8/ZpaK
         VG9b375X2wJ2YgqIgLjubkpghHJo6yMgI5bDyIsuD+9FHkezy4Pwmd+ZrbC0nKDvTd7l
         HcMlPQ6PVmhdnZ1sNUjtRxWCRaEwnzoZxyAcARWB5/47FUqQGVKw5DshctNbNDAUZ+8P
         ItV1PgzlJ1X3DRQprDQRMGdWBKB1ejgnkTsW2D/WhvmmsnTVBOumSqcnke+b74Z7CIuq
         ottQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702074; x=1790306874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ewbNB1JGp6SY0tvsl/Ra/3TEW7GOUpyzrYRK1fZD3I=;
        b=p4SKLt7b0IdBVbwMX/Ksq0QIU5bSZdlXF/XIFeHS/rkkiyfUcw/HX/3eIBy4oQ0wSC
         nieGJhSgEgr2PC+sbY2xEcYr4cWhjIw0d/s5EfUkksuYaMC4QW7O7DjwMsRE4pUnouV4
         EW71jk+Zl/02Qq/msC8HSwSFULqy861zXab3wh2rlabRk4jweRk4OzK14Nf4h7XJwmIb
         ShnTKhj+HNkHAnQmC9ciRftB5NKj1UcnXqgP4hd366BP2lS91HOLA7j4rjSXRaG3Y1as
         BZgroFKp2jiOcB9qCGsJ3KkEjgrIrQArJqtYlT92QehWJByNP8cyvmO7dEStT0TPCuuM
         Lz9w==
X-Forwarded-Encrypted: i=1; AKwUvBwpSq9+i5tZNRde6SO6/vHQ6H60mGlTuIk1f5cx8AV+suVlOd/wRUhLABNdy35LiWBTxTC75Ny7EtLHzCU=@vger.kernel.org
X-Gm-Message-State: AFuF++lffXW56+MtVL/BeNsDrdCtMcRAOd7iPRlbRgcmO+1EqQLjQcCk
	w0niFXpdWm0KT/6dy3Pto15Gpm7wGoNBC1rU1WW0q4KpvHGVTriXHIDQ
X-Gm-Gg: AYBFou2KyhM8h2NFnUHFsBwmihkIA87f4/wzJL4irIu7O5W1Oswo/8+mcTQaLYivfiy
	KOXGEMJsZvGPlpl5khez3oLE87Pv+DGeRknVXBFjJNitzJWHpeNmSoHqeHhYm2AFMTdHOEm357h
	l1TfDiLW/mQFc+N1j+j/rBq8e0a2HRCjsEC4t0WgQZLVemeqs3k3Dee99fqUv1FSvok9q7HSCjc
	BcjyJBuGc1rHrFFaGnethe4rEB04r90IP9mGMogzlJUCuFKdBsnNSv+Hy0A6yBN6CuM8QrytDIB
	uI2G7OyGfcq4UeNgkkboHeTSKpao0Cx6bySB633QLbyHBtMTKkN0u0COMNPJqq/VnWoWRe/LW5x
	avKTuBZbfaukb5Sex8nxuRk0xoaKiVUiVC6LfIZpeHBJ2ENSZ4sA0rNxpB074vKExFkyHfhmS9z
	lepPKpwctwlOp+DEczm7vegyl6T7RaVbxciJUiGhUTtLfkUI+po0NbH0Wr/AYaqDvlPKrxf98yh
	Oy8LxIJtrUMTPtzog==
X-Received: by 2002:a05:6a21:596:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3dd8c3f2321mr2263948637.6.1789702073843;
        Thu, 17 Sep 2026 20:27:53 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50aa983sm144304a12.12.2026.09.17.20.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:27:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:27:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Message-ID: <20260918032743.GA29370@rigel>
References: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
 <aqwEeLLuIC1AoLQ1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwEeLLuIC1AoLQ1@ashevche-desk.local>

On Thu, Sep 17, 2026 at 06:17:12PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2026 at 04:39:05PM +0200, Bartosz Golaszewski wrote:
> > If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> > return immediately before zeroing the info struct we'll end up passing
> > to the user-space later in lineinfo_get_v1(). This may leak the kernel
> > stack contents. Move the memset() before trying to acquire the SRCU read
> > lock.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> >  	unsigned long dflags;
> >  	const char *label;
> 
> It might be not obvious for a reader, perhaps a short comment why it's done
> here?
> 

So we should always add comments highlighting initialisation of return values?
No problem with adding one here btw, as we do it elsewhere, just
wondering if you think this should always be the case.

Hmmm, after some sleep and taking another look, what does bother me is that
when the guard was added the behaviour of gpio_desc_to_lineinfo() changed,
in that it can now fail, but its signature did not.
As a consequence, lineinfo_get() and lineinfo_get_v1() now return
empty/zeroed line info and success when the guard has failed.
Elsewhere when the guard fails the operations return -ENODEV.
So, while this patch no longer leaks stack, it would be better to propagate
the failure.  That could also make the memset ordering mute, or even a
trivial waste of CPU time, as it could prevent ANY line info being copied
to user in the failure case.

Cheers,
Kent.
