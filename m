Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF443B3C6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022894; cv=none; b=hVUJBwItehUQDXseTbuAu8yTty9yzrkd7FspOWhKBo9evy83qmRYw4qDuwx89+QuZ0sf2EKvewbjiH8gbTo1L6gZJkm+/VwT4ysnkZTVEIDFA4OqJhZx7t+xw5GlhzWSohs2xCeQxMvWPeF6BA6fSPfm1P38bqBqRAKFYrXhURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022894; c=relaxed/simple;
	bh=2Hd8i82pMXGkLmg/xsycPwiQ8kpvISkcS/AqPBcXYcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pkxpsqh+DL3EsVK/emoWfAlCV54glegoPWIUe7ROubwYOF1M0c+X0zPBTB68Ru0o/P+/muHvcLmeLyQ2ijwAD2Py3IwCFWc0t6qiQZQ0wcJLK2XFr2lSLzVygHwz8qAYCcMZqfIhXRZBUorkA3+Amos7oWumtMeDlx2eJDxZ9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/AUjyiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEjB3vxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/AUjyiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEjB3vxK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA5Ap827697
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZdHfuwdjZN7VgACi1BNexIfiXk5QxzBJOhh3JpcnpU=; b=k/AUjyiYlYAdESnv
	W3I81mwbC13uZejLLtC0rNYrqph/8vJJM22i1f7wahGYJ379fDnfhmeIv4ax9B88
	nr5R6D7F34bVU8O3dJ9fAaR+exi3ENnQgMIDYW61LgdjEE4jQxtddFcnOYtlxXiS
	r61rWmquu/g/ZvsENaeA/saCix2wjRH8Gy176CXNYzFevORcGmvGmTibB0BtdNJi
	HV7Jd5vWIn5cvl0MUaWst8JtO6mjNFEsMgxoeZ2P+Y3XS55ZE31PWHEHu21jhXom
	5VFRViwFRb2rjbHet4T1cUwSJw8Fcb88CgdpW1iVVG4li3DKDuY0f8uufNcr9WIw
	DepORA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gtxy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:34:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so2764412a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022890; x=1790627690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZdHfuwdjZN7VgACi1BNexIfiXk5QxzBJOhh3JpcnpU=;
        b=gEjB3vxKBIgdLq6uwh/0aqELviZazsEiEem99WL8FDcaMj92D23jsF535iIhC3kfuq
         JXpH7gC3VQmJOeRsJoJLxD/1VvMnSzt4GhO3JwiBap6QyY+iXAVQ/2/kAt0h2MSrsMKa
         cpdZAKV85MzyE/xZI/Wqt3dGdAc0QkJ84rM3vmp9il/bgAuKNhRp979I+SRTAh7SyQHR
         xoNWleMkNeB50G9V8HetijpuEohU3G4TRcmO8G+KQDGX3TUizJZmzlFZhNwcGk0BjDUv
         x/+3qoV3UedgkmaveDGLn4/OdWa5EJKv2u8Zi/VvOn33V79pD7Y+vLExkOg4UTHZkIn+
         WtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022890; x=1790627690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZdHfuwdjZN7VgACi1BNexIfiXk5QxzBJOhh3JpcnpU=;
        b=YHPzUUzF6N4AXsYi2OlvHjKD+p6j5Rf8qgNaiDWpCCxGCOMMjmIo4wWiIndw+ivg0C
         Q9WRcvRe7fSrgElAdx79Rp7IkY++5tgAWt5u2PxMMQqGsN5/0YrjOen8ySxPyw91PWN2
         i/EQs8muiJbqft2JIMFrMxUiAIKOFXLQEanSyr3mPOY6jmFt1bC7YFSMRNqsIZwFGZf2
         2t9JAwOBEIGMYdsoiEBp7CJTbv7bLOyAlX8LiHuFiV9WNV5HWt8pOvQGVXesr4pqgqYs
         jTFylXVKiDBWzavQGTQ5TOnFgud0EDIGPOZaRn2HWjAZfdaz7VyEkgN6dE75sGEzQLLC
         nUPA==
X-Forwarded-Encrypted: i=1; AKwUvBx2T+bGb/X/C8Fc8M90+E5/8kn2fVi3fD9hThlzBkDmKW0cXEkNrkeoDL7HSv2Gsi7USEEDIUGFg1n/Gcs=@vger.kernel.org
X-Gm-Message-State: AFuF++neZITOO1v+LKrPHd/BOFJl+Qa8wZnXXV7P+6ZUYO1gBuFCrQLo
	W91Sjl1qwoEe7lSBtXbE1uMLlGYOKTug9RA5YDQBTs229eILLXf7Xih3p03nE90MFoqYDq5Ufu5
	fWtuKCkrR0hOPhnlnqmcTJ1ztiES+qih76MmpQc5WKsEJXW3yrF3MqHGwG5B4kOREEYY=
X-Gm-Gg: AYBFou3IkPDuxjUgctH1n5qkphkJWiS9UIYqpVfku8eFkkHVHaSd3FqLio0pycv+3Q3
	seyYWSkeZgoKn1JfZGBpCpZ+Z2IfBl128qLJkozQ+06dYE0dxkRHPlqI0x9AH3oWaUnF2c1zqXj
	/IUaR3/0/riiy4XegLKqvMFD7kaCe0hg6zwZiVbRGAMKR9E9rSq3xXZNsaoYrF/LVDm7QxFH4fR
	CQY+eZOwiRhymD7eXB/fwg1nxeno+iIdVNyWynb6ZFRlgmfRKccDg5KLXNnUq7UhjLdh3OOlhyg
	AhA90s2axLDWEezjFXgiYPJ3idGh9sv9nPOP//K9BY17aJ55zO+9RCM7H5Jexn21z2+4PbOcVd4
	G8iBThDIvzpW2F6y61qzgl1CoLZJjD4YJzA==
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr102599255ad.55.1790022889361;
        Mon, 21 Sep 2026 13:34:49 -0700 (PDT)
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr102599005ad.55.1790022888566;
        Mon, 21 Sep 2026 13:34:48 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba13b1sm388037eec.7.2026.09.21.13.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:34:47 -0700 (PDT)
