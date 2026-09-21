Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8EA48820E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989527; cv=pass; b=pEw4hup/jfTkwZtHtobyrCns+kPYVXLNIurtJq/bgjyGzeXiy03b/LXHuxAnMR2uPK8pX0tmpNYrtkQ18b2sZ/H/3JXffrGEa5QWNBLpG1BcGNLr9DhbRskKOELRppokZeEUVaIOHflieHHrB5OvQZlCsmGAlOptddZrw907PdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989527; c=relaxed/simple;
	bh=UiU20cy2YdW0ZLpH/v4KpY+lU5CRR3LTrFWqHV5tSfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAtlt2i8LgJrPTdN6CGBtN4ey8QbLAde2JNNTHUQH4Vjb/JnWpL2wMCGh7E0hbB1knDgkahvxv2Vx4WbOFmY4HaWiK33SYASj1RjNNTy+yeMIzt4+ymuw5E7WaSKRfYX9g+KIB1xl7+aE5lhSQ5BYodHFE+CJsNRh9d0Cwsp68k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+UKQ/xV; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+UKQ/xV"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7911e4349d3so118314137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989523; cv=none;
        d=google.com; s=arc-20260327;
        b=kI/RZnqMypRXuMXqHQgi9wlOb5i8HByu5YWatJazFMhdV2pob4VuKNZ5wjTuhOf1Ab
         1KwkaSpVhaOGecbIwOCnTGYdI6BHVGL+uCKs9w0lTloKFQFIXfBq7OgImjfsV2Paxw9A
         J9ktDnuzbz2SUcadDCeiR65eY5pNJNYQ5tjLX1XbCaOJsznZLmubxtmMVPtZb3l4Xwer
         26zyrsnm/v84ic5aLMLv/paZmtlAYxHI+fTzYdPfr2H6VcDCebgO2PNK2utVQ7bTbtXH
         4ifiQiZaHduWkc+z6obj8jOv6Aef+RSiEWFCU1uMD6sNPn2J6D78RjhohKHQ+I+CH4uv
         3lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        fh=724nu6EUd6mPYzUuV+FbrOMCamHX7LQXWI5Mo8/1UWo=;
        b=YehT7nIhV2gY9DdHbHqYHVVgGbFb4BkT2HHALoiP4a7U7kNCOUznVxCV+/fwzSnfTa
         QT2QaZvVnCGR01KMeBQKxq1UcgVAPmIuSZRq+QQqcbZB1RdMYBl3RfzxfMQt3rfvAHSQ
         PbY+sUxVmhDlr16j4TQbYJjCVsYJfcHTgheTt6y34qIaG1tt/1WT3ImgDIQpRRdys/FT
         16V1TAGnkBqem0a/0fct4dopZ8k8RSQ6Lo0FloS2FfkhSNuri/MyfO0tVEhpPsJ6nSXs
         Zjva/NFa6g26eHyL5vlMWGmndw6+t9fXoE0pmRe8MKa2T0vUaPEHGPqbTtrL8G99AJeN
         8A4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989523; x=1790594323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=C+UKQ/xVwnK5kj0/f67rZdxhFz6nrbXVmkVPybh0Ie0LfvBQ20w2wkp4n4J6HpSldE
         NTeD5LErsyFet2bTX+ufz3gKopvmkkNn1foQjqJfVY30sEAoJhqTNNtrenNb74BVk9O0
         gryyXr+qV14EACci82f123b2HMJbGQ1fnAXfE7w1aA4RcSlpq6RVqwrKCoR3wiPCeIKk
         XEd2Ltv9ueorhmbmeOA/Xst/CS7yo+IPFPcWg+ZlKD9evniG9LY/Dnhbc1VE9E32sGOX
         ZLUclRgeFRVBaaZw9x7Y0+QXpazPzSL4KuL56a+48eENCrG0L5x7wW86Bxv6KBYEtPME
         o1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989523; x=1790594323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=wgjuVfZwb4IrevVCArPPMp+SgLjSCIDT8j9vDVTJB2ZMqjyI5tpYEaWlryUrX4vVhV
         mJGRi7r20GnM7VfwFAfzFtnbgzguzITHsHoZyltlihwJARJvKywhR43olk/p1dnNOkfr
         8j2bpQNsJ5jO/C8OhU8kmTi1TkSYcZiEQqLyFYMdw70ZpourjjrMhWvntXyvXidNgILd
         998rXaIbYP5fLdS1VigkfB1QtqsRBp18SGcjs0u+DEQ72EbqzdxZmWRrEyxcobeQIYCZ
         RYpKwteiJyDvXiaMN5NkZoHcugAM53wjts5P5r+eKH6DDkbWjmhI+mlEALOXQ9AqhH62
         mTFw==
