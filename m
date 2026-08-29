Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazolkn19013091.outbound.protection.outlook.com [52.103.20.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BB1A6828;
	Sat, 29 Aug 2026 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047846; cv=fail; b=hgUcYaKWV4FUvPvMbiKqrd83UjnkmN15RDBbO8k6mgq5sDeqTnRDw6GZwI22RjCn9nanxNyH6KnLgcc53D3Mfsa2zJIxuJRBU+XJOJEBeb8udz1acMuQUaC3u0ywyb8dV9nAZ6oa8r2UBUAMFvP6nJve/PGS5M1Zfg8MarSGxPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047846; c=relaxed/simple;
	bh=p0BUMy68ilSOileIZLeaE0KxOG/l9H/yDBfIDzlqoIM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gqx53U215j2Cg1xxqIlMVkx8/99+p0eMIhgYlooEJWxv6YWO3FYPa9FpPz+zYzDJCARXZUaOBJfnyO2kzsYJc5OKhKwK9340Mnl8z1VBRyN2k9HJZvGzjKPs0PNoz8GnesgTt2q+y0rvay56z2lUmpmf0sfSwx23yAfty9Yr8L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=n/VnDt/B; arc=fail smtp.client-ip=52.103.20.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="n/VnDt/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rD+votjsu0tAG6Vr99FJgnll2SslhfL+NyWWRwpmvGof80e/YoP+pNj3We1woRY/tmQpco7YB7mee10BrZ40DXtBUYB45zDnuH3Bjd30EnG4ZlYW+Zp03nLIGa5xQotxKOweaPrB3U2kKiNEHrSeeIbskXchVdjVJxMqETeifeLE++FlaNnn0VFyVEu6/33Kkj+L8yBcg7+P9dDdSFjELeq0xhNTnPY01I7rV4Sl243XWZN1kHhAO5vlO99ZT2iFCoAGh/d870dxp7KvMYsusBPETYWfGjzLToo/Z0Jlx/EH5tW9G1+Nir8OLubFE10j53pYLiMgX06QZuRFV1eKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJjEZ0rTsy9aR/2a/YbPKlwwHR1E8wA3xsHxqSIZ4AM=;
 b=Bqs4u2hUFMXXlRHF/IabgD5tgtpFsJ9SRFDcEZ9fCuYLSJ4GyOHGo9U4OoCy3GIhUnyIoRAcbiSovUj9YQTdB9McqKGnfiLsNsxpduy7U32aUJgfbGrV0wO97bgSAYiJRt1/0PDN5EfvOn2aXSJXWBtk0YXDpQXR2xpAkfAX7rxG58t8kl4hKQasIpCxmxUvFwwcyhUaCywhKdAvOhc5IQBrndcN4P1RAa5JgjSOsoG8w2KqK+ap6p986k8AOJd00wpFPmAQVm6uxVDeXNCs1HB6KOcLj2XemcqxWYvx8bfWF8TSQZiSD7gi6a02xSsQcsDSPo4vrjabX8sWm3tgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJjEZ0rTsy9aR/2a/YbPKlwwHR1E8wA3xsHxqSIZ4AM=;
 b=n/VnDt/B7Mekf5SjNpMeLhxV/NVX7+4sj3Y4E5lnqQVwfAZIew5VtM1M0jS6NV3qEGSgxWGfxRJ07ko0QgeyTBvA9RwFJtB66NU7Q9x0aXiNrHdZBBhhefXWlqgJ8jZyglMbpv7z1PHO2cNDmVCk94WF0U/Jtzo1sGZtXT4dIGHZZlQY3WUA9ATYVZiUq1wRSoZ0qsGjyhpSIaM3XSOfYusg8TS4pnWNQOneheOmHizsYAhpWocBifeipBxeQ6yKAPbdYi+d/p44NshM+SBxp2CaapzOdEOSjrRwAWcExjYfm6sVggL8IIvn5q2+7IcEif71BFQSNZuGmDt/ChoX6w==
Received: from DM6PR02MB6377.namprd02.prod.outlook.com (2603:10b6:5:1d0::21)
 by CH3PR02MB9423.namprd02.prod.outlook.com (2603:10b6:610:122::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 23:57:22 +0000
Received: from DM6PR02MB6377.namprd02.prod.outlook.com
 ([fe80::2e44:289a:989f:b69c]) by DM6PR02MB6377.namprd02.prod.outlook.com
 ([fe80::2e44:289a:989f:b69c%6]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 23:57:22 +0000
From: Amaan Lalani <zlzzm2014@outlook.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amaan Lalani <zlzzm2014@outlook.com>
Subject: [PATCH] thunderbolt: Reset downstream port after failed link restore
Date: Sat, 29 Aug 2026 16:57:05 -0700
Message-ID:
 <DM6PR02MB63772452BC9DE8C5C79BE421A0AB2@DM6PR02MB6377.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To DM6PR02MB6377.namprd02.prod.outlook.com
 (2603:10b6:5:1d0::21)
X-Microsoft-Original-Message-ID:
 <20260829235705.22062-1-zlzzm2014@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR02MB6377:EE_|CH3PR02MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d419e3-075f-49a1-679c-08df0629447f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|21061999006|8022599003|25010399006|5072599009|5062599005|19110799012|8060799015|23021999003|24021099003|15080799012|3412199025|26104999009|440099028|2607281247196008|3071699003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TWIwhoiqW34kPmpVncSSeE/5qigmoFsXfSBUIDwjud/0Hriuw8+Y4GDMt+cc?=
 =?us-ascii?Q?+6dneNuzzsMWFJiPZRpNaljyZjnRY/zIs2UEkLYL7tT8UVhrH8wT+Mx4QorR?=
 =?us-ascii?Q?jXM4oBAeftfVLNRNnRORMjovTqusnoxg7HpW/K+VJoKy5yPstXtnSlEgdeaY?=
 =?us-ascii?Q?ZOHAl8aRwsX6WnjejopcRjqLmX/ELPODIViTDJGJKE/WMDqxjuZI0ZszMuo8?=
 =?us-ascii?Q?dAplPXMdt+P413ka4D9/Cx1c+bwVhl1ifOucPfIFTrUM2Rn4mToYrRaR3ucS?=
 =?us-ascii?Q?rczWRBopAdJ9Ajk0byOPzjiIlxvxcMuonVOFj9e6A8/lT79rB60KiH9zFfO+?=
 =?us-ascii?Q?G1gdwr0Adg5tfjqYX9LheObj6N7VBUqLXcEP8d+FvcBNXosyBiys8BktSekg?=
 =?us-ascii?Q?ygzUJBVD1FhpL318enyVI+eA92zz22hy4tm1uMH+/evb5y6GuwLeOhc4pnOL?=
 =?us-ascii?Q?YJwitH2mjp2Ckil2eiklpMzULkfzOJdRhDue/H1brGsowtKw09ue0uu4kFQj?=
 =?us-ascii?Q?tydy20GwzaUpqlvAL8Tva2GMBot9yvK6RSrW0QfCTL7wGjmd9IgKcbOleU4Z?=
 =?us-ascii?Q?u1jDaNnONM1ATDO9OKGoy2Gh2yOHLiELsZQC5v/bOHcg9p9LMI28COonBTin?=
 =?us-ascii?Q?KDw8ehiWhUk5amIVCWsnS7BTU6HWbdZgX0QpLmPEuo54o2OtNzVg3aWRWtFf?=
 =?us-ascii?Q?smCmBNzhgDP0W3M3qY9xgXbsBowVPybtm9gwkh5K16MroYuy+Gx7CpAsrSuL?=
 =?us-ascii?Q?WrslprYTZ7nts5z5u26Nd6PLAZYSjfY3zPitsJ+vxW2Ahl9OdR/nfUAM+Bvh?=
 =?us-ascii?Q?7tnX91QnCCEq2yqvOzsLXxg4ptI+7maII+oXZ1gXyVvYIZAApMb6sI7AQmgr?=
 =?us-ascii?Q?9sjYo/HF9Q1NkPt4vUS9tH36RZKdzZ3xKMCeqr9LJjDEK4kawTPDhfeom0a6?=
 =?us-ascii?Q?uOc2w5rdXBeKk4n7J8lzPPctC7Z5qaPuRZHEfoOovQ/qqDBWGhl9c/vWK3Mm?=
 =?us-ascii?Q?pXLCBkk5ASgot4qNNO3ZEOnKjg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bVXnJawxM/X4lFbl+2RfjEl8MVB1JHJXuQ+EFalrrCf03KttEQ2KtZGKfl59?=
 =?us-ascii?Q?ErwtRCavXR5KYf6Q1cOOO4rXE83L6KITElcmaxsGVAlEPlByOgGbv50TuJ4W?=
 =?us-ascii?Q?v2y2+v1F5RhAZFbC5FRPKNYWBUQM5GpBGRkbbj1MPyk//VyHmragh6LHE3pR?=
 =?us-ascii?Q?HOvyAlryaj+mKLMy+OhXQ0UKOGyIHqrCLgIu5785as7TgINSvzBOa6fqZLJC?=
 =?us-ascii?Q?KJ2VGytNOskqpMOgwW/4GVhlvGAAPjZ5HCiLQWlQle9+ycns6nvfJpMOTmG2?=
 =?us-ascii?Q?BgtV67amCHTehbaapmyLnH8cHFAAk2cUwvaWEM8iYqRVBHOxHKqMokeGUnKp?=
 =?us-ascii?Q?HkZp75dIFWWD8/Mn3a+54ChJK7nqzYNqa82O9IVkofrpNqWfbXX1WwLnHJz7?=
 =?us-ascii?Q?7Yqm6SojStAYCaF03Y8KPLToOJtekM2AjIGha4WQzuCGrtfE/sxy0iy5y568?=
 =?us-ascii?Q?7w8BgrAWXEs8iRlz0QER6v9MRuSAxt7zLD8MS8owhqXAkuWb4XMa6LxT0gEM?=
 =?us-ascii?Q?g81lgu7nvVV5DK6KuMLcviPXXn0LVI4vlRyFGtUXP7K6FLVYK7/YPuYI+Nrl?=
 =?us-ascii?Q?zODRr2BKTfsXw+2s6WWcjg61fetpoX+mNZdeBtjcHr5Fh4F3CQyJcgcE8Z/m?=
 =?us-ascii?Q?RRqh0kpqUB17dK+AShNKZHiG1evYqu4++EOcBfmj5AVhEco7fOvW5hKM/+GT?=
 =?us-ascii?Q?G4/s4bQKpPLEy49+akPTluenPtM20UmPNWMZbcwcNPXHk2W6zHmJUCnFzWYX?=
 =?us-ascii?Q?cI4fPeem6a9v4NmYtE9IuIFm5x/N30/jirauQAevybxrcDuR2RP/dN9Gg51c?=
 =?us-ascii?Q?XLTfDTG7agvJYxMpKZGTwDJ3nRag93zqS5bqvyYN3NcQ4q0Az4xik+4a+Lyw?=
 =?us-ascii?Q?q1g4pr6c5z+LlEbtsIwZsJ4it4fg9xRrZIjImyivcUaxSdXz3mqIIiyHWUp6?=
 =?us-ascii?Q?H2YnwvmKf6TwxHq2CzgWMSL2UBKG7Z3Z4NdkD/SAFnvbTSVDEcUQPvQ2mDTt?=
 =?us-ascii?Q?CFAG81DLrBQJp0AA9zPx2rshUme9mbTvpRlzaP/QkjF1bTgUwhqlT9vYMmw3?=
 =?us-ascii?Q?P5ymIz+hURyrQJPbZfhuPAmcRmeAf0xuPtF7jIV2IvyVxsmu1r+Flowujvb4?=
 =?us-ascii?Q?sDg72lnPxypbSO6UmL9wGKrewXyVNS60iGHuS8dmAH4lyY+h4IFRIfiKt4M3?=
 =?us-ascii?Q?rZhATtwDnZr+sy8B9gGUzlO/WUacILxg9tn7Blh3znkKs8xrpNnIkBTC9Q3F?=
 =?us-ascii?Q?cOEZEZ9YxDDzMFYLhykXN54HEaFREmCSp7ELc19JaLJ5oZpbKrcyDThXXQOk?=
 =?us-ascii?Q?eKt6+lRY6lret3p4R5C7rmLkauPZPsXN6+xxVbT7QLeZniOEP4ohUUmAJuxh?=
 =?us-ascii?Q?FsQggW+LkaCoArgBO7E3ZL76RvWB?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d419e3-075f-49a1-679c-08df0629447f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6377.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 23:57:22.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9423

A directly connected Thunderbolt device may fail to restore
its link after a runtime suspend, therefore leaving the connection
unusable.

Reset the downstream port when the link restoration fails. This drives
SBTX low, causing the partner to observe a USB4 disconnect and allowing
the Type-C/PD firmware to renegotiate the connection. For dual-mode
devices, this may allow the connection to fall back to native USB3.x.

Tested on a Microsoft Surface Pro 11 with a UGreen Thunderbolt
4 external NVMe enclosure, where the device successfully reconnects as a
USB3 device when the Thunderbolt 4 link fails to recover.

Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
---
 drivers/thunderbolt/switch.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 404c0693df50..7b88aa75a07a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3600,7 +3600,27 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
 
 		if (tb_wait_for_port(port, true) <= 0) {
 			tb_port_warn(port,
-				     "lost during suspend, disconnecting\n");
+				    "lost during suspend, disconnecting\n");
+			/*
+			 * If a directly connected USB4/thunderbolt device did not restore
+			 * its link after a runtime suspend, assert a downstream
+			 * port reset. This drives SBTX low and makes the partner
+			 * observe a real USB4 disconnect. A dual-mode device and
+			 * the Type-C/PD firmware will then try to renegotiate
+			 * the connection in a native USB 3.x mode.
+			 *
+			 * Restrict this to the host router's downstream port.
+			 * Resetting an intermediate router would not cause the Type-C
+			 * to be renegotiated.
+			 */
+			if (runtime && !tb_route(sw) &&
+			    tb_switch_is_usb4(sw) && port->cap_usb4) {
+				err = tb_port_reset(port);
+				if (err)
+					tb_port_warn(port,
+						     "failed to reset port for USB3 fallback: %d\n",
+						     err);
+			}
 			if (tb_port_has_remote(port))
 				tb_sw_set_unplugged(port->remote->sw);
 			else if (port->xdomain)
-- 
2.55.0

