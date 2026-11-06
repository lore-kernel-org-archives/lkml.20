Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793980288;
	b=oIUQuvVexSK9FKOcizta8DPbzz349nhg10zmsLWVrlnQ2Ro1A/l7Shp7Frnmsx8cZ8l6
	 jCDLhPl2Tdms2mNJHBYWXFTI0K81ruoip1XZXPz3aKYcsf4eC0xYIByoRvE66FoULqvCF
	 nyKUs4dNJT1M5FENj9JW72LREf6sT3asEy+tvELJfxNumJgVTFL8S4H6RJXx1VEMxyYXU
	 idtcqtlBcQCwagZneK0NJbSqxcVG0NveRTh/T2Aw/tiKfV1xHhqnITF3fm3s1Mq3uN1ro
	 4CGJ3MVovW5eei6Ih9QKLX0rAS85icOk/swGmYVV+j2CP2S8BCA/cDF2HZDyUViE4nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980288;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cXW+vcjg9iGpUdKmyDWC8TvHbEJL3RzYtWOX6t+4Ntw=;
	b=tJliLVnBo5fL2JsUt+CbpPBAxdI5vs8K8QhwUt/NvgZawq+7cNv7veAc3oj19ixD8Qvk
	 jmJ35zkYQfmMsFD15LthgFzXSN30fHnsT1bb3swwo2vytOrjg+0T/U6TmB5hn+NuTUyKF
	 uutbk06W0mvvzt/xC0mrSvk4A1XRzfYGBBp/8BtDfuQtbxbeB3MOfwkoQf1DT7VlqF7q0
	 rNhGhlf4BhGTEJfeswJgqha9TsFS42ArhkmhIKj/Sb5lR1tTKK5sJJ8x8HS1HIwH3jrv/
	 OXV8qu/5fEfRUVuTHypFVp4qJCoBkqou73kvpJ3tIc+O72LDxQco65uvjT0P/RuT+Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="UhFHZ8+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.51
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A4606A326;
	Fri,  6 Nov 2026 15:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UhFHZ8+/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I872N17SLtemxIG6M3adWwnISaqk1PXwEhdPxM12BXAq08OxqjbWiOeJwBIcRElZyBRBNhdSmfxc6VrtuLfK+oo+ZKcTx+C/LPvOG6aUhIcdoE28CwZzr3t4BoeQPRjQN4pNV0690TT8wn31wzKYqN1mqNVHUUxMHXp2mM67C5fBiYaQZ23IENInJuEB7NAyqHDUn3mD+mv0UTzBLrNUewigpASrO4Hb+eyj7BfSfTqEYERHTW6qtpZzNnGtC/TZ6nPN7Z2e2jJ2PyuDEW4tNVyHnWd0NZrCtC9KQeIm2iWQQimVBZBvJmQYXSFqZvs7atTScE1gCy9s1V7tAG5ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXW+vcjg9iGpUdKmyDWC8TvHbEJL3RzYtWOX6t+4Ntw=;
 b=GxaUF7glmVMLTaxRX4nzTiM1ENSQuBgOKT+f39OsSjtKn9tayE5UeGzH6kZJc34YkVP+GddGRUJ8zy3I4awXi8ri7QCRV5vmohS5WmGsI/4gwwU+WamMfIvkVk06/x1bAdfjK3uV5P9GkUTs/g3XEY+8ICMii02eJwJjmHTfWLqfuzh7IdpG49zdFExJL6oTMx/D5vCbD8V13qBciq+w0Lj5i00N/cJOZ/iSHGnmpy5qNKIZN6bIYQ4tTApLROazm5jEKjVNrf5vRLIZ9OHdSY3NB4HGfQ4ZZke0TGlGpMOfrL1bLDTW8F4k87XyaHPLi05jNTVbH+hxFJhZSmC15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXW+vcjg9iGpUdKmyDWC8TvHbEJL3RzYtWOX6t+4Ntw=;
 b=UhFHZ8+/s4wo+RtT2uQvnjWsbNW6DKlh1LeBW/fDFDKNB1crgHHgIRVTwGfNom/Rh+Mt3whK2PSXXvZ/Mm+NvwIiq0buyoORHZnLGHswunGVbI/WySaDS/kNmDhmdDh2wrzw4l90LCGmgFqve6ii2wGsZvPZ44HG6TFbzj9prmw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0SPRMB0124.namprd12.prod.outlook.com (2603:10b6:8:1fa::20) by
 MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 15:51:25 +0000
