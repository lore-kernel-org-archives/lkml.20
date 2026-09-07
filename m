Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E24D90D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787005; cv=none; b=kuFfDCzaDOUuMY/CQFfpeWPba55xBlOsJWRU2sEHyDgDTcKsP3XDRMws6hLuvu2gkkCgnabUU3C2Y3WV4CtzOs+goBfjtscjsDkAB7qaFfJWD6il9noYJkonSEpCKv7irIQdXKLlAFsVdjlVg+T8mpXykQ6SDTdt6L21mus0Qxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787005; c=relaxed/simple;
	bh=G2v8Z4In0XdRAS7INMiDLN8saFBbHThX8C3LzAr0q6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVoLeuen1vrRtrSMCHB9EJ/C5IyHNYtJlflVWPiO7r22Mn5alXUOzh22n6nzyDOJVRxL+CisjJ6+khHN2P/EA1GQ7Xil4K2WcBQFHhvWM46HjdcRYDof9OyIJ3KMzv8GEkC3Yo/xCp6Yw1c1mECkyi855u3YvFZduRVBKshxOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi+be6Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvwkLlGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi+be6Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvwkLlGP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmmEt809866
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=; b=Qi+be6FjJUIG70fb
	i8n9PVOwpcdyzyQHqqPWVv3O9greCJcXmPMxIdfG+ksR8LHCmjZj36HM08ylYBW5
	lF1r43md/0MPRSyDeGKFRhJkeipurAGK2bLrEN/GU8wuQKdbW3brEyw7vPlpav5l
	4Gc5XHZc+8Wfd1uEali5tnAN/AnUyYbrWryvjCYETJhcPFQ8ujjR+ugccGO++lpW
	3+W/QNI4xmegDrTlsvrAZqgw2ScLoYCDz+7hnYaaMKMZQfHuhV9UqKCGml81tMsb
	GoBHOFNBFgZli0l2buLvHCXUh2D9C3bZRLYqTKds6JJPHZupKRo4K1wqXoAfq6zF
	NkK2dQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9hnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:16:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97ca6578487so2739405241.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787000; x=1789391800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=FvwkLlGPKKUdh4BuN6xln6n1vbkegNHNkLAguDc9DSDiLa0rqSrG+4UnL+5xlonCAe
         lRRavq7Rd/ceoNIAtheW83s4FzDbrfM+B8y4lQ2Q8IcfTS6ye2RA97KVVLnEIRUYN+nA
         gXUCCAw29xhCvltrHvbrUt5R0qPAa7yEI2b8NXdUQAsAzvPuo5AQW0Ah7aOiO/X35pAB
         ii1A4sNKd/eAA/PkxjxXxCvBG6jaaB0wY3UpKW71xOSr7YQuvcNxZWx8/LLarNWTGZfP
         RKDQxa1b8s+fXFZwPdVjXTw/owPt7WxWr30/SLACXCTJ+8aFWssAhVur6tSyhiuKxNUu
         UIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787000; x=1789391800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=hB5m/VMi4ZvOSRFqvuAGT3bNfdkzVRkTDf7xHqO66S/1XuOl37u5yDPg1DZaxNcgdn
         RBks7mEU3DeVn+HZqLiDltKv5q0XDXGcI23OtwHBlLixmNSQaRGz2B14+Pym2jFIxv3U
         Y/AdY7V5UJlTdODQx6NKQwUIgI5kBGiMLIvFqfVBkTjQlrnITp5ad6RA/4eK6AQOZJWB
         5SVagVEU6+vdcHgfPkd3SRINL3fP7WKjoNi6NU0yqLRylM/JIvG8TPdFVYHTERmHQGX/
         ZTlyvlfwTDtRrHzx8xuE/Vsy2ZvpB0vbCpEc6LkDXdXIuLNRCYteTGbfRofTk+EMZgvk
         O3cg==
