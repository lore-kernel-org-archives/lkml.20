Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501883E9F93;
	Thu, 15 Oct 2026 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042161; cv=fail; b=jW4k9bghsti68zQzifk1N7ozmyl94v89AF0xKSXkAkrSRo3ifrMTwjAd3dLLcXtzGf9PP1gxkZXbr7bSuEX3IVyd7ktU6aIXwkmPoK7HkzqY62tdsqIeal8HN5XHjAqZ2pHYaRlJ1LRWwHjuEwZ5yh0vYj1xKQxWKGExSScAv8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042161; c=relaxed/simple;
	bh=YrJIgispiW7VMVE9wNRylXyxHYo33en0CkB+5CjM4xk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eSUHtUJoM5MsRAxMWQiTqDMGkzIe0YtHM8EcX/O8S634VOxpHIRIIFetEQl5HUtRPqshNkAd4oVa/s7U00mJJaKHZ0OuWWlKHQc8fzXHEBX/8a1cXj663ITHmSE4YI+rwcTWg0BtsvLhaDpSDIRLQ4K3hMf0BTmPcekJ4ViCgOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=k/q1rLp0; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="k/q1rLp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXV4CXx/iwUCtfIcMZ2L6Ty9ZAJ5/IgpEzNMBKOHHOEvJaj2W63JiBWJrM9OWdFmnw7rvVuiDjXc6Rc9735QAgcFXM0D5F2aSrvrgKPktVY9p7I42d1zqU8G4zS9Wvzfu97882rKqT5mj44WqpnJKXyV8oD1F7+jADJSgmn8uJiwg6WzxaYEz3LQOGp5ug3l0EdHWmtivA63JGOAgrK+MoOZRcb3KTeG5WXjNXyhit7jmjIDj4BEAmjeBEfCfPRwHsYYB9AkzpvNlTNZUyCYxlLaPWsQvkiHPFOf8fdJwdmFtXTggk/Y33ZXwgR3NQDcZ18mhu3m+PM+j3WqaFEIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKVkivYvZ/E1s/T4b7Hhw4gj/TikdzxHqlrSdKExcqU=;
 b=w5p+TjBeBko2nIJLvRj13iXhVd/denuoNTOXvtSiJbOHJETSzVG5/BbxoP3ot/9eAb4Xg7+Qw9HbwHk4siUyLvzfo5xzzk8vy5ONkwG/LWAzi2LWtc9zG36XcnM3Bkm5417owHxe86+BCA4xnWiFOyVfoWg9F0lhfI7i0aN9a0NpG03PqtGnjhKUooEBHvpaznlPCEkkOq7psgTgpxkuQOQctN0c9a9RugfEoJycNbOgOp9hlhpB5uvm0bWFpuc9y0gZAtqcGsLvTeyITnxeiVmDFIm0zUer3VAEvo1o5r36ZcF1xbWrr1y1mpTTE91eXxbVGnOJLplU6AanBTpVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKVkivYvZ/E1s/T4b7Hhw4gj/TikdzxHqlrSdKExcqU=;
 b=k/q1rLp0n95XvX0ykJga5Yo0rmER4yPCKnZund9oEm1CZBDfG7F8cEhS8Sr1EzdJ2T3dmEJyPqP3OWN8v/1jFQ71yoAl2TmRdOyfxhgyQ+8oEnj+GeSccccGZkSr7GzFS+pRowix4iLLV9sFEF3AoxSnJ/MK5+anW9y1syZ5zjAoaGM7xComuiVqNWHTGxHmUpp9+dqYPCHhzmoHgPKqgVMarQLgfA5w3vwjLok92VNeqA9wM0nNFtmHZNOOrvAMPY+zuQD9Sfzne/yPV8z6ERMIO3ntyfcjwceJBWNRnlYD7yJdcPPRVA95ygGnn+/Lr1DMTkm1C5wdiEOOiL2AJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 05:29:16 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 05:29:16 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Ahsan Atta <ahsan.atta@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v7 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Wed, 14 Oct 2026 22:29:10 -0700
