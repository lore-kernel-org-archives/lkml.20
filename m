Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793156239;
	b=Wt/jZaqsxSlAoodIZSAYR07WaOP4J5bNtZDelb1Jn+kx/I5eqL9imsr9fq1bqt7IhtBw
	 awRBi4CICb3kpEwZUsvm8/8XJx43hPvgEPKAAaDVkg/ruXAfg9jy2DKtECJUrjsV/gyPW
	 EVAIzgH44L/FjmvzfNnpVnJMsK5EIfc6GcYZ9GXt9/nzOhsQkc193cxQWLc4TDvA0cMa5
	 q/PtmtlEopc2ID7u1Qxjqqy+NlIpW6hUDskOD+xkZE4FCz9RllhjpzHxZ+UqpmtZQHH1t
	 iY2/UPj3NF5A/2XIM3tAiKqLQRf7Hn6twU5ecz9EAyg6S8uEwTCRvu+qCXbzJii+26Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156239;
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
	bh=13+Zm077aM0kV7IXgiKbDj8++RY3i0LqfFmoIUXvXMc=;
	b=IriqAYXcZf64R1bt945j5bvvl7anZouj+X6nHVC69tQ8Uh7tFrDdmc4TgtnHQf0St9A/
	 7ZfGJY/GpN2QbTIOu/6yjkpQ/mqsjj994INvgdIrwAH+RGH6LvT3Ssd28OgrhvSvgBl1L
	 HBDi0tNoj5mkrYBNc++Z3QnmjYSYTON4w3cQlug8uvmVirU9wkE4shwXp8gTJhowZAZzQ
	 jPYer2LQl5xH2WAgZqek5tD000P9mnRp1w2xZyTEeZbeR0466WQ1VsTxH2V3+XJGYVyan
	 aSe8z+DAtKfOiOLjHtB1IU/NKqu2cMnkVzXwvlgG2iHD0cZ8FIxaublRkvKi0m+PviQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V67Ltkax;
	arc=fail smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V67Ltkax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793156238; x=1824692238;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=a6ftOpngDLniuaTPYDOaKfj6Md/ZySyPn6iZf/zueT4=;
  b=V67LtkaxPt6GJ++sTogJ8G7DZr1Nl/OHlUw0YbarDxMEOpkWK4/4A9ms
   5EEmhrAFC2EldIFhv3QR80OhdOlMb0xkvGfFUIQsNVq3aPkvWOB/t3+4G
   V+ZZaRcwmL+WD0RVuCE3jJalZPhA68D+/K8mqua0l51z+x5bJh7A9IzNx
   1lXQxiaXybkpFWMR+dLxZXjB1qkGUCQY35i+9+OlmoeHvZw++3xD+C67L
   ClA0LGVQMxtlWTt/jBSuuNVUBPTEFwhKclBYelwSxEuGqbtA1d76McV9R
   Rp5kpdhmh9Mjnq6o+Pd96alkVQGOpS9zWm7TWn76RKT4ULwTucShkq/cs
   g==;
