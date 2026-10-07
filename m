Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020125.outbound.protection.outlook.com [52.101.156.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9017A2F6;
	Wed,  7 Oct 2026 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791338404; cv=fail; b=dQE6N6MK+JsT8LppovOGQQiiO9fhndn/Nm43iVcYMYxuXjfCb8OTivHuod9vnb3oYYiVaq9bimIKnKoUC6+5Ea+ByLCy/eovzlB/TdkPONCXeIXvV6E4u3/j9EU9lQZ90w5hyep4FbC0IykE9WichgGai5OvskvYYao49mr5ZbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791338404; c=relaxed/simple;
	bh=AGu6Xyg9iCykBeJgvJj1hfsJAA0OZNMC/wie1FQraig=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ASJNpPcQ0zBeNgpdvGssokQnR4oG59gMNN70Rb3TukThXDJ/B+mPzVNwjz+S0kMv71wR4CD9siw4PHG9oJZqvOe8lwAmEcvMkhs1r2l4KW5gKWhAelD6Swrz5frKUIBlB9MTKzmRg7ZD29xnrym5U7PtlTP9YDK/zDBRKM7DAVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=osjJUQOb; arc=fail smtp.client-ip=52.101.156.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="osjJUQOb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9kE1Vj5ARpOmmcWgjS0uIKP06cWpS91EJ0hBB7AOTSj8/6X4G+bF0EsNWJffcU7Uvi0FxGH/MDBqTbakZRNSkCH2ca6Z4X7EsqC5Ww+I2UppOZXiHgkXGxgblbaD2UCwXjm6LpTrRgWkGxsrhvHwAQkERWCtyvtoT0pd0qr/FyMMIei3BT0Nn+gc9040edwgZ/z777RUZvvB1jkBRTwkD3rx3tzAj++A5ZhJRU/3ni8u9YnM95+L528PG56yotq4gf2p8ZrEEf8/Dr+1Y1cJNWuEjnV8z2U/4m6co6MjDla9hkHGzcpp2yjR1DdOs2sLoK9W+s1ErVaSMJ/vJBf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbkptDG5ADA/6o/ljblgOPY+Cs5eOotMKpT2I7RhI6A=;
 b=uVNMxfqAoz87W7Fv74Ucj71bK7pTi+w2ZENOxtgQWnzQEwBok8p45LkqISjDTs0B/E166KEe3eHXWHZisTVe4NBAY3WJx5eYimasUM9AljZi9bh89mKAMFFrEajS0BquuBYDxHTwimymyO8tV3fuTlKYnnQaksIBFcz0UFQSYm4KTZ4UR25VGMdQHp12kQDH7LKGQInRiLGqBJ1bUS1hSpn/TuJmek4mgb+PdCtQjx/KxWudLIGo/qUfJTMNrJjdu8WaL1IRWA7Ws1eOkUhPn6xLrza7ZZ+77LTitCi9j0Y1I+DEE8NdbWH+O2HNvuyolK2dG1xhF0fVq0L5XhOdyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbkptDG5ADA/6o/ljblgOPY+Cs5eOotMKpT2I7RhI6A=;
 b=osjJUQObxEE4D4y/+oz/qpxVjzaOOxV5U75E73mPDBUh/67X+u09F1Rd2cOEYDVjcXYeT5nu0PIKRPtriXuAjeEIm+RdGFdrMDW8qctjmmxpFHWCn/4GT3mQsRKG8Q3YT1Ei7F4j+Y8HIy0sYT7oTxNx27FBgwifgJkJUNoePVAjkHIwAbbNvS/La8Yj9NpUyOlt6OSXQ+qabwmmiCN/bfg2lTO8uSZXRi9cIZJ1TJ4mitCwScNKYiAMaX15d4deWmKhlv5tkxzHR6tMw/lz6ezo0HsOL+RmBW1n6oYONuYI2iHIiFQ1bJvYOut7tykHKKh4I0zwTWXkwCd847L9fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE5P216MB118462.KORP216.PROD.OUTLOOK.COM (2603:1096:101:310::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 01:59:57 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 01:59:57 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 0/9] fix decoder corruption, stalls and seek issues
Date: Wed,  7 Oct 2026 10:59:37 +0900
Message-Id: <20261007015946.53-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0127.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::6)
 To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE5P216MB118462:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ee6ab0-d542-40bc-f799-08df2416b01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|23010399003|10067099003|56012099006|3023799007|18002099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	L3hUhc85St2HzSwHFX+EHxOZDGsJXtfUkJCXiOgsL+gq7gFLGMd73xhpbRSc6qTT1RsXjJp7S22Djvzp9na29ij+PIi5O2fSRCJq+ElGvzNUx8ad1vZWwzAuhgQ4KJ6EVybRDqe+MdLw1JTvkKKy92sM3/Sl752PYm418ARYJ/HqiD1qVCidiShdImVZak3u80W7vt9wlfojIPEzKwFlpWRl/4CkA7IGBFbBq+KDsuiGBmpcQEdqoDnQZW9Th5EkfjeuNwk5lfNYQueb3DQl+Sy6gxahDWA1Itnaklw/j3SObrjnIMkSmZp+fGd0tCSq3kA+r0R/28CYiIqlN+m87FXXd3nVQg+iRt3lz0oLMRb3c3y/GG/ktL7fx4YKbnsCRocAW6i73SMluJBNTCq4EmcncWIJ3n1siGoWJktjKXWNdCsJJwrgj2LMlQNjlNYzGDE5pmTlxesaCevoWLFA6JDtXyBOGxWUIYVWxNDN9WDH+iMLsktAYUcXeHE6HNXE+Mtp6BOqDdq6oNeiQaQDtyKgPKmrhL9YePII69/mCj+6xbyDWosTq59Kt3esK9kJw7C8GpkHBIl5qHBx/4dIkuOPjNtYHGXgSpPri95c5RU7aQyE1iYcAhfcCSZK64dJ9jOdEihxn65ueELaCLU6QUxNW7iiPBgkeyo1MPqdOK8V9ocrT/Vvz0DlMi1o+v8EpJYBNd7UbVtaMJ0sKbmQtY4DsyyGuLjgk9401jK8Bm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(23010399003)(10067099003)(56012099006)(3023799007)(18002099003)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M+B41CO5uGq+qPsuOuJqW0Nee4lYzBLQXLKo9tX9NqEVAE7Ooebyg+B5vIUf?=
 =?us-ascii?Q?0TZoIDDqgkQJBLv3jZqWyj8aNE+C6ssXciZ40fQ5lHz7fVwXI3KVoSqQGC7l?=
 =?us-ascii?Q?fT50XeCnnF2xJUBaU8kSMcWqOEyXz4DyyvF1aX0QoXVE3736AzIQNWB0Jk8d?=
 =?us-ascii?Q?FhGubeGyvZti72WFQ+wNHS3MOSEt0pHkuJ2JsjJmFW54cSBMuYE5V5OtFKg3?=
 =?us-ascii?Q?ytWKIAFTvHiYD/wR3gQyNyzXB233XIv0x6othEWhCixdiYhHmMnpEzinLydN?=
 =?us-ascii?Q?6dD8Gt6JEoHlg18Dy7+TALG+XtZx5zSJ6/nhb5WyD7cfmLL/RzmgN5MhEZfs?=
 =?us-ascii?Q?fz1i2Xluf7t+8c9gjF0VojXf2GvLcF2O0DBZT1EoWH8kgOLhmIuTCIIY6RR9?=
 =?us-ascii?Q?r20A18HryWf73JI/VP2hPF2y7JGKWagS8Jkm0IBx0pGGWZPYMr7bcdX/gKkQ?=
 =?us-ascii?Q?C55o723MBJw6wlQyyEGMVUcwocCs97VbUr+iD6DdYKomZaiTn//Oc+bRuMtg?=
 =?us-ascii?Q?Sfxd8mdcx7U8g4/n77Hu12lU1vpqnAZz0ZCbho8MWIGST4kpZyGhCBbH/bAI?=
 =?us-ascii?Q?CSab6R89g0HJAk1y8Lbm8/E0E/eRjthVeFxCvWXk+AzpoKniy+adOVwL+uL5?=
 =?us-ascii?Q?2aBWcZ06Blh8s40wALzazYuhRmHRSqLVTDEJ+rTDP9AQbLftdfLFGHItm2vZ?=
 =?us-ascii?Q?CidbtiK3lIAr2NpXROLC6/6Bv/1EaGARKt6PCC6TKK3AETtBixo3FmO8w/vT?=
 =?us-ascii?Q?7kYZgpeH3RFZLq9HC1cxfJpNk8auOHb/PlrEvp5UcbHQbTfUPeXFYNkyo9b8?=
 =?us-ascii?Q?uoDYYZYJ1rKOSXkHmI0r9ADPv2uxKVZH1cN8App+0Q8GB3PbrVC4ZwsL0cw5?=
 =?us-ascii?Q?U4CFbXaIS2yki7QsLoeztcPdUdr1uLghB0j+nqXLAHvHqub0lwf0OhAvaNI2?=
 =?us-ascii?Q?AU601yUMZneomlDB6w+i4UIHMFmuzPobA4g1etVDdw2axmqd/cgWhwp9mH+q?=
 =?us-ascii?Q?s2tX9CIl5Xl9FNQghW8AmQ7M0C2D+7nNL+zGQIKVhlSck5XdfNM7BC+DgjvQ?=
 =?us-ascii?Q?bjCDhTgM3uxmgyMcJhpZDUky4WBVIIfOcyHK9QLVB2ChzUXqYrtuVLtlueHb?=
 =?us-ascii?Q?04Tp1H3CqVQyRxA450l9QaS2ttXockHSzY89T7X3Kg7p/eZuSNTHla9zk+8k?=
 =?us-ascii?Q?aVx6OnONCQWgIYV2tsscHXxvCdTSx80Vy0HkgN458S+RWprm4znz8Y1YfBgi?=
 =?us-ascii?Q?fkrQxv2JUCUxwFGts1x8TVje/lkqR+5UoeY1AcfQUXJNsLhTnI0PZgO0VqEF?=
 =?us-ascii?Q?S3FtkvOXyyjb8G7H1M/u/zgjIuTWgI4EnCGQAnJBXWezXQsSi8ECodKiqacv?=
 =?us-ascii?Q?uIXWVZJn+bY+Q8u/WS7T82F6jxvfyNgU5gKTZlkbW33L2vU8l1LzQxm8qoot?=
 =?us-ascii?Q?W9wldAiXq8pEiee+iWHZ/9paoMQrWwyQQx/uiBUd2j/tmQdgM132tkn/O2xT?=
 =?us-ascii?Q?JjpGUH2LSdRlpxFi1XS9mJcLU8oopaJzORP8uBdbZ0yR5NqNv88flkfaWzsU?=
 =?us-ascii?Q?cREK0adDieRzRtZH63ToncRtLT6rNVjI8oEcFK40FcaHgek36CohClwl9L97?=
 =?us-ascii?Q?Gc0/GiefudeVRJDB7Uq8jES0bJa1Hcee0m+mFwws5QBg8+UL+WvCeNV95/3H?=
 =?us-ascii?Q?tLZPYHliIXaJ/CmgVeU4YSubeOcZ/kwNcfAjdn5p7l7sZ2nPV+y3vUhNauJk?=
 =?us-ascii?Q?0+iQFRhzYyH82kdxalMOA+TqW5UENEY=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ee6ab0-d542-40bc-f799-08df2416b01c
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 01:59:57.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VkFvDiEzT2HC2pAZlS0f1rVYvVgGHkaZaay+Kq+b6DVB9VsFOzebfAtM1UCLy6FnOLKqYMQZ9RSStxIj+SvXuqJ/22a9DZ6tUQcbAf9SnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB118462

