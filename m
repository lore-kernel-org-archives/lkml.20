Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6ED3B6BE5;
	Tue, 15 Sep 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477245; cv=fail; b=u9eCLFWGR3TQGfamo2eJqGbldn9B7GSUVPpMm+erQ9rpWgFcxFDTp8XW6zVPVlZUunP494rnjjXinsU4DgDHdHscNYSvynBTsSWUJzbjS5qErKvZW5ztZBwirVBn4Jz7BPFgCKZj9JEvVBCiCuH8G3gXamtK8QsA1K2xvI8vaNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477245; c=relaxed/simple;
	bh=uSucOG+Whlcs/Sdb4dK2K7FKX0UU7HSu5ljYuNarPwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOINNpZCxEG2EV5qByRPS8QIHEN9lnPHHIGAYkoHY2eMgGLOjXfrBZ8Lk8ILjW1orXFpwk/msSwIzVnJDUvZmqlRHPjZ+ylr4eebnLpKcoRyBdNgwnGDT+oW8tkzdf75c3Stx28rfrUCMqfpVp9ryjKjXzIN/6QxSNOzuDTZ1rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m79xar2O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U93bbG+C; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m79xar2O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U93bbG+C"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F57GFx2760148;
	Tue, 15 Sep 2026 08:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=76LcOS3TSz6eMyU0LA
	Y9rZ8o5ln0NumCREnfsWjGvQA=; b=m79xar2OjdmcHuAxh5KskulZ8oDTl8bXpU
	PZV7OMtc9mB873Z4JJDb5tVtEHVXhb/weKJDs8yRBWb4+gpyIPBJj6wvDhXo60N8
	uIu07U3YdFu4cUYIDQtKpZXH7TUi4E0kfFutFwSPx0MW6pE8pyMR7RdEUn+naF+D
	lYWvT/ZQhMhUZm+MbZ0xrLCv/cxkgU661gbH0oKUHKKZ9TauP2L8fIn3LfmOwlfR
	TS9h9AldFaMXDevuvzTlNj6XrmH3lvs7FYh2OHfdYKpzUGiauIWuGX5dZPG5Wirk
	X76ah4Q169QDqfG0AFmPqaeuBqNEmozTIa9WuZbm/xANmDMJoinA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021114.outbound.protection.outlook.com [52.101.62.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35hbda6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 08:00:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ3vIirIwnc/ADhXnMydVG5Uk4x5kpU7/GajEmOjGWusFDIj4iJD1n7TciceOEA9t3OXv3n1+Z5PfeWkqyN108CwGT2LFHTPAnKJuFOSg0/JShAp74Ye36JTKwr5joTuy08kPTFcN30/Nr2lzXw8jOgfsvL0wchbnQU8WPHaNGEj1DrkSZ1VuxHuO+PZRjsYlRV28c1raiW+wXNTvWUyXNxfLjKYJyhFxea/JUj928Izty97Qc4Tk9VfpAmTda7bbdsswNudLUD2PeDw8hq+QYD+k5JQ4QHfoVjXpUJS4zHPq4Cd20r8rqXvhzy/T1reM5fieYPWKACdaeORhFX+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76LcOS3TSz6eMyU0LAY9rZ8o5ln0NumCREnfsWjGvQA=;
 b=Y4rZwHsC+Ca7CEGWZJQqB7ZHjQMgUnkECBelQkuzvbQKAC51OrXDeJBTtqyVtPtjguCUp/JzY38FtAtUTdFGtROXNP3wXxGD0qcCzIWPcpMCH3zgENpCIDFUTnY63sem3j8IdXjE632nvmNVk+w4SJVJUgBuCLYOkUMwJnhrzucg7qq/5McVRRzTIpfNO1aCdNoTl9qsSaWchQZbJbaxeeqN8BH1SD5g4yBklamaAfMH3iGS4R6ym45v7xiHeDBJ6T+TS+G3Kfy84uf7FiKVw/xAZWiaBOX8emkmpAJAq8zKwUHiBt37ku2+3BmE7CiiNxHqN2YjvHVq85JyaAAnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76LcOS3TSz6eMyU0LAY9rZ8o5ln0NumCREnfsWjGvQA=;
 b=U93bbG+CrQ0MNvhnOeqRIvVKvjVB+otCvnhRjM3FO5vzYJU+g5mN6/BFUspKEEujTJvty5V8vC78ixw6yMypMaL/+OKqAGOE2Gvb4FhTJdkQOotHEcDpa9ikSdljsyhoNIuHO0VLjIVZsiNP3EXbSPn+y/RKdA0SDsv91Gw5wRE=
Received: from SJ0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:a03:3a1::17)
 by CH3PR19MB8161.namprd19.prod.outlook.com (2603:10b6:610:196::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 13:00:26 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::11) by SJ0PR03CA0372.outlook.office365.com
 (2603:10b6:a03:3a1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 13:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 13:00:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BCC5A40655D;
	Tue, 15 Sep 2026 13:00:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A5421820244;
	Tue, 15 Sep 2026 13:00:23 +0000 (UTC)
Date: Tue, 15 Sep 2026 14:00:22 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <aqlBZm+8pY03GI59@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
 <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
 <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
 <071e3833-48af-4ca4-8eda-c6c825580def@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <071e3833-48af-4ca4-8eda-c6c825580def@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CH3PR19MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d7c247-ef4a-4b22-db9b-08df13294f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|4143699003|11063799006|56012099006|10067099003|22082099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WuK8t+WvRdQD/XsX2G4BI0cIqvuRvnSLpr9Ti7YEGBvLH5AI2hEdrKBFWAUhKsubVsvzRX6IPFub6nX1qMphRlYHwLirwq7DMXvV658DWuHnYgICYOuyZtOyAfrvfASVOhUaQOYRFDzDvdgI7Qfm/oEPEaTSXeRI+HRGHxoHlXkLIjlwweMUSH7sYpq7/bOCjs1aRmiO2jbu2HY0ub3YWNr7y/41Zf7PlXk8MRI3zrbP938J+TW1pVJVNOSv7x91l8pYiqgpZXdS9xSDNpnWBEM/yCJ6lhHcIXodnIj75uHQN+dVPNCYL9MhnCzDin6kA4GcnIiKdYufmIE8nFXqHYgfT3S3xpVy81vAegqLLUin5yfze2Q24aXlZXDtGFvT+VUkonaqdKasg1BwyE7JWQOeLthLuJpBX/3gXXeNCcyDxU+126ICQHJAvHOTA5LE++rjfYd7QuoizzAD+rC839KLvD2eDj1xOwonvgaaVMFtsw2eBbPxfM36gRUa/kgmby7YFgUizNO+pmZaIJiZR2JYv73MMmYRCi1N8Wlk5YBcCO3dyYB/Qc228ufZxMTIxh1G5Ehn9pMjQrPaw/GcxwNLKJ2JFkyhP+4K7ZwDd/Dv3bRRtSYO+wBeKC3h7Kpp3p6Upm8UZ/0JjTIGC/HLvo1LORi4UizxxsOuzCoDP44=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	slXf9waYgZZTS4vH6nasjqnVWypjq+x3UUH9it8R8WcvOAboxXXoDAJHswkAUEJkTo988BLjZqDkTk7t1gVFPLz3Ba7OnGTWNH23m6gUEr6wPv4GhGUSmrIm2GniWSAN2rYyUA5nvUJ1Y5HRz7rUp5Gx44B8XKtNYYZImFOLzv4h5ajSsMA99yS/PMe1z/M0J09zjUHJRalXRNg6Bqdr+XhzwS7gdSdNo60K6/hvErhY8hJGzYnfGHHhyZpy7iTRQDEreCjOBry7hiF9gUnlhWLclw9ogf7vC2kQzsf00e3gC2vc/np6DSkwLRlBQwZg/AMJ0WLExyCWsEVA8iooeochceHm3x5WMXw310e3NXFfViaaninTWs0yjA0WfCLjt3dkhDBChoi/fZXAq4PDy6kHr+k4c+QrTvLVXRn4P7aMBtahTiyRfIGOvdDgIiXw
X-Exchange-RoutingPolicyChecked:
	arPfOWuvZD5hv5acOO71FjDZOOeU9eQLNaOTD8sZVSUOM0LXqOqG0nZmQhhGeINdr/ysX2PS32FcAMnVWGaPQbckfhLriGFM8RB38b41pCktiHZ43zl8hc5SJeRhfqmA8c38LhY/955qF7QfQ/IXa6pXNTxNK9ydVuY5sTrSPYB9rDCsUeeBaXU5vo7tlBH84h9wLx1zhE3xcJHNSs1fgPAShH74qX236UqCFRK2LYNV/k+O0NVyvL3y++EujFGGHyfgCYae8IKCjwC90b45+ld3uMM8tWeCVfD9RhcpxaReFTlcZHqivSwC95az2bI5bDf7bclnMMMTGYmrOxDR2A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:00:25.5834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d7c247-ef4a-4b22-db9b-08df13294f8b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8161
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX4WNXDzaDCFC9
 KnRl5D1bM63TZA7dWdvOzTzsegYx8SGc6ZWzpprZleIEZhd0Q/plscIQULRxpQRr2Yk5M4ndvKF
 +GAQ3K3GsqzUym3O/sHRuvZpw4jmF+Y=
X-Proofpoint-GUID: vBcHZE1yLrix2huOwGCmUMiuxyYUNOGt
X-Proofpoint-ORIG-GUID: vBcHZE1yLrix2huOwGCmUMiuxyYUNOGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX27ltJSQ3+jt0
 D7Ixg/h1DTvhWRvWkQeUHQM0F+05z6wgMOVECDXEvLy3rhMJ9jJEDBjIK+B0Y3yXA/n66z4NE39
 lnrf6+W9HZIBXf+9T4/FsncJi5UihaD7/wMi9NxElCtE6Eulx14prKb0tqWVdlY4MSM1Yqh2wsl
 rB9hxZfDkhe3G+wA+5WfT/jJGiFbZ0ACq8KNgDp76Vkz9A822W5xiVivt4CeSRugQVZriCOGxEo
 /wGip68nd2KTiFRLCSOfupyMZytqQjXjGwCPfd+m1mfLHosJtVr+Kky0ANBfJ0OOWCNn0YJJV6j
 yWlYQjpnbuJLRNSkcYtpJdaZJja9xaSUWq92E3QpGJt6vQujxNUCfM7exO/LXhjyON4Ws3YkYA0
 jJV4ajAk7dU4qCQ3IH5QeQVW8WpW3q4GHJHh+nVagXd2R11FdbcNRDaJPVl93i/wJYUz5OKiYUD
 L/+aopjLFBVJjigBETA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa94172 cx=c_pps
 a=dLe9bA1IkfUV2ft16lzHdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=QsSCs4avAAAA:20 a=oGFqyH5lUf8cSI2xnw4A:9 a=CjuIK1q_8ugA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 15, 2026 at 02:22:03PM +0200, Pierre-Louis Bossart wrote:
> 
> >>> It would appear the reason for the disabling of the IRQs is that
> >>> the IRQ handler iterates through a linked list of all the links,
> >>> once a link is removed the memory pointed at by this linked list
> >>> is freed, but not removed from the linked_list. 
> >>
> >> That wasn't the reason, even if you have a single link we all thought it
> >> made more sense to disable peripheral interrupts on the host before
> >> calling sdw_bus_master_delete()
> > 
> > What was the reason for deciding to do that, that is not in itself
> > a reason? A drivers remove callback should be able to access
> > registers on the device. The host here requires interrupts to
> > do so. This was the only functional reason in the code I could
> > find that things were done in this order.
> 
> like I said it was thought to be simpler this way, we never thought
> about the need to do anything in remove().
> IOW this is a missed requirement that led to a simple solution, not a
> deliberate decision to cripple the remove() step.

Ok I will update to reflect this being more what we need to
update to add this and remove the apparent reason wording.

> >>> --- a/include/linux/soundwire/sdw_intel.h
> >>> +++ b/include/linux/soundwire/sdw_intel.h
> >>> @@ -307,6 +307,7 @@ struct sdw_intel_ctx {
> >>>  	acpi_handle handle;
> >>>  	struct sdw_intel_link_dev **ldev;
> >>>  	struct list_head link_list;
> >>> +	struct mutex link_lock; /* lock protecting link_list */
> >>>  	struct mutex shim_lock; /* lock for access to shared SHIM registers */
> >>
> >> IIRC shim_lock was used to prevent access to common registers shared
> >> between links. How many locks do we need?
> > 
> > I mean we could reuse the lock but in my experience locks having
> > a clearly defined purpose is less error prone, than having catch
> > all locks. The shim lock claims to protect the SHIM registers,
> > this one protects the list of links. But if you feel strongly I
> > am happy to try reuse the shim lock for this?
> 
> I am not asking for you to share, just that we need to have a discussion
> on whether this new lock is redundant or not, and wording that describes
> why using existing locks isn't desired/needed.
> 
> this shim_lock is a protection for very low-level access to registers,
> and completely tied to the way the IP registers were clustered together,
> it's indeed a different conceptual level you're after. So even if there
> is some redundancy or overlap, it's probably simpler to use a different
> lock for different things,

So a quick test appears to suggest using the shim_lock would
work. The original description is mostly focused on the low level
registers, which does feel like a different purpose. That said
though it does basically work the same its a lock linked to the
controller and the initial description does make reference to
protecting the shim_mask field as well so I guess it is already
protecting some state in the same struct.

Happy to go with you and Intel's preferred options here.

> 
> > Ultimately, I am not super attached to this way of solving the
> > problem but we do need to come up with some solution to allow
> > drivers to access their device in driver remove. This causes
> > devices to take 1-2 minutes to remove the driver and fills the log
> > with loads of error messages. I am more than happy to entertain
> > other ways of making that happen if you have ideas you prefer?
> 
> I don't have any objections with the requirement to let the codec do
> whatever it needs on remove(), this was a miss in the design and it
> needs to be addressed.
> I am just nervous about the interrupt part and possible race conditions.
> Maybe the last stage of the remove() should be to mask all interrupts on
> the codec side with a common helper shared by all codec drivers?

Yeah that is fair, it is a major reshuffling. But we can carry
on that discussion on the other branch.

> BTW we did have scripts to remove/insert in loops to try and find
> issues, not sure if you're aware of them and if they still work, see:
> 
> https://github.com/thesofproject/sof-test/blob/main/tools/kmod/

Yeah I believe that causing problems is one of the main things
people have been complaining about.

Thanks,
Charles
