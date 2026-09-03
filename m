Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51580361DBF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420248; cv=none; b=E885BVveAspvMgeDkzIb6sgMfARHj/YlWw0fW3FW+Gb5m1n4ca9vQnSkb2AXYxIncrlka8N7PeGi8tyOEQahuE1YiXtXIBsIRcn/FuhB2i7xUuNtk+h6CwmsVG+Ry5L5DalFsMQjqkwEGESJnmMsi8ruo8/fj8k4C/UYK63XUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420248; c=relaxed/simple;
	bh=RdgvNs0iC0Z0tvhnwR1DWJf255rZTTB65LpqPdNQK5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhbCO5fYHnsjuMhZs261JR/PILQYwjNst7PMy4HfxRyTjB9euhb7gMJoWWyB/tEi6JeJpGzEf9aM9QUFeT7BVwlsedqgmVaxgBQQz044TE1SbbrmaZVoIkmbN0rQT0X6K/gLXpg7B3XfURNwvPbT82oDxJTZFvP0PfHA/M0gbgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mio7lQZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGNL4l7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mio7lQZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGNL4l7p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mZwc081164
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uj5DVczeN3TYFsVBhhCEXWFDUl+8YALquUd9iuMVtJM=; b=Mio7lQZGH43b0bOE
	P6Lzzu5A3PDGQ+uwxJQwBTja0yD26DfyTcZAJxtInJww9xDXCOVatjLhPOb6TKvB
	/TJLJf4jx2sivI647BurKvtnEdQJKz9pHuEYlfIw68uK0tGa6qmPd4FpWFmqZzdw
	6E/9dRz83XwAfeCFdsKP93wQlBFnOAFKU+eQU9NmnvZnVmfGePZ8B7hY6os/1Di7
	WRVxSMGgLEx0neQPHk6OyKIekX8MslhKnxZJbpPEDa/mYkZLXQXYZk5OQe8WxP+k
	8xfki6p/SWSEZA2i/kRjhJUSmegsvd/ZZ/8BjDeKmPl7CqcC/zLJrW2KZS8wU9cb
	R78W9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4gnw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:24:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so52284185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788420244; x=1789025044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uj5DVczeN3TYFsVBhhCEXWFDUl+8YALquUd9iuMVtJM=;
        b=OGNL4l7pNjmjufLmcuV1CgMiP9hkNiLIh5Z7uJ7/s4HmEnC9+VuHEixdbnFNQhLp3Q
         XPApkYLrs9HmHfhdMHZf8k/zlpIQHHLd/Q0hWrpg4zx0fpxJMiAYx1rx0oEuGlQktp3C
         w44hGIjPC/R2NiWTgrK0XndOcTKEOPNCEuVrQmuehHMm1/gTHFtOkZKrMaRooiYNHEnS
         OmrplaFyU0Tv5tzuazEY/XKdERKa8/17nggBUH69GNA7CS/AciWYR8avWWOHezDRh2Y/
         UC804XcB3kTvLoHMSE0gUzJFAnQkX+uGtzkb+upYG8S0WbDBI+Pi6PAHhTU7XUvrdatu
         TVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420244; x=1789025044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uj5DVczeN3TYFsVBhhCEXWFDUl+8YALquUd9iuMVtJM=;
        b=R6yme+XPIKPFce7QJQ6kSRuMbrw1bFHQxLjlTfzpNrw1DlmuIOBlZHcppG1MLRQn3n
         /kHK7pglQvmstPQvG2MB22G3fbcL+Sg9IsGiLegB3HpS2wfzEwaN/OwYmO2HPV+Y5dka
         nq+20lkMZUIgJ8cNRmSQfjoWR1374JWShNhL4o1qxf8tMpmvwt4ok1lY7HXglU9BN7s8
         8QyyEylGqIvZo6q/pPCpLQZ/LFy7BDs82Wsprbw2v3uf+q9BwEHSABxJk/+59R4ArB6k
         fJ/5JxNIQv3UBsjhASNaTDGCYNHNZVsJSxB8hWLgKl+NM2184qiu79eLYWBhObXV2Tfj
         uvog==
X-Forwarded-Encrypted: i=1; AKwUvBytNVHInmi+x2e0hOP6/wPHE4l93T5JejpvqIi3EAMnx8Q/UtMlIrCBie3HCukvkwsEHSn36Qli2934zYk=@vger.kernel.org
X-Gm-Message-State: AFuF++kT97cqv6AfMkEBOUlTk8itfop9oNy/sqR/cWzMOpKT6gBGF24V
	NDcgsfrFWr1r8iquT0Hk4osafqLQrC6gxZuQfYBTSl0YtJ3BlmKToa5szwtzbs4/gvU9ovTCqPM
	DkpW3yLFhX+NoZ5XIh5wvCfyewgvPQz5JKDt59AtRwEdnDoHSxfi82w7341fNEsIIgBg=
