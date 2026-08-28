Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012017.outbound.protection.outlook.com [52.103.11.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8937EFF4;
	Fri, 28 Aug 2026 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943833; cv=fail; b=L3rXLdY5In8hBXKP4imlUtqKtsJJqL9Zdgtuvoz7onzhhnrP4BizCwwIB0o3CgOJTia73mRWWXpYWMSkea/BWj8t5XGZnB+9biKqEOTerjzElrn3E6nS1FIEbQCzJ5AV8YMYtwwaljTqOHkLv75knckdh29JGWkZ9+FYtD02q8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943833; c=relaxed/simple;
	bh=8ZY58Rpeur7BcIzR+BVhXE0GPrBFqOWCeMYq/ln79WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gt1L0Xhfvz00/YHMTy13pkyuRuNCDUQSdhfxZdAQtbYVUW1TmaDu8L+Nif4vUstp4OxKptsPVAM9I/qkAgGibsf2UPYtrZ0IDkb8RoVbaR1lgXANcmcvRYP6+FlvkxtxRl5Cx3vUqYN3EnOgfPQV1Cwmt88umHXmzhNGCW0wAbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VpzVop6C; arc=fail smtp.client-ip=52.103.11.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VpzVop6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrFQ2XNXpHKpd8tDo+smqAukDz5ma0oAIgVftQvf4j7eDYdPX7/0YGFoZS0Ba5QQU5qXBTB87B9HOoZRocMQzH+qp691qUBjmjiLSPRwCiMT9KFwmp9LwsURJxstD7o+na41vCo3Rw78V5kKaUOXLB7ntT+iSu/u7WtJjFiHuwYEKtQKCekEKMmbIV0ddcWsfkMLjJujGKV9m8h33vherno51IDNB5rBIsOiHGGjdEGRNN+3gfxRqL1/qyjzcOmkWCeJNuazVaNPAS5Epei8FhQsQCIq9LsqgJbslgfWvH1ewGaW/HVnr8W/4H99J1alZUhqeee/wIZWdd0JdZ71gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kpy25Akb0OBqySXQTWKcTtZmzwl5cybx/rxdiVYTYM=;
 b=UGTCgrob0sqwPll3CwVKJIxRF7DU3FxFCRarcDfkworMZQj/RLXejmFe1FIzmRap74PL7AeRfYeEtHv5EFU9XChFxda3arIVPaGFR0ymHm467copcsgvXkQL/hEFeqjcELBlRleRSuPGgFYrB0QiR++EBvgx91Bw2IKA5uPl2xdGjRPy9R7o0xl8idgm81Qm5vT5TfpGIq8tw3/1IgP1ZZBIPne2Rb/056PCn2xDNFNZaGkf1wL4BDKXnEWkLGf13igOwPF3RVeBSllGl4YBISZKgG+IrK8G4NpbUOZNJW/DoZS3U8YKEZDKato45JmqmzQCLeEPFIVI5dijE72F/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kpy25Akb0OBqySXQTWKcTtZmzwl5cybx/rxdiVYTYM=;
 b=VpzVop6C/SZfRUYVRoAodcM2WfLJkGa5I5+sHGiPLQFz+//Nfqf6ObFA6a6/I9epdqN5ChBfZQqm27Qhz5b9uudEYw2Ezs+ZRrEC0O+JRPlpOzx5TBve8ewFcSdgCJ3QdEwHQWZYdBDNI4dRfns2T5swl3R1LBMbTt7DHMK4f70J11+j7GVMf9oTZeGwy14lA/tAkrBoK+1ePG/Mh4hru1muKv+tsz09smraWQboUEDjRR0wa1I7W4wMESrSHzHYaMStyplhH1Su9v01+EiWwNXNe9TXhpExWl4kHRtSJygKGKF7/cMXuTvpZoCtPpocLTEmAEW6zFTZzTBPH/8vyQ==
Received: from BY5PR02MB6370.namprd02.prod.outlook.com (2603:10b6:a03:1b3::31)
 by BL3PR02MB7986.namprd02.prod.outlook.com (2603:10b6:208:355::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:03:50 +0000
Received: from BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c]) by BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:03:50 +0000
From: Amaan Lalani <zlzzm2014@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Amaan Lalani <zlzzm2014@outlook.com>
Subject: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicate SoundWire devices
Date: Fri, 28 Aug 2026 12:03:34 -0700
Message-ID:
 <BY5PR02MB6370065815A8A47F536FE4CFA0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
