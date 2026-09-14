Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88B472063
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394663; cv=none; b=Dr8rV0rWP+dfaK54d1U/0WEdGl7FFgFaPI5TLFC1HqGupFNyb2dxzeaegjPYQVFZC5ED2cBnGxGOtcSLskaI1ucA7c3lSgpaMZze82ZqWMm0ylUzacU7fo6ecOHdlWj80Iz4Bgpmf1QpUqKCqy61eJyHdkazyTcD1d2COhXRBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394663; c=relaxed/simple;
	bh=7ZtG51IZLTdydGNYwr+Us4eISfQlEChsCDkVgTU/X2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjMceuGG5UM07+LyeYergFg6nw3YI3wOlggAuH34rLXo07kDUMLvmIzwanycHMDTySe0Yh1kK3CnSq0FGBjnvvd0CqGo2AUEbKN8ldkIXukQWlB+8xNVC7HdU9Qmo97h0lUCyR8Zzfw+oFP3MX5BF1zZdQ4+WRjen37qf+S7K/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFWvsc0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY8d8+KH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFWvsc0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY8d8+KH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dE91200578
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m52tvn6ZedywlQd/Yfs9lprE
	IgWgSZuxsJ69OVTJm1U=; b=IFWvsc0mzlwWF5IldLivUWX4/QycfW+J/kxGMwsk
	Cp4cX1phyY6ZIt9AFxgzrblrJDbnVSRSMe+DB/MEFir9AqJE9aihU/peJ6+KMIt4
	87P2qaT5RJDDK1rqSlkUsD4Z777oRrqjO7JJK/oLoM0NlBEW7/HrxA+uQ+muSB6l
	kGQXfn46i3t5N58AsUiTBPH3ljiYYnFINCfKsPcrATIaWQ6XLMxug0AKRJJ7XwXe
	u2gdQIT2/hU0nNuMdiP1QlgdwF50StV5l8zyv6ZPHaT+Gcdyxy43ZMon7Eo+gSDD
	dWYTIEV6mlxDxouO99Di2TRloskrmtbcotahqJJwPoU8PA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs6uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80497c6ec88so4502613a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394659; x=1789999459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=CY8d8+KHl1aTJc2Z7o96s2YdKnaA2kKZVnVMCGbRGMfGhkOTXhx0JRButtPnl0YjQe
         cy82IkI8hZb4JOZwHGvJTjPui8LNMhdrRsB/jEcDqHiBuuZlUbDZAtIleBgzqfJSByrS
         c0fXoKRfAAzBoNhm04bdk1upbby3jifgKzUwTQjb2Q/O5MtdQKwt0WhO5ogNoV6YodfT
         e9odX/Atl7fFvP9ygGF8c4sSUcTsKgYLl0jgxYHeWhd2PIMcOZYn0fgZUU8jEOzOu50Z
         BapWCFWgeDYcNJI6R+N+4ggjtmaj05FA1EqryHX7NUfoe2HNJcOg0u0P3poGGHpUM3pa
         VLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394659; x=1789999459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=qyzI0sOhOvKIPiH5DB9LmdM5Xiq36Uhr8rUwNVz8A/ryh0YDJVlw85ecO34Hu1CLq7
         Z1r+XHeZaccTHcXSmTHWJUO3z7D2+RIkoo+sZr2a1+Cyd/C3Q5okRDksx6unNfaYMENM
         mmhbe4J4Yrq2F8YbqRBRmSkhvkft6IkTYUNAHhD4WupubbfkY+5594qurv20xP7L4iKK
         gQbWVdoHzIvjA5nq2PH0BvIfKjaqNSuykDEtWzgXW0JCgxb7Fqw4bw/sPNR4Ea953FU7
         pIoeVruV2Xk0TWfbQODkfL1NePVgI4HRDP51DUUcoaBu5pH0UUwxTT1Z8smAI+dxvZEt
         4XhQ==
