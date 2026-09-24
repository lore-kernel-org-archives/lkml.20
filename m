Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8D3BCD2E;
	Thu, 24 Sep 2026 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260110; cv=fail; b=s/4YXX0XzirEHUHLzoeWexlpElxf0OPJOO4wJjdcUxZWvFz72Y2UTBP8BNLR68KcNYcrLtEBsFd+ITWR5aXOiZJaWxaVSh05Ywk1hdcknhhlNhzQZ3pBxUgFkBIpIfl4CdjESpxIXM3qRsoBUxY3mHIt8FPnfmv3R5BI9MegK90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260110; c=relaxed/simple;
	bh=OmAF+UlNYg/cQQgemaarnphY3bnM44N3pF+QtIBAZqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JQ9LOoO7WJ38geB7gweZGvns0lh8Y9M9Rwf8vsP+qBV+Y5yQXzkIj7QuZgv5JIIfLQeY0jWuFeQdVk6q2BzV/+TEUUIHxEOm085iXO5nQh5CurMridC53Z4JEGJC1kPj7QUapi5MGTF+khHUZnNCI9gn+OPsRE2Sq6Pe+9YNIuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4YeYCfLX; arc=fail smtp.client-ip=52.101.62.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4YeYCfLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaEFRNzDnDHWBrOW/+9HFTOy2r/TbOSyLvGslwMQ8FGTVPHrJ0YPKbUU35qZrIJCmJhrAgxdDXzGZU/aFxT25uTc8+9SEfbU2uqRK2C/0yW+yElwbmAOcKAJreOoEeHKQrgQYv0kNj8rXSDmc2cJMwv0c2MGfnLwoC6Q2MYat5UHnWKDwj/R0ioHyKpzpdFA+OmUHNr8oHQaeQJ1txdjXbBcMtcHTFXoTGcl9NlvchUZJgQ2Rg+Q46uC0fP7SNkaPAqPnhGzuWvd8o2LNLsI/5gZ7lFZ0uRYErQeJuMyBl9nyXvpoBw+WALEBviTBRiEawyzRfkusJdHc6w31bVirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFkBlV3wrlLaU0u8HRkHQ8io8EQZBGkbm7AE/SuK3e0=;
 b=Y/rMkHPRcdQ3G918SMoBPJa8YP9ujwOathFfNW3WoSH85lTfcBHUIsTRroc5wjCsvX2uhLazRwJjj5/cbLZpbZ31XG/tCaW1Ok4uDOw2mAiuq/mUD8s8RsOpS0hOl4eV9F28P1aEgb5MPzdx+1qP4fPw8wGj8viQg+g8wwaDEaQ5IvD2XsopnZJJpdHsFNm/Dja3B1bVomEtzzjYT6Y/OHOys4Jtz64fu3fM7SBF9aNRtP8VVV0mBp1kz8zGsTMdLsFwb0A9AYcs86EXYnP8Nl1Sf9hA/sSp03CufPb3+PQdC/bajQGR43mpDLTvwqZMTZVAOBxRtEHEFRBVl+g3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFkBlV3wrlLaU0u8HRkHQ8io8EQZBGkbm7AE/SuK3e0=;
 b=4YeYCfLX3EqOjcmI7m3Z5CVJvTlC7iqwMYNj8If5Ry+xhB+mxi9CsJQaPacuBauNzOnDeDOzcBDdMcvrzXdX3oz3USYWINMVSxW5eSU444v16hC9l7WcnHDQZ4XpYOYRIHr+WNk+9waZ601NC0meT70iNX/7SblRD38kGgE5Lbw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:27:40 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:27:40 +0000
Date: Thu, 24 Sep 2026 10:27:32 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH Intenal 2/2] EDAC/amd64: Limit UMC csrow decode to the
 implemented chip selects
Message-ID: <20260924142732.GE1080284@yaz-khff2.amd.com>
References: <20260923112003.3677719-1-Vishal.Badole@amd.com>
 <20260923112003.3677719-3-Vishal.Badole@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923112003.3677719-3-Vishal.Badole@amd.com>
