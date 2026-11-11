Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381021;
	b=iidZUcLS6Zqcg7f+EXnmYb7iKJA3vBc7efhFppXV23CImrgOJW2K8SWUM9l3HX8nFPUQ
	 YD/o8hyUC/aHk8QZhmprpYju/yy645PFQCEyWVJguEmQpQKTSyKuGadnEZQexuanRWZYm
	 mTZ+xUB6a1UAqmSGvndi3HUDcfU0AaTjQKOqN18e0nfrQkLv1XoCuklEeXWm7eI/0tFUN
	 WkvOpWkm1WDTWj88f59n25gG60/KkoM1tPB0DQBhaXe3RwJgd7+NLsqdyjxcYHUBDxNMx
	 2/py4wcPOxjFIqu7TjkeUadwk6ufK7JrZiCguTFoBHMzHRLlC9Eey8lrYmotC4tgrgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
	b=4UN49mgEpIngOJOxK9OIal1P3PEvDMWlVXkAQEV6Rxd/cAsR4hdp82bpZVG6gAZp2NUV
	 5PUVlfDYBPfX++yV3rxo6GNo2Mqfca04x5Ht2JEi+CT/h1av8OK07raci/hCuJWn40GgM
	 1ZlATncuG2wh1/iR8qrS+56MWO10x1SzNj2ifBvRg40xLVc9FY0tAKLSUB3wKHedjonDn
	 MODHgjrgKZSMQug+eiH2oR8W+TFeCc6CTt9hgoF4cyQCb0N1WW+mMmgH02uGRedv5PuNS
	 QJfs6Q5e7BL5+Gyt39OkD/bY/T99jGibHsNJYz+rC3DVt0KFPZhbhzOIEwLh7eFg8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41677606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41677606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KKf22017370
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=; b=oFND5jF5muk5SSG6
	x9JOIMx9x232dA6O2ATNkn6sWV0UodJv1+B2e7BRi/puHKK8AUR3TCKzZSGtSHU8
	9svUKvzTsi+LNIBpG9WUmauSZVAz3i+BsmJrYHCyEeM/hFW/FH6qgJ3hgeWL35Yv
	uEftjHP0oJPJe+MDww6tHw6iOIcKMTigexvq2AeX4u1fK6vZzGdfnQcYXYTePa2I
	4Q0VtRd+Bvs+LivjFQxX5QASU/L4lovBjKv13Z4D++PI7GQCuH3Ajy6p4jxbeOD8
	i8JlOF6Y5oHK1md08FgF+fpfAeasxFiVwtIyzC3O9rDt6zLdXM/3HCe5kkA7ymTg
	ak0HgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97caeba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1677022eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381019; x=1794985819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=OUGMh8QU92igMJN+j6348pMjzbKZEJVdC1bAUubEBZAaSb/CcM9ImEil2aOFdxnlnP
         Mruida4AgLaKfJy80n5i+lPlZoGwJrT4tid8ipjhuoQ2BN5q2Xs0fnsLSLoArTBPQ7HG
         r9W4f2HoBgmDkeb4w/v6Xd2hWmIKnP+YnurR5pM8QzPzzQZV+UdW9JmlssXUt+I3r/9k
         +ZhaZ8J1sgS5INCO6wi/pByCibkWrOZ+kvzrCzkJNrf+kbZMv8p6OZ8Uktr6Hul3AN9X
         ser7Ww0tpi/V5wfOSohrPGFxAaj1jO09DCN+FH+/dgHLYOElsiKimEgkGDfwvQRpCa9o
         HdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381019; x=1794985819;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=Y2SZnd7VoBztLG2WkwQhwZ63WMZQlR6J1+ZHb/rBIPGxevxYQfbyW/9C43x70fHkGH
         a2NK9KTjQkyxNFS0Ylw0O8T2XqCIha5oExVH4qt2th6KIhWnlQOE8BhMW4XzGu+/LO3l
         8h8DyyiJay6lhuc1+SIiI0br/wDkaSKor4H+IjPrJYegCPAVfeYgQ6QSAUZ/hczsumDI
         pG+8Kt8bLh6A2Wem8+1aljgcq+I87g99nk+q7Asj9ku//YrR3P4f9OKlfmFhRlW0/s0n
         8/3deW1L/Dby0LD5y9rHSUav13a7h7mwPb4Yz9yxrFoBTtLa+Kd4c7OWzR3qHu64+mm5
         TjWQ==
X-Forwarded-Encrypted: i=1; AL+hErEqF8lnapMyGUoL2TEAKdhzlcQa3BxXEsEU0CkJUcU4xVyIb2lrMMfnucDez6OWNxsAA8th3edrUhn00Cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91V5gwPiURwj3Y4BLACJHl9E9uWfBh5Z+XnUH5XdHWPoRgXYL0
	C3ZUVZlffXupbC/kbMNXrBiHtIL+2oT9iyqGcJ0F0Z7tL9pl7STjaFUfbTZbcWiZshPPVmxKDUA
	klyfZ4RE8MsRilfFF6A+HQf3liF4iMiVTFI0IHDRm+lQC4GEIEOI123+nyIEsk8f8miw=
