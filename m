Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717051;
	b=xIoEjs42qTCHcEi+qtXxT99ItU4JBohAvnTf8R38JKWHm9CeK0Z8560qd3eEQgn8YwxD
	 gB/qzTPAqMBJmUUuzb2uNmi39q+2gv9GBPqEKCsD5v0MSXYnWu40W5OKMuqpMJMABMUfC
	 rAF8Sop83w1ZQ4yO0TEOoWOnzApG0pokLZxqdx1NkomJpwXRmgCPEQOlEWUD/K9ndnTHG
	 inawrnhY3uY58wLuRA8ukmgZaJhGfgYmHGdVM080Jl2gxZFQXT9uRouyFeawsG+D00HRk
	 4q0an5NN0i2Zo6dvtt2fi2as8R/o8AKu74qt638alD0JGW74c9vtaQ1rvn0pP0va7Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UsNAdNzoYrca+OV+CM5jwxNdwhRxDFVLuJ7VRuUaXMU=;
	b=RySRaBteynyhLXUpt3babYHj6bR7YDxuoC/cIhTkTX+6WvGU+Yc8+7+RCCBBsUvxGz1r
	 DuoodJk/SiH5pYiO0EvGc7mFB711/uLdHtMCVeBEmNLNzKlrnmOPD+RNRGO6FEZwC5p5P
	 nlJ1H82Ss//pZ2O9xpS7/HHYIF6cw6gcthUbwic9Vuzhoacu3EDzqeRKCYMa1NzEKWbmu
	 bhHIv5vioVeIczo+vby8WfbAc2/4TrjaAphjtBzYsFM/UNz0wVpe8PFloXbr/rMD+uXQw
	 xCcX+0v0VuT2DZNb5p0EE4Mr8vONj/+l0ZiLPEIooDVx2wdyEiafCNgdUkVlfRjsfCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FcchWCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AD8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FcchWCc
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1397a4855beso214329c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717050; cv=none;
        d=google.com; s=arc-20260327;
        b=VZGgyGfoSA4LdlPO6aN+Diq/XBUc0zwTpuKHUARkqrzZYN/lmIBO+psbe17hgc23bY
         1KbUv62G9HFnCf7IdPfeEzNHg6dASaFrfNJsUfVIuDbq05Ssb2RNXqt9V74f+6tYfrIv
         YFOR7UAAn721MJcYuBgo6haJH449E8sNbzvHOCQ395tVQg+iQ2juF5eukCZofCD6xUK2
         WzeKxYro0wWWaDrJ9g+0VuowfAIFCdwk7S0/S1YrzYWlJKdZ1hyJjuQmksXS+240xsky
         RP8T+9B5pSaNJuZLZtIRMkw2Azpt+cYum7zvnLj5RsOKQrM2oi9YgBoFrnVRSX0kGL8+
         zF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsNAdNzoYrca+OV+CM5jwxNdwhRxDFVLuJ7VRuUaXMU=;
        fh=Qkc5U09/Xvs2BDMBvDazPDLX5OXPJ6EyADzebUaq3N0=;
        b=ALCk/r9aTTaN0SrpVnGuhLjiRuKx0ftESoDFBZBM05iC0/TfiMvNWaVjhVV8DGd1aN
         /j+aAikeNdyXo0g7PIA96n8/ZsCQZvzAsGlw3yCl9k3zRAU9FfUQpxc2Inzz9AODYTYT
         taurEaklWtLPEc/pl+c1nNvTsb87ZPJMIyfKJ2vfGLpaoMqZF2753saRy95WQJVPNwz7
         g+fooiJExAmlkWkmp+NV85hmqzBttPrT9xrQq8gk1nrIhE2naE5Xi2NhDOMYa48Pa2Ua
         +zZXMiY1bHZLh8kSCs1s5F7fwtcz3ZD2DOYgs2/mKLxVlqr+EL2wCWVfTWRcTKh+JhXj
         /t8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717050; x=1794321850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsNAdNzoYrca+OV+CM5jwxNdwhRxDFVLuJ7VRuUaXMU=;
        b=0FcchWCcvIrl0bLmfHq4W5bG5RQdxFKKyvmhclxU741JHo+LLLwHfqRpk+vnJsiUcd
         XWX4+LyF2o0xi0hmzjm76mkPjcqDaRVT+BbH/I2Jh419Vpha12pf4fgXhWyXZ4pVY20h
         Fnoj2avLft8ofdRV1gBNEzGHdmH19SEh7l/RDM925qV4PCeTmh6pWFqG/GL9Eo3C7Q1e
         JWOYV3+wh8Co64H51jlvsGQMNVq0bAYeTAMwcw/+IeKM9WfatD6hcPrkr7Pr2mPJb+3R
         RhzvjbSsxWCFIJhRY4+m6HOCl4LQADhfwvfEqRT7p5qsE9kxgr2sQwMSHjZKPgNjmFWO
         Fxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717050; x=1794321850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsNAdNzoYrca+OV+CM5jwxNdwhRxDFVLuJ7VRuUaXMU=;
        b=bot8W8L1YBLcqjgtHqFKWWj8B4zGZYKaOIsHyVMCe0d7qwYnZb5MdidxefQx9b2awv
         G1xvsE4YqfwWa5iYpzKu1Cy9F1tnjUwxCidSGlsy5MTklI6im4T9zYOB59O3aGEItnZM
         qb0jWbBFqGN9//HmZsSk+EYydSIOhx3X6nmAsFKvGbocNBsSRF8SRXZvpdzkvNf445hU
         9jtfPADc69r0B9KSpHW4iHGN8wtS5keKFIJeeHk7fwTIOc3l2XxpWkk9RblEfp7jxx6s
         D9OSBEDWkp0yNRJHtrYi6hQf/LWjq13eqXr7B4agFQb04e90lHadDzf9YdyqC4iWZX0f
         ohqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX3JBFp8pv4IdfUh7KjQIk2hYdoUGYH4pODeOl2gqiR73FJoon69ur/jY9HUpIUamQ2UxE3Eh4ZNP+jlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iwCCYvCFAGtt7u8lg9jFM1xhGOUMIkqYaFWBWd08pnFVuUcYt
	ggHBt5ccl8aGnOHgn2wPFtHNIVjPTWlsJlJvJ/2LAZ50HiKo9RSUeItcj7tU82U7JDDq3ATlUcF
	LM/IgvdI+8g2zPNy0u/HN7Da2hDcpLa4=