X-ClientProxiedBy: SA9PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:806:21::15) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb13ca4-1a5b-46a5-1088-08df1a47fcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	pA4cPCAdzx9OZbRc0Coe/Rx4P0ZqGL2DxUd/p6rkvp+q3HeDiVDZpO+TsptORsWZ5joXZp4a4x8oA7SpbZ8qjSfYpk80sq/TzZcERXg/Ol16JbyGzY+retrLN6ZTT6PsVXkzYP8+kZbR5tPZT+jOLYzj9+5lPfc3EXjOeh75n5YFg4z+PWhSV8XgQhhN8R2UXRpQU6OeJMqirkIsuaxYE+R5z5B57ftYdx8uFfVX4+EJtJZotnYFDMYgc3bTIhPbkjD1+t4s56VnqG3+KWNI1EZCyE8nuuvvDj227TAU3VQUP0tjZGckwyGKfW8krvBU9VkN0qb0Hv3PQj0a8JSKiSGTfz53Zr1rRUqpuBSyyZ4VGMvmxsViXEqvpEpJwW6fq4V+h+cZp3HtOuuNCdhUGrAgKjoT/VO88OtNpvdiW45wiP5CkZJ0OCVPiTwlH5uWXqQgCNkS1TtOBnrjxGqahsJXz+kb7KxOW1ISmcO02KnyLIM2P0tgoGmh7t2beJNfaQvFGag3mnzyciYomc4e9TZwTqiAjKA1U+YY+1Nrj3JSPefy1trdx1e0++apBNrASV7AL596Zxupuu6omTbHwO80LoxvQ9vdy0aCF8ij6FI+LGOH6e8qUnioZDzYpb2UBEzkfoX5kWX+goCPjAfe7YmLfwQeoPMKFwRyO2VARa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D5YdD5GAkrswMGrMGNzL6L+pVPr9ASZHmbAetThAdFkfn9+INrqhgZaMSlQr?=
 =?us-ascii?Q?LXUGJRjf8tygkdqybhL9R3gEMOPia8YSfNRAjSMImFCoT1THj8w/NuKfqap8?=
 =?us-ascii?Q?xmVmPocW5TNYJB7+sR6AuuN8Kx3JeyPDp2Q00OHdR10NlD2UFo/CLpUAkg66?=
 =?us-ascii?Q?UxWDhDXeRejtJyooR9hMuD/mAv56CpLLR1ZsAaUzWu6NB83nQvKo4MvptEZL?=
 =?us-ascii?Q?1TjN7qSsioftTkkjIOjNbnfXaYKMpR3UjhAQCfwTBhVJJWrnDaVcA1U4ow1G?=
 =?us-ascii?Q?qYKR1h4Ijsf6x8flOfRoOMXB4+VMjc6A3THmxlYDrUKXh6TGk3XSuZXpNxkx?=
 =?us-ascii?Q?Nlqi+PtVztqdxSlGocFkrlqOlGU/NupOa+nkQlOJG956deeyiIamsyEbHzpn?=
 =?us-ascii?Q?rSfSsemOr1hQEaXCQ7Z+FUoAOCRQh9tVZInUr+BeLiXkWpmYGJS75fTjL+S2?=
 =?us-ascii?Q?ebat2oII4tNVdURE9A/MhJu8X2AxoXkPHbLPiCQ5Le+BsEEopRyt21jumqmd?=
 =?us-ascii?Q?EB2UW72oABdymNA3fEXbHXT+uWY0LjI1l1Gkoen0V0zEPdtwbQk0rrjh/8xP?=
 =?us-ascii?Q?mwo+POQZVLMW1plQqe5bpszV/U7L4+3CEdISnFbAJMj9+Cm+d4soKSFeSif2?=
 =?us-ascii?Q?XkWSqbaZRRSzwXxGu1lEkTFjjUv/M7KlKEa1nO8Cici2GrfcOgxt70fXYwXY?=
 =?us-ascii?Q?ajsSaPgnZGZfF7FCtpC1jKfmKwDYWlS0D6XbYym1lfU8tbclgk32wIKDkAje?=
 =?us-ascii?Q?WPa8up0Q8pno1nSigmwu7UTzJ13V0C+G0vqxX6i3UQCZ+Tj7FO5Enb9/CIEc?=
 =?us-ascii?Q?JoX2OroNA1FqP8hZYa0GKDBU/3+SkFgGK920C6/+0jqAhSRc+s7kreGCLdeH?=
 =?us-ascii?Q?FyoqAf61TUMsPK8fr83R5WZI28xm71ScXpUBKpWO54/qqJ5ubYfsfgprnaze?=
 =?us-ascii?Q?KkCqjMhblQVtPHHFEdmFU0nAGU1czRk8uw5VhSAJ6o8tgDO/BJrPkC43pB6Q?=
 =?us-ascii?Q?fIAnUnwlHPDVG7ud5uAuOEEAizXF1smHNMtZoDDolMa7dntv06xsVnV6lSjy?=
 =?us-ascii?Q?k5p7rE+PTFPmVCYajrRlyCE4fLzBfvC3qUdZvXAxq5p+DvGWKGXKIbXnmd6p?=
 =?us-ascii?Q?9B4lQOy4UyksVMY8pqJSM//ln4dTIuOWPykhjQ7THe5bXeLuXFQMmzDsSOJ0?=
 =?us-ascii?Q?RuydVnd8fTD3VYjlMcpZ8InPEFop3Gt7QjpgQHuvv/c0KybBNLTfpQh2FCtN?=
 =?us-ascii?Q?308YMPyyxzXRYrcYwlI4H+Czw447iZlRnPBdVmLMPrW+n+7ik1i9mgR6GPuI?=
 =?us-ascii?Q?Y3ozuyFPyAh2/hQfjprv9Z9/0VsjERIrhiN/4tz5LtoeXCKZBPZebv3Wax7P?=
 =?us-ascii?Q?SGiy7HrGMRfeUhVrvD6wMgDgBSUNytViqKQyPLZ87sXrrNT8FpOY7h2hUMb1?=
 =?us-ascii?Q?49tjdxjkkCJtUj7VLqwk0Un20WqlerZjCwQX6xRMja6HkfU6BHoXZgnEaFtG?=
 =?us-ascii?Q?7L2oUnDgsIJDgr9raoTcf4zc4zrHousVp8G/E40Yp4Rf2p4/+tZcbUemf6my?=
 =?us-ascii?Q?7OJTlIdKe4vwjAsEDM5UfXwdHOUfbimx1nY9CiJV4Cddzwm+BCV0xGrWRnKX?=
 =?us-ascii?Q?LONnN0RKUtm5rIiWpkFA1pzB5EcQnILscW4UjtJlH5/Ix35dDoBXP3DI3go2?=
 =?us-ascii?Q?lIgrPV3elZn4Qvdt7KmznmZpPlOpDD8JI479eJg8Zw9dGrE0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb13ca4-1a5b-46a5-1088-08df1a47fcdf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:27:39.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI0CEH8JHEYKCFsc3tZv/WFJ0u3fym5CHy8AFFOnRqa9t7VC9i8fzsB1x6FAGJtwDTlEP1NmgAwxSfaAf9Hy2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749

