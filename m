Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D5569F1C;
	Wed, 23 Sep 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192773; cv=fail; b=YdXq9IAf25h/mIl/+Anb/uRxhQkyQ2fvl6m3MreYsA4xREoGAFsgm5kBATxrMcg9cKE9z1P40ZL13FHMniC1VzA96jzfGAFKWD7bOKlIyuzpHnzBa2SXZXyvM/R/pLLG2SlnBehuOznANnFrwYP/qHx2bMgYq1HIuUrV/EvzRE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192773; c=relaxed/simple;
	bh=3vMxn3WEWKKQkso1utRaD3LEnIHqeN3gs70YqPwwQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W4A8RrdMGdmQTsfmFZsNSPkUQjgfORA1D/ANCsdL3lh+5x7du2//4ad2rb7AQHZcavQdAkO2Fhszsnqo8uJI+4aZEKeuxR/hssO+nRtmmdfvkNgZX5TRk+itY8SM1WpQtd+s4mzEgw8DL7QdF51eYraldp5Mgj3ktvz5ZS0Th4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qrTmCGaR; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qrTmCGaR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa3RKIHyYekCy/ZWkxBwntLDZCtsCsXt7EIG29kwf8AiHKJxJMDHUACl/CJ/KVkiho2fwakHI6h3xDQN93D5QO3mRBG71ZATIgvuNbwL47iKQhlseY6nJlAVLpcCF5l7pka2joOk5/4Z3iFuf2xPspa1HkgPW6Zt7K10IkGVdr+ztl+zB4+vX4Nl0NRGhbHvpRsjJruJjC2zpM8EX6yBR7c+YRfpMP5oNrcBAqV96JJSrMmPnBbiyUeJtYb59QtnqQqv/lt/Rrf3N/ituNrTpbsK0hkaU24qiNZt7IQUDfoNaqKjfb5Q0iu1zTVm3rqKiQXwe1hSE6PFPOP+BD199A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgjSig6vWZAViEXRdMCRl6LatqyMQ8iD6qGnLUG/fpY=;
 b=tjgFjDx7Xwou2Q4ARiHouCG2Mzf5byhVoZ4zjehO8gPsiSDPajqw8tMYzoXQC6UKS0fvwxh+UayYBzJUPM1Zv0E+Bq/WpvowtdjGyFD9/pRaZEs5r5H9EYCL+OmUYRsjmhEoAco9CiHHf/ve96hOvr5778BnHZdidUvtNF6Bh4DccO9Jwvnb5pqByXzwdOTY0duCjPIC1JZ9bEGdiwlcUwjGGYcOY8xJSpwjybJoqabaMLmiK8guFcErm2UIKj6Bbte9h7rmAIcCOx9VN/tK4bs0/VxQ3/17ErrJxrGeXD1dxpasjhkjbWH7C5QWuELoYNGVJlc6ZFlk/ODi7LxlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgjSig6vWZAViEXRdMCRl6LatqyMQ8iD6qGnLUG/fpY=;
 b=qrTmCGaRTC0d9Vydv6SqyveKuP0WIICDQbjyR3Q2OmBeeE/3NJ6aB2PZ7xzpbABg54GY39yv5hrwgRiMdAKRVJIEx7ykEHTagdYedbRDJhUMyz3TvPtLudC4fSjRH2rrFUko5WH2leAbCFmzRD9luwunrwzl+8cXLKyx0MWWakw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Wed, 23 Sep 2026 19:46:05 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 19:46:05 +0000
