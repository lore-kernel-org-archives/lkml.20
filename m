Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899044;
	b=3tocFLPXuripaBBG5t90qmT4fv5JYrmA0k/1AowcXAHus2AUBSXaPK6UZTlEhECqK+Cn
	 r4mm4221/1KCMju+kwZPIpOAqy2T5BS6Iw0pHrOKjI7sbuNc5WLvTZCJHAo0frkGm4L6Q
	 X48E1eHo51wNYwoyS0NrxuLVEnjz8HFUgpDc32OmFMaQPsitCLHKFTJqfiYpv1fo55Ffj
	 ceJpOAbc+WBIk7MyOGWl8u9n7+oQKwX1Bo60oLO0QuDbYqvGxz4Bg5cXh+UruYE2xofeb
	 C6fTU5PyxAVW9gnvaPdErkgljaZdd3HDnsCz5Tx/D+Bp6KpgP7izteo0Jtjm6fYqxBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899044;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
	b=YvQethSXUHd/5MegPEQB/YU4ptAh1thQvW+H7oMZ1GG79try7mpvhQVlbEnKA48ifRwC
	 HfZ6XyUAeThVT0ag1JhT0KMtOBKrFUvckJGPFfxLk49+jbMtpJIUxhPy+s6ze1mjjUBJ3
	 bRGDytMemf+qxRZcXbz9K1HpZNdey4BUq3/8AgYO9sUtW0gkD7OzqVOMmZVNdFKateyFc
	 z8A5CMtAX652dkRx15KKaV7JTvf2psjnccojbk+LAfvrXZ4EI8mvMcDnnhRctHHeNGXip
	 V/Zq3toyTEd4LfG2GCoiDF8yjcuGhqSDBGymKr3Y/qsFRcsSq/3U+vksHfXzFTWDFsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=hVE0Mhyl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BC606A330;
	Thu,  5 Nov 2026 17:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=hVE0Mhyl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBnx3LZs+qOUU4Qd1Q2l1f/4uXcBE9KyROFpeL1my+zGvPeJ6l6qSo7FbbYes4pNYeLlJGCCLXq+zsxVqMUwagONpNB11go2KKoWF2xcbw8QEaTzEbVzSj4HA01l9eT6Bgl4rvpAydjY695MYrsmRGp+S0rJeqjb8idCEDOl+qqySLk/TZ7nI0Wpe4w0j6CdVVPjmjS5WeyV8oKcdi8G+WKhQgSttGiS8qG76D2GOM9PUWYL4IRdz8TVv9BGwoktduypoUfojtKdXGHESkl0oULqiw+dUiC8J+DzmDLa0fAGc+cR177R24fNpv3jMnK7j5jZ9cWmZgmrnMj6BAPPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=KLxc3gbYMLqBnY/J+bwB7fdRSMd/RtC86jYKjDb/bSvrkFYb8Xn4/x5PeF3lbPEdLCMaf6n7QsNqsOne3UDOWiF9DLRPpM0YDGM+6qyvUbTLpyuYEngJunbdWxOQK9kV20MZ0rD5d7j2vuAJ2Foc0o3AFv3qnSYLqw7Pg3Jwp211i90W3HuqJXPVRe2can44kh6TbVnuvFcHsOra13fJ4BUH0KK9sivdHllJlwe6J6UqD9/zvUurMG/EaqVVT5+daa4RT/JXJ1WE9CFi1okC5SLMdawss2c1kg5gsrHsJFY0wR86hu+x3XaJzzodYqhrpr4zqdjFFlvINBlO8Hq8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=hVE0MhylKq4EA4Pg/pPXgYF5WBZpwyF4QSCXCQB8OuSFLNQZJu/ZqsiovYtploxiJsAziIbqrc99GskC3vFTAw50ydplO55H5jJM+8t5xpt9Y0hszc5SFGsWO/H8xGhp2iStulf109GYb6xcGDcqt7Uv80pq1hbVJPd9exjzW0U14TKKU/bBGtZU7l636vHuc43wl3ax1CzgdZnIsRbdJaTFdAQGIOP7CUvRDDRiFC5+H27gHjN7lltt9iFS0xUvjbYfUkxiwsHZ8gqJB7NrR/9QgfpxJJQJLB8G830iv5GfDcELSoTvtIgjZNFwj69J86rCxNO5ZUiuyf3z5R7VgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by CH2PR03MB5205.namprd03.prod.outlook.com (2603:10b6:610:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 5 Nov
 2026 17:17:17 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:17:17 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Will Deacon <will@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v9 1/3] firmware: stratix10-svc: increase args array
