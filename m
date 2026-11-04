Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768020;
	b=WuUYGShghxXq9QKicaGc9TiPUPnFbxyUfwLwEUSoBceRAzHyQXypuOPbnD8G2w48Sxha
	 rPxV140G2IHt4yh1DoPwTNJgb7WxvwTdSk+8hJuMksyAQKDImfHxf3iF8S0toNBqZoKy8
	 nzzGl6pIVq5uHERY5FYexnqnzzqLNGYtSuzsdpikH5vXCqxQuktO+WLudYorRBG4WWYju
	 XPksgOhQOxrk7fCA6j+ZYa83V7DwGacLlD/tOmXC3FgG9mtwRBmUF8BKUP8KNyBzQ6ril
	 D2J5sHpcHXo8e/QGiS7cmz2Jlc7rq+dVIyi5fQq8OtJdofjBkl6BpZsMtAvjtBXUErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
	b=atKF9vRxEY81gXrF0wuiktOa7tOqTJ8cnALRny00lWnYjTb6QhChwtdcyj2XtG0uCiyQ
	 aghJKFa/sYvBOkbPPPyVePIIVponrGiWcuQcSdU47Gp9X5l74YVi5mlztiWU26XVtbRrP
	 rSLBlVajtfk7NxC0/S5yBTpn5Rbj8QdIhc60CW9jYfDgqCR9DsYdy/GQLFbre9L5BP6oq
	 3+bcnj+0O8X5O5IPaFq0PINFkANDX8yfRXzjA7VqPLLtYfefhXJp2luDW/HqT7KhYNtQ1
	 X1vuc9ydfsJCMPwpaarwpMwrrnSXQHDg/wmH+b4b8HGgdVi6CdBcX3aqSZV6U9rAAOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUf/+/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2NtVdeV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945DB606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945DB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUf/+/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2NtVdeV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43U4v43728789
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 04:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=; b=LtUf/+/jSxrUVpBM
	0QGauNHY8lMqgT4d3p1S1iK++TF1Dq28+WWlfD9aRf2IbyneUo81z4SlUu1Cdux/
	b/3SGzITBKoyFM0MwnB16i7Z3Uu8gvzvVlgT+G/hV4699SkptKNiq1lTHMpOaubd
	b33DE0fLlSToCvbB76etJJCcicgpC/nloN5IpI3XUs6xfhc2e63pD3RuVsKWVgRS
	N60H6HZGf7MhvWC8XZ/3450yDFnoGjGPxf9UGiA0LuN9ARK15J7lf/H2Dp0W4q3y
	R4WGM6Y/25CfT3dtii2aT8jlz+Ipbmbf6RW0YWiYoBpOHptH/e8y/1bseYqMk0AS
	vxwljw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbt6jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:53:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso357064eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768017; x=1794372817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
        b=F2NtVdeViO0idDqDnf6IwdnTkGSmFo51GUEZbBlkEYYFstLG31oENqinGNOqG8h2lg
         LtrDtY5InjV0x1iEIbsQVB8GbeJnCwt/++/rIA1UBmfJd0QaMOyc1L9PEs4VcC/ete5V
         qCjTO9TODomPLMVuHzpSYP41AU23D9i/ElSngzee3JBSlPa1DKmdNtyDn36h9HRltLHw
         lxFhdQBSHo5/qk54I1TcQH5/swErc1rCVj5zQQDd6nsiQJe/juEE6HugXCZHLgbFJZmj
         dNFbqBXgGmzii17mdawihVwqr+p6mSItxG03O1j/sLEN5j1P/fctwwRytXmOGxPPjwd3
         e4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768017; x=1794372817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
        b=HSczcVeTKUSVnP8Y8k9UrmDEu/fqvdvO1TYgNtNr+2gNGOAK4MSoa0BZ7ZVg8WyYsc
         8TokMievl0P+2Om5p0f6T8cSytApmmDw54rhaDRX2U7F/aRQFP8OZzc2M1Epa/6+fulA
         bNcdq5SQ5Qi6gJ4/qPbrLivm6oHuYWIexpT4d3jolMnuN+3tKY60hL/yIkvAj6VZmz4H
         yTuQ73lSQGs8UU7TD0eVSVTVC2SJC9uUACgke3mKT/6etR427+qtuLdKdiuq+R5sF23j
         gciIVi1xTvIQnesDZ2QHuUfS+bSoBKpcSlGOoRxlp5CLR1Yo7GyKrL91JOJKLnxs9qHF
         3AkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLb0dBL/r/dsKbJGaNsB0Io6JF7wd7Tv3WpfeUnZakoG31dfi3ZxRLJnesTH5tL6KC/RZPzEAa+ar/Hdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rN5SM6d8RZnnvjOkqddtdGi+RATUbI6P15PgKkl3IMwTu5Qyn
	5uCk2LeYl9VaExlG0GKXdDOOK3igIKV6XAVPbNQ8unHXiAy8doidhNXs4fOciVe2doVKq8DWjzR
	xIcW44o7JAyQi6YwolN6yZfGQjUzxsUiLnxBe5R+Kc0RR7+3lZeE6QVo8xaCJ6mFUTUc=
