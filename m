Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC13A785A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958134; cv=none; b=VAnmWCieRca++2d90VrZstemnP8vSmvjOeEx7MXhR+Qx7rypVRWIE/y0mzbOQU3h60L0hMS5vgZPveclKuWlul5MghqaqnHQhCrwEfisOWyJnQLWqAAoRMP0pcnukHYf57GpoP1XU4633ZwElb+L7xUIFQj7SYLdu7BH2TD34xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958134; c=relaxed/simple;
	bh=/rEmUPVStxqLg2EItQ88eAQ5Dtdf79MZ7aRm65z9FtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbxfKmfML34z2ecD5lSkHtBHOjIPC9Z6Hg1fmyF/D4Qpw/HkBK0tqu6d7rPVQkbcHnoJS6ftr04xHdDEDxJ0GGMNeLlZ5eKfzuEaGEzlSLadLrvJthyOShYS8gkj27UN866PnTLbXpVsoiT9l9OZlUgrZY19HnTHhJ4eS/XktfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChYSRtuv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcSrPpsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChYSRtuv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcSrPpsW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E10cVY2874770
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWZPHxPrDsIHSD3gEmzt1WwqRCC1BYYEjxCE29zFyDQ=; b=ChYSRtuvlrRI6sxx
	203OPQAiQtr+EOJZo9qU/otlwGp8JKra7v1d9PRWF7SOGjyJgkAsAElyMwWh+Mf6
	kjCkXR04oll7yDjfmiEFyRDZboO4+nnfF/yc1QhulLIjmYYVZBGGRvk9R3byYOn9
	iEsRnlhf8Rm4Qvn8zlFKIVPuDKQHv5IhK8Fhn0Rll1JHtOCNsQeTIfHrcXeJqxsb
	uKiEU+PXGOfPGMYekW/9/DaIsc00HgE4AWja3PYHA3ZZfiNGWjjfoGb7JB8KYbQW
	99NTRD1KBsxXDCyecpB9LZd5DIkdZwjA7wDuBLQNRtNQl+vBYz+IDhIL0CdUJyIz
	SvP/Ag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphh0pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:08:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2752785a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791958131; x=1792562931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWZPHxPrDsIHSD3gEmzt1WwqRCC1BYYEjxCE29zFyDQ=;
        b=FcSrPpsWuMUNjHVQ8MAFjfKNMUX64/rb9WpddTMlbkKtdTvIjsbIcBraJXsBSq84Mp
         trzA3QpZU+0f7oiF/dRS9SkiiffHeJdybpqRhQoQSRsd6Depr+kpFs83XLJa7KKRRUW5
         B2kMej503s5n4PTCzeH1cDQDDqSgQ24U/B8k11HflpEamZxSYhG0qX/lSM+gWDpdROW3
         96p2yVljVi3P1ScLHze9freqBIe68ZuBW9kVCthSez9RwKCWYVKMT2SKssovzl0pfILG
         lajVoXBUVepEQa5/VugXZunqGNmp/gjwO7bgcd0nvzsQwntcTLAZGD1F9EdWb2ORYm9I
         i7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958131; x=1792562931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWZPHxPrDsIHSD3gEmzt1WwqRCC1BYYEjxCE29zFyDQ=;
        b=WePtqqvUnkm7ZVxtBU3eY+ntexyRJzKhNKLK3SYCpCW+KiT/kf06Oya2kxrJmBL2La
         LsmxN5pPZrGafMswwQz/mE+0UVoNlz+UubDcg+C+EJQYxB14ykBb6gESgU+6fPN1Ngzm
         dmHGWeOa6+ETm7nNw7WBiqC+uiIS3hz2uV6Xs2bk0CW6cGrTGOwGMxBKO3K43VD1M3Ko
         1Z8UtP5GPYGMXUeOdzxtJVsmU67UOAB+Q/S0jHkhKnRasEEcoEzGVvr3aD3c96JNI9fp
         c33cTE5G+jVSDNoz1agJxuzblWYHmxkoGU+cNbi7jHIbF4t5VoHleAI3yUhsPdTa2DZ8
         4yLw==
X-Forwarded-Encrypted: i=1; AKwUvBxnMnGSL8vcqFa+k2oZYct4DyiIf7BV8zCZFdpszpfHETfcfPYGcXzLQMqlSeh+uQibbIDPalWm4J2so0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW9OHFArPjkBM5CKCScYc3KrbiwqkUnne8uOt+xtQ08oYo4e2J
	1Q1g12cBHM0/jXWLpot8l/SvBEVq5uYTV7qhh8WO7iHFzc//y1kktPigOmS9d5Y4H4xa3lGzhJe
	bEuogJRzFDhRP5Ewr2eUDXCUf7sL+6Y4XWnnNAlypX0/PwNsoPiTDGBiWAErg6DXEAwk=
