Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BC47884C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394282; cv=none; b=g6i+TH+k2A1NuUBhBM3hV19ZIwYqwEZXLBqL794wGoKIceUhEBI/LjQvpnUXTcaVmY9cYD0rCEFDiIMoYz9VzTJzET7o+pH+3q/0BVbIaKRSqAvKusgxC4jnRu4ktFVYeJimcp5WlJkiKgDbbunvENmCKRW6nS4c6lsX8gbupCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394282; c=relaxed/simple;
	bh=SSzw37uPyUBzK4symbibfbsydQoV79qGPTLy7JGboG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+HpJuTtO9aaXarTu9RpubLh0Ta5c/4laF9EQIKS/wevB2++o4N+zTI0rN8gc0T+XaTr95G4B7X4xYJmui6rKqVg+okPZmME5shPTCXl75ANpRmPePIh4JWkZKMQK083uub/YA/DhwSQCdVBfu+My2P3dHsIVWwdqtEpSNp6VZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuL4Luyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M05Xtlt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuL4Luyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M05Xtlt1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Q8D1761277
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ybeBgW1DRfljN/hHqPg/3RUf
	EydRznUI3MRI0tnXw8k=; b=XuL4LuyysQPtYpaZHcgqm7UA+F7S4/D4LFRJXehc
	PNKvvFF5QZ8UZ/oLdHpqlVwLtHkOr9DM43aSsH0Uw+5PhWgh22ECFomy/snX9uil
	ybxzT1jeGGWggbT744DFdXONPwNwJCjVqu6I858FsoIRWRYsoGtAIDmf9feF454b
	5ups6Cp+RvvYCLGw8VawZiNB7jovK5GhI34B1ur7Ia99I3F7cq1OoTL1nahEpQeC
	A/mbOn1vlYe9+uAoiegibIWXXd/mlOcnkGuKqyeirflD3YC7HwA3XncRyLtjxW0P
	FAdUFDiJqHK4jrVY3fDCvCv4Hqke8d3tnwxnmImSLJMJuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8ywh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so862876685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394277; x=1789999077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybeBgW1DRfljN/hHqPg/3RUfEydRznUI3MRI0tnXw8k=;
        b=M05Xtlt1gfFJvunlTMaGSGU9rN/T1me+0YXvrIx2nd6NYOy96OCcjMEjTNZ95jPYgy
         yGL8DYWIzbjq8HKzUww8cJEnmDzE0wg2M8on/34dZZh1XzoR2EcBLdyxt3aeObo2GvhL
         4eOsjad4Od+0oDoJSoKh9TSJZj8Xk11wpWu55zyxqy3TY2a3ev35zAV7OvVt/JPGMGhY
         C5KvtGknugIUmCpNle5J5gh0+BekPZzaIMhOqOcD2417SJrAwBS0ho4R810EIRA5idN4
         8gnleWSdHgh3hNDRHc1yZSqAarQPAio1Ce9dzc4BlI7me6rIAzU++9XVR+GuzQrDBQxj
         anWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394277; x=1789999077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybeBgW1DRfljN/hHqPg/3RUfEydRznUI3MRI0tnXw8k=;
        b=gLa5ajYdDgi8PD2d+yiy43hfIotPu14CBlL7Ib93OkszXbIxUWUUo74rBpmtRYppB9
         2kvjhzvZsJvvYSMNBE6OOgJGpr3ut+h3hRQ7VrUYuJv2VAWcmDYpSXNongkT6ta5MVDl
         BIsbiNCTlkIkohw5zsNq7LSOaKZvM7ykqntnNiQfR7y6RUFHmLrxiFtT/FWm+tVpRNwj
         uwPboSdlGdT7Ytgzg0PD5Vx8BoAEA4l1T78w2w+tdEaElTphw41gfqCuZ3xrRdKLSnKv
         9ABVimtc3yTrmcm7lXXnReDWfaOqhXVYOQoac7zy169rAPIgeF2QRrIQWRyOoNmT3JVh
         wshQ==
X-Forwarded-Encrypted: i=1; AKwUvByJxf/SrBNYstB1Ydlcl6GRfDkdVpwLx28v862ISFIzgrfsRheaOAg2XdL4/He5uFm9DBbg7JGx28miP+A=@vger.kernel.org
X-Gm-Message-State: AFuF++kdQFQ9NnkOvfnUzekOWdU8UdtdTRgahvEB5kXOzYoQPmhLCDKn
	uAACQsarPYHeF7MIC5nKgGsGqIKD8ZcsLK9eZZjveoMGVByMJ+BBs/wlo4xrDAIyMrE45BNEzAn
	bcAdTPJc4UUkQ9mmTQrUxEl7ndBkf3ydP2L0pI6aAQx9FitrPcdzfbk8U3zqy/pnL+Ww=
