Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4C357D0D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136771; cv=none; b=mLl+tx3SWEpIfC10QGPoVJOfWXg0LQlV91QAovfLv7q4iiahXM8jCfPX2d49khPSDGbQztyUaHzltvfxG7zD2sI0yXSXOmlacFPxRQT/XjB8weCb1isgUajoVI70XMKiqff6HPBsIq/8kAnjKU8xCmTvvwR68VXbN0Ks9GG9qgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136771; c=relaxed/simple;
	bh=StmW96JqWZG7fKkrql9YvkfYJmFJ7jmdDutyVcOwjmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEANx+B1SZbe84EH/wXEfo97D0zzAAbl80qhCfXqHN0hk5ugVL755nNX9zjxnYs/vnRyvMyx5VOtXhmyBrcgTGxzv71DUeGoGKjoQzx/KUiVKF6bNR0cw+72/E7hmuI7KzOlPB05EfJNliU7TItcGzIl2gX0xGpvxnEewIdbnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Ej9Iud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjYfgEXb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Ej9Iud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjYfgEXb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiecT3505506
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=; b=m5Ej9IudHnxlIbJp
	CqMiKZ87K0v0zFULFil/b6+JHUJQashozqlLTCGFTnEdGqz9YVLWb6vPxGKQb0bJ
	nbV4Xd5L2NSCchk7ojPnkY4ysRnL4vuVy7x+C18V/1PHXFmW3YTx652qAVa+IDep
	N+WYnFQ9SRqfF4xKkeL1hMhRIWphax89BMoMYUK4DbhfHYRY6n5fgZQpwne1wK1I
	qkFBK6AYX6QEti8kt37E3wzjUqvxIcXWRM7DOmW+6yYNe21zQNP1iG7vpTsxef2T
	UoE1Apj9rO7pT5LF8kzVZ/SjAGaxQHbh9KOw4aoAPi7Lo8u13Np6rcshLJ5usaH2
	0W7mWQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhwa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:26:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so40411137.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136768; x=1789741568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=JjYfgEXb0iIXtlPF1jovsFR6RUrcHeEDB90xUxWC/xJbP4XmrE3rWKK1cvPtjOExWF
         IoYfplysEfxBgHACBu273QvFfgY2Bd3Wl3sQv6zdwJDsvhK2jsTud+X3XZtzA0WHHj2X
         y8/VLDTIlmuFp3xPU5rPv8TuGfXvRhENvIQyeSuO6FI/VqNe2Mq9d94hHuscquMaBsEk
         r4FwlOukMOciirxIW3Inw89jD/3ElPi+X+ZHh9nV1csHYtbETiCHznvK5ddNmyE/0owD
         6Ih/p/0zNQ+653f8a1vs5hejkADwrIuTU4tNM8NEF3wCzGgEYQD9vqEa06CJno2qYtUG
         Vjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136768; x=1789741568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=MOZJdBDjnKFq8nQO6TZ58CKeDikpB8VUkJtQLOv+AooBjK8QmdFbMJRbRo9rBbK5u8
         5z+AhVhvBNYl+rkpPs8utk8Ll0zYOMi7FWHoKjqsv4vZM1a4BCUz30VdFCfqro7vtEvk
         kGeT4GMocWoel0Np6PmK2O3LcyOW8U1joO5tf46F5nJOKJjukBOT64qlDZ43VRZji3GO
         /eE+880w8mGq9nqmvW50ZaOBCBK5DRDwO9RO8D1CXRyAXhA8mFNx+sQQrC8rn0656kg9
         d/DqSv77fkj9WG9zKeFNJ3+5UXCx7VGdn9F3HaFsilESJzB7usCKSihfndXV4hYF2m3R
         UZCQ==
