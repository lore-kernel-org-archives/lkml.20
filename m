Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353712;
	b=MNz4KAE7PhAtvWjjR/AlnoTO5kqRvrBpptOrDhQmTgBNw30PbNJU3meNDb9ancVm+A5k
	 T6s2BlRtU38oJ4zej7tRC5RvBdY6/Jkz13NIyC0jmZPkIGQveByg5mvyQFlY0pHkCo+7J
	 uojIUQDsPxrjT1Jbeih1MCNsc7xk0yqYrLTker+JOBcHtLwHhMG5ZOc/lCyWSqXQUxxPa
	 hzMbW5/cQiXjsT5wd7zytzq5w1tGoR6f6BiRmvkmQjkqPipTZdv1RQU2ZUpMG3SqbAdZ+
	 maa1J6E4QnwJUwuP1pufHT0KWC1e6roAeTfbXxPIYAp3z+S/IsGR66uKUNHE9b7jfhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353712;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4UtKCJ8NT+3MBYHOs7fRt0jXx1INLOTaUmeTDZvpQgQ=;
	b=v6YB832VIJjgHTrKYy8u+j9un3/hb6ZdzhxaO8HJcOVuucvd8liZqYciTYl0Uq5Fyjr7
	 4Z3pD+/XMYBhaK5NClZHAj6eN2QGcA5j3k9yGSzNb1k2FuZZLckDTUei6swKehsTeO/05
	 EufNbJM/aQ5jZ9hfO8ulLg62vIM1/o/EyrcOzWdi6Upt7e6yZTzEvMhW9idfcwz5poLpA
	 tFWI0LCqGlFMIsXaCsaPh2buEmp/10jpWP6cgFJcgUB/r7HkLJRiQ3/hUrwn6Dtqg+26s
	 WpxPzrt6zLdAMibpYJFWVdbfE1UPgvEJeAEh1hFqnhgk9Z2mfzNEjCZ0oearZ06qG9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FaKxy0p+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.10
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B25606A32C;
	Fri, 30 Oct 2026 09:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B25606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FaKxy0p+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMBtanguGb9ZsKwNcVaX+kS0iLyJ1CPO5vFvN1eAvkMiUB/zwnwUu6kFN3C4HCu42vRtGc+NOAeU9dIu00Q2abziSBzEJv6CceUVLLThyuhxKqQeZg8m08/NNigQwFlRFIaKdDhmmtnL5Cc/79Hqr4wc0hm99ABeLBm5xxJ8HlEoRIIMucvTard6cP3qoHhiWycVqFp8NjI5L3ehfierLVeH3WOLPUWzFlJQ79Nvu6IzDU0fxtMMay56yN7csWWvFb9LxoF9Ik8/X0KRjdk3IgKLTtV3KCeyKgKvdy49kHIBbElAODa4WaqOddVvPbCM4kQFvBo8cJ/hpRHtVoriVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UtKCJ8NT+3MBYHOs7fRt0jXx1INLOTaUmeTDZvpQgQ=;
 b=YDDVoQLeXC5VB8KDlDPFJqKdLbXi48XyhE+9ab1/q/39vmvm0mmjH13jDtTBYtLk7q0MUai4fiMlEhnNQJ6g2MCk8xNG7rG8OxHBLpyzy6qC78ad20Qgvcya6wGJLQugpdAlQvuAxeDCveiFbVZKI5wox8tZ6dN1v2vm2EcSft5PmSHFWquXOBaBtJNxmW9y1dLz+jkJzHi9WgkUNaE+9UeNnFJ/PZFIN5FZ7WuBh3pAn6Mq3jzZOFUcv35mbkevi4csPFey9gzTXlRw9gGingrCFJc1ewN/mitxHTO0gqAi1Vo5iqnaEvcEUsKa0pkK/CNhBumU7jhaVrq0lJO+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UtKCJ8NT+3MBYHOs7fRt0jXx1INLOTaUmeTDZvpQgQ=;
 b=FaKxy0p+EDFpX4o1FWLCTB6KAAvmoIjrvZjySHS9tvKLcdLBCnYawmN6eaAvklcB2vhJJAsvR+tVwGlDSgaH2V9nlxZfclD/W1Y53hkdtPo5XA71vcvSHhOuKhPESBvAdu9LAha/PjSyLa+wtruWBfJtTxTbsPqlvYFgUgT5Ctk=
