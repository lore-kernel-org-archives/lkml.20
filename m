Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437620;
	b=lLsLkeK2fcggCYRFGmzLLq35ttmKJeYtA1jw3dXbj+kwuxkGSd6aDkPJFpTcJ+OwjNyA
	 wggg4pfugxhdEi9Gdc3YioKEJMVa28zijKXpsqmyuJBIFL50+MZVjb5gTBZzuyiYa5Oc0
	 wTcqWmMQFsb8QnYn4RzK19o3AgCtzqGk4EhOKZeYdo1TSwYiiJH56cBGkxfZsuJ5DK7Ie
	 xRSDR7qo8uIqdQJRJfsjmvdcytBbvE4EXSD5NbpuoJTLgnh26Rxk2qxqC5brJjAH1skFF
	 4Sv5D3wyiQ+NJCF3x8rPpRE9ty8LwvabmZgDBI1CGnkLcLS3exOvJXLt5+d6zL6LmeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
	b=zf1NnCz6UtNysYqqDu15blH5dLY2Vj6qQLBgUNoO6vPCAfr7zhZLn1/OazybgLiv1tPm
	 cNMGXIx9JHKQ9rxJ2m3bDrG85Yd/lm1RZvpjxQbt+Z1BxVHVBuq2fTMjs/JWWRH1gdHRY
	 k+JsXprRHKB1cTOkTqucYSbF/2tsrD0At0/WhDmsxcEFvM7CHYTFSn/O064H6hWujoS/m
	 8vLBBY/23zGnRIoRbwr5+8NQIelFC+35Yjd+3cEY/siIDI85CWG9AOkpbIFNGXkQdlnCL
	 eueszbdhKrt55zU/H9Erv1ZJne97cxHrpuhQhR608fPyFj9gEoXFeA/uvyM2pecHUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMqvsGxa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrNR2wmR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D26606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMqvsGxa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrNR2wmR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aqU62178127
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o6sTbifNJZj9Ss/BoT9XSVvZ
	GvTCCVHXANMlYczDtMM=; b=nMqvsGxah1fsKiSJXns816xmhotP1OZB8YfT5nnL
	xK+CYAnd4e8/o/WArc4tRj8gObOsmh3H46dJ3Y3jr8xIuErwCqhmZ8L9YPr6bT/u
	Gly87j590LZPL1n/jvQ2F0U9uQHkzFaN/YUK11U4r4CiMXoxDXdbuq3Fa71fVQnH
	pMngMsCIW6nVNpODOZ9hSIQcbG+KdMp/gXlUHi//85dblHaD+rZTkDfWhOcvM6t6
	HWnVKHpzdneBflbXLps5WPRaHP2mLWrRkFSCFE3BKHGZYnxtiAikf1Y9IM7dFdC1
	R8VeAE/YIJVMqb8M+71MqXo/UX75MQzeW1EyYO2GzA63RQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rrw9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:06:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3800581eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437619; x=1794042419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
        b=MrNR2wmRFuWPFZ1MCfBHYAxCvfMpNDtK4urKRDjrfuN9mCpVdcsktu0QdvPCMQ9nHQ
         FcOfjSucrrlgggmPoTWkXFmDNMgWafdBYopJDNkb+QKdwHEEL836jOtxoboc+uKFK4h9
         OJegE7Ng1CW5CLME2KZeY5rgFrbSlPAXKhr40ZvIlrPQprIwJEEOatGaqVxlMHgiow2c
         BuXN6aOoRPSJSSFQ6jrXbUjMYgKXisWi9fXfEm9ktVGOf5vEvKQtjYYITOJl+Pt/1eBj
         eIUIwUVDyQMJrOcW7aYTKnuirIp15g7w7NL1r7DMSQuzYtcKGxhFIN70PUQQb9m+soJk
         wD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437619; x=1794042419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
        b=FTqzR2Dpo2/S8obt2JvjMkYx3mBSagbFooaoCLaz043Nb0/+47VlMVFVzCSKT59EN9
         FNo+6vBZuMAUNuHfN1nWyGUscn8CcZECXj7FErTF3GDk9bU1wmJRgovT2K3sbFSfcvzD
         05xsHaOdOFIwRu/aqIuA4fOndM7vb1ytNMl2cHuOXBuH2TDPp4Y+Z+njIr2E1x/M61/u
         Bb+/ETSRDMP+MC7+KBiq0/3/DbTrGKl0dzLy4OW+blATIewqIpYGAJQLd5ZTGlP5Wt8Q
         ECmxD5idTTK7ySEN/MgLePwR4PyR3RIwOHy0xaEVQulmvAdb1WvgR1+ZPnfV0IujVorc
         W1nA==
X-Forwarded-Encrypted: i=1; AKwUvBxslX3a0IlZR1EIeWIh+gr2veYgkoPKLtHiL7+YY2rS6LSkTSPA3muwgK/7xpo1+Vkfmfp2ugV646RJAo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo8kB2UU2EUNwnbKYlpaoKFy6o2UOYRb2gE1ZsA/xX7F58EIXn
	FHgUYxzfJB5ylI2XPy3jIQih9L7FkcZFOXFmZTs/Y/0GbBShl5ZRvlsphJcVYjOzOOz9Hogo4yD
	c2zKq9fr79hi7MF4mzvgKrF6h+Ik2E1j/LP7xZq2N5HUkqjnD+sshXAhQ64DJVGYqnDM=
