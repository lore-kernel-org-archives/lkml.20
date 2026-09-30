Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB4E3939BD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741832; cv=pass; b=lZ5uOMFTEWxTlRUU9zujR7nmNGcl63wRFx7+W7RXiW9S86UGHCNEea6H9my9aIDdofH60nCaeMLpe1tzl74Xaf6fmHmN7fYy+F0xaRQVYxHZaUu5nKRTn8XRVCr8E71Ai4L4mR55Yu5Zws6/ruMtag876ia/As1tmm3RYQqaqvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741832; c=relaxed/simple;
	bh=8LKcJW5t62sQLA3S0bCcXS7YahC914JerBNt4ZIlbQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/QBZAx7rRSzDGQFGaUw8CDgXyarCyDneTGGUmB8eVXwYVFDE/uqCEMKiqsjUHz6ef5MPx7mvwSVuCxwQWh/XtYQTIOtDQwpDgfDuKjddLdJeF3I78hv6I/olSqdPaSq4PJ/VCAUNwk50x/BZHfF7SZKp45mTCajWxuODk1sFd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=OWNDll22; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="OWNDll22"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e227422e3so7778566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741829; cv=none;
        d=google.com; s=arc-20260327;
        b=IU0cbkv239Q8dFQTQjlC0Q9C6949nkXXYHYVZKNgVMNPYsKchApF+qBaPtA9EsV0BC
         e9jsCldWm/lRe/YYsLu9EYfbEbVut2izqnjXVOKKeJ2lTe9NPttYXf5oFSfHKpObIdER
         WUdnZ9Q3NKcTNA0/YK+eqW7qGKwCJLX1XNBA2auAL3aFfmojazGQCjPgffTqo/+BnsWm
         HJdCwIBKaWcZK1ARFosXtuSr3h/lW9n6k14A1jVhrFBDZf/QayY90B9YD4id0k9vMBPE
         U4xWtYF0TB+tDB9VvJWTm7QwItHMRWk0sj2+mZQEXXisojGJbX1XBCKIjqaion0TyZWy
         G0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BXHc2ocVl/GXq6eBcofJvFTp9Fkopv1F3F+Vt9UcgN8=;
        fh=27yYP4y3/fjM2WRcZzm3VogV//C7ITkRtVBm2hxJNyE=;
        b=suyWMTSXoUZjRpl/PhEdBFQ8lzZQ6h8Ozty5EqOcyrbV+AHfaFF1QSi2Jk4Rqoplmv
         UXkKN7/BmZOYor+UhY+fvIS4EqgSFVnE53fRSfNONLC5pxv224J2xvfdWxN9Md7yJyAB
         aJX3DgcMUpPJl6rm+utXBb8XoTqLZMfTSDHbVlfUudHUQUhESktaFu7yNmXMAW2MpfeX
         EO/SCrRTd5vseArgcFoRfYsYaBBgwOzjv4pQ9OA0FHetYfe/aw5FZE6BaPadu4V4Kf/U
         X9vhQbNdb1/mupnSMaxSe607caId9i2yV47sy+tBaDBbXnW8LAcGgW/hx9Rt5PR0qkCO
         jpag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1790741829; x=1791346629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BXHc2ocVl/GXq6eBcofJvFTp9Fkopv1F3F+Vt9UcgN8=;
        b=OWNDll22yCw9+slp5LG0Cxl5hL3YjTQqOSYXCT33TC9hj0kl1eumFq6tR6wScNSyVU
         3iUrhSiLub8yr37G3BUYq7k6ndWLo1As1e5U4KBEc8F8kuww3wX7bvwP0Ay1vtN70JL/
         +PYgyiZ1N+ug09dxO91y2HmgdVj7I2lCfiI4ipp309qS4TICksLiUaMG/SIcgokZGfCL
         cVmrxsB7cSsjbZr83A0TkEr8uKck+X7Y0MGqX6Xt+wgB3l9IRmT+DR+cE37RSkT7S9CL
         uwbhN6FNff7RGBpiUc4jNPXIxSZt77fBWYeV1p29ZO9RO5krPgeFXDN1nLSuYfvdW+9A
         Mhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741829; x=1791346629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXHc2ocVl/GXq6eBcofJvFTp9Fkopv1F3F+Vt9UcgN8=;
        b=kQQdYc1ekfg9/Tz+04PPNW92A00S6LBPXS8/wu9Y/on+xMo6T3myHqq3ozjzUM7gXu
         vXbeQuXxkMz9N5p3YeqcuSUX4qrjdg4dDPjmQg6vbW6ZrXT47Ez1LDPu6KgAL6AURi3c
         sCcHuW0UlUSix07uuqObCs3Qn3HuUc+2m/YUpAtiz5rEk+AVqy8Vl1AOutLstXqRdWr+
         Ztg/DkflSyQuK+13txybo1rVCjOfjbwcI7AvlxHlGoFxU5Kiyb1tQubPUro/mCsZMfbA
         3atncuz44wqc4qRN0fPdclANMN/tynmTyHGYSgyrGdWLDU6SLV1NBJgkxwWL4akKz8Jn
         oDgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5L8//NShlMihBoa554sYQz1FhN4HI5kbt/hEzJl+0zcg1kQU3kghXEnTO08qt0i1rL/A0NjAX0Cnl/3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAqc+7KxXcRv14fS3DjYaYj3L4s3D5QTPZUTEIjiz0DjnHyFDe
	Uu6yMZPGlO5RumxgxVMEmWyLbc9zoJ10GFAQF8QnIxbbuomdk0ahxD+MrnXM+2qi6hSsCP7ZN3S
	WELAFPtWMDwyBcCgBJHGOAX9Tq8ANrJmX4PhGEDK7/g==
