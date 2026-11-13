Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580350;
	b=Bj9QTS5PjIaUvWi3px4m6Dyjs6NC6CfDPzjxnHgY/9bHG8OYTs17dg97CqCcQ+BRPmkO
	 D7s9q/AD7nJWU/YdR9eZbX28mnwRLmGzJVFUExcH/S9ddvLsX2UXPXoIeDN8LvkSveHsk
	 lADa6Zz3sb5Pb5Kiv1bGHsLB0aDqZagQ0I2FzGrgtC+mM5NeErYFGB/8cmi6JONZl683s
	 kbinGYrW7K4eu+9GCjLGcdxtSR4oRDNcwLQlFLmXWiv/RvtNtUwuTMnjtj3/vY5p/xoko
	 Y8+yDGo6ynGm2C3SveMrofC+EODXSvvCl5Yo1xh2MzXf53qVykVLtAbvehYW9mu7QEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
	b=kj3pHQqj1soWwxID8rAR8jRiONLV/Nd0aOU+seDDC8j9oD+X3KxV7WGSCZuinFj4Ow4Y
	 5/8NCYy+AI7+hWNaOTki8UDSgaPS0UhKDZ1H1HYn05xVPqa7BNd1Edd1I4dArBBeXfO9n
	 h5BwjrlfDsb0ccARCvoldEJhcN1mMfTBp+KI1qD0zNJtVVqkHZa1D40ORa0ir6p+WyH/V
	 q/sa4vOnCGnh6i8ub9r66MAICk62AGsl45Q4ope7sn3Zqc/36U3PMzJjMoTc+2faY40bU
	 q0gN5lHkHd1hQITHqPnwjynJWM7JD7iV3QetN8gAksAlXWbK5VeVHjoYI4xckYUk5GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fE5qM7Ct;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=efrV3IaX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AC606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D73AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fE5qM7Ct;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=efrV3IaX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJdqD689076
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=; b=fE5qM7CtcmyqiJiA
	Bi5KbSEg50e8i+vpHccpKDHkmwYgcd9wGIeHyFEhrMW7w7/vfXw58WGeDwEywsn0
	jir8dmEISSeCO81quxCj8sQ2vikprln/ngnoqhO/TVT9ysHS35EPPGxNxQAM0NMv
	MSSL97TauJOdXmlAn9Q79YQ2vO0A3YeSOf8GTpHXoLMsl6A0IUF0QdKl/Nc5cer7
	tm/JqltEzSKgXscRYp4FO1NAmBP60WbwPsCpTnPKBk32AodS/frl5eyBWV0cFzj7
	gzJVDuCBXw5dfnRTWvF0e9ZcQc2YcKQ8OP16/wdpzEsk9bgJhZKmr8r+ikR/gFx1
	c+1QAA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjrr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc081f3066so52580137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580348; x=1795185148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
        b=efrV3IaXJPD+Ey7S5C+RtctG/vN45dUQ7kVgs95H5I4ws/bMp5HxkTBRs281ppawEA
         Et/NRKh4mWGkn+bIIo34Jf8piyedn8gKZux3l8G4anfO/76JOPq3oQERX5W7AdwKkc2C
         IKRYAFFlXIObuMoJ5mEXe6ZHN0hmIdaVuwEUvV+nKu1LLxKJipnAUN1GKDQ/ZitMNsuT
         OjDMf+KKX0CCdWIe9JPzCTYcdHIzyVzwr6AgxuVqpDshFty5/y4NAjmIgy3j5CJh50oO
         89EHvF9rxTSC3jlJ/b3WFzgOSjxs4XaZ6NhSviaqvwkCvze1qRAG2SDUqSenEjdQyagN
         oHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580348; x=1795185148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
        b=r9Yz8yICrUPhsxNTWqB7MMuS4iyJTW2QoSgdzAT6u5Jdzd5eYp68GNkKRKHhuq0meY
         wkdivhnseA9TRXNwFphTSeJhjWc8WwA6AeWpk8TuWsNU+o6G5YNMztwRLbDDDhDDZ2pa
         AdMze9B7UkTzbmkhYgJEgn/oU2fisMwXPl+F/TK+U16b4MwMpMO/0+584oYkLWBwKeqF
         RtvMh1XvHfgoxmRaKtojobLT+EBC7/kM9IKM+jZrzTN/4acYGH3ksfQfe30mwkMOPj1k
         ZrUHq70H0CdiEsl42h4ZDF057o3qu6IjL0tJh3Xv38F3EYEODMweDLWvf8BQ8WORrv5n
         YGsA==
