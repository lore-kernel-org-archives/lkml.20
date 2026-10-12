Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3732B108
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790875; cv=none; b=Q5jgH83lnndMlNG1NQOvWYo37i0Jd2djTojTkBWaVN8y/znv30dVa4fnPnFzRz0DhsDvwKZzY7dAa3M2Pn9u8+nyERniCsCFKEQWlu8z+9MVT/s5r5/47YdvGBNT0hMH3hts77jT9d9AVN1Y9KvAvu9TBU3Nw7uJ9iSFRltJyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790875; c=relaxed/simple;
	bh=DOliDIP/RgU0tzWGxfO+vJwiWPqwVHmmS1HpzL3f/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl40FjsPeHbIb2sVh26QhDdJHIRYrqUVGKqJ750UR/dAxCPOSnIxn4Lw3bhzItSULR039sAetqwLTxRp2/B7re9KfU7Zl0jlcMGQ/nSdABF7qiRiDKLjQUF8rK62qhDSNGZu3hYmCVNcrYmgwcQi4XW/VoYZAtvqlRjFZiJkaCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bmh6lps/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfe4+wiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bmh6lps/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfe4+wiL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55xZv4068824
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=; b=Bmh6lps/PXZ03dJZ
	zLpa/8XF4xKgytva97b2Ucex7SDMQfBH9+4y+8wqS0RDTOIYsF7VhrDdDj9Lsn8j
	D+fjTz07OiYFVJ1J4yYAlth25xNb9GfzdQ1ZbhtP34N1g21xQFP9hCKsT3hBcpVG
	tBzg/3dVQ8acEWDYH5OENBw9BJHCNhT1XpEukJDYdqDn2orWQV7kWfhhwPQRj1Pl
	dnk8hJ+U2kxpvErLj6ZJgSNIMqS7D7GBTrKE1P9bch5pXrOHkAvyN1Ut6dwLfuuv
	yN0lvd7kblyDRiKqud/GsrIr0lWjFwJ+rnTgp2M3usHZgQH1cpkzvYjdFrXtMwbH
	aj8Sog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjndtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:41:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a04d1cb2so5413506d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790872; x=1792395672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=;
        b=Cfe4+wiLDfd5FTQAuXFzGBiXQyqO9Xy3pd1l+zbUghhSUvIuy0DgdCc/ZNqwhpRy0r
         KFjGk10ctzqJoYdFkzzyoSOBETmcaUs1hM9qNfcpIrw7+5U9sp0SX5r1pvZEaz84kXPv
         ugbgVpNNN9zuof7YqIQYV8RlfcBIy7QyBKISecQNXCFXekZfz17rkAg0dJ0I9HrGqSvk
         bKEotxMbgE9CRvuj06ayS5KBauL1KvT1kfNikCWzykbFhL+4b+IU43pMG/zqKOzDzwpX
         ep+Bt3nlXJBv8oNISjlDveRjayus4sSuN86pJerzhdmKC6UPl1pICFh1EmSEIgvsqmWa
         QYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790872; x=1792395672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZWuDN9pFOwD5K//QEGKoPML07MF6J4iroVYXqGUMxo=;
        b=WmO0uLcNSKrbYcaUnIu8Tg8I4Pyec089nHKRMXXjD/FJ6MghbdxqxN1SaJGq2VmAmm
         wvz6oM3ij8QnII5zbK+NZUpdUhihcfjMaTu87X2htlt1BeyYsij25kRIE9QwOcc9zwny
         KpGaWRpNTV17Yn5LgFfjikJQb440upuN+WTuJYgAF22sQWFAxb68Oeov5gqJF7xhxw/+
         qUpfGzR6R6QuLjbS92obo+YET+yw59/QxBYdq7j7Pm0gSyoCYDIqSZ3kde4oScmqKuZx
         KKPo4bd3eeRmytrwieQs0CoM1kyo8sHu5L3oa3h5hBGZfiZJyubCVa6oPfOhk9QGZS4k
         eBpw==
