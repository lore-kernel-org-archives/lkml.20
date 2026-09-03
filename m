Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020100.outbound.protection.outlook.com [52.101.85.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF03EDAA2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419882; cv=fail; b=P/Nk7uB3Gv3/H81yZNhTqx+aHac5VCq3G2i+HAKwhVJAKJBiCmpl3O9hV/JBFbNGHU7uigdvZCN2s6WJmOIfgRnEaBMJ8oBNZ3Fuyz03iKBle4/hWqDh9CjzGEbuEAedOqfhnGPUZ0P3I74JtnMBzjescqQERFk5/bbIyWy56/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419882; c=relaxed/simple;
	bh=7GF96wyDjm8VKRMjKjrxgHRMQAooTzkoRlIQRyu3WLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WKYUiDDLtKvnvQpFJaLDyYQgKqeLxdjiMSnzkpgl4iwYqa9DAedaf+w9oMqIXcxKHj7ePCE6/3Dd79vXO//eeyRG4nWi0Z3VCF6mdEf0nlxA+zhFftJbXnDx46NE2jK29aVG868ZPDiHFxtsrUwWC7ZN3cwGJujAaoL+2TAIPQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=baa0U1Iv; arc=fail smtp.client-ip=52.101.85.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="baa0U1Iv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpNf6Sv6kPIho4Ikd2n7pW4a/lmzzcKB7sUsML/KODfJMwvrjFGtmKECCn5uyRtfaTOQqdEtyY2GNT2kurP4tUf2RO83UEg1oarDwaA4EOAT181My8RG5tVf5fYwVnQZkYqo+yNKIchUbCH9UgV1aBb76Ktk4qe4b67V5dPGkiebrQ8YkrPdBVm4ZGVF+0m28jm287oVQTqxfJOr598RUavod7t8uP09oZGcUCpDymR+0OavHzQq0qzw8M/pWvUhMEU4nRqYOFAq/kWcEWwHjl5Ufg1w6K2GoNDQ/l+npZEZ8kVdJy8Gc3C3LqUYsOE4ZOD2V4h8sO+Lsb1MmssOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1oi9GGIsgZ2P8Tczx0UeD6Kle7fzhfF+EvPEUkjmtc=;
 b=Ck79veLMKeDFoxsv9XW1GmKdCgiBjh3N54r4Zzqkcxqhw38B7XONFlUcZTpSeeFTFM/tEJTSs0ZGQ0/hnDtTZ1EZU8bPXN05xGEf6qBuPSJq+b+uKnFzd9wrP+kSFBMvKDASzbnGDvKF55xSpJr3sYzlpMun4h61kyHoxZPbSKdl3ujf5ofEwqjG0sENG03uCqREoZBfXV4q3oa6rDZutTgHR1vGldK2kB9DUHFDgYpk8F03CN7ukx5OCzPpzYkYl101JAtrfT0QUPDf+3xiyf1w8r6EdxZOhtwrrY96pWFBtNrpPleURB35wVcbOjSmphLux1dAoTd42asRe5d+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1oi9GGIsgZ2P8Tczx0UeD6Kle7fzhfF+EvPEUkjmtc=;
 b=baa0U1IvolH8YeGgxRYdysp7DkPJIzx0xVZJOGoviDsQcwKAx7cCyTjel7rf4Z5zuYyIjcWhH/OR72kp3s2yYTqD1fZTZH6AR7fUrGi+jADnnaTQa0dDVtHkZKuzPgFcKDJVC1aSV8F7f2tZwHJYVh/XdBIQgZLh9HhpxCxvZmeO0Pcf+iQ4qcKh3DReHRn8JkcPGipWj0QNj7oz6e8a0COiybkro6f/+kq4QzparYfWNnU28WoOZDjAIVTBxoHj2aTIim/pnUjj237XSo6YcqunrxngoOa2XCWzF8dFWZlv8ZnrMdXJHQiThbMV/v7NnqtFw6EJqJglG2QAoULTSA==
Received: from BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::20)
 by DM6PR18MB3586.namprd18.prod.outlook.com (2603:10b6:5:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 07:17:55 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::45) by BN9P223CA0015.outlook.office365.com
 (2603:10b6:408:10b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:17:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:17:54 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 884984186B51;
	Thu,  3 Sep 2026 00:17:53 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] mailbox: axiado: fix RX handling and debugfs name
 truncation warning
Date: Thu, 03 Sep 2026 00:17:51 -0700
Message-Id: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8fmWoC/x3LQQqAIBBA0avErBtQs6iuEi20xhqoDIUQwrsnL
 R+f/0KkwBRhrF4I9HBkfxXIuoJlN9dGyGsxKKE60TcCTWKzejwNH9YndJwo4iNRKzs4TU43toV
 y34H+VuZpzvkDLaWKbGkAAAA=
