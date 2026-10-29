Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280838;
	b=WD1bJbbi1uuF579NQ5hgOIrK4Mp2a2AsLB/fIKP5a4Vzy5GEndHDm/EfzF/48P9uijr2
	 O2NR5NnvqdyaDOly5za45yGrysi5IiyFPJdC8a6UpupzPfdzi5/+hjWTyF/g1Lgf/r2/r
	 7XlUyGLkZKsaGwWtbLSbYDfyL9SXly8YzK7C0AL9oe4z71zBcCfBkIQ/lhwby+eW4sMmO
	 XjwLCciP1UkKFQ9J1ca+VG0Zz1wLQHZZ/mrekYENHHCKp/rj/ATY8wQ0Uw+CVKPChmHmq
	 IGeQgck7fOHWiFDVE7/0prE/syt8RjE8LztF2+ik96XEBweLjJZLd714AGX2Uyx7cBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
	b=H1YRZewAsi8MME2i3ets8gmr1wCCGk6By0X7l0WNMvCnOU/sKJtN5rhDhc5+V0rDPkMD
	 9P21TeSCxFWG9Yg/ep6Yclfn6iJRKede7SdsCrv8TYiuXaF/zbTZdndVetBygsZ9+L4Ny
	 s4q5K0q1G3DD0zSoN5Etcm/lYy4/AQWIwbxfMv2Cv4oiXqnLktCVGzXax7BtWkkhvKShS
	 WYmx3c8qKDgpwmSJ7EoUv3DJavyjuRlwWBs/XNIh99Eex/z3hZ/jtiH2i+zeOg6QaKGLS
	 k2A/Ws8eL47E6wZLdY0p8oxFn5puz32T1oursIBwDFCiVz8nv2WXAcigcmqZf6kkY8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=pXENXzws;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DAB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=pXENXzws
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso619237a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793280836; cv=none;
        d=google.com; s=arc-20260327;
        b=qWNZ4LvzFh02LRhIYij/I7431DASM6Bt+HCySHwu4NxbkdOf8irWOTjptcU8JCXWKX
         pCIeyS08vId34y6ybnpm+dKn1m81EG0KSzQ8V/S+1odUKysLqf+npQXS/s5i/TEFLGWF
         gs3Tdz3KQbkTUj34tGIvxE2vIHgSMeaK19fwrWFpT7TZHwD2SPhtKRuxXHZDfclQ+MZj
         IOHfstdYbhwsGRXNWf1KEcVRo8F9FwA84nW7mTcRKKb2SOkHZNCDxF60SM9e7qmFVXUR
         F0BNKFhvCimleXRmgwPrBC9UZjQZDobDzFJKjjvGyPx+cH3txWmIKzUHEtDyFYOiB0kZ
         RDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        fh=V6H0DkFZvEiQplQksilIMSvPxwSsm1YS67Yooa+PyIs=;
        b=MTEQbJxXUA+I/JXFKrSTJ2XZ5tIBl18vnnM7PSQBMcSoGlxEv4E3WgaQbc5k/Yu5WJ
         giThw34PIpxM3dW3WqahLVw8535F5rUEHAdOgP5k837Gq+UuW0O9DCeGVNcx/89Ki1xe
         pZEcd67bhveaU5fSi3QOFDKBkJq061h9oohTda3+PHDY9QeDovM2YUN0YpYipBGZij6V
         dN89+ktCvTYWKb7GW/qOfCX1q4USY/aaHQmsIx1aTFSOvFPUwy01oafZstS2Fw7lfcSP
         CDH5e5c7qKQ17Db4BAvMeJvv0Na9EfNMV7DPjc7HzohBNYVaKDZ/AiUJspYX+9Tb7Vc/
         AJ6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793280836; x=1793885636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        b=pXENXzwsbXs1Bi1Q/de3hCPfefNHByHAaEvTI4G0A+WREg0Ect4dw9f9kyV9r4ucgP
         5F8ZmauJaht58zJtnNK9yMCCSb6tLrLTukk6Ug6FxEAzCXTpRiUqJ9naaf/5aRrmgGtv
         EqbpZTfV7dKVYlJk3jVCnw/cvh5RAwYd5eDt20AZIQoEzM8XyrHQIO5UrTh0TJj1U/wY
         mynDC5vs+gyCvgk6DPi6HBAO34nYUcnZDwWHTHtxUSGt7oj2nx/ZxgHyhdeApsrdeZE6
         8+o5CslRF1nuPE1Jb22mXJdJAwnJ9C7DxsFXc7wblydSBsSwtBUvrtyWjL6HSTNjSE5T
         BlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280836; x=1793885636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        b=JKTteFGKBFwaXsy/gBMgQF/417Litx2eS44b0t8mxSyxlMsYhoHUvUbQwup4koTWw+
         mVDD/1fnXa7q40lRUdN1K1gQAeotk11QF8z+d2t+szJeYAxjdJwgz8eXWIrBhAhkRw/t
         wGwLYzybYIFzoHMYJd9lb98bUS25DsVEWQ7/GKdmsp3U1M8wNGafokNiYqwOgbr3KdI/
         9dZ9WHc/vgySEYBGHeNg9z9ldG4dRAERDoYzC9lpSMyTF93Ab5ekErU6GjgCORqSiWaq
         g5pkvDdPig0dT6S+iKyajwzvvlE88tfitMVndS2Vw3rmr2jUyfqCPHsE9dq27tBMFaeS
         MSag==
