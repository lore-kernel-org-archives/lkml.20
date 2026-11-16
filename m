Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824516;
	b=tRUGzHIFiLZA+A+56pOyY2mdpw7OyMi5pmnXgQXKIa5Lw2VTbt4gW9JhB88bSDJAWAl0
	 h0H2ZZjRya8y2ug01+KvXmKoyRLPsVFQnxIHcmLR7Q6fSi5muZNjI/lOHi3M5ITFQHYnl
	 zpiA9a0TfsdRCwsVE7ycCKDvaGz17v1AY8GQfJbzv2Nddd3ZaKeEWZwXwrM89s/jsy7wm
	 RL6rUcn6OQvN1zsvEzQZuSufib43hMoLtAeQUBjQmwjEqPTBz7A9e82p+hExpc4yif6tg
	 94iBDCL2/63geNypMk2bVnLb0CH1lR3NfsXJcYPgcaSL4OJM+396p/e2rg/flBs7jSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
	b=q1rkL38nIoQ9IRGGenTOubRS9pSat/f5WT8msayO74YeIkC4hdwZTzU1w49zQ5K33kWm
	 xr+nQCAeJ8qLOSQa86wAuWclR5RmOZ7fr7tWnL28h2N82Sqom6YmjIMTAT6US0iqRfzMw
	 aEOk5qVt1cMozd1q/9+butHmBbp1c5njDOVamgTaBOvM8+YGLq/YYtYMYjTRpwUxefwmU
	 baM8OjT/Fo9TJpjmpSPkMTdlW875CkU7dna0/5S0eErsbLrTgd6VqAJyKHrkM2xXS5L8k
	 nraZ9H5YEM36Efu7Rd2WH6wykTqgtNQi+R7xpzmD7tZ5b1AEtC/RUtxfu7LwqGTU23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJ5QXahE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afAuIHlE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C3606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9C3606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJ5QXahE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afAuIHlE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAKpEY785062
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=; b=MJ5QXahEYAMt0a67
	oo6Waf5Y5auXbiw9exfaKLioiKpisPhDxXH/W5YlpClyOUnPPjGbJPTOd8QGhneB
	7R1bg4+9+rW/DEu4ICMI0AK6351ir+nMHiux0NI/QHf6Tqf5cyxTMBon9ID3tf9+
	UhrxsrrJug1sWD3WmciQwAN0A7JvZxkxgo2/PQe0CiHRJwdl7cxg5+Pcw7C8c0SL
	jocUDdMJ9oTSqFpV5ugVdoGinG6cnS21hCs1zMTtdtpV4Y/eQZz2QKyBEqDzTR3B
	9hVzBpmJ5rQp9H9k6qMha5gbYAitQIWXufxt091Rt8VENt+3v2plcVTC2FzozWMK
	FTT7DA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0053-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso4333835a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824515; x=1795429315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
        b=afAuIHlEZrY4p3tmH4IusqfyUAQOxCDACf0unnFkJ4Hikh2BlRV1cLcmtNI6IEm4cI
         tBlSGZsMde4wWbgFc4N2+v6+Pa8jpaZRrUQuZMAssU+Aws9wNoMKrKUJ0viYYdl+UE+V
         thMW0MxyW90gFoOoVBnnIXXv6fBN0J1DPGoYQ3M5IMxKz89K/R+r1Revz8eQls4PH5qa
         5gLqH1S6DZx79Jm/sLOmmnTMpQ20g3Ev5BhWiLmH/VfZgdUEeFutTvcSyqUeqzPNGfmz
         YtrBb6PYhl3Q9NN6nAViVkCAJdLiIkeTabc7K3WFzGvgf1azfdQp9utwdc9o8TMmtWGS
         VfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824515; x=1795429315;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
        b=rXEaL5rxx/dAjOIn/KJod4f+3qa5kC6wzFV2KpMqs9k9yOZC1SjFuhEHXCegnzkA7r
         hrZ6TPAwAAe7+BNc/GU60IJS4H/Ev7sWSDOd1ZJO2qho9r1fXlp+axfuk150nFri/lOl
         Z4oYQZq/U4EP/qB+A2mCbdH+ywCzMJO0Bu6msmGwnVKkuCz+U0SL4oHcZisq+ye5/6v9
         Afkjb+CdXJ1dfh1T2FGHAPjU0h/X+0beM3xHwBlOn/zXwE9FqHTyB+z+LUqxIIz1cbTx
         PSarOA/5IQZ2RkeCbPlsJxOsNjuE+Xm1sIas5tEf6Gwdo5YnhmDQ3IkgsxQtaqXzIbR/
         Rqwg==
X-Forwarded-Encrypted: i=1; AL+hErGlNQ0Gbfxboxem5ROORMMPgtZ7XGbnF1YTIc2zTZsRe5Tk+LxMEtbD0erqoXjP+QawHzepcx9zihnEPIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d3lNY9kBFLt5yND3uWnl1eE5HOsrt058vBRwLQNiYWLyrGzyC
	+a9krKIY5kiwH6QjtSZPbFZb3I2r3cwcNhWGod6t3SgP+EFVWjKFsX0huKLdS45nLszCLPvtpQX
	eApBUJYDwq2281788rJb7hqw/YulEgjY3yc/yH2Ni9X6eSS6fShaJBAtp1i+SQzzMHg==
