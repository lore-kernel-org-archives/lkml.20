Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95236215B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140334; cv=none; b=ptsWZqtkzRMZoOoiLLuCDdJFviHNnIEV3AWjDH+c7wwhgcSBCZwd1GfbzsGe/Jrd/xfQxmoyD6yZOgI4nQpDrVJkcNUj1ivzvammWGtBbTmRa658B1g4DS4NT481YErCUWFvVMaBCnPCBuJ3Xc8HL529vVmdrcxcO5kDju7a7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140334; c=relaxed/simple;
	bh=lEMlRpoR+kv1GJAGtWryjveEN84E7JieHkX4ixMTAyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7Oocx4W0juFQUCTHupbYQo7pGc4GAq8qr/3qaJ4LQuX/geL/gvWE2OKkf9KUIYCcJPWwKhvE2q9RQWv8tkqB7KbTLyqVdpSzh0tdEm58IKSfq1oI/nPpqeVe7xdmL+lFly3/KSYhsw195OoN7TOU1qRt9XlJWNvbD9pw5t7Pls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHzfYrhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtWwWrgP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHzfYrhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtWwWrgP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8P8O33202386
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=; b=YHzfYrhLuNStdkHm
	oXVLxSnUYhzx3LNP6TRsqpQ5uMkZi1Ej/U4oFYYj7gkPb/qA+G+FGH1YQLKw1WPk
	ou1+AJti/26ga1oxOmJMILbpoqHWSAwhBRmmV3GoKA7U0OkaUkOTKSwFGOdjO3xS
	36G67YcL+mJJYLuXXX48d7e7sy6ZU3z/5U1AsblGRP1bede99jYu6DNeREoUleot
	sdLmf3TZaHnt2a0MH2xQO8uIOlR3lG8rkW6d9sLC4Oa15C+4gaC4RyBDl+Tbv3VE
	P5+kGLjdqjXXfP4jfd1Vn/Wn3MD27hC4andPbhHExmTjz+iE+3lpgoYaFGHyG/GM
	9VhgoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3axnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:45:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso16983071cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140330; x=1792745130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=;
        b=TtWwWrgPiJAO2PnJvKcUUO3mHZr9ENTRD1gEPwIV7EOxXlOxAs6fxi2myoUaiCkHTN
         NEBLZq4laOPG2DWptD2ZjOHfqIvYQcJAUATys7CMpKRLVKSIauZpp1oL0RLD5ZLMUEmZ
         yxJADBQ14yMolL5jG3f7aUCHKOYfuwYdZAvCl9uqZnHMShZJN129VFTbmVtxgqgzm6mv
         pmTVlyDS55dEJ8O3zZME0IaeSmoyn70nmX8t2wxKbpVUQ5ByhZTD8kl9hDbZyrrDSG2V
         vZDb4wJinJyfLVOv6tpw31jr05TKVKh53TXNr0z725TlTzAyK/TdsWhqRvz5ZC0ctrVm
         uhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140330; x=1792745130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9vrQgGb1X1jrtBDG6LZTbTc3+/VZk6Tblt7k4JIVVk=;
        b=muuNbMQFhDKFqRn5PS45EzbAlsh3wYSEyoZ+oy4e3l8jTAABmp4n4ydweacB4uPpxH
         dsKVVhd4eBgfH4FTwxo0CzykBWcC1I5Nr3HDk6JzhLEcILtKvPBHECgVBNJSYLp9fU+C
         GYE4VDO4fNcEYTG3jG04Htd+069iA1bzt9e8BBUJCcNuD8bNuQ+o4xH9bRIYXmCZ5qgg
         uY9LQJ/XO1jo72DrdPXS/iW1IoxsL+Y9DQ+VTxpEpCMcjuqRL1tT/jIejaBLEUZeR36G
         xWw1By7pzHAHAgXUABmf6h9y40OmzEuEaHCGg8FI6QEIzYc1PETNmkcK9rezZ/HdrF7D
         A3ow==
