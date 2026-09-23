Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D7349BD77
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162778; cv=none; b=f0D+sczoMrWTC0IM+s6aVcnhEpkUBVxs+4quy8fD3GMhGu+nnXIs4a23I0i2BtuZQFMDbq4RmzK20FcfokHBLVUK+acXoaDnhmLXIFgOcIB8FWD9Qd0Y3sIkA5w7SaFq5N+hZuLIhtFCok5SfMdNq8t3UPCQFhXjM5rcjx743IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162778; c=relaxed/simple;
	bh=1MCzPuhkOUx0yiCuhAWhyHvppbKmv7dz62NnFmmX68o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHKVkdakwFp1vbuKBCCnwfOpj+jfWZ1kDwC8xQZP+HWYTj9OMd5VD5Y3qh2E2975P5zqSr98mKfnBLOQJgK8I7Ca8q11ymzFm4iUfUtgNrKUT71shAxXuOLGHQN92Ih6fRYtCUIQ2tw8vWqKKYynouPr27jkj1ChLgWTRJ962JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HptVv/Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/jbzqCR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HptVv/Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/jbzqCR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3De62262153
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=HptVv/MmzLlyy6aW
	SWMDsOq9FeecDMFcKgSUvkiXmdZx3LxUnhHOgkV9PLObA5OD5u7aoJc8DrK3qCGp
	1PZd2HLhj9W9950/cYWWaeekldN5+7tV/xRqyNHSVxa07Vcrxs5tCeXwty1fI8MM
	qBb+olSYXpK6Rm6Dh3qfs5mPrDJbNSZbKWSP4MTcDZ27d62mNpOHfUOhf3zEBFSy
	suqaTrw712vgO8ruwiI7BKyRR3PCCpdx4Xt1GwT0tquW9SGBxZH8ikKg8Py8yhD/
	2AGNTLQ2HwcMCnicaq7njhTS9g8R26O5h5z7Y9hoDUEQ7+/9tNtDiJU7bYt9ExS/
	HFBYaA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3rdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:26:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so1046393eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162761; x=1790767561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=O/jbzqCReHpnfiHgSP3671AQDPQRfbW9pji8r4BdWszkKpH3dWbyjH/eXZkthtuTaw
         FS+XVJqhs2b3CIx13+FAmdBEqSlYBQYwJcFXjCWrxJg40S+/tfbJkukyj5TQUBLLDSHO
         Qufd9FWN9IL1q4qufW92IOxq82l+JaNM/JPJwQn06mvaV8GjczQ7EOmu3R56cNj163NO
         RevRBZ2wsQ6zgRCIaJ4yWymB6mNnaw5Vgk4c/uKJXWZ4vrRpANFUALTM9C9mD+tCGlpp
         eO0Rxy9fsGrPlGWa3k/svHdFqbL8xaVsPqNP1Tqo21XI8XHJdCBJ0cEbD1gQUom12gX/
         AFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162761; x=1790767561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=CgvpdXKxuL+XXfevd0PLtxeqW2HYAQeRf/vkP/2H9wGVdPy7dfydh49NLxcv/kt0a3
         U7JAyQKRYOiRxNFSnDD8Sh/6wb5adxi2mxWrZm9B56rNXGwrZEmjfS+ks+v01O/Cs7Zc
         HuBD479OXzUBcDdbLVFOYw27rtPEQosnhkSJL4mgQZBbpVqZ696mrd45jyM1w8rGKug4
         XBAsI5l0N579QJpgOJCg5aG6RP2UqSiU0ERyG0lSZAiTB2cTeiGsHAxj7Q0GrqwUSBcu
         Z2XD5qzJcRri0diEEca1La5WSQGjQqQNZiNAk7jNEIYQZzcRY5mae5WNwmKLeWu9PF0Z
         aOQg==
X-Forwarded-Encrypted: i=1; AKwUvBxZgA6loHr3lu3W6om/N+gR2JxCLwUFSueBUaFzHDOweRtnbBLPnLHggE2JKWdy9tC30zMxn7gdIJ7z9mo=@vger.kernel.org
X-Gm-Message-State: AFuF++lSUa9tSlihQlUe93GVKrpG92Go2gK0TBrnPGVATZ3sDtHVolBu
	naoal5lIZAeP61KDeJvkaZPeRvDgLRm50xzHCWiuE2RvNelgBVX13fMJ9Y84PjN+kS/tAum4v4R
	5Spd75UdzD0zpGSr8hiiidX/yb3jqbWoZ+2iwzM9rirKIFrRDwui79TVSKkyiVuSP9i8=
