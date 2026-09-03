Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716463F1AA2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432102; cv=none; b=LwJaN+pU2a8ZJYbtGpxifbnkZ21rBGB1Hj4chHA4RYxab2/sSK0bIeVqt3pkhMghyGCKiRahiLjJ0IMRWf3UR7jKUQWDDFgGLbYo1VvG1socOruwivZV15WS25ND2CYZQyYUAszEaEOb6nhCoMN2xADd43m1ziQBF46JuthSD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432102; c=relaxed/simple;
	bh=68B3t64SOxXUwsut1P/YJ0Xpd4G3o9FiApHDctPM+z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlNZW4Cm7uEZvDhpgkAzWXihGcEid6vxxUSxaF8zD3g0Qp21qA0Y9BG1C7z00K+BTGJCIB0s9sReNXJPZNVut+XYzvYOtxUz44PLcetoPLvl/QREOr6IS3As1nQhopE/7f3HTv+dSk3NyPF0HMBcszFWj+ezG7bGIABZC13a4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1b8yLeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6O0sTOi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1b8yLeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6O0sTOi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHJ8b055337
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=; b=e1b8yLeIQuggebWD
	YqpVSGXwLusCv8DoR037i7QpLbf8cAhtvCLL8U57FMi5NI4efMWXGdgL6wq850TY
	g9aofQ5CZHR8Ve7G0V+oAYPZ0AduUUsQ4GQ8O1EtuC4VBTnbITCzulp3hR6PUCdK
	4BSBykN3xa/GR1fjMLj/KOfNkuwvT/CjMZmRgRC2qTCZLJcI+RyLjJCZ2mWUM/AS
	YYR1+3RxzXKIDsxkeGDuazI3fCi/JfEw1EhOju1nAhyMJ1kwRmb2Oxl6dvs+qRBI
	CHtMbfymMbCqkWhiPG+tn+l5lV0f457vo/6i9tWtsxwdiTueqiiIFhQH0e9aSYwu
	l27Crg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvgqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so457056485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432098; x=1789036898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=R6O0sTOiD5u6K2HH2vtdCOk4DG+TO+mHyFI79LkFw6YqsWZvyqmhzIfUObeSDwp438
         DhN8HDa46y/gexZ4ttGiXNoLcoEh/PSyauOtr+FjLXc7NGieqAnbLLHpahb07n7WPoNU
         EcL+4R8qGGROmSbyV9ch/BZW7HJmFqJIdBdUcQ7/tG8F9yeQ80swLFjV7RSvNrt+GpPG
         TEa9nSpmY9fg/oP4EdgQYDsnglESckfgvgyonxaui560lhHNsUdWES0ttIPJ2ieiw4Hi
         lHWehVS4vjxWIPiCebhvGn3NRAn80dSMyprEmWOrGlZKAr4VM6es8zSdQZBKz0H0JT7Y
         WT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432098; x=1789036898;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=L9TVz/3INgO0csmJ9mtuH8BJG8isHRu6hgVQ1bc0KCuuRsBTDrXJ/pEtAlOwLJ8uxS
         MFrsV1AqNrQtRiNG0uW9Q7t5Gn5dA5jOQzDtxi81BfBYBH2MoRNQeiOd40gYkOLpmtE5
         68RBGVlplUFNhvOfD9khI1/AFIpEXDqv2lzUDOdjB5izgVATflqtfx6/o/ys0Z7NVTJb
         x9en+ZrI02/ldRzvWikUXxyXjWrkbqyB9qhZJEGLVUGx1WIlkzg9eQyt445I8JK9fAIP
         B/tw3FAis7de47FgNj3EzAoGEk7DTUX1XX68ZX6xcXVYpf0n7CCoDAwAzVDFHiTYIUAT
         k2+A==
