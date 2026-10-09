Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224604349B4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532410; cv=none; b=STJKaj2FoiIm+ZlBHpORWtY/y4PW/1nVqAZesjFIzgc3ha7vSinB2o6XdQ6awL7euRZB137+LKoxpTsxpetoA+q2ajhQnuBOTrtGuHcHxoez6Kya+JuauDbPf/QXCB0HFANRL2tLniOm5dW0ayfouN6q1b9Ew2RY9FXMud30cE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532410; c=relaxed/simple;
	bh=G/vvd9mxZDnForomR/5H4CARhTx9tNdjXMbrALabxjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmm3bKKvQytVBQ7/4rgxRtZ31yRYp33ELCHWS96O14znVxxrvabhUdJyp8jcMUiGqGXi0ZFuaNyMyAuGb/ZuIEFYk/HzjJu82QezxL3zU61lMALgiuZeVH+IdFJB1/jmcRbQ49D6wHcapMIZSthNUStLoScBru8rclbOQ7VyDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRtHNQvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1s3bgLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRtHNQvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1s3bgLf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HNno1089438
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3UKiKy6lRVjM8cH8ORwrZCTt
	rzXMU2z8fX/6JI8ilSY=; b=eRtHNQvAiRbKNoyIv27dFi6IO9sCBlix/nNXwaaa
	QjzK8xQ5Q3QglazVsrF+GMG+n5WBM66mwWmMwnBQSYMZmvWSbQxqqkwhUxjyBmil
	9mA8h/HKv+UZCGE8ImLDtcnjidrdx/aIQhApHbwJ2+z8hhAp/cZQ1dQ5D+lf+yKr
	zIz5JGPBoLSGyBobdri2m1YPi/XE5SIhLKHzM8jOyeUMGq6GhNALlxDqCSEZhniN
	5LbDIaGkEZOf/URkhdxX3lStC7vxH+dEfln1xwLMhEPoeCdJCn5hsZCUWh93otnc
	i0CC90SVbne1utOkNLB80Bb3DvxtgecGtd4YkLoCuyC3SA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvaux3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:53:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so12647351eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532407; x=1792137207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3UKiKy6lRVjM8cH8ORwrZCTtrzXMU2z8fX/6JI8ilSY=;
        b=O1s3bgLfRH1oCJ/wxKsFyNZ+33boV3sguQ9Jf+eha2FkElX9PN9jfC8IVz4iZCQGRX
         Z+InhdSPioi3uVJKLVFK7Y/X/8hqc0x1SE8TEtlH49N1jxOYF48Hh0pi9fe4uT5kMpYT
         dFvoM5g//cLbK0IYSx24eWYlikUCFCCCIqR7ccokKZuTpHcS0ceaKOKAHi6lJ0+TcbPQ
         YSGU1jDvEinFhR8ijy3QTVIcO2UQB0KHln7dNqKi2+Guw9CwXTZXgqIqm+HDGfPbM6Jc
         /SUpwoSL30vwvvye/Sh4LCoP5BciqW8FcoelHbqnsiX8PBKOlZOuD2Hkc3yAVQuN/2Hk
         rZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532407; x=1792137207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UKiKy6lRVjM8cH8ORwrZCTtrzXMU2z8fX/6JI8ilSY=;
        b=vYrK/D0s4k2IfNZSzcVeqVHPN43LwwNjloRxsY2l3YIVBJ1ZvuIC9GPhqxlxBrVKXo
         qUtuSt3VTfQiyrM9Lu3AXxgeV7y8PBD4YItokHoUawjQmhe+tVnXJhMSywvixR6h6Kph
         VzDwHGa1AgpKggW6p7dB4OgACu5jNOs2MjFdj0/opSikClUZmO3++mgOxmKZeoBcel65
         qBS3KIf698lWa5FbO/o3GJKGh7GWcQVrN4C7vsHxXfYNGU+rw5Tr8hBfOGCxczTCSxd8
         ff/WH3LHOaWG20XXc7hZAr4e6NIvxfShlgkv5irP7Qul5jcOvhQ7dpra7yP3YLdqDK54
         c4ng==