X-CSE-ConnectionGUID: RdDizEBwR2mIMoWkAyQMiw==
X-CSE-MsgGUID: J704Lej9TEuXrJXa0XWEeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1880360"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1880360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 19:57:16 -0700
X-CSE-ConnectionGUID: hHCGF5J0SIqpmI5Zt37l6A==
X-CSE-MsgGUID: l1C9T+feTlShJauFBeV5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4664814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 19:57:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 19:57:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 19:57:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 19:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW+NxQJAvN2EUA2a+GLCEVulUCkRlORZwcpRAzA2qLgSuxBvTR7KPRpLNsY1Ums3Ehc+98olqrY0I8fwQwpR7SROaMY8BUaDkUISDcWukBWqb+QWkCyCMq/iiB1kvY/tBeZCsJhOhPsIF/icYDDrz1jgY4SDD8B4UsjIj9ZE5/s0GEKUbpEx2NsaiWEoAAntPnNT7VsL7wHywfSxoU/tCJvyKG2vYW0b+rsmht4WZn1p1DLC5/CUEYmbmkbzYxArLophAlPVozqj4jti5vpLTC+lsef7xNlsHJLKBtM8VUC/h1vPL2RR6co6aaVNp5/AHI7LlrNnB7DDwYruXnehTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13+Zm077aM0kV7IXgiKbDj8++RY3i0LqfFmoIUXvXMc=;
 b=rJgvJ4hAehcuyEqnamcnBHbeZ0NsGDJqL3+19O/mNpuffAjvYNZu9zB/wEhnvSOVZTfwCtGehYepEEY1rUT2AVOK4D951gYYbX6I7tK//tn04TB9PKS94IuWF4+ORTQOQLbXTavVqUTBa0klbeIP0oVZYecCueKo9Dia77zZTuHpleRsTJrIB/I6sXHNW68k7HxZcXwDIYDLFP8NOOI1g7Tap9HAOenvKDK3TTwIay+1v2sM3YJZjd0bkPwoJlJ9m7x0b/QacWSQHvyK6c56rh+r1+TixY/a5AJ5fOX5Gn479auNAGdelAGid0NCBxqLweLwHRhMVKs5CsxjpwjpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 02:57:07 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 02:57:06 +0000
Date: Wed, 28 Oct 2026 10:44:13 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 04/12] x86/resctrl: Do not enable ERDT when Sub-NUMA
 Cluster is enabled
