Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED23A1FE451
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810982; cv=none; b=ee78q2gsOqLoqMUHBRrTBr7njfyS5KUlVFm40Qs+IE7O0WL5XSaykcyKLsRgnv2RfyBd5Uhclexlx0kQt52VpycDppKuH+Yjc4FHpWbRJBmPgR43fdTpDSraH8vYAMVvZYhn2aPAgL+2YeoobKydzuL7XG0Sgbi9Ji8uTLvpVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810982; c=relaxed/simple;
	bh=tojelIR868h5jmnTwtMJ6VGqDTSoivTowZ2OXRc9l6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAsxPLDzAqAa2oNzzSsSSLyH045ALuVShHho5YkUQWLwbh9UP30QP5gV2kLVnsqWTdebReft/ZV0t1B3j9foib0CUkm99yaLYucZcPsdXM5sxW0FQEYm+PJE7SSasUK9p7PgqXdN6bihX+8+dHMLPMxieJvzf2jxQ/GEspzD78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnmOXLHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIORfHtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnmOXLHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIORfHtV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Nwe1686655
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hcQYHXRub/yQ1Dpv5XFYeIcl
	fT91vq0bk4FyY51pAd4=; b=LnmOXLHawspPH+yV4CU3osODIUZArlSJ6m7x3JFV
	+pWloCFpbzmEGo/OZMxeJB3iNNJmErxt3VZHXimNJphcWKbGlhyYN3XTOb8tdPca
	Q6pgb1CDqh1T/XJSZAaEmgE9DHdbCOy/PJyhuorHKatgiJGy2UcV7KjDqVlg0IiP
	Ha1Q9js6pIj+wrkItSDCvHXWf605PaoAZdGW0qSHvj3RZbgV9p1cTudbevrr66Y0
	a2gq6GspAZYDosMDdBu0r/aUX5mrpgtrGsZY7xqZeEoMtN0AidI+94wKoNIIs3n2
	SLL+V2HqfbZCozyYFNN2nt3iLSr9uZ0Ui7Fkih0+svh+Qg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0wbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:16:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso4604050eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810978; x=1792415778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hcQYHXRub/yQ1Dpv5XFYeIclfT91vq0bk4FyY51pAd4=;
        b=bIORfHtVPD+W8vDLpd5AIJN8UERjaOZfq43WKAf12BGucEUHFXzwsBqGxAWHJM6ko/
         dzdB/f0kuO4O2ojhGP3KwU5XIIvRQ7ti8d2e/odsOW7wT4VZLqlhgCs6AQXNRpqjN55A
         QfQn15fzRSUuGVWWJya4M98IzoSx+trtTg5y+MDg2YBacQdkpcwg0x1uRe8vXX0Jscp6
         sdeoYKGzGQhki4CG/iEXIqEjUpoa0XiDGFXIqxi6S0V/fE7KjJXvV+VoGgOqFY0y/lot
         Cppwl+rKigXHieCaGzkcVaHKLY+rIi20fVlsWcceoqPav88DxDWfSj2i+Txj3sPp6hV2
         xVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810978; x=1792415778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcQYHXRub/yQ1Dpv5XFYeIclfT91vq0bk4FyY51pAd4=;
        b=hDhK4xog7cisUj3jzq4Tie8n8fFVtQy7TjYV8Ckk+nV17edD1E/IrqSuucHD4JWpyv
         hk0RRWUTg/oV/EuBvEoJ6MpcbXxhVwLGmC1iszdQwRzzNt89sjzSP91cNTB4KCYxZ9D+
         cIsiAewte1ZOuk3kqgZ/LD7qsHdvJbvG704OSmEpUxYndYu/J6Rr7vNSR8kiOC6xBHDA
         cPG7qA7Uvnb4uM0dbWuIvP4Rvbx9q7gnzMKzgdBN98H9QLMVq1oSZgRZfPeM0TV2nVct
         sJLePaw1Mc7oGL+T0fFjWd6itqcPZBWJ76IWz8XlOsvIfjKKBZq+gWzOzdzaSUpEfoCt
         v74A==
