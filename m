Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822673;
	b=3eJTtVWfLGUzt1To6/ifAJwjP+yV8ttYt86NXiwv9dNwk7KEQ4BuV3Ee50Nfv3wo3ksJ
	 HqlrOAyHwlityEUBqVkUUX8if7UOLLKV7gv7zyLMLILRK6p0x9lwskTrfFMJ2IM/AjeDA
	 JQSISTpJULptSlEePmb39RRg6jvT2WZp2fa8yeDNGX8WV0WKJL7wasSB5zKiD44WNXLjF
	 wKEZPyHmEoeYXRxKutALd1b2Cv6eAW55RJoMT4QQusOsWy8k8DR7rGeGddqTd3WXmn1R3
	 4vZaDuUKLfTAWFb4hGNOMbts7EqEmLs0VIZh+1fcmTEBg88rf53IYvjn9JZl/xypfag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822673;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7+EiWiz3feVVzZelhpEeXamyojpdVGy724VHtLnzFx4=;
	b=DwqidAUrWCAhlZmhT6vv0pu1dPWa7x3Hy8NDejlcpSehdJrkgyuqXdzo+ceI5E4xwjzb
	 flirZaZPzvdZDoQPUEMEwxQfqagkE4Do5/wJvnhmXDUV8KWmV1+wr9hwvpMU694ZqtLCj
	 odhKr5jmVjuWydRv204144qBnQs9yIByJN4J+sSL+sQc5cul/nHjoO8BUKR73np0nv9O2
	 lFsLfz5rj77CVnloOTNCOL+/2DAkI+BLpTto1koS6cEIrI9rOqwpRFHDGT/maoSRTIya2
	 pnIj9ZRorbXh49gvYJtJ83xXHEPXV2Z+CJ2DfsoIvlo+h0V2flc8E/5DaJiC0c7XltQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="XhRfVf/u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.53
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41629607A962;
	Wed,  4 Nov 2026 20:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41629607A962
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XhRfVf/u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BraHKOtDbwpTxb9Y7/VIxV6LIno2Gp0aJ0O1Kkl6d5CVe+t0Nbtkj3wYz2jpLSIKf6j3IcI/jetSjsX06vE6xOObJShQAyC3UyYSCcZl4g4Nx3boufXTLdskgTixNoLAs/hvC3Z4RcCkihN1E+VwgUAzQG3OJRqlL5BsfMQGucht2dQoEAqO6Is/fltm/2wBpBplenb6O4tms7skW92sLbqGoxcEJrNfclHGoK9/TlBLpQmOZwWKHpWPTDoOJnkiVUindQOwshKgP1X/8x8CdcDkQS+8z59PmyMjIkQScinCt54o1EXQZuWaenMfd1GmrEiGEJuyWu8EPhkSROk2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+EiWiz3feVVzZelhpEeXamyojpdVGy724VHtLnzFx4=;
 b=cQV8ouhvy8guLTZGL2F3zDQgQ51Q4aAaCCL0VnVOfR3ZK/Yv/jJZywOzOXf1tHRFvN5CSSyjweCOsQ0f0qE1yYVV4965UKzLumJvjMZ73/hzjBO8AkCWZbwA9Ry6liIsWgv4C0lTnVqoBs18pwKLCXBMhnEsaO0dJgp5417yLkfidZ8Kn2cX077RpvzL21iqk/NStkD3Cy2Z3pjeirnjrtanmUJg4qQ46dpj8Z0WzhJ1wGfdi1fXP37rui8w08LeTrkWZafrLhhn/Kc+CJlJA0giTm30aDvxdWg2e0laH+vkvhiupPC7hLR/AUvcl/+uU28+1yd9vHBlTvizR0Ol+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+EiWiz3feVVzZelhpEeXamyojpdVGy724VHtLnzFx4=;
 b=XhRfVf/ukRkoVz9deqcEE/IMOKETJCalZ0VeRMYH/IsSurawRwOO/ilvHGm5yAoFOkt6XvcTz76WPE/HlB2UzpCyd917iELhx0SXnNe9OA34gQYudVLYXqaMQVsMl6bdQVif7zZnrPbzqCLYKTQhed7b4Ou1sfBl5/z+AJ4qhwyXZZtSIIvUULIp5rng/GHG3pHIYZ8OQJ4WuHPxDtXLvTwAxCj1izAqQhoHR/sNVvcuxLu9xqxuL5eOnJk8Jg2o8DpeoCHf3RiTvyWC583NhMUCfa5RXskH4FTB7XndMjfqeYREQ7sImUPnI1dGcx2Ixp6nM+/H5lKTLJ8I59fI5w==
