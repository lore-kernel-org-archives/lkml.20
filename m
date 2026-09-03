Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2121138DC4F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422162; cv=none; b=hec9vwGFVsE6Zy3q2Jp1IwT6ZWM3cCEDnD4lI110YZRXypMsNLmgxt/L8o2XTHTWsTl8ulRdowCEl8gZz0KA53M4WZdQGU4Oqi48H7c0jpwsX5GfiP7sePbForDYBvP6POEYsnsrmTl8PFNPnt6y2avUeG+Gs8Q8okIjwGhJVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422162; c=relaxed/simple;
	bh=S5AbwRD0fqvqga9LGi1pA/jU6vTJnOuN9GDZFXUDnak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tr36fS8c9ou3+IILAE+Qmxa/uDbIE00McI3dKZdXrYRbwhcOVys+P0h/OzOnSTuwG1F82BnXbxUnKGj8wmF27PGqc7/IymSjsPRutARdCwBw7gcZl7MvUiteu0Vfmei8q89//CkkFKNYBsosOLJ/qGUFUbAR18PsjlrOts1qvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALzOi7mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fucr3kL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALzOi7mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fucr3kL7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMnN324608
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=; b=ALzOi7mnBotAHi+E
	doCAzqMMEmln69d712ZGcF13/fbQdqp6vYBdzWOueWhKb6mRpXi9ycsBCn5c5+wN
	9eBiMoAO/1L+qH/GQ+wY36H/h7xhhxdOrIQeTo63QsFZiDMfNXnDi4EML8D/XCn3
	iz3kZfr8oSXGVKYY2G5ae7vHPTS/YKbwHbcEDf1U2yxLwOdxGLyW3/uH7eokj36e
	tNr+0cvtFEzCpVD3cGH65HwCNwZAKg499DRhyFG+picCSkLA0YXJqQI31Fd5G6wE
	Gk43eDih+wkQYMpRyfmmSE1+mSCPUaxlvE2Odubos+AjZIOJvj/fpdCpiolE13FW
	4z9aVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb6nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:56:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2920862a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422159; x=1789026959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=;
        b=Fucr3kL7s6Rqw1IueGOwnYbA1CbJkD8dWGruMaMCNoDn1O/YDbdtEgAqu+UFq8/Mx+
         F9P4JOCeqFNphKiXvBtGvSXkHKzc1K+C4Qd0YjhVm0vvCx+2ITQA+VMuAEXmgtzo8Ax5
         BdfDmhjZNqucjdvgn6GQNNPhKes8JjcD4Ec2emj44Ng9EbL1BUmgu5qXIwNpMMaxlmX+
         wZ0IPdftD1cPCO5oSLaUEP1MeWSuV0xaK4X85EuLh2+eZwwFplaWr+DBemD8eh9EwdsD
         DNPQNiVgkBDJug030N9nfwjsCqeNKnv0xSxBOMPvJMBUJ0G/ziylORnHC0dTzHLQM+nj
         3Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422159; x=1789026959;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAkYV6yOiFFE5HQj2p+KiWe4hueb4hGJPzEO7lWuE/M=;
        b=fvYiWPbQJv/0i+Yk8uBwET7AGFUA3WqAGj/FTRflCaDtSPURUITS15cimW++D5rfVC
         qHKaRBtiG3iJfbrUTGMcjdnxyUExejzjuTXgMFiouEGsRvkzsiYE0n7z0Mdw1dl3Z4t6
         vSbiSNuKj/tCpEl3tXObr2qVgL2lG+ovVtwbaWk0wfK585Vr0szkyxcBXarRnm4wsCba
         WDTYwRbabzzIl7Tm15f6c/dyq6HsY0PmUhnn2SvK/qRnwFjmNeF6OyQ2e+2xqEVVvEJR
         1Ym7t9nz3iGhj4l5sQxlTrdRSJUDNqXVzU2RIDykmoAnsot1LeU6yqS4V//UTUhjJB0v
         FYcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXiVeyskK6fS4dpmce9TSl8eWDdXOVNxV9+J41ko0OSN+hywmTr20c1mb7nis4EaSfOE2AXPaOgc9waVM=@vger.kernel.org
X-Gm-Message-State: AFuF++kneM5vZzfyDmgRuWejOEjc6gP3wJEjkq8V2qnGPXrMwTUH+BMF
	tOhXkovqLbydZYCJscvf09a9HI7DJm5jQlgqEApBSUxSgSVMNpLwVfDDv8mIPyyCMSb1T4Sqhnv
	eba2tbaf6yZ0pPDXgyrcf+H1A+TyYidFCN/EMIqrC1H/KX75QT/c3ukbWHFzn7opmkYg=
