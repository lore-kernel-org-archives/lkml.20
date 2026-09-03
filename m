Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6F3F6C2F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446226; cv=pass; b=JN3Q6LGcT8LcaZRvl3iKG649AAdFNAZeS420WPQi1AC/RXPBBWO8SUft52hoGL/z7mRpWKLp+rHksXv+0JP6eJ3EXKrkpfVaYVZkwMQZvRtI9RB847qSn4CeotiE+NOPiYqV1t9E8XTIEgeSTwcp2I079o4c953AXRCRw50lQCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446226; c=relaxed/simple;
	bh=vZbQXvmGyW1/UKrE0sFXKT2KNHALtKdLQAjyI+9b7Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VT6lqeQ13E4DDgEtbstMhv3+IaiwRH/q+hlQkqBMXvAzrpQLerADAzxmjwGskQfv1zCMj5EvcLLte/BEsy0vG3gYf7oLG4BNCjGVCGpvUtJCAs3jtSEcFM0u/YqhFBjuhqAF2DYZhO/Fp5F+Xo0ig10npJD3RjUGnRfPCDP3KHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LpR/ajEN; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LpR/ajEN"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52ff7e275e0so22897761cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788446220; cv=none;
        d=google.com; s=arc-20260327;
        b=AkpnbhMGWz9UnwNLSr32K0wjsLy0MQ07vLmQxirOwOro2qR9JfzzbBLRIzuYyJQI1P
         6h8VEaxrlPBkW/7PjRi/gQHpDdX1/HtUMdW2qG+fg2LjyxoRRLfUPfyp0vcwUIYmCa5E
         EutxKjzW24JIyac94gSGr2yr6NOLx4KS20bm3JVYLc8RMabUNAC73bab00K1LymlqfYb
         p90ElET/MNDECChQfkktGusKxWu0q/0SraQLDFyZU3KhkkLD5pLDOFFP3Tt7Ze9ujZ+A
         226c2QznYWk0CmqrNqF8/ET9FnfH4AAHyc2PiusTIvtOVKGeJE0xGE59eJGTX9R+RYdW
         a5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=La57paUsnYX53CumeykdWBf/0oLfULFm4zC/h1xvH1E=;
        fh=uCvrfbci1SghyKE38488o6LW64LUuepQco1WADgL+kc=;
        b=LggVd8i3vVuBvmN8FNZpklTm4XK8fpc1I3RasjkDvSsTdtkAX3YRhUJfYJOhNQ73yo
         85ZhKNF31O3Z/RQS8fZtvMBxIfMwozDgyifgZNlijUjAqTyZ7mxfqc6vTrldolZoYWNr
         6O6TGTPzc5Z59rqpReNOrV41xg0eQhCO9KX9eMo5rxo8vDkqx6PnX0lpuTB87eQmXE1s
         Sn3C+wqXXJ7eB4iBcqMYPp1iZ28JalyBeO9gVRizT8VyCbOMp3Mt14YjkD9ebYAlOp8r
         NnigsqHijuX63xgzXseG7LTQsObUfnho5cblupBA4gtMAbW1MOBMU4BNGU6eg1qQcz0c
         2mGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788446220; x=1789051020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La57paUsnYX53CumeykdWBf/0oLfULFm4zC/h1xvH1E=;
        b=LpR/ajENLlQorezm6bGmW17rCiyMCFOR00SDaYQLOtJ67egMIBpb1DLC7EQHMvKQI0
         aNhJ7Z5m68YtRfIRGpgvPFSLHRobZxuQWyk4NRiSL9A4+h87uFdOxAsdF9d/BDjy3XAr
         WGdJN7Zsi05wZ+/zqmJUUsZRsqlgDuhBN9SKKZMPZp/E2g+qjxyXv4TzFBJTVsPJUZsp
         mcGihEsHywM8wPYZ/ZRrRBkhRcgiENah5+ZkP7TU+IdLbEcV1lXxaW9hqH1RsFRkmbrB
         H5wykIaJnLPUfiIGmQA1WJo7CS/JgiwzKreXSMNrwU8eJ9zVkHgftwIFOP7tkBhP23Mq
         elbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446220; x=1789051020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La57paUsnYX53CumeykdWBf/0oLfULFm4zC/h1xvH1E=;
        b=PKxVJTe9vjRrMf3Lgzv3tAVPEfVPgGWlcdPB8kbtzcsTxZNkCjdiMKLhR9/SLgEqMF
         xRRs2rxB7z7aAcm+5RzQzbo4UV4QRMIySiQjLOZOm1qtbVftD+w4Ug8/1AjqXs5OD+qZ
         UU9pd5hpe3oatUp4R/h8pC6USfXBZVVK3pxZb1lzIZiNuXd733hsQryTPukj1ghALsG3
         fKPXy1rNt6LPNOuouppfafwIqCOLcHEem5J/cuOuLYFYF2kPZ8EKrSno3QtStVGzMbwa
         wWQ7hfSl2f+s3Yn5vjQQx8EJFnAViRTBZJqhKE/sjfJ9SXzKA5gTirNc2DdmYEysTktH
         DjfA==
