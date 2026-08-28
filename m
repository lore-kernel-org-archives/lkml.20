Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885F2DC765
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939402; cv=pass; b=SJfZ1Q13sM4OQA+b1jJTSCYfRDVvJjZbTSGqjgr68+ZMf6m5igBkIjS//hnJ8aCyoSgMtQjhaytRRcQOEUBrE8gK+73DR9Z8/2XqGKQk+PopudGTHGeiMNDswLpUNa8estDcWs/EO2qiTHP+Ux39IEnjYLUAAp6nVu8CJTOb0QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939402; c=relaxed/simple;
	bh=LQ3fjEooKPETFdFoQWnDo3gh5Lmoo6R1vHkIQ7xHji4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRq+kU5JvLl16hwjxS4esVM6fkF9+DEQsYQ1x1mBexptGdATJ3G9Kad9BiYKrprIOsGXHwkikU8vx8vGSEUV0FeAEfZFLfPvV+q5dd2m2vOZi3rxb1hBIkHTBoUNDqlhxwHmVN+wNXcm7oEiHLg7hZn+q/yYHz6WPL2Wx8PWr60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DiaVi47i; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DiaVi47i"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so1215107b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787939400; cv=none;
        d=google.com; s=arc-20260327;
        b=Avl5eprwkNTlD4+lEXrQVhynTXNUtQxPs3yihS/Bo7gZ9syy+O4Bk53JzfnxNiUy9B
         Slykmj4ynK39RKDUSGxFAVMne00fLaP1VyLBwZSJ7dtEiCRfdh3PdZkSZVxxEtBa8OLn
         5IQ9UmhvkBGc/nX/JTFK6Q8TDVSH+OIsCqjiHE6TPDk5wcgrDos1/UIeGLcngG1nE4oR
         Ud6ROuTMGWLkYI1dUifEe2DIhQUXSG2JdTsP+T+9Ba/qKhu4kX22VlI80K6M1x5kSlAP
         HGRhawPkCE2qMQ6FIiVQnH0JUEletUsZRm26OkWRoWZjjQuvZDjep3xOgeBDa/DT4/N/
         PS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=caNOEyBkHtDSXs15jKiYwMl0jYwy/fOio1tRTmfPcyQ=;
        fh=vxwEltHqqdrCJ8l+AyN4izDl7mKhRs5WRKK8CIMGrkU=;
        b=NXhV8Gn3Fm+ZxyboYFRd5qHxBolTM+ueRq90jibENc4Ytg2KqVsMjl+aRa8gV9H19r
         8fBklai6HbA+4CuEg6QKob7TFUIpQ51sxX1jgpi9Qr0Xrox0nlB/yskZ4EeQsgoM0WHm
         NW7yw88dnt4TdvLKHuPLqTTYpwVniemDO+jje6vhkqPogqZ9XaRwQfnfFsHcLTf4Bk83
         XUisZS57E4QnCSdmowsbIgL7n1VcWUoXwUB+KkL4AunaY/9/jcQCZCZAML4ChOgh2v3D
         MOFULYyWodR7IuRn5QZFICE5qTaRzZyrB1vVjvT86RVKOqLeqMeTDFZs0THnBKEFYcVl
         LVIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787939400; x=1788544200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=caNOEyBkHtDSXs15jKiYwMl0jYwy/fOio1tRTmfPcyQ=;
        b=DiaVi47iuaIxIr7onVzlILA5JLViLwHqlP08CqzqSJD/j/cHy9VyF8BwxyBxYXc7R9
         iCH67b3MjMhGH6t/gj108IkA5KTJBGPSJlwTaCZQCzj5AwYSQR90c3VdAQzga+VWnLLm
         fEVvweIfFALBmCIUpc87hthmH1VlGHJZAmtbWYlvHXsHmXQdPi9pUOsci3vP2ctAo9gl
         bmll1eFz2ZhjIBG9L2sXGhgoZ2N/D+TM0oHwJqVdA87wMU48upNtos8fsvuYGDSiATp1
         jPoP6LNcystR8cQS7T9To+pX4GyTW2xCsnSTN8cBfrhU8akVQD6uOdQij+Mha5VL2qn0
         MqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939400; x=1788544200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caNOEyBkHtDSXs15jKiYwMl0jYwy/fOio1tRTmfPcyQ=;
        b=etTuvxNpIwfP4Im8yx9KoAN852nbP2AT4MwL9ogtHRbt8hF7aFH/8p6XPle8ufcMQo
         D8qY1rPHaYQJFx2piGUv6pVpyPJZHgQJpSsYVjwWpjGH5dSmE2/MQZeSNUmA3Tv63XOq
         MPyRYTRjn04LRwVYm29dhjHsm6B93iEX/IeHJRhlbCl87XfKzBDRoU2Sg6z+2ltLliee
         gKWAUuFF+tl8lWdTQCgrojtataFgBGNIQGysnYirEfBzkN7KwBBx0GIj72J0Tk79JgLS
         wmd7wTGEQT0Lvq9nBph2UAb2VVWAIPfmAVcke3w7n+J6HalSi1bUO2aVxZ2pEp645OuB
         Qzaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro08vRAtqiqj/RZpka3LJZBBFFWdU7qv6kwAQZ/8g31M4+DjDEs4O1AGDSXFEdid6PsEaDO6p+neYKRb2U=@vger.kernel.org
