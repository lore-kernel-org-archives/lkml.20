Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476256;
	b=l7oIw5tdoEXcRWBjeOaVzVoaAcoDoZkCwL9cyZU+YZ8mqDqOyi8jN67tDS8cp0X2tvww
	 O1rlrhfE2DPUywS0keFm1HxFynKoC5DmxKwzaYGPNMH0t9gI+yF6iyy4RlWM9NP2Znfl/
	 ZL52PaMOus+4sgWQFm81iVB1vwvUQJ6OKgYw7hrX3NWeY6rpt30PUqHZdXtjLAQaq4bRP
	 Zv1kIL8doxywO4gCyirki15rrzYsSAp+HgoK5SIBd6txdszadA06SV2Q99rAMSaBh8MZl
	 fOBYblMHQGDwW25MCfT7R5Btx9S/YtfL6BDTwJvgdzH9/A+VsMfP5QG74XLNNZYeBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
	b=H0OXK5AsUi3PU+0jGuqAv2TSIoRXvyw0abnpX3mMwRD/CpsT7c8z/1BPFolqVTMZctQh
	 Xe87wvk+xZzXkKDohb8oiI5NDmwZBbk66Iw/Ddprhpk6h3ltP50EsWf3T0HHy/oUa0Zpb
	 n5s80NHg+mXAh7nwiWVaYOEb5IZihkuj8rGQE1L/k/edoc/vxY0xXT52c+rSRDRY76E/v
	 7/hcXl6vFaMKACR15r3PH5qhFBRcYYgPYTAOZ9W4N5fNlpqZBHcU+lbKvGpPXuhsQfjjO
	 MyvrG4tgVE65NszR/IFASZyDXp8JGHtmI8x64msfqGRBkNNR+aRt43R+OH79C3rW2MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3apqZVV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LTVzLV5s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6336606A88F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6336606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3apqZVV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LTVzLV5s
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pYB3477100
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=; b=H3apqZVVjjVPAEjl
	cN2Cq6WnQgu82yoBdhcSfDWr/trszx65NmUBb1sj36/gsMjViqa1kMPyawRmJTPh
	J5kJz3KHXLt31PdG+BUb2dXRCFQphRDLPTY8aHR47Pb0BT7m6E/ouT3WBpWr3/9M
	EucYbXufySicB3u1Y1WSCK3vL4ubXLyamSK9yPmVL8g2LtZNhwkgndRBFPe5Xj88
	7spNDVV2ZTlc93g+rdkSRxZI7ou6EmwZCty/Hu+CaCdtJJCND2cms/MROOp7ylA5
	oYMz+C0bW1i9HpZNbD4/B75A6YO03cD3+SeHt+jPugAXuX02VOiOn3/2XlTmHu9S
	C7L/wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugxfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so3048474b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476254; x=1795081054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
        b=LTVzLV5sO53UK9acz7IqnzQXrVlTbMbZ6Aj+qtLc6U34/Iorqhf2f/ft5+DKnGQ27o
         I2+v88vEYbh1bi9fUi5sehxDJ6W1i00ewZstJMJvEQ3tgL+CAafODFh8VDLNDCSAKI8e
         Qy/2vIEZoEikcqQokB6sNA5Han2GL7GiAIZrfTjQ7ll+ETRWM4w7nT1LFjuJiRE2iFki
         Nr16SdOJY7F9zyqr5+x28Jo+w/PYQ4CMVRXgtWlBpNGqtIT19UhdLSgZB5X1IWdkb8PB
         vvSj4+Mivy86/X7GKaetnEc9HSKoS9X9vAuPU4P3EYQ2lkQKSAVUfZkjoJo7i+hxfN6l
         rK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476254; x=1795081054;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
        b=GCVRFSlp/sm18effiWR8isexBN+B8Ii1VpY1ekWA6FhZ2fwhDWwSETVt41poXRlFs7
         Pz2KJDvu2RJTSAS3KzOnzFCGb35Mf6uS54zkIevn82tQ6zxm9IjsREzvp5fethhBISv2
         okxj0nSaKmG9PaPaqvqamJLIELMKRObveF/bkUr2J3U500xnC+OFId1wTbKU6C3ekEJX
         paITDCCSM7ag4DujhjzkUOuiZWlXCz/fLJd+npn165czIzGwIN0Z9mZJZ9kvINqpO2Xd
         kbm8RuGsddYTEhF6tuAPbwA9Z8SEIMlqPzil0OCxKhscThhNhCuF1KpXkTL8IkA1XzPP
         Ww/Q==
X-Forwarded-Encrypted: i=1; AL+hErELT/ivzwzpdpbnXaoxli8tH1DEnRVar4pAyEjEP0K3s5qu4BdFy8i21mW+7M3uW6uu9ja1jIbjRJHUHLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90BJt1oL/F7jRz9MgX77xLLNSYf3+UHyxdwO0exnvjaqu0HFla
	FTInEX/CbzNosyDM8U8eAs2Mmn3GPYBe9ZLeDxfq0uX/b/CY2fV0c2tiwC9UNnx/rTtqa/tGhac
	M31Ky1f43DQj3oiudRCR3MVxHljFpDIIishxcPkUNKHGyVqEwi9+YzqnBefIiV2yxR6c=
