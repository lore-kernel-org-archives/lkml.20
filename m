Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810521;
	b=zxQtvGE+YD+A0AckeDggTjNBJ6d8iw5ii9B6rxv5e6v/GDNxRcirsodOL8tvDXwQeXPX
	 2A0CnY2BAzWPfIsl+jXcKJGW+Idf6I6rT9PPsouPy9Hnlkac5IBknDNCYuuwSkrXvL477
	 lsYa/RjzcSEdzjcqKiyM61Of4w3RXSLspW39S0XS++Yi/B1iHR8XkUe5ELSbHtqk4PWUx
	 uCauieojIIoI8S9R81R+PVJ5ixKdeOxgoRo1cuMYmRwdLQtGHv+ENKbVYLR2iVzGJ1ilY
	 yMkfMLY4VRAhi+g+8Ec+GjW/uP288wWyCJsRNwpTP1Om3wy1p4y0hq654jnXTKjEcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
	b=Gaf9ZXTOM1YZumVjNq3tfIA3PrX/OGxFC6GR/MBM9pyBdnOufYdCJ+qBlEehm1R5NjDS
	 gT9115rGLG5kFl208sjR/fS3OBWasJXf2SahJ2v3Y2hVZfBIdJHJjF+kfJ52G5UqAf9ol
	 H/RG8jquLzxODhDlp3rXI0C6/Dng0rNAt5sbIPfeFCfI/QSk0LxUAD40jCzcZt0DVn5/C
	 a5RS011bTv0CxLaqJujmDQxNAqJ66heMmCYfyn284gjV4nIhbvhYiO+sy5BkXjdhLOJiY
	 tUmO6JRtMg+uYRp6SB7gc1RFxYbqnrv/VraS0HFex6F+k3VUNw2s+CLIOKY7909CSZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hohA/HTT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccTo1gVD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A71606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hohA/HTT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccTo1gVD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Los0592738
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=; b=hohA/HTT/gEVRy8O
	yiBC1lblRlVc9X0hGjmSTrDD8E15JMqfl9sgNhBkwrTtHpwJPoooTUVMdAQL00qk
	ITc4ejlRtZpSvfo62xwmXXCR00fikXna53E/DIPgxrKPC0sbys6cmt5kwfKH2YDu
	3f1wZROjcbkbdzV5fWpiH2fvynSrexO3ypmBlMGrNA7cEP+idAMt5vzXIK6eKads
	duFBXOwiZG3tQXZHPMaCi7LEJWH5TKrvxnQfa7QkAnG4TF2+oJqc6w97QgXZROWd
	BgfGC8x+K1d0rrjs9zXDjpNcpYQ9WZJi58m2GORPS1Kg02fWhbMSEHiYBfefu/Uw
	19veoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjw680-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso3583037a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794810518; x=1795415318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=ccTo1gVDWS3NgigkkOHySTCfYxHbid4pZkYZ7QYg/xbuV6DLTAxD0JzdgLtgjDoA6Z
         JinZgz3fTcPgz3WuvE8yob6m55Njdl2Sk6+avk/D/Rv1vSKhrIJHLl8vvTVuAKzqlxGN
         92Vi81n9dhPEF0xHnSzEMayqxCxuByNDpXyTM5/KnawSKWkGO8W0psfYlouE5Bp1VkdT
         qW9CxB7aUZlNmx9HMFg9CWB/u9/zXRHr51O2L1huerLpTbGy4mZ3Ykng2BXTbB94nnf6
         t37oMivIvF+yRnn/ThUT0FV6iWqPjhHo8mTcC4H4fGrG3M4VjhJ2YlqfTb21pWx98X92
         qCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810518; x=1795415318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y38/cgs0IXFwvCCxp54d00JDAtVXdn4TENZYiDeVtV4=;
        b=AhLjWoPxH0YdNcUZho5Ns/pMlh8jfR7elpQcAbdGxRwX5ej87uESiu6OqWYYdUF7Q4
         stmYRfyLYCqhmri2fSjhU9CRSqzR0YXbgOEoGTtliXClGRLa57tLL6051NjhI2a32ZLB
         yG5Sq7+d5d4ZP4K+rv4g3jdODCxmzLHnTB5ILHph05KpZjvWVixwgvwVsqPxy5ka8FrZ
         vZQTqt96QyjilSasR9QbbkTQjxUTQ9R4xg+HFLvQL2f3tHpkLnkf+59blM4e1jB//Rk0
         2bELBw8OFj3IFFikSFWZwkDEUc4orr6y1TbEGQAom/wjVXJZKAFM2PAInPBPTZUO4mLw
         wv9A==
X-Forwarded-Encrypted: i=1; AL+hErHVcI2UhIdzyssX9Kd1qerr5zbdvixZ64trz29BI6F7DGvMNx4mAC2cxCfBI8fknWVDYcrCxhoizTfZfgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99nu9XgZunYd+lSS4skZX1RbgdWoY+Xu0tGfbJYe9CDMlTk4Se
	OEt3w+WvThHMu4HPEbAYACJGg0hfbRhxJrwpJqnZaF3gUnjeZVH6XfLPwRHlokpPkHAZZhqVhd/
	DTqltTjlZervdSi2754COwKMCfIF2dqP1X/SskTw0UyXtDEiJvw+zzfJLq3oHx4lWbbQ=
