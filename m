Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793848959;
	b=KRvvQhfwfMkfYarZTAxH/4fcP9I58wkMH8sqOS3JeQFARxPQk2SHUsAvMPvgq9yH/XSo
	 As0NcSePuEF9A5cMuQrflpEvjvKaJqgntZ1w6t79g/yfDKKwapvHRiMJ01Xnl0fXI82Ph
	 3NMhtCndcStJKLiuKjD2WL/uAgBI6OzCm2b5AWsvrb8qsjxx0bs6CHaNdcqPDGd10M+6P
	 t7jlA3v2ECWaySQk8VW3WTEtCEqr/WL1i7/XlQhz9e3qGV6myNlIiZBO2WMRpdJqryBX/
	 aCwmuhL5KdshJFNDFUGj5Ypg6X8tQrV5ltZNaxAVYpyL+vCCqX1Mt4+vMQPVX9g84vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
	b=d/JaCwd5hqzTltvXBx5RzCtnAyZCnHX5MgFSZ85WpAFgKYIpRWZ+g/zXvxxtbDtLx72O
	 Oxlt/BhmKL75hq4f9ylN67TtWd7KFux7lcI6RecwuSYNST0Lgmakikz66MYPabLhXCQSX
	 eeFKEJ92t886l4pcPITApBYOBoPvnLfrC9g6zJ+HFydbx+PR2iEldFbDoTwMordpZfeRJ
	 WEYMjflaqeyj4CuMjYMprnCpd6Unx3UItGzX0l8s6xaQvHr3rg5BnA4JuT8mkbs3pc1/w
	 dg1LMTzpC7wQhKykBenH4ygrTCRjlqRsyujJNMA4IYgx9w7VfRnyxdEAwxxo2vT2wDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfKj1buQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F7F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfKj1buQ
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c00f291e1so615031d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793848958; cv=none;
        d=google.com; s=arc-20260327;
        b=DM1q7B/J9td9CCr+XCF4I2g5jC1hEK3sCpKbzA1V05ma2AkkwXUJcm6jmE1LkDz+2x
         jpEjnYkBLmfY8FFrJDZlFI908+Ur7t1pIjGXIwU0cycozcumFc/q74XybQoHVXqiKPSL
         5z2sZxp/A2qcO9R/rjROjaGQT8cES5CLyM5Qe+GuSVvfzj5KP53jSTkPCWgR1jmAmiho
         YDZIuH9daj6UPt7SXrDs1H4atYJiA9I/GBsH7QBflWCXmIC8SVLolgyHQzBW3o1nTZEC
         sE6kWDYu7MO2zMTekbaWb4tvfT5t9DxywvIclHds3fbXJxVroMMqRbnVMbC1v7jWGbaV
         7vTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        fh=9/dQRp/NRgkc4bedOxH9QOJI7E39pLSVnKtN2TvS7VQ=;
        b=kBT7/cl8CbW2jXz3603y2k2GoWOjTxygQucf4P5v1731gwOuGWflZ5pOQxOJ8V9IH7
         g09bTHQ60fMoVxCpXU90cC0whIXIwVmvpvKM9cNUA7IcwL09Kt3JHvu/Vpe+lsTsBB/w
         YF/wHfEq9N2EnGBjq4VQDM+BjFralHscZ4s3mQpmSVxtPaR8mxM7wSarhM1m6ZruOAq/
         9b2RFJNAeEjKVuMnj0zoxre4x6K+miZyIB3Vpworx+JXKzJhTNKKiJslcMyGV3LBITJI
         sfWYtocjKmsFjxUL+Nrs743ydQYbrt4RpCw0LFt2XHJ7/530RnjhNyrsteCYBaS8ZvNH
         zViA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793848958; x=1794453758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        b=wfKj1buQf/rydzJNuxv/MSQxz9n5O0E6PI+4GaO4nSUuyc+mE3m+KuMYE+3ENtMSOw
         xi0XQtoXxUTXkdyvHM5PpS0P71lFsYi58/bgV3qG72I27WGWAx3i78Hq/PGE3dJcTMcr
         HYmSTUJ1w1NbMTJ9E7RnbniUge1GF2z6Nk+ckX0ePry1O1ylw7ZipyCmuyzYv3HjDE0k
         ydDH2CsVXRxAuGC3ANurAWomBm9/kUlPhcoghbfEXyPmUSQ1mxi9uOy3fnF+Y0nWgmrm
         tFTG/FTgyn1D5L4wfKlhfaAE8urWwe8WOheH3ZkQxcic3LOTS0Jw6WOjWselp0G7OIsH
         vSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848958; x=1794453758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avEJPS9ML1med4KWJvijH4mGMhfCeFDeDWnEyAF9h88=;
        b=A4ud46O25viEIRWYMArbve+bj/bm3AIMxk8EB2+oBlq3YRN7KM/Vv2bEE4f0ay152w
         s8UA0tzxWckUwPHXNxdjWfwCF39CvNLqWq6lE/tIymbxkMDCvXuxS0OGAk/X0dP1EOHM
         8pcRyd2RrkdX1Uy3TYuvm6hSFD+a0xk0ez1iKc/ne7vRSxMEhPWVQdVnPPOQ+IRhQgDv
         XMsPxPA0mv1N3OWLhJvS8/V5unQmga57g7zuBheT5dkgtzJ70t92jYCfUWkItBh36zmr
         MGvp5UGaBhcr9kTOqSZjCPXoy+7+QM13XYedUTMkKNtH9ZmnN2UXttXnkDjooyOabj46
         VA8w==
