Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C447F3BD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201636; cv=none; b=CXa2iKfY90r1OeA8ELuXkMMv9hQ1WaeX/Gu6DUbKg8A+T/ZUIa70WuRoxco/+awPwouv86fC/zgBXGonFMIWZ+kughKleiAgRSAzFX3qGjS6TL8c4QYC1z0+p77p7mMg0MIL9qDb14FwZdONPd1YbprkM43x0CBRK/JRQ1CDt9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201636; c=relaxed/simple;
	bh=J4f3p9npyqHrcIAJJeagZsStVI/MJ0U6TEfe6bpSb0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASGS/ogVQtgCwLwjoNCj72IAuzLnDdbYk/hmfRnF/VTRCtVEjtHuxlYg5sBOO2Hp1DBn9y539z0D6Htco3YVEB1JUHIoKxHdqRp3BRfFl1bmzYE41HLCkiCJCJXVJtWHRVF96y+5Wj/JR9uOxVRYgHzykZ1hlOnaHP9J4hLdOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atC8/+GU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHfCYhd9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atC8/+GU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHfCYhd9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BTxf6973229
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=; b=atC8/+GUTPUwWVMT
	STecLuCaR8X/jeIAcvaelX0sxrJ2tEHRqQEXCaPKa8TyDKd0/V+vFJ8hLSNWBsP+
	LB1DqGTiYtnXMRMcGJ149UE6O8iQC/RsNxWuczKl8RUz8crNsbJgUun+XbXCTeJv
	hXnFNMW9YJizYijb6FCVtjjZUPLT35iJeBGe5jXL5U46IOywT7MngsgrqWeJp5lf
	B9STWTf/Q8NyXDTnju9F6sSRRarstjaLJ2gjGKZuz58BCH1OsXoFJ5XitnYIKbj1
	ZMJLiPlDAd+LeCRWOvSpmMmfAdQC0QzYqJNToF3aQy1k7Tq+pFnY64l1h8HbiOWf
	GV98xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nkny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:00:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1556652a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791201633; x=1791806433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=;
        b=CHfCYhd9DxXTmYQliGS/xF01mXuRPB5nH26nemAupftKsRU47YvTfJsj/LirILFmXR
         UBJByX05avViCTLZZ+9Syqu5Bp/fFFQ7pzh4bXR7NX8Z2RbGa6mcGr11Fay4SJj6vCZ6
         lsSwWMW0/2GQRyePSFaPcSeZVv4OyI99BjVJtQFfby7FzMZKQVlWdxtMXLCoWnmuamZa
         TglFuS5s0B2lVoR4B1mMjCmWgwMR3kZR+RHzoJm+o0nSTOPIags8cRxxB3qrLQd47aNa
         RzqXGK0Gf/vcSqjti46aq4pAc6qSlUEJcE0QhNi4bHcUodFLsbGDAqPIr8OkQQ9alblU
         A/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201633; x=1791806433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjqrkeGFYtSDE4uh57Qyu5uwPPi7oB0ETinHFeakgL8=;
        b=2RlIrr1qWp/JMZob9lDqIeSOQBuN3DXNxmqglLk1Wni9Y+CHNXKQ3E62X1P1A7Qhc7
         pFfFIDfgYfDhuTgz+9nK/+FTu0trlGvYOomfKsEQp5uwtfDlt/b8mit8XsK1WB6nltnq
         PtBzvC4lPBI0HXjllY7SAzCXgt0+12iBoMJ8nSdyHMpP66VlngNTKSf8qU6n9DDnGQ1G
         7Qxv8sLn9GTmkhDIe7HfjVXLBuGEaM08dd5T1nQyReCemLkNjcDbaOZxnVYdaMkCii0G
         qtBcoiliZYN7f86pXo5vJtY6NaACZwDIq4siVeLnwTvgEzLqlRmznvUDOJUxzJtWtUMW
         obyA==
X-Forwarded-Encrypted: i=1; AKwUvBw/iNDfFErhoCdaQNsxGcbI78vz+PJCsOuBRZkAi2zWW4t0Tk5aSORu8CJN1oazGCdEdu7YDdYJTlIHANU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBkMBHVHqPatW2HUQydXwdQH6pIZaulrQ0Ubljkzqd2nwPknI5
	lfXEGXjK8IprDl1n2lWb/CCs45+OC001Kk1V/vkC/KApeVgjzgmo2RjTf+rSJ6iLQWb7y2CI0er
	MG94HOw5TGCVhmbRA6kW8pOwDJmsFXsYm0nuSUDlCZpvhuekslm+14tGAeAb76iNWLUE=
