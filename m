Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406A329C40
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834487; cv=none; b=t2L0yk+CKk1+sVdA6WrY9ImITy9ur7TjISVtLsiuZVKpUIsfeSx7u1IE3OJIwL4PLNh/MY64FvYOipdpSMmUKxAXmQayNDertEDn2AHYPa7T6e54gTYsfAWf9GOgbUza6cDFTkiTbvvO429gyhP72rC3I4tDzu/sFrwJBSO3oBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834487; c=relaxed/simple;
	bh=xYnBMto8rvMbCeRYM848J6cSC7ZIBWCqaDb3Q9LcAuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXKx3AL/3PQkfKP786ln4djClCmv5UFyGBBgisBzO2OJiWfrDBpgakmFSQnQXThaAF0x6Ex9Ezt8UgBHULbz2akx3/Wc9Qm/k1Tn46zqD9X+4Lt1UF6vRyumoZIsyUtdwh6hY+pEMPKD8Wc7R8fkhzdo2J6Phno9OIHC5nwM58o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvA5m2Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fD0jMoIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvA5m2Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fD0jMoIE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlwN1638419
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 02:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=; b=JvA5m2Vdfcw3HEyg
	xV4P03lYk4P/HMW4zF3AQVlcJZ+BSwSPjQCrfboz/I+7ctavqu2N0QbWrVm6hpLL
	wWHIf9UJ773PQNWxsZQetdYiFPCSGerTSWaKsBu1ES+ZaVsDe7Iz5aXb0bsOx5RE
	zOmntix5xGmWHqmkT/Wt5zkCV0wGL/KosWrgRdSXRi9Ar002Ph1rlClRdpCuoRRh
	y5/6cRaTDE8FVbkKwE/6fuuNqzOTpwjnTZyeJn3nQTXgsEdBqDiUL5zeSbNUwVSG
	9hO0fv5pVOK6GEpyx8RRIexcdTBLCOXDOT8hagMXZ4GVhz2vaxFBl7/8tc8oFnSY
	vW+K6Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw236vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:28:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so6317826a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788834485; x=1789439285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=;
        b=fD0jMoIEQUffreailUhHHiB8mWmzKRLtm1Lc5zPFa7mX3bUi+VONzk47WORCMDMNK5
         Ci2sw7MA6G4FwvS/4QQpjqPwYLXKNtAODz8oOGpM0AzeBROUps0eqAq4rGzK96Ubro4r
         1BfzyQS3jNcLBpcezQSczqKbh4GetjUB0yU3igTQnUApcz2MoJLgpSxuaDv1aTH9Zubb
         c9+43NFf6NOkNmtuN1OIOWdczljvnCXoA7ZaOYX3r4zYzh+VXMSpjW3qt+g9rixZAtOc
         +x4McXfbtUbqDa2y/4p9pADlDRV5GzmKwmWoBb/Khjp5XwmdMFuBd0ZatdtpHCn7dwD/
         9+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834485; x=1789439285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=;
        b=ZP63uTMaNONZnDWyHDMzirJAnG6uVYyXKB/diV/2ldP6d9kx4iVBef8VMQFxLFO9pA
         MS0dUSavDcqKC0F0YvTFFJUS3xu2Ei2AYU/6u0FlAvQdDkIfc4OGjfAAczTxcHYLAN3U
         XhMNhhqvylIDadcd8eWGwZABjUPXG17WXPgVd+QXhct8fRSCnFIz2pJqt8COHyVVj+ef
         iyiAn189EMHgI9/S88Fo5MT9lWmujxAAE8MczGdKJ4k1tOX6CprkRcuqKJ1xauH6aU9b
         w+EC50m69qsFZtdGijjQMu9KPmTqf5OUEKY8UFj8HEEsigOWeZpV90/cPsr/l2De0WXc
         47qw==
X-Forwarded-Encrypted: i=1; AKwUvBw3mCR5jsW8+Oi3ALmMsxW3zlvTeu09A1xn9R5puVKGtMMnivVDWvPQOLNl2VdMjOuhU/Th3M1quk70QiM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5MgRV/1aFS21gkoCcFbXWQ95OKc1zcyzhH+y2Mqx7xyXmB2gq
	gn5wNWad6ad7+ooY7AowgLYadJLgEYGtdMdZ42zdShEtrTXUoSKMbG1Catv9Oj7G5RpxdN5xW2y
	rF7e4bNJtWyJMa3yB6o9m47qgp2Hn/JY/McG0MhMR2SaeHAevILhBBvLSNe5ugTmDJ5A=
