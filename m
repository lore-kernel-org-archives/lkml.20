Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465748F820
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764786; cv=none; b=s3atEgQs15tUe2Uf3ZB0eXROj/hjz2mi3v4zo3ixp/LIQEtV7HWCP81cIxUGcIk2z2FwWkKSiqkGlgBywqu2UYo1Ly/RRcRSYaeefNyLSGx+Rbs2ew0ysHHfHGbUjiyrL2oDs3MTOzBYZykpjmbV9Hz8f1sAv0VxL+uDfv6Vnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764786; c=relaxed/simple;
	bh=Mj1IOcMIxhElrq67uOZbR13BSh/iIb8XuN8hD5RzMls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/kCeilCBADQG41q86BD5C4Ghs/AWY/7dn6VfzGF2xcBJfJsMN8hqUqQj0svRkOVxvwyrlwgcwrwQTXXC6Wf3CFaCQN6875JNW98wi4mLoZdB+fdVewGKe4XcCVjuvhJ5V+60XAN8d5qzIPjc/fznTMoct8LEIRbyAlP5ZbTefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLTco5Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs5ernKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLTco5Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs5ernKD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dcBU2119418
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=; b=fLTco5PeKrhH7QwP
	/D2Q1oMQ5w0NSRXs4BBCB81BTKRePSuT32S7y6ZIuwUkch3S6ZsEa4zinCyLf28L
	dE0N/rrl1LP8LfzblqA3FOusyhSMUwAaM0EIzt/1fHbeagEzmO8XPmGCJ0TDDFjL
	Zmvvb4w8BlOS0od/vLrXab7Q82xgYDSZynNHU0RcGIzRaFkEw2Hxb47/zyIzeTyR
	CrAi6VozFthWMh/S6HbHycEPDeLFEkFAlN9urLIzrFnHKyOaXMixNTgNVYC/6hus
	O0otWeNhM+s5lTec+i5pIdq3m7yHzOJ1S/hQx6lQlzpI2TT4wcN3y09d8xX7qpwX
	YhARLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheja58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91727e753d4so4823296d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764777; x=1791369577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=hs5ernKDbT/BgHdTfnRDeafSV8lYsHOh9l6vZIPFthkO0CxWfjJ3J6Yo84YrBE9+ug
         zq2RfFsQ8Nug4gTDZfTV+a2OZNBYFXoCf40SWDGDkSKanWBHi/lzw1UX/ZarFOHS0seT
         0apmCI//GO5/xKG65d4ta+6EeGE5lbPNlrWkkAUeuh2huEJ7bu2cLbaDlPHGb2XDrJl6
         KCSkOSf3hjrlrglm/E1gwMj+uaJXDTscXLbgqkp7zwKpxAgCz0miVzVqtMEc39olS4IP
         cjpNisEEDXm78ogfbynB4uPtPpGkn9yQSSOoitQ7BqVXQuH9o/ifEOlMOhNuIRMmmXgI
         DLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764777; x=1791369577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=MxJUwd+HGy83qhaCC/Aj860EdkCxApdHDLUZRg4croq5F2C1uEfETsPUuwtukUxfle
         /rvMJ83joTKWMA2LUnAXuFPt3jdbuFpNWvWwAbo8cAke7bsbp1lxbHI5wVCyShn7l/it
         67WBVuhD4JKh/6x/tsTUx/2fY564ddt/REHdOHVU73Gd2R99B+F717X5cYwJYYFMLe+K
         FLFD2u00z9BJgiHjcRXS4Tm36P9Kb9O7utZe/ilDLedjy1wAO89I77rdUR4Je4NslTra
         49BKce8WUGD6fb4QOoo+XVngStcPQ/WkzMKj7Ov1zZL3my9kOop27cybLVRVT+qkkirp
         rF5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwud8cGNC6G0K3PfR+dhv5JWfkpnUVrJRUEOBjwgXVAedrIEr1UXJYoUo0Lzsd0webNk+NdNuapRpWQzk=@vger.kernel.org
X-Gm-Message-State: AFuF++lPdCd/mB0MvYTcQvZDzfb7lENkyr7UGddYnRpusoF/iLEh9xzy
	hxnyKjX2r6s408jfoVfpcWj9Bf7hOYZfsaUziIZn3umNjQlwCXmAjC3Do7Z/n5cUW7LU37Es9au
	vAqoOlIrHthD/sk+4UgowN14r+pLdIKqy7YiehLeRY6qNTegqXzjCIOV5CEdCD4oOyqc=
X-Gm-Gg: AYBFou1f9gXkVurHpkMUofd2/Z6tvjvBG2FZACQgvWFox3z33Pw52cvvp6822QxvYVW
	zIMe8cMKHT/HoO1O5J3E1j0Rr4tOUdwu/3O2Kft+tQuOnkjssUmAgS1qge1O51M6S9L1PNzbaX7
	yhO8auZcl24ueNB41VE3Szsey4ksUswLghxT94UooG0Z3rWD4uGmyN0JixEisR1HGfX/+bP7ooD
	JbrjZ3KOK4EwK2x8uihpptJJZqpFGh/qpwVYny1uspZKBtqHak3AMstgtrIZb15GaBoSm0gtGBg
	LeXDWfP1k0t/nMlW8ohQumLBqAWQdnVIW/xs3Ovu/Ta5JAXRs0ms4cDZCUkenJIG1k8KOnQkQmD
	aUhTf13lkE9Dz+ShDGq/4OQ==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131064685a.5.1790764776685;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131061285a.5.1790764776150;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f80f5asm47036666b.48.2026.09.30.03.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:39:35 -0700 (PDT)
Message-ID: <667fe242-7779-4a8b-aa01-19277ff8d6d1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
 into common
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HIleM5sci8QY9TCo9SKXdFHwRJtzTTRE
X-Proofpoint-ORIG-GUID: HIleM5sci8QY9TCo9SKXdFHwRJtzTTRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX2PYaZ/rx8wnN
 S2c+qwxXoWKsxbsuI48OwyoqOOsQAfAWbgDUSOZ6O32/a8lnl9fmTHkp+23YBKCaPW6PjSSWRtj
 o1A50/zVraWybDnGMUi6MZJ2kQzjpwsQlqk7cavpu3rsAx8F3uux5ql2qAKq0j+TCM8QMap/tnW
 PF9KAI0Cf1BE4mxDVIVIvs/qWxdMBVf9Py67hKoIO7KWobzEa4WwPJTfSRbzO8H6fg0XosqBsg+
 ifMVOTbFyk7K2iycNhKYe2KmPrTZak6s6mBFiHiJsP2HmYyrAQM+FOzTRY137t6qwdVOi9NTQuq
 tn6r4FRCNUaWB30DDbMUPTYr0FVdo+D83Ct5ckU0RzVBKAHiU7EW6cLELjS/d4P6wAM0c+YAcOC
 /HxaAve2phKVNkhcRkgZ9yXU5539vJp0ohJiytnpx4K/+rNdAMmO+1H/2vz4ty4JjrL3qhrllaA
 96uHPOncqk4A0r93Wrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX/eNQm1BcIY2g
 CIx2H1TlnL69sduPSy7b2kCKg9IgEmajuTEdkCSX8W1aAHDDFWg0wU9KSCmbaAMrAzvx/yux9KN
 uADG2HvkhgYAw1v3Y58IDb88duMEdjw=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abce6e9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LCudcodfsoFH-Sas34MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300042

On 9/24/26 4:01 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

no real reason for this to be separate but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
