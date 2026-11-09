Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219593;
	b=E7fXaWKquNJEaS9CU0bPHbbE8J6kQTLoGYJyAa9j6e3AsL3saY93vo1YSUFOx7+khb9q
	 J4Kb0FamQ9jaQjtT0Scmme/nSz2oaT7pnxdsvbnBSXGETlvrD2cBm10Y3p6rxOmD0g1T8
	 e1zWFfdDSa8jOOPB+QApDqAInNUBsi9iuxE6xJFHSMZkfT+pd7X486W8/U8jh5sXHEXN+
	 aEg8SEaLtUIdqB/bmnlAQfRdwbbRpVplodcdY3Bl2n1Hgf0FJSTpmQ70ZLKzEkWmRzNyV
	 V7DxS+5z9vps8aS2/mZW6SGj+cQrjG9Z4Qmu6ByRQ2mIsAta+75GMlm2ZGdJzmHt9uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
	b=HwsVmgS3XpGuvnPqgL/nmENDuEghLknhPephT8xURvnBadGY8t+ecbdpR6VmHYuirj9r
	 M/TB8DKbTQQ38+tQ1SIFpm74sW0hjqe6yaFNqWIsfhSh6nT36zRxvWdnOfPdZ+/zce/T6
	 cxxlV5BHV75dpd7YQGVnUhxLyeUVxuLBXBrTFfJjp0oa78kzmo5NHO33PpOOL7D29S6Ez
	 bxDSv1MC8r5EzEsbRWOY5NTcRQ1Ab0PUut69Lg4kqqipNI5ZQs4+xDCz6LavAARzFUt1l
	 bxFcsMJ9xwtapv2lay2SKMKMREPKYhCK70kF5lvgzhODVFogE6u5rEqPs6fzUdsPvnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lr3nq9bZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69543606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69543606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lb8IhuSf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lr3nq9bZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vETn4107917
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=; b=Lb8IhuSf2GJlUU39
	6/SxUsyX1AB986J1wjCqXviD6ihPbVZBOgiWdgTU5gEC4GpIdt/n0tbDKmadVgyC
	qLFjUGVRlcEEgawNthi3DI0lNwZzCa85V6TMRCn/kOrijcB06Iu0cDdVazgnAIBo
	4yxjCqyhYtgcIwHJZxARKc4lTojNE+PhqbGG6IIn/VXLzIc5vbVTlJCMVprgeOqM
	KSAWOGgLvFAfG3N1pMu4Dbv0kxydAp/iV+ZEmqHVa1K1nFvoJOnLOETK2bMV34YU
	Nf+0TRyl4XbJa32N2hjLr+HIoiy99C8q0R2kMnkHXrC+99S+FrPvZub2UzHPxmRR
	Ci40bQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx9dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso16394985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219591; x=1794824391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=Lr3nq9bZg94VEu9/z2Z3tDOXCJpu81ZnpHcNYn/XKI954MdnjBDMvlO5ub7xp9FOUM
         Q7ul39xYgXeKZi1X6Ah7l4Uraps93OZL2jbiY3wpprOAt9jbJo5P1Lcd0NUjagz24E9C
         jTyT3Q1FUL+MeazWC0B6luX+gLxDoy85BND5TdQQGyVdEvkyw5zbIdPhyRnpEEXBeo6t
         fZhTZ4+WrxiZtPjgLLLF+rb8lxTk4J49oBRT0TNs88e0f/KqewQ7CFJfHW0VZNC+73pA
         Leew7wQDniSeXsQd6D1hWptVNg5zU2D0r5UQTSpRW7pRFIUqE3f+RYdEo4uXsuqYOx97
         tnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219591; x=1794824391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqUT9ShqE141fGMH35+gRcVtxZeKmd2zqhiyjQqkbnA=;
        b=rCz2udwkFffSjhKPsSrdJJKOsHEnHT3j8CTJxk0azHwLn7kavbBJjRZUII0tAL7N3O
         DibXmyknrIEocXLDi5mPz3hvxXmx7zvVmdp+IEbl3yqxwVjqevAB5/MJJYXq5rcsYjei
         7nPqEd1k+SWsb1nDf/HFkLgE855Y0LYlZ/lmmhqxDXBMLCXMy4agGAPH8UMkN6NTGqOj
         ApYj4FvMIt2OxGtGMMlEsZ5yoAikPYR5HZ0Qxo/OaRnC8kySc5fufFsbjyVZ/54Sh+LQ
         CT26YuQbPH3fFqf48CbtWBJMC65Ck7885bMELJIW0sc78l6KvOhjKOMYDZUtDkjIEUbh
         OJGQ==
