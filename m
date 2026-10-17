Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB9391512;
	Sat, 17 Oct 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251712; cv=fail; b=UmF3xnAKzICLu3tsYT+2wk41duJwAZfI3cpJcArN9AWK6hAWRoYbdNzngsPJ4lTEM1DUA9/Zq2mlniuou8sGrgRGFdx3/wqEST3zSWknDpO5NKuNYfShikZMzkUm08VoVuAJkKLzaV3y1zZmjUZUzf02EeIerkAy7fXCIIwt3cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251712; c=relaxed/simple;
	bh=YjoKx24ksD3xbZ/BCeehfV9eYTP48MUqObIf2DHU310=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GwM8ZC4g4m4yva2/7SXMuPsOaER70BdoHX8IYaJ/p9b6pqjHm+GsBYILDdjzw9MfiF0OtEuXovBpmWD1+dP3xFD6H6AsBBCqnv3u3BH01ZbU/LGO+B1huS1P+2S4kLmJu6TWVhY6gsmA7FCabyffoKlD7D1dLZb1u0dQP4NnHm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nsbbi8NF; arc=fail smtp.client-ip=40.93.198.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nsbbi8NF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdjI6Bpxe3TC9JlR5xO72UzDbQq4S2Yuj7Wnwu1wBqpp+bJHp0TQtMWGATS1lGi5ZS0A1MZ4UYtnK+5tycf+550ttrLS+0WdNrVGZzThZDZmku2DvsHLrG+fvi+q0j1OmXGkDuGTkjoEgS7nQZmRPbiRLYl6KN+sDJGkJHZDKDjEFXUlUGEjPqgXXLg2owWpicE47/FAQZD3LppFaHP8DzTZ51HO/WexL/L0lM3H2uWV2+qtdKdkjj9wTf85OBIMhsuZWEMuU4S4fGd8y1uZnXa7R8CE5cpANfYqdrZJxbyDDwXsQJUW1Jez3rchzK1TNOW0AI+da4MR5BcfktBtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPP83oflTkf2J3B6nJZ6ToC+Y8kL/Jcx0UDZS6Dcw24=;
 b=OX29jg7I5+zD5tTM0eKH/eknX3adcGVGZdTGdY3OkwwHCYyZ1S6+Pwa46hP3xvjvYMjdXNnUFFP6mHvW+tWE0xmOGkwX7UQWpNszvRxn3D/KSLDhYoMruUmH2JZ6P/dTP999Oqdu8UzaSBFbVxGGXdUczYntWY0LBdMZodBsxC+aGhCAgo4CLS1dNNGON3ysjQA+JayTRDxU2kgXz/1uM0mZFKAHRh366GERxUHmErpaXsz8+YYJQzPkrhgBdxuvSBfEAzcCbNhIwdjDXDywb4XV4nQ43aa6IYAC3GtiK06d0nFC9Y/J/iM5z7U8TKktzL06FsdNoEKHib1Y+Mv0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPP83oflTkf2J3B6nJZ6ToC+Y8kL/Jcx0UDZS6Dcw24=;
 b=Nsbbi8NFDUNG09TAve+nmSUbvqGk0RE1q5Zt2fz3AiCfs8tU3toYZXiasNwi0zoUZJBiAh2Oyqm6EjiDTReqS3lUVL0zNjSC6MqUpUCKOlAcO7332EhQigdZ/jlu+1LQxmkDPd/87Bq4DWdImJHo8rZtDj+XSuRS5GnUcFuWNdU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Sat, 17 Oct 2026 15:41:47 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 15:41:47 +0000
