Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2A43552B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343903; cv=none; b=P7IsMPPIc7wrjmS/mTGfW2f6gfD+5j2n1cP3CzQLdCbymQDIYTSvYQBVCtN+RO33185aRNQnmeMwV/pri3Yjqg+6tP6KYpJ1TTHYir3RgeFtxa/YKc/W40BRZTTgkQ67wQbs2fbeMpaBlCvO3otLqfO4l0qS6JhaSfKFFN08hAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343903; c=relaxed/simple;
	bh=MqnEivMcGljRZrK7sqB9AWRPTMEpI3mNs3vN5Kxlhko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6iuxwrEUJPaekCO8GlwJ0dHkZAao7rEyuzO9g4zAnfabB6MMNEVHWUeP6LYxXnX07SKy6Py48HJemd4BL3GWn+LCToqiPTsrhbgoc99OSpOcQAybT+TU/xBZ21RsxhY/+WkdoqCgHhxw6Oip2xzkccwuVzKvabbGIl35b83oYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeK5KfgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF7AMhzK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeK5KfgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF7AMhzK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NEc1975061
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=; b=UeK5KfgL7e9oD8Tz
	75rNoo3ECYfgWQ+mPypX+A7CArwBHs5szY51yvE9FgFobhIG/n+2GPczqYA4VsN0
	5A4tDVM4LXQeO9L0FOakPDUsk6rGpplqZZee+VKQnVYW0ai5C9Ijyi4mk7YH7oDn
	VpwRo4SZA3n+BkXwrmQFr7k3iSDF/fMtMy7LbpYfojxRuGiL+w440uDaGCGe7SZM
	8V9WH6NPROUqd/poOoEwHu48LnMS+ZxTn8AwbNzqC/5a4QExKZB02NKfnM/zLOBM
	IZFlo7S5WWnYmv6DOzdZogTaT9Yrt1s1d7bpkBben7SViIxusEwwwMog5yngzMPB
	D/9CYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435u37x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:11:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93102454272so21189485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788343897; x=1788948697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=ZF7AMhzKuZTy4nNXW9BE4HBlcyeQzU2RC/VsuR7uxr9sTDx+9oMNwCEa18dFgw5tIr
         WLgY7FQ4YJQuQftrH4SZIe63ErNp2WM75lJJky/rEIzwUToJov8KSZhBAqe0clwNAJDw
         p+8/Bad6eS9tCSRDZ4L/LX6Yb/xcduD0A+2SAIcM7As4mQncqKR/pwLk69q/79t82tk1
         3kUHCivhHCn8DcmriSJgKq4VUsyxUpEy67T6aajYmnXR/7h/7S5alvDo0RoSu0zXEKOO
         mA/g9R3d6G+d8NRpQQp6uacjl7ILsSZ5a5QJlHXiDDuOqqZq9z0lcDRtLugfCZvDx9p0
         Zuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343897; x=1788948697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=YKcaxNCgsgDYl/b+Uyz1GPqBkK2tKqxyotU5504b9XSGXQFAUgvOFfLYVDhgCq0Qo4
         AKWrOYaA2GmYXtAYlb8ySfzQWJ55C8oXmQLc3n7hP68dlJla25pVcHtUSq/e0HbCGS1H
         18nna+T1nw9ptavFFB7WEvKQ1ROLtq0Rn0KK0opUbXzRUeBLdSLydO4JvjInIrPncA9H
         kBFoWCAshK9+w27dtwxj/2ptKKyCu42ARmGH+uF3RpMHNPqKyHkwHCJHH1lHz7nKQ98r
         EmCh8ApQNbXb5MOtCIwLJh1oYg965+E24ikZlJwmfzTgMFkFYQE2LnZPTJxfPp4JnqEj
         /WfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeT1bxjGmDbqjvaUxPRaNo0HjljUi7mQGVR7DRrkxDJ+a98E45z3LIBGizGWjFoFyO9jdoSHBjEyK+ZJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++k6gXgi9p7yi2umvSDS6TozvivnHIwSZ2gnnOv1lhcKO3GkhQyc
	Q1MROmfpG/sHisMNg/OBTBDpTSHuxxwW2nv9AuqsdijJT24aKWPzEwiGouqSaRzOwIgcys3Ok3Q
	qbtqP9IFIqowngC5jPy4Squsuy60IOgBRAbuIj70WZtKF3Zl0QKB6OIooreGvhPS8WRk=