X-Gm-Gg: AYBFou1YTwb8EQDOLNyUyKe5u0omyKeDFJsPCj5UOhq6ozNs/W07ml7lfzCrfwHoCKV
	6vHTwwA7/Vx9zQJXYOcWxPWJBGAjAK1J363EhvD0vNexLotMH7erplLlNzyNwL0heyFE3UrMfJt
	F5S5r1TN+vXYB1ExR65mKRugEEGz2O4FO5hNakmKFMBAHqd34dVDqVWbd5OAoWaGhm1qYnYOEKT
	7fd86QAT7yJTJ4lnLOsFoU2dyqWkjfgfD0MUlKg4GY+AoQTa6WrXHS7dt8o1+gM0/vS+JUui/5A
	8jileQzoMoAGWo2DsbDz1tEQ6wjD2lwGkThbS3+/lGmpmfNtm1OnWpCPTeDBaW5Ph2K/P4M3MbC
	TWU0nM2ucIuoCfq+J71Dvjeh5ieZy+EkK42FedN8VEi9gbiciD3QrarWTGbcxEm3eAqXWQDBV12
	M=
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr20178585c88.8.1793768017258;
        Tue, 03 Nov 2026 20:53:37 -0800 (PST)
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr20178539c88.8.1793768016741;
        Tue, 03 Nov 2026 20:53:36 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm3737394c88.19.2026.11.03.20.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:53:36 -0800 (PST)
Message-ID: <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:23:30 +0530
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY
 common-phy providers
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
 <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O7r4b6ycLtkTPZy5XsESNZ1ju8SCbrwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX3Shi8tmcT17c
 bVd1vwttdcTvP2O5lrtGUwgh31jsHpWKNx390LnitLt7v9oULYD7Y0uxe1f1kyY97Xd4Zvwg3eD
 xQR9ejziEpMDVf7z3JJ/ked6lGTZeuJHgtZ5ajC1a1fod6AIGh0rFT9Hp4aycsyeDria4jW+x9q
 7OAXVEQRcF9LP+s41KG7sgflgwEQQOY17IddxP5Lddf6jvxhKm7smJVeuXwvyAzU9M4I3eE65y+
 +XKKg32H4GZ4tFEofTsUshMCbgmDPcJUeq2zPE9hyHtM4FiWIBwYD/t2MiblP92ngYe4kJIKMlf
 F0BzFGyTX4RtR3o9xxzft1E1GvKwZ33Beyhkuc9v6ty/CNBpAW4t+6oEuUZkKP8ljFFniK47+w/
 ipILEQHXeE6AFuNC7JIZluUVE2Anqv/uIuD3ecve9VUMdr3c1Vu1PGTTFt5wJjExfoWHGXgpoqB
 D5AmkCn0ICwoCT83Z8g==
X-Proofpoint-ORIG-GUID: O7r4b6ycLtkTPZy5XsESNZ1ju8SCbrwV
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaba52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LJKXChJILo_4taeNnY4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfXy207X89ljBIa
 JDKCj8amtSAwqU/7BKgbasHI4MnvVXYCEBGH/kU/CHwA41O08YKTZS9Cav8o+2IuQ/qNpgWPz/7
 Bm8wHTsEQo6lchogzMOOdvf3TxfPOEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040019



On 04-11-2026 03:40, Anusha Arun Nandi wrote:
> Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
> generic-PHY provider nodes (csiphy0..3) at their existing register
> addresses, each with its own OF graph (port@0 sensor-facing, port@1
> CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
> once a board wires a sensor through one of them. The camss node's own
> reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
> that don't use a provider still get the legacy binding.
> 
> The provider nodes are disabled by default; a board or camera overlay
> enables the one(s) it uses.
> 
> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1fdb72fa5518..2a30bf1c82af 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: phy@ac9c000 {
> +			compatible = "qcom,sa8775p-csi2-phy";
> +			reg = <0x0 0x0ac9c000 0x0 0x2000>;
...

> +		csiphy3: phy@aca2000 {
> +			compatible = "qcom,sa8775p-csi2-phy";

phy@ac9c000 through phy@aca2000 nodes precede the existing
isp@ac78000 node.
Sort CSIPHY nodes by unit-address numerically.

> +			reg = <0x0 0x0aca2000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
> +			clock-names = "core",
> +				      "timer";
> +
> +			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
> +		csiphy_opp_table: opp-table-csiphy {
> +			compatible = "operating-points-v2";
> +
> +			opp-300000000 {
> +				opp-hz = /bits/ 64 <300000000>;
> +			};
> +
> +			opp-400000000 {
> +				opp-hz = /bits/ 64 <400000000>;
> +			};
> +		};
> +
>  		camss: isp@ac78000 {
>  			compatible = "qcom,sa8775p-camss";
>  

-- 
Regards,
Nihal Kumar Gupta

