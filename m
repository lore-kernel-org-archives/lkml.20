Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D993E3142
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774447; cv=none; b=GdrwmvJVRnlncusUF2OIGBqnLyz2SMF+mdq7tP3pfwyTQiwJsUvUlbwybpqjcJe4GzAFLVtWJ6tt+dAozvKN46qGqiebRtDrjVIiC53cNU42Qs6v0+t+V0FjUGzdDaR1nGLjQcBckYV3/yoEDS6IL+v09Um52e2FwLI+G7hBiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774447; c=relaxed/simple;
	bh=Y+EIlACtqhzi/4yUaNBKx56qGlknGwzAT6M2bCf/hIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rn6aOXN8KdJ2vliAySDNiwzTsAmpgiiNKUDv3eqY0szpU/893D7HbTnXtBknK8+zYvlmJGfEtm2fy9M9fmGbfpwF2xj1lW6Kbp8/xxJt4GJOInZc/uO+gxjzIEcOLaPdVLhicktasWAeAKcUd6JEfVnLrDEI8Kjt0wvP+AQUW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPF8Rn3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gk5PTp/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPF8Rn3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gk5PTp/L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWWE3713211
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=; b=BPF8Rn3g3KB5h89b
	g33DLCh/Q4y0z5beMVmxTIHjgxln48sF2e7OWck1NJat4gsnZnSQ7h2NX2dWGvAZ
	FdyVirAYpD6bmXrpf4ramF03O9HSdW1bGhCf2XuewY6OeHDs5SuerwQaqgPDmrwy
	QlSLXuIuWPua+ZH5Ov14bhWv0yr5mUNZQ966GJmxmyYWm1+cely1utSJkH109ggp
	ixwgzQDVxrJMyzu6gmJ4rIMFrkSPysJsw7kum+QqS2gaAS2PXp8pyapp+9kNlJ1B
	5HHt0SxLyOh3ysLhkdOL025TihOo3l1+BkD1LVtaE2OfEn0uTnu5t0DIv6sA5W9q
	HIBSdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1d82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:47:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso41481615ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774445; x=1789379245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=;
        b=gk5PTp/LLpdv6sugqhfV6L6ia/8sgYK4Oi/CoGKpgAhQcycF99nJvYgL1yfJWllAGb
         N8TIE3eMErcuk77mXBMgbLJKri5mXBV4LD7K+IjB18mzbl9g8rChauZ8P8QQLRAYprpr
         pCr/7QNp4Ywm3d5CqI/G70ELL/3BaHkRICK6ZTjzQgcT2tfG5l2paP5DN74pgi+So28R
         vgOgdfYPkrAk65E+vZNIw80zBvQf4Yx/C7lMtTYuQBtJcvQMqjC3qWbACyt61jqqySW5
         uEB+7cadWG+4XbyFERRSEVOM5vUvxAyDVN9CImU32kpV7O/tUyfZ3JDPYDMPJShMuvYl
         UzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774445; x=1789379245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=;
        b=JQftxMxA5QcDfBXNzfc3BEVWlgMoCz4EnGPEnreQQrln0OmamzpOgVTaFLsjvYojUS
         V3lyQtLV3THOOQSbzasJDIdVe26uMhVDoMnm+ob829Sj58NR3vuTxgUyahZO916ciWDc
         fcmEGOOerMdUnfw9rSzO2Xi8nE9VyGxqr8Bqq+/Ug/Tkj9dXc7upw1MoR49HM2KjxzFH
         OYvZ8ouSVQMttWM1YYDUM2yohxJTuLlQlV7W/+6pT9aOcUfBLk//br68gZ64wPirjwkw
         Ke/jiN7/vZaSKpjJqc7ocFQXxgzbeWnNn1J3O08nD+eiCsTV27USrksvH52aZS8UlMB9
         qypw==
X-Forwarded-Encrypted: i=1; AKwUvBxnPpXnytOoy77bG6XFpbvlmz0twZHXkfvB8UdTrjkmbgaugVfqUjsgiR79oGbNLXQHhiPtOXGTLa3nFmw=@vger.kernel.org
X-Gm-Message-State: AFuF++ng6ngDtllDfEF33H9bno9O9XrjkbkftQtQuEaOdHLSuYiWpQxO
	S41au8QD2SIn4AKZ2ubMigMR2CIT9wZVZ2cKlkCInNBEW+bYAzqfGi7uh/hBcHOOxsKkIKUkbaT
	C/Nbvogz82F6IHwOA9enY+CS8n8/3EHi4REUFMDfd6lODipyLqyyOkWosfSYw7XlJDkE=
