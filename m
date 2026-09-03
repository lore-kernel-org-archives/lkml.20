Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF3453A42
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434587; cv=none; b=nMexvRd2Ox6ZHD0uPzC6LsQb2dGRheBA7iqkyHfvak5jbs91LP8kVTyaBubT0wUwFbcuQXkjOhHMraotOiT2tCTCTFFJYzdyMc7ZYYdhh5+DUocitKo+U3Dm0pKbUT/3WrKjjWLFMv1QzRBsmae/amt+fDfEV4af4hQyIui8T4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434587; c=relaxed/simple;
	bh=w19mGtPuTLp9jvGdQh3cZL0Psm/nfOyVuwJJoagZ4NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtKg6RIAuMZjP+4Oyc/Qk40/F6SGealaAnV9mcItQw2H2nc0aer5GPZBjapNr29NEwp+hQ7MGdIhxT9SgHWa340G55D5gxPqCE6A2aTY9vPmcEEvBrQvCn9wEkWnUCXRp2Y+K8nTACwqroejRLv7FVAv5qjriexAFBE9CLY6mxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdZSPcS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ypu5tNlS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdZSPcS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ypu5tNlS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHJF3055337
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=; b=VdZSPcS/4yuItS6c
	ebwcWGRMRQxzdPQSurPTMWV9o90psbGxwJ0brmGeX5Q1QTcgo4NYBQ96geI4xvuk
	RbP4JSwTPSw3w4JMz+aBFVZs/LEpybqzLHPgPDGAxpHtDzEJSxQ1qJxUU3kEOMez
	GOo+LuGL791/1yJ7UlSgpk95OGuIES14e5jSPR69QuZGDAAxykcloDZOdeyxIuOs
	0UOfGTfZ5ClMcNkTwXHyiz1RSXRKhLW0D/DS86hiGyveAnSP3xAuPCjWKQ5uu3xI
	+9LTneImcau1WyguCt/WmzbdGhf5AFRwpiY6XFOmuYomIPssiWQ0gttqSTBTfxZa
	1lG88Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvn9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:23:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so3039573a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434582; x=1789039382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=;
        b=Ypu5tNlSLdxWtr40cx73dbtfYSW2gzfRQkvP60VQ2PBdKYyUZL+GCKdcQzsfLI48P0
         +MKd1oEru5ABUP0XaTx6i0U+UGywmPWG6sLFo+NSSLaJWHwk4YeQQTcpFI60v3n7oU6p
         aTbhbPPlOSgPE59xA2AzgnM0QRvlV40KVF/6FjRDOJc0jP+wLaYn2UWK6Vy/mGxQ2ioy
         O0R6e7faS95TS6DbDvN0vW3+QrDVd3AcKz5+ewZ+FuR03xBQ6P8ClccbR1nN2ZUJsD95
         4VRMkmgaD88Vd5QpANb7ceLOrYBzwQSKCZS9fKZ5zSGJaf399Dso0agan/vfQJsnr3iy
         TnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434582; x=1789039382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbXb80h8j5+9y5ONWXdRJEvII7rgqz7hKhOEV4dOXfc=;
        b=crGgZ+HVhp/wxPBjCehJaEwfjiN6mc6RqmqW1Mf8ise9K1MT0z9XfOaBstx8qepv1y
         RvyBxDMCJLNoj3FipC5Wn3kKvWf38N14yfeVei4LmoS6A6eM/UW6lVB4L29+5T1+FNQl
         /lm12/J0+E6WuUhBjwa4k2RuPdCF+/LVBffcQr0w1XaobvaS9j3q/1vCUyQ4R0IKy1t9
         1luscfU7jh78ObKMSvDNdQlArq+r1u+qSoAXVA+/OaX60kT8CWzOqpmRchureBSRaoxK
         d2SyU8DDJ5hWZwQlV4VgN0hp1y0dzLhawbAWPksfB0yUHayZxNY5sh19w3BoxpUNiw0Z
         YFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG0qV5bShwKytw77/Lr6QD7EzX8aXzYsnla9U83Awx360zn70nUdiFlqkCeMyrfDAqxTeuD6LTBGJYoiw=@vger.kernel.org
X-Gm-Message-State: AFuF++kXwBveNXeXonnml8qs2+Qdlw8hgjoepNYD+foho7g85qIcammd
	IrQXB7+8tuWUNZsPKWltKR9AcaM/Ct/G/M5Q4kSxGaW0QzW0CFgOC+Crt3L7dJhGpxigx4o0Mkr
	FUVzLYcpPWT1eoD7z6HbJba6kZSOnxXZhwU0ydkETrxyqjQrvU7+N017Fb6hcXfy6Mb0=
