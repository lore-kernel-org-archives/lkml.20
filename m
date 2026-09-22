Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B994A688B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106925; cv=pass; b=HE2vAF37dBiWv8RhvPrUNCTZO6niqsel3cCRZhqKZedHAQAtVqoAIRuYSzVZPaBCZM0PXzDQFoDxNAr9NwrMQWbwrkONFGOpE++HRkcVltrXnrN3eUEHGVfp8EwCsgkfeH6Df9kdoRleC3yH/3qNqXxGfVtZxR6eW+TLnjNWVLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106925; c=relaxed/simple;
	bh=zB6lNLmcf4TXFD1nthxq4b0MqaJa5h13GLTe9DTQAQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QS6/kyYgCLMEcyTOFDklSdWpq4DbbwHcqmNTxIwKFkkzSQNwA107rXwgR6qA2cOfUIxPJYNYEmSUONjmIoUMgpVqbCBVZRJ9lYklYV/WfPy7F5i8onChi2x+xA4tOeVVvIJ1Po6xlUW0PzZAyRrzolR+CiN9cOo9ut6qgJlXgh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DOTN+VRj; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DOTN+VRj"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so2426771cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790106921; cv=none;
        d=google.com; s=arc-20260327;
        b=lr82tI+ZvFYFX5R0qdGOGQVlfwJ3DQk2AevVwIjj1SWuyjl/LA9Jn6HexJNM/IwAg8
         zJoLyV8fAdJTTWwRTUFIh+2677H2kItkdbGVaHZl4XOHpOrfTOY3p2LwKCR28P5COzQ7
         DWMOA/de+NRKa2DSUmB0Of9OWJqhxmGW6auz/5qSuUq2SsVGVmMKDPQUbSO0wNtvRFS8
         8fefkMTm9PankM0pCN5j/JZWQ36dM4rcA2vOiN7hxmHj9ojw1mWllVO00/LXO/hmOD+b
         PWlTfXdzOxgF0eBgteie3k5/ta3Na85ytqnMI3NxzygFBfjJScbAKvGrdIrBTcfp3KOu
         /E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MJR+9B05XkGSZVsnTWPOt9y1Fup8Pf5AVkP65nsWhM=;
        fh=pmAaWylISy51LhoF7LSH2ik3sm/F5+/0mz2Q2x6/ZRs=;
        b=DY0Hymtk/2NhBCZ7IjyzQdWhwLdulmauz/YvWxgPPD5POebld4vMLMG7y/gO9q7pos
         45Av8HdLmiQoE0BZ9Ko/Jif2WzkIgXlH0CCuZyq0+Ti67q/wLB0cbmVm8rNy92QI5hcQ
         CcNC+GBb9E4MSLcvDUNGZEkZFdpNNjR5HkT90qkbY2H54yw1crGjefHrPjg7gfS9FJvL
         mq+QTcWGtY/5v5nfczJM1Ql3EPWpOvmzJRJPCAuyQFsSUYsgrcLAgt9QAHRl3HiN2h4x
         da4U0xzZ8TAwkcVOU15sSIlDSdgzYE8mLo8J8deK+2DKMrmaLGOCEIgo05BeCWmhDIqr
         OeCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790106921; x=1790711721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3MJR+9B05XkGSZVsnTWPOt9y1Fup8Pf5AVkP65nsWhM=;
        b=DOTN+VRji/NeX2O6qxY5aUmVm2REIX2+7TwCG7f3HLcx9/T1vcQztYsFwCZ1eRaSR1
         l/I+zrDv2lRm2ZbZ1w2VlfQ1oyzaCRavvfw0tRXlK+GYH9AnzJakrZILzPYB33QuN8sb
         12+eJ0J1FiTDclThEOf5Gi8FQCOWhiN2OzxL3Zn8AIcKNH5nSBy6Ey40nonD0J2hnCnF
         +awYYnS6S5MRli7XpqnNhIX+vkgQBQYKifR2qZHLEjaTUtgNFSOEnBBXyLeXJQhSU0JT
         WRQTyGHo/RVtTuIQ792bQcuTn879MaFJSdLgVKxAmd/x3zMKkm5QuXNc6NGwLWo1Jmj/
         MY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106921; x=1790711721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MJR+9B05XkGSZVsnTWPOt9y1Fup8Pf5AVkP65nsWhM=;
        b=B507ivWR0CUBXI6DWeFDftoRak1grnmQOvyJpuvRMWOg685cooC6xxYhJRt0UigqY6
         mH5QhQ28SyPbTS3c9nc/SQaOxoZW1plChhwugA2VEkxhpZBpJsILIudOgW+98JOol9B6
         oUHuBaZ+1nxQB7/h4HQRCHDL1WAMTFYV+vEyt6x5Y6FgS+AU2LlyBnKbVPsPnWxI9vJM
         gJLOpOcJA8mTVp8COPoohpy1zuL3DtrPGiDMiLRKqa9zZffeF4TME6238n68aHIAZidF
         wL7Y36Jb1VX4OE0gWqqvNUlUGCm41wl2qRuFj87MZTztm6hIM4sNYbCGsQkUhhYxQxG/
         atnw==