X-Forwarded-Encrypted: i=1; AKwUvByrQdYZeWyel/SceaifVov3WmqRegB6fdKtuURaWfDS009CRRbC3SvdbgWZL/IJusr7FM/6VEXtiVyLJqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OD91nsEBf19CTNqm26JJldzYFdeOlCx9ofNoeGW1D3SgPlzIa
	K7QXpi17Z+vjZlejJIwvdZJsW7+fYw82KFUr0r/tAdWHnXQl34N3SH9faFAOYYBpVMlx0kw7lys
	ZqhgsBOWIda1oKhIUU+a3gAqPHWtDujg=
X-Gm-Gg: AYBFou30VyOtxFRqVovRYCaea+tdUNev21PPdd96MPB0cBOcZBK4rAwvuMZIqkU1auz
	Jt21XyYpuRtuJuk8e/ovv4bn5Cc2h1kP9BN6IeLpSNaE3bps86vLzNXzVx6pz0bRQ+wmh+e7Bfm
	tJnvxb1eH+32EEvJrjdVcYhfzweWWnti5YYCmoxED4JzxfZW9X3imVY/aGfWnQOIZ4sPHw/ICib
	QJp0UobsqmVD6FWynRlutqZX1uLQntJrbf8LqhqUDcjgQVfGs07j3eYwW4imF7N0jEiVNT4eQCm
	8Tto+oUVOlKXu7Ir6a0/zvcpmBcth0mgHpnopMG3yM1Sdt4KKNSYR9MXgvdDzT29l+1miltAjs6
	B9wJ+qCq8R0mF+HH4vlH1Utl+xF0ZUh3vMQ1rf/R2tJ8PrnwQXstv43vcMJk=
X-Received: by 2002:a05:690e:408b:b0:67b:fe7e:3796 with SMTP id
 956f58d0204a3-67bfe7e3a47mr1118045d50.5.1793848957564; Wed, 04 Nov 2026
 19:22:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 5 Nov 2026 12:22:26 +0900
X-Gm-Features: AclHuK-SpSCz6RumENvx2yQ6iVXRKTEGvo6_tUmRKMrurLM7QwlEqialnFZRCuI
Message-ID: <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

On Wed, Nov 4, 2026 at 12:53=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai=
> wrote:
>
> There is no way to tell how much of the NPU a client uses. Implement the
> DRM usage stats: account the time each job occupies a core and report
> it per client as drm-engine-npu, along with drm_show_memory_stats() for
> the BOs.
>
> The cores are identical, so they are reported as a single engine with
> drm-engine-capacity-npu set to rdev->max_cores, the number of core
> slots. The time is summed over all cores, with an atomic counter as the
> cores complete jobs concurrently.
>
> Jobs can outlive the file that submitted them, so the counter is
> refcounted and each job holds a reference. The time covers the whole
> period a job owns a core, so it also includes handling the completion
> interrupt and the gaps between the tasks of a multi-task job.

nit: "the time completed jobs occupy a core" would be more accurate than
"the whole period", as timed-out jobs are not accounted.


>  * RK3588
> +
> +.. _rocket-usage-stats:
> +
> +Rocket DRM client usage stats implementation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The accel/rocket driver implements the DRM client usage stats specificat=
ion as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +The NPU cores are reported as a single engine, npu, with a capacity equa=
l to the
> +number of cores. The time is summed over all cores, and covers the whole=
 period
> +a job occupies a core.

Same here

> @@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driver=
_ioctls[] =3D {
>         ROCKET_IOCTL(FINI_BO, fini_bo),
>  };
>
> -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *f=
ile)
> +{
> +       struct rocket_device *rdev =3D to_rocket_device(file->minor->dev)=
;
> +       struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> +
> +       /*
> +        * This is an estimate: the time is taken around the whole period=
 a job
> +        * occupies a core, so it also covers handling the completion int=
errupt
> +        * and, for a job made of several tasks, the gaps between them.
> +        */

And here.

with these addressed:

Tested on RK3588: no OOB access, and fdinfo reads correctly with several
apps running concurrently.

Reviewed-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
Tested-by: Gyeyoung Baek <gyeyoung7182@gmail.com>

--=20
Thanks,
Gyeyoung
