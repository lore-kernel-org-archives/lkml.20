Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730B3D47BD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373242; cv=none; b=tos4DWZ8BbO0KdBA/jW6WAIs+uIyLQJSO/JEhSmQo/lzUZMl6qO6JyduuUUoBAtZ8EKbJ+00A/8JFXjwvHwsiwI2zhoBHoDqrNA4e2Ctb3YHNHgoXlyu9x7HGVywV2KssCvmXoIxdL1aMToLxnp1fm0b44VJjZq6jdcaESPSZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373242; c=relaxed/simple;
	bh=nkLPdIerbmqgOkiClXOYtAKohjRk+Y3ovsmMqzd3zDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arvD92EcOTa2KIhTplaX7+y8Ioxj4BvfrQkQDnAx3ouz9IMze71R4zZCNPBiNNwPYwoU3x9KwYX0R0Y8OEOTM463GMqGgTxYYOGOhxd9PQVJHl5nO3Y1sDnSX0T6RwiYXPwPEZ4iIgRmSQvDhpOB4kv4ISx6lQk/Of698VXq/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMcmnHyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy6EncTe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMcmnHyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy6EncTe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVM4R641552
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWsxroNby4qfMF5eUhWMwzBrpIDo9NyJ5QpYk6O3kDg=; b=pMcmnHyoA5U6lGin
	jgOvmzefdWqpj6lQe/3mFnQUciKpNppaaejO4+CQ0VZJgFTE2xqenoJStvujMCoB
	JRka/M3AgeV8PrDf9eE9fI7ao2Wt6t0m4jwrxaevg8mRujCCU7G1kq7a78VAYkJH
	CzSZgj637rI6UDQ5TTAonkdQGJf2zD5G8KvlmB8EASeoqD1oYjkWfTBHALEtMCiA
	4hJcaql0ksOrslHsodQTFVk9n7Y8P1aP+p7pN5wMFsX3ovbKmcjokuvk0a7IKzOG
	L0fLnQGVqOa0HkR8CRYU2jfmG2gCud+JDxtbC+Tpe7LnaklZNJiGdqxUP4u2OV7V
	LruWIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719v13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:40:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso669156a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373214; x=1791978014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWsxroNby4qfMF5eUhWMwzBrpIDo9NyJ5QpYk6O3kDg=;
        b=dy6EncTedFbvAboVgy1JhE1W/1RefAYyOplGaQt9qSFKf6YGspg55GivWvuewqglXN
         HgjLnhMbKTwuG2grPdcEDP+GHz8HbnP7+7zVht8rYByIqXj0zF59GaBXcCiem85qoScT
         O5oApKOtQfidYMD1JQ5aGb+2GpyFnJoP7ZJ0l48QsvPWrsL+IAgsuWKiKKrUMOufXjjc
         pclRwtPDlOVAuZm3k6h18IMDLxISRa00WjR3dEtF5aXzDk1z745k6C/cgRL2HSwVImq3
         RsQAwXerYAKSOI9muhHHr8WiJ3wb+rg+vyonD6KJPONcOkVvxLKKLe9rRxwMG79PB7AI
         MZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373214; x=1791978014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWsxroNby4qfMF5eUhWMwzBrpIDo9NyJ5QpYk6O3kDg=;
        b=yZkJqM8GdOxMI2J1qcDcHzMlrwGj3et//4AvgcrK2RfIW1IRPMYUZbkHw+BLijhSy1
         0atMRrQPcJy9XVgw+HMqEkvLgnhGQRM0T33jZWd+bzviCFV2mhcDCxdbiKwDLuNcCrlk
         sMUYieLWYKVK9GHnJ5JY75liURNO1p+//CVvbTDVb+lY+2m1U0T1vT04H0DKH7xiNW2v
         wsBegvvxXyJp0yx/xByOLLhfnmSd2xMfB6EKCUAD/A0bNV82uix1X/vcQGnSBfXkR5kR
         5uZ9zbGqUDuuz2BZOC3Qs67vgxkOGxMQKOuQnU57ClZtB3yczydgjf8/SuM6TsW/upX5
         FQdA==
X-Forwarded-Encrypted: i=1; AKwUvBzaF4c8hcHvwPeAKfZpPzmZDAK5xWcP+eWygSlRZOzNW/VNZIjSiG56XnsvGtcc77nnmMlDfBh8vvjs6vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtE1Qt5pXn4XO3KiHkJ9nWYH1cQhsMjaXMrOQm7oR8mCfAjTEX
	7KdphIyZBsO/B5IJUEC5IwGT8QWvkLw1l3Mvb+5wnzMAHB0pUUKsynDd8+Mc3v1TW5bh46Gq9dr
	4LcUekRncJKp9lWQ587dflPmChF8dMet3CfXmMIbl7RsmLpZM1WVEJ5BspubXDRtSju8=
