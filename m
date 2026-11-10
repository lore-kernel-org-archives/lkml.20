Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794328406;
	b=CebtdRYJ5/1loEfFOhRrI4xG2S3hqSg8g6yTEEk0L2TEJVh88StZ2LsaxLw9KDbZGctS
	 IIij5Vum8LSJHkq1sVevEKQIOEu/p/zvVC8Z3HhO8mEJrotGzcA97ENbo4nReD/nFfs/J
	 4/cwV7I5R1lvzY7U4wfUhRk8bgrmOPHrJMx1xjkI1mSllihpZoltiYkE0aVBen69f/Coc
	 qjGV8WgUbL9FixD8r8bKZAG32iwZsDUHKh6TJlxU+A2dLPWz3kXmYQMydnwjVd9pnoNLy
	 7kNdsSfrY9s/f8+YlMDdUQa+wgVRFp8RC9Lg76+cKz9cXmUvHsvlUD85nKyLifZZQ4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
	b=0NwkJss9QeSZlY3N59Ac+qv3pZ4tQw3G7rOK7TqPvlBjL9DLrDcZ8+VigJtyuiFwhRPa
	 oqzMbhZu3ZVphbhZvcIkKe2138uIIdwfhI0Shm+g//2XrZtdB6iT0pqlNl/H1KYWHIn4z
	 HdwfTdqiToAsAbI1nUpMq8H8bvMBlytRPiwMJuCJ6k9bzbk8tGNCo/mFgpWpUS/U2po61
	 fUWyZqIsCkbSfzDCL0dR1kG0Zp1lPo6csPLYv5J5eT0LgtBykgKCUTJSKwldM5TR3OkWy
	 2AbCoH3dMw5bIb9r/pqgGrQd4z9X96figObFW4PHwyWIUlEmwSKDgpaVTTk5QLRaDOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="cMR/GKxi";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=jq4bUZwo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C030606A33C;
	Tue, 10 Nov 2026 16:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C030606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=cMR/GKxi;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=jq4bUZwo
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AAEw2Do2015361;
	Tue, 10 Nov 2026 10:33:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkps
	jM=; b=cMR/GKxiUeVvkHDY07NmzOiRO18ddKJbSeerI79IljMwu2QVD3VurkdWU
	j7uT3iCRBi8EkIxZ8txADRoGGs0Whlych1a6mLPYCFBtk5qtzASliNh6DUgeO5/X
	+CzwbHSPjzbofNJQOA21blUd31AuizF5oFaL2+KNq/UVbAUM7yQf7orHNtJ6Yjjw
	kOn4N7v/PiAdSoZbsvrdKjQNPkn4MBg6FbpVr8W8NYJ8Xv80siKF97BKH21h2CXu
	5evsmG0GQcf5fu8ucbTpp1+uBR2yCq1Xo1jzv3WcDISRKYLrxkbZishXfnGFel+X
	djP37W3Ux01zEX/ARY3p5obAq7hIw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4huxnx31jx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 10:33:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFs9TqRuE8geVkuF85AlbsxEPdWQ8QndOLM91yuORf2s2UCz0qCKX1tISH8SfOtDH9S89943pfcMHYTnsZKxN4ui8G3rdFr+pxzDU9zNmcPdG0zqWtp0zAPhvcWVXnKgFKtdpWBkqeri4DwZh6eT/vAj6U8wBbyuSwIMyOlqqIMTZK94+okOrT7PlvmUIXcwWykAGWAwJpXBjVROanCtwbx0kz1JuF5FYdl+/aLJocO1KcEopEJ9qTLesun6iwj69AhZpV8pV6jWINlvK/5tbteMPnhaPx9Ff0QWCVp29BHuVQy04eqvOffllyKp5EzroG2yPblqGSlG8aLKQtujRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
 b=vBW09fbF53n+yfR0tqYafs6XwJattT2j0268UQkbAEjHbd1HJfIGmhnudOv+M2Ad2lnJlvSXAS65N6fc++L+nA1w+g69edPGLX9yJT6/B9aBLFv95f7+PDPwu+phmaECbRvY7k6r7oEf9DLkfSjV1NH7PWF7QvrOUFZ/eXxWzXeYohMyvQN1PlePS6TTFFVpeC8rmkUzkAVrHiW1HG0MdTo7GMFIZUw/TgrCK9em3mwENqhxE2VGMXseHHP6NxDPxIKM3E0hiIITrmF2iXwvLJp2BGHd/OIyQAGbmcIkbEeHSjBka2JeY/jAiuI1guNLSLN1bu0fooahEa+kWkdc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVXyasBrEOY3qWtcfZCzwrJMRX4+XgLztno7hjkpsjM=;
 b=jq4bUZwog5XrsRbn4RNBL2AXjmZZjpcsBG0uGXfYbEzt1EqSlm91+F+HBei+lNiBweiFmrO2V8E1EAr/UOw38irIe9NecBh2KcWXjccqSz7ib0A8yoBflv/HAFamUsSBb1+ZGIPmOewioYcKISO0FuQD5QacgIu36ii8cGETC2Y=
