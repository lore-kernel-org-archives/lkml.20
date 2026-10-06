Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B5B8834
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279036; cv=none; b=st+3X4oFdVWscd2uRmaMTj51tujG7vEtpC/XQMYplojCrgahZHDhv2A6ZNmaAeu1+0NcS/nqIeMnPmQGIniyOZZpcOYNUVOyD4EtJ8lMM5/HOjZHKGg8F32fVAj3am5KguJD7coo42jFduElr3KrWab46xw66fhaBg8o7bsdn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279036; c=relaxed/simple;
	bh=GCH8P+TxCuUgHhKgsDlPxLl428dLPV23SwmTsIentkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUI+Ma0erVmblPcUZHsz5gQjqdiSXBKKF0l38g+5IZDYegOl0cNLXPa9wcvKcyiCEsxVmdWOMtbAM5rd1+QkBH35NhRHa4mpgyBFiinCof8xN+pIwJ/VlvosPegJI9PzYcARH41eIMEOjUBGvULRTKeIi09QACWjzx2N8hpuEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK0Tj/7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eg5tA2K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK0Tj/7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eg5tA2K7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6967Sd5j3537612
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Js0Grhrbk+nnHCiSbpn04PWE
	2JsvC97671SKeU4gMJQ=; b=JK0Tj/7phfNX0KLhZgTNSKYUWatJB8Ep607jl+if
	Bo7aaWlPWz1QFPCyzktvMc4qLKODrE6Gd6ay4lBEwZi6NPhhKDC9raErv05JjiDf
	7JgbbX+D2a1CswrvAtrityY+1pwfzTpz7DRfgdh4K4LpaME+OzWA8bEicY+Gzlwd
	w/RWhfuFEHbcckAZz7NxXVLCR8092Umcjba0jQwqUe3dk0IeYHqEL/2h1GlKHYiV
	cm5SeRKs1hMHyz/YhAeUZNX6CQeXhfb5+xhAcnJGA5IzJCyrV7nHVIn6MO74qaKz
	0gnRgYR8K0D3jtnBi2BjZHXt2Kwg37NxRfgaeo2qUhq4Xg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrdpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:30:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso3645769c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279033; x=1791883833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Js0Grhrbk+nnHCiSbpn04PWE2JsvC97671SKeU4gMJQ=;
        b=Eg5tA2K79hQRSyNbrquenQ+4LvCDaQp5lgp+xwz32BuEYXQEtt6e/GpL2jLquUZsPv
         0wK8ybbat5Bvt4Bug9X7p4i+g+gXHBF1Is7Tyvazm3DYnBWAoPt2LKk4iUtzxcw3JLfU
         CzhV7iv8eC16z4pHAs/Z48mANAVZ036fS7zqHJrZ3yDTXfw2F1M3pNNVDL7N9o6TYVtX
         QQSEpASK6XH5FqNOYIDQzG/RP1Q953OYGsPoabe3ETdtvht4t9oZLnQS4zNMCtCSxE4A
         ZsqBn9jGOQDlll2K1yn6iBB5FaJ8oKqODd5yrvTRpl6w7ci+42znYt/3KdokDJs9msPK
         I93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279033; x=1791883833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js0Grhrbk+nnHCiSbpn04PWE2JsvC97671SKeU4gMJQ=;
        b=Bdg4EEcAGgG/sPO2tGOw2X3zM/O+tFrGWqpFbonyAyS/3sXFGXi5RsLFaWPwAjM/82
         UqondrYAE3ahro4Eh8wmL/w2igO7kT4WHBVRypv1ORTy6wlGKVECPIkkmYbbgI6LAV4o
         OE+Cfa+FdVJ00U9EkvCxm8xpmG3+EE2+s+n1r2rn6wBhlzP1fufqGT11DVHtCoKDoWAS
         I0klFvodhxCDKFCXlzBGp4g8awtESvFEPp229cU7j16rY7ly0M+lT3JN4SdcZ3L9jXMW
         lH6/4lnbkcHSscqIjLxh5zdhOUKaL3MKL+BE8irDX3mfc4UFWzJCZTpElv6Gkwa+zHer
         aOrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwczRwx1Qw0BPnBeVLWh3r1L+Ckm5XesH/H/Jjo171DoxT0EzUY12KB2HBW4rELmWGLUPpjaXThlv/EHkY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxpOs6eoM/OQC/jfozBrq93EewNWaGA3hEDfRUXGPv+s/+xEq9
	xDZMWTGqrdTRTmU9ClStRnKo617jerFm/sK7EyEFySN4bOJhABg5gRJa/fLCAke08X4y1l9OYk1
	9tT//7nrt0uB5JvOC50MzKGJiNVFcumO+r/UrcXH+mfP67H1xoA/SPIpWDWrp2We0cdY=
