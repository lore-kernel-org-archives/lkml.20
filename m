Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133F44781E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150571; cv=none; b=uNM0Zy40jPqwv8AKmfERdWWKPxIntUtOEY8ufMh1qY0eWEM2kUMFuj3ISrwqvKTJ81k03614bw8GM1HpJV5CYRCiScWrRqVAkDiCg8NgHsDE+Ia1npbY8cXpw1Lsa6DQAj6/CoFqDgh7SbWwOLc6JTGptNAuVFPVZi4eDaHTqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150571; c=relaxed/simple;
	bh=t7vjI3D8+2hpRG8hMeo2NZw/dSf9FKKg05cLMXn7q38=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mtB4xuM65zCtpRIoL5jWyfjHt7OukZt7jDuAtA2XWXf20517W5ZDDyQIqGq3NgTdj0P69uLKVuWMYl69jZRLVL+PPUdHsLXExFs6vH76Jx21RZTpTqwdL0KqIMHQ6280/J3Q2jELBC+auiDX+Prc+N2e6P39Tmuh4jx5eWkbnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVQ2E3tN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keYIwLyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVQ2E3tN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keYIwLyC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA268942592
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=; b=mVQ2E3tNY9aRs3L8
	4d2tL/WbYSrzKEFQiibEOcePQM/k8n8ntLf3KrIqPiT9azT80N7Eds1o7OcccYQF
	7mB/NuOT3K/5PhUYFZRSR19kJ5q8glTYGTs/leNvodLhY9rzXQ+QpQF3TyJ1GqIX
	6jjsiDapMcLbsO2UzvLVvJEoaDhWRAsE3ohr56BxGYKZS9IqLY3kwbSsKkEFUsf7
	WyMX86GD5Js7c+U6AKabfe3wRsLrvmbXYnSwgM/T1NZmMEnCBTrdAlP1Xhr9YaqZ
	5eBLklcsU4ARdxUC5kXdpMRLKxcR3XbCqcqLlelIc0nqQBMrWqa8mL4LUKA40oer
	4IK8/A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0a3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:36:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so17618197eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150568; x=1792755368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=keYIwLyCHugComjYs+gGtCkZrldDlHcJA+yJQ58A/E88aX24H1/tl9OOOrdkSrzrMB
         29Fwi0xVgTeSsAT8amR+hKydGb2QhP1eOoj84R+2z4Zn4qsxzStKEDNRymB2aCpz6UqH
         V2UGxzNDKOKiviZUgCB2/gGgUitjTi41pyoR9xxIV5gzhyAIiKHhwQjJRfnNhgcwlDOV
         bSOC29+QZksCAOjgfq6i0kKLA/T0zfUBtLR0rHRCbrOS/hK4FjS/loCqkvX3IjdosD9Z
         1+fndbe0wmX7MJexV6Txs0fmUkK+YlxVBtRHssu3sjqxoxrHI/NOxNwRzutX6SYwP269
         aAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150568; x=1792755368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=AjaDcX6BDFq7Q7USbaqU5CIJ59VnnXcBqlXFMErrsFjdXcS0L6cvqdgm3GQK7MHBhM
         c8O5QiDf2XEzSXZHF7LgDyPScpZTaRRBVgaOYu5ODX1/euUGgMIPUxUxhQFC8O+G2G4w
         WjS4ajuCcRbEwxi4eo9+wXeCMosSsaoiD6OkCjsMbGyof+NSu6VVj6nikS3qRdUOqFNh
         aJ8+gz8iZaH6WJpimqH4qfHNgN1Y9zFOnXcBU+4Fdok2fRxkA2VHIbgIpTSkOtofIInN
         cLG0640sqaTd37LX71CzP99UAKS+CgkrLOzAZhLw5CmGjofgqmJmHOxj0xVuwb9WQJZt
         vnvQ==
