Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21155304C7;
	Wed, 14 Oct 2026 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992627; cv=fail; b=L7djmmfJN0TrEuWajs8iq1WEGaNo7Cysoa9cwBEobw/QnB/jfSV64nXBUCyxyDcnHB3kUESNJc1P4leXj0YGGL0wPU5mJxAB/4njI7hsC2XLBDZmTmBY062R89Vz/adKYd+CuDM+Z2kBNS4lCVE3Utu19Vk72zbK48LajqQAj2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992627; c=relaxed/simple;
	bh=3tfLSyJRBi/E1b+sFhEKkksJ1h6lKxt5EPWk0GAHcNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HYIKApAurnj2vVgJC0y4pwTzDlOPMpwHsiOOlT3yeudHgEyuxWRkFHra+ceZtQEV/8Swz3WiVPoRTCg3HbLcwKSFNiU14BP7DC2/7X1Ul+ziyvD2aac1TPudvzQ9pC2T8BVCebnYuoM0GwR+z9m0NjYJ6Sdnmsdy/qboZpdRztM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VngA/WA5; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VngA/WA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791992625; x=1823528625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3tfLSyJRBi/E1b+sFhEKkksJ1h6lKxt5EPWk0GAHcNE=;
  b=VngA/WA5w6ihUq3LjvKr44KYx/j8yzsnEWl81woH2QqSjaXFz1OrosfH
   q68pLaUkIUbSyMSASVfZdVDFHgohgdBsYdiWX0TzAs9t4C/tNXqazbKXf
   sIZvfBPbdW+95AP9Gwr13zCGnAV1VdvcJFBygdE11vs8KCuFVOGcoB7bl
   T0XuxJihCFQuu/p8hvI+mzPP9Wq8h4NYtYKWNhzphy5T22iHiQr+6VnkS
   rsSb5UJl7Mw9Fdu4IOLQAZvYgDgXl1CSzzY6LImUYHuaEmIEwbOhPSLxF
   eM6NQV29HnDiacxhDxCecQFfiXKt3OU11VdH8O3ILH3THqJj39PpGJ/ua
   w==;
X-CSE-ConnectionGUID: WSgBpO2JSqCxDyVisAsuJg==
X-CSE-MsgGUID: zidaqg0yS36rxKlBmCDi4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="750752"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="750752"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 08:43:44 -0700
X-CSE-ConnectionGUID: Ovkv+tcqS7SzmkrK9+WDXg==
X-CSE-MsgGUID: Tykhq9HzRXSHg5iiJKLSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3300681"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 08:43:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:43:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 08:43:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx8OCMricEDmOYSL8DNzomwbUZkz4CaLMnUSmM0wiQHKYXIn/pL8dJqvedC/H/iZmnlA40MFflJCZjDSOeynFIQylLNJwO7yeHeGghHmAwBemOjEQfGY9AZdK0/UlG9vtVKVxdt8H1SfkhtIZ22ag+sQbx5TONN7N5KNtokGIBM3bhbJsTY02V2PU5LVKq2FpN2J13XgjHif06ZrhapfHq7IwTYE1saN4V08ULTXzqEVM/FzKWCmbpBTrqJW8xAeg7h2wtyZeebxTPX8snGt+phbCdyk8rSTOzTkM+I2X+iU5vMo7Xcl697yVu2+eCJ1Ah08AbCqpi4HVe5vm3p8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tfLSyJRBi/E1b+sFhEKkksJ1h6lKxt5EPWk0GAHcNE=;
 b=uwyqyymUJms+6f83n+D0TTbe1c6bWCAfF9p/08Siqo/T+5qepR9HkJEW5Y/elphLYOdN+uEC1hr6SRhtIk/IRiqSvmDVzdsSbNFznv5eLU4HQ9xa321q33XhG7jw4rItR/o2A4/BX66G8RbLQ+NrQ7XtynFvJ6KbkBNmDSpj0/9I3A3Hro6407Od6Q/ycS+Me8Z1J5pj8Dv1FUcTPmRmvx5MnC81ndbEiS/5ujKJoRMQVQF2fwCjeaXx2o6oToZN7XgbN+eWG4TvMqPRFvcffVd36PsmpGYvWLzc9KTWHl5RDmylvRExmwOTRxvIe+vKFkOF6pBwVSEYpSEo1PA9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 15:43:30 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 15:43:29 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: =?utf-8?B?RWlyaWsgQsO4ZQ==?= <contact@optocloud.no>, Borislav Petkov
	<bp@alien8.de>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] x86/mce: Reset stale per-bank state between bank scans
