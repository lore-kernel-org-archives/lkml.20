Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673770;
	b=zWIF4WFex4VlfuBxlxWwYVmdQ7qg/M/wOTSxWdU0t5x5kgFQt3+LkEI5UPBFaLnTNZ1C
	 vF3TSAmf/eNjuCjJt+s6GdHOlkq2RSsvtA/tYTQQYulKcnDdfJCvTE348JvtJBRHIYZHm
	 RFBjLHuEg3+gJ8z/9xCJwriVeFLtsLX0YMlZlNIP6Lv2b0xEckR6zLCUkEj4QjQLtOiZc
	 RJLp+B83u+f1hKRbn+nz/eClnx7yH+s2aGuHDH+6yr0KwmAPAJ2r8/ZI29Vv7r5D6MicD
	 aWH4Ue99m/65uQKff5S2nioi7gFS+jNGWW1xYh0a6yf+pxTelY1X5MLlerunOmqdoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BxAszWFWayro4K+gUV/BNDo0hBYhXBl8nloyFNvLDqE=;
	b=hugZFhV/zrS2sucaKYNGXPDh86Qt7VJ1SbqPV26SfXr7AbJqhUdrZjGIz0ueVRoPt6nr
	 GtUhQh44vrX3LC1N7QCseq+yz6zsLJnHJbK5wPrsjHvNHt7m9l+/2AghCvdMok2pXMeu4
	 pscHE70/DBnTmYAtGJ6IsOpDJedtAy/LXRMCZLH0XSWeIQi1Rfh30cCyjoZfFR22wncb+
	 xXkqzTxPpIpvHt+55DVdU2qBms4t6Gc3bFEimiTYFFw7FbZjlKSTQqYW8XGKMgWZCAYnx
	 lCUz8D9TGRxf8hB0bxTGa6MlvMHP8pLeZplrTtQ976am4wwA0O9Mvd0Dh8YPFWooVvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FxT+8apG;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0635606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0635606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FxT+8apG
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1250328f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673768; x=1793278568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxAszWFWayro4K+gUV/BNDo0hBYhXBl8nloyFNvLDqE=;
        b=FxT+8apG6u9Udu2Y7ewgHrSdQIF64jXXdpOEW+BDNOYIafG7QJ4ahFHFGMIYQ0PIHl
         Vkpu1qnPqEcA2nEfzL7zXYJtJT9xryWiG3PuvABh4F6Ig0gU1FiVX3dGG1B2SNbzbAIk
         Zdb1Juvv1kF73hCwsC61b0tDG52SnP6Eh2hnbhxWZ4cLMtt2hHuFeLyTMpmjvyjyNF1p
         TjafKEhevYYvfRYF5oVSEWmIdDjyvbldjLasm7P1Pz0XWyiOdzw2ofhD2eS0vaBqpcyb
         /lpkbwTmssoyB/PwMTvwIGx1XlKv9bzN0GrWZJdr/2ys0ph834wXTGK+4rKYvYm+vOK1
         mENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673768; x=1793278568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxAszWFWayro4K+gUV/BNDo0hBYhXBl8nloyFNvLDqE=;
        b=aIf5b4OxRWcUatz1nmxyem/rZafVtoEmhv1J+g8zyCn/K4XbH+U4HqBUCw4gtp8fph
         oeRWvvn8Osar3av+eI+NJ8xSD8e71uVGQ8WupZMcp18hleSsaz1HyLekoqee7xPnFWO+
         N445g+2/keB1ErNQqopz7YzwGFw+AXpVZggF5BKNIoiKDStbm/cNaYRMTXYSOBwVFRtr
         yJDxw7Sr5JKJoP8gqGFw0V4wFMvRMgtdbdvlW5C2dwk5wwVEbInG1Cu8tVC6391F7Ver
         vlrKTji4srD8DGWXl5oXAwDkYTpUf/MmwVMBbo/3H0IxqUUMZtsLOda1VU1Vt2UIS+Yj
         WwVA==
X-Forwarded-Encrypted: i=1; AKwUvBx3sFy4e+IwOJ+8ydCk4fET44mXyDaEHgaUCMtxKPVUBZklWEtamvbr7+X5PF+O0hNQSWbkIKpRMS60HX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV0CJ0spt+jqNQ3z4CIXpym4EFspuZyLPLFoYY9SMW8O1F7P8f
	hyFi1utFa37AGDx+Mcy2A7qM8tI+zYXnpZumufKvrbhw77xO11M7pcuV
