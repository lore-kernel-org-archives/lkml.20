Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C63C0A0D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021517; cv=none; b=NMIjlU/51JmgzO/sZ7M0tHlopnrofrV48fWwoyfUPqtL95tdBeSKHlGTUhaSnFDKeDtLeN89eoBkqdEF4hsR2oPf5sKUxS8iz3+DhNw8nIuxgHF8Zg29LqVxfJa+skJ0/hZa1/5lC7qWbWwmWHrqjPNOwoWtPdjyxW8x5YOaPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021517; c=relaxed/simple;
	bh=i6fj8/kf6XJ2Mztwx1NrbscUGR6y+yJM6kOskXkB53I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0AZB8XCvBI0E3Yo7J0iAiunSmYBpB4ONBncMTLZS3vTikoAtcC5PJTdkCwJ819sRsHLVnIXhmsWNR9WRg2FYwBSt2x0vdez5f0dWOaI9WmK6bALf5Vl34M6aS846lQsHCpacxSw6LWx3R2aKxXk/BRjTwsIOje4nN5b526mY7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+7uLXDO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJduRUgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+7uLXDO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJduRUgB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GnpE4058749
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ObhisKuf3WFl+PwC9opKGA90mMXdNmzZ9JcAW0CfsI=; b=B+7uLXDO6p95T/EV
	0zlTTLwnLxH15TZUT8Wpgq5Jc7BDYEhYMQDhP4HmiAE7xmTm5/xjnBvZa7E7MKFt
	dB70ijuxGucY7FJaxQn237Gxmu8HXut+g638oYJGfIIKKx4WBhxIQzYiEWXYZlmB
	NV0I8aTcDI2wOYu7nw9mkwCW65WjMsxhYH0HxqbgAN5kTtqgf+NL0Xvq9h90d4Pk
	J9gtnb9RC9dGuoYXLqyyLvPPimqRQR2me/sjlr0v5s8s1henAzgtyyXzzN3XOWr3
	7rd68rTU41afZ4IzDl4U5lDQCMg0jLtc/pLWORE2wTbbZ1J+Sf44jTD2znJLAiFw
	BqjrmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyftehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:25:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db050d469fso10140995ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021514; x=1789626314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ObhisKuf3WFl+PwC9opKGA90mMXdNmzZ9JcAW0CfsI=;
        b=KJduRUgBs0ZT8D+KHuVYQGjjIHeFuQIESbKNEPaWqWfn/rBQ9zam9CIZr027n/N7ss
         dTs9vFm+AvV7sFU79v2v7drESkBoS+ljjMF0Q0Eq/Awbaa0aJGKW+W3P8zRhDZtCHz78
         vL+cau9FNV8t3bztXkZrfpK+8FquB4cSpDmo0h4P4VfO+WTkSWKfYvo5B45yAIRETAbI
         AoanpyHsCLUSdo1olIreM5VokN/3yfGUYDLNPrCt2TFk9KQg5ynTXT7qABk6bZJ4DTKr
         gjacc/0unUJk1RkSB8sr3HE2lx65QXKcewONzmSAuBCA2atbLcT4oqE/ZmmYfxuy9wMO
         PnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021514; x=1789626314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ObhisKuf3WFl+PwC9opKGA90mMXdNmzZ9JcAW0CfsI=;
        b=DuGobdUzVoO2ewQMMtGLxKV2uyfngTfJSzY5P7NZ81msFSUJuFJ5jX25PCdHJn1H4m
         1JCTr2p8vumklT17Gs5+LqrhR2f0b3ZbyGIX/iSCw6Hag0KU6Fss38/W4lL5RIv3n9zU
         rS3Sz30HmIacrF4NA/qH0hexOva0a3ET6FF6+rtGgJgCKqHxYnkfySKVPOP9OZUPf2pb
         Yzv2ElGhQ/gyskdAn+6FRFztDkdZBWuqxALdd/XggLwnxQzfGe100Ujam0jzU0nY1Ow6
         w604weNzDSWju9AdPVVxfEzu2qBggVk6roeCkh0N368irR3Yu3wAZ5/ZmeAXLVGBNvYE
         gXpg==
X-Forwarded-Encrypted: i=1; AKwUvByUV62/CsVSvUeOXlRmLs7d7o3rHKp2Wt4aGYGRt2QSKfG4eeMWvuCMXApz2vO2vGM8Fu0omao3G7c4P/E=@vger.kernel.org
X-Gm-Message-State: AFuF++k6+Mux0QsesRH0TK9XE2qGX3o2qcYp+x5QEUHZ0M+2Ny1uiF0t
	Za5iqqiav0fxCNY1GNSwS/niSD9+6zihJIOeXWmHwWockCWAXQb4kP0xloA7Mwsg+/866kSKLnX
	NTSEZFcGnNpSOiTnTxVAcObkGGtFEP7apSqTthW5v2egjqDJjcJFhAaWKwYtN/Khgeao=