X-Gm-Gg: AYBFou0tyglgocpZ6Cbkykw9jPpo+29623eP9C06Z0bMNuKVenCa/dnFFDE4hz8mxi2
	zlIUiMq64R5rTQJRxcG9/gwhksScEPHOccO8uy/cjfXBHrHmZ2WCLcMGTVMCyY6CIKk4skbdOra
	c1eqdPVbpqhMcZAgE09HXGIrqEqm5TO+XBhbvoC4rUzP7GozgxjCUG9Di+chORm+2CiXWgjJtRd
	GWgWw79cGUGTfpfSWBhQYFQYpOOyvxgneArNf7/ZqFWuieMGV0LN+BcSxCoFoV9rFQhSdSrA3Cv
	Odx22zbnTF63zAN8UwL6rg7MTkQXtRED5+IbrW6mtx2U/m+LPimeG6uC1Pd2Iae9D0jN5QLZxJ9
	4NY1IcKoh8AMUv0+21bacDfLbbz4URscBLj8AKzOzKLk9QkKFFLWGLwSPqcQQBkAFr4VpJM/5Dq
	GgPm7WCOI=
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917658eec.38.1794381018882;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917632eec.38.1794381018145;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm12686718eec.11.2026.11.10.23.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:10:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2fb9fd90-fac5-4a9e-ac7e-5dde689d8b80@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:40:05 +0530
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
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linaro-mm-sig@lists.linaro.org, virtualization@lists.linux.dev,
        Jason Wang <jasowangio@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-media@vger.kernel.org,
        Mahadevan P <mahap@oss.qualcomm.com>, freedreno@lists.freedesktop.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Philipp Stanner <phasta@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Language: en-US
In-Reply-To: <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfXzGU+VPKqxrVD
 VHwsXi4WkNcyosBo5qZuOH8GCjVIY3J4soPsspTW3QFnKtSR1ZSWmsxY0n53JJ7qSOSxO3tdqf6
 bYol+fkFkEaSKY9l4P1GiftVVUh/Aye/yZ7x2u+qwQPUOxahrZGAN0w2ahmRb7UPoYDqIDFYXDs
 yC1NUsXCG07mbaLI9DgI931C1+wXTPhWiOMc0/kBH3DNC7UEX17K1jgKw2lSFnmaeTLkcAK5/4T
 rt9kbGB0ymszTVBN8ubbUOtGjXLo8HIzsZrpjwoad8xgBnDMD36Rm4WGvokXLeWK8oK/vJd1d48
 FBK1iZ7Qk02oZEYwFj840lQuSMa2Ieqdu3othscUD5R9WWK/8thVTLk4IvgLljGh3w3EeowVOxr
 4lQkOEFyPFFF2COhqrUANggo8rW9YIDdSHuYKSLnT6bijdpHZt8B7C/fR/CbZcJqxwV+kbSGC2u
 Dm6QrzmtqI2wSVjvIPw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af414dc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9TjDuG0S92mpM2z4UZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: gqZnchXQXWiYthTUb8lA_MDotAGeKa3L
X-Proofpoint-ORIG-GUID: gqZnchXQXWiYthTUb8lA_MDotAGeKa3L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX2wpwlwDGvJz9
 9MbXCS3jYSfdvkabH1m5kb6toywXdJK4cgVIlswTKQc9JeiayTPocwyLAgr8CmCi1ix1u6J2SpB
 k/V0MYivv74ycvdImLinNVM7zDEFxQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028


On 27-10-2026 01:14, Rob Herring (Arm) wrote:
> On Mon, 26 Oct 2026 11:51:11 +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
>>
>> Assisted-by: LLM
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>   3 files changed, 334 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml: iommu-ranges: multiple incompatible types: uint32-array
> /usr/local/lib/python3.13/dist-packages/dtschema/schemas/iommu/iommu.yaml: iommu-ranges: multiple incompatible types: uint32-matrix
> Could not decode node virtio@9be8000 property iommu-ranges with value b'\x00\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00'
>
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-validate", line 8, in <module>
>      sys.exit(main())
>               ~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 443, in main
>      dtb_diagnostics = sg.check_dtb(filename)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 331, in check_dtb
>      dt = self.validator.decode_dtb(f.read(), decode_errors)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 631, in decode_dtb
>      return [dtschema.dtb.fdt_unflatten(self, dtb)]
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 591, in fdt_unflatten
>      dt = fdt_scan_node(validator, fdt, '/', offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 312, in fdt_scan_node
>      node_dict = node_props(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 258, in node_props
>      props_dict[p.name] = prop_value(validator, nodename, p)
>                           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 185, in prop_value
>      if len(p) / type_format[fmt].size >= min_dim:
>                  ~~~~~~~~~~~^^^^^
> KeyError: 'uint32-array'
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


There is a dependent patch which adds iommu-ranges, I had tried with 
that locally and it passes.