Thread-Topic: [PATCH v4] x86/mce: Reset stale per-bank state between bank
 scans
Thread-Index: AQHdW9w8nHO/63kehEK7W6/b53+cJrb9LW8g
Date: Wed, 14 Oct 2026 15:43:29 +0000
Message-ID: <SJ1PR11MB60831B87779DCFB0929907BFFC9D2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <kUFp15ffSyDl005h7gLuz1YQ_jDrCgR96A_Q5mxzpXl2BmMNfFHo8hivkv7Qx6NZ6M__9iM0s2nFwDnjcBO_wcJ9-jHHIp8IrgfylJ0av6k=@optocloud.no>
In-Reply-To: <kUFp15ffSyDl005h7gLuz1YQ_jDrCgR96A_Q5mxzpXl2BmMNfFHo8hivkv7Qx6NZ6M__9iM0s2nFwDnjcBO_wcJ9-jHHIp8IrgfylJ0av6k=@optocloud.no>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW4PR11MB7162:EE_
x-ms-office365-filtering-correlation-id: cd5af10a-5796-41a8-362b-08df2a09e540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|10067099003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: sJOJ1uK+yt0W7TlQGOhi9+J1q2N+8AMYiMcx8eqBnK3iTPwrExoBiwVOnxaf2Xt2p6tZ0pU7ATDxgugI8jj76NwcWBuqqML+TMcTFJufDFZpqoCrj8/qoeFQt6YtYIBh2BSzfuWkKPlFdhSFxeoxta2OgQxCPnZd8oXfkvo56FvyXys8IyjGjIlvGJ8fHJ1Ik+82uXKoiuRdEQAWvod9+HNRi1mruJfoMbNCQUPDs5b36AmvYCdmr5TxE6T5biXWxRJcJHn+Ee828WBQgLBnZ/hGxoO75IYCqWQmLYX80o2HDvWRdQVPhLM9h66dP9iYSP56xsQmvYX8EV+IJFVH4MdEL6IUxy7aY8d7P112WbjI0CwzoJ57sIgoBjeMUuKwSN3JsDtLcTCInLnBJ74tg5Keb0K8WX7FVS7zkbg11ywK3BX3yLJpEnF7AdKM6WHP/8GOQXbmoTaYtdm1MyGn7OFDO/pDVlxJPn/BLz5HCRQUe6TQ0Fo6abxov0ne4+4BCVcdYMH7gGdBcTqFrvzb+OwVh1UNNm3HvLeW2tuHTDstIHteXAATulA210x7d79Os6E8s5XXd2zRjZ11oya0iw/jL8Bp9avfs8hA1ZMlB1siLXy96C1WfAqBd3/UHj+1gjxPCJDS4A0MO2otufXEru2RiwKNH/0V6Vxi4Zv/BiIVwE3YVAKshwQXIlA/bzQnOrnbtlj75dlD+nB3vKjb3hSuPcRYcNuzJgdbn9AfrLo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzd2S0xnQkNUb3RrT0FwSlBFdHkyL08vTVU4Y0hHWDlRMnVpU0RnZGE5cGg2?=
 =?utf-8?B?aVNFT0VnMGl4bmloR2t5ZlU1WUZWNHp1eks2QmZrc2pFL0V6OWdyRlRFS1Jq?=
 =?utf-8?B?SWJHc1BoV0J3aGxCVU5FcTRRZ2dXVElUczJ6ZTJkSGQvQTdVNUdINFJZSy9a?=
 =?utf-8?B?Y3U2TklFU3NRczNIWWMvQTZkdjV1M2NpRFdyWXUzVTRidFJSeUhYZ3I1V1po?=
 =?utf-8?B?M2lMeXFiQWxGb255ZmJ4SUliK0lBWGVjUW1ZU0ZOeWw1KzdUYU96cG04NGxO?=
 =?utf-8?B?MHVRNWE1SGVFUFllelVnVGw0NTZrWHArNldJSFpEcnZEaEdQZ2tIWVVQVTZs?=
 =?utf-8?B?MVMyRHU2Z1pIQjAzbjRvV1gySzBOZEdMYmNPOWpuUk5kWStzVFNGMTFYbUhR?=
 =?utf-8?B?aXBWNSt3Mkg5WkozRUpSVU5lcWJNeEw1MUlaWmRIYWZxTXNyN2Z1OHo5SUFF?=
 =?utf-8?B?dmVwVndDM2U0ZmFRMmZIM1dGRHBTcnRKd1FwcHN5d3FmVUExcU5DRzdDYXdN?=
 =?utf-8?B?M3lnWVVCcXVidFk5UUFVd0VWUXBnc0szYU14Rm5Ua1FRdGcwY0NTNW1tTkx3?=
 =?utf-8?B?Z2ZuM0pTMUlhNGdnV1BoaTJyd1ZXc29NTkRRR2NQRzBKNlpiR1h0MjVJdjUr?=
 =?utf-8?B?KzU2QTFwUHBlT1ZUd2FtL3pObXRPbytqS1JJam5kYXMydThPNDV1b0txOExE?=
 =?utf-8?B?cmJOVTA3ZW5zYys0WVpQYUF4ekIrLzcrbyt3Wi92TVhKQWZkN0FmYXgxd0Fw?=
 =?utf-8?B?WFREMFRyeGdaVitmQzdBYzljeDFFbmw0ZitvRTAvTWx4UzBwRWhZbGNIekkw?=
 =?utf-8?B?YXdOZ0pvR283aERXNHk5bGVWcS9pbVdNc0Y3cjA5WXdjYVFLVU5RMXV2YVpT?=
 =?utf-8?B?NEhWUll5WlZwaDZDbWdxQ29qNldxd244ZVZDRDZUbEdta1p6OXRJVjdxakFW?=
 =?utf-8?B?ckFNQ1JrODJSVEowLzBNSllMWXB3d09xZk5LOWNMVUF4OVN1R0Z6Z1A2S3Zm?=
 =?utf-8?B?ZEVrbEdZcWEwQ0g5MktqQ0k4YWVIUTRrUzc0RWEzbGIraDVnNWFtNWVibzlu?=
 =?utf-8?B?bStTd1pHK1VvbUxXeHAxRlpUL2c1S0VPSElKOS92eDV6Wm9SK0NxL2NpY09h?=
 =?utf-8?B?d3RyaGt5UytWak5uajdMUUJuZitWNjNqTzkzQWtFN2toNTZEOThLQzM3Mkg5?=
 =?utf-8?B?T3RpZWFRbEM0UnpqSkF3UkpMdjNuZUJoaDFrQTdqNUEzbDVibVpEYTU3K2lz?=
 =?utf-8?B?ZWJwa2RlK2lwTDFDUnRhVjFaRXVVbUpSL3NSYnZxTHE3TkFwT0tSeDRnMXE0?=
 =?utf-8?B?WkU1a2F5YUJRR01sdDJjVWYrZW5zMmtkeGdMb1hNaGRMUnBIQzh6YTVuWlJa?=
 =?utf-8?B?dHFiczV4NjNCYXhsODlVMllXaitVZFZNMjN1ZFlhVSs4Q1AxbmJabXJCS1o1?=
 =?utf-8?B?b2xwODR3V1B4b0tjelBxUUF4bEErbzhTaEdUVmNwRXl5YVRoZ2hkMzZ0aGJT?=
 =?utf-8?B?WmpnVFp2NmJsM1lpcEZBWHVVc2J4S3JTTXZtRUEzMU1qVTkyWnIwQzJ3ek1W?=
 =?utf-8?B?bEZiekdBZm43bWJFUGFEZUJYc3RQdGFzQkhCV3dkNUtRQmFib2cxN0lKWHI4?=
 =?utf-8?B?ZFFHS2lpRlpYQ1FzczNQbGhmWm5mZXdsdlpVODdHTS9lbXhaVHV1TTdTWXNr?=
 =?utf-8?B?NUg1bXVPeGU4RUdPSVlPUEJUTlAvZEFBTnhTeGgrMGxqN2FSdE9kMndUdXJN?=
 =?utf-8?B?eUNUNGZMVzQzS1AxS3N4akJ2NzhSdVJYdTIvRjhSR054UDhxbDRaVFFCSmRu?=
 =?utf-8?B?RTFRemh2emIzbVA5TXc0R0JKWDNTN2NPcDZCRWlidTA2TFpvV042bTdWMGMz?=
 =?utf-8?B?SFFRdG83V3ROQ2dIbWZMSStkRzR2VVNzS1plc2ZHM2V3d210RytHZVZxMXZr?=
 =?utf-8?B?R2RFZHBCNitXcU9QRmVkcnBHa0RPdlBGWVE5cnBHa3BZYkduaTdldlkxNGJy?=
 =?utf-8?B?cU9WVHhGL0thR3kzYnQ5VlVhcGJFM0w1aUljdDNycThwV0Z3QitaTnQwWFNw?=
 =?utf-8?B?VFBOMi83dklRWjVjMEtMTUx0eElYY2hSb1hJOG1mUWYzNE1Ed21VdGx0dU4w?=
 =?utf-8?B?UXpvSk42WXlhT000RDg2WkI5R2VRbm1FckJZa1NJUFM0RGFERDBPY29iVzlz?=
 =?utf-8?B?dWpYUWVWU3RvZG1Pb1NhNVQzSEFYRlFWMnA5VkE0M0xWek5TcnZ6VjczZTNw?=
 =?utf-8?B?UDExOUhrNkhOZDQ4Vndack55M1VxZjV2L01Vb28zV1Q2WHZXY2t1QWlMUlVU?=
 =?utf-8?Q?eSoiI31MVrdiG3U0OS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: R3SNUA5gWkjEqCkmjKlGnorEG62hpQLbNAcds8XtzwynswavF4+BQ+f699XbsJ77mynpz8yqQhE/2sJFcsokbiBijZh9Hin1YIoL/gE4S7YobtsWmoJL9afgLB9sijnd0hkzEggFEyrv5GJsQjom70YUtHZt9+Pwytw6OKeiRyrbxk14w5kV7XwUAGF3460ip6drJZhKuXMrm6GBdQb+2deEpec7jzzDoYVT/1bXeRmQD4g5PqGU7wkOUeP+jKVJaDkCf/0Yd/mcOPCuTFCs/Msc6tm9GDEKC6x9w5XHMmeSyKmo3EFggzzP6mfvDxGAufaGm7RVKX7SCxSTNoRtQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5af10a-5796-41a8-362b-08df2a09e540
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 15:43:29.8965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWFNNFC0DOyayXlw68rbalAqQljEVi0VjAR0A/+B+D4ZCHKAX3Kng7SIe5is767at7n5RX9Gwb9xiHojL902qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
X-OriginatorOrg: intel.com

