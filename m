Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C73DA7D9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395015; cv=none; b=tVMvjZqAPiGBQSRdJPBNg3/Sk+xtwhc9kkgBzmx7mxRWiMVbQQNb5Br5Qod3SbQrUBRaeWRIuaGmWWOeFnAVDpojSuNJq68WAEVnTXFQtP3PdKSCs5DXvfMD1FdLwBgwNJmAmUk1q6QrNgV5aj9DablPi0be11jL0xUT+Dto3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395015; c=relaxed/simple;
	bh=G3NamduHy9LjRWPDnNrXLCYeu2wlpG74gsLOfOvCg6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM9aY3LyqYrd5zMJ8IdFuWuHA/ZGtnarhQ1yHwcek/YoijSIjdXhAL8fBDmr9pZI/HN0u3G/3vwxE66FeeNziGaQo4jlW+5v6YVxao8iSJjW/ighmRyNPburyO+TEH5TBxFQLqIfTAPNb95xtYht39f73gZ4qKoRmMXOMWJd26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZqk5gYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TafEGr62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZqk5gYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TafEGr62"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0LnW1514342
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=; b=SZqk5gYk539fJVBk
	0iuYGl6Hah0hZ3CVAwTO9KhYpoX49iXXrnMm2wW4iT6NPO6iSMCyNyNsjzuVjHjn
	j4W/NA3LG5eZ7TFWuwasSDC+azfxjsvGPn9K5g1Z3nYPwjq6pKWT5atnNfuUf0vp
	zeBwSZI456Yohbi/a1wGm3Qg8UobzGXthbzxBfvenoyM/5uyP88wjVtnqN7OMFsH
	j9WpXyQYgBR+DN73f1V12vnHYbchsyWElwV6CLCd5G8RtxbDZnfxnMq6wkEMIgyn
	wQef/Crp4VsRXJoXRVMHy5yLJTJqfnAgFgQYzu29V8nDePW22+bgkOsc3BzQZWdT
	bvV8jQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0avxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so63214e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395009; x=1789999809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=TafEGr62lFhkUO7o2mANMLPP1KCUcRCWKbHmpgRDaXPx/q89SePv7xJRjDj1JOviQA
         KsWRnYCXXwf460xB/yyGcHBB4m4mrzsAszqBwjXu5HFFmpytCs2qKpnhxMgWfcMwVw9O
         +Hc2h6Rw9KnyjfTvnMMVXGeBdZDRLAxBbI+DGkzHrvgsuC9EujAo0KBvJWE12zVaDdx0
         4A9VvtzoEGaEiBb7e37UVUvK6nyNAfknAu3tv2/AeRKB3GG+84AJ+ZpDwZiex7R+tbrp
         RaPMC8O+FXH7UUHPeO206LU2S3cQRk+utg5qX9Ti0YGSfQoFR1w9o2NWcyd8AzqJAUGd
         zbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395009; x=1789999809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=jyNAIWUOulLDOHFYHPSK3OyhKUE2vfLBOzCOYbL6HBzZGdjYZi/o7DEhktIJ7qxXca
         VHq6XlHwvTPVwmhUgm22eKDmkZP7jZMQuISg0cXr7yWB4fXxdHPJ5py0PDA5euMtkSdQ
         OqmA0VhuHJeXdreAFKOPfwmpmnxiONV5pKQMG/oO86PWbD7B0GXJzV5N1vz8rRNEhzBD
         X6GwPD3nB0fjxt3E+fgIf0grTOrZgi4MUnjPw8vqhoOZDkPSF7wytYFhPJBPbleS77/P
         FQaIn56sFe2A2ThmPlNAO3wbdgUryOgihsp/Pvz3UvTLvFTq8QuSK1ztHCu3D8R9cIzg
         cVUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC8DD8IMWT9v86H/1N6qpyN3UIIHR/rA0GsgeSF88ndLhRUgLXEmIgqvzl4hG1zH2M8BJ/cYFG29czquI=@vger.kernel.org
