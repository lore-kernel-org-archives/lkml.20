Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85715342173
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178101; cv=pass; b=Jimo5JmO+QBE438JS/uojkB9vmVGZVuq3yv1UGBr4QVRMb/M6QspyIMz6LVuIxAAm0T6smBEosGk6rZE4WLGS5rhb74C0vs4gEJ9vK85vMJ5q04XBJqFqHZ+ddifYLlVbOYlh0WO3+4DiakDM/78jmha/kHBQAMTUiuN4GKG0sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178101; c=relaxed/simple;
	bh=VFRwnM9iUJh5pkFmmmSrz8i8a58gw6HIct513ZlHT9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqoJWY40dXJPwihmZOBOgtXIbG7CA9De6akHnaV8VPKP2K0xBBqKrtCpZ/KEqzUP/4IQD5Cj6rvZY4sz2/yzAxq7Xo9IyjbLDinnES/Bv1Fx0ZqKsdW7niTEkVtd82Wg/VUaexnHH2ryIAGsB4wrQdQB2oLeGJFoPYBDLXh6b78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAh9sZi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIyHlxIa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAh9sZi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIyHlxIa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C1HbQt451741
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=; b=cA
	h9sZi9GAnqA+3YVu06UOVxEImSlcqa//a75kClq/YGD1fx2SpjurUSVSAUyUFmFn
	UqhPUaRQV8u34y5XCbszsUORzKCufgNJctRaMUbzWElByDEHe5lzXqIgwKK+QkSF
	kjr97UuO7swDPLBSk/8lr0ueerR0o446llBkkP1uJg+axkPdmFUjOnp3kxvRXbTF
	GJqBfPB1Mm6N1ks/uHuOTFcyIcMCBZrW+2lXBKx74YgqBPhMe1BVPuWVwl97bPS6
	+A6Vett/Dl7YUW9jq06qiAp4nAUVkBrZX5sgTNNKUINKFNUh0oocHBymixxNMeb8
	HvqLN3bSO2JcZNNecppQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmusdg7bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:54:59 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b361b477f1so1045582eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178099; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8ln1WjTDI+kzUdi5Tou1mD7x9HtRjvh/drpPybqA4Lj9d8tiovJS7g/UNeXjQsp4M
         aFWm33rxreADX621uF5EEKRCB3KNb3rDMXVWpheylqPajsbFcZJyuGx55juapI+GPAOa
         AejyRxAdOGWAPNzQIHXO9iB6kmLkaxg/3tOdJHr2yhq2KTqY3TrY3pMFYRnKX2WnJd9v
         OCymx8sEYtmBF5fKXyLK+dvleNTSH8W47EPEB1vRpVO65hImE0j92baoJIxqZ3PIRDIf
         AGyFgwkjjAUeKW+GlLjgPD5GqtGIyYxn/WmYekIeL9IWhfHfeI5QKtuo0kIsIsCA4Mlk
         q19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        fh=31txY18xeLlfoTAsuSUZcmUD8MZnfPtvt1Hl14B9iS4=;
        b=AidEds/n6RXihLnhjmdFnrzmGbVY/ZcX194IvINZ2WBb8femjSOSVS68uTyieil7PB
         fk0ALMYFfN94Cd4wAbaIPFc2efxaK1sJJagWFY41m1G8gKjIm3qw4Qna6Vy7NnfPi9P3
         J7CHBV2yZLVuLyW5WlAictXvCAWeaJUqfHqK55Qm44DcDsIUnS4g8j/G1vcVUHLR/V7G
         bdej50hJ6rz82XvDuSbMKN4+3TYObHAfXR4uGmXv+klnhorg6yAaq184/S5iVqRfFLD7
         n9gjsWO+MWmmEjfpMdWJ71HE3CQ+PI05Exc8fRdAce0LuuxZjGnguWUI88VW8rLNmtik
         k1EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789178099; x=1789782899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        b=YIyHlxIaZ5nt9qx1iCE4y9O79tlI05GNN7ESQK7grYydLZ5VJNqNYtfLg4RcaAXY8D
         6u2dBQjx0hAKKL+Cw0qV9IN6qn8NHIzzSoflbrGs1lLjA7xi1PskHu4WRS1oN3q+iJ54
         c9eUUR3AzKktaHq7/XOYxfvhFnorNxjzLhH/ZVgcCTjJDn1o/TAVvhXWzYa6zm3aosdD
         3PCv8V/AFMMnpuucOX9+GpLLUsSu4iXj4ZLzVIhgbZPSdjf00DBn3ipKq5D6qokI+atu
         l5+3O1viRhNsVoxPp+KC+cCDRFAW4c5FccwupAgpC52jvAp8eYINqhAVYYAatDMKqIPn
         lEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178099; x=1789782899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        b=e5XsKriz6OT68ZR8Y6mJJg9L2/Vrk1nI0yEtwwG5YbSeFVJRjBXXFzPaM9zupOLPJi
         8ChA7F5M6YlXsOd03asBYKoRaCIeoIRICD9w7yrWrZ6ROnkeiRBYtuPKGv7CaSH3gzWO
         Mpt0cB9Km9Mi+a/y+Qse6R7CXB6gzYLf6zSUTIaCoboOdWPehuNXworB8YhDWUUkQzog
         UlJ1UPylJoaCEJ7cyHeHUV7qDYiAc/8/RHUiiNF+geO4E/jnHisfCv3RuJo+yiVq/2JI
         tqEpZtFUZeKv+Pa4NY/SpURUU2jiKMLpk7/+uVPflEIt7/3kt1Lm2NDk0zfPj85RoVLL
         C+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbQ4ORGK490Lcu9mSmr2ZT4OBTkREzrstgf11r1VykY4L0s09RCgBEOYD1569uZFjjhGNIVtx0o+56B8E=@vger.kernel.org
