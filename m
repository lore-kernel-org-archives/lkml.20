Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691893C1F43
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371994; cv=none; b=chVp0DMWYMHQpHQ/4i1B/KbpAEP2zII624dvHUEaQN9RdUlThPJJrat9STX8kPl3jNL9A2qmDRaDMeH7ZUGeoXtSwF0zSTfzgkzarKOUUwpDf4XdW+W8WBimboSQGeXsC9h/rIJVSIppSVZDqKrdFPAgITQhVrGg7h7IWiHAAZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371994; c=relaxed/simple;
	bh=ce1O4pelLhDjVlJPpZ7LGe76uCma3HUAKQ1dHmclyB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU9dlgppuD54C9AaN0RyX1x20iUsQPMsILqarCLly42LW7sWcWrYUSYGvzKdRhJMQIP5cGSaqhMLelsWM8B2C2V4xzjF/veq7dGeOtt/h+jNzvz1bVXS+ShqSDIujiGbwS6uYh5PP5mc0V/BzZbybTkBj/OEF8FoS0XHRFMubP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkZTQ6Ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmKCcAXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkZTQ6Ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmKCcAXl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSWo237682
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtkXZcX3eCc2fMQ+ziqCcCeR
	Nzu7i+LM1BaMpHPINhM=; b=HkZTQ6Ko2WMUAGjXUdpjHw8socpUkrDnHVs0xogo
	6MY+t/IrFe4XbsEV0jLD9pu+XHII+jn4cMgC/9Zvda6awrPTU/+PYRfPt7CjF8ZJ
	2RmwJ0a6RD59cOZjRynA21GiCmmk+kpt/PGDBMZr6s7Yz0tvvu+xOTJ215yE41a8
	eD6zgTHhx5DLnXI+iQPBMI+un/nvJMfjDd8SJz8MwMOzwHLobQ7+d651EvKYrd5C
	N7HpJqoGK8vS1t6934paMx9spwtQXFA4SUVJLSLOKynxtEKjtGYV6acs3hdH5zUk
	0AGb7bN4JG8XjKrEqm7MohKxjhmBPKWX7gFWKf3dizNsHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnm6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso487149085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371991; x=1789976791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=OmKCcAXlaUcJGoxALA45jxqmbCP6vkSQpkJy5xRUhOxTwNKNxl0I68QBustVs3qG6M
         rRxPn/tmtuZs8AJltI6azaTvx7r0cE2u9Yi2N8ic+rBjmthFXDeMO++ztm+3oL/5bIpU
         D19i8L55BlYcq78mbN3UErGrjJC8VbLtUPFxoQTNJ6kuy4wzPco+8i5gtLuOa4RmmUz/
         f7TC2+tF77aCSlqOZvBlUp1j8iFtgTu2odDsGXdvYVY8edGtAlsNwqYqixD+7kf8R11X
         hkCA4JLRGLpyvDPZZ7+hrXRCQARamuH38gB1eeei+eQKgGdM6f3R/rkgR3H2by9B4g2u
         EYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371991; x=1789976791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtkXZcX3eCc2fMQ+ziqCcCeRNzu7i+LM1BaMpHPINhM=;
        b=UeTT9/cKfNgGH3DEbVvg59VUtLrzM+SuAN8OOu22KbcrYzyuhEJnExa0vP11CXjRDz
         E2oj0Gk7J+m+RkPKeN/PQ3JNw0BmkFf2dN8SgaupUnCSECOAhIr3uvxHkyHDYDPVdEU9
         I4u6j7/gVxKn59pMTlj913RgBK6o/n6OmIS2PPepCnS1d9VIbynGtekY2/NI/lUj8pNH
         8vYpcwSP0eUsr+iIlT7NfzRaPiHRVQ+bAl62Z4ze6Ay4QivD22nE5kxpwzDcl1zC3UA3
         WXHT1eKKYyIgnPHBX7yrfWDilBg301jJGGt4aj8QKpQAUQ4brA4ogw02/e7HB05Iu1TM
         8gHg==
X-Forwarded-Encrypted: i=1; AKwUvBw3QvaVlL8N1zfRSTOfWZTpaAMybOepDEj+tP6xVFHI+M4mPM8gt82z666MnGT8UcYMcUTbD16NadxaC0M=@vger.kernel.org
X-Gm-Message-State: AFuF++nfujGvgzzlu41JUJUwtxPV5xQeuQUv3XpRfldREeBjFA8M9HVM
	pwAxJk2SORwUPDv/KPYiDGjbN4zNiLcAX1Dduw2jF3KnCe5GUpEID0ybeQqfNZ2TpmBkAIERzZZ
	fA9j5qAXxBErgBppjrRMRxeAppPgGrAx4r5A0KLyH1JMy8OWTu+Au5tHmDr+WnwQdwzY=
