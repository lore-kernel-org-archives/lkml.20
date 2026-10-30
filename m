Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372554;
	b=c4pm0fopk0qTgBxTzmVcFrtWbdfyps7gFVHY6sFFIPckFur++sGFMLnbk/RQzqnzRcjX
	 uDXISgCvMWe06R+w5EtA7tOV3SlmCLCc249nfJSuXDleOE2kE8CMHooKX+39NPo7mO0T8
	 nTS6L3mxuwPIHJf0sIr9KcVU70N1Mnnko8wx4Cr5fojaIIbw46KEtpLzTgm0yjF7RgjV6
	 ci41OLkXU96T+ma2BVQuHud7svZPNW6HxroY1zFtUJML77Ux4rH91lLvAJ6XUoagZUvnQ
	 0yqxmVcU3IQPZGaPzyzjaFXW3zpE576vfBW5Qx9AzXV0+C6ifxEsDPN/ChsIw1dJL/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
	b=Rf4+zqZpmbfF54zqNUE1JU9q2aorRRDQ5rPW6+3/ym72h7GTbcD2Kom8QBMjmeMTZWYd
	 Sb3uk3AgSSD9TTNQCuBQFuerPkj3l+/3A5IEcWma/xvcQayCm69L38Pih5oLow6xMX1LC
	 aYSaaZ0RtSEBgmsKwo70u+DkOGMMCirxAv++ciK8eWBXOsiDNZ4OSoz/TeWbMLQ9SdlWt
	 LYc0lRARAPFRaaG6pwxGT135Yv4jG5jz5VYDCiXBYsUD9L5Aevf6iQhy9L+NJ+cgniOTf
	 GEOT03eg/oEnDej76g7itQGsM+8o7t5l1kuNaPSLUmBHz+Gx62VAjaJojZ9svUm/ivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30877606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30877606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UES8mh1954224
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=; b=mkfPaT174hQ/k9SE
	HWJlGqvv15Q6tbsQCohC5witKbWUmcpo39kIZHt2bZXyqlq//udZvkU4wXyH/Osz
	yTescl+hZNux0EN3xS4AKsekUC/xo4OyxVt1eAHYoy2I36HOt/Xod0WwTqmgUrWg
	JHetMwzIJa84RMjyb6AgWR+EJKTCcvYZaXGbVSIDG8YtpJT+fT2U/Av+XwxGENwj
	kkgDAFlKXXWRTueIhs6oQwrBBJHxk3Er85d77lJ0/3WRWr6/e6WMtnkvjhQ/kNYi
	c7u3cB6xSUqsjGpT3qw/YZLg10VdousGAgzGn3CeTkkmM4r+HPVaWLQcSZ3bI4Q9
	GamHEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkn46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16509085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793372551; x=1793977351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=Kf7gBLovzlcl8QxpOfakuYuHpL9J8ZwKpD7bXxw4X+9jFpAcRaSoFKdFWeJQ7lgkml
         CowS+nM1tqnu4gHeHNa9V+8QH22Lf4WE8IWlyYvKD2kv9DSbMxg6qsaf5yGOW5EgEcPM
         LHx6jHjgaCxkSmHUGBrYmrALfqrPLc4IeopbI/ddA5pLeEQhXazmbBVGQi4mk1zroWBy
         Fh1TT2enxDLstmr+3lnqOqCyPC9b/1HFo1tfV91Z+5CG7NSFt3YMDX8QPdsw9X5tD82F
         NU64YtsRzAIrwr1/ABX8WzkDR3YV/Ws/j7dI3wBZ2jRjEP2vyq+/rhZLaz2F4RCtzLBd
         xokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372551; x=1793977351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=uGabLJQyABRM744nBUpYh6+vqb7k2E/ekEMxMb7u1J+4OHKD//0/eonTfQVjGqzMlf
         XqL3VIME0d+nRc9NihAr56WybDRJK0rA5RA7c2lFFCxLPmTFyLBZceoktYJr95dWwEDr
         v6+rAkjZr/G4SaBeSJtCV8ShhGwhYsXoLbtEi7A8BjdL5jQrIXgVsVKHfBxMZF8yTaiL
         1dRdBVxfXTXSuXFQgjeLWWx5m4UWN9FLOZquvBKUPSU1xr0qSjwSTD1dgBYkgo9j7lET
         2Xm+5AJD/DlbDIMFyt6FVa/f88QlJkJNnq3uM28pt3MwET3mTUHKZ1So3s6NM4sYbbll
         xKkw==
