Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012017.outbound.protection.outlook.com [52.103.11.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C13BD62F;
	Fri, 28 Aug 2026 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943834; cv=fail; b=cjoq8/Fwr2wb4RMNf5iz4nAc3uInBQ/NkdOOZHI4WGUwcOD7+0D9YzRj1QEd4/u08hjJ59hI/IuEOgDIWbvuT3SorrCiUuh1k5vLgHEAc8JUbtGDJL6xaXbQYC9q6Lm7StfzM4RrMIRRl8/Pv7OrKBagrdmq6hdAFqO60Qh5cqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943834; c=relaxed/simple;
	bh=/DgH134hKBGDXL3rVJiFXTHvEPpTfZmC2cu07TxEi2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=slSjZw+gxW9k1VF49r4TWmBHo8pKuB9CYW+ubnpzOSk7Nmq2iX+4gYEVvEf9QzcwaUsw5ipCyoOlFtrwKs5VbCSGIbp1CdmMniBqI6yWY8G6al8DUAOodBckQoK4/Ze7o8R7/BSfsSR0x6i7Khbo4MPIHICvYZbupoNbRY7BMzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=L6bX7QXI; arc=fail smtp.client-ip=52.103.11.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="L6bX7QXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcHjn7XLrHdykEiPle/cC+xWKQo9uSbc3bV8a56TAyi9PQsdm2VniiiVM4CNwSLMVQ7uUOdxeL4/qqRJmuipt0JQpXowVT/hJlLvWwM6RCOqESC2p+1YEnD9JY1z6M1cHxiLGuamqF/XAcDnPVgLFgsPk04GNRqGnGNn48VcRulrl7a4HSSXBQER3Fr2ZPzhpkQqt8D6LXW5xhuVplVSyofJeir5UDUE7gM3k3iEsrw8asQ6wkAZJv6JKP6xvlRQQoY3+k7Kp6uBkF63mdlaD564c0DIehOzpmYPc4BQtNoaihy69rHdLD4dOEG+XHcN5riJSL4Sd/A/IgAZay7XKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg4dtvjTvvxXsHU4eJW03uKPwuJJa51stq5/vCthmn0=;
 b=f3amFVYa6TPsbD/5/I3gBCkdV8rRA8uW2LW2Awk00l4WOolRQDCcuyYZohxfGcei/QmugHtXayY04vpTOGW/ClPA8IHeiQ/yWrKwF5Mxivf/jp+W0T3WfzdlCdbTr2vH+NNnqnVupMifSoO6nYPPWrwnK8hV2NqjvIAbiJtCQ+UfnjA/rFmfkN4xy2pjlneKcxmA/tHedP4B6efKKIIZ3ZpMag/C/7dfxarg+iX5h+ZG4b3loz/5y0OLZgKZ6t6sxSanUOJgShSoHpDoeojqQSxDZxwk07LFV9ySBZ4fz4Ip44FMtfyE8d0CknkbtoAlEEtpm198PvTMXyQlgEsI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gg4dtvjTvvxXsHU4eJW03uKPwuJJa51stq5/vCthmn0=;
 b=L6bX7QXI7WpJ6V6aQRaEeTalUfsD8sBzQPrkh08WJCtrbu+XEnXoBSTQbiN0scxhsXuvbpVWjPPdJ4jjOs1r4TrjKkSKssf74XJUUnalNEUlAVzhTIPnKuE+Z0eB1W/sn8ixV9qtsAip/lnTYY+/P8FyRyythYLe0d9D4MKJ6kIKSQyceoffGQGzAIGxx/IZ5g+dHIYdlovMK3tu5BG/TryvF2mScrPnYTbrM6lAN/Em/m+8b+Z5ZzRKb95/W/9OMijKMhlisFUt+ttvkpG5dpXzzhmjV3mAfxA+9ZyppkXgD8nMtbzlrsL96DcmV3rNTFmTCidB69foNPd4LXNhtg==
Received: from BY5PR02MB6370.namprd02.prod.outlook.com (2603:10b6:a03:1b3::31)
 by BL3PR02MB7986.namprd02.prod.outlook.com (2603:10b6:208:355::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:03:52 +0000
Received: from BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c]) by BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:03:52 +0000
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
Subject: [PATCH 2/2] ASoC: sdw_utils: skip unattached SoundWire peripherals
Date: Fri, 28 Aug 2026 12:03:35 -0700
Message-ID:
 <BY5PR02MB6370329690DCC8FF0F5DA8E8A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
