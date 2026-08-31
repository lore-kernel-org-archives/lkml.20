Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B03DD51A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165141; cv=none; b=MBCGBL0626Lg57EM920jLvRR7jr7wn2UqUmSParBhVCvMzzsMpXMNRkX7fnnfYP+qeo6GWWwSHdweS8sKXX4qmp0XJDASA+KM8SlKn1jTFKfnpqHJ4DSZwqGc7geQrBSsvffyHtb0U7jiexGnNWxf5JzdHUTMs8vqSFxOYFrzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165141; c=relaxed/simple;
	bh=3NMhs062UZc5ILZCUDGGwskGdexU3XUISRbyOQx0Kjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hehV8Vqs/p2u3VbZf2eiz8/zpEtjhSDW6MvRd4EwrYA2jC8mchPdZafKRQ8BYGVcGZyjgSZnVVer9v1TzSFGHJFoY65PU4hIL5WqWy5YXkOmMW4K5pUa06+UglySfxKGVa4nDpVgqOdXXZz7BRqCe02B8v9Gc9e7+B+NznHwZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSda9+AO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjIHDdJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSda9+AO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjIHDdJb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V808rK3086100
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIjgpRirezWVl6oxXv0vSkqQ
	jd5sysrPBYUj+0rCmUw=; b=jSda9+AOyPQdAL2Hu8VcVeFIKyV/PQsD7VlgE8HI
	J6CfaNA822bMkV1L8dUMnqz4ZHLXkNXS/Yy3vWCeezSa5gqxqHQcP8a6MDoZoihG
	o5ShfvppJZli94Bp6ub5TPB6IjOVKqJ2G4sg0nnyiUeBEViztQiMIp/5xxYJHKjt
	jSlUzaX/NgZazScYGoZP9kJTfkcs47pMaXmb3trHnQMxEmkcbmvFT8D26LeS51Pv
	0yU6jmscUCc9Ds/oemLYs7mGa0F/+8SOssU/gTe3kI+J0/LmyiQhJqEwoV3E/+Kt
	l2TRuOfrPLyI7l/a2l2trOXP2RSsR/VHunht7I7MOkvMdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwdh20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:32:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso410803285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165136; x=1788769936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIjgpRirezWVl6oxXv0vSkqQjd5sysrPBYUj+0rCmUw=;
        b=QjIHDdJbxgkDrNbCDKIjRFbKw8JsBTsin2CSW7oRFjz9XXdVbtT7koPseH0oA7y9Ho
         FDF0QGNvfWVwEzxYtMVCao7T6p8fysstZgzpuHjD13N/LnsOyis/WxtQMvTj+LLg7Mgz
         GBf1nw56QtIhP8tOI38LiqOxVRGWtvdZyLjqQlbzOASWDv5Do9bBh2+RBVM7kSFUcDwX
         zDBq9eHCIUDLG/vqCZk/UOsJ86i/zMF+q5tWENQOcip3iIiodFIlUl0BRwK7Wejq0JSr
         GA+YaBmrVCA5k2yElU8CwlrB0A6+OfcnGJDY0v/OR1mH6/59Zr6RcguOBoERPAPNaQKg
         ROAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165136; x=1788769936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIjgpRirezWVl6oxXv0vSkqQjd5sysrPBYUj+0rCmUw=;
        b=N0sWNU7H04EZyNJp82ALQn19yScMhjv3nAKHSU+P7NxXxy7lB39vSkxfniozrpa50B
         BXqNmCCIs+bOxpCMKFJpmXH2V51lH9fZv9Z2xA467MITi52crRcNjLuzRJd8O7mfi6TT
         2QOJWRpPEQZJeNHeXnz5Ela6YQXkGJCqmoe0f3Len06MbxnQd96v8WKbMHtCU/RigpRJ
         Vpm/YekmL0LSj2HEtT7JmTJAtkxHMYUkXUFHCg+9Lx0fhDcZopO9ngKI65nNnj41ng6a
         Wdplk3GX+pIPCtGoIbVuzXxRjtUDMWlsWGoyxbCWiOqyjWEW4feiLRcLcRoJDZ9KNlYX
         LglA==
