Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593974;
	b=M/JjUE0h3FAjYuOqVkl1HMmobcDGEVIEPUeRBFOOtgRLj81YI/U3iPmWOSMcrAXiOsCk
	 6mqocDo3c3RyDiS9M/XvQeKFOoxX29/6zdvZITOvwMdRnoVTGvGf/B4mumQ1khZ/8tSEe
	 RN0V80FJfASxahsCZn+9U5QNeiBtlV9Pr7fqFGhPcucQt4gpqexyrsViRzsWCEGR8LyOM
	 Rxg88bx0QGptU8QMo5+vjeAHHeMcFMCywEfKYjbWo5peAZtTGaWvS5sAqUY+M3nzNkv+X
	 9R170ovrV4D+JGS8YtrB8MWOMOoxpJeX7aPB4Ea9vSTCMsOZCDq9sqZyuXIukE7CY5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
	b=2gOOKYRixgXHkpxlmB8/3dutakQtem2FcPucvUcDoKAmGClySalz3sygq48vk9TcAZ2Z
	 IcdbTV8uPjVvZyFm3iSiloLMdphx90UIBVbd7Id1cfBh+dA7o5k5orbek3/U3b8wRyGw9
	 V/gZiHdU+Ez//NzAXj7Quhf2JS94mxGuIWD7l6haTsQhpgSaafKT5nSAWPkXRlDW8tgPi
	 x1wPx58BL2bJuBTn0CD+TyfdAFQccLqETfwVp/Dkrm8c/oY2DgbEeeCEXuIQNYrvmC6oE
	 Srb1zEgyhPqdzFU5SyKvUENuEHnAciopGvlac/aynhdUprX6prgZpMhkKAsmeZtRD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXooyExh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09AC606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXooyExh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vI3U1134867
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 04:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=; b=VticY2cihfFLCDyw
	a7fpmLIQtwYsoHmu5fMOcfnHUfhcAjAT7hxuTq1gVTv6fpDcBsJ0k08aVakzNCmU
	PmuLzcvg7gvyLllTC72QWlQiQhVnCZ+Uk6SYc/RFuTS4Kd68M4jCEo//sanIgMYR
	ED/0m0a7AiQP0XX5pSoa226Rew5xRKQ7IEoE5f6LUUtVMILdkFRVP5unr96eq5ZK
	MKH8agA1iyz7y3s2gsz2lSQc0rcVB8y2U13vLOMP5b7b+bkaWSLuIlOEO+rdUKpN
	/+sE+YosHELDRLK7z+O75jQSv+SnDXvZ3GBaU7ddgZuwVvT+LyrjIpd+xmUcaDSv
	j5ssBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk4wpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e603f62450so9221035ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793593972; x=1794198772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=dXooyExhp9ZQcD7y+ASUcaY2Kane5RFEdUyHQ5GAsMyG1T76atmToLpnGetti95AMm
         nuI5vvV0DIZJopAfT4R7jEMSfPruVn/Kg2+2mEu7qbJidi0K9MUeWzaYIPTxrx8TeDNt
         4LEhq3BaI9hxvJbSeX/8pt8UGlBKulGO8yqEFeuwvioF9webEc3CmmrtNFbUAe1wkUz+
         kxlsK6O/m5PiNzv18Ef2HvTy0zkB58f7LhzsO3JplG0IYCJEjzNfSlboRz4xdDtwKLl8
         tIfvuwrHVokrK1lYcfrDwBQ6dHzwaeJVGYrQ1UoY0CQSQ1o1cUFXehQ1Nb+j8bpFmhOv
         7NIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593972; x=1794198772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=EX8piYKH3nzwSkL+bR+ZT+z6kuM7pxJ7lcEBZO86CpaUF+0PWtmJCbSeSw0n1KmHG0
         NobBjoGIzzyw7vmGUbkh+0uaTwwymzrRq9yFpJeO4v+bvRRsSIjgNndXc29sG5C0HBAg
         ra6ve1lGC9pJ2sZJ2TZ4/3Xf4UgWW541Er4krPIPmYqyMZfI1qKQRB8c+zqfb+DhsZmt
         bREUUx3xm5uwvt7gAHrAdy8JrnVhRvMvUZPgi9HKPDghZU074T7I5fWeDSppoxOjNxYi
         CBph3w6pJsmQLo1HdwQEUMXf1vmV5uJPJekCecpIyJFeCF8LzmWA85MSgUY0UMy3f4XK
         OYuA==
X-Forwarded-Encrypted: i=1; AKwUvBx3/JOKNocjj/0RftwUGUY5f59CsshpF1yQ0NvZeuDRXn7I5Udd+Ui43t6Xn5A87uuBTkItsPrMKVUpsjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgD7sB2nUtu1c+V+2LDv9natElU8SLzVbYZwDGHYxyRrBBs+Kn
	WfWZDAtIlGXtTQVDhP2y1nNzh5heaJNqYa0yfGDE3DASocrxU/JnuhjykUb7qUwFjrmj6vF4EFt
	i/23tGPtbfOqsSJoHgAkwIDtc59pHKD/M3FzsnAGXxPELzfI03xOVE79AZiLCorz0plY=
