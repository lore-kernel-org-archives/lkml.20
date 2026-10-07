Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43348E0C4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372989; cv=none; b=u7Dlm9DT6kQhqwMrrL0EDpm9NVhEZVK1xlOjZoJwofb4/0dGD1+h2lk/oLy7freK+qHB/zE9o2txHdp+F5TebWlKyloC5xmLw1T6HDVosl1sbkLt3PC+yZNupy6W1qSx88BAL2TkMCmCyIXiqWLdOsdk4FwqKreLceL7VRJ7m94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372989; c=relaxed/simple;
	bh=WhMNysDAsjdB0e0GzptBue1GMJM2+L+NOeOJLaCa4cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzPmLrlsxjLuHqHwPtKqUcjvm+ZTLG1vRUvLb4SZSfC9QlgdAvbw052ys7erZR/2+E0ytn4vSZ1ejKIVMxc2geOMSuH7emvaK2Y8sUdERma4HgU+tMbp0OvpoLpv/fKo9BalKz0dKXJd0iaLDhumq/2BKehQeebkvp/jlnyzN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fqe920Mo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVWa/ebe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fqe920Mo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVWa/ebe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVFSt3786851
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwMGznIBtX6JOyPsmXPb4KjWaatKQQ2Lg+WeL8PpwXY=; b=Fqe920MoUb00VojP
	VxM7Zr9DtCCPA+MLKhmyBzW1bET0goGGUG+BSz0SCGa9dPUtnKLhEE/AX5/8m1tS
	S/8jlVyUslhkzIctWeOFmwB7Qvp/nhcZ5XsIURt3SPEi9k7BayJ8YcBwfqtYagOO
	enleDw5jOlxChb1okef7cCNUD6B5dmFiPSO61r1HCvXkjusgfAERKk1BI0hZOzDl
	Z+zr3DukhTK0rygpS8+z4iyUOkZ7e7o509lSyAMzYbwZjYixtBOJ4WAu8eg2shD0
	L8ecDSJ0jcmo6oM47s9ftcM3t221of1VOSc1JImhfNrCHRdsgaFERcvdSn82pM5W
	v71Jqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrupt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:35:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5254254a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372957; x=1791977757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwMGznIBtX6JOyPsmXPb4KjWaatKQQ2Lg+WeL8PpwXY=;
        b=jVWa/ebe7lF/kqMMitkSzabh2+SVDkYU8I5vjl4uqRcwQ6IJUGiJuyVzQfy/HX474g
         YBJRxvFVV6ny/EmUMWIyugkSjCrAiYMeWmElDaW+Khb94n/6Qyg/2h3mTUmP4IZ1/9cx
         kbdpLWLU4127AgQGBWhO5Z6jEgKv/w4aSpCcCxO8nCwHbWO4L0BbzHaQZoOsubMXVDPY
         xJIlpFVt3KERkx1Veck5PE8vVthxhWtWAbAy5faNMRdNusq3VIETd9Fz4v7KFQQek+ny
         kFmYiqEXn3hPyaJp5zA0aUBmyTBHkQUurK4J32iHefKjkO+/FZfzO9uLO/vSIgzjOuXH
         NDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372957; x=1791977757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwMGznIBtX6JOyPsmXPb4KjWaatKQQ2Lg+WeL8PpwXY=;
        b=QIBQYW1V2DsQ2JfEYbDHq4Wmek6bVgLgjE93Ss3R8VdG5/AGPBavMs9FIr0RCCRnLB
         V13Ydm7sB4a2MxSez6cnuuWGUBlUBmzNFG8JDsX+YV5w1edpsYlzd80mqKEwPcX+QiCa
         o8FcTE0UwnAX4RqF/N0NagkWYK0+zkGghfxq8Q7MTITfwSg9KIC/VtfLb9ZLzKV7p35Q
         uCV30hD/RyjQSz1okZrjeZWG5I+ik36Lsq/efkCursgRNFMZv9xIdh4ZmFbiUE6TQOev
         ugnr0hRmoPUbU/IfVbEiDvK8ydNe4f97o/pa58kED/PRyjDLcQugwasHMa69y+ucq0Xs
         W2Sw==
X-Forwarded-Encrypted: i=1; AKwUvBw/bTunQHFUj3pim0JuRbtrTnUvCMGKQijmlGKEuhQWhvvk13nq9HLtO2+wgyXXG+/LOBFcWbXWDvMe9fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmrNxjlwK4GKlPb/nTgAUG6qUiamKhKTIfvSQJwbPtD1PHPLjg
	tWpB+dP1wxR8d07CxgQnL/exhkSlrymgvX2HF9k05ygIyXo4SFUTkFm0OCC67k2ZRKS4Zg7/syB
	D4O/PX8hSYdx/rbUUFG7gn9cwfu2mhYIBnptSpt91zcwNMpz0nq+O/KtRDFAB3d/RRBE=
