Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EAF3DAAB8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093356; cv=pass; b=mNWreOlq3YoiavGoLk4xxzrrAbtfzc1NZRsGirY5RTstveObapr0VG9Equ23/7sdfRwiJnkVaq+ynFHQxrEcy6z3lAXIEUvKzhVPtAT8cDxoa2aH0ZowUQs9iNtCqL01vQjpW6SryaYyIaLD5r1PWMNoKkz/a+LlTLbHjyO+Hf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093356; c=relaxed/simple;
	bh=Bz0sCgcCcFvltEMwQaua+/B5cZV1CmGcPPxBoEWouf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKGm0vyi2V7hwFZNuHfG2529xe1ug3Vra+6o6YCJrHHeIvQ+nU6bG981UQf7CamNFWmBXWKFFo8G8j1yK3ieNHsCpVG9zOTVhbhKkst/QsIN7q7U51wFRV4I4/Ypv0B6Ll6zUHUNbDWe8o+wM4tRGim95ioAw2g3Z2YgmGudeww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cptcqt6S; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cptcqt6S"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so819140a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789093353; cv=none;
        d=google.com; s=arc-20260327;
        b=DLl+RXWbiTNVKIRQXF3f5pvRdiPI3DLK8DjGphSzI8WilzMIqGf1I8z4ppBDlcFMfl
         7uFOA84Qvtxa9xyWPHHi3iYdncro3NYJEOIVaKbKZM7PRWpsXyd4D6p9BcX8g0AP59y/
         tUA29+rd3UlHmqbY0vjA2slAZQAiFflJUP1hrwCOwecy4Cppsl6d3fbbTiQ9MvmDTjDr
         Uyf4LXHTdJOGJPx4hxj8NeyK5i4wsMszgsodHahXDfF8KYCl0YhJPDhX8CtyUPvys1wt
         drKT/2TFZT8jXIXOYca/fppp9PKiCspOb05DKteIUlGI0vATMnWUSlM5HDWfhPSQgtA8
         i06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        fh=fs5tOAA0gtDaYF3iv2tgg4llLlVYaG2uSkdSjOCjVzc=;
        b=O5M4m11RlL3r365hKKHDpEpzds174jIqJ18Jn+T0FO9arOnY/PtyHdLCQX9R21Wxly
         gEpjqpPSiPIIjNZNnmFRP466vqalQjdj75WQ14DuR+w6EjCgNHJkvrpWg7g2e7n7QMgQ
         GV1XPiOTwjVk8aVDz7qNhmqahtPqXVvcVthOUJeEaQfHhP78q0WsBM+3wKDYJDn0s/tG
         VikHZTZPB4fx3F3P0Pd4SCoGmkGXUQueiaK59gRTgY3pISdIqHtmJVejMZb9ZD7CQ80b
         c2Lm10VShLQOPF8asQSlUXTULWN8cmtZDy9md8XV75MDESeeXfnng95GrJkhFDUSbm7y
         xn9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093353; x=1789698153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        b=Cptcqt6ScpqGb+URyJ3Ec2fUg3HynYHi4aLZF1yLhpqbeEivPxohoEdtZnwEyJ54Fl
         q6G/qi/2/EsF9tqb79rSNz2BJpx1v8bTzA/WOrvhLJRM8cceKP9QtHqPuOoxZrTxpJVQ
         LwhjR7xA2BK1RNTgt2H3Fq1+Nxf4ru7VM+XP3iZA6/j9C007tx/Uq1kw4b9c1YYgHo+z
         wSNRd+/hP/BDO7+WPuOL0sMBbyV4aUZSjLNKdLQcVqMbiHPJu9CsRvidsZX5vIUJ7Bea
         I9y4x4hLVPaJuTbAKONX0kDQ03FFjybMpQK8zrIQzHUAcuU9W98pO7OFrERVn4VMvc35
         5V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093353; x=1789698153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        b=DipGlSb1qL5BOo7zneQbFNPAR83rXvjofkKo4H06+JBRLDHQPhckdrcfySKN5uXUGY
         fWlSPA1EDfOFFKPlaLWap4mIUBtwTW1FhR8qHuMaVYex1Dpe/bmXIFJcsVEvzyCMXCoS
         Re+M4A/RCZr7KffO7ADbPNjeThEaVMmpgyog9G+2mw04giyu0L8LsZJu+pWBQXC8Z85L
         QMnQd3JenaxUD+UrWldjvXz9bpmS19Mnzeuh8VQaz1VXGBLXW3lTV1RgpO/IK6oGU7a/
         It98+V9+rdbPKxuMMQBKQrbFCIRyUCNXUDpylNBKe2GFmcjFXJB8a0y4pF/7dk+0yaF6
         tWyA==