Date: Wed, 23 Sep 2026 15:45:21 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/amd64: Stop allocating ECC settings separately
Message-ID: <20260923194521.GA1080284@yaz-khff2.amd.com>
References: <arCC5ukNvN11l1aj@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arCC5ukNvN11l1aj@google.com>
X-ClientProxiedBy: PH7P221CA0083.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::8) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c50e32d-8e00-46ab-ce0d-08df19ab4e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oQbsM+aBn/ZTKRPil/NwfhFtMMzAXX6GIRT5G2O+JUKZdnCcArEkiY3uwe7lZerCw02chm7v1G4PBlKYBnMHCtR7uECFr6AAksh0fsC7riyKWZVxPNTiGrQKudSwUVfnRFXr+yPBsVx4lWAkRkmGyzOOMZxS5qjKxSeQTbnCYDrnakI3fUn/OSikCx4nnr3c+dr+wGfQrKKTjSJRObGg3r4s9Q6Gr/WsAkMxAdUdUkQGGSREZBPmYw0v+F3H68NL8c3k/Z00aLy+9CBXDiZWwGnKCkemtu4yrpSocUY4Rcik7D8DdDHjG7XlhGF2iqrUUQZ6OF9Z8RTCbtxJTAuwl+wFtTNssx16Ty/kNn/ob6APFaAfesOaVPZdbqKl2SV+hpc4IIZWf3mTrjCnrdei6QX7+aCivHzN3t/sSEhzXG14gOM9goPEw27o5GdNRMsvm1vdsC/mwjene+ZoKMefvhOf6GFoSxdbuwRhMcQqZ2i1dJAlBRKGy1TX3bs3HBATr8aaqQgf/f/yJ45bExYdmYmJ+BHO+vBYnU4QWmdtJ9fNGB9a6WTZF8zCugEJdfCQCBh4HfkKADWeuXlV3hv6ncRJTyr7bV5mUpBqemJFmSqDIjmbBnD6uz6y3ZXY32kaLSwTBYqNSI39iz1bkHU2g0dYkRq44SimiAnfbNbGv24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oErOLng8AN+FHpjpB5Nm/GU9mazTFaaERXXfaxbhU9SqttTM6QjHq6SRfkQm?=
 =?us-ascii?Q?ttCLSuTFRq6iSBNWAwPIis+mZAYg4l0vdXPO2LLn5kmZQSCN0EgzQ//piYp3?=
 =?us-ascii?Q?HqK5/0jqXQ2KqhoEGJRpxI5NvoCLlLahtehF1OzpyGo2KZxbjf2npy3E7s/9?=
 =?us-ascii?Q?0FH/JFoN+53bbX9oH6jAXhE5LQoiBKheiHwP/uVIr/9pPOYOOYEnbWbhjhcP?=
 =?us-ascii?Q?QcbeBkS6JqrFlcvqBLzidXsc5Vq836v7zl0sn3HReEntQPwb3SShwEF3MlSV?=
 =?us-ascii?Q?QWdt2Py6az9zp0EZTnd8Gzp0L2TAnASsoYHEkXlvNu5YK59EflEfrvDMpHRS?=
 =?us-ascii?Q?8hto+olSlQaliHhnJ6sjWMpgPE4doTM1ju4N7BbNK57Ad89CRo+FGZw2fpcR?=
 =?us-ascii?Q?Zyw0l79SzZUNaFxaOD1SZvfrNV48faxAVvKjalAj57nQkl5N7POcs4ye1sGL?=
 =?us-ascii?Q?0Zugk9h9vC0ln4XKnb52V2MW9pRg+ALEpjZxVHTTPRtCgRS5wDpNpwT/GqJW?=
 =?us-ascii?Q?7C+5ot3JY2hnMVTZFFfR2KiXVJwRN17EfN8EZt9jswB2BfFKA9YoiWvOYSo0?=
 =?us-ascii?Q?k9gDScMgAfqfceMQJgFFo4BBfyZqOA/lBht8bGIFwyT8N3pDHfUpOCT/n7nQ?=
 =?us-ascii?Q?zhJ8FiqZs576HM8sSvAMss4zDdxT0fpitbXCKLUphs3b+RCT445NNmi8f7+F?=
 =?us-ascii?Q?ZSCHRB1YpVKKk785+ToqODrZ/BRTcCZ4pViWm7/4lW9O2ZA2qE30EeZkKwzm?=
 =?us-ascii?Q?qUaqMBQq+Q65IDS1SvHPtkxArs+uvYGh5S5pOGvmimKbX92bcZqchfq6fWuX?=
 =?us-ascii?Q?zvqsmfZSvpaLttscPfKuQNNF8qlM4iJv3GC1GFJ9RXSr+5GFa/OYJIwxxbzU?=
 =?us-ascii?Q?Drt9mGCCvGUBIz4gpHMTALutR24xYT31YemvG1OVxGu4kiK5tNgoxr49CxGd?=
 =?us-ascii?Q?1bPSMioDoAfGSfl/quosh0uCqpbHK+QlyQhBXB+HJWdS6h6wsfcqT6ROG+ro?=
 =?us-ascii?Q?afuNc6zmERDEW9HkPni1Yb0SBoQoMPFq5D/Dg5KG3Es7op4Tg0SBjC6LeGQa?=
 =?us-ascii?Q?y/1yvwp37ioHuGcNRPcphh2gU/bnuAHQ2a4S9VmeEnhNJMqafnUJ5ua/s5iS?=
 =?us-ascii?Q?o8ONTTe9WSmNj18a5zq3s0DAvCBVe1BIewCwjumJA7CLE7DcyVN5mrosD3r2?=
 =?us-ascii?Q?u9ij6gU+4Ecta3KSUTF1EiJe/Cz1CBieggPaFyA0+auDgAy29yy2oW4xz+FK?=
 =?us-ascii?Q?RSAfR9hlS+KEZ8HqXTCrqKYbCZD+JlqLfCkAiFQj9tlweXQkIn5mfS2jwDnO?=
 =?us-ascii?Q?bd/XS51BCIExeuKmrZ8yHcP+HBejVwUOagvrqY2oTc9wsc30kKt01uAKGh7y?=
 =?us-ascii?Q?8c9Hpb9zGx48Ysh+X9PWFwb30Wmd/+U8weVFrgBSnOYvZRsVqdZpLKR3TS1J?=
 =?us-ascii?Q?kzt8tqx2e5w57zO6d3hSii01AB3x4nLtwo3rXHlm2P1W6f8GhhEWZaJZsojQ?=
 =?us-ascii?Q?7ugd6NjNHEZCwDIpsWSIQlER4l+2BobXcdBMPIMFkZpi7n6x1HorzvxZ52+k?=
 =?us-ascii?Q?qmQhjWspC0OCIjhCDdbyAsQnjmVeF8QGic2PCzf05I1R/sqcm4JPkqvJpZgs?=
 =?us-ascii?Q?c+p6Q7smcLAfZVv/rAAUPFFtZg3jeq9LySceLvG+z5eoL8CmkaHMpLzTfkk8?=
 =?us-ascii?Q?S2sERCy3yCVhVbjSJawiGE1M4JOs2S5TsYsekx+7CqG8paLu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50e32d-8e00-46ab-ce0d-08df19ab4e20
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:46:05.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WEwplEfgBcL90tlkRbytQjtO/jFDeaSvGoPDDJ58x7lxyX+dr85Bo0m4rN2wvLb+ITCiUWMeJead5xmQuU6aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947

