Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC90426435
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380594; cv=pass; b=DI9NVnU3PYd9cQ2Ol31+IaxvNQUIxSwChqoLBwfZy4gNfXsoE/Kw4EGQYeDV+ChndJWhUTUJBOlexG3pHPEhKRTMxqGET/N+V5cQ23tJos2hWfQGOUdtm7cTqdqlOtPjVy9JmJqI4wg+L1hmgvk9s6/0k45k22HMXiASnjgPKPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380594; c=relaxed/simple;
	bh=rxWn1cAIMWcSUsbY+qVZFteusHTgY7z1SsaovmP8s/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbBVMwOB3bLGFkhYnkIi1kgLVbkNrbR1wY3jZKuCsPF4I7wPDRAxuWhRGnhBfv7ippemzvX0t7EsKsOOaV1NubnZTi7SWOALh/WTfQpocyGft/y9lw8m9vFUds3pkBL2swh5CKu3cUnysxeOH6zg2fux1ZGV25bJKIkZI8VO450=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cd1MyXOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/wz2CWV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd1MyXOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/wz2CWV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ndtC184537
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=; b=cd1MyXOoNTeupvMQ
	1vlzwu5O9fxeTHN1l64x7hYxAujJXzKCr2fbv9EZX3jztY8QgA3bEZef7KsAMG0Y
	TpweHent0/06oxXjwNiUy69cLhEs3kQa+1FH0mH6pmWttYiTZirymHZCQliftGJK
	xD/mTq439qWXuH534GY9JYVWAu9ZMnjUpgL9Mfhbyful2WZqAvrC8uES+ZxUGAGE
	Ns9w53JtZXdxDqMJwCIuhBgM/xW8vEWWGbQaDEjzKqx7a8UwaGrBeh0bD59fG0Wc
	qmpoz10K8tCCzLSstgxH7TdoWJ4m2zAJerQpmC4T7IM94HQn3vHbZG9Hvrs6Dse9
	3CyQTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c6357-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3078085a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380591; cv=none;
        d=google.com; s=arc-20260327;
        b=IsfhgHSwqpdvByCrTqYQSH1a9ZkBDIMmLp60xu72nFt/2WWgFi0BqxNeCC1zS+5xge
         Y1LbmsDFOalEt/0w6aR0Y34bqTkmPPtZvvFf9GoxA9vXFHWBKC0u7cEf7RZQq1tyFuaI
         B4Ih3OnBn2OTXhU5qNU49Ncafcq/n33RCcl25QoG2r07k6XF97e1lUgbbPXMzHVANSSG
         jH90Buo4jJKGuQOpezaYnCa6UR0R+vfX6wnMnLiqMy48iwoYJ3dUFk2uW+evQAR2BDwY
         7m+nLFOEmUZ8QqZllMteHSoZDyo39c2LL6lhhZ9+aFjbS98Gb92uCjSSoMdmQl2033Fo
         6dYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        fh=gT7Qn8PHUTb84GxSRoBibHxv0ks20tXZECs0GmM8MZM=;
        b=U2kLtgI/6Um0iZPGGgNpl+47dhg79afhC5J6y/Z9+b7Y0YbekDI4+5CiZb4x/KhI20
         +G64BpAo8k7t4bsikiuOmw5pMZp+urlLsAb5Uu7XelV/hIQaoBGxz+9DMMHLc1AQ7PNp
         2HBCTB9JkRdZZp8Dhc50VfjsVLW1vFvuQZcqZfIq8A8tGlYK5gO25CmH/JM9mpbEPfYf
         3kqTS/cwDBPlfNhLS9wvUa3hkib/z/WqLJaTJRk/+SZXkvXwugmDrecT9qTRbN0/TZqt
         wJa0aAUGWRyIOd0LW/+auaOiPxRupQRMdegmRPwLT1urSFEhqSpNZxdHUejER6JZHr5J
         QNqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380591; x=1789985391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=M/wz2CWV5PYRpM77euK4B/KDnemurgzvI0gByOLzdviKCzBEfUtFt/KPJsdkbV/+fl
         9K6H7/MQJMMFvqRBK/Q/QzrgHGkCsejp+cvPy2uvCe3TA6AJwRuJfp1uVGe+dRaoMUGT
         JFoUE2tYZKFNpqd0lct087OnbnfzPN8ooe0HIMLH80d/nzrSDdW4DeAZUqPCyw0VxsNF
         0U/rlV8r2IirjR0QnrYQeD/AQR1jug9lk1KPLB55+Ni1nE0xfB1qQs/55nUlcK4mTAYo
         qgVRfqkHkevsCjFeOHbvKrz4/IUYstjFoo43f0aZy7wqKjdhPBTxGBgbI5p84W3KrFwX
         /NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380591; x=1789985391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=J16He2G//Wc+2hO/2ns4ObOoT43qILc5brDkZMOY8Zt0yF0w6I8QqN1AqJ0juTPzH8
         /EamdItiNp1wOXFFdOCcVGbDS/zq0b/Kyadgm3RBhzustnJxD5mMU/Z1h/zG2t/y5Po7
         U9YJEQcFGWEvS1OMmiaUrOw8z5LoXxjxGmn9rbF67HP056CHvRUm0dU1UEGIdEVfMQlF
         GoLT7TfgegvtBqVFpnPySiFExJOq6ALw/q8jA8kV15Dg0fY68vHVvPyWRi0MFVYYxTXO
         /vGVcJ1rNa1rn6Req2m2oshR/lE66Qr8tDXcsE9nX3di9HUDUqQy0EpSfB1o3FYDE4Ui
         iveg==
