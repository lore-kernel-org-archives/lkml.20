Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793614098;
	b=q7jjdLwnU6BjSooUcKLRLXRpTUojHNC/ZJME6vtREre/V0lsa0Vi+rB4Wjuv7LZvLBPW
	 nV4XjTIVaT1phlfEnTPCKVfhS8mUk/r5IqmS/j6aE44SWMdXPtfDYkn0og/ipV1Ye5Xbq
	 wh+QSrJ36JVqueOOlmO6NLQyFJRFZzc/HFxgmqbtBrdRSl2yVdkq9aSV1MK5ydtlAsYkG
	 NAn/vym87Qo81Nj73bgF0eGS1/+e0IZIMr8q22s3d/Rxb0wcz/EggzCBB2IhyVzt17yRv
	 ZZSrZTxaTqJFWXvcFB58YNieqqHiMzv4wzJqT9EUhN5eWDF0Z30txRl+yyowUsLFmVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wjdX9vjSkHROmqfsKSKqGYi8+XO+tioACNXCf5IEahg=;
	b=BPXM8marSDCj7MsKWbSdGGmKrR/KxcQrCK3EorrHFVbjQrNB8ZxviaKaULCv4ds0RypV
	 UZ+sx70tR7nQkbEdiIzYvfW0qMCnQ/LnwKShCGdegjex7kDf5XADIy0ZLb0vF9LKTw5FH
	 ERh/US5CnxPRH/Ue6C9IBgsa2JdlgyLvyO8TEQD7XwxCABn/4BTQ21yAl9JQ+XD2P0jvA
	 XtYlLYg/kejwM1aWoWJMXBnUdPj3X2esn3AuGLeCIaAm10SJRAmPCznbMO85kROejrAZr
	 tVymDcmthfqgnp3derD1kWebgpRjZvTZfV+LPIC6TL6pDo0zwz7TdUMmcAY4x1aVXNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JA8H98Wr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD93606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD93606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JA8H98Wr
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2438456d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793614097; cv=none;
        d=google.com; s=arc-20260327;
        b=DHPepTXExlxukHWG1yZTPhh057dhMl3l1LssXzsN65XzGQ4+MIAKn5Da+LFgvScRSI
         NirQGjRRjgZajEMtof0qKrM5NFwW6nFyazpgSsvzDyLJZ7LUpOm/Z3FHYiaWYBdxdAR9
         gO39TDHesULN0qXyn+ZED1DHETkRKpJL+pIE3Eg+xF2UVsdV8QiPHxvCGM9cWUGDzj+D
         9qLBU0Gjf1zoZbBgaXbR3Cpc/EBUQMbvOORyczxhvdCclw51R3KaooPwHVurOo8EVRHs
         kJMhN/FO+NyNTxiM9yVEbZY6oZvYrOnKPRHJJwCgEzhNVY6e4ngGo3R/Ml9Zgw4G5Xki
         Ti2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wjdX9vjSkHROmqfsKSKqGYi8+XO+tioACNXCf5IEahg=;
        fh=S1mkSaT0I4F5BgrE+WPiPv9c0mxRuk+DZ4pplsxEUU0=;
        b=JYNSm1IFJ1N236DijkuPNf31bUv6OByeiOb2jNIoPbDCuLPikKcVJZEfPpkURC+pdv
         WXky3IrR8a+JweVJFQpk2bePcS321WILMc+y3gutL2rbVJkMj5+94b6JYbVFWVh/+5y+
         OeNU5n6U68GKXK4H9E7eSV4+zCKMR7JuPguDVe3m1SkQ4ggGSmBSWpgCYLNyY779dc0o
         uMpy0aU6y/9aa72DT10QymmaJe8EJ21XM33Ml/CXV2fXx/Vi+yeODz1Gqv1GfevBxPhW
         hEj9EbJm8D8OWiMmmlQEbIYgnLOH0v4XvXTl7CcBx8/Al4SaBmjhgZqNyjyrqHDrtogY
         NUFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614097; x=1794218897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjdX9vjSkHROmqfsKSKqGYi8+XO+tioACNXCf5IEahg=;
        b=JA8H98WrxbjorH6fYzNlpwEnkRdhQP78BDVAampLqxnP18Mi6TFaP3r8pDXLYzayuV
         IzeR8POsWALnuR3XXhVpJwWzkP10lwcmKF4EOuIBgPE57n56qSoi15c+jKmufdjg5JL0
         2dJKVdOppcgpGuMRa1S0+JOKiMS7GN6mE5+f2bSkv1EFR5wTN0WOB1bi7/YvKD8v0A7m
         YtW9yL4mB4JcX2a6ROGUSkw8diE4HyG+Oo01BH0Jvr9spQI2uUS94x5onQ9B7pGFgz6R
         hQcJm4dcsS4m2LQLE0LAjdWhLsQBLnuz1e8TZSPPMw6SkGPqhWmOeNY1AlZscvTVBg6i
         EXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614097; x=1794218897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjdX9vjSkHROmqfsKSKqGYi8+XO+tioACNXCf5IEahg=;
        b=c2+3HxKy3wtugI2b9rJaf1gHMpHkmh8YKEBJFsU57BBGJ6CMBFCaV+A6T/EJuJPvXp
         cne5t6sZKG5o7vdH2bHa5I7GBrLUq3tmDCRTMMVtuluhEaDeWsUqyAn9CLl1JJtCqR89
         rX0m1ir01eoMmrV7449w/BFK9uwd9ltQNaPlV/+jLY8o7j4H3rploaWWM+/rNsuw6jsr
         qOY33y4FU6uMT46ht073g9aPH7faeqMaa8T+dmT84edN7MM4sO9hxuRatixYPTBFcnFG
         T4LERoQwb4ifSQgKryt/FFkOcokUVqQxs3ax/u/KYKoPR83UHOjMVAaqbylIy5XpEIZM
         W+8A==
