Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A44B0CA0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545514; cv=fail; b=K7fXW/O/nxXw+sv9OVKXLM/Qwr1sBEzw0Q6nT2tFs4By+jhJZp37u/weYNP4Bxod5NoWzDOC/uSV56rEZHMYng3oPxrmhZ1c5b0oVtGvJM6Dc7u8SnSmS2n0njDgEHvhwKMz+yUFXdikDQ+ZPQQVMO/kYy/jpDbzY4jd6iginXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545514; c=relaxed/simple;
	bh=qnXmOz9+M8f90kFM/VVC3gS3uemeWeZdkOqwMPDaio8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Lhsc9VJkNJFlgjXoZo4GyXbQAwE88Gb+bJw8bRDA6uz3iT6hCIOgxmMaRAdaPdhaYAr8DMPtygtSU8yhvRYtYQA71nF67tzQdjRMeEb+Rxv38wlg1Prjk3uPlfMSUM9V9tVrw2rxgZt6XvR6/pghLmlLChGpAEV4O2ZXJF73Ce4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SKi8kGtl; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SKi8kGtl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+g0PQUrX/XPgQ6/ogD2dGRaJ+olUwvu7WRYtXurCS1kxmHBtHaH+740WmZ0cdzCNwCHvQO/NmY2kUgjeXy2gWLLPl8Fl6BPEuhZ7JND933Z6R9ftMn4I8EqpcMCuFybj9njYB4BmCahIy3qUGlECVN7fhX6tRtuDqGXXNIP1THC6Y5CSqGEUKh7joGxmIUqRSh/vjWrQtP0QRXRpJiod3QemFGfUnQQNUgi+G6sMpfSpQ1lTLMqrpNB1pmAA2NUQ0tNKLJVT6GMAtZBDjLCzQXIFTer8Ru6UDYlRnMYNKTj4I3HzQ7lfZdx1K18FNys4XVOwITauwkRnfrdVTqlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtQkTMnpEvjZK8yCwj5RaSIPvpCAGk/kz8m4HZ4INzE=;
 b=O11NeA/kuWQzzVoFZlaBsEKEu1tS317EhmgC0bqDJ/qAGJgCgmx+QtOkchxZLg2YldAf7uv5bOo5sl9Xmeybkv/C+4xABzvrJIgqC6ZZiKBNewGx07aDOAOcdXspqD5+RnLazKl1o3u/wXsqN8Na6kv00Z3UE9B6VEveaP/JBgnElXssMp7tf5UYTjBBuXfaDdoZWlcM4tJu3uuSjyNpXsDzePnkPnlmfQoIcdo0JPqhGl78RS5CXrnKzIS3Mn0NsNvOFwhaWGaRpiPX9h1/RqRkMh5QPxQensPTqS5IpRA0uSdkXZ8F1S0f/4K9NR+sYOBrWIxkFus7G7wqd1SYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtQkTMnpEvjZK8yCwj5RaSIPvpCAGk/kz8m4HZ4INzE=;
 b=SKi8kGtlugQHS2bb6Hh5KPqFZkkjzYNW1+x5xIOHl5umDl7fXVPiAKsqanP6wMmV1pRUhGYoWn1B3zbdlyZIiLAQSUVLWbOsAyJ2EGJE+yvZ7pCxloouXxFJNIwDfRoJzBF+6wy1bbOf0xr3ngVFvjVkxESORR0Bl2rgqKx6NLQhciY+EDYY21mstG2lGwXUhNfOxmJMnWbg0GXgPyNSZBnOuvs0EbHb7yrB41i1mL4R53o9+uR7xt8DwoqU1Ura/YiNy19kMNSd6j/pvg4rXKDZl/4dUPIDdm3YQnxoNtRe9zVuOsrSr87buFDKDShIE9visgGWrCshjF8mD+Prxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by CO6PR03MB6228.namprd03.prod.outlook.com (2603:10b6:5:35c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:11:47 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:11:47 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v4 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Fri,  4 Sep 2026 11:11:41 -0700
Message-ID: <cover.1788537447.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|CO6PR03MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c1080d-4a1b-47dd-1764-08df0aaffc1e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|7136999003|10067099003|11063799006|55112099003|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pWOKuY4xNyw/qZPmFSSgnNUzTUezZm2zj3X2bJ6k6fTMheAb9Y1ewQW0PLmmSO4HZ9KowREENVYhtOTotvHzKla+6rxHSoWw302lf2PLEIIS3X2TZhgBkNXgoZmp3sdrOsyD4QUW3no4xFdkWFekSIPYmiUUjEgyMM8FSGIDvsOzXxtqbOmhV8ndI7UF2X5CJAcX4a/KQmFwK0SBPTy/fMSBT7Ir61UlM9GSWsyTh8xyS2jxCH4ezGQxbamA8Y0x1TwEA86RJpBQm9CO/BfQxDYGwi6gc50MrCq4n/iBYC76T4bWsWDr6FpN3a3TYeg9llT06UVufI4D+4xayfcZpLJ8aDhm9UlmnMdR+qA9a1+FTS4shQVmYnm6anstCaLJdpnDLwGg7VK76FcRfPLQjtZZt7Wpb3ad7Cz+kcXjYfJ5V8vGs2AEBvYkp6Tg3mVJ0ZtP5LGVnVLQViayBqewheOo30L9D0djI/draENy0hKT4SCns3yEekJHGh9ROdZkajTWbpPkz3FDosnXmm33nUYrCGD84QjC0haiNqxunBW7EXoCFeTL7N+l39pMOu/61CHfsHEru1Fow0J1mJi5F5ol4vnDcQBV5CkohwJmIcSu2T2dMmLj+TvGd9uE/Bndad5zwwsW9kLWw0jdUQNh0WgDeKHkT/m9NHXhKtRI+G0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(7136999003)(10067099003)(11063799006)(55112099003)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IppR8HmImB1vXlGSDGp7To8VjaJmxlW5ezmrXDEv0q32szk7fw/119El3e26?=
 =?us-ascii?Q?Mzka8JzU5F6woKySBJJsEQbRrarpoBMEvgGhusaLNabWpePpK6S/B+W5z5g2?=
 =?us-ascii?Q?AMVdIZ10nxLT3JNboDJB8UoPm0XB1/aJQcq7enPwGlyfmRMZMOVPCTOm79NQ?=
 =?us-ascii?Q?LuEedlzMa2ULa31oMxciSqjaoTTbhv4Pa5pFv2RGF92RUwRyF2DqVYsSQgb5?=
 =?us-ascii?Q?PmE1Hfytxu7BK3Zk7qWK2XNyf0K9v1j3+Wvo/PqaGrkF7cyO9tw0WOY3x3pK?=
 =?us-ascii?Q?4FYn2zChWMWMXQxST1s+dKVT//7B6xo8xdpQI6UysqjKx1bFfrD/c/F6T/vS?=
 =?us-ascii?Q?MdXu/hLVFqkYX9X2qh+R1/+WFFqWS7mKEAK5CEEuhC1uGslMbuq3MY5eSqpk?=
 =?us-ascii?Q?vKNYSy4Yi/zpFaES/8aU30JROu8n1ocTCBouGYL9mEnDMIcWeEOZAA1WR5j1?=
 =?us-ascii?Q?mFzNEpiSPee7cHiEg0JBLvYClDEt7/7VetcfuTzoSpOIXEAXZc3IkAQmK5PI?=
 =?us-ascii?Q?BGVLOv7QW1YtZpdfVWADdB8OWa2g8Ha6yBl3+blTlL2AJNYnmnn1pnBthfqu?=
 =?us-ascii?Q?qZFSFXE620+ulkh0bk55QmeJPUw4CaneslFZwY3/wlKzYg1pZhDVK8hdP/d+?=
 =?us-ascii?Q?6NuDS5XwmIa8JWYaEO9rwj2flyADTJzoQO3i9eCWisJQ1x4mn0CHE3CrQXFY?=
 =?us-ascii?Q?J6KtvW9OYlpATTjyJInV4HWZOMd3XG7Kxw5vVCMA4wu9ZrJx7pDQvIdzFWFN?=
 =?us-ascii?Q?F9H3kxXXi9GGXlAGbKggdn8hNRJkW/E9bSztMIn575HVjiCRRYIStPIYiKGU?=
 =?us-ascii?Q?b/84/xzQ2t/n2B+XbSzTzDPbqjix3xxbmTrJLGtUkTTa+41WIVMY6uRwaFTx?=
 =?us-ascii?Q?0OyVt7L+o2WJ1DC5bsgRm6WR4tYsvKtbqBQwUingUm7inKgkn3ehw8WleyFZ?=
 =?us-ascii?Q?5a41E0Y91igBXRXTkBKpx5T564dWpT4AFGsZPcIRWZ2nk9GrJIbOXnWOev5J?=
 =?us-ascii?Q?hIwLyoZeVwC8VKKeSgibQ+9Vll3r5i1LNcv3dC/9RdMvzsiMDS5xKxNDCiLq?=
 =?us-ascii?Q?jYa8MI/1ik30S+r3662sJDDy8VNIOsffXt51Ik+FhXPB8H5eH63gT/L8rcSu?=
 =?us-ascii?Q?gCksqptrLh7FnJYfYqUs7TMj0HXtR4M9e2d8WNJz6a6NNsdQBwW3Cql5hJev?=
 =?us-ascii?Q?eMmQSVIysKgf2AgMR9cdai8lcT/zbACZejbIKBNWDnlpmED5kpJB8DWvNCTW?=
 =?us-ascii?Q?UHWgf0QSVa2clBJhb4Fa2PmsdZ2blNXeslUKtwpZUgzqSHUrTkQHZrQ+JFZE?=
 =?us-ascii?Q?/8+ogPvOyq9irh3004Rg/9ZPPW3ZdO1vwYMNIn5c6JGRBblMeOiJtazlcBS0?=
 =?us-ascii?Q?rqoxmebtw7Gl3opUF2qasImHe9RuLd90oEZ9456tv+CXjtuWV9ZTrmkvQeEG?=
 =?us-ascii?Q?07eljonB6AKOyeaGI2qCiRNbNXBhExN5MkNu2vNUXsPBQgx5eLF4mpbqCgCZ?=
 =?us-ascii?Q?+zjtdq9VvGGRCGNJAaTdgAguHdMwYaKc5vusYQ4RCmfwa/sF9iZ4JHDpSfKz?=
 =?us-ascii?Q?7hiRJOmm6kcjsdp3giZr/n74P5dwXArXX3ng62Xv6vkXn8BWRlyDK+kLICp9?=
 =?us-ascii?Q?o/cC2ySO/LQPmFyu/rXk5CjjI2YbUyvHTITRvCG735b/Q6GohRh1iK/Eii6i?=
 =?us-ascii?Q?BhEsP1356he9oKI3aJHF/3NQTyFMGtQqceKwXq3xU/2yFX7++e9Zeyn6an0g?=
 =?us-ascii?Q?cqz1Gbmhl/YG6sNk5vSGw/N6xZj5Bxw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c1080d-4a1b-47dd-1764-08df0aaffc1e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:11:47.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPECPNatPEXyzquyoM7gn4IEvZfCdvxhb4Zm/6DVZzpndSRSneJJ9yVW7NY7hLOvCi4DOiPm83vMysARNvCm0MNpTgHkw5bCZASEqysBqEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6228

From: Hang Suan Wang <hang.suan.wang@altera.com>

This series adds Linux support for one of the Altera SoCFPGA Crypto Service
(FCS): Secure Data Object Service (SDOS). FCS is a runtime cryptographic
interface provided by the Secure Device Manager (SDM).

The SDM is the hardware security controller in Altera SoCFPGA devices. Host
software reaches it through the existing stratix10-svc mailbox, which uses
Arm Trusted Firmware SIP SMC calls. In this series does not expose the rest
of FCS (RNG, AES, SHA, key management, and so on).

SDOS protects data at rest. The SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key that never leaves the secure
boundary. The host supplies plaintext (or an authenticated object) and
never handles raw key material. A primary use case is black-key
provisioning.

SDOS requests use the stratix10-svc asynchronous SIP SMC path. Source and
destination buffers are allocated from the service-layer memory pool, and
their physical addresses are passed to the SDM. Each request opens an SDM
crypto session, runs under a lock (one in-flight transaction), and closes
the session afterwards.

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
   38 61 39 36 38 38 65 31 64 65 35 37 38 33 62 34
   39 37 32 65 33 31 64 37 63 65 30 37 30 63 31 35

   root@agilex5e:~# ./fcs_client -E -i secret.bin -o enc.bin -d 0x1234 -r
                    0xabcd
   root@agilex5e:~# ./fcs_client -D -i enc.bin -o sdos_decrypt.bin

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' sdos_decrypt.bin
   38 61 39 36 38 38 65 31 64 65 35 37 38 33 62 34
   39 37 32 65 33 31 64 37 63 65 30 37 30 63 31 35

---
Changes since v3:
 - Rebase onto current linux-upstream; register stratix10-fcs beside the
   existing socfpga-hwmon child device.
 - Drop context_id from the ioctl UAPI; the kernel owns session and context.
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

---
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

 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   9 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 684 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 294 ++++++++
 drivers/firmware/stratix10-svc.c              |  65 +-
 include/linux/firmware/intel/socfpga-fcs.h    | 130 ++++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  18 +-
 include/uapi/misc/socfpga-fcs-crypto.h        |  28 +
 11 files changed, 1304 insertions(+), 8 deletions(-)
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