Date: Sat, 17 Oct 2026 11:41:40 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/7] x86/hygon: Add Family 0x18 SMN access
Message-ID: <20261017154140.GF359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-8-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-8-wanglin@open-hieco.net>
X-ClientProxiedBy: BN9PR03CA0738.namprd03.prod.outlook.com
 (2603:10b6:408:110::23) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ac32c2-5a63-4bc5-e533-08df2c652746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Sw5tF2dzNfKqOGa2CM3tEfp4F2LjrN1fz8CatGwwhisuX4zMa09RDsMWUXTaatZ+qMOJ4vgW7+ruX8IPYWHo+BU1b44KAUm5n1J842qSUi+xA20DlHk6lnbDQyWG71DHw3OU87IU/l2pkZq8wq8rADaczHjqbw6InUZof+Bsh13LtQxLay8iAgVXdtTRRAdQAGw77yxjliAH3kM4VhgTdQr6vLouYCABvpAdqZ84k3qzqGnUttUd4hiT9vslk3eTtlvuqmqbk4TwMZccQeKJ1DBl25BnAzVJ63MLYOJ27e643P8Wk8UzhjqINQk8t8VwkPjSX9GVFBX5oePFlp3lUBMUawIhsHVQvpZ2PkcXrNsZZMcke7CjUjC/tc5WmG6ugn1bkN3t3Fss967br/C9NM0NgW5bGKDgzBYbDkH4iG+CQxM35KVNKNzBAtPoDMaHK5rmSGwk+YOZvWXjhg5T0Snx0A2TjPjoqmE4jUEPQ+blRcJUBQUAXq1lrNT7nFkm3YMGYlnKjMGtSUVtOsg2DgExBYWbGa0O1t6vrVVhTXqU17SzvUX7dH3U0VXov2FL2gfo3mWNPzMby/LuqfKumB+vWCTT93oTh5Jo4CuecUe7RdNwmxj/fUBi6x51iFeInlig5cAywpEyjUEaX8fj9Yk1EuWHOHLR8RWCZ1hWb94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWYdc+VRSQ/25229gi9WMgtxDKxC/fWzwkTEWJha5r1Awc+1H6xSxvFGRDc9?=
 =?us-ascii?Q?i+cugi8Tuq3KRI2tdivfddYgT7MqyaBRO8AVRyR1dsWDLtFZXLio8vLc+45B?=
 =?us-ascii?Q?5O5R4TDrF28hw+md98yd029IymMDvCos8e8hdOC3iZ+gykuGi4gT8IpF3nG/?=
 =?us-ascii?Q?WrEZ9ec3zG9bDxiNUGc1Z2qZ2dR1zoVvyHBwCHhyllmyTuODRNk5GfnCbPND?=
 =?us-ascii?Q?zJSaqzynbNYi5KOHefLzoM9pQblhUEu+A9MBg45UKEZ6I8nxqyId7+JG+hVu?=
 =?us-ascii?Q?sX4eFhNPZNTf/IgBlB9db+coqaA6FDKJIAs/NtLg5cBpsfb8wzkeNzA86mci?=
 =?us-ascii?Q?mc7ccjXVWpB/uWLE/bRS7K2uBzuavu249g4dIy6b0kqngh1yQxkBe119m6ct?=
 =?us-ascii?Q?b7XkJddzdMz+rSZXjT0ueS3yDHTDJjpCDWfi3ije9euUAAd0grUwjz/nsJBe?=
 =?us-ascii?Q?L7i+PhcKURSZLWh4wWc38OIwDUoBDXo0AxAV/n6x/9XpZpbhT9A8aGscr2VM?=
 =?us-ascii?Q?pAj/R1AfRsFoJpzOUMjAMnSPXi2FK+oTN65zK7OSOCfd3okFojkh/ELxlFDw?=
 =?us-ascii?Q?Ko8QMEwpzrSXB97YuxKpHpBOzjYDLeMeo5emMlmcJh57bcwdFZ0DyeosHbBR?=
 =?us-ascii?Q?kdhU0dsMZd9/5NhTyUd2WSp7A+ln+90qThi1L5scYw2AP/uvYX8/llQ7lA3M?=
 =?us-ascii?Q?fxzHzDgX0jhP3+Q9onrNIxTNYE9/UApvDAF7eSb7YnbVpXSB9K+FUIdW+iHq?=
 =?us-ascii?Q?ZpSS4s1O6UiVbX7+xzazLMWX0ZWLGXIeW+ATjyDZWW7UocCcuA50x6LSENTs?=
 =?us-ascii?Q?q6Hkz5y/XK39O7IWfc2a40AcS0HxRYehJaYcBxpISTTqgulKWWoyHY4iU9S7?=
 =?us-ascii?Q?0gs+Mm0mlBQWm1zXJeZ3/jQoG2q8HfjswY11R1zoEbwsrnNdGmkNHvBr/wZM?=
 =?us-ascii?Q?i+w+2JLfXy3lxJSb21nvsyhQChvXtnKyMlKUAzcDXJQEjjd/KkhLfWk1WD3R?=
 =?us-ascii?Q?BfhIM808OlNd2pqbktp1TpTs2GSPrvHsxjSkqYvvaJtouzXEYXGoOTyIBYXK?=
 =?us-ascii?Q?tSUbjZgcqFNbF+qLgdIrlO4DiuFrNmzv4FWiRop9STXk+3l0aNfEYCccBSL6?=
 =?us-ascii?Q?Jlcfo17BE/wzblZtwLJ/wgBK3QQeje7mN+sknrEpy40fdylEmUgZz4eD0g94?=
 =?us-ascii?Q?01TRtOLyCdxJQGlwNssSd9m/Cd6kj6hEw6Kui/Z83GZMhjkoi3PwWxyE5rdr?=
 =?us-ascii?Q?o0BdPZmkMVoZ9AqJnE1AYaxkXW1Ol+d1zRWAej2DmqkA6dmbknvAJbdg5wZp?=
 =?us-ascii?Q?AaTFzbGSTsjYfQOkyLkHeJfLysJpng2yDkJorU2kVr5li/zyyRWlhdck3uRc?=
 =?us-ascii?Q?/j1zHiwxLxereFCjPH7m2MQ8NBQjjE0P6RZ0sr7z70LNhMkNxBoBamk0LxN2?=
 =?us-ascii?Q?HrODTuk9Cph9Q4/U6V16Z7OGXPnbAsUhzjkL6rgMa7cJ2EB30BRsImpw7rZg?=
 =?us-ascii?Q?iyXvNlgvZUrzVr9nOOC2WVzq+z0OadpfNwUWbzSX0oI6zRJcvZDH10NXl2pZ?=
 =?us-ascii?Q?Y9aC5Udc0+5KLcHwkfyDFPtZEb0m5ENChBgv6PpAejgWOTCiMjcb6RxxPPpT?=
 =?us-ascii?Q?SfNhY4E17DdriOCH5Sv2VqnkxQixn3BPzU1APS6a65SYnBEk/K9Zl0hgtPjP?=
 =?us-ascii?Q?xzoy7GwpfU9udhEUYlXTxIEtQphZfhmN0Bxgy/l3NYC3OBV8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ac32c2-5a63-4bc5-e533-08df2c652746
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 15:41:47.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flbhoBKR4JWFkOdRpi8bPOjL4iSlGV8Xhn1yHCAZb6J2Qa6ulGqtKJlnqw9/p7IP/OOrlTu8DcqmOBE4QTDHDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699

