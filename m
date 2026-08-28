Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8A3D093C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905332; cv=none; b=S9V7fbXKakPU90wEkIG59wx/63CM5mn54KWX5MY9TBRtXhxEYc9xBNaBE5z4BSrCqbMM6yRDq8BPfWEzAlHr6qmLL9xGCW+nVP3KN3bSTbs9+xjDGi0Cw+GwVEfK+1d/WvpHf6+PA1QKR3yYw8NOmmao1SOrkPexmf371cYaQ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905332; c=relaxed/simple;
	bh=Bhd6PWz2Vt1ZYery0GEBcL3g+jHxzjKzB3sSZ+ciYgo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmKwz8vUkB5nXqb3laOcuBxqP6u+PUKAFReewFsQCvd18QH4NWSrT4mILxRkf2HA+2urRifp/Wg6E3bGeUqvBDAYqWxc/xdM68wcf+Hs/rEpq/SOQ5CF2BSe0CmXc+dyZwisldjV+Sb5SZFkdrIvwSl+cfU0/gCU+iHrMXsUZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXlVNkVp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXlVNkVp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso7781585e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905327; x=1788510127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvnKZ4BTpkKVi2kXq5GyjUt0MhR6jRMADXkDT6oeQaQ=;
        b=sXlVNkVpEbhCjH0R3q8L+lfld6uxhHfjfFchjYYG5+7hGTdbQZZhqTZbX+H5tr5JLI
         fYrOA1Ev2atGP4duEFVFeKeAsGZxsMN9oYew5qrxz3Tg0JVj7lQD+5/EZw52EvyHnX2U
         Vvj5xZDZVdkVpWYFboubQ0A1mzwONKH1Exn2bC+ryy225kFT0GrZEdBAZB8tn9Djyq/v
         dD/cIniS7U9/WYEQB62zJ0eyo/gJsTK+x1KWnXOO+kXg99vAfByP8byhl4a0z49vVkUz
         ggrTJd2Sq3hrO33O8oY1jzmPrvGxIyIknmWJjKL6NyQ4wVueZwptxb36uT1QTp7isnlA
         7LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905327; x=1788510127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvnKZ4BTpkKVi2kXq5GyjUt0MhR6jRMADXkDT6oeQaQ=;
        b=R2jznnn9VLdKg6cm0TEgncG+/5MNEFxwiUDxBkjvBvplY0yGDjIOqUZf56N55bNTbO
         LLsMadOZ+nkBZ/Axj7G9/nvXTp/hrWviZa4DshRrEs+jtZrQ2VfQs4gio9XjiYzBRnCC
         WP2RrIan+8MV1PTL6a4cyOiUvLfdk4EyZUPhSehqM3xhYaloMOkyIuk/FTbaZOR9zYRb
         ga6FATsLNn8xyzNx2M11Y1xL0G1ZDsA2J2tDEsAYvrGyXOIaEp+rasixtoQAD9i/s7eI
         MDSAUdDQGUuln6wU6HJ1eaw+2zkNmk2Zh49j2wv+rU0ecgR74TQrSykCCB1kCwOafEQC
         JDrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoweiZSITV8YkP/oNNXMNY1FDilhYmbVL8tp4TRiuF4xbshKviIdkK/VhKHWzC7Ps5Q0LtrcJYPfp9EcVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++msUKL/xT8keh0uwMKx2QtHpG6Jx0mDWUEeTdaCwYpA47buyS4A
	MetalEz1VZFHjmYHnUQ4r0GECDFhFs4Z0Wqbk3lxeINXYFrutT99ICba
X-Gm-Gg: AR+sD11aiLcClvy9ZMFYwoHe3ofnfp2UUSPrXk1ISMPEGAf5PL9CPdL6SAzPxP/GBPp
	nrCBnra4oX8hQ5pW8vOqx2BQaHAGvuJpliilh96kompEUdig8Wc6sVzQh09DLW2Rvrt2KaQDMUz
	tj68QH+efs4FvO944xaT/zCN22q3OXbUjCoiezJbmWkdkRCTM9KAB2X/y6gkVljlEiTLNQtyW64
	9gdh4BAUIkJHviNo4ahvJK2pAwsSsXs+XmxDb6J8350h+KOhLJ/dMtesrixYZPyDeCC46ZMtd23
	CtwPYyZg0gYOs2nqkze6n09IwTXlAj9r3Zi7EUFgQzgkkJtrzkaNAcoVag71V8QeeE/Wnxwq207
	3X4gWG+Rbl9nmXDjvqFHi3B9seXocXfNvr0a/TFovba3VxUKG+b04r8LCKrZCsJ0NbAvJjtbZzr
	mHGtzRfqeFJJExy52laD1l3Hq/Vi0aa20unxaOvo7gKwFjGLPiIDEJgseyIsEeA0xnVJFNTl+kI
	eQS0yUrTJB26Jym/IZaubJvEg==
X-Received: by 2002:a05:600c:a48:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49b91c3b7b6mr56408725e9.9.1787905327423;
        Fri, 28 Aug 2026 01:22:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm46252715e9.12.2026.08.28.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:22:07 -0700 (PDT)
Date: Fri, 28 Aug 2026 09:22:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <20260828092205.2e65e299@pumpkin>
In-Reply-To: <apCtEUnPzdCQVpIs@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
	<178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
	<20260824104704.GA4121339@noisy.programming.kicks-ass.net>
	<20260824105523.GA4121620@noisy.programming.kicks-ass.net>
	<aozw_7Txxaq2qE7c@tardis.local>
	<877bldhkmq.ffs@fw13>
	<ao4lO7U7L-7Zice1@tardis.local>
	<87v78wezid.ffs@fw13>
	<875x0vfgtl.ffs@fw13>
	<apCtEUnPzdCQVpIs@tardis.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 14:33:05 -0700
Boqun Feng <boqun@kernel.org> wrote:

....
> Yes, if we go to the level to unify all irq disabling with counter
> tracking then I think using arch_local_irq_disable() is possible and
> makes a lot of senses.

Where are you thinking of keeping the counter?
On non-x86 accessing it may be expensive.
The best bet is probably in 'current'.

Doesn't that make this valid?
	int c = current->irq_disable_count;
	if (c) {
		current->irq_disable_count = c + 1;
		return c;
	}
	disable_irq(); // asm("cli")
	interrupt_disable_barrier(); // ISTR arm needs this
	current->irq_disable_count = 1;
	return 0;
}

The task can be preempted in the middle - but that doesn't matter.

If spin_lock_irqsave() returns current->irq_disable_count then
any existing code that does lock chaining works unaltered.

David

> 
> Regards,
> Boqun
> 
> > Thanks,
> > 
> >         tglx
> >   
> 

