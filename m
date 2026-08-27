Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD348F82E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849090; cv=none; b=UqgXb4mBZ/psSlKD+ksW3BsGhVJy2Twh10UyUlUbKYOJ5N340T/U5xjzkid4GBtC4RFoCM6xoga7bw1xvz6q2Zl19IPYgKRm5/y8/2Rb/41d68mSYWCzrUfvqTUNByAj27ORtFLIS8pC4P32zDjkX4wJqZfewNk9FSeNuAnYlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849090; c=relaxed/simple;
	bh=LIWudmjBuuTC7oQDej8L1/vHU4MkvFeRxy+wdt0a58A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtVH8qJN7BVNuUuSjdJ8Iqc3ysf6cw2HqvU+HG7xcii0MuoFI+M6IHWTRefXsjTqTSrXxzJumKsWzKhIbhjdIx/TeOKiJSydilcRQFfQdfRV6MiMG9++n/zKnV7pVNJ6CUUiKxEBremuWWikEwhQX+NPB5IPOGvPQ8gxHPACgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZInGT3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6nHE+6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZInGT3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6nHE+6Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFboHj3829616
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=kZInGT3ECVzaq4wJ
	7GaKlLA5q37fgPbHoGzEu4Mzmt4ATXsuzcwsi8TES9wCtD0j1eBYIgcivZQEoZpp
	Ve2iKcWNtUEzg7InLKOjjDMCuxN5NHN4JcoAC18N88LJ9tYPljPqmcw6WcHjt2nB
	smvuMotesHkm38LDuub+IxbwDW37/PGIMn3WagVIytlAxv1uhytou1C1H/fUyxm8
	xb9CBeZHGfoZO7QpG5vxwhhpLJkDreDDgvWTRZ+U8+XPw1bsIMbyaiPs5lDJHL5l
	V3yEw9B/+2eqDvrkcY9RorKG7jV5Q3OTioMJGsFgedg62K5FQGcDe21P54hKrznC
	822rRg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s9yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9f6a49e69so200393a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849087; x=1788453887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=Z6nHE+6YWOlHBfJZMuLMCGsxeBwSVzNnDNU6BoV7VPEg+vvJ9zFMdFRxvx75cslKa+
         jLkz790Xc8pglkfiaTDtJZAxIpI6deV22AHtaCTnWISk0EjThyDIUkGQcW9mfokIdEBp
         U6JJdUD0mcwRYltgnV7nptD7RfGFBlxjbza3wHFstfQLXQL6nnYajYHtWisNSIfDbK92
         GOiJsa0QKjANFoo4WAW9V2vmD05WqT7so9HuPQT6s6wIKPs4rDBkLPyHsKQZB0Td9k7c
         ykXfDGu1zp/W6tBOW4teFo5KBeam3oRCUfN5lEj0wDKwFlXydA/1xLz79CwaDucDILCQ
         ZY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849087; x=1788453887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=ZvS3K08/77mdeKpONc1QOkbDFczwTHKAyOEO/00DyYOLvWb+uqs1Otv+QRwUrayQ5L
         LIF9NnpiZCstDLtDPHNuUoMwpo3Gw2n3Zp+mTyXyJ66dPHyr5PfBRtT8HhBWyHH4kUzL
         Qn0XOgikf/3Ut1uTek4xPwfC9CxEWbUFsTIVhVpyurn2LQgoEEklp0oMfnF6erxtwCXG
         G4scLsYopNQoCnReIIORim83Vc6szkGpdEj+OThwjwajy2GSBIVKQwwhZrvURgbQfeYi
         m0aR6o4Ewy9h4st2VS8zt000LrXxGFgt9DVCT0s1cEC4Z1AkIAYpIymFJgBLQHDkEI/O
         kEgg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3bAlJVtVdFDrap0ReugNgNtiPoKYXeOMV7/F/k960zUJJEVh2hGFYAql0EdJOS0nwX4kEJ8WomEg9klY=@vger.kernel.org
X-Gm-Message-State: AFuF++m1j0nXCv6u100KlkAGUC3dYxze9HoJsfVwW3OULEHKPXEnyFiE
	4rm/k0ldhpWuRgaEOWFbK4iAhc8PaowAZytOK8fFfsp9ThPjIRlS+xIpMETKsWuiSWzbxYQE/cD
	HQKrDvliNLN1xekp6obFOVYzGtiPH4hBcZSgywejR/CYo+jpYjkdVyLKlmkE7NQDPZWk=
X-Gm-Gg: AR+sD10pXwxfjrRoWEzFeyEVDJ4apdIamku9BFfJa0mqY4rec75Y1LAIiUqgnPYw90o
	l33pUO4M/BdyUWzh6nH4AzBx6KKCkUGSIYCMmGWTCuHr868R2oWCsrQAt242QTRu+sK9HO2TGS9
	8WJeP0Fiw1Q0lSv2BMn0a5zeI7ppNWnBfX/Ap1Nm78vMX31E6KAztHNI5NX4kHG90fhm5dNHAY3
	MB+yXocsKfpMhLSFLQxfbOW9eMUbvV2joC/E/nlGtu/13o+b6dd0oGSDICPNOw49EBHx+rpD4lg
	hBcRNO9gUT2ymmIzBSqEoE12ycirL2fYa7s6KJ9a3bo+dsap+UQvx80OWfKJkGhBAtuP3KKpec3
	n5UcvB7ZqkxacLMUs+xVZ7esZl34ABEk=
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410515eaf.22.1787849086987;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410471eaf.22.1787849086580;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a253d6e7sm5112145eaf.7.2026.08.27.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Message-ID: <67819cd4-013f-411f-8f5a-77df0e3a88df@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX1cPmoqWtielw
 8GtikzGNoz9q9ndkVqw6gKYx6yk1QNfc1ge8RddE+tceoU9HDYT0m3XGwEZOfrs9DKngKX/ubWK
 ONFJjn90R/jDqLqnherRdeT5Kcw8oRAcRV8gSK7q3PIKN3YR/R1JKO4ArWRMoQkeZ5dLsRTHLmn
 zRufwAMkf8P5erv1aodeNhdv6PBoM7Tpd0XYtTKA/2SLvkAG61nl9R2Sb1/cHsakVxoPtvovwEw
 zlD4JgtoBukwdRd6yABL0Wtw3rUK+rDpTfh7GCL+t+F+q+c9JnHGYijwSEymXejfrW+XTkG8/gL
 KdHkSr6ZGwyXIe3NA3oweyJoACkLr5F8LZ8I80GfKlfTblOEaWYmFyyua3DVFR3Y0OPtUs7VBXh
 SOUbyp8ZDKg5P5yxusm68XDvgB7dJOpvuqWjebu/NzwVJYks5aaXmV1EXuQPBDHbBiUJ0ekwrs0
 xQnzOgX9NxOvsMmcr0w==
X-Proofpoint-GUID: fOjmmFNtIYMCIWB-7OWXBHSFzBQGmPtC
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a90697f cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qgGxlNUwWlbBUD903MA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: fOjmmFNtIYMCIWB-7OWXBHSFzBQGmPtC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX47rqBpsmby6j
 KzBVT2zAsle/zhNVVb4DuX+mjO0F+in4krj/AMm7caUrZcme+4CpQurQ7pzpLZvDvCGIoWpuCxI
 8OLyQVzvnBeKDFIAJcdiHxOaTCFGemE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> drivers/interconnect/qcom/kuno.c

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

