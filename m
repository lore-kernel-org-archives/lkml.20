Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B454A3D24;
	Mon,  5 Oct 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209929; cv=fail; b=C1RZ6Glxeod+So42uQ0dnoLwEEX9sQG9atgKKvXK0KTMaxJiSv7cDLWXSPADnzm8ps6e7WHpB/g3SjrmZamFK0yEn5B3f0/jBckejxOBKtnXd7ZpAZSpOmXepCNUabZY8oSXkMKlIp05B1YTbg9bzkjoQfxtz+of+DEpK5PzzS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209929; c=relaxed/simple;
	bh=5b1PTGqBigyS+5uLohKeqqWVWtDHwC0mOKXsSSz2PYY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k7joJ+zjKcWyZYYy6yFXuhPb76yXAjz3YyTpym326fhzXOtKHcBGJOHYNQRrgOfKXuSiOqhFwgqRismetcyrPoi2d+A/uwQxdj7nrNXXfgGAJDj5t5I/4b1n3rNL0FbZ+wB3FF3ugLCxLnLBP3vZmZhL5bf795LeEoimjuUA87M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4z84ux+q; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4z84ux+q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfMHRZvcdS1A3b2TUhP8YOPF51sXidgBB4VQUfYdAx24jo2eXIBdJkWjH6clVVlx32j3cLw6yrFcbesyzkCb7Uz5frzgg1p5GjGcPZdbHUdb50CjPhg8G1kSJkizn+rWXPYdq03LB+Hs3xmw7PN0SzlUNDzs7YD3TdvySci67dAnC0J4NsSiuqFTTRJCiYddKJkbMOYMDnGuQZbuL4o00OPR6m/gApJU6ZsWNIhW13bzTOJ9XRTw0tdc7vnd4CQTvxuddM1YKrrW+9sjy3ZwurTq/wS+MHjOJrfa7JYqD2j4rg6lHCuf0Q93+9sYz4S+1PDuMSypYsHz6s1+geGraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4ZlC6l+/2HQDwkx/43GTqn2slpukh/f271HSZHylO4=;
 b=XtBFTensoZ+DS86ewpw7qQFut0ogqeUxdQDj/Gvyr1wE7woBVQnLbBJNyFBcr7wvwdwDSBAhBqr00GAg9qinyb4406uZT9rpyuYmX8zLFEM4DHQ0fIRIzcl3bqtVC/3sakJs+XUHtp65o3jr7NjInq7LImjExHIGaQpf49o9Xsjo55iWXz8ftO4vJ+dcmzoLSHuthw00jzjXz0JolZbH3HK0nXXs7ux/Xs3cAvo/ZZvR/Dp6oZDvUXRECkwidybwt6tb3yv7BHLrUZdRT3LYckUnXjbrXLdYjWULPF/q319UHdoAtnTBBERIZsvREWqSHcbSp/MIK7ZJnAU5s7DGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4ZlC6l+/2HQDwkx/43GTqn2slpukh/f271HSZHylO4=;
 b=4z84ux+qJ7IypFY9jGoCM6WeR8+0Z38jRHjXCkIg7sx9V1DYbg231zHhDWck63VuS055dqn1iAh/1b+hcYHIX5l3fspezjdebHDIh8PSmwZfYUJGmbTNmqJ0ebbDQxGLKoALkzuTfoEKsIc+viZFrZwuXStKENWFdM9ejdMnFvM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:18:34 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 14:18:34 +0000