X-Gm-Gg: AYBFou3Ma2qUwxAA57F+8apUSE0BpxCx8UasVTr5falxSqykoYayEeztxYwB+M9RqPf
	VnD813TJeeA+DYncCFI4iNo92qn/Vl9Pyaw9gNqGogumvuQOYGPqLJ/tE1u/OFy1yTAyRIy19Cd
	Tv2zqZ211jxd4nZRor6QXo6aqe0xIGEgbN6PBG2sqULLewuqnde7dvsHSCj+8/hTh+QER4rLY5U
	jl7IabYksQD8ZEGcziTAgkGueUret+Gg0+Vc3mgseqnYiVcS4XtqAq9G2YPHeMmgfh97VWs8s5B
	X0+IQrLFa1NPV4RkxiubcmVD3aSELLFoVaUzuqFeFkZelxf7ONI5eBjmj7Zf1FQmJQuKhMoZ82+
	ikjKesf8eQUpJn9Z8h+m8+8T2zumooCQTFaI7
X-Received: by 2002:a17:90b:1dd1:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39aedf5b05fmr20343394a91.11.1788434581492;
        Thu, 03 Sep 2026 04:23:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39aedf5b05fmr20343275a91.11.1788434580961;
        Thu, 03 Sep 2026 04:23:00 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994db8csm5169856c88.9.2026.09.03.04.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:23:00 -0700 (PDT)
Message-ID: <8f2f2e8e-b7ce-467d-83bf-fc25f6375107@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:52:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a995896 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wdwvvVUDqnwxwjgyCowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: FI2I0TjdzsmE2-JpYkadIg7bvlKglD-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX64x/dLAQUJZd
 +1fdSA0S7FXuqZxJ6Pqcsxt72pOuD/vTW7TAeWTK65TiALFa/BNTXdphvBmb7ORaFM4VrbRAzFn
 pTXjNsqunRksNBtMo+6HatKgEGloN/VDLH8vLR6DYQCNDtsHLkytQWlEyzTXEU2wcwef1D4pcM3
 Nu2YCob+JoeisnMEvuEWfAijlRTnO7EgXUiHsUpmeMct6L3YydO71/D+ye0z8eDGXyOVSH2RTJt
 5H8IYBMyuIRi4QEbii4YgEqjMA7YgthyxFY5/ZOtQ1piqXR7jNrgMv1Zj4Uzn5SXgGoUYnKJM1z
 SUtm6MV5lVhsxLosIzof2M+WhmuFySvxdxnMZLKf/HAmmZtItDjU92gzjwumPLzaqKsWAlG+PnH
 wHo28nV+wvCghXvuP/HqiNvb+GAo6KQr02L8JO+o8cyGeWIxGHzySKAm+wE6WYhZLIkDL8NBsQR
 +wM9bcW03W27f06tLqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX0GF+dAnJWvBF
 hAb18xjx2kaHNvsgSwepPBw0NcX2TiWMb5Pve3GWMediutqQ9Vn1yxL3nGvvxD2ENk8Fv9efFI1
 hwBto/9gQQ/N1I64yxTBinLFPP0KXM8=
X-Proofpoint-ORIG-GUID: FI2I0TjdzsmE2-JpYkadIg7bvlKglD-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099


On 6/26/2026 4:43 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board,
> based on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
>
> monaco-ac EVK is single board supporting these peripherals :
>    - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>      and eMMC.
>    - Audio/Video, Camera & Display ports.
>    - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>    - PCIe ports.
>    - USB & UART ports.
>
> Compared to "monaco-evk" variant, which utilizes higher tier QCS8300-AA
> SKU (supporting 40 TOPS of NPU) and a 4-PMIC (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) power delivery network (PDN) to support higher power
> requirement. This board utilizes lower tier QCS8300-AC SKU
> (Supporting 20 TOPS of NPU) and a simplified 2 PMIC(2x PM8650AU) PDN.
>
> Add support for the following components :
>    - GPI (Generic Peripheral Interface) and QUPv3-0/1
>      controllers to facilitate DMA and peripheral communication.
>    - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>      lines for extended I/O functionality.
>    - USB1 controller routed to a TypeC connector in device mode to
>      support USB peripheral operations.
>    - Remoteproc subsystems for supported DSPs such as Audio DSP,
>      Compute DSP and Generic DSP, along with their corresponding
>      firmware.
>    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>      and other consumers.
>    - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>      Ethernet MAC address via nvmem for network configuration.
>      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>    - Support for the Iris video decoder, including the required
>      firmware, to enable video decoding capabilities.
>    - PCIe0 and PCIe1 controller and phy-nodes.
>    - Sound card and max98357a based I2S speaker amplifier.
>
> Written with inputs from:
>      Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com> - GPIO
>      Expander.
>      Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com> - GPI/QUP.
>      Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>      Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
>      Swati Agarwal <swati.agarwal@oss.qualcomm.com> - USB.
>      Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com> - PCIe.
>      Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com> - Audio.
>
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile          |   1 +
>   arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 938 +++++++++++++++++++++
>   2 files changed, 939 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
>
[...]

Reviewed-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Regards.
  - Avaneesh

