Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410C385D90
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421532; cv=none; b=tSbNFeQWAfCw92MkFXRJP0W242VOYoM5N6XJZ94JsUilov2sRRWfdQMQ66+x0ZdwxbztuIr/pRO3SEB9zu78tS/z87DjJNKEV+v/gTUYxMo8Rrl45D2Il9alZfIm8PTVQCQe5ZujljR7L+rWbnomIjpgncmT2+M5IoAVH5c3tkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421532; c=relaxed/simple;
	bh=ZpH0V3BiX1xeS5UP5XkVFneyRdbxvPFWZs3TtaJJwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfR87cDd77xAq7ddEqjlWBP96ly83w6PBQp6ozoo9JL8ypkEvbL+uOmmXVvztlT7rQ9uV9PWFUHZgr+tkum9v6DGCtkbzbTrD2mAlN9eoZNyHb9BZnioYx1rKO0zgv8sLsq3c2HRJ20QonJJqsShf7IjDrQRYIwoUtj3pNHhddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOq7cMxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQUWhcji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOq7cMxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQUWhcji"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLrb3113943
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7CSoZYq3KBXVxdgrzwHcBQJR
	+p1brH+pLBCnK12LtNQ=; b=EOq7cMxIfefwSGLvo7J5uYpH0oNc58JxoM6BMyuZ
	7SZwqLFNR+zcC/4rC73OVoyhN+r5KNn38gMc/rESMzrO6yWNuaYVnWsPiX3498aH
	7I4qcsyPgVptaeM+pv20/ynqTdClOCtzp5YQ59bEPJBoovY6QuYP0UFOiOIwr3aS
	16ZTd1282+fK1ddFs7dd2h8gbS+cKr++9oK1lLhgWqhBESUm0CWJR4hkM9bPI/6j
	yeLFWCiDRcAN1wb2fmEJqC7nTY4rOZXwOx9lsQZhEotrbOg7oS7ZD4hNhJTs37KE
	z6vP4xZZA73xixI4s4hteZWmRwBVWObSUvkpuiZHtVMmdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjrynm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:45:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so305364985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421530; x=1789026330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=KQUWhcjiMefIT4KG4yolQzEW4y4DHJsQF286iSmOIL2YuYlw3eNIZZCvx6AVcUn0TF
         vXnlTaoSB6j9ENk7fU8aE9w3bqSejWpmXfXkC/PhQMI2Z1hOIKbbEINcAxAKqeEefZdr
         X3j3eCgBC0hNBjhoWNQDYHJhvBr+08ZhQms5hFnta61Jdi0KdVen/11tqM2NCjk5GHpD
         1m0oNHJvfRaXn99nLTeZeNkJiinswnoQriGYsBFCMONJzz/2g0kPNv+ku9XlQAmpAUn6
         Rg8jdFtI4vfdKJU0LbAaN+/WFnu5rR6crVhwoxgpbxhUyh+zRoaFegXL3h6F2FoGlcQB
         DdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421530; x=1789026330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=IBDl8LJhUFwy4TXMAGYHsXTcbQ/v0uI9okgvjoUsr87F+j+NkvfvlDG0EJx4nxEbju
         ZcKKwaj7mK3xusIYP99G91o6zmS5o2sUI2QhCizX777Xwzl0BwQ3Pzk0QmnkvT1RL6Pn
         k24Te73xL7EKHpDaqMjQRJs4w4AyKrDR1hyBj8+YICxjS7QNeeoJShvrQJfD1gjYXZ5j
         rKK9XTeMenfPPD1S0yngYD80UlG5k7b8dqy7KEtIrhxImZHq9kflp3hWQqGDqsEpeSfj
         1qYJDdDibEccxgqZB3QyosCxngzKBUrPrJgmUwOKgTKFW3XLwxPN/inMvSjAwmREZA/Y
         rTVg==
