Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338FC57ED9C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906020; cv=none; b=mIZuuThk0m60OkuHCvFqoBqM6UFpLNnaOaxeZaWpZ91m+okxrUlsl4RBhKHFt0I5USUo+DTpEp2lhX86B8fZ+pz0oZaBMR0295DuCiDq8LydQsTYXgX6WUPr0rzADpT/1WEaqRs0Vjaomn8k9YUODMQY8Y8TO8DIXSWXWE1yFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906020; c=relaxed/simple;
	bh=YF7lwKnwg2iaN2v68QA8P8YHLT4eGZr11b1zN/96nFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHQ2UNZ421FhandLus8D+HNvA7VQS0Nz1zxQtWNGD8UmyWt9vOPhR4xEFZjkbRbM8fvg9oPiGKKbti+PrMfNoMiWCTVjvmAFav0uTeLye+QjFadTUShGqY3ap1/8oFYELKrKhLVMCob99uQy/eFOsnEcCz+IK4SLLsf+A2a3hs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ubr3gitq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Id2jYxx7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ubr3gitq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Id2jYxx7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdaTA2769665
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 22:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LamaiPs9H/4rh3RVV9PIJqA2A1QM6dcx2EoKi2xzveY=; b=Ubr3gitq9ylEMVBc
	yUOxl6/Q5pIEYYB3CTyyjo6MeUyx4VrIojqNsw0rB6QkTChDhkNImmHjKrXzcW22
	5C8w7uhEM6XUt1mS2JDuQxjfte31XT6E/8PeYSLXxsw3KzjKXR0WmmNpsq0yJgE5
	PkyldpOlettoDFTceqhhojqyWGuFts6zWqTubhi4JMunqKiP0kLe1pVQySY9cOI6
	h4PhQDqHZR/NkYnP5YFqY9qISE+2YaopfIFzMgj/qJNSfBGs756rxYoYo6HNIl25
	8PSk5qQM4gZe89C+nRZC3B9zybTMsBKoiTtlTG3Y+3fZ8WWQw1Y6Nz4Q10nvvB8w
	a1CNPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvujhfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:20:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8645a62066dso4699620b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788906011; x=1789510811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LamaiPs9H/4rh3RVV9PIJqA2A1QM6dcx2EoKi2xzveY=;
        b=Id2jYxx7IgVDB8t4xh6qmaJGWVAg11+DP3TgZV8JkhUPXCjclCoqBDdE7pxLtU4Y/v
         TGBWboK5sIWJPOu9m6Yn4Pbe7RxM3bNGmYz1oBAiIYGZIj/yWq3X6Ny/14dwZRlk9TQh
         YqKTfuTxYnRdXgC1njfxymJtYMaWqQzKRQCsWog8mQPhDk2k6YIi0/M0/T1gF6gOxDon
         lf3yCcxWxNFo6dtM1Pg8OI89OxCEN243kfkW6SoZJC1ww2c0JkkuQw6NHiHElKbRYJqF
         nTDD+SwdNS1r3uZmrj8XsO0DeCGwKQHlPEU/3OaBBpjVxOCh8PdYCXmZ66FveF8Y8uhO
         FStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906011; x=1789510811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LamaiPs9H/4rh3RVV9PIJqA2A1QM6dcx2EoKi2xzveY=;
        b=MzfDEvz/Na9kYd03S5IvFRJLoqhcLhoRNePVJe+l8nSDJ4R2OtZXyWKvCyoilGucG8
         8vsVGbpaXcVe8ko7N+4ibNu+c+kgwFSuZiGGp496hGrNvFW8kUTe8uM+joEdl46nAyHo
         WQUW/Kp/vfI7MDOKPNQqmT5h8zdjxU9entJ6eaGmFxsnI69jL6jSh8BKACSEAgj98kb6
         23rw+b1/8/lgsIJpMbs3v7CQFE7qMs8ywYyrlDaokw8+DfC3EMo1I/nf7flTPdYl3i5b
         Yxh5C04jmtV0gIYxxH6awfghwYlA9Og2eY8/HV3ipkpbJq4E3wI6TeDw525m/PEc488h
         Oj9A==
X-Forwarded-Encrypted: i=1; AKwUvByedG8lJynJ9XnHP7NFV6XGL0ErZe4eQLkARTohBtBLCfhmZGDh9+cdJ0GkwEhmy0mzbtKvmDqF8YYNTS0=@vger.kernel.org
X-Gm-Message-State: AFuF++miVoMsOiznETxles8RjYl71LURXfdeU1ghuc/j9EoJHzIX/7c0
	6LTkTa/zsE6nOGBGaR22MqSxByZ+5ItFyMBjtFAut/Pj/RmqzNbtLHxinsjVL26vJk0nlQID9Cm
	8cPzoOFOSvKALOmdDBeSGVKiBw4GaVT5QvZGPw+4iLb2slq7W4CnVXTzEEEwio+U6ChM=