References: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To BY5PR02MB6370.namprd02.prod.outlook.com
 (2603:10b6:a03:1b3::31)
X-Microsoft-Original-Message-ID:
 <20260828190335.22699-3-zlzzm2014@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR02MB6370:EE_|BL3PR02MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfe0d50-afa4-40d3-35d3-08df05371966
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaJtLndpdN87x6mGBaRrcWflZcm0rgD4jQKHsnC6nZ9rQ5xuWcZ0X7RCt0OWUtxGEzMenYoviuKkUL6jMwotNYnrQewsgCtuRuej6/stCYwqkHE+SiH2zxi/ooHjOGAQlk9BdLPB3xXJU9TSIFF+R50YtR2R2uqfo4+KAaErAZMg07kzFU7AC5plZYaM8eqYXd6KJB1BEcNGltxzaB2bV/JEUCHfc7d6q/6FzgKmMiCkcbR+NBi20vllDF1Vs3rd9wFzPYV5IYfURecH2i1mL2N20csN9axofEhOKqheu8mikUQfmX1u1FS1mXGn85svpbwDHZHyWOh6EdqAEzpeDxtt64apUkii559awMw8AMTHFWww95Ip1sw6AXDKAgPRbBpFPr6NqWmX5lFDPyAmfzJ1UrxZRU3nTBjDyvf8MRx8n+/lNeuWnj97NKARQIweIkFWhw22Z1X54RJs/zWrA37vUIhFyTHFT2BC2zpT+gxPeOdCgUUEDRp/RgHv5iYpNwYvzYcIuGnj0Am0XOh2wnfuL4kiVXYcXt8zX/6yFugdEAKSpk1gQr/eQ6Qg1PS0hkeJM51HlPSKiGlgZmfLx7Pahr4FrpXF6wpJcN2rsk/5+8pmB49lg4c/+59iCWMhQq3L8pmUvgbdBPBrFd0SxJ1+wxEXyjSfY2ac3RBmV36GGo8g9pIhk2CbMv3ii+R3/XfwdJHgtiVdIPnH0WtjqVRXSb8lx0FDZn2ShxYAXUWicAJ/SX6pPpAzXD5aluCaTA
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|5072599009|15080799012|12121999013|23021999003|24021099003|25010399006|8060799015|51005399006|19110799012|12091999003|26104999009|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZJK0l+7y8O7cNubRHah32bRaxWKJNtwprVl1emOZnVhb6zmkcnaSzdHP8Epv?=
 =?us-ascii?Q?WLJwqRVc+9gmkBv0SaGPUgb7VEbTmNBZZSIoB73uuDetgARMj5/T6UQTI5p3?=
 =?us-ascii?Q?05rdC+1i7ehjohKCMNxR7wEXBAq9ds1XfsGBvnV2b0JtPxuB7lzzRydcy68j?=
 =?us-ascii?Q?/RUI7dSplknBK5o8wsOP08JQ9ohyBkhM9M/ZfvmCAjS9ydb6w674x4hjdO1E?=
 =?us-ascii?Q?NSb1bVtgnz4ZiUngE9WCKr96nSGKpLKfKVnSscuvAWHyFr2cxJM0dzy0GL2Y?=
 =?us-ascii?Q?fqbGdwdK+CcKvi4a65sGsLSurcqzgxcwVuPVg7mNglEamz2/+SFGu3ZEXmzY?=
 =?us-ascii?Q?lznHxt40lXLK/PqMgIRAeIm5ZlUXa3IXO/abEmWfX67eZTEXB3cUNWP2qQOF?=
 =?us-ascii?Q?ZRoYtDxZkUeJ4ly86SMYT05xCaHO96hVCQexY5nqyV3DGi7C2nmdPTPL+GQE?=
 =?us-ascii?Q?nVAui379zfZmBRW/veY6wDsJ15xikc4NKZlgMWsWZQ4dryZp1KpuwpyEZi2X?=
 =?us-ascii?Q?1EQ3MC7X5hTysf/wyMfWMRoXbzr4OtMnQH9V5+X5SauvvmUG1aQVn1btfPGW?=
 =?us-ascii?Q?lHGh9Ec15zVgXrXrTm0L6120qNs9kEWbWfiPqbMY8J8ivEgziwLHtiFTPdIq?=
 =?us-ascii?Q?Rz9XGzbvqlMaazhaO3DhGry3fWfMHbq6RdXtnvbkKosQsuP0FPsabpz67B3z?=
 =?us-ascii?Q?c8ofOM/HiIGTj9heV4XWnAFIrgcGLYF7UWhU3n0jAcZGOXVLwPxKEpnw31CN?=
 =?us-ascii?Q?z8ak9G8TXZKsRw3is5BA22A0u+cg5G9CX5y352Mbn2gMXq/p3PEX5hPGEnU6?=
 =?us-ascii?Q?T17xIcnPJ2wXiWZYZMBq1HWm+jsJ5EoJY9ivxazVYdfjg9Fnxw7ENCgIQ6A8?=
 =?us-ascii?Q?8dEExXlR+KeuCtEZsD5oSLTKvrHWsVbeoZsfozafVxRPeYRa3EmqpTRGEC3h?=
 =?us-ascii?Q?c+8dkdApHAOCwz13zEelST7CSvO1e7523UII3tH3hr8D64xFME/75Hvmi/wo?=
 =?us-ascii?Q?DbjvRWjeMYnvxh7LJSodyxK9hneaxcsn0zV1eybUtZQzx+VswRToEAf+uhhZ?=
 =?us-ascii?Q?KR6YE+Hq?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9ZYxSPlHKsMyVmrAhhT8gfjiXVq+mYVBSTx3FP6uDxk5wR0MzMaJBOaK6ZK?=
 =?us-ascii?Q?d8KBNiHICknBTCfbR1k/WzMNKq5Mas1XFPipjTd1Yu7LxxPsiTVk4q3P92zo?=
 =?us-ascii?Q?BovmmLf9xLeZSuWDR5jMZLfPWL5RLHmvtD8SbiCjenwFd4lJDgonhLnhAqzL?=
 =?us-ascii?Q?GB/oxe8orDP16gJCxfCq4rlpLE5YTQ2GTH9646TpeNrIKTzW6Ffhwk1qJn+Y?=
 =?us-ascii?Q?jTspK/anbWItfB516Sl3CtOcQKqWB6kIQ0P1RbSVZzxVxPDlhGjzMFPyZVNR?=
 =?us-ascii?Q?7T4xirE7IqObQCexw4TnbH22cpBk09BDRLuafWLzei6UvqQ16ojI2jt44MGQ?=
 =?us-ascii?Q?/gr132yDZp9cuvCdoATUJBIS/rZSz/lpxvsE4EWjnIcJ1KULI+Dv8T/x7x+e?=
 =?us-ascii?Q?t7KbLh3aRkDYzIKndg6BgVYbBszdQmcoL4XZ5jkcRqQ7UpDzzxgA1rZMoh+U?=
 =?us-ascii?Q?WSKZgDjWZuVaT2e/unE0uDg9MFs0vovzCc1n5dQk3JxrqYWTmNcq8dY70q46?=
 =?us-ascii?Q?T5ghsDpFCmqS2hW4awSedmrxe79euDR09Oknu4OL1PUjWsc2ZTESXUS3UaEW?=
 =?us-ascii?Q?86k2TE/zWT/A2eok17cB99GzGI2iVBasEFnUQVLBbyW8CImtgn3ulvsCppDj?=
 =?us-ascii?Q?ZTXcRT8v28jBXgR4eW7VUawR5pbdchsn680dsDsXQ8pkYcBL/t7wyYtkt40R?=
 =?us-ascii?Q?tFUTyD8IGkFArNWZn9LzYrRuRqL0gLI25cT+HVJmarMGwieb7W1fq9u8BimG?=
 =?us-ascii?Q?C5DY6hWiNG7CZQQ/1TAkA+NMGO5VJrukJpTVmKT92cn9wWFl5swplpvOAu8L?=
 =?us-ascii?Q?nBjOSWaf93HJ39TkLCLjzfJIpud9WRFEf8mGZwHrUd9s/o+ozeUAsHn+zksk?=
 =?us-ascii?Q?pIRD0aFfz6HJvsM5oDBrlun0YmY4ub4srvPRp138uExFoYAx+MU8xg3qZ/1N?=
 =?us-ascii?Q?KA9153DwDA4KeQAGV1jGoLLSPmoD9RvXbFVkGpxLmLgpyjHnVjMdDWQU189F?=
 =?us-ascii?Q?Ty4Z/PROe/ff3uBpumbGFz5QyyukMSlFFxm4GcL+eOXBPNKnNF8+qT54GaH+?=
 =?us-ascii?Q?56/Z0hplH5KZ/X0ZEjRgsxnrBDABk/kCZyYpgaKRph8oveJbdPblcKunyHyv?=
 =?us-ascii?Q?DHcMUTsFMdPiYo/ynPWZNvPmnC62uWy4QB5dBU3oMzxefx2FjztXqnLwbzEm?=
 =?us-ascii?Q?B7o/jK2+35sENbC8bnlZLAmvqpNeW3K3Rmk7pKzotEElTmILCzEx/iMBjjD8?=
 =?us-ascii?Q?Zx1J/xOxDx8L9b+19aQs0oYQk+4Ac8mOrrCWdTcDpsCaQOqT9cszJM6AsOKs?=
 =?us-ascii?Q?23HLJlAQ0u4zpNU+P9FxEiSisSxE9D/O7zKt69HHtR/FB0vt7CoscODG8Ctv?=
 =?us-ascii?Q?lyWxcIcU8ZjwyfJeiWxY1FzEUyfN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfe0d50-afa4-40d3-35d3-08df05371966
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6370.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:03:51.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7986

