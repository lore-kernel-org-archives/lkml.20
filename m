Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68837CD39
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205273; cv=none; b=YEDloqRhCJbUAX+kw1IyBZo0CJ/0UixLECVUNTuhNCLcB6YXKi6OIXs2uNxQHczp1BlIytyThyaXeuyJ/h/DlU2hhRZpVcbdBgzB1rfZYUo92Wh0A4NFha+JyVQBeP6s4+54uduyHT5id425yzu/xqbfA5Sr2e4E43GgfVtdLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205273; c=relaxed/simple;
	bh=0o9MyypgBrEnlUxFc6x0hzOj8hpBUJe8OJr8Wwb2Vrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOco7qjuTKsZGDo5+i5bb2zQxlh3s3zLY0ZvkdcqewuFpQ37viUEfgCRm4GWAM8FILpJ/3m1J+oWrfiizlFyktrjKu6sSiv7g5YwEK0za4i8IuSMkJ1FG3fqqlC0+G0rVrgUaSy0CCPk+ft4VeyojUAFQBUm3rooJRlxEEz5z3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTCHifCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KONIQfF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTCHifCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KONIQfF9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXo87172405
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=; b=hTCHifCkykOx3BUv
	Dk8viKoBBKc75sKUj01VBObMyqFUU65gRpe2AvmwkdsicPmjbaaZslhLZt+owvyE
	rQttCHCtCr3ZoyHco0lybdDMV4Zg8tnWvA20Bj1a2NKqhEP9SffFwXPUYgl02A/d
	wzzz6eUpHDkHknCT2f39KPK/EduolDGiqx4PCpr62fRwrB2OWs0GDSIAFC1MDvWy
	nGbcTIYGMiHlBMxizFcBZFsNSwaY8PaNVpaWVJm5UwdsSFq8H/5FyyIYHptVYCzK
	dRHOo7NlQF2CA0QJaHoY2WzEO2RmEmBYg7IMnZj/8WrWqOVjKtz4QJFZ36a1Kutw
	/zljwg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4ds0f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:41:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso6433903a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788205269; x=1788810069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=KONIQfF9nhZre9w0N7C+TMOPVR1BbCsJpMb4fo8wl7GXwHP2xXQCuzdJx53i6/mJws
         Ie7YGTWW4XKuP1ICefb+HTODNRRJftgxmBB8BXd0y8o0HNy57UqaqfXgeUhmIfdrwaot
         LP0WbOSw5DAZ7ntvlDpN6ZwWT35ShRVlFoflOO53z8uk9cQVzzxlblLwj3KYKQ+4D/Hj
         KCWzCLkaj2bPs35sQ2Tf2TBdMUFAd989EHlAHLDK4SoXsXX5gF3m6LB/J+/VisAhGzwI
         K3R4/1dN+UZ78GwG7mUc2Pi1tjtoTIiV97x+iczoZTa0AofAl7hGz0LAsxxCaOA629LJ
         JQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205269; x=1788810069;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=Inh27fZp3NvEL+a4Zl18FTyH35uPvNCj03ABhBwDm+00UCQBg4Gb3K0AKPqRbAuUML
         T1msPL+/HJZVofIidmCPFStADmUOAUJmr3DycchdxBuNlZfKFKxyOZ3oi9R8n2ZBjJaG
         W36sS/aqNxCS/oU0630sjjoqyXZrEUi7y6kEAw4IujrbGgl8hzJYqtPgYJocnpN1PH4i
         k22TxLc29G781Mpzp6v0aB3xK8jwQdGy+o6HjO66Kdgzhnn9gSjMYKXeqsZap7DdiD1r
         0uu4oX2UnyotLbdHSywkU84rT2Oouh59INFxA7LGqqWx8mEjCJFyS/LLZJWnOVbodgxC
         iqrw==
X-Forwarded-Encrypted: i=1; AHgh+RpB3q3o9oSbqbit7klRiRn2nmMHd0OFEVTYRN/KCGzBGaSsl70db6Rjps93mJKRrIEEA5u5WxsxIegYjfo=@vger.kernel.org
X-Gm-Message-State: AFuF++lBCFkCd+q7sfMkn21o2RVa2aSndeZ8fgUrwXQJF6WXTBefvZeQ
	li0clfzcuQEM90jlq2IXlgz4z0T4RFhrnB+SAWaocgdZmX6Umhajg5nz72vMdhYQ9Y8YRxI+IDO
	kCZNj/z1tHUYsDHFl+46u9AIBXViDW0YaBFqczA5iXlWGXlEKotrKedbRqabIR6Iey/s=