Received: from CH0PR04CA0118.namprd04.prod.outlook.com (2603:10b6:610:75::33)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:48:27 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:75:cafe::6d) by CH0PR04CA0118.outlook.office365.com
 (2603:10b6:610:75::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 09:48:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:26 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:22 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v4 01/16] ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in mc_probe()
Date: Fri, 30 Oct 2026 15:15:16 +0530
Message-ID: <20261030094714.1123396-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 753a6762-86e2-47c9-6c38-08df366af2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lIXb19qzht19jQ6MJWRAK2cAWFkeMWjrR6QTjMTtg/jyVmYqpu+CWAGlUGLHCq+9E4Y4M4sJvlqeVFI4XKXIbuvihi+ElFlWyI8PkvtXA4ixuHjdFqpQgqpyx89i0IR/yi4YrJGdnTAWbsoM3WEvQ2joSvTozTY9rvFGOboLAWKVFpkQFaQBeolcTXDnesK2zSXITRoQh/0ts4ocqufBNYpcIn5N/P1jn8JJBbfEPp4mwNNakw5rlid/aLhJjranJ+jgyN1ZD+DPQ0+Q+72jboouuKfuqUdFRP10zu2vf7FUOy5A1QF65jiyRw8ffuP31JZdYDDc463N8ESnxMGMVJxXxMGkCeSEfv/ie0zpvzqELE1FFltoyDi2wBfZ6BRnOzP2Phr18TaUQbAxSFDVDGETIxIiiJkYfWpSVwFZbtsl15UnIAFBarlr2xHViuM/uA3yRQz7G67cVBE27YHHtev8stjIvriMiFb1tReRmaV2XkBRaPex3tnGYR5KdnPdzcLwniQRxTyKMAw6MHYeNPTNQJbZ2RWdvGlwqm5l/OE4SuB9p9MKlguFwspdbzVBj7MIzI9LJp5kJPg6W1LL5AVvSRUbsqR1E1VNwmDClM85N4kPRpkNSTUN4ZlBaNA7RbpCYih7dZaVlM9cWxz4pIBoVvEJrcGEgje7KMPasFhFP9xQ3YtUtb8YLN0HkIScbvhMUgyQutE9jUioySYS+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g5VlFvoWhV0pD0Av7hOW6UCzsCKwsrBWsVn2Q77cwXvOXQo4v5G07kJOsmgJgfM2VWADw91eDUfvx7u+Y0HWwETtpl7OaoF2lj/dUf3cGbOmDoo6I32eRnD89fZZaOvnzqzwuF/5JzvhTzDFtGZK/M1p9tb971vb9+npKU2FJM1jfGuswH6Zi2rqfngyzpbCTEku3pveGkD8tXEU9Pn3K41iGbt8Tvh2e8iho4PQ5aMHXG/z3cLDrAK2+HCUycJs6i25itlqT0yqRpoxkM0U+MTLCm7CWhZ0HjfXvR2Yc9/vFvxk3t4r7kD9urAGvWvP3sFEY7E1BY1d2YS5TVg93rNsJlvRrWIKC4Cb9ztzCxm0MR0CrESgAOE5ggbo0FyyNHrOy8Ks++3eC1Z1+j2Mi7s9WZY9ji1A/CNfXucY7if5EZqGBJ/xGEzqZpd6ID9Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:27.5283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 753a6762-86e2-47c9-6c38-08df366af2ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981

On devm_kasprintf() failure for the cfg-amp components string,
mc_probe() returned -ENOMEM directly without calling
asoc_sdw_mc_dailink_exit_loop(), leaving device references acquired
during sof_card_dai_links_create() unreleased.

Call asoc_sdw_mc_dailink_exit_loop() before returning -ENOMEM to
release those references, consistent with the cleanup already done
in the devm_snd_soc_register_card() failure path.

Fixes: cb8ea62e6402 ("ASoC: amd/sdw_utils: add sof based soundwire generic machine driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ec3e1f5f1052..979048e42424 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -425,8 +425,10 @@ static int mc_probe(struct platform_device *pdev)
 
 	card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					  " cfg-amp:%d", amp_num);
-	if (!card->components)
+	if (!card->components) {
+		asoc_sdw_mc_dailink_exit_loop(card);
 		return -ENOMEM;
+	}
 
 	/* Register the card */
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.53.0