Firmware may describe SoundWire peripherals which do not physically
enumerate on the bus. The corresponding SoundWire device can still be
present with SDW_SLAVE_UNATTACHED status.

Counting and parsing endpoints for such peripherals can create entries
for devices which are not actually present and therefore interfere with
sound card registration.

Check the SoundWire slave status before counting or parsing a
peripheral. Skip peripherals reported as SDW_SLAVE_UNATTACHED while
preserving the existing behavior when the SoundWire device cannot be
looked up.

Fixes: 27fd36aefa00 ("ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi structs")

Assisted-by: LLM
Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 8a07ba2a29e5..381eb884efb9 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1854,6 +1854,33 @@ static int is_sdca_aux_dev_present(struct device *dev,
 	return 0;
 }
 
+static bool is_peripheral_attached(struct device *dev,
+				    const struct snd_soc_acpi_link_adr *adr_link,
+				    int adr_index)
+{
+	const char *sdw_codec_name;
+	struct sdw_slave *slave;
+
+	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
+	if (!sdw_codec_name)
+		return true;
+
+	struct device *sdw_dev __free(put_device) =
+	  bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
+	if (!sdw_dev)
+		return true;
+
+	slave = dev_to_sdw_dev(sdw_dev);
+
+	if (slave->status == SDW_SLAVE_UNATTACHED) {
+		dev_dbg(dev, "%s not present on the bus, skipping\n",
+		  sdw_codec_name);
+		return false;
+	}
+
+	return true;
+}
+
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
 				 int *num_devs, int *num_ends, int *num_aux)
 {
@@ -1870,6 +1897,11 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
 			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
 			struct asoc_sdw_codec_info *codec_info;
 
+			if (!is_peripheral_attached(dev, adr_link, i)) {
+				(*num_devs)--;
+				continue;
+			}
+
 			*num_ends += adr_dev->num_endpoints;
 
 			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
@@ -2029,6 +2061,9 @@ int asoc_sdw_parse_sdw_endpoints(struct device *dev,
 				return -EINVAL;
 			}
 
+			if (!is_peripheral_attached(dev, adr_link, i))
+				continue;
+
 			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
 			if (!codec_info)
 				return -EINVAL;
-- 
2.55.0

