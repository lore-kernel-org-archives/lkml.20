Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039159;
	b=vrTLUMd7Btsk2xwSu2zwT2Uy4RwThZ6lY8P9TMFxbeqChhAI6gj95FS6i14H7AU7vpFa
	 5H7yfaBHUr3FopHAFgQmwy7G5ZQ7prC/WXOUgR17JCeZNFqF4Y2x7LoSs2MhawdhOxnun
	 NZG1hcpKvUN4hgCvdhCFsPrbiQp02wYIQ+HvorWbst6SMTspx7chpnlkKoKOFEnhzZRDe
	 P2v41E0KLefs0w4MZ2yMGVfbz55q5KQ0cCbsl0hCrG6spMgrLY6YBNIfkSAaKW8hNdv/1
	 GVfTgLY38RT5C2+05xD6eklQ7sSybi0SikBmV9SDcP/OQV+Bf2vHUcGlsGS9dUNtaog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
	b=bttH3GCVhXgbsNKmkeNrFV/4+LWtKFWpz9GoJmybvB8tw+wckzCqfKSjj9H5UAQRpZ7m
	 P2kg36KxmR+HYdNNPin4SYXSTf5hFw3tLSQ6aHDU93lMnOmNafu26X8jKwk0FIsSIKqg/
	 Lyx9U7WmohJltRy1F6ZBqklTW0Hpr41s+HWxZgIGcrmYkRQmQEFd7qWUF/Nqjsnl681Si
	 P4n21truXJK8HjKr7YT5w+Aydsii76Me20LWhWHy/H79JOVU5/flllyGr4/3tnRCzsWre
	 hTd2jqOvseNtSs8+qwvmqF47/0nOhq6wFDvKgECARFoKpEVi+DL/Y4e3CO+0ZrL34iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbwuRd+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EF3606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57EF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbwuRd+E
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34c522572bfso424438eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039158; cv=none;
        d=google.com; s=arc-20260327;
        b=e7rs+PVKWqc2ToQbqhxtWC39kgF2lpEsjluc3oLlWNzNdNPRppl8zcGF9JsMGVLslo
         Dm9Ytqn9XOtDCe4VwNzS0TSU47AP/3JXKuQ0k4FWeLBEyy5s3VA6dlOBC82syoxRVo7A
         t0aWVhCDp6JtR/Ubqs7T4ydhME4ioP+p4a29tGZLp01XLw0FSc2JRkB7lfQRNKLFL6a5
         jPdo9l1QyzKnB/9Q065gpl3EPHlwmL1WBeI6pNHq+cKXt4508wmbH8UnIi4Xt52cgDLX
         ETu4Jr+wkrIp6U3x9vv+sxw2nNUBRe2yMUbNgPIB6+QmC0wcKNwUppljvdp0vvBw/blQ
         0+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        fh=sy+k0q1AfDswMJJMUbr75pJnKkJTDEcUxqjAikF1eE4=;
        b=FAVzammHvn9Qe0WDrZHGR79hgq8ILqX18ha6efuI1soXQXAMpxbnMnsP2IbQyjehh7
         3CGxHU5BCfy58yghkplwaoMTE0/ERj1LIHWHVsecLvY8Kw7h4HYHySGcP7sjO68tbR8D
         eWvBCFeSMqd3DciFD6UOB2MzucdA6eTBI9WCfP1xuktSDnrn/Fg6SfKOHEwa5Rox+U2N
         POA1PJQtR3NOa+chUONwzRZwYKPXDJfDaQFlk4GSepmqeEEjXu5CzYTmdGkFmWCYels6
         tSMla9wI7EI1j9xJFKRbLPldUEIAwaTVTCU+0tvgQUPMxDxQJNVim7/k8QMQ3y51yZU0
         Mmqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039158; x=1793643958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        b=lbwuRd+E6IGbpx/R//bHxBaxtTULqnLTEPOgtj435togavFrY7DCao9Jpf3oyDVxKs
         MWsaSaYk63yGIG6j0VdJu0kxsnNN4Dc/AaXIclthMFkzIiaMMkJys0fiym+KULMW9ZLP
         u6sTd9Hi8W9+KgPwgnfE4vns13wMC83wHX+XTYlLK5NHtQK4Dv3BRfQAAz6M4kWg7dl4
         N5BRqH9iTNUNz8KvsN5ogrYNYzeupCISH5cMfqCJmBmRRN4xFT15SOUTUVQC03TgU/ZA
         WsU5OxwXQlZqgPrSMVxeUFYmGw+Kew8yFQfCQYFTAQbnOytGQeRGW8ssvLoGRkIozqvh
         2fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039158; x=1793643958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        b=2kf84iTJ0tJoNOCJM7VLINDar50aGjz7JiPpIyYibmXlzCymrrr1v/OFDTBcYlK9ta
         PIlGeJPmL1YAsmlvZ27RpGPDLeA1ReYe2SvxBHFJHSiNMGpFFfq1gsioJcYPnwcx0ouj
         ENLtlqUIsgX1nwxUu+UHIFSk9GF5S7yNLCc/tvCWhWC7QMTaw0HJdLBpxuRsBvnMGUrQ
         x/xnkzV7XJAELTrmGArb2Z3hpnLtlfYGokeyYm2+O4sDMGYksB/WjkW6rXMmuHJwuhDU
         6U38wFEONN0tgSwUIu4FD/EgdoXSNgxi8Fz3u9CvhlHTrypOw/+SX/gV24fQSS5qpgn6
         mE0w==