From: Jackson Lee <jackson.lee@chipsnmedia.com>

This series fixes a set of decoder problems in the wave5 driver that show
up as corrupted output, stalled or crashed instances, and lost frames
across seeks. All of them carry a Fixes: tag.

Locking and job ownership
  1. Serialise removal of OUTPUT buffers between finish_decode(),
     streamoff_output() and the start_decode() error path.
  4. Acknowledge the interrupt only after it has been dispatched, so a
     completion the VPU adds meanwhile is no longer dropped and does not
     leave an instance waiting forever.
  5. Finish each m2m job exactly once. A second v4l2_m2m_job_finish() from
     the same context could clear curr_ctx under v4l2_m2m_try_run() and
     oops in the m2m worker.

Decode scheduling
  6. Issue DEC_PIC only when the ring buffer holds bitstream that no queued
     command will consume. The current check compares two unrelated
     counters, which sends commands against an empty ring or duplicates
     one already in flight and corrupts the output. A delayed work restarts
     an instance left idle with data still buffered.

Seek / flush
  2. Drop the consumed-byte tally on OUTPUT streamoff, so it is not
     credited to the first buffers queued after a seek.
  3. Wait between FLUSH retries instead of spending the retry budget in
     microseconds, and ignore dec_info when reading it failed.
  8. Re-establish the display flags from the vb2 buffer states after a
     flush, so buffers held by userspace are not decoded into.
  9. Do not reset the frame buffers on a CAPTURE streamoff that is only
     part of a seek.

