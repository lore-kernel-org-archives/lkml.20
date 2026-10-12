Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD9B4CCDE3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828803; cv=none; b=CpIQ1ZWNOGvsFkF3ZIK2RQ1T+QUJfD0mCJXbe/GBTwN/HPhdcr1IXD97YxrW8k9HRDxoTWmdR4p/MksSJT12WCYX52LaqUMFEwruXUT2Q/6QqBrjKmSyFTRZ8w4Yw3TTyFGSCN8XU7RJYj+gjdES2DYc3unlfa7Zj6ej2yON8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828803; c=relaxed/simple;
	bh=cvutCsJ7P1pO0gUDzHxGIOHKI414VIJ9bd4O2RctmVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVeGH9QTdn667NufKTluzJYtlj/xezu7B5q/kHvXjgwg/8vV829NuEslP4wPXTXBGm+pufVny5F5qBCnP8jTO1Ke4SM/QH13ccxGMGa/Mjy24THg093C35zogtWN+SiX0SCuvaXrrRAOxiW2D2celaej/UupHsi9tW6GMNhA2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoUKmF5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XS8fgdaw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoUKmF5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XS8fgdaw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv2mj4151981
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=; b=HoUKmF5TNsCizT74
	MN6lBM/b1ykF01Z9zn/fMWiulyFoFLAi4UmrpjsNVa8Fb4FlsNT1Vcm2yRWsjJlZ
	eukT/RXErwjzbSVX9wh9ODVz9PKuT/NzEBxywGZn55tNeQY4Y6qIJu4BXm3dOhh4
	BbeS2RPiWS6+hjfdYmZ3Nvy2T7Wu+SciOqjBiARd07hf26cDd/bTgAYDwX8YoDEI
	BLZWE2vE5uFYX4Zkfmf9/DG2SItCk+OebZIv0Mf5tWQqbBn/HrZ89IzJx9l9WNHu
	7V3CxDMrIRvHh0495j1T3leSQFYKc2RmgaI8HyI+eTJdJCatC4nt29lAGht6GG60
	gIk5qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdra5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:13:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso4064588eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791828801; x=1792433601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=;
        b=XS8fgdawmHdqCBmU9XUC2sTIo8YBM9RnFGVjcjoKQOeYWKmY9Tb9Dd5+oaZOh6J9Jo
         BBkwSwZuvr/TOEU/EdszUNun6xl4SY4FBunCmq1PfJ7HdUPxOU6TZg4FaXQQmb1XFYmy
         qrwAunwX64H7wGaxZyKg8DLGf4Tkikbcm0BJY2fpSks/DnJhI4BcvJP52nrdcnG9vMv8
         P6wIy3URsED4A+Mmksno9UsfJh6P0oGwXaIwWLz/uAxwfeTiK6LsFLvwslksM9d3fy2I
         U/cAcZuXtsF46e6IT/HUe7EJbTpEAlIr5SnGts8X22feL+6WSQmr+BC6wt+Y5gh6WZjs
         ncbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828801; x=1792433601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7vtvJ1VscGBojbDlDxNg96L1K6AUN+XvvnqPqIY6Q=;
        b=cRFlLubUukUL8g9iFZcEHefPvm3R+6w+2q0B8A6P/wu7veQt5NtFGvxhhhyFB+zVbP
         KeKfl3ziqWJ4AUd9iY9BnmNW6AAGVwpv4iSBdhTv+L0RRY5ZDkXqr47ZmqjwKruszj7+
         8O+glPqsWqGPAQO+oinBuTVEaH4ek81KvnWcr7dJi6yLrYS0cDlb4xW7cf6f3ZaGsWBz
         6LD7ttXDyrIvS/wUWyr7/mFP+AaEJJtIf6LuH34Xf0hZft9MfAmoclrhPROEdwwGqOFd
         SicEwRJjMUnd2TDuA0usErzjGJ/FcjABQ5KtvnAaRALcYjfg4RUQ5blRH2qCT8zBEgP/
         ZVmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzEUy3sSfmO3RP1XQ4vNTHCGYmD1i7Ewj+HriyRpmMxBC0QzvXuB7Iejz851zcIQ+iIyWK6EjAWNtncIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL36dEvWoIXmt+hjZzXHoPDHM7gKJBp1gtOjWTA2iO1U+Ilopl+
	f2nqoXPLNpY+q7t4xgAgveg57wb5bb2I0SJvDvnN4rNBUrAaE/O7fwbB+ni73V70kuHT9VKmjcy
	TyEkJvLonG+9TniaZVTNo2ULzdSVrd9d1UF6I+9oJljE3wVzYjqn0yz64nnM+HSifKcc=