X-Gm-Gg: AYBFou3i31DDP9ndf/zIsqERixgdMw2zzZJW5rzy0+YRuVOt9IrSRDGytCkFX04tdde
	4Id5ryI+AHtYkEf8+DwzcdyVqEcf3V9CCIt/2ucpztTmiSkhDNTuRW5naWcH4kkN2ZMl6bIuYNy
	QbUOXQ/lhVzpv7KnkgW4fsJqkU53DtVpc8/kMuzLxJsAJKZ9RtKxzMju+B8L5Kr7MGR5b4Edvpr
	a/i6TYpuS9Al3iqlWRF3wEWUk/65+HsJx2euo41gZZPZupvkeOI8/jgxSC403h5GpMx3KRPXmWj
	Wcp2xSRwa2rydCw0POJQqcap2uNxCAxEvBNLiKa2JEkkcLpr1+cHUb+qJ5MmTjm5J/YszVThpoR
	xwAlqaCEnG8zdA3IBaQnXnGrWNJg=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr6334997a91.6.1791958130552;
        Tue, 13 Oct 2026 23:08:50 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr6334983a91.6.1791958129984;
        Tue, 13 Oct 2026 23:08:49 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f280fecsm2972568a91.13.2026.10.13.23.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:08:49 -0700 (PDT)
Message-ID: <0a901acc-fa5c-40f5-a468-5280cb25a71f@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
 <5380b2cd-48f1-4e4e-8a11-9e303c366e47@minlexx.ru>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <5380b2cd-48f1-4e4e-8a11-9e303c366e47@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K0iiud7LHatBooZqafBs1gY69X17Mbrt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX1pW4MsmGkreh
 X6ZOVw/k/8A95IIWotPSIhTazwVX4q2gMCdhnwq3wIs9VGCvbW6zPTyOT0IOMihGfUg9d8xhRk3
 pZDSE44im6Cr1wFbXdh3gRz99ANYMK4=
X-Proofpoint-ORIG-GUID: K0iiud7LHatBooZqafBs1gY69X17Mbrt
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf1c73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xTD14EHqjbr0US1DkR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNCBTYWx0ZWRfX82WCPnE98u+Q
 2z9O83dJPHheJbTMMwpCLZcMe+KkIIVQDWzg/w2/RQYWXgOXAS2YRyMKNvxPljiyJV93gfyeuCO
 2nghRJaLmwBbP7F+64QOysW6/9B6ScdGd7jd+4GK7KoYaCDUX6Ax2+tHJ3ufgPP+PbpmeQH/gHZ
 TqE4S+O2GTdN2PvHv7cjensokVjcHeTczfKeEAbTknegN44GG4KVQHIqgK7PbSSHDJMvYDl/x3M
 0Tuy213YL4l9LjTsI0GO4TveH5fy3fYaoA8MZfOuWkh5wDiHS+sDS994zdBlWXNxyuPwNMs6jOs
 tInmKsxmIjUQkXkCsKStBSU51myOjq4ycGVvrxxVntN5G4OmEXltjXY+pFWZ6LptUtoL2blU9g8
 zItw8GKwvR6BVMNgdj6k1UBp0k1OCrrCfcdeqfqRy8bfmaWFPwp7OQOmROFHWX/+HODJXH/glop
 ExNAFVIaE/G7tbA4Sgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140024



On 10/9/2026 5:28 AM, Alexey Minnekhanov wrote:
> On 06.10.2026 16:13, Arpit Saini wrote:
>> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
>> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
>> reaches 0. The clock (and its source) stays reported as enabled
>> through s2idle suspend even though the display stack is fully
>> suspended:
>>
>>    disp_cc_mdss_ahb_clk [19200000] ->
>>      disp_cc_mdss_ahb_clk_src [19200000] ->
>>      bi_tcxo [19200000] -> xo-board [76800000]
>>    disp_cc_mdss_ahb_clk_src [19200000] ->
>>      bi_tcxo [19200000] -> xo-board [76800000]
>>
>> Calling clk_prepare_enable()/clk_disable_unprepare() directly from the
>> PHY's runtime_suspend/runtime_resume is not safe either, since it can
>> deadlock against the PHY's own PLL clocks taking the global CCF
>> prepare_lock during clk_prepare()/clk_unprepare().
>>
>> Fix this by moving clk_prepare()/clk_unprepare() out of the runtime PM
>> path. clk_enable()/clk_disable() (spinlock only) stay in
>> runtime_suspend/runtime_resume. clk_prepare()/clk_unprepare() move to
>> suspend_late/resume_early, avoiding the prepare_lock collision and
>> actually dropping prepare_count to 0. DPM_FLAG_NO_DIRECT_COMPLETE
>> ensures these hooks always run on sleep.
>>
>> Fixes: 0b3ccb76b95b ("drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue")
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 132 +++++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |   4 ++
>>   2 files changed, 127 insertions(+), 9 deletions(-)
>>
> 
> Hi,
> 
> is this supposed to fix the message: "mdss_ahb_clk status stuck at 'on'"
> during suspending?
> 
> -- 
> Regards,
> Alexey Minnekhanov

Hi Alexey, 

Yes it will fix the 
mdss_ahb_clk status stuck at 'on' during suspend.

Thanks,
Arpit
