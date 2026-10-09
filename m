Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262243C045
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541250; cv=none; b=IWiXpPEzyr+lpb9Ri9qCHBiRSAO8VeIXm+nG1UutVuaehtUuttbdR4sBBlwEcfMRna9hUWL16yzG4eCT4AK052mqbceGzF0Sw2BtQ7YQzsk2McxicDarv1StXAD2EvvI+PR1/+K72qNqUT4ZeJoRgLeY9JwxPuy36QrpVHchcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541250; c=relaxed/simple;
	bh=GQnpL1wzKHxO/QeOKLPZKEO8BbalR1e/acTMvQgw5z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq9xxjQTNzDEwItDgekev86NTYth/i5P0Qy68WYGXsr9W2KxdSy5Yevy5Wl7QZXeEGBvhjBKPpwzs4VTx/0NDft0NZP0+6h2G4ON9xP78KYLCzsm4iGmloSeKpKwg90BZZwRDK1Y3EbJWzPWX7Pq9jdTnjdojg4zv6RSGHBK9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZdxj3zv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mh128D92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZdxj3zv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mh128D92"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KH1c906820
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=; b=QZdxj3zviA1MoeqX
	vnnU5+AUy+L4g9IPHAfK44SGhgoUqvvHxjabZI5+xG7jK1VZ0gCzFaGpFbOPlO9F
	7vV3jCapXw0YoSNdV1784PukmlqQiA88PfxpreSoniFagM9tgOmswlCGgXmOOaVs
	Wt8g5nQeJq49k0x1mDBXEGW+XM1FrkHcyCN3kFLUVA7Pcfl1mqCk7XNjTTXfSFPn
	xeTMAg0L9IVYCfTYzyqr12K1WaPcuYV5JswsM4VLEx8yK+yQiE5m90YmvdcDRxua
	4D4Ui5uit4FMzjEYW294SQFkROA6fozyuEx/rn2pnTLRj/m1XRNXJJeaQ6OMb4tX
	gTHPVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqu6m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:20:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so7775177a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541247; x=1792146047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=;
        b=Mh128D925vZQI4rhNC6WRbajZJtCcHr+BnEgr+yjqZFPiYmEAglk0JqQmSKAota22L
         D6S3XUsvNfrdo1IeD8G80QRPfKQdhDAn82r9hSlVSiEs+wxMpRwGG7834RJGKBZRjsaY
         Wsp/3frw0mUdoLU/sEgiw4VGDUi7u6OuyCAK5WHb9Fr+EOllNDVHHm37Ybk1a7DIqlqG
         GSG/+Gi9lqNXsvWt6XDS5YQ+XAjEuby/+/StO639nktk+OcAIQUbhnuYF8qOJX864j3i
         ScVNRH3V8lx6Z2Sph1qtnxhDx3PsvKk0JYFSw5iN3MxVeWQurhbqIlNUCxoRxWQ3ybiK
         /RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541247; x=1792146047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gwj9DlboKAnnxG5g7o8KWSRp+dHWnkDcSHLJmL3TOO8=;
        b=gou/sG86OZF+3PDCPLwR0C7QG0wyuD2eGW+s6fwxJYWIasSsvZZAtXHfjZRsivqL6u
         ChlDq8soiWhM1SrY4BqmxVlGaSd2ySZ2FfLjNIYGS1BiKKFka1zCl7eXC0Kj+hg5MAVt
         unq6R5Ead88VQ+WOWfVAzBd+HkKzlpi6jdPUmKqc1rZG8qi7NU+eEeJs+RYc94PQ4tb8
         bW2OYFSEcT/74WW+wC7KtP43WnmbobmN7ruJd8KNIeoXrJnyDdy6g7rWPhFNzIzOh78J
         ceLEfs0wJICjCRj3OJyWzXivCXtcGpQuRMbX3G17Qwqu0f+bszbXI9WcnSYbcSdqR75p
         aSmw==
X-Forwarded-Encrypted: i=1; AKwUvByL+ZQlprpBja2Mk8/9yaTDeBL9Y2EKThaekhJqVrt6kJF6u8sUAG5/Dj4NspsAW+lX2Qeuc6cS58tfp2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA7mHjGzH4VNvFkFn+0tD9VsbgN4XsSb0xMrMWt29QEgJSO/sn
	uCtBBKzlZyFxv0yFJrJsvEtzWb7v90giYYplpNLDqXEpC1p0PrOx001iW4B0TcfGliy+iNye9AK
	Jnxv2s8oO1z/DuFwO8hYgYEksT3wq/oYW5PjE6geDEwPsq8p3PT+EDV7GU1Kau6gVBCo=