X-Forwarded-Encrypted: i=1; AKwUvBzQAEC7aKdd36PCpjZuZZlvywUhy0lIE0sXt+j7SFmIwUVVNu74T32A5R0CDwSQo7Xgy8vxN8z2GeXUvGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX5/EJHGkKocG75IjI4NcFMQ0CuFPJgNlmx5Q9jxisC/TYOUvB
	hKGaZ4kWPz0ay/E2EYl43cmY6SgRSPerJWRnch660NlQXCef+XfidSntE9fXvGDpzxjjPd+VEr+
	Z0LsfjWrabFTp94uDC0PxJ3D3UPQ//kE=
X-Gm-Gg: AYBFou0Y+q5cAayjlUgB3OVq9elbWzdWMalUFqIO8PNgJB9uWk6EL1yAU21Z5oGRdhI
	OWxkHIlEM+Kqu0c+j0GZVs8MIQXoEP7DDUW4N8XRCx7NuDwhp3MTzsZB3F095LRQtauzUrmhfXs
	j71bGuwRt6rMVnuevURv7f7QoD141iw94HhFq98By8niIe+NgY9KOzXinqTZYgOPpYsBQBjwOQG
	MGLqY3+xOj2xAiSAZV9NZZ+wIcPxCtQzN5n0RlsoxgW37bcGk2u+M44UB9+a8IGZHsvMEi5Fsot
	T0P74s7Grq5uE4PAKIdh3tENuXy27GlRfO64/wIAEbmOcI+CzKDGORt2hnZc8NgjYyyqyXCpTov
	x6a2/DNijYlolZhAsdkPQW9pyLG9Ii+DG0rOpgCMIe06HIMyBbp8xCq2DYc/DGTMAlmxZyTkDD3
	9xGcfScMwaTyqx039eTXFpc7w=
X-Received: by 2002:a05:7023:a46:b0:14b:edb2:c3bc with SMTP id
 a92af1059eb24-1991b9e5d7bmr16987682c88.0.1793039158092; Mon, 26 Oct 2026
 11:25:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-12-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-12-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:25:46 -0400
X-Gm-Features: AclHuK9L_P-9DUQQyVR1q5n6RC6VuTR2frqkgDd6R4nvp8sd0RT2y__G1BnjdtI
Message-ID: <CADnq5_PRG_O7jy9P+mf7AQLerpfz6up=BejRSPMgYDh9xigm=A@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/amd/display: Refuse DP AUX while GMUX keeps the
 GPU off
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:11=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> From: Andre Eikmeyer <dev@deq.rocks>
>
> fwupd reads /dev/drm_dp_aux* while the GPU is runtime suspended. The AUX
> device holds no runtime PM reference, so the transfer touched registers o=
f
> the powered off GPU and caused a CPU CATTER.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7261317d4..b099bf520 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -24,6 +24,7 @@
>   *
>   */
>
> +#include <linux/pm_runtime.h>
>  #include <linux/vmalloc.h>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> @@ -111,6 +112,20 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct d=
rm_dp_aux *aux,
>         if (WARN_ON(msg->size > 16))
>                 return -E2BIG;
>
> +       ddc =3D TO_DM_AUX(aux)->ddc_service;
> +       adev =3D ddc->ctx->driver_context;
> +
> +       /*
> +        * User space reaches this through the drm_dp_aux_dev character d=
evice
> +        * without a runtime PM reference. Refuse the transfer while GMUX=
 keeps
> +        * the GPU powered off, a register access then hangs the PEG link=
.
> +        */
> +       pm_runtime_get_noresume(adev->dev);
> +       if (READ_ONCE(adev->gmux_off)) {

Nothing about this needs to be GMUX specific.

Alex

> +               pm_runtime_put_noidle(adev->dev);
> +               return -EBUSY;
> +       }
> +
>         payload.address =3D msg->address;
>         payload.data =3D msg->buffer;
>         payload.length =3D msg->size;
> @@ -126,13 +141,13 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct =
drm_dp_aux *aux,
>         result =3D dc_link_aux_transfer_raw(TO_DM_AUX(aux)->ddc_service, =
&payload,
>                                       &operation_result);
>
> +       pm_runtime_put_autosuspend(adev->dev);
> +
>         /*
>          * w/a on certain intel platform where hpd is unexpected to pull =
low during
>          * 1st sideband message transaction by return AUX_RET_ERROR_HPD_D=
ISCON
>          * aux transaction is succuess in such case, therefore bypass the=
 error
>          */
> -       ddc =3D TO_DM_AUX(aux)->ddc_service;
> -       adev =3D ddc->ctx->driver_context;
>         if (adev->dm.aux_hpd_discon_quirk) {
>                 if (msg->address =3D=3D DP_SIDEBAND_MSG_DOWN_REQ_BASE &&
>                         operation_result =3D=3D AUX_RET_ERROR_HPD_DISCON)=
 {
> --
> 2.55.0
>