X-Gm-Gg: AYBFou1+D/kf6Bb/QkhFZ/kwT3kMObOeZb1TYJqXZ1uHkSot1vYvQljlOIdzlIR0VYd
	E3jSj02aCLUbP8gd39ok9FNcj1HtT34fEW/mnxhm+Oh2/hwsdpallLVsA9w0vjIVNrVPl9Q0QD5
	rDexTw0RSS2nLDJiPgxdKKsAMxuCprZI+S9CnNZu6MOHeaI19dLGvcEHIq/uGsKwCQygqB2Xyj0
	ZEFXMsmKh/u1zq0GsdEYhb5gh7mufq8odPBXxM2wvQp6AL7unbynICnPFMxhJxahzDBcXA6j2hu
	JuED3+FNRFrR58FStSnUIeNpTQbRQYcj3OZslp17IAGNBAo3lrnHqTivjJPbKa0lMlWyGIbev6W
	y4QTQgNcPITeLVPHK8Ub4pDeKkAVDXA==
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr4301238a91.59.1791201631584;
        Mon, 05 Oct 2026 05:00:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr4301044a91.59.1791201626566;
        Mon, 05 Oct 2026 05:00:26 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6b3ceasm11047079a91.10.2026.10.05.05.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:00:26 -0700 (PDT)
Message-ID: <e1ae7f91-0787-434d-9553-3ced487fac6f@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:30:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>
Cc: zeroknots <zeroknots@protonmail.com>, amirreza.zarrabi@oss.qualcomm.com,
        jarkko@kernel.org, jenswi@kernel.org, jgg@ziepe.ca,
        linux-arm-msm@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        peterhuewe@gmx.de, sumit.garg@kernel.org
References: <20261001055029.1960743-1-zeroknots@protonmail.com>
 <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
 <b2xdth3hkuypnvxlrgssnj4toffbceohhnh7w2ju46fzinflfd@qaq6ai5plolq>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <b2xdth3hkuypnvxlrgssnj4toffbceohhnh7w2ju46fzinflfd@qaq6ai5plolq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NQ2tfLTUVz4Cpi2ZlfKOlPFW02z9jvE9
X-Proofpoint-GUID: NQ2tfLTUVz4Cpi2ZlfKOlPFW02z9jvE9
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39162 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=WzojQP8EweJUJc-V32sA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NiBTYWx0ZWRfX9OF9jHfoTUmN
 RSumclCx7PJ4BArX2DzcElgtdn3I9T6nJu8SSgWsG0dw0J/P1rQsl7UZLLp8H+y5cID+5lOIsPu
 JX4GBcWsYYp8crvdkng07Xd5KgQLQZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NiBTYWx0ZWRfX/lO4U4Iolwfk
 B6ySMIvMYp+crhRqVZyLh720deNz3WB8etNXOqFAMkYzN1r+V8ccodz1WNQc/i97HVOofqlotlh
 BfGBofJ438ARg/KOcT75w91BpnGRAp5VbIXjlCpKI8POJR07qU32cF7FBKEw/x2B/R+bByYkLnC
 0nwcXAohQnn9XwPRK2uvgfzLNrvdwS5f6WJpI2AdEI0WmKQAIzPMNs8IlDM3GyWVaIJwdMdP7m9
 Szw4WqFlzx+f6OdGe3Zg/qQYlywN+jeTIzGckzk2TChVzhZbxvfVyZu7wmBS7hLqaVMiHbxOT66
 3R+M/srlejLZ/jZHwUmeq1JeZAin+rrAUNEXv3kwMBQ4slaQ2buZC+3jfLHtq46/wjVxwHGXsxl
 6uQbWgmXXkOdGsyYkUsP0RDzGiTENLCbC7mCpgi3h1X6HGhKt4X21VOfbzafL6XzwiKn3hrrBz9
 rGheuwZnzzcqp2pMGTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050046

>>> Two questions:
>>>
>>>  - Is service 81 expected to appear on retail firmware through an
>>>    update, or is it specific to the CRD firmware?
>>
>> Yes, there's spinor update(bootfw2.mbn) needed which is in progress to
>> publish as QTEE side changes were already merged long back.
>> Roughly it takes ~1month(ideal scenario) to get firmware changes
>> available but somehow it's taking more this time.
>>
>> I think i should have captured this dependency info in my series cover
>> letter to avoid any confusion.
>>
>> With the changes, service uid 81 will be available and won't see qcomtee
>> driver issue log there.
> 
> You are responding to the user who uses a COTS commercial device. Are
> you suggesting that the user can somehow update the firmware on that
> device?

Ahh, for COTS devices as one cannot replace firmware so it's better to
use qseecom path in that case.
For latest ones, one can switch to qcomtee based approach.

If Xilin already has qseecom interface written then it's best to have it
for the COTS devices.

-- 
Regards
Kuldeep