X-Gm-Gg: AR+sD13jrrljIh5tyHZDC9aGi3qArA8qRbraH8iV6aPt54n0dXJgl3XY52RJzJWV8O/
	sdEc2nAh/10dJwJ2wt034NpLph6EQGJ66wePe7MZtW+0eGeg1pTE2ML4m77Ny+ESJom1PyDTntI
	VTYuPHnkXStkxQiYxT3jlVqDkHTxLqpqiIW5CkN2jzRCkICj3+votgTWWRmCaX+5wsu82V1gCbM
	G4ZJgs6KkDaW19AwM/BU4UPzWmHq2HDWwZFbZy+YBsO8ZWk3coGSbBwXn/aGQKazk8NTcuXKmWE
	lt9/IcFIsuuZ4+ihi6CKYtGAABf+jlKGpjYdC2FAQc9rNl3XwMDSSV++jTHRSkBXaFd7YptqWpT
	ssoNybkfMfgOvUbR/y8uKrg==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241731585a.1.1788343897375;
        Wed, 02 Sep 2026 03:11:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241723585a.1.1788343896176;
        Wed, 02 Sep 2026 03:11:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039c9fasm105678066b.31.2026.09.02.03.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:11:35 -0700 (PDT)
Message-ID: <18a73f51-a535-4cf2-a4da-d7cd4fd2a801@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX1AweUD3jAfUx
 5WfMZ4i5POmHtBv0yMChuugpFVKXbjKreXdjZ8f0uo3lwxppRqnAlDQhhL80kMh0bJpRVPxbLPT
 BLZYuYHg0xDtBwFcZ9jH6EyVvVUXzTGr1dS4O6D6pFvjxpi5//LdzqsnNqCmlbWrBmqTnA+ZAea
 Oik5IDIXcorQRWQCfNHVn0rd64vcmAW33659kiki/B65Tn4ulamB8m4daivpE3iz5dxuM3DSkZv
 XJMtXj/2NgwnrkJ/Vrn7Xl8D774YUfcHUcBHQb6o+4Gf9wCVhe6ihxpPgYMbIzfDYy5m9OiBEqI
 VyhIhMUykXxXIJB0Y11eKNlMYBUmFZDg7n7PmwXyocadKhXmVhy7Nt1vY6T2pRSRJfDFgyywfcp
 FuBn/gRLfBdcbWIXsCXrSSe7KDa9eitKwaMaYmoAak8cRVsMgd5OjJxszbtUtGOGbKu3FuLiyGp
 SutoI9+6xW6Kar2AzyQ==
X-Proofpoint-GUID: paCDUjrZTaaY5Eq8f3CPLIjEeqZlh3St
X-Proofpoint-ORIG-GUID: paCDUjrZTaaY5Eq8f3CPLIjEeqZlh3St
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97f65a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=uUvTuc4oTmGzQ4V00ZcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX3AVD5z1vD6HN
 mVSUTKNuIG7tDFp+GuDyWzWeh3kdK4/Os4/+pkhMAgCsvzZ4tk47kPMVnxvA+ITuDdlvUK2+lqK
 zGuWKHz19LoQhURU6hJGCpZ5yqoMxD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020090

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Add support for the Nord Gen5x16 bifurcated QMP PCIe PHY.
> 
> Nord has a single PCIe PHY block split into four ports which can be
> used in multiple lane configurations: x16, x8+x8, x8+x4+x4 and
> x8+x4+x2+x2. The active topology is selected through the link mode
> configuration register, and the driver exposes the corresponding PHY
> instances based on that mode.

[...]

> +static const char * const nord_pciephy_port_a_vreg_l[] = {
> +	"vdda-phy-a", "vdda-pll-a",
> +};
> +
> +static const char * const nord_pciephy_port_b_vreg_l[] = {
> +	"vdda-phy-b", "vdda-pll-b",
> +};
> +
> +static const char * const nord_pciephy_port_c_vreg_l[] = {
> +	"vdda-phy-c", "vdda-pll-c",
> +};
> +
> +static const char * const nord_pciephy_port_d_vreg_l[] = {
> +	"vdda-phy-d", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_cd_vreg_l[] = {
> +	"vdda-phy-c", "vdda-phy-d", "vdda-pll-c", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_bcd_vreg_l[] = {
> +	"vdda-phy-b", "vdda-phy-c", "vdda-phy-d",
> +	"vdda-pll-b", "vdda-pll-c", "vdda-pll-d",
> +};

Can we only list a/b/c/d resources and then take a union of them
as necessary for combined modes?


> +static struct qmp_phy_init_tbl nord_qmp_pcie_pll_a_tbl[] = {

The abcd tables are identical except for the last 2 writes. Factor
out the common config and create overlays.

[...]

> +static const char * const nord_pciephy_port_a_reg_l[] = { "port_a" };

We already have some of these symbols in this file that shouldn't
carry any SoC prefix

Konrad
