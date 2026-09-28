Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B94EF139
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613372; cv=none; b=Xak/4kObwPbLuRnBIGmEm1ySG0ZfAkEBNAs3l102OG5vUb99FuV/uInnwfU8L6SOofunPFSuYAJumAKvYboDQsrufbH3IjRfCdXEdPrPVvjnM4y77yGps2se0M6qEuQLu/7LfgCyx686004DoAO59ffVSk/vz98U3RXvEeWN8Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613372; c=relaxed/simple;
	bh=5Bse2fT5PEeE2ZVpJ9CgSCLiMtm00Fz6FKnsCeX9VNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgpl08oo5ylFoIufZpmFKcKW+25FFruZ1tory6ptnSf97DtTsK43M9iVPjAfhtYNQpfGUvDLUygcQJ5Qz9TrlLQMxqiRGdqUn+UhO4ecoGonQ5GmMWyIg3ycs8zgmlYdo6QaPcbq69okw9yy+gJnPCCbG3M2jUc220CmFTgL91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm5TY4rB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIngxMCT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm5TY4rB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIngxMCT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe6lv1647296
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS4Zvm2fMkFT1Xejfavg+2iFbRFKudzStoeESSaSE9s=; b=hm5TY4rBy7OOkpHS
	YiUMri0VUXQm0o3osNeLtGi1qQnFIp1M3P5tpcF5VHprtrNUp7DPEqasQ9xahX2c
	9lxat1WEACx5ST4JU6IVAi9P/xQxmbRyjZ+9Tm/nTaVoKpQq5A+NqswPBZsNqAjS
	Z1pfwYgAhDs4VrqZmB2zhD0rtkcB+XuB3hDK+vwkfH05SlKOgZSjmEn0mJieVkG+
	SXENZYROjvp3d6Supu9lbD6cf/6hVPlIFJPUoaSDLLWIAFHqTVjt5x9uj5aXWA/1
	6JMKypsKT+zUio6n0uMyFvsAac6iM+snaGQ/0tgmtzFOM8Q8DbwjbW/DYbPy63VC
	/+6iSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc1rgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:36:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so826686185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613370; x=1791218170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS4Zvm2fMkFT1Xejfavg+2iFbRFKudzStoeESSaSE9s=;
        b=BIngxMCTmAzAnuYMMhHcDXSBrbF6SQkmjmVfbjvGHA0aGvWKzU+l2sUSk08bnNbxzE
         wOdXU3F4lh2PeW0I+IQiVkwzXjyl6NuH2+yX2WAAzj3Qpm5eWQvrd5VtyRBuYTB8RkUo
         psgJKJ7TrftzXFynvxchUPN4mWk29nfsmancCt6T2XSKWuNwsZGoP2bKlGBBi+24KSkm
         W4LBSZouGz0lmpXsSklOnlmgKXubjV5XRvd4DOTNCXMBaSyrg9RQvORRbmK/tg9L0Qk5
         zvf4uIRrJbS0KTktxEHKwSxrYctjfoOFKhs9WCh6bBRt02o9my7xj3Z1Mx3dZWTc/sha
         wc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613370; x=1791218170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS4Zvm2fMkFT1Xejfavg+2iFbRFKudzStoeESSaSE9s=;
        b=iHWDivF9eZPRDgXPKKjKAJOVmh6qh4RvvJtGcvJ+KOede0CO/1H4zwmlQ7DM9wm7fp
         3gVU8cB36ayIlsdhQ5cwak5njRYyRaXPU0zL9M6ikWnyxBE7jCbNguDTZ+iXKsYbbfPo
         7FBIDU1oInnHOWb0CEr9MDf969TRISvJenmo8xPD/blq/FCmK9FW16SZT/OjMzY3/5I/
         Zf0du/uk8Qti50dPUyao2WSSZXYEYDyGFnfx/ogKITMb3KJ6RtIS0MFAKmLDU0+H0qz1
         t71X4a+nIv9UfXAzEvp6PKaehHuWiUmDmbohWSy2SoSLXNdlvn/nSW/Y0xRrACqX525b
         MlrA==
X-Forwarded-Encrypted: i=1; AKwUvBwm7ELtoCZoNc3+8ihF1hn04RYF3GsP9B9nTyV/MotLUMIewbAITfa7pIiwJcQBsKZTr5c8jTTAhoqOUQc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUOILkqFkZ+l0mD4e4pexvh+L0hrHyEScyH12Ce+zF9Y1WZMQs
	5ydxu4a8qo208+zC94ugox9sJ+5KkKErGAwGmMlnCCo35BIihbNrxwN9lH7tcuNpHpo3x6rIsqr
	5sWUMZGxvjraG8Mrt81txOiuJLTwtzkmIg9QGoW6iWk2rWo3vcNtpNNW4+99rA0yL0/E=
