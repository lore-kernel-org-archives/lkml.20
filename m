Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F943457E41
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590091; cv=none; b=aeQe9h7C2QiESd+Fg5Q7ofTaDrEgxXiXMXFSgTQM+1R2u9qvXnzWK0DHWtpTAw9Hu14eHEd0WkpSSBJi4zV68VuG/tmcyXfG+diiCj7JjHu0m+C4x2gTIGwLvFu/Vj2ljj1AxQ+thvgJdXIuDhYVUXimHlqL3sS6ksa9Dk7NjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590091; c=relaxed/simple;
	bh=E/wrYUghy03FxkwZBA0/+8KmHwIlFEOYkEmxbXS8HXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3EUB4w3/HEkrQk2Z/3dDGrHdqzLY/HDaEZwNU6J1VVpZ+57+JB2XT4s9UBjd4vEAk8pkDwRj1Q2/OhU4pBFk6fkvK70iS74F7iI/XyWSnPIyjp3+v623F+ihQnILcCVrle9LhjqSxjDdagYeYR0YWWPZvC+BiC2wXxidBGxQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+OIpx95; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+OIpx95"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso112785f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789590064; x=1790194864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pqmaIKFGZgCXODCn2YSZW5pp6eoOvL92gZZ6Ia4ZFk=;
        b=L+OIpx95iAXfgxHTvHXHwCZeceHKMEPsQ8JGwIP6scjjGJ3XTEcwywGrw9CnYD4B0/
         tyXT7uKPeTMbsx3OQEhfKTkfOBfJliU8Q+rVYNJ96Gzec+8jthYfEt97ZS8f6fzMquDt
         Ct6Qjd2pNzdUJE7pMc1PM+BScGrH3ebL4DS58L1Vqi02B8YbjeN8Y5TeIkjvExSUb5aQ
         WRXj0t6t4k1VYeb9Sw5P/H4Rg72k+Wz9BFC32NsjaP26eegcYjyXNnbPjOcSk6lwtTyJ
         hKSYpXaUfET69y+lEckk6Q9J9W4AEqZVRppFU8FV4U8lqkFKupJTbnfzmUbkSmPpE4XD
         7K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789590064; x=1790194864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pqmaIKFGZgCXODCn2YSZW5pp6eoOvL92gZZ6Ia4ZFk=;
        b=t4t6faODBcsRh9rK4IRSZoVM12cDa1vG55rl+omWRDmKy2rd2Jnp4qlU3ckRrywMbs
         fEGeJmSG38jTTYX3lrkv+6L6IBbqLpfnE8IwGFxzA/OKQzIoixUvZKnbXXsjGHEQhU4F
         8hdeJSTHoPX9yS2D77M/T5b7ZtUF5ufiY08yFS7e+vakXAKnG3koQd49buBjOE1ycQE0
         m9ehD3AVR+O0WwZ61HJBoJyd+mG1mC9xp0MFgfAjva+noPPkGBNCdHZxdp4zqCRXKEvy
         O5aBf0yJL/59nQ57SydBn+Pa4ZKo7bRjptFtvc4KpfTBVtCTQXNZI5GoFTHpITFtnkku
         MA2Q==
X-Gm-Message-State: AFuF++nWxSmP+KCUThViFMDn+VByhGnKv92b2LI0hH+KPFDqYO2/M8ek
	1qJUQo7gWYjSFpyvjBilQ89tqLRKfWI7K6u0IiqvoxqOEpr5aDbJ5kgD
X-Gm-Gg: AYBFou0ZAqa7Zn4oSTgyAd9U/8ybQftoeCdx5sM8LoepNO1mEgfTB8K+c2Dlt8toFBO
	DDU6QPSR7UvYr84jOdDn6t9awtMxQ6A6uMiBBxjyhs9LbPU18FqVHVwje8N4CatEWFjh8CFVq7V
	Ke6gD8htlVDQkfyieU+y74R+Ae7fgAyRbyDvkBfbiyDFiZ451iSOhsL//0GLsl0N+ygtrOm9vyL
	Mt7WICTRr4bsBoEWiIhGt2aqRvoZMX7CwE2VDMI+EHmQEtuX1wmyUL5AA2Q5dRmqwhLcsuH+s8B
	O8Upow9AA3mLglqXxtM56Oik2mAXetIxg4TkT4sBQqSTSW4EY4EbCiKfcjUOaoyZktQ77KE4El0
	8aq+Cdn2JfFyhSTEEouVPJskTieMXRC1z0fIZfyKRPZkNX+QWFOTYIGj0N64hYmNgvEqAbHUOqt
	pgKG+i2f2ci10GzWoZILhxhoRspWQcdAOh/nUI3oB3W0Nw99OTuXa4QqKScu7/beo68rZeaXdol
	B1/Zv+0GOTsOgk=
X-Received: by 2002:a05:6000:29da:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-4870d26c12amr7307913f8f.28.1789590064367;
        Wed, 16 Sep 2026 13:21:04 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.82.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f98csm8543801f8f.11.2026.09.16.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:21:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:21:01 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
Message-ID: <aqr6LdDMHq6jti5B@andreayoga.localdomain>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.837831386@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.837831386@kernel.org>

> @@ -1505,7 +1505,7 @@ void run_posix_cpu_timers(void)
>  	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
>  	 * miss timer->it.cpu.firing != 0.
>  	 */
> -	if (tsk->exit_state)
> +	if (tsk->flags & PF_EXITING)
>  		return;

An inline comment in handle_posix_cpu_timers() seems to be the only remaining
reference to the exit_state check in the tree.  The same comment is still in
place at the end of the series, so nothing later seems to update it.  Should
that comment be updated to refer to the PF_EXITING check instead?

  Andrea
