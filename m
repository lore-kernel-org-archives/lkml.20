Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1524ACC74
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637675; cv=none; b=T1qhz9Ug26khwmWOJiZEldMfREWVAe2YzgJMWltN3e67CWidZBF4xFxvzvILWLyxhJV5z87gMuoX9PnEdEbqxEH0yr6io6roDgat8nDS5M9GU/HmeMHfdxFvtVj3j4Qxwd4y0OM4L/hrdUpoNSy0CSpW3Kvi0Mc6OG2Dxk0U4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637675; c=relaxed/simple;
	bh=TSLSZyuMBa5SVWwas0bnBhlpq8LoE0QvEzp119jes5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtAvigF/UDXzBrJQrs6fUXQuyVGYkyzMXYUe3UuE74U4Mk1RH4eZKubeiQw6pXYAZEcB8wypYVutILaPagLhRN+v0pjdrznx4zmDeR2FhEZq39nZTjgGcIKj/dpZaB5sgfXpYneHMEj5J9ff0j1Ws5N+WRxiC3qL8xFud24z1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJSCnOnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnPvLvHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJSCnOnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnPvLvHa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H8TdgS597753
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ImJcDo6K9U71W/J8ldEqrjv
	Rhfj4zEjtObZ2EJ/BYs=; b=oJSCnOnuPUltWD3lMsRbX5u1jF2sDzLxLVmqdln0
	0U1a8AT/ovW1kYGFMXRK5OXPuMRKoVqQlatqeH+5PSoR0MZq523NAQNorW9IcQ8n
	t2ReJz4Q9xbshy0PI7eKxv8Fe9d4bmGfTh6I6VHd1+zxF9ZHABc7xcN/OrotuFaF
	e+3k4w4jzEiHfGizh9RczXew2F4r/JTz7vaO9vCnjT3sItaWTn9GwejmG26o9cmT
	vCXoulNZkPs/QxrX5cpN3IGHtli94oHmKukA3T7EaS5lxe+86skW9ayexsWjRdAc
	qXac7UhR3uMgcHcCq18yykrz6OgnRMXMhqmuaf07/BKklw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra88cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso1176533b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637660; x=1790242460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=NnPvLvHafgaXfnmgBvTA0qck3WqQVIxnqPl2wVs48e/tLn+g2V3XQuGuIBvJX2jlPG
         JJGNf082yLgNjXgi5L8OHlintcFv4U1AjHp+0sSsG8Q3qGVRtLw6wCijGSg2Dhj4gLR1
         DF8eOJLr/XGI7SuZZbnFgtA4KIRYDgIpcGla9SA8oImwQvGFddJH33BNmNqgoNjsXdMx
         AFfvMBG3z+Yug59SFfNgXnGc9QAzt1QXNzgMnWi+57IIID81cvFBc45GEw2k6sebZ5rR
         nwjmL4l0JQjSbwu36xyC00yvI3bbgxH0Im10wgPtfVrbg51AD2NfJCNuWQpCey7JmHmh
         m+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637660; x=1790242460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=f86pdgxOT0a20y0l8kJkviJ1wLlzqSfp7A9TzWS806rWy55+epNVt87mMqVO5mAtaz
         YuUybKyIY7DMQGgk8JTGAz5zKyJBsUR7zccOUe7zlLgW5Mxk2x1Eqk42ENa6CUaudXtn
         zHaFQdB/V7ysf1Kg5Kf8fbbKSqC6ZBpgFMy1vbM57SRiKVziCVj+E9kvWn5PIm6FS5H4
         goVvk2guPfLyDd3lEs2PV98fkpDU9tYDnuavr5O76MO6uEst1UiYafSHYgz6jcGQrsz3
         oyHsWDM1ndYMxd+eZuHYCaA2hQSiUGHBbVBulcM8K4V8VwQn2HCcIt6Sp3KRZzURyu9J
         Akmw==
