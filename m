Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E0F4F7CCC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167620; cv=pass; b=t4MAMPRWGw0AzeWpJBYE6q9yddQ2qJDbpnruw006tlRVtTocXUnb7kVmz8dXE9uhJeO3J1HsxE89gec5p8BRpKXozZdfAmusxGhL/bukwYRcjyLFmvivy4G88sLhfuYj/260HNzolyQtlhBAOYUwvSM87DLtNGNdmYLzipM4a9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167620; c=relaxed/simple;
	bh=dEEJDO6upsApIlynAXY0pxgK3Zhhec2ID4o/+nkiUwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLDVEiGQt2kmjxC3PcNgTqvKXAOx+r2fhXnl0sF8N0YDQA/FpXs9vk0AKkDBtozf+1tn5gg7z+h0SCt/xYzBk2EDuCtHA6LrD4pCWMNeZUYbDcOa5dJJvoHO9/e+p+z91veYDYqE+E+Sm0qOFRcXKtyGCKdC3Zqo2IsYH1INO4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GrvBr/uR; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GrvBr/uR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bce4e278baso204545e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792167610; cv=none;
        d=google.com; s=arc-20260327;
        b=jcJSRsHDaHXW8QfD61roGaiTuGPABqaTl0Yx45UXZUErL9ivI0vu07RBRhhbGCb3um
         De6dpQLHrB3Xoc9M4ekGALhfSPrdZZgXMbN4iX7Ev7RYwMku5dXTgvW6RkChP2ykjW+d
         bLDbpYfYjqC3yklv7qrYB3P+n7wgVpUgrPO+Jwen0mzOz46G6EaLrCOH/a4A6/lyXQtt
         5wgZ5LAf+W/BEmGTkZiRtWLfMEUD/pDggYpQrlYPJdMP3LfwaWib6iNHLFBaIrW345px
         HyaUa9h9td9XUG20usZgwHp4t3oqFIJ87AXKGpJYEpvlWvHxBWKhUQTXvShJwfQBKrhf
         MMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=POqCnkGfFNrRq4TGpvHNnBx0NSfDfSdKzp7qlGWA5Pg=;
        fh=rTegZYQw5WJ7WPjpno245A1anP+ThUmHnuc6MC2swWg=;
        b=so0L2cbp9PAEm7bbXxkz8k1D0tOcmKDyzzpLZiaDdNnQZUW+xMXYFjlHQSOh9Dndw4
         IT2z3Q+V2Zqir9u3R+GdHohsu31SfX3Zte2mKQ+aUU8WFVigW2yv6lo8TLJ8J9lBRnfk
         C2yF1x0eufGQon3fDBCfrZjOAr/e6xYRuvzOtHTI1TTXOJo9xGKkB15KQGWhj0e57mc1
         VnPxSJQmc4HNGfvJGca0mQbD9iL0p0VCIaSe+CUhhUdZXQ2d75PJTYaCTy8eJ36pw7pw
         8I2h3QLs1Fsc5ynnY5yGxeZw0hf+8ji2AgCya31KEf+vCoOEyrr67HIm3ZzGP7sq/n6z
         uoOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792167610; x=1792772410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=POqCnkGfFNrRq4TGpvHNnBx0NSfDfSdKzp7qlGWA5Pg=;
        b=GrvBr/uRiS5pyKICRHS58RSM7jceqVwgF16pWS3MQ0BcbicEZSka5aKFf+vomrxRyG
         KRHRYvQHbtqgeA7tX1ClJMKsL2NyekusLyAO3Oa9Z2s3EiKUwabSYLFhZin8c8R8Jdh2
         LsUQDzwm+MV5BcSyXDEL1inD7uVGLPdU8FBiKYtDu2HLrpEfsEjIGkNAFNd6BpdzQGAf
         l6qPIOM6tUnzgJU4RQJayEIdV+xlZPd2xHp48mOqPIW9wt1Bwa26M5KxGa2cqaLjnOlZ
         j458TUGGH9hiWZtflVcRClrI1IcdrXXcYNV/chi80r7ib8xT1q7SRZafhZ1cU3d+62uA
         izog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167610; x=1792772410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POqCnkGfFNrRq4TGpvHNnBx0NSfDfSdKzp7qlGWA5Pg=;
        b=vwg7pOBkTDp/MlHTycd6Ct2CBJnIhRbqwxcpd8KLz/TasHN9FDpaxSV1vZcrIeIBks
         G1zFyUZzrII37OoCbZC28ozPFpjeHUYTyCUjBOf970adDQtyJb6NTQ++JjbErspJm9un
         tTCWC+Z9tYQeoWwWLH2U0MC4eXsVbwIpbMw4NhyhsI+Ba2Zb/nGvjT16gyGrkDvXeI6H
         6ky+ySQrAgKGa3Zn2gkldfsJ5c2uel4qVMuyFh6N2p4fxZ3bjowhYZsMK7NOunYVbRB9
         sRK89vKiI38d0d9owYFpkc7Nc9c5uTjNCvjsXcL6j6bzTMJMJUbvTwwtVZ5v+JYZoCJN
         /c3w==
