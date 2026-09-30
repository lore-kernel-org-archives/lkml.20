Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985CA4848AB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764408; cv=none; b=RR0BHXpB9AbRHulUmMeA+kIAJylmUF31aPSfQ9hkMWLGu6hRi1aWzD+Pk/rREHfsoLiKFj38tJHq7R6tyMuc29nmRFY1XXkYcU4/hEcTpej7cpjscYe6KdN5T9sMGSvlYaBjeOur7Wn0KTagV4F3KX7S/tM2kj+oqzbQptBqMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764408; c=relaxed/simple;
	bh=p0rtOpqJgYOdzRogUQx4C72rBJ6MZuOxyLFNm8hD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRl4ubRiydE7eCw59FEn2ZsImfDNMMM4w6IqVponv2NG93L4lb48GdUMcsbA59yMU+QY/bTY3r0vgMBk0Fn6EZsh1XNf0CsKGCJ+hPL1kAYHoHBtu5BaJfukxjrQ7qHdiq0XTGM+qzuUawBj3e2YHrm2aK56URryky4RQeIsHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKp3pkBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9UPHw4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKp3pkBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9UPHw4O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7daAM2213576
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=; b=KKp3pkBlG9NMn4o+
	Ie78eIItC5nrJQHzevcTluOiAL9eL+IM2U1fu2POEr0CPh21TWhoOJoh/3q5xDXF
	oGg+oJlL+dI2NFnXoFUUlMSBjBp60SqqKSFox2b2bJbwcfSM5exKxEUmjtRAGLBL
	KhrNGk++ecMx8H7H+ns1IWmdgdFnVfICtwPauN6XY1twkBNf1rQEAFAl/jCjHkat
	Hw76Q3tvDqvnBY9isdhW8J7IrngXZFJEiUzfcInlBymyWWJftxE58SeNLVzsvFhB
	foH8mUZM6lr89VlWNedjUse0YSfwmOyOdW4+7fjcSwA8Yuv7F2QrZw7oPW894TGp
	Z2qUgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj01v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so100826485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764403; x=1791369203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=I9UPHw4Oiy0auvSlwDAgvpMRNKOkl4CGmhHQYBUJ1vNhgEAf6nSdUrt7TgnJjfVEGQ
         mFctZykjxc2qzkBJlfwcrIB7g4JE2ju04HcQp5G+kVd4cqYcDyv5LTLJEw5MXxug9zqK
         WiCXQayR+uq4Zk6FHAhpTlwUAtAeMtEZpLDpDWmt9vNZkEWI1XJ2TCSxQ1prq7NWMEDR
         bt3O3lK0ljQv/djHBD2Qp++pZPY6qIfTKA42gB23ni48GU2i2H67UgkhlTEjcrSbkxmc
         BZ7Yar++LwPVSRFO8zoNnwjNXtJEtqxDvSiW3Qw9J4HAqmSM4i42Y8IFo62gMMRRT6WY
         yvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764403; x=1791369203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=KR8pKx8E5vFDlBko2OErtaHADMlKCKp/7vn527SMNtz0BGT+TNSJQz/PtINRNfoSRI
         F13Wmw7zYQgykbelaCeFnkxSkVpVWExX2ZjMSlXrYab9zVJaBkrLt8Z7URf6rf8KaVZB
         MBPtw2Vd5iHSZzOQP8cq7lK2fK0Ww02iUeaozm29r2clAlBu4UhDYLf3troEAl5dgNO1
         BT+edxddpwGTiq4WC3uAhaikbTjgF4RP2aC9IZcvB6LTUQhBGACclUQ5dKKju6oimZhS
         vjr8E0LQq/ZVt4ma3iBdDN5YfoZ8ETBHw3jhqHu8o8SDa8wkATWQL6grvMOC9aaUq23u
         Zptg==
X-Forwarded-Encrypted: i=1; AKwUvBzQpVEot09h+i9G4MGCSm8i6i64MdQB8RkRL1epwxZIINqlsOINobNQqmqKqs4l7Z+bZQYxgSIHfNeXfrk=@vger.kernel.org
X-Gm-Message-State: AFuF++m0dvt/f63gO/0q4+0UC0zSudVBmM9MLAXEZiVfzXfwwyxcTBPv
	Chl+kFFTndmuES7ejTitCAWQWsuU8pHXFR2T7HO354+28jhXhOp09GtKzFHwlnsMK8lljPMTiTa
	u8wTqXqqwZrvGMSZ+lyckbJaXr8ltMhFxC7X50w2uqxvoZhIEnWULA16HmXUZPCm8EoU=
X-Gm-Gg: AYBFou1NIu9/iKnCjRXcv/K+rPI2sBIpFjTWVbUxym0zogfqKYof+DaJDamc0Gr3gMK
	Q3qQRzor3H3OTquVCtramOjr96RcWAxfCxPwdSsdFZMtin/J5iNLEYrUgb1D8r2toipkpz6PBJ9
	pFXWcz9GqbYXeVcS9UelEme7X0FNjCL+ARFMHyJ+FudYpBHozskUHxbqO30zf0Nd7n/f3OFi6rB
	OORxUN4pXjnT7of4ZIs/Ow10OxGUqLNkogOMgU/c9BQH7ENIdFNpSxsDrRX8V17hH5pNyYe7ET2
	cChRe+qTjIADMmteUG+AaSMn4m/Hwk29tWiMtsLIyTrlZ+o7S+DHXux+gV0PyLqSnoQ9n1zo/dk
	f/PfhYeW6K2vsupcnh4J0wg==
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144985685a.4.1790764403337;
        Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144978585a.4.1790764402614;
        Wed, 30 Sep 2026 03:33:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:20 -0700 (PDT)
Message-ID: <3439bb37-0aab-49d4-99af-8c2b22fc4adb@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXwVV4YgyAgbu6
 vqvUk7DX09E3X0GOYcKdBPU7nmmGjWJNJcDRQy8AtrdUpxW8LGHj5N/9IQ1pDMqctTNcr16Cd7N
 sc4FzatD9nl+C2ZzCZoBuI/3+lJ3asY=
X-Proofpoint-GUID: SgvKoQEM0xC2ysxqAHX9FHsnw1H72rh2
X-Proofpoint-ORIG-GUID: SgvKoQEM0xC2ysxqAHX9FHsnw1H72rh2
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abce574 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXz9LQXnpisCQz
 tN6txVBciGCzEZ6VASxritNzcYiB2voEt9IedNUAAJxey8AvBtT8Rv2KdXD58mOq/Jd9FHdsAYn
 lRNYO/tc0gtG3ty+lc2L4suyyIq37jULzqCXhgrmOqB5nWI11/hpjhOYEKI44ZrNxtogQwk4kQ+
 bdh0053K/UnvkDdYjfjef9bfLEDfg9JP6xpa9WymZlYAaQ/EOKHt21xuOCCN7EBP83omBPfK646
 nK0Uc2Y2F8BluSDfemHoUf9LbvyxzIqERFg6HaBjaBZ4DePHJG/NBeLyZayG/WytkzhZWXq2zwy
 2Ehxd1H67MVlGKjiiETm9RlhglnXhrUkcSTiALyZlI1nPED4jrEfvHHY1XgxGTsOq2wGp13FxDx
 taIg37paLgEpH/bggYrQI83s/dX46DsBfclmnZcIpm+IMMBdy4co3Ftn+q9XNir7g/GdRL5U3xW
 3iOedCU5lJZ0p60Dekg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
