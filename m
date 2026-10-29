Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271137;
	b=cP4RFuawELTY5KEQMoYifEdrU93XBew28q2LuIALVnl2hisDtOFGwTx043t8Ue6fYPCF
	 iEUX6L2NytU7fh0IjbNZm43IJP8aGWrCZt0YPQ3zTzaHv36D0g6m0aoA9e3ZIG+gRqr1u
	 pAxL1jN2UaGuSgS+lQTKmOs9wCI13Arxw/hYqY3/iHHNykrxpGdC6csdDsWg0LTbKrF0F
	 RMKTQpUWClIy1IExp+MMLJ+g1N5kTfPOgOQGjQ+3mWZBaoUFS06Tk6lbtoJjuG4v4qFgX
	 6CtYDnJuA7ciThAUut4COoEw13xVDHrnDqq3IoYrt2cUWBlimx1Rc7Zh0/vsxTkpT2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271137;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=caloWcDlVqgwkn9lQxMw59a9+hxUwJ29U3Uk6yPZGYk=;
	b=JiyAab5QwVXnd9wWEQvE1afO8sPu6DgFS8PZaIHbZdN0yEMFaPZkqGoSn5ktw0/tn444
	 MjX0CqbAFbZ78f90aSehuKQPzeCGArolP1spS11QgXLuujkradqx3qh+SaT3i153G+uSZ
	 d2oGH4SXGUMdqOGdg4ZxlFpOWogKLkamcU1BrTduvoRXGETyLidxK6AICuJVWEx/2rndV
	 bmYvZ1av3xdmIb/GzoO8cY7VY1IDxwA/B40K2gL9I0cF8T5pn4UmKzZAf2Rgr8BLVUWM/
	 sP3a7oS++g61W0ig0tM5VKR8p1faVlq2dUNw4vzNagdDTNGrXN4/hl4sv71bmcbQncA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=lt1oWd6m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011060.outbound.protection.outlook.com [52.103.14.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F2606A320;
	Thu, 29 Oct 2026 10:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301F2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=lt1oWd6m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlvSkRobnx5OH7CKh1vrccgA5UADLRx5IQBYcCvh6LREn6wZQ55ShBuGaVi3/CKcNpuI+fKAIeoOqY3vVlR+zlFxT/pkMtGLf0YTAMA/MBKSnxNGjhc+cWnjEaTUESjINFHhk7+L3D9MqyJuHXFE4Z/JaVWZ/+4LtL9x0LKQx6+wWEPdsqoCk8eY7R41Rauub5clTjl2vbqXBT75as8AeeyJ60wM6LKYSm9R+MJTHVIX9oaooGrjbksbSV5hWa5V/KthJbjEWWZurSyQVePrRHo3oCMbHxAW1gJWbHJ434sqSZ4qJyvn/TjXDUebIb8zEdhGtlb+/oXO0NHHAhSLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caloWcDlVqgwkn9lQxMw59a9+hxUwJ29U3Uk6yPZGYk=;
 b=b+YJwZjmeS8sw5SNQgZNezTBkg4zKzxOQPdC84GPNUBrwz5JTgvAD4S4FiH4x2Om7mCzh9o0f2zgk4i1Y8Xlu/mSN0d3LOtXdcV+529siG4kQEUtH4v0IIuRq/AnMuyZX8gIPqAgoajHnPjazgmnGFSlRxU+D74wEIW+36EGjTSxSKu6z7RFJt2k06cURgilOYHH37u4gia53mCZJuzfIv1oP4RzeYvJ05DKEQyGsSDBRve2zxbvHmptIJnYV3ssZnqeOBmrh0ns3jcwa1jdnMgLSx7d1WojYKsxJlcnq8lzGr8ZE9DOFZitJ2Dn+4h7J0yy78c/Nq8GJhCdUCQjbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caloWcDlVqgwkn9lQxMw59a9+hxUwJ29U3Uk6yPZGYk=;
 b=lt1oWd6m8DcJKiyxAHDGo73k0Ieg40Zt1gkns/q+buzJXFGBI53LnRO3nRRQ6CLQF2v/ZwBCtBX6qRmihqp+itN3pbXo0RE0TpA502hCtgFCDEDB6tHvmD8V1WweouUSrIzwNeP5TziDCJcBFtoKL/J+24nhaedsP1dPde3fzCC3waYLCjsJJG/VhlnBNj427Ne+VisCTNRcDV8CheP162QDJQQNcdQxTrbVixcP9dxW+5oJaH1XJrTsI+thS//K/Z8gFV5T412nOl7XdZ0g3AC7hmw3IByhY+pci2ynlu/vd5qjtxBSZN607uclUvUN0SrRiOzx80XJlbpm0LhoBw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SJ0PR19MB997595.namprd19.prod.outlook.com (2603:10b6:a03:40f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 10:52:14 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 10:52:14 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ALSA: hda: aw88399: use auto-cleanup for ACPI subsystem ID string
Date: Thu, 29 Oct 2026 11:51:57 +0100
Message-ID:
 <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0345.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::6) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261029105159.16954-1-marco_giunta@outlook.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SJ0PR19MB997595:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc51a95-35c2-4359-2b27-08df35aaaf01
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4fY87tnuLwEhDmJ7FPP+BKw1SKvFVArjvuHQeFlYndFAmrrnZ/x/01pYlGHgo/VL4r78+8Qp7jO3stYUOpA/zHA1oUQgiklXYORkd8SLbaeEVinWShmxfhZ1LGMhM5LijalH4S0NpUQ6qTUWsh6u+z5crM7QdX/weEH8eVtfpRzxNOKLGz3vSgyPD6hAFWqjYBADf45g7VOLvHNyEhgud2GcfN7qdFIlnuh9wTytRXY9pcsLUIGvkC2tXdjcRpVIsdmLMcjjuVhw1MzygjX+BRNPkc+RymYqCkq9Mn9a+XRGHFOQjthGvfzgoPGmeyXOW1WXIrGVyDAmqRFQTjSeh6P6mPQCT5er5I7NWKXPXzZD15p/e2wXmGDkFI5tO93WetWsUsJxS+GrmZjctLyThBhZyOR9VL5ICVMY6QYZojro/+AmohVAff11Y3J0dlEarjok+tH5nH6mT8yb9AroOPrEE/i86ES9djmtQI5uPrayViYlb0ioX4fidZMxkmXgBt4jGjCmZ5iRR9o1Ft2H2TE8Yz2Ppi0VkEKLp8o+4lwv390hwfR6NBiMEGMEW+KzNLSDNqELnjDLhBo9tBeL5ddb56buoUVZPuLNLz0H4RblPhHC7gXR6TWPvLSH48ea3iS0kLdlz/BjaYM2uBYY5eA7J7Y1vQHif82WVjnBhRV0qRgZcVMJQpPQUSWOk3qjLICu9x3TOe2o=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|23021999003|5062599005|51005399006|8060799015|24021099003|15080799012|41001999006|260925184616899003|25010399006|440099028|3412199025|12091999003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QhtslZMDGtX5cdK2loX3A/80cnRVwwB6utikmLDmBFu6ibY6NuQSqc6hlDmK?=
 =?us-ascii?Q?O7KaDWMIb48R2EQ1FqqlXYely5VJ1V0C9wU/hGQqBqdio7GoatkDCmFBoG2j?=
 =?us-ascii?Q?AOH6JRsJNlumzq5NI0NO5L5AlWIZA/JGiVCNYDu/f4i70x+9yjYKny3ANEux?=
 =?us-ascii?Q?pxBtjBq9IkfTdKZA2/+bPQmIx6wz6oX/ewG30m/PiZxQyrKQYlyvAT4QKzQz?=
 =?us-ascii?Q?s1SzlWji4/R+yj61v+2BpLFv9K2HdcwqmMP8nj/1lnql1EB9uw+Pm75Db8wa?=
 =?us-ascii?Q?xfwOqM6bb0BjCm1g9E25CwBHa/EZyCQgXlBbMQEQjsrXOpGe4ZHuGOgZ6r68?=
 =?us-ascii?Q?hApGlkqFdqBlYlwQECbS6seFmM25q4oznzLqWJPjd4L387ZTH0AWSyQgkx9w?=
 =?us-ascii?Q?zmoKBFDt8sCe2vVdWEKivOShzov8IFzZ/qUlfsQANhKlQg5Ufu2pf0ziFoa2?=
 =?us-ascii?Q?ordpJNpgARu6PLSbd0IYHRU4PfhfdxKtfgjQ5Q3779ABsyevbc6juuJ2EbOx?=
 =?us-ascii?Q?n5AfLWpu9xJqchIj2HaXufCNtAKzkYQCJvDGmt9q4RIAbW1X2aZAlhvZn+0J?=
 =?us-ascii?Q?nVHtt+rhY2ZUPz6FwkSGayTYbmIZlhcok1CHbhJJ+SljubttIRol+6RnUA1s?=
 =?us-ascii?Q?YFkkCLNisSpffkysD83/UyZyM8dpFRUOzbFwST+7dsE5wqzRXZl94kETjemF?=
 =?us-ascii?Q?fC5np1hILVYNKJzwx8sm5N9VGt3ZAe7HxSeAymfJc5mjsBkO5DqXcV33Yqp2?=
 =?us-ascii?Q?5nWsroHEPNrbdkUORwDCE1R/27I4sKdIjlLYu4eddo89z5byJ3SLRc0NQWTm?=
 =?us-ascii?Q?W2uJvw0S9HKJcZxDIaqoKEk9/Pg65jIYIU4I3gg8cIg6JMdfWlRvUEhKBMn4?=
 =?us-ascii?Q?YNhzJ5Fq0neC1RCgzVPrt27pDXwFzot6pJmfhdcNLBFNhpZDAQCcqZ6LHgZr?=
 =?us-ascii?Q?mQL6HQBsmWHo2skPf1ZAkbcHAYeXTfrDYMvMZaz+ZTCfb7svPL5kMieOStH7?=
 =?us-ascii?Q?1279Y6G/fFX65s6QWbvakwVx9iaOvhbVpbeidoRizFnQYmgWMoblQe+aWr8J?=
 =?us-ascii?Q?MdwWuaBl?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZHC6E8JuMs82Jz8BMovC5zxkXg/rC9p8VFfE4KokeFKFVltnikIlJYL4eDc?=
 =?us-ascii?Q?xOc8H2gG6VY41BsYbhaiipzGZ+svDM1XqzGQKpT+YJowwZsvsbTJn94//gmm?=
 =?us-ascii?Q?ANYVDT/DYb9OxEbaeqS54dC+fhRnDfxvrhc2DS/dggIAwuZj60TX7zyndUh/?=
 =?us-ascii?Q?dPaojii/pd0n/W428RpnB5smZHyahpDJeIMKhQ+Bw8Hp3o/uqAMi/Ofey2/O?=
 =?us-ascii?Q?CMQYJuKHladjdSdrEgH3e/NZctcsCj19LrHYQpx0axVCq0WSoxNyVEUk4qGX?=
 =?us-ascii?Q?IxgTZ34Be5xIPvP/oCkQ0dRJMbXFNBroe215ARIMOVDr2kHazLSVfC8dJMNz?=
 =?us-ascii?Q?Z3XkGb0cKXqnG/diPoIlg18CEXaGc9G/jp/kZEDMmaMABNp/bpARtX4EVg7Q?=
 =?us-ascii?Q?w9o2uX6t2OOlRfqM+y3qoMzq0t1/byNCzVvxHawWi0UM1vGkqU4Oo9xk3HFN?=
 =?us-ascii?Q?XSrAx31UCTnL2vzXKvMh4vtrNgY/0YkBGtNRVQ0h9AkHXsJBgY4O8PomKMiy?=
 =?us-ascii?Q?jToFb93RqOistpiT51rmvIiu1ZrcgEdrX1770tc6z8w9wWTTzQiq4sPJkUJC?=
 =?us-ascii?Q?pb1BnmfZgON/Za28uaCkJverBlO61MQMknbC+6XJZvRA2JL7Byyn5FmMKdCx?=
 =?us-ascii?Q?70l8b1JuIfBAzisQaO+kR2vlFwhwiF2B2TrVFPGkzMA0U6N56T9ppEMsYeCi?=
 =?us-ascii?Q?i3rGvDoarIYBp6poWiwC0OcEjubtR6iIlQBqVxAncA6Q9I1fZDy+GG1tp9JZ?=
 =?us-ascii?Q?GMmrBkSVQLH74oFtKePKBm5CysUd+GDZBN5ajKWGRpqbdLHOapNwk/2jhmUK?=
 =?us-ascii?Q?bU8zLweQuY1EgAnXWO+INOKbqxJKaLXtEfYCO6m0gI/z82nzrNcYh1BGT2fH?=
 =?us-ascii?Q?dPeuMTSGLx55O0DTHzrgx0qSFIylkYw42Lh7bzxrFZMx7TX/+PK5pycGBd/D?=
 =?us-ascii?Q?QH9TEQWtfq/j+5piKE7BIkO2yeYV6GjpLYvPlMZ/3A1OfDs7rz0lJ9mWUQx3?=
 =?us-ascii?Q?WyH+x49WKdynTCB1n1pMVafsh1/6YvYhUWa5qYt+LGeAFx+jsJPYFVzmRw9c?=
 =?us-ascii?Q?gljmjwf91OeSP6em/dXywPoxghOl2+6x4wcU1iGAihFQDpyCMqTFrsFq40Ck?=
 =?us-ascii?Q?ea3k3Dj14sEdaxXDyUb9F1SEIR1WDQk0B94RXJisfpwV7HIzxB6cPfArX63x?=
 =?us-ascii?Q?NJ9KyHb8GpOCg2HC2TPOIAWPh4qqqSvjDWYmesz3vSHXnV/zJdIT5LHLXRf1?=
 =?us-ascii?Q?ciIXojmIpxtq6AHNrAdGO6KimFLsaOQjmCHFnxGZn6Pf6zhI5MYP8yD8nSVr?=
 =?us-ascii?Q?UWZo4NXRFZRk9twBvABA2WBVdWBJCjk7nVu5Lp4vAosNrgrw/cKXuCNEvLse?=
 =?us-ascii?Q?WGkGmc6pEfDAR/mPP+/xEQPY95ZK?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc51a95-35c2-4359-2b27-08df35aaaf01
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:52:14.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB997595

