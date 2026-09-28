Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA798499F12;
	Mon, 28 Sep 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590983; cv=fail; b=i8SRMWMOmUJNcapXCO7RVdOjj0DE9M1AvJOeLEl+1x6EIXuJvT+9M2R5Bgv3Gg3GLVhN1B/V3HAtfxeCvEDgiVKQzKtfAoK7AFuXxWMI/e5dGs9vBqxvqOXbgBUbdgJwLZfKAykDSL/o70TBXe/vWuXJoWWtwjKg9sxZS9HVrOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590983; c=relaxed/simple;
	bh=FaSoNwEjQKpg8SIGxCNfXW8MQYWs5fWKCIga4GH+zEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6YENMzbomUMM86QPbk+Xx2KJPPnramPXdTJrHiYdrpDg9ds8capywG2eH1lvQxtyNWYYRLXAyDe1IG89IxDBYSHlQ/S+ehx8BL8Rt5525uacLWxziannTLxM2xYQb4PrkwCg6PEpeXqfDSbDh5NIGZHG1YwBG3LpIf4Ghf9GSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjbqyW1QaiPUytmP/zJ1zbb73PPudHdwGtNkE3lC4kFGUHzaAtLFd8tsHdzSM+vVWwG49slTl8amQpP5pol/VgYF5i52wEGnBXzdc4HotUb0+GeKTPyES7OJz2chYZqXr51MLCtL+FwRjHGhYWPv5yv2CQd8ND+EIaCu89yXA40UjAqtTRs4GTDwn8TgOcJWiZYGwiROM/WBVo+DuKbjlrrXp+koMjzfcfoztlZSLPQcBr9QiCUSXL1mXtbwj6YR7aq04GzHnPppwMnQkmSMxXEG1HNQb7HuJslVJLpVI4vRHTwxIpWG8J6J2mRJyQtTVhiyZyMHNoKyAOl7ayw+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5HwX8vHBkKTiPfwsjAcd9w+OCCtcGnfCfVuSKPtno4=;
 b=KosLjo5zNh1FDKJi+NG2hZLdH4kq0B1myOBhVA76Kzpgg4W0kYJdLKx7WBqlYdenOV6QfWd9KNxA3OzlU8AeWIcoqHha64YFEETJK+xfprznAtM0PGXGJ3BIPcik2zQ0obBrnlpQ4vANGTerAPZdsU8/LVFy3ZdoDd5B8FJtTE1v+GNFJ36ihNL535hKaku400P3Nd6nh1fGQyDBLCKI40kOybfitOW+PA3HrrX8lOwe8JryRes+G06aIH2KNj5jzZVfgEMp3byKS6yrAdrDcw6FzKUhb2JEHVsRbToYuAcW8DEyA8nXKjk/CdCiif4YB4f/r4AWzxehTKDpsEw6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:22:58 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:57 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 3/5] media: qcom: camss: vfe: Fix VFE reset while another line is streaming
