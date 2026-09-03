Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73423E8357
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418174; cv=none; b=AGPQYrx11hL0aaJHKuA8SV2aBnvnnM5K63wOXVKRIIDm9caXoW8J4iQjpHs1RYZbhqds575hL7uNiPeBflwxqvyJ7LXD93o0loNPT/27d6hWXryEiZTuvrjOTlLmVy6ocTB76zLOtO+yE+6BLybjumef/ACDGCQYDGC0PToKhuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418174; c=relaxed/simple;
	bh=8VraffC5BKkejHmJdMksu0LpOfb2HU7NmdH6wjOmvrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKw7GCMAMz7irzZUmpO+GLgZcmY9imaed0RZirdmmI215v2c5pz3HHOzZRkCmgm/aTaCWgQ9Vkv6M5VNK7BAiBF4zWw8VVrC7FsraS0d/S4jdXEiUu3lZvAnclWHPm9mm0+o72XJfgPH3R7kQWYkZ7OglCKWpBnwnXLCTJRidDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blP2OOD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/Jkx/Dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blP2OOD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/Jkx/Dr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMf8324606
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 06:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=; b=blP2OOD+OBnEz0KZ
	dil2gbYrbsBizldaMvz9GXwB1tkzZaxB0DmqxJT/NtTsPeEKG5dIFKY7fb34tgEC
	HnE0OOhDZqcTTznCMJAgLRLeb2m0gEmRcMAk0op4ahjKHYil51FYsNVCxQptoN+b
	XeGOJHY8zT/HDynjAQ25IqjviJcnWy4gLrdt0yfKw+JMOJHYqpYhTcBN4DwI1FSY
	hvpZWw3SdEaoc0A0gEz/wecMOEpiXTW96poop/fH/30uE4KBB0RSk7So/l9NrUZy
	eUQtSadHAzZ183T67zM5QYUbxewZoNzeFlzEP9emxAHUpRO394MUhEWwFFyqcZ8n
	hEK4Cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnawwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:49:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494b1e35cso42241785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418172; x=1789022972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=Z/Jkx/Drv7edbI2qdWCHpwwp2mG80jBmdYfwdqgp60gNWfKzCTcXICGuTshQqQUlnQ
         KYNFzY/uPcnJ6yVc2ShIIzATC5fAiwvB84MxBdUpMpu2YpksRW25XWf9LumWmmEqSXvJ
         xGnvB835FrSUdEc6kKiFF4k8AWxD6A+qm1CcY/ff1rroTQPJmP/qVnPXpx3Y0Z1VzK4X
         KxuPLVET9U1JYRb1bM9Hbu0Sr31jU+/y/KcZ+t7K5p6muwcLzbF5jEMTVfzIXcoDwY8X
         obWggezfwnbGnthitKfLFP8HxbBLaas4zvCy0+b5S4PDhJYqaP17BZsNAf84ETGNeadm
         EeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418172; x=1789022972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=e2RN5uzhQz6uB+JwDeb7LV76kchQBYOE9A/QTO+hRhsuF/2ugALX/1EyMZVbzBgg7S
         R6H08dLDNB1e1mk/0mVGgqCiirgZz+IThJe376U6hHG7926MO4lQF0vL3zau37vCEbqY
         4OpfHd63Qu1DWDfnfOEW+5sIaiskmd19Y1G63oK7hM1dMP7aseA+w733JaIMWxWDZ/45
         PCNjsB+JlK1DdmFTNetyUjBpIPJ1k42B5PcAHl/GfEhbRnDw5VW3yjnNFZ7LhNWBfScn
         wN/gRZg3WWlGGEs4bITh2gtuCMrQrhQsWYN1+SIDrxn/WmyRVjgJUxONnzjfSY4k1xTt
         tbkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfO8+E9jQXLY2+w/LVGuVA9iH8scEv7HCOVod0lhVxamvlK0XEllEw5h53nxTRkmEybpH1EjLvIulAkmg=@vger.kernel.org
X-Gm-Message-State: AFuF++mXTP5vPtpcCjzuHNg0O4JuApc9C/cS6xWQdz1I+dMXI8LYvmWv
	C0RdL5asnBk2rZpdgV3qkVgH6We9xyNX5A7klazNEyGqDW2w0qh3PblDsArY2Qgk3SA30qYy46b
	ZfuO7qcKeBLunDMxTu4Dq89HY8z0uM9Xw83AoSDLm/6TOyMJhiwF/FYuZ847KbTGuXaA=
X-Gm-Gg: AYBFou11BNgKn5hQ7pmI4IFI9UePWFcPes7sGaIdxdImTROdTc4p468XB7s0EjWlbrY
	beyhOErov4Bn5RGYvnR29ThO/SB1lMGw0NNZ7Nfoxx7sBq6jb34cW42y0aL3xeqTp1IbH2Pwqlj
	WduGHJ1PHuliz7ylWsmWfsXMBuyt886sIHjtb3lR5BcjJ+pFazr0JAtMaKuNIng1ggPOk46pziO
	Dxv0k+ItFVB63F5rxepf6IdWiNAGM+1GgHDyqLWh54nigvmeXc0i1Am/VquANJcUaGrVIg93aAn
	cpYLP05guUUxH4QJPC+74bZy8cv+oB5nscz+tJ83d31Io51+D+Vjm5V9u87Y/X7Cqg1eJD/Oz7+
	C94zGj+4UKLeox4MIpTR0OQ==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777132785a.4.1788418171959;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777128585a.4.1788418171248;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm1779131a12.3.2026.09.02.23.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:49:30 -0700 (PDT)
Message-ID: <91e5c863-43cd-4703-842c-7bfaf2de877e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>,
        David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a99187c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX727W0q4BkZ6/
 7K/SRWRAdqvOGeznIicA/G8mnoicP4HuMrinzBvPswuwA2oI9Talk75RDH+8FYZNdpdW/E8APKG
 4N9kTUPimJDauaR472NG/wK0HFDBIVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX3takHAH4sUEu
 TiIJgUhddr/XPihHy/DAAw9xT9iZhoxq+kOxlEDkfw6Rfs5qL/WLHXzdUwlNo1VBUK4dCBbeL5j
 +VtwygL699FArrMuSs7l7eEvwxftqt26riuQNXP22lx4cl2G0huY0rj4PuKx0EaXKLnaGQbB868
 8GSEJuZpS2q9r3PnQsDLAueDBh1SU2d1oRRl1sppGVQy68vWnT7NVRf9qK7s5XS7yoL1FCXUQOb
 vL28mOP09ZBpYUCLoXhGA0HOCyAYOvLYlGh4zAUPJy919q2tQx5u41D7uk3+Ik84X1+jcVa9syW
 gSi7GAcTEyCQKBA7HqWcbQ7a7+GYWcEkgMsrzGRyAatrN5ZifG93mxIWU7DbBRL6wrVJn/H7rhW
 zHOhH0cQSYetvWWoxhwHUOgKuRU2WUdGY/2PV+sKehw6WiXouv8mzNtmpczJKPtde6S2JHJlrqS
 7tcesTeXURWRzs9bLbw==
X-Proofpoint-GUID: dGq6VIsgD_aUMdY9KDsjloS6vok2PFxA
X-Proofpoint-ORIG-GUID: dGq6VIsgD_aUMdY9KDsjloS6vok2PFxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030059

On 9/2/26 11:22 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