X-Forwarded-Encrypted: i=1; AL+hErFuiioj0UCRbO2e5s9DxQgAXutDgNBuVka2zX6D6qvxYEBIRDbOoiQ5aTBBoiUL4+rydUlCADQPxxFExEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TXO3hitLQBr36m7yLZ5rdPyrSyYjSVyz7erjbHJkLeqGkPG+U
	kDS+tXfUmv3njkjMHjdU3KdM26LnZU+KKcFx106LrnDfdeAEJsc8C/IvQsx5hpdwV17eBbvAUZ4
	x7jKS2xVcKOp+YJ1xJ7p/uXykpPzkcN0YLBhmbCzq1RuC3vEKBdUcaxye3f0g6fxzh5pmpHNp6I
	c=
X-Gm-Gg: AYBFou2YEwaQHOpP15K+FJ2ZZm+8VmRmKKJVy7VtNeWLX7BEVUaCnJaYrIK75pr+8yA
	Xugl6UhnU4z4ew0BNwJxjojHPohBc8JIIjhVxaO8u6XQW6ms4ZcJIUM2/SE7eubJ+c2VghxYVlb
	qwBeV7CzpOAwWS147+PUsCGmz47dU9SMXwBblMMC30J1Zl2ErzGMzmBu1ubOK6wq1hK8vJbUiCH
	dSWgGqjzGlH5ZMTmNhqgJHzaAf1Jp/l7jZs+OJst7KGBIUas0VZd372BcuOXVrakRAy2aJVkUEw
	Af6SYI/fYJ0IfY1wdkhURxbqvkS2jtJX+ouHj8VMv+GC/IO/creqwSATNfVkcgU+hSUWHCwQoVh
	7mqJc3TylozX9ja7GLMIfwI2rJOcIBgHIw+sDI2cMWtM+owSDqdU5rJ6HRIRv/wSKiEKnkQ==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510547785a.6.1794219590607;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr510545085a.6.1794219590095;
        Mon, 09 Nov 2026 02:19:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm146889866b.55.2026.11.09.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:19:49 -0800 (PST)
Message-ID: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:19:46 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pcv8RETHV686rbCPgldNrFH24WewFYYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX9FHaYBzy3xpw
 ZcGjmpdvOoHPrnXuQN+ASvTdGgIZFCRb4Cb2+HCsP8kh5F1dmb+NaRgTd/sFmMgwhH8aZ3NndSm
 ql9FGYh3yThWfHi21g9h+05XZLEbagGNAiGX5xBswtNA7Aq/L2KkiHgTCV/yyv63IMmKEkN5aJm
 FkR10IrJ241vjAvRALXt2qAUBdUxlTGuHNC75w3zv9zsfPjEiH/ZTFF8k1hHGzyubE+kiT6WmRD
 XBWGag00BHrNr5g/WLi2hM/4eaMeA33qLGEL+s+/Q/b9+YMq6yWuGmIbAjuaD0uSNUt6U7ahwCO
 AcrFyHtaA85Ogh8BzIqhmedpTxcrkRzTqugwOC+UPRHBFukRbddLzML5CbMMCcEiY20XeqY4udn
 RTTGKrv+GGKWfh1mjjo/UyCcM36tPzVSlSbVmuM9QU4KqOLx3C2fEPq8rpG1BVmO8Q2ieJ3rEgP
 +nrCAs7Yp74V2JF9iXg==
X-Proofpoint-ORIG-GUID: pcv8RETHV686rbCPgldNrFH24WewFYYz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX4M0/iqPpaRXJ
 mebx0rqYs+1Dvr93jb9pYloKJBFR9tIKrPKUjRYbUcGGTv0xcnBxqu4Al76pFEFuT/QNvCcGMgm
 53P8Vgx+JR6qwIZ2oLC6e/Qidpqq3uQ=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19e47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J3gOo0Kj3gncQIyMurkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

On 11/6/26 11:01 PM, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> GPIO 66, as on the Gen 6, but the firmware describes it as edge
> triggered, active low. Using a level trigger makes the handler fire
> continuously while the EC holds the line low, with no event pending.
> 
> This provides the EC hotkeys, LEDs and keyboard backlight.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  &lpass_vamacro {
>  	pinctrl-0 = <&dmic01_default>;
>  	pinctrl-names = "default";
> @@ -987,6 +1005,12 @@ &tlmm {
>  			       <44 4>,  /* TPM */
>  			       <139 1>; /* TZ trigger */
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: please keep these sorted by pin #

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
