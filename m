Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5543B3E6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830687; cv=none; b=EWsV5kyXTEt2tlEgH7T7djahAp5JlvHCvr6HdUpKDMQyFQfVaEt/DRPBg7x2JgQXgahaziriIXIunAiQi4704jXbhnLscnAzm7urzsfanjfaP1t1NemDc2DidatHCmqMpVF1bqiE1/uX0vTBawzyu6q5/EDnfY2N6o+mqC4lBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830687; c=relaxed/simple;
	bh=DHfB6fF3Y9dl4O2MOokHQ847AmSCvn8npv2+J6NNIAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pff+0db000Qdyg3IOhdLKm5tq46B2U1Sl/WTC2NS/atTkdXHBx8aChcScr9Itpc9K0kFrGks+mHtQJVG4TOqUxKttaudySKdqQ1GKH9QlvqUxuqhD1WRVqj5qihRPy9AdGBS4fprIpStCBoXRRxP+08BQLeo034JMSNOcxbvv/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRPONmCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgbWslCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRPONmCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgbWslCl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RBEOGn3913435
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tafzctTQEvoGgo7QvUnxycO7
	XFdE9SlO42qbjkPBxKI=; b=XRPONmCpollYKHQFdleOUtCNA22Cu/jiFvQ/FZGg
	sgY3PAvS0rNi/rbBq10whMOIXF5Qx8juG8vnFR/2y6ZvQrClm46GzEFM+CiopIo1
	y9WwonPOTF9t/P9Lsde+N92FbkzWDd7VGEqX3msHx+NbNdtHOL/nk6J3iA5U87FJ
	ARMTm88n84pTjbxjh/aH0puQ3Qbw6xCwsiRzwp857Iz7BtPHpI6JkUXdKyhGoxeB
	LH+UO6xRgeZN0Cn2iJYNIWtXtrtP2NJMjxq/DFo54bVpc+bMG3CdlmLm+QMh5wJ/
	UbRcMHMlibt0PxADg3jVk4HoznmzWt+9glFvfdlG9ZGbqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fg2m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:38:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso30888921cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830684; x=1788435484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tafzctTQEvoGgo7QvUnxycO7XFdE9SlO42qbjkPBxKI=;
        b=YgbWslClXCijrDQHNTZj8GIPN5WCWyDZjH7/uMkZqr7EZOiGwGbtt82LujkO/pP3+V
         7PkKoqlfFFPF10y85MFBXA8NhqzReHW+3sQ666IA1ZD2sXggyhMIcGNdHLpZ/El03Gmn
         /uFOvOezY7Ank3HQ8aiLopI0tFZzvHeIrCVuSQbW4vPxj0PEaPVB4N3pR1oNpG5X+6PX
         0qs+CA8PWZYhjLmg91g1lBwQlvB6iQC6Yk778mbZBikfTFs4VNZck4+Oaf6xU8TBt5Cv
         tbYmBGUKwunQviKfT1FkHig3OnAL96oCfOGeP2ndQ2pS7vu6JyOi2Ei30mHDxFu1+4ix
         /UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830684; x=1788435484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tafzctTQEvoGgo7QvUnxycO7XFdE9SlO42qbjkPBxKI=;
        b=O6AGzBawU7ly7G8I9S3w4U9Mi6dp2EO0BzVMRF/Xzl8S3z/Wg2CltOQZDPXCluemOE
         OBL3miQ6hDry21OEWPMfZBY/FyiARS4mhRMmoBMhasQi96Ysx1VHtEowplSsD/q+kf0b
         wmIwi/NH1YJjVtcxCN+AxJxOtiy7zLqUjtdW2UOvL+Wr46/XHLR0DBO9Hp9QZgu2EHXW
         2c+w8ZYH/fSlVAzf1AuWb4fV7HM549T6PUtjxYQ/WjPGLcN4ZPLxzQmny3qG+OIJBBpN
         gFxXhoWjSLf8Rl+qM9cm6D9er6iCf/WfiEEdiN4DI8Li3zoXxCl5SWHzy3BjREThi0aU
         Pj1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQq2mdTH3qUS8Jo6CkFFi7BV0AEuMLrhRocROwVOHJ6LMEnxEkSZhoh65MF7JO/m11tRDRjTJS3Dctu4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kcdr1NGC8XH7xG804E7HGBSETF/nF12xTJHHziMig0sj1kWKXG
	IBO5IMZsv24uCF36JJeQu3xgbgaV6APsVtNqLg6AT1jKEAi/ycAkAILnQ4C16S/xVHXvedcs+cb
	3Kf98BNsymnZ+Uz18LGiCvGjr1nwL8TbdJNSCxuxQX4KwCa8suH8qLH5x0Oh2xCLQqx4=
