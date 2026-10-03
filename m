Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AAE56A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986828; cv=none; b=ttXy8G4h5AY4qFj1YUHBAkkiv9hIYnPGImZUJX1agDG5WXbigs0+xaw9j7iX4DyN2X5sMSjnU+uzvkmJX0W3ZbP6nxaUjwI9qVAHRczNgpxRwmek1SNgKftUWxHH0rlLl3i8uxb3gYVm/W4gaWXNBOUuDsZ+gd1PVmFNf8LszFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986828; c=relaxed/simple;
	bh=PpX7RJLO0gizq0oeVGZdXXRcZ2YnCD/BPbiiubTbfKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckObbqlQrpNPwfrvLhFPU1zzXw46UKrX2woGNJ++uSre368pY2W+ASe20EtPQMHSDFtxcywciAxmFRKIidH/zh1RhrAgw9577NHSdhfTeVJES77CjXp5/8pO7e3hZGqfokFmWarp73tnuglI3mxtb+a00K38hK5GBPv7zTPCQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLF+z5tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfJhh8N8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLF+z5tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfJhh8N8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeSI72309846
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f2ZdA70TwBLUT8+duBJwyLHt
	iJMHfNP6ZQ0iT51JS3k=; b=CLF+z5tSG0fKu2HioWxaPqDeh3Mln78SV/in48ax
	59WAlfgsZjRosxCu/HfQF/FucwjhB3iBYU+U6amzIdYX7K39kSfWBnENCoyzaDnV
	+wto62eJt4yIBp+Ei0bPv061uxCqikYJ1GaA1PagTbhoFq9MnzVwvjRE2e/EP62C
	8eadC1gery4fq+4QZfzmftS/M1Z6GxWv4hISIpxl6rBMQ16Oq9cg2eyIOJoAlc5j
	n+ajfsEBq1LhDepxjD779NM1lWUFxpoNrEikx9MxzuYdUXhOCvSa9V21VnaXY0ct
	JtYnvpi4JN/k2R5pUARqD8+YSyOs854V+/zxw1ui8egndw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da1vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:20:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so32385885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790986825; x=1791591625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2ZdA70TwBLUT8+duBJwyLHtiJMHfNP6ZQ0iT51JS3k=;
        b=VfJhh8N84oClut4o5GRoJFHcb5qaxvk+QpKN9wrfMwi6M017s8k2Bx3pTIBh8i/dEj
         baVHA1Kbk84c8HOgCfY2C8yN1oXDGeu3cKcDD0Rtb2rmWDU20pgDTFNGURKaW501T33i
         sp309dcwrJ6INEBWEbjLziFLvak7cHXtbXnS3GiR+n6VSCrFguyKmSavUyKzqDTvaJ1G
         DzjiyA6Tl8MA4H9GAFyLdle6miUPSXYwxTe7YBwRxoqrexuxtTyKXf9Qk0jIpZdpNKHg
         FS65Xh7W+mo4hCOEt8mIbtqi+Al64aUE4VXH9LS/ofgIEbKe8EgFNfcsIHebHPWbr6KB
         E7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986825; x=1791591625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2ZdA70TwBLUT8+duBJwyLHtiJMHfNP6ZQ0iT51JS3k=;
        b=iYI3advkN00xdE9z3Evws8wNOiSRpyQkZRPSNP5lafl79gQFeQWJ5Zoq5KcNpAjuMq
         ojCHky8t19nNDIiikjfw5mHN+MOAK88ZzhPJ8TsylifAdH4xcDaV0PnJSKng91T+T9Uc
         95p/10wY+XzhNDllzrGuw7OqTx1QonJ01sCPk6bk16Uwi/9esIrLqGoIk2dsToeFS+lK
         66QqOJTo72iB4V9gKeNPEAN0h0M9vIAXKGf47YpVKGnX/0gVM7R1Aj2aApVqhYMO6m3X
         gcLTGFAdUNXCiOQobUr7yWgIQVUHqimNB+MMBpmSsTZK4eK5Zh+rB5DTjmgUA9MAP5+y
         ljfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPMFQxZzIPQQ9oCjTCixhX07NQkGhfLPSKcIoLt3O+5Upvtx0aAWOqlILb/LOt0vgRw+B6ZphbKimKQJs=@vger.kernel.org
X-Gm-Message-State: AFuF++k2rHFdTI1lJlgxtDhciLhIq1MZSK7sZptnIRBQSJV3v7z3TM9L
	IZ9aNp8uDlyeWTTFUhsBBpA31ESsa1RpuO2hpadk8CuBhXaqEbrXw9Cfyu4Vrda9mpGmvDHIfY+
	vXQMrFZec13aQ2S4/503ZE45Jdi4tS2YUqtv1mDEpgFaTXzKmRvHnDu7J6WVwa535H2Y=