X-Forwarded-Encrypted: i=1; AKwUvBw/iqzNI2GZ1YommZd2hKwldkReUFiwh5E4tiR4TtYxq6LRpMP3HDdneAa7ij/95uDcDoa8vXzEHNmG954=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMb6UR85M5jg4gWTi/VtvUadexMvTobp+MODLyPywB8Iz3vj1G
	8hDLTmH3DAIwAGdbffc5u7erqmAHoC/K19ZyWxeeNvFefLE+mAUwBtNV+6wiictpSg58uJACq1t
	ls6EqxK+uAAvsRZLCI/ackfx/7F8B2t/N0RwkoLZpHeRvNpwVclqeC1JwW8LR6/ek8RXMsTgUQv
	zdMg==
X-Gm-Gg: AYBFou3PtEJ4YK8As47Cvnteq2XlvyZjLBYT788p4x3farrylh+iVT7OEIAoUbr3Ch1
	p01/I6d4tqdgvAtZhrc7DcRnSqBFoaeSjtk+OFAXpcXhm0EVZjhBUjZLb9s6ABzGr+BB/jdSI6d
	elfDrjXqvCBRtjEKJ9jk1n8tmKv8FsSUUd6IeDDUxBUWG3dagAR8TUJxEpG2pZ/djZGVHk9mpO5
	NVs5W9HIEMHLF6nac6dALQBffckng41XSSwn1bTwpx/Bg224drpo8Vg+SBm//RASfaUotxx1T7Q
	W7uSVVvoz+dbeYdrkIYT4Mj816wB+e12TfH2os1RkAVP/ANJdC0AscmIRchymQsBZnrVzJs7aDo
	tvofs5yhQhdStxKoieDa+kL0UJXSjOO8tJW8083icQg==
X-Received: by 2002:a05:7301:25a1:b0:35b:dfde:8779 with SMTP id 5a478bee46e88-35bdfde9709mr314852eec.7.1791810977874;
        Mon, 12 Oct 2026 06:16:17 -0700 (PDT)
X-Received: by 2002:a05:7301:25a1:b0:35b:dfde:8779 with SMTP id 5a478bee46e88-35bdfde9709mr314819eec.7.1791810977176;
        Mon, 12 Oct 2026 06:16:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm36303294eec.10.2026.10.12.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:16:16 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:16:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] PCI: qcom: Add Nord PCIe controller support
Message-ID: <aszdme-LztWNw1J5@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-3-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-3-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX6CBMBHdIFswx
 LkpipE4+6wFlEVpuSt2JAbcGacmplmrKd4ZgJ3unzBx1DKySpt8+3Ld+ZAJV6HNIPMzN0M0+ikH
 djHc48dj6CLRPEDWVwWBmaZnI478xFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX8bmSve4z8vpl
 QJpZafZwd6UOa3pC8feSQgemf7yNWZa6GeWVm/7jn1NnLyafAEvoX0Mp1M3hC4D2HdoEjRHqVNu
 ylrkRQfctIfbkRCKRuA7dkcgHogmtT4JKiRzrodKzfgkBhr3dVdfWu8XLNLYq5U59n7Erk+aynn
 p+RwIba9EyZhM5uG+ltMcNXy1tE7F3lAIM8vgRKCejSug/l3vMs86iZoEKny/7DQA3+mJBtOHWM
 aRH/Hriho5FUWGEAvMVvp8cvBc4IyLQaBt6EDCk+KkGUP1GOE6qqWy4P1NXICxzS0YzSgo/qSLM
 UfyxJLWppLvQgc6CvZ1aeQ729B/6gh20bsMZk9DFoYYiP7Z1gicMr2UzQk8AGRDYvX9dyzhIawn
 hRSVc2W4SFY3iKWFcLo0AtKSX9SMBZYH5lB7WpxBYlpKhv846LaiU59BSkU/AhrLi9ohnAoV+cQ
 Br1lfnlt31sAy6oSu6w==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accdda2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eXNsmz249v773VhVZ_gA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: rS-SEaYFdYxdin_FCwtsc63raKfIT0UF
X-Proofpoint-GUID: rS-SEaYFdYxdin_FCwtsc63raKfIT0UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120052

On Mon, Sep 21, 2026 at 11:07:11AM +0530, Krishna Chaitanya Chundru wrote:
> Add the Nord PCIe controller configuration and the platform-specific
> settings required for correct operation.
> 
> Nord requires the NO_SNOOP override and L0s to be disabled. It also
> requires a clock-gating-control (CGC) workaround to address a PCIe
> power-domain timing-convergence issue. Set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset.
> 
> This behavior is documented in the private QCTDD11972446 erratum,
> which is not publicly available.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

On Nord Ride and RRD board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