X-Forwarded-Encrypted: i=1; AKwUvBy4ROnwEwU+OMjlPwuRbIo66UrmyoNlRg2b8ao0RjSRj3Ny3oWtg7cK6vtv0lUgUB1Icx0oTbXutF7KlyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYbGVE/D4AHXzqH7ocOLzgApQMRS17Aj4gHi+hYgk0qY3TVRRD
	niSujHVV4FsRI0/kNuAV0vElF4R0nbfHbNsbiNzVR7wVnp9sXQb1AKzBR2pnnfPW/E4EV9g7M9P
	dSNhHsoAgtB7+kTXW+7Qmc0zG+nw8ANJy8/gmTnWs4XWZOsWkjxfIYbNiBZ1nlw6oOK0=
X-Gm-Gg: AYBFou2PB+WYlcQmIhBaZdJPfetX3eJbFoEJUy1yPTm+ei6AWOCWJuCDDgAUnjbVlDv
	vnLdemOeOvjvCpNzdz7/cbi5BcRwNAPFmUDAG6dystI827bAutAAyL2ASW7MhHTHjNYlE/gjsSI
	NdV9/6Ij71XJ8DNYjV4GAJ9l8tVu+f1+D0nMC0ERzXS3smbJNtWd+SGAAwwJoGJZjZPQPZ4LYnl
	4OspkM56scji8pRxoxBmOhIcpaE59O5MkoVaeY2GQ348DCH19kClLrsaVXEXk7QHVnp+OTpx9wm
	nQ3Uejb/a4DuO2Pz4b/63EXS9+eNocl0zTQcNNx5sFmljebzQfMxvDihCYTCLTKhcanWSMi3/qy
	JkHtWXnc6s1u1HUaZtKOKww==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1473732285a.2.1791790872192;
        Mon, 12 Oct 2026 00:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr1473725685a.2.1791790870268;
        Mon, 12 Oct 2026 00:41:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dc0c8asm4576443a12.13.2026.10.12.00.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:41:09 -0700 (PDT)
Message-ID: <94131d67-0e18-4502-91d7-26fdaec0694c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:41:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX3jRpZYz3FJ2m
 7Sy/q4CFW3oQunc4cT4sPVz2l3LuK3hII3Oeh/msBSLgNHtdA8H0INM+UR40t/U1/ZWzUUv90le
 xaIrFbJqvE4hhn6rfLm3M3TrKjEqrTKqu5ZTdMNLhoLcVZGua3q7+b1Pq5D1FgVQ3w/O/vEKPBG
 5dMLja26JGMYOOgirt11ZpJ0k54WDnGY952W2kK1r6Ntxp/q07TbFPgS4FcwhAF6xJm8dk2GKlW
 euHsn2jNt+rFjALVe4N89B7RwkLTkZz6gxnpYfukRtY0KKbBlC85k4maTV/TQCfI4lCktMWpHbr
 JMZtV3plnpbFXekQvgJSWtBMM294RRg8VZNXzEvIB6Syb4yEVvRE7JMmP0O/JrOphBIb8576jbn
 sJq+rVUZIoincspEACyQYLy9+7d7BBFEIpLlBtW2NVuEFJ5hfdXqvxoPTkxK01Eva/0YQINv78P
 u3oahMQdjzcDRedqvIQ==
X-Proofpoint-ORIG-GUID: yBJ07I2QMA3AYiB7sN8WGkdVRaIbdI7L
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8f19 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Yp_Lh5tV98jg5vq-HWkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: yBJ07I2QMA3AYiB7sN8WGkdVRaIbdI7L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX2deWEsrvKeIG
 Jw3PC9NLZ/aCdEJokH8rABsoUfWxPdFo7k0sFZHinv6bE7W7df8KkPJDuqQ5TrJ0TjZu9rCvp2H
 5esSdfxz7It6KKmu9MqpI0exTS3mbgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120030

On 10/5/26 9:24 AM, Balaji Kalkonda wrote:
> Add device node for the DisplayPort controller, its OPP table, clocks
> and power domain, and connect it to the DPU and USB/DP QMP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

[...]

> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,
> +				      <0x0 0x09ad2200 0x0 0xc8>,
> +				      <0x0 0x09ad3000 0x0 0x78>,
> +				      <0x0 0x09ad4000 0x0 0xa0>;

These register ranges are wider (most are 0x200)

Konrad
