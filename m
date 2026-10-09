Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F237F8B3;
	Fri,  9 Oct 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533839; cv=fail; b=DgfZ7wJtGaWo78ivvCcKV0Yxha8/KY0WIpPflMWAcdiYg16bldA2/hYjsGMTuyK7zl7Ov4XuFrS0ILjxBSpWqjD0aI3IlR1MmoxpEIFbB4cVHwNm+M75/ornSNc1kF3OyOarBtEV8hKIFn7NTKeJdfRkld+OaFzjNa76jxVuV9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533839; c=relaxed/simple;
	bh=3QK46FKSsh4EPYwh/+aXuZ9mAwArnsROtfr2+a+LrYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UX4zXHjL19sJ3sLGoHBvbYF0J63rTGQ9N+EOeJraTCp2nB0EgTJnMlha4J2bHlEKu+oC0Np09JNp0MghvXVU2YZCesQZ5jaYZkqFq5bsM6/qmS331UwfeY18laAcboX+L+P0JeDk9L9T33JYS/4zhg8Un2UpxbGman8DzbCbXhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Nij+6Ime; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Nij+6Ime"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLOoVapCOphh2zKty6JgV0F7gPdnqGvsy0Tx6ScdJDmtTVVU9g//40J2BpIlWj4b2vD3/pwkb8UbjeRQq2nb277WCLPEhXkTe963Z9v6YnRfihQYMT6uA8bevBynIWWgwO/OX/vah7LPiNE5Ela/O4LB1EaMxt1ZhS45IbH80GcOYGX1T2xll8kOkOtWRU0MKhuCTeEj3uVdMRJ8WCaPPn+L0g0apK3cwrfdnRdepvGwWZZZbKF6ifz3BHcQZPcG1kmeT2cmuJtqvH2eMFG6B4QdeUgPbRts77Xc4srjuyng0WzFA1gXXQVyQux7MLJCGObrdIS1VgK79+QSwTnT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIY9sXiox0OrWKjcqsAFtnmmXR0CVVY2xRR67G48peU=;
 b=xfLNy75v9X/GYiTo3L0dywteUnLJkOl3THv72stC7zMH1CXUrIQzyXePQnmRDlcMtEEiQk3ClNaYsaQeN14Qu9pBFcXudEI/hFkr3KCi0BQ8XReJGL4gb8ShhI7gtsnyrF1Aext/9cK8SrF4ZXXAxmlVDau1uWOHNeCeumK+MFCb9e/+c4ZGSNzhj/Q9S9niVG3QeznOYMbKmO5eBDLe1jA38URkd8vtOBkEVuE0GPzcKGbVEMC9eV3lburF1XQq4kK5d5x+Tk/szJSN4HGB2GqqT0Y50UCLtQFnXdraDWd2628sVkdPNmR5r57oPUNax1Ern/rz1UjKWfJp/FzuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIY9sXiox0OrWKjcqsAFtnmmXR0CVVY2xRR67G48peU=;
 b=Nij+6ImeRIbf/3ShclYJSC7QIN5TWw8AU5dR+4fzeVQ60yl09OEugRBTbv/CrHxWx6+QJk+PkobIGEXHrMHw0mBXq1wVy3FQEGvJZj+8rSELics06eLGFqeEMUNXjIUXBy76dXj1oBBIJUyvsSSCtoHDqA0Y4QUcpE3fdGVaQepmbiE0nO0OBL8z8yzhof5Hl8YvSPrj8l9odHwu6Qde6SZvtZtqZkyvXNp0uvJ/mcDNr12yABFIqT44MQ7FaF3UQREyPjcSU9yZYonKzLwWmpaYKdyBAu4y1Y4YuYIEnLzX22lYjuiPyeOyo32GLSY/YqJaK6s974yk+O8W94+UKw==
Received: from FR5P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:f3::13)
 by AS2PR10MB6567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 9 Oct
 2026 08:17:08 +0000
