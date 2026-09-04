Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBD3C09F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538000; cv=pass; b=egEwS2jpD8xbc+gnEtIemaG7WvKchd0ITzo87fQhgjl5qhn9S/+owUAONGeOpWxnLlJo/eNfW3vqIEIvarwxllqPZyUtt5HLKj4YE+5SMu7vRnDF3d1HnERA/6eqG6gNx4tCgeFoEXszkwO3IFmasIx5yOnc8bSU4duWXxN+Zc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538000; c=relaxed/simple;
	bh=81yPo9M5ElN1gDtv45+koc/0H7KjctAvGpwkt1L6p28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvOIMXudRIYXSHhiPCdxD5OGve6SyY7/0ZMh5jpDtpqbXR41NYxIkTZjA/4u8FrY+aPH6SFSOhEynYL8RGQsC+HcgwtzEO3zM4tP+ifqvDJozme3OYzDXwF4BmLsr9hcnKH37uHwGmbxwyZpUlrOILnjo1cED5LF6nWP5AlgiQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CO7OP1fU; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CO7OP1fU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5301db51586so16565791cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788537991; cv=none;
        d=google.com; s=arc-20260327;
        b=SZXeMjRRAoFFnpcpD9m6cFWp9L6dCFam9Ifsw7OB/J5Omnq2isaGjdUUp9QJng137Z
         VN9AuIXP2JXci4l/+YW1nfC9Fj5EJyZok1rj3/b73t6W0hvRUj4QB9bmGM3XbjpTpjx0
         QHkiIM+NXvsJVjsALN+xCrZqjMA7Ia6mrsG3aBvs/3A/N2HkJim2KVx0LhbYr8Mh20mc
         nIU6NJHnk6bmAa6SITu76Sb+Bd871/+LI0QsqgnssUgbEJtt9E10O+sFXvnBUzZpLnOw
         74YVg9Y+uToE/Jr8hcz2twPnKaxDQArNQzb8GTWgmk1NLwUqSWcaBxVfCC7TJUnOtQHT
         9BPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1hoE3BcOuTiBC0ROHOK0Yvi5yLAEC063uLBYyUjYyI=;
        fh=yJg+OQVIUq8R2FrNCstcuhpRGqM3VV9wz5VKhrLx8D0=;
        b=X1ng3N7ENexHcQ+05RMq3qjUGe43dPmkS8JdrxAITj2UXpxbYJ/+2cBjnEoFpMzuR1
         BCf9ZUrSpI8bBlxMKWgM5mpzu16ch+DFi2WdJgLJF+4GmTU+mZHz7zU9y6rla3J6SdPf
         ntqghDfYkxgo2tiKskBA0xaeJ3xjLWo8E11xAOnZrmYsA9z+F4R+x6VTtsg6IwrkvqKW
         dMrtlgwHlYox6Lq8S2rryXlUjbqUkqrnkOPv7WabVrt3i6bRnnDPcrVWFgKAoFmRce91
         a0Ih8mMzOpOHCcSpQdpNhyXWeTwFJJM/gbCTutcQbVlI5wz3grwZbi+xRTOTk0CuJVxL
         GlDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788537991; x=1789142791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1hoE3BcOuTiBC0ROHOK0Yvi5yLAEC063uLBYyUjYyI=;
        b=CO7OP1fU++97e8JD8pK/ItAvq0Qw1kIHXiSAUP9hV7K63sBmfEMnX5bwoKNj8gZVdX
         uIRQwce5WaR4HBSDJB32/LFhJwciOTTgeUqyVGjZf37N8bMt/9PU58gG+p1q4039S8qW
         uYjwynzgrzb+Rkuy5zKmYondHTrVtbUI+NiHVGEqcGVDos3oW4jrBHR4kEjgQdx/0a8k
         H+dwaXyUJrQsmpv//Ewevd7MClTp7tHrYc6TbjZh/p2Ey8YTljvxYga/+D1bT+30x3ut
         bSBcgD589E61sW0gdszDzWLWAe6LX6LsPCZNK028FdZNdy94oY9fOXtoO9XPGq7Lpsx6
         ZWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537991; x=1789142791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1hoE3BcOuTiBC0ROHOK0Yvi5yLAEC063uLBYyUjYyI=;
        b=oXRBKYlvqmZ5uA+6pTXa3K6msI40LKxq5t+fkmYtlBtJc5S0+9ZmJc/ucDeYj7Rh4O
         a6L3Ir6l07L53eQaF0rbcBKgHxRR1lpLU16o0i0UJRldfbeVIziR3hyp/jrlR64WMIdp
         GmjFo4bsTLl80ryY+snXqREubpnZvZeBgkpt4t/19anUr9lyse0xM3SZQ7qdSjElRHgr
         fpoQsziFxfUQ3EkL0Pt3Iehe9ofpn6ber1Tr6FXJyaIsJruWowWxS3yWQuLZWJlvSzXL
         NjMrsjtu5h+w5ckIhH+VG2ww0KD/+kvCMmcauBEnqtn35LLl8yuzTWeS0W+7wsuqA7hq
         y0SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzafg223QQqFGSBRz0Ix200Jfd4UrD9CPAPRXK58ULKFYUdHsE2IQA/2c2TchhCflCBBZ7p8HHHY5brSFM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjjoScEn5bojFDvjNPhDFqvWc4NPD8OAAfUbchRxW8Es2fCSRF
	nri+DxXsSjFmwRe9N1NylB4mkzUKLehtKB4HW96QcslCBmcJ7/08rdFJ5p53PRsFrJ5x4gKWlqf
	O/gPXpl8bp67f6Ybs+a0Axau7yronpLqk8PRs80hEEw==
