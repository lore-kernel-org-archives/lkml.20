Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC633B6343;
	Thu, 15 Oct 2026 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079663; cv=fail; b=E3TKyVAhH9cJTZzfOFT1TFwYXpLmGV+mNNfKQNoBzHqmd0x+/tUuU6wb+qPi6lmsNsBjcS4CLvB0t+eRZcIz3W5XYwbh4jQ0zb+nDqAQlto/o3yC+hi8iS3VyAVyTrb4QH1KsaPnMpRAfQab0gCO6onrt2crIHLeSyqYCiQPg78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079663; c=relaxed/simple;
	bh=geNjII2LR+ppkw++nOlT7zzVHRk1rgMDBGKpwAQBsq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m2/4puFcMx3hvY5s/x6EFE6twimUA2l91WUGzZWH2+9zWi2cT+bXZ10ssoeFO6PcCP+VdeR4t12D0m7iAousHVpvj12CrLl+f4Xq8r6m7iOI2FKpWNFNxqSEJWT6EtwLxVbay3Ltc51TYSVa97BA9X0j19OGNBi49pKyCgMePao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HzVthBq8; arc=fail smtp.client-ip=40.93.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HzVthBq8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5sWFxIXJ1KPIKlNV0kkVTyyMbt8Btoi7s6P9HuIYYDo+hanEn53zFDuyV3CdVL/g3tooRv+1e46poBXXfn7jsxlm+R21i+y6z6PyTInXsAZV6pEbXQ33uP+X8xENNkof+hxScTBDyQ8ob/uHYDPINPZR9pH+9alsz5rMSDATLtcJpUkSlXLRq558OplcJGDpD3woFwR875e9EA4RpJclOjp9/yn4IaDblAVlO/lKWsvgGLJurOO2HWtEgkeKUoyptSJ7y31WoMeg4USziiZ4df7GzsUlI4Khsl3Gh+pvWxX/rCf5s0wAFj1G4VRteu0yYcHBYmJ7dSH7Et3yI3PbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ6AK/fcC/W32mdl2NRVcm47/xpz3e5WhM6sQX/ZHHY=;
 b=n2z6wmaO4y+8E4BtT8UGixbww8v3knFegeqBKs/wGoxq/xT//ucfNOzPPKPCnWkj54B3va3VC2/E0IsXbC0YyYg6fg/yz9mwZzwB5IZEOsV7bO6dPaarpuimL2KFjza4ePTW8z1Iv5iGGeJGmzEzpAAwfvIQ8KQOu3lSFQEknjBv/PlMe6zvN21TFnwpR3+LlRsY628WMStf8yfFmjJDt70Gyxf4hS99HcO4qqs87IgTZyEJulK/xyfzNyvyzfurfbAqyWJ4UxSWmcMOuPStru3vQndQLgoZpuG5/ScXgYijmFFiBra9cIxW9YKJLIL0gzDdcSuvUEuXHgYVRn/2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ6AK/fcC/W32mdl2NRVcm47/xpz3e5WhM6sQX/ZHHY=;
 b=HzVthBq8SNvGvWWcKKJPVja2aYBZ6/ksobGCF8QIBGHW6ZTo3B356jV1xclJELjL1ndo8rr498T1pZon4xpvHzILbCmj/+ALxins0eCsqJzmOj+znK3CvQxODgBRPpZHAW1H+hEfPW1GJ4Cwa7grhOtsfKiF7O+/q1KYtjCxicY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DM4PR12MB6328.namprd12.prod.outlook.com (2603:10b6:8:a0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Thu, 15 Oct 2026 15:54:06 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 15:54:06 +0000
Date: Thu, 15 Oct 2026 11:54:00 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/amd64: Add support for Family 1Ah models 0x88
 ... 0x8f
Message-ID: <20261015155400.GC5279@yaz-khff2.amd.com>
References: <20261014085720.1471993-1-Vishal.Badole@amd.com>
 <20261014085720.1471993-3-Vishal.Badole@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014085720.1471993-3-Vishal.Badole@amd.com>
X-ClientProxiedBy: BL1PR13CA0384.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::29) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DM4PR12MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d880f27-b74d-4485-079c-08df2ad48ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|10067099003|22082099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cbhIfZNNRcIN/mTO17kJMezzPwFk4OiNn7+x1/4kNfpVvfzP0PFr+i0zbPgASFy5fATugFuYtpXC4jGLXlXRtfclIeuS+50+yqzE1JOdD1+57pdN2e1W3QGrH2ikjAcNZ7LyQbv8tLarzel1ksV+cfTlOYhorNhxHc5hlEUv3kAs/sDYZ9nAkT/GigJ9P1TNoaWXAy8Pod8Zds/XfatzeObosB2NyCfV4rM3rVrdpYMqd+LAX0g+hA93JPwmJdGgOOnlXzat3epObi+JpqynbJtsraycf2G2jypviUxO1gtIlSEk/r27zOIWEkDj4U/tuxssnYeyZmXFjsr3NLTaSoJ91EcbJDVyjapB56EKlqBJ3kt2FHHv1j6UwAMi8nb4T23ezwN9d2r17nVZBpm+9I/TDbnjhXMwN2YDnz4mfFk3blXvJa+8k4MFf1TkCtCl/SNx/viOQAFwjwLV/ZJSP4/RGdiRovKdThruunLVK/3NMpRQLXFvqAmduPEYBf5flU0/xzp+n8/fMw/byg9LVHGn7u2esl192AQaXM/v35OFiYlYxW2JVfhtFEDe1UtoNtW0ry+sn72mXpkQOKfUnioLm6Gm+/D9zsXNx0bdl35NNfjzcoQedxhfWbkiXolFpUlRtJUXkk3qyiMYbn1YWsWAHU3Hpd0u1kHc26osB7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(10067099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?513OLgX4tynJZdXd1Bxv6rusbtOL/XiZbL/ua61hVJuxlBtGBw6E+2X+denz?=
 =?us-ascii?Q?cgx0z4FzuR94DWjLecsTh/cntojygKOzXSw/O/n93SNKq+SoAB+vdn6Iu3S3?=
 =?us-ascii?Q?ISv9TDXjLdZPFIJBEL+rSMKP+A37AanUJfGEtManiNpQHg+DbD/mJIP0ZB9v?=
 =?us-ascii?Q?nRQk5RcCOx9bQrEM4xVAMXP96lKck5Me3xEqu+zml4+fabI58k9116t8Yhuh?=
 =?us-ascii?Q?aPPLhssmge7Y0D27CAWWFLONeqAdh2auC2mys+zntl3TG3gpRjrhwkO968zZ?=
 =?us-ascii?Q?cBq0KTfjCCpCD4Y+uTNwGYU6pedN76H2V/+CVDPIkcXSnBm4KkNyUTB0s4xi?=
 =?us-ascii?Q?dLWeNHXQxLINKumIWaB5aHY6k7RfWItahlmQnO/7RJCPNZe7DF633JTGHA5c?=
 =?us-ascii?Q?5WFFIARzFuBQ98IKoT2GyKDyNQG7CeH060PlA8HyI5RQQJy5E791moERDGgL?=
 =?us-ascii?Q?bx6L8E3JozPdJSPZ+C8XEpCnLXemRfOXXgKxUPZgNZRMN7eU5TXpP1MX51OZ?=
 =?us-ascii?Q?nSXkoSXVAlyBtIuYjOVeQJU0HWCbxVh9SCF6ptCn6khioXqigFdi3fi7PteU?=
 =?us-ascii?Q?lZeLYX/glRn/mUJp4W34jwxJP50LlXMdrr9IklnrjZMIzpDIhwE1ZVQUOUpT?=
 =?us-ascii?Q?CcQ9FeZprpvFSXRoHsWtsPdbgYDvzPUrANUzMDkVGXZI6tjGiMa8Xw0AT0vd?=
 =?us-ascii?Q?ofv2+m4z49tYEe4IKffwFqSMBUXicEUQynrqDPhhywTxVqQoQc10AxjJc7iB?=
 =?us-ascii?Q?es48NM75EkItBunp10VXRDH6+aB2H/JyDbPbfCWuHp3lxkdpJ3vgRqpOeyqW?=
 =?us-ascii?Q?pVDTe+nvaF66UmO8h01DstTReFiu44LjzmEo4bL2UOoY28DrkQyHuo7fNuof?=
 =?us-ascii?Q?amjkioGiEZ12Aqo4zoM5Gn9csfAsMW88lrJf3SAahXY5kCU6pEQhRts32SFv?=
 =?us-ascii?Q?wQ9fwOOFlfZu4seUpvxMidh3c/9YFb9LC/mMsivWcrFpjbHcM5pMcE6Hz7du?=
 =?us-ascii?Q?EklL2oQa/pRLWmdmvHlnurQXFAYuXDm3Co/r/Q6Pn1uyPf4hvuO4aAfqRYvs?=
 =?us-ascii?Q?aKgLD/YYqdF/agfdteqzD5WNcK5z7ic+ougMjiilWLth+F77ihb3eKwrrk73?=
 =?us-ascii?Q?6DgoFwZqvbORscbyE+8nk61RNYHyLugHf4tOahxUsSkopTam70G1nmPhJwWb?=
 =?us-ascii?Q?gBCVm1Z22xscBBsaiFeULisOnpfmWHjFrRIOGiFbeuckKlPS3RQfEEEP+OIn?=
 =?us-ascii?Q?51l1mpn/NDR6OytFoQqqbmHIXmI8Aevi4GJGaA8WkTki68iqpE7reyyakKW3?=
 =?us-ascii?Q?fzYOF00YCjJs/V8y/JXlf+q1aMCZXO51CT3RaJXDJ9HAbXn3ug6Aw1Zt2MI3?=
 =?us-ascii?Q?UNPXc61GKJQ8/FZIhSNKE3A1Muv7HnkLC6Ew60y8GnZBNBLhS1KiCT3bEE5r?=
 =?us-ascii?Q?rQt+dsFz3C/r5wm/rWkJJ2o5tZWtot7Lmkv4VU9SIZZS750k9k8B+SR80wOK?=
 =?us-ascii?Q?W6LZp0fn7+q4TcmqySp2FKPlg1PlzQtMjwOmcUry8K1Bc53RWqrXrx+P+FJk?=
 =?us-ascii?Q?Gh+tuyY0VnmHWP/roALv3YnOBjLhNx8tJQ3gk6YpuWhgPRue3IzWlRjSron6?=
 =?us-ascii?Q?SrAErQveVtFEndCTGttosjHDST8ajluxZulRFhDr9a1i3kfgb6fJgpOfICa0?=
 =?us-ascii?Q?DD3+SgoLxw4FB9EQyhcwlhz9ew+iX/fehVuhFFi1NxRMiZvm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d880f27-b74d-4485-079c-08df2ad48ac0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:54:06.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqgV1yd0X6SQHpsHeZChaVv8yRoa4FA6NCBAYAxR6I4svUx4NXgsDnVZseW1sYgOUP8DGzEH2YiEr4vlSXvDXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6328

On Wed, Oct 14, 2026 at 02:27:20PM +0530, Vishal Badole wrote:
> Family 1Ah models 0x88 ... 0x8f use the default settings for the 1Ah
> family: 2 UMCs using the 'v2' register layout.
> 
> Add these models to the supported list so the module can decode and
> report memory errors on them.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>

I don't think this ^^^ is necessary.

> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 7ba347bfd9a0..21ce1caa7151 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3894,6 +3894,7 @@ static int per_family_init(struct amd64_pvt *pvt)
>  			pvt->max_mcs            = 12;
>  			break;
>  		case 0x40 ... 0x4f:
> +		case 0x88 ... 0x8f:
>  			break;
>  		case 0x50 ... 0x57:
>  		case 0xc0 ... 0xc7:
> -- 

Otherwise, LGTM.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