References: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To BY5PR02MB6370.namprd02.prod.outlook.com
 (2603:10b6:a03:1b3::31)
X-Microsoft-Original-Message-ID:
 <20260828190335.22699-2-zlzzm2014@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR02MB6370:EE_|BL3PR02MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: db494f74-635c-4555-fdb2-08df053717d8
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGa5A+bh3kLW6hbstqK+xaoT5hYTXfmhGDSGyz+BvaXa2UrzUGTwrfFNZvl5s5/2NtXKVq1rEHdUhDXeWGkNWFH/x75DLqN9UYeh460Liy9LPv6qY/0m3qMF96yVcpgUtBIZVluKeP8xEDC2NJYsqKm79yDlX8nkKr2kj2f0BfxWR1VdU5ANjKJAj6KThRYUrGCyCI9aC2MJHahQRqY7qHO0NWfQ1LZGoIcJNdwl5MM2TJE8zwRJ68v3USntK/IYXmHtHZK5BrhZAtrkTSbgUiRkSJq1tWk55HHb5PzaLUQYE86g3eQqGO/J5k6DPe5CjvdQxz7kPxvOvZ1i9yjZ/LY0fQe3DyZ0/hGgip7KyQcVQwtPPSQjzPopMnnMg53vCVSCW+7WwEJ16t1fWlWamhbr83FrPpO5wyOyagKBE2iuAPfCVjzERKs9VsroEkGZaqTn+k4UijNgee/3VNbZWRPqJOoY6di01N6gP0us2W0QWfpT9NppvH9VFLltNuRgOLGmGg0wOIZqouhcHdEgh6ugUW24dd3d2Y3VeYtneEPNSBQ2yA3ALQHK/9KM5JtCASKeOr4k3gs4KbuKOjfcfc47CvjzahvVbGoyAW0hVISxtt5wc9d9/QxvMdKw/OJUXJTJgINA7hWyUWmEE5A9Ht+5Y0wV/aGAM64dGfWREfBHIVz5TvhNKhGtYeoXp8FTA2f35VTv5u4t2flXy+OyfdOANeIkv5NZZ+6FLtgzE/+SHXSjHjuNk9xn8hy7ZAcHUMI
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|23021999003|24021099003|25010399006|8060799015|51005399006|19110799012|26104999009|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yiuYk3yN9WNnrTDsg/pg/fyOOZn6X70aeXqYNTt++BIv356/3ZSXblckZnfd?=
 =?us-ascii?Q?q75MocX3uj9pGIBhUQp3Cvf5r8Lfg6xro345HXI0EvCrJRVXNUeckBgx9CMA?=
 =?us-ascii?Q?b+p5T7xHIvYbuPXn4jBb8+L3ZPxTnbGV1qvWIeADRkjiGMuHGDf6wscGfpGM?=
 =?us-ascii?Q?yJ0vkXOXywCI4BCYAArydpvh2BKC5O15AVh6QEFHnbi6GKTCtlZiws2/V1lq?=
 =?us-ascii?Q?Eq9+bpbEleN37VQMW+aTK4MWJlMvw8NEtDzHS2wzpBQX8swdB/Ho5F7WOpr+?=
 =?us-ascii?Q?DmXvizqwWRGUNcK4kH3n1QvC7PdqBTdHC+Tg/tQG7HtmkVBDYnppBPh2toUR?=
 =?us-ascii?Q?hs5K552rC9vRckrOh+h1ba7/mC/91TwGCSppqkF516GoPtzl+a/6C+tXTMqJ?=
 =?us-ascii?Q?yOheIxynMZ4x8ZQY4pOMTr9/5WQGo+QhcqDgl46saa0CIw/pWMMAqqfLv8h6?=
 =?us-ascii?Q?O1Qxr5QWRC65G9XRte2BFlDdZMzDDhEoZ9HZGAA0ngnTpeSi4cm+rqvexbYp?=
 =?us-ascii?Q?PORsHh9mQnsaU0xfJyinevqKZMypGvmDx3mhvpXILciW8h+VdMO1pkTPwjP9?=
 =?us-ascii?Q?ZpUvkPEmvAzhH9slFoiBXfrIUBaBwk7FOglf8eCT5IXvDDy2ai5ktZZXG/kB?=
 =?us-ascii?Q?9Fm/Paj2lUETQ+ZDukwvokG/2hxPjb5Izltev2qsZoLRWhJNG+nv7kd4Yn+b?=
 =?us-ascii?Q?VpdIPyozBZlHTSZSzRjEl2ygPlG1/UYD9bQpfnK0srFEf5Em/zMhnSQIOcFk?=
 =?us-ascii?Q?9hjOYAdNjmkTR/d7K+tIAGhcxgXdE7ze4+XcGyKDvjkoBHLXkPrRKh/yOTGb?=
 =?us-ascii?Q?9PC+6GiiQwDQ+X098tdXCOti/Yl8VeEt+06iD42dJYgUHncQkGX/Oyovb1By?=
 =?us-ascii?Q?Tz0kZVIHn1/16g2c87MPZ4OEmalRGtVCzzH5JlZg0/gfQ/7Lx8fRziUP/8xW?=
 =?us-ascii?Q?XOEmsOYEBMWxN+2JXKXJIg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7mTgaJNdI2u5PU1JLpI2vIPE82ifgEVHpkzQhMHKbh3/FwjRiE5DDm/S8IEF?=
 =?us-ascii?Q?pr2e8sCNfLl+B5x3r8qcbnoU3LAo6nkieGaJ81PTmkwUCREkHYBT6NoUXIvq?=
 =?us-ascii?Q?6ZlByqW/cVsP+/50J1CR6rYKLTy9qE6KnTd5FF1P2imDhnwZBhqZc7al3m1E?=
 =?us-ascii?Q?TmazVatX7jyNHMpJ2hcxhrlwldUms9MmP8CQXItofwWbG8BayiV1I4mtewln?=
 =?us-ascii?Q?1/uLfLgLKdbyUgACinGlkP78vEQSr7vAm29kyhHYBEga9jvNAbXS6KM/TfgV?=
 =?us-ascii?Q?3m6EmlQzG9lTk5oN3A5gV7E6UGuz06TYdxdBV0MeV7T9ErOsXLpDbgBaKGLx?=
 =?us-ascii?Q?C/zrtKav44tFrMaIerUJubEpx4QooNS34rM99C07bAu17A81I361Rcnwnz2B?=
 =?us-ascii?Q?jO64RbehX6nhBgTVSkUuijlk7RdpU8rIeJrj+jpKlg+EZog2O+iV6RNjx2BE?=
 =?us-ascii?Q?ovK5twRAHYv1EaVuQDon57wgMjGXMLawbbew4G0+/AXcM1uv4NqZf9ar8q7W?=
 =?us-ascii?Q?3nPCuG81Tc0EUzcoMu3kpaqHVY/5ZuPBL/+X+7/D6WkGRE0Hpu0OC8AjEJIS?=
 =?us-ascii?Q?rvsRontASsUaEaToUOUAVjNNErxaeJp/P6GYH/NvRz7lmU8WRju2VC/l7Occ?=
 =?us-ascii?Q?ExxFA/JLOkYgmjY+mFZSnFxTNP8oVhEpSB4/3Bfq2PB3fU+R/cYI1Bb9zCoz?=
 =?us-ascii?Q?qJiDv5d6Awt9+K/VWGWTSKEWsADiBjwUKhh6054JS3cRK1J1yPFGPlGU7jgb?=
 =?us-ascii?Q?mvPLOR99JP2N7qYNq8n3Grnwq9tbJWwl+70pzS00aJX2fE9GEoMo3TW7KQEW?=
 =?us-ascii?Q?gwEcSUqv6LimlYUbrhsPtRw545hrVgdw4IdzjT3IIp3CSvdlypNRs9epKBj8?=
 =?us-ascii?Q?2byEo9hxNQUP0ozhs9efstz3t5ifTPS4EZ4RKSnKIf155eegrN4+OS5SpSyv?=
 =?us-ascii?Q?OoP+tAi3Q6lwk++P6TpUsEdPSjMOG1yopEGXbjdqJ6Yg/iT+pPLUYRwekj4n?=
 =?us-ascii?Q?V2NzqKWmbVRxxKRXug0WUdb+STp8QiT//63BNwZz1ejqNz8nL0NtUcpzzTYx?=
 =?us-ascii?Q?Udt2SBMCdvNsiz4i7hObmIQDJ9mbuKuF0MZwYFld+Yn38wyoCS6hwwlEngR7?=
 =?us-ascii?Q?nSzElWXbk/8sgIBK2SNs6imFXHgln+A1tcxEnfkv2z9OfTiL//oS62MGRjl8?=
 =?us-ascii?Q?hqgG3SWJJox2yqWk09tA2YlD/p5Zx5iZr604qaKc3XsoJ5g/yt5hvQ3qa5qi?=
 =?us-ascii?Q?GdrMS9BifxU3fihDQ2rK27UR+oKBoMTY48muW46ZrYaFdM0H7kPStIX2pJaS?=
 =?us-ascii?Q?2saVBJIzNOskOU+h9qISrkvjqFa5rDo1Vr78OeugMH1c/iIiLFnLT2aE5DfP?=
 =?us-ascii?Q?Rwm8M0MzikyTq50UAuVGLSm2THDU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db494f74-635c-4555-fdb2-08df053717d8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6370.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:03:50.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7986

