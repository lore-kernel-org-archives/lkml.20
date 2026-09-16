Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F6349CD2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537948; cv=pass; b=FMyX+fsOsrwd3oZ+Z91zvnfryu9RxdO46feDQ/gHZmZMwTaLdMqk1nU4qdBh9LpSLohzW0Ny5/pSaP2qX5arMZqP9vabLOTqtOtrFdCCihexkIbyPBtL+SSzJ6Z5sZzNZgevC2rWpAY8EvUf1LDeKkZHpvBjCMoV7OwIorea+g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537948; c=relaxed/simple;
	bh=ZAd9p3buf5sw/lbpO5eSkQgIni4fLiuW/Cdhwy/UJr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/Gl2U5mLjmgLruVfP+lQoM6xnEe8Pf19v4HUQOCgI2mYQbp4YrunwoRul+s+Rj2eOrpLggpn/rzPdpK7K0i1BOmgu0Q5DCZv4akFK9sGoaI4MVsdPne9/ap6M8/05PsQoWmxrFu4nxe8D5YzYLfAM3POThEgsre9678fSmVA2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=We6zXzTK; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="We6zXzTK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so126966f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789537945; cv=none;
        d=google.com; s=arc-20260327;
        b=nohlusRZYFgl3Wm9YhPJWhhyMtGQOuwqyFhf9fp2WbJ2kV7XyfoWNuYM6BgjN04gTa
         v6WSdYVZcRGSghJk/7dJelaz/V5ZCBw1ky+sk5aCM5weCdcUbu4tuIQnHdAmDwxY1PCe
         2+bGwV5p1eMCSdSEL5hLDeROb+ObM0XQZOi/S3hOFj9FpfP0P9HYQrcfk0U6dhJcxprC
         mv0L9DFzt04tZrkeOjrcJvp9gEhn4YMg3sv8I2aPDRtwbfcqQHRFy8VQtRNy65nTaqBn
         W+FeafhciOYIZaEa3+eYr1xHhy2PPBycr8Dyn33MQSe8YUfh2i6J4FNj0zeUxHGNOOnw
         HwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u7XJbo1JjBk/0gB1yl4UUU+t/X13lqc0WEaIAdIGX9I=;
        fh=XQZBt4OhkYrGri4Lrn1rbHSSR6CglBMU0B7mxirAlGE=;
        b=idOT0ZBukVrbDu44ySIquFFn49bIjQ7ovs9ch/cCvPpHcWinug8xNFhIJSMKEC0cY+
         6DxwI6xvzxMok4eFI/KxH49NHaQ65vW/7YEeE+quCA0MpGqr48xgxMIQO+SgHuUuVdyx
         mU1wNRFbb9T0o3oHSK+PCLKGSTO+K4w8ahnVvGsuxpudZXfkkVC9X3r+dzhRv26Q5fo/
         kKA7zpQRDqItBEtJw3ZuKbnDl0nZPfH1wis7v5cQ44GSdSSuiK5ECC01V6SATSyRCh/k
         6afpmAFp516zrs8V6Cl6YITrO+HHdZGDAQCIwxNJjle3Lkyvz/7psj9dKlOk/P7WQbPC
         AMuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789537945; x=1790142745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7XJbo1JjBk/0gB1yl4UUU+t/X13lqc0WEaIAdIGX9I=;
        b=We6zXzTKW6uXCsZbPJgs8SBx+5/2b7JhOafpcb4JXFfBrgJLl3af+sqW9W/ChvDpvM
         e9yYIcwfzxVR4Eef213yH6CuNokoDNSeFGATCYvmPS2mi74emNxtPtVykKvdWmH9F9K1
         84uTlL3GsDgIVQdrJoJObL4kQOcAeFD3I2WKP8VWZBzaAOb6ruopyETGoOY1ftpp8zU0
         O2BR1/L80O29GQZXEic9CKcT09TROcol+EFvcfe9L15og+wEJ66k1GKT0LZy2bg+0XZ/
         z3aMp3wbc7FHJ7E3Uoszu1YVB2WFGrgE+4i3JlsUH2tz+zOIeGEu8DxICqXiOR3ndw+o
         C+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537945; x=1790142745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7XJbo1JjBk/0gB1yl4UUU+t/X13lqc0WEaIAdIGX9I=;
        b=Uf/lOwnNht80WMhONuHyj6dj91UXGIG4bbdQNcF40aN4hpMR4zO2Eqm5vLvwiMU8b2
         qiaY6k/DW7LKVE10wYDgkKKYpOsBHCE4y0oQnIYIHVBM5lGazo3c08zpnkjQuNo/bgMJ
         Ye5R7qB7rzXmnSEeutEHIREM7uruvPUPPXX8OuvlNIMCw8Yvyf3omJgMP189FAf/5veA
         3jKzCDJSkM99w+Vb7y8CpqfthHqNzr+ijg5bgOaBbdHAu+7sezd5KGRRwPJK7NBuCwIh
         Ffx0YA6wDkcnL6/isCGOQMlyqxONEPKjsnnYlzCTUR6ia4Px6N4oqDVmgrINU5Q0CRZB
         kb8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2Fmb2MiU6PDMgS8bXV0CKm3ZNZiZY9U8dkxUiEdC2kHR5ZfoSsAHp/NuzMgAYAgbLeQDOl5lnez1Fwoc=@vger.kernel.org