X-Gm-Gg: AYBFou3ZxMYF5Mjd/NjJHOXiqaGZwZ4gRfpktWdO/Q+YV88xQrxi6kwdsPqqBCpA/qc
	qcJUGOVu4br1g5+Odleb5+QDxJlFh2OvSy1VzhoRV204na9DzoWSc8wpgyagTlX0McnuZO0nuJk
	1jH2f/05WSQjwHaZN/S3jmVmIgCDyncC21zU8IhSUcudjF9B3nPz9rkrD77RUjLBvFDQjDQWzaO
	F6Jm9b0N/v8stG/Fi1PxO6UDsEUdCxG4CujeJ16hosBq8nLA4Lk0KFlOj5DhrgwAqF/3p08Xb1V
	z5KPrJoBRtshuai2tF+Ka6Nj2yIMf3bgx4vr2+va4u2wWSLkW1hTjucu8UZiR8QNdGCa6+I9qLh
	ygP1Dy7C+kOF1f9hex7U=
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr14851308a91.12.1788422159502;
        Thu, 03 Sep 2026 00:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr14851270a91.12.1788422158960;
        Thu, 03 Sep 2026 00:55:58 -0700 (PDT)
Received: from [10.64.68.32] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm4054175a91.2.2026.09.03.00.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:55:58 -0700 (PDT)
Message-ID: <bf5458e9-45dc-4a0f-8d47-50e96f22e136@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:55:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
 <049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992810 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nF2vwnYNiXGi8mvl9yQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX/cPADM7vOi1i
 fKwQhZctF7lIaXKh1KzpbHZAjj5YygyjRf88ZsOhNV5n68nXu3M5iHVURjohBGzPvhz94fDrOBp
 EsEO/HxfMP22Func8CrjZCwEaXDbjVY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXwZkEnJ7vqPaz
 sHWasEPMhviyOkBJu27yoBwGDgLglql0BPp4YVygym+ToBUUG4B71rKr+fJuc7qSrX24ogoP0QI
 q9o8FUCi03BTHJoxyhBSdbAFFfVI9k4v0SB1+zo+0vcjFydOrJML6Nqu9TMEMYvIFqRmLPV14kN
 MbFNHD3V+ekG1o3SBHqWkFe7JSUz/Sa0EUAUqXTidvHCJyRBMjPC3c4/sk4wKPLvjLrqRRS3XQW
 bwW2WDz8skZlnlgo5wHCKsQrusPTp199j5+YKhLB5D6+kuh097ZIWG65bJ24aFOVUqcPlg07Dz+
 YIG2rkcGk6Rs9dDEwt7nWkFsDZfyoLWkXHw1CGAx2Wu++SDHZSse1H020I/ZWk60TYSlLNgWx9x
 pNEVzZChhsQU/q1/RxX2XMb4RgQQUnpUVUIVdt5ueKjkMPHDVQn2nnhc+SZ36yJkkuh+qkTyJBm
 mVzldVQY8KrgN83/j8Q==
X-Proofpoint-GUID: XROgsbwskP6wvX1iFBd8aKrNEkeQulAn
X-Proofpoint-ORIG-GUID: XROgsbwskP6wvX1iFBd8aKrNEkeQulAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069


On 8/18/2026 6:49 PM, Konrad Dybcio wrote:
> On 8/3/26 3:27 PM, Xin Liu wrote:
>> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
>> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
>> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
>>
>> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
>> their stale "Left unused" annotation.
>>
>> The FSUSB42 SBU mux chip is present on the PCB but with all signal
>> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
>> group.
> [...]
>
>> +&i2c3 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	typec-mux@8 {
>> +		compatible = "parade,ps8830";
>> +		reg = <0x08>;
>> +
>> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> On other boards, the port0 retimer normally takes RF_CLK3 - have
> you verified this bit?
>
> Konrad

Hi Konrad

Thanks for pointing this out.

I re-checked the schematic and confirmed that the Type-C0 retimer refclk
is provided by a board-level external XO/local XTAL, not by PMK/RPMH.
So RPMH_RF_CLK4 is not the correct clock source.

Since the binding requires a clock, I will model the board-level XO as a
fixed-clock and use it for the PS8830/PS8833 retimer node in v3.


Thanks,

XIN

