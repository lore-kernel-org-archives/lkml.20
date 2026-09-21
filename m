Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF43C3F60
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980988; cv=none; b=VvKa9NTW5UfHzvTLy39EEjhL3BGrPsYm7q/N5MZZididBRio+cX3oB3iYoUltazJN3Rn+8XfZj+MtVZUZACnJZZe8tvX1fVqFsypDI3qIQ+Gswn1xbhBdxTWPyDC2O/YDR5MPd3bl3I16jZsDvUY/9N9TpJ1mWqpcj9CFmrRe/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980988; c=relaxed/simple;
	bh=7XZtEpVGtm0f+NlP7kgan9JKIMeO+tGJEksciTcdIak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n23/3PT7pWTjEEXmeeBC5oM11gcrt1x3utGKkwPrBqEA/RaAnMnAMp5jLlwoC6Jrzu/23I/CkfsSXDTqGUyw7FFszojJPZbcJu/yNpeQfnvqZR3PXUJBHGH5YZSbhV6U5gKGbRDCYRgBNKKjDckuyn/GqHYSMiTlYOihDAdWOow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eug0UsD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhTom3N+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eug0UsD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhTom3N+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3wE957101
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=; b=Eug0UsD6aF8mmSEI
	lGzCs/BJ5CwzaeqWXTm8P+m9Lf0/KN/MauSL4S3Ro6cMGSBKWtDTulzbHM9Kd5ez
	XI3bMCaUn67G0O/xUpSRRkkXcB7zf5LQt4Ls2HgO8nrEr03sWvJgPc557nfXaABd
	q17cKiMCWHCV9duhmpta4IIasRtasSkaHJz9s+faM2fj1Ueg/96/XghIWbNWOV9+
	rxZ8YrfBpJYeLuH7PYkWscYjIWUEPZYwjmpQNQgj1iPAakXp//WejaFPaZtv1KSK
	mYGYJJ2N5m/kPjZwOUqAxu/GJVnheNdUX9Ewt4YIovUyxWZc1lksFHGdI1c4QgmX
	xCkFPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0cjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:56:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939fc317691so108055685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980985; x=1790585785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=;
        b=FhTom3N+Kaj5f5HFXTBK37X5W+OnAlSmlS4h3Ut1sNB66O6fRKPaDMdMmWogLVClhN
         d3J2/NDQmyYfDM7FRH6yxq69oPmE/Gd/Q8aiEP6pepkKw+zwSop3s27L+690n0P+gHyV
         y32VjYG91qGtK4p3NgujLu1rQP9yOUWc7Vk9o1U8zx9MLBm3ws+5N7oK2mZDQfMB3oxc
         8pDuhY9rxeqb0Sm4D4Oevs8SgwpAXzoq9vmpXX69acCEfoHcskgHW5+jP2xj2nkCzfu8
         aKEaTAltK+Ah1fplhI0ViOWITMnjEBIhPs6J9HA6uZLW7bBOToCLepXB/u1nZI3f+GzV
         4E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980985; x=1790585785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIj4vi2FLq+WftfLVun+oqSNTJc6FU2XEuQk79/a7hM=;
        b=F4xqFrpnZNrh/CMwo3aTL/nmV8id73QX5WOQ7X/2+WuNSyddv/SAgXZ6IUa75NKSu4
         F5msfrRX6aNT4S5pL0BOIhIENZ6Rcnh7Mt3xjcxYDreaLDET0Y6YQFyhBdj3x7NO+56A
         cOuU1sf6EABWhovY0vZhH0/V3PiyH0zHu00z/+QqcYxkRIAALfFCTB7cbty9C1cLONTC
         F1VR5QwMKmjInAJYSAU4f9WXxK73jAFSMGrUi7DAyvS80Fl+qUbyr2l+XArch8KPYqV+
         MR9kbOlJ75zouxOCpjwdJccxMnnwGK2jFYJhhzQyZ3fUegg+9g1oyE7aDVk2N8v/AGfh
         r3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxU2egpy3aMKu2Gz2YckIirjCeBk90+aAIsqtF9BHCUYV1kOc/bZntbtYMVajtgLZQOjguKaSxjtVDQ5BQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ko5ygdPoUfboH0WYBgF67C0iQh7RAHeOxDdGgh1aQLIi6BB5fk
	bUmSJJCoZONeNi6ThPtq/5+rQst3SsL7+1kY9jiH6JSRGho/RIuxXmvGxOmb75hRnpqFTw0buN0
	WdsGAcQj/CuXRCdxYYU75jrCGzFbH5WBrmn8F7fuaa031C1KbeS02c9Zb1qfzKsB4S2s=