Date: Thu,  5 Nov 2026 09:17:10 -0800
Message-ID: <6452080968943b212fa2398a14c16377d3a14b04.1793895849.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793895849.git.hang.suan.wang@altera.com>
References: <cover.1793895849.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
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
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|CH2PR03MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5025a9-18db-4da0-195d-08df3b60a46c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261026121527099003|261102123227099003|11063799006|921020|261021123027099003|10067099003|261021121427099003|3023799007|261009223027099003|18002099003|22082099003|56012099006|55112099003;
X-Microsoft-Antispam-Message-Info:
	c9Sn6Zpo/Lvq1d7ek2lfBDrXLhMfcAhSHLtYRxgMuTx7yK8qzYrkD3QbVi3XHCR55GIH0b0QB17jx/N9etlpCnPjRbL+ne6CezmCl4FwcLaUFl/Kr0ItBmlkLO8BU6rLpecbNKZwPsjZj+O5M+gnAkjOinjnlPlUZjN2l1FZ2kzGYkepJw16hYO/lK3cAX4KsvneSt8BIJ6EtG6erkmn7ZtxMVBbPGJFEJNTKVc5fv+XUBwBo83pBea2BIur96grr/zv9sA7Z/QDFhMRKBpVT9KkTQzNPVeYUlC+TCeepFJizzAObHpfOvnoP1XeA4l6AlOviIvzIV5pmZ/2Gf4WAqN9mqbCnj0oEkYBjNnQcNM0ROS1S2uqn36ikF6K2FJCcqUnXF8S35tbDzNYwJ/0GvWb5RPdJGa/Ibk2NsboHyIMmgp4g6XrZznhQb6vawXD2K++ymcxsc1cRqz3l9LYkPamb5cFZgM39LE0XCVGY6h6JdIBmfaDtdxWdmLHYcu3UYmg43MiYcF5oSOPwXw0wrYBidsPCjGn90vPdI0RSkpGa3dKobf8xSajSFcPQ9fEYiwanxDIGqYpV2DKzShFon1Y7J7MVtOrV5ngRbcx8v2ZOZ9Htmu7zt2oWbxKSJdgrbo+qTJclGD6cyrDrywcjqtGe+bUCMZY9MQgbvjShhWl6Y+/fmfdr5hhLPdiam2WmlcIpwTE+y2pY2POMYGAig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261026121527099003)(261102123227099003)(11063799006)(921020)(261021123027099003)(10067099003)(261021121427099003)(3023799007)(261009223027099003)(18002099003)(22082099003)(56012099006)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xgvLa7YxAmLSQwZ0uOj3mU2sVC4XlpzXsNAXFUHxxNyOeDQZHQaleIACFS9u?=
 =?us-ascii?Q?X79a659G6XThpAhc2mHxKkJVBxBYdb9NBBWuImFpTWvH50aqldoUNOvuRTeq?=
 =?us-ascii?Q?UYgRop958kwbo5Ce0/L7M8wzWEzH1ehvcm3BEXvBFMhUHC77fGcoftMK6fNT?=
 =?us-ascii?Q?/Af9W/Sl6ymfw281oaqHMru0Zfih4RKbIUJeB4ohHjGLyiOuU1RhvqnlnJKo?=
 =?us-ascii?Q?HMzxvTgsVry8k/M+0vSKi8zFBsJm5YMlSPxPOvWCmlCbILy5z7kZ9AxxMn4/?=
 =?us-ascii?Q?zTESxLghuNyIjZjF8dKT/M/qFHEeHwjQbfscyX3m6Chw4zRjPOkaBeUvJnGp?=
 =?us-ascii?Q?cuMJwC+1qBue7HPsEny36YkMWdIjmdcy4ojjhdIxu6zZnrx9hV8ZaxPCZrId?=
 =?us-ascii?Q?1YicTX3AXbk4wNdzL02D3DfxqxF+b/rWcMP1z0tn6iUwYZHFeAz9kCSeAskM?=
 =?us-ascii?Q?LMQVAjkgdlBxswRhj65KQGKxPz01amW8TBNNHysP502CW/QxtXddTCxxN5w/?=
 =?us-ascii?Q?Rt4RGDK6jc6/tFzJg05AGRc3bQOaEhC4khuE3sjWlWczvwQy0fKm9UUFkpwR?=
 =?us-ascii?Q?ijaI5+NwfRqDX0XWJMSqVmU2SElhmBfFcKcHi4EvjcbposEtuB894bJ07/wG?=
 =?us-ascii?Q?gfx2m3DS1mdw2cM++askeQ3nM1+6yQVQVoOQNM8LRvwZl/+dk3M2xrEhpOU8?=
 =?us-ascii?Q?yltVFlcjuMfFFIIgPUYvv1JXBt+PU04lqAN2CrPJF3APZyN5GGC+D89jnCvp?=
 =?us-ascii?Q?e4hen/Bd9eygy90Ei4kP10ty1QaUfivPh/Dgh+aY2k1844Xz1OMd+U2gR3Re?=
 =?us-ascii?Q?mSm4qb6wjfKv0T/8IMqaDxJqU7LJkU6+TTb4Tu94K7lkpOHutyh7ZtbDzv34?=
 =?us-ascii?Q?s1RPoiqrdvjhMrb+hdSsWeqcSDT6/Pc46Q8lEK2ok5DDf5aw2ZW71gOsdTmd?=
 =?us-ascii?Q?ExuptKasEkLX97fKhx9wrDKZcgilXLqkN+VvMxlwVh5c+BMZLQHXJa6HNbAn?=
 =?us-ascii?Q?C3r9YzDxowjz/exkBohaE+//9iSeY9zpqk1PTKtmBgIlQ5b4MowsWLg4qIeR?=
 =?us-ascii?Q?KYpvGzbObt7qr6mE/2A6A7GXuDEzzMLhfbs3myzPWMKqjDr7pWNrvlZYQEgz?=
 =?us-ascii?Q?T2DBW4aanAVHoiL4PGdBpnSlu3tjFrpRBF3cbkpdjvbPPwwX5CiFU8FWWQjS?=
 =?us-ascii?Q?H5GF3CvLTsARv/BvMzSOU0pmrYYmpp7IDyflxlJe4PqAv5Z5zSFJyXQGYOiw?=
 =?us-ascii?Q?eTD/PhFO6477/ltLrpnbSL8nebQs8BshbpuN2i7YxIfxhbvAD2gDVbZCbuO9?=
 =?us-ascii?Q?1SGdqInLE3Nun7oOrzd7+LEIiazjCuClCPNS0AwQ7afOAhs3E9OsGmPR8Hbe?=
 =?us-ascii?Q?OUB8k81AMexdvV67JVwY3E3CiJN3oiOiyZY00iJi+9fesU9FWGbSrNlE8IXb?=
 =?us-ascii?Q?SMkRWXT9Q7ZjVR7tcNmH+HLXNakIQ+4FQCF2C3mM0JzQaHCaRUksGl/iKfNz?=
 =?us-ascii?Q?+1YHLFShfEDtitJublYAIk1QxB86Iyp/s2UFJo0+y19/RNVZy27KzgND5czp?=
 =?us-ascii?Q?rr5JRmCOXfIEO0SgLkfBteQF4/VvU/5mDL5hc4Vdqgs00EGXk1wm/pZKYnSn?=
 =?us-ascii?Q?ph72hZo8MIITH7KxB7WqIBWQBKkMGlzAkZ1j008CcMH7ZZSTQ+VLc/jNsHrA?=
 =?us-ascii?Q?xdWFrcVy86RTCYoXU4CeQ2TtG2iH0bKJWym68/RWKqzjI13VE7veyGf45+eE?=
 =?us-ascii?Q?OcBpsr8eag=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5025a9-18db-4da0-195d-08df3b60a46c
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:17:17.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITIP+2uYvX7QErMVxNkJIf7eRIax2PF53+ehLe2Jk3Zk9GuOVq0Er3uxkd0NBIZ5McIWgaJg7ku6tUGctRdq2SWtX6xHzqNkPcAX+WGLc0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5205

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
index f7928ef6b6db..8f07b945392a 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -219,7 +219,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -2088,7 +2088,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
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