X-Gm-Gg: AYBFou3+NcqZ6hTUNASFfhLqLF87sXOzEchNjltTXQegMCwkuXA0Y6qYCXsEcNFQkPE
	t1bCYkVZzBdZYJWpo+hpWE2MQ43O9TpghjIOTKYbF81IH8Rkvhlg3UUNHfgYIB/9HHoC1kJuEEd
	RSSlS1JdrfwF4n8pVlDwRB56I4p4qRsx7Uxh8QzkoDSGzlfpCXGCr4knhD6KeKQgYz/2HfqeK46
	R4F2C/ZAiJuHna/X3l+t+bHgWzjJbV0t8DeWaQwrpWfgpAbeRkGL7yKx57y94OK8oBSAi3O4/23
	qckv5qVEbhjrfhdODtdxAbQe8Tfm1MpqVeblYXazeadONN3B/crNsl7n8uEjCQp0MK1RKoxKWZv
	hoFlBGR85/JZRfBo=
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202239985a.14.1789371991329;
        Mon, 14 Sep 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:c898:ce3f with SMTP id af79cd13be357-93a297e8f80mr202236985a.14.1789371990860;
        Mon, 14 Sep 2026 00:46:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25587273f8f.32.2026.09.14.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:29 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] interconnect: qcom: Make important drivers default
Message-ID: <npsrkq442luhxv3sfwjoojzfnnv4y4knsplnfucgdwj6df6uar@gjmbzv7yyldv>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-1-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-GUID: i4zM72VcixVsPNi89W6Yg0VI4hPWvopN
X-Proofpoint-ORIG-GUID: i4zM72VcixVsPNi89W6Yg0VI4hPWvopN
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a658 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nOPaym-2Fu4dxh1hCxsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX7e//b1TCjNzN
 rcUNKFhz2PRxnN7CJwpFrenfmbZR+xKx9/Nl0wVY8nowSKd2FImP8fM0osF3c8OEiKOAgUuX11S
 uaWm7lxDFNxkH+mDnGceK+EYfcaQr0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfXxSehYc4Ahrsc
 x6Nbqg32YxLPbE00ul2aYYbTlW5QZR7o4QeGcvezlAQbPqp7OX5tcPEK8kAMkhlkC5k9u8CoXa9
 ZxaPLGfSdhSARqkJJ1T+uyfNTxdy2qIXKxOZwmbZY4P1yN2o9mnQBdoF9Fn86+cMQ/HvKTzRZeD
 xaNMlmc7gFVguZQUJZcZGfnGgUIJopB9NnQr5+W0150K9y+915gsoZimSYQ6QnqkVZY8LzEIFzJ
 iPR/szeDpZoYUA2P31in4BgiID1V+K08Y4wZen9UcggrMPNVP4u6NJ5GH2RogUzJzBT8KP6oOZF
 6u49P7ckRsNYJjSCQ/FyllWL00UMfDTC17ROtO/T0CjUbFa6CxnCMHJgzNassk7Wdj1/Ao/RU/b
 VyXmy9dXcKo90b8wNKeXOD+MPGsFZfH7t1T49uotpQbtbmRZDrXLC6Urlvycas6BNNnjhX2BQID
 QsPaG24XZtfkpSb8Aaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109

On 26-09-14 08:44:04, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all almost Qualcomm interconnect drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig:
>    a. Enable as built-in INTERCONNECT_QCOM_HAWI, INTERCONNECT_QCOM_NORD,
>       INTERCONNECT_QCOM_SHIKRA, INTERCONNECT_QCOM_SDM660,
>       INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
>       INTERCONNECT_QCOM_SAR2130P, which were not selected before but
>       should be, because these platforms need them anyway for proper
>       functioning.
> 
>    b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
>       INTERCONNECT_QCOM_MSM8916, which as modules would not make the
>       platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
>       which when module might slow down boot considerably by having
>       caches running at slow speed.
> 
> 2. arm qcom_defconfig: Switch to built-in from a module
>    INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
>    INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
>    INTERCONNECT_QCOM_SDX55, which as modules would not make the
>    platform bootable in most cases.
> 
> 3. arm multi_v7 defconfig: Enable drivers necessary to boot
>    ARM 32-bit platforms, which are already enabled on qcom_defconfig:
> 
>    a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
>    b. Enable as modules (other dependencies prevent from built-in)
>       INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
>       INTERCONNECT_QCOM_SDX55.
> 
> 4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
