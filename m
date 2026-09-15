Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1025485CCB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460795; cv=fail; b=goGmBTQrFApS2P/D6YXvZVBE4j/CcyF1j1yzS4sG+iANzaKnHnXiymFE5wt5HZGO4/vbHAWrGiWm5Tx8CB77PE70Fcuxz1fBHpmi40uwrAEA8CC6HS70Xkz2Xi1pdxyobq+/9GQ2d3rY+aSJcRMOk25cibnQxEFZCtHnhvP/7tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460795; c=relaxed/simple;
	bh=VbNmCW+ABXBKrCIGI3IRlLOJUgaTk1owRYE7StJqlqk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E68a0ZDY846QwnJmHu5Zz55r4aKM0gDkEMr46Ip+ClzVYKVB7qQVKPwixgP9QAUNifk0SLaeV4GpnQon6necQ8ToHkPbm4AGSudofcUHGy+hqOv2NROhIF9kn/BwaNIkJqoPcgb//uGeJb2fmT3torlJCQ/t+qJqF/9jiDhpouM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Noin2mPp; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Noin2mPp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmuNnvkql3YD6PWexbdk1Rx4k/OhLd5Fu8BRHfS916SidbZ68q+d3JNKBWUzdIjXa6KU+h0BxPjY+GwAxVi+jZo+BSW04n0FLkRs7039jRrNZcLVP+6lRzuUsEd4BHP+wE3TSiJNfKn/hV0Kpx9/pme8AvheGLqytoiH+xhuok+HBX9bu9l0oJS2X38rq/IXlGib9wg7ETJCIRNlXYWAgI/8yZ9Jm/QaF0DuTgMprBxu6pjXPm13Jc7VJdAmb6S6nSjI1zmEJl/GzZUI6mXhG+npyvMbZlboIi9e80U9SNGK4eles+AWh2bMagNmPtVFKKc53KWjAqaqyYFHi+AIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY8Q7RViD703Cpb/zEBQB/kdMIFkxcDUfbaqASEcpbY=;
 b=bFRuBDEZYnioW6bgpjGk3L0dJYj3WL9b0qMUINAamgdJCa5C3cvQSGlbPuJzbilg3jdU8mt8SGPTukevF9aXNBLEzSov5ajvt7ZDPx4JZesATVjehUJRPclH793jdT8f4plEdM/JwzmHe4S4Uvmta95637yd877AzcLkCA25kmVqkA3x8+gr8hKagR2zV48rHvYca2+ht0dLmlZxq5lWrmeUEUFTpkICa22mQwPaX5kYLeoMWSYSZF4xD2fyeCpLBPd0nL4wShQ8g8SYXBOuoCEzPUILgIGQ1N9c4Ja28HOQVOYf3g0c3RuRzMKmShc5TPkUAb/ktwb7hlE0k3MSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY8Q7RViD703Cpb/zEBQB/kdMIFkxcDUfbaqASEcpbY=;
 b=Noin2mPp3tpGsrvPYmbfw5+Sga0gUP5d9ik7tqW9Zjyeb65e5JagsSsJDodRwrmdaJlvWWqmpvQBZ22/ddM3n+Pwp9Q93mTrcjiNQiVgrZ/Ftcv5220chMLYUeqE8sCqHvCueNyxqqJUWUMJJIufn6hw9CYtKbQB3RF1mzZr3gt5koanTVzHC014vmi90uU10Z3BaJp5D0B/w8DVPkVTg5pr39Rf4Yh7odnCOQdVvV6fvaY2LHkMPLF+XZdIxWe11k3nAfWPnxyvyUwa9KzJdkwGvIcjHPwmBYKLH8d5Kcm8zKYAxlELB6xAvqZdctG0qZzYF8d+QcccGsr7BkIEdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by IA1PR03MB8047.namprd03.prod.outlook.com (2603:10b6:208:596::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 08:26:29 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 08:26:29 +0000
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
Subject: [PATCH v5 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Tue, 15 Sep 2026 01:25:42 -0700
Message-ID: <cover.1789448406.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|IA1PR03MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: a3edbe24-ec18-4880-9d12-08df13030a60
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|7136999003|3023799007|6133799003|18002099003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ldhoCUSZuuPzVXhHWYDwrulfAZGY5nj3TmmA0MMkq14+vrsMyesD5vGFtKWjjoL+a8AYG/3wD6ac0otsmZpEHeFfBNfWcUmx7E4EXQPVFRTRtNVqATLXlcCUCHELg55aeBUV6o9P4vOhcNmGtjNQTOQQKGoZrtbRyt4DGZSvD4k2YNqWPeQYeMGFdVlPcbGf7F/Airmb/Q7AYlzSL6EQ/q9dSo5jDVBCMNVA+KWk9cfVopt5af1iXM9SBBE4sp/hGMMQwp/j/3KRGK30gB7C8QUT11wwddyHhhh9ool8SnYmkz4HeQLl6gtGAMug/Qh/fk6kI4mFAHiM0rJGW2cvx58Imshh2KxI7uT0dBNUUuMvAt+ihIBN/2vSuXSyrs9YcIn2JGOAn1wsfavI7UELFhXiWLbsuc8M8njRJrVuAO8vK3RMpLs7x13STeIFucnZ+pPmN/TTzEEjHdKlg8/P2OX/NE66SIEay1P9cSNE3CHW+Kgi/LVFR24IYbhypyfX0Z6hQcST0Vz1K6BDHEGxKJ+NyS/UaMoXYvFQXyTFZEZRQB5WZKJfsMF27CL0mMU76voPRjoKH0S7jaTFocveQqzS7knBdf9aWOCV+bYPeKgY07LqknYfEqjcSq2h+55CZKGslMG2BSuUf/rbO4t10N75wpkaFym+jAhKf+VYIBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(7136999003)(3023799007)(6133799003)(18002099003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghIno50WZxLi96hTglq9yBZspzm3RawnVMjslCcAWHqoiq2d/EfRdAq3uDj4?=
 =?us-ascii?Q?9sDCIbjF6JMflrL0JUfTp8hDMh5ARdhuSXIX31Iw9omSw1yBBc615Ff0WfOF?=
 =?us-ascii?Q?wqgPDlfNagqLkuimIvin77j71USNNJGICM1t1c4ZeJ7xOpEkYRpPKjLOJmAm?=
 =?us-ascii?Q?NLiTB7dZDjVuhcapMdwDBOZdF/P2r+OG24rd4VjI9AM1nT7oSZnmVuM+Del2?=
 =?us-ascii?Q?4EcnIBFuajVtBNZTJZEXecYi0PPXSWHj1rjKuEFNujKEVxX8ZziUqVx+1+CO?=
 =?us-ascii?Q?oBQ3v3MwuLvBsEQEK49IEqXkfBlhIbw0BfK16fuI/WIlINy4kgjzI06t/keQ?=
 =?us-ascii?Q?1FUK1XQCgZuPtB8QTKAEnP+masniGmXdU865i0qHIMARbeJDmOf+r8a8SYcb?=
 =?us-ascii?Q?NLM+ErrsLh0CtJ6ALoPq95III8fv3G74ZFDQm8bGfOBaywEEUB487VCRD9QU?=
 =?us-ascii?Q?M8xeIe+/JNunFhHDnFGIMkb1FY6xasfu3U1IH9JrRYcxMcve+UhzKoxl5YwE?=
 =?us-ascii?Q?QEKC+W2XfEA0r3emXiE/nQmvdXeYgaM7LWWftJKGFFcX6/u9Pc/hZm4wTJbY?=
 =?us-ascii?Q?vYep9DKYAEGViowaxjPaMtecnBpnZADRW9Pud8na2IKYK3ViqxpzGKdYD47v?=
 =?us-ascii?Q?QPsJCi17IuLmfsw25AP8q6YrFugDB19sdGOnIcA5xU98JMAzQeAojLhNj/5Z?=
 =?us-ascii?Q?+jKxlaZohfwUSSsERkWttmkxCb5DUqeW3fPKvUSlC8bJ2uDs/jw/A4xw2KT1?=
 =?us-ascii?Q?ktdHbIarwuNrEpnfH9k9kJpPhW+2WVxjCpQOgbxFtb3eTdoAtLAyd9z5e8O4?=
 =?us-ascii?Q?TkPBW19LeIcrZssEFuScuL+Op2Wbf9J7rt5IT0qcLt12s19D9Uzr9kzeKFfZ?=
 =?us-ascii?Q?I0Sf0wBizXdejWyqW2jfpy698l4AUo2WGwzFiJoaa5ZmYrYAJ2+LzrHz3han?=
 =?us-ascii?Q?R3xJjQD54+X0A2tUEc7H7ix7BhizluL3yY5LiRSU5eA45HQvEEgI2oF+wFEm?=
 =?us-ascii?Q?ZAqRviTkbGm15L+bsS9v3AffDavXhiFSXGf1HkuHqd4Vl59UOa9FQ36X2KJ+?=
 =?us-ascii?Q?yh55R/V+y1h1/EvhFCsNzexRUiaolNbcKt6BXtyPmsmnCJefo1/yIOdn9jFa?=
 =?us-ascii?Q?KutbxUZTR4bGWdVtaDZ4lUF77/VmIS/+imS9nzYzgY4RjRgrYz0J+bJMXFg5?=
 =?us-ascii?Q?pEoRwnAgCbByuQIv6DcicZyK/Ykv/u+bx4jUOuVNQ7dg0VzxKj3vWjTu3E/m?=
 =?us-ascii?Q?jHFkH65x9Gewirzr/UjF9vjZA0cot5nVJ+ANW8Q9yTh9vO5vBV5sM07cWHX3?=
 =?us-ascii?Q?qC/ht3GNgjxOMQaXJV9IpX1Dti/FsRjxm8qgePrxry/n/hiCEZ47BmySyYFi?=
 =?us-ascii?Q?7fuXsbzMu4q8Z86dVqcu0hMCbzNOU6OAYKVQbHR5yQdmmTsv8lLCY6zOgKMV?=
 =?us-ascii?Q?2ThtqnToC+W8UXfrxpJni/FQEW94qHtdk10EKVv9bKDY6ObrNhBAp58EOUVo?=
 =?us-ascii?Q?YKAwo4U0xqeoiu+CHzv+UZQ5ULJlhNkMQQg0bDKWEkNsrb00n44AJRQku6Be?=
 =?us-ascii?Q?Ohs5+Ig4Z/FCFvPAQ9BfsnK6yNGQnEygWcfzM578VbmZMw9cVkqNWUGNil/7?=
 =?us-ascii?Q?xMBQq6NecuTamQ8m5ErXRzOBVmtFzEZt7iXMKdvWeXKPWKjq84HMwq6R9C09?=
 =?us-ascii?Q?Pi0dvUblgyldAqdn+pnWhcwBZisnR3DewUQm/SEa4EXqWB8zjEsPAKIOxzpV?=
 =?us-ascii?Q?Gt318ZRAEXyGPYbsX2UXSeLQqbBdL8Q=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3edbe24-ec18-4880-9d12-08df13030a60
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 08:26:29.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUkHkSs5kpXhVb+QOg06PUUcnMQVx6yfgC6zwS2x2btAsAOgA8rssNOydGkON0OnlOUa3RFVQTEX7ba7cQ/NKAr8Lvzw4JwWh3VxJHrcph4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8047

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
   61 37 36 61 64 62 66 63 32 31 32 65 63 64 30 35
   35 35 33 66 38 34 62 33 34 63 65 39 36 65 63 35
   65 62 64 31 31 31 32 37 30 38 39 37 64 35 32 64
   64 66 39 35 65 63 34 66 61 38 30 38 64 63 32 35

   root@agilex5e:~# ./fcs_client -E -i secret.bin -o enc.bin -d 0x1234 -r
                    0xabcd
   root@agilex5e:~# ./fcs_client -D -i enc.bin -o sdos_decrypt.bin

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' sdos_decrypt.bin
   61 37 36 61 64 62 66 63 32 31 32 65 63 64 30 35
   35 35 33 66 38 34 62 33 34 63 65 39 36 65 63 35
   65 62 64 31 31 31 32 37 30 38 39 37 64 35 32 64
   64 66 39 35 65 63 34 66 61 38 30 38 64 63 32 35

---
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

 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   9 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 715 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 294 +++++++
 drivers/firmware/stratix10-svc.c              |  65 +-
 include/linux/firmware/intel/socfpga-fcs.h    | 130 ++++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  18 +-
 include/uapi/misc/socfpga-fcs-crypto.h        |  28 +
 11 files changed, 1335 insertions(+), 8 deletions(-)
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