X-Gm-Gg: AYBFou1B07Klo2K/mJAuzNWS1jYlsw+kEng3QaDZU4ufrhzwluwuALhC8ejwosy4YjK
	ENLX+9Bo/jbatLmHIE3TSirrc9sFXmOCxir6gNkq4j/CpiSGp60GDQc/cajCCqn4i7ZZ4Qe4i89
	Yl3PbOUFoq7DuEdtktQgLD9NGny0nJ1U9me5rljkiuBP/xIlrJG74u8pCBYiOuO/Dcxv23Jutii
	rpYbQbDo3GsEjU2y2cZy4RoG0lJczdIP2b6lP6WrxpkGeyXPFgnomGmKHC882/vsEDbRQPrPPR/
	XWN9GxDCGNA8akB2TbKX6b3HP/WWsPOezKCs2Jcc2AfFOi9ScURbuy510/8WrwlgVvnaCsaBQmz
	3uPpaFJVOUUiCsVGG3ctDy6XkKieCswV78gpJ+wdlbQpbo/wAvi/vlFKnYem2vWiFw7QGLVAOVO
	VWyy2qt+RM2PxbQ29Lew==
X-Received: by 2002:a17:90b:5746:b0:3a4:b2e7:f01e with SMTP id 98e67ed59e1d1-3a8a1188428mr1499307a91.52.1791372957109;
        Wed, 07 Oct 2026 04:35:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:3a4:b2e7:f01e with SMTP id 98e67ed59e1d1-3a8a1188428mr1499263a91.52.1791372956413;
        Wed, 07 Oct 2026 04:35:56 -0700 (PDT)
Received: from [10.79.116.227] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm9675364a91.0.2026.10.07.04.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:35:55 -0700 (PDT)
Message-ID: <c5f4e404-c03c-43ae-9785-7be1d8b25fe4@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:05:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
 <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
 <297690cb-64d8-4e7d-9d97-66680f6a2b99@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <297690cb-64d8-4e7d-9d97-66680f6a2b99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DVQxVt2BTBe-5X_sd_TYbxbgZU5qaTWy
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac62e9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=1LCiuseMYk0cAX_2M9wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXxQ9WbUJ0iJZU
 4q0+TewtTA7feHfj2KmeU+h6LEhlrvzBALf5aZTDrh6mlZ5FzjjhE+idbOFUgV5/ouo2ZOvqf2d
 DFkLXX8wKIne4aF3VyTybF3+Hq6Qrzk=
X-Proofpoint-ORIG-GUID: DVQxVt2BTBe-5X_sd_TYbxbgZU5qaTWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXwj2f8JiFUOwa
 R7D7j+lfVA2Re+yfAmz39f9xHu0W12Gi/h07X3e4SflbLHOGgR1slNhIgcE78XVabotO3pBDREN
 MSUrQZJBUZ3vfLEEi//p00+yK4rm4Wk5cSzC0TPA7VO/65Q5p8xle2yOIVMMlCZl/pyix7veU3A
 UgmOtF/HI2dq5d1rJgckMaN7YXe0812kfs7d5m+HEleSQ8msb2yI9yyslUxsLxL1zcTtXSDFzES
 +nbs31HAmvYYc1dbdUrZNPOn1NL14aa3OJs4KUyxeTExGZwFswuUse/UFKXmqQyur/1Q3LCdWCV
 38hBHfU2yArjgyPFXG+JirHYRs8aWCaHLooAee2uoCcRSIhnFrqJ/nhhMSvnTKFri7bHhZ8ozi8
 60ctshESKUWqC2+qZTzJVfapbS4UGdEvQaKmVJKVMCZwNGyN1CQB42tOmrSDVAUlnrpy7I246V+
 0Ypqeq/KpCGO8xmNQnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

On 10/7/2026 4:30 PM, Pradeep Pragallapati wrote:
> 
> 
> On 10/7/2026 1:13 PM, Dmitry Baryshkov wrote:
>> On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
>>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 122 insertions(+), 3 deletions(-)
>>>
>>> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>  		};
>>>  
>>> +		ufs_mem_phy: phy@1d80000 {
>>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>>> +
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>> +				 /* UFS and PCIE4 share the same clkref */
>>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>>> +
>>> +			clock-names = "ref",
>>> +				      "ref_aux",
>>> +				      "qref";
>>> +
>>> +			resets = <&ufs_mem_hc 0>;
>>> +			reset-names = "ufsphy";
>>
>> power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
>> GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?
>>
>> If there are none, it should be reflected in the DT bindings, together
>> with the explanation in the commit message.
>>
> Yes, Glymur SoC does not support UFS PHY GDSC. Sure, i will update the DT-bindings accordingly and include the explanation in the commit of next patch series.

The support exists? I can see the gdsc in gcc-glymur.c
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/clk/qcom/gcc-glymur.c#L7768


> 
>>> +
>>> +			#clock-cells = <1>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			status = "disabled";
>>> +		};
>>> +
>>
> 
> 