X-Forwarded-Encrypted: i=1; AKwUvByWvp+LX9vS/peVeTfhhbtoVRdoQ57WZEEbNk0EhxVAjBNtQjFAsZVvMrhtGYsghkNY8H4W0P4e+gjIp7A=@vger.kernel.org
X-Gm-Message-State: AFuF++le0JiUk1WsBb9GVwkUPh+e25HNYSyyAEJCZmlOT7sJ50m1CtDh
	zsxHA2G8JOO/j2DHEPGqKM4kx7Q2U3RQNEbtld1X5+Pv2wyp/q033xPoeRBGziOJVf3aeYNw5nr
	N0aoz22Df7K/i1slxBzZ4nYY/7xXPf/aETItrsTqzjrpBca/u/cgfA97THdgLc016+rg=
X-Gm-Gg: AYBFou3HJys+64pJ1q+4AS8hnS31pNBeQehbMoDQaBgzXfeUron5LluhowUxl4fkBY+
	2kAEIR8gVHukhDIMzpb33qp2sH84s8o0y91B2YbnSskNVQ/yb5nUPzlSPWJSTAoZcuuu+IQCxtU
	8U7lePa1vajm8sKQVN37or12rxLRXzouhmDmQ7KFVJki4jEE8Cb9Dj8sQByN/JwEvL3wgbDCycZ
	sfHYQOrPoiS4dAkeeBCZ5rF6KMgtM5pOLG+r+0RohOjPTm2He3r2ML0XJC87eiOVhQ+ztTZX4lR
	CNroKGrQCXteGJgObIZjTLr4b7h5ZtEw9zhlPtlOE3rCXsHasdJAd9exPbMsJsnaP5XamfRLAuQ
	3WedbNGRoUtDs/Q==
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477394eaf.41.1789394659349;
        Mon, 14 Sep 2026 07:04:19 -0700 (PDT)
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477303eaf.41.1789394658737;
        Mon, 14 Sep 2026 07:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm5983725e9.3.2026.09.14.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:04:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Message-ID: <pngfa3stqy5jelag52kmu2qrzbg2lojrmnuuz6nc5lvfvbdagi@ta4pz4idnu4a>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LPkcarcScm8V7aJnUQdg-8KIH9FNPLky
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX7/cM7k6HR4oH
 EIWDUEmfzIvz654OG7xNzMTq8gS+AQ2FkoX99kAgnoLNz8+xgdmlTj0IqDcX3QQnt6gTlCNCvAw
 1AUb7UNnlgvKeJGailhAjOko6pbbWbM=
X-Proofpoint-GUID: LPkcarcScm8V7aJnUQdg-8KIH9FNPLky
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7fee4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Uuv_azA6OBGcZ0en5L0A:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX7/lBzxymdetk
 NDDHbAo22znkBbe8xOCVSUX1VU9ZNw3LaPofzDgXSysIxqsXUOJN18iYnUXsvnMYjoFYaQhN2RL
 oOKtMPODYOot5rGnZhtNdSxliLDe1yZOn9/TlBceXbhROWuYrLHNqFS5PLAJRBn17xBBFku/ePa
 hjcisUvy+AlMugCvJ1DSFXIXoheWIvxs90Wl1BJ9wiDFOC6ogDmhgt8b4RqeZG/Zbyd5+OylfdY
 X/vNor/CUP/7P6Y/yCdh3t6gf1N8FRZk3v43/YdIHma/FySn0rfr16QVVUsfU5spnzY8liq9I/1
 vASPHjQDcAsquBjTe/m4WUO6zDfg2sDmRv9HW+J2Ofp70J5vzICvp4dfXhRdvMVqKhIWqpFxQCe
 X5A1NYlvFVHEFlPyDM1ryGLR8TcfdDvuAA+MPY61yAqjE/xVTJTeRV1abRkXBYQaXojaqhTbIMj
 rltSu0wMBE3lN+u3gPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140202

On 26-09-11 22:17:08, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

With Konrad's comment addressed, LGTM so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
