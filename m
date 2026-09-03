Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30704AE108
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445576; cv=pass; b=dmGLlqSDZfl4W72H8voBdwWEhMMcwXuLKHMfVWkqPK6V9aJV2AZXnbFyul9OGu63sCwrMjdioR9C1FEJrWhHoi7UVZdpT+kMTpKzb0qhws0Y3BOaYkeP7UVU/uM1zfsaDOwYHKRlWjXP7+hUTc04P0eDH+waCtnR3dE602fpwGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445576; c=relaxed/simple;
	bh=AkoSVahsG/XB7G6s+Z9HJxaQQ7ISAP+LdDS1W8kcDDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR+KM5YMlFTiTujnorulBPM5ZBDtKPMhP1Jr7NyfFA3uFCD+1LVabDIwNHloqomfXY3xRulSWoiEw2AYTo7NNdHTRf9M//tp+6NFPaZZxyrhIX95WNwuZRaI3PwvyGaPzb5ChvqHXzEXohuKNL4VPW/wmDbpBHR36l11F0ORXzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=af+rHkS3; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="af+rHkS3"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f3ff92cf4aso2747551a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788445553; cv=none;
        d=google.com; s=arc-20260327;
        b=DJ2agLm0cZXuMBwbRpytqo4n8SNLcKWO4ocYvPYqGd79st0qrMCCGLOS4uEW9dDxp7
         P96JkU/nlFAP5YHJjF7R3n4Ad0ihZSdSuJ5eLXgacfg9BuPZdqTFhFxuPES338N2wupk
         Zgf3jNRounysan553Evkqnp0MQB2jGjTxK7QVUpmOFJcGNi4lpDSFepk2a40XbljLmQy
         sxtEakwASA0kMHJyfBuoJ3yRo0e+fwZCHE43X+jwq4WN3f42Ia3n22ui6Z3e+zrrxp0K
         X2u+hcBybp9VXdKOWa3IgRb6Hk66y+JccsVikmngylWrCScVDLZCqFE4jNIiaNXm0DM8
         kaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZnZz8IAxs2JFszciywmbc6VVqlV+5qRJQ2UhF2WNa0=;
        fh=6BwDTX4H4HyKQcJYTs2MhrboJJ5IvMDLon1+VK+OH1I=;
        b=jt6Ifu3utoW3rOk+xup0ShKMCImEFkrXh4k79eJJfa0ja0QzWfeL8RUXjVxwsVmdZN
         tMnrV3bn8xht+UCYk4Xy+8OFOZAuuj4rRWtT0S5w55pThxuZkCG2lNnV9UEjr7sj4y0Q
         jD/+z3NdU9gxXHz67WZwpu692QQfxE2YkIq+Z7gSx1qzK10EiD+pfs9ngnPzpOTbg1ry
         +Ul4Crl0cTGT+Z6mR3K+/9q7oS5k0TwIJoPs8iBVOezUvubjdzQZEvJrvl0hlgWA/Z1Y
         AoZgn1ozrAdgy/jO0h8N2a+/rDJWrKWIwXGKRb1uYpIEdeyuNE+Z9jdDJ8mCqRa8jd6K
         3pNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788445553; x=1789050353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZnZz8IAxs2JFszciywmbc6VVqlV+5qRJQ2UhF2WNa0=;
        b=af+rHkS3L9Mw7JI4ecn8VYqnrIB3DAF6Ikuw9JLpI6ZvX8MxcnvuSWUcCiGMvSZNQP
         i0GNlQ+VHY8YHL4/QwNdj0ZKjHHB/FrHbvfV3XnSLmAzMaU98KrmpI+jVialX8byL3K0
         AyIPquHbKF7kijp50QCBD4aYJ5xYVRPCxubvF7TAlxhBY/mRnUjFN3vGfM18NchUqdnb
         lD827OzA7DqKgb3ujMp2DNAd+ByLXGDZvD65YSiGVAsdt/uvUee5iGsRdNPXD0BhezUn
         9OIWyOnqX/BHyp0rX/2QCp4f46ozeMZiqj6NWlVy49MriC9GUXkeRXByrpx8Tf8j0wza
         gpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445553; x=1789050353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZnZz8IAxs2JFszciywmbc6VVqlV+5qRJQ2UhF2WNa0=;
        b=hhv+6ZhL4eSD2xTf0ExGuFtomrHjUn8Rh7kImx3ptiJbppgo2d+bf6pVMIbR55PGG9
         Zb+p9UrGHrt4wZxKa5CZPs7RGh4Qb10R68+fNodKZRjOvtuDwiP9E1DWLD9rAGZzDdpg
         XUhMq1siEkP0DTSJ4OBX0CESMGgDDhl1x+7nD3Fs26BVevS2kmS9UcKu+ba5Vth0gAd2
         mJnt0k0t9nygkap9IrSVQOmdhSgYCBAsLFpzAt4Cdnht9sYfVrDDw2qbDSZkyOf56D1G
         oC2HNWa7vXZ1vBolXOvJbANb37EfG6ECu54aSSsC4Y8wdT32AokOu6cjHYDWPNU94dQ2
         /eig==
