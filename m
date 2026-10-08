Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CFF42E409;
	Thu,  8 Oct 2026 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498887; cv=fail; b=ZQHCunPmfOuuubyMD8qdFvCjYlmAjNJdBG4lRSiK5wD9ZyaVg6pshm4uPAowccB5NV8/NJZKRRfs0a68hSUmcYH1LKW2JMpoegQ+OHzIzMU1uCoSQ8V2pb5NbCB8Myp7wMTuO23hWEsZ5620Z7LrWyfbsi/gjlSVdstBEcpDZ7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498887; c=relaxed/simple;
	bh=CjphjWaCTDVoAAESjvvgliYwiFU+ZftzCc4gDyFYL2s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TWBA4DGusyt7rv0gz/p8VtSYmRG3xkmxWgIdWSF/XJly/cUCPY2vJlbqLA60+kPIt+XiVIl8ZPE7qHXyZNNUTaUJP6gIChq6olxXZ16lWfTfbFJejh8F8yb+V2JZ9iIM4Q1xdalOI/OFGxxlLt7pC4h+qqbmSMPbjrmVQUkjusg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GrVfHxEC; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GrVfHxEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh66Qyd0lGRhF6u8kT8VXbOjwvqJ//a715g+onr6IoLSSqhGEo+Up2gxmsJ71X0eMGg8pS8u4W2SHFOqGicy7vOdHpEn/JFHUsA8uy4ZvA5Llo/3RNUn8ZsvjSI+vAfp7eVVamEoeYnvFu4G1LVO3QutOXiOZimgATD5qIR+r0XBO6DmqCkKH8iVi2YPJBS+caPn3AsSXxke1YhhawnsBApLt102jp3kqrtyH2rNTVhIqxjCtF2xnevTx3rYabJy8lwM5TPwZhHUml9EkZeVqCEVqbbO8PUOOKhuzEQmNJBk5S9mIAqdoZcRvodH4jk1xtrd8ZRcvdePLIDE71ScaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng0QNVrSm0Ki/6FKnl3FFKyNg6tU78Huypj3yPYPuwo=;
 b=B4vuBgbCRb8oeReXjDuoibBoZ3AaKyX0yQmjDxo1N9j7fRSje59HCcPvedSqET9cQY9tEX4vaveWG9z+vVt5MVjIOUPMPiFw9C37TNLpPuQyExw6L+3bx03+RMc5uvqxSO/EyhkkVxC1aRfevE8kQevipNRUeWborC99AHNG2ZbWK4LSTT84YrhBp2fxn1Xn04gJXuAqPa+fShXcFmYDVKT37o5vFT5pNnY7qyy7Q13OareDrlXYx84pR/SIQ20lnGhvWtSXGH3rce743V9MTL0Yj0IH8Krk/rfuJ5gX4aj2THyG7IFcle8P488oVjAywV8+Z64aaaVRqq5kxW5mkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng0QNVrSm0Ki/6FKnl3FFKyNg6tU78Huypj3yPYPuwo=;
 b=GrVfHxECT0q4VgBZhdqr8488a64GiwgflrdzpKK0NvECh5q2cpcylxQerCtRa+KO6+oZIVX0k89QTPxp7epaG9zpg+rBKN1YfUqOl3fC496wf/H6AVNoFHllrDvsequ6hlyymW9R1lz7JHu5YXAGTl5xtNXNTXed5xUd6BoGiyKcuLH23OCVmjVrLk49dl2qEIdNahs6wRH6fuZZvuL5abS7j8qTP4/QmLukBCmbDorUhZtozHqQtSlCxbp17X/CYhz0GKutNKpJJYkr+lOE7l+A2QrmBsVOAdDFG8d+rGGcMXqyRlRM3+A3LlcYA6Ba/nZhFg/pcQROUw3nZ4trXA==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY3PPF346C5784E.ausprd01.prod.outlook.com (2603:10c6:18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:34:36 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:36 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/4] ASoC: qcom: audioreach: exclude headers and padding
 from PCM format sizes
