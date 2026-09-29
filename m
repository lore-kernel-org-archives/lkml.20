Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630823394A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707345; cv=fail; b=jcVf7UdJI3JwLGFWEIj7s8/6bVMspaHTGtnyfo5Fdi0H6oiVA2EqR/s7WIhUEtvt/6PJFXgslKSfFCsrSVxRp+exKxwk/pwBmB8aC7eL832vlU1GorfEzT94263+opkD67G6lA6MQtkqgqhZTjLR65zH5TUauDzHrZpu8SqS3wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707345; c=relaxed/simple;
	bh=iY4xDTTMvheI3atnMJm7PDHFBLoSPLNZ7hksIQg5ogc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOs0Tyfqub6CaRG9nsHeirJXzzoltprzpjetD8DO0jBo06S9XnPfc+jJOpV66h5qg57ymGc6agB85yrXqwCPoS8OcC3Sr3hFEmAtZd6VrONXrUU7QNCB009wQBq1DTtn1w654VoJAP5GyG+ne2T0dqDIJSSNkx649Cc0KlGxGzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ixatvkh0; arc=fail smtp.client-ip=40.107.209.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ixatvkh0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feQ3WSsppRQC+4vKEoi9asfz7MeTZNMQ4hEVS1GWxpT/OYdE72awRTbrcfjedftttxoOaFFcGd9ujgtazfoGGZ3pfy26Tub3tnLjmwsp3mLMef5I73iYF4b9aPRQeza86B9ePan3Uu97Kv2Du/lszZR5E2mU1TKXpsep0+g3+C/oNhM3Wzrob4C4JRVyuK2YHcT1w8zzDTLi69p2vyuFNhKKKF1gORVzp2hDi00xKgApmR0El2Nb0dI8wf4HSRFLHZdzFC76JIENupHirSqCrhRQBxLds/iK+OIP1M9Yt4+hbpdqmeYiSvfmJ6EP4lo1LlM1V93Sd+Akx6ILXNnklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/2TT0IDfqZF4DvZQ7I57VGFygMtB5c0rV7N3e6xZWE=;
 b=YHUVfU7iKJ2ER6dZZmR/IqDeMCDFeoseJREGEI3pldy1vRvxripT4gubRBX3J8IjNrJoLgZr4HOZP6eZfdD9HpVEY/gHP3ywfU5iOULEY9tBGtsHafmcijqnEmpxBkbVEJ/YfGrlliI2mxo6mwYywCvL6Mi0DNlxCWu288E9QuhImPIB9JvPBIhUf951Hgl11rpEMpNPUf3D8ka3MBtBxSoAL6pd/I6euj0gGIYrtcWAU/aioGVdPAbC7DC4te07sYqUc0AiASg8epM2qXzGCJPz0lky7wGKmPbUfi+ojEKQR9RWVNi5P//UOGjlAXgGuIiqbVLybUpsav/F3yNWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/2TT0IDfqZF4DvZQ7I57VGFygMtB5c0rV7N3e6xZWE=;
 b=ixatvkh0P+dtwL4srtdl4PcfA7F9pwIfwaasn4r79ADgdtrp2Y8jGy5SYdtKLGUM6ylwM1S0SHEJpTMO0wRJV1zJlomqMvxvpgLp5q8+wiCtP+Vjt/RXoztgJ6M4+HdYMnJsvG6C157qlSMqhhKWpEkV4AVFEn6n4/Ve+HCyfVA=
