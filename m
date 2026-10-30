Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356466;
	b=BHsG3qOqALVEYTdfMxsmF2eygKIYmyBnsI+q8Rq/FDqwhrIYdK2Rqq5wGQuypQayfF+g
	 JZMslw6d2Fvpbl+uePtbCWMeJlc5/zYOfcRbcdzn4mZebv7k8G4+ANOajkftGgReoIlje
	 jDIqYG5Spxf0UNzlr+DkJPM82IPIXdJd3UAX2NHRsVWCP5rh3ELQTBDiBYplzT5GUWVmg
	 c3HArrd8r7UTQ/57rhTolwA29+jjLp8TgIJ5ti1KM6bVJuhj/e7V7NMe90ixtuA3W7k0x
	 ErU+RPAf1mgKNpWK/RbOADZYRYLXfp8cUsg+4NumzrVWYYwXp0bDPJ/9aTEVAlxXk3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356466;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
	b=5eozR8L4dYUOixYwlcuwpm8+C2edjG8TDYZuYmndXhQJ8qeHsJVHcd0ZzJeKV2714n6U
	 4i1dNq/8RkAn9QlDl6wqlHmLq3kb5umi768+UpDWARIfef66CLvSqoVJ/L66tAwDo1mPk
	 CQVqc1va5yXDmYTrzmwRdbfADAnqkOosoqYCL95qINwJypktASJXmgZApeGtVmETky3oZ
	 UDz/0qYQOasTUOsYsE2B5IE0BcyoHyxR8huqlG5K/zxJ2qwmdxzHAcU8i0U//MMJL/Smr
	 c4PdYCMswL711vIEVijA1pS16vE6v0DL++Tek5Fq+IZ8gr5W3ZaQFRTviI1Zw566eeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=UZC9wdgo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.98
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021098.outbound.protection.outlook.com [40.107.51.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8A60A260A;
	Fri, 30 Oct 2026 10:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D8A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=UZC9wdgo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8x7D4lEW3aCCPe2EWdeEsnFc0sDKLsUitWpKrunydDoxjERKnVlpl6MvPxdu6ouwgiKbonijZEPVn09AkfSLrKcQMqBfbofyzM14j5NXMpNqhr7STkckRnQ4pUgzTr/4hCci56nRj0shwMRnI9D0Z3s2qbg+UrgBxrsxNGUL/S85OSnB7+ndhurHcwkiMCl5G6FDq6UQ/9eTHxlqeanl2S9fJ7/U8zxgb4tvLKN943UNGAegTLxWPcmNLVhTx5UiY2/APRDETGyyerz+7SelV6p6exUewqYNzYoB010puQtxlsWZoBcBuJ/OzauQaFGy9dXlIvpUnmT5M0ioFmcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
 b=jS8WkkSvtt11ZVlDUSOl/oY/pDjfk5xVF3zjOEYPkqFNntcE2eoo5Mt9E+T5b6Ap8OCB/koXN000D2vruwTqHRQ9OcRgAypFwIboNb2Xe6g5hJxAft1Chcni+6jKcipoCpk7Ib8LV/6qJs9xXQ1nCkkMdljjDQI2oeXTkuYm77zBk7Isw5QL+6GhP7PgVSyaMiOmgpaDi9PvAZ5Z6RDPQ07Zl6lShLyK1xl9aN+m5uhTASRNaLACbQMh5KwPciGu1SxC6zzcVVld9V/2LEgDAOAvGaq1vLY4EUlanSzGwHYmsdgA6IV/38HN+zqb25+RSjgxfpifsfrTWN62W0NyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
 b=UZC9wdgoxXDL4lbFDBaUrR9NK6kVqYzidGOS/0sbTV0b8SUwOaaxOFtLx5jXKVDBtDe0w/WWlBx2jk2cvAu8h/gdIfab+3uJ1O4hOQT4fsfcyxTu/aUd8UsAc84QBBd5i8Kh0IeLDldZbESrEiyITQ+eYbA/AN6sfnEizrWKSaHZKQpjc0/1IDiJP18C1+KqvI++Fp0ztXZRQJ7Ino4RdkRc33o37WjkVlthgwZ4n7ELrsw+L7Tt1oAUNydLdrQlin1K2n66/PIzOHBIhdcFTV9H7f8KhE4ELKXX4JBmhcrshgUWROmNEmPg72CGQ8/GBXche+VRVlCwF0THe7pI2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1404.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:34:19 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:19 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/15] media: i2c: os05b10: Enable runtime PM autosuspend
