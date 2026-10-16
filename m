Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169823EBF35
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140735; cv=none; b=e1FHNkCLQ5p5CL6qeSdd3wa5/P22coaEWK/1OXhe55JcVcVljWz+9R2B5dhcntmQg8dXDVn2aGyOSfNx5YFJmrNFr0QmMb4Xz/ahlapoxIwZiH00J9tIEMipnPH3NYmFmXwS/kH9DBnsoq85SZ58/2lv8mrN7GN4ruL8UZs/0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140735; c=relaxed/simple;
	bh=eZAYfO6Bgoc8pdcaVpLYZ3DG/TIlTMPfimI0uGGQ+hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMSTCJz8SP717HIMOod0LayLe86nq5seYrkaa8hCrYh2NYNXOJ2u1ixMIpEoW01bQvtcr0QnMnr/wb3B/asaYtMfHVlfq5yUCn6VXmBrjo38LvoFlRCa0ogcjtEVgL3hrksYw/p75v4DXH/YBse0eRtWBdzZB5TIZeXCS2THd+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wexr2lCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj4x8NTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wexr2lCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kj4x8NTv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lJTt303528
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyfQ22USF0dFFocfHuyP1PTtOEi/TEhk8BiEWKXSpn8=; b=Wexr2lCpmBv/2Ari
	gpCkasRBypLCqu1usJyjOLO1gbKwINs++DTnvhG+SLjm/OIoSNRGCbKBgiu0VvH3
	UnJR1o06jTNv6t6x+rPUSQdtkSebbGhXd6Brew7ci/jOV82iaJugtOKKYmW89RsE
	gsFSlDLo16asBaj1/Jeumr6QZa3YTEoTsXGMvropfk/shwERgBjjwDBRLqQBBq8x
	8/VRpqhDxXf2/mtF3DptQ2ifwqw5CZr8iqBpgalMSuEtElWjrwYOW3uwjKOFqQAm
	HicDmyiXLaOhs4JufIJevO9M644hb7vTDIH1u6qc7xnHD5BFG60CJzLWFYlGDE0e
	KfSwpg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt911v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917ad3b42eeso15684346d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140732; x=1792745532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyfQ22USF0dFFocfHuyP1PTtOEi/TEhk8BiEWKXSpn8=;
        b=kj4x8NTvj0ZcI0t2BV3xHl02jk1fKFnmeJJCUjYKVBj0cdZbdBTmPUt/hobYhRuIsK
         NBlL9HDkF8Lu4TQTHg4Evq0HilDsoc9LNxzsQ/rVVUoEW3mRU4H9t5ogaGDpprCCJRQS
         lO4jX6znDcUP2mRZwNAGIIlr0fJhCbq1wrgPadHLpNyz7IFhU2jio+g5XJrNo/c4khzI
         RatidkHxX335MVsmikyePgeA9TLf+j8QbPUZccjVWj7FoVR+FDJN8VeM/fUVLkbGZQue
         NVKF1ztzsOykRZAWkG3jIulratdn1mEFV0Sccry8Vf6k8yof0Jzz6n3gFcIwcSF+qImI
         IarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140732; x=1792745532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyfQ22USF0dFFocfHuyP1PTtOEi/TEhk8BiEWKXSpn8=;
        b=fd3oNoAV5swtRRbI+0y28gcN2vY2CsB21wlharwVzQmk3Hh052WU/C4wwM4PRQKah0
         2H+q8VM3OjGHjnYWDrK6t6qbToUZ5aIosXuPnUvoq1iRfQc4rHxfx7Lrn6kdwiCi1SkB
         XTDl9r/2Ph+hmo27T7Ixd65AlGGcWf19aoM+XfNJOtl7lN5wxry1E3idMdClVDNZ2KDZ
         tuRdDy33OVPJA9OraqK5uYfpdBlrHgpWWf6GWU1zyDEahMb5Wn5fsHgbGhI2ErZa2Y5J
         cT67ZEydPMhzPY21p+Al3o/wvjkHKn4v7MoHg11LSNk6ktvgQJEXgzdKn0vxDxHdS4Ie
         LG1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzhxdkEn1wv/kGCeUhHglh57O4HjqwsM2wSyMwvcW7wPAc2GgU/1pvxKdz5Bo0/JiWQGAoo7GXuSryHZpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf6ptVRitEcSrWqCo4WWVhqns6V9wru62jecz2hUg0ydXNfCUJ
	UsL2UmyVDSAzFCAzV89ypUrFiSZ4KRECkpAKDguSa3pih9SCql8dL1GqyAYUkjHUm0tZhMnUkRj
	d+ZIz7KFo6/RtwkhL6h53xMhqGUjHBPflXm01bQrNdrOnc/p05w7Azmvo9twoHF1nPCI=