X-Gm-Gg: AYBFou2TNGDSxtUIoW7DuNi3Daa3xsmChZa2JxdFY5t/w8VAozL6WlMnEMdKFpPyaVP
	VNAB920HWuH2hjxbvzTMwNN/rdU/YcdluueAfHJDLoJzgzYanQdZOp5FXoDvrSd7CRhetzy8Wb/
	OJN/4gVE69Vj+hnE/s95HVPtsZ0NKmX+sQc1qS3AHiaAqSXSLKPL+JWfI8L5zaiNZezZdMiQ4YN
	Yy0pz7TpNJJnHqmzQMh9T5d1xBMY7oDQz9B8+/WHsS1kaKPxSw560duCgRpzVqzJWBgOHypRrWY
	8SaV9ZQspbjQU6dbRcCHN74lSd4H8SMyKBYb1Kp883lWWPYWP8X1ZYU4ykoas4ysG/LkLYwCIPS
	SOXFhRFEV5jhtN/4/z5TPmxP5aL7MGkdAZ7NsJL2ntHQJlRdiYJ3dtZkQhvo/xnHbSwlpphwEHl
	cX3M13KY3y3zofR44=
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr6921715eec.20.1793437618720;
        Sat, 31 Oct 2026 02:06:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr6921677eec.20.1793437617966;
        Sat, 31 Oct 2026 02:06:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm17598140eec.22.2026.10.31.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:06:57 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:06:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWvrIrnmC9I2dWE@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
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
In-Reply-To: <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 866zm_D8_ChJpnDb1dUvVrDaNUyek2yw
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5afb3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=yIiWiYsqNO_wyTKnxrMA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNiBTYWx0ZWRfX2yJe3PfJzRDH
 1LVU7vjxD8p4/36y4JqXSQ6OTuhYf/Krwn0+VGH+3qViSpVFOq4Qfhf5FsX4K4QuY5ifyrbxATk
 IvjobLEgIf3p0b3tY3QFrI06eqt3JtY=
X-Proofpoint-GUID: 866zm_D8_ChJpnDb1dUvVrDaNUyek2yw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNiBTYWx0ZWRfX/42LbVUFc0CH
 gPL4+e7BEsqCCnBSwqCNFFDDDSTfwqFZ+SqSWZnhjX4OiHX594uz0/wGG2HfZne8yb01bmEWEbi
 G3koB9dgLAenJdrs5kC0dbTfk11JttjNAwmYyAWsYJqCgqfR1K60fkpFR/A//ZkJm6dF78iLIbm
 YX9qGaD69xFeZp0rr3oqHcSoDLC5dlLQTXKNM4XjdU9+4ZEXAL/TmNT2RweOtsuEppPrSCOQ1yz
 D3N5KMU/3gHCnW3kb5y1vnj3gwFCwknTSSTzAcfYPHfJNqi/VzadQ8aKAGqQPWcYYzqKdhYcwLV
 JYbesc7bKvfRVzrvGMwrxvaNrNBx1wDqVETsvWwTTLrRZpzC7qP+FUGDnk/h6ri7o1Z0QivqIlR
 3T9wnqtQckcTJbub6h6oD6bepsyCMXBVWy6mIyun3/HCwNENy2R9j+upZ+pvi+zhhi7gVZVXDZS
 VS/UnKc30chlhP2i7WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310036

On Thu, Oct 15, 2026 at 08:15:21PM -0700, Deepti Jaggi wrote:
> 
> 
> On 10/14/2026 7:37 PM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> > 
> > Group resource operations to improve abstraction and reduce the number of
> > SCMI requests.  Follow the SCMI-based resource management approach
> > demonstrated by Qualcomm at Linaro Connect 2024 [1].
> > 
> > [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi | 3232 +++++++++++++++++++
> >  1 file changed, 3232 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > new file mode 100644
> > index 000000000000..4c155cbc7975
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > @@ -0,0 +1,3232 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "lemans.dtsi"
> > +
> > +/delete-node/ &xbl_boot_mem;
> > +/delete-node/ &pil_adsp_mem;
> > +/delete-node/ &q6_adsp_dtb_mem;
> > +/delete-node/ &q6_gdsp0_dtb_mem;
> > +/delete-node/ &pil_gdsp0_mem;
> > +/delete-node/ &pil_gdsp1_mem;
> > +/delete-node/ &q6_gdsp1_dtb_mem;
> > +/delete-node/ &q6_cdsp0_dtb_mem;
> > +/delete-node/ &pil_cdsp0_mem;
> > +/delete-node/ &pil_gpu_mem;
> > +/delete-node/ &q6_cdsp1_dtb_mem;
> > +/delete-node/ &pil_cdsp1_mem;
> > +/delete-node/ &pil_cvp_mem;
> > +/delete-node/ &pil_video_mem;
> > +/delete-node/ &scmi_mem;
> > +/delete-node/ &firmware_reserved_mem;
> > +
> > +/ {
> > +	clocks {
> > +		bi_tcxo_div2: bi-tcxo-div2-clk {
> > +			compatible = "fixed-factor-clock";
> > +			clocks = <&xo_board_clk>;
> > +			clock-mult = <1>;
> > +			clock-div = <2>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		gpll0_board_clk: gpll0-board-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		sleep_clk: sleep-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		xo_board_clk: xo-board-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +&adreno_smmu {
> > +	power-domains = <&scmi15_pd 0>;
> > +};
> > +
> > +&cpufreq_hw {
> > +	clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
> > +	clock-names = "xo", "alternate";
> > +};
> > +
> > +&firmware {
> > +	scm {
> > +		memory-region = <&tz_ffi_mem>;
> > +	};
> > +
> > +	scmi0: scmi-0 {
> > +		compatible = "qcom,scmi-smc";
> > +		arm,smc-id = <0xc6008012>;
> > +		shmem = <&shmem0>;
> > +
> 
> As bootloader updates the irq, we can add a comment here.

Sure, like what we did on Nord.

Shawn