X-Forwarded-Encrypted: i=1; AKwUvBxn9Uu2oDAf38wV8OxgIE9zf3qVCbMiIf1M77oJ5BwmBSFDV7ug4sV3cSV1Mu5K0OjWzn0dOGGsvC1ufko=@vger.kernel.org
X-Gm-Message-State: AFuF++nUK8vSasjzAR4aSTFaOFPZQR3m/VqHUUT4VSSrdfjmjsdhyxOh
	kpQWg+HZuekTkXqLuy/jvQS8bjLAp/ms+i1/qHTrrN8mbHzneFLKQRpDHS1O2O91O+bPUt/riUT
	+RQ/38yvvCNlW6O9k6m2Ya8CR1w+uTzBmPlVNmfXV
X-Gm-Gg: AYBFou06Ewdlj7RqYMGq6vnP3Ipd0hYLcTCoZ/eTIjSB8IhOYxuWrpQB1PSLpSfbUFS
	kjOPuMZEsnaKqRhpXhMQg54X0BExDm/qkmMIFU95j6RddkgBJEa5r2bRirJSKYfMUv1UTOs3qv4
	Oh1PKIM0TsCqZfhcu5VEZOoMOBY0fG4mmf5qMkvMCaJeWJ6uPnnpnne7lKXAK/KK2rZs4TyDK/J
	wSoGZxHPgdgDZjtkO0SdtYEWEV9eG2oZucFlKHcCXrhTZJYuX2DPH97qGBxxmYSq7tB5HwOilBm
	Gx8hBCUBDgJDABIzJgDJt5ITKoB+bhKpJ4Og8h8feLpnv29uD9Sz4DfrMM+xXnDt8gjYNQHjI7g
	K004nwoVPmjHqazlywVWsKL3EknPsvhTrl77nI6Gc/5+w/4wlTTYzGA7ncA==
X-Received: by 2002:a05:622a:1391:b0:530:42e4:f281 with SMTP id
 d75a77b69052e-53042e4f99amr78832371cf.42.1788446219727; Thu, 03 Sep 2026
 07:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903141204.40934-1-yilinzhang@moonshot.ai>
In-Reply-To: <20260903141204.40934-1-yilinzhang@moonshot.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 16:36:48 +0200
X-Gm-Features: AcwNN1XeB6M7fHc8_CMFwS-rDmM8_s4w0a_8KKsMOJLsJdLcokW0Xwm7DJ_4Mfw
Message-ID: <CANn89i+8uLsaq91utS5d_W9ufUP-DC0-j=PRctwQFMTMZ_0FuQ@mail.gmail.com>
Subject: Re: [PATCH] inet: frags: invalidate queues before flushing them
To: Yilin Zhang <yilinzhang@moonshot.ai>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kimi Security Team <bug-report@moonshot.ai>, Weiming Shi <shiweiming@moonshot.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:12=E2=80=AFPM Yilin Zhang <yilinzhang@moonshot.ai>=
 wrote:
>
> fqdir_pre_exit() flushes the skbs from incomplete queues without
> changing their completion state. A fragment which found a queue before
> high_thresh was cleared can then acquire the queue lock and reuse stale
> reassembly metadata.
>
> For IPv6, this can make ip6_frag_reasm() use the old nhoffset with a
> new skb and access memory out of bounds. The resulting heap corruption
> can be leveraged for local privilege escalation when unprivileged
> network namespaces are available.
>
> Kill each queue before flushing it in fqdir_pre_exit(). This marks the
> queue complete and releases any timer reference removed by
> inet_frag_kill(), while leaving the hash reference for the asynchronous
> fqdir teardown. In-flight fragments consequently take the existing
> complete-queue drop path without changing the reusable-queue semantics
> of inet_frag_queue_flush().
>

> Fixes: 006a5035b495 ("inet: frags: flush pending skbs in fqdir_pre_exit()=
")
> Cc: stable@vger.kernel.org
> Reported-by: Kimi Security Team <bug-report@moonshot.ai>
> Tested-by: Weiming Shi <shiweiming@moonshot.ai>
> Signed-off-by: Yilin Zhang <yilinzhang@moonshot.ai>
> ---
>  net/ipv4/inet_fragment.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
> --- a/net/ipv4/inet_fragment.c
> +++ b/net/ipv4/inet_fragment.c
> @@ -235,15 +235,22 @@ void fqdir_pre_exit(struct fqdir *fqdir)
>         rhashtable_walk_start(&hti);
>
>         while ((fq =3D rhashtable_walk_next(&hti))) {
> +               int refs =3D 0;
> +
>                 if (IS_ERR(fq)) {
>                         if (PTR_ERR(fq) !=3D -EAGAIN)
>                                 break;
>                         continue;
>                 }
>                 spin_lock_bh(&fq->lock);
> -               if (!(fq->flags & INET_FRAG_COMPLETE))
> +               if (!(fq->flags & INET_FRAG_COMPLETE)) {
> +                       inet_frag_kill(fq, &refs);
> +               }

OK, but remove the braces as they are not needed per kernel coding style.

if (!(fq->flags & INET_FRAG_COMPLETE))
        inet_frag_kill(fq, &refs);

Reviewed-by: Eric Dumazet <edumazet@google.com>

Please wait ~24 hours before sending a new version, so that other
reviewers can chime in.

Thanks.
