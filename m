Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F113AEB2D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880767; cv=none; b=hEPJYqHqxnf9nPS+RFgY/FVXHe17+9WAMnPftX9eouQ6L0VMvAjFnoMAZVydI+u+IpQi3LRSBcK6D5L/mPhpEBShAqE9QIBBev72M6R8VpPcuCJtsoo0UBFUN/RpynKPfxWp2r8PHbfXOldOhA/cfSR97/lIEnea7ED8/0YByn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880767; c=relaxed/simple;
	bh=S8u+ZnaFpsDK+OrhjGJtztlHxeebOrcfzgdGhegteo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5eTxQEQXGKriO5UxG8ESog+TNvgXHClLc5trqkZVGIU4nw8fHTR+dCHOhcj6JOHEQNAldGTyyLQRfD/iFCODp7cxjD2lu+t/bGpMoUVgYwvpAlZ0gyqQnKIT0z/LEQINHLdjFzLLig2YZncCXTT/FnSbwKQYcaOqAQFrsd/woU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5IG0UQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuwONN8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5IG0UQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuwONN8G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20v8U988971
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=; b=o5IG0UQhQ/fgtba4
	sMA8Cvk537oFr+AHkiMvzp51CJEqJdQMaTN/MiFnYysiBXLPV4Auu4zBFYFzqVGw
	5mC/wzeRHe3qi+Tkns/EIG4egoDFRgwwmGHV0KLcmTvTK71PCPprLcRko3P5ocML
	8+h/PKCLvRX7UtKZR3XWNurGYes9o5OJ9bhzIhmBPF4EL7QJ7WGG0mAfa/iqMKR/
	cC9AmDfgDHPd7MtzEHvtdAIK5z8AGQu0EMEZI8xj6ceY73D9u+wrugxiBz0pyMUf
	JxAVOKh/66/d5infTkL6NCDIzmofneK9jytwUgYY5/pTztiV69nBo6j6kMAx6RzM
	6fmD1Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc9yh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so724234c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880765; x=1792485565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=cuwONN8GaVmGTOlw4PIJOYul3xbHDv9dwYDSCXg3V64y6J29jSJ/ISIIAGjIlrzz1L
         c/ROwHqavmqYPgf8iW/VD6DF8O8+rPQNHv0WBFWInDCIusmRc44XGgCjCoZxFXrmOgxv
         T/67YUxpawF1jC3t0NL8tx7G9rzsTZCaE/GUpazG61tDms94BcAFhcBOZiUP0Sq0LVzK
         89YnSUwQvv31VP4PiQZtCZTLbjLaeSSDICLC7gA9vMqb2rGzotOEa8Gq7nUKf9S+D9lN
         iEwT3Ej8vJI4BvH56Y0vNVAOsAs5fiQFZRVnitBfaDjb2G0IcJgQmjLU3ZpKDLeayL6e
         FItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880765; x=1792485565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=Sejr4KK2z5RrCmSwvT0bDfUIk70dOeB5CIg9mlBuVl+bZ9VVBQa4h8HbvScBQBs3eH
         6KvgHIwTCLPhp0SCgcWJgJkFXHYtDa9j41qY6TjiMVQpcGK0G/CO/vRxUgiMbabKtX9K
         cDVGXOcyCwaOODgUJ3LQonZuNgf3qwY72Adfs8ncuFh9MhI0Z4eOHyN7QlFja5X//b/L
         KaAmc8gySC98ucQubLI998rmnLxfZKsEwgSKy82KOPSBKc2YO3cSUSfcEiKd5jT+gWbB
         SCU4Ggy2TrYJtxzFR5XJ50dJL2Isk+0/wd+vK1rVWyp/Rq/41cCqD/pmLIHeyh+pF78A
         oXaw==