X-Forwarded-Encrypted: i=1; AKwUvBy/nB1ZC9/BjsR0zOSBAPu/euGgRDhscQcMlXZMBFaJGJO0sVMIcuFYi+A7Z2a8W3BFN1CPBet0hlVJX5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr6AvVUVlankOsoqMMwvYZwGeIavwj4wHTSm+qjle3PVYsX0G1
	xSMWvyYnbXtt7j7JrQBv6dOpvqF1of5MuGDCFThtxda/q5u0etD1/+ArLASSV+11QzyJ4ODcUK1
	17gJSdBA/hENpqBFYObFKizvRyXOrXcRgAVqht2lS7MPu6IVcUMdhbTy0NW40t6t+Cz8=
X-Gm-Gg: AYBFou02eD50AoTVnhd4gWKetbrhqYtnVzTcQIItkPiMlAuBdDDyOD9ZOO36fEfUQq7
	sh6dcIayVHtYO7BLhdE7kEjGccNsh4NnHuW33GqQT4vmJY2rYgoLVHAD60Lnb3ev1W2/aqhQukC
	5+k5WqgUfND7Qm7Xk6dhluFu5l5w4JQjDfYYa0FndQ4CZWfl9bn5XmrdfVlaiaPxBgfC7KnIcvf
	4OjA+X5F23thFpMZPHZRb/4P/1/NKpWCJ+kqlaGXtrvpGor6cfOspkRjsdQuNcOBWoKFBxhv75K
	GC22It4Or3o3KajleVmdIA2X5kECJZwP6vA8B6Wurivj+tV2ITe5jhlep1rHUne04EMaz/1Cl18
	wjQlyQ/mQ4WUrBgCj5o3/XA==
X-Received: by 2002:ac8:7f50:0:b0:534:7732:a141 with SMTP id d75a77b69052e-5359f4f6af2mr413655541cf.2.1792140329979;
        Fri, 16 Oct 2026 01:45:29 -0700 (PDT)
X-Received: by 2002:ac8:7f50:0:b0:534:7732:a141 with SMTP id d75a77b69052e-5359f4f6af2mr413655291cf.2.1792140329567;
        Fri, 16 Oct 2026 01:45:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm52215966b.33.2026.10.16.01.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:45:28 -0700 (PDT)
Message-ID: <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX5MReiiwqaXh2
 CsvuDFung1K2QZaOOobX+NNPt50wO18X4OTqEszezVUtA2uftlc6A1lmYtnn9ymaWy3U1qVbF5V
 m7Z+AK2iTW/0il12oXjtUqNqkkRzGD9/7vqXtjzbjDxHA10lXu9EA3dDrXqxCgKxZT3vTYJB1gm
 DttdsOQBjRsW7TxMMNGdTWfwd+NJWdhaU0BwQ+V1Krhq5qZWQ1bHyFia4bcp+pjHTJc6kvFzX3K
 5ipY2jDPJzIXSmGagx9AWI1FHhtG2IxtoqtDj55z+U5x+TsVvRDxWtPat+tUKN/pg+fjXZ74fcs
 IidJIw2KqgCIst+9izadGtt/qtFBU4rGnuYik1HKf2WAA6hBAHGvLzJB0KGRoKsBWYiOpGMQPSc
 Km5VBI41H20yWkFtokdNLPoG91amgiTl+oT/q2IoK7wHNS8oMiY9TxsLzxoQHoOO3KUzbAysKHX
 c4b18jRl2TDFVHFnrAQ==
X-Proofpoint-GUID: -V6Z3oOmZmG6lVZgPnjBqDONTKLhvV2i
X-Proofpoint-ORIG-GUID: -V6Z3oOmZmG6lVZgPnjBqDONTKLhvV2i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX5tkPDggqDXln
 7vySYuj5vFOPI806mtD3VOqQGioRya9CPkFn7Le3Tq08kcZ9Yrrl5/TfaJdMqbVSEWEMmRKopzc
 sNJKU/51sdJBkURr661HcoRziG8kJ+s=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1e42a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=t1DTHQtY1fS78f0Aag0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 7:20 AM, Abhinav Parihar wrote:
> Context bank 9 is reserved for secure use cases and must not be exposed
> as a FastRPC compute context bank for non-secure offloading.

The lack of a platform name in the commit message and a split over that
suggests this is a universal truth for all Qualcomm platforms, yet the
patch only limits this to some of those who currently define a cb@9.

Please make it more clear which one is intended.

> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.

Ordering this sentence before the previous paragraph would make the
commit message read more naturally

Konrad
