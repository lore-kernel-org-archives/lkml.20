Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A961384230
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288937; cv=none; b=P9CjsQu5nk/f6dj6DwGF4MqMGsPtHPstPML9+rDKxkL/9AOlyE0wIS0EOlEssyVLRPa2PLAWLE0KlTWE1MxOcd7dJTKWZEDpXAqyXnrMXiHHfvC5opWD/6wyLZzZ2Lc3whQzZmQeCkdvQ0pS8c0YQjuoJUv7deMKVtg+mJTi+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288937; c=relaxed/simple;
	bh=z8yjqyDFJNduyXmuCrbnCRgbSnzUlFAyk+u5Hegvyvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gw8sekDLjicd4caj79UcGn2igsM4hVGgtdItO5+/0+5XNI45fyOMsvgtT2BJjne8P9mWYRDqe9rhB4aiQASLc3UqHkJE7/hKrVs6FOfOzKXcx1laDDEEHBrdDds8b8CjNzTOu8PRi/S46rulPZD4idBg/tLW5Buf72Id9BGj+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+2K6kD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4p5Hy4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+2K6kD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4p5Hy4k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68D7UGpw1689217
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=; b=H+2K6kD4ALIe3r6N
	2Q+lizcslTS/aKjRmP9sZakh/a7icmULNIwb/7PWHx1ED2JFPtCd1fmZRphbuqWN
	lRSx4ZhyiA0M8QblsKiVo/BxeWKMZYs4Wunhn9nB8jA/jf6F4bzNc5768Y1gX7wD
	0c6lOZG0nqL2dqqYia6LdKz6zd3LwafIEPvHGca2+7WFK35yj+P6Qn6FNRx5TZbc
	3vP0UaQ1mlOe2SEi2K56OqZbktsfICKlX3F3FbIZVZpzunVZcTPdPXWwE4QpHwyq
	tjktj0fXvJwO2hqOp4GzoAdytqSVrbVKo1n1xgKzekwE1T3nOWrrMocxk6W8Ffrp
	dzUiag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9djvnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:42:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3007472a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789288934; x=1789893734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=;
        b=O4p5Hy4k60pHPGA6BeFG/81IvPLWlyqZhFtXwHdOavoKRD02FvsjfNExdbz0x479dv
         2Ge1OVYhrCjzh87azllTCOyg+OyB+Vz4vJxuhhUO3KGYsw4WfthR5v9uv8PAH/ArRlYU
         fC+knmLRMWeZc00r0BxCma6if43AjGfCCprEs06plKQNYj1QSF5tesRZbAwpPlr6FZDS
         XZopjNs9oxwN2xOysMeLUkl+IcbkFuDod+R+RE45HHBOG9g5YcPWzWDtSBT89llrMpFp
         2BJsUa01LnHY8auro0G88PFblBJSz/TDOd0HebZ7MDsyDQm1ePABpdj4epq/nHoFUbqF
         BqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288934; x=1789893734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN1ZS5CXo0+mPTeqAfw6aDp+R3IyYEqFE7l6PNmXXZc=;
        b=o8zcA7IZwZ/klHMtnuBejws6ztTUgM4v2rHhlOhjL+GWRQTnVFoH1KPF7nim0OqQrl
         MOhl40k82hDO1GDfFmPw67vnUHU0DIlsOVMovvasHNzz2wleCqKr42w9gaeCUIgYjWND
         cT8A0j6vSJSSZDmWvZ50ugmIpRURatAcwO9xqTWLgcpwKmZP8HqWHwGb8woaMDtmuH8h
         F1vOvhhskgm0fd3wggIKaW58ynRI8h7o3Rd30KfyOwyQfnpArQfunqLbCwNiWRrpGHs/
         DJNX/W2Ychj6cKX+Hb1cr89TpOkHN8ly3VZElmTYrzIV9w6UlfrSll+kcfzpS6gG8shU
         WI2Q==
X-Forwarded-Encrypted: i=1; AKwUvByxsDFXWhVoV141/WfvgfskrjB9AWotpwwAGpji2ZY+tWmVJOSgVbE7YeSwMIrnR5aoYJKDoK/KS0Ss0i0=@vger.kernel.org
X-Gm-Message-State: AFuF++kooLVkP0HMYnROfHUiMrf22ItfZ1X7jqvW53zuLGXCtJ2iTZ8A
	edkT44U2SLU3lV/v8kQ36DBTrTUvJ9Xv4v6lmD/uE+R2mpbIExZyhvWfYXix+ULyN7K2ikWepI2
	1h64AR9D0/IEigVDIhQLd66V7OXqqwEjNI6m7sxl97hk6r42kfsrtGoqdlKNZwggDtoQ=