Date: Mon, 28 Sep 2026 15:52:35 +0530
Message-ID: <20260928102237.533341-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928102237.533341-1-hitesh@ebytelogic.com>
References: <20260928102237.533341-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::6) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: e498a232-20a9-47f9-1def-08df1d4a7726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|3023799007|6133799003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lm5nnG8Wd9vv3MDy9Kl5YxUrLFNs8acVFOiIiFYSyhhxoJZ2UaTb8YnnhcHD9W3hQw3f9LMx7n2Y9O6eTP4q+lxs9I1kNOHU7er/zDYTiAowgBbGGR3mSh+UUXvTtMhr9NYi/YOVaw74D742eftDDpebGr0do4PO5D2+8q7Zx44szvUF4ilIoyncNtUtwzLOOkc3bBPJ+l0oke4E7yNhIPNcAfkulXYKJyUfn/a71ksHX5M0aM9M61+B0RvC09nk/0sjhQ7KHvCLOSDAXhSZspF6VLpWgPlcdduPDBLbKMLR3Xcn1Z2iBDS1SPIDxqczH6Ga+b1aln9owINCjYQzOeVKq0UoHjKh/eRr/+da/Nk7bO7+trbmo31T4oa2VPuo6nRudgpcgXEYCccpwsrrde0O93fM0wHpYbsZLyXfhdtBOmLiRiRJQoNNTnlQqI/7h1NaliaJKHX6/Pc5f92nMfK6LMPu+ELLBTiFCvc2CECfoXuCPj6QyC8h0e7IG4gGYpiugXz60kdT2suXqLkTlLUgTpm5vfmITG+juevszxlf6u7vwpMlZla7pSA4LTP9rP55rSZPBYyfpqZcThVInavygQ81jPf0zn5R3AQeZy81aiUmpWoRqVAPZe83eSeIdgtNGdqlbpXediyvTpWZILpwu5w654Do/+9kZzW2Sx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UxsLnxzaUKoCTWHzoUqkTuTDrR5ZYK6pJF9Z4WINP9WKOqa9AAkaLP7S2LX6?=
 =?us-ascii?Q?+MUbPjWZt4kCVx7YDN0+VFYk8FfCck1WOSOJ45ti8qZ3nIX4qdXjYrW5Ujfq?=
 =?us-ascii?Q?AyiKvylnvvSm2JZcpe66kmrl5fukoEfVPODDpYndYiiS70n8RH21y+xIL0VH?=
 =?us-ascii?Q?N/jz5f8Mj7h76qaRjx7T9W/fRLQz00p7p2Ubm/6baZQ4pHROBFxIC4DYWcRq?=
 =?us-ascii?Q?lede7AecKqcGDr5u7qMyDSuwWPxTG4BI0jhlpyafwGlUdSKdfJVD8+0doZLr?=
 =?us-ascii?Q?oxwbYBtfzxgJskHC9Fe6TqFx1idldrmMhMsNIGqW5IGJcxIHY4IkfD3BKWAs?=
 =?us-ascii?Q?DOR9GJf+EcZjAupEBktweDyJ7XBx7mWUuD7cF71kEeqeL8it8B3Z/pi6IIrk?=
 =?us-ascii?Q?z/aSFjewU8euEct6Er6V6Sp7j1GzMqEqkutbwBJ7ZQiFkCarts87MpNCHHRe?=
 =?us-ascii?Q?TsCgMhm0ZbhbCZYRMVfjUcIlg2kbqHVx+kEHVLWDrI5DuzM+Mkq63fVKnOXl?=
 =?us-ascii?Q?IJlDxPqHRybM8WF98KbPq4PqvbCKuqhDkjD2sfmHybudqLzmZk5W+V9xqvG5?=
 =?us-ascii?Q?Nb7ryic2DhbJgfvqtH045hs5KXc8pACCj6kOSBqmHzHXrN8jI5QmjxPV1oXm?=
 =?us-ascii?Q?i/szeT3Si9UutbWqag7A/3tXB27/F3VN9xBcRtFXYFba4aRMrKiLoe4DHmtV?=
 =?us-ascii?Q?/mmMX/F/urDUpapUA33QZy9NznbC8APNfpk2zbjzagZcplvB2Hy9YN0i8y8A?=
 =?us-ascii?Q?TlhBur3aw5yasm+EcOeGglea826cfN902flepz+2k0QkRlfLEvWBqJdOe0ZN?=
 =?us-ascii?Q?3bA4O3ETWIhX2ySvNBj3JWZybCctNWWmOS6N3vdT9vT4kRvaTrPOf1b6TV9l?=
 =?us-ascii?Q?D9K0ozdXKvAia0tTB8lBcVEwyQUkY+LRDDocQVNN3DSkRZ+GEPKGkHbWQmoi?=
 =?us-ascii?Q?703yqrgrk87iYv1TJcLqVglDiK8z8FR6ra35+D88CoR1r6dot54znIdjGPgu?=
 =?us-ascii?Q?rKXT8foFwRhjsKAkg8QKVLeWIGw6oWxwr8AnPyuuiv11Jj3ZpsiFqtXzsk1a?=
 =?us-ascii?Q?T7lu8sJN1HawgnhdR/lGIIPXDYo2gZXKk3UWMc0lxqbsPB1d+5s3x9lAL1BQ?=
 =?us-ascii?Q?YfufDFD+AqYYn/f762hQMBcl3RiT4gqktB1aoViIJ/LjSnK+snwBp6WfCYdp?=
 =?us-ascii?Q?TGQHsHxzp3NhODugp/B22cMbJYWXeuiU4GRrr+DNKqf7tgRQNylaEgunWPc4?=
 =?us-ascii?Q?e1lBJHOGOWn4XYlCR6V1tF9GcTamMOrOINJRlDUMrl0VJzdNczsi7LbzVfa6?=
 =?us-ascii?Q?PDtCqIFJZswdbU6SwNUHgnCEk/qvgiR6n43A1Z76WCpLy604XJT3k8I8wE5F?=
 =?us-ascii?Q?TcN6adTDbkE7a2FXOBSm4LVPP1xvAUUNpCwI/hHpreTFfN1cIUgaRIl2mZSq?=
 =?us-ascii?Q?mSJE2A3OLCwaaug/eQ0zvEn0zcQGOi4WSP/pOFDYfZXIAZbL2wOhbiZ7KvhP?=
 =?us-ascii?Q?Xqt76pESvnANZOQ9sieqr2U2osDC3TosYvrKGw8/mBXi4vVFLQGljuUSpqQ3?=
 =?us-ascii?Q?707xfdeLM6/etoJBBB46kho16EqN6wm7D3hLNRnOfzli8lpyaUmLPvi8F0qz?=
 =?us-ascii?Q?n9hTsb78Pu5tGZFaQPzTSNV+ZawDEwRn2Tib2dwnYmNUglpLiAVdBrkp2EGh?=
 =?us-ascii?Q?Uh4obK2ZfKeiE/wxp21y40pQQz3SqOwWsxz3WBBkxeLH5q9F9herYIfb4P6r?=
 =?us-ascii?Q?PGZpjSFaOId50x7LILagL9o488wv2YxjqImMoBRylXxNVhM8cVayR6WxG+3s?=