Received: from SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24)
 by DM3PPF7961280CE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 16:33:06 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::af) by SJ0PR05CA0109.outlook.office365.com
 (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:33:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:33:05 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 10:32:50 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 10:32:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 10:32:50 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AAGWoH71141135;
	Tue, 10 Nov 2026 10:32:50 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v8 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Tue, 10 Nov 2026 10:32:47 -0600
Message-ID: <20261110163247.48712-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110163247.48712-1-b-brnich@ti.com>
References: <20261110163247.48712-1-b-brnich@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|DM3PPF7961280CE:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a76afc-03e5-463d-18ec-08df3f484c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|261026121527099003|261009221227099003|261021135927099003|261026140227099003|56012099006|261022075727099003|261021123027099003|261022115727099003|261022105027099003|261009223327099003|261009221727099003|261009220027099003|261009223027099003|261102123227099003|261021121427099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	evYACfRJ/RkV6vqbpgOYU0uN3fH6zAy65crvQ4D1s2c1Rg9dsoC7Dq9/qgqx6XChfMwZan07qt9BreYlFlPy4SAottwR7TsRiA5NsDRN0lWEnD/wzu8BR4MaA9zgbFagseEExQogaS19bxM5wiSU9qtGODw/Sv6zzNE6gHAY/G5FkpgM7BzgTHSIp6qEr+Zg7lAgHXBVXjNgQyb3MJ5xw393Cp8TSInp57xWfvLcQZMuJkkRyq1jWENa5zxKIMZQTia7crXe9cmThczZQLyKYxPDjOBgojYZzAYTm//T6Ppq/IqbpZVz881LLWHOOGzaMpLEZo4/Tyh2jl7XIqnSf1SUFPRE8mhXiUzw3xvJStWBbGbYyzy183Mul9mFLaU7OLmeOXTRsWv8oIFD7PLx+ZJdYoLq1AqJkU5BXQNBbaFxC8YEDMxY8bUpZrExN5DgxJZ4xJUKv2rc2AtcvnKWX3IRqpRIR2BmR0YxAjxLIRUx7R+L8dt+VwGlDA0zCYg197WBLU9ptedmHnYNXd59oc4mig9bD1FAjmMY6RgL86YPH8m4UnfCPL3WTXgKuMGg/PgRmAZHAqaf5BEw/ZsHwQpH2yRHCbvrdI4omE5z5/RHdggqF1YbGesh9VbuVcts6C7q2xVqHMEChnBA9ZskTTfblJlBclwyJhW1IiEtbkMwO/6FyWmoMrNJdwpu4qzrysIvD/Kl7Jc/SBLgx3oSvg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(261026121527099003)(261009221227099003)(261021135927099003)(261026140227099003)(56012099006)(261022075727099003)(261021123027099003)(261022115727099003)(261022105027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261009223027099003)(261102123227099003)(261021121427099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+sVad2cV2mQJW9L/+iW2kNxT/3I0jY9uKneLAK59ljvhD68iEqqAiFiEmmT7Pvun8euc3QiUl3aeM/jQ5RcQjWzJ3Bo/EDfL55aAh7myGtuJbv0vtoYqYWlTGMP8aTOccn9Q7OvrGuB4ispd+lVP0K2eTotwtrXKU0z/6BocMAQ42xubWaXgEKiIc4Sa/wsYTIn4j3OrwoWDClkAadruRsqfnkzm5g9WCIkZxbiHp4A/elSgzAkrBTOVkRajb8HxrQDyy4ibjCQLK0lvIhJHyPp65D3l6tFLLDu5braCkmOs/2fEx5lgEBZ6NWeFcDtejUJOe1UFiobVkLw9xnCa+CUSEuJBF/Gv7ALR1EQA0DmQKMNKkLWxCPQLddwltxYXBA5ycGGFFaNhpKiv6UtZLbrbVEgXo3htVXuk7iaZxRwRZtGUGUnD8Aaph1fiDqwp
X-Exchange-RoutingPolicyChecked:
	YpakTKaapAi0qDvitVTpYGf1wgV85zdZCnT8tjn389rT78d0Ok3DWDYewRvkbbp6FSkLrdm2aPUVCZ/zMLQWeJkq5655hWI+HTUXm7gJ3GGQf2PV2YnidStWW1bEdJRfu4/z79lRUz2hUkVStYoVoooTwzf+mPure5im8aeO3gTXReymql4C2xncC59stmSv2VZU5WCMu+kF3GgKRNp1BkuxAonifpN4K1d+4uJn5PW5UtJmylCoqp3CBmqtKwfTz5IwjYk5/3bbVxqEfn8KcBiJ4oiPC3aZsu3KADfJo7yeWOlsW0EyJJUzImytG4C7OzEOA/2VyZKh3glmXIjh7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:33:05.7171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a76afc-03e5-463d-18ec-08df3f484c33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7961280CE
X-Proofpoint-ORIG-GUID: Ku745aHFfeoVdtPj3erakvvsPFotAt1j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NSBTYWx0ZWRfX3/9zNdg79vG2
 J8fLFPCc2U7Ii0ccw9CeFT+se32qYz59C+a2QMTo0V9f4YAoY4jfZdHg2VipFTkxD6lu06iCr0c
 QJgZUV8iskbfI2YORAaCyguDUQSqrp4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NSBTYWx0ZWRfX0nBSLYbMfcZ8
 Udksz65sKmWJb7NHfgx6rcwcWqrVVcYVOtELsibFc7+sNSThN0gwGKbqLdt6Gz0WGYIJNl5Bmh1
 QIhzE0V74rkrHRh+v8LSbzi5UwmLr9OZ3T3U1fzugT2amZ6ZGegKzxj1YPtgyXchL7BD1cgMYll
 h7XDcxtHE+qnAsc5W5kxfkE0bY8KdFw3bjFYEmDx/YHpZlFLaBVBqBRmScFuuN+PDf/QC86gWbv
 7gwi3gUiNeCXtK7zQGa+Qk+cBMIRezQBhP8od2Jk+UdVsr4VDG778h7Gj6PseGtK01HfRmvMOin
 VOXL5/bluoAhJUUJ6JgeAVQ3nasD7fGd/XkMgL0Tw2VBI/f+jMGQFlA+/iOcYSPbUdK1q7DqBHI
 zqRO9GdCRuFYmPOaauhE4skIEUEYvme/oB7N0bw6JakyZj58g3xveucyg7yrWaoVU0hnIzDrMTD
 yZyY5bm3NU2TpRlK1/g==
X-Proofpoint-GUID: Ku745aHFfeoVdtPj3erakvvsPFotAt1j
X-Authority-Analysis: v=2.4 cv=b4cncdGx c=1 sm=1 tr=0 ts=6af3474c cx=c_pps
 a=NPM8+NhlmoQiEOpqaaNCjw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=aRswYXHNUpzWL3HiacYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100065

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of system as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

e5010_init_device is tightly coupled to runtime resume hook with
autosuspend addition and has been removed from start_streaming accordingly.
However, there is the case where runtime PM is not configured which would
leave the device permantately uninitialized. Add call to e5010_init_device
to e5010_probe to account for this case.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 48 +++++++++----------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 4e77112b59197..3c7c5f121a32f 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1101,6 +1102,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_m2m_init;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, JPEG_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	if (!pm_runtime_enabled(dev)) {
@@ -1109,6 +1112,11 @@ static int e5010_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret, "failed to enable clock\n");
 			goto fail_after_v4l2_m2m_init;
 		}
