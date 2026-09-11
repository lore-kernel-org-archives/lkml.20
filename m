Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A854443C15
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113007; cv=fail; b=oCehMhaSm6L9iAbsSeLqkqID7FUgk4ML9cVEvFGVZSykYJ+49tLGMVG0HzIU9LX7V8UZ8Dn244wqGa0bZ+aRzQutVYwKf+cIXOtWBIndt0V5+vVnHUNEulMN74tPKnzEpv7CwYlTAthLdJNY92EEYo8quSl6LlOvavNMRqwGNLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113007; c=relaxed/simple;
	bh=hkiuHtCEAVDWHxkd+q9WbjeTlvYcHLmTAHG5BABum/U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bWoJ8DBtOrmFEPF4bnp3naAdqKQSIvhVA22bqq+wQEu8rwHyVquvILOMXClzlucjgqc02R4eUKCE/dFVunSDTD+XN0mepGxroYQS2oPkRC6CJMRAp4cOnaIRoEJGd+6QU5P0opkFg6+B45gmtS40WL58/oREG6vrLIPDD1erLPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tCAs5KQR; arc=fail smtp.client-ip=52.101.61.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tCAs5KQR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaBY+RFGYHwDR7cZLuKhHaUh+sqMmwMM7/rOi0sW5zWligu0J1TtaZtvQIohtgSTFuMzz2XiAtKI9s5nJj9zzgm8cDQ4RlfrCUKNj0j9JF7uwM04zgjBLYFDIlurf3ijcQqY2+Tb73ePxlENbWQQLjWUTAnZIQbLdSy9WUf/fMJoJj5Yfbpa+dkfcnDlpm/lA64DIFuyu/LDx6nwwNOafMvAtJQhP0zBmOvJaUfaM0LdC8ui9gYtIJPTXUpbHejwccMr0IiD0cOWZpRIiTZNh1R3SZtpuFfgCUxOAOg0mOGwz5NdADrUowTAOoUadyEqblF7XSuwKzdWDV2YvnZKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMoMBH9RPI93OGpZCGTWqHZtWMjBnBU62GWRx1z0quM=;
 b=Vtj562FfnRH20F+pUTJln2rabuDpKy1VN1+n+xZmLZuGLZIF5deQjaZSEBcdwHRZa8A/gFdsFW5JIPC9dvmH5GfJ5mBDTk6MbD2uw6fQe5K0Iug7FbtjdzyQTPTiz0bssSN82s3xUvvkYyNbEZzb9GTuVfo2tF0ynBKhLEYYeW210grgS948TyHk4eF90lHNlwqKS2KhhYbQOcRDmhZT9X9V8jRf/QTF9eFON9HULkX+w0gG+F9hb8TMNXzIjWMvuBwIh9QT1uv8yD0a5vmLzA5EZj/kseTC9bvPi8tGetXBvGQ8YZ/f+m/Kwbr3r1H5KVjQEJdOle9hbAmorLdZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMoMBH9RPI93OGpZCGTWqHZtWMjBnBU62GWRx1z0quM=;
 b=tCAs5KQRwquC3rcWkV1y3GGllIe2OWI77t5ZGehZ3BYeXY1Z/bNALsFbYLmFTWIuWPxGuTQVTUJLWyxgdx+81Kd9dcAuAp4++SRyY4AU9TPq4yXcmB+Bd9Dv3QJ8k62ZE5bmo4OiThM3GXUIzVDv0FD6j8hzXmxa0ajgJyS569s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:49:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 07:49:58 +0000
