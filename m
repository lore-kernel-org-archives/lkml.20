Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EEB42E433
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068721; cv=none; b=MckCmTEZTdIq3dIiyInUA1sQQcaJ5LuZKxl7J+WK+VVFx7c+ONQKaVGL2nlXxorzPNijoLTqHcmCX6X0N85CJhKHyfKb5yRb5tMLquQwS7uaCw4bNC8/X75eGkgiZ0mLz0cLFAAeUtbRbStOhvzS78mAZ5xFzxVl8eumLy2etqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068721; c=relaxed/simple;
	bh=mcUzmsbUZQq4E2knB8VSH8G45CFD6tZ2tH8mnwbjETQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXRQEnKnneuUpP3j0TyjqpqdRL+vZyTt03nwtF55Ma5dEcxKzIiDnSAkAf1dte2hSBeiYN2IXSXUFcxHFQKVCUsjw7ufnH4WR0GAtXBL0XyY/BTP7rscbPN2o6VmOu0K5qjtRbcutwSR6VVQvVDv/GllEG4T1KASlsWHY/ZWl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O19lbRdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDcljAxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O19lbRdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDcljAxb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9CaUe1842269
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XKotZtMS7ewKcsV6iJ09kjS/
	F3R0guDpSO4Eq1SOvq4=; b=O19lbRdH/itxZvGtSA8IL73kRkl2nvs+YbsiRnuy
	EGRjefwsJ2ML/300gL+cpQxQX3O1bNw+7gho1CvCGEbu5L/z/vjeVEGGMiPY5Xts
	EeVw9CyPcDkUUIFNNYd0smVh0kO0kCVT2rVYQZRKkmJdfBpFBBGUBHcEe5C2/D9i
	qJqE57fr6MsBrDYsjZVnkLgMMN4JCW9rRREuvl4Elf2pM2AAiEPbj93zapYYpXpq
	dvYNMZbxa4MUtZ+3HPNlFJdygIn3oz6vn5aEHywqk8xK0qwPlACv720ZzSBODi40
	fyRPhYC4afTzukbvXhoViXgPpWVGqCCaQAlM0cpo37oaHQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1116s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:18:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso740482a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068718; x=1790673518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XKotZtMS7ewKcsV6iJ09kjS/F3R0guDpSO4Eq1SOvq4=;
        b=PDcljAxbsD05EF76VTutfKYl3LdREPRgPg6xk30ZriOm8KDz3PmsFC3jARzt3WjfNk
         ucoEVVCgUMm3bGLC2cfCMV3BaXbLnaNV4+Kc8JdwL28xZeOI1qR2P4aBrY6Y2k1oqABs
         MrXgKsVjcuP5aikXhsnNN1tA/WoJMP+mG8sBTk5kkz2DkhWE6+TK9N0aI4GJTucPqlvJ
         PoDHDe29ggohgBExuoe0Ta7/MREHWS4DUwqNV7NP37fU8jP1MQHRBpTV90a6tYx4WLlS
         SxSJJ7bMLoEQftfgNxNg+gLZMlbWOEjZdn7cRcy7pLs8Akheg8YYA1JUj860nZUEBHsV
         oOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068718; x=1790673518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKotZtMS7ewKcsV6iJ09kjS/F3R0guDpSO4Eq1SOvq4=;
        b=hXdth3SXdViLnPJdfqvgPsNmGa6u+KoJxrZKeUp+79Z4bgrYtBRGgR9K728KLI8Kmx
         k7w3DiUrQgH3QY5WmErDTmalmAtR7BineTfs30Yy5/99CKLzwIlunAKxxCA0nNlhcNL2
         l/4LItYB3PhUZJVwuA9pRY4bg72/v0DxknouD26fFuakNtEDYTrIENrzDCGVPciM4YBI
         yh1hpFb6/2SixA5AXz66/qCy29rQx62zMxswiBsvSV6cPfsl3U3M1TpCF6n/UTGpvGFL
         Lm0X9y7KkAFt/Cev6wLaVuaJzhwzr10fasT3p8YWSVnsYGpYaLCQF078RyJj7YPFhooe
         /eIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM9zIqQ2DCFc2MVpCm3pUJirZzU0psqFZlhYcMcDIzYWzvY6pORGB8EhAPREzplVjFO4JPNkXQeUVLNhI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNJIj3HSMk5Msb0hzaDsmVoN1m9Wkqu69KLe5iHKDu/ZzcCU5h
	HrHksVS1GXeLCubKPsQo2snLRBP8qcnepavGDltCaqWAjT9Gi4WOgzj5+IZlDgkpXL4onhW0PS+
	GQ/Ilc/fSTPdSY4jnGcskHVJwA3V0eoXNoxRr+8r8rsI0Opc5FT8Oqg2L+iZv2lR9R4w=
