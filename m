Received: from mail-ej2-f36.google.com (mail-ej2-f36.google.com [74.125.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF514DC551
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286752; cv=pass; b=NfUUlTban64/pVgAUvT798R4PrEngFXUpqb4BzJcJe8zESJfY2ZJZn14VsRxdyLDxY7xynp4rV5TRwBV12EG+Bvk/7g05qa2Fq3TrsGdUY48wez+VJhZhL14A8i58iQpQklXU6/9JDqdEusxclLdQ0hmmuL6gRz68DKu6RCFB1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286752; c=relaxed/simple;
	bh=aiXPmqm6ixM4oT72vI39xuRbdKB8n+b5PJa9G0aPnp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaeKyMEqC4VC9xRgFs22h5iPwBzA037eLQMUQPoIc/Iy8eUefmnYRSlmVLVxFj7vmvLKB2tWrGowezIV+1monbUT2la1ofH+MzTZMjR7jlG5LKlPF+2meVSUENtUfOKntIOxMibSmw86A5UbaIglMaCS325jjANxlmrg14TQxYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzK+BSKH; arc=pass smtp.client-ip=74.125.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzK+BSKH"
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso39945066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286749; cv=none;
        d=google.com; s=arc-20260327;
        b=ssVC3bM6I97TGC5c4XBYrYBwAbFhTCHDa42w0FeWevtAu0Uvtk3syrZ236b83uhs6s
         olmjwqcfPyRkaMrQtnLjYIzPm1TA1A+ve7PKfmonXVLc7VlWF/TXncbYisj2KI9OqSe4
         inVmY5+AbTqbbwIaJE7qVFBaD1xsFMGbQdQgs6v6Ff8LN7dLZuEOund08Ph0Uj23ibrL
         gGCIBqQSL5JiUF6hXEcciOZViZ3uwlo7EqGQtPh8q3VxQISylsNGkws6dxvl6X1IQ8P5
         LA0D1/nK2JaAHagJ8NXzmuXGOCW9aGnkFqBJXCOBxksnNuN6GZlW7cZ4rUp5D3vU5hGv
         K2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emy5clvpUK1/PyZ+N1ayFgkMRs2DcwUD8nISbx9nKIM=;
        fh=MGVj+ZLmYOD1pCHcMu6dCSjwjHZexT3KlhsgRiqqLYA=;
        b=aegdPilqvE8ehGoFjRCQti/JaxZOmNfFIDvKMCAEEWZsLI/0lQKgg1EExdKqkBJ8vF
         OYe6H0QeukkcRG9F3na/hM7E+o02Yp37fxqS3YkRVTsik4Cq6Bwe6JUKjt7RkYblRKeu
         VCQwGP2MYnXSb5eNeGGmW+3vsVFVBuI+1fx7UL6R205piu6/Dv2dzLYhKzMzzQd3aqfP
         aITgUrXeqVYbG10++aV1t1tAjkRHrKp4aYvYmMGrzoTmzoOUPaShJdaaL4Y2BCG3TeJh
         H9bwshhl1bUZWbExCubNbyTc5fIxKVe487Ym4HWYkRGM7R2GLw4JY9DwYneOY/HRH3a7
         gefA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286749; x=1790891549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emy5clvpUK1/PyZ+N1ayFgkMRs2DcwUD8nISbx9nKIM=;
        b=XzK+BSKHBGFZ0wETD2mM4OVeCch76eqxvGzeOGGacAwv+lWt1feA0FHo1619hNIKa+
         6mgGbqyjQN8VUFbDzJmkrIz/SgWpYq5knrUKjoisF1vAJdK3tFP5g8igzySm+mcvAUU4
         vCZdnqoeoetTK8LXLO27fMJJfQ6ZgDJ2QkaJkH0og2fhFbu+18DdEGWogs1ci9L+OP40
         ETgSQQWD+R3yO6HhetHFW1iI0VVLpEj4KDW9yRIv9//7xisDow20fb1d/2CyPzZAKZpg
         2ho3nWBdDWAkDEM7bBMoFhjwmrKrh7xqTaZCb2HDbGfrLnd99Auq5ixBqXliBtEXMYZg
         wuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286749; x=1790891549;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emy5clvpUK1/PyZ+N1ayFgkMRs2DcwUD8nISbx9nKIM=;
        b=SG5w7ZYvJOYhlrsWqXrybwI5xZx/6hNi5tYBT1SRjdXFU66lN0LEqD8WliVSl6YdmH
         4RFoCnuuI6hWr1P8YEPfi1nA+Ac1jCjU2dpgbTaOWQf9lSGMkAxqt9wfnBQsObRX8/c5
         Z9rO72ezDuytpusKnNlz/V5w5Ir2z/xdLzUXOeh5GycXaIHjsHI5igbw9s2BrPcStFpQ
         FbTUOSo5Hyhe66LZfGYY1frkBvmdq4SAfdsS/wEUgbHfnRGqGHZpGlacOKGo7ZcvkNFu
         oyp2wZWN2tbZviu5KUCxsML6ZukSJImWs+eayQu3L37hexDmI2WKjL0JmiRlP1IdFXKo
         9ACg==
X-Forwarded-Encrypted: i=1; AKwUvBzNdgrQ9xl/hhSaGpNj1bGj0Uk+N2U6OBD0hnZddtcpJfie8bWTR0giEpjQLrCXv3gCJujp4HEUQU7KrEU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+08x0AjoqPE7XWCGqeQ1N47hq7DjziHHLR6YhrAb8IPUHNf/0
	DkwCBGo5njeCzeww1fqBAHnFBDKdteUhXRxMd2QXpHRu+bYHv6szP0CiJ5mMsduqJmEMJRQAGJA
	ZbEAGwxzWDFXdcgSqOIcak/UybyPbyQ==
X-Gm-Gg: AYBFou3/6B+hnFA7pgtOopeHbo/ff45qGIhfIeNed5p2GySMzNzs8EUlpRt1g6Zy8UY
	UJyPT/aVeba75aT6CqPsOYf5N2gLHvuEnZzmr1eXvpJ+24c6lSaO6hFisjNHe72zCTM0FfDu+l0
	jEXJKcttzlJ8083DGSI4YDLMpY1voXqb4jlKE3KcOPjJ5RxOA6g9bKhTNu2/XQ6M4/HveYpcdFJ
	QbfsGXj8cLXWiC9vDfTPtK/eI4+gd20lEjthzgFSKnzPLaeJXP4jOIrq1BxXUX3r4ze5y1dsDcq
	Q+l9/BAFsJKWSnAvoaDjfwisWif8ABNCwCcygcOLek2Ae1dWx0RsilbUpl3q3A0JSTuwlw7MNCV
	ksVlEMqslLi1YzEX8pPLCw+mcsYggVxF/Nil832D+Vx1C29NQho3JbJnsTmvfAKP0sx6cexj65A
	bvmhI=
X-Received: by 2002:a17:907:6c17:b0:c29:f5d8:9c71 with SMTP id
 a640c23a62f3a-c2ac223e35emr345128166b.32.1790286748921; Thu, 24 Sep 2026
 14:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923051950.89403-1-mhun512@gmail.com> <arOb_IrqoVq9FAw3@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
In-Reply-To: <arOb_IrqoVq9FAw3@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 17:52:15 -0400
X-Gm-Features: AclHuK-3uW9w-DLBn4AytG0kNFAgoJ5Et803l7IrNKM_RHggnHA0eqjf0DULHjc
Message-ID: <CAGEsz8H+WhAoet36WaDvK18pV5gPhHXjDoSgHd1K=kWEcu30Aw@mail.gmail.com>
Subject: Re: [PATCH] media: amphion: Stop mailbox RX before freeing the
 message buffer
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Thanks for the review. I=E2=80=99ve incorporated your suggestions and sent =
v2
as a separate two-patch series.

Regards,
Myeonghun

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 5:44, M=
ing Qian(OSS) <ming.qian@oss.nxp.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun, Ijae,
>
> Thanks for the patch.
>
> On Wed, Sep 23, 2026 at 01:19:50AM -0400, Myeonghun Pak wrote:
> > vpu_core_unregister() frees core->msg_buffer and clears core->vpu
> > before cancelling the message workers.  The fifo keeps its own pointer
> > to that buffer.  The core workers read it and queue inst->msg_work,
> > which uses core->vpu and may send on TX.
> >
> > vpu_isr() fills the fifo from the mailbox RX callback.  i.MX MU
> > free_irq() waits for that callback, not for the queued work.  An open
> > instance holds a runtime-PM reference, so remove can skip runtime
> > suspend and leave RX active.
> >
> > Stop RX, then drain the core workers and the instance workers they
> > queued with vpu_core_cancel_work(), while core->vpu and TX are still
> > valid.  Free the buffer and clear core->vpu after that drain.  Drop
> > the runtime reference only then: runtime suspend frees every channel.
> >
> > Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/media/platform/amphion/vpu_core.c | 28 +++++++++++++++++++----=
-----
> >  drivers/media/platform/amphion/vpu_mbox.c |  9 +++++++--
> >  drivers/media/platform/amphion/vpu_mbox.h |  1 +
> >  3 files changed, 27 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/=
platform/amphion/vpu_core.c
> > index 85cc4a14f8ed..000000000000 100644
> > --- a/drivers/media/platform/amphion/vpu_core.c
> > +++ b/drivers/media/platform/amphion/vpu_core.c
> > @@ -299,21 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *cor=
e)
> >       core->vpu->put_vpu(core->vpu);
> >  }
> >
> > +static void vpu_core_cancel_work(struct vpu_core *core);
> > +
> >  static int vpu_core_unregister(struct device *dev, struct vpu_core *co=
re)
> >  {
> >       list_del_init(&core->list);
> >
> >       vpu_core_put_vpu(core);
> > -     core->vpu =3D NULL;
> > -     kfree(core->msg_buffer);
> > -     core->msg_buffer =3D NULL;
> >
> >       if (core->workqueue) {
> > -             cancel_work_sync(&core->msg_work);
> > -             cancel_delayed_work_sync(&core->msg_delayed_work);
> > +             vpu_core_cancel_work(core);
> >               destroy_workqueue(core->workqueue);
> >               core->workqueue =3D NULL;
> >       }
> >
> > +     kfree(core->msg_buffer);
> > +     core->msg_buffer =3D NULL;
> > +     core->vpu =3D NULL;
> > +
>
> This looks correct to me. One suggestion: please move vpu_core_put_vpu() =
below
> the drain as well, so that the whole release sequence sits after
> vpu_core_cancel_work(). That would also match vpu_core_suspend().
>
>
> >       return 0;
> >  }
> > @@ -700,10 +702,18 @@ static void vpu_core_remove(struct platform_devic=
e *pdev)
> >       WARN_ON(ret < 0);
> >
> >       vpu_core_shutdown(core);
> > -     pm_runtime_put_sync(dev);
> > -     pm_runtime_disable(dev);
> > -
> > -     vpu_core_unregister(core->parent, core);
> > +     /*
> > +      * Runtime suspend frees every mailbox channel, including TX,
> > +      * and is skipped while another runtime-PM reference remains.
> > +      * Stop RX first.  vpu_core_unregister() then drains the core
> > +      * workers and the instance workers they queue, which may still
> > +      * send on TX, before the fifo buffer and core->vpu are released.
> > +      */
> > +     vpu_mbox_free_rx(core);
> > +     vpu_core_unregister(core->parent, core);
> > +     pm_runtime_put_sync(dev);
> > +     pm_runtime_disable(dev);
> > +     vpu_mbox_free(core);
>
> This part, though, I don't think we need.
>
> The driver assumes that all instances are already closed by the time remo=
ve()
> runs. struct vpu_core is devm_kzalloc()'d on the core platform device, an=
d
> inst->core is just a plain pointer taken in vpu_inst_register(). So if an
> instance is still open when the core device goes away, inst->core is left
> dangling, and the next ioctl - or close() -> vpu_inst_unregister() ->
> mutex_lock(&core->lock) - will panic. get_device(core->dev) doesn't help =
here;
> it pins the struct device, not the driver data.
>
> As long as that assumption holds, the existing order is fine: the runtime=
-PM
> reference is dropped before vpu_core_unregister(), so
> vpu_core_runtime_suspend() -> vpu_mbox_free() has already released RX alo=
ng with
> its irq, and vpu_isr() can no longer fill the fifo. So I'd drop this part=
, along
> with vpu_mbox_free_rx() and the vpu_mbox.h change. That also keeps the fi=
x small,
> which is nicer for stable.
>
> That said, the hole you're pointing at is real: remove() can be reached t=
oday
> with an instance still open. I just don't think the right answer is to ha=
rden
> this path. rmmod is already safe, because vdec_fops/venc_fops set
> .owner =3D THIS_MODULE and an open /dev/videoX holds the module reference=
. sysfs
> unbind isn't. So how about closing that instead, as a separate patch:
>
>   - .suppress_bind_attrs =3D true on amphion_vpu_core_driver, and on
>     amphion_vpu_driver too - otherwise unbinding the parent ends up in th=
e same
>     place.
>
>   - WARN_ON(!list_empty(&core->instances)) at the beginning of
>     vpu_core_remove(), so the assumption is stated in the code rather
>     than implied.
>
> Regards,
> Ming
>
> >       memunmap(core->fw.virt);
> >       memunmap(core->rpc.virt);
> >       mutex_destroy(&core->lock);
> > diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/=
platform/amphion/vpu_mbox.c
> > index b2ac8de6a2d9..521fd47f1d90 100644
> > --- a/drivers/media/platform/amphion/vpu_mbox.c
> > +++ b/drivers/media/platform/amphion/vpu_mbox.c
> > @@ -88,14 +88,19 @@ error:
> >       return ret;
> >  }
> >
> > +void vpu_mbox_free_rx(struct vpu_core *core)
> > +{
> > +     mbox_free_channel(core->rx.ch);
> > +     core->rx.ch =3D NULL;
> > +}
> > +
> >  void vpu_mbox_free(struct vpu_core *core)
> >  {
> >       mbox_free_channel(core->tx_type.ch);
> >       mbox_free_channel(core->tx_data.ch);
> > -     mbox_free_channel(core->rx.ch);
> >       core->tx_type.ch =3D NULL;
> >       core->tx_data.ch =3D NULL;
> > -     core->rx.ch =3D NULL;
> > +     vpu_mbox_free_rx(core);
> >       dev_dbg(core->dev, "%s free mbox\n", vpu_core_type_desc(core->typ=
e));
> >  }
> >
> > diff --git a/drivers/media/platform/amphion/vpu_mbox.h b/drivers/media/=
platform/amphion/vpu_mbox.h
> > index 8b7aea4f606c..a934fe61b294 100644
> > --- a/drivers/media/platform/amphion/vpu_mbox.h
> > +++ b/drivers/media/platform/amphion/vpu_mbox.h
> > @@ -8,6 +8,7 @@
> >
> >  int vpu_mbox_init(struct vpu_core *core);
> >  int vpu_mbox_request(struct vpu_core *core);
> > +void vpu_mbox_free_rx(struct vpu_core *core);
> >  void vpu_mbox_free(struct vpu_core *core);
> >  void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
> >  void vpu_mbox_send_type(struct vpu_core *core, u32 type);
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> > --
> > 2.47.1
