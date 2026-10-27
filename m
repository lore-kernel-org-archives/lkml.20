Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093596;
	b=o8rU/ZIVs2KPwyDqDo7nI1YYgquhUtMsa50Vkdt0hITCW8vd2phZZYcQ1Rd8Jp6AutFI
	 jYr0re50AuJp5Duh/OUMoei39wdx4MD8ORHXxvIh739RzsPa/CXMKS9McjzjZrwV3nTZ+
	 wd1H0B3ZTJi/b5UEMcU8PsRfMn8Oy0zwJGPVMOWJTD15V7UvH81+W0lsniwu3y8fkvIqd
	 XSVJvFrDzK927zAafOMCNeaSaSOGhtLqA+6zbX71Y4ZMe02FAOqkRH6uaRzQvPfVNUhxL
	 5yyvX3IA1pB3mDQiYR5GcjdrTi9JbwlARKp2QRg0xeTMGUl7neTSI9U9T/fhNQDEYXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093596;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=+ltp2DtZCc1WpfgzM1zSpuV86GQT8mO00eUZyWIvKhk=;
	b=3LSkMgeZCue9+XmLuG9kuohX264SbN/SyGnUwi088HnIqERDavZGB1yRD71w8u+4sVx7
	 b0TTZxZl5ISim6V3dMxRucPL4eTnna+EK6c/T7N47IXbWxN355yIS5eAiE/Reeg9z7aLf
	 jfEorFWDML3WTuI5UZyvq4ZEvRWnzEfwAolhZnwFxkUjT9PFm5xFDVmXzOrIF6KHfmuHu
	 qMqDl+zHOK2AAoRKzH5qoFbddEak+I7zPunfdp5PxwMD1JbP4CD0eViRa9tXZSvqEIbH+
	 e7II4TEzdlncVGdwYXI/JS22iySWknGNUFWJwNv95YQc5bqbESgdHnP/JBz0XZjYLBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.78
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C085606A31B;
	Tue, 27 Oct 2026 09:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C085606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuS/iQqoYvPliNxhb9Y513Y0WedxzYNiemqInnoJZ8ZwctzBPGltEm4mGAcfef1OfEsugn1Ls/rUYYG13xj5qFH4uqjDjwAu3pkp2iB9tZhHP7gQ7Dh5HuG+Td7STfgMgzMiSewow7xacjgYYaaAH9YfMbcIe5Kk+bOscH2KRk1IXGuwGdfemFdBoj0VXjEpKzLgASk8LUlyZiRGsLKajZFCOWHjE35+tJauyv5nHxAHtafqeLNLMCLE6Px+U50agNgHiM7f4Vodrl6Qv3OXAfbKF0gdJaEtODNA/5s96C9B2FfBmNfxn5nHaYMn8TuGC01kaD3W3ko/5RAoMxTY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ltp2DtZCc1WpfgzM1zSpuV86GQT8mO00eUZyWIvKhk=;
 b=agYWpZp/0ypNa2b17yZews3OxK5rPeujMeVNtagSsSTtRqVbke2RQGxnCKZzC/NQ0A5igRPNdBxCTZIny3xiRqE72LuewtP34VSb21FEn3bzpDknR0LSHSAcwVN9WiXsVZFqWDoRYzdSycwod5YHak3GUN02EKiMrEkBRo56ydMIYQX3Fmm/HOXF/FvRxyDYBFluPFqI84oXdn8qYRchHxhMVu1nReUhGwIbE0wpZ6LALcLxTR8qUthpqxqBYzidX3/G1Fbcoi0lh8qh+8sYd+4Lg0Zciv7RtzPIFSRE7NNrycZ08/pAGLDfIht06zEIjeJRfWa+G/CVgtdb9h+1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12e::12)
 by SL2P216MB1531.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:33:12 +0000
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85]) by PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:33:11 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Kiseok Jo <kiseok.jo@irondevice.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH v2 0/2] ASoC: Add Iron Device MA5311 support
Date: Tue, 27 Oct 2026 18:32:30 +0900
Message-ID: <20261027093232.859755-1-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0198.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::7) To PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:12e::12)
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
X-MS-TrafficTypeDiagnostic: PU4P216MB2349:EE_|SL2P216MB1531:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da1e847-93b1-4064-c12c-08df340d5185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|7416014|1800799024|366016|18002099003|6133799003|261026121527099003|56012099006|10067099003|261009223027099003|261022105027099003|261022075727099003|38350700014|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	YvP2b3z4Tut468CYewq/rpTwUfB4ftliMtocrmF+Ai20wpVyHacO+Rh7bzWWbaR+2h5cvLjqbRuXxGh9drHncD6PDbWZhXkVfMZyegGU13NROWn6kIvesAumTSLyKSw9L3GSc2U22NgApVs3K4sAuqd2NPPzl50gademzCqigt6F0dHsKro+YzPjjQJ0uwCPvmNdGy5Y+zE+mCiMpGkAFJL60B3sUf+N/UU3CzixOZg0asnzXRC9jOh5hsXTRISjSefyiUswcYRTK4sumRfIj8jpEE/fAv1ZHvGdL7TbNoyczlrORKaJeXXpYfEmCrcWOjn6c6xK1stdgm9UoBILLjxsAP+Uo5CXcPf7tfw4pCFJf+eIYEP2GdQsb4YJfptV31hGbOGKenijTf2o6iKDpk15XLkqr0iKKXspIPX/CrmbypVqbyIJDJqe7Tj11Q6HTUSD58/B1eHe99VbsFiL9lR+b3U9otaUthKR/rf0suUDRpCs9lNY7lEz+Fs0by4o/2uCJmHiPcA9i4gP6+pr2KQHR0ZU7s9EhMuEhS3kt2pk0ucPlL/iIscrat9inhCxg42N45QrpPLKw+bjxlbpBLSV4YOGt7knJBhi69ascIRCdpjA2pABqj4H1aet/Qz4oqXOM5b9G9OiNoZ9YAX+JWstd2qfs5thLsEmM8XTa2M7ZBf2+ZhQjoyIXNCkZM6uzmRcTAPjlVthEQoT4eC6HA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB2349.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(6133799003)(261026121527099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(38350700014)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Y5RbcP/GqnKs/j8kNC4OKrA1QibgJloUKYqk/8r85hr1FKRt0+Mf7lRYttf?=
 =?us-ascii?Q?1kkjhqT0eEr77fbQrb3fvwj9zVO6DgcpQiZ2/JfZQDNHC9brLYgEHifn14er?=
 =?us-ascii?Q?1Ag9U7pHPzjWFc9u6NZ+9b8baU5GKc6c5/jWlkSusGJTxiNNfJuPO+RXo3nj?=
 =?us-ascii?Q?4tR66cf5EWtZZdxCZpGhusGLWcMLoYCCySZHfD97QDeU7ku07UNCW9Q+gC52?=
 =?us-ascii?Q?F+8pypKTTUPboEjQzo3sPQgNsOeUCoEWNO+i80w3YacIbNX17AUhfaW+D2fx?=
 =?us-ascii?Q?Gep/VW9qZMbw5FxVmkvy/2/oque97S9QWVnuplFBYVlAXl5IWH9msN+aJov8?=
 =?us-ascii?Q?BslZHSEoXj05AB/uO45cwRWglNYP1T6VciiVzRHE8a8dFOjTTspSdZue4TDR?=
 =?us-ascii?Q?rkNQa6Db9+5KLe1yB00AMW6+TNidm9SUbqV6mXN7VvfJtYkqZnB+haeswXuv?=
 =?us-ascii?Q?CwoiFqiSRzMUI5fpt1v+HfO0V9SyH2PzCAVP83dVcQXjxT+/pdY9wJyNiuPx?=
 =?us-ascii?Q?NzMDqzBGHE0rV5LZjyhiZ60dlTDen0tet5utfN+xbrq0rvQ0DzSr06cey1q3?=
 =?us-ascii?Q?p2Lyu3wUd4hZvLG/KktVwWhHYv3xZPp92AhPRUEuhp3s0PqvANdN7JAIeygS?=
 =?us-ascii?Q?nl17Lzo6HOf+WInr9+HM+NJUYWFaMfhX5jmwUzG6KYALiqKLb1Rkio1atQ2u?=
 =?us-ascii?Q?sOfWiDpHB6GfvtJS0kDKqoez1cEp7MsL538hOiWBexzp5+Krsn+k4PRvjYdi?=
 =?us-ascii?Q?OzHykChDUqCGOU8mEvfqWKtbbK4WsS+6oNm2HfTPgME148NZ/vdOzPebpiSk?=
 =?us-ascii?Q?YIQIxQFVEBIkqa/UAqVVwdK+Yj0o3zGscFnM6v31PGQk+rzLrazgs8F9RVOO?=
 =?us-ascii?Q?2ItIPMrRmDNlXHlk5mjAiBhO5mMbqeYOoIuGkm4XCk4TTI75w+3Dxi42qBmI?=
 =?us-ascii?Q?FgAD0CySBKLnNJf4VQV5PbDyqjdLCO15QZ2agD6N1kfeP0FH+H94HM2Tvu2r?=
 =?us-ascii?Q?IXX7ys5rNMDru/lptSx14HPvBSYL78ygKYasbBzmGwA2cIM4bwRNjX5jY/gl?=
 =?us-ascii?Q?ZGdG1KtEhLXE1zilYWZnhyU58aor8QvPrcTSBpdtdL93DOAKoIc3XsqvI66m?=
 =?us-ascii?Q?iODbAeJ8tcrwnN0q3hJ5Ke+QfOnwzLA+qVIkjVohoOVq6BgJOMzz+ncqxnvG?=
 =?us-ascii?Q?GHTseuxHQzgRhYwGQYki27nNvgpMqMXh5bkESanWzAx+UYwhTrnd+vo0RnbE?=
 =?us-ascii?Q?zaJmMZZ/87nH0AJOvkpghyYbqgkwR9d59dXiML1/yLq3tI/hDmR1Zt48SCNj?=
 =?us-ascii?Q?n+n6eHs7Fw0ECB+GuZiAYq8GaKClf7dRKOYztL1V64A0mwhIdw5QAjXuNQvI?=
 =?us-ascii?Q?/sAXK7LTZWLmbj4FqhGkeuTXXIxB02ZTesQE8ull6RjQ8pW3wYZslFd0SL3o?=
 =?us-ascii?Q?qNzG1zLboMLd2xVktkFZHjkxT/SdRotx+ZIoOSxTpcLOMuWhCPx8mx/fsgb0?=
 =?us-ascii?Q?WeYw6sbeyW+SVuAnhGienQ28FG1VpU6lRrak5Nl72zvh1JhkvfJ4VRv8WSAi?=
 =?us-ascii?Q?A+C5YowWHLA+nL4acFvTgpbVyiyx15UiPkM2cAR+nM9xffPuZ8jnl+547fwT?=
 =?us-ascii?Q?EEHCvkHJplHUNi7COFnAZyYBs8d4Z6RCNSEtAVlfqK0/Bklb+IH65KyUlfjy?=
 =?us-ascii?Q?FVHXnpHznWj1Cf3HIZpJdFqfhziM/njT/azmVLnO6L1PgVLgIa3LuuKjx7YT?=
 =?us-ascii?Q?bzR9V0EB8VBRXRAc0omS9kJpEQb5PuM=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1e847-93b1-4064-c12c-08df340d5185
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:33:11.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcVnkxXv3xFudLvxhNKHCHrMNWNFFvkA9Tgp07ahQTRxZ6dQecyyMbHK8hxZX9E1js0y+h+4R0E5C0Rzbj0dEuW1DMJbIPtF9+31bqk0b0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1531

This patch series adds ASoC support for the Iron Device MA5311
audio codec.

The MA5311 integrates digital speaker amplification,
analog-to-digital conversion, and audio DSP functionality.

The series includes a Device Tree binding and an ASoC codec driver
supporting I2S and TDM playback and capture.

Changes in v2:

- Expand the hardware description in the Device Tree binding.
- Clarify the use of two I2C slave addresses.
- Complete the Device Tree example.
- Replace additionalProperties with unevaluatedProperties.
- Improve ALSA mixer control error handling.
- Add synchronization for shared audio resources.
- Prevent hardware reset during active streams.
- Simplify IRQ fault logging and apply rate limiting.
- Address Linux kernel coding style review comments.

Hyunuk Son (2):
  ASoC: dt-bindings: Add Iron Device MA5311
  ASoC: codecs: Add driver for Iron Device MA5311

 .../bindings/sound/irondevice,ma5311.yaml     |   83 +
 MAINTAINERS                                   |    2 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/ma5311.c                     | 2159 +++++++++++++++++
 sound/soc/codecs/ma5311.h                     |  520 ++++
 6 files changed, 2775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
 create mode 100644 sound/soc/codecs/ma5311.c
 create mode 100644 sound/soc/codecs/ma5311.h


base-commit: f3c7bee984aa0ba2b48a44e16a6f3ec2c27f851e
-- 
2.43.0

