Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3532F4CDA28
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062739; cv=none; b=ZRAl4SU+9mQPHo88lm2ijhKgue9TepnlLiBKX4xRwLKz7LsP90RN/L0q4PS6l9hz4ACjNUZ/ZqVgw/waYOmEUEe96ErCwbZC7uIvf6584Qor5Psn0P8ZMesTszUZie2vvAOv3itvYZuq7n62OpCbVYc0A7o0IPV8Z759L0O1MJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062739; c=relaxed/simple;
	bh=sPjoF9f84PGyViRQPT82i/2szqbbsj93fMQFZd6Lxxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhZ42Lxai5ZXdRYyO+cINM4V/uTt3JGl9ZYjN39I+e7XvantJ8LxIi3W20Q8jiNS536zIi1Y5h8vawpdcE3eotO5D6yX9/mHu1NFG2W8srkm1XqllkeoceYKnuXz/0TDHLE5xts0IecxpbQIgLT73npHQ7dMUMiTRghyZP+HwpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k69FMqbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuK3ewpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k69FMqbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuK3ewpp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jna33408850
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=; b=k69FMqbpxwlPuS4i
	/Kq5qjCRTI/ZlRsRuLDIBbWucTNTGRFtP7Jirl9iIvuMIA7UWihq2otaCsCSR1vo
	ZzRuzerWaljvI6AidhXloIvvNafzJFT6js7hmKFty0hGNG9UoM+ndMoZv3d5GvP/
	2WiAMBjFyljMEmb1MJ4o43aEhd8REWxzOtLwcSSHNa5ma/5wQ3XF5D0QboifWfyc
	jqx7vtMTUMGWPScCYzBtOGOBF/rxiYcfG3caK/gj+Gce7bq1C/ym2MlVg4GkyU/q
	NLdoEZ1xxhcFmkcrK8/PtodcgHRHCNIaGkF85mNSTXQnSfkX9VGKGN10ABX59Zh2
	lAaaLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2ey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso93366485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062736; x=1792667536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=;
        b=BuK3ewpp7Qfg9NcrzYjTt51NuOp5Bl5nr+fd55s2QXMArksaB2Laya/DuFapoKzyQj
         QYc7OsfigE6xgy03BOr6ModCUMOoaSqWbYzvNYXiCTFbXm6TfivYXatlEI6dy/pSkRSE
         XnpJ3vL8FgUw/aWGkB/nwoPXmfVLCFzje5DxxH1m9FLXFAfHB4KkCQhbOXvQ1aVOX7WZ
         HbYkCI8eYWBfgqDtvdSnLux5QgpmL3qBo4IjWeEhFoEzIG//lsJutJPQjm9yb30DuNFQ
         0YQm5B9Phjpr5w0+cie6YZsIGqlJ29FxHbyLsfRiN1plEwLAevMfM1L2d0Wh2DaQtf7N
         vrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062736; x=1792667536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0DIyTEthEN3q9Ggj8PiUnymVMVI/txDYbRdKEeQRTo=;
        b=KGQV48mn+jzULRaZaPyqneyo30An7ZNhWkjm8V90c/pYndrw1PsiY/IDrzQzQKRaRJ
         KRHI8HOsOgcgquNXiCqpeR+YqQZfhlvSp6QbhrGNUiFKc3OSVlPGM/hmBrKsi2a0oPTa
         5J2gT0DB5cwfNwuA2W939d8+OFjeJ5PRi41+PtT2pikM3ZfCGmbggo8j9jdbB/1+2bJF
         qc9+MxLP12oLEjm/nvByMf/4a+9M9c4agRnYYpLWlLbU3qOMFmpG5PE3KAHMHlOAQXTu
         rTr7v2dClbE00sLPluSYAs6V5FVSG5KhZP0m+qHYfZWRY7J51S1WV8RIfY04ZwHvX4GM
         QG3w==
