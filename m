Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC02EB5A6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599663; cv=none; b=OfCjj1Nu4JL56wx4Irr+QY/uG0P2g3cmwicWfAyHN+BRZThVPxKOQ/4LjH81aBtfB6fWn6miARTyMWLBav+CXU2fWveIecGowZzy/vHda3z/ZKJhJZt1mMn7aoTobH2Jpn9DMWyGb0br2bgSa3aApEQs6okqcD6j7bpJzQzR9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599663; c=relaxed/simple;
	bh=qVrby1GNsr5E85SZ6BNJGXNH2YriwKERmumc9KjiWdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cInz287Zlde5fLNwz3UYr4EM+AtkVLUlA80/4Ticb+Izd18dESOfyIle80A2iHysa0Z7gYAD7BK0MQWlbV5SgCnVZbDdQTCOB9v3NPFFiP9ZV4PwEFxZJSvKDDIrKMXUemAqLec6mYvT5zDLdqUDd3zK7kX1E+CKZLSrA4lUiLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkGTh1x2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMnh7h6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkGTh1x2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMnh7h6w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKKKv2608909
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7GCClgewl4EWHzhELzm9dcYc
	LM1+qTSt2x4KePWyaII=; b=jkGTh1x2xj4nNUfj52SoWEs/Tl9vf83pTbTrqyGG
	ApauMGbnR8nxWr+HgQwEOhQo2lEo1aDE3uRN4oPPhSlgGp+Qhn2KIXrPajaQVwuZ
	DRmqJprzYUwhZB9lzx3beTBzrl/u9X2+21hkoJACtq25q0+WYtKYl/mroPM5m6nB
	GwkIG1DsJekL8V21pQHbtRJ+2V95NirT9qD1b6fMXZoger0uxnWuNruLQLTw/WlW
	aHi8mqrc+QUZ3ktPQ9xAMML/Cz2ePzYfa4dfu8VvvmfRReJzo53+r7IsO/wZgn5x
	bSPzdO/51nnF/P/p1ndwYy+naL4PQenNn43vYEOlFiTUqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8hghp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:34:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so532398eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791599659; x=1792204459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7GCClgewl4EWHzhELzm9dcYcLM1+qTSt2x4KePWyaII=;
        b=BMnh7h6wSJIvvKukIW5/HyP3gAfJ/qQwFh+2imu/tL/vySBwaGdrY68g/6qYBagjsq
         hnHM/JNTB7E9OglYVHVeRg55Xp12LgcGnC3zmmEIP+vYgekOCq8rBELmsTGgxAS0j91X
         tTg5d1N/AouelmNKi1/Iwdv6nFj9GS/mBGq+0E0O8uyqyiy8f0hPWdfnNgOI5ul79pEu
         QyQ6DvG0NtfDVV6J+jHQuREbgRHs1bDYxcLr6Xv1ZGcaKQVuTlwfUg4wjEQWPpoxr0z3
         iJgfdF+LcGUpS77uUASsEyf5loPL2c5FDFxBhfSu2btslPpcPPQaqf6THUYbeWQqmOIb
         UUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599659; x=1792204459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GCClgewl4EWHzhELzm9dcYcLM1+qTSt2x4KePWyaII=;
        b=htdI56QPiBzJ5sFLidYt4raqasIW4deWknYVuWD3FNVHK/j4kogrsFvO7Z5giQlqQZ
         l7zYsoghiu1xbgbmDdifz+57R3k4uWxetOKA6UMi+w7N1+bvC1llGUO+PPOefKauxKvK
         0G1bFZhlFW/By+gvro+dMWkDGJaWj0UFTtsvIoOD8Ytvv9i6cww0UjBm5SxlvUT7SD7O
         iT4h3XOfDIu52ieyXylE+B8ui8MJWBG5WkreTQSAARebplvOdVFPmV4n0Khf5gfG1/gb
         ox11wEOadMo1w5s9ILOaUlx3tbguxaWVYaTglJwR213QA/ltzDuxZUYQCfFOYHdRv6Ph
         dHCg==
