Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793262701;
	b=0cj9t06PHGEzHA32E7P/0r8z8oaiZCrfNXVo7c316eN8RdBxnpambQbVOQga7u+IF384
	 MtwdoHBaB3Ku3HDdEF5XXFEG24BMABFO6RZpd33+EcSBM1Yuw/9CQvWSEe8XLsUYdRgmi
	 X/0oX9TkCXdTU1E6Fc2IzpgUb3oOb38u1ES0Hq54dDSpsIG4K8ynBLZ5dvNRCkHnkCRkY
	 xE2OG+HlgSIhjrdU8FMFeOdBe0kMLJ3PPk2c/U8ffIO6VyvAZyuysXyr7PlKGth3Chs+n
	 ryDa8AgLQhtmQybu7AZoXMPYTZGb6EdemhwbuP7iDs7RyUxijxb5bEU7Cz6Sk3/dR+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=LiuRlDZ1bJhjPJfa75uKe9QUfQ7IdCFtSgzQR8XN5CU=;
	b=p/HskC6GUztVA5Y5P29yz2Q3XFMvNsbXe8CKHwQgcPIuKJaFzaoMz465hk/5dgSmkPMA
	 XSNLViHmv4IoWsh4uZCQjJn9Ta7tS99IkJTz7Ifn6KF8nA8tCy8NPDBeJBTTbPtwrb+yG
	 ky8BR2u4Osk+qvO2CK8JJgZmRNPE3D2T1slRen+pmv+jsunhkZ0wx+aqIpLu4rhg27G73
	 5kopGnD2Q2YuLcfZZnayn69DKjlfkY52USHAKY7THbZJjmfu3LK+234Mzbinu+WTnxIuN
	 vMBebARY5LqeGmown96ul4S/v+QFz/x8Fvapf7Y/IXEOCLQDHTerYVON/xvjwE67U5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="In/Wx7ak";
	arc=fail smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5C606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=In/Wx7ak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793262700; x=1824798700;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bHUDoG4Ccbk/YtZ20tCXUXTuhmFQS+xzxsMyiYLBXlM=;
  b=In/Wx7akQFz1+DcgbkNd2P0zteJSUKr6QZSkXDfUAjqh3xUSUxxkoptJ
   Bo6NhNmapHlEMFilIZWXYEHQgccXYyGxJGFSUq0MYlYOvgQLG1I48FXQw
   jqT3Hg98YK81dZ3zi+A4tVIr9nj8E4bnrQ9xdeWjBNLznZ9IZ4L/WUiOE
   SlPg4saq1EL147eQSgMcJTKE6SoU7Tv/Lgji5koOgQ7oHo9lAxQFNdYpg
   KSJJAdEsiK5ZlNn8HVPj9fW1xRts+ygOIFjgZle4gSzz485M+uuOn6Aek
   V3d6iJu4yOTNMK46yktTArylQ7OXOc4WNF78Zr+A39TgiN+rPjH1OFNgq
   Q==;
