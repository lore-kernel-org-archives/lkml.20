Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020081.outbound.protection.outlook.com [52.101.195.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A506B1F3BAC;
	Fri,  4 Sep 2026 00:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483491; cv=fail; b=iWb86sv8iHawENoxrp0dnN/BRIEQMfdEJrlTPde38nwAiarIqdW9P6C3W2MiWUB5XI8+sMBOsoKPWI6nMfeyWp8q16xmS/mDsoxUMIgw/97TFhi5crzgG94OMNxr9dqWFdtHV2/JMyrqXlNvVm9UFTM/HUwNXRuToE0W7+IWcHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483491; c=relaxed/simple;
	bh=PHu7avWitKtp4xEnPW4En2Rs6etPN8xMVLQK+P+W8yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JSr3t+4BslPjwEu1UZAOmDiHgZpjSawF9F+mWa48+s6F3pJn3TC2IGMroTB+lxvoj+yjn8xxxK1lpSOZPUOI48NZzNWdHawI6knwPP1Ix2CDcqRZSzg86bkqDpXYtoTYjcQwVRH9hv8gCfzGtOuJAq0BKUpY3nPD7CNCvvdkfyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAC6v1sgIxD3bm5Zonwm7vz97ps5z4q9m5WwNBeUW/0CQlti3HHqpFUHeCktjynkHnWXzHgulQvvCknSStf48E9yfTEaZ2uNplpHmtZJBIeD7y2yATvhZrJ/ycbW6fuMcSNl0JYAASgytxlcsBFd5kkhe9jbURfD7+xtf1FbC/qudvUs1HcY/g0HB1+LF3pyBsjSk8qEJpey08UIZOk6zF2kVtUusdZrSIvX9SxB7neYWM6WdRBUlOFOTYF36HuIwuB/KT2D3pF0/qKMYyOLqe1+gWjq+70BVAAOSdiN0jtlkyh51vreciUalXuzUl0s/hFT4YCw4tYngt2Iq97qsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Poinp+t0wVpSsZqZSDZRbrDNoAdlLsReSDpR+4H2ZOY=;
 b=ncMGjCjbpusWJbl8CYPNRhY+DcZuRF1QgFnR9TnvMrXgm0AXSnleIF5HmVssLrKM2vWRQaq4Z2tNJXnv0HieaY/VR5DwCY4jAW2/soO0x1hzaYimZeSVgt7Q3tYRQzb9O6FjqNpyWucoqM7V3Hy3WB39toymeDv2AnOGe+ycm5J9udINEaQap9MRSrdAfSUrB/MsF1JQvNET0Wl3c7AHzIW69QnqZy3Gg+9KpiDNzMjJw6Ljn5QcsDQYJFlAbC0zqWz+cy63NzdrgqjJYKdq7iXra95k07g7MRkCU/fXJ8uhHPUULioNBdtdnGYBJdpd8OozEYRnoNs8kTAUu+JnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB2731.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 00:58:04 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 00:58:04 +0000
Date: Thu, 3 Sep 2026 20:58:01 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <j5usyrhkyvsyt5dinnpqdzv44jxfei237vadrbixoz3dp7sbyh@x5agammxe3gm>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <20260903221745.GAapnyCYVOL0qeip6N@fat_crate.local>
 <3we2xmx4fwgrgj7ixnkeskbht5yxsgzgffy6yn45xxvdnl4nkz@6yktlrqvgwcq>
 <20260904004528.GBapoUqPa1vDY3TP0n@fat_crate.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904004528.GBapoUqPa1vDY3TP0n@fat_crate.local>
X-ClientProxiedBy: BN9PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:408:fd::6) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB2731:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3aa962-f7eb-4551-cc30-08df0a1f936f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|4143699003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	g21rjgGPXQZjgHgIQOdivX7szTtTm9diw5zrjLewQ4QW9FsfuHm8qTtus86HTSYeBXOqduJgP5vlxthha5UsbkLCGAX6LwZbjs6dk36U6B5EzjNpaLz5fUIwzloHetB/LVDIxEnUg56UK+sTQQUrhFQZaKB6NVgacBrqeSotZxMSU/JsTNPEK8e1C4BTKrliytIKf7gpi6LTPIAcsR5q9pg0sNmF2ywCiRfw9gTkAQcCQjjKbsb4CNZI4LfLNTWR/Gz+xJPKwKPCm9S5n8MYXD5BlrkoVAsm/d2dZdbB/FwCwOSPaqb87h5wsPj7RfUzz38Y1iGpg+ybxMIpEGsISccuyiqdge53OiosKaUlk5itVnJRIoGFj+WqYqhIPTMvP4UtLVbVIcXwC5toByYsyWs6ltapViuGAWSw4VHxtX7h2kiYWnwQp4pAePy96PkW5ZNvVA553NpeZCwPe1pkoJ9lMFvI7zm0ophWCkqJSdtF9u6tIDnhlHPp7QhOtpsCM4Sd/czX+r724TTMmw8lMLD5Moq0P9zXGoAT/88Anm9F2blenNbm7YR7eES920ZyrvnPF4FDg6KZ6oYhbVC5gfF//1B/kFwCaO/au3ngENlx2trsWZu057KxfvMvEWKGmjBW6jWpSyJLh0mB9iGISOjHjgM/2yuqB8gKBAlxuVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(4143699003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZFUkR3VUdiYkpmb3I5STB3RkJoRTRqQTZxM0phZ2JOVWVRMExCNzJydTZV?=
 =?utf-8?B?S1hrUjcyRmNpNFdLS05OZGJYZ0RsdkpMT0NuZ2ZPOXFpUE51a3YrMG9iRXM1?=
 =?utf-8?B?ZlJsR1JPbjJGZXc4OWlkME1QRGJLd1dwWTJKQzJJeURNYk5RTnJLT2I1SGE0?=
 =?utf-8?B?VnZCc0JqTjVoRXkvWU91K09yc1JYZStPL1VWaHlRbzkzK2NXMmlIY2NlczNw?=
 =?utf-8?B?cUFGbG5Bb1FldWVtcEx2UWVDdjdTL1VOd3c1M1JWSWNJVUk0eExVSXhrNUpG?=
 =?utf-8?B?dkNqYkNETTZCdHJ0c0QzQU00bFpxZXRiNUdDVEJVU3F6d0F3eUl4cVBCaGxx?=
 =?utf-8?B?VGppazc4RVRPNWZTMEh5MDBlOUxHMFRYQ01KV1VCdDhtTkhzRlNvY2FZT2cx?=
 =?utf-8?B?TFZOd1hxNS8reDRIK1BNNXBKT3ZmM0NhNk5ETkNYZWJIMDRXRUVOWlJGbzBj?=
 =?utf-8?B?K1BoOC9PVnZ2WTRaYVRkRThKRE1ZWm82aVNveGc5WUVpOHBsWlVhU29yWGVL?=
 =?utf-8?B?NjJHM1JOd3NTWlRkeG5za2hDZTJNbXdQWW10NU5YanN1TlVlYVZ6SVYxWEw5?=
 =?utf-8?B?STdIS042TXRxc3I2bFdVRTVWaS94R1Y5K09xUllmOGt1NVVzSUN4OWVDTmxT?=
 =?utf-8?B?MmRVdVlvaDJvcjZRR3AzWU02Yi85eW5QMWxqY3ZBcHJneXNFTjNjNHZEQ0I1?=
 =?utf-8?B?SWlpMTJXZitZLzZLZ2lIcmdCcHZSakQ2Rmt6SEJaRWJjSGpGS0ZxNEFmckpz?=
 =?utf-8?B?ZzY4OEJ3MUVkRTBrVm1DSVhLaWVSVHVUUHNkaWR6NzUrVjA1NnNoUm1GNmtl?=
 =?utf-8?B?V0lIK1Jyd1J5R1RzdGlZRzVReVNnM1NXQW0yR29Fd2JOY2dRNWFxZ0doT3Uz?=
 =?utf-8?B?L2p1MFoxSDM5VjlyUENLbUNRdGx2aEc1NTg1RzhYVzVHMWN5Nm0weUVRZzUw?=
 =?utf-8?B?T2Q3ZDRXUy91cVZldnpjQlZuYUhZRmhoeW1OTnkyZmJtcUVWTmN0OHlERE1Z?=
 =?utf-8?B?UHUxN0k4SVlGcWE0UWswMXRPakQzMTc5aklxRGNuUmhCdlEzZmUwaCtkbzht?=
 =?utf-8?B?TExldmlrUjlNaEd0STM5UWRJamQ2RWowa2UyR0VVenB4M011Y0dyUy81REFq?=
 =?utf-8?B?TmxRYy9mNnBJNlhmSVJCbTZ3OXlNNFhYU0hodG55SFpTcVJzdlBDVWhWUGJN?=
 =?utf-8?B?Vkl2bG9oVWlpMnZ6YTdPbzd2NFdZbzFsMkIrYkU2NWRNL1l5Wm5IVnh6azly?=
 =?utf-8?B?OEhzaDBrL2Vqa0czOUxTNkR1cUcxWEJNZnlHVkJVbGxLWDRzZ2ZuTk43RTVl?=
 =?utf-8?B?SFIralhqa29DTllrTkJaTkNaUnJhYUtaZUN0UG52eWVnNzJSTStZU1QvblNN?=
 =?utf-8?B?bVRycDNQTWRvVkJBY0lWRVl3WE51elhiRUdxdDF5cU5RSUdJWkJ1KzZ1SzdE?=
 =?utf-8?B?QTlyWHZlaTN6UTNHM2hhV2E2VERmMnk3bHZLSnUwaWdBVTE5TU5ML0JpclNI?=
 =?utf-8?B?N0xEeGE2bllVdXArMGtNdCtnbDdZNVdGNHpiR05TVVhjclVIMzFVK01YUFZy?=
 =?utf-8?B?OW11em5kUkQwTVVZa3UvYkxzMk55RmwxN0wyQ0RvUk1WZStDdkFyNS9sampo?=
 =?utf-8?B?Nzk5NTkvTERUYTRzaEpjN2Q0dXF0SG16MTU1V2FDMTZCK3pnci9yQVJTQ0pt?=
 =?utf-8?B?Y0VBa3FNUTNGOUIvWmgxaUQvcGIzakIzd1BNK0ZmcEc1cnZNbk9lS21oRFBl?=
 =?utf-8?B?NGhzMFd1SWRwdmxZSjFsVVhraXlZVGFqcFQ0OUEwNE9TQzBKalRodDZYZS9v?=
 =?utf-8?B?T3pYSWZLaGFPNkJpWjRLZnZSNDJRUUdaS3VJYXlHcWZ5WEJLSTdIOHFuRW5N?=
 =?utf-8?B?amlubWk0bEVpVmJKb01tSCtiWFRMOUlyM3RKRTFwQWdROC9MaTdtZXdxZjYx?=
 =?utf-8?B?dkMzRjZrenY4R3d6Wm1LeUlDTUZLY1o2UGFmRmhYWVdCb0t1cHZ4NnBrRjZl?=
 =?utf-8?B?N1I1VVlDOURkY09FOFpCb0ZHOGIrRE9vb0xhb1JmMEJNTmNUUkQ1OS9xZ2Ex?=
 =?utf-8?B?cUNmdUI1VXR1MnMwcHJySG1XSURIYXV0b0pyWW1BSkpqZUtZZFZJc0llRVgv?=
 =?utf-8?B?amhrVkNSR3FoQWdPaEZmSW4yajZLZFZxRTR3MEgycVVBMjRRcUpjT05rTzd3?=
 =?utf-8?B?cUNhTTZsSUhwRkp3cmF5TDlHMmI4bk94c29ZdzlIelF4eFlONjN4T3piUWhI?=
 =?utf-8?B?Y1JmTWlvclY3UW5KTVoyQVNIMkpiN2gwVlNZd0R6SThodkJhekU5RVBXSlYx?=
 =?utf-8?B?b0dyOS9XWFpRVStZQ3NFc1dhZE8rM2pyT1V6VGluNk0wNDB6N1FFdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3aa962-f7eb-4551-cc30-08df0a1f936f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 00:58:04.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOqv3RfFM4XhlwAeYiaXsHZimgpE0N9Zt+qOLkfCmliG3bvYHrC/6F1rbo7VFWRdid9BhL8wk+aMHFBKAGq78Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB2731