X-Forwarded-Encrypted: i=1; AKwUvBwXsWffrQ7kx4vNmeDCkWBLxZJ/Ej9o4jWSEGJwhr9mJ+NoJe0eVXkXYvmhx8UTkQjovYUQwZqUBPhHMKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKidLzsjC6/n+pGESung5KAW8CjsJ2toTtQxO0OByf3DfECuytt
	ss+zZkmmk6zmguSyjMpE1U66IgtfqREKv/q/4qAjCWjSFpWpzmnSHfVmvJD98C9hu+uIHDU43du
	DJy7HmJYyLZPQG91B5nFEFdnVWqeiDWMUk+orAkcy5IxswnFPvd0BaXrIp0VWVPmJdxU=
X-Gm-Gg: AYBFou3H9lUcPwv7Fu6ZNrC5hcheHkxNLKrUymB8mVD2xcmADQNco317m5FrkNI7y5N
	n+7I23Ix147Ccl/+hirqdWDMxRIhG7hAvfeSfwPGvE80Y7FY4IfoTo4myq7rVgcn/xUr6KBGSy5
	8VAq7zo/Sr6yi+rVB4RrphUAo7IV6G++DZFqT3kA/hvKuSnqhLaojApJWA/WBCDvedIO2Pgryq0
	XLTUm5I/ndopruik6LZoMy6O7ypn6Wpo9QgWz+dRSYgE0Jh9KXB5zBZMFjwrxK2GH6WkGFRY1F9
	KBnLFZoGNRZsLIbP2epKQ+30v+CL4hsplRDJIHhF2ug4QiItYlBqdlMJ/hVouXQJ5LrSCstwUvV
	nX/EccztmoTd2e9Wk+3ZRswnKTBmYiH+PrXEBL+69fw==
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr4741586eec.1.1791599659059;
        Fri, 09 Oct 2026 19:34:19 -0700 (PDT)
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr4741542eec.1.1791599658182;
        Fri, 09 Oct 2026 19:34:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm13064482eec.9.2026.10.09.19.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:34:17 -0700 (PDT)
Date: Sat, 10 Oct 2026 10:34:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
Message-ID: <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: AE9eMsyTPnOjhMBpc-qHCXN4lei4UQrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAwOSBTYWx0ZWRfX7XBdz6bAIBhK
 N8Pr8EQP/QHrMv8Ub/iYlOfygK6gBYmwROVPBthU8ba7Yn1IYYVVklk7revDGCw+csEOzmRhIQK
 VZroocx++yiS6Fv5GZXobqyz0Y/pQu7HQbXMxWd/CYwSORNPpqwqH4q1Yb8zg8sffce8XLqnjJ3
 sVqSSSdkC3+H7KSDBLibkOPENyFTRnlygawhQZJvJ1Ja0TnJtAOyvcv+D/tE54R9sTkkaHkmzrZ
 QHjgvDJL2ONWdnVNELCsFT3mXSPWU0kFShp59JB9dLTvR97yN2NmX5IEVk5kGCIKKPC2EwKTV+N
 T6pMjYWhlKk32CFCJlTHRnXzKnBWKpv+VPzNwVeL6bAHHB7sI4GoI72+zwokZUK1hBCMAq9lhje
 2/M9eEp8II2aJE18ndYjFC77t3qDl2WITFaxkYAODGJFrzWcDPZSzHdrycQy1vezdBcO7VXB4Pi
 +e8Wq2YQHYAh/myj0ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAwOSBTYWx0ZWRfXy15n8NGpXoDb
 hk6+RAHRCKDgf9y/AOmtlPzrJXv9yK27lTJsbnV8iG7/H/Od3V0AdiKnHHzIbRueIQG51RIJHsX
 Y0GWg8sDRr3DoCQskLmX7nBfsE0n4yA=
X-Proofpoint-ORIG-GUID: AE9eMsyTPnOjhMBpc-qHCXN4lei4UQrk
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac9a42c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cESL6FHe5ALw8tn1dXMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100009

