Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873816;
	b=CVVI5rREw848OUxGKojrF9VBwZjZ6Ypnzp6RjM+u0BGn6kBKr2zT0WkP87TuMa5+R5//
	 F1YMO1MqBiQiRuGQbqmYLg1SHSNwmpyRZn/ZW8sWKSnshTDK1hHSxKvtfAHHTQUFWimwR
	 GNPDi8KQjU+Tb6XPumkiReUm+Wi6RN2IwWkoJGZMm7Z7UTt0AgIQlElbTVdkWtX2XLEbO
	 Jh7OVAbEN5ihM6IzAOyU3Etbvx25U6OLBz9KFMZInO3trtXiA4r5LwsTvjlbyODf3cHdF
	 NOTiwB9OvWmw+oV8X3SyqNwmdimncLbUyrpomEjtzVoPkeoFJ3qQTRzpLqiUoDZRDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
	b=A9ohdVR2bsujPsRAK+/KHA8dnpKWTbIiv8OfIkl9kxE2crirN/BfZpTfHYaD/syMjrOx
	 x+U+t9wdkUa8V/kEZyjuLva2oiNf81ZIkopEmfiTzx0V94aYkEtJjv66038M/PHDV7WpK
	 nSP/8aHI+iXX1BeixbYI7aVz/mUZrQE4Lw/jhPBfbxbD5/EAlSlcK1aii753c/qyMVEvg
	 UME6Xlcux/R1kGx6cA4R+rp75OGd/AIj+IxaLid7zLqREWo8RJJMKNZLMFka5bTzlQkCZ
	 n8QEksuwXWJcEFJK62DEQo4cYK/kIU35QqjEbj/90+S2Z5WgYSfyukLM8WEHJiR5e8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522E606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7522E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITprH3375812
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeiwgXi1K9u8VMrXK+4xDuwP
	m9KyRDE8crSBulhqGvY=; b=LM7su+fdDMxjVmM4ceqqXJs/RRlJVqAelDJuAUCJ
	VrNAlFqMBnhIct7u++9kYqh6RQHpbbRFSijeXjOYSnbP6kQJbLdSGUdgzD4QKHcX
	BL693X/iNRuzIp3rwU97R3LmTE9tENfArSGRQID0Ih0harZRgAv/94KngIwmxW+X
	JxtxN5X+NYTGSsTHWDxylEbyfLf4xz0gYgrJOvG/EzNa2ZN9EUXq1RgYAH1n3cVf
	H8WcJ/uaeMxSy3Q+D8uYkQ9iSZbwWhc2a4ZlqGxWlFy+9w2eSTsD36ruLmAvwEox
	Pg8ndN4aaoIjchSoBz84JPBw4NcLqSPsXQw+WEJ6/6LEBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms9v7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso260686785a.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873814; x=1793478614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=CGRvwvn1FzpW6ZEW+fWe3NNDpRWwjX2Ifwwd6g9t7JPOPJ2hm1+VKrFZ98z4tN1Eyd
         cxt9AwRvhpqGJpHNWHZykNVoT5fvpU1dwlOgLhQj/wl7ZLJrFSRs6nQTraIEj8P+GrsC
         Ve1WqePz7i22KipFsbWFe9GIoOWiiSNovK0xJwqteTvT7DTt+VdoxEA1TNuOjcG+CYK2
         cpWvKEoQgwexd6DWiRp0ojNsoPJSVs7IGhKUJob2RK0h167Wxv1cJEX2gRB2wFl/oFQs
         yfoeObHupaUG73U+XFl6PT9JeDfe+eKAgoDKkeJU6Wj+jQ4RGaPDq274n0u4CIJC3IzN
         N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873814; x=1793478614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=1lt/WGCsN3y/HUHq4U1UQxPxdoETURcxOmi1MTqfSmxh3y1ziMc51XGajffGv1EVmZ
         OvT3runp3QBt2xF4WK80YZjzyua9Tm6DX3Th9x5q+CGUZDXHFE4b9QZiN+pZn/1ICxvy
         4fue+HedHg0R59z/6dq4I8JNPqla+1K3Ru7Yhe6UDWX8ZuAAJX8PjrQb3NJDhv9g4AnF
         colPlj+rnFaWqaLm2z8p4Hcn16EfUWAL0uj36enapmjIHdPmcI8JQhL4KGdaaRqYUluI
         FRC3LWIQ4MYobAojmhsx7q/FVYs95qIL1Yz3sIj4QPyeF5oNdg74f6pkyhq1r/eoB5nW
         WRlw==