X-Gm-Gg: AYBFou16PMCTY0ki8AzKoMNMBEWQlSkD5wzU2FQy71reLhCbfCDAjEqbz6gvQcmUasI
	d8PD3VmPFN1nymNVSp15Kpn+nERqfRYZmxdK+ab71THq8n/yan9PiF+p5HuImfNETy6KUVizFjj
	zjm8+IRZAg8ajRvYJ/Hjg/zgYKnLgvLCjb8nCbKdx6RNTMF18o5w2geRfKg7tq+xvKCr8aJlt1E
	AkTCehdjjx/aViyXkeyKYVm7Az0KF7+1D3NMzQLL0KT70pFJcNIQU6xLL3wxsH0mrd4YwUUzLiG
	qcVfgejELq3p4UcJEkaPf+Eqn8iOZSWw6ijlK2Vt9yLU
X-Received: by 2002:a05:622a:1801:b0:51e:47a4:4851 with SMTP id
 d75a77b69052e-530548007d2mr71368811cf.8.1788537991012; Fri, 04 Sep 2026
 09:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com> <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
In-Reply-To: <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Fri, 4 Sep 2026 09:05:54 -0700
X-Gm-Features: AcwNN1XhIVrpE7jN0V-XwLfoyOZss61tkf_W80mr0zcm_FEIDqHY0YVSwMaXnEs
Message-ID: <CAMof9cWdXR_040SDs2N=3ETvdmxvjx+OokfkSDr7DzVbLbuenQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and startup
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 3:00=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
>
> On 25/08/2026 1:56, Surabhi Gogte wrote:
> > Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
> > allocation and startup"), refactor nvme tcp I/O queue setup to use asyn=
c
> > API, combining allocation and startup into a single parallel operation
> > per queue. This reduces connection and reconnection setup time when
> > there are delays in establishing connections, which is especially
> > important for high-core-count hosts.
> >
> > Key changes:
> > - Use async API to facilitate parallel calls for io queue setup.
> > - Add nvme_tcp_setup_ctx for propagating errors from async workers.
> > - Remove nvme_tcp_start_io_queues() and __nvme_tcp_alloc_io_queues();
> >    their logic is folded into nvme_tcp_setup_io_queues() and
> >    nvme_tcp_configure_io_queues().
> > - Allocate the io tag set before the queues so that the queue range is
> >    known, and only set up the reconnect grow case if the queue count
> >    actually increased.
> > - Serialize the cpu scan and claim in nvme_tcp_set_queue_io_cpu() with =
a
> >    spinlock, as concurrent callers would otherwise select the same cpu.
> >    The per-cpu counters no longer need to be atomics.
> > - Use init_net in nvme_tcp_alloc_queue() instead of the namespace of
> >    current, which is no longer the connecting task once the allocation
> >    runs from a worker. A controller is not guaranteed to be tied to a
> >    namespace, as the reconnect and error recovery paths already run fro=
m
> >    a workqueue in init_net.
>
> Well, I think this is breaking 1be52169c3488ef98582ed553ab35cefa3978817
>
Trying to understand how this breaks the commit 1be52169c348. Added my
understanding later in the thread.

> > @@ -154,6 +156,12 @@ struct nvme_tcp_queue {
> >   static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
> >   static LIST_HEAD_GUARDED(nvme_tcp_ctrl_list, nvme_tcp_ctrl_mutex);
> >
> > +struct nvme_tcp_setup_ctx {
>
> nvme_tcp_queue_setup_ctx?
>

Yeah, can rename it.

> > +     spin_unlock(&nvme_tcp_cpu_queues_lock);
> >   out:
> >       dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
> >               qid, queue->io_cpu);
> > @@ -1846,7 +1856,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl =
*nctrl, int qid,
> >               queue->cmnd_capsule_len =3D sizeof(struct nvme_command) +
> >                                               NVME_TCP_ADMIN_CCSZ;
> >
> > -     ret =3D sock_create_kern(current->nsproxy->net_ns,
> > +     ret =3D sock_create_kern(&init_net,
>
> I don't think we can just change this...

Passing init_net explicitly does change behavior on the synchronous connect
path. However, with queue allocation now moved into an async worker,
current->nsproxy->net_ns resolves to init_net in that context anyway, so
the initial connect path already loses the caller's netns regardless of
which argument is passed.

If the goal is to actually preserve the caller's netns through the full
ctrl lifecycle - initial connect, reconnect, and error recovery; it can
be pinned at ctrl creation like:

    nvme_tcp_alloc_ctrl():
            to_tcp_ctrl(ctrl)->net =3D get_net(current->nsproxy->net_ns);

    nvme_tcp_free_ctrl():
            put_net(to_tcp_ctrl(ctrl)->net);

    nvme_tcp_alloc_queue():
            sock_create_kern(to_tcp_ctrl(ctrl)->net, ...);

This captures the caller's netns while still in userspace context, then
carries it through all async paths =E2=80=94 so reconnect and error recover=
y
also honor the original netns rather than falling back to the kworker's
init_net.

Is this approach preferred?
