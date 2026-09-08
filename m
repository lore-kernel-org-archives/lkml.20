Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6445867D0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906182; cv=none; b=DJXB9ZD6FJUvW9y1n8GJasOz3AcG+UOaDkMpJ/1vqiHHVngm1Xn9hip79ojrPUnpL9z6H8FjnWDHu4uohN7ZnUikRd1WP7t0wmbawP/FecmUowuoIb9HKrhde853W5jwJBnNPDEqHTKMK2TXn284tm4316jt0PRzE2DrXoD9GxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906182; c=relaxed/simple;
	bh=O9CaZG7qcOmkwF2J7CyRB93sC8uDq6kGycdG8B3xOpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1qZXbq2VfOmEhvsQllLlaOkmy7EyVzVOeesBVrMfmP8GYiPN5LmG8ZcBj4oPNOVpT6/AFYbOrpnBJl8F7K6IMAHAZJJxfjy5JDjUpzMFgW5t1q7d1jKr2PiTn1ytpDkv4IO2nZdVY0vDUmyNWHvSXlqhMFcRglHfCb013AdXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyzQMlcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj+F56rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyzQMlcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj+F56rg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HLYie2966704
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 22:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQYqbFRLmHjsvVlCkeEOwCo+gbbQSSRKnjBG4o4Ik1k=; b=PyzQMlcxGP2YdtpD
	diLuyyim8J8AoLSdTPT9X1F8BGo5BXkiRyshRXh21j5m+hDtKBBVvZHsS1sQ8z5N
	zVuMs2dXJZg1N5liBcsJE+w1tediN9n6AE8cjYqrmlw1hjMFN7O1LWTPpGGuZuhP
	nnzfKaOTE+ZbV8M4g9kbXhZwRwYZ0xxcui9uPRfPRFgMkeU6ZeNcjtw+0TcWn6P/
	0D52ug3rlXRETX8lcSwxsoH4ErdLgSww7uOCNMDsRrktPppfPoqfYvz6nMWbCpD1
	mzMMIlbBVbaaTpidcaqgH0MM23pQ42qyo/kj7tOVxlw25aiYTAP1PT/cq7CVHw3n
	kg2Qsw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp1957-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:22:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so488011a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788906179; x=1789510979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQYqbFRLmHjsvVlCkeEOwCo+gbbQSSRKnjBG4o4Ik1k=;
        b=Aj+F56rg+q9k7RssQn9tFAJ8AkIKuLluIObTe0IJ5CShWYhSqO4M9r3nrfiffn+NjW
         JkrGDf0e6Dj3aRyafLY1eMlJUGSUqCqQAry4gN+HsPiCFYxf4xxT1OW/CXlAfyurBjuQ
         QeVLvP1lf3dbo9fYJPJiEOL5f+AqufCWq+/ZqRaJY2bnk6By/WhQNPTXJvdAA40AD7AT
         y2ufOEANJ9mE26RviSS0XEFtx1LxltfpiKdqiSQMHfkmlYFWCfbgVLfgsvN2ofWfC2By
         52Y+8KvDQJj4HT+YqAHoSee5nAvoTYcApEXHVJ/ZPsIRserVHT8F1tRdDciJMAozOLdl
         W9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906179; x=1789510979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQYqbFRLmHjsvVlCkeEOwCo+gbbQSSRKnjBG4o4Ik1k=;
        b=rtek0OzDeGeq/D40eIBlTD1ifbVA60Jacjh4ki1evokqrReJGHOjP6T3yE3SIgFHD4
         xlhxjn5r1qjK1C8IsTuj/fpci299Cr86o7o8O3WyRQJGccgmpVv2eReqj+xlnLJkw/zf
         zzOFHqhdAy2sn5tl6dpnn7KgJcsyo9uum/PeGjPAn6oLOHGTMSghLc+7WZdI3RTys7qU
         lcbuQ+bBwy9Zx2XU7jZJkw7wffA+9zyxSg1OoNBSIrYbGX9GuWoYH2MQAJeh609pQbls
         jtL4r9VtUEFUSLQXIdwkdRfD8Go1ypr325tli9wHxi75JdTQGdg5PwVLQ/BCWXrbtEm0
         2NTw==
X-Forwarded-Encrypted: i=1; AKwUvByTFoicn10FhjC9ldivRdp/twUbG71pNxar/WJzelZ3xh84ZOvuAQFzhtMRLDk52VMws4B8bp0N1liNDCo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8dF+lBV65tlNRLD5gCCccG94pyW1J2hceaWYDOVKwCHqYeSKA
	k4iUDoWDLQ0FHCbJ6ReGH8rW1Rb+6LgSaUp9tQFhShvOGkhA17kClqeTlOffQx1ryVjCVsgP/u2
	1+kzclGpMjMeZ05AQsAagyyBEp1UODUjtqsGX8Mn02u00zEd6lEhln+gQWkFMk8NovSc=