X-Forwarded-Encrypted: i=1; AKwUvBzsv2cHTJ/nvCZ7Oc/xrRprxpkBpUfZCLnjs7ZygIsa+NnralLoe5rEjfGb14D145jpcME+cSk2muD8dSA=@vger.kernel.org
X-Gm-Message-State: AFuF++kh1ZDmd3gm8TXagw2tvSDC6Dxa/EDX+dPsxcIB70c9Oyc+L30D
	ofD8kcf4vaT4bYVdVqROs02521nfLRnLO0VY9g48vB0KIDmb2uMdOFfAzYZOBsNLpZVNVzUrN1D
	efa2AQe+2hA/+KCXYU1jehtpmcGzBADWTaMpZrwvb
X-Gm-Gg: AYBFou2WckhQva44vfFBT8C2JBCC2Wv4HPkRC/3x3DQdjJog2enNI5G7Aom3tkr/499
	8k+etU0wdAMaIwenoBZe5u5wjwYWetDwZ1u6J4wzinPTAHwHxcc0RmFUrwN3LdGUXVTvAYBom5L
	XZnu8438KkvvTwnupJZaVgIhNpYx9afJOhuNIuOBUOg/tvw5GutnOVWggUBhS5oUx2GU/y1p/st
	S9+FUdHPDZna1FntzIwbbnPPSpBu8MhPt3lg3jQGgey2XOL8+IK85yEMBNsI9rRlnuJGYrjyISv
	0scau87JoNJ/Zg+NrZ8uJ+j/Yi3BtiDpBTyLiOC8U1RdqQ/0YoJRGNNipbgElBpGN5NGExKXIso
	=
X-Received: by 2002:a05:6820:212:b0:6b1:7798:a80e with SMTP id
 006d021491bc7-6b47ecca7f2mr10124357eaf.6.1788445552106; Thu, 03 Sep 2026
 07:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-64-bit-iova-is-silently-truncated-to-v1-0-96e878ea6873@nvidia.com>
In-Reply-To: <20260903-64-bit-iova-is-silently-truncated-to-v1-0-96e878ea6873@nvidia.com>
From: Jacob Moroni <jmoroni@google.com>
Date: Thu, 3 Sep 2026 10:25:40 -0400
X-Gm-Features: AcwNN1Xgi-5VMbZ4r-5uCQqWMAuevTL0Tjsg26cc0zHaxNR-HWscYcHWAVjr2Gc
Message-ID: <CAHYDg1QGvmzcAXCkb_g52x+ZcMr3wEcH0vaEgbgNzXmxw9uFUA@mail.gmail.com>
Subject: Re: [PATCH rdma-next 0/2] RDMA/irdma: Preserve fast-registration
 IOVAs and simplify SQ posting
To: Leon Romanovsky <leon@kernel.org>
Cc: Tatyana Nikolova <tatyana.e.nikolova@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Mustafa Ismail <mustafa.ismail@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jacob Moroni <jmoroni@google.com>


On Thu, Sep 3, 2026 at 7:39=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> Fast-registration IOVAs are u64 hardware values, but irdma passes them
> through pointer-sized types. This truncates the upper bits on 32-bit
> kernels and can program the wrong WQE base address.
>
> Preserve the full IOVA throughout fast registration. Also remove post_sq
> controls from QP flush and fast registration because every current call
> path requests the corresponding send queue to be posted.
>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
> Leon Romanovsky (2):
>       RDMA/irdma: Preserve fast-registration IOVA on 32-bit
>       RDMA/irdma: Remove unused post_sq arguments
>
>  drivers/infiniband/hw/irdma/ctrl.c   | 23 +++++++----------------
>  drivers/infiniband/hw/irdma/hw.c     |  2 --
>  drivers/infiniband/hw/irdma/protos.h |  3 +--
>  drivers/infiniband/hw/irdma/type.h   |  7 ++-----
>  drivers/infiniband/hw/irdma/verbs.c  |  7 +++----
>  5 files changed, 13 insertions(+), 29 deletions(-)
> ---
> base-commit: 6ea2157ce8c7497a2862bd3579a987afe6b129ed
> change-id: 20260903-64-bit-iova-is-silently-truncated-to-f29be6986041
>
> Best regards,
> --
> Leon Romanovsky <leonro@nvidia.com>
>
>