On Wed, Sep 23, 2026 at 04:50:03PM +0530, Vishal Badole wrote:
> For DRAM ECC errors on SMCA systems, the Chip Select which reported the
> error is encoded in the MCA_SYND[ErrorInformation] field. The EDAC core
> uses that value to index into the csrow array which was sized during
> probe from pvt->csels[].b_cnt.
> 
> On Family 1Ah Model 88h a corrected DRAM error results in:
> 
>   EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)
>   WARNING: drivers/edac/edac_mc.c:919 at edac_raw_mc_handle_error
> 
> and the error is subsequently reported against "unknown memory", so the
> DIMM which actually reported the error cannot be identified.
> 
> This happens because the syndrome field is masked with a hardcoded 0x7,
> i.e. eight possible chip selects, while umc_prep_chip_selects() sizes
> every UMC channel for four. Bit 2 of that field is therefore not a valid
> Chip Select bit, and whenever hardware leaves it set the decoded value
> exceeds the number of csrows the EDAC core knows about.

This isn't an accurate description of the issue.

For this model, the hardcoded 0x7 mask is correct. The register
definition shows "MCA_SYND_UMC[2:0] = Chip Select" for this error code.

The issue is that some forms of error 'injection' populate the registers
with hardcoded values that don't necessarily reflect the hardware.

> 
> Mask with the number of chip selects the controller actually implements
> so the decoded value can never exceed what was allocated, instead of
> relying on an assumption about the field width that no longer holds.
> 

In practice, the simpler solution is to change the mask to 0x3.
Documentation for newer products show "MCA_SYND_UMC[1:0] = Chip Select".
And older products only ever had 4 chip selects as you point out.

Thanks,
Yazen