X-Gm-Gg: AYBFou1e7Dm8SE2Oej/e0pwP4ugMWOHI10XCiyXzJsi0OWL/PUnma6TloAJyZCQVT1T
	okyDJqqVve89K+KzEQq0PVvb0o0MWAAzpoA3ip5CbUWB3pMF/6SM5vgzp/YC2nkLH+b4MrkeJ6V
	KejMBD/i34xgZZBX6ecLG6GeVxxIPpNURH+jdBZTp/wJByCDTdujATpaTRR6nt2lr5UyJIGpRy6
	/VIS6BevTQS1YLyOV5Sg0IjI9SNQPW/OTuxQSV7aqmd14dD9NhZQw42FnIIM9TDkh0Id1UfJTh7
	Ja4YD2wJwtcUR/kJvuLGPkusouMVS8WImgF1HrjAqBFak5JHMZ0oqAvox2MQU9whW5ACEiDU1C4
	xmA8TybF+ucQynewFwQ3oIpsIupSZ14Cof2vb50F0KfXMP6C33qHa2IOt81OkTlfY1Od4LRGJQl
	wyO8WRnffGsoa/
X-Received: by 2002:a05:620a:4113:b0:93c:6507:a6e2 with SMTP id af79cd13be357-93cf1a62b30mr751648485a.65.1790986824919;
        Fri, 02 Oct 2026 17:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:93c:6507:a6e2 with SMTP id af79cd13be357-93cf1a62b30mr751644085a.65.1790986824308;
        Fri, 02 Oct 2026 17:20:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7dc8sm13737291fa.6.2026.10.02.17.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:20:22 -0700 (PDT)
Date: Sat, 3 Oct 2026 03:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Message-ID: <olwdkzm3nefubm7j37se3vmmpkfyxdfkrmgyiytbiv4jdz2w2q@op7vykeopdi2>
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
X-Proofpoint-GUID: PzKvH34xS6Pp-CLOVY-AR68C0n17xAlr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxT8SJBH0aERK
 2eYizgTwXd+WDSGP7d56nWC3RcToX44OZWA1cYfwEp6eRniCuG8MMobjR8qYk2RVvYENPP9Zrzj
 q8KxPwhARUY0I+wVUOkk/io8xRb7oSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX1Yp2Qe3fWV0D
 0S+g0w3CG1FHyIADZmi8/lyEcQeT8i8272RH7+KsCNu7yniZHruS0ngYs+DdbYzcxXCnblrnZKe
 oy3+/cmWQDROpd6L4qhkmzkxv+YhOipEk2TwIUc2HSWPWKhBWa6b5dS8rmTmlY2LqOp6N1cCeQf
 6OtF8ATq1HndaxH5eMRRSj8jYA8AqKsWEi4lHQvwgO9kp1an+mjobq/IQtHSYQEGGPcylcwJ62R
 G8YYgf3J5lYr3DnEu2EhtsyCdIiZNBWuifjT8ctwzGd3intjgXYowDU806maJ9dEhMcCxGx8u5S
 EjPKGPNqd5710ToWGYiGRlK/e/sZKeq+BwkfjQVI+l1Q4qM6wsqAyM3gkNlek1by5FVBbVU+HYn
 RbO0BZrQzKTpFt9incjWCOQazGZjoaJRHpTpskQWyos0Y26hxruRQe8GYEegdW2F1PFFwp1GG4X
 KQ0lQt9Mb63M5nTG1iQ==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04a49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=DT45myXMZceectMb0b8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PzKvH34xS6Pp-CLOVY-AR68C0n17xAlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

On Mon, Jul 27, 2026 at 05:33:26PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width constrain
> or scenarios that surpass the maximum MDP clock rate, additional
> pipes are necessary to enable parallel data processing within
> the width constraints and MDP clock rate.
> 
> Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> high-resolution cases where dual interfaces are enabled for virtual
> plane case. More use cases can be incorporated later if quad-pipe
> capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Patchwork: https://patchwork.freedesktop.org/patch/675418/
> Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Jun, thanks for your work and your efforts. I hope you don't mind me
taking your patch, testing it thoroughly and finally polishing the LM
allocation conditions. I can say that without your energy and
persistency the series had no chance of being implemented and landed.

I've posted the (hopefully) final bits at [1]. I will run them through
the CI and if everything works, it will land in 7.4.

[1] https://patch.msgid.link/20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com

-- 
With best wishes
Dmitry