X-Forwarded-Encrypted: i=1; AKwUvByNOwgr8BUt7twqIM58e0efAbleeoKKcEtxhp95ZUus/mKQ9Lrgwnt90mZYcmbhQPQ2OUhDGeBFAsnJUQY=@vger.kernel.org
X-Gm-Message-State: AFuF++nFKITA6YleTKKlOoV2v5RdzuroAZV0qnH8D1zAYE4ixUqmrRmv
	T3YY/Un84wbn1ny2b2otwgnQetH1Z5uDuNv7pEs1LhqzvttkohxtonJ8akvDSAJIQGibufMMU1p
	F/61eFop66G5bK/8kgaBK0vRQVR4Q9z5rDxsnMlhsjxuF4LYrcoJlwMszALWBUVFFquI=
X-Gm-Gg: AYBFou38HoLslWEoIRItcIX3rRpnHpotzDY7tzNVyjASPK/P6JvWZ4W61AIhkvsYpNQ
	yikWd+WF1U2VICx6ZxWBE0JwNadffE6y6AE2Xq1SxSHkKhE0PET6hA3U8cyeLbl6Z0rKZShSLf2
	jlT7LQc3Q8zfWNNrFpoGWYXPOSAt2nDqNyeJIojzMGc5XA/ac5E6wIh99tkHCY+JlZulT2s21D2
	f/eS61SDyO9LapEKfhlb8mwf4Kd6BVjU26Kfrij8iXyWHj+ThoV0kAPD/wH/iD6CXY/LaMIFj19
	qYuBhw2GD/iKeusFM1oXoC4zLT1iJW/bLpQFs4jcXmd6WLi3f5DOhSEASKTAoG3opImRr0FZyBk
	vA3Kun2PWkKjh2JmWDgbGig==
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275755137.1.1789136767679;
        Fri, 11 Sep 2026 07:26:07 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275573137.1.1789136765193;
        Fri, 11 Sep 2026 07:26:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm86105266b.10.2026.09.11.07.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:26:04 -0700 (PDT)
Message-ID: <04e79cef-bbd1-4f4d-a249-f040c7e33435@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMiBTYWx0ZWRfX33e7yhFrwYoa
 rt28yDFD0wGh+8NX3VQ2IHJNGBJFW1lsGpv7agvcvYCDAdj0HU0FJH6gr7o27aeEeM64HeUJuvm
 wonzWjq7IXz7G/OrBDHGYpbWhmffKD0RX6g1OWqSQMzg0fF22fke+YI36eHXrjSy2o8m5msuTuk
 zg7wWoHdCQEwBFroodDpaNh6LqCXAsfy6xQUBI8ieU+rUiEpePTvjKNQZJq42CEx0k2Ddnubg2/
 LJjzD/vwyRkjUdvdwHBLGzqKVfWSJfnzEWfxskVXc/FLYBPAqWXAHqqDkfP2tHM0JTKjzm5U1F9
 C22cyK9Of5qp4HZnkRLeSDEUFuTog98KLd5AwsPMbL2IzdApbpPlosAWBcoRH/DgRs8P6CJJMst
 lemr+FedGvtqblgZChOUSvTEUFYGVEbqs6EPD3nOD6rh+9MyUffA9v4gIiaWucey5iKh7GwOFcz
 qfu4aLU+4ABh+tt7Ekw==
X-Proofpoint-GUID: NtdfmKlciEBzMGfaEEK180sFEjDqvy31
X-Proofpoint-ORIG-GUID: NtdfmKlciEBzMGfaEEK180sFEjDqvy31
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMiBTYWx0ZWRfX1HkdsblApfgj
 FrBw9UmoMSwxVq5MsUQU76UCiFi2QRRktkR6fSOtr0eM/MaPCQcRrKdHRactOiF9lipcNAVV3nC
 qPuPIQY8S8acZiH+EDOLzwmudjnWSes=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40f80 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=q6PzOI_h-AFGYkee8UYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110202

On 9/7/26 10:23 PM, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
> all at 120 MHz, and the 36-bit DMA address width.
> 
> As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
> a second enable reference on the "stmmaceth" clock, which is already
> enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
> run at 120 MHz for NOC access, and managing "stmmaceth" through the same
> clk_bulk path keeps the rate-setting and enable/disable together.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a488640f6dbdca30 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	},
>  };
>  
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};

Can we please put this into an OPP table, so that it also casts
the required power vote?

Konrad