X-Gm-Message-State: AFq9FYKKiT3HigrFSctgWtWdC1Pw0axx0ZUZw3+gTaCIIr1xgeovl8NG
	t9gzeMD5+u9Z9ddMtEw8oCpvlAC/6fH5g/GuavO/fVLCBMbzQigGLS0+dnw4LsHQjBah4DLzTCv
	osgi6ewf9bJZrs+xc7Cdqb5jZEnJcHDzMzrAP3TQVBA==
X-Gm-Gg: AYBFou0jNLcfKS9PoyrGC7WX4jW3gOitEOuW1f5i13Pwcxczp268Tsoht8eLP9ixvFD
	bV17Ei3H1zumCM4tN0mJ05nPKOrEn+GnMAbIP27luNalfB98eOHnZ8iqedLvCOs3b7a4qX3EOep
	1b4ZgpkM9j6hGz8tRhZ7qDtinErttzxheauBR9Ihyru5IAUVJwPVyLcuZbdSo2USVkVJIlrGQsc
	MeyC9n8p23zuVcdBr3C0vMFY/Tqire4mnjoNZ8x0lg75wlnUEz2znD3dDzsJHzFT8UnaprvhrE6
	mA6klGmy9OFdXlDDNn+pzX2KKbMBNNkxuDm1hA/RX6EmTAQBEVDHN44xONv/3FPZRwKDxKqdG0X
	ZZ2gDr7yepJVS
X-Received: by 2002:a05:6512:110b:b0:5b8:e8ba:d15 with SMTP id
 2adb3069b0e04-5be50a7cb4dmr16162e87.27.1792167609933; Fri, 16 Oct 2026
 09:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015140148.231126-1-marco.crivellari@suse.com>
 <20261015140148.231126-2-marco.crivellari@suse.com> <atI8hifJ8K4BAIPg@gmail.com>
 <CAAofZF43y3_R-0rifCPkxydJ9SH9rWFHyWE3o86Aka_BLDU-DQ@mail.gmail.com>
In-Reply-To: <CAAofZF43y3_R-0rifCPkxydJ9SH9rWFHyWE3o86Aka_BLDU-DQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 16 Oct 2026 18:19:58 +0200
X-Gm-Features: AclHuK_eExq-7QQMPcYU6OgwCQGmTZGxr7JirKVsmj0IKCW2212yh1JHILnEGlc
Message-ID: <CAAofZF5vbNgtqPAsD0a5CcHJhyrKjX8OeQWn26ao7m0Od+3J_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by default
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:18=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> On Fri, Oct 16, 2026 at 5:54=E2=80=AFPM Breno Leitao <leitao@debian.org> =
wrote:
> > [...]
> > > @@ -5895,12 +5895,33 @@ static struct workqueue_struct *__alloc_workq=
ueue(const char *fmt,
> > >       struct workqueue_struct *wq;
> > >       size_t wq_size;
> > >       int name_len;
> > > +     bool wq_unbound_by_default =3D false;
> > > +     bool wq_dropped_percpu =3D false;
> >
> > Nit: I think these declarations would look better in reverse xmas tree
> > order. I know Tejun doesn't feel strongly about it, so it's just a nit.
> >
> > --breno
>
> Cool, thanks for the hint, I will change this along with the removal
> of pr_warn_once().
>

Oh wait: only one of the bool, the other is going away with the
removal of the pr_warn_once().

--=20

Marco Crivellari

SUSE Labs
