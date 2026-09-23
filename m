Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB743822B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184231; cv=fail; b=YDQFffZBxX/RLdtxGfTUuC02nT0SupbC7Z+DHKNChnGdwmF/m3sZvPOHO+gIYogB5AkC62qhn+YEPk8G/l2MhI7dYm5SoYVjgo5Rqli6ySqpKE77XuzQRbHXz0gN+Ez2/YjB4zm5LXnIvXZ3FKS4bbVT1vDef2gnYZigTTSM3HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184231; c=relaxed/simple;
	bh=DNqlZrXcvzxe4Cnm0xg1n3fS36Z2zYo6BJXVuxSMIu8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bS0iE15XuMxKeKIMykmpQMcG186pWYYLEzhrmDzelmyQ481J6U+niK+6S64uJxchn9UsbqfhsOM0P2kKiE/uvgMy7zdKPQc+tdHllPgH20MSG50ASHx5uxidu5tD6vmDms9EyP/qrVfqpbciBoXZCxdBJQP2YNq+HUBAoS/RlZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Bd/VFErL; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Bd/VFErL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILaL9L6FuOaplwilNZedXGlNtBBZGDDqohDY9syNvBMSro/B5rs+oiAvDkVCRpqny0pPK6mcJPZXSMGSxIofh1ksI9/V6kwbpiMau/qTMOXX7Zws50u7rAt45SfcEm+6cIStVpHV9IW6ICfiInhKpE+YHjLxHRXFqYP4vNX+kZz+Wox9F3WyA6mOaviBlctuQw2UjmXwFR82eUPIFIHMRsuC8XD2gWjaKPVf69Iwcf0KF/nUtEjzQtErMrPbX9aTZA7QVgbQtFZe5Sy9WoXtnsVOkjqw0OcwYPnEPUiZrFIC6i+Hl3Bo7uu67A7TLhszaP2huQMXNNYRRcNHUQE4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRfNxXaKFqwFavEC8KiIQfeJ4i+Mw8CrAHg7kHKzvzY=;
 b=nc0aS+jSNDfnqzeR+KQaYd5IYV5vfIEuN3Ku/aLNHWe0ny8C1UArwvLQyagKr+g0+xvZjfY+REH3MMfKIdO/TJRdPtc/f5q/AaACrxAN3r6/3hjOruVPhtKrAn7fFkVd/t5hL/+2c8JBLr9nVEOAfBjGwsITGHdwE3vZTGQz4f9VYt9UExMMevsoAYBY5pQhwWquDkiIxw+Mx2PzUOZAXSrDFzErKL2TCAk5oaTW0faxWeUt03imcXjx4ptgqQUIaySr7gLl6Jjz+z2N0mWqYdibgrPN2ZkklIt3X5WI2/OdpGsUK11PZthpdtAnttv6JFEl7onnkJC69nmynKd1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRfNxXaKFqwFavEC8KiIQfeJ4i+Mw8CrAHg7kHKzvzY=;
 b=Bd/VFErLdOppVkuYk5tnLYQ+XHQ7gYCLzAx8tT7+f9iB7qFZZOI9fLUIU+fOdxvmPZwHVcNXKbJiCMdSIUhQKgaSQp6azSl1MjljPaFe3hvBg1WIRLnYgvWaG27fcP6UkT2muygZs0obOrAZwm9ls2LKMTYsE5oP7PzTjpRI0Df2QdInc+qvoEKTnFDnPvwb2QWTbowfaEnpVjpJOMg7F8X0hKUKQlxhQKZiShUT5GfACSEXt+oRgp18aUmhv1zaA8OyM7GgeBw5UF5waOj2myl7DihvKN77GWBKsqta0i+DROw4UBHtYSC0J02twWQUge8dtZbSVPcR72dqWIGUyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by SA5PR03MB8402.namprd03.prod.outlook.com (2603:10b6:806:47b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 17:23:46 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:23:46 +0000
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
Subject: [PATCH v6 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Wed, 23 Sep 2026 10:23:38 -0700
Message-ID: <cover.1790183372.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To PH0PR03MB6560.namprd03.prod.outlook.com
 (2603:10b6:510:b2::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6560:EE_|SA5PR03MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fbe818-f01d-429b-4d81-08df19976c91
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|5023799004|11063799006|6133799003|3023799007|55112099003|18002099003|7136999003;
X-Microsoft-Antispam-Message-Info:
	M0mTZAG71575HKva9juVY4LKf06WA8EnnejdAi6UZhqQficg9/q+WxYbREW6416QdzOmGXVhm2W6NrUnIIOJ56Np9dAuxPpc+Bx1WDjMNApC9MP0Q6ttQp7g2ePCtzuCPXyEWnpjMjYX6M8+qzMJUb8YQWKp7VBc5h0C4+PJN1sscU8DYQ+3k4hg12mI+RZyFRG1dlJXTYxJPNHqKfuHus9W03nzfCqsdI3/pcF7WT8JQd2KJSejVZjM9YlkhekaRrtkg37SD/b3SDmqS2ebnI2JqQIajyQ9csYst2dF5b42oRRoyOM87EN4vOxczMkFSeCboTvSGv60VP6nXvz2VJKxR++5JSC96wvAlq3sbeK3cJPj+zMJqk+0PJ+guN/H/J3J5vsx/4SIrcgMrEiHxqVTi9bq8Cj2/wQM3orzwGd8Na/hoTEee1JTUEMaOgEXB7Uy4z1nDZ/zWLIQNf35US5tYHUX/FB23RFmamNIqTrwGIKDWOhk6DcfjzguUjH783pJbn6ELvUelEg+PYJnHXGVhcPtgxb3N7ej8WrWL8dymwtTSRbJI6W73Nq+GMAwhpNlpgInSHw7AVJu4zaix4ASpPCnppncfcWl3Lg/iejYW1tckwfFm33P/d/WHJorY+6N5H96i9IIPFZhbQ/HuuvaIO/XlNJMLF2WdZq5s5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007)(55112099003)(18002099003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Je13aqFXcQfaS3NvZn2OkB9uJfkBpRNUJIEXB+WwDRj26hrswhEZMARjSbrU?=
 =?us-ascii?Q?cY9LXKQ8ADhEIiCyIb20M59iOC82+lORGwG5FjW1AarabYKxZsLefbvZp+Lz?=
 =?us-ascii?Q?vq0P/dXxNxNACPJ5Dk4i/aFxjcyLA2eFqH11V4AO7U8IlGMhECjxAvR88SXJ?=
 =?us-ascii?Q?MYDSkaJG5PiWLOeflmdtbXVkvH/61OQX1AqY4xrCFXTpGi4RRGuvIkB4QqM6?=
 =?us-ascii?Q?qKiIKh9K7/PNgY5Ge0TNpOrnLvd7C1QQIokENmfxvN0t+ObqDF6LHYR+WIYR?=
 =?us-ascii?Q?/s8SZHFzbFhLQEYxFvL6ppd67LEzrzK+JzQ+twUIg1NHzgkfXzbhOrpOb8YK?=
 =?us-ascii?Q?iZroR7KyYVBBxvFSdAMVOQf/b8jtm8J+f4wiG5ugeTA/NovSf24q45VMAzTa?=
 =?us-ascii?Q?w6z08RXJIy2qIalRV1/E986n5q2dij+BAQPqfCkHBJRf3qdF8bS2hblMw4Gk?=
 =?us-ascii?Q?FgG6cwf/yCn3yiNY/US9cgUY+ZSk5YwAOs7xuHsaE54uDguwIEjSOdlqCR87?=
 =?us-ascii?Q?lbt1LHu2xcYHvk3Pup9FH+/FOqNi+0Ux9B2c6yWGsM3XrgSvgUPoWbe+RTN0?=
 =?us-ascii?Q?/dxlcwq/fkNzq5bCJp0NRgKEvDnsa2I1oiWrmeQ0mYctm65ZyfZrK30C4+pR?=
 =?us-ascii?Q?wxvDkHMruVGNImVkexQ9fQtNRv4h9CNF2XAjlUrj+vRhJbpeioWdt+GQRqEb?=
 =?us-ascii?Q?jy1UCHKVNl0cdf3vVKwsfMOPfnvXvWTsKcazU6pyRXE58MTST+AEsxejTI+d?=
 =?us-ascii?Q?gDaxfW/mUCx7uI/3vAj4RIKtmeMi14knF1y6Yydi39byC4wBU2mvcek+aYpj?=
 =?us-ascii?Q?PmeaqTvyGyEM6pHsKOHwmpvhiMcshy4ihYgpa7siUcpseD1zoe1vL9tc1JAs?=
 =?us-ascii?Q?W5gY8umJ5mLoFCpNIe9Xq7kjB+QP/VE3Z9ImmF2CMIhExsy+DTAbarIzbtFD?=
 =?us-ascii?Q?RKlum/qbrNPE0cugnt2HdOyIplDOhFAncCaXXsTNDvNJzg39oRfQ6JhjGw+s?=
 =?us-ascii?Q?RTv7THhtx8Pe3iGoGy0joDbvld4tKzeQ6fWVXqDYjOUenvRe4yfjVK9w4SQD?=
 =?us-ascii?Q?2q9XVpCBdRmovcuwFSLlJ9La5yL0eg7r+W+NvcrBmzXL3FiaxymtPkeXq0Um?=
 =?us-ascii?Q?0o/kKXMN2EUwnWUfWz4L0IsuLKQzS09lGZ4CqNWHtS3p/gOz+7C6LCu/xrtW?=
 =?us-ascii?Q?up4QcP4YARhIeRsvPoavC3xT5SSeBtw19ZHJJJQipUhZS1meo8/zLXKs1bxK?=
 =?us-ascii?Q?BDsm+uV7+d42C0l2xdFW96635zxw+D18mnSQKJLk0WEEYDKl43bXROQDccsI?=
 =?us-ascii?Q?Rg+vlsriYsowPk1ALTfm/joDZiuYXaIzApC8UwcGq99x47A2QInmQHN517hX?=
 =?us-ascii?Q?PipS8L2ZkHepyrL4hEC1jc3DfsblcUG36L/RrRkaucpuNa4CE+a0zqoQDcqj?=
 =?us-ascii?Q?c2xrTwiOy4boopx1LFJBKz4iYWTEn4jQBX0voTLtLO7M3PhhovobUxcKe07O?=
 =?us-ascii?Q?icy6BvFg/VcDKKgIXjRRTx+RhAxvuv9HnpAgdQYepKBZWsqEtmwhqB1YSqZL?=
 =?us-ascii?Q?bZRe9OyvFRKLJQ0Od1ftbEazbfvkzcx2uDP/3DUGJY5rZbQvEGqCNXDe0vRp?=
 =?us-ascii?Q?VeTw0UsdnsraIT3IKgg0ffBV6RwDK/nsIUOV1D5/5DqjzgJzZmKQcZxrThkb?=
 =?us-ascii?Q?pxHTrluMm12xLo0Lj3pUZ+syc40gF5yol3OycWlKWTqTvl6MOOtWQZYUSz0L?=
 =?us-ascii?Q?uUcCw5yDNT74Lbxry9l1NBdFMlS8CtM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fbe818-f01d-429b-4d81-08df19976c91
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:23:46.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAjEnfC9J99Sg+EOZ4YKb0PEj8CoZC92l99xhLLVFqqW/SG6nlKq9ZK0UBtlAlu8FZikcKCYor/pjnEKaEfmRI7zqOn3SjU65hWaaynUd94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8402

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
their physical addresses are passed to the SDM. Each request opens an SDM
crypto session, runs under a lock (one in-flight transaction), and closes
the session afterwards.

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
 drivers/firmware/socfpga-fcs-core.c           | 700 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 296 ++++++++
 drivers/firmware/stratix10-svc.c              |  65 +-
 include/linux/firmware/intel/socfpga-fcs.h    | 122 +++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  18 +-
 include/uapi/misc/socfpga-fcs-crypto.h        |  68 ++
 13 files changed, 1496 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

