Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D40047D94E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969569; cv=none; b=IjkVKplfngehFKpcWSmev9WnRWboDkysZykquNCMVoFEW/jkKRw0CHvLFNnyMAxy2AQ0XIwBGkUhneJ+JhnOsKlSplOCCBUI2Sy8HXGUEavb9wmecAS3rwdSYR9LxdYfZUvqD+nwDRLL0ZkXJNiRdagtjiNypFGwhgxWSk5hoIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969569; c=relaxed/simple;
	bh=oJvnW7Wg7eWAZidHc8oetePb42bO8D1vvZLFpH7Hvn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWXotqYxonvSsD/o/84iQELBvFOJuhRF4s6vRCbH1PlIJIMSf43Rnhv6ecYQV5/fNJDGHt3osta0tOOxRyJRn7mTonrvOqlpa/UGPhI2oJ5+maIXsSA8b7WfvjlCW5rMjAgZgKtIYEmerer5l2SHpQoqtv9MuLTnZS5VhjbhQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZSQxUg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgvhKJ81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZSQxUg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgvhKJ81"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8vlDP3000860
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=; b=RZSQxUg8DMWENbz8
	/2tgFMNww2z5LvmzbTrkdYN9ICez/UgIJRwOx/TMVyQvFAjY3qR4Y8Mm9dNGlfat
	A1064UEzfyNvw8PSF2d9hDrnNn23L1YXP7hFAL8Kh5SBc1Sv4q6y6ZPI7mwFxNjH
	m9UsN7zh2CIHVNo5eTvRL7oQAb1E6+3vtAu1tYOdi0E0OuRHHJkvnJ1z1dsZcFFN
	8xHSTAl2DVJwQIxTfEr5veeA6ukArm2e6oXEA3lN/FGyhaIJz0wyAsmrT9TWTZ4y
	yXdXPTtfHdXenKcYL9+rAuaODX1Ac9FAgS8NseC9haHxLCURnbGlLwg3xy9sP1XN
	9opTeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu765-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:19:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e605efae40so50491475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969566; x=1792574366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=;
        b=IgvhKJ81Q49Rzo/PFEaDwqzXOkq1gH5IJnKHIGp4DQM4WK7DlbJC4DtdDtjZ2WsRal
         Tl6GHq/VIGMC1VLtTpTKS8sc3YmuqwDGDf/dO+cKkICmR3VM4KQsc6UHWReTH0k+NLRA
         dwJsb4G6K13pwSVn4KNTSwMDgcCcTz1MZmC6Y08eaC79woup+oV9s+q2ecw/xlvNbnVH
         iT1/ngzADQtI1oA5T/HQO+Khv0m0uw9GIIac1ipqNzBKwM2hqCd4onTjKOfqRA32BqKF
         HxV+e65z/N348DaYeFiKwg1gP23iSutHGBZ4cDwUVWgM/gJ4mgfp5Bh40U7clW4VeNod
         64FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969566; x=1792574366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9vbNOPgSoW2/s5EmJhhLhQxF1+z/I0nBNc1/Lx6mzA=;
        b=tUPu8wqHM7XSYxWKPE4EfIarZ1I775990KLqbc87YO90Q78cSQVrGeSAXaZkOA7Ytx
         EWkDKlpmT0vLyxqdrDjJ0VJlDwCUfxDXNKRc/8rI3zHEXpM/UQ/LjaGf7ATKWs7XViqK
         z30+Rg+c7meCOBPD1QtxbrySFkyqxZYQA4xDmo/M3FzDmS4IoZmbfnqeg/EyxdqG4cjI
         KmlMBRf+xqXMiS4Z5/iLgyBO3/cVBTS5l2iwsFjaQpsnOK4ew17MNj55IgCXgtpxw1aS
         plRR39trLufelww4rPyFDckAox0WuWDHTkRjjYUtOMGIbnr53lIZhT4vGO9H1fGZxu0+
         2Z9w==