Received: from DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6]) by DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6%6]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 15:51:25 +0000
Message-ID: <dbeab5cb-fb61-4031-a694-96bb3deb5105@amd.com>
Date: Fri, 6 Nov 2026 21:21:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support with flat probe model
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
 <20261020112636.2661087-3-radhey.shyam.pandey@amd.com>
 <auqNHpX4G30716Tj@vbox>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <auqNHpX4G30716Tj@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PEPF000067E9.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::24) To DS0SPRMB0124.namprd12.prod.outlook.com
 (2603:10b6:8:1fa::20)
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
X-MS-TrafficTypeDiagnostic: DS0SPRMB0124:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: c91d9ccc-9903-4c76-a5a2-08df3c1dcfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|10067099003|4143699003|11063799006|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YR1evuOQ5Yk5Vu1nGgj9wq8DUzDXADSlyWeIhZ1p9Hay9jaDmuIBv+JMJo6Ca/lQNrOd4M8G+GncwT9HAjO8CEmy0VtRO0HiW9b36KRdEQORv5A4FTLhiEdePYwQwbk0mQnAbmbpwurfBjyXDDd/TqsyLtRVVJaRCWXfpxWQAcVaH8FhNgshTRZvrhcT5KCaSU0B1vBbogNtNSA3CwdfB1IUezHq+RFakxARlozsYaJ81s0fp4G4AazDV0VHoaVrIQdYio9h+X9rA99CKJLCI8qkM1Gs6UUVzfpTA8Y+87btD6EFmB4j9Cb5ZEq/OjUrToA60WQ/MecKgdAWzLIayGd4TjlRcHiURHPEGUhLKLe8mOGDKzgapj0jK/EnoL1F6VgS5s0zfa3mPKjqoWrjrJZfhdx3GggpEa2GEvDt2aELUHFZm2kTX1BHtLQBix6DtYph5Tj8tv8Ha46oZVOEvzBojovOuSmo83fYopN2k9JXoHxNZUkNdewocI1cP8UQbdAZTRoL9PNP2OOj3KQDSWRD7KZj+dDLE6PA6hyRnGH1IhCNTYBt5les7QOlzTYpKiuoEVFd54liqBA7T2nayZUsYmLz4pqp7ce9cuJ4tkx0Y5Z/hjdai9GbxXMefbli
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2VUM29KcEplRGJFOHlNczhReUlDaWNwSHRUYkQxMVhlZDZWRkdCa3hOVWk1?=
 =?utf-8?B?d3Y2eFFIallmbDVoaE5iMjdNUnFBSWZZL1hRYm5hZGFMNnh5QmhPamNQWkFM?=
 =?utf-8?B?N3h2SDBhdTNmaFZsQ0JpQVY3anNVWXF5TmlUNWhKUTMvSHg0V0Z5RlpwaFVX?=
 =?utf-8?B?cnNEUG5reVRaSTJRMmlKblVJOXcvdEdzM081L2hkYnR0Tml5SEVzc3Rhc0FD?=
 =?utf-8?B?eXo2NG4vT2R2eStsYlIvYmRoTnB6eWlMUHFONk1TdUNqSE8xMGdvbmQ0S0p5?=
 =?utf-8?B?Y3FmNmhYSFZCVk55TWxmME84OGhSRkYxR3F4cWZaNkl5dGlQemJvcjF0d2lP?=
 =?utf-8?B?Tm54TXNXZmJwSWw0OXlDcWo0NUFZMnU0SUlhN0hDSHdrQm9HeXVOTFlzUm9L?=
 =?utf-8?B?emtJTU9oYWZ5dnY4bmcvbVJiTXJCMldOQThpdEN4UUdva2ZjQnhEVW1YZlBv?=
 =?utf-8?B?YzA2aXVoZFlWalNheURXUnFJVS9rbktsUm5RTVR4dHNpT2VqQ2xYNUV2SWR4?=
 =?utf-8?B?OEQxWEQwaWZIaERzWThrYzV2dnliVnNaUzNySlFlbHI3a091bVlOWVMrdUNP?=
 =?utf-8?B?WklobmljblRVUnFnWW8wNjdRbDFxWDNWRTJlNDZkZEYwUndXZ1crRnpYZVNZ?=
 =?utf-8?B?TURIdzUvWFdVL0NjOEluSFBJUVN2cDYxWTlBTmwzSElLYjl5U0N1aHRwN2V6?=
 =?utf-8?B?cll6VElUcStaTmozYTcvMWJ3VlJ0RVhjd2hsZFd0TUQxTHIzVWMvaHBSeC9X?=
 =?utf-8?B?bXUxZzlUR2RvaXVOZE14djBOcVRDeVNuRUJHRGRNMjE1Vm1YLy9JS0kzZHlt?=
 =?utf-8?B?RlpVQkFPWkVPYnZzV0lwSFptWk02dGROMFcwYzUrYUkvWXMyMWhNSzlNK2tL?=
 =?utf-8?B?SGZpOGxhelRKVTBxMmxFSnU2Q3VZM0ZYcHl6VG5Qd1ZHUWJ0YVhHUzJ0cHZy?=
 =?utf-8?B?cGJoWWVqVUNmN0I2Tk1xeE9kcy9WMlBkYVMzdWllZzZadGRhQVJuY0JBYmZy?=
 =?utf-8?B?Mk9iUFh5Wkl6S1Vvd1lSbzEzeUZaRUtwdzYyU3k1MVJ2aWdTSmw0M21hVkpE?=
 =?utf-8?B?Snl2VGtFZmlJU2s1TytHVCtMaW4wRHpBUzFEcy9nUmlQeHQxdzQ1RldBRWND?=
 =?utf-8?B?NThCQWJYdWRaTFVtY3pod1k5ek1hUU5KLzJsWThCVTVNbk9UZTdZSUdHN2Er?=
 =?utf-8?B?ZXJXUUs1SUMvSHlHYURJZHFFVGwvb0JVTmxKWkMvQnRkY2wzUEh0amUrQkhp?=
 =?utf-8?B?RG1DUkFHOGpKVmNtZlhOZlllYU13Y05VcDhOaTM4by81Ti9KZ2VIQmRNRzVS?=
 =?utf-8?B?elRhRHFHaEpGd0pRa0d2VjU3NXc1TnhlcG00cklYelVoa0J3S0RNZk9Eb284?=
 =?utf-8?B?YktxdFFqQnpaV0h1Q091cTAwaFFJOU9tT1dCYnAxTXo4U2VRaGVIbkxXZ2xR?=
 =?utf-8?B?VXpZclE2LzJyRURuWG44OExWdGdTZVRNTzFNS1RWYUZWd2xDTVNmUkI5UTF5?=
 =?utf-8?B?d0svb0hFOUYweEdlc2ltZDVSaGVOZjdJNXF1VldWcG0zWURDVG9NcHpOcTJU?=
 =?utf-8?B?bVREbTlxV2tBbURqcFU1Q1BZZ2hYYUN1cFpHd3dGV2o2bXU3WFdQWDRsSmxY?=
 =?utf-8?B?MzAzc3FXd0kyMmZvdG5WaGhjN3l3Q3VmK3A0YzRDRmg3cXE3NVB2S3BTVmNv?=
 =?utf-8?B?SHV6REFzU09jazVJOXB3R0VNRFV1TUt2amdFUjl1aTFRN1VIWTgvdG54cDF6?=
 =?utf-8?B?QkthdzJsVlpSTFMrWEhwTjJlZ3M5MUFWQ0tyT0w5QjhLajlQZjcrUE56d0Vs?=
 =?utf-8?B?RytHb1NSOE8zdGI4eG9IaFFzSmk1a1A2YytJeE1IVlVIdWVPV3FZaERJeXdo?=
 =?utf-8?B?ekREZkZTajJLdXpINnJvbHo3RXhvaGRSYUlhTTRDOERHSE91VlU3eTFqQTBo?=
 =?utf-8?B?bmhZd3BBTytFd1VTbm1pQllzWEtYVFVSbzdsbmpVbThHTkp0Y2tSVXdXSk5K?=
 =?utf-8?B?YTVwOC9VRHoyOFl1M0owTXNrVUhVOEJ0SGZsTGQ1eTN0MzVJd1FDcGcybVN0?=
 =?utf-8?B?WGNxY3RFTjFnNTZPMnU5MTVNbTZwVXdJUXpzN2Q0NUo4RHl6R1d5OUJRNjYz?=
 =?utf-8?B?RFMyVTRDWUV6N2FXSm1hRHFKdE1iSGZRdnRab01IV1FJYnd5WHN1Z3pVMTBP?=
 =?utf-8?B?REJkU3Zib0Q4MitwUjlDaDNoanlDMlNSRVJKdS91L1lXQlB1T3dhdVdINk9D?=
 =?utf-8?B?VGtuK0JPQXFWOEVYUmViSU9ZNkxkYnJOSzRySDQxd09IOHZvV0NGRXFSdlly?=
 =?utf-8?Q?RlCKvSNC/ty4KUQpNO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d9ccc-9903-4c76-a5a2-08df3c1dcfb4
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:51:24.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJfmHQVg5RODGhNf0kJhE94EcLnRGuL32YHUsYx5B+W3whwlaXt0yb5WwIJohgQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320

On 11/4/2026 7:14 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Tue, Oct 20, 2026, Radhey Shyam Pandey wrote:
> 
> ....
> 
> This doesn't apply on Greg's usb-testing branch. Please rebase and
> resend.
> 

Hi Thinh,

This series depends on:
https://lore.kernel.org/all/20260928120015.3152461-1-radhey.shyam.pandey@amd.com 
[1]
Subject: [PATCH v3 0/3] usb: dwc3: xilinx: error path and teardown fixes
Date: Mon, 28 Sep 2026 17:30:12 +0530	[thread overview]
Message-ID: <20260928120015.3152461-1-radhey.shyam.pandey@amd.com> (raw)


https://lore.kernel.org/all/20260928134215.3194328-1-radhey.shyam.pandey@amd.com 
[2]
Subject: [PATCH v2] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Mon, 28 Sep 2026 19:12:15 +0530	[thread overview]
Message-ID: <20260928134215.3194328-1-radhey.shyam.pandey@amd.com> (raw)

[1] is applied on usb-linus and [2] is reviewed but not merged.

Let me know if it's fine or I should rebase this series on top of 
usb-linus and merge[2] in this series itself and send out v5.

Thanks,
Radhey


