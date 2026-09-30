Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F053B52F4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761386; cv=none; b=PP5tV27qq1NnGR7DwwfOz1DlbwcCRlWbGIti+FFt5bB8hwJ3Ej+nueULga0B684+akw3dVcJkC/vrfDsHHCyXhD9EP72C0JvLHEjIFN3Dz0Z0fvsdYq6B2uAAkBR2bLLn+fq8fkAspZPR03NKIuUMIiRmzuAN7b2IQ0G9zJDu7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761386; c=relaxed/simple;
	bh=F61vfpCLUs230+Kga6ah7vN3n1G+Njimcu3inI12qr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiyeMJXDmh8ZidCo4Zxp1FDiP5bngZSsFzXfQidsUgLQkOCuWkke6ezqdeXpHYQCHXvk1OjvO7y1Y7uFJnBm8PVTYyNCKz5iATa3C617HjvMK6e36tpLFaVPmBnsJClDPO/ca6t5/2U4dBYIP0kbY5VWCTD7b9IWChFI7DIQot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcquKj9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhnncA/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcquKj9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhnncA/J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7db8E3330407
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=; b=WcquKj9Nb25jIoOy
	3e9y30+dQhDIpJE6EqEi4IV8LcWXoiLaX1ntxCOQhRoV8ov4g6+fomzoxzqJEPMA
	TiGwSQY/zuMeSelcR7P/8k+w3O4tU0zTMhPrJ+0XvQEPfS1Oyt9NxdkUdtEl6R6P
	z14d9ppkf/wIi8BR89ddG2SHwi7OCAjE3qtejTbO32NCKR3F+IrzNlCrDxQCa+D1
	ijD6y3+W4Wjo51csLWZzX+BMg1DAHyr8OKRmFnRcJH08RFpPmMxGZeqh2AIDcs3Q
	/pN87YR1Y1MVIMbjaw6EilslAedsCxuSowlaeUETzZ9cjrRnF2J4/No1fehYwlBu
	Iws+TA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3jpd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530db5af1dcso13306481cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761380; x=1791366180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=VhnncA/J1/kgjMd/8Y+DO80ok+52i1QGeCthANMbRKhy8EQ1cOgYRMd17dk5PbGA5C
         yADeImIoNuc83j7frVb6hMGLx82z77ikAoWLss7vfLoT5z9bx+TYnm4BQsEornsnR+Z1
         SBnR/3+hp5bci5Wxo4b5V+Hg7mM7LHmNx5ulUU6Ghbrguob2YWhXObIga0JsqVrNOZZA
         eQJHqbnoXqtOc+Lar1HAWEMjGy4IhfjfSCTjAWpbDJvysMXmz0TpI/kNrVw/KDmm4psZ
         E7ZqwDVZVNbHXLuV9plEaVvSKCIzU7vZo2itx9CpWgwLKEQx/ygj+VkIE80ICKZeHmEb
         NrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761380; x=1791366180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=rzGMyl6KHOnQN5xkefQ+Fudl5UuejAGb7nBgzF7ZkpwgffQART4RngR5VZ0pvFLkHU
         OG9NOGZMfBNGUZZXFdKG07sZR60cCVHhJvJHbLcuhRQOYHRgnHQiwWSkKUoPqZz3f5Ch
         iCYvcbYnU3ZLpV0Qb0pPNPE3uWIuJ2OGgPgGmROa1A5lPBItyZ27N2M5SzzrLF0Rtq6j
         Npxbp5GRIvGcMc6zu2UG39Kz72Myb139ywzNlHIG+9Z7BrzOCEIuYx6pRSDjlAUfv+bu
         LjqNWkMHS3WjZGY4oq8mja3ZX0Lw+nnZi+7H4OCyQ2rdUGBifm5YNcVPxKo8byHc6Nrr
         YHvw==