Thread-Topic: [RFC PATCH 1/4] ASoC: qcom: audioreach: exclude headers and
 padding from PCM format sizes
Thread-Index: AQHdV3UyL1+tiq/5FECqpHOSZWICUw==
Date: Thu, 8 Oct 2026 22:34:36 +0000
Message-ID:
 <SY5PR01MB10600A8D99FD6B9C919B075A1A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY3PPF346C5784E:EE_
x-ms-office365-filtering-correlation-id: e7f84403-1de7-4fdb-4081-08df258c552d
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|8062599012|19110799012|31061999003|8060799015|25010399006|25031999004|15080799012|41001999006|38102599003|24021099003|102099032|2607281247196008|440099028|26104999009|3412199025|40105399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3/HCn5GlkOEMvWwOQ08MOe41szh4/BmP2lOZHV6UGpyrrFHn/lKTrl7/HT0N?=
 =?us-ascii?Q?glUT/ZFw8+SAbKXVcP0VJMAGvvbp42ooUc7FnyGjlp9lsuzgA9wgbw1R++zS?=
 =?us-ascii?Q?CGbEkJETN4RmcCVaIdnxofIBIRR2OnufYRYIpRRd+dQ9nxo+TUBfkVbeP6T5?=
 =?us-ascii?Q?mYFMKkkQQ1RePhrouvLny1n/KuG7+LkWNAk06xSIFTs5m1r/hJZILMyBJAZe?=
 =?us-ascii?Q?aRd3gQ/3egKZzf5PLO7E1dNSJsQV/6SpQ0T1TlkXnYy6W6m8lrm2IP/LFP2i?=
 =?us-ascii?Q?mKI+lfj+O5iMUIc8PNCVSvOngQtELSS0pmzIpEA/bWp3t9VwBnQXUmQ9GLes?=
 =?us-ascii?Q?CivFyqWPzJc5GitCt+9dbSVAkc2vHuLvhlU8ZmnJapkKyu526Or2gUZfq9Ss?=
 =?us-ascii?Q?lkUAlMrYGzgwsV7UR7ssqQ45MZrtRSTN9yZiLqt/xneLiuHN9XXHlsQviJxv?=
 =?us-ascii?Q?EJaY2TqSpszwwLPJ7V6KMKmU5pX8DzMyDrlLSOghY49Qs+UdckdDiKsqwc6y?=
 =?us-ascii?Q?CjZdH3GzVi3pkK5pjlZN40h/tT+388gYPQF7uiNW4wgJ9fTavyN37ZIpM/vY?=
 =?us-ascii?Q?oArrr6RZfKCxIvXdXzN6IsKZQOMI7w/KG35EkFHR/sUy3VXqOumSVzGBGatP?=
 =?us-ascii?Q?oB3u1CtxldQMgjGb4yO4dbp5Rg0IUTNHnj7mkI03nemW7ic3CNXHlkvbUsSu?=
 =?us-ascii?Q?benvBLc3FtJtadBMKbrX3UI0MnIvAMSVwRQophVrS7xRjs55FNsOEwevbsIz?=
 =?us-ascii?Q?cNxNeeomY/ct00m4PAuCyFPZ5IBY5SjD8nKqPv6pSBN+TKxSA10cKNvSk68y?=
 =?us-ascii?Q?paZ/ARWQYWn3N9XCLzsbmCjDTwEk2FJto+5omGT+tPOVGOO4eveLVe9LaWz+?=
 =?us-ascii?Q?mUUYou8qKkFLNw3qnQUxH8bEf8/IEEaekNQ5hjjr3uSCQZ77TG/AUadmcWX5?=
 =?us-ascii?Q?Zwnu9P2SjBqROQwpV8F+Giqg/4cxFKJMbVKeuTEuVNIZMq1p1GrCPTJO8WJS?=
 =?us-ascii?Q?ijveFbDlqKiG3kJoUP2wgpP5ow=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gIwiaexis8SxIS6oAkuPxCpJc8pNcRWSLbpkMcfD/XyKQSHjzWn7dOA+ZP8s?=
 =?us-ascii?Q?v24PB77zw19L4cySTULIqQsnzB3Sby//ROJIxznwPTCci1yAN5l90zMdpupL?=
 =?us-ascii?Q?QNI8AOhGS5wBrrSpqZnSFoWsx2FTLgO/sctlC5tVMN5/eG8Jr3j1a5Y8Ftau?=
 =?us-ascii?Q?PHYYbChiNtkomDJmKrtTeSp4n2agQk+Q/6UQSVIEQ9RNsemabGrD2rfLV2I4?=
 =?us-ascii?Q?qA9vfR74ak6rTPo/YpfBpFSj8hoCiIt/fx6G7UDCjjmmvYp8DGtvUQz1d5qZ?=
 =?us-ascii?Q?Eyykkm4aHGMuBZ2x1gr6Q5HDjHTfep5n+eoqsSpREgdtW8EmVcr9hDfPHH0w?=
 =?us-ascii?Q?u05e96L60Bt3dv2lqkqjHNfmxkG2E7h73uxhRKXHvr2O8pBWf+opgNf0n+8a?=
 =?us-ascii?Q?wmKFTApPTa9YPgvZSDYcn8nQAqoB8aZcGLvlBOBmT96T17cONMTZX5j+gpMR?=
 =?us-ascii?Q?uCrXibmTn8EgsH3Gko8AD2WwioHnRN5N2e8PcvY2XorEnz+Ufo4HlhTdmuEU?=
 =?us-ascii?Q?jutDDa5R8T4Nttd7iLKa27CIwjS1TX/cbLErC6e0sYdn75c5u4DC6/rXZ4GA?=
 =?us-ascii?Q?cyfGc074eZqWutiwlhfb05i3YJXQZsjFpWUybQuVLI6GGKc5ymVtRLDvvUmT?=
 =?us-ascii?Q?XmDS7VYtYK04J1YUpagGcBi5iY/x0/ZECHBFNGewkl2msLQU1V0nkQ82ZEhv?=
 =?us-ascii?Q?gZR5MiUdDw/Rnr/xzwygbu1BGTZG+UqB+JhMYMJhRyEc+vt2w4X+P2UEdNf9?=
 =?us-ascii?Q?wdQJTlgihlrRKQlJeD+VrfGDMOCHLE1m25PJINWtyNUf2la0w1Fuq+28Jhuk?=
 =?us-ascii?Q?q2ELGJArzjOeUqb7B4B43IbDGMX31URk3qQ5rjDrdc7j+DeSwZ1zx3WvhPck?=
 =?us-ascii?Q?sFm8DBesh5u4TL5gqVCf3QIan+Vzqkp1s7hNjS78fk0NiAW5GhJt40vqDB2W?=
 =?us-ascii?Q?8VlnRho4gZiDYIVxFjcPON1eqMigLE1khKSRhHDjxyvfTOBxKzx/QqClglc/?=
 =?us-ascii?Q?R0JSpN7Dj4yfRKcdFoLJp/jOBVYRxhBQTfYiRsoz5tdmORtrkxyfwsAGfoAO?=
 =?us-ascii?Q?/FiaPTLDsZRc4NLx3MWzd0jmYJy0Jw5Z8ut6p6WlWW8VlijdzmWZbVSknziL?=
 =?us-ascii?Q?IU7tDwC9miu2hpaZz6p6zv/078gCla769PiQ3bTjhwpif27RB9vQrC4bTNnr?=
 =?us-ascii?Q?dTR2I5LNRDu0olMYHdXKeBR2tqbmPCn2SH4QKT+Ainbt0DrTPBLLqthBydBp?=
 =?us-ascii?Q?DwgilZpQQK+lBOVBX5PmcQcsavJsd6HPLy+ex+gsyWSvF2wWH0nKH16AikXZ?=
 =?us-ascii?Q?1UZb7TGq0RXHgCqhBq0inoTjWpSz2aymcJPWWw9T1mOGWJouROrDmLenkiFb?=
 =?us-ascii?Q?K+oNgOKrpyJ0M6Yy1+7mz+NvM5l9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f84403-1de7-4fdb-4081-08df258c552d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:36.3355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF346C5784E

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
The media-format payload length excludes its preceding headers and=0A=
alignment bytes. The shared-memory PCM path currently counts the APM=0A=
parameter header and padding; PCM output configuration also includes=0A=
alignment bytes in the inner length.=0A=
=0A=
Keep packet allocation and transport alignment unchanged. For stereo=0A=
PCM, describe 30 bytes of parameter data and 18 bytes of PCM format=0A=
payload. Reject zero channels before allocating either PCM configuration=0A=
packet. Preserve the target's physical-to-logical channel-map conversion=0A=
and compressed-format serialization.=0A=
=0A=
This independent draft targets sound.git for-next=0A=
62d9f9ffdfd44e88010412bf8f23732f0a93a9be. Public Graphservices=0A=
format definitions, stock packet observations and actual-function tests=0A=
support the length change. Earlier tests and object compilation used=0A=
fixed Qualcomm 7.2 source. The three changed objects now compile without=0A=
warnings on this exact ASoC target with Clang 22.1.8; this target has not=
=0A=
been hardware-tested. No proprietary profile, calibration data or=0A=
Warsaw hardware setup is included.=0A=
=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audio=
reach.c=0A=
--- a/sound/soc/qcom/qdsp6/audioreach.c=0A=
+++ b/sound/soc/qcom/qdsp6/audioreach.c=0A=
@@ -1185,7 +1185,7 @@=0A=
 	int payload_size;=0A=
 	int i, j;=0A=
 =0A=