X-Gm-Gg: AYBFou2C3ocVYTkRTfbFaS8tGTTdpQxQ8HSuvKz9ASogN7vOOU++hyjWzVLd/UzBQY2
	sRlrObsRZX815UP8SCqMTswFgnYWH5GlNyuJ8QNlXVBKVoeMInV7p+kdcMs9up8tNvUjVho7fZg
	CsXX2xfLcIO/qRYTf9tgOe6NjHdE8Z1FAl+pxm9cAlWmfjBPteVxuxTJIQ9++fxPumJw3pk9BA7
	PZTNz5+oSEStnOhXB0re8BkFXQnDSpQwrWFIdUN3heO91ccT8xVGJUB7zUvvP6HxnvX7l7M3sA6
	91R9TOTt3fmK+PKcsjYLpu3Pb0NPghfmrUvbnJIytGb/62csO2A822yAH7qYeGU/M8u8MKaE6mW
	M+7MRI1Kg1p5BTH3JSi9B64Tc+8yFBlkpR1U=
X-Received: by 2002:a05:6a21:6f88:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3daed3197ddmr25056088637.13.1789288934283;
        Sun, 13 Sep 2026 01:42:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f88:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3daed3197ddmr25056055637.13.1789288933893;
        Sun, 13 Sep 2026 01:42:13 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.229.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm32943918c88.12.2026.09.13.01.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 01:42:13 -0700 (PDT)
Message-ID: <44c570d4-cf44-40b0-b86c-3c207a2183ce@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 14:12:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
 <20260909-correct-icc-bandwidth-vote-constants-v1-1-fbebf6b3c341@oss.qualcomm.com>
 <bc2112d9-4085-42be-807a-2242a1c510fb@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <bc2112d9-4085-42be-807a-2242a1c510fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8RAxmTOZyXInzVXtYBvUfSW3Jqa14qUK
X-Proofpoint-ORIG-GUID: 8RAxmTOZyXInzVXtYBvUfSW3Jqa14qUK
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa661e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=dz9MANpua1BkWfJUa9OfoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=30WRip7FDacWLqpXgTQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDEyMSBTYWx0ZWRfXzBSLMn9CX+5L
 YskjQgAWvtOr3aFIvWPqYOJQk3IoLMj/XfVtg+gZHVRf0EECSm7ZfKRXxuJnlL2OElbbQHeQNuq
 sjrQJcONxkF3fYdgyQGS8UOrn/Np6Ys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDEyMSBTYWx0ZWRfX/ZjiWAn8mOs5
 uvjHGq1K981c/F8CIFfGgqkGX1tqc+vonbTDmhJHOymNgiR9J9DLyie3pCKb/9JXkbdHnbDve23
 rTiBVgniGYzULMD5q9k98zUFpIayN2NWqfZ80peAtGB3AapPUgzMvCeJVFip6eNqFfLNRpbMnJh
 splt8eLV9WR4w79L8IzQ3ZoMBM+DdCvGhKhC7PNypbwm5g4p9YP1ZRS+9EmQNhs1aIRvWkHW+Fg
 RshFCvcGM4Z/IqZZsqlZNuprtbmipSiYslqZaFYsz0znILXlCu7e0Kvo3gs0UbJZxkSahUvBYhe
 aWjwNux8JgkjBlGuEo8dvQZrcoZyuvqpr2Stq44Rgz9fKgwsfxHR+vR2Adg1qtK2XpneGwfcD4L
 dpGFJdqrNrlYlkGcFXUdY5ROCCw7KEzn/WZwhR0QUJs9KB1httYRR6OQLq64Is9Prvk+NlLgWQF
 rX2WzA9k9NYAVKlJcqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130121



On 9/9/2026 5:12 PM, Konrad Dybcio wrote:
> On 9/8/26 9:05 PM, Viken Dadhaniya wrote:
>> The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
>> rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
>> values are several orders of magnitude too small. For example, the
>> 50 MHz threshold is represented by 2500 rather than 25000000 Bps.
> 
> [...]
> 
>>  /*
>> - * Define bandwidth thresholds that cause the underlying Core 2X interconnect
>> - * clock to run at the named frequency. These baseline values are recommended
>> - * by the hardware team, and are not dynamically scaled with GENI bandwidth
>> - * beyond basic on/off.
>> + * ICC bandwidth values in Bps for the GENI_TO_CORE ("qup-core") path.
>> + * Convert them with Bps_to_icc() before setting avg_bw. The QUP ICC provider
>> + * maps each threshold to the Core 2X rate named by the macro suffix.
>> + *
>> + * These values are core clock votes, not GENI transfer bandwidths.
>>   */
>> -#define CORE_2X_19_2_MHZ		960
>> -#define CORE_2X_50_MHZ			2500
>> -#define CORE_2X_100_MHZ			5000
>> -#define CORE_2X_150_MHZ			7500
>> -#define CORE_2X_200_MHZ			10000
>> -#define CORE_2X_236_MHZ			16383
>> +#define CORE_2X_19_2_MHZ		9600000
>> +#define CORE_2X_50_MHZ			25000000
>> +#define CORE_2X_100_MHZ			50000000
>> +#define CORE_2X_150_MHZ			75000000
>> +#define CORE_2X_200_MHZ			100000000
>> +#define CORE_2X_236_MHZ			118000000
> 
> Today, even with patch 2 applied, many of these rates are unused.
> Are we going to?
> 
> Is there any logic we could apply to derive them?

These represent QUP Core 2X clock-rate levels for GENI clients, not
protocol bandwidth. Currently only the 19.2 and 50 MHz levels are used;
there is no planned user for the higher levels. I’ll drop the unused
definitions.

> 
> Konrad

