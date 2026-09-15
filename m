Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDCD4854FC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460793; cv=fail; b=K9pLnKrKrRFwClqX5Ns78phj/S4PjKKTuQ6E0iKVg/31cRDmuKZCluAGWpZXPdMab26pyNVMS/LlFU/+UbZWiGxHG0X1OwzMlh9NM6+asWv5xiPCfFImviqHQQQ5o01/Xd2pTZVpGwLAbpv4y/pGm7vH+QT5Dd0FQrCnyToI0VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460793; c=relaxed/simple;
	bh=Mu29aDK8CdRTfFIX/vKN007y/nw0b6gcgR6tLsDPZtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=caQF3z4RkZFAU5howMWMjjmUSDZ/WN1V5r28khZ5DlfEupN3HumkRZOEzqJ25xOgT7uxzCKLs55LNwZU+RLH4zQxWfiDnqNQH61RhLz4tLTVi3pJ5iT/MIrrILa9c/VZef/gw0Mka8B5Am9yBWM/57czEFT80HyClsbDyFXRPH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=q6H+ndRY; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="q6H+ndRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo5BJ3HxLGoN5VG0aVUs4A0EBfAgnn/zFJamCIVJusWtiodiU8JNtimH/6Au05g3UqdaSb+lNEzMs+Q8H7tkvzK43cGGV3MpPpw8Dx5vfehB61ThuTDNrB0vrw5/1vAHr9SaRxmnEXT7P8U7aWj1JBSDZaYfGMOY+aXUGpPs5AhxL1wqHR1Cau3ViBlQl6NjXdzOY5oBbR1TAGkAE508qZqfhjLT2ptoTNJiJMJsg/HLkDPkdoDstgt1RXthWTuXjGdyZhbOgUtOjHngZ0evOONCVaGOJy2ywxgjRxMOiL+bhqw3F+FJx0cyCHBv1KAfli2ie/Fa6h3XtbqnQNqXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=T920CPnqrYcgpwtWWhxJa9aBdJ5iLu/TpVk729CWY4drGsxInVt8A30xsPs0BmpEMdBuKkfCgkfbCnqJPCU97man3SuXJUkCzOTzLeKDq5K1vKdkFNMoAW4UE6a/nUjKy6oost3d8mFyD05PzZKC/QnPwOhSFc5z1W0HZjrrfd7xVMp+eC9uDRYhsFUCw3zj9c58FZdth4sKQ7PAQuKPG5XvjKRdZ6lNe4GnAFZJrmAqRHf30AVO1owqkuJlKU+CWhZA8jQS/1ijNqfF6r2ZM0Lf2HvVKoDeDBIYAv3WYZu7t/eZ8kaFl2Lkec0SLBE689kWz8ciQokNFbVh5cvnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=q6H+ndRYCFTxv9rJJ3yojn33n78pfp3XPdqo9b+JLMPvydfo9Fq+hyeOn6Z5UCnFjJBQXE/VeYrHYxhYDyhnPpkUJVdkBKlcrutS07hAMrM0/wZlxp+kz+2uWU/Fx5+pH6vjKKa3D/nLA71GgJr9wAGdjX12e8QMsIcHdfnWtL5oeHd6OrWWDcMI81WdAt6m30crwa514CiiuqpmiiApqkPceVU6mvm9cV9ND2DuduWaD6zZmS/0SdwPtJ5s3LfacMEEhRJWObmP6l9AuS4++sWWs6V6wNQO/nAUpRpPipz8rCUd+f6kbE0Jwrnoy2Ufowo9CsCFE6s9qj+xMwJ4NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by IA1PR03MB8047.namprd03.prod.outlook.com (2603:10b6:208:596::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 08:26:30 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 08:26:30 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v5 1/3] firmware: stratix10-svc: increase args array
