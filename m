Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811451E421
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065940; cv=none; b=NnPzdmgPuF44AtJj+U4Dyn3gTjOfAg5AUxndLEWimzDsMnlGw7wRIWbbbEitgHz4QvdKYCZ8kW9/HmWRFxnZVngrdnx3Z052m+iKqnGAToefIMJsPo8pjyFE/DHS8h/02Q9rLwBCTVxXLeb15jx7Qns+2hDZTlLUBJNpyZ317ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065940; c=relaxed/simple;
	bh=M/RFP3tW6J/fH2HQRESbe9xsyMg57bApE1n6BVIlfeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHE0+B2/NCxGevUaqNBLEZm97t6C9Eo4v9ONWyOa18Gli5BiNtIW70eU8P5Takd4EisUN76p6N9C4nz5KJTDjo7obcmx80IAOH91funJscwaCexW7OqvjHpJn41SS3Y+IjoeD5nx5jJOCZ7I/HF/c0iMNMss+fRQoCenvf+4/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mv+FzTc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4Oe5Esg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv+FzTc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4Oe5Esg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kKP52999352
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=; b=Mv+FzTc9WBRENdJj
	CIJFc7nngedIb3QAP+juJRAhYYpa8IcUUXvv6KxJU121fyt9/VRdRyvxgNyAw7AA
	Pr7ajw7YEDcEZ6DDBRZvSitsvLGa/L27aI9yNLk2vsvhEOsxwLmdFYlUsriFupxD
	PgKr1kQ8NnUrUbSQ7JLv5HluUsCuX0JqGeVpnouK5FytYjKNLOZjBG6rpcLJqzf9
	I2KcBCtFlzaHzF5hZD9pQhbocrBHOX/EPU+ConMpljdRqLp/Z/krmb6W4bXw+tdu
	d7a8pVPaG1K+Ktbp6WoV+uHRt/pKEsa2SGzE2b1U2e0Ybu8DPr5Xmi1/kPi1t/Pa
	2gnuDg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0tmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf97f74492so229279137.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065933; x=1792670733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=f4Oe5EsgJ+23cnSujMEWwbIKb5IVFS85XBSPX8LZZAiD4U1yzHsF0QFp0kGMByom+S
         uNytV9nKMllh3ed8lHZdIM13kPRXNxDLe6LCcEJWEO+bmDHh57lB7cuypZsCtHtUEHhZ
         DwwFSiP6xYGERwaIKUJIbGeEqPaRWOVm0VRrwcpaf66/V1wNr2ElHtTKuFM1AixMltwI
         0uLHVW+qP2iIrN/yVedjokJ7yYDz7wrZi9lFguBpBOqt00sgUu1EB3F0FhcU4130uWDs
         HSLUkAwuy4jI07lc/ondWYhsJm4gNCsHghO+66KBb/IwB/Igpdy76uc4tUAyFEohA58F
         yf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065933; x=1792670733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYMJmSrKt5YKPWIjlpPH4itwH/ualscEnnJ/FVlUqQ8=;
        b=PvnJoMvRi8CUIMXJ4BoZRDcajtXMeaPKYunGAc0S6cQqtpVk1NXkiGRHs87govnGiI
         9UnNAc7Co+jb4ehzSTAcko3nxIQNgM+joQwXMN9XUNKGx7xWTP+3x+zzUAVOSofADXIF
         kHdJVS9qRpnN167egczR4S5U5AfEtKW8Hl+MRpsGUvV7rkxixw1alny8293YNH410gM4
         qhkAULGm3OMuoOVM+pkSyHvVU/QhC+vLvN5HrfOrgCYNPXaACmTXXcoHFnAZn8FJR9sN
         MudCQwYUGIGaE6w/vTtnF7/xCIXMjXlDOuo5yW0ka3zURQCVw2KkbKmAU1GWE8srLah4
         1PKw==