X-CSE-ConnectionGUID: CZKZCvr6RTOekwJS0NtA/A==
X-CSE-MsgGUID: FWFybP83Tt219bhvka3ADw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1881492"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1881492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:31:39 -0700
X-CSE-ConnectionGUID: INdsmjHXSSqijDu/KQZp+w==
X-CSE-MsgGUID: RiDFJGjBRmaeIzoN7L7mtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5084733"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:31:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:31:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:31:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKdaWyHrpbIChXEvGESVxdqOwz6Yn+69ZGFLEoKzwC8YGoYl0a4BKYYgCbGtzVJu3Imz7RgOv9MMV2Zb9it1LfEffTKhk1+p5UjF1bnTnWlvi9Nmiee3MBEQjorqoPWtM4kkDC+NjvPhxSz+FGItCM+laDpbq1FL0FL3YtqjXvM9mBNmiMJCZO4JV402F9VpODhOsAojEfJJdT/POhr5IPLbjCwVQHv5PpWo9+XayVir8uxasuTD1/zF/aacb+PPDOHESSdh2Ih13U3pmf9RzW9fhHaS0YxB3SCpSBRPmsGF/ymW3KfEXCoBFmOA/r+jHToQJsgu+fdpFUw03Fol5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiuRlDZ1bJhjPJfa75uKe9QUfQ7IdCFtSgzQR8XN5CU=;
 b=P9Sy6X7RG3RrFszl9asQwV/lvNSNJPKsaI24KyJWhOQ/cQerYg3dvpijukx2lCRqoQrHHmmAN+4bGUBL+bkYZullUD18QMGJLSK7F4e2jJvUf7NOhQxmzN8LfhlPZtc67M9Lpza8Blx6SVJdSBO/2XA8KxVOUqtqmhHDV+xWbQGJmfQojZNI7oj8SA6WLJpzYE9bHQ9L/p/n7FLVXJ+dR95xwWnosChzBARy44hOYNkhrLpk7R6ge3fi/Tt9fGKuRssWQPpBOsjrag68hWQMPnuH55qyPeUTSTXv7AkgCXy9TjuKvcKaKTbJacVXQ7TJnRxwnyW67JWxfQduBqJ3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 29 Oct
 2026 08:31:25 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 08:31:25 +0000
Date: Thu, 29 Oct 2026 16:18:32 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <tim.c.chen@linux.intel.com>,
	<kayracizmeci@gmail.com>, <kprateek.nayak@amd.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
