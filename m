Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B04AF660
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442073; cv=none; b=IPZXMN+MsG6VMMi7Niah7GzgNNh8yUcTiikVHbWA/OdKA9ciZo8uP9lmpbAhOVejIO6sBmdnQCpgDl9CJIBTFJmV1y2P6H/kECKyJhaq+jGYYgbY6WQLhhSmkspeY3RzCFHOCjIIot0dSClwVx1HzKNeikt21E43aYRk4nAwr2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442073; c=relaxed/simple;
	bh=NCh13W8voqbqpBRjojfXEI4cZ+RsIKEu4Bx8jRwHtqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3lbpLEQqSbaGQQyNUR9tPfGvzBbV2zr6M30Itzx/vc3UrNJfHR7jDFIPUeoC40E4v6t6eLvBK6ySGYsgrSsxKeYJbpLkf0eGxUKEFDecM273crVy3qx9s24hSNftjn3nfQxDrKuGA5wMqGllD0KS4k2lRDxg5DZqoOltgDPh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDq7yuNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWx55Zpo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDq7yuNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWx55Zpo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAEES4093519
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d3RaRG9uz14aExbdtz5RMduc
	WGOR/YOY//yVm2WHhY0=; b=FDq7yuNRsBxxCzfElqk2kfYKwBz3uzwKCQrlRQ2G
	FzSjynD8d8ryoTi39sinU9aqSVbK/zAOmU9cjgWdW4pe15ZTmGcd3NACrPKrEz+8
	GU5UAw46YaOfU1YZhI6R7mz6ESzEc+CbEaNooWe7XurqXz6BUiMmARYqA6OK/pws
	ww2XkvMZwmBAoQRAqbdpXd0ijDO6IMEob7cTH+JqJJ/XhX9kjfJolPws5DoR9wwC
	O02ZJd+liJ+wQRXC7kGK/shnvYe8XS1CrjYWVxsw48p615iREHbIY+SdwHZ9Eqzx
	p/7f6aEk6tb32OsFFzF/1umMkHsDpwF14lxaZOL9Z3XigQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjtac5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:27:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so434140685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788442058; x=1789046858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=HWx55ZpooMCubZlh4zOduESNK/WsGbTb1wryZ8YkIYfpJa0LaWNkAUTGpkAclN0WzQ
         +u9WDWBXib5kPMj6ovqoI3WpbFZYf9SXu8EuP3EFokD6ISefc2/K3v5+qNITK4avPrUV
         zC+/con/RbcxCy5PyZlZPThOFcjef9kFqpsIYEexrI9gYvlAOoUSQxmw7fYJKmRaWhFN
         OiNt25uGUJimBu1ho1ZlU2zE4dOXqVZVAK46mUWeM2SL2GnGbKIYYUbwzQxjGvfiKxHl
         NsLTuL0TgbzQv5HSow+sZiPTn7bFrdI47ocb/MV8MCuMYdevo8ntUCmFbKHHB79db/Me
         9x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442058; x=1789046858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=sdcw+VzVf1bwYKUL7WOKUIpdQFHBnVumK4BCIWby1QTT2UD8iVs5TrHTQewPfPBA//
         +kXPcUrM7hyIKGAKRcLPa997v1VPuMCL1pu9USqOrpzTgXD0pZl5XGVwWRq8dFT3KeXf
         7Lx7KjDUh+qaPmlqy59bIBXcK8wFEuYmOe+cjYzk9WIL6XLMokp9UHBQv38abEUArC4Q
         b5TRs7ZqJEs37Nc6zb2ajdLnsMKgl6aU1f6n/O0Ujuo+W/hi8TP0ap6WY2w6v1xM16Tg
         BYuLiS7UixG3DWNUUnV5mAyxE9fGWtKeaV0In1vqI++4O1gtWZHPJIlsr64RoidklFEg
         MxHw==
