Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686236;
	b=aZ+qt2NuYjlQdoRJ47E48XT2+xhh3rogQZ1Df5n9qDXFjc04YVeiyy0F8ZZtpK0dbOQX
	 i6X1N7x5zgFfVl+IWTfwhlTrbNjo4T/L6fFjgfoXWCQlqT7XvYybC/Vg/qYXO8c/skY3E
	 s5bDmrzMSEvDVhbo5P/Nt6tQZxOtXIHbNoUBzbigGbbAvYRBQ5qfJm6EXjiuC8XjH2Eu1
	 eiD8qrXhUCZGU4GGt7X2SHmJ48qIWdTGge90s4QLRv66RF2gRZOgglKp7Fxgl7U4yysbn
	 xju0lLhvuV4yUDHQfVuJ94ItN7lcAvG1/iCKe2v3DzzzylRgPacbNEbfegyAel0GgJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686236;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JgK5QVMsXtFuHGaVrxR+mJaYH1alUA46pzORjP9jozM=;
	b=Y4VHgcto9I3QdGoUeaDUHJGJt7FMZiYNV+goGe7weqGB09WVCapEKEA0hjkZk3UxU3fw
	 8lHKTCkM79Mo/ffJ4c4qoIMo6NMf1YZ92DQMIQIWT1lBMUPfr4C5kRKpIRe4EOMl59DnG
	 oJV7kOgPlUoenAgAokl502dpWc39RKvVvCCaPqIdv2d/Zm6YLHLVI/8gLwxHvwFlq9Aof
	 OzLhZ4unl9JBnzI8LCY/ZjmPpj6dCDWHeW5fSPCNXu0UCAtxVnCk9IAO5tLKsRcJeGm8T
	 oH0+BYw11LPAh48XzfZvRV5PYswVpHOuQPwLPip4Bx44tlmvAsX+8tuf4WiSbZMtRYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.27
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BDA606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BDA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQn+TQci8yUJr6oXwAhOwhYKYQWK/kBCuyHruY4TtGcLNh8lymz64rzjBjpu9iamYVqmwFhRISI5KTWTZrrCJb/miKVq+eWRPx2IBL8nBNtLCfY53S0SQTvg+Tvod0EALcJN+tnvk15IxHzmRm3R6j3WVpqfHx+Dlgp419qUbgsAm5ZEAaTRgpsinv2gahfjl4VoDA3KIzo04MGQshxiGJgiPhrCv7zob55G5mIR7q7hcEANQemOrVLPVJaC0UgzOY06dr9pt2fZe1xACaRu1TEBgTk0X6eAsp9sWUgqHlzob72lg6qtIf2s33yLPAy3ydYSAfhwRLbc0AmJRpxkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgK5QVMsXtFuHGaVrxR+mJaYH1alUA46pzORjP9jozM=;
 b=DBCKSrqelRTzoSJU6/nenrOXhtQV1GHn3HjldjZ1AXvUAwRBy03ApEFuNKX5jJEtxB5rJZn61caqh+tcpzbLJksOqW15IZffYumQJxau/xgiLclX1Zq/QUgpf9Rlc9F/OZ38Kz4Aw3he+teHyngMp9kSNx48Z3g0zJPKBap34IskGm/tiNqqVameTwPLg6isZ3pKaKYtc3SrkVQzT98blHaCEpLlin+7Ofm56aD2DUqwZHf9YtYe1ERAgpi/6bR/Da4UlTQHHRLztu/FZWObpQ8o4aIq6oiUzh2aTMlSnZp1MW5UePyT1bVcfEf2q8sA6P+tWg6ObtplJdu/xfDWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=qq.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgK5QVMsXtFuHGaVrxR+mJaYH1alUA46pzORjP9jozM=;
 b=E7iN76VUsrBFNXuiLo6QHVwA4hMI3x5OnEHyk0nQ9lV6i4wNlIk6t6/ZenvnO7NjhiUk8OuGeyKmsZsIdhyb81JCXJ5JyIK7yFDmri2h99Bh6D98A4NqIqeH8IDNhFdQgE/3zBHpmq9f4ywErgUgxb8Zyd7zsEaav6/Nn3bLOLc=