X-Gm-Gg: AYBFou022xV/M6rMRrxvbtqDwcwFAhSKJ8AnqOcFY3cyl0FbuWcCajABjyclULMYhnM
	Fzw79mWpeO9tPoQN3cVdY4AOq0oS4ccirh4Vb1jKjYrAltDOTeHW02t3QuRW2fu4RQEl8y7PvVq
	8G+XTavZUwfJIb8+VGeJuDPH8L9jk0Ec38DMkhz/dsn60m49hKJ5sVU12uw3DQ1QYDAl2DBMKv2
	U64E9n+ZYjcvJh+mciVNLzmIL3mchh30RLXym/YZXTMACYOBKNGHyLr6wzedmuOF2GAnI3+QF8y
	qwG5s1zISAtV1fIsMROHMahv8dX6ctRdx92Qw9DLYCPNzUMjK3i3f1IDzWMNY9BX266dL7N8jWd
	xUGca44e76x2Zv8thzrT1yeBB3y9ATtyeqX4TJrqHH2yoR2RBAc5T28ub6kWJJiJwUPWBWQtsNg
	==
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630164637.2.1793593971989;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630135637.2.1793593971514;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Received: from [10.253.75.206] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm1391140b3a.55.2026.11.01.20.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Message-ID: <2798317e-69e0-4dfe-9d2d-30e3ba8e1aed@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:32:46 +0800
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
 <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Language: en-US
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f0JKzVnCgHL5HS2LqmMUrc2RZzLdgo8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX0w8YiwiLATkZ
 cenlyL45Jle4UzCORP+qqSCkV/1H9UWXwZjn4y8EaUFxb+njIMnFit8R0sc75KxVuXqbmwWYKUJ
 KxsnRLXYqEvPYGmUlIONDwtbjbxBcWpR4DDJ4qML6p2Sbm4YLh/yjn2VcxCP+lPmEqa2giMF09u
 e5ffVGQhzTGmqs2ED7goI6mILdDzRta5cln1oFxwRx1EcZ2IyGsKuqeoPnjkQ8LR4fYY7h89bvi
 956UfMFgWJdsSMXvNlKl3l5eppO/U+MNQ/HmDe0nHaXw5G/vPE8cjNi1/+Hr5RJPgEMo2MzFviP
 6ejW9sqZxJz+xZ6pu25vPIs/ILrksbhMUhhMKdfCWC+NPnkSSoFymhrJDXLeCVaZjyyCj8luDRf
 lIvE7d+NMVuTf7WqIDo00H1j5JGRCDRqWqflWHqQSB/NAJgGmgMSk1jyYrrdOW7zaU0iTJ6Zm6T
 xbTDQZXnW5fAhcfy7kA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae81274 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=x9Xzq8uMDaG3QzGCHd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX4tkrtAA031On
 R8Lk1sKXPlyJKVQ+Y6omkHiVk94g0TVqqJFHXKiMPNa3GZYOWVxJhXMNtrQLpGxJ2/QhtEsV9vu
 /DldRdVnu0sFQxTkURCUhuV555haBoA=
X-Proofpoint-ORIG-GUID: f0JKzVnCgHL5HS2LqmMUrc2RZzLdgo8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017

Hi Rob,

Thank you, and sorry for not replying to the earlier Sashiko reports.

I have updated v4 to use the existing composite DTB build pattern:

shikra-iqs-evk-m2-wifi-bt-dtbs := \
         shikra-iqs-evk.dtb \
         shikra-iqs-evk-m2-wifi-bt.dtbo

dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtb
dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtbo

The composite DTB target makes Kbuild apply the overlay to
shikra-iqs-evk.dtb and validates the symbols and fixups during the build.
The standalone DTBO is retained because the existing FIT flow loads the
base DTB and overlay separately.

I am rerunning the kernel build with this change before sending v4. I will
also reply to the individual Sashiko findings rather than leaving the
automated reports unanswered


On 10/22/2026 1:18 AM, Rob Herring wrote:
> On Mon, Oct 19, 2026 at 9:09 PM Linghui Wu <linghui.wu@oss.qualcomm.com> wrote:
>> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
>> Shikra IQS EVK.
>>
>> The M.2 variant uses the external module connected through the Key-E
>> connector instead of the onboard WCN3988 devices. Disable the onboard
>> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
>> matches the hardware variant and does not probe the unavailable onboard
>> connectivity path.
>>
>> Describe the PCIe and UART connections through the M.2 connector, the
>> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
>>
>> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
>> module. The overlay was applied, the link trained at Gen2 x1 and the
>> endpoint enumerated. Bluetooth UART and HCI runtime validation is
>> pending.
>>
>> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
>>
>> Changes in v3:
>> - Drop the unused reg override from the disabled TC9563 node.
>>
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..799faa32e2d9 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk-m2-wifi-bt.dtbo
> Overlays must be applied to a base DT to test that they apply. Sashiko
> has pointed out that this doesn't apply on every version you've sent
> and you've not replied to the report. Please reply on the other
> issues.
>
> Rob
