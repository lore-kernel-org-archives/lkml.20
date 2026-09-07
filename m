Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141E449B11
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773755; cv=none; b=jO5UEyf4iIqDvAK+Zc3vxpVUJLdQ7RNARkdws0rXnY3KmPcKI69MpyS8QNUSpyNsZ2yaLHLZd7DW2bbsni8v9gM7r7U6zh7sQBbMZOosooCs0JIM/MVO6IfcliD2j9wt5A1KsSZ7GD8M1cWxPVFfo+UNM0l2KwORvTb/r+6wmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773755; c=relaxed/simple;
	bh=ACgvEuI0m0cYMi/FIyyrVEh0SSzKbpHAuJoz0rz87nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THollrjoFP7CyzrX4cviXnVZQNxS9P+86GQDI/BU7Samkogo4Dto8xeVRLRFQR5NcGvVzBx1x8jaALOSGkjyorunEhJCtFa2uwjJTiN07lULqfSmGDD+FAnOwQG1MFjsF8YAWZEtNgzRRtbFiCFWW0hziMy9FTONrBeUpXVRtOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiRieHp+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLUrm6kX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiRieHp+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLUrm6kX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cR72146236
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pZyG6eb3zzujfssjYHEawTXK0BmQECZw2QbjnCLMKU=; b=TiRieHp+jPF1S6xj
	CDMgOXvXZPDeKtwQlipQYwn/fEOv9Bn/BJnNYwwxUVVnGl73a5OryTSAWtbkKWi0
	0890Y02gV0+o5hVvTafjSO8IGASKpkKwdzE5DDAgFWtJAE/Go3N1NOjUHN21yWi4
	z/P0vghXqYaS2oX1fGZFkhuFyhCgDdIF0NYlWXussx7Srt35/V85V+W80EayA+GP
	0uQzk3TgD3dGEWqFWfqM6PK5idOdTOU0tmAdB7O2IhbNjoZ97Erx22RRUmaw/86A
	xCj86KYq8zI82jrDmc/63YxV+GcXMbD/w+WuY7oB+QRZnVXxJrbOBiyerASPiKHh
	i94gyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8je55q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:35:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7604047a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788773753; x=1789378553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pZyG6eb3zzujfssjYHEawTXK0BmQECZw2QbjnCLMKU=;
        b=PLUrm6kXNhovLKvMk/BMleBomhkvsGgLSz3f5rrOioL09076GYWVTyMVSo9TblCkPA
         Z32tlYSpwPEzegyqB8dijQUO0gb9jkdyadHvBV6w1prWdfdazFzQn9yfClStWF9P7xi9
         susMrZrhbuZPvyBdvZSp26Ye1KTVQY521T6yMW3ws9Kn2jeNS4MzH8N8H69DGkbr46XG
         k5zgUO847voz1wSF51426Oc3aGi8iagYkfOT3jOdg2vHvgomFFrmHaQWvhArI8D+VFNk
         YrfhRtt3YZj4dYFhmoeDoTSRoNlPdGWglGfeBjgHzqimCaDWL/CkhpaetrAd1XrzIfRO
         Zxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773753; x=1789378553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pZyG6eb3zzujfssjYHEawTXK0BmQECZw2QbjnCLMKU=;
        b=TREFN3eScDEJT5P/Ay11NHfmBGmA6zA4/2HIkXcj/d0KYXxnWVh9luacIwFjbqBOv8
         iZONlL1VOB6yjWR5dHMLNnB0/bljrLQ0pYOpUzXXcleCeW28plJEfRfAR8XqsnF2zYYY
         +bLKF2w572bAq/ojwDXJinxFDhq2fYUZXSsbm9NxAx0As0qahDQ7PC9UWDaW3EbDZ17O
         /dxZX+6H9U/SY8tJ9UpuErZT8eB8T+9Q9v96qXrjWS8cqiIpSdLfNwI8BaxjBJab8Fyj
         FKdl7vteVQHY9aLVY6sISM7pcUYKmXuf0svYVP4/ULit0nZfFu95IHtMl2hQytirj7E5
         LSFA==
X-Forwarded-Encrypted: i=1; AKwUvBwWyEmQ7FcLi88DFlvzPo8RPFD/p1PhkvSM/KPM1MVT1Zqum+CqMdFijIWxskNLjxwIjpTkftfWxbDloLI=@vger.kernel.org
X-Gm-Message-State: AFuF++mioYuQFKQ1Y6ym8PlZ4ZHmbirGBTXnDQyBtWP/rRQEuUWFFcxb
	nleL060mMnewDMxd9mncdTmGSlWpWy0FSpDfRkKtGuBWipzSfNOsM3UxGkejAjdpAXKJwMBxACa
	4ylL9pSdnVwbMI9Hpaa9LVXVpHsxhnqF2ge6zWw0YLvfms6bSUaUvmyRVxs3yJMCcmH4=