Message-ID: <633008c7-d03d-4137-800b-ef0c7be25650@amd.com>
Date: Mon, 5 Oct 2026 09:18:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Content-Language: en-US
To: Curtis Vogt <curtis.vogt@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michal Pecio <michal.pecio@gmail.com>
References: <20260924034200.421686-1-curtis.vogt@gmail.com>
 <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com> <asMhD7WvhIk6DjIc@dhoja>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <asMhD7WvhIk6DjIc@dhoja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:806:21::6) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1f2d4e-07fe-40f3-a113-08df22eb89fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	sbny45aGKKh1bpZlCunCFndvVFgiZkxNSuJfTwzoxG2TGryNDcPILsJQLLX8G4dXf+27Q5DHLPh/rxsEsW6AfC08DOIffoRx/ty477MAlsq8BUHAewhar2GvUayYVG2+sul/pKp6PTE5eQEktwaciko+GgAeE4iB0z5iUo24V5JajE6yGBlek2JWvICCI5jcLP3f5cEa5QayCdy1MQiiyY0UxwCA+dhsjJzWfSutuiMWxFPKh9dhPzTyERryC5CTnnLGA5bXWMxKud9p1FdVaTbkzP4kMU2/P1xWlCdaixQrflNvxG4ABsgmBT+vm5hkiZOLEka287ZdVARAc5sjX7CApCPxqHZYZlpW65bTzjLMPPdUc5P7pg1ZuGMFxzTGu+olCPAmVNOuG9teGjQ4WGkfVQbKOIhbunyt52Ir8Iy4SCS4+xeAaaadgZxaIMehMKEK2bHNwlFqusmexPS6PHeO3rFs/ok7l+a9ZG9TlyI/U5evB58eUP3qFJZ8l4rumnYqGtLox1aVoXPJjNn8SgHaYtL9krtJHIOUUwPtGvkxbCI6Kf0+MFkgEXftQ+tIxxY9uYATFPZdYn6jmKe2Wj0bnQA5hupvgPnZN4yHxZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21LdVNxV0VFZVMybmNrc3FMTW9kc0cxT2hYWVQ1UGo1V29JalZ6Q1ozNVJI?=
 =?utf-8?B?aFp4eVhmWGcvZ1l0cTZiZkR2MWdsM3ZYeU5lRDBoUWpYajkrck5uUGY4K0Ni?=
 =?utf-8?B?TVE2c2ZCYXczb2FWNFVsTzZlUVdDRXIxRTVEcEwrbzErQ2lxNW5WZUIyR3Bm?=
 =?utf-8?B?Q3RFcjF6Z1ZXZ3NDaURydTJ4cm5veGZmM0IyNWprZ1p0RmkxM3d3ay8zM3ZY?=
 =?utf-8?B?WEYrZ3N3RDhrcExtSkl6REppenpmWm5leEo1Z0ZkWGtRRG5MeW94eTd3L0Nl?=
 =?utf-8?B?ZG9zcGJrN3p5TVIxRk1tckFqVnFmQTh3VmFCMHlIaGVoM0V3eHRqSWxZRmxJ?=
 =?utf-8?B?ZWphMzJrMWFOb0RQSzRUSXZ2d1prcHg0OFRlcnVPY3IwWERoU3l3SlczV3BZ?=
 =?utf-8?B?WVVWakkyMW1BcWJSNzFiOFFodm9URkxRVURwL2wrU1AwMlN6Z0RSVnlydzBI?=
 =?utf-8?B?Q3hXUURKY25XeUY1Tkx2MjRFTkhiS1JLNEY5ZWlNSEVYZjJxT1R5MGNvUWFG?=
 =?utf-8?B?ZmJxSGZ4VlFUTU5LTFUxR0ZWc0pLTHhycU5CeHZRN0xQYzFaTnhYR2x3QmJO?=
 =?utf-8?B?S0w5S3N5TFBnVytnc2JQRk9LM2RveVlsTERpakw0VVpoajd1d3orVXJhZ0Zk?=
 =?utf-8?B?ak5rUWhtSGdJVXAwak5pM3VMSEVMY0I5dVVSYVJHTWptYjhwT1prREVId0dI?=
 =?utf-8?B?Y1o5SVdrcGR4UTNOZmVpSEZzeWEybXN1U1U4bjk1dkZQblNMZlFhOStmUStx?=
 =?utf-8?B?WHgyN0tDdEVReVl6UXQreFliU011WEh1MWwzTzd5RXBRdC9aUWVDNUZsS3Ro?=
 =?utf-8?B?dTVUU01Zd0VFcTdFb0o4bXBzT2RoU1p4NUpoaGV4UEJKb1E1L0FMZ0kySzNM?=
 =?utf-8?B?M3p6WlROSVY1Nm50WHUrMXVXNVNmd1ZZMEcyVmVzWVpESlZTc0NZeWJtaWVR?=
 =?utf-8?B?azRLZW1zNmVvRVdWOUtvWDZkdmlaa3JLcFBEVHlrOEtSeVA3R21OV1JZaDR6?=
 =?utf-8?B?UE81Vk9SdGVoOVdxOFNHUnZGaEhJbnNlY0FYcVI4WHlubnM1WXh0N0RRQXo0?=
 =?utf-8?B?dndJTnUvQXVQTXl5d1pPTG9oV2VialZXT3B5L1ZERmU1K2k1alhMRjBraUtL?=
 =?utf-8?B?TEdOV1ZMQVZGQUtVYmgwOXU1Nno5TXB1VWY5OU5icWhmaXhXMmNKRE9CdGdK?=
 =?utf-8?B?a0xYb0VwK0s4MkdZRW5aQjVBSCt4UmVybFZ5YWpjUHBmdjJCZ2orakNJN0Zs?=
 =?utf-8?B?cVN2SlhwN2MvajVocWxJVWY0VGxuOGtoeGZkYUtWdkp1ckFQdkNzSVhkak9L?=
 =?utf-8?B?UXNSb25DdlQyam9IU1dCRDhCbzhkL2N6SDdjLzB5ZkErQnpiRkxFNG5LcEVX?=
 =?utf-8?B?WmpyTkxhbmp6QkNiV1Vlc2RKTDNTaUZyVTQ3VmI0YVpOYVplTnFXQXFINGIz?=
 =?utf-8?B?OTk4TkVHazQxaTUvSUx2dFlpUE9MNWh6UFBDWGZ1NGxBK1VKVS9YVDE5UVpr?=
 =?utf-8?B?R3B1bHhMN25UWTRhcFFpZUpGTldCY0RJUnJGK0lWQlNVSlJwUXZabW9zN3dk?=
 =?utf-8?B?Q3hZR0hVWXU4KzVGZk9wYkxTTEVBb3RBM2JrRUpBZy8waVhndW51YmRhQ0F3?=
 =?utf-8?B?c2E0bWV3SVpKUG9zTTBHSXVIY3dtVi9tVDVkYnBjYmZYdWxMQjJNMmZ5STZ4?=
 =?utf-8?B?aHdGSVVuajB0ZkZPeG9ibk5hYnVqUnhrV2F6alhvWnZQYWxuUFZDSkcxaTJS?=
 =?utf-8?B?dSs2Vkt5REtFSGRIVFRaaVgvWWxZY2pPZmoyTS9NbGV4RDZzOFV3Zi9rRXNK?=
 =?utf-8?B?cW9TK3NMaUpZMENINVo5Q1VlUWFsRXBMYlB5aXB2anhuWkxDRlo3dkhwQVpi?=
 =?utf-8?B?ZjZtWnNCWUdkbmxNUHhrb2NLV0pnSzhObmR4bUtBYzRxUW9naVZlQkpURExI?=
 =?utf-8?B?c0Y2K2t1anFrQXhXZi9Pd3RVMzdQdDJRL1JQRzh3amVHUHpQcm9mc2c1dFVU?=
 =?utf-8?B?YldxRmVQMmlCU1E4RVFHQzFWMFhhNjVSVFBNbmhpR0taR2U1aTY3VzdpbHps?=
 =?utf-8?B?ZmtMSGd4Ly9LOWUzS3pVR3dJcTZHaURWTWQ0SUtFZWhCaVBQeEtGMlIxTEpX?=
 =?utf-8?B?MTU3cGlRL0Z3K1JBZHNPYXhFRlY1aE02bVVseEszOEpwdVE1Vng3QkQxTmZY?=
 =?utf-8?B?SGdQT1VHK2wxUlIxNDQvWlhEeE9jVkJteHlZbk8wQW94bDhMSXZOdFh5OVNV?=
 =?utf-8?B?WjJpOTdxQWZnOUxrYkN4ak4xQTVYYWU0VTNLTjhydG5kMXVkc2w0ZFJwUDdB?=
 =?utf-8?Q?7FpFpSRb4tFpKi6kCL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1f2d4e-07fe-40f3-a113-08df22eb89fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:18:33.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWs3GkgzWHGkfCSaL+CJ1ZA8wEKFvf7kGUuwOn8dqjmah8GNyXvyStzoF/j4a8Qs3m9lt3XU9JT1wAeK5xMrjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682



On 10/4/26 23:01, Curtis Vogt wrote:
> On Thu, Sep 24, 2026 at 10:44:18AM -0500, Mario Limonciello wrote:
>>
>> I guess this would make sense:
>>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4333
> 
> I agree that the issue can now be closed. The source of the "bad state"
> was ddcutil which fixed https://github.com/rockowitz/ddcutil/pull/637
> which was included in version 3.0.2.

So you don't think we should quirk the kernel anymore like your patch does?

If userspace can break this, it kinda feels like the quirk is warranted 
still even if userspace that was breaking it is fixed.