Received: from CH0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:610:e5::24)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:10:26 +0000
Received: from BL6PEPF0006C3E1.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::42) by CH0PR03CA0259.outlook.office365.com
 (2603:10b6:610:e5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 06:10:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0006C3E1.mail.protection.outlook.com (10.167.249.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 3 Nov 2026 06:10:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:10:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:10:26 -0600
Received: from [10.136.33.166] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 00:10:23 -0600
Message-ID: <e9c58333-4766-46f6-956d-4220319cd847@amd.com>
Date: Tue, 3 Nov 2026 11:40:22 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sched/delayacct: blkio_start recorded on the wrong task
 when a delayed task is blocked from pick
To: kiln <806144828@qq.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Balbir Singh <bsingharora@gmail.com>, Yang Yang
	<yang.yang29@zte.com.cn>
CC: Vincent Guittot <vincent.guittot@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3E1:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: c954807e-9673-4cba-3d85-08df39712772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|56012099006|261102123227099003|261022075727099003|261022115727099003|261021123027099003|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+hNUoOdL8JqLeoztZQHhp0Kc4l+v+/sL/RpCmPwvtrjzenwxKAr7Bd5U0DlChVqcJsyCi0JwnI0/G6CitSZtBQxHqBcJevF2xiiTdUIWrQs326b6iKrChI+54cltkPM6CgIbWkjqopwPgZ1Mdy/DVUM7DY2SZvOZTJU28UDAPnf2KhImIF4GbLrfzvM3C4QJtLgpONSHsHaytkDn/iyJZt08j6ePMm9kNK7Xrgs/+IaHW21GqP5QVxuvdNw4M9MgeZdxZ+0+Q8UpfCRrSUJEkZ07HcHFZcVjgkEKKYdJLmXCn0nuUMb1xfOIDXVlOQlifVbso2pBkOArZ2FZtIIqyQI8I8V59m/jpOEMK9bzTk5LrAvOG7h/b1Mnj4+qd7WITTpLwbXBNCfl8gJeHahRGt0ir07UnoYjG+v3LS/yjsgSzSUDKMCzYNjl9F8K5DBZejgansoWyEbpE1ItSEdUJUguUWdUDrAyB3wjNKAHI939BJ0KQ5eYJEEB0B8guMMpVEE1WgNtrfCrmtO2rotvFWYg34Q+yHcq2J0zuk5NSEuqyoPKESfeftKa4VjWqptoyXbe3/f3EZqdnk4XrOqtCO/oc8e/70Ie/Wx7TFaeQTVlnCrTTdv611CbuSLp5k1bk4d471X3OXB5aA6cMHzVbkI0K3fZ4+qfJzAhejojSjnPRKr18rvbqIWESG/ZOyRmJccvMtCeduDNBdCs2iVgWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261022115727099003)(261021123027099003)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X2giqRcdY0sB6AgwydZVunjk6pML2t/prNGoAWeK6jwEqlkxBYzjZDmi+gEpfgBYB7P5XzoD3MF79FvY9NwojZrBpHooZ+WCMhbZDsfsvQONhy8afEnJCeBsUnC7driYB687/fTN3mAoQqiMUApwR2/md69t04DwhxRl1q2yaeWOZjdyMeE+I9N/Dmu73B6Z7EI712kUBIHsVJT4F8cRCyntlTJehUTVgPKoJIa8ZIpnMs5lGrGlhYzC2b3CAe+eySKnsN6103zWxO4cKCwjV1Mot23B2ynvnqTLsP0hLQMx0BXmzYWfIpqs/oAESBnAVflVTBiP4ZROg4ETUd9azH2uLn6wd3uejQqdWPnTGo+J+7G/tUaZozi2V/nCaeKYF4sbVrI2XiZRQpH8Bf6ty49UA4kAIVbsEF6M7djyF/esxD6H/BkqF5WjzI8RPR6v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:10:26.5356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c954807e-9673-4cba-3d85-08df39712772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3E1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250

Hello Kilin,

On 11/3/2026 11:31 AM, kiln wrote:
> This looks like the mirror image of c96f5471ce7d ("delayacct: Account
> blkio completion on the correct task"), which fixed the end side the same
> way. The obvious fix would be to pass p down, something like
> delayacct_blkio_start(p) setting p->delays->blkio_start (checking
> p->delays rather than current->delays). Happy to send a patch if that
> direction is okay.

Good catch and I think you should send a patch in that direction.

-- 
Thanks and Regards,
Prateek