X-Gm-Gg: AYBFou2cnj/erz0d4EmWlxu4SUIlFU2shWvruw8IdJbuRQfw8gmVUXU/5Wx/T3KVWNF
	dR1jX2MUDG0WnxFEXCg0xyL/dgpbqsHk2v8h6HPrHUZQfAfy7EPDW4qhtyukhRr3c90Z7MBNI+i
	U+kXxXbSDWqPLKRpZ6oFOfquWM63sXrQ17XiJGrfxc0hyPyVvG15rD25ZCxC3hO5/prSCS0/B7C
	TIlFKMyhFMC75TOtkJpPtQBlCjWcKggu2FJxIsmxC3hiFY5oymXAOnQcxNoC58GHV6UgPzmp8kQ
	wnbBSgkaVh44rlCc5yxLpXVOatsUw42e5u3yR0Dwo7bQl2em4O1XIfNW22iXVYGz5etRo0fefKg
	17xQuhSJgDw4Z7YBmVjvpfA==
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr814387285a.2.1788420244484;
        Thu, 03 Sep 2026 00:24:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr814384985a.2.1788420243942;
        Thu, 03 Sep 2026 00:24:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4230f80sm56610466b.51.2026.09.03.00.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:24:03 -0700 (PDT)
Message-ID: <755d57bf-6cde-41ee-854f-b45f7e9cc81d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
 <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
 <25e0797b-fdb3-44b2-8ea5-df0bc3355648@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25e0797b-fdb3-44b2-8ea5-df0bc3355648@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a992095 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NdBQyjvK3ZtS0P3zgOwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: METI1VXrazRqIA4XE-myXKLCUssFqW7o
X-Proofpoint-ORIG-GUID: METI1VXrazRqIA4XE-myXKLCUssFqW7o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NCBTYWx0ZWRfX5a+gy6QRG0Hk
 0AU6xeJIc4Zopz70YJJBI4UaONmQz645NbevMccVJXNDFOWyvJgu9zmSENpFZjvqMdEeCzT2SZg
 6jAVkQH3UZfTgQZEQLsW6pq0ln27krk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NCBTYWx0ZWRfXyZ8TFJNrsR8x
 2nuY4zbq7ZHWOFk3jMBUKJ1PxsljTDbgs3RAc0ojgC7BkLueDrSAE2KKXWu2oBUybNQmPaXX2bt
 ZvSrbLUMy05rV/DwXYBx+ijxrRgVSEuo5S+tzHZSjjYG/W0A57u6qkQOQtr6/T2Ju+Uak0ccqoP
 43rkl1NptUyc9o2D844KHXlOhu4YIKy7yJir/EXDJMIu94GMG6nWpF0ZgPQyUCTEpafSM/rh6Vp
 5hqeFkZP2eLGHULVAi+BmsBZmTRtKW4ahZWsuWJUO6hCluywrPgLkKs0fQ5uhIqqjSbnVkckkPr
 IIWXgCFMnlVxAa3HOtAoKXeUlbuWYHHHL9at/lpnHyb2kUErJ3gnHTZbfL2tx+cMa1SYEa58p+b
 KDtvCYng1bRRBTvp57Ta9/Nd0cKRBlBUhIgbt9Vfcs61KpoIzCfDS1LsLDe+h94iJs3ojpUfcHz
 w/kL/55ZLfde8weLK7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030064

On 8/3/26 3:50 AM, Fenglin Wu wrote:
> 
> 
> On 7/31/2026 10:20 PM, Konrad Dybcio wrote:
>>>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
>>> +		if (data->channels[i].fm_capable) {
>>> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
>>> +			if (ret < 0)
>>> +				return ret;
>>> +
>>> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);
>> Can we read this register blindly by chance and drop the match data?
> 
> It would result unnecessary read for the PWM channels which don't
> support frequency mode. The register read here is actually just for
> differentiating the HW revisions for pm8350c, where only the V2 support
> frequency mode. And the newer variants of pm8350c PWM4 channel could
> support frequency mode by default.

Usually feature registers are read out unconditionally, since they do
just what they say they do..

but I see that this register doesn't exist on e.g. PM8916, so I'm
willing to go with the approach already present in the patch

Konrad