Some firmware describes a single physical SoundWire peripheral with
multiple _ADR entries that differ only in SDCA class ID.

These entries currently consume separate amplifier indices when the
SoundWire machine description is built. This can cause the peripheral
that actually enumerates to receive a different name prefix from the
one expected by UCM.

Detect entries which differ only in class ID and reuse the name prefix
assigned to the first entry. Do not increment the amplifier index for
the duplicate entry.

Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")

Assisted-by: LLM
Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
---
 sound/soc/sof/intel/hda.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4dbba9186b29..c785e27089ea 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1245,6 +1245,20 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 			((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
 			((u64)(sdw_device->bus->link_id & 0xF) << 48);
 
+	/*
+	 * Firmware may describe the same physical peripheral with multiple
+	 * _ADR entries that differ only in SDCA class ID. Reuse the prefix
+	 * so duplicate entries do not consume another amplifier index.
+	 */
+
+	for (j = 0; j < index; j++) {
+		if ((adr_dev[j].adr & ~SDW_CLASS_ID_MASK) ==
+		    (adr_dev[index].adr & ~SDW_CLASS_ID_MASK)) {
+			adr_dev[index].name_prefix = adr_dev[j].name_prefix;
+			goto done_name_prefix;
+		}
+	}
+
 	if (!codec_info_list[i].is_amp) {
 		/* For non-amp codecs, get name_prefix from codec_info_list[] */
 		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s", name_prefix);
-- 
2.55.0