X-Gm-Gg: AYBFou0yAQghYF+cm5iW/8I2/z5PWybQtyoQ/qSuoQYMwa3eO7X8V+719O1jabYwNGC
	hxiP1N1bZDRdXrAEaHnOUwi4PLYNv3TNk2TEthMXGRz/NJ2yxx/CwYXDF8VH+/7vkPOkTDclb6p
	M2wnsMpA/Mi3e6rk11ErhplZLvv7Rs1aJ9DD5Kg9rCbfcDzIOG4kp9jwwHtCTd2YpK0Xcx76OhH
	4/nJ5jzPLEe6xkYpOQAkSzxlkuZC4hm7vlxt1fTyukemX0H6LV8QDcM61LvEnJRT88cyKIBNK02
	g4QGt9kgGQJTmZHeWRwC7fRuvkcyFhvUoQrLv9YwIn6FtDxJ6E/olqMQ5x3wnY00WcSwjRXdHgi
	RlpMNZMJ5f6oEjaRb0+k01SUyx4eCMAM=
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr33970792a91.19.1788774444948;
        Mon, 07 Sep 2026 02:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr33970740a91.19.1788774444513;
        Mon, 07 Sep 2026 02:47:24 -0700 (PDT)
Received: from [10.206.103.40] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34741879c88.2.2026.09.07.02.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:47:23 -0700 (PDT)
Message-ID: <902c7a41-363a-4ee7-b780-4d8cf2155d39@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: delay Type-C mux switch while
 DP PHY is initializing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
 <37cs3ejjaldogjlh3oyhzxgedl2w2s6qk7sercwem5j23vdtb4@2dzhapohcgda>
Content-Language: en-US
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
In-Reply-To: <37cs3ejjaldogjlh3oyhzxgedl2w2s6qk7sercwem5j23vdtb4@2dzhapohcgda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX51h6HOvHr3PA
 4p3PGe9EUDhScYeQDPlNWyDknw91/2KqA5Zkhp4I0gwW9l5+daESJ/DK8wepbR2PV1BSKpaNMh/
 MDG40Q19urgcgwh/M4bjinRgADfBKqQgGNel1uD4bw9naSu3M19Z1X4VJZsBlt1SvXrVImGgNmI
 t3AfKV1QvV2FGZFyEP7uU1SLEf6dIYm1R0EeoPYvEO1USwJTF0S1dgzcYUK+NMT5LbPcRq6h4U/
 fAqs5GObATZXVap0IVe5ngvgZ2ThJbHNN872UU5bAx0l2lUJFe0fzXKLK0FUwC4to7502tsUqg9
 0E1VWlWuB+PbB+LDjwBtnt2pMCIs9gYEWpO4IQkC9BJVDkI916eVwwGrHsgdE+dw7/xL739Kjn/
 Vn2RtvSnmX41jBVexiYKcRWAdG0P+isDzzOV77h9HcyT/ZGsrEBN5i6ep5ElbYPLw3fhcod76mu
 mvqLJFk4IPsBrnERyyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX6C6KWQ/Xufca
 xDfqUFw6huP8Pi/r0NAqd8p3FxtAjmiRLim1ik2FGCLjZYJxfzuYgj0p/3Oc23PmHvW1IU2RRIN
 q/FwNjmn1jHhlMXzV9LDwjU2CJT2j4c=
X-Proofpoint-ORIG-GUID: DADLEn9DomqwARTzaPedLR_9kEoxU7H-
X-Proofpoint-GUID: DADLEn9DomqwARTzaPedLR_9kEoxU7H-
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e882d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5J6vajjZXZgrfOcXjUsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070107


On 02-09-2026 13:18, Manivannan Sadhasivam wrote:
> On Mon, Aug 24, 2026 at 04:58:04PM +0530, Saurabh Anand wrote:
>> The Type-C mux switch guard only checked dp_powered_on, which is set in
>> qmp_combo_dp_power_on(). However there is a race window between
>> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
>> is non-zero but dp_powered_on is still false. A Type-C orientation change
>> arriving in this window would proceed with the mux switch while the DP PHY
>> is mid-initialization, corrupting the PHY state.
>>
>> Extend the guard to also block the mux switch when dp_init_count is
>> non-zero, covering the full period from dp_init through dp_power_on.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> If this patch fixes a race condition, it should have a Fixes tag.

Sure, will add in next version.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to 
change the QMPPHY_MODE")

>
> - Mani
