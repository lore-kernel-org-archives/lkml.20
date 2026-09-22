Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005F3486420
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061199; cv=pass; b=i0o/S5FIgQNxVlsLKkWmJ44ILin87YJwUu5e53hn3NcJgppWjG3O8HRYEo5EvPz85+i8YhF9U3+OHxfIl+K6264rckHjbcHiqrfC2dO7PXVmIPx1MINnaQJ7laKUOZywZiK3+aYQrCZEk8GQ4vuFp3HtUX/SQQaVCW18/fU/NWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061199; c=relaxed/simple;
	bh=j+A0Ms+9qRKBqkCceSavfxiFmZ1PrjaMnHMAUYBtlEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxnEV+2k7I14dxzdIiRZCfkU3aObRYWie0Mves3TxYo/Y/bA1QxCWt/10JffFj3MzKkYI86rpUgTH2HyIr3VIjXzX4HUP2JWuUo3wYQB6+fUvdC0RNCvRghXUAp2xDafv0/ZYlb+vH3IOgx3xY0HKmGPA+xsiqyA9Edo/gzPIYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5RXaH9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToUmctaJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5RXaH9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToUmctaJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00IUa2673932
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=; b=U5RXaH9duZX/w3Vm
	8dFrpKjYJnbM1wV24nKvWsykbt3UcnbvsNoFPTcmkVeGnj5x6rOZlUkq8fYcbeAw
	xHngJv6BMG9BIIFZt5FSv4UPDrw5cs94He98YLZM/FoqQlBJVZZdKEJgyMkvUs2w
	/ozNwweL+dN+LufLXpJD8dFeFhPxlXWM+BfvKzYzGxlU+hTtZWHDCkVYj9hUMIrF
	KP8MbnQnPX4RREkGfR/CiEaU+EJYDS2e090zweJ6xNZFUIbxZdi5/8F7YQhxvbGS
	c38H9pB0o2XI0PeSwChhbOmVeF0XwmjMpOjBQX36/oCTCbJM5/gD/hG45fHgwpvi
	90aJ1Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7aydg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:13:15 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c416b236so15680937b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790061195; cv=none;
        d=google.com; s=arc-20260327;
        b=Bf6QW8uJaVQEKnrEFYrsIeni1Y/Chli5MtT6S4ZWwefaySAREn++CrHa+ngnm3FF4v
         kEkw7XDcvoNMGZz3gUkWTry1sj+7URerjJLRc0YRZbBvYajZMdX06m6w73s1dDO43BaV
         LYIxKscvC3RraMXGtxMSvraRvS4YnRUyYKBUlKykxA8KV9rM6VGHxJp2WiOOQ0PV1dBo
         YYa/viJh78OGm6sysczcf7KE16A/oKFZSBKSoUpIAGMP5+IVRQ4B24HPBxkzWxA9S3Tt
         EjuPv2dDF5DVMtt5uEg+Kf+qw9Hn6/lAKIDRLODswlTy8bg/pWPSl+4OjGuunQ1Gpc9g
         u3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        fh=VXGEaGojJKn1mYC7+9iphSB+3I0p7om0Ij0jX77l6Lo=;
        b=Qryb55Tb357qZ0HElPdGPO0JbT6tRhJf6WBImcyraz7p825A8uCcILer5k6UJbWBZM
         NxDQj7XNR9lcpo4VYNvaMBPnCWaFiQIYcoN2oLUapUNpOzNNBIeAq/NOFNC4EfPE+fq2
         hNgQTUcUNHQqKXh8ug9HoX5IASk9vCd4O2/miUaUpR/F/QJlVpR3RkYY7i7O/46kh+oo
         C89/yX7IaKvcIqdbg8ODeAQcWSrKUOrXOtK+2gFyrBSJccY1t8bd+PEuBdLnVL2xRBVV
         u1Wj3q86wbxH3KxQ3hdmPYs+VXabkbjqBExM7luNR0X5c7CNxNJoWLJ188cUNwwpNXpB
         b2QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790061195; x=1790665995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=ToUmctaJ7zETvBGycvW1XG+/V6s+9ppNzEcDqz0kRGiMyqC9MRnMq8PrYGzObZhDeu
         I3fKQXEw2kpqAuA8B3eXoKbx+IvfGdcngm29mfPL5x/m4d2dgIyQWp8LcPgioct5XHyN
         LOOqRCbSGTNTAU0fCUWrLWjyZPnFQSN0RGyTdRoC2t4JnC/KdbO66xvBGQuZ+nOK5Cu6
         HSkKaM4skc40iMmANn5MTcnNi17PGnw+0NoBdV5PCCIYKqi7yP74WnUXjps/WV6TIzZa
         36aSiCfuirGXvqi1WP16qCVAUkHDSPgbgetfT44qsU2gzrGM46eSorjihgGAmIcCL7Jf
         LUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061195; x=1790665995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHEHOSoYVba9nIaawhkOiMNpAatuZWekUPaJpujE+kw=;
        b=dr1/mw/+FMB5iFA9QD8ZPEsfWtUdPEtyjJX59XMgKbZ5WCY/zlm5m3hPd96TnhZu+n
         vZPv7aV7HK38BDwDdCklcMNsQZwIYa0fwi/upSXbR8lheu430ISauWm0BswRq0GE/+mv
         toxdsxHN/Y8sbW68XqfuKcOJi70FH+BSll7k9jxxfUBQZbyOABd+5oVRP95L+Xcice5m
         jrI3PCsoj9qHdtvrd6SCP4tlJZH8t8tp3DOn4gJRxxnqZOTn60imFvEUmxYKoQh5PQpL
         YPqGX3GC4APrfDNFLOXFFpyXVqeVbvZLXkklk1fxDGWsmF8qEPeskVwgBUmObg6LiwsB
         EXZg==