Received: from CH0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:b0::24)
 by CH3PR12MB8910.namprd12.prod.outlook.com (2603:10b6:610:179::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 20:04:26 +0000
Received: from BN7PEPF00000091.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::70) by CH0PR03CA0019.outlook.office365.com
 (2603:10b6:610:b0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 20:04:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF00000091.mail.protection.outlook.com (10.167.245.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 20:04:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 12:04:01 -0800
Received: from [10.191.53.38] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 12:03:57 -0800
Message-ID: <c9f66683-7902-4b5c-9f76-c55b1894ce9c@nvidia.com>
Date: Wed, 4 Nov 2026 21:03:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 3/6] firmware: smccc: lfa: Register ACPI
 notification
To: Andre Przywara <andre.przywara@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>
CC: Salman Nabi <salman.nabi@arm.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	<vsethi@nvidia.com>, Varun Wadekar <vwadekar@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-4-andre.przywara@arm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20261102165421.3651202-4-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000091:EE_|CH3PR12MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: 052fd0e5-062f-4edc-71fd-08df3aaed38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|6133799003|22082099003|18002099003|10067099003|3023799007|56012099006|261022115727099003|11063799006|5023799004|4143699003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	7lR99gCBEv0N/IZx6DI5gUnd5UIcQD4QiqHHNSBwU0/ZgsoSNsWYKgBmHL9GC/ylgreZaEv2SUOOJvrpa0CiAuAl5ow+olSe27ABZPa1ccmqLh4yGCOFejHeaRDkWwnqkZpLZBvyJuFT6JFYcSFlKs6RTSFnUu1sOQ1hpQG+XjhVO9rCJisT+yh9BD3dohi8qIF2xktlUAnTSJeLvW+MC75qGFGy3G4dc73xVbdmCz1dYll9Nby0bCyxR4J8xnyR8+TfB83tAcxm79Ju6JhCiUAuFil1DUOzVszL3IgVgvFIEWgqqVNDtIjwm3a9jIJyV/9SI4+ad5Z3bogrVHJEXPQJu2ut+VJFTDKVajdo0Kaa7+syIbHglroanZn6JJluzj0nPQ44e2vvcIyIx8EwfOMI5orlVbmTcKYU8DRBkmRo+45Q0BB546EuXkX06oEzHOJFRSAtTJO4362SbReYvHruTgXyRmPFWeBSA8OzQTjLFRInuWxva82GqjaTOa3NNSJC65kS2BDCMDu0IwIAC+0HMv9OeUwpX0L3sbOuFLM0Aq6goYQOn7XxGJQ8Ydp1QaFkwIhzk0vlEaXqFhaQ6U4Rr0zwVs6BJgWkByFeVfkQXQaTMsA4fBU/i/nvqytl0UIZk0xQqgi6JZywphz1kGrdV7IUuQhmvkVKhcY2WVcriy/oRQBZFthtXQLyplWHTeto+U52cRFjtscPQZH3TQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(56012099006)(261022115727099003)(11063799006)(5023799004)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7jUihncIT7+ls4lBJuKs7hLC+3bzRuG2NBccNWGRSsTMhB8H9zDYQxPIxKliHRkH4rUEuQAjUM2aNJU8NHj/sgZ0/2luHLsbHsiLwWHMfkK3XF3Sn1jfGoijM0FHbKY+zEQJqRuawZ2tnZUxe2x3eZ1F/T5wi5f7BTqwNtKROwS1H9xWWJ+PtljOzu2uyDkurZKVQBwzmML6XE9iZTVuJPyM5GvEBIIwIma+p+ahIXyJ//23y+1U+CXT4ZxvJmLSE+Meyj4HVB/Qz5ymMlq/J81HJ6WSyyn/1yewTURCjpMPDN0PbApuEmNhSlvf47gvW5vwnK0cUXCS93wRjBhMOb2+QIb478HHWfbEfj1rDUbwHD6Ig/SAMadS7q0bYXb8dpHAl8vowVUeINNsnAiLAk/6AiDZ8b6urKTV/Xa8u3JF9CFmiFfF0fkdcTiSe1at
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 20:04:25.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 052fd0e5-062f-4edc-71fd-08df3aaed38d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8910

Hi Andre

On 02.11.26 17:54, Andre Przywara wrote:
> From: Vedashree Vidwans <vvidwans@nvidia.com>
>
> The Arm LFA spec describes an ACPI notification mechanism, where the
> platform (firmware) can notify an LFA client about newly available
> firmware imag updates ("pending images" in LFA terms).
>
> Add a faux device after discovering the existence of an LFA agent via
> the SMCCC discovery mechnism, and use that device to check for the ACPI
> notification description. Register this when one is provided.
>
> The notification just conveys the fact that at least one firmware image
> has now a pending update, it doesn't say which, also there could be more
> than one pending. Loop through all images to find every which needs to
> be activated, and trigger the activation. We need to do this is a loop,
> since an activation might change the number and the status of available
> images.
>
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> [Andre: convert from platform driver to smccc bus]
> Signed-off-by: Andre Przywara <andre.przywar@arm.com>
> ---
>   drivers/firmware/smccc/lfa_fw.c | 154 +++++++++++++++++++++++++++++++-
>   1 file changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index db2a7fe344d5d..4b4daf79611bb 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -33,12 +33,14 @@
>    * skipped by setting the force_cpu_rendezvous sysfs file to false.
>    */
>   
> +#include <linux/acpi.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/arm-smccc-bus.h>
>   #include <linux/array_size.h>
>   #include <linux/delay.h>
>   #include <linux/fs.h>
>   #include <linux/init.h>
> +#include <linux/kernel.h>
>   #include <linux/kobject.h>
>   #include <linux/ktime.h>
>   #include <linux/list.h>
> @@ -49,11 +51,13 @@
>   #include <linux/stop_machine.h>
>   #include <linux/string.h>
>   #include <linux/sysfs.h>
> +#include <linux/types.h>
>   #include <linux/uuid.h>
>   #include <linux/workqueue.h>
>   
>   #include <uapi/linux/psci.h>
>   
> +#define DRIVER_NAME	"ARM_LFA"
>   #undef pr_fmt
>   #define pr_fmt(fmt) "Arm LFA: " fmt
>   
> @@ -753,6 +757,135 @@ static void clean_fw_components_tree(void)
>   	}
>   }
>   
> +/*
> + * Iterate over all FW components and trigger activation of all activatible and
> + * pending components.
> + * Since we would need to re-enumerate the list of all components after a
> + * successful activation, and this could trigger infinite loops if a firmware
> + * component still appears as pending, we create an array of update candidates
> + * first, then activate each one of them.
> + */
> +static void activate_pending_components(void)
> +{
> +	struct fw_component **all_comps;
> +	struct fw_component *comp;
> +	struct kobject *kobj;
> +	int nr_comps = 0;
> +	int ret, i;
> +
> +	down_read(&smc_lock);
> +	spin_lock(&lfa_kset->list_lock);
> +	all_comps = kmalloc_array(list_count_nodes(&lfa_kset->list),
> +				  sizeof(*all_comps), GFP_NOWAIT);
> +	if (!all_comps) {
> +		spin_unlock(&lfa_kset->list_lock);
> +		up_read(&smc_lock);
> +		pr_warn("LFA: automatic activation failed: -ENOMEM\n");
> +		return;
> +	}
> +
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
> +		comp = kobj_to_fw_component(kobj);
> +
> +		if (comp->fw_seq_id == -1)
> +			continue; /* Invalid FW component */
> +
> +		_update_fw_component_pending(comp);
> +		if (comp->activation_capable && comp->activation_pending) {
> +			kobject_get(&comp->kobj);
> +			all_comps[nr_comps++] = comp;
> +		}
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +	up_read(&smc_lock);
> +
> +	for (i = 0; i < nr_comps; i++) {
> +		comp = all_comps[i];
> +
> +		ret = prime_fw_component(comp);
> +		if (ret) {
> +			pr_warn("LFA: LFA_PRIME failed for component %s\n",
> +				kobject_name(&comp->kobj));
> +			kobject_put(&comp->kobj);
> +			continue;
> +		}
> +
> +		ret = activate_fw_component(comp);
> +		if (ret) {
> +			pr_warn("LFA: LFA_ACTIVATE failed for component %s\n",
> +				kobject_name(&comp->kobj));
> +			kobject_put(&comp->kobj);
> +			continue;
> +		}
> +
> +		pr_info("%s: automatic activation succeeded\n",
> +			kobject_name(&comp->kobj));
> +		kobject_put(&comp->kobj);
> +	}
> +
> +	kfree(all_comps);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
> +{
> +	/* The spec explicitly mentions 0x80 only for the update event. */
> +	if (event != 0x80)
> +		return;
> +
> +	activate_pending_components();
> +}
> +
> +static int lfa_register_acpi(struct device *dev)
> +{
> +	struct acpi_device *acpi_dev;
> +	acpi_handle handle;
> +	acpi_status status;
> +
> +	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
> +	if (!acpi_dev)
> +		return -ENODEV;
> +	handle = acpi_device_handle(acpi_dev);
> +	if (!handle) {
> +		acpi_dev_put(acpi_dev);
> +		return -ENODEV;
> +	}
> +
> +	/* Register notify handler that indicates LFA updates are available */
> +	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
> +					     lfa_acpi_notify_handler, NULL);
> +	if (ACPI_FAILURE(status)) {
> +		acpi_dev_put(acpi_dev);
> +		return -EIO;
> +	}
> +
> +	ACPI_COMPANION_SET(dev, acpi_dev);
> +
> +	return 0;
> +}
> +
> +static void lfa_remove_acpi(struct device *dev)
> +{
> +	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
> +	acpi_handle handle = acpi_device_handle(acpi_dev);
> +
> +	if (handle)
> +		acpi_remove_notify_handler(handle,
> +					   ACPI_DEVICE_NOTIFY,
> +					   lfa_acpi_notify_handler);
> +	acpi_dev_put(acpi_dev);
> +}
> +#else	/* !CONFIG_ACPI */
> +static int lfa_register_acpi(struct device *dev)
> +{
> +	return -ENODEV;
> +}
> +
> +static void lfa_remove_acpi(struct device *dev)
> +{
> +}
> +#endif
> +
>   static bool lfa_smccc_has_all_functions(void)
>   {
>   	struct arm_smccc_1_2_regs regs = { 0 }, res;
> @@ -813,13 +946,32 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>   	if (err != 0) {
>   		kset_unregister(lfa_kset);
>   		destroy_workqueue(fw_comps_update_wq);
> +		return err;
> +	}
> +
> +	if (!acpi_disabled) {
> +		err = lfa_register_acpi(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA ACPI notification\n");
> +	}
> +
> +	/*
> +	 * An ACPI notification or an interrupt are optional, but we must
> +	 * handle errors that occurred during their setup.
> +	 */
> +	if (err != -ENODEV) {

On successful registration, err is zero, so this condition still 
unregisters the inventory and destroys the workqueue before returning 
success. Should it be:

if (err && err != -ENODEV) {


Regards,

Nirmoy

> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +		return err;
>   	}
>   
> -	return err;
> +	return 0;
>   }
>   
>   static void lfa_smccc_remove(struct arm_smccc_device *sdev)
>   {
> +	if (!acpi_disabled)
> +		lfa_remove_acpi(&sdev->dev);
>   	clean_fw_components_tree();
>   	flush_workqueue(fw_comps_update_wq);
>   	destroy_workqueue(fw_comps_update_wq);
