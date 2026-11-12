Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450101;
	b=iMo4uL/Fc9D/+iCprXPC5VdSV+XXh5ACYezYT9B14GiruNq4hGEYO0NKyCJ+MVlA7DJS
	 f8rP3I0VLfMuaWuymwdgJZ27vlZ3x+krhjaJgUu1UFTzz2Fp94Xukw+wJlTtCdPrYBksv
	 O5YIdCzUl6k8Tl4pKEGvWed5EoMuLw2YxEUivsgoYVHBQcmeCBj4l5fPh7a0Wk6ScjaxV
	 i60qiXIDFm22VyK6wopfy6sDRKxSpNTn4hCg/k3gmmE4n1P8l8g6T9A1bmrQeyVP+0b23
	 XkLdXhoMV1kkef9SLOVaTQR0UeAvGdMqO+WuCGveeY28KM5tUrmR8QdgnblYKNDBPtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
	b=cdlzrgoGwgFiFK3ZRnpwtidNADDkKO271IhH3G6NyefXwto7L9ElgUSTMvpsDgrgXT9A
	 ixuSXUCReOgmsy4DowZmGWnFL04NBGpAg0xFSpbZstfCWWY8hV6QYICkIOYoCcJV/l1Ja
	 3IvkEl/H/O8uEQpv1AMojYJvBzfQ+WFJ0zo7YpCpSXjOcJRRH3bXw4bnEHQoGkVzjbrbS
	 33V/k+7KMUOIusPO0vfkZO2w6ybiHl4mT7u0EKBJ9qQh7v1OJw5sKlZGfo5afVLr+HW8q
	 CqWnDfhhrEUkQvEkZEjxWWnngy0zJNoq5iSSWfVpzTDwF7QT51XMsEaGuqgds0vWJDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYlPo9Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMWtHGOC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7442D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYlPo9Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMWtHGOC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMb1OZ961211
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=; b=nlYlPo9YvJkpg/IW
	fz55gQzv0lahwyRwsOUoXxUnlDf7T9g2B+AQBD8thk83ZytRXSZXEyPL4y1mARGN
	Ajm6Q3/2BJB1gQBUbX1GNf619a2K3RoKce1heUyBG+EWsrSxdEZLWT99WZ+VDgWW
	uy6H5km6m3hYDs5Xj88gbkzodviQ0y07Sy922WT0Gg07yYq3p/giNyncoqC6NmGs
	tKVhTmBNQ2BQA5RQysGrwHQ49KrqEI8t8iSqfQSH9Z273CquwuJqfpEvV+K6OciK
	Llede7IsBngZy/unLu5RhXWQ/FMHg2pSLbreb00NOfQLIHPhZoH6bhKw7GHJ9qY3
	XjjsCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymt7x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:21:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2284377a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794450098; x=1795054898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
        b=BMWtHGOCvxUWPWhPrjE2Com6EMfLRj6npCxBupiXycUB1CDyi4ilu3qpSbDLmOe/B5
         0iI7Sl07IOJQolfoQRFLlL1HSZ2fw7HEyib6V0SkGnMoXTXUmlKgOPDH7snGivqiqLmg
         //4KhOKWnXE0X3Krp5KxSOwJNzrdqvUfLHnUGZufwfX9ZV1ypgaPAg0t8Fo6ufMleWB9
         6fP0dVlaRpRM7F+x0h1GjtqUb8zi0SNB14Sg8PsRPIWvm4S85RwA1dGkekHZnfWUoqJ8
         w3rMDezBcV+PpLx5b8FLjNSdbagIQSBOs/krYQFJCmS76uSt7IZ01WyNQe71v/eiPZbW
         BgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450098; x=1795054898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
        b=DH7cPVBJ0wzmdxud4cWDy4rrKHIOTZqgwJfk3pTDvSp93rIxG9l1kvBtC88LpRQLVY
         RdtyIh+CLiCnGtVUznue50tkitg++QX94Y3LiUhr3YDlOk/8bPfA7fvW/4Cv1DKf1GeB
         lrhBGIdXqa9BcCl1SXVnVL2zZesh25NsszvQOYS+s3yK0uaOQ58jkE65goGJ8Uicjoa6
         d+ZIsSJsryUezzOsy3R8w4bx+SsqkBVrAlkZHI/pC0mZ8xrp2XLrUFnSRGmwPEwK90sg
         HbYTJ32H4oHyghQtma7gti0S8LK4A+WZi+G6cFSn6boz9FF32NRY28NJBEoynLHP0Z4C
         6yyg==
