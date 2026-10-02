Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2CA3EF0A6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959316; cv=pass; b=oVv8C0t1JIDRGZUgd1Ejy4fPZuE4BDJQ2r9OZtOkmA2MylDE/cuEWUgdp9khOU9KiqgPtAqmbw0xoZzJKRKWK9P4LPaGO8s2gLQEB351iUDEXW1XhRIItRnkccDzsDgpH1/f1NLvkp6ZFXvDiJ7ov4pzwbgoLhuOiUOCB0iCgF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959316; c=relaxed/simple;
	bh=udiZlGGO/Yxsje1pchRhMyyAAkURtmf1L9RoQQQHsI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqNi3KLUxhaQdq8ZgLelVtmVVnGLVf031Ya36Xvx2QqoI443Isc7yGrn1PcqV1mki82XQFptQFl1GpRyMqQZwey44GS2guUArzqMAnnIT9ytW73ZsWtgf+IouiWdxFMrxE0ojqjfHsUnA1z6HAGuAfU6mdLbUk/hnXU/lzN+PQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+Jrkak6; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+Jrkak6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so3148102a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790959312; cv=none;
        d=google.com; s=arc-20260327;
        b=R/pIfhrH2+L3u/t67k+bfM15MGdyfjdWazEjFYpKFccQZiTvktoJxRynzJo3c9cZa+
         pxUguTjTGvZGblQ0Fc2iGZ1krfzljwXF/uRh6/hquTjs21JgGH+Sa4GyXVwYus9fPao2
         sC0erGakRi6lTNew/hlRXhUNhAZkZlsZ7dwauwz7M2q11Lpx5okZJEOSRVf/To4cNlOn
         XCT1kACFLmvIg67HUewUA2KDKgEPi17LuZPmEcOUi0QpOBszQC2PoNAipqBIIY2tXqAJ
         LiYKigtmHMCMXJWvWAviZ/lJwu5Axs9GI2i5BGuMf3cSxIC0SdVZurw6G1zUNz573SCE
         r4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        fh=rvcqglsRQMXKQa6eqhm+Huld4ln8XRZ+ezHp5I8ztzI=;
        b=VknUOqGBSEXm2YJ7AcB3EoBkLz5JzXRAOR1TuYDKws3Cwf+2HR/8GI9BwZqYg6IqLs
         lxfH7EtY5t6MXTjbAqaML2e3qMTudl0F1Ne9N8f0/GPzQcQmaaCgMJQu79Wzov1ENb9l
         XW8hSkG9a67iszZ4rkhCSeMZVrXjtF9XO/OESRvA4esVWzSd48tkFho0JiWHtQHEyR9Z
         5JSU1ZiF4IN97YDWBxRexzeVs7TKGV2yCwP4zsZ1puUAlH4WsEeBsr34bO+ZcZXIo5jl
         QDR6MgvSVHTiXkZZ3cBbv5N2p0etH93w1fafzFngapF1eCnbA8ot0NxMQ9fO2Dv4SfiA
         2OBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790959312; x=1791564112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        b=L+Jrkak6HbVnONzU7aSaqmIov4JdOVLporpzSJSX39np/DMnX31DFV9OU1lvNUDaSZ
         qpERsywFM8pLgWg/sWePiLSNRcbrZeZhXvU2GeU5sFrqWy4fH5kPkTZkcziLmxPyVhMt
         H241s7Na/PcAOimT8RqG8eRDON+xpHPAa9leM02+Dftpt9FcnQL89X3zVw096m57+QeZ
         hz/Uqt0zjWeAqjLN8Z858Mwfvw99n2BffzFu+EuE+gbF8lCgKwVUsR8uEJZc3IKWQvbC
         c6lTqoRAufoT0mGk3itqI6Uh2ZGaxkSrpTOCaEL4e831JnrUUCQ4khjBrxCPU7EBNQ6w
         2ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959312; x=1791564112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        b=ZwNueYXH0FrqPNA2rN2WGkcicEZFZlzuVzh/Rcmyb7OIxrsM8YEwh1xLNSFbkSkQh0
         8fdWAQAYq1noI7IxuLVOGzq709t9sLKOhZRhxweieI1eLBdYH3roPjWtUdk1dUDQhW4U
         gh0HzfFbEbpWGe/64EI7maZHWPqbjHN+kEDapEYH7m1jc3nRSfr7Ev1w+dSzc5YNTTCi
         kzCMIDYFTeGzs3H0wZ47Cv1MjTVHjD0lr+c++rXB8Fpiz4swkz4G2C33wQhr5CiBW2DE
         6cCCAptuyVgvmwE4RNy0N0XzhFMD2pcEjfd81ywdxgU/GNaS0f2ieiUmKm6CDR/xaa1d
         UCYw==
