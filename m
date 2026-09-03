Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151549481D;
	Thu,  3 Sep 2026 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467367; cv=fail; b=PgxgqEgmKAUQd4rdpKGXkjunSI5GQLYQ4xkwtmaL6S9gjtb7lhkE04u408dpE+ICAyts6ibfis4u1UAC5GkOlNDq9+7zuo+A/PNHu6JhMb8UrU8P+Fqe/GsMWFRQUoLCQY551tOufnkVi26fIT+EmT08xUnEdvOWqMicLmHUGaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467367; c=relaxed/simple;
	bh=E7Zllzwa5v6M+rEOhbFjNb3TgYh9JJsFB10ylAuZiUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PV42c+GpMRJ9f1i8YCvCjp2EPkmr98/gxQ1f+uFkMp8qUznfhRMj8EhYfcXK3LRpZ7GTZAFx5+juv2Q57+jMDFl2l6Hi4EbEezwCANAcd3W2x0AGseOgh8InDHRmn4uNNE+WsatYSvgOh42fAPk1FbaMmnwbQECdIc7RroqAyqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZS8O5RL0 reason="signature verification failed"; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZS8O5RL0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1ZJuyrE4cfqBrS6xmbH5nTDcqtybTH6vgZyCTJoByWvmLy030Ugunk7o4csubWv0DjNe+ernVKbJaD46sA0uLddChJd6uArZQcg6dDCYnmZAbaE5rehtg9vCggShmtNSJ6gN5oRxmAgMAAQalppX/8wLdTquvF6gHt/NTT3QKmml3qJ7mMx/g3oJBxSbZ5BEHPWr66p52KdjfdLcE9fuDF/4Ht3hlJwHMUlNHdpqg/J2NSy9XP1n5WtEGVJlsq3WzgMbqd0ekDjZFS60V1Q7ACktM9emS2+OJ7h6ab6uDXG4YfGH072RQgYxqeVrXcO5YUW1GCoJ/Y0Of346NmWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQiC1VXkeziktuuncPUqRy/uyPgtmerBu+DmPJhdwnc=;
 b=EpnnAFAqGBMKNSV+k75RnlnnotyWiWaze4iCROPXk626sovsgG/UsnD+rGuhpv5+16VaXZhn9xS9nUBNjypgYY5WFAKuoWDNheJ6+N4ovTuUMnGcsCbrNQ/PfNj3/XE3CRQbQWy3Gd77Ig3rIXvP+QSsYLjn+sAWMSLl6pHgv64gCvGzAJrP3kCsDopgY+M5Yqp/nUqd/8e/XeND3T+injByia6/rlRWk16y0m4xzmIVYAEnYX4VIuwiTJvWeLFXWkkpz9Mbx7tg9nUHJ6qqiqoAzhhfWfbJzBDCJlNJFhsiNaBR0l0JtdtUvuxtwJ9KhXaGBKNyyCV4BdFc70t4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQiC1VXkeziktuuncPUqRy/uyPgtmerBu+DmPJhdwnc=;
 b=ZS8O5RL0KY0vk1MZ9LVuE08US9lpuD9Ak19OXEOcoMflDilV0J9vEp6aLfbgSYqa46N+ERbCxn26i42SO+D/F86vjWhMkuyNxiiEGAke0sI8AVUK9/qD4OJXVZnps4WbN3LSaSCf9VlSTmrECjEcMcLg8vasJWgXeT6fqU/e1bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 20:29:06 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:29:05 +0000