X-Forwarded-Encrypted: i=1; AKwUvBygQ8PNk/T8/c/OLxy6HXahQuJHlWsusDtcu83gnvKRsAukdhShWuCEfw/FfQAJV8C2s90sodcMREq333k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dP0NscsayhMFXWL/ARPRMO1QoNNUFTeKWwI2sZlo3EyibB0NX
	hzQwRkn0nTS+sD+gtX1+ixrqKGWQbS2HxjjkGEb94lQHBkvHvZpwkkniMnTqXYsrMmmVvdGgBIc
	2iYf7gAbWLjgH8YyNxIFLfPpEp8NZJ9c=
X-Gm-Gg: AYBFou3mkP2b+BL2fvr8aH7SXostRV4rMI72tBEYxTjLVj7Q+wR+8keC0+miUWaAlCj
	E90sbDz+sQ29ILc9SWhywH400ccV8A/f8Xa9WtlVsQVhiaxTS5U9851meDs1wvqggZCuijdPv07
	mgrUuabDdN1HP4sdl+Rt0CKoXqHJltdtmT1IkkJB/CDRSl7XA2WI2NCjd9MzIbuDjiZImCLCo3Q
	GKTCwhOwcSPNCIybuS72YotsH/gAkCnhGP8BH6qBn+wr0k64nPBX/18eUVTvSQyQNIHQUbSR9Rr
	2d2YKHxCzoCxTQiCRTv6biwpso7diVSdGNbauC3svqNlmk69/2I32FCwccV1gLhLZlZJrhra/7C
	lRl7QhI1LyDHF5rtic39GAnHwcpj/eJ+SHtd3DKGTeCR8wMfk4ojjU+t3yBZuM6NPJCPQYLDyT7
	NNBw3LO0AmUe0IXdTk6K8bMPOdhRZyCrIT6IYcZGxJfScwQNZ+zkLyPEC1jVkP68zO22gXvT/Jz
	CGGomcDIDg=
X-Received: by 2002:a05:690e:12cc:b0:679:b2ba:3cb4 with SMTP id
 956f58d0204a3-67ba503171cmr5496564d50.59.1793614096717; Mon, 02 Nov 2026
 02:08:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101105615.20253-1-kartikey406@gmail.com> <577128ea-4d44-45cd-8b3e-5f103e530d98@linux.dev>
In-Reply-To: <577128ea-4d44-45cd-8b3e-5f103e530d98@linux.dev>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 2 Nov 2026 15:38:05 +0530
X-Gm-Features: AclHuK_qPDvsdMb9b1bWcQf48bDpbIfluE3IgFGIXnQRQWbM2y9h1fsbTWibNzM
Message-ID: <CADhLXY6WuOVmZLkgffcy2yd5tuOBPKYm38mhBFy4LRTQ89ZDuQ@mail.gmail.com>
Subject: Re: [PATCH] RDMA/cma: Don't warn when device removal races with rdma_resolve_addr()
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: jgg@ziepe.ca, leon@kernel.org, metze@samba.org, stfrench@microsoft.com, 
	xiongweimin@kylinos.cn, ammrat13@gmail.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:56=E2=80=AFAM Zhu Yanjun <yanjun.zhu@linux.dev> wr=
ote:
>
>
> =E5=9C=A8 2026/11/1 2:56, Deepanshu Kartikey =E5=86=99=E9=81=93:
> > rdma_resolve_addr() on an unbound ID (RDMA_CM_IDLE) first binds it with
> > cma_bind_addr() and then moves it from RDMA_CM_ADDR_BOUND to
> > RDMA_CM_ADDR_QUERY with a second cma_comp_exch(). These are two
> > separate steps. Once the ID is bound it is attached to the device, so
> > cma_send_device_removal_put() can find it and set RDMA_CM_DEVICE_REMOVA=
L
> > before the second step runs. The exchange then fails and hits the
> > WARN_ON() added by the commit below.
> >
> > syzbot triggers this with RDS over rxe, where rds_connect_worker()
> > calls rdma_resolve_addr() while the rxe device is being deleted:
> >
> >    WARNING: drivers/infiniband/core/cma.c:4120 at resolve_prepare_src
> >    Call Trace:
> >     rdma_resolve_addr
> >     rds_ib_conn_path_connect
> >     rds_connect_worker
> >
> > This is a valid race and not a kernel bug. If removal wins before the
> > bind, cma_bind_addr() already fails and the error is returned to the
> > caller, and err_state in the same function already ignores a failed
> > state exchange. The caller gets -EINVAL, and RDS destroys the ID on any
> > error from rdma_resolve_addr(), so nothing is leaked.
> >
> > Drop the WARN_ON() and keep returning -EINVAL, and document in a commen=
t
> > that the state may change because of device removal.
>
> Resend this becase some error occurred.
>
> For this specific case, we can consider this behavior expected rather
> than an error and remove the WARN_ON().
>
> However, I'm not sure whether the WARN_ON() is still necessary for other
> test cases.
>

Hi Yanjun,

Thanks for the review. After cma_bind_addr() succeeds the state is
ADDR_BOUND, and the only legitimate change before the second exchange is
device removal (cma_send_device_removal_put() sets DEVICE_REMOVAL under
id_priv->lock without comparing the old state). The other ways to fail
are ULP misuse (a concurrent destroy or a concurrent call on the same
ID), and those still get -EINVAL returned to the caller, as before.
Only the stack trace is dropped.

I can send a v2 that adds a comment explaining the race, and keeps the
WARN_ON() for states other than DEVICE_REMOVAL if you or the
maintainers prefer. Please let me know.

Thanks,
Deepanshu