X-Gm-Gg: AYBFou0raSAwFMFzzWFGraKO/SYOXzbuReIviMGXiToIwFkkajCWbsV90bsnAW+xjjy
	jvBlL6r74TxEpTkZi1Si1tUIsUO9pXT4Bujb+UzZdk2GKT+mMMEzrXGEBSA0GCQ2Z7gkS7HoTaM
	aTv8+xsN75vksHyPUDPQuzJ9lX6vD5guVyZx5KI3fFTj88lKcGkAJN//83XlVWV8i1ycE6HMchz
	KVXkhc8RfvIY9n+J+mUOJk+3YwjYUh0+HMh/tEktilNCR2VpO6RD7dMJr1nwxdzioV4WqFDSJ6v
	b01U3Qra2lHglm7QRc/Dz7w1UHABIwt1pY6wezD6F6HjAFyb5i8beT2+m7rE0AKLJdFOCvCCsmZ
	kHEy6YPNKR3oRgpsRmd2GdbleizbfEb0lhFI48zRNUJtTN/Ac3ZaRyBU=
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr51626501a91.12.1788906179062;
        Tue, 08 Sep 2026 15:22:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr51626442a91.12.1788906178425;
        Tue, 08 Sep 2026 15:22:58 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397c13dfb1sm1650647eec.2.2026.09.08.15.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:22:57 -0700 (PDT)
Message-ID: <42e9f2c5-7ba5-4270-91b9-46c41526c065@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:22:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath9k: validate WMI response length before copying
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260704011405.55089-1-pengpeng@iscas.ac.cn>
 <87wlt1tizn.fsf@toke.dk>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <87wlt1tizn.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FAwTsNqB6FybjbRl1Bd1CYgUB0rJg5UA
X-Proofpoint-ORIG-GUID: FAwTsNqB6FybjbRl1Bd1CYgUB0rJg5UA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI0NSBTYWx0ZWRfX9oJ/OkYbRoZP
 DMU+YevGA/8ZZ29uNwJJC4I+a4PIa1TbBCpkCsz6w0JoH/pkAjT72tal0bE1broW3VZLe2OKtJI
 N92+/sWlUrHv41Gn1CA6lkKJtD4uofIsQQt9xOYOYNZ5uX8v6+xj76J4wcJCyfTmvcCUIijbTMw
 KA+NBBwlCt7m5/CjKetVRfbowqTRtL0EVBrkTxhCrBYA6JmUQZixqfRIPBplDieUlKaIYSHaR3S
 GsvMueMOjLLDwLXcr7ztxloXgzelOCJ61iNvgx4YnBTO+r2s0P8X9HrxgDKRKnqCT1E4yb0vSPw
 O9kdz7ZSJmz3aSEqd8bjD/VocA6js12K5K8koQdzboJS2P5K9xhELfJrKKMqRrWvHkw4e3OPlIv
 ZNFgQiOehcrfybyApjiwMGto+BEtKVpLk7ZaunWbiG5ENV5qLf7LuDx0++AMivl08LVXCkDavh6
 ecX8Do9OeglJ5PMlImg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI0NSBTYWx0ZWRfX1dkjqeDEQRbO
 KrIsZMLvmD2JIvhYvIwRUUBCbEQxrh/47MNHzNzgoipOqf7m1Wz7H46EHBSkpR+QG9DHkiLAg6O
 EYiWEUnWLoL8l52sFg96JMkK0/W7mkQ=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa08ac3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=HFy4_86faQPuyoJM0AgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080245

On 9/4/2026 3:21 AM, Toke Høiland-Jørgensen wrote:
> Pengpeng Hou <pengpeng@iscas.ac.cn> writes:
> 
>> ath9k_wmi_rsp_callback() removes the WMI command header from the skb
>> and then copies wmi->cmd_rsp_len bytes into the waiting response
>> buffer.  The response length is expected by the waiting command path,
>> while the skb length comes from the device response.  A short response
>> can therefore be read past the end of the skb data.
>>
>> Record malformed short responses in the WMI state and return the error
>> to the waiting command path after completion.  This avoids both the
>> out-of-bounds read and the false-success case where callers would
>> consume stale response data.
>>
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>

Can you check the v2: 20260814075837.20005-1-pengpeng@iscas.ac.cn

/jeff