X-Gm-Gg: AYBFou3X9YLMYuoy+uRxwsnPfenDN2PRhZgbvlKCY08u3u+Ysm2ygBVMAMNVEOeseKv
	fxzObvVr9P9fARm1lOFZH3Ts4TKeft3EeNEgYY3PG+W5xDuqcBWoHrW1NIRlgOnS5NHMBsW5Fiu
	JNFuLniFmVrHD7noDrEjIqB2tuhbNHWNrchhRPbqg07dMV4nLPSnWHU1w8iKG1EwJ3Tp9cnkjmt
	7jawv35uPfnqdUZMHJDywN0SWuMRtxlMOaA/RO7gOR46H7uxsS8nS5LY8SRBYGHoL4jYz4Td3He
	b20vjzPzRSB9Yyje7t7DZjRNS/WJDyzgecTsFR0icXfmkSLVe+LVRUv2ulGWBAujRkCD1e/0VPt
	NIALdbsU9Bcd5zJv5Ag==
X-Received: by 2002:a05:620a:4625:b0:93c:6ac4:1dde with SMTP id af79cd13be357-93c6ac41f66mr1062098885a.54.1790613369527;
        Mon, 28 Sep 2026 09:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:93c:6ac4:1dde with SMTP id af79cd13be357-93c6ac41f66mr1062091585a.54.1790613368885;
        Mon, 28 Sep 2026 09:36:08 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm3568945e9.8.2026.09.28.09.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:36:07 -0700 (PDT)
Message-ID: <e2c60ddc-b28f-4e49-9d52-590f14f374b5@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:36:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] thermal: rzg3e: Propagate reset assertion failure
 from suspend
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828092123.9707-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260828092123.9707-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba977a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6_r1RUB3d7dz1aBDPoQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cETABctXQlS_4QP0ql3cVEe8-o7HOzH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX0pWzi2cp4lG6
 Ja7NMHsJrKBlwpzIZuQwA/je+Ls4PdY75S/RRPCrGVj+soWWBaTZeF9/T7bN+2c3PV3o2j/DAUS
 5ZmElofh3u+FbGfWq4CaZfIzGTpyu/8JtN5LrVTLQvLgKEUfnnO+HP21teiTgfbycc42kne+bkr
 U9xkW3ZLPmGkfbQ/6l3HivlEZ5X05/mAzRl2IEwWDKQXzxpv8OJY3uac6dyy08CM0g1dItiVX5B
 iD3YRoFffSXFFgsSnThRHO1YMLI15GEMSKLQRbWRB1jJeq49HUSKaB7R2G9hXzq5X/nJ+pDBXfg
 r5JDXjr34SMGrs13rHdo+R377bOQXvG4TeNJOL/GR+J8ug1sDSEvHxZZ/CES/62p484SYeKfi4B
 kvP1PvMzReF3CyHOoRj6CKgzN5SU1hm2P0bbm4ejJJBlK1dUwQsEF6B+jzF1AfFM3Sw9hOs5rcs
 YGvnItSrj5AHOXgdMdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX02BJezqEmgDB
 ScD5hNw8rAuNjZtEcfXArCy0wAnxfpFemejl6uzDnZxzHIiygBC8XrPrCME0XsGyWt9AlVdUY/1
 itOCxvTbMjdrcpn9bBS+YLUq2gsftdw=
X-Proofpoint-ORIG-GUID: cETABctXQlS_4QP0ql3cVEe8-o7HOzH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066

On 8/28/26 11:21, Pengpeng Hou wrote:
> rzg3e_thermal_suspend() powers off an active sensor and then ignores
> failure to assert its reset.  System sleep can therefore continue
> without the clean reset state expected by resume.
> 
> Return the reset error and, when the sensor had been active, try to
> restore power before failing suspend.  This remains an RFC because a
> reset assertion failure can represent partial hardware state and the
> preferred recovery policy needs platform confirmation.
> 
> The issue was identified via static analysis and manually reviewed.
> 
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/thermal/renesas/rzg3e_thermal.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
> index c44f5b8858d0..7686a45341b3 100644
> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -499,15 +499,19 @@ static int rzg3e_thermal_runtime_resume(struct device *dev)
>   static int rzg3e_thermal_suspend(struct device *dev)
>   {
>   	struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
> +	bool active = pm_runtime_active(dev);
> +	int ret;
>   
>   	/* If device is active, power it off */
> -	if (pm_runtime_active(dev))
> +	if (active)
>   		rzg3e_thermal_power_off(priv);
>   
>   	/* Assert reset to ensure clean state after resume */
> -	reset_control_assert(priv->rstc);
> +	ret = reset_control_assert(priv->rstc);
> +	if (ret && active)
> +		rzg3e_thermal_power_on(priv);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int rzg3e_thermal_resume(struct device *dev)

Sounds reasonable

John ?