Received: from ZR1PEPF0000E6B7.eurprd07.prod.outlook.com
 (2603:10a6:d10:f3:cafe::84) by FR5P281CA0034.outlook.office365.com
 (2603:10a6:d10:f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 08:17:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 08:17:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 9 Oct
 2026 10:23:14 +0200
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 9 Oct
 2026 10:17:07 +0200
Message-ID: <2b17d398-0581-4b15-8c3e-dd87883667c9@foss.st.com>
Date: Fri, 9 Oct 2026 10:17:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
To: <mateusz.nowicki@posteo.net>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
 <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
 <1baaa8cb024104ee6d201d55467f6718@posteo.net>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <1baaa8cb024104ee6d201d55467f6718@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B7:EE_|AS2PR10MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8230fb-f6f7-4808-7620-08df25ddb649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|10067099003|4143699003|11063799006|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LmFNb+ZdSCZ2KHQPWtH0WXQxf/UeCLqTDrSumXoZOPLyMPPyqcRR4ZQU49PswBRIqDrQyxbttLVKLBUlBFhjAUnYg4MtJpC6f9Sr2vrDynobZMIvzUy0TFDQMv8ELwNh1zH/BjWkNts8x6uFRnPGmx5nXjWZnPIGj0bTQ7j38b/2OH/eyKczhzjf8iTVIzx75C5uighXl1ycXQtSHMUoVAYpVlz3UdkqoAS1ziY6l3Qqhoy2aD2GoX5xa0GKogD+09/LM20KnBqUvjgQaxwnplYhw52A5azZSJBz92sMZfaNPeB6inRv/RhmJvEcpyJmUkUxJn8ZNb+h0Y27MfqYME8wzc2M5Egx8ug3/5Hl/OmBAmeOrzIduP3yYCmGznDe/QGVoG5Jjx8xMwn63setsTtlFSXtItmHPFPttN+mM8gwAu+YAViLW4NV808TjY9LXdhR3JwfyGFKgdHYFCqlcSsKSsAqR+0833Ws8ONnnQT1PMvbEnorMSdfjyflYN6X4IwcxLAPRydLqSnU+UpHkwzfwQiAG5sGpjciwJi36pjA4ePVWqTkKyPU1fdLLKOjxSn9KOJS7X+yxStUa2BQ4q9Gx3j4ip0+Nnly1h04V46Y1jiBk609uFHlPyoB5Xk+CZxgn5go5z7H4zlj/yO5dCIP6xZrCvm6nWD69h17VNLVQgJK0UaAn/e6IM/29IhAu7tHrerfieHTnlzruPiG8A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R3xWjYOJO5PtVb+zzvl20i3e8WOmvmCLyQ3cCOvmeliyqxLCDIelg5lJ3QIvq3IouMhfSOEwqVUYbiZFC3ZmT7QdwE/Zx/9uJ/MiKqi7UXa/G7m6Yt2wfOcAEWG4GdoZ6nN25hizTCZ9mvgTN/OkIv+hk0NG3U/ZnOwQwJ77xW6UDW1VY2r931v90FtsFMlNHzSETHmMu0OhwNqLjhUBACALSlOYlGjj23Wmy00kOLKfSRZ9if1b3oFzU4l6dqOcX1UYkudpsmv7mJlq7j9BXYqn0ifaUKRoQcqZB0CMZdq+LdsmUqZJRyCWtGcWwLLzMWZ6I2j6lsGO2bD7aWiUeDHFtRvcQk4jQhd5Xzo9t4ger9SpCN4OnP3ZRxW7ALvNusMSr0Y8yVX89jXC5TScnjMHwK7pK8DPO3lkXsgHOeNlmmhsLozU0RcrUiZ2iq4e
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:17:08.4711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8230fb-f6f7-4808-7620-08df25ddb649
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B7.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6567

Hi,

On 10/8/26 13:43, mateusz.nowicki@posteo.net wrote:
> Hi Patrick,
>
> On 07.10.2026 11:22, Patrick DELAUNAY wrote:
>> For STMicroelectronics boards, the STPMIC always-on regulator are
>> managed on SCMI server side in OP-TEE.
>>
>> So no need to manage this constraint in Linux device tree.
>>
>> This always-on  regulator are exposed only for information or to be
>> used are supply for some IP.
>
> Thanks, that makes sense. OP-TEE keeps these rails on no matter what
> Linux asks for, and the board keeps running fine.
>
> The part I found confusing is what Linux reports. Since nothing in
> Linux uses these regulators, the regulator core turns them off about
> 30 seconds after boot:
>
>    [   31.713597] v1v8: disabling
>    [   31.716454] v3v3: disabling
>
> The SCMI call succeeds, so from then on regulator_summary shows
> vddcore, v1v8 and v3v3 with a use count of 0, as if they were off.
> In reality they are still powered.


I understood the issue, and it was a dilemma for us as well.

For information, these two traces are only temporary on DK boards: v1v8 
and v3v3 will soon

be used by nodes/drivers that are not yet upstreamed, which is why I 
would prefer to drop

the patch.

      Initially, I don't expose these SCMI always-on regulators to Linux 
on DK boards in order

       to avoid these traces.
      However, these power supplies are mandatory for some upcoming 
devices such as

      Bluetooth, Wi-Fi, HDMI, and DSI, so I add them only to prepare 
these patches


To explain the dilemma further: on STMicroelectronics boards, SCMI 
voltage domains are shared by default between Linux and cortex M33 
firmware and the voltage domain state reported to each agent reflects 
the last request, not the actual hardware value.

As a result, a shared regulator is switched off when all users, 
including the agent and OP-TEE itself, no longer use it.

Moreover, in the current SCMI specification, regulators cannot 
dynamically report supported operations in the same way clocks do with 
CLOCK_GET_PERMISSIONS.

The VOLTAGE_CONFIG_SET operation can only indicate a forbidden operation 
by returning SCMI_DENIED, and SCMI regulator drivers then return -EACCES.

However, this is not the current behavior of the SCMI server in OP-TEE 
for always-on regulators, although this may be an improvement to consider.

So, Linux SCMI regulator status does not always reflect the hardware 
state, and this is not only the case for always-on regulators.


>
> With regulator-always-on, what Linux shows matches the hardware.
> Would you still prefer to keep it out of the board DT? If so, I'm
> happy to drop the patch.


At this stage, we can probably live with that, no need to specific 
treatment for v1v8 and v3v3 and you can drop the patch.


>
> Thanks,
> Mateusz


Thanks

Patrick

