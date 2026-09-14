Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C9414A2A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376290; cv=none; b=kfqtyshPNNsJCv8V7KlrxPVkAHgOELW+wNIem3RWNsKjSaXNvSutbN9BtbA7P9MRknIIpkZNdyUbv+6nj9veKYvUo2tw60dQzYkwNfE+9YH5S7JK1vy963hCKNptGoRAnoI+PT0odzVpViMZ5G0CxpuZu9D+7NG9CLCQpQ4VCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376290; c=relaxed/simple;
	bh=4d05JrXTCB6W9rWQXzcDKJORFk324K5v5YiJJmweohw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoUCXpnBLTY4HIefxdKqX1gF29omGA0t3ctB8PSIb+GuKaKCvoQEhnNN9n9LmcclZbp94tle7/9tjHmekMzEU0NEDsyHBO9e330jF33XqfclDgJMwcE4E+QyGC5w44HxK2b6CqtfBeJUUz/smBsaVSUh9XpbklKQevfgmbktHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjRJKOlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5Rq4wcV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjRJKOlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5Rq4wcV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5infQ4057536
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=; b=WjRJKOlWIyp+M89s
	zQWRyG8WPM+mlOhn8c1uoBXcvExKhTkYEvC65LLaNvt7DO+MN44ef32bHUjCTXB9
	VdbBZuJQ5wogM4C8aKw5CnlpzFFXALQy1pz5UPhygUIxpu3QMH56TGpEshBt7yA5
	waN/VFXmC7UXN2PQ9EwFAdJsw74AiWQ/9P8QJWyfRjrl76U0C53aYsnK0douK6ff
	UgA1DENksk1GBRFRS7IHh5NHHFBdnLPw1R9FUtqHLusXdnUBL09I2oiZ5XB6yi30
	V0VdddiL2sglf9DrjVmi/2F3ASKFrJknCwjnAvZkAzn8E2QQksRwEQgHWJ3+DDKM
	0GGLFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssmqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso60723885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376284; x=1789981084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=H5Rq4wcVCRA/NjV6SXeeGdOZdljRL66U9gKL0vJnHGur7O9WanSQnFWiAFXEjoa96s
         XyzDxrga8YwrWpGOOwPJe4X7O2jMPlJcAYGFQZPsQJhmHFQ0ufk8XIQx2a9BGPJZSkBA
         +wDQ7IXYjVu6JFiD+PUwkD3fXMbhBCa8K9Kwb7tLxUY8bPWWyNNsV0a6NOWj95y14KNp
         h6OAXIwdnoOJi+qw8uImo7QwdA7zDoKf2AAXS81j096K4xs2wfuPPdM4Gfpu2EbAhBpM
         xBa46Uk4pCMTHyh2Ks67f6bqGgzUBGzVuxINoZFSoUH2goZD0N6ebGz8QYUrqvyDPWrt
         lqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376284; x=1789981084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=jQmxmowJ5sMmN2D7c6arZket8F2d2cBGCTKPbduNaSIW0ncgvcg2YNkO3iijDXrrnw
         nr6KvTiwiVZKjVG/txxVxUB/9AOJ4y4PweUsJPKfO3pKXua7g/alSVbk4em0N3KoU99q
         YlzlxS0RjxN7ilsACGGj/U/7NMqhiaHEuq4uBVCgyWW8MuIKdY2Exi0zmShPrtzp5dFZ
         xCkVHQ90IrplsXrsPAigaJ+yBC+51T2vljowud4iRQcBQOwEpVLF69iLPN7pYy4+zq7g
         TTMFzm2TGX2ZfGC6daS1A/5Fy+DpHxTYJldS8nINiItF/DoRFS5iScFFBid1c1tXl/3G
         NcNA==
X-Forwarded-Encrypted: i=1; AKwUvBzSh85rcQYUeWk9sE8gVIHzNx4bahN7T7ucOcjfjLkuJw3+imqPrxJbnj8WLuNr7kMyo1k0tkauVu81AnM=@vger.kernel.org
X-Gm-Message-State: AFuF++k25xkZgdMUGyrbA9ozh3puNsoM8czw+CRRGXo9+rduJy8QTV/U
	F4O/4//ju1BAvR+PoDrUtNP7M1tivyNk0uxu72I94tVltdqk87AoWWJpIFnRsMUowNsg1d+PsQO
	q24uPd7rk+L0PxgQTH1zxn4Sdb81zR26KCfP+kJl4N7v8c61m1NMb6PJM4hsf44gICPqjY7LXD9
	s=
X-Gm-Gg: AYBFou1w3PgINVgFbQNDiWzOJGrDSRDZznBmRmRg1lfZlQjB5t2T5rVCjUMm3tGaH44
	/3BEc83TeFZcnRU48SG8WzmkoMA9hlmNIPd6Jq2iYMsaIpOT3JuQtIqQAcmw0AvO8io3yBGP6av
	e7Q2Hq5vLX9AMbJ3+xYytScelQYt6/w+wbpi9bgOPCL3s8Xsf/ambMsyo3c92UBKW4S2OH0RO+R
	ImuVBE848bI4Qp7EZnnr1YuM3cw7Aw9x54LEnnOgv5a2a0Wuu8Y5sD8H8XedIUH3eWwaR3l0pnt
	RhMbAhT663akFKfrEhHHpou5lgSsO3unAL9aj8IsJyI5Jic+8U8BQ+7RFhFItkuAYVkxkEIQI6j
	9JHzfFEC+hHpCwdzDhflDog==
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197331785a.1.1789376283892;
        Mon, 14 Sep 2026 01:58:03 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197329785a.1.1789376283524;
        Mon, 14 Sep 2026 01:58:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm392151166b.4.2026.09.14.01.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:58:02 -0700 (PDT)
Message-ID: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:58:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX1B8gb+wwZb9F
 62JaShLwL03BDTeUCBQ1GTBcVqw/rG+HcpDTrlFipnDjrNLgQJb3ovr5NKIyv82wpOJ7Q4kCGOB
 YPRSOBhiR26CYoWJvahEWJYE8Ry/p/zE2SQNK1qazYA6fyH4DljelwHqosXRPkwKAdJmD4cJEoL
 p7mV/uGE8LhsAlsBqU2V6BzPLQ1HU7MSERmEzNkrN86Lq5pOfc4N5Rv9zcpDYWaM2fpyKeltKy/
 2qRa6wvt7tBQWoCnJOH4FpgOrKO5IrkceRugyJcmZcekrOWTohrIJklO3p3gWKKASdugivSCTW8
 Lo93nxggL6xs3E50gYgfBxkJYHJ9+00xoZVf4BgxkryhVR0niL+ruf/zMbl9cCnGMmqSpKGA+5w
 nHAyevOhMftk1K3JSvdLh8WZP9dz84/LvBM8173KwGCY7sagCIKYkVLIlZjjkecne1xEB1zydSD
 yVE2ysBKqETuVOCCVig==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7b71c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jOX918sAD4KIKZh_7MXb4NAK5zio-B53
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX7nnVUKPtwY0+
 is2iFa288HeexXLxfANunnYcFWo75vwiCOwxTrJ/PsLSPmLqzKTDCT0CJdC06HoDBEKiWWJPizQ
 fSg/LRJSiIkOQc35/dxYcRk32hTaO+I=
X-Proofpoint-ORIG-GUID: jOX918sAD4KIKZh_7MXb4NAK5zio-B53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.

[...]

> +			port@0 {
> +				reg = <0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* Same as usb_0_qmpphy above. */

Hm?

Konrad