X-Forwarded-Encrypted: i=1; AKwUvBy75RPgO0gRLOV5OaWXydhNBfWNs3hxP7RXiWpIKz732Pgv6QGxPu92qYOO0vpW4SV9Be8fIU+ja2XSoig=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/b4M7JEG2R/MtfhtVp9WiZumpChjBW/cHrbwzPE0YbAlFNS9
	IZv9XwZv6FguUJvkEDoK9xa/d4J6rEWuRCPbI8rR/0KNL410HkieKv2tk/LUBXnIvNKYFVzShxo
	IIlwoXMjxQvr1OFgziUUqKHe3JvC/oLbWLiaQNHhWRESJj5hG5KoNPxVbVrmTPnj/fIZ7TwYG+x
	Omaw==
X-Gm-Gg: AYBFou0DleaTyCSFctVBqvPNej79Vyns09nTj6+Q+gH5VWpNSPPVOOLJ5XsQ4JZS79j
	ArID9o/K2XSo52G6C/QZEjtvarZUvX/z8ZHyMv35/8dM4PhbCOQd0K4LBLzEsmbDUsDxByJL7IH
	pXxoYwgcuw39++LOrIAx4LL5KGEiNDzcHyUnznZ0HNuK+YWlPNc+vRQDgAqBqAcGk2SFvH9HMd6
	0IBc8+pR3fLHPN+WV+ZxNiva0qjah87881VB4fFjH2eRoCPPY9Oqjn0TZSDn7kASaB0g+o/xVkt
	G4OW97reYMRVCbLPwZbuSJmRgYVPdySLhVpJX7x20R6unn+3dRuIPwH5dJPjLwmUqhRj9/Uu4u7
	HHBZFCnS2LpxHBHfAlreKkzi+GpZNnrFEmac0L/10lkY=
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785606637.28.1789637660213;
        Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785551637.28.1789637659819;
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm11453434c88.9.2026.09.17.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 17:34:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Message-ID: <aqu0FebMYP13xfA_@QCOM-aGQu4IUr3Y>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX1a+YR7rditRc
 eezchngfniPt9q6ZwDcx2OLiCojoNPVsH9otjDMzG5QktqDt5fcB80MHoTdwWr7GSpKsFdbqVkz
 6LVY1Z9kwr86hVTvPyceWb1jXf2ZV0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX5SCqhszvkCTH
 x62bplkWrYtl1sE4TyvnhBt46hFl0I43/I44fmInNmT63pgI9piWTx9BAyK1wKg29BJMtgJz9Eo
 UDtkTOm+dowaaIacrOuwQyC8G3bwffypBiOtago38wFRTyqFNZCfhAl+vBJew9TDm4uy07AktdQ
 dZruY2F/rEtmKydWCkvuEp4zTi9H4JYAIws+BmNdlkiweU4bDOR6agdixcWI4jcXHpEYkbkGTD+
 tNDju//iuqh0qhKv3DMXAYS7Rn/QJ0d069MeknxmZV9icmIbI85Ri6NJznxu/a8LDl9EmivPV/F
 4RWDCGf8F10A/jl0ExLc+Co2h2vioEAEeXI5F94mqz8ynXx/sc0wPiEJ5GwGaXkG3T4WlPmEPsd
 9gjYsr1Wg12cdMiAVUWPFAwEU6o5lv47XinAWujwxFzgQbZAbVqIhKrTwkIga5D14Q6xEaHFWdU
 94mro+WfLReBKsitKIw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabb41c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=x6tdKxaZRr1psv9HlzsA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kHxhqRVRMYIjaQ0Uftq4VsK8XPRyY1U_
X-Proofpoint-ORIG-GUID: kHxhqRVRMYIjaQ0Uftq4VsK8XPRyY1U_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170130

On Thu, Sep 17, 2026 at 11:03:24AM +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up. 
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       pinctrl: qcom: hawi: Fix intr_target_width
>       pinctrl: qcom: maili: Fix intr_target_width
>       pinctrl: qcom: qcs8300: Fix intr_target_width

For the series:

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