Message-ID: <auMBWAGx04w5h80o@chenyu-dev>
References: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 777a0957-aeea-4460-ddfc-08df359704dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|261028144727099003|261026121527099003|10067099003|11063799006|56012099006|261026140227099003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|18002099003|22082099003|11062099010|3023799007|7136999003;
X-Microsoft-Antispam-Message-Info: SbYcu3auOS39EKblPf6cKH+4CkZPDyBysfptYfZxl4WrDKnkUd5ERPgO8439Fwl0j5eQAuhxiBt6ZNWTbmhde3d6WECno8VQ0Y+Qc3jOf67Sv6cvoM+UT9/dKfQZnVuGAjZsJhGvFybluxM7EQaPY8URpjtu5dZ2Wb1a4bWNCWUiTHySBme6TTgJA5cMYpbE06TB7YHW2hufwQmzkrpYAAQ4lfiWjI2uu6l56GAIliC8+h9TVhjyvGAP3251y2BPoCXuTiHeYLdXI7XUMlMnJ1+Pt1/6CALCIL1juM1g11tY3qorLHEcpFm3/Oq4RmiHqZJaHvrBdwDu+Uwgjy7789B2Co4b8rFyCf6Y8T0+avE2LRz0mOn3b4dIQKKoPN6v3Jfm/7QKVwm5KuP7/MQ4GLhH0KxBtMVhnRJodtL17LH/Da7quk2lYBoLoHrXWi8lL3EAIEvwzPnpTI9HIZ4Z4E8JuYm60vvsab/iaPIwH8t/UJXlYQd0tx2tSrAX47TAJolnW9Ot25iuac2WNT9P3cUUB4IG9fxd23oYwXwLmQ2nrZbnt9XeveK2KMqRez7P37GlfGuP0YCKdZrwS17+dNS32HG5d2Tf5GuK8FNh5/XoL633K3QyCzG0cCE3zrh8ZoYJAsLk6tWhjhd4O0hIT84x5jVqRAgZf19BdA6BAOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(261028144727099003)(261026121527099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(18002099003)(22082099003)(11062099010)(3023799007)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzkzbwABIpZxgYS2m3++bPHXsNGm0s92W3UbS3EZvLofzvvNBWrZRWAjJqqK?=
 =?us-ascii?Q?1cYyvypzFrpgLgWeCCjQJLk6+/vtVKh95sm5mJOKidrJK86fWJOLYBgcfzni?=
 =?us-ascii?Q?z2MIy+0w3NNpI2aS/qeBjQLTaOqAKiRUD+4lbUjD/kB7swcNaBQDj+ORjNpc?=
 =?us-ascii?Q?lNMdCLBnLmfMGV1xsyLkjAjpUM829BJBhf8rpvMEyRk7Gko+e7rGUSQF702T?=
 =?us-ascii?Q?XDzndVxrWFaqQOzcgmWxT7fCvNMlkf98psKeAuBZgbF8x/Q2yStsGRRGsaPX?=
 =?us-ascii?Q?rpHjKFwuAOPtJZehZlu5sFP3cA5eGLJqokI+BwEJFO4XuBolA5s4HCRLtfWo?=
 =?us-ascii?Q?L5W7d1LMuqe1hrIe5HRBb6Lgh4rArHiCCp7+C6V2XaQ3/hZvgB0epi+HWDeV?=
 =?us-ascii?Q?EQoAUG0+/BO9MA99jGh/kKA4i1QusmQaCLRo5Rsh77631sQUiSWeLNnwPi7Y?=
 =?us-ascii?Q?YV2PLWUw5RKumeyd1SLbfeosV7ADc47o40ZkM49o35xNurH+A3cDDuKfoDD3?=
 =?us-ascii?Q?lupfv3f7B/+XjrdCI+hrTzrQHlOJHC2L8goMnNYynjqI+FP6bHx8mK1G29WQ?=
 =?us-ascii?Q?kdi+g9ILkK14jZa89oXQ5a53YkjODe67g8jzpoBeQAW+aN7UzdgpgRFHivbg?=
 =?us-ascii?Q?iVorrOJX4Y2RFNSrS+11DwU52TffNysvxp+vomNNzGZdE/nUOv9Q8HERkhZj?=
 =?us-ascii?Q?fjxn29ZmoY6EQxmSyp/clqbxC3On5WUZ0elX3dvJwIdwwd57qJhSd8SuuhZ+?=
 =?us-ascii?Q?bfWy0EP9nTuPG4UrCbD6Hf5mRnj9voVvVisHKrV2gz0hmmJdwJfNxl0qU3hS?=
 =?us-ascii?Q?IAi52eGzU2zlZVTSDht5ZKhM89heyGKHEWyZ9RxaGHasfc1XY1BIMK3YbTbq?=
 =?us-ascii?Q?vXm3ArsD5nFjtXhcqUtniOo9g5ZIrtT4N108jIBzznQalUzEaDHfWkPGocO5?=
 =?us-ascii?Q?mXkzRxkZOzOeQ+PNgwfAaO91K0W5IdVV3ro07K2dgdDc/sD7MSPr4jn3Pi3m?=
 =?us-ascii?Q?zjyTCgYRXxUpJ/qtNrwrwpClpaEiwewUHlERqQEHtBch2Mgul3E7pTVM5AnM?=
 =?us-ascii?Q?tpHoIOSWEwEXSkR0g8rcYfmMpKP/HfeSxU7vT4KBRX8cpb2w0Vcpk3PDsyL2?=
 =?us-ascii?Q?Bxk5ourXubKH6qLaLYN2CMmq72SlgyQX28uC/zmUYQnZ+v+hwD7Jw1grM855?=
 =?us-ascii?Q?ihWo2daD691N4tFSGTCnaUgzFkaPI+4lLR1zMlL1sTNqWrHowzIwdsnFpmfv?=
 =?us-ascii?Q?4bl0NYkgnoQIdcmTADFfHINOtFUpoKL18w127tX3kjatdjPMBSMA4crnaB7I?=
 =?us-ascii?Q?FAZ5EyCw1oBCY07rgXGhzPt73mLTnhEFc3NH9bpnv5fWTXgpi9nZH8q4pwE4?=
 =?us-ascii?Q?narWGIH1TZy0AmygjBd1G607hS51kwQ+05kRKoGHfj0tnAVfPc8wrpeJOi+U?=
 =?us-ascii?Q?D0uIsJbeqKiRElfSahC10mcxaKAsm6tOx4pVw3Ce+vimRGnjH757gtLzumPt?=
 =?us-ascii?Q?crwFdmJLLacxc9cNL/cCQcm5WCaLQRuPeh/8/AY2pMOvjJ8QP7uUgSlKA+Zp?=
 =?us-ascii?Q?qhHGfpK254SRtidfb9L+ZbSyTOy52ooj+OluwgrNljq88VTJJ7pXgLdLhkac?=
 =?us-ascii?Q?3HD6bQwlvzDiCV3ljK87aOafVBr3ie2Ixb8lnJqTHEmsfVlom8YBNMKxpUdz?=
 =?us-ascii?Q?dsNCGHxEePD6+I1wnpazC22+9S3FxXKLQcGtM34bfQypBwEIpLnUgB2YKEBv?=
 =?us-ascii?Q?oSkBCKn0Iw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 362JkbFwDK96Lko6R2o2p6BKxmAGmywltwKhC9sYrEoZI5+ZdlgJcupYyrREtSTzYPD9pogJ0so493m28kLIxlWK758RoI3e+ckPVEwUSpyJBgP5Repd7Mrlc1sk1rIh/8ODcENtiHVkHkgu32p+D98WmfxxylN+fYtlJ371KFVmiP8oKEAfkBm6G5jBoPvuOMwZsscXytBZcyYaQhxGD7vPNj+ml6qPTIGwjjXYt7Qg8Tk9d4wyzoMUOphkjqrBao79wzLnoGvLdpFaLh2myRcrq4JBOJnn4pkBw5JO0+W69TssoesqWIjQZlKfQk7RLSlp3ErCszeV6x8ZUJK3GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 777a0957-aeea-4460-ddfc-08df359704dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:31:24.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 357dTsYS+bZddnrgjawQP/WC7c/P0YSYsBsuYiF+28qpNfzriEhbyLg9cgUgenBcgRtW7agmJArrgRFQ/eKCcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
X-OriginatorOrg: intel.com

Hi Xusheng,

On Thu, Oct 29, 2026 at 10:36:50AM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> need_active_balance() moves the only CFS task off a CPU whose capacity
> is reduced, for example by IRQ load, to an idle CPU with more.
> alb_break_llc() runs first and refuses to move a lone task off its
> preferred LLC, so if no other CPU in that LLC is idle the task stays on
> the reduced CPU.  Like asym packing, which was moved ahead of
> alb_break_llc() for the same reason, this is a performance case that
> cache locality should not override.
> 
> With two LLCs of two CPUs, the other CPU of the task's LLC busy and 60%
> of the task's CPU spent in a hardirq, a CPU-bound two-thread process
> stayed there for 20 seconds at 38% of its normal throughput.  With this
> change it moves to the idle LLC within a second, as it does with cache
> aware scheduling disabled.
> 
> Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their preferred LLC")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  kernel/sched/fair.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..e313c6d212c6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13585,12 +13585,6 @@ static int need_active_balance(struct lb_env *env)
>  	if (asym_active_balance(env))
>  		return 1;
>  
> -	if (alb_break_llc(env))
> -		return 0;
> -
> -	if (imbalanced_active_balance(env))
> -		return 1;
> -
>  	/*
>  	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
>  	 * It's worth migrating the task if the src_cpu's capacity is reduced
> @@ -13604,6 +13598,12 @@ static int need_active_balance(struct lb_env *env)
>  			return 1;
>  	}
>  
> +	if (alb_break_llc(env))
> +		return 0;
> +
> +	if (imbalanced_active_balance(env))
> +		return 1;
> +
>  	if (env->migration_type == migrate_misfit ||
>  	    env->migration_type == migrate_llc_task)
>  		return 1;
>

Moving the capacity check earlier seems to completely ignore the
task's LLC preference. It seems to be a trade-off between choosing
CPU capacity and cache re-population on a remote LLC, and cross-LLC
access latency due to cross-LLC migration. I don't know which one has
more impact, it looks to be workload-specific. May I know which
benchmark/platform you used to find this issue? I'd like to launch
hackbench/tbench/schbenh/netperf(or yours) to evaluate the impact.

May I know if the issue is because of the
if (env->src_rq->nr_running <= 1)
	return true
in alb_break_llc()?

If yes, to mitigate the possible impact, do you think tuning the
alb_break_llc() would be safer?

thanks,
Chenyu

patch1 introduces a helper to consider the capacity between src_cpu
and dst_cpu, no functional change:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0f2364479f9d..35e6cc7a0fb4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13573,10 +13573,27 @@ imbalanced_active_balance(struct lb_env *env)
 	return 0;
 }
 
-static int need_active_balance(struct lb_env *env)
+static inline bool
+reduced_cap_alb(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
 
+	/*
+	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
+	 * It's worth migrating the task if the src_cpu's capacity is reduced
+	 * because of other sched_class or IRQs if more capacity stays
+	 * available on dst_cpu.
+	 */
+	return env->idle &&
+	       (env->src_rq->cfs.h_nr_runnable == 1) &&
+	       check_cpu_capacity(env->src_rq, sd) &&
+	       (capacity_of(env->src_cpu)*sd->imbalance_pct < capacity_of(env->dst_cpu)*100);
+}
+
+static int need_active_balance(struct lb_env *env)
+{
+	bool enough_cap_src = !reduced_cap_alb(env);
+
 	if (alb_break_llc(env))
 		return 0;
 
@@ -13586,18 +13603,8 @@ static int need_active_balance(struct lb_env *env)
 	if (imbalanced_active_balance(env))
 		return 1;
 
-	/*
-	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
-	 * It's worth migrating the task if the src_cpu's capacity is reduced
-	 * because of other sched_class or IRQs if more capacity stays
-	 * available on dst_cpu.
-	 */
-	if (env->idle &&
-	    (env->src_rq->cfs.h_nr_runnable == 1)) {
-		if ((check_cpu_capacity(env->src_rq, sd)) &&
-		    (capacity_of(env->src_cpu)*sd->imbalance_pct < capacity_of(env->dst_cpu)*100))
-			return 1;
-	}
+	if (!enough_cap_src)
+		return 1;
 
 	if (env->migration_type == migrate_misfit ||
 	    env->migration_type == migrate_llc_task)



patch2 tunes the abl_break_llc():

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 35e6cc7a0fb4..43ce929f8ad1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10994,7 +10994,7 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
  * migrating the only runnable task away.
  */
 static inline bool
-alb_break_llc(struct lb_env *env)
+alb_break_llc(struct lb_env *env, bool enough_cap_src)
 {
 	if (!sched_cache_enabled())
 		return false;
@@ -11022,7 +11022,7 @@ alb_break_llc(struct lb_env *env)
 		if (env->migration_type == migrate_misfit)
 			return false;
 
-		if (env->src_rq->nr_running <= 1)
+		if (env->src_rq->nr_running <= 1 && enough_cap_src)
 			return true;
 
 		cur = rcu_dereference_all(env->src_rq->curr);
@@ -11098,7 +11098,7 @@ static inline bool get_llc_stats(int cpu, unsigned long *util,
 }
 
 static inline bool
-alb_break_llc(struct lb_env *env)
+alb_break_llc(struct lb_env *env, bool enough_cap_src)
 {
 	return false;
 }
@@ -13594,7 +13594,7 @@ static int need_active_balance(struct lb_env *env)
 {
 	bool enough_cap_src = !reduced_cap_alb(env);
 
-	if (alb_break_llc(env))
+	if (alb_break_llc(env, enough_cap_src))
 		return 0;
 
 	if (asym_active_balance(env))