X-Change-ID: 20260830-axiado-mailbox-fixes-v1-42b9f4ef43b5
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=syang@axiado.com;
 h=from:subject:message-id; bh=7GF96wyDjm8VKRMjKjrxgHRMQAooTzkoRlIQRyu3WLU=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqyZ8oociUfuzZn6XMnQsmGyy/1ZnVJtcbGKLblXRN5lm
 y69uDGyo5SFQYyDQVZMkeWrzrf8k7na9zr3riyFmcPKBDKEgYtTACZS94GRYcKBHzsMAk4t5DvN
 onZ52tdzEYafrkg8M9ivs67xwvVP964w/DP+MUVd6trMs7P3rS3RPdGS+pp7tXrjBv2CQr+OJY7
 y8RwA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|DM6PR18MB3586:EE_
X-MS-Office365-Filtering-Correlation-Id: 476445c3-358c-4110-39ce-08df098b7900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xWTnNs2xQ7ZJ5f/waCIzKVED8vjuqq9e6Aj3nIiqIqbxBrgeX94MYCVIsYZTXFMwU3kAKFUgK8Ql4QIHbZG5JNzNMtPKkcCIzGnRsYMEYhQm/A4/uLn2AWKb0WYlGwmU3RWbqCnrxRbRQOlqBDlHHdiyDl6S8Pw9yHeYhCnKd+C9XSSkAoRynGxFBbYeeh3nIuUQUZLgjIZIpH1wr64xeCEa1kVbExPpjwutaaN/vYkKB5NX97yHv05zyodXWdwTccHyxQ1chCHvh24u/2IJkdJyKc7iWaQQEEjrcUfKou45uC8PO7R1gOwF/NBhcngiG20sP+EyZ0hhZJIK2RhKFasQngcpx7DSUBCfouM+UrLZC0EK1DhCp77gYoeaHJPkT3ihGdIMy1bEsTltab2EBuK/r8HY8FAeB6+tpZcWDxFozHPO46uq9auirz8nH181j4SqFyxrHsaXijwrdrJgI93NMsyZDYSoCeyn5+cin5jnV3MpESEDC+ws61jb2G9NzByD3XTXZUCk9qySl9aIqfhoJNUTmVYccDRVnRlkTEMz/1KZ0MBgUx0ZSyRsk/GZMd/PaRwnv0ulvsVUONgxr/+QjxwgmHdAgXwndAguWbK1riDZQkMTl2IzUv4sYr+kMFaKWFFEj+XHRGWkoWxA/RXJHZqoNvNj88kyPb746aFTzyDzXmNybxhWJpi6SkymHm7ILXcmHR643J28SztpnA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GjtY5KmD+6wy2cXkK3IxmL3sPzzkSrJcfYO3SZgk9oyYi219i7B9WY788P547p1jh99BaV8DpJAXHMkkhlK1+EjRmGQwvQ/2Sk0aanUAtgVyLad2WcYhJZBIwxyBuHYAvTB+Yrqn8c0krxZKkVzySxliPnsDLpIY3H4QgUWjs2/d+iVBz+W4hQVXfZorPhjJ5BFdhanOEnBABW8UdJBSQKUgcuCP9bSc/Zba+FM95pItZVUG1NnkcIkxdkCXRpVGHz2KHbYwM35RBE1KK70iyd3PNM9qdtTMpT0vgMjX766dDZJntPE0w7DMyZ7VqArNKMRllb3OaQ8OtY+VkzZA5C4EYQq5q19Dj/D4BOSbzp/Xr97GHroYE3zPwXcv8fw2zjANug2eJOYAlS4fekFutPA7RddH2DO72r73a7Lp1rnLERPJq4XPTyygE2LnPuI1
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:17:54.3393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476445c3-358c-4110-39ce-08df098b7900
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3586

This series fixes two independent issues in the Axiado AX3005 mailbox
driver introduced by commit 14af7a96afa3 ("mailbox: add Axiado AX3005
mailbox driver"):

Patch 1 fixes two RX-path correctness issues found during bring-up.
The threaded IRQ handler previously consumed only one frame per
invocation even when additional frames were already queued, and the
RX polling logic could mistake a FIFO error for completion of an
incomplete frame. It also corrects IRQ handled accounting and uses a
stream accessor for the RX FIFO payload.

Patch 2 fixes a -Wformat-truncation warning reported by the kernel
test robot for the debugfs entry-name buffer.

The two patches are independent and can be applied/reviewed
separately.

Testing:

Both patches build cleanly with the aarch64 cross-compiler and pass
checkpatch.pl. The originally reported -Wformat-truncation warning is
no longer present.

As a runtime regression check, Patch 2 was also verified on AX3005
hardware, where the debugfs directory correctly exposes chan0-errors
through chan15-errors.

Patch 1 was regression-tested with live mailbox traffic on AX3005
using a development kernel carrying the platform devicetree support.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Swark Yang (2):
      mailbox: axiado: fix RX frame draining and error handling
      mailbox: axiado: fix debugfs name truncation warning

 drivers/mailbox/axiado-mailbox.c | 116 ++++++++++++++++++++++++++++++---------
 1 file changed, 90 insertions(+), 26 deletions(-)
---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260830-axiado-mailbox-fixes-v1-42b9f4ef43b5

Best regards,
-- 
Swark Yang <syang@axiado.com>