X-Gm-Gg: AYBFou2rPxFeiCW011/a+I5379xnkDScdQW0oMzzGIqt0fjjq2i04LEauRELEuFrNYr
	4B1kqCNzJ49aI3opGlDiFaoc5mYNRGHNZKTKJriTgYhbnVxzdxW1quzpQlu/4unUT1ux6IF/5wj
	YWooNV821q9AEDqtR/F3/sNOPyNounqiSb8hyH/4iJvqbQp3sroNlRYRL6l2TqP90gjBXvnbYPV
	mJhdb9ewSlH3gpmV4AR8F+oNoyVda2P8BmjLnUFNywzh/2UAEumQK7GUxqBQMzUSXFe3uw9RrMM
	9qI60EuBPDseLuL9G+ZyAA/ed2wdF4iKA7fWQDWKtj9rVlfvfdQi8ClSznC1kLvTBB7AGclqthX
	2b2UjjnvQZyQAFPSjyBXTWTQKhTtiXnm2
X-Received: by 2002:a05:701b:2404:b0:141:5281:8a41 with SMTP id a92af1059eb24-15ec9119a29mr1074084c88.9.1791279033111;
        Tue, 06 Oct 2026 02:30:33 -0700 (PDT)
X-Received: by 2002:a05:701b:2404:b0:141:5281:8a41 with SMTP id a92af1059eb24-15ec9119a29mr1074067c88.9.1791279032543;
        Tue, 06 Oct 2026 02:30:32 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm8009395c88.13.2026.10.06.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:30:32 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:00:26 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Subject: Re: [PATCH v3 2/2] firmware: qcom: scm: Allow the SMC request to
 freeze
Message-ID: <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com>
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4bfb9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=Zou3vVtG3ksA4Fj0efAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: vdI3A94bsMjXNB0iD5TPYIMI3-vaIo92
X-Proofpoint-ORIG-GUID: vdI3A94bsMjXNB0iD5TPYIMI3-vaIo92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX8roPJ2EMlqyN
 kdolcakwQy4DOq30Y84HD9dAHnBwvOpZhAJJwcZsQrBo0RAB9I69k+QysSBZjtQCjAohMBwvyUy
 pSAk0Uk9I4FSkrm73vnRCtLCf1Z5q3XukNUO1P4wp88qiWknxqr52/YrdnmaCSky5ZMf0dfr9Iy
 +91S7Kb9/kn9yX5etp2zrHVCQv9SZMjRd41Flbp7SC8YitfP1xUsu55PhRzc793MvBPW22E/1mN
 Rv3KMWNzt7f0591/jwKLSKE9v40uxnqqqmg3WBS2pKV+Cjpe7Vfb+7bT1qNGlT9OH7l7fnBUsjJ
 9O/IYOSP9sDVQOAcbqpP3VbnqXdYTacm3q1UZuJh74mOdPUYDZTIsR9zO4gZ6fmyudctTfR6DE6
 6UqxMCA3apjtR7NhkdUMkMkEhVSfno/hkVJOTA3bbTls06BsGylM0+baT4O7Yf/Pna9AQeJmaDs
 QLWr2jepEKpbif2Czzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX4Mdc1GmAqnZQ
 +cXodmm2f1kv9jrZQgkEafRaWDhOgpyP5MDxI8ARWWgDUSl5Xe5Ug/Mor5ZNSJyHHO2s9x3umbL
 lq4zCt2Uxj/LBL2Ivgw7yOBZzd+jbQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Thu, Oct 01, 2026 at 06:16:49PM +0200, Albert Esteve wrote:
> From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> 
> qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
> uninterruptible, so a thread parked on a firmware waitq cannot be
> frozen or killed. A long wait then blocks suspend, and shutdown
> cannot tear the task down.
> 
> Wait with TASK_IDLE | TASK_FREEZABLE so the freezer can freeze the
> waiter during suspend; after resume it is still waiting
> for the same waitq completion.
> 
> TASK_KILLABLE is not added. If a fatal signal aborts the wait, the
> driver returns early without issuing QCOM_SCM_WAITQ_RESUME, leaking
> the TrustZone execution context.
> 
> Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()")
> Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index ea4481385412..92cee2263ed4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
>  	if (IS_ERR(wq))
>  		return PTR_ERR(wq);
>  
> -	wait_for_completion_state(wq, TASK_IDLE);
> -
> -	return 0;
> +	return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE);
>  }
>  
If the wakeup happens while the task is frozen, the task will come out
of completion only when the task is thawed. I don't know if there are
any cases where that is not acceptable now that we are making all
non-atomic calls to enter w/o mutex.

Thanks,
Pavan