Date: Thu, 3 Sep 2026 16:28:52 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/mce: Reset MCA_SYND between bank scans
Message-ID: <20260903202852.GA145182@yaz-khff2.amd.com>
References: <6XMrR2i2tP3toFjOshJwvZ6agC3N8DSZi74aW-2DJwC5_rGPf1aT6nsZzd55MHD0nMwxx6x-NaFHU_OQaH0t8BdJcjWoBHkcAf-udzh5TKw=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6XMrR2i2tP3toFjOshJwvZ6agC3N8DSZi74aW-2DJwC5_rGPf1aT6nsZzd55MHD0nMwxx6x-NaFHU_OQaH0t8BdJcjWoBHkcAf-udzh5TKw=@optocloud.no>
X-ClientProxiedBy: BLAPR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:208:32e::8) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 006c9e8f-b362-4ec7-64c5-08df09f9fff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HTF7uejx6xu8yuIGzXIbZp3tZG1UuPRPPr7Rjjup/sYcoy5cQDFVrzpCpOKh+HnL668QEkXEqAXy7YKjDdsn1EEO8wjP1qw9jFNx59Q9+qsiFpyjQmbaGCncZyJ5yoI5Cwbd9uJi9SdIqsQ01RT5/AlmL7oHFPb6cFaiixegB33yzBEYLvZfTVN6AnuryzaKzNotMzVg7P2yrUMtOmbwNspzGAvwX4jt+IPqiXzhIiof705O06gKzMS6pNrbK3tWc1WCd9JQGv8bhy2yTgZ6+fChr/UsPUVGHuJc9IYdrED73/SYoglFwF5rbj8RaJDvEtDXOlQkslNThqA5IhvW4xZuH1sETCMHtB6/96Kgh2l42y9PC2zJ1+DR3mvGGjSTQp1X1KBBtvlpypNhcrIuin0qN1axDX+ZwlukWBzx3c6pYEnLWpp7KTECwvhtNi0rXb86XTEQ/WPD7/X9gIGasSP0+6Um0kzGVNCiybHNbXaSHgszRGl0YL6dGUmsyCek7GnzPBjouTG1MMX5TUMuFZDv2rTWhWV06RbN4GzdyzwAccrrdkY7OzdYeehJJkbKzVSbWL80l2QASgIv5154USUxN98bRzSSVuHcm7u9V1BsbzIBr0zPkCrMzsLUd8c2orO6UoSzyiMVozt8xRMMGIekieczcg64PSYIhNhf668=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Txvy7Af/XtS+2lW5TIuWxACfQ5FXWFhslcvbbRH6HWHGwsf8pKBG1afYto?=
 =?iso-8859-1?Q?7Nn4N8t+NaKwZ5ul/cU7ff2hh4NkRNw9fNslhAD6vuURdL6xUdnVvs+DH6?=
 =?iso-8859-1?Q?BpZI2pFzkvVUSsDhkfUOUuMFVMxRqkLjE1MKheOvuco+/5x059YiCXBODM?=
 =?iso-8859-1?Q?13/osFybEwngysqSnejzZl/N7Bu9nYMZPfJ2cBMIneWccEBDV8b/cE/+cJ?=
 =?iso-8859-1?Q?zU/7/vLWB3b83CRSfqLg715jwiJzSNw7ndiw9ygPEO20DLSAgIL8Ufppu4?=
 =?iso-8859-1?Q?+5TLrHmeQuKpaJwBj08bUmRHTCyZWOadEabxAe8+VApH/VWSvUgwGWor9c?=
 =?iso-8859-1?Q?zv3MPFe7GeqQArYvNKTKWgTHmbf5LA6zyDQcgBqgOAuO9zQ4EzqWxk9y2W?=
 =?iso-8859-1?Q?yu0TF0XNhyuujs3VOszkHkP6m3VOobyPZmtHvh+tCS7X+vk0wCkKn1Kwr2?=
 =?iso-8859-1?Q?6pMKjj31pI3gnKFsdeYU1MplBMy8qkrprvboA9kewVPrQPNc82NeePCwtl?=
 =?iso-8859-1?Q?iJgjJtdHfVFKTWB1HM5iNWgPNza5pr29kAsQPAkbybaREus+sBGvNNaAzK?=
 =?iso-8859-1?Q?vlQGm8HA56m2PIgRYRVXzks8XmNu5VrMayR4H77B8tmaUngjZKXNP90FkR?=
 =?iso-8859-1?Q?lU2MctNSHygmt3Qn/utVJaJlUeoAPkGrWqhfTxBJ+/u5dVGfoVo6aoWmu0?=
 =?iso-8859-1?Q?hsxPZgcxJR4c0RjP0tfDPd1ynUUXThJ5BiOI2C8staulqgYQIO6prK2d5s?=
 =?iso-8859-1?Q?/HnkzQkrQJ+zPh7kbpRLdEsQFmZHnT+ej0bev4wQN84VCE2FDjiQkCRg8o?=
 =?iso-8859-1?Q?qvN/8+8mynFOB3VLwHKUitrMeOBRVVMK+1bX0dir+o8Ufa27tjoi/MyjeL?=
 =?iso-8859-1?Q?j933bYxbmtDNrvvmO5dUJC7tZ/J1dn6JVmRX3F5tgw2hYr1C5xyxjSeKs6?=
 =?iso-8859-1?Q?m/1+eFayK9NCw82kP2wo1LRfI/VfI5V5yRFZIyPHFlgkI4Uax1wOsqakEW?=
 =?iso-8859-1?Q?4EQa4+DeXbH2LyDSpsa4XmNHCBwMfgmj+Y8UVkNK8AjzOGV7ugmhard/tg?=
 =?iso-8859-1?Q?0Zd6IH9IklRCpEK7EnEexsTTM+WELkq9AWdlgIQhOjG4E9ROQjLEgqKPT2?=
 =?iso-8859-1?Q?B8G2yUzQ44SP/z0xItWVYoHpk/+yVZ68yOGqeQYS/DljucQxWZjzgOwlqg?=
 =?iso-8859-1?Q?Qv3LIQ2GQAlN+lcqrZQuISMx8J6NDYQJmgraBARfJsj0P5Wpqomo5snXcF?=
 =?iso-8859-1?Q?XGPFNqQ+PzjKxUT/BkugEh+WGBD8GEYc5Ta2rm8gjhiWWpVz4KGle6JLDq?=
 =?iso-8859-1?Q?aZK+y6QovWHmpCwbiuCbpDMFw/p341Hpzk2DJOAv5l8YQPDOPB+AtKBzqQ?=
 =?iso-8859-1?Q?+z3IyuId4gTmpellaKX2oG6tnR7vcvEZ8iwIHrGfmqXQ0OJnRfgDoQL5Nw?=
 =?iso-8859-1?Q?r43z/L8nlUVNCLX/fgQMVQAezm8oVP86C84v00FKJUa6vDIXRUyZoZD2cR?=
 =?iso-8859-1?Q?YSKSIIGF+u+jSxR05vdMwQg7MmTsZ4CQaP6yYNuP/aC3DgmSlWZRGHf6W6?=
 =?iso-8859-1?Q?k3zbKV5FcUyFq9nOhblFFdBvM0ddnxZd53KeBRjCb/6BXQ+fccfM+DmI/B?=
 =?iso-8859-1?Q?zCGEwHYBAgnVq7LPhRN946U8SWVfN9fsbfm23WbYEf4clu5DK+0+YtgEIe?=
 =?iso-8859-1?Q?5ILzPllEp5xOOhRWEfoi+Il4TSngU4ypgOsXQMulSzeHw6ICRXtrTCY9G5?=
 =?iso-8859-1?Q?vTfVznBar/VDxMqxL72DmAHt/Gt0vbCwJuHvOgqd7DElkjUiyS8k5v/2H7?=
 =?iso-8859-1?Q?ulyEYplu0w=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006c9e8f-b362-4ec7-64c5-08df09f9fff0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:29:05.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTVHWahPEAHULluEOJB4Zn1e2abPyEARjblaSryRN9K+PWj2xm8CS1Co7BQyjjgxau5HPiA360NJ7ZFon52yXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558

On Sun, Aug 30, 2026 at 04:40:01AM +0000, OptoCloud wrote:
> machine_check_poll() and __mc_scan_banks() both reuse a single
> struct mce_hw_err while iterating over the MCA banks. The record is
> zeroed once before the loop; each iteration then resets only MISC
> and ADDR.
> 
> On SMCA, mce_read_aux() writes SYND only when MCI_STATUS_SYNDV is
> set. Nothing clears it again, so a bank that does not set SYNDV
> inherits the SYND value read for the previous bank in the same
> scan, and that stale value is printed and handed to the decoders as
> if it belonged to the current error.

True, but harmless in practice. If SYNDV is not set, then decoders
should not consider the value of MCA_SYND. It doesn't matter if the
value is '0' or garbage.

> 
> Reset SYND at the start of each iteration in both loops, alongside
> the existing MISC and ADDR resets.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
> Cc: stable@vger.kernel.org

I don't agree that this needs to go to the stable branches, since it's
not fixing a practical bug.

> Signed-off-by: Eirik Bøe <git@optocloud.no>

Overall, I think this is a fair patch. It does bring the MCA_SYND
behavior inline with the other registers.

Besides the minor nits above this looks good to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
