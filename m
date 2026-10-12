Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940349B44B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818585; cv=none; b=lYxruzjXIHMcpAk9YxnOFV6cxusYjHIIdbRPxjNa3EN+J/1LO7qOa2RAC9xTVsdmg1y7PENcFrUjUYKc/hoCyb3GrERPZLzyjdLa2sAUOEHl+m7ckPRKHcZFxzYGJkHBog77V12fQRrcWt4YCzsvOWaXWZQIhRj4W4u9ZM7MO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818585; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0cw0wcbAQJise9KgEeKSWOzhQUuZ+nqpsJTS899IWhQD9sm73Fn7hL+tZnzPCJlnCjt3yWiBNQuHQbwTy50PNuOvQTg09+CRLmpFYdtd0ZoxmNV/9sfjwsrvs81/20Jrwkm9q0Z0bWENLgFd2dlo27vsvrLiYjS/EbmxRaz3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTdvI4Bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guAGi9Yk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTdvI4Bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guAGi9Yk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09EA1686401
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=pTdvI4BnS5SyTvkL
	Y4PuZh9TQazHicJvSVk7SPAzIMnWeRBk1CXa18H8/yhFoxuiRX4173x854tkoImr
	/vRw1MBCynC7RuyUZ2DnXk1mB1JvwrymZyC8XBvfxAegGIAs9/1e9+xilS2ttPzv
	F0wrH5GCSB9vIvlqiVeAM8Gw1RBr+BO1awD8XtFV4BYivElD7uVWTLJoHYq2W8JF
	tR3LP+yyRzM+Rb3xBgTAo/HAy9ejM0t1mIYUJ8wiZnuJbXkycRlwLT2rVLdL0P/W
	U1PSKYt6rBTUdro/f02/nSSAIu6tN36a5LZrBRHE6fBSouiwLNaKqNyscq5cSIUA
	Rm12Hw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1f6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a6634ef51bso35419137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818583; x=1792423383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=guAGi9Yk7qBAHjTe4iuEtpVNtOmGew8Ox+Kb52mqMtrIhvj0Z+qCHnB4QV5EeLYwWt
         yNUrzHiMZx5ptWxA3y9tuGuF2DnctkubeNX3NlQ0zdQBpDuWoJ31ytmaCafXSxbR0p+2
         6LGJARAQKpZGHzfiZ//KuzJ/kRVENR446DssD4sdyl+TAr0f83BGe/ON3simODEZ7pN6
         BW/s7s7abmvyCrYZrKNpcNMAE8wA0ZowcPystbv3FZ8P0gQY/5ZXRlI/ozEY8Pnu+gn7
         90m4nz+SC43lBUA2aDfBQ2e2qyLIUt96c95K+BjlLPMCeK/uLpwVxwrExsbW/C8LOyo5
         Hz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818583; x=1792423383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=T908srfnEQ0eXup0jLWYUtCDDQh2MlnqMzHnFkydu0ArSwPogcmSqi2XGwKKM+SO4S
         mSwOmRegfroCyGx0/67LdMlJHufSv4FesbNGcSG4c2EtbnfsdhZyVMbxNiPMgVrgQXF4
         j5yG825pvgf0fIXm8mzZVloJGDl0vLRSJwD+oN6hAmp//NT5vKvxuOB2s6DKVME+d+w0
         0y7aebP65FKPm0y96KzEHXnXmA1ISz8kVhFxjtCzJ6CTBHDmO/T3n0VeXCG1vzY2tgz3
         Yp4UPkPp6/mjhF2xKJec5sAvc25+qfmF2hFzE7/OfGjtCozgoHIMQAsJw0DQNrfSJo+R
         vVVg==
X-Forwarded-Encrypted: i=1; AKwUvBxmCwXM1v9duYGAKsEPXTDBRcFyaxJ2cwUUBZvGEKwihORl27/hTtv2lZY+x0jTsAYW45EHadJ398Da5pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQTQGk9Rw5MLZkPXe8ueMbz1Z7Pr3Xm3gFgEICWfZvoWynMkO7
	RMBD9tSc4EnTP7oDAxrczDzZ1yJ5f794UWZjPr0pY/dKyPM4k579P5jXP/lZAANKNkIkBAQmYw/
	CfaaULpCnEzTRgYr1ZYY0mt22wHsZAciphXUf2YmAqgtwH8AKFjsXX5ZITKuT3k0cnEo=
X-Gm-Gg: AYBFou2sw0f0IxB0gviVy9ps1SEv+HIOb5xRIWET2ZVDelf139g4TvLaj3DMzfATq0r
	eE2kxSUaRqSdw97/ZJ27w3/gXjkIMAyAw3TtVsi2491MIn/gl1HMj5f/7DFo6eI9DePmn5DfyNG
	6FmJ78r42kxEKmeY8G/caEjz12wxzRpuNOD+UWZkvdKT3WXHRFHjlo9CHE6oT2VqQuAaQ0CiJiD
	vczh8Hs2JghSGVwqq23PgjRffkR6Bqwzvr0E9KEWgHs0XgHjiD/H/T8eFPLUnq1InIg1A3XSc0J
	Ztqu4LLnozFuMGvCeBuRvgPrfhZ1zMQz8gkGSiUxUUYDVIYGUSKrGMe0jaf+0mlMYE5lZzHsbSD
	ScZcUBQHZ5AnkeWt5QyYGBQ==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350616e0c.0.1791818582771;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350605e0c.0.1791818582263;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1cd4a1876sm1011273a12.19.2026.10.12.08.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:01 -0700 (PDT)
Message-ID: <51f5c9a7-5b5e-49b2-b8bd-a900a906cd2a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/38] arm: dts: qcom: apq8060: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX25K6ylq7G3mt
 YBRd6TGm6wTIgFp5H7NLgnIV1/CjSpH3200tDiDt/sn3YaNT6hzb8S4jPHB6PlUFE+5956gFexg
 0WYYvEZZgErZ6zmIOacmqVdn/ZE40Vc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4RRm3Vvb/Y9J
 M+4cu4+Ozvr4Fq/7YUGbB6uQxhCzr9JQ6mZ3KxYQ4POqtdhbZpnkwb6QENoMRkPJHUZmXkq0+3U
 5hzUiK/9h0tpEJWtXqO1TK6Nkv8cFA6/vpkqxJbDzznd5ahe+vVnDtRJl1vxwxjArwI5nzEBuc3
 icEAtJwfFZEOHI1hldzIUuU8sjkZugu62Wim35kgD14l7/Me2m6hhUQPwrZaCFZufecSev3eI09
 t8d7omg2H+Qk/7xGF8OkQou5fyLKJqsSfYBdA2v3VOZhm2DCLK8UlLHtxT2HHhZmCJoW1EhuBaG
 TeQJBjb/JaLlIyspB55eMrgcOPmQ8dYWCDaglBPLXacdGd0pKE1BilR2yZRmfvoPyeUNgmo4E6V
 72W8BSXf6/5YlOoA8IdqyvCzWT2e3OPGZvnCZGrfeoXsd38/d9Up15fJVGg2A7SnCR0OXN99Q1+
 65SH/xDNQBr7168IdoA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfb57 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: HRyP0Q_qa2ugUO-fK1gJRP27nGLTnhKA
X-Proofpoint-GUID: HRyP0Q_qa2ugUO-fK1gJRP27nGLTnhKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
