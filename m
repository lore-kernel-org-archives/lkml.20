Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202149;
	b=JY7o0TIFEGVTqhEjQcIogS9vZ0lngbs1gA6I0DPxi1CErHCd9TSSTkC6lgn2pjg/JB2k
	 2Nq57EAr3kgF6667r3Jc8vRuvLvledWcPCf3tSIVil28mIcShSxmFOYupv3D3GyqKJ3qP
	 kuStu2hQYc7sX3TsACQQwcTifYtzEitSgAmqCVWe9bAwqfO8loMGrPZMJEhtvQN4+IL80
	 87IOkboYTMA+QbXtj5hP1QVeF3bIV4hHXuc3Whr52O3RIErvBzGxp++uAwMifEBbDk/Jc
	 d0xKjvppYmIHtouI5eLEBRqUxMkunxdcuW5edjpX4qTE3vdL6VuXPfC32hUb3xat1bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202149;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZPK3G6WcUNJm/NBQA6x3rnmngrLs4UuomZbHOqt+qaE=;
	b=10oyLveAFavSNJCtW2uScRZ73+Wd0qMqUDDHdVdp1huWBvuy7FDHAdZZ4eAGQpvMoBNa
	 3g0MbLR9XcXGtubp79igGsrAf1NNMwMxnoq+XteGbNlArZZeb7tLnFzNhB6NiUuFwzFDk
	 V+ZrWNSjDTeLL2X5ELtBJu1EKEUaNi9iSCfgxb+ZFbLO2VPkSybJvAKvYM+uJktraqw07
	 j1HhrGG3y5llLiEbUMl46PpiDvxCJR9lRtrwtmmslRpPDCZkWZhDsGyNli5K3uhT8vCMi
	 a7/+kqZkIfm0+t0v5Cbt+wzQFWyHwN02G9Fm3AAWeP7hWNB8HWIrvAXOk2obQqntj9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=x1Pn3Bsb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.132
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021132.outbound.protection.outlook.com [40.107.42.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E804606A31C;
	Mon,  9 Nov 2026 05:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E804606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=x1Pn3Bsb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSStbsuGLfKAPCnwjwxWMVPXlVXT8pKoPRxgR3+q8IFUm0HIisctqWyJuqb2WrN6/hNTLEJAFuGtkoDigc1kQFDCCDs0IcJLA75KNFIUwyCl3O/oa6CTp8b+nmcNssDSUtj+zeYSn8xnzkh+7+t2rRToV7xsiMfwT2+lNmsz4T9PFv4++lqXuwEGGSwut2rhXWWgdz2jb1guyJodtNjgcaisWjFje9PNSOcZPL+sIuGauTpYBN4BztMacSem3domiuGYJ3+u5XkxWNl4+YJvhKRmucxF1/WU6TinjerNnvBKKvKnVxrboIfZSJPKRKRTKQ7pFewG+Jgg7a13XMwN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPK3G6WcUNJm/NBQA6x3rnmngrLs4UuomZbHOqt+qaE=;
 b=oKkyu1WVmg8gfGmv27sFbif5fWi3GSo8a+Rg1XUcSlJlp5scrTFz5nLg24O2lZ/2vZCNH/il9Tm24LcipuusefYPohaIVKJfLSU71jejuni5Vx6WcuG/itL+L1pYZMJRXEC1eYWue42po3bEYY7hcnOWEIrQ20ie1QtatT5TrbEUwCbdwodwwZl68P2pplkujzU3zHRMSOaKZEp96NpOUTpVox/Ani6oHenwBhQqcqPM4toilOyRWbBS2jAOVl0Inn0YwOtbXhSp/QPVUqYkrKQ7l/jAvEAFMhc0X6e67rCe9e/QtjWHLFg0mJ5xaSASWD4AivdS3RvOUNGCaJs02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPK3G6WcUNJm/NBQA6x3rnmngrLs4UuomZbHOqt+qaE=;
 b=x1Pn3BsbU1u0x0c2KUOhEgcm4fgyxUTEZV+F6E0+RiPOP2Th+U/Ibb+9Bz7dhqstNFAYb6bEEHSuCC/cGjomWSeG657dgkaIVMHsRnMCnno/HVebvzI2xyygYth6quCdRxFV4EXunGzexeewGGZTQtG50AlErrTU6MmUes5yg0yd9Q4MqBVNqeDV8MKdpZqA6lDWh1xRi6WuP4vpiNH9VG2DbPO7tXqqclDF3ES278nB9ZKegOqqNF76LEMiNUdL654oWgS6ezhCCK9s4gm2gX0glsDhfRi1rkyKgBB2XjHZPXG1ErJPTbNCuHhBQvUlkiUoRwrMC2cjnFZ7Yr7SrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUVP216MB596218.KORP216.PROD.OUTLOOK.COM (2603:1096:301:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:29:03 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:29:03 +0000
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
Subject: [PATCH v2 0/9] fix decoder corruption, stalls and seek issues
Date: Mon,  9 Nov 2026 14:28:44 +0900
Message-Id: <20261109052853.110-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0135.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::14) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
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
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUVP216MB596218:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b231d4-8a11-49ee-8ad9-08df3e225dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4vGHmVSAyFF8kGJe0arrj9C3J+tKdOcDTqwAK+NapKbe8bAmboC9xganFgte+kbaoeoBXq2QfsSQfS32gi0I6Z6wIT6y1Pam5xehAp0kncSfh6I9/oBROQobRfUbbEBR8nCZ4TGa4DIJN1tkmz3lSOmU96O3uRDnxgYYynBEJlsDMiCmrc4c6HDJn5j6vhwAkDuv6FtDu1OdFcEVBXuB2JW8mbVzIUyB17vSxzOmwJfOWgJbWv6pDVXDMf9bdq4+SQMWeWr90kFVnsmd6YZh3RPr0xsfz86kJEnTdmSPco3Q0cvmPE/ZPMSpbVXmtYUaVIIYOS1DWvN+NKwL8ctCj7gJbc9BD1UzjQEYy54C8Fs/xpvXBdlyVK0uoLLdYxvz7k9I5TZ+vimLxsCB2v4p3my+7bGwlv7eKYnAjrvaavyXYH7MFI8PEjFYKKT+xo2ydFrCmejN7hOtwFmelLmIimO+Cx8zMySQ4IA8PkRBT+hmK4Ts0YfpqObreEvZQRS054Mc8rTpZtNv9OT2XbmqLxGZWdGrLWYTrqlMgJlHuwbo5CwTmG2a0y6DXZ//YPaInlXyFxUC7MeXWXHOXZVdqslTmotO12DFdKHd4NIZApPZ8GACbrrrE1GG9xsrPd2BgvbnRNsu0gWKfuX74n9UlafpZt+QpnipRMmR1jUIiEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zUCqrhhB430SmuEWtcviuScOkmlUdJ4Tn14RsUzk568D+r3edIV/QF/jKyiN?=
 =?us-ascii?Q?xfhkddQT3rBSbiYs3D200wwq4tKrS0RNBD+Rxw59de7N270LFRl+OWq7fiuI?=
 =?us-ascii?Q?xOO/t5XgBPZHX2ogBLADucCmfWUcc0W8upd/xK1PT5Xeke5haF2VferxWHXq?=
 =?us-ascii?Q?ppzmTO0kUld1BRTlkK/T/+lBueqZvgWc/l6OMIHB+VI8puCqqHyLM+zxbygt?=
 =?us-ascii?Q?VM2KQeYAzrQ5KKY3WeBls6+G1ELBaxcLO/ZQPAW3qFzW+/QXgmS/ile10GG/?=
 =?us-ascii?Q?m9V+VSN8L1gU1E6d5od02HDTrGO1oRLMh1/sa9t3G/ouIBTGG/svi18DGBM4?=
 =?us-ascii?Q?lwy1KTUUoSoYhmEPDTIWwkOYOEIT5q+UjFzzq5+M7PAMPHhl+mX4E5hpx96j?=
 =?us-ascii?Q?jCBW8QP67pSjPrcAMFjYo5vbIi0Ux25eE9avOQDp7VXIQSezws/2+VaLOe7i?=
 =?us-ascii?Q?wScRGttYkv4aODg1floydDJucbfwDHJkz3qay6eygpMgKtIhEtI1ypX2B91J?=
 =?us-ascii?Q?fU7TcBGqHikRYI2h9ctaIUnGvSzgR3yJdh+db8i0z9IAtbwSe07BiWIwiYJH?=
 =?us-ascii?Q?rT7YCHSL5dopcteKU5/qt68u5HkTxYada18g8Vrh+YlY1tw/pnERZWPlT81/?=
 =?us-ascii?Q?BeM7/MAh7SpGLrjf88O52mtyvoP3hsuFgTU1UXQkh3Wxi6VA3bf8hsHu9xuz?=
 =?us-ascii?Q?IgQuDyf8N4BlKZkfyJscOVDmy+etRmfmjsEduOByoA5TfwZb0yPmpUA76w2T?=
 =?us-ascii?Q?sBHZYZXk061PXdf+zpJ1+MsDvXPPOjt2Q2wIe+NIPV+CNZTUUMxTHhRRsQpz?=
 =?us-ascii?Q?zh/qW5sji0oDdCv1r6EpEngqR1Qg5I4vuQ9yMok8KBDazSvQ38QNI1SP720X?=
 =?us-ascii?Q?6IfVUMAdpUepEPNIup5cXmBjQVJaVY92h87/GF+w8EO0ng/kOFu7DtuF+QlI?=
 =?us-ascii?Q?zWUfYaNd0oVPf/ZEKR6y7ANuHc0/KNKYoGLrObMyK3rVSupwL6fyaDCJ+t6/?=
 =?us-ascii?Q?plxQzFnKuFf1OIqbAr7ZnGZr3pSr+SpCcf6h8lm+WcBcL+pZoMrNw+ABpTf2?=
 =?us-ascii?Q?tc5KPT3iLgtxF7RZQYEnwF0G55miZvFa+YQx27WRL3LbvIjsSvQxMS3jVSwU?=
 =?us-ascii?Q?3V21ytrdOwHZee/SbNPQgx0qkldhXASKs5HkFm/YfUOktNly2P/+HHgIVNrc?=
 =?us-ascii?Q?oezJCSUp9fnYpZuXsUSnbMPn9lu+UqB+eP0OzUHrbLYFQwYgvy9vJE19wUXh?=
 =?us-ascii?Q?bTT9NmsWvga44PdZUW8bQI5tFGi3gb0aLPUW5clUVO6IOjBNMUmfmohsu4OU?=
 =?us-ascii?Q?n6cn0j1ChhhfrLn6r0ce2rn+bP7qlvHyFq9chrPHyD2FuTIKlUv7Jwz2ZR8R?=
 =?us-ascii?Q?2mu+ayQ1XyKn8YcClwdBSsBUgcLagVD3TyxxVjDFaJVLgFXUL0k3C+fGgulc?=
 =?us-ascii?Q?RTcNllqZV8/wqxp8HLiRX5m7b/ADNb7OVFhzKxOZIJkHTIkIEKWQlBH7dBKo?=
 =?us-ascii?Q?xrYUW///IWfCeDdpjpe4/tKyEEv1SlIp840Ux/AurvBfaUyNXkbfXLkcQb2J?=
 =?us-ascii?Q?YHSILh4i0LVyc/3tgzDMZ2+Hce0Tx+cPo0zmqU2YZ4jZrNoVH9ulWXJ/cR/B?=
 =?us-ascii?Q?TGEP7CcOOPqHA0Iu0tYRR9AcYnry7DB6buJC/vGNUvNJi1S0w3jiANBApAUp?=
 =?us-ascii?Q?c7vhb5NDc9pfOzIV1OHuu5saOjH4jTrsHmINd5g47QzhuxQW7YHdY3OWaQsM?=
 =?us-ascii?Q?tbRh8es7YejLABb5Xd242qwwtPvZXNw=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b231d4-8a11-49ee-8ad9-08df3e225dbd
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:29:03.3563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4a2XTSWLAQoBARsxCyFDg+IZaqYUdmN/bgdfdn8cguVGNPJdzmpmf8xsSDuQ4d9uzDbahjNbE+rC2azTf+Y/s9LHv7C7QCiLPbaHENcdjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB596218

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

Changes in v2
-------------
- 1/9: wave5_handle_src_buffer() peeks the head of the OUTPUT ready queue
  with v4l2_m2m_next_src_buf() instead of walking the queue, which raced
  with VIDIOC_QBUF adding to it under rdy_spinlock only.
- 4/9: Reworded the commit message and the comment: the firmware does not
  update W5_RET_QUEUE_CMD_DONE_INST until the interrupt is acknowledged
  through W5_VPU_VINT_REASON_CLR and W5_VPU_VINT_CLEAR. No code change.
- 5/9: job_abort() no longer ends a job that device_run() is still running
  or about to run, which released v4l2_m2m_cancel_job()'s wait early. A
  per-instance run_lock is held across device_run() and taken in
  job_abort(), which now finishes through the same ownership check.
  start_decode() leaves the finish to device_run() when it fails.
  Wrapped the oops line in the commit message (checkpatch).
- 6/9: release() disables the unstall timer instead of cancelling it, so
  a device_run() still executing at close cannot re-arm it on the freed
  instance.
- 8/9: Wrapped the oops line in the commit message (checkpatch).
- 2/9, 3/9, 7/9 and 9/9 are unchanged.
- Added Brandon's Tested-by to 2/9, 3/9, 4/9, 7/9 and 8/9. It is not
  carried on 5/9 and 6/9, whose code changed since v1.

Link to v1: https://lore.kernel.org/r/20261007015946.53-1-jackson.lee@chipsnmedia.com

Testing
-------
Tested on a TI J721S2 EVM (Wave521C, product code 0x521c, firmware
revision 363254) with GStreamer 1.24.13 and the v4l2h264dec/v4l2h265dec
elements.

fluster (GStreamer-H.264-V4L2-Gst1.0 / GStreamer-H.265-V4L2-Gst1.0):

  JVT-AVC_V1      77/135  (-j1 and -j3, identical per vector)
  JCT-VC-HEVC_V1 133/147  (-j1 and -j3, identical per vector)

The pass/fail result of every vector is the same as with v1. The
remaining AVC failures are interlaced, MBAFF/PAFF, FMO and SP slice
streams. 11 of the 14 HEVC failures are Main10 streams, which this SoC
does not decode ("no support for 10 bit depth"); the others are
PICSIZE_A_Bossen_1, PICSIZE_B_Bossen_1 and DELTAQP_A_BRCM_4.

No oops, call trace, workqueue warning or "invalid display frame index"
message was logged during the runs.

v4l2-compliance 1.28.1-5233, SHA: fc15e229d9d3:

  Total for wave5-dec device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 2
  Total for wave5-enc device /dev/video1: 47, Succeeded: 47, Failed: 0, Warnings: 0

For the job_abort() and release() changes, three concurrent
v4l2h264dec pipelines were also run looping a 1 s clip with flushing
seeks, seeking to random positions every 700 ms, and interrupted or
killed 100 times. No stall, oops or hang was seen.

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

 .../chips-media/wave5/wave5-vpu-dec.c         | 337 +++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpu.c    |  29 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  19 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  14 +
 4 files changed, 334 insertions(+), 65 deletions(-)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
--
2.43.0