-	if (num_channels > 4) {=0A=
+	if (!num_channels || num_channels > 4) {=0A=
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);=0A=
 		return -EINVAL;=0A=
 	}=0A=
@@ -1203,11 +1203,11 @@=0A=
 	param_data->module_instance_id =3D module->instance_id;=0A=
 	param_data->error_code =3D 0;=0A=
 	param_data->param_id =3D PARAM_ID_PCM_OUTPUT_FORMAT_CFG;=0A=
-	param_data->param_size =3D payload_size - APM_MODULE_PARAM_DATA_SIZE;=0A=
+	param_data->param_size =3D sizeof(cfg->header) + sizeof(*media_cfg) + num=
_channels;=0A=
 =0A=
 	cfg->header.data_format =3D DATA_FORMAT_FIXED_POINT;=0A=
 	cfg->header.fmt_id =3D MEDIA_FMT_ID_PCM;=0A=
-	cfg->header.payload_size =3D APM_PCM_OUT_FMT_CFG_PSIZE(media_cfg, num_cha=
nnels);=0A=
+	cfg->header.payload_size =3D sizeof(*media_cfg) + num_channels;=0A=
 =0A=
 	media_cfg =3D &cfg->media_cfg;=0A=
 	media_cfg->alignment =3D PCM_LSB_ALIGNED;=0A=
@@ -1275,7 +1275,7 @@=0A=
 	int i, j;=0A=
 	void *p;=0A=
 =0A=
-	if (num_channels > 4) {=0A=
+	if (!num_channels || num_channels > 4) {=0A=
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);=0A=
 		return -EINVAL;=0A=
 	}=0A=
@@ -1301,7 +1301,8 @@=0A=
 	if (mcfg->fmt =3D=3D SND_AUDIOCODEC_PCM) {=0A=
 		header->data_format =3D DATA_FORMAT_FIXED_POINT;=0A=
 		header->fmt_id =3D  MEDIA_FMT_ID_PCM;=0A=
-		header->payload_size =3D payload_size - sizeof(*header);=0A=
+		header->payload_size =3D sizeof(*cfg) + num_channels;=0A=
+		param_data->param_size =3D sizeof(*header) + header->payload_size;=0A=
 =0A=
 		p =3D p + sizeof(*header);=0A=
 		cfg =3D p;=0A=