X-Gm-Gg: AR+sD13+pzAcurTrIdGdrF/Wf2Fts/jx4q2nzrkmyJq9UxDHTfeNXxpJ4CWLndPyCd8
	ESZ58S0E8G9AQ6gPT/o3OGYhQMopHy49mn0AIMfPy1izF/44iBPIYQWDHedQP548byX4xl6rsVj
	6XZanC4/nECQqxx0Hd6TQY3HPOcDPZAxBOECBr6itdQ4PXcXef3V651eHc34jqbZrX0lTYNevTA
	LXcyyt40liISAr5PWaciZtokc3+p/xc3rQYLiahFwh0gutl+KHGMRvNBWnkbnXJ4ot7EQfggreq
	/uV0dU1cxyjkd+SA7b9QJ2ldMPyloSB7hmkpwuBf2Cl+wjBlu0jRrt/yRJoweXHFPb7IbVgAB80
	vIiDNfBl6jSVq3e7mYhcfSouHtIpUo+hZqQJlTeYFHI9qZX4anjrmz+M=
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311301637.21.1788205269005;
        Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311251637.21.1788205268534;
        Mon, 31 Aug 2026 12:41:08 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm35477313eec.0.2026.08.31.12.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:41:07 -0700 (PDT)
Message-ID: <dacc398e-04e0-4b30-a770-9308ad4e80bf@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:41:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a95d8d6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hMWfrMBfY0pDR5NQx0oA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfXx7Kw6Bb36qpT
 +MA4EvNHqg9r50kfEPj+rxj5ANO+6b1AwbotyLa5MApjUVMH6CP5dsx93PkUzdN/OP1EcnYzQeP
 sTBa1Ewn60cVj4CdVDoNj9wizxvgIWjmk2sMwS13XxQnP6slKLkYEoE6Ez8eKu6JDIP8ZTnnJnw
 5QeH8zl9JWD84KY/kaw1QI4e/QQ7op06VX9FXE7ijZ29Rg7E+/lDlD6sOPU8FoL4+7aamDjWuP2
 j6RqNlits18414jGo0XBqtSTO/wATKQoS0oN4ZVLvSX0bhBTy5+6umlxW0SS3hkwcxLf3akxsi/
 BYyeD6SIsgwCYtD0WH8PBc8pmZ0xR5505np8LzAKPJQCbNfyVz1vZGOVBKunvt05M+WaDEH54tK
 wnFclG1yNq0KHmlma+CF9Kpxx2xMNKITWoyTf18K5Y7zSz6DqpCgliW+pYCRNGcmVKY9CFUzHlF
 Vo33V37jTtaYzv3nemA==
X-Proofpoint-GUID: 7dKBd_MS6Eddab15zZuWiDXeH1vi7BfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfX+eGgltNp8jCe
 eHKOOVD+WTkUCC00OAs9msvBTNv1NTYJZ97oBrfkbGZTKIdgrLe4M2AP4AdFWdAUHrrohS3tQ2G
 ZKD1gTj2+Qnp5mfXezb0ta4FXtm7T1w=
X-Proofpoint-ORIG-GUID: 7dKBd_MS6Eddab15zZuWiDXeH1vi7BfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310169

On 7/2/2026 2:32 AM, Baochen Qiang wrote:
> On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..3cf39ae06fd3 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>>  	if (r)
>>  		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
>>  
>> +	r = ath12k_core_check_dt(ab);
> 
> I understand there are already some variant exacting helper (ACPI, SMBIOS) being called
> here, but they really should not. After all, how could a qmi message relates to ACPI or
> SMBIOS?
> 
> I'd like firstly move the existing helpers out and then add the new DT helper.

This code is exactly following the pattern from ath11k. So I'd like to have
this land, and then we can think about how we can clean this up, especially
since folks are waiting for this.

> 
>> +	if (r)> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
>> +
>>  	r = ath12k_acpi_start(ab);
>>  	if (r)
>>  		/* ACPI is optional so continue in case of an error */
> 

/jeff