Timestamps
  7. Hand OUTPUT timestamps to decoded pictures in decode order. One
     completion can consume several source buffers, and keeping only the
     last timestamp lost the others ("Too old frames, bug in decoder" in
     GStreamer).

Testing
-------
Tested on a TI J721S2 EVM (Wave521C, product code 0x521c, firmware
revision 363254) with GStreamer 1.24.13 and the v4l2h264dec/v4l2h265dec
elements.

fluster (GStreamer-H.264-V4L2-Gst1.0 / GStreamer-H.265-V4L2-Gst1.0):

  JVT-AVC_V1      77/135  (-j1 and -j3, identical per vector)
  JCT-VC-HEVC_V1 133/147  (-j1 and -j3, identical per vector)

The remaining AVC failures are interlaced, MBAFF/PAFF, FMO and SP slice
streams. 11 of the 14 HEVC failures are Main10 streams, which this SoC
does not decode ("no support for 10 bit depth"); the others are
PICSIZE_A_Bossen_1, PICSIZE_B_Bossen_1 and DELTAQP_A_BRCM_4.

No oops, call trace, workqueue warning or "invalid display frame index"
message was logged during the runs.

v4l2-compliance 1.28.1-5233, SHA: fc15e229d9d3:

  Total for wave5-dec device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 2
  Total for wave5-enc device /dev/video1: 47, Succeeded: 47, Failed: 0, Warnings: 0

Brandon Brnich (2):
  media: chips-media: wave5: Ensure Atomic Access to src_buf list
  media: chips-media: wave5: Stop FrameBuf Reset During Seek

Jackson Lee (7):
  media: chips-media: wave5: drop the consumed-byte tally on OUTPUT
    streamoff
  media: chips-media: wave5: wait before retrying a refused flush
  media: chips-media: wave5: ack the interrupt after dispatching it
  media: chips-media: wave5: finish a job only once
  media: chips-media: wave5: decode only when the ring holds unclaimed
    bitstream
  media: chips-media: wave5: stamp decoded pictures from a decode-order
    queue
  media: chips-media: wave5: restore the display flags after a flush

 .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpu.c    |  28 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  18 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  13 +
 4 files changed, 310 insertions(+), 61 deletions(-)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
-- 
2.43.0

