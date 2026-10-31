Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460547;
	b=DBtvOhFRwczfmgV40C3lFgDelFqpyOKEuy9XuMb1Qpxth1al9QjH64mz1mpJQiSCc7+/
	 eeLF5XJibWuLqfzWvfN0HFyWtrHGgqAgULsTbjOtYmQLslMZlUamcx8pwm6l4TKNM/p8z
	 QgG07WU8815LP6OSx63i0TJL3JmJRDaQ8rI+e9VpmDMWgWgOKctQHm8Qh1ggpAZC1Y2/h
	 57OYv1nDBZYsVlyZNFSckbS/zboPGV8Jp9J48lJtTeXRyS30h+pZWphhvd0zFLGVIXbSB
	 SoHwm4z3h7J/IEHv1Uqnay5AaCEttCKtihiKdLz/b8qiMp7RSi+m70ooqYtN7FyZ8/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
	b=i7VD+5mByzAoSfIZokAQ6hXvO65SHAhsQWuxZNeNoUs+oaCAxa5M7qWn34L9ZLmpxgGe
	 n/LaxmFoDkk/e3cAtZvTElfMSDbj1aSSRMMXLZEXQ9V/I7N9NmdZ0M/cnQbENQKYKy6Th
	 Z6Z+iFrAl4NvbbBqajZLgIATIB8qZENV8hVQ026KC9wABK+p8Iry6y2G5PiJTNm7OK94G
	 kRKhEYbew/semV7qv20hS1hE8HbB3PLEZI1Deu8qFvX/yqoXZ9rFbXI5A/9a2zsRlOb6P
	 0L8iSirX4fMqOA6JP7IleWlWOclDvTRtgoalJRCdFMQFGwDLLrpdFsDzf9iYz2oa5TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPzPh+nf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihzX8lab;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF3606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69EF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPzPh+nf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihzX8lab
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD07E62765961
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=; b=LP
	zPh+nfIzFd9fvW+meizE5UlI/0/gV0oPrlbstmsUtnFxGsxSoN27y+3U/Rat0TUq
	2RDrhPMbxk5+kF/bb1GWKDQo9eJ7EslmLQSFOYlBId/QwEchdAwYlIfybEOnEDvR
	1hRu8c6RXGz6QtnG+rFkhj0cbrrfRM68Ewfn9/SBKkt5jEGjsjmDnQSfIP9rL4By
	RGPafwQ4PMyiYUhc21eNPBFMuirKVTbDznmuTyNVubAt1YCSlZjsfVlrkbjyltrp
	NhO++ptbdQLQmy+3zpBKRZ2KYw+rBfIAndeAqgDTGB0YRVxuM4+9Dbk9TVpokYbR
	CQTOzgD8I62VCMLVHh3w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hh2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:29:06 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83f6f9096baso2284226a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460545; cv=none;
        d=google.com; s=arc-20260327;
        b=jQ5q3th4uNMQRvLcU1/GPPVaKza2gc9isAoCWTiTO20c/+VNiKnsqDFXQncPbxxEjb
         pwFwBtXxITHjvicvmxpNB7/+fsl0ijG/nBCyLmvAloMOSGxnAE5Vf0KBr6YCVQU1JdA5
         +dgDMv6gJ3c8SvX6ovrUfDnxS+gcOPO3Lm+zdpjXBZgX0/tRg8IUXgCAjAxqYwuGE82R
         QomNSCgKyNeWjNQEUW+2sGupvTdV2pXDtUn3rjvWoQG0Mf/EQovXP7VwQsMPcxYX4UOd
         bhsfxkS/Naqg/jOymRA6jDz4JLETwjUBDJlLGlGJosiqiLMdH7TI9vWex44jc9R7n3AI
         cM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        fh=6IRUDxrgNOGBWeF18gd6yoiktKOBWCOmWLu663+pQcg=;
        b=B6rYOh//YknyybNXsoKYG3Sg1JTcN2mIw6MuII5tNinmIHIB1zW7UnPQ/STkojFkY1
         28HEhEmnp8thjuGiU7hKxRFao1hAwbYAWw9JekeAFIPZ+qI0ZAHY6KI5yyURgj66Uw0J
         KYQiEV8751ohLNKpSCQP+1pnlX4nWMen7RjvFORyfUpkPw9AgscL7sJH4mcZZoEp7/Jp
         jEdLPsI1nVe+QWyV/1LM/rKR0LHoYX2jj2DMltUMxIsUnJkuODQjtzBtqs+ABVvvqttH
         yiqjQarM3azskDIQy7JGZERO5gKaQtUQHQ+2byfyRXxoFHNAn16EgwWFhg09M3ROl7me
         UffQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460545; x=1794065345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=ihzX8labC+qmlWO6g85jUdivnUKiWaJiTvDqedjcJoeGRx1CiMr8u4zfRTIunzm5nV
         sbsHkESvbWYQ8AgXyU3PT20eR7ATjVCBxvN4MeSbpGDu+ms8thzH20unsLO64GZZd92y
         DlZUIZJlUT4CVj4X67D+0g5HKRxokGfIEoP2y+qqJbw3rY94bDaWdgWIVxgHWb68QFfH
         BGVoCB4DdwqBav2TmPjhm4x/7AOSBY7dwQ+Q3xtTnP8nrfnwQcup+c1qVecoQ9TL9gWa
         M6ToRJui30wCzqDPXNzh4RFWyp/uH9JSKRlXvCS+7wcuNMHqFUuP58XwJMySlaNPAhOd
         W3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460545; x=1794065345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=HpQ5jts5yaEgx2IoJ2uEHX3pzlXFFkPiY/Gaq7rEMWtJxuss4HNJZuPBOqrAFBCWSb
         Njr+cd+xTxasYvcm3ZAUo+x3y8gA1ypO94lUCuKjSjFloSu+vbJLBoM+MGISagMd5RuY
         e6gZSUzZ7fnm3xAoVt91Nj1jf6D0ylW9YXgo6F5OXnz5oxiJD/MsDe39ceLfoxty5mxH
         c/1CpHX1CyE2wQKIJhr7tHsAY59u/lvZtYNG7CbWhK8Q4kAq0f2ROrAYtvgCU88l9/CT
         NUqxJzzg091UNGKWySVXPZypncbneHPKhC84X571FQJCl0fklD1W9PyGUgm/nm2NwLfc
         666g==