Message-ID: <cover.1791975002.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: ba98b48d-90a4-47cd-2550-08df2a7d4167
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|7136999003|55112099003|10067099003|3023799007|18002099003|921020|261009223027099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	vKDWFdNF5IkoA7idBQjDjeyEjkjONdqQOxv9HugVb8WztvLrB0APauqBIxRjwVj1CLVzxR0jx7Wgxk3trGUOFbWxnNL+hWa/8VOYwRHXbWxtfGG7vJvAys5rJuYV+qjp3JTnapuPPhhWhyfbi8ueDdkzFZj4nt1wcZuuZT9skuACN7jrGtqjiJLdOewGlFRbOXBjdSCzi6kzmttnoFRKDkupjMu4YWys4x1+0j4h6g/eZWnUTmEQSNXX+/WFJv3as1doM+g9SxMsd8oHBRj6qYDqhzNvpUc0X96Uy5lFptTWCA5Ii5sM8OowxwMcTWmMO1qPFSxIahyIkcIhPl+ch9rjrGxdECY8x+cJU29ENK0kNC4/lftkYVoOFsS16AuzqFA+WEUWUYGWuOOJAb1nmJtsxSV6eufv5Fa8C0J02df9NEKr7i0IpJ4YuXYCEaDV2u7Yo/TATE2sgWjUfGrqsRqowJSwtMU0mJv9NsnGokv0aHbpgoGxhaoz6G29tr9LPYtHCFTOLye7Rw58mGn64+HdXUobD9rcsHSeemhgLF+axBuRCOboILN0gmf7UEhymyGIFTmVp2YS9Umg6KCs4yKWOS6LMZxVMPxb1HhPgnOMS8GyWfViKX5i5bKJs1dq4f42k9Ui6QJ6qn/OJ+i8LX9wyIf+tCEH+Bk286H5f0RpVsc0XI9D6s0c/eSuZGXUGu44wmjcY2feh8aiLDCB7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(7136999003)(55112099003)(10067099003)(3023799007)(18002099003)(921020)(261009223027099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6j65+mie2vt4bC3JyVTBHYZeRGXW/SPJA+Xtabd76U1519df3HdgCnQyOcy?=
 =?us-ascii?Q?iM9upRoeIsd060y/Bu6tBANCsdgXF85QeNbAEO7jUcQEO2+ErlIufO7wUNJe?=
 =?us-ascii?Q?bFcNA3UFIsD75aN/F1U4A1I5wsjdUemtYGZ56SLPBe7Kl4MHJAbnSy3126BX?=
 =?us-ascii?Q?NRvQz6O0ufHH4/M3LGrJwCqJod0FmO9f5QXTsABOlU1Pxr/KyW0FjirbO2Ms?=
 =?us-ascii?Q?DOVvHCGU+6CO7KXNtZEb1e/MpkRC54lTKmz5i1Uq+EgZyjyUPcvaSNMi0Glv?=
 =?us-ascii?Q?KrplCp7rPqFOWaeiLn/ghqYUD/PDpdsbdOXFUKmiVkwNk8ac8cNHoozdJodf?=
 =?us-ascii?Q?iWiwKCSDmP6cvI7GbHzeWYdnVxzCGw4nFETEZNCRkcO4pR9M0vmLBw1mhO7g?=
 =?us-ascii?Q?xrrGncdmvIDl3izg96bxUKjMvcTgBprhXgKNdBg0txX6VWtEWczhzI3ADTCN?=
 =?us-ascii?Q?ywOeSX7/gvViCEEJPXPHC96hT4vC/WNtwvQi8od/oZxzJejcCZec159lgvIe?=
 =?us-ascii?Q?CP5cYuACvVDUrXk7NMT8pd0hCD0i3ntEwX7mnfWlOLK9HWANfCL8NsaPe6fi?=
 =?us-ascii?Q?yviJdF348cjy8J0m9jnM5jfdy7nk5LAxY8yWOMsFAnAT6VLMcUcf6KwNwcvo?=
 =?us-ascii?Q?xwsAE9G4RiY8C+UAkda/6Oeo7H48PMBmKVbpgN0/u6MgSOCkTNyhQtXXpk9u?=
 =?us-ascii?Q?YilRpI6Bf1NuAewbU8sGatL1QJXFRoFjLRKFW7PAL8XklH6TdsUFdaTl+ja+?=
 =?us-ascii?Q?kqngz/SZsRUaZ1R27/uf+szpEmhTQH+8huHAoSxuP3ANyha4+e/3Q8UjVHXp?=
 =?us-ascii?Q?gBp2cVtGuTF4oHhR/sfoevnfGS+xGB2AmZSMgIDtPFj5gOH300S2CZpvTlyt?=
 =?us-ascii?Q?c8PECVc9bbyuORWeLlYmYUhlXmX/RTsGIjSZt8cUUGmLtyhILOy/+yiPGwID?=
 =?us-ascii?Q?hAhiN9rir8iOL5S0jY3hNkVjK9lkLzX3r+562tSPwTylZAbSYesjdbfaCYrt?=
 =?us-ascii?Q?fbgZGlpQ7OCq2SvsXlbZqAci4GLzfP2TlBu5po08eMED2CU9qDZrydhpcErB?=
 =?us-ascii?Q?/hER7sbgZbaaV7WZWkV229+yzRXxMnzrvWtSCcxG5JOMqbp23gVqN5mV6+i9?=
 =?us-ascii?Q?C5RKsJZGgWzxOJ/RPeg8z8Bt8MiMN9whQa1QzjHV0jH1P4okr/DXeZyunL3v?=
 =?us-ascii?Q?EM80wnMKjljkWQKN7WEL22SkkEYU/HoqA7ltwMldsGb5NO0bgfAmRXnHRd1T?=
 =?us-ascii?Q?HW+EF+0kT4KkD964kVRF+2Q15GfXPMUhXTM1MSbX2gc8VZfjZATl/Cm25udX?=
 =?us-ascii?Q?cJCtMGFdiNxyMi6tvi1axD3GlW78K4QnwA3qQz+D9Vcoz+EXm5GENdNwAAkt?=
 =?us-ascii?Q?YNPvPI+QhzNtzAbcarsrx9hv0wgKiX6P4VAbI3nfj1O2oaFljOof5pkVArvl?=
 =?us-ascii?Q?xaLIczJrUKCvy1VIxtoDBDezJ1K5BYmpjhp5/o4PJ7o3Ffh8aT8DNzq6eGIe?=
 =?us-ascii?Q?ne/abFR+a68BjNRjsaLsXAuj9rTlfR7rDNN2hU58c7yHRfiM/sApfQZRlura?=
 =?us-ascii?Q?qsB8+ZDhL4nI4tCHkNNeiv1rpgBpyweGPGsJVU+c9wgDLmyo5VW6Ga+y1pIv?=
 =?us-ascii?Q?urM7/aPLPjF3q1lTGhtGMWR4hijmbA03wqY5Gf5UffjBUodhjvXmx2ONCKUV?=
 =?us-ascii?Q?s6E3+xPSfpsjCwMd0Om2dJZ7hPb52w6eicE0eZpHh/xfspARZDT8p5wc+X1x?=
 =?us-ascii?Q?Kpryn6J3quHiWVZto3OrAiL1dAPre5M=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba98b48d-90a4-47cd-2550-08df2a7d4167
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 05:29:16.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SNuH/mSOGq2URLCbVnG4g08WBmRYLlOXPW/BSM1tBU3+eSPoR6H8mqGsZAv72qlqdYGeHaBfFhktFbIJlDJcNEFJQhfz3aEmPDdzwI3Zmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602

From: Hang Suan Wang <hang.suan.wang@altera.com>

This series adds Linux support for one of the Altera SoCFPGA Crypto Service
(FCS): Secure Data Object Service (SDOS). SDOS is an Altera-proprietary
service that seals and unseals arbitrary application data. FCS is a
runtime cryptographic interface provided by the Secure Device Manager
(SDM).

The SDM is the hardware security controller in Altera SoCFPGA devices. Host
software reaches it through the existing stratix10-svc mailbox, which uses
Arm Trusted Firmware SIP SMC calls. This series does not expose the rest of
FCS (RNG, AES, SHA, key management, and so on).

SDOS protects data at rest. The SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key that never leaves the secure
boundary. The host supplies plaintext (or an authenticated object) and
never handles raw key material.

SDOS requests use the stratix10-svc asynchronous SIP SMC path. Source and
destination buffers are allocated from the service-layer memory pool, and
their physical addresses and smmu address are passed to the SDM. Each
request opens an SDM crypto session, runs under a lock (one in-flight
transaction), and closes the session afterwards.

The obvious question is why this is not a trusted-keys backend or a
crypto API transform. There are four reasons this feature cannot fit:

 - No key handle. The key is derived inside the SDM from a device-unique
   root key and is never set, imported or named by the host, so there is
   nothing for setkey() to bind to.

 - Object format. The SDM emits a firmware-defined container: a 40-byte
   header, the payload, and a 48-byte HMAC, with the owner ID carried
   inside the header. That is not a generic AEAD output.

 - Size. SDOS seals arbitrary application data, from 72 up to 32,760 bytes.
   Trusted keys exist to wrap key material and their payloads are
   bounded far below that, so the keyring model does not fit a
   data-at-rest service.

 - Status reporting. SDM statuses 0x102 and 0x103 mean "decryption
   succeeded, but the key is outdated or should be reprovisioned". They are
   successes carrying a warning, and the warning has to reach the caller
   together with valid plaintext. Neither keyctl nor AF_ALG carries a
   firmware status alongside a successful result.


The series is organized as follows:
 - Patch 1 (prerequisite) enlarges the stratix10-svc SMC argument array so
   the asynchronous FCS SDOS command can pass its full set of parameters.

 - Patch 2 (prerequisite) extends the stratix10-svc service layer with the 
   FCS command codes and matching SIP SMC function IDs, adds the Agilex 5
   (intel,agilex5-svc) match, and registers a "stratix10-fcs" platform
   device that an FCS client driver binds to.

 - Patch 3 adds the FCS driver implementing SDOS encrypt/decrypt. It is 
   exposed as a misc device (/dev/socfpga-fcs) via ioctl FCS_IOC_SDOS. The
   crypto session is opened and closed in the kernel and is not part of the
   user ABI.

Testing:
 - Built for arm64 (defconfig + CONFIG_ALTERA_SOCFPGA_FCS=m).
 - Tested on an Agilex 5 SoC FPGA board (SDOS root key provisioned).
   SDOS encrypt/decrypt round-trip; the decrypted output matches the
   original 32-byte plaintext:

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' secret.bin
   a0 73 85 7e 63 5e 3b 6b e4 09 ac 3d e1 ef 07 4c
   5a 88 6d 16 d0 9a 96 3c eb 56 14 be dc ab 56 ea
   ee db 07 1a cf e2 55 41 dd f6 64 c8 70 5a c7 9c
   df 88 e7 49 fe 6c 23 8a ce c6 23 8c fc 21 2d 14

   root@agilex5e:~# ./fcs_client -E -i secret.bin -o enc.bin -d 0x1234 -r
                    0xabcd
   root@agilex5e:~# ./fcs_client -D -i enc.bin -o sdos_decrypt.bin

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' sdos_decrypt.bin
   a0 73 85 7e 63 5e 3b 6b e4 09 ac 3d e1 ef 07 4c
   5a 88 6d 16 d0 9a 96 3c eb 56 14 be dc ab 56 ea
   ee db 07 1a cf e2 55 41 dd f6 64 c8 70 5a c7 9c
   df 88 e7 49 fe 6c 23 8a ce c6 23 8c fc 21 2d 14

---
Changes since v6:
 - Add proper support for the two SDOS address forms required by the SDM:
   pass the physical address backing each buffer separately from its
   SMMU-remapped IOVA.
 - Resolve DMA IOVAs through the device IOMMU domain with
   iommu_iova_to_phys(), and reject physical addresses outside the SDM's
   32-bit addressable range.
 - Allocate FCS service buffers with DMA_ATTR_FORCE_CONTIGUOUS on the SMMU
   path so their backing memory is reachable by the SDM; track allocation
   attributes and use matching dma_free_attrs().
 - Mark only the FCS service channel as requiring physically reachable
   contiguous allocations.
 - Rebase onto the current upstream stratix10-svc implementation and update
   FCS child-device registration and cleanup.
 - Convert FCS core logging to device-scoped dev_*() messages.
 - Update the MAINTAINERS mailing list and Makefile placement.

Changes since v5:
 - Drop the exported fcs_alloc_buf()/fcs_free_buf() helpers. fcs_sdos_crypt()
   now allocates and releases the service-layer pool buffers itself, both
   under priv->lock, so a pool buffer can no longer be leaked when the device
   is unbound while a request is in flight.
 - Stage user data through kvmalloc() buffers in fcs_sdos() so
   copy_from_user()/copy_to_user() run outside priv->lock. A faulting user
   page can no longer pin the lock and block device removal.
 - Read the remaining 32-bit mailbox results with lower_32_bits(): the SDOS
   payload size and the ATF version error status. Both still cast an
   arm_smccc unsigned long through a 32-bit pointer.
 - Document struct fcs_ioc_sdos and FCS_IOC_SDOS with kernel-doc in
   include/uapi/misc/socfpga-fcs-crypto.h. The structure layout and the
   ioctl number are unchanged.
 - Add Documentation/misc-devices/socfpga-fcs.rst: the device node, the
   ioctl, the size ranges per direction, the errno table, and the
   0x102/0x103 success-with-warning statuses.
 - Explain in this cover letter why SDOS is a dedicated ioctl rather than a
   trusted-keys backend or a crypto API transform.

Changes since v4:
 - Read ATF version words with lower_32_bits() so a 32-bit value in an
   arm_smccc unsigned long is correct on 64-bit big-endian.
 - Keep the SDOS payload size when SDM returns 0x102/0x103 (decrypt OK,
   outdated key). Those are success-with-warning; still return the
   plaintext.
 - Release the svc channel in driver remove, not on last close, so unbind
   cannot free parent channel memory while an fd is still open.
 - Guard fcs_alloc_buf()/fcs_free_buf() with the lock and a NULL channel
   check so they do not use the channel after unbind.
 - Always call stratix10_svc_done() after the ATF version query, including
   send failure, so the sync svc kthread is stopped safely.

Changes since v3:
 - Rebase onto current linux-upstream; register stratix10-fcs beside the
   existing socfpga-hwmon child device.
 - Drop context_id from the ioctl UAPI; the kernel owns session and context
 - Make FCS state per-device and kref-counted so an open fd can outlive
   driver remove (-ENODEV after unbind).
 - Copy user buffers in the front-end; the core uses kernel pointers only.
 - Use kzalloc_obj() and shorten comments.

Changes since v2:
socfpga-fcs (front-end):
 - Replace the sysfs store interface with an ioctl character device
   (/dev/socfpga_fcs) using a fixed-width UAPI struct and
   compat_ptr_ioctl(), fixing the KASAN out-of-bounds read and the
   32-bit incompatibility of casting the sysfs buffer as a pointer.
 - Add include/uapi/misc/socfpga-fcs-crypto.h and register the ioctl
   magic in Documentation/userspace-api/ioctl/ioctl-number.rst.
 - Add a .release handler so a session is torn down if the owning fd
   is closed (including on crash).
socfpga-fcs (core):
 - Manage the crypto session internally: SDOS opens and closes its own
   session; reject a concurrent open with -EBUSY. Removes the
   user-visible open/close-session interface and session UUID, fixing
   the session-exhaustion/DoS concern.
 - Harden the async poll loop: keep polling until the deadline and
   always call stratix10_svc_async_done(), fixing the teardown
   use-after-free from the previous -EINPROGRESS early-return and the
   needless full-timeout block.
 - Clear receive_cb only on the synchronous send-error path so a late
   firmware response cannot deref a NULL callback.
 - Set priv = NULL on all fcs_init() error paths so a later probe is
   not permanently rejected with -EBUSY.
 - Read the SDOS owner ID with get_unaligned_le64() for correct
   little-endian handling on big-endian hosts.
stratix10-svc:
 - Enlarge the SMC arguments array so the async SDOS command can
   pass its full parameter set (through a11).
 - In remove(), unregister the child devices before
   stratix10_svc_async_exit() so async_poll() cannot race a freed
   handle.

Changes since v1:
stratix10-svc:
 - Forward result registers (kaddr1) for OPEN_SESSION and SDOS_DATA_EXT
   so session ID / output length reach the client.
socfpga-fcs (front-end):
 - Publish sysfs via driver.dev_groups on the platform device instead of
   a raw kobject under /sys/kernel; callbacks now get a struct device.
socfpga-fcs (core):
 - Convert completion timeouts with msecs_to_jiffies(); drop TIMEOUT.
 - On SDM-busy timeout (-EAGAIN), abort without async_done() (no id
   reuse) and return -EINPROGRESS.
 - SDOS: on in-flight abort, leak s_buf/d_buf instead of freeing to
   avoid corruption from late firmware DMA.
 - Validate the caller UUID early in fcs_sdos_crypt().
 - Enforce single instance: -EBUSY in fcs_init() and priv NULL-guard in
   fcs_acquire_cmd_ctx().
 - Drop the always-zero platform attribute and fcs_get_platform().
 - Set/clear receive_cb only around the synchronous send.
 - Use device-lifetime priv->completion for the async path (was on-stack).
 - Use the local ctx snapshot consistently in fcs_sdos_crypt() and
   fcs_session_close().
 - Point sdos.dst_size at priv->sdos_output_size, not a stack variable.
socfpga-fcs.h:
 - Drop platform/AGILEX5_PLAT; add sdos_output_size.
---

Hang Suan Wang (3):
  firmware: stratix10-svc: increase args array
  firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
  firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS

 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 140 ++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 704 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 296 ++++++++
 drivers/firmware/stratix10-svc.c              | 182 ++++-
 include/linux/firmware/intel/socfpga-fcs.h    | 118 +++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  16 +-
 include/uapi/misc/socfpga-fcs-crypto.h        |  65 ++
 13 files changed, 1604 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

