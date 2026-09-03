Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87720391851;
	Thu,  3 Sep 2026 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467788; cv=fail; b=SSY1K+reCFFy0CJfzcLGy+dTVm4ot/rtHX2Vjn11NaExT7pvvOSZ+Yvt77jnobcUf9fhd3jp1E3fSUUT11reJGWO8oRglvWJiILGP4x5XHg8tPJZL08c35nzikI4w6hW6yjkYOowSS6iuw9IVIixAILlzw1jlhpTAwOw0ivB1hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467788; c=relaxed/simple;
	bh=ASGBYOEzsIgiqhW+Kx2mrLdOgaQENAvFK0P+fT23vQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pv99Kt8Y5HBJ4RMb/oif4fzGMcAphcO68PY2OPzglJG520Aem3bKwXYCPtXMTSWF9wYNHGuwigEzBGhBJGE+27YZq5obiemAuaec1E4acFFaJDALSS7gcfwT22KPbf55T1s3VXs3cVGbJLKbLyFGa3dbYEPcOObGt9XUicXzlpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vkFWAKP2 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vkFWAKP2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcagXiZevpiNytheVnRHJDtt4rony2L5V8ykKssqPU4m//JMc0yXq4idVG/j8zDX0CKRcWCPsGXzAEhkWbh7JV/0tltwrSWY0eDFWs/Jo1Cl0BSyCFnb7Ia6bxrGPtcn3XfsNM9amY2xo9bomVf47tacDM/gLkg2hkujO37DGyc7I0Sk/O4Yi0jUCb9jQTk5Ix/XfGN99lHfAGW9/477bOtwTy2RJ/n2eyMsPj0QDBnvingNGpNAmYPn7FsOUJ2xhFNDitkO27qCQ9LNopCPneORrGcU7pqpBhciz8R11WbwCb6j+hNjp/oS7AiYDMSbW8pxJ6xDOMvzm3kzNTkNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl2HP+rGxrvIJMFXRI39loo7HDG7XFKzlPNE6Mep4Ls=;
 b=Pq98ciMqZQM+RuqGVuCCVlE7SLbzZa8dRoA/OnVHXE7xNEIwaI0+M9sf93KZNIcCWmlkRCzG8pE/jrUP/z22Z1j4bf3894obL9yl+qoyZzPKxZhcJKH/CgFdopAvQ9f/i3KPPIgzUDp8BF3+VnpaVaXZqAYLVe7eb9UY6DyJ2p7M/TvvnbxIYaAO6ZPBFtOfiXb9ETZB/G5Y9bsWriQLA1HRgfLGSyexxVj27IR+M+g3T4ya1/monS0DyoLCNXngELAkB5ksOBY3M65W/Gx1hk9/coX1RmGTQBw/rgL0lRbEnZSYN4WV7WWOeAwv5Fa7rEITIjKrYlj7J4FkldQxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl2HP+rGxrvIJMFXRI39loo7HDG7XFKzlPNE6Mep4Ls=;
 b=vkFWAKP2uPlU4F39UbNTo6CeoNynJzNe+2oq126uKxALKRM6uXjbTkC8Q9ei4z3vNpsejF1F1Ror/EL5Q2CMWjlb4Q22bze5x7FZQNZuxVYAjVgGBnl4f27uMy6sjmJdMSf5wKbJz6DtiNyBvwFtOmqgjS6hqGkV9UosSo5zmrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 20:36:13 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:36:13 +0000
Date: Thu, 3 Sep 2026 16:36:09 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] x86/mce/amd: Reset deferred-register state between
 polling banks
