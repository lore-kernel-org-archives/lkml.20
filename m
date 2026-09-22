Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294D3CF690
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092870; cv=none; b=c229O7Fx6bHantctaSZbm5xxbLTkHyCnJ9oESsujjKO6/nwR0S6rAUG9JsXtM07275K0Zfj/oUZ368aU1Ie7wa1oaRsTcJZfEFVKe361i6iGFTehopWyZ9trZdK+n/k/ipSAG8CWKSPkWOZg3XbColR8mDrdbQJ18LW4flsdvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092870; c=relaxed/simple;
	bh=3R4gQIMPX1xyL3fLfmJonUsEWPtqtPZU5S/FIjR1Zgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJnlAqHgEANPD3HMxZFsp7J8a4lSu6xfjy+IZTz/A0/Zu6uVjjydvrTpOWPkhvYFFBqaN/jqHWA8kZpMzT6Za0h39YZPIIMrsnkx73/+b/fJ0wben/ZhxbjMYkZeyV+6cpbnGjg05qcRVZraFpqzCujX5whBEg1ZXF0JDO4LN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVLihMX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLv2Ibgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVLihMX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLv2Ibgu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjQOk705792
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=; b=oVLihMX5pEmvoTDM
	MOtd91S0ChCCAQGOghu8w/ob+XVXP9TVXRvgw//nAsO6T3khbZ35jGWyeegI+5ha
	bAwVbktgMDuR5ubiHlVE1GOy69jMeliLeFmh7yyMNnw5fV6L/49tbz6w1zlrvym4
	vcKSBmwylQvTeLJQurpVIptTEJCjBNcKIaSYCBysGpiZzT/mHLl7/j3Q/v9abLj9
	TrJ8d7EpuGDkQV6kecT6XCygoBTMoGY6RBhK8Lb5L9VeJBq3OFJGTKRk7DEqKtcV
	FKZREM5S3Gs7G+71uTvfDCw0rok5FtQXdQ+hnXJ6ZIVeMWWugEl6fGpbs1xjPXYS
	vOWIpw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbaunby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:07 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-483daf9f561so1618fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092866; x=1790697666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=BLv2IbguJIzQBAgyzzT8SYjRGHR58f0qdSSy7ZDmjXqqQDgyuK1r0CsXVLyqPFdMtF
         lAHcArIebC2iDZQRwveFV9mqPGnBwKfPRa5+dG8Gtye6nhs3997MBVXLRJlawXv+2MDB
         ppqkc2tUptur/A2t5r4IKV37AS//orTwt0oQwrrznTCuHh/OYw2CPvEHKEz1gqywnYQY
         TRiUjB27iKLe7D9DVqsWwzZgjN50CwuB+C/CDngaWOdpuD/5gFhxhOuk2F0HzSo9MdXj
         1c8kTx5eXcp5GD3q1IcP9Doaz+cvGc28s3Sm/4tkmZgDvs+2zWkLCCZ9dyF+XYQnk3KQ
         +JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092866; x=1790697666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkqGOgoM+CRI3FMAnNK16O/uZWNi4cDR4T0D5Xqe554=;
        b=rxXEiyOzZhCW8/FJCMxh0S+fU5gDwtK5brLW8ia0NvQ1wrvF/F+/Km/VzsBQ1LnP76
         koPNbMwDy8yhANIKOYkXvmjNBQkFiolUlheJfSK5Mjc+7h60n89bspC7IZJ6fHX1it7B
         1oj9E83eVsUxrmxp4/+v8p4COtY5VAk8atPh0xv25b/kPcNNT4xrqrJf+V20LNW7QzIc
         NKz+9MEkBXZZ8lxzdgLlplGcQKNshnJfBhWriyCyNy4cdKIFk47SSMTKeu1rG9Tnic6D
         FyH9YHNb3gzMQ86TUeaMZ/l+YSgi9zxyhDinL2gd9XoxYTvZ3s3MbsduNTDyKT950Ery
         dTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp/2+sKbJc6dD4kNdLjrXowq8dmGJSNnoYSmRgLxjT4KQ2VqLlou5SoO9cXgO/H5VEu0LM7Jw74L74g6c=@vger.kernel.org