X-Gm-Gg: AYBFou25359c1eEQJmb73t6N0TTBSOio2IgJ3vZue+CQGayBCwgoHVA1ECxR80kVoIx
	uR/1R1bYprzWc/ufups7GD9UKxqyFykL/7lFhkQC1Ir1cihubNIll+MSHUfpJfek6RDf0lKNK0s
	+ghVW7wYNMmZILsyyfd2XfQZwgVUwJlY9rPLpcsA306FiPy4Ho9FKQ2M9EeMvFyCrzI9DBjxkJ8
	XWUuIp88++8w2TliHpOHlYGdWjj7uiwPDQlG5v6wfs0MM1QF5Lm/7tlRoBPujOnTqSf2T6McmC1
	lesNbCQNj+B6CXm/mXzrt4zL+aODU7KN9YmMkU3JTRJbkfUPjXWlUvVcwkQi+MJO3dQqmHNzYGM
	DI7h0LPynHtZCsRg2LmnRZinLjIo9VrBSvSmnvT+k3qilS0EZ18W8Ay450YL0JedvrMfIwx/9pX
	S5D8Y=
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773251637.13.1794810518583;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6a21:4847:b0:3f9:c909:ff6c with SMTP id adf61e73a8af0-3f9c90a14ffmr3773237637.13.1794810518081;
        Sun, 15 Nov 2026 22:28:38 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm3370713b3a.6.2026.11.15.22.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:28:37 -0800 (PST)
Message-ID: <5355782d-8ea7-412f-9b90-886ad995633e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:58:32 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto Engine
 for SDHC
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX/jt2Sds30q5+
 vqNF93ZnUozjxygP/3x2w90iE7a+YOXIPU2dwOYQ7uyiukBD49kcrnfFhmnbEIdHAv7YoZUso/Z
 fRiFYEDNLdaKWDFFig5zMjFLhGPKFtPMgTzEzfn0ollfhWe1Lb8wV1AaUgXtUlCJ02UEkYWUFtV
 NBSpTABir6jsZrflvk+fxZEJjFEXx7MpdRRoEoh2YVZ/Vee7xbll+YbJTt0mjMCoyjkroBmcm5S
 vnqRtXB++io6jqUYnG+XSJgxir0dPiQSHtDKLkIRABNx+yqpn9IpNOB+aEMAH+m9vWx/V9VbdkA
 ai+/1X6+gNAN36iQc+LfSU3cQNFpxwTAV1g8eA1gH87koB16lQeLLNgS9NsuWBtX0GNPw0HXoWN
 /b5vVgW0tWaietaxF9VGU0SdsebcZV8J697j+2Rt10gg6Rp/LAlfjT6LQSYt1DefrbZaRoeebHC
 /376Sw/5SJ0mMpBOtFA==
X-Proofpoint-ORIG-GUID: 1-QwM5_A9v0XRhUD1Vx4QU2lH5mQhjn3
X-Proofpoint-GUID: 1-QwM5_A9v0XRhUD1Vx4QU2lH5mQhjn3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNSBTYWx0ZWRfX2Pyfy071aFcc
 n0kP8beXqLQvBU2RW+Mc06c8zNfZuOcWDkChbkhsOdU28pg1eQ87rWUEHE3OnUqIrma/DelahzF
 JU7ThH9S/i/TiaOtB07M2vz4EgdoTAc=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afaa297 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGBdCwITC7C827Q3XjIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160025

On 09-11-2026 14:29, Abhinaba Rakshit wrote:
> Add an ICE node to LeMans SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> This patchseries enables Inline Crypto Engine for LeMans platform
> for SDHC storage.
> 
> Testing:
> * dtbs_check.
> * Validated on LeMans-evk with custom Mezzanine board for SDHC support.
> 
> Dependencies
> ============
> 
> [1] Enable ICE clock scaling
>     https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1fdb72fa5518446ba2ea582e8362e86bba75c379..dfd41b613523fb85eb122488e0562447f7228e61 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config = <0x0007642c>;
>  			qcom,ddr-config = <0x80040868>;
>  
> +			qcom,ice = <&sdhc_ice>;
> +
>  			status = "disabled";
>  
>  			sdhc_opp_table: opp-table {
> @@ -4348,6 +4350,33 @@ opp-384000000 {
>  			};
>  		};
>  
> +		sdhc_ice: crypto@87c8000 {
> +			compatible = "qcom,sa8775p-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x087c8000 0x0 0x18000>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&rpmhpd SA8775P_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

Can we follow same pattern(sdhc_ice_opp_table) as following in other
patches in dependent series?
https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-4-09271f583dc6@oss.qualcomm.com/

-- 
Regards
Kuldeep