X-Forwarded-Encrypted: i=1; AKwUvBxUDzFL8p6nKdbnVZaAJWbf3LXo17iM8zxV0hD9wPzcccGn3OBzc4w0NMAAenXE4d52h1MI4/vYruJ9fD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeZVhBiyv3Tk5/vMvQcgfcEDSQtev08UVbWOovpeG9yLDa6Hix
	l82gHqSdNBPy9UDvoz9YWM0MKRJWmoVapRntaa2MOj7v0WLOtJX8pHvWQeURmhvDm66f2Zn7eLI
	41YkDwFtjlibzvsgMy49P3hy49outMbeZG+ahiAnUjsWQRv8LNVf6ZtKfInyzjIHm3It8oQP+Lg
	lfO2xfYZwjH9nNiSK9ScGybFXW8pmf6e7ACKqDN7bM+A==
X-Gm-Gg: AYBFou0KTSZay9L8EQYrAEnMw2gN1PYUStTiI9VmqGGHvZOG544g/j0b1gcmmK5dBz7
	MojBOiaXs1IF6You97DPBZRxO63rBcvL7/huMrQV70dkOVRS4YWM3JAFkUU//xLhGOe5wC2rSa6
	gee4NxVLSs735yi5DppM0JeY3by7ZtgpmRlT5N+bBM9Q9kMV81JSbgD9G7qg==
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a9076f83e1mr3424967fac.30.1793460545522;
        Sat, 31 Oct 2026 08:29:05 -0700 (PDT)
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id
 586e51a60fabf-4a9076f83e1mr3424958fac.30.1793460545051; Sat, 31 Oct 2026
 08:29:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:54 -0700
X-Gm-Features: AclHuK8hrKHo1tqy_PdKqenLScVW9LO6f-Uam7iC-EUaQnDV6_oiAmGdMYjg4CA
Message-ID: <CACSVV00vH_tpQpDY9WX04FWe0Wf00t6ytKHwYB453Et5RP6AAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mlunHZedBAlH0ccm_smn209jo_U2-axT
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae60942 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=sUSyc032qo6c7neFus4A:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: mlunHZedBAlH0ccm_smn209jo_U2-axT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX15OXgze8Kfrn
 cAi0iZpOu3O2dtvxuZv87i+p5i4hkQzLE0LzEQtxOcq5h/dGMLCAZC8CKXdSw3i6TKRC2XT2ok7
 4I3eiXfiHDaWiGUp0/RWHK7WVQtQNoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX7HlgQ1r9Tojk
 NXhOY76nfkdZy0hzOAUiQA18DBz5LwFieRxwlOjKXVss8a4uk4z7Lv2GaPCeRQuKLnJQi4CjKoF
 MVZfYu9FfgWd/0n6hgiL33GVJikTzo4fzDt6SP7gRpaed+dpHd4fYHwRl9sKkaiXJD9l7GZ3m5T
 tZckuzXCKOKvC9TIo4QSoxYos9fpoT5ZIvPWB5+y5HSIKale3YOO7TGVBhDRQ/xfprbC+0VM6H1
 H7gljjVy8JJw3fzlPsrKcm2ChUUxEHHN8kZKwnQST9aylcHKSGUMVrIK6CvCzQ4djUSzB21Wox3
 l3kxzZ9c8jEAkzGguBZLfrmwKLPklrMSWkU53Xz2gZZIeOEuUR7ixwxRxJNNE4qHflNGfVUeVvq
 XfgCp6orfu6O0yXJDx95KOuAFIvm5cHZX87AtGbZ+UJpp+vaG6OYF/7MzhdLBn3Tetyf3IJ3hM0
 ZVAHnNpBcDXyxGPWmug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
>
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 795e8ec7e8fa..addba9074217 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
>         { .compatible =3D "qcom,adreno-gmu" },
>         { .compatible =3D "qcom,glymur-mdss" },
>         { .compatible =3D "qcom,mdp4" },
> +       { .compatible =3D "qcom,mdp5" },
>         { .compatible =3D "qcom,mdss" },
>         { .compatible =3D "qcom,qcm2290-mdss" },
>         { .compatible =3D "qcom,sar2130p-mdss" },
> @@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_im=
pl =3D {
>  #endif
>  };
>
> +static const struct arm_smmu_impl msm8996_smmu_impl =3D {
> +       .def_domain_type =3D qcom_smmu_def_domain_type,
> +};
> +
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
>         .init_context =3D qcom_adreno_smmu_init_context,
>         .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> @@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_=
cfg =3D {
>   * there are not enough context banks.
>   */
>  static const struct qcom_smmu_match_data msm8996_smmu_data =3D {
> -       .impl =3D NULL,
> +       .impl =3D &msm8996_smmu_impl,
>         .adreno_impl =3D &qcom_adreno_smmu_v2_impl,
>  };
>
>
> --
> 2.47.3
>