X-Gm-Gg: AYBFou02KKvEWN0Q5pF/AMrIfuwTZSRIZMOYrEqieW7piP5/JRytV3ZN82d+5R45xch
	6ppxqKJ/A3NOoT8M2ltNM161f2l18IPPd2ZmtALXm/JRe2W+HQy13og8HDe769X1qvF/vRKqVUT
	btTa8sdClYttmX+uumenLn5TQ8nbFEip9yiH+ugwYtuysm5xSiY+inKBKCJW58YCyQlbZzjepZM
	Yz/Bpeq4/9yd6/68yyCG295JLFRnzp8437gXxiujTLbvbgbhfTb0F8kphmos4fg+xjpU5apAnDK
	cvKQlObrG8oTnfuwK/l0YuwZuCmAukjqow8I0171vEmpL860NYIEY0UgNE+SStAWOp9cDO83pIb
	z7mBsQsfxhnrRja1bZo/aEg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4033804185a.4.1792140732049;
        Fri, 16 Oct 2026 01:52:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr4033802285a.4.1792140731646;
        Fri, 16 Oct 2026 01:52:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm51835466b.47.2026.10.16.01.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:52:10 -0700 (PDT)
Message-ID: <3c9b6695-f292-4bb8-a69d-9de253e36f80@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:52:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX57nORJamLcgy
 iJk+scBwFAcYWOX8B2R1GVHTx+LBwUt6hF/gGSfa3zHhhruBCuhwoH9T6+s8x/EjjT3qfhZiYCJ
 bNMKsbEnKefKMGBMAQqIBGm/5EDk59YFKVxU0bNmcY9cp9SpbnAEaFfZoG/41MJtBpkl4Ss8JeV
 FyxUG8Jm7AG96yc0Rc3XS+3YLynf5xKnziFrvIU6sfUrKiEN7pRsZzwfjJeGQCKN5VynM/fhSwR
 mA935xXshs9BaSehHbKWHAWPsrxVjeBtUAW+Y0xBiZ8hS12YpnwQoa4xg+oWsTJ3wyOXmhfOOcK
 FHBFZSdvWuuCrMDTr9eivKnXE7FC+h9OjD/mpgubDkkMakHtHkcVcMSWhMJHpIVxS+pwb7RKQEu
 VYdPPbonLPWRh1wB6HbAZSWwtyQwIp/LTneq9R4O6sPnRLP2aB27Hk1Ox8s99EH59c0xx7lh++K
 mJlWlh3zgfK03imyLAQ==
X-Proofpoint-ORIG-GUID: lxXXoL0BqThpJOL8oiQJICLCrmUzz94-
X-Proofpoint-GUID: lxXXoL0BqThpJOL8oiQJICLCrmUzz94-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX7qFOAFRFAWsc
 F1yGH7K2ReZufgIGV6Q2qprrcAs/JHAfWkdwZX8o6rR0N3lGtBpATbgrXSHSFtn/MkjFtWwWMps
 F3C7IZOXP1ZePih73XSKVfivok7GJZg=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e5bd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=hyE5VNBUgrKcPekntuAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035

On 10/16/26 7:39 AM, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.

[...]

> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible = "qcom,nord-soccp-pas";
> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			memory-region = <&soccp_mem>;
> +
> +			qcom,smem-states = <&smp2p_soccp_out 0>,
> +					   <&smp2p_soccp_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";

The SoCCP should be always enabled, especially given it's left on by
the bootloader.

[...]

> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;
> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +		};

This is somehow present yet not mentioned at all by the commit message

Konrad