On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Nord has four PCIe controllers backed by a single quadfurcated Gen5
> QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> topology in effect is selected by firmware through the TCSR link-config
> mode register, which the PHY driver reads at probe time.  Describe the
> x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> configuration the boards ship with.
> 
> Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> also become available now, so hook them up as GCC parents in place of
> the <0> placeholders.
> 
> The controllers and the PHY are left disabled here and enabled per
> board.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 926 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 297 +++++++
>  2 files changed, 1219 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index c7ac2e66632e..6e79f3cb20e9 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -342,6 +342,738 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
>  	pinctrl-names = "default";
>  };
>  
> +&pcie0 {
> +	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
> +		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
> +		 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
> +		 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
> +		 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
> +	clock-names = "aux",
> +		      "cfg",
> +		      "bus_master",
> +		      "bus_slave",
> +		      "slave_q2a";
> +
> +	assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "pcie-mem",
> +			     "cpu-pcie";
> +
> +	power-domains = <&gcc GCC_PCIE_A_GDSC>;
> +
> +	resets = <&gcc GCC_PCIE_A_BCR>,
> +		 <&gcc GCC_PCIE_A_LINK_DOWN_BCR>;
> +	reset-names = "pci",
> +		      "link_down";
> +
> +	pinctrl-0 = <&pcie0_default>;
> +	pinctrl-names = "default";
> +
> +	operating-points-v2 = <&pcie0_opp_table>;
> +
> +	pcie0_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		/* GEN 1 x1 */
> +		opp-2500000-1 {
> +			opp-hz = /bits/ 64 <2500000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <250000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x2 */
> +		opp-5000000-1 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x4 */
> +		opp-10000000-1 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x8 */
> +		opp-20000000-1 {
> +			opp-hz = /bits/ 64 <20000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <2000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x16 */
> +		opp-40000000-1 {
> +			opp-hz = /bits/ 64 <40000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <4000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 2 x1 */
> +		opp-5000000-2 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x2 */
> +		opp-10000000-2 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x4 */
> +		opp-20000000-2 {
> +			opp-hz = /bits/ 64 <20000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <2000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x8 */
> +		opp-40000000-2 {
> +			opp-hz = /bits/ 64 <40000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <4000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x16 */
> +		opp-80000000-2 {
> +			opp-hz = /bits/ 64 <80000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <8000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 3 x1 */
> +		opp-8000000-3 {
> +			opp-hz = /bits/ 64 <8000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <984500 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x2 */
> +		opp-16000000-3 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x4 */
> +		opp-32000000-3 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x8 */
> +		opp-64000000-3 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x16 */
> +		opp-128000000-3 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 4 x1 */
> +		opp-16000000-4 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x2 */
> +		opp-32000000-4 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x4 */
> +		opp-64000000-4 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x8 */
> +		opp-128000000-4 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x16 */
> +		opp-256000000-4 {
> +			opp-hz = /bits/ 64 <256000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <31506000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 5 x1 */
> +		opp-32000000-5 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x2 */
> +		opp-64000000-5 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x4 */
> +		opp-128000000-5 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x8 */
> +		opp-256000000-5 {
> +			opp-hz = /bits/ 64 <256000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <31506000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x16 */
> +		opp-512000000-5 {
> +			opp-hz = /bits/ 64 <512000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <63012000 1>;
> +			opp-level = <5>;
> +		};
> +	};
> +};
> +
> +&pcie0_port0 {
> +	phys = <&pcie_phy 0>;
> +};
> +
> +&pcie1 {
> +	clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
> +		 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
> +		 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
> +		 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
> +		 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
> +	clock-names = "aux",
> +		      "cfg",
> +		      "bus_master",
> +		      "bus_slave",
> +		      "slave_q2a";
> +
> +	assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "pcie-mem",
> +			     "cpu-pcie";
> +
> +	power-domains = <&gcc GCC_PCIE_B_GDSC>;
> +
> +	resets = <&gcc GCC_PCIE_B_BCR>,
> +		 <&gcc GCC_PCIE_B_LINK_DOWN_BCR>;
> +	reset-names = "pci",
> +		      "link_down";
> +
> +	pinctrl-0 = <&pcie1_default>;
> +	pinctrl-names = "default";
> +
> +	operating-points-v2 = <&pcie1_opp_table>;
> +
> +	pcie1_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		/* GEN 1 x1 */
> +		opp-2500000-1 {
> +			opp-hz = /bits/ 64 <2500000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <250000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x2 */
> +		opp-5000000-1 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x4 */
> +		opp-10000000-1 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x8 */
> +		opp-20000000-1 {
> +			opp-hz = /bits/ 64 <20000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <2000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 2 x1 */
> +		opp-5000000-2 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x2 */
> +		opp-10000000-2 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x4 */
> +		opp-20000000-2 {
> +			opp-hz = /bits/ 64 <20000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <2000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x8 */
> +		opp-40000000-2 {
> +			opp-hz = /bits/ 64 <40000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <4000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 3 x1 */
> +		opp-8000000-3 {
> +			opp-hz = /bits/ 64 <8000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <984500 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x2 */
> +		opp-16000000-3 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x4 */
> +		opp-32000000-3 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x8 */
> +		opp-64000000-3 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 4 x1 */
> +		opp-16000000-4 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x2 */
> +		opp-32000000-4 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x4 */
> +		opp-64000000-4 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x8 */
> +		opp-128000000-4 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 5 x1 */
> +		opp-32000000-5 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x2 */
> +		opp-64000000-5 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x4 */
> +		opp-128000000-5 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x8 */
> +		opp-256000000-5 {
> +			opp-hz = /bits/ 64 <256000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <31506000 1>;
> +			opp-level = <5>;
> +		};
> +	};
> +};
> +
> +&pcie1_port0 {
> +	phys = <&pcie_phy 1>;
> +};
> +
> +&pcie2 {
> +	clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
> +		 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
> +		 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
> +		 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
> +		 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
> +	clock-names = "aux",
> +		      "cfg",
> +		      "bus_master",
> +		      "bus_slave",
> +		      "slave_q2a";
> +
> +	assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "pcie-mem",
> +			     "cpu-pcie";
> +
> +	power-domains = <&gcc GCC_PCIE_C_GDSC>;
> +
> +	resets = <&gcc GCC_PCIE_C_BCR>,
> +		 <&gcc GCC_PCIE_C_LINK_DOWN_BCR>;
> +	reset-names = "pci",
> +		      "link_down";
> +
> +	pinctrl-0 = <&pcie2_default>;
> +	pinctrl-names = "default";
> +
> +	operating-points-v2 = <&pcie2_opp_table>;
> +
> +	pcie2_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		/* GEN 1 x1 */
> +		opp-2500000-1 {
> +			opp-hz = /bits/ 64 <2500000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <250000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x2 */
> +		opp-5000000-1 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x4 */
> +		opp-10000000-1 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 2 x1 */
> +		opp-5000000-2 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x2 */
> +		opp-10000000-2 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x4 */
> +		opp-20000000-2 {
> +			opp-hz = /bits/ 64 <20000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <2000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 3 x1 */
> +		opp-8000000-3 {
> +			opp-hz = /bits/ 64 <8000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <984500 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x2 */
> +		opp-16000000-3 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x4 */
> +		opp-32000000-3 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 4 x1 */
> +		opp-16000000-4 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x2 */
> +		opp-32000000-4 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x4 */
> +		opp-64000000-4 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 5 x1 */
> +		opp-32000000-5 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x2 */
> +		opp-64000000-5 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x4 */
> +		opp-128000000-5 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <15753000 1>;
> +			opp-level = <5>;
> +		};
> +	};
> +};
> +
> +&pcie2_port0 {
> +	phys = <&pcie_phy 2>;
> +};
> +
> +&pcie3 {
> +	clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
> +		 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
> +		 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
> +		 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
> +		 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
> +	clock-names = "aux",
> +		      "cfg",
> +		      "bus_master",
> +		      "bus_slave",
> +		      "slave_q2a";
> +
> +	assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
> +	assigned-clock-rates = <19200000>;
> +
> +	interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "pcie-mem",
> +			     "cpu-pcie";
> +
> +	power-domains = <&gcc GCC_PCIE_D_GDSC>;
> +
> +	resets = <&gcc GCC_PCIE_D_BCR>,
> +		 <&gcc GCC_PCIE_D_LINK_DOWN_BCR>;
> +	reset-names = "pci",
> +		      "link_down";
> +
> +	pinctrl-0 = <&pcie3_default>;
> +	pinctrl-names = "default";
> +
> +	operating-points-v2 = <&pcie3_opp_table>;
> +
> +	pcie3_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		/* GEN 1 x1 */
> +		opp-2500000-1 {
> +			opp-hz = /bits/ 64 <2500000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <250000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 1 x2 */
> +		opp-5000000-1 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <1>;
> +		};
> +
> +		/* GEN 2 x1 */
> +		opp-5000000-2 {
> +			opp-hz = /bits/ 64 <5000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <500000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 2 x2 */
> +		opp-10000000-2 {
> +			opp-hz = /bits/ 64 <10000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1000000 1>;
> +			opp-level = <2>;
> +		};
> +
> +		/* GEN 3 x1 */
> +		opp-8000000-3 {
> +			opp-hz = /bits/ 64 <8000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <984500 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 3 x2 */
> +		opp-16000000-3 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <3>;
> +		};
> +
> +		/* GEN 4 x1 */
> +		opp-16000000-4 {
> +			opp-hz = /bits/ 64 <16000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <1969000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 4 x2 */
> +		opp-32000000-4 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <4>;
> +		};
> +
> +		/* GEN 5 x1 */
> +		opp-32000000-5 {
> +			opp-hz = /bits/ 64 <32000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <3938000 1>;
> +			opp-level = <5>;
> +		};
> +
> +		/* GEN 5 x2 */
> +		opp-64000000-5 {
> +			opp-hz = /bits/ 64 <64000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			opp-peak-kBps = <7876000 1>;
> +			opp-level = <5>;
> +		};
> +	};
> +};
> +
> +&pcie3_port0 {
> +	phys = <&pcie_phy 3>;
> +};
> +
>  &qupv3_0 {
>  	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
>  		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
> @@ -704,10 +1436,10 @@ gcc: clock-controller@100000 {
>  		reg = <0x0 0x00100000 0x0 0x1f4200>;
>  		clocks = <&bi_tcxo_div2>,
>  			 <&sleep_clk>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> -			 <0>;
> +			 <&pcie_phy 0>,
> +			 <&pcie_phy 1>,
> +			 <&pcie_phy 2>,
> +			 <&pcie_phy 3>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		#power-domain-cells = <1>;
> @@ -774,6 +1506,100 @@ mmss_noc: interconnect@1780000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	pcie_phy: phy@1b00000 {
> +		compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
> +
> +		reg = <0x0 0x01b00000 0x0 0x10000>,
> +		      <0x0 0x01b10000 0x0 0x10000>,
> +		      <0x0 0x01b20000 0x0 0x10000>,
> +		      <0x0 0x01b30000 0x0 0x10000>;
> +		reg-names = "port_a",
> +			    "port_b",
> +			    "port_c",
> +			    "port_d";
> +
> +		clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
> +			 <&tcsrcc TCSR_PCIE_CLKREF_EN>,
> +			 <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
> +			 <&gcc GCC_PCIE_A_PIPE_CLK>,
> +			 <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
> +			 <&gcc GCC_PCIE_B_PIPE_CLK>,
> +			 <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
> +			 <&gcc GCC_PCIE_C_PIPE_CLK>,
> +			 <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
> +			 <&gcc GCC_PCIE_D_PIPE_CLK>;
> +		clock-names = "aux_a",
> +			      "cfg_ahb_a",
> +			      "ref",
> +			      "rchng_a",
> +			      "pipe_a",
> +			      "aux_b",
> +			      "cfg_ahb_b",
> +			      "rchng_b",
> +			      "pipe_b",
> +			      "aux_c",
> +			      "cfg_ahb_c",
> +			      "rchng_c",
> +			      "pipe_c",
> +			      "aux_d",
> +			      "cfg_ahb_d",
> +			      "rchng_d",
> +			      "pipe_d";
> +
> +		assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
> +				  <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
> +				  <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
> +				  <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
> +		assigned-clock-rates = <100000000>,
> +				       <100000000>,
> +				       <100000000>,
> +				       <100000000>;
> +
> +		power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
> +				<&gcc GCC_PCIE_B_PHY_GDSC>,
> +				<&gcc GCC_PCIE_C_PHY_GDSC>,
> +				<&gcc GCC_PCIE_D_PHY_GDSC>;
> +		power-domain-names = "port_a",
> +				     "port_b",
> +				     "port_c",
> +				     "port_d";
> +
> +		resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
> +			 <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
> +			 <&gcc GCC_PCIE_B_PHY_COM_BCR>,
> +			 <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
> +			 <&gcc GCC_PCIE_C_PHY_COM_BCR>,
> +			 <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
> +			 <&gcc GCC_PCIE_D_PHY_COM_BCR>,
> +			 <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
> +		reset-names = "port_a",
> +			      "port_a_nocsr",
> +			      "port_b",
> +			      "port_b_nocsr",
> +			      "port_c",
> +			      "port_c_nocsr",
> +			      "port_d",
> +			      "port_d_nocsr";
> +
> +		qcom,link-mode = <&tcsr 0x71050>;
> +
> +		#clock-cells = <1>;
> +		clock-output-names = "pcie_a_pipe_clk",
> +				     "pcie_b_pipe_clk",
> +				     "pcie_c_pipe_clk",
> +				     "pcie_d_pipe_clk";
> +		#phy-cells = <1>;
> +
> +		status = "disabled";
> +	};
> +
>  	pcie_cfg: interconnect@1ba0000 {
>  		compatible = "qcom,nord-pcie-cfg";
>  		reg = <0x0 0x01ba0000 0x0 0x7200>;
> @@ -998,6 +1824,98 @@ nsp_data_noc_3: interconnect@1fe00000 {
>  };
>  
>  &tlmm {
> +	pcie0_default: pcie0-default-state {
> +		wake-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
stay here. But wake and perst are board chosen GPIOs. I think they should
go to board DTS.

Shawn

> +	};
> +
> +	pcie1_default: pcie1-default-state {
> +		wake-pins {
> +			pins = "gpio3";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio4";
> +			function = "pcie1_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio5";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	pcie2_default: pcie2-default-state {
> +		wake-pins {
> +			pins = "gpio6";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio7";
> +			function = "pcie2_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio8";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	pcie3_default: pcie3-default-state {
> +		wake-pins {
> +			pins = "gpio9";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio10";
> +			function = "pcie3_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio11";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	qup_i2c0_default: qup-i2c0-default-state {
>  		pins = "gpio111", "gpio112";
>  		function = "qup0_se0";
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 83760341456b..0fb292074b99 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1587,6 +1587,290 @@ rng: rng@10c3000 {
>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>  		};
>  
> +		pcie0: pci@1b80000 {
> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
> +
> +			reg = <0x00 0x01b80000 0x00 0x00004000>,
> +			      <0x00 0x40000000 0x00 0x00000f20>,
> +			      <0x00 0x40000f20 0x00 0x000000a8>,
> +			      <0x00 0x40010000 0x00 0x00020000>,
> +			      <0x00 0x40100000 0x00 0x00100000>,
> +			      <0x00 0x01b84000 0x00 0x00001000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0xfd00000>;
> +
> +			bus-range = <0x00 0xff>;
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			num-lanes = <8>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommu-map = <0x0 &pcie_smmu 0x0000 0x10000>;
> +
> +			msi-map = <0x0 &gic_its 0x80000 0x10000>;
> +
> +			status = "disabled";
> +
> +			pcie0_port0: pcie@0 {
> +				compatible = "pciclass,0604";
> +				reg = <0 0 0 0 0>;
> +				bus-range = <0x01 0xff>;
> +				device_type = "pci";
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie1: pci@1b88000 {
> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
> +
> +			reg = <0x00 0x01b88000 0x00 0x00004000>,
> +			      <0x00 0x50000000 0x00 0x00000f20>,
> +			      <0x00 0x50000f20 0x00 0x000000a8>,
> +			      <0x00 0x50010000 0x00 0x00010000>,
> +			      <0x00 0x50100000 0x00 0x00100000>,
> +			      <0x00 0x01b8c000 0x00 0x00001000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0xfd00000>;
> +
> +			bus-range = <0x00 0xff>;
> +			device_type = "pci";
> +			linux,pci-domain = <1>;
> +			num-lanes = <4>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 835 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 351 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 830 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 348 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			msi-map = <0x0 &gic_its 0x90000 0x10000>;
> +
> +			iommu-map = <0x0 &pcie_smmu 0x10000 0x10000>;
> +
> +			status = "disabled";
> +
> +			pcie1_port0: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0 0 0 0 0>;
> +				bus-range = <0x01 0xff>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie2: pci@1b90000 {
> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
> +
> +			reg = <0x00 0x01b90000 0x00 0x00004000>,
> +			      <0x00 0x60000000 0x00 0x00000f20>,
> +			      <0x00 0x60000f20 0x00 0x000000a8>,
> +			      <0x00 0x60010000 0x00 0x00010000>,
> +			      <0x00 0x60100000 0x00 0x00100000>,
> +			      <0x00 0x01b94000 0x00 0x00001000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xfd00000>;
> +
> +			bus-range = <0x00 0xff>;
> +			device_type = "pci";
> +			linux,pci-domain = <2>;
> +			num-lanes = <2>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 263 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 154 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 110 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 258 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommu-map = <0x0 &pcie_smmu 0x20000 0x10000>;
> +
> +			msi-map = <0x0 &gic_its 0xa0000 0x10000>;
> +
> +			status = "disabled";
> +
> +			pcie2_port0: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0 0 0 0 0>;
> +				bus-range = <0x01 0xff>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie3: pci@1b98000 {
> +			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
> +
> +			reg = <0x00 0x01b98000 0x00 0x00004000>,
> +			      <0x00 0x70000000 0x00 0x00000f20>,
> +			      <0x00 0x70000f20 0x00 0x000000a8>,
> +			      <0x00 0x70010000 0x00 0x00010000>,
> +			      <0x00 0x70100000 0x00 0x00100000>,
> +			      <0x00 0x01b9c000 0x00 0x00001000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0xfd00000>;
> +
> +			bus-range = <0x00 0xff>;
> +			device_type = "pci";
> +			linux,pci-domain = <3>;
> +			num-lanes = <2>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 111 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 246 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 239 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 234 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
> +
> +			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
> +
> +			status = "disabled";
> +
> +			pcie3_port0: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0 0 0 0 0>;
> +				bus-range = <0x01 0xff>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
>  		ufs_mem_hc: ufshc@1d44000 {
>  			compatible = "qcom,nord-ufshc",
>  				     "qcom,ufshc",
> @@ -1736,6 +2020,19 @@ ipcc0: mailbox@9007000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		pcie_smmu: iommu@9980000 {
> +			compatible = "arm,smmu-v3";
> +			reg = <0x0 0x09980000 0x0 0x20000>;
> +			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "eventq",
> +					  "cmdq-sync",
> +					  "gerror";
> +			dma-coherent;
> +			#iommu-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,nord-pdc",
>  				     "qcom,pdc";
> -- 
> 2.43.0
> 
