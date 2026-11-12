Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476891;
	b=fxpfObj+McIp0P7F4KTWbR5KIr3cubd/rIFy7G46vQ3Mz/5il26icDrPchAwx5QGWQuj
	 bc6yf31yzXMYIKYiiclWl+Magp0smnzjWRzLSi7QB0mpmC6nMCa6j95yvyCovkwbxpmQu
	 63Yba0fMIESUDpmucsaKKuk/EfAOXzPpy9i6Wlo4Uj/I7Egm4yssnyE+e9pXtx01sZ3Ln
	 h3cRJ3L9E2rzt2YyLrVAUNugALisAidG9V56pbxClJXmhrelujQsqYYl5e/tBqSnYHcmf
	 37N2kEueoBcDC8RlinPv7lZn+2I8sXDiKjAu2cYSc133bdhE2zB5GDby+O8osxj5gSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
	b=r3RcvOjJM1R2NxsxNmLLTXodTrpSyMRGjOac/Mo9r+2xmp3cjE2boE9TIKunGuDTpQtt
	 dwE81aRRdAtwtgvWkWKkiUw1oLXQDJtP7aeCgJk2YZ1y4WjEsP5JEfGXvu+y43Cq34/U2
	 /giSuQUU4nx55TGskPu1rPGbR64EkjXlXXEIWv4kACK4Jqht2RhwKojgBsy0DFd/CqN9j
	 dUDiDUnFwvktiwHURZ/RYC9yavm9Rcw2P/S5kRdIDU/Ln545YfLbEluJB1eBUN6cxD+QL
	 jaC1WjDa7g5xNsAjK/93DqI7cfWOaW85oyV3zwAMuJvYUK3wFtWpise9muAhr55Kp3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8C606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5neJR441579
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=; b=lEYzziPz3E3wXE1N
	/r8Q21KLI0GSOoZbw37IOQi+XRe64yyHxO4KJMKXyD6wHBr3+uN2A2DqG1aZFVCb
	td0orAtjRp1dC4j/KyPqG5d96q5y7vKMm2BKTOKsdt1dlyUwp24z+1cEnebHmiba
	lsmQibx194c8rA9m2TXh3aOD9i7AI6KxyLK00WTHqjhvlhD4uAN/bB+W+ouD9DVf
	YFu1UNcSm+Up02WumBc+r6ikblrY5kMlzpu37riEDvTPfzmaBSpLyb+pCef3TTpE
	LJnjDCjjnF+Cz0U9C2aBPvT6jwMkRiiKlKn3l4dQXbHdnu8pkdbQTpnhKR5UBEBO
	sdPQmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0vkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:48:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so4876414a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476889; x=1795081689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=SMUX5PHiPlllflKY7kQ+2P9BqTBM8JJeGTnpynpIy/4plAaNsF9TwoyqL+XvBHRNj+
         28svPS5oCN0pYbZA7x5hSysZQMu+UYrqCrNUicl/buFa1Z7UJXCoBF5sOU6RSLWxI9L9
         wSeyFn0+ZOXTsQ+mjijgiyzR1WJWms0FgCpxIuMmQqVK2rnDepNvdRziSsSjiw34+Y+Z
         bitq/ytWh3roml150G/yxbKueOVgPUT4rDxYc6yPqhrIHs5qxBGtuDBZdHb51PW9CUf1
         vrZrVpviKZ1hCLEHQG8orisSNVPsP55dNBv6Idx+DNUXaNHPPiMo57t8aUG/Sa/kbmKj
         G+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476889; x=1795081689;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=Y3F3PcLrFvcDHZRnL64oxm98CNmOr5KWqh3pjUPn9LcxTMKC3pW6rdTN32dX62ISfo
         OBYTgHRV2uIeFr684hY7tdW5t3/JPBnx/vjYHdptvtlIC1dnyPTzw0ZIoZkc/d3p+oWW
         EZNHeOD9eoMOCms+MrQZ/yzmNCqXK/8RJbkCnoj5SV7VWOaAcDQng6Br29N//ssXF0Li
         sv3/bTOQAYMHvUWXK5+SdQBOlxhuH/8jn/Md8HmQcYF2GMSSZ7f92I7g7dK5o36v+yGi
         F1hmOQAWVVfs7h4RCsY+iscx3AWddI2uuDfzTBJV7x02LByfKy8l1geOV3/9uL5cEGEG
         lwLg==
X-Forwarded-Encrypted: i=1; AL+hErEtRbkCMvI6yqtCDJZZKxvBA16kXeekil8rbdNk4ZtQoID8vpqoJCDUdOJRTnh7RQvQExkE/5Zw2vhfBAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oGUie/DkSLU9z473aN4ryNnwgg+3W+nMcEL0Sjk7Dltd8tROg
	D9ktQGHyluvI1EVtwttsQRddaO2Qye1JIoQN5QMB+BKz2RrO1RyyNKPFvcd+Ai/hMKli4z0kz9i
	4jn7d3oEs+YI4W+Im67iwFmWZ94Q7Q6eEkHF27ukc/4P9S90MYiOyG3OwexEhXsgPpT0=