X-Gm-Gg: AYBFou0XofiohZgqmR1XAEGrWEJt0PKZpYZkNtOAFK5uvfGuoUBI079Jh3FXiR+tKzr
	6mNs6izDQTyNxZ+d+tae0U3M0rbezeuSrCwO3krBB7yvLnisTLttOTzK6xif7f4OGlCATIvd06K
	6zVGrZr6YaiPMO0/1EM5Z1yKX4aXaJqM69XLw/N/+Vx96oHpquKFuO5Hm0j9AVFS+cLhiqeL7n8
	21y7AjJBt/3qXWyAkCarAOIII3IJSKAVqzuwIIDBmg78fLgk2dC0ivA4VF2GmVaBnu/tlxprf57
	743uT1BhxN72HDrHHGEvnvWfVLCnSRf7a1i+O5DZsS7CMh7xlnDtnI2G/EGb7+AjDb6I8+VMOKV
	+gyGlurrqZEONXRF8gxvF0JCzdrLdgB9JsZ4irx3VMZX0igx6oKSrtucGcVhwbCcjYNoi5g6l0L
	Sz8FzadTbl161BIXs2tufVUVDNSRoCwigesFZhp3wL05r2
X-Received: by 2002:a05:701b:428f:10b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-1ac4f91ef0emr33223893c88.0.1793717050355; Tue, 03 Nov 2026
 06:44:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103114053.73761-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261103114053.73761-1-k.chen@smail.nju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 09:43:58 -0500
X-Gm-Features: AclHuK80YDWXw3RH4Lv7ORguPbCuG3Q8k5HJ1e5r-PWy-1oFZs2Ug-jOTbIa5-w
Message-ID: <CADnq5_Oax1FOEx=oGA07rWsWq9DspU6QNxnXv1yR0UAG2bA6jA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: reject invalid ATRM results
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:21=E2=80=AFAM Kang Chen <k.chen@smail.nju.edu.cn> =
wrote:
>
> radeon_atrm_call() trusts the buffer returned by the ATRM method: it
> copies obj->buffer.length bytes into the VBIOS image without checking
> the object type or that the length fits in the requested chunk.  A
> firmware-provided ATRM method returning a non-buffer object or a buffer
> larger than the requested 4 KiB chunk can write beyond the 256 KiB
> VBIOS allocation.
>
> Reject the response unless it is an ACPI buffer no larger than the
> requested chunk.  The only caller always requests ATRM_BIOS_PAGE-sized
> chunks inside the VBIOS allocation, so checking the returned length
> against len is sufficient.
>
> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX ha=
ndler (v3)")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Thanks, this was already fixed:
https://patchwork.freedesktop.org/patch/764437/?series=3D177235&rev=3D1

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_bios.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeo=
n/radeon_bios.c
> index 1da6bf1c17ff..c23892470265 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -183,7 +183,12 @@ static int radeon_atrm_call(acpi_handle atrm_handle,=
 uint8_t *bios,
>         }
>
>         obj =3D (union acpi_object *)buffer.pointer;
> -       memcpy(bios+offset, obj->buffer.pointer, obj->buffer.length);
> +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length=
 > len) {
> +               kfree(buffer.pointer);
> +               return -ENODEV;
> +       }
> +
> +       memcpy(bios + offset, obj->buffer.pointer, obj->buffer.length);
>         len =3D obj->buffer.length;
>         kfree(buffer.pointer);
>         return len;
> --
> 2.34.1
>
