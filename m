Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39A4570F8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069400; cv=none; b=cCuQvsxPzw/fsEpeMCfp6nl1c9tKtURQoU/EQdE1Nh5pnDE+D4If/nBDxELCT02oEYSkF9AffLaw45g7UpT/S3lhxynPl+dOW2dsGiARtOP0vbG7PJr9MKxMz9B+v2XtwbDnbjAp95ywgiHrBNTXELPhJN4lefihC218WYg/51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069400; c=relaxed/simple;
	bh=5qV6DDgvX5x6DbdcEO4YGwcVCaxOUXL8w7EqJvq6P9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7Ub1rcbwF838uYaDHBcqUQm0xTY46swaWIj2bHacx3ZqSOq54gNO99Tf7/2rm7cpn2Na+RyfiFfxBTnL81jMqnhUdUNcMh+7WCWdTMHfSR+ONKXmsL6dniSNrPnB9yKILdDMLP7eFuwS0ZOGRWTVCdmWauGWLjQoD9fhoj3tMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CUXiCFE3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CUXiCFE3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so21655115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790069397; x=1790674197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AEYqwYTs3Q+0Tixb6WMwSvunwn+VCtEpmD/qEhNmIGc=;
        b=CUXiCFE3O14/8Fkf68/a8I6n9Kaq1g3Y9lB92D8l3SrFQWiix7UAo1znM2NFvKu0fm
         9jYYfeAN435QR4oTSGbWVq6LQ1vAAKQjdlNs1Wy/urvcoewfCLvvvy3Plm8f/S+R6IJ6
         DwCuGbqY84Azm+1FdCE/1clkKHa2+Hr0gmod21zntHZvTHG4OflaX3prXNkbRqv4Ixhy
         DCPYusE1lRzdeCGBBfJY/9C1fVYLlZQACgc1UXVnjzDAZMObsAqyt0KBxdj6pzQDaWiY
         dM1gBGDZbMJ9oy+3p88Hm7+th3MaMAWTrWNdko8yfjtVV6YyZYIoJ9rHzctFLbcrl6Uu
         Jclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069397; x=1790674197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEYqwYTs3Q+0Tixb6WMwSvunwn+VCtEpmD/qEhNmIGc=;
        b=XqXqgEJsXHfqXqn4stbn+oBxO/ZbYIG4jOF8n5xV39E9E0B55q07tNkm6S43K55hgx
         L06wkLR4AUMx5YGCy6l5863ECm7Q+MQKFHysgXjK/xbmaRx/aPTTXC0iQef0OxOuEwRd
         rmW27cMuFOiDXiGhwQGN+7Lqs6r2WiDZdybSh0XCKfvf5A2iE4o/XqIsLdC1Dk/D1bc/
         QJAduSSICNGmGvDJrdSv/YRgaBGvXEZwYkdpRhsGQkXTXU16xuXXy3vrx9FgEqpFvWZG
         qZtibJ0o7MUUoskFz20z3cnkQtI+LZVxrv23sowy0zt2sqFWAuV1RwNeNUxJo103rUfd
         LVBg==
X-Gm-Message-State: AFuF++nN6i443M6d2S3hk/y30zJrTeFYiLt1EWStrmmef7E+H3pfpyra
	rV1bkojaxyaIYg9QyvCSTJCEXbsdKvnxA7JbyjzN1KFgFx9I3pP/oFvuUDHZQPWQ0Mc=
X-Gm-Gg: AYBFou1H0FwjcUrs0oMun56FpI2CtaL/9T/RH3ou97e3XwLPHRB5QgADoamfxD5bGVV
	b591FeMG7quPv6w16FfpLWAOb8TpWUHvh55IsdOBsT67PVoQNrMO7uYBE5ClBHdMHZeegXMHZ+i
	96uUwDExU51EXQyvn2OKs+fqjUWmbOPbHAvbI3367hDfI9ANoJNnnajUNy6qyPMauC2EKLDcbXU
	Gn1xgjexYAscdNkQ+8s6G8Zq3kcmxcT6HxnuQEyBWwF1ZGweClfnjlc2ckW5M9s2DuuiczO4I+I
	Bbd5+cb7DAmQhy5ky7Vw1nBbxU27cIcZgmjYhbOatz3oMMdmToImTX7Ln2vyRwjC/2WQjRndH+J
	Rm7XmDRZKA98FMfRBOrM4f3NdBNb1N8Hx2hZRWqCD3CmTiR+VvYA9I+PnQZi9dQ6GcRYWH4EKrj
	+vU4o+IrqHA1R/rQ0vE1PiswtZjneVQmFGV74IRn/QP1l+yUg4XW3apZEw5cFKnNsCcrqE4LJzY
	APr+PfOFXA=
X-Received: by 2002:a05:600c:138d:b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49fdd2e4a91mr1532585e9.32.1790069396663;
        Tue, 22 Sep 2026 02:29:56 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad6306esm39622985e9.15.2026.09.22.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:29:56 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:29:54 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <arJKkvOTNs2DD9ba@pathway.suse.cz>
References: <20260914143412.1sMcp89V@linutronix.de>
 <20260922070834.2kmMtN82@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922070834.2kmMtN82@linutronix.de>

On Tue 2026-09-22 09:08:34, Sebastian Andrzej Siewior wrote:
> On 2026-09-14 16:34:12 [+0200], To linux-kernel@vger.kernel.org wrote:
> > In commit b845b517b5e37 ("printk: robustify printk") initially got its
> > delayed wake up which is today implemented via the irq_work. Back then
> > it was a variable which was assigned to 1 if a pending wake up was
> > waiting. This variable was checked on each timer tick. Therefore it
> > makes sense to assign a per-CPU variable with this task to avoid cache
> > line bouncing when each CPU reads the variable on each timer tick
> > simultaneously.
> 
> Sashiko complains here, https://sashiko.dev/#/patchset/20260914143412.1sMcp89V%40linutronix.de
> 
> | Does replacing the per-CPU irq_work items with global items introduce a
> | system-wide starvation vulnerability on PREEMPT_RT?
> | On PREEMPT_RT, IRQ_WORK_LAZY items are processed by a per-CPU irq_work thread
> | running at a low SCHED_FIFO priority.
> | If one CPU queues pending_wakeup_work or pending_output_work, the item is
> | added to its local lazy_list and marked as pending. If that CPU runs a
> | higher priority RT task for an extended period, the irq_work thread is starved.
> | Since the irq_work structs are now global, their IRQ_WORK_PENDING flag remains
> | set during this time. Any subsequent calls to irq_work_queue() on other CPUs
> | will fail to queue the work and drop the wakeup requests.
> | Could an RT workload on a single CPU starve the global printk/klogd mechanisms
> | for the entire system, degrading the isolation provided by the previous per-CPU
> | design?
> 
> while this is true, it is not limited to printk but any workload would
> starve in such a scenario. Also, for the per-CPU variant to make a
> difference, one would need to have a printk output on another CPU, which
> is not busy with long running RT tasks.
> Long term this is probably the "legacy" system as console drivers should
> transform into nbcon interface. Here this irq-work would be reduced the
> userland wake up while the printing would happen via the nbcon thread
> which also has a single irq_work queue.
> 
> I don't see a problem with this.

I agree with your explanation. I do not see this as a problem either.

Best Regards,
Petr