X-Forwarded-Encrypted: i=1; AKwUvBxB98wnQg68nRqQ3WAqjLK6kvYEFQ0N4jeRQYfukTbJsayU0y85H0JPL+Ys1R8wz/6T+woKgo5hYoqsApU=@vger.kernel.org
X-Gm-Message-State: AFuF++mn7KuYSwUUU4sR562BtnVZmpCsVN71q+LveuuWccYSA+PGwz9D
	DPD4ipOPNHgoq7wAG3m8VzcjKDIHIWuX0q/H76PMdfRgHBqxIZhc0AIr5mIf9EEzQIFVcTXhxmZ
	AZ0Y40msSWcnpXpxmaeOlZw8ZCOULH+iQflTSyVYuIrFCK7PPGIfP3Bd2HM42FnptFpXYNS+H17
	8=
X-Gm-Gg: AYBFou01dDrIgkJkfgUl5h7FRp+aVGXUABIx/fyE+Ue56ZcyipPMu1z2s4u6FI/5erQ
	aIg/8yRoGZv68RgjsVShFPr5TZnW1v4KI06MOa+R6TuPwxM1QpKXrbDnG1LDeH+u7E5GGkZurf6
	TEQimWCS7l86TgqUle5DK2awVKxZHCxY5a1wvnOKCPRGIdesAjljxTLpSTSphig6dtaca++jVZN
	G4bwRZiUkiHNfz0W7mblOfcSCTG9gphmjH+Ah+22dh9DyWERmf9djGSByED3TKU56qDYs1W35Ed
	fDOXRuoklIHAy+WytOdiv7nULPfJvUrZiboyKkYtxbWtkptLU35Msaq+I9NFnAiGxSl6xN8q16Z
	IOetstS/eqolIXXdR8KXjEw==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113845785a.4.1790761379534;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113842785a.4.1790761379026;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42d25sm36994466b.13.2026.09.30.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:42:58 -0700 (PDT)
Message-ID: <a1f90a3c-1ec5-44da-9260-46186a4b8838@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm6375: Use common clock controller probe
 data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tlNg9fDCeZtKW2b0TP3vHbhP1c6Be-qX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX+mBAVqTkngMi
 +X2zi+o4o5eC/qzl7PZNkhZOPRWEz/g05ytemVUET1OF2NdcEKHgw2+O/PLauFdX9oIIIUoKSZL
 kY0zVYG62d0dkTHrvMrKnwZMxDaXhSSxQylf9MDopm1sXSJjCF++cXj8pr9m+fDJLyCsyklxxYE
 BiRWqysfbNL0oaG5U4viEVLokIKUDoWd86VYQNE4J0gEoKMKTeMyi9ShU+j0eDLIpNpEvDJ2jEo
 IGKR3Uz/H+HIhLniVM5Dcp2XTM3cxKleQ32mYAwdcyRsyJOMn69SFH1aQ5I7khduTFNC8tGIOns
 55OiKtp0TQQ/kJciDl0wXUWrJQSWc4xm2RKnKIG34Z0ahp75PQHvxSg2nZ5XbK3oWdpn+Ig3K9F
 Jtl/4/I/T23HSFs7zC5RJoesXPUfHuGypKtuYAlIeZEj3Vh2jhz0XRwA78R3/ZsoI54JdtF4NaU
 OgIjj5lsjJeKxl2yJWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfXxDvTJWkDaI97
 J1LWila93abdUdiENFph5oUCztw7ELMOfyKDRZAHwnoTrT1AVNaJi69VZOMltwPaUYVFMNFYo2y
 AoWjVSooXWEwNzy+UssAM39RIipFy5E=
X-Proofpoint-GUID: tlNg9fDCeZtKW2b0TP3vHbhP1c6Be-qX
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcd9a4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=XUWX-FGXn234V1AR_7gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On 9/26/26 1:16 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
> clk_regs_configure callback. This preserves the existing ordering of
> enabling the always-on branches before configuring these four PLLs.
> Using the alpha_plls array instead would configure the PLLs before the
> CBCR enables in the common probe path.

I don't think that's a problem

Konrad