Use scope-based cleanup for the string returned by acpi_get_subsystem_id()
instead of freeing it manually, consistent with the other cleanup
annotations in aw88399_hda_acpi_probe() and aw88399_hda_init().

This is just a code cleanup, with no functional changes intended.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Hi Takashi & Mark,

This series contains some trivial cleanups that should (hopefully) improve
the overall code quality. These patches are the result of me re-reviewing
the driver code during the development of the recent firmware path change
series.

I appreciate that it's likely too late to get these into 7.4.
Apologies for not sending them earlier, I have been quite busy these past
few weeks.

Note: for simplicity, I based everything on Takashi's tree, but if
preferred I can resend patch 3 separately rebased on Mark's.

Best regards,
Marco

 sound/hda/codecs/side-codecs/aw88399_hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 00b78299fa56..5d5acf87ef3c 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -184,7 +184,6 @@ static const struct aw88399_prop_model aw88399_prop_model_table[] = {
 static int aw88399_hda_acpi_probe(struct aw88399_hda *aw88399)
 {
 	struct acpi_device *adev;
-	const char *sub;
 	const struct aw88399_prop_model *model;
 
 	aw88399->index = aw88399_hda_index_from_i2c(aw88399);
@@ -203,14 +202,13 @@ static int aw88399_hda_acpi_probe(struct aw88399_hda *aw88399)
 	if (!physdev)
 		return -ENODEV;
 
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+	const char *sub __free(kfree) = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR_OR_NULL(sub)) {
 		dev_err(aw88399->dev, "ACPI subsystem ID not available\n");
 		return -ENODEV;
 	}
 
 	aw88399->acpi_subsystem_id = devm_kstrdup(aw88399->dev, sub, GFP_KERNEL);
-	kfree(sub);
 	if (!aw88399->acpi_subsystem_id)
 		return -ENOMEM;
 

base-commit: af642c86437dc62558461f624efb703608d1c09f
-- 
2.56.0