X-Forwarded-Encrypted: i=1; AKwUvBzKzO3UOJB2wipdVRfJcdAU6zzSMSSL77AYNplmtEnzaPcmcCglWj2oJOwBTjWV8ilKwwAI8tZsOwyPOo0=@vger.kernel.org
X-Gm-Message-State: AFuF++mT/oFxJ61vYyrcbSmCPPG6kq/uEh7298Kwk11YkYJAek7Feg5I
	TgcP3DUIsJYLwNfUogcjThpssQZ3DE/eRpZ59v7O7FWPgsEp2L+7ulgnqwNOzQc1kgSDzPhE18t
	rKluA3+jPlPgd9WAY1xbg0vgV9E639s4cMfLtnFk27FHqdmMTD43MxwkBSEl3VtMuJ/A=
X-Gm-Gg: AYBFou1cWmxMB/uFOPrXlwS37LV5JDX6qDDd76Ogy0pO7dGBu+UbuXFRRgs0wlbDaFQ
	F/vA/AWjY9RCyUD7Q7FqNBU49hp3S3Tvg0OgAOhHjJY3yABRflvT8ckAJJb7zDVt+/Ogz2j2Q2+
	yKfHXBoRaZtWMU62NlHW0E9hqZTeO3stdGAXtbLdaskPol72iWgHirMBGWWjZm4I8bW7gl1IK9Q
	Bmx/fG7kecrTc5HqNIBO4dbPQmmldT06rfh97RKAtSLdeEpCqv9ltohX7ZzKwmmdsnbB1a9dAd4
	30pRKU9AE+GIsRngdHPlbODbhjnEusFW3fNF9Xh9WXCQB+fMJ6S5KdwImvGR9o+8Z2OXL9vaiHM
	I5dKRyIufFKVuDUaPBk+XeLcprpTo
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154355985a.27.1788432098233;
        Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154353185a.27.1788432097758;
        Thu, 03 Sep 2026 03:41:37 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm84661625e9.2.2026.09.03.03.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:41:35 -0700 (PDT)
Message-ID: <36e58345-a236-4b77-b49b-961a0c439b5a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Marek Vasut <marex@nabladev.com>, linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a994ee2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8b9GpE9nAAAA:8 a=5JN2l_4S2wR4MYYaAzQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: vvIjRgF7NqRp4MpgrKx1jkhWQvnCw1rN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX8WyJY6ZZTzzh
 Np5dJuszhCl4KF6Ud1XOxqPlrLzZeDlC1WoDGRx4rbHAF6y9zuZpjfp9xS0Li4rbWVZsURdwi6u
 NCSoRkm8A5r01rK4vkpixD3EpGGzVE4KJ1OuY/Zotk4dEDMTw+WHWR4Zx7uvZka3djK1dO6aohj
 OlJVP6fJM9HUMpz1mE+7WEShlpA9Cdtf9MEQz76E7bCVNLPpptq/2xSpKyfiUobIMNSF1kv5ymZ
 u+Z1XdqowK3olqtuNrPRM9jYblvBoyVLp69de3nJsRZZY39Q3Wypw8GK06Ghjqx8MerbUAWnLDx
 4Wwiggz0k6h20lRhezVYgco1Abjc5VICYXvBWX+jdbRiTyXfnyUge8Qre/nzX4Xj9igDU7YZYAm
 3htYRoQqU6bYWxjf2IaPY3icAUmRtrBdNMnw5RxgNciDooF/tQYIwx35wwDlnqaLYAfXHSDrTfU
 wgWwTuzapd1xYxBz5JQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfXzwVrKB+feKmA
 sld8rrjoJGe7qwRBTta7keiHFCJryw0nESgo9q8PY6oLAVWu5wZTKYRVEa1K/ppJU4FkwtpCEld
 1SK2fBUx4UT52OdUeucHO7jXXvnc1q8=
X-Proofpoint-ORIG-GUID: vvIjRgF7NqRp4MpgrKx1jkhWQvnCw1rN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092

On 03/09/2026 12:19, Fabrice Gasnier wrote:
> On 9/2/26 16:13, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

This does not apply. Otherwise explain me how to execute or interpret
this code on the device.

This is a series of two patches, so why can't you provide two replies so
the tags will be accurate?

Best regards,
Krzysztof
