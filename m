Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020095.outbound.protection.outlook.com [52.101.84.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D232EEE8C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534043; cv=fail; b=ImeM+pEZyR9Wbcj3hxMpOPMaQvC8my6vNYObJV0oR3ZzFIHoa94v1xGl3lUasO/rzUknuN4GvguTTuBAi8EU+ahikfHOM2/D+kMupseMhtT4bJkcHzo9SEzTAbWSim8sgPkj/ZaN2m7xJxNrhje+FDdsYOteiQWSauEfyS+lhY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534043; c=relaxed/simple;
	bh=95o19juwxKYVWzNBq5OwtWV+NaOzTdz2qJ9S7BL4pKc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LUeuQUJhh6RftoIqk7L/MBCRO5lbpPH7863Aeo5IA8RAZSZVwi7C9heVtx+lIyHhA6W+2uCuVNRuz71w6fbhazt6C4mgvsuG08pI10eUAq+u1n9oiBQKxjUR7KeeAkWDRRx+BooBngP5B2NyTyMJs8AFJqEOjQ0wEw7QUCV+9vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=oifXM+Tz; arc=fail smtp.client-ip=52.101.84.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="oifXM+Tz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx0xYLwDfuON5Hql55xA2yFq4jbX/trd1c6ZkuPxzNd/gYrPyTt7AHavEiWMMO/QzMfRqoi+dNTS16su2H1vQ1SKb7pTq6ZeYr7919bicjuh/FlvWutAJvBRrrCAXJh1i80tTkW0qbdDO2He6ubuiAiLwC7j30SVZMFDTgck6SuF+lrfV95mzqwN93lGw4o6MInCuMCmNdlVaMlAA774seOf6RQ/ZoZAuliaHaDk7XFkr7ANUzj4ND8+/LO16xptYZKyvKGMFdxrBUZ74WtKRemh99RKIWoKUqEkUUjAYHQqdbuzEZYj+gtaVpIgo8GmKzyCr8QwvqTLsdqDFtkRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1cG7Zic6fW0U3UIfYqcv+ovPPNcEPaiCSeVWlZ6/Wo=;
 b=UwJJCOJZOoA0GjCHQx+1VFBmnaJU0m92iV6P2XoJEqaR/hMxZx/jMylc5jcl/5XPlyXOImNUi7NLZ9jmbRae/vlHN8egVxnJi0gKZFXHcY7wOgZcpumr4y4JXyELKxBEn9FC+l7UYcqwbf5h+SWpVl4SSLbTBsjcTZ/ZJIER7PWefkUDKP6+QPi3BLysYfR2v+u+f0X9a9NXg7k/AcEovmy2QlUmGE+iJnCyi3kb1K8x2Sb+q1nx6/j0Gw4Rh3UbSuoH+/fMTJ6A+p5CrSYd5Vleaf//1Fx+KqSNUgqGeOx5oPS+M1gShy3SFKSUGTRfJqnRXo+m33i6QtpulhElYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1cG7Zic6fW0U3UIfYqcv+ovPPNcEPaiCSeVWlZ6/Wo=;
 b=oifXM+Tzv1ymIjfRPibHVfa63/IOXsNviJM6Eu/4gJ3K6dPvP9Cy8C8wGpYx/d6g+SyPkHWeymU4hV2a34sTzJYvrembqHGJKN4QtzfyaOlG0TgndFAvvCCj+W9IiNmlXxrMlnzn0IEAC7FoL+uDH0+7c0zFDLDsDe9rOVt5jOBFhNMiv+PBmLShGs+c9NIkJFM5ZGvCIj31VBmgZUzJ1zJOcqUiau6U6/nLS9mtaUFw73qEjKPaQornk9BZC4AYBf5rh0vCdfN6pOiWD4KD01mlo+jPgRvhnf234AEDBC86aIrSRQwv4X+7b3DUVVaFuNKDqh3Rt+nhEIfvr6sWTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB11804.eurprd08.prod.outlook.com
 (2603:10a6:20b:747::14) by PR3PR08MB5803.eurprd08.prod.outlook.com
 (2603:10a6:102:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 18:33:58 +0000
Received: from AM0PR08MB11804.eurprd08.prod.outlook.com
 ([fe80::bf46:f137:f6d2:5b3a]) by AM0PR08MB11804.eurprd08.prod.outlook.com
 ([fe80::bf46:f137:f6d2:5b3a%7]) with mapi id 15.21.0406.002; Sun, 27 Sep 2026
 18:33:58 +0000
Message-ID: <12cfdf66-d37a-41a2-8e2c-4a477ebf0cf9@virtuozzo.com>
Date: Sun, 27 Sep 2026 20:33:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fork: fix active reference underflow on unshare() failure
To: Tao Cui <cui.tao@linux.dev>, Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Michal Grzedzicki <mge@meta.com>,
 Alexey Gladkov <legion@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jan Kara <jack@suse.cz>,
 Tao Cui <cuitao@kylinos.cn>
References: <20260927095450.3017586-1-cui.tao@linux.dev>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260927095450.3017586-1-cui.tao@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::18) To AM0PR08MB11804.eurprd08.prod.outlook.com
 (2603:10a6:20b:747::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB11804:EE_|PR3PR08MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: de7d39b0-4d40-4740-3139-08df1cc5e490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2LwVWTrZH9tb2jeNc1P66LyLIcWj0kttzxdyvw7XFEZLA8pnh6Lwbx9Th4tndY9AyXLW+rR7h9uYphuDbidg+ULB+oqSUV/UdgHABHkWVCt0NT8bGvcOmFe3xTYMJvoLKL2L2+eN7nFqHtw2dbHOYEo10wmRtgKXHVXfiYVASDJcZ2jKyQcUsxnRxsx/NsRksaEBLCASP8xlBGih0sCO+UwIwVHQh34PwW+Ayl8uCDZqLSBW/LfQXfvkoKZpuMCqG+vp0d4e6WzzFLncq1DCrwH0VmGmKbEUxxoPafn4mLbRa3s+PkZOqmnpBJUPa1dJe3Ym8Y3q/BSZeq/4rHZP1xRBjSKy/NqxRj9SLJTcaAG7CbaFogPsjpF6NaCBWy0J+RZk9sYcmYaVQK36yLNriJMoNnbijRjLVcBka+6f46Pa1FMVhyeugm1JRW84YmUue4tjdWtn18y7NwTfS/p3j8T3cLHB7qbl46jHFQwD2SIGFQb9Y7e57ezIiZgDzXgPUFEfJru4NoASRuS4FLMpm9OaLJ9t8Bft3/b28wMffThOklWbSmpFxrEU8i7s/DQmxfNUMZlnONEC8LZQwLNYNnRVCIHEeHSzIZ+trFQZZfihMOeULxDjWRm0cjx9YpfoLJ5jzPmopC1ri+58LkE0gbUOIBj+ZCn1ALRHIaDgF68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11804.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzdLbWVCY0phQnJuUUVwMjZxQzViM1FuN2xJODlSekZiakRpOHVXOUk2QjJ3?=
 =?utf-8?B?cHJZdWhTdTkySm5XQWRzcElST3AzVTZlRnoxdkRjK2VGdDBuWFkxdCtuWEg0?=
 =?utf-8?B?azNOUUgwd1pKZEV6aHAxVURTbnIyMlp4VjlsUHVqZExlc3o4RHMyeGxDUER6?=
 =?utf-8?B?SUR4eXlENzdrTVdsSzAzZmMyVDVlSCtPa2VXREl5VWxLS3F0ZEo5SXJROWpN?=
 =?utf-8?B?RklPcytBU2Rjc2FPN3dSR1R4YytCaU9xOUxIN3BPdTB3bXVxN3dkbms0akpH?=
 =?utf-8?B?T0J1RUgzSjJHSTZYak1HWHBuYTVDRXlsTytRc1Z1WXhWTkRkVkZ0UEZKNVNN?=
 =?utf-8?B?VkpkOUNaSGI0NTJQa0VSTklDOXJsUmVPZ1AyMzNNbTkySW01RnNINzNLczBD?=
 =?utf-8?B?YmZZbzFLcDNNcVEyakFuNmNBWGNXY3NkeUhtMmZMVm9Wd2lnaG5HMjVKVlBQ?=
 =?utf-8?B?QVpYeU0xWUVETTBJU1E3bzF5Yk9Jd25XbHQ0ZGJ0ZVc4QlYzenAybFQzczlD?=
 =?utf-8?B?aWtQbStzMDBNV2ZNbkZjeGV0dFZkMXBqS2JuMUp1R3IxQ01RL1hTdGh6NEF3?=
 =?utf-8?B?T0VVMmxHVHZoTGRwemVoNTRwNlorZ1NGaDd6ZUxpZDR3Z1l2SzdTaXJYN3JC?=
 =?utf-8?B?M3lmWGhtb08zeHJ5NkcxT25LZEh5SWMrYXRvWWlGY1BNMmdDbGZ4L2xnMnlG?=
 =?utf-8?B?UkFkK2dXdXkxTktBMlcrcFBxcDlPdkFOZTZRaDhxdHhQbS9WSkhLaTBsRzc5?=
 =?utf-8?B?VlY0YlNzL09sanFZUHBmenA1dWRHZFJnRVlEVUhGSENyZHZlR1A2VU9qaXkz?=
 =?utf-8?B?dm1OUHlqUGVsVWlqVUJBbEFpcC9uNjZjNitaalljK0RzUFVBRHJvOVNlVFVi?=
 =?utf-8?B?ZVNGeEVmdExWUDMvZGlta2krMTJhTENla0RTUzc2clE3NVdQb0YzUjRTZ2ZF?=
 =?utf-8?B?VXVLdGx5d2I1MFlHenlCV2VLeGtvajE4am5CdXJseVpaUDhhS1AxSzJISERk?=
 =?utf-8?B?V0RUNGhMZFl6ZEh5UnFJTE84M2FhcllkclhxekJKVFlhbWI0aU5renJBWmNF?=
 =?utf-8?B?S2NnL0wreVFzNU03TUpzQU9xSFNyVjBzR1Myc1Vic1NlRm9NSkl5aVNTandU?=
 =?utf-8?B?NjZOaG1mRjl1eE9JOUhSZDFBN3U1dEFoMXo5ODMzdUVndWZKTnBBQjNIdVZ3?=
 =?utf-8?B?Wi9zNGNJK0gycUlDZ2ZoQk5pL3V6Q2FVZk9qUk9zaFdmVURscUZLcVliOW9Q?=
 =?utf-8?B?SGhqd3YwZEJFK0JoWFZqbS9mQzNod2RYZm5xR3l0TVF3dUZjSTQvTVBNS2dX?=
 =?utf-8?B?TmtINUw2TWFvZE5BTDhkUU9mZDdlSXVjeEdCeXdPV2h3WVlwbUxhZ0oreFV0?=
 =?utf-8?B?YnJ1WFc0RHhsNmFaU25Felg3ejdjN3E3M3BPRFNzMTkzQ0xpUWlxaC8rd2JW?=
 =?utf-8?B?TFl5NkxiU21WdXVzZEc0dVVFaU5xVk1nWGVxbmhDWGxDUHFGdE9CakpLVm5m?=
 =?utf-8?B?aDZuT2JTSStta3czUU1uQ2l1cGdzVndycjV1bGgxbWsvOWMzUThFbGpnWXho?=
 =?utf-8?B?K3NOL0RaMmY5SkloQWVOdHdXVWFpcE5GVnZiUVdaUjRNcVRQaGUwZGlkN0lU?=
 =?utf-8?B?TnFEY3BXeEt6RDBydlRDRmZPTUNZRTBBeXpaa0lqVTlROHFnMnUxbkYrMHUy?=
 =?utf-8?B?LzhCRW9rNGdpekZlYk82T0tYbFdpU3Z2LzBLK1IyV1ZQME95Z25Ld1RnNjNv?=
 =?utf-8?B?ZWtIdGxUM0RxakRwQkJkOU15R1JjTEZyQ0gyWUcrd1BQOEI3RnIyUFBEQkRn?=
 =?utf-8?B?M3JMNTE2dkVpdzh1MHNGaUoxV0NOY3h3NGp6ZU8wamI4MGY2Smd1dUk0bDJ2?=
 =?utf-8?B?RjQ5UloxODZaNEN2ZStUcitDZ3RiWmFGUW1ndVpjVWwvRFJoT2h5WUVIdWFi?=
 =?utf-8?B?dUFsd0FXUEh4aUdMZThUNkd0TC9NVmdkTjVoWXZTaU04eW9heTBJQldhaElp?=
 =?utf-8?B?R3huSTh6UTUyRnVCTEpuWmlEZS8rQzRjRGhQcFUwOE50enpUQzd2N1VoZ1dm?=
 =?utf-8?B?YkNRdWROTkhGQzN1T2EwWTl3bnFNSStVazZ2TnIvNUdDV2dBYmJtTU5HbnEz?=
 =?utf-8?B?UDBWQUtXTkFUc3RMcitDRnc5eUk0NHdWajBoc0tET3htZGlHTG5RS2l6WC9P?=
 =?utf-8?B?S2h5Z2FMa1JjL1FpMkpWcmVhUElkdkF2akZDWnljb3BJNmhxY3dFdEZYUlBy?=
 =?utf-8?B?U1g4YUliWXlGQlNOQ1pKMlIzTDBaZXY1Y3BMcE9UUitwUXc5anpOTFliM2R5?=
 =?utf-8?B?UzBBZVZOb1dBVDBrNkMyMktBYkVPQVhkVjdCcVhOSWZMUTE3Q25yMklqakE4?=
 =?utf-8?Q?qFu198nDNFWDZ3JXEg4MECRrC6+jZ8+Kd4oeOup8sKgDM?=
X-MS-Exchange-AntiSpam-MessageData-1: kcDXdiutXwceZs4/92RcqEB6n2m/3EFnKwU=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7d39b0-4d40-4740-3139-08df1cc5e490
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB11804.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 18:33:57.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9tq9KeZ4zZ2rfBvMuHEwrabdLMgGFYDhw6tTtahRsHFO4kuBJcLEVIQSiNvoL0RqA+FLinT132xVxkDeN2cDx9YgtHP4iIpfsYsMNrtYYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5803



On 9/27/26 11:54, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> When set_cred_ucounts() fails in ksys_unshare() the new nsproxy is
> released with put_nsproxy().  But the nsproxy has not been installed
> at this point; it is only marked as active once
> switch_task_namespaces() installs it, which happens after all failure
> points.  Dropping the last reference therefore deactivates it and
> puts the active reference of every namespace it points to: for
> namespaces created by this unshare() call the active count underflows
> to -1, and for namespaces carried over from the caller a live active
> reference of the still-running task is dropped, which makes them
> disappear from nsfs file handles and listns and causes a cascading
> underflow at task exit.
> 
> Use nsproxy_free() on this error path, which drops the regular
> references without touching the active ones, like the setns() failure
> paths already do; see commit cefd55bd2159 ("nsproxy: fix
> free_nsproxy() and simplify create_new_namespaces()").
> 
> Fixes: a98621a0f187a ("unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure")
> Link: https://lore.kernel.org/r/20251118064552.936962-1-ptikhomirov@virtuozzo.com
> Link: https://lore.kernel.org/r/20260213193959.2556730-1-mge@meta.com

Reviewed-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  include/linux/nsproxy.h | 1 +
>  kernel/fork.c           | 2 +-
>  kernel/nsproxy.c        | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/nsproxy.h b/include/linux/nsproxy.h
> index 5a67648721c7d..dc2447f5f0924 100644
> --- a/include/linux/nsproxy.h
> +++ b/include/linux/nsproxy.h
> @@ -100,6 +100,7 @@ void exit_cred_namespaces(struct task_struct *tsk);
>  void switch_task_namespaces(struct task_struct *tsk, struct nsproxy *new);
>  int exec_task_namespaces(void);
>  void deactivate_nsproxy(struct nsproxy *ns);
> +void nsproxy_free(struct nsproxy *ns);
>  int unshare_nsproxy_namespaces(unsigned long, struct nsproxy **,
>  	struct cred *, struct fs_struct *);
>  int __init nsproxy_cache_init(void);
> diff --git a/kernel/fork.c b/kernel/fork.c
> index d458d85d7a656..11e16554daa61 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -3324,7 +3324,7 @@ int ksys_unshare(unsigned long unshare_flags)
>  
>  bad_unshare_cleanup_nsproxy:
>  	if (new_nsproxy)
> -		put_nsproxy(new_nsproxy);
> +		nsproxy_free(new_nsproxy);
>  bad_unshare_cleanup_cred:
>  	if (new_cred)
>  		put_cred(new_cred);
> diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
> index 0f1b208d8eeff..454427b09ed97 100644
> --- a/kernel/nsproxy.c
> +++ b/kernel/nsproxy.c
> @@ -61,7 +61,7 @@ static inline struct nsproxy *create_nsproxy(void)
>  	return nsproxy;
>  }
>  
> -static inline void nsproxy_free(struct nsproxy *ns)
> +void nsproxy_free(struct nsproxy *ns)
>  {
>  	put_mnt_ns(ns->mnt_ns);
>  	put_uts_ns(ns->uts_ns);

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