X-Gm-Message-State: AFuF++k2sj7rb/ZtHlbLaJeXkkHl9zhsKL6lAywv5W72CAQP+pBz6XgF
	eTwViuUy69b0BTnLgNKtBdBwZ5+uqsx0y1lCFmUSQ9jb9csEuPZ4xp49AUtZGu7QF7j/UVDCrdW
	nvMOVmY9fcJPHPCwuegMUDLAixXuQWAgn21TPR/VFecI4bt55C5/IDayRrJHI/OVVU40d1OHCHq
	ACeMQIVSCsQLXIz3Li2vKFjyzh4asj0E/jfoOspAy6OQ==
X-Gm-Gg: AYBFou2v7ocdeONs75J89q+dKJIfY8QqcC6uZ5gnxU2aVXNxUxsRpH25mmpjlu8WAxk
	hoDkgOc/qUrS27GQWx2+JHPXu93ZH55XmvlIuXzOCWyQCJgXd5kz9Fpq6bzBWBDkHKfVwEZKby0
	Cdhjhqmg1zu+8R9blHgFx4ipAa6yAY4++OGzLjnLjXN5Vz2yyoqAqiDCaU
X-Received: by 2002:a05:6820:2221:b0:6b1:5735:b88e with SMTP id 006d021491bc7-6c24c6c8ce3mr771793eaf.6.1789178098718;
        Fri, 11 Sep 2026 18:54:58 -0700 (PDT)
X-Received: by 2002:a05:6820:2221:b0:6b1:5735:b88e with SMTP id
 006d021491bc7-6c24c6c8ce3mr771774eaf.6.1789178098301; Fri, 11 Sep 2026
 18:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
In-Reply-To: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:54:47 -0700
X-Gm-Features: AcwNN1UgBK-qx_vC_r0dZSSzeObThSII9I-bgwOa6aSUrNw21aClLAt97iPASAo
Message-ID: <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
To: Roman Demidov <roman.demidov.nn@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDAyMyBTYWx0ZWRfXyR4D6u5I5e9F
 oQ180ebr3AB3Ho+gWqwdCxAoePmQm/Rl1O2xDFcbHYd3MD6avWv29Us/bcgzx+9XITWDnh5i5O3
 oztqPjQu1jktNbnp6248G/W5uvWbQss=