On Thu, Sep 03, 2026 at 05:45:28PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 08:30:40PM -0400, Aaron Tomlin wrote:
> > The rapid cadence was not borne out of impatience, but rather active,
> > iterative engagement with Tony Luck and Marco Crivellari to incorporate
> > their direct feedback, alongside addressing pre-existing issues flagged by
> > Sashiko. Each revision sought to turn around those specific corrections
> > promptly.
> 
> How would you feel if I am doing a patchset and I send you a new version each
> time I fix an issue there?
> 
> That's not how this is done.
> 
> You collect *all* feedback, you reply to the list with your feedback to
> Sashiko review so that people can see whether that is going to be addressed or
> it doesn't make sense after explaining why, you test your patchset thoroughly and
> *then* you send again.
> 
> You don't have to wait a whole week but you have to give people a chance to
> take a look at your pile. Note that you're not the only one sending patches.
> 
> How about you try to review some patches of other people instead of only
> sending, while waiting for people to take a look at yours?
> 
> And perhaps test some -rc kernels and report issues?
> 
> That would be of immense help than simply only sending patches.
> 
> Balancing the generation of new code and reviewing of other code on the ML
> would be the optimal thing to do, I would say. And very much appreciated by
> maintainers - much more than only sending patches.
> 
> Thx.

Hi Boris,

Fair point, and taken entirely.

Thank you for the guidance.

Kind regards,
-- 
Aaron Tomlin