X-Forwarded-Encrypted: i=1; AKwUvByQVRt7w0j7coWLLCvsXWnvWu/Ety1179GjywaX7MNL0w+k17QaxXUg34f7jwxJ23Mlh+0gGz8zG2xBTmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8i4RRpiIfbObo/TgwYRFfG9lPpqQu9bW3OVF1BZdvuKmOdgf7
	aAdENycBDFhOumJwJ94lCH0i82mKte/s1Aq1AjxUXGAZ1DVwIOuJUSLphdsOgP9fxiKgVK2MvjZ
	PyZSRw3LFbFu4ku0ZAMVLbPm5GFOGDcmnzL0Y6u8g7j/+dr9+QtYYvsAJh9lp5oFmPUc=
X-Gm-Gg: AYBFou1Z/fzhJiya+bTvxJ27I0Bku8KoYij1Hp/bUKDcEO7qKFDU3gYlxvUu3mDyExj
	bKHb6jedWGtIXS2qaWki1RljBT8woIjM92pIOqu6L7FFeqEEA73OM/36btBMZX1c3tUcQJCsq+s
	2Zru44M43zaRbL/XTocmp5Wd113Gu2Boehi8Si/tNnTCmnJTiDgBkrRvu6KqvlNjLYxm61W7H8+
	1Qrc0aE+utzSFAvQE/SQW0h9iqY1ySOoupiklNiPERBj75pNW7KUnOZfbWhiPuPk3aFijt3vJRE
	sjWd6mGK0hhf67otW4UiKxLj+s9/GfteVHdiN2ROkWeQ/R6vJWORMZMLp7SZBalCH1pv6STF6Ie
	gHzSClNrP09PT3Yib2L/K4mvr1/6gczHgX2ulvsQLSnwTHJUSKfYSxlOc0VATA9nU
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112694c88.23.1791880764603;
        Tue, 13 Oct 2026 01:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112648c88.23.1791880763693;
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm55939416c88.18.2026.10.13.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Message-ID: <6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:09:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <aszg7Us_ACMMiM9N@debian>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aszg7Us_ACMMiM9N@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX1Y0vhWcgJUSS
 WO7YbfRtzZFST7Nnz2j5VTwqFS7hv3DSuPMWV/G2m7BsnkEwkaga6s4x6+p+krhzJgZmkT3x41e
 BogVLXJyfNvFg5celwiz/vLnEL8EHpQGDjhYnuBmDFkEVGpevpUgCkqDH/+m5DrN2XCWU0PNmE/
 kOw+qWvbXlyGc+FuiU9XNLuBgm+pfOl1aZ9Hs9XLecEC812iyYPWM7Z38q+SVrmMAgvTmgG6lSo
 Svc9tZpsAtZqO/4LSQhQuXTdEdhrWqxYDSAdegzRe1q8hvJWnalisWh5qrXRIF1BHYkUkiGdneE
 5QAFmL8UJIkeHJbnkLK9VoqjVtbBdOKlWrHE/pZtSvfXFzmd0JL4PjnCTDdUbPJpbgg9u3+wkxo
 qEl+qPNyeTqf7TYByRxZcv7kZF+01QYyCP97qP7f7cQ35lCJWOpdeO6XIh+5y0EY+O73WBPWK3f
 ENaQmR8PpZk9IbZD+nQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdee3d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SsOP-9FfJHXtHJDkYNsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: G0G5QfKfdEDJ6aDJczw33mpgyrABA_d9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2riRcbvgMy5q
 zr96nL/H/1NlffSPWnnaIM5gG5+Jf+tUucjyVksrxZriHId9PkCKQ8vc5wpJHDVBLwpAncrBnsV
 ydhcfYBilP/60zyXFo29MdZR15PGwO8=
X-Proofpoint-GUID: G0G5QfKfdEDJ6aDJczw33mpgyrABA_d9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034



On 10/12/2026 7:01 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 08:59:04PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Add support for a new phy "type" attribute to be set by eusb2 phy drivers
>> and be read by consumers (in this case usb controller) and act accordingly
>>
>> Changes pushed on top of usb-testing branch. And v7 is only compile tested.
>>
> 
> I believe the merge strategy is to merge all the patches through PHY tree. If
> anyone feel otherwise, please yell at me.
> 
There is one existing comment from Vinod on v8-2/5:
https://lore.kernel.org/all/3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com/

Once it is addressed, will send v9 on top of phy next.

Regards,
Krishna,