X-Forwarded-Encrypted: i=1; AKwUvBx1xrs1o97GFSqEA7p2z5BCeLInZa3x3sN5I3qTQXK161OKjRdF9T4+5cy+j4tWmURIyNJo88psPrT+SEc=@vger.kernel.org
X-Gm-Message-State: AFuF++lrecLs9OurqvYHLERkjBLQX0P2AszmugWOQHvmOHOKvBiQyuuf
	ypzaBaeCGwtg5L8c1+4lY/+kA1YdIaUYXUwFo+2JBb7MpadP5LpRgfV6h5LVySiMwuB4GUN9+I0
	VSiktyjPADqnrlPF42g0KTu2aumgD1VQrSH7Q/WWeKi3B9oaR3D284Hk2gfBUiHeqLtlnKfvP9s
	Ymijffl+U/uuvHfgCXvsNtlUOfPHxf7PKSo9umIE+q8Q==
X-Gm-Gg: AYBFou0OMzDwBKVlA8vgAXx95C2fK0M8LHIqXDgu8kMvmGZqZ3Ko37ZDYZduqcL+BTn
	TkOlwFbEkAUnsvOqrV42n8gyBe2+Owekjvf2dVsSi49fmOaFIpHRu8PTfiFwTJolCN/mWmId+uf
	5Xb7QQ8MDVIqMpVaCSvTBpCaxF2GwK7I1GYSXrpyecd7iHZiyBILGQHwyWoQ==
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id 00721157ae682-8973266f5f2mr24275407b3.4.1790061194791;
        Tue, 22 Sep 2026 00:13:14 -0700 (PDT)
X-Received: by 2002:a05:690c:e255:20b0:891:f838:80ee with SMTP id
 00721157ae682-8973266f5f2mr24275397b3.4.1790061194276; Tue, 22 Sep 2026
 00:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:43:02 +0530