X-Forwarded-Encrypted: i=1; AKwUvBxkxz/WUS88dDDm6o5bJFCxgLgN/TTsDIEzGhdaWcXxwt1JxwV9E6x4/paX/fxPT4oH1sklFXYAvougMWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLapS/qVzXi3FlWeW2jS15wF6SPjw0X9jNv3JssnKknTXStdJts
	myqvrYkqqrEFZ7sjGCgUoe8ZiLukmmdRMqWa032gKHHRYpYBwMnUfWOAFJsWiB3h8lChGQFNf15
	gQSeXuYvPdYufM7dB9i9soGk51911ea/rd2GBA7mMIw==
X-Gm-Gg: AYBFou0x6bT3YJiK3ffCJujLnkuHCF4QbMT/fa+LdZBkYUIYYhE0rRmFoy3/P5PGZyF
	BGg9oqmh+2HXNSHZHlVLekrrFmVNTWEDy/qfyP5kcyaroUL0lTHV1LKuqcJ9RPDmWxgueXg2JJX
	ODW/YVSHMT81yFzhGqBcBCacC8c3C2KXPKH4xVMjEi29lDKvMNxRswIu0Rs8zEvp0sTiZUlOL2x
	+ZD3A0s76WeXZRQk3+wQqSUOZ3rSx4Gz+5/kpXJPwtK7viqpZ4JYB5lU9HcLVMUC9M6BqtgeBEU
	ntztGttvIrOQ47Ag7fG9y5Dh/TNblOiF44+C+HIesk9cX61nZ9R1XL7yvpiZB45Y0MHt0pJQ792
	W3vQCi9Wcpa21iw==
X-Received: by 2002:a05:6402:4387:b0:6aa:8d04:fa79 with SMTP id
 4fb4d7f45d1cf-6afad8d08d9mr65471a12.13.1790959312169; Fri, 02 Oct 2026
 09:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924205901.2505186-2-tanmay.shah@amd.com> <arjZvftSMlG3OMHP@bywater>
 <ar6PTLS194v3YJPU@p14s> <6e13a1ca-adc6-4c26-a9fe-63f4b046cabc@amd.com>
In-Reply-To: <6e13a1ca-adc6-4c26-a9fe-63f4b046cabc@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 2 Oct 2026 10:41:40 -0600
X-Gm-Features: AclHuK9Dwrn-HspmBs2afKv0XgYfCyTpWE3OkSG3FGr-tj2no8XqzThzQ7vhwjo
Message-ID: <CANLsYkwq6iqc9vCM6t0+Mbj9byzuzeW+uw89P6jCpZwk0xgSOQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before removing it
To: tanmay.shah@amd.com
Cc: Francesco Valla <francesco@valla.it>, andersson@kernel.org, ohad@wizery.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 11:18, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 10/1/2026 11:50 AM, Mathieu Poirier wrote:
> > On Sun, Sep 27, 2026 at 10:55:59AM +0200, Francesco Valla wrote:
> >> Hi Tanmay,
> >>
> >> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
> >>> The virtio device is removed when the remoteproc device is removed. The
> >>> driver should issue reset on the virtio device so the remote can do
> >>> corresponding cleanup.
> >>>
> >>
> >> Shouldn't be the driver, and not the transport, the one that calls
> >> virtio_reset_device()?
> >
> > Function rproc_remove_virtio_dev() calls unregister_virtio_device(), which calls
> > device_unregister(), which should end up calling virtio_bus.remove(), in this
> > case virtio_dev_remove().  virtio_dev_remove() calls drv->remove().  If we take
> > the RPMSG driver, rpmsg_remove() calls virtio_reset_device(), so explicitly
> > resetting devices as part of rproc_remove_virtio_dev() is not needed.
> >
> > Tanmay, have you observed a scenario where the above isn't working?
> >
>
> Nope. I didn't send the patch based on any practical scenario. This is
> an old patch that I had used at the time to issue reset on shutdown. I
> missed that the driver is already doing it. Probably my assessment was
> incorrect at the time. I think we should remove this patch.
>

I backed it out.

> >>
> >>> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >>> index d5e9ff045a28..1cb0ee0ea656 100644
> >>> --- a/drivers/remoteproc/remoteproc_virtio.c
> >>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>> @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >>>  {
> >>>     struct virtio_device *vdev = dev_to_virtio(dev);
> >>>
> >>> +   virtio_reset_device(vdev);
> >>> +
> >>>     unregister_virtio_device(vdev);
> >>>     return 0;
> >>>  }
> >>>
> >>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> >>> --
> >>> 2.43.0
> >>>
>
