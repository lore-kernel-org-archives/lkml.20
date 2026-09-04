Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C844A730
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514916; cv=pass; b=GR8UmLNbLZ5d61PIp3gnuEC5iCjt1yJ2qfSz5eCOVuQpXi76k8Ck1mR8oR5J7dY2m+17t41Gowhgn33dzXhYuRMGmBvKqK4DU8o/O+cDRGdUvNFHqBfIKvqsGvv4l1KcUbHHYa7dZUuSV0173UJtvJBHvgnDz1zJ8UmCsl99jaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514916; c=relaxed/simple;
	bh=fW/lJf2KOwA98xIgXZaecXl33Btgc1UgRDfZfpjaz5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaJOp5S9hMP7QU1YLUqoPdV0NNpyPAO7m5g7autBEv403drJfDQRQ/AxmTwP6wmagA/4+ZOLjgMCyELDOSeSHDtKglEQSZ4jU4EnONu5pKE4sbDkNztqYLGKxqqr9IefO7IuUTo74fEi5uSBZJDwayUMLzK8vzc0HgdBBJE9ysU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/1p6bDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/lnRKqZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/1p6bDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/lnRKqZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847muRU2351618
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2E3NOcNS0Jrf1iDrahKhhnn2EkNDFS2oGiB4m/hawxs=; b=m/1p6bDJhbcvyAvv
	FCIbW0xSwPgxhakn0b4i8Y+2HxqXcGy8P/61V702mMnKPuAiIYtbYPuJ6czD9Wfl
	PUuk84OWr+XKKSzwcP9UiwPBnDxD7N9DNZKYIgWt1i/889knJwk1B0EEM2BZ4Hvw
	twow6ujuctNrePq1ZSu+Rm+QYknyx5Abt4KneqInvIcUxqWX400zv8dIQiN4WTOK
	GnzOsOpI/nJhZ5AwY0X8BiLSvSSUmAW9TtdllRBdIFYxIwSBjZAdg1IzP5YhuoZI
	2KN5nnEqNeJzTLiHPAlfcouhH4irE5lWzDlLRej1dnoo0MUGOYXLMHfihoYcZh/x
	hf2Hiw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh4pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1412996a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514912; cv=none;
        d=google.com; s=arc-20260327;
        b=shG3Ko30zgUTGRg/jVK1gr2SEmF+ir17wJkYEsxlmfYYwxh/UIP+U6WDSePj2+e0At
         07bvF9lZMOH7q5tXYzfGxX2xbY6+RLo9JF6nHVa0VCxaQIlefM7IBjsF5TBNpYiYX/Ug
         NMvIBU6PBB+VKUzPgYmFc8rrijhfYGQhl9amVC/3DcZun8c+FA/zbqb6kz8Cqt91wIPB
         sNHsccvhx2r6XVxRCIjemPyme4v/HuHA1K4V1Kb6U6Zu4lY36PQrn18QZhlE0BjQt+or
         F2gI53PumIdt0vyese3sbsQeI5TgJZpAI5TfQ+KoFexnyZe0LY9JjqM06hVIM6P0ASBP
         Vxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E3NOcNS0Jrf1iDrahKhhnn2EkNDFS2oGiB4m/hawxs=;
        fh=qhAofe4YgCa9DlYGYDjQ5iTh6ARK/519OqLg6CQxl/s=;
        b=sUxEwkhWd6613tDN9I6CJbm1tRgYET2CTRof2BA0zhbY8AJlEAzdqY4L/kTiM/W7nW
         nDJuZ9thwQKlZf0fWpHdbnWzEvtbFdJLGjnldH3RDZtmekK8rzH3QwHCx1DsOh/pByxe
         8GnAvN/HwpISsubo3o50OZJ/+J1a2El2G02eGtLssXjBdcitt7dpGH9x79Kcl5R283rX
         JG/EVaFnw9u7zydGWTC+IqiuMYaCg/hxH+Rhz5YCU/jE9ohUKj+wWQQdF5YhiyQ0z9nr
         2cuI9yNWajb+oO3BdmTLhxteOrGW6pW/8UJt621Xr0YvbSjtEyCQCbFNWTXwaVek0Wpu
         NwaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514912; x=1789119712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E3NOcNS0Jrf1iDrahKhhnn2EkNDFS2oGiB4m/hawxs=;
        b=Q/lnRKqZYZwhUZ3NPccWNqsfsJj+YynG0f2/ACXxOu8uKBASK9lxGkRUQNFnMzHrVW
         sDlsYiO2ZqRntKZDhnAeLFE1kpjm/foEMycy4pyEPunt/LVAb6suh4AedaJLib3Bm5Sx
         d591O+6GJ1Tej0nrotlor+l593+QwM1p8PVwqVjtzDMopwr7RJu1AGQRmiXoSzzdccTN
         /INfUrWLVqpay0OBSRbqJz3KKRqGwDzy6rSl6tqeCH7OdeJCMLzA9TtRn8m6NiPz4+kM
         eOPYs6zbRmrWyiWuUVXFFO81C2SEUaIANaOReyY3TWiH9SR3RhYKunuzjnbVuEOuXFyM
         nR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514912; x=1789119712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E3NOcNS0Jrf1iDrahKhhnn2EkNDFS2oGiB4m/hawxs=;
        b=mpOPTitbqgUvKhx7FZGbaLGwPFo0iEs9/kftCLWKOAAyIWMMXKr77dvzy46tBuTPNb
         IvMIYWp+Cpl3/tCztzrS2bpWbopgBthPsZGsG8IpwO2E0f3OlT8EtnzW8k2QmZzL5PVT
         YTkiIDNUfubIb1OI6+bL1EV7zD1YKCPDOTWvKVXBC2Dck4BhGUTEzNQPjLfATE54Fo1R
         Zji9adzfXz3igRYWOa+pUGI+VeunujNty+Ju6C3uDnokohH+2xWgi/noWp8l5kjd20u8
         urCrQ51JOCRq3BXbCnt0+78vsQUlQiVWDJ3Aa4qvvBHfASjB+JMycg/RPKaGhOv1zLb9
         DdOA==
