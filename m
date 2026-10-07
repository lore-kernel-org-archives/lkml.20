Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D9455173
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362715; cv=none; b=iaBtsSQuB2nbH0pfaELrx5Sf1v2g1cVYAm8DN9lEBUzLXL0NAlKpf46inuBNK/UNYeq4CVJOJhwFd0eU/ikmG1gKfmBMljHXPSql7eeMldqeg5ANKL7ZUbmst6td1krr/Jxx/YjRwswsAXy7yhvez7oGlozrCcXU4PWvKiTMIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362715; c=relaxed/simple;
	bh=cwwZ1AvHUGpQ0cX0o0ag7M/FKmG+jLvaiSKvBHQ1LUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WG972uqfsW9rCvpQfonAng5fS7+Iq5l7n7rU7WYBc5x4VgGDBllHxFM3HWfG6cJ+U2u7nyBBHy+xxk3GktZzOaWpMwXOwnFE8wGa9RvPo/kVRu4drBy7tFUvKVtTDdIiV/y5PGeWwZkfrm0zNiAzZoMXhQDaJqdGK6XjUpNH/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P603HSJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeXn2VcX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P603HSJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeXn2VcX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnBV152120
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=; b=P603HSJqg5tlDHMV
	7FUTb+LYuPySuw72yexv1KsqSEtHA0LUNdHqTfAIat8pAvKPdLahK4yxMlggPFKZ
	jWAAlEVa25C3YTlbChMdUug5Y+Wp3CXT4nCvCk3Ml3qt7ii7dY8oDA5jhP8ElDJk
	Ec74g9U6ChKWsr52aIv1OLBU6HWETMdC8nrohr5YoMhQB0Rt2yuVOJEI4L5/TiOP
	3iRypcb9HmmDLWGWpvlkMnObBo5pPufLQSAxlVXzfrdqLGgmYst6hJ4qCErssUia
	SZ/CuhOEN0bCXFlf/hGFhrwLRROKFgW6yXDlDQpD5kgnzf01tmMUPrU8Y9pNj6T2
	3EwAVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719a0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:45:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so642799285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362712; x=1791967512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=;
        b=DeXn2VcXwffyjyfddIMqHOR3E7Zlg3DZet6ZHWI44EhM42BNl8SP6+/onolSYm7Aj2
         Z4d/LqkZ2ccI+7vnic9F6zqRHNXb3JSrZYF6suU+poU8sVrTV0QVLCPX6zsptGQAceEW
         fFJjB91R+pMG/w/oiZSJAYAmve87ddNrbZs6051pvK7kRDpTwAsfcpXo99iRXjTjvz+J
         IWpHxblSbT+88s1rXMEGdd6EcKdp3GQQOaobM1FPJSiuqou+0mqJRfOvWefMYHP5br2c
         RNHKNJhh4KL0sZr4H6tTKMPut76hih9Zix7zO2Vgq/Tmh+FMapSJd4T7BbRIT5CHVfZp
         SeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362712; x=1791967512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofN0xqNd1KAV8nhkxjJDPKF7aC74Hh9gM7raBNbLz50=;
        b=ZMnh4DUUnd6NRj6OT4X61mY17cEBMjLHNupUZNzaaiJs+hfBLwC5YXXQtf/DAIT2dH
         kMb3H4idcY3Yv5QyNNa+xb9qgnb6AT+Rl/+y/RQVquWtzI+CHBMBfrnROa7QBcLejqmo
         7BEiPjh9QVlCbtdupmiW4ZkaDSlJHfAEaIHX3YKyM5bYtuUOBwH67KOYEUbLVw2/Penm
         PXBKf/RrzMxhnHE7f9/TinWQ1SayZy/Y7P5P6MprCXbqMMOfBkPrpKtR9meKxJ4XBx1X
         AXPzyqLKYN7crCGsCnJTTcgwql5cW/NnjhqGMwCjEzyGvigcgJnYkXGMZugiWqX89QyT
         yrFw==
X-Forwarded-Encrypted: i=1; AKwUvByKQcKd7VHMSy40BgNO5Ru0a1K6IW+Bj1Gwr6Vnz6fR00Tr5I72UH5ispPRJrAWAV0BepqBkxzWHPvSO2k=@vger.kernel.org
X-Gm-Message-State: AFuF++mIc1vl75wfMB7dFOyDvQEuCjb/tI5QSoLaXTKlKBIe/P58ESIP
	8MiTmH+JKjkoR603I4UrOSOi0EHYikj46a6iB8RMr+7Iz0dMB0MZC6WnohUmYOFSnIXwtjmYqMn
	mAbu6Tny6ABBLKkN7UVqyiBdtk7sO8KgQrA5nMavsbj4wrkvwlrNWXz/p4wk2ImH0Ci4=