Message-ID: <20260903203609.GC145182@yaz-khff2.amd.com>
References: <ZYPjnBLNLY69gIYeH-ING5IhrnA3ryhVQquuPlWhUR-WmKLUFl3z-HRWR6q3zW88Vi9L4IpFrd5WnRhVG0AptFUR4cDvCGTJ782EUQL9u0Y=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZYPjnBLNLY69gIYeH-ING5IhrnA3ryhVQquuPlWhUR-WmKLUFl3z-HRWR6q3zW88Vi9L4IpFrd5WnRhVG0AptFUR4cDvCGTJ782EUQL9u0Y=@optocloud.no>
X-ClientProxiedBy: BN9PR03CA0478.namprd03.prod.outlook.com
 (2603:10b6:408:139::33) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7b57c2-0b1d-4546-43a6-08df09fafeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2T+J8BZpHXDC7WHRDSLJsry+NSk/pDKqdLXyTBi3dhChoYS7k29E1/FrymaGOhfPlJbbO3spFsf0vJUALClffeMEgomEnlj4u6hMxl9dk86+WQucAnhSGOKf0lNEG3WqPQXuFDH1frYd1jarcWT2hV4zfTgcfL4TuWd1SvHM0Z7clP5K16k18M8/YpOGYa5b1HFBEdKQAiOt7G/qShY7R9h+UUyJCcGMcEkWtMz9TnqEL011p1+Aw4D3QXnVESL8Y6pe1i+/zDoxMUtxEqgpxA0x+/qglgeZPpCughoLXW8SF/lTvpXihHdfM0HSUMB0laQYr20VXM/NFpdjQSfcdrH5PM2vntOAqOtBmDEiq02ATfiW1kagn9hEbRoLKQMBmqut3ln65/Gm3NOGdMDFXKXRDY16Zk16tej/DvQhQ1K+HcAVSUGOJpjj69N7kfQKZTt3uoa7mUyZJ4NrLAp27lQ8uBK1QSer6ocmjcjsJHvHQOQjlP3Ttr0uttofdRhojXiwDUsNxh+hqKEbybjsX/RHFdMjT5JTuxczr6FjQ+wPTRuBqYZafSA03HKBSqlNskN88Ok2DVO2MBNpVhKtefxmZeSnSLwlqezu8OicMMaGFERbWbC+Smc02tIoAFD7OF217Niq02G2KE9w5cqL8QfXu1nWdXTHE+ogFZxR7Q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?X278XqMhMHEVDh5cpxtd+SkbAwpAL1AUCqByCV/jXbguFAcsq2EvUQXhBY?=
 =?iso-8859-1?Q?CPU9x2AiuO0tAeDOMGLJ+Cmei/bod7z4dvNoXkQnA/m6EoTbXMjCqKXk04?=
 =?iso-8859-1?Q?+Fhsea1qOD+m82MVhl6HLAM1wW9eGxBjHwJhk6NBfqr/cgElHaHTEmP17t?=
 =?iso-8859-1?Q?5gxgjNqgYtopXCF/TeTmYjKWnNIIQ0sv2FJ2SPaWrmO/vGmU2U1qJGP654?=
 =?iso-8859-1?Q?9dkWg4dh7K/t2BYjWz5vDZYZgE1HVbT5cldokvph/UEjLvOQMLDR14CiII?=
 =?iso-8859-1?Q?xZL4EoYl+4N9SWZJEsH5SsiRQ/duVD4YneCDkXIMl+/SnlHMW7V4+mHU69?=
 =?iso-8859-1?Q?hVooJKop5Vu5/r7c3hv7ogINrk9N0gXD747++bH/tZAYGfNdlBlmkcG4lb?=
 =?iso-8859-1?Q?AaaQQQlu4kcwgsTQa3FZhBD+ZpofZvBa1YxVJdJX9getsjw7hss/wUrNxl?=
 =?iso-8859-1?Q?KidoJP7RSFmXxeT7hQeLOac6gRWKVJFB5J0YpG95EIHdlXeWpUSc+xQkpq?=
 =?iso-8859-1?Q?Bm3qqy8EHf/sOq8MUFDYSPYX+MmO1W4GUhwSapzMSr+fcNIVa6AcGaEJ0V?=
 =?iso-8859-1?Q?YNCqcPsp3oAjWjOBum49t4wbzO67fTST3yGb5yNPWHQAzuKwDG+2OJEwNY?=
 =?iso-8859-1?Q?S43f5JTwdT4GDW9PoFMmhwAfwRi8UC94Qj8rlA58I5zZxbCltOcV43TyRt?=
 =?iso-8859-1?Q?ZluniYdcGnFQM4mVWWtXBHHazX9/DQr/uPN2bybxiYwYLNB0mxEWg2MjrH?=
 =?iso-8859-1?Q?MbVlh8HgY1xVcD88Hr/fjDUA+RrzXRmX9P0ZdxnzExWSsJnnAr0eayX18f?=
 =?iso-8859-1?Q?kt+jIbM9qWNO855hl6+vbWdx38oZSpJbTOPB7+6/GGasdNdOHDuSOKKlAD?=
 =?iso-8859-1?Q?yzYDSpAZCE/TWkFtAGxHslyYrRGogZCdCScg4OswCcn9gpxWlX9Q9+M3DW?=
 =?iso-8859-1?Q?9L6AXJ9EBddZkan9MDdY+itQFuAHHAkdY00XyQHckEe8Bi9OtlJkhZOFkm?=
 =?iso-8859-1?Q?mz0peQEggUT258Cre5pomteBmg6+wpJJUR7gRlVMT0/hZVEOEceEl1IQzu?=
 =?iso-8859-1?Q?ESE6cQj8sPwsltINcjL03yCNzKFiywMn9GJZ1J036wlUqVrsqp/+uluEJZ?=
 =?iso-8859-1?Q?L9wGOekhIGsMPf+hBNqbzBhsmFbNG6uN+G6AknnxftT+DxoLY4epD2O5Z1?=
 =?iso-8859-1?Q?BD/ugQmhO9TtL4mEjFrrlWp2CKMP8bnDHV1qcubQ5svMn+UKebjvZZNk8B?=
 =?iso-8859-1?Q?OaafgzVCZ+X41kQtL9yr2v2NDlPItsrCRgyNuNqr87tyYg5Zwx8w08WlT+?=
 =?iso-8859-1?Q?cudRZET7Oid/mZxvAfKqEGu2u4A+4SONxy5jePGTtMB7c8moK01adLsf6/?=
 =?iso-8859-1?Q?Pjlm8VO2Fo9IYfCFQOObzyEUWIVbqivUqrQ6LTNriCaOFpp7MUXucXy2DI?=
 =?iso-8859-1?Q?mA4YqZ7sMILGP4chUn+y2po+jCQNdW6EPppEjDbj/3oWBDmr7yiNN3eeHu?=
 =?iso-8859-1?Q?bZpPZC7BVjVBPVSqM50CcmgtK16yuSMogMR+gDtSuhHtofyJjA/U5WG2RI?=
 =?iso-8859-1?Q?nDlAmThnQQQ3p7JxrCzD5W2gDUhdYUY+MB4HZV/EeUE4WqpV5F8+dyQ/L3?=
 =?iso-8859-1?Q?vCTjgWLQYExWK4ZecbRzqrVYOTtqC89y9q9gK340up5MJb/Y8uMy0xANtB?=
 =?iso-8859-1?Q?nbSdHR1mTrfqTMMNkQtGrhzwhITGa+i7DZbmvVN1jsfg+fdnHtD0N2OifT?=
 =?iso-8859-1?Q?tc5QsAI0LRsdIWpgmMaDba+3Rty0A28Vuw+6mIcNiKb50Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7b57c2-0b1d-4546-43a6-08df09fafeee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:36:13.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otvSGJ1DacAJKOfstD/wEns3JD3XUt/SyJ39rxExgDft71dFqtDJvqbV25oleYGkk50NGA7RCCoBAeU+MsGbHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558

