Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010023.outbound.protection.outlook.com [52.103.32.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85DC4B515B;
	Tue, 15 Sep 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487987; cv=fail; b=d+VYDcX3GWcA1eloUoDB6bkppaBBLrxxKajpVNwusa/7wW+j1HLsZ49bngE4NaDD2yVvuMJDf8WXXdPpLs4cuVLNpNRsbwNX8dNzf4R/l6fIWX+zM6VEjchMGtbSc/gph6Meoe57nCnDWKB90lmqTKebRejJYAQ2YR9LStflXoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487987; c=relaxed/simple;
	bh=B2aZVfYlk27dcN+siNro/GWzlLi5NPxy8FHHsxqE8Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSUdeoW+9SYysZjQIjMWOWorY06+V0N2FwSBZ/xG590P/jh/KgMwe1HaS9ZVMn4A/8cfXWSuMBBOIsdA97QrT3TcpoOUoOvBL8Grh+K+vOhJ7KhHObPvqImsqC6BqMk/uvyWH1Id7DzsqxjK1rln6ChLABkZW6zg2Gedxv9F+tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=u2KzjAsI; arc=fail smtp.client-ip=52.103.32.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="u2KzjAsI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK78dEtwJtilsFbl7p0vGOilP4a7bVR/ptE7oKrruYQxIsADn1v3RyVybMHopi3ZxjRU7+FkmdJUM+2Hc+w4HJx79UbFj63VhvaHHJSkJDZZfGBdwy0lnACXj2g/tLEQ0ZiNWjXoYx9XW+QMUTF796jzm1udFigjtBLTCzR+GRgmqajqSR4wumOFP1RU2i+ILu5vQsWUppJllvCW+8Mo/ppCeoy7+lBDSRB2SsMEGfNLdgM8a3mPOVdL8RWOHuJvBtdfN3hmfHxl9YOpUfesiSjiD8ZBP4TUlel8nOJzxHwO+3i95+FYovgAG0OkZVhqQgrXhXKEWN2QxHztA1v+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnanwlWxQrM4eZMWdTsrb/Ngf/F3nVDARrP/h4DoPp0=;
 b=L0CdAEH83aA6HgDqPVU2+6sZXiDgjjwlpkZ9oqTNlMvg2MEglRjIlQ5A+J+zIMWufdNjUyjP9mHk7vkUfuGUXsOVsYMUbfOUYNVMlNb/w8jbdTMUNcXk5sreYzn2bAbh5+X0CaDpx428AzSKEjqvnifNcBbOUaDbquBb/4Dr3Gkr8LLMuUP5FHl6kIs9aLkwE2Ayue6GNfk95m9H1do6WSPxD7jRBOFy6i6XOuAnj+nFmO4z50WqhnlBEr700+wmTil1taoAwf69KHmnfNpQ5hg58DZoBRVSLofCwzC8m67nfhEzASxJq10+QFy2x+v0xmDozWlM7PLedDevu6J/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnanwlWxQrM4eZMWdTsrb/Ngf/F3nVDARrP/h4DoPp0=;
 b=u2KzjAsIlDCIPCfTCFe+LvYrsZ9MQrxuGLMLfmdxVn6rs/xm2gZvDPFUSGceqVfmsFaVtDf6TJjEtBztF+C0iQQ4y7JUlmO8fwNaaWOqV+ThxL0sFPvwQmee0kohy79FYYEG2tFuq5oGk1YtlyUfZTI0zja3iVhKH6RKUSuQoTf5UDwTnYMICPYNrCyb+fn9NqOtub+TTTO9W+Y7za1Lpdp7pYpgRz/OaAe/wulas3/Se9OCQtHmOc/ZQp1M7Xo7Lt4z2gNyEZe6kykrNUTNruoOBNnPePm3QP2SrW7F9Bqg+03pxBNDHWcdYYQdSq+1cxLrqaZgjMN4TcQ9oifkfA==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:26 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:26 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 8/8] ALSA: Documentation: describe the card name fields