X-MS-Exchange-AntiSpam-MessageData-1: aexDmVBB2i69jA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e498a232-20a9-47f9-1def-08df1d4a7726
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:57.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ItYenUZyazMpkxYqbKLLmxpfkhSE76Q/NgLllRO0XuUB+8ro5dtafvwnF9lCEhmN6KtHmyYutkM20pppDFBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

vfe_disable_output() stops the write masters of the line being
disabled and then resets the whole VFE. The reset is not limited to
that line.

When two lines of one VFE stream at the same time, which is the case
whenever a CSID demultiplexes several virtual channels to different
RDIs, stopping the first line resets the VFE underneath the second
line. The second line's write master configuration is wiped, the
buffers it had in flight are never completed, and the VFE is left in
a state in which the next global reset is not acknowledged. Stopping
or restarting the second line then fails with:

  VFE reset timeout

Move the reset to vfe_disable() and do it under stream_lock, as part
of the decrement that makes the count reach zero, so that exactly one
caller resets and no line can be enabled while the reset runs.
Stopping the line's write masters is enough to quiesce that line on
its own. With a single line streaming, the reset happens exactly as
before.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c14d97a131..d20cd4dfb9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -821,7 +821,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
-	return vfe_reset(vfe);
+	return 0;
 }
 
 /*
@@ -843,7 +843,8 @@ int vfe_disable(struct vfe_line *line)
 
 	mutex_lock(&vfe->stream_lock);
 
-	vfe->stream_count--;
+	if (--vfe->stream_count == 0)
+		ret = vfe_reset(vfe);
 
 	mutex_unlock(&vfe->stream_lock);
 
-- 
2.43.0