X-Gm-Gg: AYBFou0D16M1RRIwBkttKjk79SzJAr02udBRYtxyZ66akibpl3W8u59DKOt4FxhdmCj
	t/I4hsZRQ+Uj+cMe2ToBPLqevyl0dkLnj7ewexMJAy9XVy63xRz8+WLlpfPGZDW6qCNtszHo473
	8vt36RWzhKNB6k3WBd3vuslBeHxpbOFiSicfFN2FMAty06M5H6uqXrwGKIJryefLtse60zrKfQ5
	ApRGVx7mIve4E8tkzqKJlUwc6baZsoZIUn2hcW4Anf7yqYSYVLhwj2UiEg+CkCXI31sRLy7mF/g
	qf2KIdRuqpeKhIXhXeVmWCo3rJUF3dLuNsutj9pOQg70MgrR1gnzO5qqvg/HFYbYov+vHY1fZRv
	qsg42ZKfZP4RGnXAxTGdxixZiMpumad4mWrV28WC3NKx7nmVqtPKqghQNMQ==
X-Received: by 2002:a17:90a:fc47:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39d7799fcc2mr2591713a91.3.1789021513990;
        Wed, 09 Sep 2026 23:25:13 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39d7799fcc2mr2591690a91.3.1789021513427;
        Wed, 09 Sep 2026 23:25:13 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77611asm2420034a91.6.2026.09.09.23.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 23:25:12 -0700 (PDT)
Message-ID: <bb67cc5b-a120-46f6-8b49-d1f492a784a7@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:25:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] power: reset: qcom-pon: Drop reason shift for PMK8350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Sebastian Reichel <sre@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
 <2b163290-d57c-4e84-99b1-d94fb5f45f79@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <2b163290-d57c-4e84-99b1-d94fb5f45f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S9Kz-xO9H-1OryDBE9doICcd3M_GGVxc
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa24d4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HE6Pee6EBNe1YuvuHLcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: S9Kz-xO9H-1OryDBE9doICcd3M_GGVxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX1yG6Hvn3HEY7
 neTwSI6HG9WtQNq12OgXnbF9qSeyFvdnYYB/F8pOgMMGe6dZeEwR+vw6c94wfwx3mrGRSQOc+/q
 CEu3eY3w3c9yo97hDMQKouqBIvDhyIMN1GuqfyXx+yoiOSKBL2x/PIKO4zj7tXyjP1cGK9pX+Cb
 4lWtAvft4jTAZEV9UN6YruIqFgNBuenDzZtux771UcRpg/EsMO4IIl2ijEtJtYtzidDBN1wk1VR
 zNVZNXHGQXRRIJd8HZzUN505lC6mK7FfX9spmPrBhh0pD3d/y2GSmRFWLl++OTMJYgqnyXuYMby
 bLBTNd8+ZZLJMgubYOdaTg+iiMTGbY2Iqo3vX5wpc/yJ6795ggR5RJjtqHwCHoInD4msKynxzw9
 qVu8OaZ2ydxq/TT202F36kBMeczjWYuOXBLosI32K4tw1ZNifFl58MsS2/CpmCfeFZfK1CRpK0G
 nGJkNtaXovsTr05nQ1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX/Bs6aBmt0pz+
 lhnhwNObekJJFfYymJdrZBeTlZKWF5WRtEgGVY7lUrY6I6xbdPjDORo4uYtdAjb3h7zsdcKXjpK
 bokSvkoVpXLIONn6rftpVB0U4+9jQz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100064



On 9/9/2026 7:52 PM, Konrad Dybcio wrote:
> On 9/7/26 6:44 PM, Alexander Koskovich wrote:
>> On the PMK8350 the SOFT_RB_SPARE register does not exist, the reset
>> reason is instead kept in SDAM and written through the reboot-reason
>> nvmem cell.
>>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>> Would like some feedback on this as I'm seeing conflicting results,
>> SOFT_RB_SPARE does not exist on HLOS but it looks like the downstream
>> qpnp-power-on driver writes to XVDD_RB_SPARE2 for GEN3, which is on PBS.
>>
>> Though, targets like waipio don't seem to have access to write to PBS
>> from HLOS? Get SPMI errors when I try. Didn't have an issue doing so on
>> milos though.
>>
>> Besides, the bindings doesn't allow reboot modes on PMK8350 so maybe
>> setting no reason shift is correct regardless so it gets skipped?
>> ---
> 
> Maybe +Kamal or +Fenglin would know more
> 
> Konrad
> 

For pmk8350 HLOS_PON, I can see a register at 0x8f,
PON_HLOS_DVDD_RB_SPARE2 in the dVdd_RB block, that may not retain the
reset reason during a device reboot. The downstream qpnp-power-on driver
stores the reset reason in PBS_PON register 0x8f,
PON_PBS_XVDD_RB_SPARE2, which belongs to the xVdd_RB block where all
register values are retained during normal reboot.

The downstream driver manages PON/reset behavior primarily through the
PBS_PON module, whereas HLOS_PON is mainly used for power/reset keys.

Since I don't have a waipio device available, I couldn't verify the SPMI
access permission issue you mentioned. My assumption is that it should
work correctly; otherwise, all reset-related functionality would be
broken internally, unless the PMIC module ownership settings in BOOT SW
were changed on your device.


>>  drivers/power/reset/qcom-pon.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>> index 7e108982a582..9cd55f5536b4 100644
>> --- a/drivers/power/reset/qcom-pon.c
>> +++ b/drivers/power/reset/qcom-pon.c
>> @@ -90,7 +90,7 @@ static const struct of_device_id qcom_pon_id_table[] = {
>>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
>>  	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
>> -	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
>> +	{ .compatible = "qcom,pmk8350-pon", .data = (void *)NO_REASON_SHIFT },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
>>
>> ---
>> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
>> change-id: 20260907-pon-pbs-76b7ecaafe33
>>
>> Best regards,

