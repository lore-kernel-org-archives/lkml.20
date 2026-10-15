Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4D51118B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059737; cv=none; b=Yvsv81rREwU61mdpWdVAP7lCGwEEhMvnv9a86yW3KPNXGsYa91CMSS3T174Ia1wTUE4yXxbGm5i9ccVKnSVEeR0iqjhTFrKaub0uqesEVDKI9zdKjTFmmqqLGNxiquT6d+NW3iqX9i/3D/f5s768Y7ScYbegtR9oPO+Pm6iuQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059737; c=relaxed/simple;
	bh=6MSznKxRApuG2ixvbDRUNzwOtA4rFjejFEE9H6ua5No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iStoxtXAVcNFCpOBkrC0F4PFZ2Jp7CtMYp0JBecYot3xaUeh0G/lCM1f9uwjQjxq5YrYT76PNCc1mXQc35Eu8YrBCsG73AGBz9lIe2RcHoXLeF2W1rfwejXcBMHSYBNp02Y0J9AVJWyCCQV4aI+TARpuC+P3YOtUlwlx7VqulrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzKH2kfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0O4lhRc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzKH2kfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0O4lhRc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jYYK2966401
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=; b=fzKH2kfbD4D2ODkP
	v+Gv9KSXLkrg7BU5fht1etcbhzl3sZ1RahV7tNY5ayu7toHL2/QSwcNUytXKE4Us
	gXjdmEuXoYZwgbNCfRPBKrQNm9D7ISlvum8n3m2NkGKPYe5oPiLAHMVbTjset6lK
	+PyiRhD2YtsYpbbbNdDUx1PaoDVoQFKrJZAwEK5hrQA36im9EbynPxxES/GHI85H
	vN7bOWtgrz/yoUswbYtMxBKR53hfAGI5qc3Aq1E+Xe7gMNAkRXOxqt4QjePKy0k4
	7Ykr41PMd73atPCook9wCIJhHN+2FG7RjheRYFVUTyORV0FBCXY3Hy2XtWN44i26
	cCUWuw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuhva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:22:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91795e52969so13107736d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059733; x=1792664533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=O0O4lhRcFRZ/1vZ4E3lcTUolgQx5t3Q0QMVy9BDC7DeYuByEFHae5snzYmN5eZGWbT
         /Rms08L3wEdglPq1T7cB0n98a7bzYDjntH4mHavijyIpLvvHDXH576A9p4l/zPFA4hym
         CDWq/8e2smb37VBhJQxuM4bbbvpi1N1TbMvBUBy5dcKFExCTwsxLuwfbhXQ+PmtniQPS
         lMFojTWJO0S8ZYeTgjSttZfa27nINOL06CoRcl49BVpQQ3D9sblUficEa6ldStZZdIip
         EvjgM8YkK+qDC5rEjtoJW0dPUlIkuHYzBqHGrL1qhvKtytfVixz5QHZ/TzWFYOtkgTV3
         jWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059733; x=1792664533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=fgJWYuDLAJG7xxJEpv0eHMHlJBS1UtgqtKHtME+WnjZw2208ew5eCNkAct46VVJx04
         Iz2MxmitvWdyEG6CyNFXFlAZ+h3h7KdQ+fPp79ZoLsC5UpsyZ5WMrPjHDSKeSX0KMPJb
         8spQVD6KYvFWEm88At9FoRNC6uEL+anB/H7LKGsSf2E4sBfufKG+ooSWERXVZ0dmton9
         UiFgVenXpbR7tpdLpeRrZ/5RgLAIj5zLJQq3m47Ca6//QzkX5CH6jLs+NtKXwdBcYR1A
         oqbPbYGSGC3AgbmrhfQGF2F6pO5kpBx4PFr4QGmRSkeEKFx4cIWVAQn61YRtxcQz3Z1m
         DXwg==
X-Forwarded-Encrypted: i=1; AKwUvBwD0HtHQVwAedsPcRLK2hId05r66Hx0gzWul/hB6kltuVBi6Qpv2rCGo8nNr3ORjdaY46qMPwXg5Mbt4E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg3cb6g9sIX4a+pcoRYRXWdIHPwvbMlLOyT6lT5r9YBTyGjyIg
	EZK3oivH4tKutC75Jsr0e0S7OC0YwxNmXf0G7UFP0C9ruzO8wxCfzDe12aQ0qyhve5bZTUixbfl
	yVQYwLj6fO4IOqTZ3NHmN5Kv0KIqafNyYfcmqhh/IGks45AEDY2zspH7Mh27F78qTd1E=
X-Gm-Gg: AYBFou1TVX5K0mIUwMQnjF1WGnkredy6Jnl9fw6UNlze85hxwIMv1WCH21d4ov82q0x
	VXvC/0z6gUEpsG0BrJLUgIwxkQilePF5A7oBwt7Uf1VPsBn4t5NSwcGhK+We9KKHUcBnP2SrxtY
	gPwcPeE+0keRiJgUoyw37zOeOFKbF/gGOL+WTfIF8+9j3X3I/zDIsG3Y2cXggOq/qqFHxnVPUwt
	zVQf3CKvqu/cBKu+VKZhjQlCdUTDeHUo7f0+j180jgln0g9JzMcm4raYrK7t671SGUN2eAgOvfF
	534VMTNDw90AKBjVGGTAT0P/OysF170TgnilKcbdMJhLxpKSfLNRwrRLUlSNldlEgiS9hnhSa+n
	pcmU1p+9EhmswRyUrZvTMug==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110395285a.2.1792059733301;
        Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110391385a.2.1792059732804;
        Thu, 15 Oct 2026 03:22:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm107592266b.10.2026.10.15.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:22:11 -0700 (PDT)
Message-ID: <456820f5-a5d5-4d7d-9cd2-5ebd67129b62@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX5qGN6cYLASii
 hlFpaImyoD5Exb8c13iNBVSIka0nUkD4CkmpuOsm2nJyEUd3Hxy0wux1n1XY/yjCUpJB4wZrqaF
 AvkZCReiMQkqe1uqOOcjzdwK5+8Yudc=
X-Proofpoint-ORIG-GUID: 95BprlWbmFkqYSzgXFosipWPHHaQzYr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXxL3lftAN5rnu
 wZHuXNnMFU2Y35vODJu3evPePGqtw6j/ZNLCWAMHvzxzCQBqfur1vzgUbGHDTkzTEdRjT+XFSMR
 pV/ERCynNQJtNV1FZlqvfkgakeEaMm36elueBjRndE2BBL5qApGvH8sUce23PsZ0XgGgwqKdbt+
 nW3mHZJxmmF+d5C9fWKMDKb7pqzPHqFNy/8/phL20yaQb8zGymrmE20UqpNPc0M0whSyiWuca9e
 WInKCIponuUDHRumczCy8MblSkdYVCh8L9fiIfVLPuNQY4d1Vrv7GXUyHi3EexfgSFMcjyShwgC
 yZRVbvImwlHukXk3G6RWXZXePNB5vLzd1j0YgH65rsGd8yA1PNCGn28N+ZbwOoePDTP9FbUiI0h
 B3L+PdY06yxjFeArUOXbbUD2JC9SC0CZ2Sf3B0+pjrkFFWSq2Pe+spFRazSr4KY4vg9x3jqlTx9
 t0Hn8oKuxXjlJhnBXeA==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a955 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 95BprlWbmFkqYSzgXFosipWPHHaQzYr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

again, with the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