X-Forwarded-Encrypted: i=1; AKwUvBzpA+x90hRc9bdDJa5FzQeuGUM4IVZBQmIUA//F7zubAvKuinnpkzQtytoNghxVKzLCJMozpB6ponl9Gso=@vger.kernel.org
X-Gm-Message-State: AFuF++lyUAcyYIgQKuwTe4gqWWzI6AEl6oRKZStyC0DffOSJOEOsv7vF
	3BqMSfzDljMAZUP8UCtYjZaBl/hmBfZG+7VwxgXcTftoNphmcwm6crP8FdKRQucDiTj1/MeTcSJ
	olZJRoN44TG/D3qU66JBIR/vJ/hM+B1j/mW9HskweQ0oLhyM8CyE0t8L/yZPsD/XwgoLD/gwEFn
	YvJmKKKkGB/6wPoAI9ayQ0A+CcFPaAiYHU1Kfoq6NSJA==
X-Gm-Gg: AYBFou2PF2qX0l1MOW7S8e2eNvfwLuYAOeW+RLN+inhEqx+NYUmOa1yRCVHWTS1a+Yq
	XpPjdmW6JtSC7DnWmEt4TcQCBsFta7xOdZE5DH9pqwLnQIEiZUenR0phRYMMPkUbEuyHCTNC4n4
	O+aDAAukGLd4JIy69kpHhj4L2HztpJl1jyu7Lc5s1TFf9itC5n9L4eX/ROMQ==
X-Received: by 2002:a05:6a20:a11f:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3da3a0af18emr6356080637.13.1788514911952;
        Fri, 04 Sep 2026 02:41:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3c3:b57b:6285 with SMTP id
 adf61e73a8af0-3da3a0af18emr6356033637.13.1788514911524; Fri, 04 Sep 2026
 02:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814082354.211351-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260814082354.211351-1-fanwu01@zju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:39 +0200