+		ret = e5010_init_device(e5010);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init device\n");
+			goto fail_after_clock_enable;
+		}
 	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1123,10 +1131,12 @@ static int e5010_probe(struct platform_device *pdev)
 	return 0;
 
 fail_after_clock_enable:
-	if (pm_runtime_enabled(dev))
+	if (pm_runtime_enabled(dev)) {
+		pm_runtime_dont_use_autosuspend(dev);
 		pm_runtime_disable(dev);
-	else
+	} else {
 		clk_disable_unprepare(e5010->clk);
+	}
 fail_after_v4l2_m2m_init:
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
@@ -1143,10 +1153,10 @@ static void e5010_remove(struct platform_device *pdev)
 	video_unregister_device(e5010->vdev);
 	v4l2_m2m_release(e5010->m2m_dev);
 	v4l2_device_unregister(&e5010->v4l2_dev);
+	pm_runtime_dont_use_autosuspend(e5010->dev);
 	pm_runtime_disable(e5010->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		clk_disable_unprepare(e5010->clk);
-
 }
 
 static void e5010_vb2_buffers_return(struct vb2_queue *q, enum vb2_buffer_state state)
@@ -1307,31 +1317,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1347,8 +1339,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1361,7 +1351,6 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
-	spin_lock_irqsave(&e5010->hw_lock, flags);
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1369,6 +1358,14 @@ static void e5010_device_run(void *priv)
 	if (!s_vb || !d_vb)
 		goto no_ready_buf_err;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		goto no_ready_buf_err;
+	}
+
+	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb->sequence = ctx->out_queue.sequence++;
 	d_vb->sequence = ctx->cap_queue.sequence++;
 
@@ -1493,6 +1490,8 @@ static void e5010_device_run(void *priv)
 	ret = e5010_init_device(e5010);
 	if (ret)
 		v4l2_err(&e5010->v4l2_dev, "failed to initialize device after reset\n");
+	spin_unlock_irqrestore(&e5010->hw_lock, flags);
+	pm_runtime_put_autosuspend(e5010->dev);
 no_ready_buf_err:
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
@@ -1506,7 +1505,6 @@ static void e5010_device_run(void *priv)
 		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
 	}
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
-	spin_unlock_irqrestore(&e5010->hw_lock, flags);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index da57bc1baa464..807821ded127e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -23,6 +23,7 @@
 #define DEFAULT_HEIGHT			480
 #define E5010_MODULE_NAME		"e5010"
 #define JPEG_MAX_BYTES_PER_PIXEL	2
+#define JPEG_AUTOSUSPEND_DELAY_MS	100
 
 /* JPEG marker definitions */
 #define START_OF_IMAGE			0xFFD8
-- 
2.43.0