X-Gm-Gg: AYBFou3o2Kz/oYpz5IdPzmqEwxA90wg9UWdWZVAeUHz6mxuCgPqqbRjFp+xZS7AaMwH
	jN9d4avro7MDKRABm4qNQX+q6JDl2bPG075peg6YI766rJcZU2jzhMyiiKp7gOGDdUOdvIWhqeq
	o46GgByEasHv1AP6UIrDWu47Iqk8pFlWpVqggapKmWz7bFHIRRd7neXDAL6kfURZghWvkdmNfA7
	zntZUPVZRR2zfCIbNSJizXA3PZdR8CVZSBpTdS8xurcBUbPIF6IhwxsULktY1DJCPfzNPA16PfF
	YQJNMTdh7y85iOq6VW/Hfki0b6erm6kK6plUoOOADgyGUe2i3eAsjXkYPdOZj+eA4l52CVEfGmi
	7cYH3+N5DRB9tYp8EN/3qTw==
X-Received: by 2002:a05:6214:8611:b0:912:1b54:a4df with SMTP id 6a1803df08f44-912a8065a95mr109634526d6.5.1789980985317;
        Mon, 21 Sep 2026 01:56:25 -0700 (PDT)
X-Received: by 2002:a05:6214:8611:b0:912:1b54:a4df with SMTP id 6a1803df08f44-912a8065a95mr109634336d6.5.1789980984943;
        Mon, 21 Sep 2026 01:56:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dbaf0esm3980740a12.15.2026.09.21.01.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:56:24 -0700 (PDT)
Message-ID: <daa5e0d2-a12d-4eb2-95f0-54099e7c8334@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report capacity on X1E80100
To: Liviu Nicoara <lnicoara@thinkoid.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260920193402.2402-1-lnicoara@thinkoid.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920193402.2402-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -DWwAvVffI7JeVzotbBB5tZ_yoxpcMbW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfX4O9ASCJ7bR6o
 +ESGBjO1ElZpVO6P1SKrvgoCkxwonIyJ9JfxjIqYTriOjqlNMGxxBV5ukAfhS1MaAnhI1xH6f6B
 Kv5A+k3gH10VuO80fC8gqZlSH/s09M4=
X-Proofpoint-GUID: -DWwAvVffI7JeVzotbBB5tZ_yoxpcMbW
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0f139 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=9jRi0BA2Tx-rpvEMm28A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfX4auaHF+WkG9s
 +WMauW85SC6VzoLmIRiNu8aDSyg+QfhJgXUZgRvkIf2IfGUf9XhLZWVGoAVtglPKFZHUdwK+Hhd
 DTnI0XEVHHnfgT8uRd8eG6pE+cFg9ZwVH78UAS8XJWDRHolpuiiLnO4Nfx2LcTAK2cZ8qW+udFt
 b+eYXrgs3dw95nwCfDIFZRrKT8tMR/68akCQowfj7hwYsI5g0NO1WhwG/6tqurxaXlWpEs5ro4a
 eMDWNhz4BwaboMaKp1JPFlL+Z5HUDopaVRftfyBmkbhGoX4g1PS+em0gHzaMcJB5apMiADn15Wa
 BhrXkiUnWeEfZiC0zd5ur2aj9L4GjmUFbZ+vTRQeeTzaSIY+0ReaS1elwANYtGu/AXIyPBI6zoT
 F/mZFXyX6hPJTYgyQr+QKWLFe/cPLJdAEkoiXuBQu9NtbePVC16nXVXgxyop+E61f9tXNcp1rCJ
 b32b7gwK9neOHGAzNag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210128

On 9/20/26 9:34 PM, Liviu Nicoara wrote:
> Commit 3f87baacea4d ("power: supply: qcom_battmgr: Report battery
> capacity") added POWER_SUPPLY_PROP_CAPACITY to the SC8280XP battery
> properties, computed from the firmware's charge and last-full values.
> When commit cc3e883a0625 ("power: supply: qcom_battmgr: Add charge
> control support") later gave X1E80100 a property table of its own, the
> table was copied without the capacity property, so X1E80100 machines
> expose energy_now and energy_full but no capacity.
> 
> The percentage is already computed for this variant in the shared
> SC8280XP callback; only the property list is missing it. Add it, in the
> same place it sits in the SC8280XP table.
> 
> Tested on a Dell XPS 13 9345: capacity reads 94 with energy_now
> 52640000 and energy_full 55540000.
> 
> Fixes: cc3e883a0625 ("power: supply: qcom_battmgr: Add charge control support")
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
