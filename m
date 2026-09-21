Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522730C35F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992082; cv=none; b=Gw3rmhlXHiFzbtW1Jrre+DDqaByyeDDP7Jd5g2UqOE+56NH4F7GGkO94gm7PFhrPtLmzhwufKKGpg8QAUl6eTj3wKfwd6pX0N0mxCAd3ySYu1dwv2D3uNHyFhxdt2WovNItG89VM5E/XhhUumCGd+yHoPmUTWOFSLhd6W3aO9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992082; c=relaxed/simple;
	bh=eXIt2tmg/N0xDGKLm+Npeo9hX7Y3I2u0rcNSU7afg9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vj8tWOWLkxWIR7mI3xNRGIUjj7uLB2xbSS3cmCx5hcFgNGx+DiqSoCb1oJfRp+2vG68p3zbmn78e8qphnTJa7sSbcJh7iuMAl6YLoDp/R78GhnqYx5Zz7av2vATnq9YBggqLwtCNUFU1ik26qQI2IsMmP0jR9P4c/sH7kAyG8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLwGRn/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jay4yEpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLwGRn/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jay4yEpz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeBIc419379
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=; b=bLwGRn/3191G4fr9
	rF2LR3Szlv6YOJqdwcvRd8wgJstsq37L4yz/EIn3brNbdaiPk1q0JPSzInaI1IwC
	GBphQq9IL8iHW/ayuQdMvpSkZPJK+489kcwg5BnRuHZad1IxDa19yL23jPqG9JdC
	QyCfFhFLyrnubxz5vUo4S5N3CphTuiUdF2s9epvRKSVl6242L/C5IVSa0tREGk+h
	tzLC/XbYplU6zkQPPrSOPQgChgjJK0le9eMgMXDcWe8gYgStQXJ4PW2UqZxaYSv5
	0LjwWb1qJ7bf5ksjwLWLt6wyiN2CdreZOeuQ3ATfIAeo9bimY4yC9F62zk7/5WkY
	9JdIvA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq94gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1af084bbaso301896eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992079; x=1790596879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=;
        b=jay4yEpz+Qjzm/AsRNzjRWlqQPHME2iTTxVpoE6tiL5HY/110ICdNNF5fIE6vBSCvM
         rJ7+kvF0sKAWhSUZbJ0fDrxsGj2vP8a4pqDJmtZ1VyLWNU0evO6QvwglEKgHkj/YYEN3
         m9DI/QEO1ZGj+mIcMqj0PNSiC+U5AoUwmsTX5Cy7MW8ORhAXw0tvuHGb7J/CbrFgKFro
         u5Yu53N+4C7+uP2rSpdug76TlEddYXvFJRXjaWrDJ6kSPGPe1/xAHracoEDj7iadlsDK
         PjBODx7U5uUQLD4EIqLlmQ5lNmoViJuT2oNq6ZFzSQdNn+LAMzcZGDuqXTPD8MM6T5u7
         JWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992079; x=1790596879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=;
        b=iXU2PBI8/V02iY+LE4D4Wy+c9ew8Me/8EyT7ag9/5aqLEcLYH98FJHLAIADmzxaYnb
         y6KntDt8k5oH9BSuUcPf4n5zgYsCgYAMiQtfLUAkezGkVU78QRKrifd9yimp9kZhXzuC
         K3KfmvqQ11DVC1dGweWffqC29ng8c1dxpgLsLIcMt4wQ3C4MNFvhhwR6rjbH5i65KGbQ
         B6eDP9pckkfjYVH7T6ZXg27w3NAir/axgNCrqIxYWzevINBIsQCaJn1SwkWpKeq8parZ
         EniNXPKuh+FMI1u9sXawUjzV8KK/mZ1bJs4x5XBiKt4RFPNAOUmLv5wowvxkxh2BRjwb
         RQCA==
X-Forwarded-Encrypted: i=1; AKwUvBwQY3CmdyzmHQ7Nrl5jl8cJe2Nxsep5YokKDx6t8LOfI1qfad/hgLaP3b9SD0ZmD4NvydKQmfSwLwZdmfk=@vger.kernel.org
X-Gm-Message-State: AFuF++kV4WTC10hEQmKBJNEnTjmt3w3rYFIVv+nu4q77lMlz8bqeu3yx
	zsTxLvlRE75NK7JjLpnUo+vdpKQ5c4kjd19TbMezzndc/f+1z4AIcnFxikL013qecZlB+7g2E0e
	PeIeEOEHUM0riIRVAvLXxzclCF/WjCfBwsqQPjL3ZTixtBYz9KyI0xXMTJPhuy8Gq5+g=
