Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF523C870E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479685; cv=none; b=NyxmqvV/wnfnDNGdEud64OhYInyTPJf7xURYq8P6xn14erVMjZLtdTLf4C4QIVZw5Zd5ETmzSoCAlgtTSo3MFeBkTnuVpIa9sN5tuo1V7mXlYmdtnpV/YsIwq4NHTI6lEvW//k9TyLyMgn4g6NCpcHUlgUOT1X7ZzG63/S9CGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479685; c=relaxed/simple;
	bh=anLvhaP8qxf0U+DKfnxqiPwSUSauJqWFgMwcq/4F6jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=to8KdH5ax9ttuOCX8o+30wZ0rBC3Ht/IoPjUoc0QqeqJSmxZ1TRwoJTHM/8Vh46G1QjRgbsy7yrbVVBSwppVMDGM6Wn+1ac7sTsPNxv3NR8YId7EwTBLJZrCW7xuQomXI6kdyUFVbXXcfbixw79XEw7j/idNPjoD3H+y0+1brOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YC/yFeUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfiatNEE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YC/yFeUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfiatNEE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Vu22528305
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=; b=YC/yFeUWbUk/TQZU
	/oZYDsbQHFGbZhbRXb0F6pRvynNxaCk1uZOlStF7LF1WlfqBewv9giMR/oA5YL8X
	utnLaOERlRjEwIaOLTOwceQVbZL/2B204PB7r0lMqm3SsnyIPgGhCTbFpBjHDaYb
	V7RPMgdmQnksh92eWK0CL+YPIdgRzMorgf43/9J2EXQalXRT462lRrVWMV+XRmDU
	TGw9uVD7lm4GKnBpyIUuWrLGndS68OQBjsD9CirRCy7e3hXt7l4+S7jH4/VV/CEy
	Hu5rqcRJ4c1/E5vm7s2UrW2bNl7aeTHMZIHSSdPToVR1L/eTF74vLO8Q4eYm0c0H
	G2DlLQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9vp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:41:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8573c977dso3834934e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789479682; x=1790084482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=;
        b=VfiatNEEkccTyu9K9C/2ws2svXtShdvMEvLtFKBXfJmVe/k8Uq/0YBhXwSlH4ICUSM
         TedlXo0iTQhaayayxyDDKFTqlm+ZGwPytUYUUmFE4tieln6wK/0tXD5aI1g7Cwei6wN8
         oREzbaFzwG53ikczsJmaxVufhJYdlqNpoqXhRZ1cT+lGasWuFiwH6HxYjcONqdbhiPwN
         ImaWy2NriF0rSA/zp+MOG3cdWxuWZXL5NLpi7oFdl4AVGjd1soCst5Av0uDSA4qg4Yp0
         oMYvebhphoDFBey6cAjwD0Xr3YbUq6CvZD/1x81B3Xw2Wrt6xfKm/GbElgLezosoqG7D
         8uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479682; x=1790084482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=;
        b=nrUt6uvpdWO8iQwe0CdXbAy1XmNfX7gTpsB/SCQMGYmu7K8RXvhX6z6hvOootkYkZY
         2myUtC+5v0LN3QTIq/RZKPnLiehL3SK9Fht47JC2jWhwNTLLzegAziSj3XsQt/0bW3qL
         i4i591rXRNS409AwvtIa0SNrGcc/ivNi6oBO4GqDwuvzTILZ6ctHd/VyZkyCi/x2WrPU
         Ql7YvHsiQLQeCXDptXcG7RXnCOSZ5457vAEIE/JnCYjte0xO8VOlP0fDzwMB7DdLnhq4
         qfFf/ZOOlEuQmjENhr4DEf2MmECsR+2RR2o3Ao59t8256GmYY9ok3uvKmabv2remfVgx
         euPw==
X-Forwarded-Encrypted: i=1; AKwUvBy84IJ/oXKAXlEcbLQPI9bWhQvnPoq3voU03JqHMc63rUrDakHtCnAX/1LwL/yHwRRzO6L7oTQEOMO62pw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFA56f/Q7tvcIgjX9OxjnCB0JyPNcor2fCKwAd5MnpEHZHUKsB
	xEXIj3kpXma47McIJ1dFt75Z7kutNsQGUoWsRRZavflpz5LaUCtykJXbzs27vWyN3hYHIGuVWxT
	KzM837DUvtQ2o86agjF9Pa1eE47hP066YxqFE8GCw1xlF2/jvYulf+gCxFI3MUGSvyVk=