X-Gm-Gg: AYBFou0JqNQSuSgaiV3yjcyTBU75wKkoEPISvYqtEjzcHnzhZhnlpVguDb08niQGrZg
	8QnU8qN4gZCHyv4VUzkZhpwW/waGDjfKcYNB2XyCJ8kQWNqKwSXqBpftsD0UsGiB2D4ebMeG6ay
	IqdsuEjVKZpneQKEgY5GWxq6MpG+cgP15B9CbeWlmWmHF/kUsuTWmFgzOubT8gGK/m55HndAPeG
	s8RtKufFKWB8cmP790taiRxAM63QgQfYWAzrmGQNYDFXaw/gdmiJ3GLl2PRGABKupBMuNJy68n3
	ojMc08ql7opDjvJPvxwP1BXtLJEDlF3VlemA9JehdAYlXWgoG5QtFBpE
X-Received: by 2002:a17:907:7215:b0:c2e:c8c:e123 with SMTP id
 a640c23a62f3a-c2e23cac5d3mr5647366b.10.1790741828953; Tue, 29 Sep 2026
 21:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930024233.96200-1-artem@trailofbits.com>
In-Reply-To: <20260930024233.96200-1-artem@trailofbits.com>
From: Xu Chunguang <chunguang.xu@shopee.com>
Date: Wed, 30 Sep 2026 12:16:57 +0800
X-Gm-Features: AclHuK9PXTY6APTmi-Sas-3gAiomOj0JKzSbbMMC4c-EJPtWckhIK29Ek9W5PlQ
Message-ID: <CAAO4dAVKgZT5rkv1YQzgch5xcA=DH0EmHM=oOY6e-c-sArTprw@mail.gmail.com>
Subject: Re: [PATCH 6.6.y] nvme-fabrics: use reserved tag for reg read/write command
To: Artem Dinaburg <artem@trailofbits.com>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I will apply it for 6.6 later, Thanks


On Wed, Sep 30, 2026 at 10:42=E2=80=AFAM Artem Dinaburg <artem@trailofbits.=
com> wrote:
>
> From: Chunguang Xu <chunguang.xu@shopee.com>
>
> [ Upstream commit 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa ]
>
> In some scenarios, if too many commands are issued by nvme command in
> the same time by user tasks, this may exhaust all tags of admin_q. If
> a reset (nvme reset or IO timeout) occurs before these commands finish,
> reconnect routine may fail to update nvme regs due to insufficient tags,
> which will cause kernel hang forever. In order to workaround this issue,
> maybe we can let reg_read32()/reg_read64()/reg_write32() use reserved
> tags. This maybe safe for nvmf:
>
> 1. For the disable ctrl path,  we will not issue connect command
> 2. For the enable ctrl / fw activate path, since connect and reg_xx()
>    are called serially.
>
> So the reserved tags may still be enough while reg_xx() use reserved tags=
.
>
> [ Backport to 6.6.y: used the older BLK_MQ_REQ_RESERVED request flag. ]
>
> Signed-off-by: Chunguang Xu <chunguang.xu@shopee.com>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
> ---
> Hi Greg, Sasha, and nvme maintainers,
>
> I am working through the small CVE backports still missing from 6.6.y.
> This one addresses CVE-2024-41082. It reserves a request tag for
> controller-register I/O during reconnect and reset.
>
> The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y=
.
> This fix also affects 6.1.y, which will need a separate backport; this
> submission contains only the 6.6.y patch.
> The target-specific adjustment is recorded in the bracketed note above.
>
> Could you please queue it for 6.6.y?
>
> CVE: CVE-2024-41082
> Upstream: 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa
>
> AI assistance: An LLM helped identify, adapt, and validate this backport;=
 I
> reviewed the resulting code and validation evidence.
>
> Thanks,
> Artem Dinaburg
>
>  drivers/nvme/host/fabrics.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
> index fd01b86f10a4b0..8adcc8c97c42cf 100644
> --- a/drivers/nvme/host/fabrics.c
> +++ b/drivers/nvme/host/fabrics.c
> @@ -179,7 +179,7 @@ int nvmf_reg_read32(struct nvme_ctrl *ctrl, u32 off, =
u32 *val)
>         cmd.prop_get.offset =3D cpu_to_le32(off);
>
>         ret =3D __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL,=
 0,
> -                       NVME_QID_ANY, 0, 0);
> +                       NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
>
>         if (ret >=3D 0)
>                 *val =3D le64_to_cpu(res.u64);
> @@ -225,7 +225,7 @@ int nvmf_reg_read64(struct nvme_ctrl *ctrl, u32 off, =
u64 *val)
>         cmd.prop_get.offset =3D cpu_to_le32(off);
>
>         ret =3D __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL,=
 0,
> -                       NVME_QID_ANY, 0, 0);
> +                       NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
>
>         if (ret >=3D 0)
>                 *val =3D le64_to_cpu(res.u64);
> @@ -270,7 +270,7 @@ int nvmf_reg_write32(struct nvme_ctrl *ctrl, u32 off,=
 u32 val)
>         cmd.prop_set.value =3D cpu_to_le64(val);
>
>         ret =3D __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, NULL, NULL,=
 0,
> -                       NVME_QID_ANY, 0, 0);
> +                       NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
>         if (unlikely(ret))
>                 dev_err(ctrl->device,
>                         "Property Set error: %d, offset %#x\n",
> --
> 2.39.5
>
