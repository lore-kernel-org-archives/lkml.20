Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26A49C4CC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818923; cv=none; b=k6UX0+5fOyzgg552c+RlIZHIKLdTfEvJ013OelGUxbXLFi6wcqDzAp+Ei0/W68/0Rs+/rPjrrOXZpnhToEYSkBojRbj+LaPgVKKfw4WlF74xYP0rEozXM5C1UmZu2PIKPVJuYX8Cc6GNrlT4gwPRB6Esiip0C2q3JDHCpQB2jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818923; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGpcTeSkLb5bif7n+pp4xWvkJLt7ds8xhvx2EEyyMB9O9sPdhkdlaOZwD/mONDrCZ/hVLFdNkU3FnYrH9gJLqOUchGhQATFJKvoKMevdbzRVOKXoygsHFhxNnmzD4N+WqAkM5EWmwulUc75StCaY/u5k0hOanbih645Hhm0wrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeIB+SPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHhffzVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeIB+SPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHhffzVj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0VhW2088718
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=ZeIB+SPsyUVzy8Wl
	QaVJWMbkraYD/z4rzcp/ukC1dB7SO04WEFkjFbbvxAWwbYXhnfFIy99SgXs2roqz
	k9HRp/jhZ8dw3pqTbg3WuyKUQ964g96lFBZo8cKr0AZXJQjyxvzMGgwNyQCZve+C
	DbtuPcqE/RWLSB7VgNrYL9ppfqmusQGsDISwMVVBS+xXrW/AurZK3QWg8xiftYbV
	jKPhOT4KED8HAsa9NDjprg9Q8BsMN5EiwrvYutsWFyF5eHEoWT8F/AD6g6i3Ni9V
	z2hIcACkYIWvMTLpDY587afhwie2FogiFJxXpoLWwiDmaVA/vL+WgQxC1BkIOhlY
	Bh62dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2mb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so28086685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818920; x=1792423720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=OHhffzVjyehQ2tSYdnLkn1h6+gDb6Lj6ZBlbMlFw797Wl6GfDiFo2Fr1a6+Ym0Ivbj
         xdIj6GBqSUgWe+6E5aABksW3SHWm4L8/N2EmPQAdJHWZblwXKcc2gGO7MMZMRctxj7c6
         WNanS//Z6z8IdA0e4vQ6BLz5aaooGI3PnQp/ZGveKROQsQgBSp6E/fHJZWqfNHHlH+EQ
         cebw0Ziad8wDV1+agngJvgxdqd4gyP/Qw45eFwlobwrEkBKFL2M8DDRfgvaKr9tKtrd7
         +deIdGZi/FtMPa/e6H1lMo6vbXnJZiec4QZ7M6o0S2lvYiQSrdBNNlAp1R1fawM9yMqT
         9XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818920; x=1792423720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=2kXxYg6CTjZ1dddYF5+b/a/pH9TJAFyBb/dzBl5Bqr8MlXPgBOa+zYZoPwYyfUqooA
         fN39FYpGAMyk4o6wrr4Seu93N8d4qlRPOaRUCONDTxq1eDeU0xlUPelo0DIDOU0VVBvF
         dA3bt5W75/f7/3t2lXIxvJveHUFQMKzWJILuyCYL8WLklxaNt+utEoIfFxtfKJWRaIqQ
         GwbjJLaC4TRrv+iQddz3EqvoQDp2HwbAadfSz21vXJE+rFCb5Tr9MdFxZnPocmvkuI4A
         klqhKUluKPgzxgnOYU0KjxN/BwyNZDwejPKB6EAe2ROabO9Aw7ed4XA2NpEaHpOi4giE
         kHzw==
X-Forwarded-Encrypted: i=1; AKwUvBza2vFoLX4kxJerXHFP+NOicGoUeNVKN1V2PD6u7t8hIylkDK2PAN8pl962xgVqccv3ebUmEAMnTCt7opY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiidZhqSIx+AwL6FXl9X74/D7hUUZTc/CajVrH/luDBouUy+nE
	KG8kQUywS3tPo/Hwtt3rpJnpe/Y9GowpyxBgJQyP8EdmlXEAUDjBd6jtxQTi8DTxJ96NkcnGVGf
	SGK19Us1at1gknZBhMxdKNAZupFEtY3t3K0XbRZS/Wxn7WDkKT67LQ+QCPYKaR2S8HEU=
X-Gm-Gg: AYBFou0VVHlrJ84mEv1pD4QwE8FlT4hn5iF2K573YVDb31WwEXo2UvsBX8bMFphk6QX
	sfXXz0gR+Dcnt/IklnhZ924hLEd+zSdCnsf4u2KkE1k9bLNGYmtB8t2LttOURsGvKdjhi/rYGCK
	qiI8B8feycDW0+r1/o2Tf6rbcZhkR5Av1M9U/l4Wh561HGzn6IXmd2d6UzgS33taSnwy609EAHT
	P1YTkEmXXY+PsEHtTR+T6QIEDsoi8VVgDnNNBitmVV+KbXlMJkPk9U4TnRafshNglN+z7pZRjco
	yOPNS2/SYauUa67MoHH8sHmmJInIm86/oUJhMUleQzi9ZtRY7C/I45ADAgsyC7CPQ1jfgrJuS4s
	geYtimCC6ieBionLBBNApDw==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1993449185a.1.1791818920042;
        Mon, 12 Oct 2026 08:28:40 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1993444785a.1.1791818919607;
        Mon, 12 Oct 2026 08:28:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:38 -0700 (PDT)
Message-ID: <dcffab0a-85f7-44ce-8b54-255d500a63cf@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/38] arm: dts: qcom: ipq8064: Add newline between
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
 <2d1646878546c44fa184d7759ddd52b2f16b8b1b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d1646878546c44fa184d7759ddd52b2f16b8b1b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accfca8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8Q0m4lj9iO6l
 AlJZRhf4uAuDIFe/D2vp6DSeCouhVsZhsvOz7RasgjjG/7sZT0h0L5CFE+u2nT2Tx4uQM0agwnD
 3CvD9IUw4nY6DeEY61NpvGGjCDiet4yUCSgHFazzGfw9tC9fbfV+EFVtNm3bO4Kej74pYSw413a
 W2lNra7L0L58AFBvkYlDGCDbrZAH+sh9m6dLbn7q1A1ysu6o6er70cNTKlSrhpyAoUKKsBcoeqs
 1M4OWB5SxMH5Lbu9R76QwcHd7mV7b9kLVWUdcRxP4uLUYc+iPs9bpNebVEzag3WlVm/CCwCeMCF
 pKoSjMOAoV2xmVShFWQBc3zyY8fgMbob1tC7rtfa8PDpTq6+i45YCAQ/rYrb1P68dsuH3Yj/YXH
 Pb9MwFstzgiFm5BIGmRLkR0Pph68sHfmdiAqcEzr3y4Vwn3XS0pKBxmoABROgw79WmsC3+VzGPm
 pbrXkIwV9HNXPT9ZTgA==
X-Proofpoint-ORIG-GUID: 1KE7udSCJ54Q0ehXW70duK2xpDebJaAQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/EUExG3rDzZQ
 EMDMTvQv7/ynj2Xm54a6B/xng2jamrZTWiCujgyDYzkEvhM3AIV0VhfhPpgf+2zjbWSpCulwqjK
 heMGstXCBJyVLOmojqrD9opNWCW/wa4=
X-Proofpoint-GUID: 1KE7udSCJ54Q0ehXW70duK2xpDebJaAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