X-Gm-Features: AcwNN1WJ3FDLKcn4NhY0mFjhOVrTyC_iuBbL5V0szQwxhM0gmqimaKPle9KR43M
Message-ID: <CAPx+jO-xK2AWPL5WtOqDbBsEDtHM5d8bLhQcSUj0f+MsnjFOOQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: hsq: Fix use-after-free in retry work
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        baolin.wang7@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a9260 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9HIRHvUZk0GByUwP-94A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MAQ43h2qmz-X3_4_R9uGZb9n5JIb1tNX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX+0Ftn6g3IRXL
 0N6veyWw/ryAxLnvtWeH0BxdcGtMntuRET/QvURkyLYN+T0H79nfqNUmxSegVpwp091CmxIcbeZ
 dATOw7NgcjeRP7NqGwoDWzNAPWykFVY=
X-Proofpoint-GUID: MAQ43h2qmz-X3_4_R9uGZb9n5JIb1tNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXyxlsjYv9fA4G
 hPg+3TsSTboANcZu9H/Lvryx5EjYTtS4LbpgIect30rXONx1gLEhgn9CvoJ8BmpYDQusFeY9VQE
 skS2UNTGm74oZI2I7Km2hLIY3XBBkkYoSgYdGjKFy5943eQONpjrHgxJ4NyoRuVAEPnOrnVY4Rt
 B70D/1FCpS6J+5BWBZfdxWo7HInRqIFX367GId/cn7QgYAS5zgcpkt0o/aV+UXdcgF8CbUV0+NQ
 8D/Prwh7EGt4vKHiSAsR7mmSazuVRvK9JXyjpTle4Tc6zkbet593ZCfOAY1Nm/z1xEHUHlED/cm
 L5DD0qg/VOH6RLK+jRLaV8fq/QWwzSOi0g6Cq+62Z6t+zQuGPxXjSnkQciSfTTvC2SfauqgK46O
 nORRKYbu1W546OcgOrkfX7D0nr4Pl0yipNueEPNrYYijehxD0YUmpxuJtt5goCTfwSTI7z/jYIO
 eMOVneqhhgpy5o297WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Fri, Aug 14, 2026 at 10:23=E2=80=AFAM Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> mmc_hsq_pump_requests() queues retry_work when request_atomic() returns
> -EBUSY; today sdhci-sprd is the only consumer that implements
> request_atomic(). The work is embedded in a devm-allocated mmc_hsq, but
> is never cancelled during driver removal. Work still pending at unbind
> can therefore run after the devm allocation has been released and
> dereference hsq->mmc and hsq->mrq.
>
> Use devm_work_autocancel() to cancel and drain retry_work before the devm
> allocation is released. By the time devres cleanup begins,
> mmc_remove_host() has already stopped the host, so no new requests can
> arm the work.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: 6db96e5810e0 ("mmc: host: Introduce the request_atomic() for the h=
ost")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmc_hsq.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmc_hsq.c b/drivers/mmc/host/mmc_hsq.c
> index 79836705c..57e172bd3 100644
> --- a/drivers/mmc/host/mmc_hsq.c
> +++ b/drivers/mmc/host/mmc_hsq.c
> @@ -7,6 +7,7 @@
>   * Author: Baolin Wang <baolin.wang@linaro.org>
>   */
>
> +#include <linux/devm-helpers.h>
>  #include <linux/mmc/card.h>
>  #include <linux/mmc/host.h>
>  #include <linux/module.h>
> @@ -345,6 +346,7 @@ static const struct mmc_cqe_ops mmc_hsq_ops =3D {
>
>  int mmc_hsq_init(struct mmc_hsq *hsq, struct mmc_host *mmc)
>  {
> +       int ret;
>         int i;
>         hsq->num_slots =3D HSQ_NUM_SLOTS;
>         hsq->next_tag =3D HSQ_INVALID_TAG;
> @@ -363,7 +365,11 @@ int mmc_hsq_init(struct mmc_hsq *hsq, struct mmc_hos=
t *mmc)
>         for (i =3D 0; i < HSQ_NUM_SLOTS; i++)
>                 hsq->tag_slot[i] =3D HSQ_INVALID_TAG;
>
> -       INIT_WORK(&hsq->retry_work, mmc_hsq_retry_handler);
> +       ret =3D devm_work_autocancel(mmc_dev(mmc), &hsq->retry_work,
> +                                  mmc_hsq_retry_handler);
> +       if (ret)
> +               return ret;
> +
>         spin_lock_init(&hsq->lock);
>         init_waitqueue_head(&hsq->wait_queue);
