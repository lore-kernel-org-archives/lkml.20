Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58914502D59
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897260; cv=none; b=LYrklBIMzjfh+aLMp4d4YipS5nF8Fc/dr0ET809wyCN9sP0+pag9OsRuJk/pAi0YCyGPJh/7rdG8pEamWaAd85D65w9KS06f+769iQwPW0C4abg5hqaKcCTVOIXeQ+sVZOHh6GQjzGnPaRz6aBZrToh6ug9IReFoPxCUmmR0G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897260; c=relaxed/simple;
	bh=08vq62vZAx40BjAf9+sA9gEuAv4BeAsI56bsFH54Ntk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIzsm88oec4E7HtDl0o6RdK/jum6DZpvBvASfgzwiiHJP2CxwpLPo8Z3N4ecHW10/AWK7GN1NbWHGnZpIXYBbTIijXXWiGQ78Qk1UzvJxXgcYtVzbjoIQoWwg9PHGf0F35AHRffYrwuxAp5QkPrtOyPeMDtiMxJfEM7mJnZJVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNuU3hhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpmNPw33; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNuU3hhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpmNPw33"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8IQkG922903
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=; b=TNuU3hhZmmJpKghC
	LaSJdcVsc6tE1zauGs6S9+JtYmOHsv6bveY2jwSzgLxjWXVuFTmUtA0CUbjSy87y
	Jk1XlPElx81YQ9J5wh/76N7pEc7KgxUl8sqkFcwPsAXOfnZsBUvi3HGz0WZtDz9P
	PnRWGlalMWofiSkT+i68cKJc8Y0Rt0+LTGETpsNi/a70AlnoQKx7JnoEz7e1lXgv
	RLsaa2Z8F9YNvIQ776gR7Q4ZEF6WstODPykhfV6K8YbdBHrdfYJB/vfqhojaamfA
	jxreU2QKKcnTYdC6besAtR0HMLk04nNwmP7C3LtMlma7nCrrE2nI60SfZr+WufbV
	pqfl5A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u3fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:14:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-675b7770f79so3156765d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897257; x=1792502057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=CpmNPw33yf1N4O4c8ezMMEKN+r0yjkbusSbTEQ5FpGlBcbu3KoRTI1n9ANaiOysfnY
         JiL9IUQlKLOOyz9gZGZfi+ZsJkeSpTnoQ6KVLRtSEpxYCm6Q8KAoP1CPYi62HyMVofuA
         I7GOvaloXgmoPMKUH4U2YSVah52qPeWPV1Ew472b1sJ5/iMAx0ZGKK9y9p1CRU3qA1p6
         s4FTrXcRw1LZzSFIBxEpu3zRYKxUEUyqQ6vePFi6gL1tqKfYZYVKXRn5RTesXCrwKO21
         hOe2k7U/vGqel4ivnWjCPhmAfn3TnFBoM1v/EV5EV7RT0WS4ZBEhKT5uYmw9kcWJ2Wnm
         7MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897257; x=1792502057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=wCs3Q9cHe7uLRztmdvR72KkncpAK34luM0i6ShVvg1x6KkpxSOy/JCwNTxIJ4iZ6Fi
         U+0DI13P9rsQM0xaKmj3p/PxNAJlX+xi7eIP+kwUEmZ0QOD0GpKz4D6Gul6Atw7SXp4s
         U9oa3EwzAYgZG45xj1qtY0mFMapU27i1TPbpWU7MwF74IhqWPCACDv9sh4hi7439m7fh
         kOXeRZ6j6S386/WEyHzsXxsdBCGAWWz4N+VEAnmEm3a35Qw+cQQ29wtcstic5eybgvXE
         xcwRU08P2H+czIGnMYIAB6hQ0YerVWudr9/CQesD7GaXjBtRm0gWmTNb0QOht5U8B2ud
         /5Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwZwRA41MscW3azMSS8eRelw4uCnk+NlEQfN99eyjgFNvYOu20GKGxpI3/+QGPdt9ttnGLsEKU3O5mR8C8=@vger.kernel.org