On Sun, Aug 30, 2026 at 04:45:25AM +0000, OptoCloud wrote:
> machine_check_poll() reuses a single struct mce_hw_err while
> iterating over the MCA banks. smca_should_log_poll_error() sets
> MCE_CHECK_DFR_REGS in ->kflags when an error was taken from
> MCA_DESTAT rather than MCA_STATUS. Nothing clears the bit again for
> the rest of the poll, including on iterations that bail out of
> should_log_poll_error() early, so every later bank in the same pass
> inherits it.
> 
> A stale MCE_CHECK_DFR_REGS has two effects on a later bank:
> 
>   - mce_read_aux() reads MCx_DEADDR instead of MCA_ADDR, so the
>     address reported for that bank is wrong.
> 
>   - amd_clear_bank() returns before writing 0 to MCA_STATUS, so the
>     bank is logged again on the next poll.
> 
> Clear MCE_CHECK_DFR_REGS at the start of each iteration, alongside
> the other bank-local resets.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eirik Bøe <git@optocloud.no>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index e4e588d02a18..6ed14ec171f2 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -811,6 +811,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
>  		m->synd = 0;
>  		err.vendor.amd.synd1 = 0;
>  		err.vendor.amd.synd2 = 0;
> +		m->kflags &= ~MCE_CHECK_DFR_REGS;
>  		m->bank = i;
>  
>  		barrier();
> -- 

Same feedback as patches 1 and 2.

Additionally, why single out the MCE_CHECK_DFR_REGS flag? Why not just
reset the entire kflags field?

Thanks,
Yazen