PiBGcm9tOiBFaXJpayBCw7hlIDxnaXRAb3B0b2Nsb3VkLm5vPg0KPg0KPiBtYWNoaW5lX2NoZWNr
X3BvbGwoKSBhbmQgX19tY19zY2FuX2JhbmtzKCkgcmV1c2UgYSBzaW5nbGUNCj4gc3RydWN0IG1j
ZV9od19lcnIgYWNyb3NzIHRoZSB3aG9sZSBiYW5rIHNjYW4uIFRoZSByZWNvcmQgaXMgemVyb2Vk
DQo+IG9uY2UgYmVmb3JlIHRoZSBsb29wOyBlYWNoIGl0ZXJhdGlvbiB0aGVuIHJlc2V0cyBvbmx5
IE1JU0MgYW5kIEFERFIuDQo+IEZvdXIgbW9yZSBmaWVsZHMgYXJlIHdyaXR0ZW4gY29uZGl0aW9u
YWxseSBpbnNpZGUgdGhlIGxvb3AgYW5kIG5ldmVyDQo+IGNsZWFyZWQgYWdhaW4sIHNvIGEgbGF0
ZXIgYmFuayBpbmhlcml0cyB0aGVtLg0KPg0KPiBPbiBTTUNBLCBtY2VfcmVhZF9hdXgoKSB3cml0
ZXMgU1lORCBhbmQgc3luZDEvc3luZDIgb25seSB3aGVuDQo+IE1DSV9TVEFUVVNfU1lORFYgaXMg
c2V0LCBzbyBhIGJhbmsgd2l0aG91dCBTWU5EViBpcyBwcmludGVkIHdpdGggdGhlDQo+IHN5bmRy
b21lcyBvZiBhbiBlYXJsaWVyIGJhbmsgaW4gdGhlIHNhbWUgc2Nhbi4gRGVjb2RlcnMgYXJlIGV4
cGVjdGVkDQo+IHRvIGlnbm9yZSB0aGVtIHdoZW4gU1lORFYgaXMgY2xlYXIsIHNvIHRoZSBzdGFs
ZSB2YWx1ZXMgYXJlIGNvc21ldGljLg0KPg0KPiBBIHN0YWxlIG0tPmtmbGFncyBoYXMgdHdvIGVm
ZmVjdHMgb24gYSBsYXRlciBiYW5rOg0KPg0KPiAgIC0gc21jYV9zaG91bGRfbG9nX3BvbGxfZXJy
b3IoKSBzZXRzIE1DRV9DSEVDS19ERlJfUkVHUyB3aGVuIGFuDQo+ICAgICBlcnJvciB3YXMgdGFr
ZW4gZnJvbSBNQ0FfREVTVEFULiBBIGxhdGVyIGJhbmsgd2l0aCBBRERSViB0aGVuDQo+ICAgICBy
ZWFkcyBNQ3hfREVBRERSIGluc3RlYWQgb2YgTUNBX0FERFIsIGFuZCBhbWRfY2xlYXJfYmFuaygp
DQo+ICAgICByZXR1cm5zIGJlZm9yZSBjbGVhcmluZyBNQ0FfU1RBVFVTLCBzbyB0aGF0IGJhbmsg
aXMgbG9nZ2VkIGENCj4gICAgIHNlY29uZCB0aW1lLg0KPg0KPiAgIC0gbWNlX2RlZmF1bHRfbm90
aWZpZXIoKSBwcmludHMgb25seSB3aGVuIG0tPmtmbGFncyBpcyBlbXB0eSwgc28NCj4gICAgIHVu
bGVzcyBwcmludF9hbGwgaXMgc2V0LCBhIGJhbmsgdGhhdCBpbmhlcml0cyB0aGUgYml0IGlzIG5v
dA0KPiAgICAgcHJpbnRlZCBieSB0aGUgbm90aWZpZXIgY2hhaW4uDQo+DQo+IEZhY3RvciB0aGUg
cGVyLWJhbmsgY2xlYXJpbmcgaW50byBtY2VfY2xlYXJfaHdfZXJyX2ZpZWxkcygpIGFuZCBjYWxs
DQo+IGl0IGZyb20gYm90aCBsb29wcy4gUmVzZXQgdGhlIHZlbmRvciB1bmlvbiBhcyBhIHdob2xl
IHNvIGxhdGVyDQo+IGFkZGl0aW9ucyBhcmUgY292ZXJlZC4NCj4NCj4gRm91bmQgYnkgY29kZSBp
bnNwZWN0aW9uOyBub3QgcmVwcm9kdWNlZCBvbiBoYXJkd2FyZS4NCj4NCj4gRml4ZXM6IGRiODE5
ZDYwZjY3MiAoIng4Ni9tY2U6IEFkZCBzdXBwb3J0IGZvciBuZXcgTUNBX1NZTkQgcmVnaXN0ZXIi
KQ0KPiBGaXhlczogZDRmY2ExMzU4ZWE5ICgieDg2L01DRS9BTUQ6IEFkZCBzdXBwb3J0IGZvciBu
ZXcgTUNBX1NZTkR7MSwyfSByZWdpc3RlcnMiKQ0KPiBGaXhlczogN2NiNzM1ZDdjMGNiICgieDg2
L21jZTogVW5pZnkgQU1EIERGUiBoYW5kbGVyIHdpdGggTUNBIFBvbGxpbmciKQ0KPiBTdWdnZXN0
ZWQtYnk6IFlhemVuIEdoYW5uYW0gPHlhemVuLmdoYW5uYW1AYW1kLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogRWlyaWsgQsO4ZSA8Z2l0QG9wdG9jbG91ZC5ubz4NCg0KTEdUTQ0KDQpSZXZpZXdlZC1i
eTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KDQotVG9ueQ0K