X-Forwarded-Encrypted: i=1; AHgh+RoTsJ6iGFRN4dxxsjt9yegPHcEUTugZ3jHHdNwV3JdMhg8r2XAHzFsCLRRqoNuMa2cq1WnYpAK0Pd2S0PM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1QAMcgsZsr2mf/+95p4hGdoT1WOXZCEguWQsXsWIHxMaQXQtI
	3fN3MZCtUtEgnRN3aoEGpG2nJVWdKlACcXyUWWkI3yC5XEug6gkTL6BAwtYLg8c3iFB4KZQpRri
	6ydcVcr5+7Cumqi+vftzCdGQ6pYUf5ytFZ0J7G8iMVpNyw1yrmfos6zp/5I9imCSLxEc=
X-Gm-Gg: AR+sD10xPm7q5lQEszjrbP2teCQfR2pYqL1Wypa3S1GOb6E52shsBumCLtUob1hIMCi
	FIszNR0K+ewNPm1X2nXG6J1wIWy/rUEt845IGT7TQ5AsxEASMwHmLafcMkfuiQCgNXw1tvrRd05
	gqpbVd/zU7r9o6ZzSPXJbGsbkZECqG3T3scpuF5TGc4GBTns5f1aZSyT2JMnCZmeRVz+hh8UjzQ
	OOJKdUkdHl5xqMS78FTPF4Ld4yXGGVU+EmQ/V3P41mYzYOMr5/NgQ5EABmm3WJHAswXwSFTJrCs
	Qc8SRwakIFrXHTb+eoH96oSb6+zHMjlkvLYv0+wUrhjJpm2EXYyvQvjDCMmNHGfimJzjUvc8bOD
	gwOUY7ygMfYCA
X-Received: by 2002:a05:620a:9496:b0:937:7db0:409b with SMTP id af79cd13be357-9391396b3ffmr1959343985a.35.1788165136541;
        Mon, 31 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:9496:b0:937:7db0:409b with SMTP id af79cd13be357-9391396b3ffmr1959341885a.35.1788165135980;
        Mon, 31 Aug 2026 01:32:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm311240445e9.10.2026.08.31.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:32:15 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:32:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <hjtx5ingztc4ebbbqtkxli25ula5ndvrivzmvkfpighyys3ume@k5egfu6rq64k>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-GUID: QabHLmBT6JDluZBqqOfgc5VvkebyuRit
X-Proofpoint-ORIG-GUID: QabHLmBT6JDluZBqqOfgc5VvkebyuRit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX9kKEo3xr9VJ8
 p6vg1w2Bnab32VqeWJi5TRsPaQZNO/InM1BJE+RSFcTkrqPKJjT7iLwQOL4O963TbAHaaFN0YLj
 LVBzzm1uVY0BGEcqVHRHWf8V4KmsAHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX3tt2YBB1YwIh
 y3xsA+NP5cSUICvjYeAglsqMJVnVpHQ7Ft2weZ67coAbS3lW+fx/IMxG7+a04TRoyrD3FQ8zwq1
 jfbsdsHggM/IKNBYoCVYJHW2CKTFklbXD/ZgFm41S05qKsMgM28bvlDMfqGqh3WHlPkXNOYgQwh
 FaqbwA02SVzve4vQLO333Fwkq1fyWLgT4ZDgom2Lop4o0x2iHWD/GtV6NzwbYxb9pqA6adTxUHG
 oiV74U53Stb3ewDO7sCZnWueGmX2Xp4bZiso60iHm1Pk9FsXjLB/CRjgGda1Y8/cnx5uyhu+pW7
 fKP66Gkn9DTwdGa7Dz+JbbV1cNWITeJ9T7TNJCDPF/LyeZidcZWue506Y7393lr2fYA5jQSa45H
 d/3ApUAiHMpYkdSf21F1ycxJk9f4XfDu40xrZ7JsSb0RkrDtMhc+z7AmMMiHGDSN/WnCzmTYDhn
 7fjiZC/sDOfUmw4Dt2Q==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a953c11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XIS_O1AsPdluS6PUsbsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:03, Bjorn Andersson wrote:
> The "limits" hardware performs rapid thermal management of the CPU
> cores, but during prolonged CPU usage the system's overall temperature
> need to be further managed by software.
> 
> The reference design provides seven "system thermistors", connected to
> the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> thermistor", which is wired up to sys_therm1.
> 
> Use this to throttle the CPUs, in the same way that we're throttling
> previous generation laptops based on "skin-temp". The trips are chosen
> from those existing examples, but are comparable with the ACPI thermal
> policy.
> 
> While not used for cooling/throttling, also add the other thermal zones
> for temperature reporting purposes.
> 
> Enable thermal-monitor mode for all 7 channels in the ADC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
