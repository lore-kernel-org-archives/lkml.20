Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076F37204E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373616; cv=none; b=GaCDzYqSF6AAmu/di9J0vubuvRki3V/JsuQNuVKQ+1a1mn5MzfybPtliNtehlrdCRN4NRQDJ7l1gkrZw1j62OUtULOYfPEGWaq7VjDN3tyzBpjYjPfX4BAU7u30rhZwFsYNmVZKi/hi2c33q/BBxQapjCTb9F1EdNjw5aAgNyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373616; c=relaxed/simple;
	bh=ry/PHtCb3fMC33PA6aeOge+X7oula6IdRsZRjpNEJ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVH5YWOECmpv8rVpUKZI3j1WYYCyxCkeGARVhRKe70z6f5vqLPtTeJMR4z0SeN9e+H+vO988ePnN0+11A8HPnjTwcDl1V29StfNGYOrVeZJgNj8N82vF7uD3rlAy7KkUPZE2gKRJWsOdPID6thW4OeJR9d9f0N90+5bZKKTmoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZnmSpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ik+klUca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZnmSpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ik+klUca"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2m8543393
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=; b=nJZnmSpSvtT4gSHS
	xm0c6XJ6eE1AmyI2cjT0LUjoiImQJZgXIJNmvUK28lECnEgv8xdNZ4TF+eeLLyb1
	3nj6nMWjyic+0+R74dM41nKTSwAQEn9o0uHWgP5V7vdrAcw6o/25brn/wh9qCOpd
	5la3Yy0A21zaWW4dVgobUo4/xVzrLpSx0C4/fkAh3CybB/NZnhIM/ZC2/j1uhgLQ
	eJ3nqC4NDLckKNvunwPEwAe7xQ9sxyMN46O1e2SVqioGCjksomGU1GeRkQ9eRr00
	NfD6ps3y/ifbl79PyUggx5KytbwsskQb66y8mQD4I2CSHG7eY4Y5zmNehcE/Q5Li
	uyM18w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09h38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:13:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f8e7ff71so32796085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373613; x=1789978413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=ik+klUcaUGnM6bUCU0B+UPB5h1Z3eNvhrFODpCY9eqsyeca1/N77WSIzBDgriIO0Qi
         L4rsu1ge9IyTzWP3Dw+s8Q1D2ppFJLLgxx+WXEuYpWx8TjX4Y7mWmsFULXAZXLr8toFo
         EWODpWu+wk4cTsId7ptohsOiqZQP6HaRSiD8ZiqaRnPyAElAJl9TJYv9rqcjyqWXy+v3
         s6TjF7Fj2JkPl+GkynStwDDD/UfEKrJRXgyych/cHsjNjo2FeuKlkvKA+FzeUArNndIc
         zViHg4LvntjUijYQz+EL2+9sEd4byftFWMZnygDGNtCKzrPtGfJt7PGz42TKItgkRWzh
         CC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373613; x=1789978413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=Ah7MoafIeqQaUB16fAopVge5Ayhenm7V7qrP3G7TTwinM18U5bVnx3ZznPNkEjak/5
         4GN06V6Vu3yuC/RRsrbze7PfIUk98ENYUjfZ2MKQ06ovo/OZmKB99JXP+LsX5ffcrX10
         nvOQqanhlzxmfVRgIWJBTZl8gaWi2U0Sul3ytbbwPxXLUnyBWYQTVqW4mb0c70iX/udK
         NqUwyyX6ABUzhdU770/zbz+4xIdjYyLJPkyQr4dqs1H2UJix6MOi+csahKKhn4K5uTyH
         slt+n/reMKJhu7syLvuMJtSQhhzXrnbeYErU4Rxwv3HWCG2/ty9mShpWeos7pzqYnu3e
         nyNQ==
X-Forwarded-Encrypted: i=1; AKwUvBymVjbyhSChWOnixvUZ64oNkykthk3lfjB9Qs2976sxnQHuFW/LxFd+/g0ER2oylbC0TW5EGw9QwQDYcKg=@vger.kernel.org
X-Gm-Message-State: AFuF++kfXVib/IeANtYbj6V1kq7uU4ZqS/AIty9UZPkbUqFeznXiw63c
	fMzqaGdqueFgCJlfafkECWiJKDk2bc3S9HAS656NH3WWXARVcTSWW/+XGI1kM3fXdI4vwqcXo7M
	pjhE2z1CIznAAq2RsIzoeTVE0TVIHlMR66BE6qvNA4rG+vu92zt1B1npNodRmJLA3n/0=