Date: Tue, 15 Sep 2026 17:59:08 +0200
Message-ID:
 <AMBP191MB288676A8CEDE865F49FB09A2CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-9-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: adbb2444-e6a1-4732-eaef-08df13425077
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|12091999003|26121999007|2607281247196008|56899033|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVpqTlRPOFhLbkQzOE1wSVRHTTdaRTJocCsxZUUzRGo3a0xVTmY5aE1pb1RK?=
 =?utf-8?B?cHFYSkNMSXd3YVZHeEo1YlIvdWpZNWVTd2xQcmNvWUpRUTE2a0dFNUh3TWhC?=
 =?utf-8?B?NHpsSlNWQ0VrenFyNmpIbHZJbWx4MmRuY3dxOE1pdW81aHlLbStZZEdkWGZO?=
 =?utf-8?B?aEIwc1FIaFA0aS9DSU5ySjJQOWsycUNITTQ4d2ZpVmJ2KzZVeENvUkdabnNi?=
 =?utf-8?B?SFRtSHI0d2k2aERDcWJjdFdaNnR4cG5CZzcyRWJ1SGJMWVlnYUlhdEg0eEpO?=
 =?utf-8?B?TmhXYkJyd05SNXBqYkNaR3RlWUZFR2d3M1h6elRaYkVaM2tmc3lCelF2VEtN?=
 =?utf-8?B?OWkyTTlOR2UzdndWSFJWczFOZmkvdHVJUUczT3A4UEVuTzlRVE1ZaGRURTQw?=
 =?utf-8?B?ZEZURC8xYXF3OHJkNitZd2lXOXZvOGM4Rko2V0tOYnc0dVFYY2JTR283bjcz?=
 =?utf-8?B?a3ZZMWlsZ0dBODljMnBBT0lOTjJZalAzRU15ODlQV1lhUFc3NG5IZmJJcWhH?=
 =?utf-8?B?SjVTeFlNYlpZL1FVbExEYlBwTHNFMUs2UWxuSnJrNDd3RmtzTFh6Mm1oTnlS?=
 =?utf-8?B?Mk9mVzJVaGdmVkJRMDFFYVV3YmFOcGwycmZFQ3ExczN3THkzQVc2dVdSTFB6?=
 =?utf-8?B?VXpLc2tSOE5VTUErZVlSQTFvVlBtRDhUTG1MajJmSysvcEpRcXBjcFRsMEYx?=
 =?utf-8?B?VktOcEVyK0hSbjVRRzNDL2hXVHI4cjlRQmxxUFJnQjdCQUJ5Tk4ySEsyQnJM?=
 =?utf-8?B?K3VQSmxhS0JuU2Ztbk5KRHpPTWtSeWhoQ1Q5WGRWTEpOeUpZdThpUXVvSGdJ?=
 =?utf-8?B?WWlndm5NQm82WVFBb09RQWlhM3NwYldmWXBKL0VNRDd6bnlCZi9KaTR3cXJy?=
 =?utf-8?B?VFFBUlF2L3NDOU1OWDR0cVErVm9yMGNUSFBsY01zdklEd2ZiRzljd25pZzBv?=
 =?utf-8?B?NDZoZEw4clV1RzRUdEUrb00yK3Q2L09LbVE0WlE0ZWd4eG1lNGkxaGt6WEl2?=
 =?utf-8?B?MGRtMXg0VTkzM0lmOWQ4eXA0a0dCOUpLQ1ZRN2pQUStVWmM0SzFtb3MxaEhl?=
 =?utf-8?B?Q2lFQlBFZW9oaHZGMExNOUhFaEtrRjJ5K01yWFp3VGdMYnpSd0ZPRSs4ZHk5?=
 =?utf-8?B?K1pJVGFXT3ZIMzlUemxMVEk5Ykw2R2xiRE9LUEdscFRVeWppTWpOc0sybk5W?=
 =?utf-8?B?YmJZYVRUaU0ySG5NVkNZQUJ4OVQ1UHArREo2OXRJa0MwMEZxQWJJSHQxNHRT?=
 =?utf-8?B?Z0JtYThrbm9WY0JvZDZLQjZWQ01aR2tpZnd0aFJpa0VRVXp5YXJTMDN2dUhZ?=
 =?utf-8?B?VVRyK2lXN1Q3KytPclZSbVZEMWtJd215a0xGbWRTNisxOFZlQ1FpUkhMTHBJ?=
 =?utf-8?B?blZiand0TVJ6TzJPY0puWjJGTEJpRUxITXRBRzRpREU2dU4xMlRiK2dEQ2lL?=
 =?utf-8?B?QmRjdEJaYXpVTmxoQ0ExeXU4NXljSFZraDlKTlAwWmhXclk3aU1TTWg3UDJr?=
 =?utf-8?B?L3l0SHNTbUxLUk4wTm1qbyt4d1F1SDU0QTNMQWlOWTRqcUsrK0pkWDMwb0dt?=
 =?utf-8?B?bGo1MThQT1hFSFUwQ2k1a25xRGpmb1FHejRhVHQzaEN2RFk3TE9laXJJcWdM?=
 =?utf-8?B?NkpKZ2txalV2a281RmUzd0FmMjZRbGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBSUkpuVHdHRDVoRHdUdnV2bVBTWFBpZEtZb1ZNeHRNTTZ3LytQRHlKMzM5?=
 =?utf-8?B?NXM0cldkK2JTQnJtSzFZZXVrTVl1NkR4N3QyMElBaUVFZWRxYWx0ZEVZM1M5?=
 =?utf-8?B?eVZBVjJGOE1hMHJ6UklSOEg1VW5PWWVoTFFMYjNRK01pQzZ2K2t3ZkE2UGFG?=
 =?utf-8?B?Mk5xcjh1NndBbVhKYXNvanAvNFRQZWRPWHV6V3ZDUFFjWGVvOExLNmorSU1q?=
 =?utf-8?B?Q0hGNURveFVLT3llTGMvTEVpME5aNHlzclFQaGVacnJTbW9BcFpubEpzbjRz?=
 =?utf-8?B?dHhXemp2NWpyU1RKTVI1RFZnWG5KOGNTTGdmbFJTTmRWcGQxbkRHM21ZOGE0?=
 =?utf-8?B?cWo2b1Bxbm8vRXplTEN5ZnhlQkw5Z0hvTmU0VlRCUmtvUGZCSkNUa0JYZGlo?=
 =?utf-8?B?eVBxUENndXVwK1hrQ2t4N0t5aXFtNnR4SlkyN29DOE9XL1gyd0M3blRuZ1Bi?=
 =?utf-8?B?azd4QURDTXlXL1JMN3RhU2VPZmtWMk5VWDJURTRIYlFCc2pjYmMwdVJUK21E?=
 =?utf-8?B?Wm5vQkQxeE9ndm9laUM0M3VldFlRMElJVzl3aUxsdGRhTEQzWGV4NUdGU2FJ?=
 =?utf-8?B?K2EySkJOZUdIdjlOS1BuVDc2ZkN4bkF5ZkNmUHZCZ2xkaTJCZkJHMitjUUll?=
 =?utf-8?B?TldPdVZnS09NeG1SRHJid3VIa29CVTNsYjVPYkFhL3hJNWhtQ0JRVm0vcnJ6?=
 =?utf-8?B?RWJKS2xOTVVmL29NREd4THBsUGNsVnpnVFAxdlljZHlLNWUvc0dCU1AyWmIv?=
 =?utf-8?B?VGV5WkVOdEFYZDdqWVlxenlDNVJaYjdDaEF3UnExWmRxK25zTmlpU0FVb0pI?=
 =?utf-8?B?QjcxUWdpSTFaV280YWhUMkhVRUU1a1VENU5LanJqZDZ6Tm5aSWs0Zi9ZMzlj?=
 =?utf-8?B?RWJBcHpja1dVQ0xWRDhyZjluc042azhpWEc3QmhDN2dyNklvYnFIUm1BbC9S?=
 =?utf-8?B?cEZpZGllR0lQNndDd0hvRUdVYTNCdUlzbHVqeHlyZHcwOU9ZYzNsaWdrRm5H?=
 =?utf-8?B?OXpEdnhDZGxXYWtTcEw2cC9vRjQ1U0t4SEhhUVlwaENIZndvclBJdHpsdmNU?=
 =?utf-8?B?Ym9UWkVxeXNZcWdBcTBrODFqblJPY1hpaExEdmZlS3ZLOWF1R0lpZkFVWGQ0?=
 =?utf-8?B?VUFPdEJDUEpmVHVLQnQraDh1Z2pUR0tGdlA5c0E1R2tjcnpVdjRmaTk1L0R5?=
 =?utf-8?B?bUpDQi9hR1dZWHpqN3BFVDdnOC9JQmNESW5uZ3J5UGVhQkFWU1RoMlFzcytV?=
 =?utf-8?B?Vk82ODM4WG4wU1dqOFBWR0pjTTNiSEJyd2ZUaVF3N3NOcWFYZXdobHhGUjYx?=
 =?utf-8?B?eWx0Y2VQck9wWFNBS0pzdENrcG83MUJDenJReG9kbkNJQmJPQUF2VnlsK1Fy?=
 =?utf-8?B?ZHNRTW1PcEV2L01CWU5ZQWY5MjdpSkJoaXpSOHZSMDVSQ3RMNjkveDVTR1hT?=
 =?utf-8?B?NmNHckQxZ2RtcGxQcEdRVXZ1SXVFZVFkVUk1akFoemdDMkRQYjFFcGFZclhM?=
 =?utf-8?B?TDYwVnU1dW5tbWw2OEdGakMwUFlRVmpFVFhwSWEzb1hPeCtpcCtvL3cxUzU2?=
 =?utf-8?B?UnFVSmtaUTFsVFhoQmNHSE9xTTcvWDg3SU5NTVRIbDlNaEhXVHl2SlZJdE9K?=
 =?utf-8?B?YkN6b1lzUkd3WElDSnNud2J4cmtJNkNSdVYvbjhyQzd3azlWc0QreDhYb3k3?=
 =?utf-8?B?bEEzcUh3UXk4K2kvTnA5Ly9uWmh0YSt6ZDF1MVVINmFnYitiN1ZTTTdKN2dK?=
 =?utf-8?B?dXdhTlNkblNvajJxNCtVNytlQVpSR2hCcE9UOHhTVjQ3bkh4MDBsQmRidldY?=
 =?utf-8?B?TjJHcXpaTCtOUy84MU0xS05nSmhHVUpsRHNkaC9LaDdMU2l2TDFRT21oYnJZ?=
 =?utf-8?B?V0lSdnJJMFQzbm1kdHE4RkNuS1U4SzZKaXVnTVg3dm5wSTZRU1lLR1k0N1VC?=
 =?utf-8?Q?ZTeCeenAG6lD4nUD8lVDlWRDO1oIFkOL?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: adbb2444-e6a1-4732-eaef-08df13425077
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:25.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