X-Forwarded-Encrypted: i=1; AKwUvBzmXvRoS+GOkR6pduWmrGJqwIZDUuF6X+4J1k5ZVZTBHGLBpTnqD5vzn7CjUHZMWk54YgwT8ESeBesdcpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0WqR6hMZLUrItKx6qEFFZU6P8ID106z28K41fUBdINa7NnWbE
	J7ICuPXWQDTeHbV1eHIHaeLxnkV8MKV1WzdStVG/xIp3WINVLV2PEqoKGvl9mxePh1PBDyJR6uw
	TKSAzlRsFrs9aHn307D/j5dNZJHY6fOTRp0nW6bAbnXGJ4iHFTwjzBZK0nRE3tsU0bgI=
X-Gm-Gg: AYBFou3hy7UD4DMgvVLL9CiAA/yttqZDdlMrVzrjokloGHPZlmugaNugtc/oBmUZvCO
	9Qt9RfEd6/JwSP2p7gX26sLhid8cNsRnjbmTUC42NzhG272KEYYEIR6hozniKjfxxDdCASG3Ie0
	/nMc6/8MGWRHZkJXn0p6JfqW7JNcEGiMIdOXlSPKL4NG/3lfzXbFEFUmCh8HH6f8+NRZQWL0Zzt
	7LW3oSmwdJ2jsQLDP5vEyghpnZY6YjZ4Iah0U7BkGvBz4A5OBrFnCmjZ9ctJg6ZBzNk6LD1bvHf
	oi0hFYH6yenxGDBfVzJtzrznVzL3zp5OiNF+oumVTnpS0u//LH4DRtZEzxfusyWzBpqsxTOqd1d
	qEy+ZqUNqEQaEFRXY
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409042985a.49.1792873814357;
        Sat, 24 Oct 2026 13:30:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409038385a.49.1792873813758;
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm6746311f8f.48.2026.10.24.13.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:30:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
Message-ID: <k4ogudreh2a7ug3mtovxqyelip3kog2bz5vswtjryba6hk7vx7@oervurjnf22q>
References: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
 <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
X-Proofpoint-ORIG-GUID: rrQ-sEv0V_dYB5ohU72_mZ6eivbnHrRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX3SdFzIflWxsj
 LmsT8hgYCGeiJKGy5LSbP7rr4PYMByE9mZDX9XbkUggdPvauvXeC2lc9O8bKUDBAi5G5O3J0Cg/
 ZDCM0Sovx3dJGfdYaBXRqClz/Vw1OMrZ4snQKNaenAEKFKRelVK1D2MWu37jkPYUtwCEZZPzG/C
 e737OqPsedgfjl7j9utQU+xi5ZL0GWo5xV6kDglhCbCl6L7vZJG99k+VKHAskan0eVRok0TuDp+
 8DVfl+y4AmE2qBuGeRM3Y0fYQIkFlRQiXwNeOvNyuwL7Qlo1Al5Nk564HYBfR0uPSrq8psP1KNW
 o6irFsN0ozvud2DHLtEIJlSr3COoDBR3wy3tvS3iglqp6tpcAXO0OkSKjQE4trBnZDi55hjauPH
 kLv+ASwtcASiq4ke4yuey8/Qn9kiVDu8fZ0qOQgB2AwbJpAtGLQ+libyftPIiaYkVFDjn4euGO/
 ysIhQfJnJyaQsDeSg3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX/uGMoxamKNiR
 BYAyAyU46S0KvlMylnzlj2sfgccetPXX83TLOjyQ9Z7paDXwRcAujXArJAUDJyS1RkYyJwIxKvQ
 Q1E1JJ+vk6jJ2YwPNsPcDO34X+ssHsQ=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add1557 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=AqZmfHzJsoaMp3Ki:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zDk8rvenn9N7faQbNqAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rrQ-sEv0V_dYB5ohU72_mZ6eivbnHrRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 23:58:20, Nizat Mikayilli wrote:
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, but
> it still ships modem firmware, so the modem carveouts are kept. The
> modem itself is left disabled for now, so rmtfs_mem is dropped.
> 
> Described hardware: UFS storage, the microSD slot, USB 2.0 peripheral
> mode over the eUSB2 PHY with an NXP PTN3222 repeater, the
> bootloader-provided framebuffer console, power and volume keys, the
> book-cover switch, GPU, video decoder, ADSP with the internal audio path
> (four CS35L45 speaker amplifiers and the VA-macro digital microphones),
> and the WCN6855 with Wi-Fi on PCIe and Bluetooth on UART.
> 
> Tested on hardware: booted via U-Boot on top of linux-next
> next-20261002, with the default kernel command line (no
> clk_ignore_unused, pd_ignore_unused or regulator_ignore_unused).
> Verified: UFS storage enumeration, USB 2.0 gadget, framebuffer console,
> power and volume keys, the book-cover switch, CPU frequency scaling, GPU
> (firmware loads, render node present), video decoder (device opens),
> microSD (UHS-I SDR104, read/write and card detect), speaker playback and
> DMIC capture, Wi-Fi (ath11k probes and scans) and Bluetooth (firmware
> loads).
> 
> The display panel, touch, pen digitizer, cameras and battery/charging
> are not described here.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