X-Gm-Gg: AR+sD13Bpn28rNYbSzbKPE6e3syj9UmnHNcTY6fBa8tviwFU4WD4KXIS/yKQ1ceXXwd
	xyfsAtv/lnaAIQxGqFqwiQS6J+0iqQ8T/y4lotCSQZb9dut0HU/xIRfdstTVUQ/AJYu9RgQXPpb
	hZPavzu/Qnpkdt/DYfuGK/3EouMp22/6iEpq7CLXCzriioV3QHK6up+t4zhLA93EnvZnkadwXVy
	bs2BH/9d+BNDD5qdhLKWy5D3z2+iH8znIhRR7opGScwaPrLxBrCOwan6aPXQc5sOwYxtS+z7FWu
	6Eka/c38EyFyOwZzP7Ew/a0m8034uz7XL2mcxFxjefouhlV9BEODdByVEl292+7JkvYlVM21EI+
	EUyyv1CIf4ZgMlA==
X-Received: by 2002:a05:622a:8e0a:b0:52f:a0b3:bcb2 with SMTP id d75a77b69052e-52fa0b42525mr67264981cf.35.1787830683591;
        Thu, 27 Aug 2026 04:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8e0a:b0:52f:a0b3:bcb2 with SMTP id d75a77b69052e-52fa0b42525mr67264261cf.35.1787830683020;
        Thu, 27 Aug 2026 04:38:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm8781491f8f.6.2026.08.27.04.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:38:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:38:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Roman Linev <admin@mswin.me>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm6125: add TSENS and thermal zones
Message-ID: <e2dnaccszjptb3c77yqjzvvabn7bdfkf7uxnlaf5c5b3e64ze3@k7fn7kzjmjzx>
References: <20260821030325.1823829-1-admin@mswin.me>
 <20260821030325.1823829-3-admin@mswin.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821030325.1823829-3-admin@mswin.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX7WEz5T7b7InV
 mEajMmAytGHKaGbKPiXTB8wFl5q2NLctCcUbY8hU0THcpC735whyiAI+oM0yHhVm9S7YafiLxAD
 5WBDkY/3ulv+ORQcSmokUz0/z6LUQTs=
X-Proofpoint-GUID: vnwBrtqjwKqacUQG80tQQXwH05VZi3k0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX6LJwW6PTRrtK
 3wGazGB80qwmA141VmZo6KrivWVarnFI3AIcsVu+fpIDw3sRL/Tf4jqRMPjyZv6S4I3DkhhqQ00
 0mrKXcVqhlQ2YZ7d4lWFyyEUDv1tUr7RNu1eYgJVXuN2ZJbsquMCo6eOkbKybambzjv9j8vi6iW
 gM1gsg7buj+dbxKyoF/SHj1RzudeHbQZfJsj5F50Bdj4tRA7DARi1AkajfG2y6TfDH6X6X0QtFu
 mLWtXNO1QV0UDv1evUyTaXYEIF9wlWA53aGtZ99vjyrGtpCPdCvL6/vFbRebOosZ2VG6mwBXLHF
 i7aUQYZwsH/H3cFW/gPjQDF5Ew+7ym56JQQ0EvowUpV+v4492azGjGSo0PPbS9LeungVcwEAzWs
 JQxNqH8fmywe8RjGOgzFy6CXfv/eK+Z154buxIl+8veYPjUmyoAQ75B1z6lixSMJspvFldxEsOr
 zOsw5ZN0ukFHR9MTMWQ==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a90219c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BzUWo6mpdBTMTY7ZmLEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vnwBrtqjwKqacUQG80tQQXwH05VZi3k0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-21 06:03:25, Roman Linev wrote:
> SM6125 has a TSENS v2 controller with 16 sensors, at 0x04411000 (TM) and
> 0x04410000 (SROT), with SPI 275 as "uplow" and SPI 190 as "critical".
> The register and interrupt layout is identical to SM6115's, and being v2
> the block self-calibrates, so it needs no qfprom nvmem cells and no new
> driver code: it binds through the existing qcom,tsens-v2 fallback.
> 
> Add the controller and thermal zones for the 15 sensors that are used.
> The sensor-to-zone mapping comes from the downstream device tree for
> Xiaomi Mi A3 (laurel_sprout), cross-checked against mainline sm6115.dtsi,
> which agrees on sensors 2, 3, 4, 13, 14 and 15. Sensor 5 is not
> referenced downstream and is left out.
> 
> No cooling devices are wired up: SM6125 has no GPU node upstream yet, so
> there is nothing to reference. The zones report temperature and carry
> passive and critical trips; cooling maps can be added alongside the
> consumers when those land.
> 
> Tested on Xiaomi Mi A3 (sm6125): tsens0 binds at 4411000.thermal-sensor
> with no dmesg output, the thermal zone count goes from 5 to 20, and the
> 15 new die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
> glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius, well
> below its 85 degrees Celsius passive trip.
> 
> Both SM6125 boards still build with no new dtc warnings.
> 
> Signed-off-by: Roman Linev <admin@mswin.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