X-Gm-Gg: AYBFou2wfOzbg6kSGa9dX0qAqbJaiHxAJRu1inw8bN2eETdNivbbsIHu+LKVJcj2XmO
	F3nRXI/Jin1XEdJTCrYwSzGPJ7eAHU+67Zhqj2ffeA9Bj+CLI0iJK6Lm7z9joZuKwqqjpdZAuGN
	ZS2j3j2NwjhKgJkd8fsoGKv3qO9gksoYQS+kGygpk7ngCQo9AX6Gid+3tJTl8twkTlRORlCNZYy
	e40lrzLtpRhbvgYRfkzUkgmhVsjyQwxi30QwqXH85d+gaDYdgBk24lZ7LuUpSHzPcpnkMUS12A5
	Ervo080Eyv3ZSqBygk8yAUYXED9rIEYU6VPrV/iJ72nQOs94kzx8CT+nGNq2YJoOJHkvpcSF4Au
	TRPbw8odI8FVY3Ud8PyWgO0k5UCRwaYHwy+T2AKyfZ6ER+UaMj2v93xp4OqPhlvDbY4IxwIDUvL
	fPRkDs8Nw=
X-Received: by 2002:a05:6a00:22c5:b0:8a0:4807:457c with SMTP id d2e1a72fcca58-8bc1d332510mr4962212b3a.39.1794476254226;
        Thu, 12 Nov 2026 01:37:34 -0800 (PST)
X-Received: by 2002:a05:6a00:22c5:b0:8a0:4807:457c with SMTP id d2e1a72fcca58-8bc1d332510mr4962180b3a.39.1794476253726;
        Thu, 12 Nov 2026 01:37:33 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b1bf1sm3225569b3a.12.2026.11.12.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:37:33 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c19f662d-8d04-47c9-a458-838e46521f2d@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:07:27 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
 <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
 <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
Content-Language: en-US
In-Reply-To: <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VdYTJXtVA-vA07yengJ2Hi0EJ1jII16J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX3kuirZ3WGWgY
 3GorSp1hC5KsPo5XS7WgTfvkdSJrJpsvBt9wrQ9MNrUItk39w0ctj3LKCB/mp+FsEQ7xG6NtHGq
 g/f0BQFb0bWyCreeORqsJ/XGO2YYQR4=
X-Proofpoint-ORIG-GUID: VdYTJXtVA-vA07yengJ2Hi0EJ1jII16J
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af588de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sM0BxRoSGqECXxgCHJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX08+KkCoo9GjZ
 KsiQ3llrWHZJ1pzE3EaygQX7XmJj4VivRA8T8T7Eyw4T8Csqiq/3YH/UkbeBedtW5aPl39U8ImL
 8J1ZlsD3NDBNceoJwwAw+mvqPuwq3hPmHAKSobahuuYusRjcb7U5heedS99M0FvKOaSdEvZhYH0
 +XBZiUL8kxj4DrnnC+KE2hiSbD0eMh8JsvzdXgniaD9YiHgSFB5NWY/vVud1IZC34M4KFR/BLwq
 GAe1XBsqNmAMB2sUE1uQkfDE2pK/jKOOwuLEoXJ6driQOvuhv3iAIbc/olDW1irJGrqJfkZGSoy
 5D3uX+d2gQ2QrVwrBu0Np2ZKsf962OcB0v8vj1gA2vl5DkS/bkLJZ7/A7uxat0+ioTqB9zj8Feb
 O9IOxo/Nr5hA6A4EoDOlFddGuS4bJ3xO1Y0hsv+VJsx80e21wNsn6jmkdP2akQ+6zsLVb1bLb4a
 h0Acju1VzsVB5Z3vQvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120038


On 09-11-2026 18:48, Krzysztof Kozlowski wrote:
> On 09/11/2026 07:27, Jayant Shekhar wrote:
>> Document the Novatek NT37802 AMOLED DSI command-mode panel.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
>>   1 file changed, 45 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> index 1b38c1d0af68..be318cc84d52 100644
>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> @@ -4,26 +4,30 @@
>>   $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Novatek NT37801 AMOLED DSI Panel
>> +title: Novatek NT37801 and NT37802 AMOLED DSI Panels
>>   
>>   maintainers:
>>     - Krzysztof Kozlowski <krzk@kernel.org>
>>   
>>   description:
>> -  Naming is inconclusive and different sources claim this is either Novatek
>> -  NT37801 or NT37810 AMOLED DSI Panel.
>> +  Naming is inconclusive and different sources claim the NT37801 panel is
>> +  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
>> +  DSI interface and regulator supplies, and additionally requires EXVDD.
> What is EXVDD supply? The example DTS suggests it is something fake.


Its not fake, it would be something like below:

     display_panel_vdd: regulator-display-panel-vdd {
         compatible = "regulator-fixed";
         regulator-name = "display-panel-vdd";
         regulator-min-microvolt = <1100000>;
         regulator-max-microvolt = <1100000>;
         startup-delay-us = <233>;
         gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
         enable-active-high;
         regulator-boot-on;
         pinctrl-0 = <&sde_disp0_vdd_active>;
         pinctrl-names = "default";
};


Thanks, Jayant

> Best regards,
> Krzysztof
