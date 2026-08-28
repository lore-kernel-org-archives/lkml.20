Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012017.outbound.protection.outlook.com [52.103.11.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C820468E;
	Fri, 28 Aug 2026 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943831; cv=fail; b=d4fMTsbTIY5i3j5FK+Pvc2XwtYZyhSBY4S6Yi3cAm82zX46eFR72UHB5NV1cXXJJFt+5eMZDWT0484O6wzSrFNrGtzWlwAs/DYUiwQkJOzczUim1fTw6VMR1G+u+k6E7KWQvhyNdFPc8LY8Vbj4J5d1G1cXmbPsVUmmoONazYPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943831; c=relaxed/simple;
	bh=bB8c824/tDjVyPKOCqhOAqP06l5socVhZo24kHsTqtk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mgZ1sJit3Nqn0SpA1Feh4xA6w+ovDEmU/kVWydMWks25nxENLZzjYa0upgqhmfQOatnwvSlwqiiuUak/l1q0NQKyVO5In8eQHE1DQYAPxg7FpcqXFQNrISe6CNngTK+wrXoDmO1AN+rt7D6Ciau0MUUl59QdXYJXrWkQUs4KZJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rVrhHbvz; arc=fail smtp.client-ip=52.103.11.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rVrhHbvz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnOWv1xayBkQIF3nY/HTj4pi1ic/GP+xJwXBw9uuFejspFNOwSGxY+4qOUBzTKMCyMwnby6+Mt6EjQoUt8jnXARNwmZEPTxGgxc6OlHxFqE1mPzxtoIKuUS7DomZ04rgjIXBjuqFCUdNkpROFReZ8u1LmcBO4j3vf77Rd8Kqnb29kIwt9j0jUGLSqciRsI7f2WRrA2MZ0zPp5Rk50AAuS23T+mAbOJoGv32qvaNrAqkh98p5ZHaXnKZDCN5sum8GTOezcMvrG+mQPji/BNoKTwE2q5r/iRjfeN5J6dZBGMyOpneWho/HKUjgaFifrKl1qWTPtjYfgKKJTRYC6mTvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvujacN30AFKDCAPhyUi6UgfGul+eBsbk4CBMEUtrG8=;
 b=fTxr3dTHRGZvWWzFkJnUs9dmkHR6OZnYO2RO2v73tS8oiFBBIaxFVBs0bYLYyo90nJSWjOlF1//QHRbOSRfGyd23oJoEs7htzGdunGVkw6LDBuPRd1/GY4IaBiu8oM7qq4YHw4REq5kCchJtOn9Atl3bikbEeXEkW+Wx6MoaG9z0GNQDTSguZlWec7dwA7W7/fYReVxbokvbNZL22l1tKUlUFRS5ZLdcyf6uJEWzZknjB8yCGcVujrDqxQwn2A/uw40idYRRYLBsaoY5e5A0YCTsbI8b0EAAp1lKHDFA396GKQGKWpJ1rwAmLhu33Au3qFcVJicpEDJgSFWptRtdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvujacN30AFKDCAPhyUi6UgfGul+eBsbk4CBMEUtrG8=;
 b=rVrhHbvzjRTLCqlNDxGsnANTfhvQ7Nf+iqPmUW1X/KyaaUl6ZARD46awhm+MQoaEhavzbL0IHOnhU8rer4Bcpy0d4MgsLkcGgV6CDElkvLuAJZpVr8FjaIJvoIe9HrdLqiCnWRlv8K+e/FUH4kh5R340e5YYShSNoP+0HSFTgSQ/q5FlbPEdBm7EirA6XgzGqs070HDSNZO6geDHQ7kaLR6K/03UmrIiPiqcAFB9dpXoXGQEkbSvSQU9t6YeVlsXiXymjmbWHNgrDRg/Bd+qQ5gdTjDWx68Q+N1DEp8qRxS9NFMSwiSAhV2e6zBldponMEdktpjtIPcobvLz64pCJg==
Received: from BY5PR02MB6370.namprd02.prod.outlook.com (2603:10b6:a03:1b3::31)
 by BL3PR02MB7986.namprd02.prod.outlook.com (2603:10b6:208:355::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:03:47 +0000
Received: from BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c]) by BY5PR02MB6370.namprd02.prod.outlook.com
 ([fe80::a85a:9490:9bd3:56c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:03:47 +0000
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
Subject: [PATCH 0/2] ASoC: fix SoundWire enumeration on Surface Pro 11
Date: Fri, 28 Aug 2026 12:03:33 -0700
Message-ID:
 <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To BY5PR02MB6370.namprd02.prod.outlook.com
 (2603:10b6:a03:1b3::31)
X-Microsoft-Original-Message-ID:
 <20260828190335.22699-1-zlzzm2014@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR02MB6370:EE_|BL3PR02MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 07206ff0-01b3-4391-d71b-08df05371497
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CIV5k4ezzOd4eLyBBCssj0c+3COusimoMViW3iidtJqfIo0pHEfHDYq1qCgNF3A8G+kFpqU2sZ1Q/DALV8be/Bc5+IjeWevkoq5NMJyrNcIeg1FFSK05twVJvBDk6lDypm/slM5UQCVlQeUYgmVcUFzc8USKfS/6aBV0+JrfPeUJwE4XURyuHIEZF7r10IKE5djXe2CG/UaWABLabFqWp427CvOiUTZB4nLw5uygv7wSJPWi3T4Qvgko+hf6yLoApDbBtRosdv4zoAxbncdURD/FxD2Q9Dyv3p43Uc5WMlLDxk1ylW5ZkJ0e1CrBSf/7wJOrSMCRrrM0drIdW6hFBRgp/ss8E2ym0qEfzuKguagCvdTMt1M0yXkZmQYv4ypyEny73zmFwzXGgo9L8Wi2k2qpay95wBnuDi9A4HUmAhye7Ab1jeiRl9gWxuZC3LoPM6Hoi5mYt++YqpuVmV5BlVm27GWqjRs7u1Ru9wcxhdGMol7VeMl1ON6WCzBbI4KdbFMekn6U6jDneFh5WKCLDqClblNKGVT4tWWBXJxy4il17No4Q+Ahmx7hDaRqS85P2fVFXyEJWTQGxCl85/KrlHpBO8CK9TlQnBUlQ7kRbFp0qOqTFkpKzZiZ6XMPbW/2FzXgVn49zLZrhvnOPtivxbjpvKUZXhNX4tQfXnGNIXRq7eLuM5RBTWjm04DGMey+uqiANjCqCd3YgObTN0WB9wbnPH2SLR28AJupXM5Wcwpv0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|4140399003|15080799012|23021999003|24021099003|25010399006|8060799015|39105399006|19110799012|26104999009|3412199025|440099028|40105399003|2607281247196008|18071099003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b0e4VP0tSSxq9WHnXeF2gwGbRwmecFfs5nDxzVCbxbpWmiy4ktRaecIeI2CD?=
 =?us-ascii?Q?1o8Lgw/JTi5hp9n2F0RkJEipGe6E95i9H8A3wRUZaIashxnUKq69qA+e8rSH?=
 =?us-ascii?Q?ojK5Go4v/KLSGFNLg7wqSyJnoBKKlOdrObXQvlA3JnFNiWYQSbKvbCg4u0pK?=
 =?us-ascii?Q?jPhBJvXl3Iww9SOmkq6M84NVdSOrN/aWKpulb3Bw1hyP/bxCkfyVlocAUD1a?=
 =?us-ascii?Q?53I7yf5rwbE0VG4HP+TQZWxT/PIiSEuH1VhGLXznMgeWoVZNsLUNowIFJlX+?=
 =?us-ascii?Q?dMaki7VPkNTXEEY+xefSRI0WpAM4rl5o1p+NY4fp8iO33/gSXBGxWWEmR0cQ?=
 =?us-ascii?Q?cQDcdlsjbIvbyK/utPA96ubQZvPsc4JhQhFPN4BjYxQsFpG3H6+gnAryZZeT?=
 =?us-ascii?Q?iP3KSqoCWZXiJYgY90tAZ9l5leBP7rm3q91WB7hzRktcmLcV4fop5ZvPnbqh?=
 =?us-ascii?Q?wTPHZPW31/tKF2EYeEPMys9aDnooeEO/aFkkcpNMPKI7MWclzS+hoA4eePJr?=
 =?us-ascii?Q?xSPCbAXfWiWmtsmy2vUEj9xvQ6XAFHhWRMK+4Ind5XJsTUxsQEcqFX7n8VDJ?=
 =?us-ascii?Q?OfPECsGb9IG9Iq8gyPMbsCDXGKdOdsy0X41WuksuIsr53XIKDUGD9VrestJM?=
 =?us-ascii?Q?G13flvWQfIKjyZk1iyWi96+H4GjvRp5as1icr0HZNv+Yf/enkIQGiocDNam9?=
 =?us-ascii?Q?fm6oMQwqcOK6RWfhg1TtGnJCTYf10vOtziw8WIX5CB/VzfBVk5fxKhhAe4ZL?=
 =?us-ascii?Q?/1U+eUR9cEaX8aWigtsramcoSk8HkYF8AmJijFEmUj3wgHhpVzQIZZxWJa9n?=
 =?us-ascii?Q?g9+7T+gmE7+1IYh6urJIO9pam+I2t9Ev9fb/+MKuk51ThGhExQ7utG7C2Jfi?=
 =?us-ascii?Q?nkQ5XLYfaXEtiDxISOpwhRTmfm4DCWN3xDNFvIhE+kC/N7LN/iwjloMJ2OJH?=
 =?us-ascii?Q?Dj7Hp+VZDtp28+KJUkWOL/ywFzqMOBTfl7GHKLdkYUOaavzVpyobDPSrFe9A?=
 =?us-ascii?Q?k5yu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sXeoFADYX0a8icJa0mWDnG4CedV8bxWGVqRCsGCumjs6bf3sB+SMKelRMEjg?=
 =?us-ascii?Q?iWr4A7zfW7zhivMsV83Qe9TXI9oGluRsxpH83RJ5q1WKHh6Za3p+WQYT3RGv?=
 =?us-ascii?Q?nNfD64ujUt2Gwpt115mB/X9x6sL3f8i/4BWlC2rJ3TD4las2Ar8f3UqEAfGC?=
 =?us-ascii?Q?SH1UoLpgm04+UlttND1wn+rxY7e684DdNHfmoW5am4cj9I+ARqjJ1p4DtJ8r?=
 =?us-ascii?Q?hsJyD3A5cXoOjoTHGdbbKKZnlBaeH1YH5mPEwWz+a6S2WN1pDs6qWuCswxlf?=
 =?us-ascii?Q?a8cPOWgOApoWfIqViKWT2CWERUBz/nkb/s/GnusyEkoI6kNSzjYVAJMQmQrK?=
 =?us-ascii?Q?My/d6OHHTAfgaplGv5768vB9xIpryl0fiJ2PVF/ChZeZIKAaNgAYmdwuox/e?=
 =?us-ascii?Q?SqSbAJA42jTAIzMR1Lhf2QJYPfVPYuYvFfxQCLoL2BUsqUpX0qacTtxeuxjP?=
 =?us-ascii?Q?BGQRtpYPuMvBFNR/nmtV7CPYyjiSt4KcbVBOUl85MnYKsHaYdVKf82I4ZYd8?=
 =?us-ascii?Q?kbtA7fshImx+xetnEUKiU8+LlhZTbP/owIWSNWBLT1b8KwLt7BstWy0fkhHJ?=
 =?us-ascii?Q?+eueKWykYDx4lGikoZD7RtDS4KdmVGkTU4d30wtorB//EwsMPrzD3QUVBnvp?=
 =?us-ascii?Q?ud/hjS8DddYB35j0nFlt3dfQJnR7dYu6nMuiz059Ye8wI5LMILDxK1rSDbZI?=
 =?us-ascii?Q?YdmF+uF9/Q/CxdQ86lbrBIR824EGG38ThlfqvCa31OhbXDE36y1W61smZ4s8?=
 =?us-ascii?Q?uWmfj5HJaAuits03vJ7sxIn2HGJ6amCVAK1L29gma7KUz4aQwU3Z9BUuA1c+?=
 =?us-ascii?Q?bM+2TYVNp30P3XstyKcMJaE5Jqh4n8DdGARpjU8U1KPTzbCnPf/Vij5okont?=
 =?us-ascii?Q?clWUISKjdR+kfI1A9j+paJs5cs+LBqKCZxYbVaqk55IvF6tzuVix6oOujhrl?=
 =?us-ascii?Q?PCK+55U84XDnaJfHALiEAK1o/QE96NIuDE4vH+SQZ/LvgAizgkLxnRIMXosD?=
 =?us-ascii?Q?U22+S3hDguEodCHhTpcLWTyXq17OI44on/SX8N93M8TtOopoSXn7z7Glc2sl?=
 =?us-ascii?Q?qUfXeRFUbDd7cff7obl5GB2wuJEIIK7OzTVMx+4UFe5tG4gchXfwIV30dkds?=
 =?us-ascii?Q?e9NhVI9AwpmurdTbJ9rIJVgkJKnCbk4JAdl99sUAUiFlkeH4+Gyx5uYz33a3?=
 =?us-ascii?Q?BqWVD3F64b6NPuRSOJqEtwuDJ+bXnoeeVe9422AF9gmCoUasHweTbX9Qwy3e?=
 =?us-ascii?Q?JGfVz+AqYpLYCew+Y0fhAf2nxeA0AjtiL//fTpMX18Qlnkn5QwZK/h0/iNOF?=
 =?us-ascii?Q?WmZyty7tC6HGlN/n7noyoYbDNjF59G+nP2MHnvND6txsx9HjWshivxWNoLzJ?=
 =?us-ascii?Q?UocFAnmcZwqJWEodbikzK1ys9AuA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07206ff0-01b3-4391-d71b-08df05371497
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6370.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:03:47.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7986

Some Surface Pro 11 systems expose duplicate SoundWire ACPI _ADR
entries for the same physical peripheral, differing only in SDCA class
ID. Firmware may also describe SoundWire peripherals which remain
unattached.

Together, these can result in incorrect amplifier name prefixes and
entries being created for peripherals which are not physically present,
preventing the sound card from registering correctly.

The first patch reuses the amplifier name prefix when an _ADR entry
differs from an earlier entry only by SDCA class ID.

The second patch skips SoundWire peripherals explicitly reported as
SDW_SLAVE_UNATTACHED when counting and parsing endpoints.

Tested on a Microsoft Surface Pro 11 with Intel hardware by building and
booting the patched kernel and verifying that the sound card registers
and speaker playback works.

Amaan Lalani (2):
  ASoC: SOF: Intel: reuse name prefix for duplicate SoundWire devices
  ASoC: sdw_utils: skip unattached SoundWire peripherals

 sound/soc/sdw_utils/soc_sdw_utils.c | 35 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c           | 14 ++++++++++++
 2 files changed, 49 insertions(+)


base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.55.0