X-Gm-Gg: AYBFou0K5UuGQXe65rDf7fPd+uBnEPikIAYMt7qqaWlct3kLRbVl6VEDWg6wWOIM0gr
	xZwLCMt8xoVSH9BVC4yyIlLNEC9ENEkdrq2KbuhHq4B/X+yvYYH11U8QmUBSR9SovM5dS4mMC/8
	0OylWD6MNXaUsF2XQx7Bv1g2FsMxLHv91cN3l2FRgEBwVixnRCZM8uTYRL5K4x+By2wJwUNqS8f
	aWpEUmCDMh6GNLekqbfg2x3i1QhJsDW8fQptRYYKfaPXVqp3ofqLs5w4SmteBXwqILDL0t8RYaA
	4ryS6aaF2aY747N1a3Ri6GJeN97aZU+h31WsBboqL/hXb6vLn7cVwIDFJwKrcxjA5BaDlORzm7j
	/suc5MoNHzrlU7zrDdbv6W9DJB3auRWgSgNn0a/E5JxTfvzmOsANzBlI=
X-Received: by 2002:a05:6a20:4309:b0:3d3:adad:f172 with SMTP id adf61e73a8af0-3dabb25c0famr3021601637.20.1788906010806;
        Tue, 08 Sep 2026 15:20:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3d3:adad:f172 with SMTP id adf61e73a8af0-3dabb25c0famr3021561637.20.1788906010404;
        Tue, 08 Sep 2026 15:20:10 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm40150708eec.27.2026.09.08.15.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:20:09 -0700 (PDT)
Message-ID: <6cda5b2b-34b0-430c-bff3-635df1080312@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:20:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath9k: validate RX stream lengths before copying
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701053823.49801-1-pengpeng@iscas.ac.cn>
 <87qzj9tefe.fsf@toke.dk>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <87qzj9tefe.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qtl3nafMFWmCrJtHR7tVTiPNGwb7GkCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI0NCBTYWx0ZWRfX4tNBxd99eyhY
 /go6TTFWBxGenc7YFaZzM5BOAkS0OaWL2mzvd2Seerq88zug9m3xGnj7F4JovrzwLx4ZQr6qnKu
 I1+KJS6jD8Jjxa2HdvZi//05yFiBdC/yf60NYjMvPT9DgiCp05WtDuUZtpsl+cNUiJ+wF5Y1jSb
 2DrjBZhC+r/ngSX3+0Bz80HBMn0KS/lGR0mz/I3GDh7dk4L/v7TkqOTyiDVJ3uMGoxntLEA7sRr
 vt+keQCt61zl45RFiTlG+QOE53sq4NlNYq2NFU5+iWr6sP1Xu5yF+DOOD8UT1h0z4wJ04YRPRLY
 5rYnIPf/ontB7dfF5dpxGPIBVwhbxS60yJcLyjTXxnVqXIwuDhOQ4nmYUhDLSPjeTQrYHBqmdZp
 +AGrEspxZXdxkpR192R2o+V61vRfgT7098FsTlNOnDFLi6WaFK5z95aTqX/nN6U2VK7Io6qQhrE
 WE0QADHX5lGa1jnaoLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI0NCBTYWx0ZWRfX/AIz1Hw5nCiv
 te9bnglmIEibi/pmlEvd7G9LwiCWCfTCQjwoKiGJ3muQXAnTAdX+3BVhhFjq3QVNQzwXXtv2JVU
 J/GkQSlrroV6Drltf3Zw0m7a/tfdT5Y=
X-Proofpoint-ORIG-GUID: Qtl3nafMFWmCrJtHR7tVTiPNGwb7GkCX
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa08a21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=YgZe7ON-S0xWIwxrQ_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080244

On 9/4/2026 4:59 AM, Toke Høiland-Jørgensen wrote:
> Pengpeng Hou <pengpeng@iscas.ac.cn> writes:
> 
>> ath9k_hif_usb_rx_stream() reads RX stream headers and copies payload
>> bytes from the current skb into newly allocated skbs. It also completes
>> packets that span two URBs by copying the remaining bytes from the next
>> skb into hif_dev->remain_skb.
>>
>> The parser checked the stream tag and an upper bound on pkt_len, but it
>> did not first prove that the fixed header, the non-fragmented payload,
>> or the bytes needed to complete a fragmented packet are present in the
>> current skb. Reject malformed RX stream data before reading or copying
>> beyond the received buffer.
>>
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>

Can you check the v2: 20260814075716.18804-1-pengpeng@iscas.ac.cn