X-Gm-Message-State: AFuF++mFFqLpRJ4K1zAuSs7q0PqioZUyE2C5CO7DTo8UzlbrpkgcmDkL
	3OeaLdBh9SlQoIi6UDAHaVO1ehs63IGJ54A3DQn6fEDWVsndUTeAiNRnfRP5lSg2XuNy5f5Pcwr
	Q6lh48FCUe+u7hpde5HvcYwfboRRzpc/ddXxBpCFL
X-Gm-Gg: AR+sD10JTPrT9jksMYAx+e13fhk1fHX6Zg5nWinOT/p6KkIkBqpEsstNQVniTcVFbqM
	7quBuyCwg2nil+DAmbwhEZM/8LNd6MAQjct8u0HDuTmUnG4GfIbM+1zXI1EgEbgPaV9g5YFIsV2
	9+7keUIfAgy45GHTXCPifM6vzkMLD8QBNEFHeJpmsDPvjhobIpauv8P/2tXmIHas3Oxo+wE2NyU
	WRrdN9G/HvoCzdJkMqHoq209O4gbUMKN83+MlKIK7gfHcui8UVEfCpVy2TvnsjV7LJbDh8oARA7
	taPYP1zAbu+O5IGXF6LIVbBlNlp1KPBVJtOA5dWDuRXmzEQ6XvnKogGZ885WB621ioACU2nJIp8
	1ZQkWZUi0aFtwVNS77caCUByEs8f8ktAfLrZi4E0cpspRnxvNGRa2QAwlYsT+TFHzlUsIcVldKy
	MIfcIqUGohQJb9cg==
X-Received: by 2002:a05:6a21:a02:b0:3c4:36ef:3dc9 with SMTP id
 adf61e73a8af0-3d26992c505mr19587950637.17.1787939399901; Fri, 28 Aug 2026
 10:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_4AD5738B48FDD2FC84E21FE59338C8DBAA05@qq.com>
In-Reply-To: <tencent_4AD5738B48FDD2FC84E21FE59338C8DBAA05@qq.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 28 Aug 2026 10:49:48 -0700
X-Gm-Features: AcwNN1WiA2DqZa6xhYX9EXD9Vx1_P4xPxzbugNgugTs7I0_MkH5lekI5Z7p3LZE
Message-ID: <CAAVpQUAYOo1hRXD_fFx9oa2bqTV_x17i7Y=vajcx1knYNLjdsQ@mail.gmail.com>
Subject: Re: [PATCH net] net: unix: reject negative max_dgram_qlen values
To: Yingjie Wang <1075151112@qq.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:10=E2=80=AFPM Yingjie Wang <1075151112@qq.com> w=
rote:
>
> net.unix.max_dgram_qlen is documented as the maximum length of an AF_UNIX
> datagram socket receive queue. Its sysctl entry accepts a signed integer.
> The configured value is copied to sock::sk_max_ack_backlog, which is u32,
> when a UNIX socket is created.
>
> As a result, writing -1 is accepted and reads back as -1, but newly creat=
ed
> sockets receive UINT_MAX as their datagram queue limit.

I'm not sure if this was intended, but passing -1 for sk_max_ack_backlog
is known hacky config to get max, see __sys_listen_socket().


> A nonblocking
> sender can therefore enqueue past the configured finite limit instead of
> receiving EAGAIN.
>
> Use proc_dointvec_minmax

At least, this effectively limits the upper bound to half,
sk_buff_head.qlen is also u32.


> with a zero lower bound, rejecting negative input
> while preserving the existing nonnegative range and the zero-value
> behavior.
>
> The issue was reproduced on 6.12.80 and 6.12.105. With
> max_dgram_qlen=3D10, an unprivileged local workload sent 11 of 16 datagra=
ms
> before EAGAIN. With max_dgram_qlen=3D-1, all 16 sends succeeded. After th=
is
> change, writing -1 fails with EINVAL, while the 10 and zero-value control=
s
> retain their prior behavior.
>
> Signed-off-by: Yingjie Wang <1075151112@qq.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> ---
>  net/unix/sysctl_net_unix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/unix/sysctl_net_unix.c b/net/unix/sysctl_net_unix.c
> index 47660d5..2782095 100644
> --- a/net/unix/sysctl_net_unix.c
> +++ b/net/unix/sysctl_net_unix.c
> @@ -19,7 +19,8 @@ static const struct ctl_table unix_table[] =3D {
>                 .data           =3D &init_net.unx.sysctl_max_dgram_qlen,
>                 .maxlen         =3D sizeof(int),
>                 .mode           =3D 0644,
> -               .proc_handler   =3D proc_dointvec
> +               .proc_handler   =3D proc_dointvec_minmax,
> +               .extra1         =3D SYSCTL_ZERO,
>         },
>  };
>
> --
> 2.43.0
>