X-Forwarded-Encrypted: i=1; AKwUvByevDnWhR5BQD37wV5S5OQBW31UzlVk9O4RU/PprOMKR0iFSV1xmkzWEnZLl9iwVht7GipgLT4jFNlOhok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiEoCXZhUoXQViBe8gL8ToQyzn9pHYRJCRhKfTYxXs9MhxnGQb
	U1gWacMswlTP5wRlXecMalXBoK2r3PB/XAL7GNPpKHlH7PpzzVhJOAp9c4xX6R8ATMNSocSRh3n
	LrfG/2+qPT6wKYGw5ObLkaIBllxTdSSFs5E2ulD1SYg==
X-Gm-Gg: AYBFou1O3fkXhGWCGaGQndqiy6fi1VNlVZ/sqMZV41WNuDWZXh9XMfy7f7R04t3/oEF
	ibmwG67GHu1N7JPtWmGEwSCrebN+XvT0ReZlAJMvVFdJyP7z50NF0bqS5Pck5zbNgmeeZR2Ibvx
	6L+aumNOP6Dtkr3DuAd8kHHxndlrikDPIa1/y7oXNN84vZ++9FRSOPQGPNGvFzkX1r1rwG3qjpy
	To8K/2d8E8MdggCL8XnBQ85lBtcrJGmRZMSyurcLXwlCS2vGmc607xxJwfdh02wkd97OX4Ora5P
	xttK8dUqcN4qAK4JHd8YOh71AbgbjAldvsK9nmXbrl44JeezxOSGc9SCYYr02nuTOnmQGUYWmUS
	HGiKYNoA8Ek4Afbwn11qWTeZmeVnMyEAyLJ6+dfYlaKCZUKDkGyC5rcNA9MWRWKJOLzNKheRzbU
	UASIxWtNQ2RywpPNE=
X-Received: by 2002:a17:907:6d29:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c49bdb68d6dmr477795466b.1.1793280836138; Thu, 29 Oct 2026
 06:33:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-biwin-tua-quirk-v2-1-4d71af956ac5@flipper.net> <sashiko-outbox-189185@kernel.org>
