Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568254;
	b=F2bxwD8ASGKXUYC0xnUo35QOOZNBJdos6/+VPDiAdagArb3Xjlh8gpNtTHe0VgXLG8cj
	 dLihd9l3sfob3odKSt2ILAnuEfHYCgJJzDHsEmuNTJ6UzpYGSX2FrrRd6iBUo5hL7ki2i
	 zaFDUSCrJtHwHNilZIYvgXyHcln3b/Dpr85SZPq1hZit2UwyuUFp0JSZBjC6flxI3WWMS
	 G32fU9b/jBEegyT6Qk5iyyiVTaIq2QV72ikggDTe2L2kCQWVTALE7AQQEobCH4hatYpR/
	 jXtHDpkmEHoTZL0ZdQwXcorrzuN+BqvsZ5UdUji6LWLnjqICqOOXSSmAjP0Uqn9ZwLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
	b=j8qlO2sDdbIdVoG+OTF5XSG0LtL7dnNC+aV7cJGjaHEG3mWCl8aNAageyPw+ghqzsXJV
	 qE2KAamcIiLdSGv6MPK96mUwnQTsRxfQatrNsIxB461RIupZcSbWTmsR2p4TZtlDihVrU
	 hp7ch4DSmn3avVU5qrbA7laqNulJbXQGIlk12toH+cExpNJI12/xXA88Oyzfkmexs2jg7
	 0knPa2X3t7s7dtIHLT4LhFL2LF/YPeyZJHl0ZlVsdNiDY3PmZTcxRzVorj+MZKz0dx6t9
	 noi0gtZijmx4Ss9C671zaADoQQDS+VZkzQFHXe3GrVpVV3rqpD8V/2qkJuEvLtBb5Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kzaLhfm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUzjFWXy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276360A2603
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C276360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kzaLhfm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUzjFWXy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOGY3573330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=; b=kzaLhfm4i53bj6Kp
	DMtUHdl/gYPYCPUTeDtr0fWXpRLyCdx0eXMdVY/fm+kfUmLD93QVRZjSk4WQIi8Y
	ilPRlGXimcFdi60pWyvDoBbHQYrpHLRzNhNGoZOEsRuu2ecZE9syMpBuyw9V87HD
	qgx/sEPAkJn+h2xP07Cwr0a7PDPbHsSceCXB22zrdd/baZG1utlraM+rSH2PJwJJ
	zFZadgV702MOvsP6EVH/h0hW36Y8I/D+KighNnQLO8eEOZwrZJKoqKp6SnBA9glK
	5fjtAd+eWps/j5MN8u4OsUlkR4LOTe9UQxXaKesy+/SxDxnEhdSAPaZ3I/O106xF
	UmTSyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htkr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so13391185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568252; x=1793173052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
        b=MUzjFWXyKg4SyJoakEMHHeujnoQu4FcpooiTPcKLsGt7T8G0x0PXIJ+ObJTHsdnWJQ
         GJsjrMe51NyE+42v3CLf4HSt7SPgRiQ88aKKR7kV+v/H/Q0dUa9fdxf/jgk1p+hOx0e7
         5n3R+YHB34McMqz2bwGMbBDPx8I5+CJDh/8oDERnkp1kkSHqC8n1LCOzkqoa7asFPziu
         V++icSLCMd/WMNpaWLjiFq8kJVme7SG23NGrI7yipcqktRPAcKUc7TVIWC6zY85yplJ7
         0D/EaCI0wKyYoiQBGZn0M33ukwjY9oMyXLsZQC4edFyCjdhcgnCy6+jxrEo0j1pVPnlM
         V8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568252; x=1793173052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
        b=VEJ9Oywd/7/nVqV22JeuFkK557cn3MWJq0mZjUASe7yMK3C+ldVWWSc2mwb5du/k82
         FGTvdHxc4Gtu3eg0+ITo0PLbkrAP3t3prASNieD7N+bq0wHeAh23EmsCvqNsVtYX53Kd
         1c6qXxBtUgUebHgs7fRPgIepqgj7bN4MBsCs4t4RFmE8mH+yme7km6AvASkay+2F1FzV
         dqpZCHpsv07vMAq4o2hlROwNd8ageR7fKjM/KBqey4/1czhMyxg/OA43qcRXCqXXzrAH
         XwL4FadL671S+QWMY2A4yNQrJJGntNsWkKwbBXG/O2FBhhXICckq9swOfs3OVbmnrfE8
         Genw==