X-Gm-Gg: AYBFou0KTvq8icKTad6IoEsM/YEJcdlPFZWnsWiwBAt1N4fsjRHSc0OigXhcNY1xTBC
	Bf0O1NqHuVLwVXjVcRdusGlqMvmaNdoAB2UdptMkuE56OvJHLCIQc0d2mOr88tKQ8/iqydA14NM
	N749b9+U3yaVX1UlUG0PTF7vIdr1HWPWGYhdlGBhWQ6EGf9MfYFEkIlN0I3zvu4qm9XixGj0qJ1
	WNHNa5aNtNy9vDxrJP1H+wxEcV7//Xm1R1rTeh6sb1p2sCOd03m5s8Njiq9KBx45jW0vi+9tTc7
	E3mxjeWop0UVMP5S1DXinMvq7j7jKndVEEXpMeBoUXeGDogP3kZeF59yDa/HFmnSl+VEUZm8On+
	Am7MmZwfaO37+a1iVVaITfQ==
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175438485a.2.1789373613519;
        Mon, 14 Sep 2026 01:13:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175415285a.2.1789373608222;
        Mon, 14 Sep 2026 01:13:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm3661441a12.4.2026.09.14.01.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:13:27 -0700 (PDT)
Message-ID: <cbc69211-0b2e-43d2-b8d2-647a9cfd2f72@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfX7f834gHc37RM
 BnKyq1yaXGhadJ/TwUDfrVNkFpyL/BKfJmiiIk5Vnildp/o0jY3LBeGSxJW/iswOmK6WV4BUkbn
 BjiNMApGUNroxxoFHqtz+nvEYF9b/0E=
X-Proofpoint-GUID: 6W-huXXWArqr8GJnUImz06QQ4DIlSORL
X-Proofpoint-ORIG-GUID: 6W-huXXWArqr8GJnUImz06QQ4DIlSORL
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7acae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=2i8abOnZ9zkVdpuz0iAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfX2d7+R5UOCgBf
 mRAb+nM/iUcnxlrwMfs5XKY8lm5G16MiEudhREfKkkpfqxkwek2lojftQEgWr1RCuoexRfaEYje
 yvSMfF+yJWvq+JJofdcREE8wos9VVR9YAFjDqr4U914mFKoPgqFE6H8Ihs1C/Q3mC04sjOk0/GB
 IknyT9fLI6yEPfbgRSrknkEK+PjUakJHsdFOPzSypwUDMbELkPxkuHNHIK7/VChq+d3QwbkPLCW
 cmvYiBOAJjkca+tPH2tjAhyGHl89Rvay2vcbfaMPAYLSARUTc8Bkq4xqM2+JucyMOB8+vd91E23
 i49SeLvfPeR3fy/lzBg7C5bhTxGJajBnO6BdqrqXaT08m9CmgHZPJ6Q2trmldz402iKKaaG60ap
 W/Xh5QOnWW6pLOi3pOEherppq3Hyui+dOEVLoO0Wz0zJXd9OAAB8zyKkcCkOviTRE4k3K/L0dRf
 GIxQKlGcLq26tXVRfqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140115

On 9/13/26 10:18 PM, Srinivas Kandagatla wrote:
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.

[...]

> +	vreg_edp_3p3: regulator-edp-3p3 {

nit: please sort the regulator nodes based on their names

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +
> +	sound {

Stray double \n above

[...]

> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};

xxx

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* eUSB2 redriver for USB Type-A ports on the MultiPort controller */

nit: this comment seems self-explanatory

[...]

> +/* Internal eDP panel */

Likewise, it says so a couple lines below


[...]

> +&remoteproc_soccp {
> +	status = "okay";
> +};

This is always enabled

[...]


> +/* Two internal USB Type-A ports through the MultiPort host controller */

I think the right thing to describe here is what they connect to

lg otherwise

Konrad