X-Gm-Gg: AYBFou03fGiBV3fm0uIesylEVys/4hufjeXafZ5tUkmIG9YEtCmE8DPiChuGJQIqB3c
	hkujIQECW8t8LCbA8rU98SzQPcqk8IcYV8mbJYX2nfzr+YR0risT0Nb9z5P74kosNbpKexNA3LC
	b8yIXiHMA5oNNyTD7d6xpkxsBZn/muAkXovvevyx/igzSlE5NCPZaBbuekhXEf91FDaOYCvXs9k
	FYdjZUU07+7c1Jl7+IN6buuaB6BS3IbyYiJU2O4HXHfnbDchWJWM87l5DUMNy5PPMWiIfdPRH7x
	zhztr/8Gq2yMwEkjO/ckAD/8+eqfa3giXvrb6VROtoJWCi/zOcoKw5WHw+sabGdt5AwfzKXkO+g
	ffK7RgAhQa8yYGkjVh2nI1SEzWvVmgonDYjhQJ41RAPm3puE=
X-Received: by 2002:a17:90b:554b:b0:3a0:5c17:642d with SMTP id 98e67ed59e1d1-3a07326e7acmr483719a91.52.1790068718211;
        Tue, 22 Sep 2026 02:18:38 -0700 (PDT)
X-Received: by 2002:a17:90b:554b:b0:3a0:5c17:642d with SMTP id 98e67ed59e1d1-3a07326e7acmr483681a91.52.1790068717620;
        Tue, 22 Sep 2026 02:18:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm4762429eec.1.2026.09.22.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:18:37 -0700 (PDT)
Date: Tue, 22 Sep 2026 02:18:35 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arJH64UqwPYfg5c+@hu-qianyu-lv.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
 <dfad8320-5a92-4398-83bd-3e796faa24a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfad8320-5a92-4398-83bd-3e796faa24a1@oss.qualcomm.com>
X-Proofpoint-GUID: WD-9rbXjQ8-1ETbBNdghYUpIvR5AD0NC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfXzo2zxQ+cis/q
 SKogJI2E/W238Ycn0VJA+n7cX7JqsfSE3PYKpT4yXdgI0nYN78t2GKXzy9/57tcq+td0N2ifh/i
 iDPKgyqZ7/8ykURsYNZatQwlFLyv/ZA=
X-Proofpoint-ORIG-GUID: WD-9rbXjQ8-1ETbBNdghYUpIvR5AD0NC
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab247ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LSDu2nEps--MNvHFjqkA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX6wcPcUFbJDRI
 oDQHl9JYXeCDNe0G3jh7AcP0crqmm7PAClybv8Wu8lZml0MOpFWDEjAliRqIDlMoaiunW4Co9+u
 y7kV4h3G+R/eE5UjvJSK/DQLjHjUmw7KAfiIVZxQ2OfYIcWv+etTiZlygJwtChZlmxiH5Xr6O6M
 92/rYCL2PmnW45x5oCbCL7tgk070W8M69c3s1lLgyrw2r6UElc5KHkHwxiQakK6vFRv5C8+Pd/q
 WHl59tAejXtCE99zxIuAWjNNfD5qxp6fsSh0RPDKRE43a6BGVHhFvb/TtChPZzqqSQck77yQSaj
 i81HckOAiw3aHenmGLAKe9KLuYyorEjdJRYVuv3IsyoR9TcQ2igpOPK/xyMvtKm0UziybhP96It
 Pzp59itflHREquVLISGfZLwMxjhKgPdNtQzREF/MS6F+8mmNyKwczgUYhgiQqyU1FrI57QlYYxX
 LQlFJwMCXqSi4LOgzzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220133

On Mon, Sep 21, 2026 at 09:37:10AM +0200, Konrad Dybcio wrote:
> On 9/21/26 8:30 AM, Qiang Yu wrote:
> > On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> >> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> >>
> >> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> >> independently-clocked and independently-resettable ports (A/B/C/D).
> >> Firmware selects the active lane topology at boot via a TCSR
> >> configuration register, and the same PHY block can appear as a single
> >> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> >> is similar in spirit to the Glymur multi-PHY support already posted,
> >> except Nord's PHY registers are programmed by Linux rather than by
> >> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> >> tables along with the power-up/power-down/soft-reset sequencing needed
> >> to bring each port up.
> >>
> >> The series also documents and wires up the qcom,nord-pcie compatible
> >> (reusing the existing SA8775P PCIe controller binding), and adds a
> >> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> >> convergence issue in the PCIe power domain.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > Tested on Glymur CRD and Glymur QCB, devices can be enumerated.
> 
> A test of "this didn't break my completely different board" is
> welcome, but looks a little confusing without you saying that
> was the intent specifically - unless maybe it wasn't?
>

Yes, I only confirmed that there is no regression on Glymur.

- Qiang Yu