In-Reply-To: <sashiko-outbox-189185@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 29 Oct 2026 17:33:42 +0400
X-Gm-Features: AclHuK-InaAZRWkyXXw7fbMZCCfKUR5Fcnop4TxQ9forW4KTFobV-VEqdzfk2_o
Message-ID: <CAKTNdwHeHECQiM=MBew4YE6E0STwPBxyo_QnshASoE7u2z8P1w@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: core: Clear power-on UNIT ATTENTION on BIWIN UFS devices
To: sashiko-reviews@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Bart Van Assche <bvanassche@acm.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
[...]
> [Severity: High]
> Can scsi_test_unit_ready() starve waiting for a request tag when retrying
> writes saturate the queue?
>
> scsi_test_unit_ready() calls scsi_execute_cmd() -> scsi_alloc_request() -=
>
> blk_mq_alloc_request() with flags =3D=3D 0, which waits in blk_mq_get_tag=
() for a
> normal non-reserved tag from bitmap_tags.
>
> When write commands receive a power-on/reset unit attention,
> drivers/scsi/scsi_lib.c:scsi_io_completion_action() requeues them immedia=
tely:
>
>         case ACTION_RETRY:
>                 /* Retry the same command immediately */
>                 __scsi_queue_insert(cmd, SCSI_MLQUEUE_EH_RETRY, false);
>                 break;
>
> In __scsi_queue_insert() -> blk_mq_requeue_request() ->
> __blk_mq_requeue_request() -> blk_mq_put_driver_tag():
>
>         if (rq->tag =3D=3D BLK_MQ_NO_TAG || rq->internal_tag =3D=3D BLK_M=
Q_NO_TAG)
>                 return;
>
>         __blk_mq_put_driver_tag(rq->mq_hctx, rq);
>
> When an I/O scheduler is attached (such as the default mq-deadline on UFS=
,
> where dd_init_sched() sets q->async_depth =3D q->nr_requests so writes ca=
n
> consume all tags in sched_tags->bitmap_tags), __blk_mq_requeue_request()
> releases rq->tag but keeps the scheduler tag (rq->internal_tag) across al=
l
> retries. When no I/O scheduler is configured, blk_mq_limit_depth() impose=
s no
> limit on writes and blk_mq_put_driver_tag() does not release rq->tag on
> requeue because rq->internal_tag =3D=3D BLK_MQ_NO_TAG.
>
> If enough write requests are queued to fill all non-reserved tags across =
a
> reset or runtime resume, won't those writes endlessly fail and requeue wh=
ile
> pinning every tag, blocking scsi_test_unit_ready() in blk_mq_get_tag() un=
til
> a write exceeds the 180s retry window and fails with an I/O error?

Hmm, I've simulated this scenario and it is indeed the case. When a
lot of writes are in-flight at the moment of an injected UFS
error-handler reset, they end up holding every scheduler tag upon
resume, meaning the TUR queues behind them, and the recovery doesn't
happen until after the writes time out with an I/O error (which is
pretty much the original broken behavior this was meant to fix).

Given that, I'm wondering if dealing with this via the UFS devman
interface (as was done in v1) is a better option after all. Bart, what
would you say?

- sd.c looks like a wrong place, because sd never sees resets the UFS
layer does on its own, such as UFS error recovery
- The midlayer (like this version) doesn't seem to work either,
because it only learns about the reset under the host lock, where it
can't issue commands, and queuing them in a process context means they
wait for a tag from the same pool as the offending writes are holding
- The devman path in UFS, on the other hand, knows when UFS does all
of its resets, and has its own reserved tag, so the TUR can go out
inside the reset before LU queues restart (thus no deadlock of the
sorts referenced in edc0596cc04b)

I've run the same test on v1 (TUR through the devman slot): the TUR
went out inside the reset, before ufshcd_err_handler finished, and all
399599 WRITEs in the same window succeeded, with no UNIT ATTENTIONs,
stalls or I/O errors. If we go that way, v3 would be v1 plus setting
lrbp->lun from the request UPIU, as pointed out by Sashiko during the
review of v1.

Best regards,
Alexey