X-Gm-Gg: AYBFou2omG/ZmVM/BH7YJRO2wn2s0FY0rawGOBGmhyaL8pDhgQ4CS2s+VQcYhfLwn8C
	+zJ6klwywN37t7X6WQjFjAfs8Hm/fsOGUEoi7E84OsZg6gxc0XpqJP1aniI80SiY7z+kSd5NB9z
	AQqf8RLjO4ebpvts8Mhk2HoT9veP7vlYE7vCk1Bk99XSEP0j5ySiM2WEFZFVARc6OdgIbIp8xtk
	yI8XPN8kPvlioC3QToz6iSrkwLufTyFa0sa0/tLgvkIQBTlxUDmSqrdRqHN6L5qdUvkal2bTx84
	EBWeRhZB4LsUqqtbrqHZtJXJ/MAODuVWJSk5Ee16DXO+bCH5Qw9IX3zJKNcBGlaHkYxECCfu/Wo
	8dd5cXc+bn2ok5YogbWWIfphz6m+ENg+1f3vRT5gr8MT8
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr282566385a.83.1791362712170;
        Wed, 07 Oct 2026 01:45:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr282562285a.83.1791362711696;
        Wed, 07 Oct 2026 01:45:11 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7256434bsm3895171f8f.15.2026.10.07.01.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:45:11 -0700 (PDT)
Message-ID: <5ce48dc0-b8ac-4d6b-9918-8d4af08ce719@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v16 5/6] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Francesco Valla <francesco@valla.it>
References: <20261007-pscrr-framework-v16-0-3642c277bebb@oss.qualcomm.com>
 <20261007-pscrr-framework-v16-5-3642c277bebb@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261007-pscrr-framework-v16-5-3642c277bebb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX/SLohcMbOK+y
 YiRQ/P+r4SRns3KvxHb6xpvOjFlmMKMMrWKhvSUgHQPFugAJeKeJuteIMZEQgnRAckGXgE2AvW9
 9ergD3zN5GzzNmC+UYowrcgWaZ3C3XU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfX4LDWsjQyBrDB
 SzQYPAt3iCOFRR8Kca4YEtphL81Jr/LSm9wtiiNHC749JO3Hs9FUU88DncnXfwXuEfAxn2E/xql
 Ohk0IcqHAmWiCn9xkDAlAUZgqqbhhUP9zEaRa7P8si5r60F5fWCx0VXYk8Au72c+3cBzreoKmHC
 7LOu1+yHiUD6W+n/9lC5FW4lpTKgkPn35YYzmuByX2k8qskGqnAeCXtkN5y4e0Z4eS4hXNtlZXf
 sQAHssVOTWwPpyiEmc2aefLvDme2PHgwqdVw7KFatCU+3wR80YkoYFg3IPZ/6e67w5D98k8Dz5h
 kN+0qjKH94+4cMQEiORpgROvQ46jtmueyhVRf2aItCsQoDL+T1inJtUpaA+17y10gOcZGaXpZef
 YOwByCYNwgqW6FS26fGXlBOcdWYCmMBRZNxlUEiTz09/mPlsufbmmshmShoRNuoCMhXOXiyvGPz
 XVigWt/U4Rka5QOAzHw==
X-Proofpoint-GUID: _tu9YLYQ0GyiLpC_DiMu5ItXPxkfKQeP
X-Proofpoint-ORIG-GUID: _tu9YLYQ0GyiLpC_DiMu5ItXPxkfKQeP
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60699 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ESGm2P_6vxgoHrSgdVYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070034

On 10/7/26 09:06, Faruque Ansari wrote:
> Introduce the Power State Change Reasons Recording (PSCRR) framework: a
> generic mechanism to record why the last power state change (shutdown or
> reboot) happened - under-voltage, thermal, watchdog, software-triggered,
> etc. - so a postmortem reason survives a reboot or an abrupt power loss.
> 
> PSCRR is built around providers. A provider is either a hardware reason
> source (a PMIC, SoC reset controller or watchdog exposing a reset cause)
> or a recorder that persists the reason across a power cycle (an NVMEM or
> RTC scratch cell). Each provider gets a directory under
> /sys/kernel/pscrr/providerN/ exposing its name, backing device, the set
> of observed reasons (as tokens), its capabilities, the reasons it
> supports and - for recorders - a record policy. The reason set is
> deliberately not collapsed to a single winning cause, since resets are
> often multi-causal.
> 
> Reasons are the numeric enum psc_reason values from reboot.h, shared with
> the POWER_ON_REASON_* vocabulary, so they store compactly in small
> battery-backed cells. The current reason (get/set_psc_reason(), set by
> the thermal/regulator/hw_protection paths) is written to every recorder
> from the reboot notifier.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reported-by: Francesco Valla <francesco@valla.it>
> Closes: https://lore.kernel.org/all/178749889134.204450.5740187753642158305.b4-review@b4/
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