X-Forwarded-Encrypted: i=1; AKwUvBwCbyFf8fKPUIa5Nn6sAsYy77VestcStfZWymhIhCfvMRMnXDeHtftwPKLarZOiUTAR215uFvWWeuWD+A8=@vger.kernel.org
X-Gm-Message-State: AFuF++ktLMpTwor77FprH2HchedsIlxWlKudfsRWFIEUKKiSujAFp3+E
	bNYudZjL0kNt6jTUNgI48q5TXetbaSDQ4bu/nIXQe5/zNpjpLfg/WuIxtg3nEAEnDDIfwYuTHa1
	5LOD7Bn5B6noFUaU+X37EEzlJHvr6K4IlwTbCEuOEvA==
X-Gm-Gg: AYBFou1RLEYeGVJngBbcrKWnjzRTgxuJ3b7pqsadHBrQR/q8crQeh5GfmRyHindKmmT
	OWIcuVTEUzIecccMCjNtnJNZYQZyq0dLvwdmzORUW36JdWE94zaV92HZAqxGxYYTUcKl/KTU6hN
	BxBfqo9nSWA++dSL3Grl3xhFi+cos70FsJ6dsNl2ci58XkI/mTbEfzzzMA5/6PpoYiY8i8bpKxZ
	+YvUyWJKypI2zNT0RoNRQUiOusMcwZvF1qcne/8bBtcVT14R5NUlOU+hArZDTZfPbF1uOGE2Bvu
	MDBop6ZR1ejr0rMKvCf07KCRymroCQBcTgWY9V0hQfZTpQM8YCTUY7IV
X-Received: by 2002:a05:622a:4807:b0:532:d0ab:f3cb with SMTP id
 d75a77b69052e-532eadbd4b5mr10656351cf.59.1790106921022; Tue, 22 Sep 2026
 12:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-4-sgogte@purestorage.com> <bec91f99-4498-4be9-bf96-f3021c79f3f1@grimberg.me>