On Fri, Oct 09, 2026 at 05:01:11PM +0800, Lin Wang wrote:
> All DF nodes in a Hygon socket share one SMN ingress, so SMN accesses
> for a node have to go through a root of the node's socket rather than a
> root per node.
> 
> After DF enumeration, map each DF node to the first root of its socket.
> The root socket ID cannot be read back, so group the roots by socket
> in PCI enumeration order. Hold a reference to every root, reserve its
> config space, and serialize each index/data transaction. Enable SMN
> access only after setup succeeds; on failure the DF node cache remains
> usable without it.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
>  arch/x86/include/asm/hygon/node.h |  36 +++++
>  arch/x86/kernel/hygon_node.c      | 233 +++++++++++++++++++++++++++++-
>  2 files changed, 268 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/hygon/node.h b/arch/x86/include/asm/hygon/node.h
> index 5a0a86e90ea2..321a40d41ed7 100644
> --- a/arch/x86/include/asm/hygon/node.h
> +++ b/arch/x86/include/asm/hygon/node.h
> @@ -96,6 +96,30 @@ struct pci_dev *hygon_node_get_func(u16 node, u8 func);
>   */
>  int hygon_pci_dev_to_df_node(struct pci_dev *pdev);
>  
> +/**
> + * hygon_smn_read() - Read a 32-bit value from a Hygon SMN address
> + * @node: DF node index in [0, hygon_node_num())
> + * @address: SMN address
> + * @value: Output value
> + *
> + * Return: 0 on success, -EINVAL if @value is NULL, -ENODEV if Hygon
> + * SMN is not initialized or @node is out of range, or a negative
> + * errno from the underlying PCI config access.
> + */
> +int __must_check hygon_smn_read(u16 node, u32 address, u32 *value);
> +
> +/**
> + * hygon_smn_write() - Write a 32-bit value to a Hygon SMN address
> + * @node: DF node index in [0, hygon_node_num())
> + * @address: SMN address
> + * @value: Value to write
> + *
> + * Return: 0 on success, -ENODEV if Hygon SMN is not initialized or
> + * @node is out of range, or a negative errno from the underlying
> + * PCI config access.
> + */
> +int __must_check hygon_smn_write(u16 node, u32 address, u32 value);
> +
>  #else /* !CONFIG_HYGON_NODE */
>  
>  static inline u16 hygon_node_num(void)
> @@ -123,6 +147,18 @@ static inline int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
>  	return -ENODEV;
>  }
>  
> +static inline int __must_check hygon_smn_read(u16 node, u32 address,
> +					      u32 *value)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int __must_check hygon_smn_write(u16 node, u32 address,
> +					       u32 value)
> +{
> +	return -ENODEV;
> +}
> +
>  #endif /* CONFIG_HYGON_NODE */
>  
>  #endif /* _ASM_X86_HYGON_NODE_H */
> diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
> index 4d492513a433..b4afa296b4ca 100644
> --- a/arch/x86/kernel/hygon_node.c
> +++ b/arch/x86/kernel/hygon_node.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Hygon Family 0x18 Data Fabric node enumeration
> + * Hygon Family 0x18 Data Fabric node enumeration and SMN access
>   *
>   * A DF instance exposes sibling PCI functions in one slot. Function 3
>   * is the misc device used for enumeration, function 4 is the link
> @@ -17,9 +17,11 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/cpufeature.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/pci_ids.h>
>  #include <linux/processor.h>
> @@ -633,6 +635,231 @@ int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
>  
> +/*
> + * SMN index/data register pair offsets in the host-bridge PCI config
> + * space. Reads and writes to a (node, address) pair are issued as a
> + * two-step transaction: write the SMN address to the index register,
> + * then read or write the value at the data register.
> + */
> +#define SMN_INDEX_OFFSET	0x60
> +#define SMN_DATA_OFFSET		0x64
> +
> +/*
> + * Runtime SMN state.
> + *
> + * The smn_reserved_roots array owns the independent PCI references and
> + * config-space reservations for the lifetime of the built-in node layer. The
> + * smn_roots array contains per-node aliases and is published only after
> + * setup succeeds.
> + */
> +static struct pci_dev	**smn_roots;
> +static struct pci_dev	**smn_reserved_roots;
> +static u16		smn_num_nodes;
> +static DEFINE_MUTEX(smn_mutex);
> +
> +/*
> + * Walk PCI host-bridge devices matching the Hygon vendor. The SMN
> + * index/data registers live in function 0 of each root complex. This
> + * follows pci_get_class() iterator semantics: @root is consumed and the
> + * returned device has an iterator reference. A retained device needs an
> + * independent reference before the iterator advances.
> + */
> +static struct pci_dev * __init get_next_root(struct pci_dev *root)
> +{
> +	while ((root = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, root))) {
> +		if (root->devfn)
> +			continue;
> +		if (root->vendor != PCI_VENDOR_ID_HYGON)
> +			continue;
> +		break;
> +	}
> +	return root;
> +}
> +
> +/* Release each config region before dropping its owning device reference. */
> +static void __init release_reserved_roots(struct pci_dev **roots, u16 count)
> +{
> +	u16 i;
> +
> +	for (i = 0; i < count; i++) {
> +		pci_release_config_region(roots[i], 0, PCI_CFG_SPACE_SIZE);
> +		pci_dev_put(roots[i]);
> +	}
> +}
> +
> +/*
> + * Select one root from each contiguous per-socket enumeration group,
> + * then map every DF node to the root for its socket. The root socket ID
> + * cannot be read back, so the grouping follows PCI enumeration order.
> + *
> + * The smn_reserved_roots array owns the PCI references and config
> + * regions. The smn_roots array contains per-node aliases. Enable SMN
> + * access only after both arrays are complete.
> + */
> +static int __init smn_setup(void)
> +{
> +	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
> +	struct pci_dev **reserved_roots, **roots;
> +	struct pci_dev *root = NULL;
> +	u8 socket_id;
> +	int ret;
> +
> +	num_roots = 0;
> +	while ((root = get_next_root(root)))
> +		num_roots++;
> +
> +	pr_debug("Found %u Hygon SMN root devices\n", num_roots);
> +
> +	if (!num_roots)
> +		return -ENODEV;
> +
> +	num_nodes = df_cache.num_nodes;
> +	if (!num_nodes)
> +		return -ENODEV;
> +
> +	num_sockets = df_cache.num_sockets;
> +	if (!num_sockets)
> +		return -ENODEV;
> +
> +	if (num_roots % num_sockets) {
> +		pr_err("Root count %u not divisible by socket count %u\n",
> +		       num_roots, num_sockets);
> +		return -ENODEV;
> +	}
> +
> +	roots = kzalloc_objs(*roots, num_nodes);
> +	if (!roots)
> +		return -ENOMEM;
> +
> +	reserved_roots = kzalloc_objs(*reserved_roots, num_roots);
> +	if (!reserved_roots) {
> +		kfree(roots);
> +		return -ENOMEM;
> +	}
> +
> +	/* Reserve every root before publishing the node-to-root mapping. */
> +	roots_per_socket = num_roots / num_sockets;
> +	reserved = 0;
> +	while ((root = get_next_root(root))) {
> +		if (reserved >= num_roots) {
> +			ret = -ENODEV;
> +			goto err_release;
> +		}
> +
> +		pci_dbg(root, "Reserving PCI config space\n");
> +
> +		/*
> +		 * Mark the entire PCI config space kernel-exclusive because it
> +		 * contains the SMN index/data registers.
> +		 */
> +		if (!pci_request_config_region_exclusive(root, 0,
> +							 PCI_CFG_SPACE_SIZE,
> +							 NULL)) {
> +			pci_err(root, "Failed to reserve config space\n");
> +			ret = -EEXIST;
> +			goto err_release;
> +		}
> +
> +		reserved_roots[reserved++] = pci_dev_get(root);
> +	}
> +
> +	if (reserved != num_roots) {
> +		pr_err("Root enumeration changed: expected %u roots, got %u\n",
> +		       num_roots, reserved);
> +		ret = -ENODEV;
> +		goto err_release;
> +	}
> +
> +	for (node = 0; node < num_nodes; node++) {
> +		socket_id = df_cache.nodes[node].socket_id;
> +
> +		if (socket_id >= num_sockets) {
> +			ret = -ENODEV;
> +			goto err_release;
> +		}
> +
> +		roots[node] = reserved_roots[socket_id * roots_per_socket];
> +
> +		pci_dbg(roots[node],
> +			"is root for Hygon node %u (socket %u)\n",
> +			node, socket_id);
> +	}
> +
> +	smn_reserved_roots = reserved_roots;
> +	smn_num_nodes = num_nodes;
> +	smn_roots = roots;
> +	return 0;
> +
> +err_release:
> +	pci_dev_put(root);
> +	release_reserved_roots(reserved_roots, reserved);
> +	kfree(reserved_roots);
> +	kfree(roots);
> +	return ret;
> +}
> +
> +/*
> + * Serialize the PCI index/data pair between in-kernel SMN users.
> + * The access sequence follows amd_smn_read() and amd_smn_write().
> + * The Hygon node-to-root mapping comes from smn_setup().
> + */
> +static int smn_rw(u16 node, u32 address, u32 *value, bool write)
> +{
> +	struct pci_dev *root;
> +	int err;
> +
> +	if (!smn_roots || node >= smn_num_nodes)
> +		return -ENODEV;
> +
> +	root = smn_roots[node];
> +	if (!root)
> +		return -ENODEV;
> +
> +	guard(mutex)(&smn_mutex);
> +
> +	err = pci_write_config_dword(root, SMN_INDEX_OFFSET, address);
> +	if (err) {
> +		pr_warn("SMN index write failed (addr 0x%x)\n", address);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	err = write ? pci_write_config_dword(root, SMN_DATA_OFFSET, *value)
> +		    : pci_read_config_dword(root, SMN_DATA_OFFSET, value);
> +
> +	return pcibios_err_to_errno(err);
> +}
> +
> +int hygon_smn_read(u16 node, u32 address, u32 *value)
> +{
> +	int err;
> +
> +	if (!value)
> +		return -EINVAL;
> +
> +	err = smn_rw(node, address, value, false);
> +
> +	/* Clear the output so callers do not consume a stale value. */
> +	if (err) {
> +		*value = 0;
> +		return err;
> +	}
> +
> +	/* Treat the PCI all-ones value as a missing device. */
> +	if (PCI_POSSIBLE_ERROR(*value)) {
> +		*value = 0;
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(hygon_smn_read);
> +
> +int hygon_smn_write(u16 node, u32 address, u32 value)
> +{
> +	return smn_rw(node, address, &value, true);
> +}
> +EXPORT_SYMBOL_GPL(hygon_smn_write);
> +

Same point as before for exported functions.

Overall, looks good to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