Write down that card names are UTF-8, that the fixed fields are cut at a
character boundary, and that the untruncated form is available through
SNDRV_CTL_IOCTL_CARD_BYTES the same way the components string is.

Say what the kernel guarantees and, at more length, what it does not: no
NFC normalisation, no homoglyph detection, and no filtering of invisible or
bidirectional format characters.  Say why - those need Unicode character
properties that would go stale in the kernel - and say what user space has
to do instead, down to isolating names for display and filtering
Default_Ignorable_Code_Point.

Explain why a name is repaired rather than rejected, since that is the
non-obvious part: the fixed field holds the name either way, and readers
are told to use it when the untruncated one is absent, so rejection would
protect nobody.

Spell out why id, driver and components are not part of this: they are
identifiers, and matching a card has to keep using them.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 Documentation/sound/designs/card-names.rst    | 178 ++++++++++++++++++
 Documentation/sound/designs/index.rst         |   1 +
 .../kernel-api/writing-an-alsa-driver.rst     |  12 ++
 3 files changed, 191 insertions(+)
 create mode 100644 Documentation/sound/designs/card-names.rst

diff --git a/Documentation/sound/designs/card-names.rst b/Documentation/sound/designs/card-names.rst
new file mode 100644
index 0000000000..a4c0a638d1
--- /dev/null
+++ b/Documentation/sound/designs/card-names.rst
@@ -0,0 +1,178 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Card Names
+==========
+
+Background
+==========
+
+A sound card carries three strings that exist purely to be shown to a human:
+``shortname``, ``longname`` and ``mixername`` in ``struct snd_card``, handed to
+user space as ``name``, ``longname`` and ``mixername`` in
+``struct snd_ctl_card_info``.  All three are fixed-size byte arrays, 32 and 80
+bytes, and a name that does not fit is cut.
+
+Those names are UTF-8.  That is not a new rule: USB has worked this way for
+decades, because ``usb_string()`` converts the UTF-16LE string descriptors of a
+device into UTF-8, so ``dev->product`` reaches the card name fields as UTF-8
+already.
+
+Two things follow from the fixed size, and this document is about both.
+
+First, a cut can land in the middle of a multi-byte character, leaving a string
+that is not valid UTF-8 and that user space cannot repair, because the missing
+bytes never left the kernel.  ``snd_utf8_strscpy()`` fixes that: it is
+``strscpy()`` except that it ends the copy after the last complete sequence
+that fits.  Drivers that copy a device-provided name into one of these fields
+should use it.
+
+Second, cutting cleanly is still cutting.  32 bytes is eight CJK characters, so
+a name can be valid and still be unusable.  For that, ``struct snd_card`` also
+carries the untruncated form of each name:
+
+======================  ==========================  ===============================
+fixed field             untruncated form            user space type
+======================  ==========================  ===============================
+``shortname``           ``full_shortname``          ``SND_CTL_CARD_BTYPE_NAME``
+``longname``            ``full_longname``           ``SND_CTL_CARD_BTYPE_LONGNAME``
+``mixername``           ``full_mixername``          ``SND_CTL_CARD_BTYPE_MIXERNAME``
+======================  ==========================  ===============================
+
+This mirrors ``card->components``, which holds the whole components string of
+which ``snd_ctl_card_info::components`` is a cut copy, and which user space
+reads through the same ioctl.
+
+``id``, ``driver`` and ``components`` have no untruncated counterpart of this
+kind.  They are not display names: ``id`` is the unique handle of a card and
+part of path names, ``driver`` is the key alsa-lib matches configuration
+against, and ``components`` already has its own.  ``id`` in particular must
+stay alphanumeric ASCII, and the kernel enforces that when deriving it.
+
+Rules
+=====
+
+One name, two lengths
+    The untruncated field is not a second name.  It is the same name, not cut.
+    It stays NULL when the name fits, so "set" always means "the fixed field is
+    not the whole story", and there is never a pair that could disagree.
+
+Either may be empty
+    A driver may fill only the fixed field, which is what nearly all of them do
+    today, and a card may have no mixername at all.  No reader may assume a
+    name is present.
+
+Names are not identifiers
+    Homoglyph detection is impossible in the kernel and NFC is not enforced, so
+    two different cards can legitimately present names that look identical.
+    Anything that matches, authorises or picks a device must use ``id``,
+    ``driver`` or ``components``.
+
+NFC is a recommendation
+    Drivers should hand over names in Normalization Form C.  The kernel cannot
+    normalise: that needs the Unicode tables of ``CONFIG_UNICODE``, which the
+    sound core has no reason to depend on.  A reader that compares names should
+    normalise them itself.
+
+What the kernel guarantees, and what it does not
+================================================
+
+For every name it hands out, the kernel guarantees that the string:
+
+* is well-formed UTF-8, and is never cut inside a multi-byte sequence -
+  neither in the fixed field nor in the untruncated one;
+* carries no code point that would break a line, that is no C0 or C1 control
+  character and no U+2028 or U+2029.
+
+The second one is not cosmetic: the kernel prints these names into
+``/proc/asound/cards``, which is line based, so a newline in a name would
+corrupt a file that user space parses.  That is also why the repair belongs in
+the kernel rather than in alsa-lib.
+
+Nothing beyond that is guaranteed, and that is a deliberate choice rather than
+an oversight.  Invisible and bidirectional formatting characters, deprecated
+format characters, the tag block, variation selectors and non-characters all
+pass through untouched.  Catching them needs the Unicode character properties
+(``Default_Ignorable_Code_Point`` and the general categories), which would mean
+carrying a table in the sound core that goes stale with every Unicode release.
+A hand-written list of ranges is worse than none: it looks like a defence while
+leaving gaps, and user space then skips its own filtering.
+
+So the division of labour is:
+
+=====================================  ==============================
+the kernel                             user space
+=====================================  ==============================
+well-formed UTF-8                      NFC normalisation
+one line, no control characters        ``Default_Ignorable`` filtering
+never cut inside a sequence            bidi isolation for display
+=====================================  ==============================
+
+Concretely, before showing a name, wrap it in U+2066/U+2069 so that strong
+right-to-left characters cannot reorder the text around it, and drop
+``Default_Ignorable_Code_Point``.
+
+Rather than rejecting a name it dislikes, the kernel repairs it: a malformed
+sequence becomes U+FFFD, one per bad byte as recommended for a maximal subpart
+in Unicode TR#36, and a line breaking code point becomes a space.  Rejection
+would achieve nothing here: the fixed field still holds the name, and readers
+are told to use that whenever the untruncated one is absent, so a rejected name
+would reach them anyway.
+
+Driver side
+===========
+
+Copy a device-provided name into the fixed field with ``snd_utf8_strscpy()``,
+then offer the untruncated form::
+
+  snd_utf8_strscpy(card->shortname, product, sizeof(card->shortname));
+  snd_card_set_full_shortname(card, product);
+
+Order matters: the setter compares against ``card->shortname`` and stores
+nothing if the name fit, so the fixed field has to be there first.  A driver
+whose names are compile-time ASCII literals, which is most of them, needs
+neither call.
+
+The setters strip surrounding whitespace, cut an over-long name at a character
+boundary, and treat an empty result as "unset".  Passing NULL clears a field.
+They do not reject anything: the only error is ``-ENOMEM``.  The size limits
+are four times the size of the corresponding fixed field
+(``SNDRV_CARD_FULL_SHORTNAME_MAX`` and friends), so the same number of
+characters always fits, whatever they encode to.
+
+User space side
+===============
+
+The untruncated names are read through the existing
+``SNDRV_CTL_IOCTL_CARD_BYTES`` ioctl, which already carries the components
+string the same way.  No existing structure or ioctl changes, so an old binary
+keeps working unchanged.
+
+Call it once with ``data`` set to NULL to learn the length, then once with a
+buffer of that size::
+
+  struct snd_ctl_card_bytes b = { .type = SND_CTL_CARD_BTYPE_NAME };
+
+  if (ioctl(fd, SNDRV_CTL_IOCTL_CARD_BYTES, &b) < 0) {
+          /* kernel too old: the fixed field is all there is */
+          return use_fixed_name();
+  }
+
+  buf = malloc(b.data_len);
+  if (!buf)
+          return -ENOMEM;
+  b.data_allocated = b.data_len;
+  b.data = (__u64)(uintptr_t)buf;
+  if (ioctl(fd, SNDRV_CTL_IOCTL_CARD_BYTES, &b) < 0) {
+          free(buf);
+          return use_fixed_name();
+  }
+
+An empty result means the name fit, so ``snd_ctl_card_info`` already has it.
+An ``-EINVAL`` from a kernel that does not know the type means the same thing.
+``SNDRV_CTL_IOCTL_PVERSION`` reports at least 2.0.11 where the types exist.
+
+There is deliberately no sysfs interface for now.  It would be a second piece
+of ABI for the same data, and nothing in user space has asked for one yet; it
+can be added later if udev rules turn out to need the names before the control
+device is opened.
diff --git a/Documentation/sound/designs/index.rst b/Documentation/sound/designs/index.rst
index 6b825c5617..e9bc10c81f 100644
--- a/Documentation/sound/designs/index.rst
+++ b/Documentation/sound/designs/index.rst
@@ -5,6 +5,7 @@ Designs and Implementations
    :maxdepth: 2
 
    control-names
+   card-names
    channel-mapping-api
    compress-accel
    compress-offload
diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 86b64de031..86796297c8 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -438,6 +438,18 @@ functionality of each chip type.
 The shortname field is a string shown as more verbose name. The longname
 field contains the information shown in ``/proc/asound/cards``.
 
+These fields, together with mixername, are fixed-size and hold UTF-8. A name
+that comes from the device rather than from a literal in the driver needs two
+things: copy it with snd_utf8_strscpy() so that a name too long for the field
+is not cut in the middle of a character, and offer the untruncated form so
+that user space can get the whole name::
+
+  snd_utf8_strscpy(card->shortname, product, sizeof(card->shortname));
+  snd_card_set_full_shortname(card, product);
+
+The second call stores nothing if the name fit, so it costs nothing for short
+names. See Documentation/sound/designs/card-names.rst for the details.
+
 5) Create other components, such as mixer, MIDI, etc.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0