X-Forwarded-Encrypted: i=1; AKwUvBw4YuGFhwbIJCtTkDNrR85KYRexHraclT8VPxy8iIeKt1AMikFSq0uWFDNKzUPXJKuh9eM0PIrVma2Y9bY=@vger.kernel.org
X-Gm-Message-State: AFuF++nMObmp6X+taYxYB5tt0n6SYh0OTNjmFu33sAHVfIt+HN28vsrX
	jwt30XTHydHLBalP+giZNJXc+2s6CQIElE0CKou/oloe6dkqyXyeL0LPZnXiTOzoxqjx1De/EWa
	5NXCGm/2qTUqh2VGvK91f7M7dU3LmlV9trmmP5N9zkbOm6d4TSMbSnBAnRsvgXIdMPNs=
X-Gm-Gg: AYBFou1u7Jroj+cl3gtArcRsBeYlzF39BSssF5K/iw+azuNx4SkHGU9nBaLmRh/7S5d
	fgpqzieL9nhfUrGI6MhRmLXc1XzrWGthjDScGau8KgY1CGuB3HvP+hI2J/YdXMh3iXRkysOEW2x
	G2I5szSR+yd++CVZM1Vr5DYc3q+zQeFOWX76H2N/61p3dbqT+E2iXOrj7eTj8pSlIzbRzBuPa+S
	v2bEdTTWoxU5lGhxQM9kOVHEu0henWjGYPBdIQhpUCGFIAbhhFyHjcKeyc0roRDv4Ezlrk1gvrO
	KjnfgJtXRgQDFiVIo5im/ZRI+KRZ24d3EmL+gkFY+HAXf4WRiP6o546oyR1MIG+0uHGOsm7J2Pk
	V54B1ViL9vwf8PXAb9Tf9LcxIful2d65B9vst1iwkpxKxcDvFuZY2cWizEi3YFpYpoHs4nmzrbg
	qOiiN+m3CnpRFw
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181097885a.14.1788421527134;
        Thu, 03 Sep 2026 00:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181062185a.14.1788421521913;
        Thu, 03 Sep 2026 00:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0f173sm1111969e87.7.2026.09.03.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:45:20 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX7pXVc+2igi/S
 WIE05h2KarslL/BcMA8SLEaszAuTKpERgEjeZSFh2PZAiHXeCk3EZ06ygOgyxG3G0vis79Xfbql
 tG3Nq7Xym7Ya5wL9KNa8cTn7U2exZqMgtudWnI2iTJJEaA87hX2Q9f7F4Y0mTxFLOF/6ckc8c1q
 DD7ikLuHDc6c8jDu/bnMKrGdgBWyM439Nuh/17LRQr5enkGmhYWYok0TKFiZ4g7WeVO73kkHjiM
 Tk1sr0lOonedxOdDcGFXc07j3ltyv+vCRrYDxqvNHVtnTbp+uxsE5sq3OIbk7MnoBDro8Ehe6u2
 z4vJ+iuUvZA35F4HK8ktYbdDU/lGmtqPcX77ZNkx5zLWX1ZxhRthkdHx5f34nTMkajpv6N03oqN
 4bHNuvwMAAod+a+OMmWFADX9m+/puHTJthod29g9aAQah6D7bfyCnu+y5xN2j/e3/+m7Fx7sHcv
 Sb99pCjNDiCUTUYH5yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfXy2svtrUU5Gg7
 j12+Th4qVwg9AxfTnUrj0QNOBuZ+5xdHwIxJtXFjPdZ8qIFBSuhY3CgtwwaO1foAJq6xSY3w5mz
 r0kOBhB2en0ZGdK0unCmp/CRJyqgPRQ=
X-Proofpoint-GUID: d3wexE0p9uiqwKFHjxofxYARGjRduzBR
X-Proofpoint-ORIG-GUID: d3wexE0p9uiqwKFHjxofxYARGjRduzBR
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99259a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=h89225zfqaSm5xtrkw8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030067

On Thu, Sep 03, 2026 at 02:13:32AM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..01dc0194e130 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		if (ret)
> +			dev_warn(pas->dev,
> +				 "failed to set proxy PD %d state %u: %d\n",
> +				 i, INT_MAX, ret);

Should it be turned into an error?

>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
