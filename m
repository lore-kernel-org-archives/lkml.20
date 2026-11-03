Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749384;
	b=SY5+7aTiPUQRvro4ddup7wyHOKzJugTevpVEgVArHw3Tnz5h8VJSiAbR6x7IMnPugm+X
	 hct/UQKQKwTZn2Aa0buTMRvtJXd1vG4g3OL4K0n6KJM5sxxI8g0gTbMnlHxMrPg37wEJY
	 0xNzRtWZ+xF7NF4iL/w9foucIdTBTkV0NpgNnqNKi3jyaycWvuLcxd9KYPFPu6+XraMXm
	 1AD85mnkUMKqd2ZWY+WWfZw0MyuQBE3bIM5rLf3ak2VIhAol4idpn0z142DF5yqVjKMlc
	 1zqHkbN1tBPZXkIVIunMNi5SEChV354fTepEX7//jQGp6XgJMjd0yanIK0pme1POSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
	b=hZwwqRhOJL2Rfs7Yo35PCzTr2bHNggqy0+yMHxQf9+8YQsqGE8zaKtle7XIxNEED7nX4
	 iQujfgD4ah9+KyV6aF1GNZJBir6MUZXY1tEMSrd7mhOhCaRGYBQM3eLHOSwDsNzadeL2g
	 QTYWeu9nvgzV0KJmWEz+5y23LMvBrPeqq6rblYhn/iBH0XdXXiFfXzZL5WlpFFmnTsKCV
	 +sy/RdmM0QqDKDPUuDRynGu/EcH6fwR7Xrv4vo7VxAnZ/g6aPc7mAv+eYAE/55Nm2KV49
	 u9iHCPPnDTIQePD+qVA1zqSTZKHsEl7ZLY/bMbAiJQ6MWvZlHgCfTdbh/S5sGuiJ/8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xnm0mtJq;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBB8606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBB8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xnm0mtJq
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so47146f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749382; x=1794354182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
        b=xnm0mtJqbkB7h9G/6sIwfu/wmAnSeVK4enwhz/WVKNoVuQp3IXNXsfreEKy1/hnXAl
         oY3vXQvLDc5pOa7HK2xN5Htaruz26zZILXsP8MB67nIkqEHNYoueUUfbWeSoILXPYpSj
         WgIKEe29QnHb0cdxpuhMfmYQpIP0TnHfiiryfOhpApkV4tiKQv3pDmmReJgd6Vj8VaDh
         f7z3oycGwnUI/D/c9eZqZYceICv97qEPY0NnVFcAjs1Y9sqDmR3sStammSKeg/xbmUMJ
         Gcjxv8ZfDiSasLpwfEFptU3qeFg31AGuIflLx6HnMyCf3VioZ4/dbCMizx3NTo5YOVJL
         bvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749382; x=1794354182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
        b=KS+B6dh+Od5R18FZs2n/JQITwnWmOx95HK79p8T6s+WzJws5kBW9JZbZBptEQ9YUUu
         ZaW7hGf3ENwqkwPFf4TNc4us2olO0tWuVR8mg6Bui0e+iDbgNNTT450L+KLCUBDRrwtb
         G/0mgmYEb5z7BbDDjNqWqA4NSoZIh2wuD6eg/+LK3fKS291kAwlCdfaxsDjUv0yvBnrd
         af5rOOCQuNUoCEECb0UhpWDAvCJAHgtM1P2UTMS/xOVi6zuLKxZ0ppN7tK+pcxx20ca1
         rlCCFPueTYCgvkvMH2whsez7N+Flsts56DlDF9hxMHNDY/MRQREt5VLtVSy2SSzIuVDU
         Z8Eg==
X-Forwarded-Encrypted: i=1; AKwUvBx7Bh9VijYzyjaUEUC/EvCw84+10YCkQTmELEP9wAiGeLGW8+ZT1o8RSzvUZNOTUyG939xXa16vWJzL2Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iTFhfVRY/6cU256NAX6GN5dLYF23xhACqRo7jiug7r/kuuLHw
	ti5FjiG+pbsFWbTI06Q4v9ELnB4uDIX8ZPQZHQmRjPZtZ5UMvkYRXw9/