X-Forwarded-Encrypted: i=1; AKwUvByOaR7aCuNVUb9ru18YyoF2tl28aTOm83PwO4cS1W39cks8X6NqJf1YRNQPSl9RNnhFtejfiK8kY1iB2kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0ZEUg5NAwRi0QlTsIQgR7b6Dc3cpoztXLsxqJELHpAcZjdIQ+
	WXhhDeYnXWdQ+26FJOesbspDghJAojXMow5RaR0HDFnfVDCqQL6ueutxGKAfqF8agFe2/Ht1sYA
	jIeCtLRwZGqHbphjlC8UsBKv6vQs9W318cnY/FDw0/lYmNW4iwz9R/6e1Eyp+1CfejII=
X-Gm-Gg: AYBFou3xRWp3YAB4kp/TIKUd6PVj8Z0hjdyUVUrack1d8W1o7gOvafRP/CylcMrQQS4
	D+LO8LFYtbAMJIs6slPClrIY+UMnJ3B3acqN32cZmNnltvVUj/pyZWjvNP9f37inAv/rG/velJS
	O/3XD0QIwLadZ5KWPkVeM1qM2uINtzxlUE5qhbi5QlbiN0F7G3GyAOOQlGOKQoHi4Pe5HXsM9ja
	azB5aWW0TRrxptM/olQwWr/pxXFGdpx4kR2qday2F5wOsuUY1kSZXGd4u7C34l0JvYKoUjo83X8
	q4nfQGo79wrs3D3USNSHqUD61g5yPvR5JiVNHVb0zIF26zCiGbvyq17ZWJXlgbOqVBpU2dEE4Q4
	M9DUcE616rWJVDTW2bcQ8Fg==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3530253285a.5.1792062736300;
        Thu, 15 Oct 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3530246485a.5.1792062735683;
        Thu, 15 Oct 2026 04:12:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm2453479a12.11.2026.10.15.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:12:14 -0700 (PDT)
Message-ID: <782ef805-fb3a-4fe7-87c6-ad6924027eed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-6-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-6-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX6yGZwCmDCqLH
 ETcX7IVAnAUI9Jl2R1nCsexl+yJBzfnDhOZ/IgdhkX6V0m/+62EwuZOSupP4falvec5N0TjvW0Y
 hYiyLobxg7xpbCg1LQSkNb8rrSxuejQcwegpk+wE+8gIi2Vwjr/Ha04YNCh7O8pGyzOz7fPZJ4X
 pHvFRC3grQg37GXhvWmmohFV07E81l+D6m0Y8XkM2ZEXBhp3xuI4YSvvRrHZyr8NHANQDWJaVF0
 agS055DxeDZr0bKFADKd5MvOvOMMYaBsed14GufO8SwMRbTftyRXVKec8G3USsaDRxROWlPjg2w
 nqIEpl/kTp+lb92oeo07+SyEXOcLLV+hFX7JX7jbzzOA4q9An1LXrIBcPVIL83i5q7wMe93gUJX
 s98J3SXA2+EL4JHoLKsgZdtxioaONv0aHvmyIhK2bHFFxq63+ZqCrfTjqSo7LiXGgGL2LRxtT9s
 w2tiduAGmlcTmS8sezw==
X-Proofpoint-GUID: 3HSKKM599bh54RHAXEoDa989Zsj-eTap
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfXw9hMi3bR9O6k
 mSbBWH3RXlNqFblNGa0qpqMxikjWFuYT3bdxi+VNxQ8Ts8xDTsyoaJ9C6zOSnesZU+kQj0D7eep
 8gyEZ1aqwNqe/OtT9ymBdR+UCX1ETmU=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0b511 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=TeGvFkPWVxK0tiUNUioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3HSKKM599bh54RHAXEoDa989Zsj-eTap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

This patch generally looks good minus this part. Will you be trying out
one of the suggestions that GPT gave you?

https://lore.kernel.org/linux-arm-msm/e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz/

e.g.

"""
In the ASoC core: defer component routes until after 
soc_probe_link_components() finishes, next to where the card routes are added. 
That removes the dependency
     for every driver with cross-component routes. It is a small change, but it 
touches every card, so it needs a wide audience on alsa-devel.
"""

We've recently got some fresh wind on the DT linter, so house of cards
this may not live for long..

Konrad