X-Gm-Gg: AYBFou3/EhDADZpDoGNvgGjYBLd36gVOtb0dwh/E6CIf7H5KRn/3SPDRSq9TTUfL7By
	KgxJBnBaRtWx22QgyNp+ObEKffvKupw2MWKQh8l/TEm/Ja1TSIbEbxbqCUGRfesYXwbybDoBzH0
	BE3r59NUjhDVdUTKUfot/ssZP8W1pCfxkCo/MmNlKSlpcd+5OA1Ezxb69ca41TXj3/KXCla9gno
	wjwrMUNt1US86Zv1ovKnrO/AD/Mj2x4S56pY8Zq74E6fsGbbx9s9XbdXCSBHHR5eGaXA6o9pJok
	NL1QQU0jjxyLGTALOCt6ScPQH5H7nquW7+RbRTrQOSeDUHmtLjqkNu5415lLSNv8uDeP3KnNw5A
	er6da8r85SjtPwJAJ7aR2noZ4HA==
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr37057495a91.11.1788834484684;
        Mon, 07 Sep 2026 19:28:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr37057434a91.11.1788834484196;
        Mon, 07 Sep 2026 19:28:04 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm30538730a91.5.2026.09.07.19.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:28:03 -0700 (PDT)
Message-ID: <dd810d52-ab6e-4e8b-ae97-32a140490cc1@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:27:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
 <20260903153028.GU2133376@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260903153028.GU2133376@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _o3SzT1ibPBwdTMqkDEtN9DZbmoljYdg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAyNCBTYWx0ZWRfX04X40ENtzcFg
 mrWtznkzLVVUW8lXNmdptKCtpZtVemUGZUtutP/Ua3IrRtYLJh1K6eY+ffAKkN8YcD+1oXAM59Z
 +ZXHuxMr2dzlqSJaDscDH9Qg6xkLah8=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9f72b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nP8d1w5hKBWq8GbY02kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAyNCBTYWx0ZWRfXxhue2Lavv9OX
 FMg1L7oUuK6xe9A/e/wqDUuC8MjUR9VNysm4sVEAlUQIe3SAmzD578GOjnHDB9gY9Bfzu5VVxRn
 22CQialCJW93wk04dGjs7ZBa7VjxCow8oDpHa/mLlCLSWyCpq+QY8r7R84OdMuN4nRkALTJqITq
 bi6LliqW90NWO2zhK7emrP6FmuCElrbSNbptQn4jYugjeq3+T7rBFCYCS9rA0NwP/D7UOuN2paz
 VzmkmyLF8EO92bnlIDISCv/uW/xymoGJwIWgT9/CKq1WP7PMc/AwpAOEJXIYVweV4bdQSwKOr3e
 gp8g4owgnZ4L77yqcUO/H2yAocAOh5jo8ehDJHcYQeaAq1YaNJjD1UxTH7oRqP77I5H6pqAGehF
 T0Z9eDbWISGWMpVgMRsrw6nCaSn74iMRF7mQxNPvu2c5UQ6RR4IRn45ZRvIJYYVxB15TrfPb5fq
 xFnmVnoN5X6+lOkrSww==
X-Proofpoint-GUID: _o3SzT1ibPBwdTMqkDEtN9DZbmoljYdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080024



On 9/3/2026 11:30 PM, Lee Jones wrote:
>> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
>> Mode (FM) that can generate waveforms with more frequency points than
>> the standard LPG PWM mode. The trade-off is that the duty cycle can
>> only be fixed at 50%. Add the FM support. When the PWM channel is
>> requested to set a duty cycle to exactly 50%, use FM mode by default
>> as it provides a finer-grained frequency resolution in that case.
>>
>> Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
>> register read atomic against the register write in lpg_pwm_apply().

> Would it be better to split this submission into two separate patches? One to
> address the locking in 'lpg_pwm_get_state()' and another to introduce the new
> Frequency Mode support.
> 

Sure, thanks. I’ll split them out and submit them as a series.

Do you think if I need to combine below change in the same series, even
though they are not functionally dependent?

https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/