Date: Tue, 15 Sep 2026 01:25:43 -0700
Message-ID: <f844ab2393ed7bd7dab56b2a6d4b2087d17a9ead.1789448407.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789448406.git.hang.suan.wang@altera.com>
References: <cover.1789448406.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|IA1PR03MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdbe341-c238-44db-f35e-08df13030adc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|3023799007|22082099003|18002099003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JSbS9r0kYojCextuWOOtWIbGGttHC9NNgm4cw5n0Oj/cvf2S6MU/348wqf6BPfb8ZcczvRvToA0jueBPITMwDlevJUt7jHLQoGCpJ6+ax2aOVF66mqOs9tNIcpB7uM7utVlC6hp0Ub4Ekyi2p4jTgB1imdx9F0+Wit+wXM06nUEVLL8QGWCaDdrYs6DOi+2XsjpyupEFK5Jx1SeGgvvL7x/sWHL+iaPsLVqVjNqwUHD46rPbtLW+oUOgEuQIkUnTsRGwgwhXnyQzJkFE3rEDjq7c5nH8klzAk1n6Kpry7tmfd9MJNDEwGn9wr9eVwNDFPNtWb9i768m7xaVi/VAN9LRmbfruNLynfOvJ1YRe36Ii+oTV8XgZNV7q3+E+b64jDidLE4R5QHtWkjofOH4yQ3WZaBi5G3zmrt2OqSOa9jtb1ckEeYcMkTxPXD5rU6GY5c+H3kUZyEgdUmcK7X4hBICw6qHGoUnQYNoyW3JLrNkFHpMygGSqnMxDfDzK31MjhrQo9ben9wN/vN6BVXEvZrtOtQOzpQKnBqv8zFveswfAnc6rfjJqwtqS8LOY9leRDtXT8hSZwWeIUmJR72W2Yy6+x3C5K05AGnhSR5MUxj7LlGHtBa+dFH+0xCDHmB8lRwq/1GzhBfY6Vxw76Nsy2sCW1nV0vuYAsgNTK1xwius=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IMRXIq7Xip8VjQC8BAWQYo6HEoUo4Sp9omkJ5LRLcJTSNA1M6W8X3AMJd83n?=
 =?us-ascii?Q?2RzdXLT11HsWVSsC6DBZJpkY/D6t1J93RB/AT2EdHvVBmxkgCiPBn+InYYmN?=
 =?us-ascii?Q?OSCFr+dl6ePe2N6GcxbMlp4D1++yrtQfrUGEQO6GOWJ7IJI48yx1TxBbPeJV?=
 =?us-ascii?Q?7QKY3ic3Y0HHReplEgzEFioO6eB2Zomij05kbxjXyFWnFSjP1n0fJzkaqm8V?=
 =?us-ascii?Q?C0sLlO4QalgccHZgEFOFjSIWIOp4H6UK9M7pqlT0krDkPuf6vKrfGHSaDz1X?=
 =?us-ascii?Q?qF3uIWusHkHULSV5Lt1w35kvcA27crgLXCHCN5JmLr6EruggwR6TXxfXKLLX?=
 =?us-ascii?Q?/iySPTx080iNa0wseHO+OhnVlZsaivADkuPW31mq4/IRvwGOFJ5XP0p15rpG?=
 =?us-ascii?Q?juSU58UxSuNTgEZqzuEl4tsFiDqcnZUxtIkQvq431TtpLH2irq3KfXizJ/gu?=
 =?us-ascii?Q?3AnElduK2ThbpazenWAJ9h0uuh4PV/UoeYowGYk4G8Jew5qYbTrFx004thGG?=
 =?us-ascii?Q?wKI2292omxMTimDXPOJcaaP6C/ms5fLRPNX8aXqP1TYbnyIv9mSiHm2C+pvH?=
 =?us-ascii?Q?LYCQat6V6K1wR1ZbdKa2vbSBtHfnNaOxS/WqGzGx0fhC10IJ9SEkSLQRLe0C?=
 =?us-ascii?Q?BM8V+61qkZN8fr4wJ6xH7WCYJJsUJzDRGGBK5xGrErVSV0gw3TmBi84TVMQR?=
 =?us-ascii?Q?c5YknyrL4FYCC6IIOf0z+mMGLW4gmgPVtjCA2givym1M57sLWQ8H15HBBLF3?=
 =?us-ascii?Q?naf9hIoel3IYEILvxM0ENHMddjmk6zZXVPZea6XCVP8jo19T6az2KO+1zcGa?=
 =?us-ascii?Q?GQA3FywfSgTGChCjObW4ppRuu+h01+zthNIUzZ0p1Sceerni6Bed6jaZmJOU?=
 =?us-ascii?Q?pegSTtLRmQZi2Nzu3ggxZl8QBTfYwtM213Bp+1kFY+4Y0Yeb4VagM2s2HEZY?=
 =?us-ascii?Q?iw29KB+TPB1WLxU56578a3cBMRWzYfHPJxtd4yh+Gxfn2Vg2rD+EAVU9cWnk?=
 =?us-ascii?Q?81whQd8q30jV8NxYRllha7CdxdQmYYKvhu6HVOKgVJWuiPOa5ts8DnL8FnNM?=
 =?us-ascii?Q?rT7S7gg+qIW8zOgOfhwMpnVViCRrEGWPPrQBwESIMYPk+a+nCqCZk6RSF0Nn?=
 =?us-ascii?Q?G2MzOtmeq5LKyBvdB+YZ/kayTKh+i59TWa1tiQcA6M9vTSzQRVoEyvgQCFlC?=
 =?us-ascii?Q?zM8v743Cum602jWQErQelpypAeDSrKW2l8u8faKtYCQ4gNVn5PMB4XnZi/U8?=
 =?us-ascii?Q?FKaY/G4i9ElOBywafCq640E7Rx/z+I+jfbcK2NAdv/ItfzFB/VUz1Ea8Qr16?=
 =?us-ascii?Q?WfdT4TaSHPTXVq0uaZtDq//vfzmdFxC92FhesjfydCp1mICBbvcPdd4yRJxv?=
 =?us-ascii?Q?QsInUuemArueeOrErMjQG+dKFXnzodpCGeAT5IDxzmsg3TqaF5ziQxREC03q?=
 =?us-ascii?Q?2d9DavUXlU/X3NGB2LPHONGUvnvPk1goh1tjMB2Db6isezWkkswjLAPI+l15?=
 =?us-ascii?Q?ZvxGFAojLiUo7QhordbBoSah2sD/iUvWQFQGHeqK4VwF2IFPjzWs334Augxe?=
 =?us-ascii?Q?HrjY+1kn67exUgG+f9/xhBPPJrSDQYHAb4ip6RSxLX+xznycCMlzZblMJpUU?=
 =?us-ascii?Q?9jJ7daywypR9EU3lhmZc0VY+Oe7eoI2TZdn5qU51Lba7bKj8IQlYxje7Pzfj?=
 =?us-ascii?Q?RhpbN9teMEXPgFQpuMb/lNRxwjOAzPukpRmVhO26KjSE2kn7eFSYp1mb07Vl?=
 =?us-ascii?Q?uOczw5jVp/BdGCYRxMJkBz2KB5Dfoo0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdbe341-c238-44db-f35e-08df13030adc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 08:26:29.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iewFwQ7Hr09kfMmIUXjXdsQPXQGzYbtWTw51vDHzLdSBg4vlBhGtvfjfrXty68A5Vj+2HCcGFq+dbNLs5cw6BPEHfTKLxXwm7EfjZL3Nvf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8047

From: Hang Suan Wang <hang.suan.wang@altera.com>

Increase args array from 3 to 6, for the SDOS encryption to call smc
call which is used for args to be passed via registers and not
physically mapped buffer.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c                    | 6 ++++--
 include/linux/firmware/intel/stratix10-svc-client.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f8c2da207cb4..07345efeef0c 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -173,7 +173,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -1888,7 +1888,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 	p_data->arg[0] = p_msg->arg[0];
 	p_data->arg[1] = p_msg->arg[1];
 	p_data->arg[2] = p_msg->arg[2];
-	p_data->size = p_msg->payload_length;
+	p_data->arg[3] = p_msg->arg[3];
+	p_data->arg[4] = p_msg->arg[4];
+	p_data->arg[5] = p_msg->arg[5];
 	p_data->chan = chan;
 	pr_debug("%s: %s: put to FIFO pa=0x%016x, cmd=%x, size=%u\n",
 		 __func__,
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index af13dacdf5ac..9bb46c3cb0f8 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -215,7 +215,7 @@ struct stratix10_svc_client_msg {
 	void *payload_output;
 	size_t payload_length_output;
 	enum stratix10_svc_command_code command;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
-- 
2.43.7