Message-ID: <e4e2f5c3-cbb9-4b9e-baee-fac4e33414d7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:04:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <aGQLi9B1687mmzrm@lizhi-Precision-Tower-5810>
 <c1060b7d-a621-4805-8fac-11621b6f564f@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <c1060b7d-a621-4805-8fac-11621b6f564f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7bseQHQG7C2-v4u5fi0Sl6VgyJXFzZd5
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab194ea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gAnH3GRIAAAA:8
 a=2JUeAtQ7TJ56anQguLgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX5Y2OzSv0OLfT
 z2SyPVQbwVDiL7IjZQmdxCsahbTR/59Ua3mX0sD2msafHCohvvVrbyBgy43eIwXaVsutAHxMqBB
 DCOWxVUIBv26UsIRwGM6AA37YS+A8BEG2zpH2juMaK1Inb1f0BFem3dGvCiE4yJOeb6oMbnh6Lm
 Su7rz+pDMSfB4OcqdH/7uVWUQWarXi9hCXFbgV1lqkL21dJ2UrenUXWG85NZE7X0q2Q+Zo7y9bP
 1Aa3vAJXejHbCxOrVIG0bdkVwGCLqvooLzF5Ocs+IK5dk0ebGHrTEA7mdtMndO19xDdJjqwy4Ta
 BQ/tZzMIs7nwUsLkHZ3m9tWdd6jsXaeejmSjw99hWtoKftbc7mZc9wYWtMbPOIsn7Z9lbCtls4B
 mMYl9Y50D75/fFpOm4+L0R89R2qonaGJpPXKZTiKohzcZHvzOacufz6cUASW9FSxUJVFLUhYrAL
 XmEGw/FWL84eIQF15Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX6TZiEI94cuo6
 MAb7XSWO2GmRk9iexnEPPpD0Psc/28Dw03/EPcrBTg/QyhmG2EeeArlE2kPFsntVbEhNsteNMZG
 1ywgXxKmRouV8plIjyEHgtkUjrcgQ2o=
X-Proofpoint-ORIG-GUID: 7bseQHQG7C2-v4u5fi0Sl6VgyJXFzZd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210301

Hi Frank,  Thank you for the review comments.

Please find my responses inline below. I have migrated from my 
@quicinc.com email address to @oss.qualcomm.com and could not locate the 
original email thread.

The replies below are from a draft I had saved earlier. I am sending 
them now from my OSS account after resolving the slave setup and 
validation issues that had delayed the response. I shall upload V7 soon 
cleanly with new oss email ID.