X-Gm-Gg: AYBFou1HROx4TXosRSDSpRbeOhJh+3Mb74/6dUC5pkKVr3UAd9B1Wf+AhxXixhlJr4T
	5qj3EOqjd5n2H99u9LhKco+99sK+iUfm49Bsr8RJOPUr2eUJEPCMSnsHoSaQQU4kGo3NT62+0rt
	4lNPIgEiXCm0wMxX0j68OqBwsdrZr0HTW3FXC2vcc3fGFPlCvahXThwGME0Ab1tmhee6ZKuZQWo
	kSbiQDpwre9go7f5IalPRG07mSFAu2N/NCuT/WwXu7+mpUybmkK9wXumDniszJlSrDAmryu/ViH
	q0KxF26FyhXoRKYnUIW/uLpYZzPnC4eYCiwSDWwj2PjtuEpswdFHiE/prAbLwV0YBony1KvojeX
	NZPcJENw4La7UdH+C7qfNBHPcsjB/kw75LX5vBU1VhWSZjY3LZMmpB9BGVjHSR+Xd0TZkFY6m0A
	TZZz2HqBnXqoQrYYzYjtKpwhTRfMUgs5eATZw4t/ldlwydaZp/ftv2xqbn99LVeOQ/znd/eRHwr
	2NbQPBSlxRBbWMOObPriRU8Ruwo+TRBJf1TXtGodtecXSBLUb3ZWmrunjLvxcWV1dLn5ytjRxf9
	OlnvOrxntFUPMdLo37wp+ENAPDAp3wuy8ICOidQKyF4dmdhkb1BcjCteJkhfCFR+1XWSqZ7TNMx
	M+Q==
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr25016512f8f.44.1793749381829;
        Tue, 03 Nov 2026 15:43:01 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm513060f8f.46.2026.11.03.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:43:01 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Wed,  4 Nov 2026 00:42:41 +0100
Message-ID: <20261103234246.2546810-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ad753ec5-52ee-4fcf-8275-77095f42e8c9@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop> <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop> <20261103190507.1913628-1-parri.andrea@gmail.com> <ad753ec5-52ee-4fcf-8275-77095f42e8c9@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 12:44:07PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 03, 2026 at 08:05:06PM +0100, Andrea Parri wrote:

[...]

> > >     hazptr_torture_cleanup() stops the kthreads in random order, which
> >
> > The order is fixed: do_pending, preempt, the writer, then the readers.
>
> That was my first thought, but then I remembered that torture_init_begin()
> sets fullstop to FULLSTOP_DONTSTOP, which causes torture_must_stop()
> to return true, thus stopping all the hazptrtorture kthread at about
> the same time in some random order.
>
> By the time hazptr_torture_cleanup() gets around to invoking
> torture_stop_kthread() for the various kthreads, the game is up.

torture_must_stop() does become true for all the kthreads at once,
when torture_cleanup_begin() sets FULLSTOP_RMMOD, but each, once out of
its loop, waits in torture_kthread_stopping() until
hazptr_torture_cleanup() calls kthread_stop() on it, in the order above.

[...]

> I instead dropped the torture_stop_kthread() reordering from the most
> recent version of this patch shown below.  (Which still contains the
> above typos, but could you please check it otherwise?)

With the pass after torture_kthread_stopping(), each reader reaches that
pass only after kthread_stop() is called on it.  Cleanup now waits for
the writer before making those calls:

	/* hazptr_torture_cleanup(): */
	torture_stop_kthread(hazptr_torture_writer, ...)  /* waits */
	torture_stop_kthread(hazptr_torture_reader, ...)  /* releases */

So a writer waiting in ->sync() on a deferred hazard pointer left after
do_pending's last pass keeps kthread_stop() on it from returning, as in
the hang this patch fixes, and the readers are never stopped.

With ba9a3e4d3b237 and patches 2-4 on top (d0a4ec9443ee), both
3-minute PREEMPT runs with kthread_do_pending_ms=10000 hang this way:
after "Stopping hazptr_torture_writer task", the writer stays in
->sync(), no reader is stopped, and 3823 and 4072 deferred hazard
pointers are never released (reldefer - relundefer).

Keeping the reordering, or doing the pass right after the reader's
loop, before torture_kthread_stopping(), avoids this.  Your previous
version, which keeps the reordering, passed those runs, as did the
variant from my earlier reply, which does both.

> > Also, "hazptrtorture: Nest a second hazard pointer in readers" conflicts
> > with moving hazptr_torture_do_one_pending() up, as both add a function
> > after hazptr_torture_defer(); keeping both resolves it.
>
> I believe that I have resolved that correctly, but could you please
> check v7.4-rc1..d0a4ec9443ee in my -rcu tree?

The resolution looks right to me: it keeps both functions, and the
patch adds and removes the same lines as in v1.

Thanks,
  Andrea