X-Gm-Features: AcwNN1WZYyoAGxPuzJzO4nofpNWXk2TMHZ4rOAz-NDcRfVNFjwdYEEym-pXugIM
Message-ID: <CAGptzHOtm=k9Yo+u0+uY+ZfHcoahOEVyvvp9BN0W1jGLFbhSiA@mail.gmail.com>
Subject: Re: [PATCH v7] firmware: qcom: scm: introduce keep_mdt_buf flag in
 PAS context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DPv8-_XrausyRhe7xILPj8UWN9unM_JL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfXzTe5ueoySKV8
 hDYlT6/lQNhXuad12LCTDd3LOnrGgzJeII3u0xsETnkhcnPuFKysvNRVPThMZuBuSodob+aNG9A
 tY0mBkdPCcZilcRVEVFpOAjdtd2mdtP8JXKiBchnFPpzPoW+wzSwilH253n6DbYnJ137Iy64jHA
 te70FrBjS8widcOd4ksq4OwVnTY5YOhMl8h4CTSMibs0Y4clP7APTROK9KroBw9acHwMx4hsrxS
 Vm/h7qbHZ+nnJf+ArO916B+oOxmh8CkJ6+szbOTnSyhnL4ftWm2aWqw9wP44lAU9rvs1zHHgoSX
 k90ur592WkvVncVgd9+k7lblNqwv3C+AuHxjcESnIcWqyVzqmDMcdNQLob92Coks4/L6SuF0czt
 be0Qw0d44t4/Bv5gNk82bqS7On4RLQ39SE5AOfrPN3CV2WYBrJl2N/m2tJcy3lb7TJYpa0LRAzn
 PD1ALtT99KbPkcPBZUw==
X-Proofpoint-ORIG-GUID: DPv8-_XrausyRhe7xILPj8UWN9unM_JL
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab22a8b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2ZNwESTbfqjtqxM2Y3AA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwMSBTYWx0ZWRfXzw40HfJsXO/E
 ScYCBi04JI/pIUpDNn7xTTt0uiofrPErH/zCHd/TD3DoaJXlpmB3FVbxbi0z9T2jx/DOGcwL3YK
 JBCQRJz8G0jx0l899TMT8JDMiqxztgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220101

Hi Mukesh,

On Sun, Sep 20, 2026 at 1:19=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error=E2=80=91 prone and incorrect.
>
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>

Please update the commit message to use qcom_pas_context instead.
Also, why don't we handle this case in the generic PAS wrapper since
it sounds like it would affect OP-TEE backend too?

-Sumit

> Changes in v6:
>    - Other patches from the series is merged.
>    - Removed dependency on below series by adding keep_mdt_buf
>      into qcom_scm_pas_context structure as well.
>      https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kern=
el.org/
>    - Addressed minor comment on the documentationi.
>     - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868=
271-7-mukesh.ojha@oss.qualcomm.com/
>
>
>
>  drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 28411a76d1bf..81bb38401d54 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct de=
vice *dev,
>         mdata_phys =3D qcom_tzmem_to_phys(mdata_buf);
>
>         ret =3D __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &=
res);
> -       if (ret < 0)
> +       if (ret < 0 || !ctx->keep_mdt_buf)
>                 qcom_tzmem_free(mdata_buf);
>         else
>                 ctx->ptr =3D mdata_buf;
> @@ -664,9 +664,13 @@ static int qcom_scm_pas_init_image(struct device *de=
v, u32 pas_id,
>         memcpy(mdata_buf, metadata, size);
>
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> -       if (ret < 0 || !ctx) {
> +
> +       /*
> +        * free the metadata on error or if client didn't request us to k=
eep it.
> +        */
> +       if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 96a2436b777d..40cd0f101a67 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->pas_ctx))
>                 return PTR_ERR(pas->pas_ctx);
>
> +       pas->pas_ctx->keep_mdt_buf =3D true;
>         if (!pas->dtb_pas_id)
>                 return 0;
>
> @@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->dtb_pas_ctx))
>                 return PTR_ERR(pas->dtb_pas_ctx);
>
> +       pas->dtb_pas_ctx->keep_mdt_buf =3D true;
> +
>         return 0;
>  }
>
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmw=
are/qcom/qcom_pas.h
> index fb2ec3be6a16..1d132e89536e 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -22,6 +22,7 @@ struct qcom_pas_context {
>         dma_addr_t phys;
>         ssize_t size;
>         bool use_tzmem;
> +       bool keep_mdt_buf;
>  };
>
>  static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ct=
x)
> --
> 2.55.0
>