Message-ID: <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>
Date: Fri, 11 Sep 2026 09:49:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202609081301.6ARYAElY-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <202609081301.6ARYAElY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 21202b8a-ddef-4094-5fc3-08df0fd946d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iOYj8Cy0igv6mSJ/Tlw8EJcoPfE0F7hPgyGyiH9288dlISeVxGBdHREpBIbtTZx+veCDrw3v1+vsKWYxSCcGv0sKFClzpE2vqBC684tk4KIJoURki1lAbAVfSzpe0EY2dbDvynJsCOkO55yX0VVd6ZKr75cUue2gozo82nBGTjMk/dDDfdocGltaZ/+wOdY12eDCJguKxzQVDIUtvkWTrTEM4pe0hRS55FBJ6mosidRtbW/SK+X4A3JYY3T1uP22ncwsQ7967p7j7N2eiDCt5UnkNwhXQxogdmfG8bB6OZ5bTy5t7FDNgRb2hMh+u+BkG23xeo3wU612xz0r/Ao6a6KRadvAQs3ue0gp4/SThax+529nTJBnycquknNoG42NG3xwVrcRsy8NSQI7RNjK+SUy4a1WfCjHKAYwPWD5BcCqqkZ3F35/9aAUBPwWgEPo4rh0b7wRAZ8Q2ESNRH1e6OFadsP0N/tYZAfUfxCL6SGTrPe4B64D1nT74ygMkcY8yzJafikQGfxFLk+32TMW2Bd/nRxWlH8W/o/2DB9Zh3vISrPUBVPPhowXPuflNLXpBJoqWzfsYifwDajwRMv2/mtNT0ZBpNCA1UF1X9O2lj75AU8rq8l68y/zNdamPRPH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUV4ckZreWluR0xzWCthdnhzUlJRNEErREc0Ky9EdlFpdzlDdVNoNjNnL3Jt?=
 =?utf-8?B?dnFpZWd4OUprUlVXL0ZrazN5R1N1ZGZlQnVRYTBNWXBrZHVtUEFwTWw1TFRt?=
 =?utf-8?B?a2pwcGgvbTFBUVRkdEd5WmdEbXUvSFhVUkZrWFk4c3d1TEIyS1ErSXlmMEJZ?=
 =?utf-8?B?cldjMFFZeGpWQTZydk1MVjlNcHpyeDNLdFB6d3JXNjRlQWRWbHpmZFNUUm45?=
 =?utf-8?B?cjF1VEdWWWJwUm00RnkwWlJPaEtGUWpaejNzOTVzS2RxcjNhajFvcDVnK0FK?=
 =?utf-8?B?MXVaVFJzVi9hK3BYbVUycTZQTHRwN2V3RCtlNUVHRklkbm5YMkU5NTFUQTBo?=
 =?utf-8?B?S3dKd2M3TDJyL3RkOUZBemkweVVzcGt2Q3pjRlRCUkNhSnVVdUU5Qjk0SlVs?=
 =?utf-8?B?elFQSk5QSW1ONXdzbTZ0SEIyVzRPSTYzdTNGQWtSMXJlWXpvUXZDVllvNko2?=
 =?utf-8?B?UjkxSjdXbHhzTWRIN21jeTNBbHB0TDhqdTlCMjVsZFN2RDg3Yk5lMVAwQXFH?=
 =?utf-8?B?cnBoNlhJYzQvZkFIM2ppcVNlMXl1bDJoV2E5VFZNZDI1dHZsdzlwelllQ21s?=
 =?utf-8?B?czdKUWl6Sjh5R25nRHdWT0doWEFYSEZHSzVabEVOWXFvSDMwb0lNcUlGb3hO?=
 =?utf-8?B?TXllOVlEdWF0b3hMSjNwaWlaTUI4N2s3bDZKR005LzhBenhhcUNLeEFqUnNl?=
 =?utf-8?B?TmpWRDJ0MVVJM3kyUnhPSlV5alhmOTFLS01QYXV3dTl2Vzl4T1RmN3R2Rlg3?=
 =?utf-8?B?L3czWmRrdnQ3dzBIVHJrZ29KK3l5amJ2bERiOTNBTUdjV0xPaXBpbmNlY1Zq?=
 =?utf-8?B?L1M5OHN4YW00UTJhZHVpRTc1NDdYVDh5cmppcWtBekZEbHJOeklySmVBUXY2?=
 =?utf-8?B?d09IdDBmdHhZMEtQM21Pa2REbCs1K1NuNVcyQVFOR1luTUM0dFdlc0tsQ1A3?=
 =?utf-8?B?UDd2L0ljNytCRG9aS0h1TlZjYjhMRnFYZEFFTTlaSlczOHlIVHZZaXkzQ2lv?=
 =?utf-8?B?aitJTkZsK1QxT0QveE5leHFKVWpYUWNQYjM1ZktteUp4Rm9xMDdGVXhHNVJF?=
 =?utf-8?B?UlZieDBKVXJrYWU1aTVBME91Ymd1eHVlcENidnRzSElReWtuTjdobGxmb0VY?=
 =?utf-8?B?UmhieHUyb1dlM3JYMThFUXhYa09yclU1b1Q3RkplTm9ZNzg2THRZcUk4NHMz?=
 =?utf-8?B?cm14UjNoNmxtQUFuYmpyaFFtUEc1OGV3Kzh4YzRUeHJKL1U4YkNFemVXWEdK?=
 =?utf-8?B?b09uMUFlV2g3T0ZLakt5VFFjRkk3YVBoM3N4K3p6RzBGRFpVaEJlWTdqY21G?=
 =?utf-8?B?Rk1TYUc2TWFqNHVrVnJFbUl1S0hqcUd1emp0VTFWMWQ4Z3J2Ly9vbjNJTFpk?=
 =?utf-8?B?Zis2b3VZR3pFMGhWdHNNQWpBb3FMQlMxS211UXNKeFZkVXEwSWdUVVU4UWFP?=
 =?utf-8?B?QkptZG1BTHBWRmFsWldVSDEyaHBnQjNlOHVyMzZJZFZlVEYraVd2MTN5RHNQ?=
 =?utf-8?B?NGJIUlVVZG1DemphdzRYZ1ZOSDEzUlNsUzI3eno2S0NOdklzSmVJd245QVhE?=
 =?utf-8?B?L2hBRDgrbDlJcC9Sd09aY2pRcFk4RVRmQ3AyZWF1TFZ5NFI3WWJBTHdKUUdv?=
 =?utf-8?B?cnFuR09DR3dVWVRKejllRmFid1A4Sk5obXFwb3AwSy9lYzlET2R3V01NZ3l2?=
 =?utf-8?B?QzdDdTZFMTAwUlV0UXFqOGFIUFBFbSs4VDFJOTh2aXdkRVdLalh6WHVuK3pI?=
 =?utf-8?B?YnJsUmtFUkhWRjJGbFpnYXEyT3FUN1NMaWJKRHBVa2N0a3JZc2U1elUxZ0xy?=
 =?utf-8?B?Y1VqQW9NMXZHcm1IOWVoc21uVkRNclV5clE2Wm1OcEpsVzQ4L2pxSXhaRGZp?=
 =?utf-8?B?R0lLZ3NVakdML2gxNE0rdlgrNFg4UCt6MG1Rei9nakx3V2hhRGZBNVdITVVV?=
 =?utf-8?B?bTFTbWZORGxibnpYUFJDVTNMcjl1NG4wdU5tSENiRU9jOU5rMG1KRCtxYnRi?=
 =?utf-8?B?RUxQN2tZb1ZXaW1heEdqcnQzMDVTWC9aTEZLUEh1N2NTMTdydFAzNXNEa2s2?=
 =?utf-8?B?Q0VDazNjTkorZXMvRm5WaWlkaE5aWUpIVnhWSHRxWnJqd1JVSDd5WDltTkVJ?=
 =?utf-8?B?eUltVWF5NjhOWVRsb0V5cUI5Y0p0S0t1Zk43b0Vkc2hHeFVoVEtNL3o1RXJj?=
 =?utf-8?B?Z3VDYTBuMWRmMVFISnFvMkdiTjRQN0MxTGVTYnJXcEVlMTFKclE3NjZhUWVG?=
 =?utf-8?B?MDNSSkNPWXZCRWtpMnBIZnpwVnJ4dGRaVnl1N3A3SmRscmZkdWRIcmEwUDN4?=
 =?utf-8?Q?aHDAMKn37TPkh7nUbJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21202b8a-ddef-4094-5fc3-08df0fd946d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:49:58.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XZzaQlli4qB+WIBXD3Os5JV0r5Ic4qiTGPWgenT8j0h/I110rchd6C6MjZDpkDa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481