X-Gm-Gg: AYBFou2xXaEYvAQ8GAFVezTE0SvRYKlcOziouSDO/7JmgZ4h5LmCiJMMLmhc7UqUryq
	dFuATsiyVXg5CCq5/gWh0xfbsQ17MhMQJIe3StJ7qDAYD2F9R0GaPxmrL0BNjL4h9cuXgRO/9t4
	zQdBaNbsVZPqZ80WilnEEQ/Y/BKeK15AMIwCBLDNo1A1yPs2OPv+9b2K6hkA0f232zqoU6ym2m3
	UWYGzYYBJGjtuXaq+xOXOntuyq5e4c6hQRXXcoCMcXAL/udgrBxvgFeo6+RTCa5RpTuBvWX9Qrc
	JqR40o7quZoXDno4XfdoMdNCfNZruJeLqhgrR1alwN9kckiU6zJKkxZKBg85f0fm6dMIu38pCKz
	MPKqlI1SeX7bvyipOou1e6kdnGEf9WA0KXcmmb/ghj6hna5wA6n9UJZzJi/Ne8sw1tXWzJ0u8gY
	8bwS0yBcs=
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003644a91.12.1794476888812;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003594a91.12.1794476888303;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm3913394a91.10.2026.11.12.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:48:07 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2932200c-d930-4d5f-a308-0bde202af349@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:17:55 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
 <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Language: en-US
In-Reply-To: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eqmmVfj4dSvd4wYHvUnRU_AtI7o6m2N9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX7Eccw1hI+F3e
 8mFwTfEGjvJUqLLX76zX5mUESyRA6tZf8mRJ1ujiw0U6GFMJB4SLjWoK/ct3GomyHg4CXpOcXV+
 kW2Rv7fuq5vXGF/7gIOjku9t4O3G69E=
X-Proofpoint-GUID: eqmmVfj4dSvd4wYHvUnRU_AtI7o6m2N9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX7ncWIvXe904l
 UUpSTD5gwkowRHwha1O/+/B5O7ZZdeGR2vsU5aNoTfWwr+v2w3f4k1QCxj/q/gDLZ0bTtMlusjB
 Zw1iae5/xWunOjZzs12eNR7yX3FJQO2fMTot5h1JA89NdwLyGgGEj8PvC9Kcnbmu+LXsZppCXKC
 yts8ZvPT9Uhe72mk2MDqcX69uVSfiSAkNKvWFi+omZy7kVCsYn4yBLWJ5dEIKzZhzindqBaS0eR
 jFm0pCwnxowDMnzRiqlauShybCu1llIuS1mGIaAn4470QLXiZztbGKXeHap2ThjONEsOw2ptKX9
 lHtmUJKKlIMFGxQWrNMCYuAyzSbGbnoO/YYTbi15CoOm80xd2HJVYj8Duj5jHfucfITyo1tLYZ1
 1884aAac3Ao8C3fzxZgIX86XRZNbIB1d8mLsUZu68Z6cn+8sPjMDKbjtNB8an/Fj7h5bsDYPmPY
 rRT415y5RisBMr/2Ydw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af58b59 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8VBehk7qD7xQtsfHT0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120038


On 11-11-2026 19:43, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
>> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
>>> On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
>>>> DCP platforms place the display pipeline under firmware control, so Linux
>>>> cannot discover display resources through direct register access. The DRM
>>>> driver therefore needs device-tree descriptions of the Qualcomm transport
>>>> wrapper, display topology, IOMMU contexts, and panel connections.
>>>>
>>>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>>>> subsystem. Document the IPCC power-notify resources, transport and
>>>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>>>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>>>> after the IPCC power-notify sequence has completed.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>>>    .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>>>    .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>>>    3 files changed, 334 insertions(+)
>>>>
>
>
>>>> +
>>>> +patternProperties:
>>>> +  "^dsi@[0-9a-f]+$":
>>>> +    $ref: qcom,dcp-dsi.yaml#
>>> When adding DP support, would you add more devices at the same level? If
>>> so, we risk getting a warning about multiple devices using the same
>>> address.
>>>
>> Is it good to model each firmware INTF as a single interface@N node carrying
>> the INTF reg, with the protocol-specific DSI or DP description nested
>> beneath it?
>> The driver can then obtain the INTF index from the common parent, avoiding
>> duplicate addresses across protocol types.
> Yes, it might be good, but it's not what is happening here. You are
> adding dsi@0, although, I guess, INTF is 1.
>

I raised that approach before v3, but the patch still uses dsi@0 
directly. I’ll update it to use a common interface@N node keyed by the 
INTF index, with the protocol-specific DSI/DP description nested beneath it.