X-Forwarded-Encrypted: i=1; AKwUvBzJbys9IsQnxOp4TbBYMfNP0EIZkEoD2E80XiT58O49XutCzOKRDX+tcnweTsQKbZmvO/QYvUSh3T0Kauc=@vger.kernel.org
X-Gm-Message-State: AFuF++kTWyHJ1m5COmDNo6FMFZ1fE2c+LMi7zLYstLttPsrZlZk+6kQz
	I2KbNNFGwjLOfbeOFfNXVDSd6/NfJkTdJKbHF2DNUhZ69jNOMYwblIaKTuWbKQVezpsBjnUewhV
	7ces4tUVkrTpo+fNUBKnZpvVHsgBsYQLUwqdOL31IVrstXcLqgCoyE7DIkRJhY/ietwM=
X-Gm-Gg: AYBFou13giq1TMOWWhNCrPofZ32gDJuuVmE/d6+PoYbj53ctvqsTYA3XxTBSFhyPjnB
	Uz4Z0b1BGpq5zwMbCM59txdd/LX0XoYnR82jRXe6hxM3NtF4L3SKk4HM3jy3ZZrmwYrNvUyaT9x
	P3JxxW6VZQAyCMYJEXY/xQpzA2IiaNFJd7TMFYarMLqq9gvGxG/vovaCwmzCVNtwWAzgHIQ8urL
	Iq8+sjfpbLkvUnGaTfFIwdzglMs2Ut6uuAolKxODtiUyVTXiV7E+42KXJKsXbHiJA1gAxWaXmWY
	Zy03rdsmBniXRUW0qhphx002SPFXWJAmcEfkQ7h2w9uEqiCuJy2jQfxs/kWYjED4XCYQyhSXmje
	fCnyxoBwTXeOzIg==
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16736285a.11.1788442057289;
        Thu, 03 Sep 2026 06:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16730585a.11.1788442056748;
        Thu, 03 Sep 2026 06:27:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm12846442f8f.19.2026.09.03.06.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:27:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:27:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Message-ID: <unzsymxiequsolb4xfafhqun5wzhk274rxcjke7s432jiae76e@tphl57sv75m3>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX6c25b+0tlHRJ
 d0Vr4X8pCj3t660U/SHUMs4mpZiiaQAxCCxBNf1skgDNJ3dDfSsCJbTjScSFGuerdJ7J1IbUAIl
 JmjJSv0Kvb83mmggSB53HVKCSlElgyyZ49KgE3x1e/Dn+5vVc4ZVcIpdoxzfnI6goblZNeIHbt2
 gin8yls/5TFyS2zhVxPew0PmFwA6Pgtme3j6waQ4Bc5RksK0EAlCfl/lFtprnS25DE7zNv2EgaB
 RGL4ALlTt9S7Ufsuxx3Lt6KxVCetchwNPZnbISrvvmdEwhsVbo5dB12GdqIoTV73ZCMISfEoXz5
 e/ndjxAc7GRJ2tYGbwOg1Z0Y37Jdy4Ylx820CCp3T9Og34UkIBSmGcLwi5uKmYkrxqsF87WK4h9
 +mlgaTbovXPzh1NuBRBIBw76P6N6GJlP+211iKtm5sTtkOOD96edR2zPxsX+KFv/oqtDdgiAm3P
 ZpesqY7e3+vZFjKKUTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX7jRSLb8FV2jC
 +idILWbUQvDKu1AktHW8U86Ev8GrkqsptFtvQtYgePC+IvPyYtQD1dDcPTbGnRvWnQm8t1y6zyM
 BJbCqcQzieHrTdTA2+en3Dk177HHpmE=
X-Proofpoint-GUID: 5Jj7vCiuGQBxotRJtD2vRZEsK8tFKY2b
X-Proofpoint-ORIG-GUID: 5Jj7vCiuGQBxotRJtD2vRZEsK8tFKY2b
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a9975ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oLdtaUtU7qxJmi1rbcYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030117

On 26-08-14 05:48:17, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> - UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
> - PON mode   (CMN_PLL_PON_MODE_SEL = 1): parent_rate / divider
> 
> The clock output can be independently enabled and disabled via the
> CMN_PLL_PON_EN bit.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