X-Forwarded-Encrypted: i=1; AKwUvBwG5gB2r0H8zimYZ8G3kVTtuVBGCG3OCGJB6taf369rLGp8READTxgwUohH9lf63wbm/Mq3KbTxW601TcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfesIT1roCzYNwnmspVaeT6AY6B77sEcUtDjG/RR8m+hf+wXyo
	XOvbNYsMxc8X5nk0/uCQmt/ya7AM+FIUxqkoLAQX2myIFttYHT2tayxXnOppe5AWzXHdla0H31G
	jBX1tGpklK3C7pff2pindST/Cqf23GwCLDIz8cz/1tN7I6lUCRVhRcbiBxTJifxGMdrw=
X-Gm-Gg: AYBFou3M14wLqPeG+AgLMpOH42vAPNJTY9FT7A2UeDr+gM0Ovs1JF55OYrF/xFUHeW5
	xk4l4T3G+7Eb2/DBkSrg1JwDrGggzidrf9O7oosytcwFlGVHsn7TfNgng3hcKr7NevTAu+VxsmM
	8QvJXRePw2nvseL8V9xpmeVh/eJ3kjfb2qrm3DbRD7F95ep+gj7oUvlO24vEYVy8JCdZ1d09750
	ie3zonAkwEsNexFSg2VDW8tZnlp4mhZd58UU9zC2zex4Aohpm+BY9YGfXv41uW0CRab5WPoMgtr
	KNMeBnpb6cdk89SZ1AS+61v+HxdNo0aaxEnhGuxajtUoWKDJqwix0vODAFc0h2nUmMg5ItQQI3t
	kWGW0O//JUIvf7h7mpOr10L9naTfWHr3d39Le6bF5b+TFh9+gFjbMImVgYzb3G71piYw4iq3B
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420075585a.2.1793372551160;
        Fri, 30 Oct 2026 08:02:31 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420071085a.2.1793372550552;
        Fri, 30 Oct 2026 08:02:30 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm37486a12.36.2026.10.30.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:02:28 -0700 (PDT)
Message-ID: <d265dd66-d8fb-4fd2-b6cb-d50462e4b6e2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:02:26 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfX0Il3HaqKHL4U
 ECJJFcKJf+r0EoaBlaicHS8khTcuyDDvVDhvSO3oS2Bk8bxcL2MRV1U2xiVM1OzessyWhmU9esK
 H0C7cyEx5mLaGywFXrxv0cKCiYmkATyVBnniksQ5y2ChXdxEsRddBGx7Xt9IsC9n5uyiGX77DfE
 FWr5avl0us2FRcxXsXQpm6uH9ra+6ajAFrq9RzVSS+ccrajGbkn8WiMnO7ySFe6EcSkvIb31nbr
 rQeGMi1gExyCvAoY8m2Ri8SkfDqnxyf3j6x8r3Wo2WdVdg8mrOLPG8CNZJeZya536azGFbxugJe
 /nGTa5oYvKxAHcLSSz6ts10MBWh7ApO4Q95icRMWfYLQZ9rYm6qfQdEIqgiO56uqJxaabM3BwLG
 MGlhv1RUmg8Oa1zRViEL52PnsUFseTf/CqgHmSUlMz7kih+/3+zgVb9lXWg8wLDdNTq6807oi9H
 q+fogHv5nQzhXWovY2g==
X-Proofpoint-ORIG-GUID: 294A6Hpx-1LkhSgiElm_zRLqwrm4CkBv
X-Proofpoint-GUID: 294A6Hpx-1LkhSgiElm_zRLqwrm4CkBv
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4b188 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dBPrbYW5IX62wmfSqDEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfX5jIgr7v17fqL
 407t/kpTk4HkpfAZ/mLgujU+h1S5iQ+WGS9HqmtV1L00JTsSb3NSbJQx27rtgrGIWvRPkJK8uEh
 PZH4s3i//LFHtoO31jxiK37sjtpgbmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300059

On 10/29/26 1:32 PM, Qianhui Xu wrote:
> Some platforms provide more than one reset for the MDSS hardware block:
> beside the MDSS core reset, the SM8750 display clock controller also
> exposes block resets for the MDSS core INT2 interrupt controller and
> for the MDSS RSC (resource state controller).
> 
> Allow the resets property to list up to three resets, keeping the MDSS
> core reset as the first entry so that existing device trees describing
> a single reset remain valid.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 ++++-
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml    | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e03..7c0ac90511 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -84,8 +84,11 @@ properties:
>            - const: cpu-cfg
>  
>    resets:
> +    minItems: 1
>      items:
> -      - description: MDSS_CORE reset
> +      - description: MDSS core reset
> +      - description: MDSS core INT2 interrupt controller reset
> +      - description: MDSS RSC (resource state controller) reset

MDSS RSC is not part of MDSS itself

Konrad