X-Forwarded-Encrypted: i=1; AKwUvBxuGmMmGVjGKmwDazyxXmALre0REzMBCL/lsd14Nv3Q4IHtS1dHIepOdtfJkgyBRpYAky3+XHMIu7VFtWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kzRFlV4TfHWnvtcyU3XOPrtn0A7ifTX2CYNbvAXyZ3O3Xhd4wx
	RCg4RAAYincEwOaKi9OF3YJWsKO38Fg/ocA2wCwHpweFMPKvtbR5xvTK3fuEmM9OqeUeQ8ixyUT
	mntj1wA6LjokJxvaUuR3fLCwYXl+BJWU=
X-Gm-Gg: AYBFou1QyrIf0LblnJUX6S2OW0Leg9YoPeepFun7LsYZcE5FBJ1u6Nphz1i/czIeGGM
	L2i+pcRtAfFD6JSJlBXvTBSRN/zV825kiiLK4ZmJGPBH8zC+gj5EHoUXVr76IouNoKe4yoAtdyW
	s+3gQvlivRQtxLHhB8t6WL2teYdxW+DT+nHuzQ/LrwumKhyFLW2zm5xq4GlVXmtvwT4/OlL1mfi
	I5IkzuV3UBFlUOv+j/kdRi/4RV9FhTFNHb3VDwbFvjbks+wyvlQYz2XifYY4gU2SPcWhRUU6Nlq
	Bx8N21mnDIfk5niEH+i/kA2JuCK1Efys3QRNidHtpadG7jbX9Jj8sg2Nog==
X-Received: by 2002:a05:6102:8485:20b0:7a6:81f4:ed45 with SMTP id
 ada2fe7eead31-7a681f52721mr1746808137.2.1789989523325; Mon, 21 Sep 2026
 04:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 21 Sep 2026 16:48:32 +0530
X-Gm-Features: AcwNN1WXDzMOYUpzBsDst8BavH57bPBz6X3QLpTNZ3TRbxpATk86bD8mnynpp8Y
Message-ID: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn, Mathieu,

Gentle ping on this patch. It has Dmitry's Reviewed-by from Aug 18,
and Konrad's question in the thread was resolved.

I noticed Anup Vishwakarma posted a patch on Sep 16 for the same
off-by-one in q6v5_regulator_enable(). Mine was posted earlier
(Jul 10), but I'm fine with either being taken. Please let me know
if anything else is needed from my side.

Thanks,
Sailesh


On Sat, Jul 11, 2026 at 1:17=E2=80=AFAM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> In q6v5_regulator_enable(), when any operation fails for regulator at
> index 'i', the error cleanup path unconditionally calls
> regulator_disable() starting from index 'i'. However, regulator 'i'
> was never successfully enabled at this point, resulting in an
> unbalanced disable.
>
> There are three distinct failure points:
> - regulator_set_voltage() failure: voltage was never set, load was
> never set, regulator was never enabled.
> - regulator_set_load() failure: voltage was set, but regulator was
> never enabled.
> - regulator_enable() failure: voltage and load were set, but
> regulator was never enabled.
>
> Fix this by introducing three separate error labels to handle each
> failure point correctly. For the failing regulator at index 'i',
> only reset the resources that were actually configured, without
> calling regulator_disable(). Then roll back all previously enabled
> regulators using 'i--' in the for loop initializer to skip the
> never-enabled regulator.
>
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and a=
ctive regulators.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index ae78f5c7c1b6..9a17aa065f50 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -311,7 +311,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
>                                 dev_err(qproc->dev,
>                                         "Failed to request voltage for %d=
.\n",
>                                                 i);
> -                               goto err;
> +                               goto err_set_voltage;
>                         }
>                 }
>
> @@ -321,20 +321,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc=
,
>                         if (ret < 0) {
>                                 dev_err(qproc->dev,
>                                         "Failed to set regulator mode\n")=
;
> -                               goto err;
> +                               goto err_set_load;
>                         }
>                 }
>
>                 ret =3D regulator_enable(regs[i].reg);
>                 if (ret) {
>                         dev_err(qproc->dev, "Regulator enable failed\n");
> -                       goto err;
> +                       goto err_enable;
>                 }
>         }
>
>         return 0;
> -err:
> -       for (; i >=3D 0; i--) {
> +err_enable:
> +       if (regs[i].uA > 0)
> +               regulator_set_load(regs[i].reg, 0);
> +err_set_load:
> +       if (regs[i].uV > 0)
> +               regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> +err_set_voltage:
> +       for (i--; i >=3D 0; i--) {
>                 if (regs[i].uV > 0)
>                         regulator_set_voltage(regs[i].reg, 0, INT_MAX);
>
> --
> 2.34.1
>
