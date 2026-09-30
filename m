Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E69463B73
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766295; cv=none; b=lkhk43QGiGAdlAeJNfCZrpa/+SgH3+TeKU2+I6zXsPLsJMVIKd/oIZEdB0hpp5olb/pRA8VtxxsB8lR7s7rzEY6SFLxatxB6xqtynhIB9P6thq2eWI0ia9Pr2JDMkdZ1XfdWMxB0Ewl3SVWqkAsN94pwgOwv8ADx09SQvd82PdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766295; c=relaxed/simple;
	bh=n/22CJIRs3FbTQ/EXxPb6QwR4RlL3xGqhin4YyXX/X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjD9VihykQE+MBSzScZbFUwQztvCPlHfsaBY6qukutXJLggbITZEPYPm/hZdd9MoC29gGL4IE86UgF/LRAGc0I2155C7ZrysOn2tdYt31p+Bl4x3k7SbQtDP1AQYUmSHcnCHsEsy3u0rNUkz1YsuA6OMyKTgVh+YGqVz9B+i3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my/5kK0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmynXiKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="my/5kK0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmynXiKG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dhXX3330916
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=; b=my/5kK0NPcYGPUMl
	GwPINqpVbrConduOJeWQdn91NGpRbCdMDaiI0IDliWmraW876kpruCsjk3/EdsTG
	b81M1/JGMwU6QZL8lTEtRZFZiS0LM7B4ccPkcIduhuGIC44XQJtsmdGV0YKvjEUe
	BXkqrA+hzOdFFFBIw16F3aS4mb67zhgQy9Ilt1ZRcL1TrbD66PxGC2UijdwhwGOk
	7nxafei1MSj5rJ4iQGceK/uW6NabTx63WXdlACOYfZSVR3MGY83zhrQ/dk73Z+sm
	B6bmHL5/rJ/S41V4xC+p84Mn0NEekeTT28yUwlP6TUqQ7DCqfoopW517Faf4pDq8
	FWLeJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3k1wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:04:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91795e52969so2022376d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766282; x=1791371082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=XmynXiKGoOC3mwn54Gm7mkIDfPzsDmR1et9fPdNy3Dy7yqqdjk5HlgLmrx2ZWIHcDc
         ynAjdb7kzlLS/ksQuVyeYhBMMR/mgEBbteybIw8CQc5cnpQEv5BgwEAUv9HDD/SuJtd9
         3t0CEEZ3Pkz5i2gZ8ayYjZjo62OAcRc0rf3F6W3hhWXVcEOAaq/8gbMQXDbCGHdotw8Q
         FOiel8Eiq4CG7zZ8WohM/FiBQJAZfJaeuBUM6nELhyxt8H6l47Etf53bsCOpwWVyzj9+
         AZdLGBrG9P2zOoI9ML/mfDAARdgKVNzUcmi2KU1rFQtHUwDnoWH60/upRm7YwTevPgse
         dsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766282; x=1791371082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=YwkmUNT23jujwOCm5IUcofy4TxGwV7SfcK817UEUMk0kSsGRGuLIvoQxiwsXXk+L41
         BGs4iFI9/UDuhPv6tExzaSy8Nj4P/6WTiuhywlamj6qmYvBcaPYJlT4wcVQlxghsqJWh
         h2fYdu3FLSDZF11VScZsu1WEKx1PVc2uSd+U5veosE+jDag6XsoQlqY16NOkbXETT8JI
         BVqcLin68x2Q/d9TbIn5kifzXW0FDgXhD3aj04ke1FgEnxKmyw72vTGkihhIaxZ2JQ2+
         8+Jq7lAF4zfKOzgh4yFpM2q5twnSwecHvwWWOA8moIR+laG+RuF7WKIzcENNTEJpGWdR
         O/lQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Y+tCtzQRquQH3/1OaWa6SwbzvpJ69tTEoxnCDwprJsnFg46sbBjRZrjozPJYnpgs/6xTGbe0Km8VjMI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJsfo9pIXJoRzlYNubBjHevA18eJEvdnz9Cef6U+ITz19oxYjL
	7nTli+ur81HJ/ycF1yIUWGqPKfcmp0KzFpqo56xKzhOi3P1Xkq7rcrNRW/6E3BZVg6guN0SMIiF
	yN29T1YmmIQH9QcELj7hh6HA7TbIbtBpD9rsBNgWz23L4O1s0yKHg6jpHF7Z7XprQixk=
X-Gm-Gg: AYBFou24qp+KP82FYwxBSmKiui7dGagkC1w9W77n3MK4P/I5/fNy66Wbkgk/4P7ByfE
	BDrpyLaQsjnEQC1rm9UpTqk3JjU2UvxXARMzY11mpd+I2kk+J3GhBi1NkppE3M+yMFpcWrc80xU
	UgtAMRla88gW97GZWN+fbu1BgTWGNDrvNcMo1xHFvO87+OpqUSYuWEveYXes4WZvJe+w6rIVtkr
	26sDE84IDNDdISXwCGhyICtZwM9ojzXSW9jr1QrMwu+TD/FOII+DRlquctfIWV89959dV7wf+ZX
	2j9HKBRoGMdmSbiqRN+MHzM/eH+p13jf/RjAqGBBlQQAMiF+bFumcTB1pTkEMvlzaRpYtPvLdNP
	kntny/p1ZDyJ9NZHOwBKyng==
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139824185a.1.1790766282290;
        Wed, 30 Sep 2026 04:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139803285a.1.1790766280181;
        Wed, 30 Sep 2026 04:04:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm708830a12.1.2026.09.30.04.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:39 -0700 (PDT)
Message-ID: <2b8045d6-050c-46c5-bbf2-eab7544b7070@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N_xGkX_JfH-VN3z7q0fC70vpdfC-wp7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfXz9tWhefWaKk1
 VKynIRNz0jaBF1ER8v+CwXFlusBjNEkXoQ/JpC7w6CBSeuHNe13FIE2K8u5JiUsmgjz1xCiw76J
 OCuigMk5mG4+9NNOvjNxbfXebNNjZod7/W4cii1uO/G0f6vRyd95F9U0gDzxUnZ80qprxjI+1JG
 RXhceBxD6yuJjoLPz0nV9Fhs/yvz4HZliMoyxs/nfi+b1pi2Goctaph30/keoc1c5Uveos6ziIJ
 pezbttR5F9KdsvrTp/xCKUuOI0DiyO4mJOC8FeOyVeZWXfLGr9efVxQ+0rpTPP+8icsNvc7lC7m
 oQTSAep2RLjJuq4pmlkt9CWeAXFlXipPIK3xVcTRqomT5Pjc12BV5cqOk1uEFkULZ7zQOwpp7Ei
 pdd8/eLJZfaIPN5y1q04o31Ex0HF93VN+cmyCaAYxapEPWXjUBvGXe61Mc48k26XSWnF56idEr2
 qYmAVMavgPikW7EMOgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX1PUvw+N0HzYr
 mEksF+jljU/+VLUyY8ZWDK45FjXkiGsLQY1obwwFupzSL+Xzi41A2DlmIDbQ7Ult2h9MSURpiO6
 iXV5XGwwKIT1GgBUC34ErvF11WegHH4=
X-Proofpoint-GUID: N_xGkX_JfH-VN3z7q0fC70vpdfC-wp7c
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abceccb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bWtWBUCbUMvqLY_lKcQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Define pinctrl definitions to enable camera master clocks on Hawi.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