X-Gm-Gg: AYBFou38ZvmEo4Onvm6vKbA4Mo7qRVAESxid42MAKa+EWfUs7wguMQWCGLwFf3K9GRK
	VlJnV9LQx8CBpxCKknEaasOJBYrExLD3SpZvgd/LBHoSu8/JVm9Pa74q7QX0ye+dUqBE5sfzBg2
	wCmpCYuLWlgk52OtiMmRAKwGNLc9IPtp5Ne9MhzE9g0wcGaxSwy8OwdepXf+wF8aTLAycfBokHo
	YYib2Pn7FslX1C2NB5IDpgtmnMxsvwq/giDTg+ai9dzyiOrkeoDAz8UbGCOY6QElbWRBaG2rm8e
	Qg3HP2yTS7R4BsXwqig72QAHZWxNjmgLvYdU6vKMilk2OSYi8lw3NH7lHBNFxV1Ff1eSVMfRT3C
	p5Opx1E1vC+Qv983H+/LPGJpjinEHZtg=
X-Received: by 2002:a05:701b:2509:b0:16e:7155:98cb with SMTP id a92af1059eb24-16e71559b6fmr10328721c88.15.1791828800796;
        Mon, 12 Oct 2026 11:13:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2509:b0:16e:7155:98cb with SMTP id a92af1059eb24-16e71559b6fmr10328643c88.15.1791828799374;
        Mon, 12 Oct 2026 11:13:19 -0700 (PDT)
Received: from [192.168.29.225] ([49.37.144.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm32160285c88.15.2026.10.12.11.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:13:18 -0700 (PDT)
Message-ID: <b876df89-6be1-4b06-bc62-df9b7153e77a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/msm/dpu: do not assume a merged datapath when
 validating mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
 <iqkzz4wnfeeul4nkkemhcvjluucot5ia7pfin5ghu3tkwkjfso@raqzz43t7lxz>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <iqkzz4wnfeeul4nkkemhcvjluucot5ia7pfin5ghu3tkwkjfso@raqzz43t7lxz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX7hDSiNWDYBLL
 205kGwc3EidhV8ntz+SfiI64MbWA+LPfeWkyjC7Rc4t+avd3jnCKthrdfneH1nKiOq1VJJd8GoZ
 c+eRKAcD50sm5REwfmlwTbAzpI40aYrrH4CB7TLSSHVFfskdKF5qE6A7Hfj+x6evvCOgXKX48vP
 rMXJrXWvVZlgtlzQjxtVwMtZ5Qhhgf2TyRLxR66Se9RMkrpvApmdeE1HP007jZcsVsUXbl/BJSC
 z1C9ypxDTEYsggqjjHDPAFIqFczv/qCqyfN2xJspHlUegWfKIF2188K/UnOVWTQFIGR+YlPEO/Z
 IWmI6ej9E6W0FKIOd/AIYn3OfrtmJXL2g4MvnDnzZB4VHIaDEicOFSE8Kjx1zKf0p3mU78KqU7k
 TJlRVa9dM1X5pNOB6xEBvS1xekpLHe8mz2+EcD/aCBt9+Z4u1odosxbm88MrA5LJCh4S0uDXTbq
 AXBV9zeSib/ZNtv5JRw==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd2341 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=20alU+YIu2uqf8Hyrg49Cw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mpA_8Fus6RAmO9hGp9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX90Eo+gtOce2W
 51T2/tCYL84Fi88/7mcTXRXh7fWAo4fk56wVGFducZ51F1TO8apxJxhr51LoFf30gpvAjsoLLRF
 wU8EiAqOPZ+HMlVi/G39DWDNL0eJvlM=
X-Proofpoint-ORIG-GUID: cLBV9hRMwCH8_AOgo3s6DiAzBJkOATTY
X-Proofpoint-GUID: cLBV9hRMwCH8_AOgo3s6DiAzBJkOATTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072


On 10/12/2026 5:39 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 10:53:48PM +0530, Mahadevan P wrote:
>> dpu_crtc_mode_valid() halves the adjusted mode clock whenever the
>> hardware has a 3d_mux block, assuming the mode will be driven by two
>> layer mixers. Modes no wider than MAX_HDISPLAY_SPLIT are driven by a
>> single mixer, so for those the check permits twice the pixel rate the
>> datapath can sustain.
>>
>> Divide by the mixer count the mode will really be driven by, as reported
>> by dpu_crtc_num_lm_for_mode(). Split modes still get the halved rate,
>> single mixer modes are held to what one mixer sustains, and parts
>> without a 3d_mux divide by one.
>>
>> Assisted-by: LLM
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0b51a4c5db57..209b25dbeb6c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1631,8 +1631,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
>>   							    dpu_kms->perf.perf_cfg);
>>   
>> -	if (dpu_kms->catalog->caps->has_3d_merge)
>> -		adjusted_mode_clk /= 2;
>> +	adjusted_mode_clk /= dpu_crtc_num_lm_for_mode(dpu_kms, mode);
> With the 64-bit division fixed, LGTM. When submitting patches to these
> drivers please make sure to build for armhf as well as for the arm64.
Thanks for reviewing. I’ll replace the division with div_u64() and 
build-test both armhf and arm64 before sending the next revision.

Thanks,
Mahadevan
>
>>   
>>   	/*
>>   	 * The given mode, adjusted for the perf clock factor, should not exceed
>>
>> -- 
>> 2.34.1
>>