X-Gm-Message-State: AFuF++mKhUscHHA/Ucc8iz83XD4IzgiOiaIU3W0so3rE1pssi63mP2IK
	B1vk0yTP7pWdNqzAXy15BaDiFqSPoNcdv1+Aok1blmnaDPdeUgnDhgu5aOdJZZFy1a5VyRNSQby
	eiikvSqWWrX2rw54Mkbaqx+ryvjKGlS9UbdRaxRumAE7rTZ+aYwki8GeU6XFOGM7FQ1YKHV4Ys4
	4=
X-Gm-Gg: AYBFou0OmuLaoewNEK98/AQJy5+n8f8KDo6NcL9FjwTS98Lr2ep93VrRmWyFRiCbOgL
	AeMj/V0zcsOapd6DFDWNkvwYEdJllW5K66QAR4Aur+fLMeYNclsf7ZtZWzkWrimgWTHEiQZAvML
	xzKe0A4e045fYHpPq991kIbk+De2cG+1F5DNBZnjOSpY5OEZhPkadnkvx9V4QgyDHi0VKStYXpx
	BQECnsl6/x1eSnvlimqaS47EOYltfCepXGTJk9BHlX7nrShXpp53w6KIY6oIVZlq2+f3mme1TM/
	WwhiT7OXcLxejdpkTdEkVAlsP0sGZd0DHyfa7Bx7TBAOX5mj47T3xnJRROGNdid1V1gjfNcQZfO
	wQFcOaKm09HYvDETUXjtzAg==
X-Received: by 2002:a05:6870:d201:b0:46a:3947:20c9 with SMTP id 586e51a60fabf-4908c81de86mr24549fac.3.1790092866563;
        Tue, 22 Sep 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:92bc:d59f with SMTP id ada2fe7eead31-7a59d968a05mr8239060137.1.1790092854872;
        Tue, 22 Sep 2026 09:00:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c42fa4dsm109135066b.3.2026.09.22.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:00:53 -0700 (PDT)
Message-ID: <b8117dfa-4dbe-43a2-8813-26cab9f274d7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX1qXcH04m8nBl
 NKCvbaSelMk5Jv41VYKTNRIVxN7X2WwLlm78TuRi56t3v86nA31l2/EygQnnRWCcy1DfMN9c1WH
 gdcLQP6WLY4ZTWYM9w1T2KBKik8DZHgqn/9+6BPn7mFE1l2RmJ/gS8phpp+I8hQpbD/Kb4/GpR0
 X+BYdXcPGWuKYmXthnDH7LswFjDQa+lIqH8mwpWIoh4YNqME9oOlKS9ryPR1IlLnv0P6oB/PkNs
 iDg7khKyRTk3fOt8yBqlMLO6/8FB9+QrhYfB3x2SHjukAcB7+mhR6NACH2kpijrLHQX+1KvJqtv
 mzJODmit+SzVbrzvESErlhFFmfq0opGxmTuQ13biEgqLZGDe8z2XwqxeuNpLrQbXQuL7Qq5mOBj
 rYfEmUwQ/LT+CGy33adMvkYQBh/7L1n70sIVpu0OHVeui+rTlOnECf+spUW/mpL9iws0s9W5Wcu
 AUUFWgTnHeGFt8iChkQ==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab2a643 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=nLN2K7Ab_lPFtrZS6tkA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX/jktDp3iOFij
 W5N+reInuXaC5r2AYztBAO4r4/GSFv3KPXiNCac3+HEr4380jL0/sfahMqxCv/2e/LwbCstOsoA
 aQvCYZW7dCdBOKtl1iNW7Tt8Fs4ajDc=
X-Proofpoint-ORIG-GUID: c7pUZWn-AeNJL4iXB_uySHVv_bP2XK8h
X-Proofpoint-GUID: c7pUZWn-AeNJL4iXB_uySHVv_bP2XK8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.

Because there's (IIUC) no reliance on a rproc, I think we can
safely enable them all by default, same for the QAIF_CPU one

Konrad