X-Gm-Gg: AYBFou0i53uO5ZmzXZDXBWIg+Cvye6XIljIHChBq3tr0eXKxqsSYA6VfeE3Bv///di7
	e4iNfIoebDwf/g8H7xD8DBk7eFIlcSMejQ1Ow8CeLdGGcDfGG+GlHQ+hjSlEDW5nItMg5FCV20y
	+SyX6z4n3tWPTRmOX3HZYZ7vKUfiz/ppA2FlunYNAzhweJWrgnz0TRhu0LwUA9aysgfQm5cf9j7
	5tY+GGUhSklbQGtGNJ8GXCIie+IQ8bOIJOZOJlFXs5DTsms4OBrLkoQbEfopWmF8Y53aRdik0PW
	B+QKSOkbMt4kFit20m72HNqI6WYN2G61xvsQ/RNARqgl5z8l1dnCxCJJwn+NoeqBGCqLEPwpIpg
	1oTiChbBusuUe71ZD86odWw==
X-Received: by 2002:a4a:e606:0:b0:6c3:7fb1:b0a3 with SMTP id 006d021491bc7-6cb2c74c026mr7257095eaf.2.1789992079243;
        Mon, 21 Sep 2026 05:01:19 -0700 (PDT)
X-Received: by 2002:a4a:e606:0:b0:6c3:7fb1:b0a3 with SMTP id 006d021491bc7-6cb2c74c026mr7257049eaf.2.1789992078610;
        Mon, 21 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3586b497sm288523966b.42.2026.09.21.05.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <3e4fe959-1187-46c3-a140-30b957335134@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:01:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix missing PDM subdev cleanup
 on probe failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eqnwBAvtCCArTdD_WudwuCdunCuPFlK6
X-Proofpoint-ORIG-GUID: eqnwBAvtCCArTdD_WudwuCdunCuPFlK6
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab11c90 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2tNI-Mfp58oa6H9YLMgA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX9HnYxyeHed7w
 Y/m3F8/d3pb6+xqo+jYvnpqMCy40EJQyx5KNx5U1n4sPAc3zStYp+2OLV/Zvp7/sVOuzLqe2Juh
 z5JXPJe7V4Iot6NvIFimsOAFsWkOa2I5OqH59oXoHPGK54lrUt1MqRgKqWs3IAK1dqyjJvc6xKr
 dWeceDsi1VFSXANftzUWE6TS3DsuxC/olviiozV88bnDL0QgWuLmesoo87JO09O5e8QolVv9HlH
 AdkQQzXvQRIEsY9S1HEqVcSRzRL+3E0Sgjc9UsjyrabiB3W4pYPnB3XYD0I7dyce3TR+sDbnLvq
 AFNN2wOSNj4SGxMwmEmqALGym1fyuhmwYp9WGFjFGIsPxZDs/RMQjLHVq73PHOhhCrNqzWSnq2H
 HL4r0GxnkpyzsmVOJIJnTfjSQLakW+UcSODgK7toj4b+2cBVNSD8fYfnjYZ03vTqWnL4EjeRKPz
 tk5dmKT5HYgV0wRbkUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX1y7j4K8leznt
 +dh3/ka7Vy+4d4dC8EmYrmhM9f5fECQOPdu6Qpm3WEMbDe6io18VxZIcIGB+dBDmRSRQdPAs0DA
 xm5mPAyZC/c3+SmTI+aM4LOY+O9DLOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 9/16/26 9:56 AM, Anup Vishwakarma wrote:
> q6v5_probe() calls qcom_add_pdm_subdev() but the remove_subdevs:
> error unwind never calls qcom_remove_pdm_subdev(). If
> qcom_add_sysmon_subdev() or rproc_add() subsequently fails, the PDM
> subdev remains registered in the rproc subdev list.
> 
> The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
> qcom_q6v5_wcss.c) all correctly call qcom_remove_pdm_subdev() in
> their probe error unwind. Add the missing call after
> qcom_remove_ssr_subdev(), in reverse order of registration.
> 
> Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