X-Forwarded-Encrypted: i=1; AKwUvBw3LIJEwip5DFKbG+b66BK8DUux7btNN5X7+nL3Kf/nXzDMTYG0/VRmEnQUJWgblpRo1DsGKSD6BBst6UE=@vger.kernel.org
X-Gm-Message-State: AFuF++lAsl0xVXmpeEvJQssYAXrU8vke7/93O8eAdKBVAvXc+FZNCTkq
	QuJWFWfnlKpfUCT6IB/ufkPQ3FCc9BK+lYk33lMs6nxE2/KIhUCqahHXuitDyxuEcf6Je6yiENY
	fcLBcW9tJEr30GsFkG8pWP7GBi9WsiXloRwORj2SdSl0SUT3uvYDymq9D3PBoofhN+gE=
X-Gm-Gg: AYBFou0rz9vbJCHIYgnNnht/lbfBuS8/9ulxRhcdV6QgzOAjM11D+ADbtQFzlAdNzdl
	sNh6QoesxOPs0p5bppmmJZraUhwzbfiwWzBlCLAX6h+bsB3MGOPNHRBcAw4Ch7ckomsZEgl558f
	3PhWuADFidXuTllURs2eNHTL1O0HpSo7IJXNpmUR1CdkxxlXwUxZ4VlgNxx1lhCUPdKILm2eWea
	h7A2yfXjrJkPUwAgMyac2IMbaSLzE9JRGTski/SrhDpU9QV98umTPkBJEuRomtBhb12N0MyAHDv
	U2si9Bs5VlYOo5A+gFjk5Jrud0YGNA7r4e86d69XgCKWhM40yd9BzSmYdariz15EOVes/QgXMiZ
	+UORgjhJAq3spsO5qnDpiaV0LZB2EPjTeMN3NtU2bAA==
X-Received: by 2002:a05:701b:454f:10b0:14d:baf5:c411 with SMTP id a92af1059eb24-16a5faa7697mr1351078c88.14.1791532406933;
        Fri, 09 Oct 2026 00:53:26 -0700 (PDT)
X-Received: by 2002:a05:701b:454f:10b0:14d:baf5:c411 with SMTP id a92af1059eb24-16a5faa7697mr1350990c88.14.1791532405301;
        Fri, 09 Oct 2026 00:53:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm3782878eec.2.2026.10.09.00.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:53:24 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:53:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Message-ID: <asidb-ikeFXEXreX@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CBEL78gpTpxPm0QGZaZgbRju0692PuZx
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac89d78 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JR6eoTKC87OEK718H0YA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX37mYE+ykglf6
 muGMYICRY2IX7JfBtjPIQoBf86QCg84GKzTwXc+wicgK/6iGVNmDiJGrmY3l//k4WmCTewCrxOK
 ae9hIPbTPwfdIUqvNN2PiRI+mbTgN6qV2FYYK2DGbFbJqUYVj8bktQCT8ukgIb0bEHOsP8fpuPu
 +Lo+5Vx207SnMV+7c8gl3V2/mRvz/qRxIebNmAd6XsiUaqrrMsBtgFITCojqiKe/idAYo/04a9P
 XPiXLaMJYjREodDRepTJAX/djjptspTRx48FewGtY37MWn9uNZGFO7ycRxhiYAF9BykCYzIcbNt
 P5xfSVaywLfPgBv1nyP0FhDRxgbWvsaaHD+HI5FeqYcOtr9B0Ms0ILS0P3Uem1qt4+Z0rgM0M90
 7/igNny98qzcUgAuroo7IR/Gbb8FWj2x8IMMj12P+eHG+0ROrnMZ5aOtZ0Yj9T9Pa9A42gkPELi
 TrLMRtnEgWodyYnzxQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX3L7P5ZaMg5b0
 buvrM/IhlmuNoRDlIqaoyH3VUG28dX5mn5JwtwvMX7KEX0Ac1Hl7ClO3YaP9+PPc/MPVGyqZsQi
 NdN1m4fYdaNKqfeLC3NViKIkt6xBLZU=
X-Proofpoint-GUID: CBEL78gpTpxPm0QGZaZgbRju0692PuZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:40PM +0530, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

Are you sure about this? It doesn't seem to match what cover letter
tells.

Shawn

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
> platform
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..6fa958044218 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>  	.smem_host_id = 197,
>  };
>  
> +static const struct qcom_pas_data nord_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.pas_id = 51,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +};
> +
>  static const struct qcom_pas_data sm8450_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
>  	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
>  	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
> +	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> 
> -- 
> 2.43.0
> 
