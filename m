Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899394E73BE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070980; cv=pass; b=KRckF7QaeGDpYDYGc7HoYVthmhqfOFco9OQ3AfDaXGZw5DITNTGlfi4lIkGUQZp7LES/K04IWKR+VEIWMI9r45tCAmbireF45jbt9cMUdCVCPOnDNUARwMzGYebWPqcgBhmjfRieOT5EttL4PMYvd0pkS7UNp5lCYMGZN2uQ8rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070980; c=relaxed/simple;
	bh=xCgswTJ/xMHw1lRSMwJ1pqZUnBBu1pooak+t1aa0pNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQ2DW4j2ExKfDQxgdo8suOe7XQlrl9K8DQ5DLIjmGb+ZMQytynSMboi9DM1S0h3AedxUa2C3dTzds2VMzMxVeaSX00dGwo+W1DTWYAHPGBmn/7I4P0WbTos5QXwM5azNpQr8g1c99knsl0OZXkiHjV9Ia5Zv9Y3lDa/33vnWkgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tr9vi+MC; arc=pass smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tr9vi+MC"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so3004305f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790070975; cv=none;
        d=google.com; s=arc-20260327;
        b=sqcCRdela8eOZlnVmp5Parc5tUrcUQOtK3HGINMrv32KSHlsXjtuhJkflhMwh+XVY8
         ZXVzdH86qddxtKlX2qugmkDAVcPHyLFkhgKU/FvuH2iPbPCyjutpF6WdSyMslv/FWXke
         Tr68fcDSGLyuvD8ZHAxJk/nIo7A6y3/k/G6kZiXWTCyGo9LjL2wsi9d2Uis8SEIh948o
         rGlFgf4LNIkDME+h4TTT2macptbRZkt2CgUvuNh62be/3D98et+O7loy5YrLZA9ocCTd
         rVaSeA9w5v9Ns2FFPNEBS7Vvw2Gi/0uPsuLnUFpJRqLx2lmpigBtV/qhAkyaGh3vyMeL
         6r/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        fh=yk9putp+OXRawDjIKCNUO5ROJsxYxXH2v+IrejZyS1M=;
        b=XyX4guf0gBHtDnx5I1GfNGQOGfinON3yPYPQiqEM4NXniPfAdbIKnYt/8PoTH2VgO3
         iKG5PEgmUfh3j2Au2/RDPgE6Rh03ZmBGYcmiZjz4z/zI3yKuW1bSSOHp/b4tasI5/PtS
         4/AVaG2TbaZKrx23IeHYmb9XoIqBZZ9FztLaocL/XqGzB7kVvmnRh/QW4/dXjZVBoJCD
         +aw8upKfuwqb7jKrMjqo2k6xjy0tMclRmnfaGU6Ggfo0PrTqts8UZBvgZMfc4/j+2IgU
         TnJs0/UWf8g7Pfi2bgv5qUqRRH+3IVmSBaWGnLLjNNchP5hVsRonc6A6XgazzzE1BxcL
         cdug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790070975; x=1790675775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=Tr9vi+MC1ZSYhmvt8E8gHvXsuhiW+RwZCfAMbQ/4V40afkFLSEiDdizYHLUZ1krG6F
         NP0gUq6QrxFqW28XXdCaJ5zgMyirdsX8n1hmxKv+Kx8SzmZ+ze4L80KNPssOZJ+vc7L1
         PTMwNdkk4tzM9y1AI9cODJIC6/A/zBXFzdJ9Xbi3kP2SBDSsIurfTpY1SDYgbl84w+Ul
         pavxN7mZUSFode3gfihnLcT6/6K2FedIhqX7YbmuZxj/Ou8lbsp2oA1IEaOQ3oChgk9V
         Uh/xXZlxX40csubm46oOVjMci2h31t7t94lSw/b9bv4IMfU5iuogVxy3dpmCbTrAEOUz
         d/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070975; x=1790675775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=xJDs8s5B0Jb49rpTCniDB1OoJUez4uca4L4B6FR6z+xQpymXB4bbHkZ4lkD9waFVK3
         SJQysTWhRwMvIijsOAC0bOZ+OTctFAtylnqX8UGddMa89hGuxq1OY/Ql//n6tclDasJH
         yWJJhar4mkm3m6NJz5p4xf0gYHE4Kp2uJoQYRimrRpk5G130+FQa5TObEiJbRF1LL2Ir
         zbZcJ9xKr6a5e0rNbGhREtuVWCqwjMrPI7wrttQy+e+WxeUkz0uwKKfbaPEShWBk9zv3
         uvO/w2m+WwygfE13X91aaCzfnI1vbIpHgnjMeW6rRPn3G/K6TOKhmmwrWL4zIKdnX1TT
         98/g==
X-Forwarded-Encrypted: i=1; AKwUvBxcy5UhUhiSf7OpzvpaxVeyOQwzimtrwLF4Eq6UIL9B/zxRLOvelGmutb/UkLbtnmbOWgNPcp9tL0Iqfko=@vger.kernel.org
X-Gm-Message-State: AFuF++lq20Z0Baw4lJj/s+omvO4Ims0i3iUm7FaAOJ0h7ARCeQuog9Zi
	DDEPmeMv2ksMZ7n4uXRTQMO7md4JLKFHSOHlN9spkpTJD69wMVT/OwM9LYmi9+pdTgMajo+EbHZ
	SSSceXyt5nD9ZNQbbuYyTviVtrGdgItY=