X-Forwarded-Encrypted: i=1; AKwUvBygAno/ENJ85BnQF2R9Sde+i7oXzDL9g2W7CWJZ/OAVAtFawutN4hKTgpley+8M/3/+RSXW7aIX+spVXBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI91Xd6vPOabk5nhMUWBgjbImriGGdqENTONi+19KOTkQKfGyoB
	vkMGDCkzq4S0JZM2yUjgvVmJrAw/swjetvlKFiMNpmFRUNx+7p8R5S/tnvsA8zEIiYeU933xjqj
	jQr7n/XxSOF0qHBGxzHoTHBSfLXsoi2D45dQbw90bG1tCb3730AVB2o0krnsQ1b+jz48=
X-Gm-Gg: AYBFou2i+S6MRW5lHkJSR1wRAd9J1Mqnr40hESb4LEx04bmgYhE86lj8Yc3nEwhOnvV
	GJHuqm/BtusakXYzZcdzykOBe6P0XPsph+LPFxto+fsDcPZQnwrQx4CixMuI+W3rLtASf/2XXH2
	4T5tcbpgPtcqzwLs8XGccFpBjbakqewkVwm+B0xDhKVGmMypSNWTFi4xBx/wiAD862N77JS6U2W
	2736H91rXVxxwXpGEQhyVBuzI8Q6TD6h12BmkbCEOF829eqGx8iITzlErthyo5a+kFKwlmEYY3P
	8YTtbGx6+4RYedWv0Wf/gtmS4NLdYS/tFc1IiGHfwurczdVJHWtdNbYJeQvediZEBYcENFXBS2q
	i9cGI9jZyhITDnLvE4cOmRocHdWQ=
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27197074eec.24.1792150567591;
        Fri, 16 Oct 2026 04:36:07 -0700 (PDT)
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27196976eec.24.1792150566030;
        Fri, 16 Oct 2026 04:36:06 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm10678942eec.28.2026.10.16.04.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:36:05 -0700 (PDT)
Message-ID: <b92c91ba-6a1d-4c9a-8c5c-d4ed7654cc99@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 1/4] phy: Add MIPI C-PHY mode and configuration
 options
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfXx7wgeCjSMhhV
 4lbBhfewpgiU452mMt729DUoys255u2ZArE/onmNpPTUYSXM3EwAlFxFZGV6AcvWxIcy778q4LH
 Y/ZjIsgi4TLWEu5dAE4CGd53NiTrTt1JZFCvv1H1Y9Tjp3rqw8e+ckkF6rpnM7259NNcNIh5OkF
 IRaEwMMc1pLH98BqHX8ccwOnvUz3+QHZkLVRPUBkFpoVn2iok9+FGmst2y/PLszpJ5T+b+xhC/q
 KbxE/YYGIcBiTagAZPAEDiqZsp7+ZBXRZPckDfTwT1gcLoIfA1RF10nxhCaeOdyaLaTV/DuIuNZ
 4AYm7XmyXwN8yzab4jX719TSuOP6SRNIR3JLE6LWupbnEh6QNhkwjRpExRfNOZxAfOYLfb6nQHi
 TjMr/Lw53bZPL5+6pEP2A0to0dZ+a1sjme46Xqi75/mdPs+9KB2Y3RU5RCjRldYkX+IF5fxY9cS
 s4riI9jWOIoYD6E+tDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfXws+Iyq/9k04a
 yNdn67I+DgolDzvq3bcNZFjxDvIV+JdRgglAoKp/mZgS45CAzoKNYV4LeDRyY7thWtm4fnNlGVv
 nGAg1lzMs5UbHUbXZfv0XLlw2rbSqFg=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad20c28 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XL7EWEVnQUwZ90-4yZcA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: U8Ijhcq0gh6EbMvSjj-WcbXjQK0OTv_t
X-Proofpoint-GUID: U8Ijhcq0gh6EbMvSjj-WcbXjQK0OTv_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