On 3/5/2026 9:12 PM, Mukesh Kumar Savaliya wrote:
> Thanks a lot Frank for valuable suggestions and review comments !
> I am Sorry for the late reply, as i was completely away from this work. 
> I am restarting this from previous point and will continue on this now.
> 
> On 7/1/2025 10:10 PM, Frank Li wrote:
>> On Tue, Jul 01, 2025 at 12:48:51PM +0530, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> ---
>>>   drivers/i3c/master/Kconfig         |   12 +
>>>   drivers/i3c/master/Makefile        |    1 +
>>>   drivers/i3c/master/i3c-qcom-geni.c | 1158 ++++++++++++++++++++++++++++
>>>   3 files changed, 1171 insertions(+)
>>>   create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
>>>
>>> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
>>> index 7b30db3253af..3e062d4b8f85 100644
>>> --- a/drivers/i3c/master/Kconfig
>>> +++ b/drivers/i3c/master/Kconfig
>>> @@ -41,6 +41,18 @@ config SVC_I3C_MASTER
>>>       help
>>>         Support for Silvaco I3C Dual-Role Master Controller.
>>>
>>> +config I3C_QCOM_GENI
>>> +    tristate "Qualcomm Technologies Inc.'s I3C controller driver"
>>> +    depends on QCOM_GENI_SE
>>> +    help
>>> +      This driver supports QUPV3 GENI based I3C controller in master
>>> +      mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
>>> +      this option, support will be included for the built-in I3C 
>>> interface
>>> +      on the Qualcomm Technologies Inc.s SoCs.
>>> +
>>> +      This driver can also be built as a module.  If so, the module
>>> +      will be called i3c-qcom-geni.
>>> +
>>>   config MIPI_I3C_HCI
>>>       tristate "MIPI I3C Host Controller Interface driver 
>>> (EXPERIMENTAL)"
>>>       depends on HAS_IOMEM
>>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>>> index 3e97960160bc..0e3ad9d96424 100644
>>> --- a/drivers/i3c/master/Makefile
>>> +++ b/drivers/i3c/master/Makefile
>>> @@ -1,5 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   obj-$(CONFIG_CDNS_I3C_MASTER)        += i3c-master-cdns.o
>>> +obj-$(CONFIG_I3C_QCOM_GENI)        += i3c-qcom-geni.o
>>>   obj-$(CONFIG_DW_I3C_MASTER)        += dw-i3c-master.o
>>>   obj-$(CONFIG_AST2600_I3C_MASTER)    += ast2600-i3c-master.o
>>>   obj-$(CONFIG_SVC_I3C_MASTER)        += svc-i3c-master.o
>>> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/ 
>>> i3c-qcom-geni.c
>>> new file mode 100644
>>> index 000000000000..c8bb40cdaaf4
>>> --- /dev/null
>>> +++ b/drivers/i3c/master/i3c-qcom-geni.c
>>> @@ -0,0 +1,1158 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + *
>>> + * Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> + */
>>> +
>>> +#include <linux/bits.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/err.h>
>>> +#include <linux/i3c/master.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/soc/qcom/geni-se.h>
>>> +#include <linux/units.h>
>>> +
>>> +#define SE_I3C_SCL_HIGH                 0x268
>>> +#define SE_I3C_TX_TRANS_LEN             0x26c
>>> +#define SE_I3C_RX_TRANS_LEN             0x270
>>> +#define SE_I3C_DELAY_COUNTER            0x274
>>> +#define SE_I2C_SCL_COUNTERS             0x278
>>> +#define SE_I3C_SCL_CYCLE                0x27c
>>> +#define SE_GENI_HW_IRQ_EN               0x920
>>> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
>>> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
>>> +
>>> +/* HW I3C IBI interrupt enable */
>>> +#define M_IBI_IRQ_EN            BIT(0)
>>> +
>>> +/* M_IBI_IRQ_IGNORE */
>>> +#define M_IBI_IRQ_IGNORE        BIT(0)
>>> +
>>> +/* SE_GENI_M_CLK_CFG field shifts */
>>> +#define    CLK_DIV_VALUE_MASK        GENMASK(23, 4)
>>> +#define SER_CLK_EN            BIT(0)
>>> +
>>> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
>>> +#define M_IBI_IRQ_PARAM_7E        BIT(0)
>>> +#define M_IBI_IRQ_PARAM_STOP_STALL    BIT(1)
>>> +
>>> +/* SE_I2C_SCL_COUNTERS field shifts */
>>> +#define I2C_SCL_HIGH_COUNTER_MASK    GENMASK(29, 20)
>>> +#define I2C_SCL_LOW_COUNTER_MASK    GENMASK(19, 10)
>>> +#define I2C_SCL_CYCLE_COUNTER_MASK    GENMASK(9, 0)
>>> +
>>> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | 
>>> M_CMD_FAILURE_EN |\
>>> +    M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
>>> +    M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>>> +
>>> +/* M_CMD OP codes for I2C/I3C */
>>> +#define I3C_READ_IBI_HW          0
>>> +#define I2C_WRITE                1
>>> +#define I2C_READ                 2
>>> +#define I2C_WRITE_READ           3
>>> +#define I2C_ADDR_ONLY            4
>>> +#define I3C_INBAND_RESET         5
>>> +#define I2C_BUS_CLEAR            6
>>> +#define I2C_STOP_ON_BUS          7
>>> +#define I3C_HDR_DDR_EXIT         8
>>> +#define I3C_PRIVATE_WRITE        9
>>> +#define I3C_PRIVATE_READ         10
>>> +#define I3C_HDR_DDR_WRITE        11
>>> +#define I3C_HDR_DDR_READ         12
>>> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
>>> +#define I3C_BCAST_CCC_ADDR_ONLY  14
>>> +#define I3C_READ_IBI             15
>>> +#define I3C_BCAST_CCC_WRITE      16
>>> +#define I3C_DIRECT_CCC_WRITE     17
>>> +#define I3C_DIRECT_CCC_READ      18
>>> +
>>> +/* M_CMD params for I3C */
>>> +#define PRE_CMD_DELAY        BIT(0)
>>> +#define TIMESTAMP_BEFORE    BIT(1)
>>> +#define STOP_STRETCH        BIT(2)
>>> +#define TIMESTAMP_AFTER        BIT(3)
>>> +#define POST_COMMAND_DELAY    BIT(4)
>>> +#define IGNORE_ADD_NACK        BIT(6)
>>> +#define READ_FINISHED_WITH_ACK    BIT(7)
>>> +#define CONTINUOUS_MODE_DAA    BIT(8)
>>> +
>>> +#define SLAVE_ADDR_MASK        GENMASK(15, 9)
>>> +
>>> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
>>> +#define IBI_NACK_TBL_CTRL    BIT(24)
>>> +#define USE_7E            BIT(25)
>>> +#define BYPASS_ADDR_PHASE    BIT(26)
>>> +
>>> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
>>> +#define GP_IRQ0            BIT(5)
>>> +#define GP_IRQ1            BIT(6)
>>> +#define GP_IRQ2            BIT(7)
>>> +#define GP_IRQ3            BIT(8)
>>> +#define GP_IRQ4            BIT(9)
>>> +#define GP_IRQ5            BIT(10)
>>> +#define DM_I3C_CB_ERR        GENMASK(10, 5)
>>> +
>>> +#define I3C_AUTO_SUSPEND_DELAY    250
>>> +#define PACKING_BYTES_PER_WORD    4
>>> +#define XFER_TIMEOUT        250
>>> +#define DFS_INDEX_MAX        7
>>> +
>>> +#define I3C_ADDR_MASK        I2C_MAX_ADDR
>>> +
>>> +enum geni_i3c_err_code {
>>> +    RD_TERM,
>>> +    NACK,
>>> +    CRC_ERR,
>>> +    BUS_PROTO,
>>> +    NACK_7E,
>>> +    NACK_IBI,
>>> +    GENI_OVERRUN,
>>> +    GENI_ILLEGAL_CMD,
>>> +    GENI_ABORT_DONE,
>>> +    GENI_TIMEOUT,
>>> +};
>>> +
>>> +enum i3c_bus_phase {
>>> +    OPEN_DRAIN_MODE  = 0,
>>> +    PUSH_PULL_MODE   = 1
>>> +};
>>
>> Look like it pure software usage enum, so remove "= 0" and "= 1".
>>
> Agreed, Removed.
> 
>>> +
>>> +struct geni_i3c_dev {
>>> +    struct geni_se se;
>>> +    unsigned int tx_wm;
>>> +    int irq;
>>> +    int err;
>>> +    struct i3c_master_controller ctrlr;
>>> +    struct completion done;
>>> +    /* Protects per device CCC command or transfer from 
>>> get_mutex_lock()/unlock() wrapper */
>>> +    struct mutex lock;
>>> +    /* Per device protection between process and IRQ context */
>>> +    spinlock_t irq_lock;
>>> +    u32 clk_src_freq;
>>> +    u8 *cur_buf;
>>> +    bool cur_is_write;
>>> +    int cur_len;
>>> +    int cur_idx;
>>> +    DECLARE_BITMAP(newaddrslots, 64);
>>> +
>>> +    const struct geni_i3c_clk_settings *clk_cfg;
>>> +    const struct geni_i3c_clk_settings *clk_od_cfg;
>>> +};
>>> +
>>> +struct geni_i3c_i2c_dev_data {
>>> +    u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy 
>>> for now */
>>> +};
>>> +
>>> +struct geni_i3c_xfer_params {
>>> +    enum geni_se_xfer_mode mode;
>>> +    u32 m_cmd;
>>> +    u32 m_param;
>>> +};
>>> +
>>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct 
>>> i3c_master_controller
>>> +                            *master)
>>> +{
>>> +    return container_of(master, struct geni_i3c_dev, ctrlr);
>>> +}
>>> +
>>> +struct geni_i3c_clk_settings {
>>> +    u32 clk_freq_out;
>>> +    u32 clk_src_freq;
>>> +    u8  clk_div;
>>> +    u8  i2c_t_high_cnt;
>>> +    u8  i2c_t_low_cnt;
>>> +    u8  i3c_t_high_cnt;
>>> +    u8  i3c_t_cycle_cnt;
>>> +    u8  i2c_t_cycle_cnt;
>>> +};
>>> +
>>> +/*
>>> + * The hardware uses the following formulas to calculate the time 
>>> periods
>>> + * of the SCL clock cycle. The firmware adds a few extra cycles that 
>>> are not
>>> + * included in the formulas below. It has been verified that the 
>>> resulting
>>> + * timings remain within the I2C/I3C specification limits.
>>> + *
>>> + * I2C SCL high period:
>>> + *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
>>> + *
>>> + * I2C SCL low period:
>>> + *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
>>> + *
>>> + * I2C SCL full cycle:
>>> + *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
>>> + *
>>> + * I3C SCL high period:
>>> + *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
>>> + *
>>> + * I3C SCL full cycle:
>>> + *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
>>> + *
>>> + * Output clock frequency:
>>> + *     clk_freq_out = t / t_cycle
>>> + */
>>> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
>>> +    {
>>> +        .clk_freq_out = 100 * HZ_PER_KHZ,
>>> +        .clk_src_freq = 19200 * HZ_PER_KHZ,
>>> +        .clk_div = 1,
>>> +        .i2c_t_high_cnt = 76,
>>> +        .i2c_t_low_cnt = 90,
>>> +        .i3c_t_high_cnt = 7,
>>> +        .i3c_t_cycle_cnt = 8,
>>> +        .i2c_t_cycle_cnt = 192,
>>> +    },
>>> +    {
>>> +        .clk_freq_out = 400 * HZ_PER_KHZ,
>>> +        .clk_src_freq = 19200 * HZ_PER_KHZ,
>>> +        .clk_div = 1,
>>> +        .i2c_t_high_cnt = 12,
>>> +        .i2c_t_low_cnt = 24,
>>> +        .i3c_t_high_cnt = 7,
>>> +        .i3c_t_cycle_cnt = 8,
>>> +        .i2c_t_cycle_cnt = 48
>>> +    },
>>> +    {
>>> +        .clk_freq_out = 1000 * HZ_PER_KHZ,
>>> +        .clk_src_freq = 19200 * HZ_PER_KHZ,
>>> +        .clk_div = 1,
>>> +        .i2c_t_high_cnt = 4,
>>> +        .i2c_t_low_cnt = 9,
>>> +        .i3c_t_high_cnt = 7,
>>> +        .i3c_t_cycle_cnt = 0,
>>> +        .i2c_t_cycle_cnt = 19
>>> +    },
>>> +    {
>>> +        .clk_freq_out = 12500 * HZ_PER_KHZ,
>>> +        .clk_src_freq = 100000 * HZ_PER_KHZ,
>>> +        .clk_div = 1,
>>> +        .i2c_t_high_cnt = 45,
>>> +        .i2c_t_low_cnt = 63,
>>> +        .i3c_t_high_cnt = 6,
>>> +        .i3c_t_cycle_cnt = 7,
>>> +        .i2c_t_cycle_cnt = 110
>>> +    }
>>> +};
>>> +
>>> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
>>> +{
>>> +    const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
>>> +    struct i3c_master_controller *m = &gi3c->ctrlr;
>>> +    struct i3c_bus *bus = i3c_master_get_bus(m);
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
>>
>> surfix "idx" look like a integer. may be "clk_iter" or other name.
>>
> since iterating as an index within clock table, naming it as clk_table_idx.
>>> +        if (clk_idx->clk_freq_out == bus->scl_rate.i3c &&
>>> +            clk_idx->clk_src_freq == gi3c->clk_src_freq)
>>> +            gi3c->clk_cfg = clk_idx;
>>> +
>>> +        if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
>>> +            gi3c->clk_od_cfg = clk_idx;
>>> +    }
>>> +
>>> +    if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static inline void set_new_addr_slot(unsigned long *addrslot, u8 addr)
>>> +{
>>> +    if (addr > I3C_ADDR_MASK)
>>> +        return;
>>> +
>>> +    set_bit(addr, addrslot);
>>> +}
>>> +
>>> +static inline void clear_new_addr_slot(unsigned long *addrslot, u8 
>>> addr)
>>> +{
>>> +    if (addr > I3C_ADDR_MASK)
>>> +        return;
>>> +
>>> +    clear_bit(addr, addrslot);
>>> +}
>>> +
>>> +static inline bool is_new_addr_slot_set(unsigned long *addrslot, u8 
>>> addr)
>>> +{
>>> +    return test_bit(addr, addrslot);
>>> +}
>>
>> These wrap is simple and only use once. I suggest remove these.
>>
> yes, i also had thought of the same but thought with wrapper name, we 
> can maintain against he job he is doing.
> 
> Removed them now.
>>> +
>>> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum 
>>> i3c_bus_phase bus_phase)
>>> +{
>>> +    const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
>>> +    unsigned long freq;
>>> +    u32 val, dfs_idx;
>>> +    int ret;
>>> +
>>> +    if (bus_phase == OPEN_DRAIN_MODE)
>>> +        clk_idx = gi3c->clk_od_cfg;
>>> +
>>> +    ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
>>> +                     &dfs_idx, &freq, false);
>>> +    if (ret)
>>> +        dfs_idx = 0;
>>> +
>>> +    writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
>>> +
>>> +    val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
>>> +    val |= SER_CLK_EN;
>>> +    writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
>>> +
>>> +    val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx- 
>>> >i2c_t_high_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx- 
>>> >i2c_t_low_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx- 
>>> >i2c_t_cycle_cnt);
>>> +    writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
>>> +
>>> +    writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_CYCLE);
>>> +    writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_HIGH);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + 
>>> SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
>>> +
>>> +    val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
>>> +    writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);
>>> +}
>>> +
>>> +static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
>>> +{
>>> +    dev_dbg(gi3c->se.dev, "len:%d, %s\n",
>>> +        gi3c->cur_len, gi3c->cur_is_write ? "write" : "read");
>>> +
>>> +    if (status & M_GP_IRQ_0_EN) {
>>> +        gi3c->err = -EINVAL;
>>> +        dev_dbg(gi3c->se.dev, "I3C slave early read termination\n");
>>> +    }
>>> +
>>> +    if (status & M_GP_IRQ_1_EN) {
>>> +        gi3c->err = -ENOTCONN;
>>> +        dev_dbg(gi3c->se.dev, "NACK: slave unresponsive, check 
>>> power/reset\n");
>>> +    }
>>> +
>>> +    if (status & M_GP_IRQ_2_EN) {
>>> +        gi3c->err = -EINVAL;
>>> +        dev_dbg(gi3c->se.dev, "CRC or parity error\n");
>>> +    }
>>> +
>>> +    if (status & M_GP_IRQ_3_EN) {
>>> +        gi3c->err = -EPROTO;
>>> +        dev_dbg(gi3c->se.dev, "Bus proto Error, noisy/unexpected 
>>> start/stop\n");
>>> +    }
>>> +
>>> +    if (status & M_GP_IRQ_4_EN) {
>>> +        gi3c->err = -EBUSY;
>>> +        dev_dbg(gi3c->se.dev, "NACK on 7E, unexpected protocol 
>>> error\n");
>>> +    }
>>> +
>>> +    if (status & M_GP_IRQ_5_EN) {
>>> +        gi3c->err = -EINVAL;
>>> +        dev_dbg(gi3c->se.dev, "NACK on IBI\n");
>>> +    }
>>> +
>>> +    if (status & M_CMD_OVERRUN_EN) {
>>> +        gi3c->err = -EIO;
>>> +        dev_dbg(gi3c->se.dev, "Cmd overrun, check GENI cmd-state 
>>> machine\n");
>>> +    }
>>> +
>>> +    if (status & M_ILLEGAL_CMD_EN) {
>>> +        gi3c->err = -EILSEQ;
>>> +        dev_dbg(gi3c->se.dev, "Illegal cmd, check GENI cmd-state 
>>> machine\n");
>>> +    }
>>> +
>>> +    if (status & M_CMD_ABORT_EN) {
>>> +        gi3c->err = -ETIMEDOUT;
>>> +        dev_dbg(gi3c->se.dev, "Abort after timeout successful\n");
>>> +    }
>>> +
>>> +    if (status & GENI_TIMEOUT) {
>>> +        gi3c->err = -ETIMEDOUT;
>>> +        dev_dbg(gi3c->se.dev, "I3C transaction timed out\n");
>>> +    }
>>> +}
>>> +
>>> +static irqreturn_t geni_i3c_irq(int irq, void *dev)
>>> +{
>>> +    u32 m_stat_mask, dm_tx_st, dm_rx_st, m_stat, rx_st, dma;
>>> +    struct geni_i3c_dev *gi3c = dev;
>>> +    bool fifo_read_status;
>>> +    unsigned long flags;
>>> +    int j;
>>> +
>>> +    m_stat = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
>>
>> Generally, clear irq status should after read irq status. Dose this
>> register auto clean after read?
>>
> No Frank, it doesn't auto clean after read.
> I have Made the changes to have clean up of IRQ immediately after the 
> status read for both DMA and FIFO mode.
>> what's means of "m_", look like reduntant prefix.
>>
> _M_ meant for primary engine/TX part of GENI (called master), hence 
> register named as prefix with _M_ and same way variable also named with 
> m_. It makes sense because of the actual HW register name.
>>> +    m_stat_mask = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);
>>> +    rx_st = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
>>> +    dm_tx_st = readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
>>> +    dm_rx_st = readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
>>> +    dma = readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
>>> +
>>> +    spin_lock_irqsave(&gi3c->irq_lock, flags);
>>
>> suggest guard(spin_lock)() or scoped_guard(spin_lock, &gi3c->irq_lock).
>>
> Thanks, its good suggestion ! Done.
> 
>> In irq handle, spin_lock is enough.
>>
> Agreed !
> 
>>> +
>>> +    if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
>>> +        geni_i3c_handle_err(gi3c, m_stat);
>>> +        /* Disable the TX Watermark interrupt to stop TX */
>>> +        if (!dma)
>>> +            writel_relaxed(0, gi3c->se.base + 
>>> SE_GENI_TX_WATERMARK_REG);
>>> +        goto irqret;
>>> +    }
>>> +
>>> +    if (dma) {
>>> +        dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", 
>>> dm_tx_st, dm_rx_st);
>>> +        goto irqret;
>>> +    }
>>> +
>>> +    fifo_read_status = m_stat & (M_RX_FIFO_WATERMARK_EN | 
>>> M_RX_FIFO_LAST_EN);
>>> +    if (fifo_read_status && !gi3c->cur_is_write && gi3c->cur_buf) {
>>> +        u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
>>> +
>>> +        for (j = 0; j < rxcnt; j++) {
>>> +            u32 val;
>>> +            int p = 0;
>>> +
>>> +            val = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFOn);
>>> +            while (gi3c->cur_idx < gi3c->cur_len && p < 4) {
>>> +                gi3c->cur_buf[gi3c->cur_idx++] = val & 0xff;
>>> +                val >>= 8;
>>> +                p++;
>>> +            }
>>> +            if (gi3c->cur_idx == gi3c->cur_len)
>>> +                break;
>>> +        }
>>
>> Dose below patch can help your 32bit fifo read?
>> https://lore.kernel.org/linux-i3c/20250624-i3c-writesl-readsl- 
>> v3-0-63ccf0870f01@analog.com/T/#t
>>
> Nice helper function, made changes.
>>> +    } else if (m_stat & M_TX_FIFO_WATERMARK_EN &&
>>> +        gi3c->cur_is_write && gi3c->cur_buf) {
>>> +        for (j = 0; j < gi3c->tx_wm; j++) {
>>> +            u32 temp;
>>> +            u32 val = 0;
>>> +            int p = 0;
>>> +
>>> +            while (gi3c->cur_idx < gi3c->cur_len && p < 4) {
>>> +                temp = gi3c->cur_buf[gi3c->cur_idx++];
>>> +                val |= temp << (p * 8);
>>> +                p++;
>>> +            }
>>
>> the same here.
>>
> yes, Done
>>> +
>>> +            writel_relaxed(val, gi3c->se.base + SE_GENI_TX_FIFOn);
>>> +            if (gi3c->cur_idx == gi3c->cur_len) {
>>> +                writel_relaxed(0, gi3c->se.base + 
>>> SE_GENI_TX_WATERMARK_REG);
>>> +                break;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +irqret:
>>> +    if (m_stat)
>>> +        writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
>>> +
>>> +    if (dma) {
>>> +        if (dm_tx_st)
>>> +            writel_relaxed(dm_tx_st, gi3c->se.base + 
>>> SE_DMA_TX_IRQ_CLR);
>>> +        if (dm_rx_st)
>>> +            writel_relaxed(dm_rx_st, gi3c->se.base + 
>>> SE_DMA_RX_IRQ_CLR);
>>
>> Generally, clr irq should be just after read irq status to avoid wrong
>> clear new irq during you process irq.
>>
> Done the changes.
> 
>>> +    }
>>> +
>>> +    /* if this is err with done-bit not set, handle that through 
>>> timeout. */
>>> +    if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
>>> +        writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>>> +        complete(&gi3c->done);
>>> +    } else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE || 
>>> dm_rx_st & RX_RESET_DONE) {
>>> +        complete(&gi3c->done);
>>> +    }
>>> +
>>> +    spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>> +    __acquires(&gi3c->lock)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_lock(&gi3c->lock);
>>
>> Please use guard(mutex) in parent function to avoid complex. It is not
>> nessary at all.
>>
> Earlier at V3, have added sparse annotations around 
> i3c_geni_runtime_get_mutex_lock()/_unlock(). So will that help ? OR must 
> to have guard(mutex)?
> 
> As removing i3c_geni_runtime_get_mutex_lock()/unlock() and using 
> guard(mutex) will add much more changes, Atleast 4 caller functions and 
> one definition function. I wanted to confirm first on this.
> 
>>> +    reinit_completion(&gi3c->done);
>>> +    ret = pm_runtime_get_sync(gi3c->se.dev);
>>> +    if (ret < 0) {
>>> +        dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", 
>>> ret);
>>> +        pm_runtime_put_noidle(gi3c->se.dev);
>>> +        /* Set device in suspended since resume failed */
>>> +        pm_runtime_set_suspended(gi3c->se.dev);
>>> +        mutex_unlock(&gi3c->lock);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev 
>>> *gi3c)
>>> +    __releases(&gi3c->lock)
>>> +{
>>> +    pm_runtime_mark_last_busy(gi3c->se.dev);
>>> +    pm_runtime_put_autosuspend(gi3c->se.dev);
>>> +    mutex_unlock(&gi3c->lock);
>>> +}
>>> +
>>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>>> +{
>>> +    unsigned long time_remaining;
>>> +    unsigned long flags;
>>> +
>>> +    reinit_completion(&gi3c->done);
>>> +    spin_lock_irqsave(&gi3c->irq_lock, flags);
>>> +    geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>>> +    geni_se_abort_m_cmd(&gi3c->se);
>>> +    spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>> +    time_remaining = wait_for_completion_timeout(&gi3c->done, 
>>> XFER_TIMEOUT);
>>> +    if (!time_remaining)
>>> +        dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
>>> +}
>>> +
>>> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, 
>>> struct geni_i3c_xfer_params *xfer)
>>> +{
>>> +    bool is_write = gi3c->cur_is_write;
>>> +    dma_addr_t tx_dma = 0, rx_dma = 0;
>>> +    unsigned long time_remaining;
>>> +    u32 len = gi3c->cur_len;
>>> +    int ret;
>>> +
>>> +    geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +
>>> +    gi3c->err = 0;
>>> +    gi3c->cur_idx = 0;
>>> +
>>> +    if (is_write) {
>>> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, 
>>> &tx_dma);
>>> +            if (ret) {
>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +
>>> +        if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
>>> +            writel_relaxed(1, gi3c->se.base + 
>>> SE_GENI_TX_WATERMARK_REG);
>>> +    } else {
>>> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, 
>>> &rx_dma);
>>> +            if (ret) {
>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    time_remaining = wait_for_completion_timeout(&gi3c->done, 
>>> XFER_TIMEOUT);
>>> +    if (!time_remaining) {
>>> +        unsigned long flags;
>>> +
>>> +        dev_dbg(gi3c->se.dev, "Timeout completing transfer\n");
>>> +        spin_lock_irqsave(&gi3c->irq_lock, flags);
>>
>> I suggest guard();
>>
> I think we don't need spin_lock here as no event happens during handling 
> of event.
>>> +        geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>>> +        gi3c->cur_buf = NULL;
>>
>> [1]
>>> +        spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>> +        geni_i3c_abort_xfer(gi3c);
>>> +    }
>>> +
>>> +    if (xfer->mode == GENI_SE_DMA) {
>>> +        if (gi3c->err) {
>>> +            if (is_write)
>>> +                writel_relaxed(1, gi3c->se.base + SE_DMA_TX_FSM_RST);
>>> +            else
>>> +                writel_relaxed(1, gi3c->se.base + SE_DMA_RX_FSM_RST);
>>> +
>>> +            time_remaining = wait_for_completion_timeout(&gi3c- 
>>> >done, XFER_TIMEOUT);
>>> +            dev_dbg(gi3c->se.dev, "Timeout completing DMA transfer\n");
>>> +        }
>>> +        geni_se_rx_dma_unprep(&gi3c->se, rx_dma, len);
>>> +        geni_se_tx_dma_unprep(&gi3c->se, tx_dma, len);
>>> +    }
>>> +
>>> +    ret = gi3c->err;
>>> +    if (gi3c->err)
>>> +        dev_err(gi3c->se.dev, "I3C transaction error :%d\n", gi3c- 
>>> >err);
>>> +
>>> +    gi3c->cur_buf = NULL;
>>> +    gi3c->err = 0;
>>
>> why here needn't lock ? but need at [1].
>>
> Removed from [1] also, as we don't need.
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
>>> +                     struct geni_i3c_xfer_params *xfer, u8 *buf, u32 
>>> len)
>>> +{
>>> +    gi3c->cur_is_write = false;
>>> +    gi3c->cur_buf = buf;
>>> +    gi3c->cur_len = len;
>>> +
>>> +    return _i3c_geni_execute_command(gi3c, xfer);
>>> +}
>>> +
>>> +static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
>>> +                      struct geni_i3c_xfer_params *xfer, u8 *buf, 
>>> u32 len)
>>> +{
>>> +    gi3c->cur_is_write = true;
>>> +    gi3c->cur_buf = buf;
>>> +    gi3c->cur_len = len;
>>> +
>>> +    return _i3c_geni_execute_command(gi3c, xfer);
>>> +}
>>> +
>>> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
>>> +{
>>> +    u8 last_dyn_addr = 0;
>>> +    int ret;
>>> +
>>> +    while (1) {
>>> +        u8 rx_buf[8], tx_buf[8];
>>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>>> +        struct i3c_device_info info = { 0 };
>>> +        struct i3c_dev_desc *i3cdev;
>>> +        bool new_device = true;
>>> +        u64 pid;
>>> +        u8 bcr, dcr, addr;
>>
>> keep reverise christmas order.
>>
> Sure, Done.
>>> +
>>> +        xfer.m_cmd = I2C_READ;
>>> +        xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
>>
>> look like only first time need send out address 7E, second devices should
>> needn't send out 7E.
>>
> Yes, done the changes.
> 
>>> +        ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
>>> +        if (ret)
>>> +            break;
>>> +
>>> +        dcr = FIELD_PREP(GENMASK(7, 0), rx_buf[7]);
>>> +        bcr = FIELD_PREP(GENMASK(7, 0), rx_buf[6]);
>>> +        pid = FIELD_PREP(GENMASK(47, 40), (u64)rx_buf[0]) |
>>> +            FIELD_PREP(GENMASK(39, 32), (u64)rx_buf[1]) |
>>> +            FIELD_PREP(GENMASK(31, 24), (u64)rx_buf[2]) |
>>> +            FIELD_PREP(GENMASK(23, 16), (u64)rx_buf[3]) |
>>> +            FIELD_PREP(GENMASK(15, 8), (u64)rx_buf[4]) |
>>> +            FIELD_PREP(GENMASK(7, 0), (u64)rx_buf[5]);
>>> +
>>> +        i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
>>> +            i3c_device_get_info(i3cdev->dev, &info);
>>> +            if (pid == info.pid && dcr == info.dcr && bcr == 
>>> info.bcr) {
>>> +                new_device = false;
>>> +                addr = info.dyn_addr ? : info.static_addr;
>>> +                break;
>>> +            }
>>> +        }
>>
>> why need this? I remember target don't response daa after assign dyamatic
>> address. I have not seen other drivers check this also.
>>
> TBD: Under test, update pending.
>>> +
>>> +        if (new_device) {
>>> +            ret = i3c_master_get_free_addr(&gi3c->ctrlr, 
>>> last_dyn_addr + 1);
>>> +            if (ret < 0)
>>> +                break;
>>> +            addr = (u8)ret;
>>> +            last_dyn_addr = addr;
>>> +            set_new_addr_slot(gi3c->newaddrslots, addr);
>>> +        }
>>> +
>>> +        /* Set Parity bit at BIT(7) */
>>> +        tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
>>> +        tx_buf[0] |= parity8(addr & I3C_ADDR_MASK);
>>> +
>>> +        xfer.m_cmd = I2C_WRITE;
>>> +        xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
>>> +
>>> +        ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +}
>>> +
>>> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller 
>>> *m,
>>> +                    struct i3c_ccc_cmd *cmd)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    int i, ret;
>>> +
>>> +    if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
>>> +        return -EINVAL;
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>>> +    for (i = 0; i < cmd->ndests; i++) {
>>> +        int stall = (i < (cmd->ndests - 1)) ||
>>> +            (cmd->id == I3C_CCC_ENTDAA);
>>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>>> +
>>> +        xfer.m_param  = (stall ? STOP_STRETCH : 0);
>>> +        xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
>>> +        xfer.m_param |= IBI_NACK_TBL_CTRL;
>>> +        if (cmd->id & I3C_CCC_DIRECT) {
>>> +            xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, cmd- 
>>> >dests[i].addr);
>>> +            if (cmd->rnw) {
>>> +                if (i == 0)
>>> +                    xfer.m_cmd = I3C_DIRECT_CCC_READ;
>>> +                else
>>> +                    xfer.m_cmd = I3C_PRIVATE_READ;
>>> +            } else {
>>> +                if (i == 0)
>>> +                    xfer.m_cmd =
>>> +                       (cmd->dests[i].payload.len > 0) ?
>>> +                        I3C_DIRECT_CCC_WRITE :
>>> +                        I3C_DIRECT_CCC_ADDR_ONLY;
>>> +                else
>>> +                    xfer.m_cmd = I3C_PRIVATE_WRITE;
>>> +            }
>>> +        } else {
>>> +            if (cmd->dests[i].payload.len > 0)
>>> +                xfer.m_cmd = I3C_BCAST_CCC_WRITE;
>>> +            else
>>> +                xfer.m_cmd = I3C_BCAST_CCC_ADDR_ONLY;
>>> +        }
>>> +
>>> +        if (i == 0)
>>> +            xfer.m_param |= USE_7E;
>>> +
>>> +        if (cmd->rnw)
>>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer,
>>> +                                cmd->dests[i].payload.data,
>>> +                                cmd->dests[i].payload.len);
>>> +        else
>>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer,
>>> +                                 cmd->dests[i].payload.data,
>>> +                                 cmd->dests[i].payload.len);
>>> +        if (ret)
>>> +            break;
>>> +
>>> +        if (cmd->id == I3C_CCC_ENTDAA)
>>> +            geni_i3c_perform_daa(gi3c);
>>> +    }
>>> +
>>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, 
>>> struct i3c_priv_xfer *xfers,
>>> +                      int nxfers)
>>> +{
>>> +    struct i3c_master_controller *m = i3c_dev_get_master(dev);
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    bool use_7e = false;
>>> +    int i, ret;
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
>>
>> I remember only data phase is push_pull mode. the first address is open
>> drain mode to implement address arbitration for IBI.
>>
> Thats true, we are configuring due to whole transfer.
> TBD: Let me check at waveform level and update on this.
>>> +
>>> +    for (i = 0; i < nxfers; i++) {
>>> +        bool stall = (i < (nxfers - 1));
>>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>>> +
>>> +        xfer.m_param  = (stall ? STOP_STRETCH : 0);
>>> +        xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev- 
>>> >info.dyn_addr);
>>> +        xfer.m_param |= (use_7e) ? USE_7E : 0;
>>> +
>>> +        /* use_7e = true only for last transfer */
>>> +        use_7e = (i == nxfers - 1);
>>> +
>>> +        if (xfers[i].rnw) {
>>> +            xfer.m_cmd = I3C_PRIVATE_READ;
>>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer, (u8 
>>> *)xfers[i].data.in,
>>> +                                xfers[i].len);
>>> +        } else {
>>> +            xfer.m_cmd = I3C_PRIVATE_WRITE;
>>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer, (u8 
>>> *)xfers[i].data.out,
>>> +                                 xfers[i].len);
>>> +        }
>>> +
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +
>>> +    dev_dbg(gi3c->se.dev, "i3c priv: txn ret:%d\n", ret);
>>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, 
>>> struct i2c_msg *msgs, int num)
>>> +{
>>> +    struct i3c_master_controller *m = i2c_dev_get_master(dev);
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    int i, ret;
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
>>
>> i2c should be open drain.
>>
> Done
>>> +
>>> +    for (i = 0; i < num; i++) {
>>> +        struct geni_i3c_xfer_params xfer;
>>> +
>>> +        xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : 
>>> I2C_WRITE;
>>> +        xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
>>> +        xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
>>> +        xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
>>> +        if (msgs[i].flags & I2C_M_RD)
>>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer, 
>>> msgs[i].buf, msgs[i].len);
>>> +        else
>>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer, 
>>> msgs[i].buf, msgs[i].len);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +
>>> +    dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
>>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i2c_dev_set_master_data(dev, data);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
>>> +
>>> +    i2c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i3c_dev_set_master_data(dev, data);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>>> +
>>> +    i3c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>> +static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    u8 addr;
>>> +    int ret;
>>> +
>>> +    ret = i3c_master_entdaa_locked(m);
>>> +    if (ret && ret != I3C_ERROR_M2)
>>> +        return ret;
>>> +
>>> +    for (addr = 0; addr <= I3C_ADDR_MASK; addr++) {
>>> +        if (is_new_addr_slot_set(gi3c->newaddrslots, addr)) {
>>> +            clear_new_addr_slot(gi3c->newaddrslots, addr);
>>> +            i3c_master_add_i3c_dev_locked(m, addr);
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    struct i3c_bus *bus = i3c_master_get_bus(m);
>>> +    struct i3c_device_info info = { };
>>> +    int ret;
>>> +
>>> +    /* Get an address for the master. */
>>> +    ret = i3c_master_get_free_addr(m, 0);
>>> +    if (ret < 0)
>>> +        dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", 
>>> __func__, ret);
>>> +
>>> +    info.dyn_addr = ret;
>>> +    info.dcr = I3C_DCR_GENERIC_DEVICE;
>>> +    info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
>>> +    info.pid = 0;
>>> +
>>> +    ret = geni_i3c_clk_map_idx(gi3c);
>>> +    if (ret) {
>>> +        dev_err(gi3c->se.dev,
>>> +            "Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
>>> +            gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
>>> +        return ret; //This was missed in upstream : TBD
>>> +    }
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>>> +
>>> +    ret = i3c_master_set_info(&gi3c->ctrlr, &info);
>>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static bool geni_i3c_master_supports_ccc_cmd(struct 
>>> i3c_master_controller *m,
>>> +                         const struct i3c_ccc_cmd *cmd)
>>> +{
>>> +    switch (cmd->id) {
>>> +    case I3C_CCC_ENEC(true):
>>> +        fallthrough;
>>> +    case I3C_CCC_ENEC(false):
>>> +        fallthrough;
>>> +    case I3C_CCC_DISEC(true):
>>> +        fallthrough;
>>> +    case I3C_CCC_DISEC(false):
>>> +        fallthrough;
>>> +    case I3C_CCC_ENTAS(0, true):
>>> +        fallthrough;
>>> +    case I3C_CCC_ENTAS(0, false):
>>> +        fallthrough;
>>> +    case I3C_CCC_RSTDAA(true):
>>> +        fallthrough;
>>> +    case I3C_CCC_RSTDAA(false):
>>> +        fallthrough;
>>> +    case I3C_CCC_ENTDAA:
>>> +        fallthrough;
>>> +    case I3C_CCC_SETMWL(true):
>>> +        fallthrough;
>>> +    case I3C_CCC_SETMWL(false):
>>> +        fallthrough;
>>> +    case I3C_CCC_SETMRL(true):
>>> +        fallthrough;
>>> +    case I3C_CCC_SETMRL(false):
>>> +        fallthrough;
>>> +    case I3C_CCC_DEFSLVS:
>>> +        fallthrough;
>>> +    case I3C_CCC_SETDASA:
>>> +        fallthrough;
>>> +    case I3C_CCC_SETNEWDA:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETMWL:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETMRL:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETPID:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETBCR:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETDCR:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETSTATUS:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETACCMST:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETMXDS:
>>> +        fallthrough;
>>> +    case I3C_CCC_GETHDRCAP:
>>> +        return true;
>>> +
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>> +static const struct i3c_master_controller_ops geni_i3c_master_ops = {
>>> +    .bus_init = geni_i3c_master_bus_init,
>>> +    .bus_cleanup = NULL,
>>> +    .do_daa = geni_i3c_master_do_daa,
>>> +    .attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
>>> +    .reattach_i3c_dev = NULL,
>>> +    .detach_i3c_dev = geni_i3c_master_detach_i3c_dev,
>>> +    .attach_i2c_dev = geni_i3c_master_attach_i2c_dev,
>>> +    .detach_i2c_dev = geni_i3c_master_detach_i2c_dev,
>>> +    .supports_ccc_cmd = geni_i3c_master_supports_ccc_cmd,
>>> +    .send_ccc_cmd = geni_i3c_master_send_ccc_cmd,
>>> +    .priv_xfers = geni_i3c_master_priv_xfers,
>>> +    .i2c_xfers = geni_i3c_master_i2c_xfers,
>>> +    .enable_ibi = NULL,
>>> +    .disable_ibi = NULL,
>>> +    .request_ibi = NULL,
>>> +    .free_ibi = NULL,
>>> +    .recycle_ibi_slot = NULL,
>>> +};
>>> +
>>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct 
>>> platform_device *pdev)
>>> +{
>>> +    int ret;
>>> +
>>> +    gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(gi3c->se.base))
>>> +        return PTR_ERR(gi3c->se.base);
>>> +
>>> +    gi3c->se.clk = devm_clk_get(&pdev->dev, NULL);
>>> +    if (IS_ERR(gi3c->se.clk))
>>> +        return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>>> +                            "Unable to get serial engine core clock: 
>>> %pe\n",
>>> +                            gi3c->se.clk);
>>> +    ret = geni_icc_get(&gi3c->se, NULL);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Set the bus quota to a reasonable value for register access */
>>> +    gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>> +    gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>> +    ret = geni_icc_set_bw(&gi3c->se);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Default source clock (se-clock-frequency) freq is 100Mhz */
>>> +    gi3c->clk_src_freq = HZ_PER_MHZ * 100;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int geni_i3c_probe(struct platform_device *pdev)
>>> +{
>>> +    u32 proto, tx_depth, fifo_disable;
>>> +    struct geni_i3c_dev *gi3c;
>>> +    int ret;
>>> +
>>> +    gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
>>> +    if (!gi3c)
>>> +        return -ENOMEM;
>>> +
>>> +    gi3c->se.dev = &pdev->dev;
>>> +    gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>>> +
>>> +    init_completion(&gi3c->done);
>>> +    mutex_init(&gi3c->lock);
>>> +    spin_lock_init(&gi3c->irq_lock);
>>> +    platform_set_drvdata(pdev, gi3c);
>>> +
>>> +    ret = i3c_geni_resources_init(gi3c, pdev);
>>> +    if (ret)
>>> +        return dev_err_probe(&pdev->dev, ret, "Error Initializing 
>>> GENI Resources\n");
>>> +
>>> +    gi3c->irq = platform_get_irq(pdev, 0);
>>> +    if (gi3c->irq < 0)
>>> +        return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting 
>>> IRQ number for I3C\n");
>>> +
>>> +    ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
>>> +                   IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
>>> +    if (ret)
>>> +        return dev_err_probe(&pdev->dev, ret, "Error registering 
>>> core IRQ\n");
>>> +
>>> +    ret = geni_se_resources_on(&gi3c->se);
>>> +    if (ret)
>>> +        return dev_err_probe(&pdev->dev, ret, "Error turning 
>>> resources ON\n");
>>> +
>>> +    proto = geni_se_read_proto(&gi3c->se);
>>> +    if (proto != GENI_SE_I3C) {
>>> +        geni_se_resources_off(&gi3c->se);
>>> +        return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto 
>>> %d\n", proto);
>>> +    }
>>> +
>>> +    fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
>>> +    if (fifo_disable) {
>>> +        geni_se_resources_off(&gi3c->se);
>>> +        return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not 
>>> supported\n");
>>> +    }
>>> +
>>> +    tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
>>> +    gi3c->tx_wm = tx_depth - 1;
>>> +    geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
>>> +    geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, 
>>> PACKING_BYTES_PER_WORD, true, true, true);
>>> +    geni_se_resources_off(&gi3c->se);
>>> +    dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", 
>>> tx_depth);
>>> +
>>> +    pm_runtime_set_suspended(gi3c->se.dev);
>>> +    pm_runtime_set_autosuspend_delay(gi3c->se.dev, 
>>> I3C_AUTO_SUSPEND_DELAY);
>>> +    pm_runtime_use_autosuspend(gi3c->se.dev);
>>> +    pm_runtime_enable(gi3c->se.dev);
>>
>> devm_pm_runtime_enable() should simple below error handle.
>>
> Thanks , Done the changes.
>>> +
>>> +    ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, 
>>> &geni_i3c_master_ops, false);
>>> +    if (ret) {
>>> +        pm_runtime_disable(gi3c->se.dev);
>>> +        pm_runtime_set_suspended(gi3c->se.dev);
>>> +        pm_runtime_dont_use_autosuspend(gi3c->se.dev);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_remove(struct platform_device *pdev)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = platform_get_drvdata(pdev);
>>> +
>>> +    i3c_master_unregister(&gi3c->ctrlr);
>>> +    pm_runtime_disable(gi3c->se.dev);
>>> +    pm_runtime_set_suspended(gi3c->se.dev);
>>> +    pm_runtime_dont_use_autosuspend(gi3c->se.dev);
>>> +}
>>> +
>>> +static int geni_i3c_runtime_suspend(struct device *dev)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>>> +
>>> +    disable_irq(gi3c->irq);
>>
>> why need disable irq? Does your driver support IBI?
>>
> we don't expect transaction interrupt during suspend,  hence i3c 
> controller IRQ is disabled.
> 
> IBI is not supported right now, but in future we plan to add support.
> 
>> Frank
>>> +    geni_se_resources_off(&gi3c->se);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int geni_i3c_runtime_resume(struct device *dev)
>>> +{
>>> +    int ret;
>>> +    struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>>> +
>>> +    ret = geni_se_resources_on(&gi3c->se);
>>> +    if (ret)
>>> +        return ret;
>>> +    enable_irq(gi3c->irq);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops geni_i3c_pm_ops = {
>>> +    SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, 
>>> geni_i3c_runtime_resume, NULL)
>>> +};
>>> +
>>> +static const struct of_device_id geni_i3c_dt_match[] = {
>>> +    { .compatible = "qcom,geni-i3c" },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
>>> +
>>> +static struct platform_driver geni_i3c_master = {
>>> +    .probe  = geni_i3c_probe,
>>> +    .remove = geni_i3c_remove,
>>> +    .driver = {
>>> +        .name = "geni_i3c",
>>> +        .pm = &geni_i3c_pm_ops,
>>> +        .of_match_table = geni_i3c_dt_match,
>>> +    },
>>> +};
>>> +
>>> +module_platform_driver(geni_i3c_master);
>>> +
>>> +MODULE_AUTHOR("Mukesh Kumar Savaliya 
>>> <mukesh.savaliya@oss.qualcomm.com>");
>>> +MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based 
>>> QUP cores");
>>> +MODULE_LICENSE("GPL");
>>> -- 
>>> 2.25.1
>>>
>>
> 