X-Forwarded-Encrypted: i=1; AKwUvBwDtjfai28DMUwnax6D6kBAPRp+WMIPgSDDafTjj25phd5uiiKqSp6wYahxbeXNi4TPZ8XVVWN6D21QCvA=@vger.kernel.org
X-Gm-Message-State: AFuF++mBAjMPc7LQUYcCgjZTQR41yYmDkYRxcDipHNFVhiv9Nqy87dQE
	GePjDH3Pds2qyjmiT81e+L4jbK2WapWnHL4LCOSUbiQCFRcAGDUWf5eibrg6bU0t6mj9ucHSGFZ
	mVYtHryIkJ3WHyUwuJ3keKCzRcYYdTsQfb3755Y2vUfQPpneoaBc/ah53R1iH9IrN4i0=
X-Gm-Gg: AYBFou2H67ludwskrjv/A79KIayxX/05YcFpQsU+t4EpLeAD7erxP7D3LzdL3nK26nM
	eypL8H8oXE3GKjA9FZmLcIDGcoKdsi8JptsWue/jUX4wcVWHrDUzzziu6gUlM8mwhfO3koPliCe
	kUkjqOHU2SdDslQKHfv5dZ2pRmZWB501NqDWSk/gmq9Pk32YFyT44LHglo/BYoFtpljwCIwSHxw
	cnSj8aXsoGMON+2jvR522DrqvomBFPwEQ4Y7Mf7inETXSTHGJ0M0hfpcSRwJImv6k2OmdlZYloe
	iROQUn/UtZ+oOq+hX/JJIzLHyrARVRriuWf69a5I7pHIoeQIiPJuTFzR/zrEp+BYf8g2LTz8XXS
	pR7ECXePimaIBuEQwoOEeK6FG5Ds=
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477262137.13.1788786999890;
        Mon, 07 Sep 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477009137.13.1788786994613;
        Mon, 07 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c28e9eb4d38sm176729966b.41.2026.09.07.06.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <abaa945c-9af7-43fd-9f2f-ba20eec2a9bc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
 <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
 <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 40nb1IQNS8h-r2FNx3aTAQYsizQcj_qL
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9eb938 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=zomqoF8P1_g83G_DeI8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 40nb1IQNS8h-r2FNx3aTAQYsizQcj_qL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX0aa3Dx0/0p0t
 7lIlkXAJluaxjDvMLC+DmLCQnPfMcY6PotNSlecjliG5Hy6hChZIDN57oM00y6huVMH2uXQIpMH
 xFx7xpLfOt4QAs4eUpE+3QoWr2LUqzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX8Np8nTqb9ULD
 Fvi2vAdUGglnIzesSQMdQhqEXn4JH0Hu2izoCviBHZXm9Fbt7YP/51amIf4Rt8hHOGMwd0Leo/F
 15UVXVggr2Bjykexbs8lM9TW1tx52My6McVf3FJPs3puZLaaXSVpGKdj7FPVYUqscYHKOrs2AVD
 ZLXETbQR9x+4xavCh8uL6G0TJiF/dIywnAnmdSJGs1TaZ3h/WOjH5rnKwFeXcMSttik4lZ2dd+6
 nzXW1OMQRvf0xt7WNAWQjvYlXKH9VK6uitrv9mPncNZFUYXxOc8kkMhYcOLhsUAEqqbCq//cmnV
 a1MYgA3Tc62PZhiI+1mpjEKvZmUQmC4yevduKdF5ZVs9RIXju1e9vx7pI86HcheWD7b3c5pzi/k
 uHqsKwQfpPQZlgeCWExiASk7y9oHKC6ZltoHeHWl6631v5odMfVC5ilOJjMuD2xUe2ncIHN4S/E
 i/VeUR0LkGtvY98dd8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070146

On 9/7/26 2:03 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 01:32:30PM +0200, Pierre-Louis Bossart wrote:
>> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>>> find_sdca_control_reset() only ever returns 0 -- it just sets
>>> control->has_reset / control->reset for the framework-known
>>> (entity type, control selector) mappings.  The int return + caller
>>> error check in find_sdca_entity_control() are dead code.
>>>
>>> Convert to void and drop the check.  No functional change.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> That looks also unrelated to DT stuff, not sure it belongs here as patch
>> 08/11
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> Agree lets pull these two patches out and submit seperately as we
> can merge them both happily today.
>

Thanks Charles, Sure let me send them out separately.

> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

--srini
> 
> Thanks,
> Charles