X-Proofpoint-GUID: GFiU9UW3xSkg1zP9-5LDERhSDccI9uaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDAyMyBTYWx0ZWRfXz5B4YVG//y7f
 MCRf0+GJYbxgQVy0c/vY5klviM60pYijnay7vUKMeeRnn6cBApZAmzBuGMFx+O5pQJPOgjr02ai
 eL1RU9367MXtwGVV0y3ysKQKJIdbG7ll1Bk2abKpj/dXTDhfCQNK9WwxSe24LIm2m8X4Gb/wfF+
 yND5/Ac8y5kYerroY/aqb6BKzGRrg/4sG/I6AQibF+g1vdKvWFPM7qpf/2278aejnQp/uWfApul
 N2e68TR68kERMgFFKDlnrJJDlzS/KK7rF23TXWx5bSx4mwaLOm48NldBrvweEi/hA0NvBkzmNw1
 POkfhnV3No516lHn42Iro2XRKFrVTK+D6EL7d/xXE/0GHfR5TFCbOPi5e6qySxYILMxG4SlP6Hy
 5pe0JFdZmGcj15UgKLvWAyxA7r18qbwW6EKKb/U7rl8sCkGb8EgiFIzT/2UzglD4AF61y+EmRKO
 2Bjtr1UAdOzXArQJr3A==
X-Proofpoint-ORIG-GUID: GFiU9UW3xSkg1zP9-5LDERhSDccI9uaN
X-Authority-Analysis: v=2.4 cv=fudJ914f c=1 sm=1 tr=0 ts=6aa4b0f3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=HH5vDtPzAAAA:8
 a=E6Br8louk_51uBx8NIgA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_01,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120023

On Fri, Sep 4, 2026 at 5:58=E2=80=AFAM Roman Demidov <roman.demidov.nn@gmai=
l.com> wrote:
>
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume(=
)
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
>
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index f9de9329dee3..0cf205ea744b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>         opp =3D dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>         if (IS_ERR(opp)) {
>                 ret =3D PTR_ERR(opp);
> -               goto err_set_opp;
> +               goto err_unlock;
>         }
>         dev_pm_opp_put(opp);
>
>         /* Set the core clock and bus bw, having VDD scaling in mind */
>         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>
> -       pm_runtime_resume_and_get(gmu->dev);
> -       pm_runtime_resume_and_get(gmu->gxpd);
> +       ret =3D pm_runtime_resume_and_get(gmu->dev);
> +       if (ret < 0)
> +               goto err_opp_clear;
> +       ret =3D pm_runtime_resume_and_get(gmu->gxpd);
> +       if (ret < 0)
> +               goto err_put_dev;
>
>         ret =3D clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>         if (ret)
> -               goto err_bulk_clk;
> +               goto err_put_gxpd;
>
>         ret =3D clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>         if (ret) {
>                 clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks)=
;
> -               goto err_bulk_clk;
> +               goto err_put_gxpd;
>         }
>
>         if (adreno_is_a619_holi(adreno_gpu))
>                 a6xx_sptprac_enable(gmu);
>
> -       /* If anything goes south, tear the GPU down piece by piece.. */
> -       if (ret) {
> -err_bulk_clk:
> -               pm_runtime_put(gmu->gxpd);
> -               pm_runtime_put(gmu->dev);
> -               dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> -       }
> -err_set_opp:
>         mutex_unlock(&a6xx_gpu->gmu.lock);
> +       msm_devfreq_resume(gpu);
> +       a6xx_llc_activate(a6xx_gpu);
>
> -       if (!ret) {
> -               msm_devfreq_resume(gpu);
> -               a6xx_llc_activate(a6xx_gpu);
> -       }
> +       return 0;
>
> +       /* If anything goes south, tear the GPU down piece by piece.. */
> +err_put_gxpd:
> +       pm_runtime_put(gmu->gxpd);
> +err_put_dev:
> +       pm_runtime_put(gmu->dev);
> +err_opp_clear:
> +       dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> +err_unlock:
> +       mutex_unlock(&a6xx_gpu->gmu.lock);

this does at least look a bit less terrifying than what came before...
but maybe

   guard(mutex)(&a6xx_gpu->gmu.lock);

to simplify the locking part of this.  And I think at least some of
the runpm stuff could also be handled w/ guard/cleanup stuff?

BR,
-R

>         return ret;
>  }
>
> --
> 2.53.0
>