X-Forwarded-Encrypted: i=1; AL+hErGZch+l3VvkIahytmFdVDsphmWl69jgAUZdUFhlBFlGztu9TsxJpkX2kcO/AEQP2qFQjJ2vToRZCUQeiqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LtVl0uH+8ovHk6YgbUR3sNpFQ2Rl1zKu8oxthjGFuArGONhNq
	FqQadE1s6YwTLXeXZ1Fvym759dBtDACwnEY9KM5AI5QU6AH6ER3/027dy5WdjnFZRaAGWvGqVdl
	Aszj5nXIAckFSK5s9TV1i+K3CmWRy3toIKhVBfP+F7/RNpaFnAjcBDt9EM68MHQAP88Pl2XLrpB
	w=
X-Gm-Gg: AYBFou3HEc6kxpZ2gaxcFX6GaMkIhLyjAMA5+aMgWkQB12Flh7ymHwV7JZOeOIDRvx3
	Frpl51G7NLxeoV7hFYo0GBIitZFEeezSiRi/JE9xO3CSkOHEjqnIvy9C+XRcA/v1/c3WTO4cyM7
	uLGATHOCv3War8ESkOhLshyGMqiGE27Qr/5JGIS3CRcRyCCVMCszfEllJ+cNWw/r+vgFgqGcCyR
	3DvsEyGqMylA1YKW1jECJDLcTsXehorrt75PKiV75DKfBdHeD3cwtuiIBHE5xFYm80+5snbLzOb
	MH5FTkA/BAMugPdCj+vwtAy+2cBMJKz78t5sp1/WocuvyrEWQU71TT2U8wfCwS5O9RaBjDHvbzH
	kxXTn85m9zWpykU0f2zJcjefNeuJhEqnpm2NhtbtQdbT6Hk8G8ZANYYsvaiaAyJEHfuvoAwo=
X-Received: by 2002:ac5:ce07:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee344f2ff4mr908941e0c.0.1794580348198;
        Fri, 13 Nov 2026 06:32:28 -0800 (PST)
X-Received: by 2002:ac5:ce07:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee344f2ff4mr908885e0c.0.1794580347493;
        Fri, 13 Nov 2026 06:32:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23708sm106818866b.24.2026.11.13.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:32:26 -0800 (PST)
Message-ID: <de00bcf8-c09f-4250-831d-007bfbf17eaf@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:32:24 +0100
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
Subject: Re: [PATCH] i2c: qcom-geni: Prefer asynchronous probing
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, andi.shyti@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d0W1rS9gSqYlYMPDGcOoNBmBsKrRrnPM
X-Proofpoint-ORIG-GUID: d0W1rS9gSqYlYMPDGcOoNBmBsKrRrnPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX88aevxgYo6tn
 rSy81oLqlIaLkoD1bydlRcoqzw9Zi3RqituWTi05x5VWip+mCXhvlL2BxIpcpFbCcr2aeDd7u3o
 83UgcLx2bh08WyyMngYLJatdX0KSbQh6R0VZxdQ0LhmkbucmUD0RqJcBwNxWhMNYXBgaSFYTV8d
 Gf5sn2rH4RTpS9vC58jlKsisx1kXbKLuoojbppZX62MlVuMSpx6GTWM5wg4BVXV7KnFWMMcTTOR
 nltOBM9TmphFypXTFmdRs0BX5yOpYQCXg0XoZMJXT3OgexOeFwqlUDuyqr4pVrzYWAAnpc0LBDW
 3BoVCxJrlZ+1Ev4keHGXDmNKgFrjFzZtclfUZ1+9yQY7Mj702RMySHBSJcHJchfnbBfEGhE19pB
 7XVOmYvP2fhwmtPNaAIv2HPSwCmV4oWfEPqH/odrPEnW0sw9NwqpdyaQsdXtM8XejGbi0k9Y9hd
 AEodiUHUEyWyK/xc6dA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af71f7d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BP9H1aEygeDGrBmwyXcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX8X89lEujybcU
 yBJWg4ZYEIGri5DadERAAbx1rQQhDEjq0SSt4z1tRNn+4pQa8Jy3q4pXPsWZfOcRAMwWQa8lVTl
 ooNlc6HU3v9CIxhT0OTD0FvnpHt/wRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

On 11/11/26 10:09 AM, Wenwen Fu wrote:
> When built in, GENI I2C can request serial-engine firmware during
> probe. If initramfs unpacking is still in progress, request_firmware()
> waits for it to complete, blocking subsequent driver initialization.
> 
> Prefer asynchronous probing so that other drivers can initialize in
> parallel while the firmware request waits for initramfs unpacking.
> 
> Assisted-by: Codex:GPT-6

This tag is considered obsolete, please drop it going forward

> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