Message-ID: <auFhfdx7BWoqOeDC@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
 <40ed95c5-a103-4139-a802-893c4bc8a497@intel.com>
 <auBmvjC2ARQ_CNcG@chenyu-dev>
 <cf99e4d9-d5fb-4435-a8f6-a83add85ce16@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cf99e4d9-d5fb-4435-a8f6-a83add85ce16@intel.com>
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN0PR11MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: c319da9b-c1a9-4d8d-2ba0-08df349f26bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261026140227099003|4143699003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|10067099003|18002099003|261026121527099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: FyJCy6a7wEsmdxatTN1TKmuvWclYHd3CHDMZmgoG5IatBhcbJr3eKQF/6BToODjE5R8GG1DTZPaN/jgH9DD/ILYvkhGSRnY+P+kZwrR6FibWV1nSNl1YuAIOHUKRvnSLlL/uThN3ptGD8JkIKtqNM9x/veIA0o8kpQc/NrTM9gDckTgOIfiYuD+Nul+4cnL67ZKTlF9f1o8UkhgMseGeU9D982PqPREfLhZT8ofFXuqCRtp1+4vF3IcMXYWhmcRePbNg3TLM0p4i5ZjVAIlptWRYowm4/uhNXpFJwUqHvmKUc7RdHU8UHsZzCNRY5F/naxrXVHOD2nSGMu2QO4/zGWqXDGyrzuzxLdNqEd3Cj8lEgffS2pblDxsCAQTV8RugHo2pJ8ADuxwI4BAZ/pMYb1Q5NFYs2BeoZruFprlEeWBDRC4wY6W23kp5YptCeextgIIrh0IUDhElrt7vZxEMSj7nhat5KHiREZFHlBm3G2Gv6ddHWdGNFd2nJScm2A8MFUDkNrU453/F3nA7GRqxrjK8svl3KNVyXGvqJSb45JQmpxu7PObu8veUZPuBM/KH6lsMQ834Q7b5huFxZOAwcIvoXWv+PpD+QGYhavriWBbuCJi2bjuxEKyQE2RLKN3qtlIcLnxVEFHKqV0vfnGlmgaUcLhbHryyW3dyMuZiq/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261026140227099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(261026121527099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W99qA8sk9mAM/ONyvdHo8e6UdEOnvEu6SGv1Y5As/9XfeFXblb3ChPbjonHe?=
 =?us-ascii?Q?lRExWT8jgsG7DZackD7iIy7ZGE4448lZM/9kICisyJBUYYYRo3DYv5mCsJqr?=
 =?us-ascii?Q?h9PemxAuSvTVmtICxY72KXJ+JpJxiemso9SpCfYXN3Yj5kHVdDe4dLj1Z7GL?=
 =?us-ascii?Q?SlxRYCr+gtVGwFIR995jAiv8i49gpWKFepho6QD2svR52ooQtGX1A5034U8B?=
 =?us-ascii?Q?VBOEdXGcfdQt5ku+BMS7A7f4tDwCMytOmch8v2gNJgXXYi+oNrsZRkE+X/pA?=
 =?us-ascii?Q?M4gQMXHA8tVrImrTHwP0Za/M1QShMVxjlwYcPqBr0DEUtiB/H27I2ZFqKFDp?=
 =?us-ascii?Q?tsgP1w2TYoYOtek1SAdNvNY3IAo/zu2Q22xXjdmgfPWnpf/QsCHIZbNeODWF?=
 =?us-ascii?Q?VEs0oLqR1xxXeYgNsDyiyTep9yt6Xclfl9vjcFIb3pxTojKToA4/zORwZ10x?=
 =?us-ascii?Q?GVrBAQutLXP0UeGvFmfTFiRwE6AxYRbfqUM46ZoUjzH/T6LbnCKl+l8MSSfM?=
 =?us-ascii?Q?rHn9OUjZnn1ftTfOppAQlTyrpxpMx50DWiTPN//XOlPV9Ihy0zYhENkfzpLr?=
 =?us-ascii?Q?OTKH7CrYiNzqXj0BNhELWxk8zBiGnynpnUriQftFN2UnRo1baLAX4e9ZN4hv?=
 =?us-ascii?Q?GEOOdoJSu5S2lWntOyuRjOEIU4JHhGmteeUPvjzTP2WTIT9aItYdeLEHArHn?=
 =?us-ascii?Q?Tqctxt3fFs00D63rJjyuF194Wg4QinJQNk2ydnG+zafAt55+ivD+z9+sg3f/?=
 =?us-ascii?Q?bJRrbCkp0gdrj4IR+pZvBkNLq9jhLXSVgZOupvCbHMAJk1xJPyXujbq4ew31?=
 =?us-ascii?Q?wwQGxTGqV4thfQv9+POpKobvtpLo7FW7aL3RIXWaYgWdxBn2rkI5aNPaoIfV?=
 =?us-ascii?Q?iDmuc8zc/7hC9DR57lRvBAl6fUXrBrPmThmIu542vLBwMmQcVPxGBd8M2zQY?=
 =?us-ascii?Q?crSrm7YwW9qodqFKaWNG2s/FFKMwH0M31Jo+MNP97s1ChEjX0xvZMwpHYnsZ?=
 =?us-ascii?Q?VvFzv8xqCb82RA1aZVxHvAV7xGvWFrExDHmJ7zd0mdP+Tm9hNLYTh0mwAdaq?=
 =?us-ascii?Q?Xw8CNbhu5bgDoHy1GqV5zPB4uCZjEDqR4BWwbmrRYDnp05pdY8+rKHEEZlDc?=
 =?us-ascii?Q?HTkf1MVh8kliPFMOV5lCfd8efECBE7f8YFHI+yL+prwsFqDp8qOvrS7byISz?=
 =?us-ascii?Q?scjJPnjWKkFd+KJSDv1A9ApF8NWG7aAw8R7HRqQKoZlqEx8HsqYQpVdhccIi?=
 =?us-ascii?Q?gNaZO6CnwklYHl/KDbWcUZASDGIoHU6l++uUM878uEt/NoCSAph9acMqzUgk?=
 =?us-ascii?Q?GWaP1wNfV9F8TatWlbweRP4VOZKYPRHKV/L2yTVWN1Zq6zl+XUDiODZxzgAu?=
 =?us-ascii?Q?GomwyevwvC3f12to7PciwcTziTrAIjja7Fu3vO0RaqsTHM1UJLCg9qgv7+hJ?=
 =?us-ascii?Q?wdYskNibNJP3WB95yGaN3T6cQPt1O2rYJnQJoMJAJOahl/rS35L8u306JE++?=
 =?us-ascii?Q?I+3e5FcQAbIV3qGIKyrwXEprKJnWRIUF81JO4SY88pL4w/aIMIfHq0dRNzyl?=
 =?us-ascii?Q?eOeJmWWLWkjvRtBXAfykfvKv2WplaZ5OP+TRs1cuv4S6xjgYTs/8QtlmC/42?=
 =?us-ascii?Q?eZCm0nDrYXV4dtQXZBX80BIZnCCbvRzI+UVlKDc0J6cJc0++mZUbgkZtrQfd?=
 =?us-ascii?Q?q5TCouZDu3kS4uLM3kbz7ZPX8PYwBBwqjPPE5sX6yf0dX78kMvtIXKgds6nv?=
 =?us-ascii?Q?Md8HBDiP8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: vPn+HrfjfDlqeAFTwtX7lJo8nvnYkFriLRqoQd1xqSuo/GD0XtFq7kqFme9nJ1on9dhu9b3u7Oh2ym+XG3GGG1+XAHyabyrXtDdlLvyv51/pHgRJbAy645gj6rjdtSvhS6WK+TpjLzLNHty2AqbiVEMsHqQ042BpVut+ow0bHRkQTNi7V8q7nz4dSM4DbNEvHksG66A3v/ICCzTWazJpU2uwssHZHGgV4ZJoXEXOAB2ddpLoL478kNEyxEXlH+/NeDQmL9S8Tf98pAveroHVzGA9vMmLObbZiwiI+UB4s/SxSZ9GpXcAgc7ndy5r18OioN/RgoMlecdIOZefJQEcvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c319da9b-c1a9-4d8d-2ba0-08df349f26bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 02:57:06.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2uaDkyJPZxmIOsNB8VAu4WqkjN0uFlrbBzWvZk+8VNeUvWEusqyQIUC2TPMq0f1Ygex93WNJ7PdaiD38p7tLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
X-OriginatorOrg: intel.com

Hi Reinette,

On Tue, Oct 27, 2026 at 09:16:35AM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/27/26 1:54 AM, Chen Yu wrote:
> > On Fri, Oct 23, 2026 at 04:54:04PM -0700, Reinette Chatre wrote:
> >> On 10/13/26 7:58 PM, Chen Yu wrote:
> 
> ...
> 
> >>> +__init void resctrl_arch_update_snc(void)
> >>> +{
> >>> +	snc_nodes_per_l3_cache = snc_get_config();
> >>> +}
> >>> +
> >>
> >> This looks unnecessary. Could all these references to snc_nodes_per_l3_cache be dropped
> >> from monitor.c?
> >> Definition of snc_nodes_per_l3_cache could be moved to core.c where it is
> >> initialized now and its initialization could just be open coded in get_rdt_resources().
> >>
> > 
> > Yes, I moved the definition of snc_nodes_per_l3_cache to core.c and initialize
> > it there, but we cannot move all references to snc_nodes_per_l3_cache out of monitor.c
> > for now because several places in monitor.c use it. After all, IMHO snc_nodes_per_l3_cache
> > was mainly introduced to deal with MBM.
> 
> Agreed. By "these references" I referred to the references in this patch, not _all_
> references. I do expect snc_nodes_per_l3_cache to be added to internal.h and that
> existing usages remain untouched. 
>

OK, extern int snc_nodes_per_l3_cache; is in internal.h now.

thanks,
Chenyu