X-Gm-Gg: AYBFou2ImF9BvaQH0sHreSxp6mUgyUystY4RxH9/aVU4zIdtc7aTFGpndG1ag+Cp44D
	LgwT+QuWPlU1ZWY0RyrYQjJSJ+ArzLa5YdnNn+5k6jtnEaebxKKa6MOdy35kO9nyeOwE1L0k2tk
	Z/16fjbTwYAsTeZQkM9YVdbSlGLdNsFWFQYAiUrEGsWRIIPP9ToRq/Rm71gwFDrk8zf1WTano+u
	qRZQTT/bEkki62i39hZ00a1DjGS89J6m761QwGEmpKGvwA3T4CEJb/q84nuLmkLW5rgBbr0toes
	E8Jj2JN7Ql6TCdXQywfspdQD+YXX3S2OSM92XgzgbaDggjmSHx3Xpf2Jg/AS7+NW9c0CchrTlsM
	tPX1UbzS+apEZjSjJFVQqw7U0nb0TsUk=
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757120c88.37.1790162761182;
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757074c88.37.1790162760586;
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm5682402c88.10.2026.09.23.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Message-ID: <c132d8a6-f845-44bd-b0c9-33b5a99f9759@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:55:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C_hb7wsUwPkO1XqCELAtUXqLjRVXSOy8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX+4O2s8IF+Aeq
 wKtbtYskrtvlv72CtKAPoSprratrkpju9jTWxBXXZHlhC/r9wv6Ke93Pf3sztEQMP2dQ6b3Wq2M
 CNByBE6v8/YNpVJypF17ZN/p1MDNpyc=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b74a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2jq_lC5E59YAp211iCsA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: C_hb7wsUwPkO1XqCELAtUXqLjRVXSOy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX1u0Iw92u4FjF
 8ZBGqwrY6eUDLo93YyiX+HLzhi/BJzH3RhLTweDJ/Iko5hoTh54rI4+BEktwDcNkhbrfEJoIqfb
 b8BLBFQGGgn39bM4k/wmIgxQAB+UdZ7aAJPjXYi/S7ZnqQx4QsEiyu6vSPwdz9Lailfrlfy9ix/
 SJ3ZjT+2Ike7HflEcGEXulmwluSvAnrVCEMiSvdln6X+VTvVv8R5YqIi69F0cQn3wIf5eaxk91R
 N3VPAKI0zxNgY/FN+p5w53u71jjrv1n7twLmGGOKE8RnW9ev/KY9UvIsy8VNGiMVhc0vFu+Sm5K
 3XRQyl4owK2CzrYTZO62cYB8jol8Fu+QHM1iMTCh5c3e7+6OwFst7HyjywcvkaXDzQsQrG37c7u
 IdZNrntjEg3M0WPaLFFLwCfIazYg4X483YwnrCP6wh2FF8a0HskqcZel18gbtVqYZuzxt56tKl1
 CfPUAMtdIBCZUD+TVTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/21/2026 8:36 PM, Ulf Hansson wrote:
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +       struct auxiliary_device *auxdev;
>> +
>> +       auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +                                               "psci-cpuidle-domain", NULL, 0);
>> +       if (!auxdev)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id arm_psci_of_match[] = {
>> +       { .compatible = "arm,psci-1.0" },
>> +       { }
>> +};
>> +
>> +static struct platform_driver arm_psci_driver = {
>> +       .probe = arm_psci_probe,
>> +       .driver = {
>> +               .name = "arm-psci",
>> +               .of_match_table = arm_psci_of_match,
>> +               .suppress_bind_attrs = true,
>> +       },
>> +};
>> +
>> +static int __init arm_psci_init(void)
>> +{
>> +       return platform_driver_register(&arm_psci_driver);
>> +}
>> +core_initcall(arm_psci_init);
> I think we should move this to arch_initcall().
> 
> To allow the platform driver to probe, the corresponding device node
> in DT needs to get populated, which happens at arch_initcall_sync().
> 
> That said, to be consistent, we should move the cpuidle-psci-domain.c
> from core_initcall to arch_initcall too.

Ack. Will update it to arch_initcall at both, cpuidle-psci-domain.c and 
here.

thanks,
Shivendra