X-Gm-Gg: AYBFou18klm56kOmZfbVafEYktcooAIGYaDau1x1Xpt0ESd1JbPIvaIeRvneyOu2RwJ
	m8Nfi6MPiF/4EpOao8ttZf5S/bK76zX8i3Sz7vchAAxlIUrSut9QEfTw6RTFMZhyY04kMFhSf4Y
	lydqo7gFuD5DqfCm3oEGBVoEnMknz29XgW58oEph4vylDKf6Ll0ZV/qABQWOM8JJvwThnypw8rO
	QRGvFhl42IvqR2okHO2zMnvgUgfJkUbB9lZFB4S9mg79O47fnAFUEJucdLDs3yeszWeAkCLHxuj
	40NAdNfEyZOduICUJfRfGjyt/FGc5lr6Lyw6OODjXOed9NmmvNOgtKcuOSxWla2kRwZCt+ENOFK
	Q0079f+eyGb3Yp7VfNEualW+ALCI=
X-Received: by 2002:a05:6122:da2:b0:5c9:7a56:10ed with SMTP id 71dfb90a1353d-5c993b59a15mr1424251e0c.8.1789479681804;
        Tue, 15 Sep 2026 06:41:21 -0700 (PDT)
X-Received: by 2002:a05:6122:da2:b0:5c9:7a56:10ed with SMTP id 71dfb90a1353d-5c993b59a15mr1424146e0c.8.1789479681335;
        Tue, 15 Sep 2026 06:41:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm36821121f8f.7.2026.09.15.06.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:41:20 -0700 (PDT)
Message-ID: <9c09c1f5-cffc-421a-96df-753b294d63cd@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen
 7 (Mahua)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260915-nimble-wakeful-stingray-5beaed@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260915-nimble-wakeful-stingray-5beaed@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OCBTYWx0ZWRfXyPAfuqQ75W/e
 vNX91XkiTbZGc2Kj/iWO5kp8SlvFBmZU6p1hnJ+KOGtf8GhVDugp4jRtOyMC+TmyXf+U5WwIGoa
 5I1zr6I2C65aUKW83ZZqH/7OgIHSdwE=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa94b02 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YQ8b7Xp_7Ef0BCHzhWkA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: -RuxU103wQJn03iAO54oyQQCuH6ncmRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OCBTYWx0ZWRfX7xK8W4levbO7
 CzHay3kn2Zc33I21BhoDJUxbDWsErJEpWi1qfuq9OV901vh5wU2GKuQ1OBrMXQ0s1nEB3/OQwGI
 WOUDYvEkpG6Di7iPTT8iftUpgXQwxTwGTiOVK+FWh2ZY7Ust54TNYiPuD02ZpRbGd3TozGv9ErD
 YQqmpipY6Y4T1Q498pM4HCxP8XcAD1QQbQRZkII7Qh+KzW28apEswsR04pOd9g93/MH45y/BVKy
 7Yumg/6WrzDo93tExxU8C3bv2MeLVxeO0wQWmkrMTexhGyolIgpYTwGQMV5vCKWhEUwXde73t4L
 KaVGQym7bNlEMGHuQ4OI4upiyidauKdHO5CfqeltD/URU4tOho+A12hEJFdsHUOYpDSlrTBrv8X
 hOTckfVyEUz7iYepu8fNP5XTAkhsmITtyT+8mRhSmCaDy6SRnOXFuVls7c5ojGDuGisGudr6Jvi
 Ct3jUCHuhjQyaYZeRKg==
X-Proofpoint-GUID: -RuxU103wQJn03iAO54oyQQCuH6ncmRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150198

On 9/15/26 11:47 AM, Krzysztof Kozlowski wrote:
> On Sun, Sep 13, 2026 at 09:18:32PM +0100, Srinivas Kandagatla wrote:
>> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
>> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
>> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
>> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
>> processors).
> 
> There is variant with X2E and X2P processors, and on top of that touch
> and non-touch display. The first will be differentiated by SoC
> compatible but don't you need compatibles for the last part - display?

I only have the LCD variant in front of me
We could follow the Gen 6 T14s pattern (which already has the LCD/OLED
split upstream) and two variant SoCs for v2:
how about something like this?

  - items:
      - enum:
          - lenovo,thinkpad-t14s-gen7-lcd
          - lenovo,thinkpad-t14s-gen7-oled
      - const: lenovo,thinkpad-t14s-gen7
      - const: qcom,mahua
      - const: qcom,<X2P SOCNAME>


--srini

> 
> Best regards,
> Krzysztof
> 

