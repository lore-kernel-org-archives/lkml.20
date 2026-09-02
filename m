Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC53EEAEA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338651; cv=none; b=ke6UUyA+vJ1kgruUKD4G86/rVqAh/qIbIaFuGnRiM3wKfm7hinYdnYvks6Ux8xTvYir760b8GOl1OmdQcCCVJyh7orNWoMVHAVRnPsMWg8mtmey1IEfW1raaTzS0QPsW8yG5GwzpCddJFlZmMvCdmHvAeIFaB1Ftnv9uY5joGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338651; c=relaxed/simple;
	bh=GstLgIHtvyFTm90ArYuPevwty0lzfMMUujZRrcj/Sfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LecG3BYB7wm3GD2HlF6LNsA6iiuvTrxGnfjF3Tbdeqd23uzlYMoxm7QvNPJWQjmzlWDs9Dww9TwVGiQAeEwzNP2L9ToOMVGwpE4A4PQGbedCPoEDc5DooF3fhKH230NchpymBWRKdEwfMoQqvvNXgr/LVGWvv2wIEd/R/+W9Qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0JcRGmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iT9LiAzu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0JcRGmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iT9LiAzu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WQ0w695457
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=; b=h0JcRGmOW3yXBfJ3
	Jwg/N1/SmEx2X+CMj+1kJeGOLtnZ0m3Hzy7ubZpgM3LSK5QO8HNKhvVDxFOTFL+n
	cdKpYpumJFH8c12HE2yzjcbcsPSkXkpYoHbCx6wqEzWdGOad2n3eYt/By4kq8tsm
	qXgWaWidssOkHkYai8YrCFKBDW3Lnrmj8tiwsYd5vzPPMq+xZuMBQUsNZtiGvdpa
	mwVGB9FXu2w5aUUaxzAuIKl6Ssexe97sB8v3UzobuhuBSunsQ87miV0XuqtsCw7s
	uSXJ0Se2Xbu5nXqkmc31W5BnQ793GX4bG38y+9NTNTkNPD0zie7MiSPiUNCfr8XH
	TjG6ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb5618kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:44:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so1558201cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338646; x=1788943446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=iT9LiAzuyI8jwF2nWSLcnoIVYJ/Sp6Tgv73j1Ktqc32aoCW05qkWQq5J8zXunGpr/X
         +jkjIW++kvOektaYWpLP2wgNBqsINVDt01JWXmzkuU90e0Fx9II3E3aJNIv2oQSBC3Tg
         T/qVQ9uDzca/9jWx7DRWgHkiUIGi0A78FniPiJ+EbgesdeOch9xcH4NsKAZZ8FUsTZa+
         QTUUy00ahjeuLX3Rf4RNasHaIF2F8rRGk71oF1Fz6jS6aMqWKkSAiVU5h/D22KNVa6Ql
         TlbRCKbsk7OIu1S7lg4dcVu5E9MVnUR7FznXfuJ+VE8YjW+qNHaOYlrJ4Bme4IzQrEa3
         XbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338646; x=1788943446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=fK49I9V8fNW/c+2DmD+uvDE5Npm2l8IT4o4d6NdAF/Pnofrm0hree7hcaoHvSLkhfQ
         7ahxD9nonjvtqyX3lRmtbArhS5Z3IcLQyNnNYmMh8HR21jbjG5rL2DTddoPN7vOFlwlb
         txb0iwlO7mv2TnO/DghVL+AEiAEqrDpyeIODzY0xEx7nI5C6nustHEYbOT55o6AZDI9p
         i50LUo3uBf0UsPli9u6gDRguTgs0S8DiJLN+zrUDyAg3Px+V47Mku1w0hhEBlDw/6gxo
         ZV/yUx6gF6UDvgnR27RuJP5htJ6tnELayvhazboxCm148r0Xgz1yxMW9+MRaUI7hSgEM
         ySAA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+yb6yh6mfNUWGS3UtK1CLIHQOk5fQDZzQMeSKCLwAhqmXl2E/78gP/uhPnUH824EGjfAoZx64/jTiA9A=@vger.kernel.org