X-Forwarded-Encrypted: i=1; AKwUvBz47kAAglKEIviq64HT08eHwKF0z+qjbl5qwgwVL0iRyoOXdNVqltVAYOiP6QF02EVY91SEWxpJAGCedew=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6FxwYNSlTH4WEoqHY4sAKQHLLXz+pfS1h+08fmjz/GWkBb06P
	E21bApaGRzj/QSxOCcUkw8GiAwBa7VfezqOIIhAsBeY+4cybmlqWXwByGreOhCknv/Y98iAtO0m
	A1AAWlao2FEi9SkGgJduModPo9R1jXy0abP7nycNxPKGn2sRTeZEcW604jt0cRH4Bs3Q=
X-Gm-Gg: AYBFou0S9COziR4tWEL1mwBE6gNyejTI0526gPXrikJkXN4PU3YXGKtv/lbTSixkEqt
	5i1BRk+Z+sf0/G7GdS5O3VioxIZ0idDV9jttofOOTPfs/Yg5Kne+4uGnWUSzwfGj6WDhntyPXtl
	Uo9sb4q65TgdJADPW5buOC5jBPJNLPnOjtlvf015x12uN3YUxIlWJxFIxPZygNe2bRnxbMPGBnO
	LFe8IAFlBknB3Z+uiX80AShXaNeW4/jSPKdmWwZHdqkbeVVZwskPMh6YOKZjWiTVwM2ZcfN1r49
	EQY06XSKeZMmx6KKMO5UJ7DeZtzOuZ0A1jpCIWXsFEG/obZfrusGlJqOUKEQst+frCXypvYA/1V
	V5RiK9r8IHP9CUnbzkaJK4SipFl82
X-Received: by 2002:a17:902:cec2:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e842dfd299mr134805335ad.59.1791969566331;
        Wed, 14 Oct 2026 02:19:26 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e842dfd299mr134804985ad.59.1791969565791;
        Wed, 14 Oct 2026 02:19:25 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm64057305ad.51.2026.10.14.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:19:25 -0700 (PDT)
Message-ID: <76ad74bd-e742-428b-b206-9db6cc98f10d@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:49:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
 <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PukWIr368spnvbRB_8xsnxIufdRXM-u6
X-Proofpoint-GUID: PukWIr368spnvbRB_8xsnxIufdRXM-u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX5Res4sq6NnWV
 uwejmpYQcOcGVW2I3z5psfnZRkyiPQzy/EWNM16BH/0RB8EYLn4pkIVsdGafSwLFy/bZ2wjI/89
 0n4WUl+ZFPwcv8EBwFx9d0XEt57Mx0pqhYqTuxK3/7ZIra1DW4FEvC8Uj82KjmDwOF8xX79+YQJ
 4L4RDL1NVcCATASyadrOrFzLj20bbSwc+bFZiG9etsLZ+YtENTlGe6EZfNUS9m1A/+GsFBzMuDu
 GhPsx8kZHOPn06vruonkkdkrr9w1RQEe3siAAMa77FULx1l7MN3CF1w4ftswVoT0qJ6wYDtA1/P
 OvwMsA24aq2KtPBDniKs42oxcGCQ+NyNnHwipM5Jm7wZWwHZ8SCVYPfy4SCf1xsxeskxLD/t9nS
 yCGAjGSHb6KxKsd6/x4b4Gw2c/g6RIvGsYHLXECbwyn5oNZKst/xq4x1Asdo10pVsmlcM/1YI7z
 e0uPrHNl/GL0yudjHpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX07KT9SSmcto5
 vHHyqENJbEUYQwAHHR028AeyX3A+89hp+xO1IBbU9U4FSaT5kB/85ZNQkc7Es0Ue9yGUIQxQuRz
 /pw0O7VZP5XMz2ibfI6Haxr5WD3AuTs=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf491e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9x1Nq3F55a8nTBbgZHMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036


On 10/13/2026 2:48 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 07:02:16PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the Nord DP desc and compatible. Nord is supporting the
>> four DP cotnrollers, two per MDSS instance.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> Why are they not a part of the existing entries? Is it a newer core?
Nord has two MDSS instances, each with two DP controllers. The first 
pair (0x0af54000, 0x0af5c000) is MDSS0 and the second pair (0x08d54000, 
0x08d5c000) is MDSS1 at a different base. No existing table covers this 
combination, So I added a new desc entry for Nord.
>