X-Forwarded-Encrypted: i=1; AKwUvBzGdehrmbiDj9WNDBMaOSPKZudTepgphbIHF5QZMXuwDVJt80Qu+iVs5kSFAG/YTfjohC9Fnzf2IVkD470=@vger.kernel.org
X-Gm-Message-State: AFuF++meF8fEtrKFw/UbmZx3VOqOhSdKGISN07QKZpU5q/r2X7ECXN3o
	+2hyPeCqn00Rn8euqvGGBAZW7Z00JOMvKNFV57Iw7xbtDj7nQelkeFghU0Oxwb8DKDrPGDI91Cm
	MV4cYB0INhiXpeunguHjjXlrXC2DQSwY=
X-Gm-Gg: AYBFou3xjWzXDNlW8lJJu+rfR+rfoN/xqwn0VFvfZ884M1o0DXvSDfDieTtzlLweprK
	4LkzOWv/kJz86dapr4wt/5QRirDjJu0tu4xT/tcr7UwUaEZyws4W739/Gxf/rD5kG0RPLIM9qe1
	53Q2sNVssvRsjAtYS1xxCck+TaQj1nWROdFIMSCNT9I5ERDUblCJWR2y1V+iottiX/osHGnZRLh
	zeDrioqDq8Ubm5v1/90+aT5nVG6n5vuX/NlK4QVbT+LgYwwgsgHK2rgwGG+5B/jd9vM9MjHTZGs
	PRcylm6Mybxpb+fkuC++r6oIfRAIAuHjtUFTZbFJ2AwuWYmOsNVySn5S0eCI0eIuMbw62y6TwwO
	3F6AjgjaL38I=
X-Received: by 2002:a05:6402:50cd:b0:6a8:d72a:3b23 with SMTP id
 4fb4d7f45d1cf-6a9b56f9fccmr842660a12.43.1789093353125; Thu, 10 Sep 2026
 19:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
In-Reply-To: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
From: Jason Wang <jasowangio@gmail.com>
Date: Fri, 11 Sep 2026 10:22:21 +0800
X-Gm-Features: AcwNN1Uzpxn8BhhthHEzwNinazI3iL-_kocBQlmIkQ9u52465cUbeWR1Pr_TyGY
Message-ID: <CAAf7B_Oi_z7M_A_LwoAs_CAvhuk1NGxvADQssE65_OcTroncXw@mail.gmail.com>
Subject: Re: [PATCH] virtio_blk: use synchronous quiesce in virtblk_freeze_priv()
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:31=E2=80=AFAM Cong Zhang <cong.zhang@oss.qualcom=
m.com> wrote:
>
> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
> virtblk_freeze_priv().
>
> Keep the existing freeze and unfreeze order. The synchronous call waits
> for dispatch code that was already running. The queue remains quiesced
> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
>
> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system s=
uspend")
>

Do we need this for -stable?

> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> ---
> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
> while the flag is clear. It can then be preempted before it gets a
> request. At that time, it has no queue usage reference, so
> blk_mq_freeze_queue() does not wait for it.
>
> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
> dispatcher can run again, use its old flag check, get the new request,
> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
> reset the device, delete the virtqueues, and free vblk->vqs. The old
> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
> kernel can crash.
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 32bf3ba07a9d..7a570591e040 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device=
 *vdev)
>
>         /* Ensure no requests in virtqueues before deleting vqs. */
>         memflags =3D blk_mq_freeze_queue(q);
> -       blk_mq_quiesce_queue_nowait(q);
> +       blk_mq_quiesce_queue(q);
>         blk_mq_unfreeze_queue(q, memflags);
>
>         /* Ensure we don't receive any more interrupts */
>
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
>
> Best regards,
> --
> Cong Zhang <cong.zhang@oss.qualcomm.com>
>

Other than this,

Acked-by: Jason Wang <jasowangio@gmail.com>

Thanks