X-Gm-Message-State: AFuF++mCewmnxH5unRXmtb8PGsic49u2ydFdeKiOw8ah15uoblhNGEhq
	tXFK/tG4dtCf/RYUWjAxbCQMYwkfIjARAR+Rsxpb4CsC9+qSIQC2tvllsSU3bzv64hNkNn3ddwM
	SJj5cISq95NjZpnGgZiD/SSwx1Hv/3nayl7HGW1NelxWiMlIHScmo4NeiA6tS78qaS78=
X-Gm-Gg: AR+sD10lSdl2VCLCq8yyU9jSXXyHbKi7SyqtSi46Lddz+H4IKPYeyLYDhUd67L7dDhD
	5Bm8iWX7mfwq+3nTutq7N7lp3gQtDbNzABObq8aZSxGt2FudboA7d9+P2i/n9VLKoimJnTJptUU
	wHlk8s7iQiz19x17R/wfn/kjpoMYx/9/AuLDx/j1WxRIqcaFeaU7YV5EQCL0OIdmYWhT3InyKvx
	7KwvA0QJ2wQ5oI7olOxHdROelVPzKzxvdtTx5Oie9VcQ37ivEsFZpo1ypyh++Gsm644pADZm5eS
	8g2ad0v7sxXIQ/5DyFzj41bNmzAoPwNO6ODNj7K9Ien3Z5+XGbm5PyxSQcQcS7WoVdtgrfhWm9C
	xClowDdz3YxZwm+xUIZ2gAw==
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22277061cf.0.1788338645710;
        Wed, 02 Sep 2026 01:44:05 -0700 (PDT)
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276031cf.0.1788338643648;
        Wed, 02 Sep 2026 01:44:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm673780a12.3.2026.09.02.01.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:44:02 -0700 (PDT)
Message-ID: <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:43:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX1Jh0L72t+9LR
 HE6nvUAyfEWn7YV1gC8Q7yPQV4jU02rxdCdHLtzftCdQ/8M2gS7Hg3qjpVSTT9Cd7ZkK8Z8R+yt
 vOszKAZp35M/uN08B4aCPHwCXYxsfOMwAtydUSF4RfoC9NAR5myrHJTA3OmJpnBCv7ydyrYtjMI
 830M/1HHPFvNCzEGI+lHaYdKsUvarqz1aJK/o/sFW6Ow5zMYSw3iIS7GwlvxfYu9I/VVKmaaYXf
 Ffww0Wpp8xOdWYqJDK8nD9s63MExKHx8PS+k1vTjOemZHtMfuccoAT0CtWPI4VeETN6jJ6a4eZF
 nQ9GFFNtuvsTIRkfGtvJBBOpgSu3YMIByW3T/fpJ6W+d6ei8PCEzCq5r/IyPk6if3RatezkKRn/
 pdMMnIP7vSOYGJTSO0JWsvmG5a8UK2IfsXdhklz56kSLHg//rMxRtFg8QKYnY0SyjLB+9Gd9Elk
 8gcLfKSvbYMEr7Y9fNg==
X-Proofpoint-GUID: uxM0-yFoGCjpeVl4zUM23KMkhDmHhfDJ
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97e1d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=i7MDaAbus5dcvw8aKywA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uxM0-yFoGCjpeVl4zUM23KMkhDmHhfDJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX6azbnw/zRmjP
 TRxZ1VIg2tQXt2rIpH4tjilgKsIRlnGz5I5H6n2uIU6uXl0xwBlvTadajWy3SmzDqAUm0wKH1CE
 tWz+wbsDNN08a3pTpCenR7zZ0oyL4J4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020076

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The TC9563 PCI power-control driver powers off external downstream ports
> whose device tree nodes have status = "disabled".
> 
> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
> powered-off port functions during PCI enumeration raises an Arm SError
> instead of returning an all-ones PCI error response. This prevents the
> board from completing boot.

I agree with the premise of the patch, but I'd like to understand why
that happens - do you have any details?

Konrad