Hi Dan,

I just double check and this one and the other "warn: passing freed memory 'fence'" look like a false positive to me.

Any idea why smatch things that the memory is already freed in the test case?

Thanks,
Christian.

On 9/10/26 16:15, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   28924df2a08f440c73991b83028032c901de2ae4
> commit: 6055c9e333cfbb5af3eabe204caea92757094d19 dma-buf: Change st-dma-fence-chain.c to use kunit
> config: arm-randconfig-r071-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081301.6ARYAElY-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 6055c9e333cf ("dma-buf: Change st-dma-fence-chain.c to use kunit")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609081301.6ARYAElY-lkp@intel.com/
> 
> New smatch warnings:
> drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn: passing freed memory 'fence' (line 195)
> drivers/dma-buf/st-dma-fence-chain.c:339 test_find_gap() error: dereferencing freed memory 'fence' (line 332)
> 
> Old smatch warnings:
> drivers/dma-buf/st-dma-fence-chain.c:219 test_find_seqno() warn: passing freed memory 'fence' (line 209)
> drivers/dma-buf/st-dma-fence-chain.c:228 test_find_seqno() warn: passing freed memory 'fence' (line 221)
> drivers/dma-buf/st-dma-fence-chain.c:266 test_find_signaled() error: dereferencing freed memory 'fence' (line 259)
> drivers/dma-buf/st-dma-fence-chain.c:307 test_find_out_of_order() error: dereferencing freed memory 'fence' (line 293)
> drivers/dma-buf/st-dma-fence-chain.c:346 test_find_gap() warn: passing freed memory 'fence' (line 332)
> 
> vim +/fence +207 drivers/dma-buf/st-dma-fence-chain.c
> 
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  174  static void test_find_seqno(struct kunit *test)
> dc2f7e67a28a5c Chris Wilson      2020-04-09  175  {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  176  	struct fence_chains fc;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  177  	struct dma_fence *fence;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  178  	int err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  179  	int i;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  180  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  181  	err = fence_chains_init(&fc, 64, seqno_inc);
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  182  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  183  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  184  	fence = dma_fence_get(fc.tail);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  185  	err = dma_fence_chain_find_seqno(&fence, 0);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  186  	dma_fence_put(fence);
> 
> The zero day bot is warning about this code because it moved, but
> calling dma_fence_put() and then calling dma_fence_get() doesn't
> make much sense.  Why even bother with refcounting it at that point
> if we know it's unnecessary?
> 
> fence is the same as fc.tail...
> 
> I don't think there is any cleanup.h magic for dma fences?
> 
> dc2f7e67a28a5c Chris Wilson      2020-04-09  187  	if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  188  		KUNIT_FAIL(test, "Reported %d for find_seqno(0)!", err);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  189  		goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  190  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  191  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  192  	for (i = 0; i < fc.chain_length; i++) {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  193  		fence = dma_fence_get(fc.tail);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  194  		err = dma_fence_chain_find_seqno(&fence, i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09 @195  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  196  		if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  197  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  198  				   err, fc.chain_length + 1, i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  199  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  200  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  201  		if (fence != fc.chains[i]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  202  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  203  				   fc.chain_length + 1, i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  204  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  205  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  206  
> dc2f7e67a28a5c Chris Wilson      2020-04-09 @207  		dma_fence_get(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  208  		err = dma_fence_chain_find_seqno(&fence, i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  209  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  210  		if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  211  			KUNIT_FAIL(test, "Error reported for finding self");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  212  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  213  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  214  		if (fence != fc.chains[i]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  215  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  216  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  217  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  218  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  219  		dma_fence_get(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  220  		err = dma_fence_chain_find_seqno(&fence, i + 2);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  221  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  222  		if (!err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  223  			KUNIT_FAIL(test, "Error not reported for future fence: find_seqno(%d:%d)!",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  224  				   i + 1, i + 2);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  225  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  226  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  227  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  228  		dma_fence_get(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  229  		err = dma_fence_chain_find_seqno(&fence, i);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  230  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  231  		if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  232  			KUNIT_FAIL(test, "Error reported for previous fence!");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  233  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  234  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  235  		if (i > 0 && fence != fc.chains[i - 1]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  236  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  237  				   i + 1, i);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  238  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  239  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  240  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  241  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  242  err:
> dc2f7e67a28a5c Chris Wilson      2020-04-09  243  	fence_chains_fini(&fc);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  244  }
> dc2f7e67a28a5c Chris Wilson      2020-04-09  245  
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  246  static void test_find_signaled(struct kunit *test)
> dc2f7e67a28a5c Chris Wilson      2020-04-09  247  {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  248  	struct fence_chains fc;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  249  	struct dma_fence *fence;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  250  	int err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  251  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  252  	err = fence_chains_init(&fc, 2, seqno_inc);
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  253  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  254  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  255  	dma_fence_signal(fc.fences[0]);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  256  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  257  	fence = dma_fence_get(fc.tail);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  258  	err = dma_fence_chain_find_seqno(&fence, 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  259  	dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  260  	if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  261  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  262  		goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  263  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  264  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  265  	if (fence && fence != fc.chains[0]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  266  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:1",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  267  			   fence->seqno);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  268  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  269  		dma_fence_get(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  270  		err = dma_fence_chain_find_seqno(&fence, 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  271  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  272  		if (err)
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  273  			KUNIT_FAIL(test, "Reported %d for finding self!", err);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  274  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  275  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  276  err:
> dc2f7e67a28a5c Chris Wilson      2020-04-09  277  	fence_chains_fini(&fc);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  278  }
> dc2f7e67a28a5c Chris Wilson      2020-04-09  279  
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  280  static void test_find_out_of_order(struct kunit *test)
> dc2f7e67a28a5c Chris Wilson      2020-04-09  281  {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  282  	struct fence_chains fc;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  283  	struct dma_fence *fence;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  284  	int err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  285  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  286  	err = fence_chains_init(&fc, 3, seqno_inc);
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  287  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  288  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  289  	dma_fence_signal(fc.fences[1]);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  290  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  291  	fence = dma_fence_get(fc.tail);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  292  	err = dma_fence_chain_find_seqno(&fence, 2);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  293  	dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  294  	if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  295  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  296  		goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  297  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  298  
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  299  	/*
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  300  	 * We signaled the middle fence (2) of the 1-2-3 chain. The behavior
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  301  	 * of the dma-fence-chain is to make us wait for all the fences up to
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  302  	 * the point we want. Since fence 1 is still not signaled, this what
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  303  	 * we should get as fence to wait upon (fence 2 being garbage
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  304  	 * collected during the traversal of the chain).
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  305  	 */
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  306  	if (fence != fc.chains[0])
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  307  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:2",
> 4cca2e64164176 Lionel Landwerlin 2020-06-25  308  			   fence ? fence->seqno : 0);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  309  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  310  err:
> dc2f7e67a28a5c Chris Wilson      2020-04-09  311  	fence_chains_fini(&fc);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  312  }
> dc2f7e67a28a5c Chris Wilson      2020-04-09  313  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  314  static uint64_t seqno_inc2(unsigned int i)
> dc2f7e67a28a5c Chris Wilson      2020-04-09  315  {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  316  	return 2 * i + 2;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  317  }
> dc2f7e67a28a5c Chris Wilson      2020-04-09  318  
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  319  static void test_find_gap(struct kunit *test)
> dc2f7e67a28a5c Chris Wilson      2020-04-09  320  {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  321  	struct fence_chains fc;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  322  	struct dma_fence *fence;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  323  	int err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  324  	int i;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  325  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  326  	err = fence_chains_init(&fc, 64, seqno_inc2);
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  327  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  328  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  329  	for (i = 0; i < fc.chain_length; i++) {
> dc2f7e67a28a5c Chris Wilson      2020-04-09  330  		fence = dma_fence_get(fc.tail);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  331  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09 @332  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  333  		if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  334  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  335  				   err, fc.chain_length + 1, 2 * i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  336  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  337  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  338  		if (fence != fc.chains[i]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01 @339  			KUNIT_FAIL(test, "Incorrect fence.seqno:%lld reported by find_seqno(%d:%d)",
> dc2f7e67a28a5c Chris Wilson      2020-04-09  340  				   fence->seqno,
> dc2f7e67a28a5c Chris Wilson      2020-04-09  341  				   fc.chain_length + 1,
> dc2f7e67a28a5c Chris Wilson      2020-04-09  342  				   2 * i + 1);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  343  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  344  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  345  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  346  		dma_fence_get(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  347  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 2);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  348  		dma_fence_put(fence);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  349  		if (err) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  350  			KUNIT_FAIL(test, "Error reported for finding self");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  351  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  352  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  353  		if (fence != fc.chains[i]) {
> 6055c9e333cfbb Jason Gunthorpe   2026-03-01  354  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
> dc2f7e67a28a5c Chris Wilson      2020-04-09  355  			goto err;
> dc2f7e67a28a5c Chris Wilson      2020-04-09  356  		}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  357  	}
> dc2f7e67a28a5c Chris Wilson      2020-04-09  358  
> dc2f7e67a28a5c Chris Wilson      2020-04-09  359  err:
> dc2f7e67a28a5c Chris Wilson      2020-04-09  360  	fence_chains_fini(&fc);
> dc2f7e67a28a5c Chris Wilson      2020-04-09  361  }
> dc2f7e67a28a5c Chris Wilson      2020-04-09  362  
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