X-Gm-Gg: AZFdTZdZxCuyLiL9ieFBQbToQmOj5LE0dWaCaOxcF3ByXK61nyheIb5/DPtW9xELqcf
	tY+aQWAiL7IUmyMbHeAVYSdhdCM7zuzzEkfLos50y7JV+EZj0G4gxurbyD4cpLNRpeGWeEKVQZY
	JDJVkguJOZ/J4Pd4Ti1c/Vo6GPPLmjbjWTzQBkvdNmex/gvBR1PV5piFp8ngk8nsLRQSuTgxZkz
	AbluHkarkRqdYEJ9NzUnG7O7rwk4bWBRpX9id+l1sf6SzxtjvW2cvm5/GjlXCdZRdu8lYpYEivv
	m+PW0NOlryrCA84w8HHLEyq0YEf4vwzvNloD14IK/AOPK+WT6HOol6mh1y9aA+vbwH4yam/+VxA
	+w5azoZOlXdFq26Glak0QSaxWIg5BTwpvSH87Ah9Cri7liAIwAUuhjALOHP/THW0OCrh1c29d4/
	R3LjbgZdY4Lr+2EXjBW3Jdq1SrdB5UOiygFnD+v3w0XbKkG/vboJhxCxQBZg8UAUi/
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr11059003a91.36.1794824514432;
        Mon, 16 Nov 2026 02:21:54 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr11058946a91.36.1794824513302;
        Mon, 16 Nov 2026 02:21:53 -0800 (PST)
Received: from [10.50.36.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b39fb9a3sm8808509a91.3.2026.11.16.02.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:21:52 -0800 (PST)
Message-ID: <aeb887e0-48c3-40d7-8e93-951231dd2ed0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:51:50 +0530
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
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: Re: [PATCH wireless-next v4 03/21] wifi: nl80211: add SMD BSS
 Transition sub-state STA flags
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
 <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
Content-Language: en-US
In-Reply-To: <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfXx8DTGaD/hoOv
 9OrjErjtcSgKeQgpKUQinnTgc0xr8C9AGeAM6FNEiyce/0xV9ZsQEnx2mxWbco3HI97OS7q/54K
 ef4Mdk126Hf6vsL4x9HZfSrwXnO50S8yG1qD/HBLsKakxpzQhibg1RjislfdtbhbF6Ews6nQqqQ
 5mGxjGDePy3sRF4UBu00L9ANW1sPevb83VD46ExmAfxpPdhCSmn65wvZphRrhCdBg11ygzM7Yfg
 +wkao3Uw/Al8jBLly/yPqCMVIaZ8HAQJP/5vF+p2HVwM1ikUawb1otJ94XS3uiEfnocajzrfuYa
 Zr7MMFVjyhIDPJ8j8ajiT/MpDyR+p+EK8BbPI8RbKovNVcLc/QnZqFIPjsHZbLjj/D7AeHbjh8J
 bK6FvNApAjXS7/ZgwzivcERBUf5fBZheP1XjMtNzwdifcWcfI7sqjaiiELm1OvhAPEXxJMBBUK4
 2Ojveg0TbmpAQ9u+VHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfXyWE4DPJVct2f
 nyeFR40MGY1fsuqNhJbibrKvCkxYirIiq+qnz+gqM0EjkMA0eKlTeUfdOpd8Sdgc4S1Q8ol7MZK
 e8VntyO/hY+tewRQyYIg+lsW3pWcqTw=
X-Proofpoint-GUID: 34-sFVEtIm-TvMXebl_47ao40CCfo6vq
X-Proofpoint-ORIG-GUID: 34-sFVEtIm-TvMXebl_47ao40CCfo6vq
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afad943 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p4CsnxLYdRdR-_IEqH0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160041



On 11/10/2026 11:57 pm, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
>> state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
>> associated SMD-ME are in state 4 and an SMD BSS Transition is
>> in progress.
>>
>> Add the corresponding nl80211 STA flags to track the state changes:
>>  - NL80211_STA_FLAG_SMD_PREP_TARGET - State 4a: non-AP MLD is prepared
>>    with target AP MLD
>>  - NL80211_STA_FLAG_SMD_EXEC_CURRENT - State 4b: ST execution active on
>>    current AP MLD
>>
> I think the current/target nomenclature here is strange - this API
> pertains only to a single AP MLD, so it's never involved with the
> target?
> 
> What you need to know is 4a on the target, and 4b/4c on the current AP
> MLD. But the nomenclature doesn't really translate to that since we only
> look at one of them, only know implicitly which whether a given
> interface is the current or target?
> 

Understood. I will remove CURRENT/TARGET from the name.

>>  - NL80211_STA_FLAG_SMD_DL_DRAIN - State 4c: DL draining period
> 
> 
> I'd also get rid of the "SMD" part here - it's less about the SMD but
> about SMD Transition (i.e. ST), so I think I'd rather call this
> ST_PREPARED, ST_EXECUTING and ST_DL_DRAIN.>

I will replace SMD with ST throughout the series.

> I'm also not sure why you need to distinguish between the latter two at
> all, hostapd is going to send the ST execution response and immediately
> transition to DL drain (4c) or back to 4 anyway?
> 

The 4b/4c differentiation is needed to resolve frame filtering (especially UL
data) since the requirements differ between these two states. There will be
some time here between the reception of ST Exec Request (set 4b, communicate
with the target AP MLD, and get the confirmation back) and sending the ST Exec
Response to the non-AP STA MLD.

> johannes