X-Gm-Gg: AYBFou2LxGsrzK4rAkCm7YxGZI65ntUXq4VTvM04ycgNtf2QxZ6xSzTQed/BWoQJmAs
	vzFO8VUeFOkJoObE91xufh95eTWzaOaHheF97a8M49NomeIDoPwtrQmgPNCxwsSX0N2y6pDiyJt
	pwGD3NL3GTKaGzkL0PN+SjUrTJOAcUix1piKfdWUFWKnbR8iOHJYVpWoH82j1XorAhQ+ggEoptJ
	AwxbNuL3CGZYBeKB7LWn2jX/siPZyM0RWX1mi4ted256WD4NHh46KXcKelwkamfhkDa8S8dAHf+
	GD8R05zq46wzPNEE5Pey7ya2Wb+OQmtenjtiT2tiTTe/egqv2wf4zMj73088n+MlqYuUIc8bAAW
	uKMx/ZvT7/xV7sq9Y0Ii5p630rOS6sf3DA95vRchEYA9q6uu3pRBv7jcHzHA2PQLqjaH//5JHX6
	ihdakH4kzWuxLE7GLtguINYhdG6f2JGKoRU67c/aNY2SYxULijba99TXqKcKKcH8Xzau0bWRxi9
	BHVb6mMX8oZtuTKjeWPREytfbvd8ESB1dzWuwZsugmV1W8LK3HsEJxiUOEIh+x/pO8lFliQmo2A
	dJSHE6K9sxbvjIzI6A4lLfvp
X-Received: by 2002:a05:6000:200c:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e264d53efmr11230735f8f.22.1792673767956;
        Thu, 22 Oct 2026 05:56:07 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2a034fc2sm8187818f8f.5.2026.10.22.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:56:05 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Thu, 22 Oct 2026 14:55:55 +0200
Message-ID: <20261022125556.3559773-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <45a6159e-1bcd-45d4-af25-baddf729ac54@paulmck-laptop>
References: <20261019162005.12888-1-parri.andrea@gmail.com> <3e7abe29-df1f-4cb6-884f-dd0a70c5311f@paulmck-laptop> <20261021090652.20333-1-parri.andrea@gmail.com> <45a6159e-1bcd-45d4-af25-baddf729ac54@paulmck-laptop>
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

On Wed, Oct 21, 2026 at 09:50:11AM -0700, Paul E. McKenney wrote:
> On Wed, Oct 21, 2026 at 11:06:51AM +0200, Andrea Parri wrote:

[...]

> >   - If kthread_stop() has already happened, i.e., it comes between
> >     the kthread_should_stop() check and set_current_state(), the
> >     wakeup is lost, but KTHREAD_SHOULD_STOP stays set: do_pending
> >     sleeps for one full period and the loop then exits.  That is
> >     kthread_do_pending_ms plus up to 1ms of fuzz, so 3-4ms by
> >     default.
>
> Very good.  Except that if someone sets a very long sleep time, that
> could result in excessive delay for kthread exit, right?  Or am I missing
> a turn in there somewhere?

You are not missing anything: in that case, do_pending sleeps for one
full kthread_do_pending_ms period, however long it is.

> > For comparison, without this patch do_pending leaves its loop at
> > torture_must_stop() and waits in torture_kthread_stopping(), which
> > sleeps in TASK_UNINTERRUPTIBLE for HZ/20 at a time, so it has the
> > same lost-wakeup window with a 50ms bound instead.
>
> But that is a fixed wait, without the possibility of a user extending
> it, correct?

Correct, torture_kthread_stopping() always sleeps for HZ/20 at a time.

[...]

> Should we stop the writer before stopping the readers?  Or would that
> open up some other issue?

hazptr_torture_cleanup() already stops the writer before the readers,
and that order is what lets the writer wait on hazard pointers that
readers defer while it is being stopped.  If you mean the other way
around, stopping the readers first, I believe that works:

  - Stop the readers, then do_pending, then the writer.

  - Keep the do_pending loop as it is in -rcu/dev, including the
    torture_must_stop() check before the sleep, and move this patch's
    final all-CPU pass after torture_kthread_stopping(), so that it
    runs once the readers have stopped.

The writer can then still wait in ->sync() on a deferred hazard
pointer, but only until that final pass, and nothing waits on the
writer.  The readers do not need the writer to stop: they leave their
loop at torture_must_stop(), after at most one stutter_wait().

With that order, the long sleep above can still happen, but only if
do_pending passed its torture_must_stop() check before the test began
stopping, and had not yet gone to sleep when kthread_stop() came,
after all the readers had stopped.

Would you prefer that?  If so, I will rework this patch along those
lines for v1, and rerun the tests.

Thanks,
  Andrea