X-Gm-Gg: AYBFou1Asd1NARsTLp+3WBq4verh1A3fHGicQS2M2eToCTkPPO6KgkfgrZLYm3/RFbQ
	lzuADLm8+APC7XnA5hxeMylDyUoRJLmoaBy0rWQCsLk53hogjRqqdFo97PSIesa6cM0TqVwnhLn
	FlU6BWkKBMhpdlxG41/hv/tTenYMfUU3TZCddoBoRp9RQ5OkgGKPx6c1pQY8wBdTa6RUB/km5H8
	ezE5EFkpOJLMheQ6/ItrjCIuJijeq8/4IV4csMqxWQYno3JCigL3A5TYz5Sn1RbPJrvG+yOTH73
	70+G3lkqbUGVDmughreOBQCkKtJW/DjAL/rwiBu7oUWC3KOEBJWvxMnVhpXdfBBBA54RRl168wD
	hayxr7GYhUxHNG7k=
X-Received: by 2002:a05:620a:4455:b0:939:e6d9:b2c with SMTP id af79cd13be357-93a185cee5amr690034685a.16.1789394276833;
        Mon, 14 Sep 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:939:e6d9:b2c with SMTP id af79cd13be357-93a185cee5amr690029485a.16.1789394276291;
        Mon, 14 Sep 2026 06:57:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm29302727f8f.12.2026.09.14.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:57:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:57:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Message-ID: <grb7xcymwmok2sa7364tvgao65awjnpklah6bp2g43tzwptrud@in6beuu43wzi>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX+xSqMxScj8h4
 zDi2RJH8D0wPyelTkIeMK9h4eO6qzE+FgZ6ZaCCTKE4gWpzySqbKJrwsoi5X1j18pDTJqc0Nf5O
 jy1zXZzHRanqye0wsNNlPPuOqV4EpGTI2/4htP64woYi2XuTE97/IGnMPNIEuLyKExWoxFnautt
 Ocn8ZxekwKlKrviPfw328Wweo7fRjSL4TRADWTdJyTnu4UPF1z4UT06Je0ddfwp4poLZUZtP/iE
 ikuHvjAAkmVkSFHrO3m3tOd/yIm6IoaR95+5SiQtTYNOPl30PWlFZwrJcBpjjrdL0lpiBkULECL
 wXY0blIkK9lGQkCCBtpzddx2wXbwUFYKyM8btwYaU50Fx7QK5ab8dsXS375Z57A2nRHZYl3cXBN
 P3mbMZOfdUAgNDhHBCDEh6O9xbpbDJth1jnbcpNIfr039Ku/2zJnDnuMA07kAcnCftebQZmF4wO
 5vVWJuMNtk6ZWgf2nGw==
X-Proofpoint-GUID: 0TT66eWgGe4-IRF7RAulfYxA5ZqyIvHk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX6kbzbgJs5545
 EKMkTi3yvdxtV5Tmw4KyQIbxsl2JwgrOrY4RPY9O7tvjWSDDXsXMGzWVGXsHJcg49qvAUt/r6Sq
 Mqgl+9DUJ20yRBqAj2hNRYYfLvEri/w=
X-Proofpoint-ORIG-GUID: 0TT66eWgGe4-IRF7RAulfYxA5ZqyIvHk
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7fd66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ROH9CGLlMB8Aab1TjTUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-07 19:17:54, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
> present in SMEM for Shikra.
> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
> used for subsystem LPM stats since those stats were populated in RPM
> MSGRAM.
> 
> Here is a brief summary of previous targets and their stats configuration,
> along with the drivers used to display them.
> 
> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem LPM stats        | SoC LPM stats             |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
> 
> qcom_stats.c supports both the configurations for shikra, reading subsystem
> LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.
> 
> A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
> and vlow. Add shikra rpm compatible and config to read subsystem LPM
> stats too along with SoC LPM stats.
> 
> Below is an example showing LPM stats for "apss" subsystem with this
> change:
> 
> cat /sys/kernel/debug/qcom_stats/apss
> Count: 2192
> Last Entered At: 5498618336
> Last Exited At: 5498708046
> Accumulated Duration: 2046572620.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