X-Forwarded-Encrypted: i=1; AKwUvBy0pJV5TG2iAf5bN489UWJ9Bd+gHu3L2ZEIBa6/9G5ScC43gxOqqAj/DLAUTAF6aU2WDs2AwkdvJVOpCgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjvWoaJjNqx2VYaMrXVReMNq0RR5Nvw4L/PGBXm3sO98JRryxd
	Tzz8/u2+2c/rWQpshsaJvv6iGfyNv8Wgt0ds+4ACI8ipLEcQK/ow0OgMED0j3Y5Gc+Djm130oFx
	IcyCesqKG7BHFJhXnE6IW2q650wYh+4eOBDJWxX8ShoYoe+V0toGLYufv1EyxIcdCrKEurbYcuG
	hoEA==
X-Gm-Gg: AYBFou3TnSYIl0w7A9ngxcjO+D/nn/7ipqD1BrVAhoXOk0Uc4LwQPYbPp0c8QalSkwr
	bv3Qdyd2mlxCb5frau0eKW+qsLLCo75J96T81yVesP0yWMp+OoD+0hNHlHv15tpFLVhIpj+OvM2
	QF4p/BsadJ3nd1UhTMho0bymSaK3MtbJaM0XHoZnP/B2odAz9RGXX8d3TAKpWKF3Ov+PPNl4EfQ
	7AQ2wrOq3pw+PaLkAlAHVfksDhCzfmH//we9eWHHmZjuVmTpV6I+IKpePq7WvHk/NdPHzv8+6f7
	6girsngsfCryzN2KBHMvQwJY152lGOV7f0OutjKvygaNvxJnRteKFStnbrf+/XRKSGKnLr/zZZX
	q5O8CetlFrdTJOHESFI/nMA==
X-Received: by 2002:a05:622a:513:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5369b1ba391mr24416571cf.0.1792568251752;
        Wed, 21 Oct 2026 00:37:31 -0700 (PDT)
X-Received: by 2002:a05:622a:513:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5369b1ba391mr24416281cf.0.1792568251334;
        Wed, 21 Oct 2026 00:37:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900686dsm45890566b.74.2026.10.21.00.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:30 -0700 (PDT)
Message-ID: <67b2a904-5281-4dba-8da7-7c070dbc9877@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:37:28 +0200
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
Subject: Re: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86bbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qMsoyx-xFcVx60PzoVoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX/3sEoJ/GuqV4
 YS1RenXeCNkdXoytfeIReM/uo1VMHc2ocdkB1PKtjKjsq9B3wNQ30qyyzfHpC63Z5+oCh8Dg8nJ
 fb03veasfuuokxtfzAstg5FJ+apACIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX/yKyXKTZSx1q
 ZbFEJ5RHLYkCxM4nmUvSCTiV38AJlfOUoY1GxAugPQ8bqecAFL3V6fPblWl1i9DdMsvWy36kk6d
 nToN5hz7d0rE0qa4OXtn95kG2XNNYD9fECOErmZ7KFh5T+BuKrC8gHLb4XoKE6xbk5JuDKbeU8J
 hWXPVYXSgs2DxIhtR+0FeB3pp7EFYhYpVwd+djDsvMDl9sInyx6otQ2qg1sOL+dN4SFPu7rg1qY
 x+TBkmX6QZ+i38KMCC9MBE/D5qOOe30xVZ+X9sdugW6dUCf5BfeEDLQ1AlVgPo0RRizMonKNcRk
 mt3oMdmEuZCEM4eqUQ6T1NtG+kMcYn/xgK4/4qmTgrBdzWidXJdO/KY9ooHEPcFz6ARwu5+SeuV
 8cHnpfXH4YBVLP4EDZ0p81o7mpzmVqSRhuD6oZQB6m2tWm7X7nN5yRd6NcIC2B3kpCkFceY1fAU
 SUD9Lf+g+fyMBIcXREw==
X-Proofpoint-GUID: dTYJ6g2PyOBfabGz2vScT3yWxZxjl5yZ
X-Proofpoint-ORIG-GUID: dTYJ6g2PyOBfabGz2vScT3yWxZxjl5yZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

On 10/20/26 6:54 PM, Kathiravan Thirumoorthy wrote:
> Convert the hex values in the Glymur and IPQ5424 configurations to
> lowercase so that they are consistent with the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