X-Forwarded-Encrypted: i=1; AKwUvBxUIAZOZWEet1Iv+xbh2mvGBpxOJD0aQJIBStpXbMcxIm0ux6oZ5woDNGTRMaCKVBM4UyOt9yre5nOT02U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLElKXvFMFP2/gHD4DrZmYnpXKZloXWLKGn2J84+D4otVgF1YHk
	Mzb0wIxPKHyuR1cbA+DBFvm7ipOQFpCecKlfoP2XPUJf2CMLdTW0TNJwqyUQ/y40TsfdQ7i2sZG
	2caVnedfQy8GL65PZKqbSviScC7j1CtByRR5Rk4+Uyb8VFsg0lmOO03DbFAuej3zQ4zU=
X-Gm-Gg: AYBFou2XAB93n5+ctHBC4Oqwx7td5WWgiqjWiXv63bsDayyOGfQ4lu1a1psPn5fo8k+
	94u5BLAVX5jMwqqRse7MIKIsZAVN7x3CjfCv8pQZ6hlcaP5YqtrV0nApwaiksex8KTUEN7rfD+O
	ggwEzJfRQZQc1RuztBNNhrDZoyvJJH1vYOSFTJ4Us57xn/ynKamLJd3bti9dI/HyhmjbP+4rghe
	Ou+C32B0sSpeWOE4xbcs6aynJQjtKxXOpBTOXidUCVeub8nC5QvGNH7sUwX7EWRDJbP0pm5NDgv
	s4f4tJ1yw+Qta5+xsSP/YRQ7fXfkKC3Ew8/hs7mhLkvLllHewB78z+NyTTzpEDbRQ5mwJzwfgLn
	lPxpHNNc+QzKMgk/5/3KV8Q==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998252e0c.0.1792065932668;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3998226e0c.0.1792065932228;
        Thu, 15 Oct 2026 05:05:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm2510539a12.11.2026.10.15.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:05:30 -0700 (PDT)
Message-ID: <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jr6x-y52U9aRzGPNP0ZtCmyM5nr1Wr5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX2vGvWlL/zIoL
 uRP6CJyBY7xmCWNrTgSeJDpyAikzmi3lk8OsgOuLIuaFnfLFIL2/t3NsNg5V5aSCnFIA+UVfSGZ
 m5ecudjspv09xqwwDQFYUWSOufT5jzDn4uLBdQ8wIFgH9aCzMuhQyuP++Pa+wtCOFPGNag1EZJb
 N3foIpn4QZqBS1+rD7HEHHnmOk+QGG9efiGPv4LqeaQdiacpl3LUq0u880wwV5i82vANlmreeJI
 F+4SFa7Ed7EkX/O3W7q+v52HZgQUmZkkecKyTtw2nvdv2g1Yt9ZP3CjEj2bZlpMXUZEGlTKM0z1
 cWBkcapznFagtshq1R2EJKPJE/qGQ/cC3TUSNkhSoOwj/JC+hVEUFTfEMT0jcjfo51k3HMuu9W+
 8WjjCH7O6yIa5PgbAfJwDChMyFY7LK0eGhTn9bpRhxKe7v8TKUvX4BwOSqYeUzIHtAm6sh2ivB/
 8duSdxoXgEsKcnKqQLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX7NrZ65sN/n7C
 BmFoGu8FVAjg6JPRor1imR3Ius5vEY6hNwNolI36i1fYMiCUSg4vex0Mz4++6QNL3Rt8FIYUtuT
 B/FnI7Fd3eW9wmxpIiUNc9moyKQ6eBM=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c18d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5QhvE01mUc9NbrqAj7EA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: jr6x-y52U9aRzGPNP0ZtCmyM5nr1Wr5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 4179427f3891..8b1bbb4052a7 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
>  	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>  };
>  
> +static const struct mfd_cell pm8008_no_irq_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),

There's no reason to not register the temperature alarm driver
if we don't have an irq. It will not be able to carry out the
"alarm" part, but one can still poll on it.

Konrad