Received: from LV3P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::26)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 18:42:18 +0000
Received: from BN2PEPF0000A893.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::6b) by LV3P220CA0005.outlook.office365.com
 (2603:10b6:408:234::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 18:42:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A893.mail.protection.outlook.com (10.167.248.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 18:42:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 13:42:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 13:42:14 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 13:42:13 -0500
Message-ID: <d97ef627-e90d-dbd2-0ccc-4970d23de11d@amd.com>
Date: Tue, 29 Sep 2026 11:42:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/amdxdna: Replace create_singlethread_workqueue
 with alloc_ordered_workqueue
Content-Language: en-US
To: George Karagounis <taterraster@gmail.com>, Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
CC: Koby Elbaz <koby.elbaz@intel.com>, Konstantin Sinyuk
	<konstantin.sinyuk@intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <mail@taterr.org>
References: <20260925124804.58808-1-mail@taterr.org>
 <20260925124804.58808-2-mail@taterr.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260925124804.58808-2-mail@taterr.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A893:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0904b550-6872-443c-f243-08df1e59638e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xIQtk+bLB6vr6p1BD7IuGCHdiWq+M45kVXIQbBToCN2s5EPEQudrZ38c5Bc2n1X2dnAy52SEYXrNYEh6PJEJmWrHQjHEuWiqnn5Rl/Rf6gbDxOwTNSeKgAuKb04Vpu2/jCnoUE2uxJCYw5IPVj1JYJPtkUoQ/sURNEUZRNDXGWnxle3W8+C8skeg0i83HFOQaMydWVeXMfZNjZF6Qdj9p4ebrS6D+VMDXnS84mjsM9j7THt5FtK2hIcoOK6FUIFknHxk0zH3mux2hhGGuLFEB71InUIcaQPMSMUSdZtvMQx2LDk6rErKs0rm0qR69YSJMG6woyYLGtpsmuwWauXPygLj6nfpmWUi4QkSFqS33QLDNPdMVOfevgbbsILkFQe0SbAjxGIjHXcwxL5H+NVd1GwyuzUiBGukn5g+lL4+zcxMdXDAl739wtLweTBCebXTQ9aChiPoyvhexfXfEEPxfmV/8VuFGAgFbNJN8b+Mm7kmmuahgjHa37HRUu3pw5TBNlP7WdpUu2Q/kmSuP+xDV97nJKr8aXb9il3N7PtqnilFpozALi/ovZIGTgAZtOlcTZ0/3blO9kz+38COmPd+IvltThL2/IJjw/+AAsIGgfJAeJDgBYbN/23VYQFoiqVrCdZUzktx3V9bM2XzawCWZyASvWcs84XBFWLSPyg2JVtWuhgxZVCAb34WTjKUKZNIAOkv+D3WB7NO4nw2r0uvnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lxwMrihzSHngWoQ0kiSNMxJsdCDXwrt1AXLl9ePouc6fnMTx51RGHwmQ7IOU5aZsBrXw+NClqtCNGmbUCrbV9m5OfV8bKI/OXcTYOuxixTVIKbm5d3RKCN5YOfGUsS17J+Rd9H9mYiPUazjwsn7fiqtidcMFk84IbVNn+nGdNYd5ZWxMhxlv2sdTrsWwS+mWvBwI286QY1Gh8UqD88hb+p/dUUqCq40hNOQXm+EKoo007TBSdhSExPCPZXVXEIyVftmiFqAuTqBFm/MiZIXcI179Lzqkfm2MfAfbKUPUogClHvFKV8vVAZvVZZwEWZrVlXM//5CBKC3imycrfJNp4GjUCBFQnX9fTr8yAZhVLRai+WlyV4HArPn2upF1ZG9JIdwbu38PVlBU6EsEZ+cGVkwpjRyJURqAhK5mgi2UyWmOmMBNwIBbM2GugNndwyDr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:42:18.0701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0904b550-6872-443c-f243-08df1e59638e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A893.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132

Applied to drm-misc-next

On 9/25/26 05:48, George Karagounis wrote:
> create_singlethread_workqueue() is deprecated. Replace it with
>
> alloc_ordered_workqueue() to use the shared system workqueue
>
> infrastructure more efficiently.
>
> WQ_MEM_RECLAIM is added to ensure the mailbox can process
>
> interrupts under memory pressure.
>
> Signed-off-by: George Karagounis <mail@taterr.org>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index cc8865f4e79c..05c3786de135 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -481,7 +481,7 @@ struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
>   		return NULL;
>   
>   	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
> -	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
> +	mb_chann->work_q = alloc_ordered_workqueue(MAILBOX_NAME, WQ_MEM_RECLAIM);
>   	if (!mb_chann->work_q) {
>   		MB_ERR(mb_chann, "Create workqueue failed");
>   		goto free_chann;