X-Gm-Gg: AYBFou2+7yQNR01YFJFmzwxcIdMA9gtpJw9JnXknvQnlD/QbTCh7g9WE3CTpgFKK9zj
	3+d8OVkguPfHhijZ5oBMcbRDurgA8c/lHo8ipPnNwi+qua6AC13Gc5HqhOoTdp4ToAwCC2CNB3F
	05ulsY5r4wIRulFhemZmk2OqdPF9i459ndHnFibr28rjufCLcQiON4BtQBJJ3mnDGwlY3MmE71Q
	WBc6l8bpK9t2YuuAVKtoXV+vsrG9HMMdUg7+1G4Sh1LM/5iVAxI0bW8AFkFUKdcFxLxawTAgo21
	/vl+NfehDAFytQHA25XhgoWRj1bADDu3VnIKH1Avfm+z6WVq/tRmAGbZWMAnUSuGO3sxFXwWvuR
	n2jeH4eNVSda86C8ZbzuTQDH+yGlwii+lsi3wl/Ap
X-Received: by 2002:a17:90b:1847:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3ab3a90e800mr1364983a91.22.1791541246607;
        Fri, 09 Oct 2026 03:20:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1847:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3ab3a90e800mr1364937a91.22.1791541246091;
        Fri, 09 Oct 2026 03:20:46 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm1366459a91.2.2026.10.09.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:20:44 -0700 (PDT)
Message-ID: <7416dc0a-7b4b-4d26-95bb-7f24e54dd6fe@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
 <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
 <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
 <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <unvey6hlz5ov4flgzza7f3i7nowxym5ik3dd7jkzx3yiqt5xqp@ci3z27we45e2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX77Cg8L+Sj+vf
 B5sm8CTbYqG2PiJclOztilfx/7gMtpfO/YfDjV9vPJlbRJ5Ih1FbqIpxNPX0KUa2Snrd/kXvm34
 kSMTeUTckSUFZEA7jmGZKjzeD+6DTnk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX/2vZu12MIOmn
 e1Y1q/fyx5KUAo9WyZnhSJCqFdvjv/dI1dRJpRq0ak/a/E3wGac5QPHJxikmr9UFHoMyyZ2VhUf
 FgWcD+IuAhrJfPcoy1i9bnKWd4yGcmnO6dOjjB6PM58930XRgXHuOv6JrOwdYrSxAjisLr1uVrD
 KaZ3g7cJwGLtF4tSZU3RtBvv/GEy+zlfngdrag43fabI5qCcFO2LbjB1KuHyOYSHvLqimnYONAq
 0q7YZGo8MxXuZ4VmQds1qbOHHw6g7/ntaaUtcbjRHXeQQseojjTeL++PGhoyprf8BKMXQWGWgal
 FPzO4+u7P5QcC1h5EyWWljbe4Jgj+Nelams+ivXIuPnoEss4gXkUNgtAtek6+xLgHKGjMlQw2oX
 E3MmaCcJ4Gjj/iHJqgTQ4+OERJokrfrw4ymhePD56gzIc1uBkbhCScePXcoFpO9SVJJBuk9ELTI
 GjgWxLfZlnJ0qO0Rk1Q==
X-Proofpoint-GUID: 7T4X14jBARSc4p_4PnpgEYYqdyelG6w4
X-Proofpoint-ORIG-GUID: 7T4X14jBARSc4p_4PnpgEYYqdyelG6w4
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8c000 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_d3xwxgixdHQDNbgaEMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090041



On 10/7/2026 9:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 08:15:39PM +0530, Pradeep Pragallapati wrote:
>>
>>
>> On 10/7/2026 7:13 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
>>>>
>>>>
>>>> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>>>>>> Add the init sequence tables and config for the UFS QMP phy found in
>>>>>> the Glymur SoC.
>>>>>>
>>>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 99 insertions(+)
>>>>>>
>>>>>> +	.offsets		= &qmp_ufs_offsets_v6,
>>>>>
>>>>> So, is it a PHY using v6 offsets, but v7 registers inside?
>>>>>
>>>> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
>>>> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).
>>>
>>> Mention in the commit message, please.
>> sure, i will mention it.> 
>>>>
>>>>>> +	.max_supported_gear	= UFS_HS_G5,
>>>>>> +
>>>>>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>>>>>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>>>>>> +	.regs			= ufsphy_v6_regs_layout,
>>>>>
>>>>> v7
>>>
>>> This still holds.
>>>
>> Do you mean changing ufsphy_v6_regs_layout to ufsphy_v7_regs_layout?
>> If so, no. ufsphy_v6_regs_layout contains the PCS register offsets, and the 
>> PCS register offsets on Glymur are aligned with ufsphy_v6_regs_layout, similar to SM8750.
> 
> => commit message, please.
> 
sure, i will update the commit message in my next patch series.