X-Gm-Gg: AYBFou0Og0rSqey2wvVUMC2sYMFb7pVox/qe94LBuJk4Qm4A3RkE79QHNURrcDXjoeA
	OO73wBw5/2dWR/RObicsaaulAWWuD/szSrc2qKEGZT77q9ZKA1fy3SUAf6JiHRJ8Bu7HlIo5bL5
	wgWwPGljhBoMdIfh6WWUhqOO0ZdVtz2mY4e0Uz7LhfbgZ5mmofeHd9yYNygXC+wVARuQFLTw7B9
	heBraewDj5Nz3/cCAvsuDaINblq0A0YOUr4tiJUYBsSu8/HLgPWx2ZfdDuH2KZsejzwfVtrzVLg
	d6n2BGDbaGHf5RfxX3/hRm/VRQi1KTdPmWFQLpE/jzisLwUalFP2TdN7NLL7JWwY20Uct2bB1vo
	+NLqboWJAbrKZgM4bhZHrMVlS8dPAWd0=
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr32015979a91.6.1788773753041;
        Mon, 07 Sep 2026 02:35:53 -0700 (PDT)
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr32015923a91.6.1788773752605;
        Mon, 07 Sep 2026 02:35:52 -0700 (PDT)
Received: from [10.206.103.40] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm41656313eec.15.2026.09.07.02.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:35:51 -0700 (PDT)
Message-ID: <8b45dfc1-5350-4a63-9213-a1160478683d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:05:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: clear force_link_train flag when link
 training succeeds
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-2-2825e5bf8a96@oss.qualcomm.com>
 <2b1e73f4-a476-4dc8-83f2-42be1008c1fc@oss.qualcomm.com>
Content-Language: en-US
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
In-Reply-To: <2b1e73f4-a476-4dc8-83f2-42be1008c1fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJD52sc-Hg5z4rHfVnN2N1NmLRlkGLVb
X-Proofpoint-ORIG-GUID: UJD52sc-Hg5z4rHfVnN2N1NmLRlkGLVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNCBTYWx0ZWRfX3ZYZel+XGpav
 vAZ5Az8NquveQ5sB2GTJEWjSFTwwmndxsVdTpAismScmAMx509OW6DIR+CsS19FGSppuTrP1xlI
 IjIIYYoJchZZgoCvodjE0PpMXtXBvhBaFw/WCOAYIUVWXa3Pia3tzBS1Bc62bLYdrXqC3HVUydz
 thTr9fSxpY1UQqbCQGBVvmGOellzSgh+CnCRxlw1WaxGNrlegs2Q6rukVrVND+xYXYgowYdCOxu
 CpnPbZrrFdjZ4i/B0KGHaEmemWig6+hgd3MDD2FgQlJBHySKGM8PYuTl31fpmmTFgC5JVXCCoEG
 MW4rofn9c9jUVfqlax7uVouLEVnFDhNf4liMs3vwI9qeen8fsiXfKCSFEclTRaREBtycBeqKvNR
 74sQrykEA25TU97Kkb5TtBnk4pDIJCHVxUTL1Wz2H38hbIPiPWOMfzl26aJ3LT5toogWvWSwhV4
 EnG6paZXzvWmI0OjD5g==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e8579 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gUzaiutwswMiDYJum_AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNCBTYWx0ZWRfX1s66vo0BEGlX
 7uhiof3ev6ktWaQ/YJ8/urxtBKl3UH74SL6gwHw6Z3kn2A1flxiUGHngKBj1x8/SZft7nEpmg9g
 PxMO+ocvfvg1cuLLUYBXxXUgXDtUtcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070104


On 24-08-2026 18:47, Konrad Dybcio wrote:
> On 8/24/26 1:28 PM, Saurabh Anand wrote:
>> msm_dp_display_prepare_link() sets force_link_train = true before calling
>> msm_dp_ctrl_on_link(). On success the flag was never cleared, so
>> msm_dp_ctrl_prepare_stream_on() would unconditionally trigger a second
>> link retrain even though the link was already trained.
>>
>> Clear force_link_train on the success path so that
>> msm_dp_ctrl_prepare_stream_on() only retrains when the channel EQ check
>> fails, as intended.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bc646d172abe..40e19d506a45 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -649,6 +649,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>>   		return rc;
>>   	}
>>   
>> +	force_link_train = false;
>> +
>>   	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
> This makes the argument of this function useless

Yes, agreed. I will update it in the next version.

>
> Konrad