Date: Fri, 30 Oct 2026 16:03:36 +0530
Message-Id: <20261030103348.1222201-5-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1404:EE_
X-MS-Office365-Filtering-Correlation-Id: b90ecb7f-69a5-47c8-386b-08df36715ae6
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 zNaTkuSBzeegb/q4zAmVdnO4Agm5u6ilYRwONGgFkCuoUKHidPj0oAB5Jmg0vvYAbRtn486p6NR5vsqYQNUiegdX7VhJKlt/ePqNhtlJU6eBd2CmfPdxemMOQmR5Jnhs5Wx1Q0/h0s2cx+G+KZNehtCtEOGVFl3NAin6gC9CrEKC1g90aPnMquQizlj5c0Jel44sTRsMNdrsg8wLo5dek0D/Fqy7xJnRAu5NOhtV2SfzF6D8d3EP7YPz3wIht6ISG+eK+EdhD/pVOZyQJTn+YU9PPEwcecji9w4QTpP8WBjc/ajgaU6t1QGi6237DC+D0Ds/89RTKTA4Z6YAjv80FdyQJiw0yrV5wm7pkZ4a4stz4+VkbB1+c0JFWs+lu4A1yt9hj1VTGUEi/xDx05WErE1tmU0rfziEVkhL1R1cLyUtGC8Om2+k7Bkc012duavIlc+zQWLQ3NE+EMxTXPogdjizkoQRnKMcqw8PV/yJJ43nUMXIgtipstOzKbNy/ocKEbbIwrNRfM16PVKhRnb+Vi1t+wLnrdfM0l3jYS5Jns5l8hZGzi/PiFt1/Zim1G3q2MWZPq/+CMZEB3XGc9T2SgH60petQ7zDn/hITTd74tGBZtmmB2CV+NXLzkwFipv6BqtARjsdf3kiITMu6nqkLO4PKvUyb7el6XPhozxSQ0s5RQ0A+iWvls7+XMixkv7/XsEgXxqVaBs4lDDo3nEedU7Qt6vO5LmW+8mQYak8RuY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?f7BwyY+4PdkNZ1A8sEoOjcm+5+0Gy5OnnpoOSHHIgJlgOz4ANJ/Q6sO8FffW?=
 =?us-ascii?Q?55zWnMpDVSrNmn9APUMzgflVTasc2rUw4k05kPNp+ZUpthcD3R3xNbXXvTdf?=
 =?us-ascii?Q?9WAdShVcqU0j4HLJON+AyNjSsNpULW1vemSVqRIdpLV2bKsfpjqyjdqMVGzm?=
 =?us-ascii?Q?Bc8Y0YtmQnd7gNoJ/jSyd9j+cevcPcJ5wTpc9Ee1/a4qAJD33iEJMpxfwWtj?=
 =?us-ascii?Q?5HHQj4xKT9gC3hLzmrr+2RODEjV+0BwY4BfpNq3NYAPFaiNTVIG/mbhiW4Fe?=
 =?us-ascii?Q?4THpzQNZyYsm1aMJYDmenNXydqbT3w7oNItnEzavNTerXtNAyQgRFBRgm8Wv?=
 =?us-ascii?Q?/BfGhoX2X23vmTe+e19xVfDn86EnoAfl+xGwbFoIn6Y7MDvXgIPbz6i83STu?=
 =?us-ascii?Q?kgz6zU9Hc+ky5k3gOV2X2XCRvdAKbIrqDIUh8bJPKTBy7ofqgE5qk4ILyvcH?=
 =?us-ascii?Q?bXDHWrwjX98wQXe3wXUe/xqwLqpzSVBokc1bUvI4A8dt92OMSTPM8Ktt6w1o?=
 =?us-ascii?Q?Je1Gna4p9PNig2oDMJF96JFyAJWcxbAwPCXzoNv4IaqgXLZ5E8B3XNhnTO9S?=
 =?us-ascii?Q?AWAIJGkDq7MyPUim5iTdPVob3FwgmjQJ4YyfQA5wV+u11tf8t87XnQqO+w+S?=
 =?us-ascii?Q?qORaxiaso1Jf51M9Qu7JUXCzNWdTMUF602UzXvQoDKwzi/tGVLvW68Uyt/8y?=
 =?us-ascii?Q?gYfaQ6DVOI7lJ8VA47orutkV7p1BfDsoRsZrzUBCluw0M4/jUOexIET5iwIA?=
 =?us-ascii?Q?OOdQXV7IObyZ5+3IZdAWSh2r0ZeKX0QAVq8ql49Ilp9gtjGZc1MEK5w9fPUp?=
 =?us-ascii?Q?ViLT72Kmj7wVgjfbthbBSUERYCz8ky8SDK6I7pcL5Q6p72orYdkSDaCAtW8p?=
 =?us-ascii?Q?nT9rQBYDzQPP/N6vQZDm61+FWnoE/WVxaEJ3ShJ9jT7J+2GljT1c9Uux2F0B?=
 =?us-ascii?Q?E1Igeqy78EabYE6Lo6/F2pJPCT1jY2CzDdo5I1Y2i/MkSMas78DfbYhnkMcq?=
 =?us-ascii?Q?icfwuMh1uG9EcSW8OBM3TITHK+S/5JL1/YqPsOJzUlsUszwp0rLOOytijlUU?=
 =?us-ascii?Q?9E4KKljeq8g/NMNEzdIgGao4XfNfDBHcXBZjyW6nuG8/iUWK4gheZQ5rGDOj?=
 =?us-ascii?Q?m8cNoPZpgm9Mz2lupfxllcIjdOgaX1vWot6nyckI0PdGL5x/KyuyKWP1rlvj?=
 =?us-ascii?Q?T4QApUF5J/SWE4UqFRRe14t71Z0OvXatO52tKq3x/fiFTl8OTGwSl9yXnCXl?=
 =?us-ascii?Q?ueZWpVnnL3ijwm5IXLMhmq9mj/4uRrRKn/BBFuQjaBBIWVW+dYyGWo4t/I4R?=
 =?us-ascii?Q?OmJtNaBssRHCUUKQlz7fZsEeKTQeA1bGBD9XNd1bQMMVD/t6X1bxnY8x6SVZ?=
 =?us-ascii?Q?s7CF1/9tOli+wYDC8dQneiCTHU3CFriosCqcOlct40dXRHDT7ExS7vIR4Z4L?=
 =?us-ascii?Q?tw7Ab4K88ROGkxwst5djnlLWCMeY4HnjN1r1g0HLLylflJk9cvtg4FViUEFe?=
 =?us-ascii?Q?3+bReXy3+FIhgBIBjJnCIOR1+P3boWHZd6AQRNNsZrMqowONJRjvpQM3pDiO?=
 =?us-ascii?Q?QfSVrz7VAAfj/Ub/47rbkpNNGrhje6aUJD09K2xctVfCgCiR8vRrgOY2z3Qm?=
 =?us-ascii?Q?nkM8u2yvNlSvOhaLnwSOKlApeknyVH/6zw2km52mybkfPNRUko2T4RRLF8mp?=
 =?us-ascii?Q?8EZSGrqNkZDZAqK87mgihfNOFIQ3k6gl2i4ub0xAjRsgqdLqB7ETI9UdZvV9?=
 =?us-ascii?Q?LglLSfnUMz3z4oxFWOADun4g+ouWRxU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b90ecb7f-69a5-47c8-386b-08df36715ae6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:19.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7yMeAc+dJELujckF7IpYaQ/sgp6au0aVmzxeiqAZlaUUDTjWwKLDP8786E9YwSdA8JMQultdZYU3pS6Embg+2W4sPNMhlinBrO07h3l9fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1404

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 70ad9124ad41..7f6cb4c7edc8 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -654,7 +654,7 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return ret;
 }
@@ -671,7 +671,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
 }
@@ -1029,6 +1029,8 @@ static int os05b10_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
+	pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);
+	pm_runtime_use_autosuspend(os05b10->dev);
 	pm_runtime_idle(os05b10->dev);
 
 	return 0;
@@ -1037,6 +1039,7 @@ static int os05b10_probe(struct i2c_client *client)
 	v4l2_subdev_cleanup(&os05b10->sd);
 	pm_runtime_disable(os05b10->dev);
 	pm_runtime_set_suspended(os05b10->dev);
+	pm_runtime_dont_use_autosuspend(os05b10->dev);
 
 error_media_entity:
 	media_entity_cleanup(&os05b10->sd.entity);
@@ -1064,6 +1067,7 @@ static void os05b10_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev)) {
 		os05b10_power_off(&client->dev);
 		pm_runtime_set_suspended(&client->dev);
+		pm_runtime_dont_use_autosuspend(&client->dev);
 	}
 }
 
-- 
2.34.1