X-Gm-Gg: AYBFou3uMlMv+vmAGAw7J+ZHLuYDzoER7dz9FqLD6GibDLCCZnqD05RdxlIjrIWAsJd
	iyfmGAR67y6EdvIsKSwrJgFzYhe8GqbloyaofsIxdxAbCCHtdOwrm4sP0RxQxoFfOPVE//LTx8E
	m9VXZz2BImXenu57Imegh0QSt5dD9l1v4yt4Rj+mgzs5tFtJKi/Ub3e2vHqDhU3TfjBgH2Q7CGu
	GwAmRcnPcnuFcvQcpLrY4NGid/EP29fM8vciomCBuKRC3LHHcs4IrYbih9Vo6fHMLzNtjZk07za
	1J763JUoGfPik/8gwFwejd+1qEVhHt7HOkAT2XQ/4JSCz6M/K2DQZDWcUAl+XcgDoqiEqCbz/mv
	D4IxkgyBZzt9E2w==
X-Received: by 2002:a05:600c:34c1:b0:49e:799a:8951 with SMTP id
 5b1f17b1804b1-49fc56aba0dmr207997635e9.11.1790070974214; Tue, 22 Sep 2026
 02:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <arIyx4BaA2eArvYM@MacBook-0RXW5>
In-Reply-To: <arIyx4BaA2eArvYM@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 22 Sep 2026 17:55:57 +0800
X-Gm-Features: AcwNN1WuirzzkFb6JjmLl9oXFf7utj_0mv7EZ3p-lcOEdTyD2DTvMQxEs2mG2t0
Message-ID: <CAN_Opa_kZ1bwgVw5k9E2KkLkK1WP3+J_=n8GW2m83zZMwXVEYQ@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 0/4] hazptr: add shared scan path and lockdep use case
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:48=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:46PM +0800, Kunwu Chan wrote:
> > Hi all,
> >
>
> Hello Kunwu,
>
> > This RFC/WIP extends the current v3 hazptr implementation [1] and
> > adapts the lockdep use case from Boqun Feng's earlier hazptr series [2]
> > to the current hazptr API.
> >
> > [1] https://lore.kernel.org/all/20260919000056.3132131-26-paulmck@kerne=
l.org/
> > [2] https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmai=
l.com/
> >
> > The lockdep conversion replaces the expedited RCU wait in
> > lockdep_unregister_key() with hazptr_synchronize() for dynamic-key
> > lookups.
> >
> > The series also adds a shared-scan kthread for concurrent
> > hazptr_synchronize() callers, rcuscale support, and an LKMM test
> > for the acquire-before-scan ordering.
> >
>
> Thanks a lot for picking up this, much appreciated.
>
> Do you happen to play a bit with rcuscale and see any performance
> difference between hazptr_synchronize() vs synchronize_{s}rcu() on
> various configs?
>
> > I tested the lockdep path on a 96-CPU ARM64 KVM guest with Boqun's
> > original mq workload [2]. With a multiqueue virtio-net device
> > (`-device virtio-net-pci,mq=3Don,vectors=3D6`), tc mq add/del x100
> > completed in 850 ms with hazptr and 860 ms with expedited RCU.
> > The rmmod workload similarly showed no measurable difference
> > (1360 ms vs. 1380 ms over 10 runs). There were no crashes or hangs
> > in these tests.
> >
>
> You could also use /proc/interrupts to measure the IPI counts during the
> whole operation, and you should be able to see the difference there.

Hi Boqun,

Thanks for the suggestions.

I collected both the rcuscale synchronization latency and the
/proc/interrupts IPI counts from the current implementation.

On a 96-CPU ARM64 KVM guest, the rcuscale results with
nreaders=3D0 are:

                avg       p50       p90       p99
nwriters=3D1:
hazptr          98 us     96 us     101 us    110 us
rcu             8.4 ms    8.0 ms     8.0 ms   16.0 ms
srcu            8.0 ms   15.9 ms    16.0 ms   16.0 ms

nwriters=3D16:
hazptr          8.0 ms    8.0 ms     8.0 ms    8.1 ms
rcu            14.9 ms   16.0 ms    16.0 ms   24.0 ms

With a single writer, hazptr completes in ~100 us. With 16
concurrent synchronizers, the latency approaches ~8 ms, while
RCU rises from ~8 ms to ~15 ms. The shared-scan batching
appears to be effective here, while the scan-kthread polling
mechanism has a significant impact on the completion latency
once multiple waiters are present. This also motivates the
Bloom-filter redesign you suggested.

For the lockdep workload (tc qdisc mq x100):

                wall-clock    IPI/op
hazptr          ~810 ms        5.1
exp RCU         ~790 ms       12.3

The hazptr path shows substantially lower IPI activity on this
workload (~41% of expedited RCU), though the wall-clock time is
similar. The lower IPI activity does not translate into a
measurable wall-clock improvement in this workload.

I'll update the shared-scan design based on your Bloom-filter
suggestion, make the rcuscale target cover multiple objects,
and add the forced-slowpath debug option. I'll then rerun
the measurements with the updated implementation.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> > This is still RFC/WIP. I would appreciate feedback on the shared-scan
> > design and the lockdep conversion.
> >
> > Kunwu Chan (4):
> >   hazptr: add shared-scan kthread
> >   locking/lockdep: use hazptr to wait for dynamic key lookups
> >   rcuscale: add hazptr scale type
> >   Documentation/litmus-tests: add hazptr acquire-before-scan test
> >
> >  .../hazptr/hazptr-acquire-before-scan.litmus  |  49 ++++
> >  kernel/hazptr.c                               | 274 ++++++++++++++++++
> >  kernel/locking/lockdep.c                      |  30 +-
> >  kernel/rcu/rcuscale.c                         |  65 ++++-
> >  4 files changed, 407 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-be=
fore-scan.litmus
> >
> > --
> > 2.43.0
> >
