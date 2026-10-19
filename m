Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4E4A4EE4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400483; cv=none; b=OEPtiKtNZ9CwpPUqf1tOlKpltq9gqhdaYJavgvvJYw7gSduuScGvncRfbVu3FaDIpJrRzZ8umGDR7iD47ahvoBtLZsx/m/Kejujd2yNOs3prCGLFwsv7HxdpZ6SdJtQRcec36f8BaDx/yXp4rlj8GgKU6BNJFNlA6tozRNYTCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400483; c=relaxed/simple;
	bh=WLWwWzeZBOSKp0C0wY8LsKsrti3WYaCx6yssolyVc20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGHOJY+QErJuyePjm+c1F+OAYnaRLmuuQ7jPRzbPnXbuLKbKtg8xFKwQNMh4wJuY4sTwiUWxX39aTFXnQmT1BM8mM7w1E2Hp3tvlF5xF7qluOinm86qIEkW1oTqppUrddaISKfAfurW0/q90nQxUFFE0uD795bmRwx5SHkz6F34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL+ENG4D; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL+ENG4D"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso874458a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400481; x=1793005281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vybmS5BYak1w5heTo7DTlFP7z60krqMLtPatgKuV1rE=;
        b=UL+ENG4DQGJypialzcokFBbH2hNcqkiklUgduMttVl/6uw8zMl7mHACrAXIXHTR5OO
         vcirIIG84nBTUYsTaXAR8AjlRRSWg7LPm9TGemx6R0+KtBrW/JW2pCAUMi1+QzsGcXrR
         VeTxqHMoeSKx6L5/POgD5MevOXAei04SgH+xa0FsbAIi2NOlJ7UDpyeSt72InRIzXPIQ
         6WKZ29nlT9f3xae/YNrfefeFary1xpB2WKr6KCgKJD0sbi0pVzkw3hx9SZ1Y8PVLuLP1
         a6cuPxIxkca399ANA9Oi2gOguTwPbOMA9nSTGtmS2gnrgV2YJE/m1qREufbd5RxdWggX
         Gxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400481; x=1793005281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vybmS5BYak1w5heTo7DTlFP7z60krqMLtPatgKuV1rE=;
        b=1uNbjqehqLSyiCYMoGVMEC8C8uGJcOorU5WOB+PhuIvowUClh4I6hzZcVnU4LJGvjS
         BBfJ+KlGHX8HqGpg/4rTFT0j4TCMaiUKXn4+uFRqQwJe0wqlTMobLvNxlLbZ/H4Rgtg+
         DSlOyEHiQL4YqiFzd3OK/Q9931jUalbQHRYypKuMCxn35txr9YLUQhhErZzpOPuavZSB
         i8Dpm9lmV5bcQmHkKV0E3fLmO2sAL3rzyfoy8R8kqmDnRbC+D4RFnR1ivyqN9M7Fo22a
         5ulrOYXB7x4Xf0npMQL73O8n6TUd94a81DRRj+OQJ9Dl8jOtazjuVCG9y7+JZbCFeKtA
         mE0A==
X-Forwarded-Encrypted: i=1; AKwUvBye0oQhwE1fdCdehu2rsdpwTnE4V8RHA7lyq+Z5iC9/MYdask5mOCrZFbvRvG/O1ehyJjgqkPYImbIw22M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWNycndj4Pj+AgPnmrokO7n69+Df7kWYkVMzsM+bR145aBkgv7
	Encf5Zb02i81BV+kJE7KV1deUxTkI1tv+SQcT0casX/7Yq4V6XPYozCa
X-Gm-Gg: AYBFou0UYkFJT3TKf2S7U70bg5rHdEAX/SWBEElwLFoVIVOr3JtBnVhANLJx4ZrxRnO
	4WQTKq5bPkyFH5iGc+WAmMrne0lrrYaM22hJXIz4XXAv23LjKq64mRJ3WTF9Ohz5EBcVXIvCJB/
	GO9X/wi8EksYT2CjpDSCn5LFoOYhVRBYjNKkAXE5NaJuXgQ1IKm7y56V3DQ1n1I5kqpMmSDbbad
	7teOE+ZslKxFxprR5FJH0GANJzHgm3bmtToh7fMCRP7tRGly5easqrPq+0Tg48SVhou7qEVl6BM
	3YHm6czrShaEe5Yx8RVY7qjZx3f45/9MVfM2iyeFoQhcV6nQUppi5lboh1TbMQzfnJpnzTBOPjK
	mO/WBTDekZ/3ujBC8ZTOtBnSY60XN9utx1ctdxDEdZns4oApCI4zPKiNKGG4SfNEYOPsaZhWVYr
	GtEnNIYoCj0y/cR4mmEflHG38YqdW3aJkz1Y0IZxgE7mRRip8eVCurixa+9MBzkU2L6FWXhrojU
	6bh2TURYWtTkLquTb0=
X-Received: by 2002:a17:90b:1a87:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3aceec26e88mr5914108a91.25.1792400481075;
        Mon, 19 Oct 2026 02:01:21 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm7618163a91.1.2026.10.19.02.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:00:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:00:13 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261019090013.GA29798@rigel>
References: <20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com>
 <20261016-gpiolib-chip-removal-v2-6-aambrozewicz@nvidia.com>
 <20261016134003.GA155960@rigel>
 <atXXi_EA6iROhK0C@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXXi_EA6iROhK0C@ashevche-desk.local>

On Mon, Oct 19, 2026 at 11:40:43AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 09:40:03PM +0800, Kent Gibson wrote:
> > On Fri, Oct 16, 2026 at 12:23:38PM +0300, Adrian Ambrozewicz wrote:
> 
> ...
> 
> > > +	/* Called with gdev->chip already NULL, so gpiod_to_irq() can't be used. */
> > > +	if (gc->to_irq)
> > > +		irq = gc->to_irq(gc, gpiod_hwgpio(desc));
> > > +	else
> > > +		irq = 0;
> > > +	if (irq <= 0)
> > > +		return;
> > 
> > Perhaps I'm channelling Andy here, but how about:
> 
> It was in the previous version and I suggested to move it to the above. Seems
> like we have an opposite comments. Can you provide a rationale behind your choice?
> 

Ha, so it was, though your suggestion was not quite the above - it
didn't allow for gc->to_irq() returning 0 and it set the irq to a
negative error code.

> > 	if (!gc->to_irq)
> >         return;
> > 	irq = gc->to_irq(gc, gpiod_hwgpio(desc));
> > 	if (irq <= 0)
> > 		return;
> 

This way is clearer given gc->to_irq() can return 0 - the <= condition
there is purely because of its possible return values.
Setting irq to either 0 or an negative error code, rather than just returning
on the spot, are both more confusing and pointless.

This is my preferred form, and I obviously expected that you would prefer the
shorter form as well, but apparently not.

Cheers,
Kent.