X-Gm-Message-State: AFuF++kbLXP3mYFGWvKCyRjJ+lvUq2cH01w6o1Q9VQb4axS2wh4hICoJ
	avX44SuIQg+vvmotKS21R5103ec7h5egAs8+P7CjUEd9WGCdOC6V1uDr8tuQctSvUKLyCc+RCbL
	Ii+Vw5H1ecKgY474ZIG7tN+/VzjHpmOX5ONGXUl0=
X-Gm-Gg: AYBFou2CxUSXReOsVF5zLrRl7EEccpIQED1V8H4kNeG8VkRMGTjdKhsXiYjGYgBARy5
	t3op4TLEifg2/oCiK7F0lTxZEqZUqv9LZSF0MT1oIqRHqYrDXtuLvMMg9h5ltswaMcbd4UcBYkJ
	oRrIuptLIpAQhxLnPg5HTEiyhDr0SaWvhAYQwxCru6fP2wlmmuLIRYrQ+88IQwBUePmU7GSmiay
	OYsmNI6rnOZKa19v+JBwjcT6qnV2FvTlwRDFhhXcg/faZywFrjsfgpVcsZyCA2EJ8F8ZeM+OdL6
	alssa3f5qiEYuQioEl5L46e1BTIVNiW/eugGos/tANBSPJXxn1b7jn7ogMJTtuaj1leDFXItpfG
	/ln2m82EkEEn/Ew8+cYeWu3lwOXOux3DkFutSJqwI/6JhGIJ3sj+qonVw6mUtXRJu6RNxpF+4f+
	Y41Vw/MUM=
X-Received: by 2002:a05:6000:2004:b0:485:9908:91b5 with SMTP id
 ffacd0b85a97d-4870d6cfb5cmr1342851f8f.10.1789537944887; Tue, 15 Sep 2026
 22:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com> <20260826062901.2137-10-kprateek.nayak@amd.com>
In-Reply-To: <20260826062901.2137-10-kprateek.nayak@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Sep 2026 22:52:11 -0700
X-Gm-Features: AcwNN1Vrp0Z6c2-lmL6rXZFporU9K5G4Hgojdo-fE3Uqr8HP9u-9MTkTK8RLrkw
Message-ID: <CANDhNCrWKd_p5H2Cc0uEooD9-kU0a4e=GrFhpVA1cDyz9M2mOw@mail.gmail.com>
Subject: Re: [RFC PATCH 09/16] sched/core: Track CPU where the task was
 blocked on
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:32=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
>
> Track the CPU where task was blocked on when running with
> sched_proxy_exec().
>
> This is used to re-direct the activation of blocked donors queued on the
> blocked_head via the said CPU in the activation slowpath that will be
> added in the subsequent patches.

I'm a little confused on this, as the cpu the task was blocked on
doesn't intuitively have much bearing on where we'd want to activate
it, when a sleeping owner wakes up.

When a lock owner sleeps, all the chains of tasks waiting on that lock
(directly or not), will be enqueued on that sleeping owner.

In my patch, when the sleeping owner wakes up, it may or may not wake
up on the cpu it was dequeued from.  It seems we would want to enqueue
all of those blocked tasks onto the same runqueue where we activated
the owner, so they are all present on the same rq to be selected as a
donor to potentially run the owner and release the lock.

Since its like there is a likely chance the sleeping owner will wake
elsewhere (It looks like proxy_activate_blocked_task() in the later
patch effectively overrides the activation on the given rq and instead
wakes the tasks on the blocked_cpu),  won't this end up activating the
chain of blocked waiters on the wrong cpu (forcing them all to be
immediately proxy migrated over)?


> p->wake_cpu or task_cpu() is not sufficient for this purpose since
> p->wake_cpu is not stable when !task_on_rq_queued() and there is a
> window between set_task_cpu() and activet_blocked_task() in the wakeup
> path that needs to be plugged in.

Sorry if I'm being dim here.

Do you have more details on this? Was my patch prone to the same issue
you're avoiding in the second item here?

thanks
-john