In-Reply-To: <bec91f99-4498-4be9-bf96-f3021c79f3f1@grimberg.me>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Tue, 22 Sep 2026 12:54:45 -0700
X-Gm-Features: AcwNN1Uz64RWiq9roHL-G4V9fQSjEC7rP5r0n-KWaGYq3XCS5Khgm1bpMuH2QRo
Message-ID: <CAMof9cWqVs89MVr0D8nsNBwvuQU25itf3SqCn=OZrrZKY_MkMA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] nvme-tcp: parallelize I/O queue allocation and startup
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Solganik Alexander <sashas@lightbitslabs.com>, Roy Shterman <roys@lightbitslabs.com>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 2:27=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
>
> On 10/09/2026 23:28, Surabhi Gogte wrote:
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
> > - Add nvme_tcp_queue_setup_ctx for propagating errors from async
> >    workers.
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
> >
> > Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
> > time reduced from 61ms to 11ms.
> >
> > Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> > ---
> >   drivers/nvme/host/tcp.c | 124 +++++++++++++++++++++++++--------------=
-
> >   1 file changed, 79 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index fe0e581608b4..0fc244e676f9 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/module.h>
> >   #include <linux/init.h>
> >   #include <linux/slab.h>
> > +#include <linux/async.h>
> >   #include <linux/err.h>
> >   #include <linux/crc32.h>
> >   #include <linux/nvme-tcp.h>
> > @@ -54,7 +55,8 @@ MODULE_PARM_DESC(tls_handshake_timeout,
> >                "nvme TLS handshake timeout in seconds (default 10)");
> >   #endif
> >
> > -static atomic_t nvme_tcp_cpu_queues[NR_CPUS];
> > +static int nvme_tcp_cpu_queues[NR_CPUS];
> > +static DEFINE_SPINLOCK(nvme_tcp_cpu_queues_lock);
> >
> >   enum nvme_tcp_send_state {
> >       NVME_TCP_SEND_CMD_PDU =3D 0,
> > @@ -154,6 +156,12 @@ struct nvme_tcp_queue {
> >   static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
> >   static LIST_HEAD_GUARDED(nvme_tcp_ctrl_list, nvme_tcp_ctrl_mutex);
> >
> > +struct nvme_tcp_queue_setup_ctx {
> > +     struct nvme_ctrl        *ctrl;
> > +     int                     qid;
> > +     int                     *err;
> > +};
> > +
> >   struct nvme_tcp_ctrl {
> >       /* read only in the hot path */
> >       struct nvme_tcp_queue   *queues;
> > @@ -1719,9 +1727,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvm=
e_tcp_queue *queue)
> >               goto out;
> >
> >       /* Search for the least used cpu from the mq_map */
> > +     spin_lock(&nvme_tcp_cpu_queues_lock);
> >       io_cpu =3D WORK_CPU_UNBOUND;
> >       for_each_online_cpu(cpu) {
> > -             int num_queues =3D atomic_read(&nvme_tcp_cpu_queues[cpu])=
;
> > +             int num_queues =3D nvme_tcp_cpu_queues[cpu];
> >
> >               if (mq_map[cpu] !=3D qid)
> >                       continue;
> > @@ -1732,9 +1741,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvm=
e_tcp_queue *queue)
> >       }
> >       if (io_cpu !=3D WORK_CPU_UNBOUND) {
> >               queue->io_cpu =3D io_cpu;
> > -             atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
> > +             nvme_tcp_cpu_queues[io_cpu]++;
> >               set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
> >       }
> > +     spin_unlock(&nvme_tcp_cpu_queues_lock);
> >   out:
> >       dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
> >               qid, queue->io_cpu);
> > @@ -2011,8 +2021,11 @@ static void nvme_tcp_stop_queue_nowait(struct nv=
me_ctrl *nctrl, int qid)
> >       if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
> >               return;
> >
> > -     if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
> > -             atomic_dec(&nvme_tcp_cpu_queues[queue->io_cpu]);
> > +     if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags)) {
> > +             spin_lock(&nvme_tcp_cpu_queues_lock);
> > +             nvme_tcp_cpu_queues[queue->io_cpu]--;
> > +             spin_unlock(&nvme_tcp_cpu_queues_lock);
> > +     }
> >
> >       mutex_lock(&queue->queue_lock);
> >       if (test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags))
> > @@ -2119,25 +2132,6 @@ static void nvme_tcp_stop_io_queues(struct nvme_=
ctrl *ctrl)
> >               nvme_tcp_wait_queue(ctrl, i);
> >   }
> >
> > -static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
> > -                                 int first, int last)
> > -{
> > -     int i, ret;
> > -
> > -     for (i =3D first; i < last; i++) {
> > -             ret =3D nvme_tcp_start_queue(ctrl, i);
> > -             if (ret)
> > -                     goto out_stop_queues;
> > -     }
> > -
> > -     return 0;
> > -
> > -out_stop_queues:
> > -     for (i--; i >=3D first; i--)
> > -             nvme_tcp_stop_queue(ctrl, i);
> > -     return ret;
> > -}
> > -
> >   static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
> >   {
> >       int ret;
> > @@ -2198,22 +2192,64 @@ static int nvme_tcp_tls_check_psk(struct nvme_c=
trl *ctrl)
> >       return 0;
> >   }
> >
> > -static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> > +static void nvme_tcp_setup_queue_async(void *data, async_cookie_t cook=
ie)
> >   {
> > -     int i, ret;
> > +     struct nvme_tcp_queue_setup_ctx *ctx =3D data;
> > +     struct nvme_ctrl *ctrl =3D ctx->ctrl;
> > +     int ret;
> >
> > -     for (i =3D 1; i < ctrl->queue_count; i++) {
> > -             ret =3D nvme_tcp_alloc_queue(ctrl, i,
> > -                             ctrl->tls_pskid);
> > -             if (ret)
> > -                     goto out_free_queues;
> > +     ret =3D nvme_tcp_alloc_queue(ctrl, ctx->qid, ctrl->tls_pskid);
> > +     if (ret)
> > +             goto out_err;
> > +
> > +     ret =3D nvme_tcp_start_queue(ctrl, ctx->qid);
> > +     if (ret)
> > +             goto out_err;
> > +
> > +     return;
> > +
> > +out_err:
> > +     WRITE_ONCE(*ctx->err, ret);
> > +}
> > +
> > +static int nvme_tcp_setup_io_queues(struct nvme_ctrl *ctrl, unsigned i=
nt first,
> > +             unsigned int last)
> > +{
> > +     ASYNC_DOMAIN_EXCLUSIVE(queue_domain);
> > +     struct nvme_tcp_queue_setup_ctx *ctxs;
> > +     int nr_queues =3D last - first;
> > +     int err =3D 0, i, ret;
> > +
> > +     ctxs =3D kmalloc_objs(*ctxs, nr_queues);
> > +     if (!ctxs)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < nr_queues; i++) {
> > +             ctxs[i].ctrl =3D ctrl;
> > +             ctxs[i].qid =3D first + i;
> > +             ctxs[i].err =3D &err;
> > +             async_schedule_domain(nvme_tcp_setup_queue_async, &ctxs[i=
],
> > +                             &queue_domain);
> >       }
> >
> > +     async_synchronize_full_domain(&queue_domain);
> > +     kfree(ctxs);
> > +
> > +     ret =3D READ_ONCE(err);
> > +     if (ret)
> > +             goto out_free_queues;
> > +
> >       return 0;
> >
> >   out_free_queues:
> > -     for (i--; i >=3D 1; i--)
> > -             nvme_tcp_free_queue(ctrl, i);
> > +     for (i =3D first; i < last; i++) {
> > +             struct nvme_tcp_queue *queue =3D &to_tcp_ctrl(ctrl)->queu=
es[i];
> > +
> > +             if (test_bit(NVME_TCP_Q_LIVE, &queue->flags))
> > +                     nvme_tcp_stop_queue(ctrl, i);
> > +             if (test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
> > +                     nvme_tcp_free_queue(ctrl, i);
> > +     }
> >
> >       return ret;
> >   }
> > @@ -2255,10 +2291,6 @@ static int nvme_tcp_configure_io_queues(struct n=
vme_ctrl *ctrl, bool new)
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D __nvme_tcp_alloc_io_queues(ctrl);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (new) {
> >               ret =3D nvme_alloc_io_tag_set(ctrl, &to_tcp_ctrl(ctrl)->t=
ag_set,
> >                               &nvme_tcp_mq_ops,
> > @@ -2269,12 +2301,12 @@ static int nvme_tcp_configure_io_queues(struct =
nvme_ctrl *ctrl, bool new)
> >       }
> >
> >       /*
> > -      * Only start IO queues for which we have allocated the tagset
> > +      * Only setup IO queues for which we have allocated the tagset
> >        * and limited it to the available queues. On reconnects, the
> >        * queue number might have changed.
> >        */
> >       nr_queues =3D min(ctrl->tagset->nr_hw_queues + 1, ctrl->queue_cou=
nt);
> > -     ret =3D nvme_tcp_start_io_queues(ctrl, 1, nr_queues);
> > +     ret =3D nvme_tcp_setup_io_queues(ctrl, 1, nr_queues);
> >       if (ret)
> >               goto out_cleanup_connect_q;
> >
> > @@ -2298,12 +2330,14 @@ static int nvme_tcp_configure_io_queues(struct =
nvme_ctrl *ctrl, bool new)
> >
> >       /*
> >        * If the number of queues has increased (reconnect case)
> > -      * start all new queues now.
> > +      * setup all new queues now.
> >        */
> > -     ret =3D nvme_tcp_start_io_queues(ctrl, nr_queues,
> > -                                    ctrl->tagset->nr_hw_queues + 1);
> > -     if (ret)
> > -             goto out_wait_freeze_timed_out;
> > +     if (ctrl->tagset->nr_hw_queues + 1 > nr_queues) {
> > +             ret =3D nvme_tcp_setup_io_queues(ctrl, nr_queues,
> > +                             ctrl->tagset->nr_hw_queues + 1);
> > +             if (ret)
> > +                     goto out_wait_freeze_timed_out;
> > +     }
>
> This if condition can probably move into nvme_tcp_setup_io_queues() and
> exit early if both are the same. Other than that, patch looks solid. Can
> you please also run blktests to see that nothing broke. There may be
> some tests that have subtle race conditions. rdma and tcp btw.

Thanks. Sending a v4 version with this change. Also, I ran blktests
for tcp and rdma. The blktests nvme/062 "Create TLS-encrypted
connections" and nvme/063 "Create authenticated TCP connections with
secure concatenation" related to tls need ktls-utils-1.4.0 (c63c04b)
(tlshd) linked against gnutls 3.8.5. rdma also passed fine.