X-Gm-Message-State: AFuF++mii4OjXd8Vh9JLMqAs5xDl1RuzoteK8pPxGPK8uuA132/nHfvR
	YiKMfGBCnUTygeFPpteBf9uKwv8Ik6h/vx3DLd1Dxp5kzKTh1jjOCC8vOGpVF2EVihEeo7ifF5j
	w6HEjsDXakYPw3CV7wIAVdG3kZInzJQC4K2rJCHWoPmty5KNYb9Eh8shIo5Ce/bTqcQg=
X-Gm-Gg: AYBFou3PVTjXgNBZ4RjlBoCLCUvZweCtCMDjUW2cL2ZKlMV/EeaIywKNTAjkBxMSv7t
	/VzU2cN2mjGRP+7b8XHNLb99+slp1GOhQTNDRQRglMJY2thq9KTLGR4DqZAMsGwSuYReg0KZe6b
	1UgoNdQZNHuzrlEE+/Qiu9n2ylI9rcRAeFuvTEEkWcW14EYKGd766/sIO1m0s2sziZG0tPTitFk
	VhfPgL7gfItIHSEIsNxhJs46CPHvPkYpJEVkTkPq1s5urx0v7ipZaiIMJrlylb1vMaggBNC1Aat
	oVSs5ZAgNQXF897UtWEEfypGWmxS+4BnEUUB1Mtf/s/KwH4gb/T2z4qizaytONA83dlqk3pkF9a
	8OIlPLSzHfwiXNyw0ueQvcQ==
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550784e0c.0.1789395009350;
        Mon, 14 Sep 2026 07:10:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550685e0c.0.1789395008214;
        Mon, 14 Sep 2026 07:10:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5960c17sm4318072a12.27.2026.09.14.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:10:06 -0700 (PDT)
Message-ID: <1e303381-9f3f-481d-bd4b-9424942b5932@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 16:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes
 for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX6zdQnbtAd7P8
 ynGCeCkjhn4Km4QkkC2PJyVtPL6u0KxmlbU+imkwIjNKf+M34HwEZ+zX8iUMGytvNuZPYM1SQZ7
 J1Pu1JP7+t2OPNoOBPTbGLypxDNWgTU=
X-Proofpoint-GUID: hubz6UR31h-wOu6q5YzyCpi7-7_5Ak4A
X-Proofpoint-ORIG-GUID: hubz6UR31h-wOu6q5YzyCpi7-7_5Ak4A
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa80042 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TmAJPP8FuOU3jFEyuIoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX3exxINVWgoWM
 HnWR1G75fkGbAbBkwF2Yg/uSZgUa75C6yn09XocFYVI8MPlei7TtMVvzr721TwhIldPAXBSfQFj
 Vc5BLXc7fOO16EFxFSH3wGYxo+oFSOyRoP3jThiGlqxQTJtGtLB3a6uilS4bpXg1He0hLpQYKG8
 uj1Nr3aTQeDWgV0Y4abG1qDQ/UX8rIEOb0TxrCVBqrPFr+b+fOyTjrXMtZd0hIW7Fx2pqpFYyiq
 Z86828QmAR311VJ2CpwrbV/01E8tsbMhCyFWBuEx3NMgJ96ikNnBgV+6NTd489RJwlePMWVntKJ
 AN9sPkGeSUT98FeGseWX/L3Djca+qhEksM/CNtDk6EuiOl675D+buXe9RK1UaRf7E7wvU4BVkH3
 wQw/uIcehFsGm97KN4GYaTkg14+EfALMCrOZTzgH5ClgsoveEQ5pZgZ0rixDGyLf9IhQ8jQCiv/
 Wy5/rYVps5V0l8PMXOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140203

On 9/7/26 12:07 PM, Nihal Kumar Gupta wrote:
> Glymur shares the same IP as X1E80100, with three CSIPHYs that use
> the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
> on Glymur.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
> +	csiphy_mxa_opp_table: opp-table-mxa {

Nodes without a unit address should be sorted alphabetically

[...]

> +		camss: isp@acb6000 {

This needs to be sorted based on the address (it currently seems
sorted, but is off by a zero)

[...]

> +		csiphy0: phy@ace4000 {
> +			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
> +			reg = <0x0 0x0ace4000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;

nit: please move operating-points-v2 to before status

otherwise

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