X-Gm-Message-State: AFq9FYICVpSRdp4UvTiyOx88J+2zHS8zpX2tk4rdVJs8QJH5O9eHk4X9
	UwgkeOspC2hXQAUFsgwkoiRg92v5A5Q+qz21SrzyWazJfv0BK/mByZsjHRoP72KpZeaakoDIT6+
	815R34MOOgqu5p7ByPPRUPL+uakhLK+nO0GdIlGama+kkFvrOLAFgwcX1AtV9NFhrkWY=
X-Gm-Gg: AYBFou1NA4LsL3jKfOVZvdvm40J/9n2H53x8IONPQuLHFB243m03javbn45m3KImMNx
	oYT8iFUrZILEiCNUNZ7KbTMszA5sMYyF6EUXgH/owgFJjPso7UrT/WCpkGdqteCLf+ZjQE6YU9u
	+cQNDxdKqUgftrSHtXp3Wmnyrn/IcAeP/uF365VricbWbG7hF57+sFddJa9TRJVxprw3/URU+TM
	cC/NJeax/YKPtOPekxTgtbGfqMOWyLg/FiLfcsHL/Z4f7kdfUzY7hnXfJGXmGAMZ3PG/kc89MdV
	Fc7F6tcz8P+IjYH4YodPfHBqx+VX8qTeIAwfT+RukKGfcJkQdMd7KbuJQNj1ZbSA3DTaWxdm2Qe
	UTXqpj1XKOhomBLWoVNkAGP8nXWOg7nw3CpcmySxxo1Y=
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046136d50.18.1791897257424;
        Tue, 13 Oct 2026 06:14:17 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046129d50.18.1791897256984;
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ae586sm4715275d50.15.2026.10.13.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Message-ID: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:44:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace2eaa cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qsMvIBxTQZfwbozelBgA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: Ou1t-16CbuqCkX9Izbi7XvPmhRo3sy4n
X-Proofpoint-ORIG-GUID: Ou1t-16CbuqCkX9Izbi7XvPmhRo3sy4n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXzFDo90h02y/J
 /77Ff3sorkycYhl8skNvJL5AAfLm5LzCh/t02vaHhCwSwlbjkPGFbEuWWFBxvIiwYLWEgOsi6/p
 bPlUefiAD5tTnwoCk1WU2yeyVX31IfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX/bC9SzAYhknF
 KC3IILypq4eBweARRuK4oxH03z+GN55Dlf0pMwcPhbqZ18b7ig5YXF+uGXMPiv0ZTQyTGcj5w5g
 FtywWo1IJgjPrkCPqW4whkg/51sV3wt/xQEIbLznArWeMC+hmrhMbpqkdyMpc+PELgNodNKAhfH
 Y2BH0mh5DUXbs1EL+Byl/HeOfwuNcVsFWBFTIVpS/GlzzerIJbGTNiTMgLieYAFAYcq5J2OVbk5
 YBGOXB0AlPIEkFR7S2q/UQcu22JLnuK04qW0rbFLPU3vawOBx2FeMTaDocMXEjOX6uB3y/u/39U
 tTI2B8MBqTwXP4rAEP1qJL34utAoAiantpFTn/AC/W8W5JwHTcD7sUGGr/I+Y5aD/73XKBes3T2
 6tSyhoA2IbUyrILGVki1naYc7+YNwAbP0l8yK24Z4ruhtdCBTSrQ5j+blUtHjc5GfIHKppcV+xy
 stVRlAD8V+UTF19X2zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
>
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>   2 files changed, 211 insertions(+), 64 deletions(-)

[...]

> +
> +&qpic_bam {
> +	status = "okay";
> +};

NAND is the only consumer of this BAM. Should we move it to NAND DTS?