X-Forwarded-Encrypted: i=1; AL+hErEOyZMixWBS8e1fA4bvrYnj1+0bumnH3zXj8PMcn5qR540VWYNL3l7dpr/egTgb5GuT04HFB6lnkxlRv84=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TkHxqliB4VQdHVXTvGlQK1FFjr+zLmZiQBvKoHqNMWaBmnG9p
	G59ehDxkznon3vZ+L4gneHhydurVDR1Bv825pTzw+6ZNaqpw27vZHsCbSvkN30y+TuJFqYTNQN8
	EO904YlHc4x5jh4rjgVn0WXXKYmRJS/s/O0OiASiWfwVn7X6tGtlBsLAyAykvlWLw2Bw=
X-Gm-Gg: AYBFou1ubaQ91XKUsAu4rAKeNpm7jZ9r9JNdZzxpVL4GtL3iS7RuaDViHSAc4vbVW4R
	l6deUm/gPVkwVITO1Ck5DCMhATmRweQXp1Yw+dSmeqmTS6MNPU3aNwAMr3HoZtgeq8cljYm5LLH
	BbHBp33SwUvSWzF2yTvmsdbp686FikGpYbdQnu4DC9K3Dqv5N6Qckd3VQYUFFXMdMPsBUJ6sliK
	52baKPvusz6pQGdIOiwTrIUZ5Qtq+XdupuAxBKEKoRNBmRMttNhoWBSKDDAjTqBzbYQ4gcEEIBr
	YGuu7RCu2mqsthqxmEUqdd7VO+CwITDoIe594bHiodDQYcFh84pwXFKjdwJovww+O26wiGUxHU2
	Sk233OR5t0rHhsNmG0sa0RWB1i1iWZ2Ni9AR3R1PVKD0g4fWXTtiYbOMcpS/M6v0W32ElFurFW/
	er
X-Received: by 2002:a17:90b:388a:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b182e13d4emr4150514a91.6.1794450097983;
        Wed, 11 Nov 2026 18:21:37 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b182e13d4emr4150494a91.6.1794450097226;
        Wed, 11 Nov 2026 18:21:37 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm1880088a91.17.2026.11.11.18.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:21:36 -0800 (PST)
Message-ID: <fbacc809-7931-4613-ad49-59e74852394f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:21:30 +0800
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
Subject: Re: [PATCH v8 02/29] drm/msm/dp: add support to send ACT packets for
 MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
 <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LfqHnz6Vr68SKwPOiPJ0V2fTUhRmuDf_
X-Proofpoint-ORIG-GUID: LfqHnz6Vr68SKwPOiPJ0V2fTUhRmuDf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX6ekewMFDalzI
 hippw1WozFi3MJo6UcSAnMKZmTBiA/TM/pT8ohzGbt3RlsLf8VTKCCFUNhZcETNmdWm928hEJe6
 Wafs7vXAssU2Std17enIu9PTVcLJ8baHWiGOd5xBVHY2NizlKRKAYPfBxaoj/vAYhtmYInnCMK5
 ujlU5AaZlqa/m8vYX8H5YCprXpjeDxZQ8BCC4mXS5PAHGqRMiBXeihkH1Ft6W5u/iCJTWqo1TTN
 /pQ0PkaX+U1GkG6kaag4WiuvsJP6xb7Ugv8EtsOWSOHMLj+A1EwOetKXoUcNh+kGONCfdJiqQd7
 dEA/6NkDLNsUDffM7fG3hdROTvUMtRRI94P1z1WoYN8JskZZNQ7rzBGG48cVUm4z1im0zTZ+ktS
 zZQOhxArdcB0ecQglUp25ykMuk8nLh9pLCzceGLn1YUlGJhsJ+OT/tzKZlpipmC9IRaH15afuCt
 1pUN0pDO9eZlS0Pmebg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX9vhjfDW2sYTL
 vtlN3ZW/06P/sL/tcPa2yEOAd27Ic7KE/6lCh5joY2NBsbuaH+M1k85JT6W5mizmpWpjSA8fs1+
 shJ8bQzANnjIQhWPEqXj8YWkhh5H6cs=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af522b3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lBWZ1gcxILu1McdKNGgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120009



On 11/11/2026 10:41 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 10, 2026 at 12:54:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>>   5 files changed, 51 insertions(+), 3 deletions(-)
>>
> 
> Is Sashiko comment valid? Otherwise LGTM.
> 
The comment is valid, but the issue was not introduced by this patch. It 
was introduced by "38e4b12149792 drm/msm/dp: move the pixel clock 
control to its own API".

Would you prefer a separate change to fix this issue, or should I fix it 
directly in this patch? If the latter, I’ll try to send the next version 
soon to keep this series moving forward.