On Sun, Sep 20, 2026 at 07:10:13PM -0700, Dmitry Torokhov wrote:
> There is no reason to allocate and manage ECC settings separately when
> struct ecc_settings can be embedded directly into the driver-private
> struct amd64_pvt.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> Resending this standalone cleanup that was originally posted back in
> 2015 as part of an async-probe RFC series [1] and got lost in the
> broader driver model discussion. Since amd64_edac has long moved away
> from pci_register_driver() to probing nodes directly in
> amd64_edac_init(), patches 2 and 3 from that series are obsolete, and
> this patch has been rebased onto the current code.
> 
> [1] https://lore.kernel.org/all/1426726150-983-2-git-send-email-dmitry.torokhov@gmail.com/
> 
> 
>  drivers/edac/amd64_edac.c | 40 ++++++---------------------------------
>  drivers/edac/amd64_edac.h | 27 ++++++++++++++------------
>  2 files changed, 21 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 475235c402e8..6931b7e61652 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -30,9 +30,6 @@ static inline u32 get_umc_reg(struct amd64_pvt *pvt, u32 reg)
>  	return 0;
>  }
>  
> -/* Per-node stuff */
> -static struct ecc_settings **ecc_stngs;
> -
>  /* Device for the PCI component */
>  static struct device *pci_ctl_dev;
>  
> @@ -3999,19 +3996,12 @@ static int probe_one_instance(unsigned int nid)
>  {
>  	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
>  	struct amd64_pvt *pvt = NULL;
> -	struct ecc_settings *s;
>  	int ret;
>  
>  	ret = -ENOMEM;
> -	s = kzalloc_obj(struct ecc_settings);
> -	if (!s)
> -		goto err_out;
> -
> -	ecc_stngs[nid] = s;
> -
>  	pvt = kzalloc_obj(struct amd64_pvt);
>  	if (!pvt)
> -		goto err_settings;
> +		goto err_out;
>  
>  	pvt->mc_node_id	= nid;
>  	pvt->F3 = F3;
> @@ -4042,7 +4032,7 @@ static int probe_one_instance(unsigned int nid)
>  		} else
>  			amd64_warn("Forcing ECC on!\n");
>  
> -		if (!enable_ecc_error_reporting(s, nid, F3))
> +		if (!enable_ecc_error_reporting(&pvt->ecc, nid, F3))
>  			goto err_enable;
>  	}
>  
> @@ -4051,7 +4041,7 @@ static int probe_one_instance(unsigned int nid)
>  		amd64_err("Error probing instance: %d\n", nid);
>  
>  		if (boot_cpu_data.x86 < 0x17)
> -			restore_ecc_error_reporting(s, nid, F3);
> +			restore_ecc_error_reporting(&pvt->ecc, nid, F3);
>  
>  		goto err_enable;
>  	}
> @@ -4067,10 +4057,6 @@ static int probe_one_instance(unsigned int nid)
>  	hw_info_put(pvt);
>  	kfree(pvt);
>  
> -err_settings:
> -	kfree(s);
> -	ecc_stngs[nid] = NULL;
> -
>  err_out:
>  	return ret;
>  }
> @@ -4078,7 +4064,6 @@ static int probe_one_instance(unsigned int nid)
>  static void remove_one_instance(unsigned int nid)
>  {
>  	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
> -	struct ecc_settings *s = ecc_stngs[nid];
>  	struct mem_ctl_info *mci;
>  	struct amd64_pvt *pvt;
>  
> @@ -4089,10 +4074,7 @@ static void remove_one_instance(unsigned int nid)
>  
>  	pvt = mci->pvt_info;
>  
> -	restore_ecc_error_reporting(s, nid, F3);
> -
> -	kfree(ecc_stngs[nid]);
> -	ecc_stngs[nid] = NULL;
> +	restore_ecc_error_reporting(&pvt->ecc, nid, F3);
>  
>  	/* Free the EDAC CORE resources */
>  	mci->pvt_info = NULL;
> @@ -4149,13 +4131,10 @@ static int __init amd64_edac_init(void)
>  	opstate_init();
>  
>  	err = -ENOMEM;
> -	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
> -	if (!ecc_stngs)
> -		goto err_free;
>  
>  	msrs = msrs_alloc();
>  	if (!msrs)
> -		goto err_free;
> +		goto err_ret;

This can just 'return -ENOMEM;'.

>  
>  	for (i = 0; i < amd_nb_num(); i++) {
>  		err = probe_one_instance(i);
> @@ -4195,10 +4174,7 @@ static int __init amd64_edac_init(void)
>  	msrs_free(msrs);
>  	msrs = NULL;
>  
> -err_free:
> -	kfree(ecc_stngs);
> -	ecc_stngs = NULL;
> -
> +err_ret:
>  	return err;
>  }
>  
> @@ -4218,11 +4194,7 @@ static void __exit amd64_edac_exit(void)
>  	for (i = 0; i < amd_nb_num(); i++)
>  		remove_one_instance(i);
>  
> -	kfree(ecc_stngs);
> -	ecc_stngs = NULL;
> -
>  	pci_ctl_dev = NULL;
> -

This removal isn't needed.

>  	msrs_free(msrs);
>  	msrs = NULL;
>  }
> diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
> index 1757c1b99fc8..a93e0214143c 100644
> --- a/drivers/edac/amd64_edac.h
> +++ b/drivers/edac/amd64_edac.h
> @@ -322,6 +322,19 @@ struct amd64_family_flags {
>  	      __reserved	: 63;
>  };
>  
> +/*
> + * per-node ECC settings descriptor
> + */