X-Forwarded-Encrypted: i=1; AKwUvBxbHZlm2CT9vt4nOkDIufC/cwFoSI4LIvvYUr2c/GHyR5poczbRAhEudIi4v6fD5fh72OlKYneXom03A0o=@vger.kernel.org
X-Gm-Message-State: AFuF++lx2cuU0LL34cQf20NKlj/CeZPKMi3AK6/EX9JGm/kAYM9bIeDH
	WmmM06rrSndFJEALXWTPXcmQzm8ooG22ljB113uB4dI2veH3p3foKz194/JD8m9OsGDB97bQhYm
	VIIFMyZqcJSPisEpsFPt2PsK3aS/8cWc5OSwAIYiPjaYRmWnhYqv1tAF8WJfBb5aU2VhsP4A4/L
	K5mHmxcVpkJCoi4AjkAIiIeK/zLpMrnL4XwuWWDmVaKBQ33ExgrQ==
X-Gm-Gg: AYBFou1CGMfBkAejUbrEeHwwznPrNsEGo96BdZlJOk4s9fTuO0d7xs6a/wVD+8JRNT3
	YiW+ZnooqODiS6vqtDpz0dcrgG5cpwUYYgE1TPDpdkPWN2v+bogkYMMP9bsFvJHJNiAQUVHdaqt
	IQe6zhWJ3q92xoD5IeMz1eOAhWdW3PqK+Ooe5teCvUQcrTJ6oAm/+Mbkq3sg==
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id d9443c01a7336-2dd6c73445amr40754445ad.15.1789380591318;
        Mon, 14 Sep 2026 03:09:51 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id
 d9443c01a7336-2dd6c73445amr40754055ad.15.1789380590927; Mon, 14 Sep 2026
 03:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913223538.91579-1-mhun512@gmail.com>
In-Reply-To: <20260913223538.91579-1-mhun512@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:39 +0200
X-Gm-Features: AcwNN1UKvtuQqttQbqd993vkvprGXBb1M6WJsKdk_G31r2WFSme_tK7rANZaz_8
Message-ID: <CAPx+jO-Vck8PzQjg4yn6ft4Rms2_9eSOLpbAQryMLChY87BPMA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing
 SDC resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nRgqdU5UWfltuxJtMf0irgQ0WC_wLKDK
X-Proofpoint-GUID: nRgqdU5UWfltuxJtMf0irgQ0WC_wLKDK
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c7f0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=_cOgsa2NosUwn6K3uuEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXzxr+TxiGnMj/
 M1A408JxvJbd2bwPWHPuQewY81OWlwwJT2QqoXZI9Fb7u6Ndc5cf2JKT7tU/dl/nFzpnPgkpQJw
 m7ZO3DG8qP3k4EgJhUGMrs3ObaidjM/OlvlsOjmJR0W+IP1XsNcBAri6dnilAujmyQEtPos/iN/
 wGIGrvKgSzk9n1fCVOyOHIL8Wp3VHGsoWjI+x5nnCyN3n0JhrUjx9xXY0Aje8woiw+FJiEeeKPg
 C7bIo6vmUjoo922kUHtCESsWElhkQjNtUVQ9DcAPGfTYE8/0eXiVoxyvB0FRoz1IzNqbP+jFnIR
 wOZfa22eY7+TdOXd330ZJui7S8BBGzGqefZ8RAHMRUKcqb17bRhAKQ82ygCS0JTZYXDblpaH5Bx
 GFZYTCmIJ22Y1oB9W9SiBagblwoDGPtEgdgP9Gmw7NoclxYgSSMBco396crhdZvjYccPABjUZ10
 mDk8d5ZwObml/PQfQFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX7MvJHf6bM0r8
 6cMRD1bpBdDvnW2OzhtItz31TRTza1SB9cIP4BkeTXAHXvsBSJ4T9y/b7fC2fMnaXCh060r0ed/
 Lgn1CMZeaUJWbETUostJgqNh1u54YmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

On Mon, Sep 14, 2026 at 12:35=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> =
wrote:
>
> Probe failure and removal leave SDHCI child devices registered after the
> parent clock and managed resources are released.
>
> Unregister the OF children in reverse order before disabling the parent
> clock on both paths. Use of_platform_device_destroy() because manual
> child creation does not set the flag required by of_platform_depopulate()=
.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD=
 controller")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Assisted-by: OpenAI:GPT-5.6

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Validated with an ARM64 W=3D1 object build and strict checkpatch.
> No hardware runtime, probe-failure injection or unbind testing was done.
>
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index f5d973783c..d317626feb 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device =
*pdev)
>                 cpdev =3D of_platform_device_create(child, NULL, &pdev->d=
ev);
>                 if (!cpdev) {
>                         ret =3D -ENODEV;
> -                       goto err_clk;
> +                       goto err_children;
>                 }
>         }
>
>         return 0;
>
> +err_children:
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>  err_clk:
>         clk_disable_unprepare(sdc->clk);
>         return ret;
> @@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device =
*pdev)
>  {
>         struct aspeed_sdc *sdc =3D dev_get_drvdata(&pdev->dev);
>
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>         clk_disable_unprepare(sdc->clk);
>  }
>
> --
> 2.50.1