X-Gm-Gg: AYBFou2a82cztIKxVP2IivU6wN60qnz6q7KOb5M73QFBJ5BCQdcKI9TLv21bVslReXI
	UQyO9UtJa/z11G4OWiSlMzUHkU8v42LS8BuLaT/Jg3GoDj6g4BiMe5Yyo0XgiQbZNAOJUhcAgRw
	heX5rQz7BZnRDc9qV55v243xOvINBzg5RE376LJ0S5UeI3bH0m1rVkvTQkayMTULG2zgAzUhkVK
	SAUYFowGyOprMt7rh5zc6ZymKk3PBliQ5sc2VE16cPpOoSpKhydkG1TWVjj5T0uzYxbBe4MNfIU
	Fl6Ok1DZ4RNcM3iIi2/agvWg0S4ni272WE/QIFJYirNqAlhUKJGHtyn3CteBgBUfwRY1XmrcT80
	S67NuGdDcgiBJzkibMG748hftW0IIiyS2PjvZLw==
X-Received: by 2002:a17:90b:3c85:b0:3a4:c8d2:6c0f with SMTP id 98e67ed59e1d1-3a8a1187ecamr1280975a91.45.1791373213832;
        Wed, 07 Oct 2026 04:40:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:3a4:c8d2:6c0f with SMTP id 98e67ed59e1d1-3a8a1187ecamr1280953a91.45.1791373213360;
        Wed, 07 Oct 2026 04:40:13 -0700 (PDT)
Received: from [10.218.41.37] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533abe0asm9816087a91.1.2026.10.07.04.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:40:12 -0700 (PDT)
Message-ID: <88225357-eefd-4d44-81ba-da965b4790f6@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:10:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
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
 <c5f4e404-c03c-43ae-9785-7be1d8b25fe4@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <c5f4e404-c03c-43ae-9785-7be1d8b25fe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXy9LEFIUsld1G
 eIZrIW+DLSL0/ZTm+CZiWD3Un+GH6TkfercRcMTwJKnkZBNj0k3n3uA6LaVJZWHNlaXhMjo3+tQ
 446vwPXKMWK13vsEK1nmPtdMpMXBknk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX01mnSQpI1LM9
 zRftWJcNPvxrEDo5ojdH3q2hqYT5GruDEAqWnHuOPi7ZVjZGG9gpkH4iBIQ8mU7P2sQkIjazDJh
 3LgIWpkaAs43Z5LopqZG2eGiluefHuOB3lB8xEeF32vWzpdHd7Epvic8M4uJs95i/mU/ZTMDAWC
 qjQn5qu83kq6m+JIoTLkEAyR2+rrj/AS7ycOvGLAXgabCfNrHcwYlnXcQN8W34O/Mv6JYm9AOSu
 C78XFJhdbvAMzbcFtecjtwvpDJ5IivV13blX+cIqdLHGKmoGmAPfxlduu92M/yHAOhQHDINlhHK
 XZvp+r0o3Uq17f2iLv77zb78U3HeFO6pylBB9GygS6fmHvo9Wm4zxV/+u7DX59SIeCB3Yk5HZ2Y
 BGVQoTWuPQQzGTXIRDnLm8L/Aj+WCnJrIbOq+h0T4JrQgYya7oC7vqW74jhFT3GnjCgu2w3tc9L
 Ldlf+szzgCMj4EsEXGQ==
X-Proofpoint-GUID: oeYn1p89xS75o-yMXiOrXNzsxLqASS8Z
X-Proofpoint-ORIG-GUID: oeYn1p89xS75o-yMXiOrXNzsxLqASS8Z
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac62f9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=gawzJeqBqYZ62S9bEcIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070046



On 10/7/2026 5:05 PM, Pankaj Patil wrote:
> On 10/7/2026 4:30 PM, Pradeep Pragallapati wrote:
>>
>>
>> On 10/7/2026 1:13 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
>>>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>>>
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 122 insertions(+), 3 deletions(-)
>>>>
>>>> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>>>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>>  		};
>>>>  
>>>> +		ufs_mem_phy: phy@1d80000 {
>>>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>>>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>>>> +
>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>> +				 /* UFS and PCIE4 share the same clkref */
>>>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>>>> +
>>>> +			clock-names = "ref",
>>>> +				      "ref_aux",
>>>> +				      "qref";
>>>> +
>>>> +			resets = <&ufs_mem_hc 0>;
>>>> +			reset-names = "ufsphy";
>>>
>>> power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
>>> GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?
>>>
>>> If there are none, it should be reflected in the DT bindings, together
>>> with the explanation in the commit message.
>>>
>> Yes, Glymur SoC does not support UFS PHY GDSC. Sure, i will update the DT-bindings accordingly and include the explanation in the commit of next patch series.
> 
> The support exists? I can see the gdsc in gcc-glymur.c
> https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/clk/qcom/gcc-glymur.c#L7768

This (gcc_ufs_phy_gdsc) is for UFSHC but for ufs phy (gcc_ufs_mem_phy_gdsc) the support was not present.> 
> 
>>
>>>> +
>>>> +			#clock-cells = <1>;
>>>> +			#phy-cells = <0>;
>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>
>>
>>
> 