I understand this was a direct move, but it can just be a single-line
comment.

> +struct ecc_settings {
> +	u32 old_nbctl;
> +	bool nbctl_valid;
> +
> +	struct flags {
> +		unsigned long nb_mce_enable:1;
> +		unsigned long nb_ecc_prev:1;
> +	} flags;
> +};
> +
>  struct amd64_pvt {
>  	struct low_ops *ops;
>  
> @@ -372,6 +385,8 @@ struct amd64_pvt {
>  	/* place to store error injection parameters prior to issue */
>  	struct error_injection injection;
>  
> +	struct ecc_settings ecc;
> +
>  	/*
>  	 * cache the dram_type
>  	 *
> @@ -441,18 +456,6 @@ static inline u8 dct_sel_interleave_addr(struct amd64_pvt *pvt)
>  
>  	return	((pvt)->dct_sel_lo >> 6) & 0x3;
>  }
> -/*
> - * per-node ECC settings descriptor
> - */
> -struct ecc_settings {
> -	u32 old_nbctl;
> -	bool nbctl_valid;
> -
> -	struct flags {
> -		unsigned long nb_mce_enable:1;
> -		unsigned long nb_ecc_prev:1;
> -	} flags;
> -};
>  
>  /*
>   * Each of the PCI Device IDs types have their own set of hardware accessor
> -- 

Besides the minor issues, this looks good to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
