Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.150.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539006;
	b=eoRON3WzxI9l5V0TiIKsr/uhJSGVdKZYcXs77hvVtb3NJRgrnEZae2kQlMPCH47G9VD3
	 ZufLdxWppNk2L+pZ5kM+5FpR+2Mfb+zm4f0xYS5BO6Z4cd7hpGyTYPRL9hLkX0VKBuznv
	 L5zLerLSwhThF+hQHSxQA+G9VV4DokPmgrpKePNqYZjsnIUja68HK/Bk2QIP/mh/DoWL/
	 i4VmUvV7zEEmiBUylRGeY81jH+G/R0TIhJ0wo8QH+18+jepvFOTG1SRFDc5pqdJ7e81GV
	 XUsvR5P484HdcBHytsfTodelpiyInFhb0oHbrgBbH2/zG63fdjQEVryCtyeHCMLdO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Orig-IP:X-Proofpoint-Spam-Details;
	bh=UZPdBtWA9pQKMZMHNBUh0eB5Fnnm3slLNwC8Pi8shQo=;
	b=jchW+TEGaHAzb7KmY61zIK6q4CwfMBFSpCvC5eev1McCGi1aEQc4ekq0CZwKxFj6nke0
	 HvKv6jMzCBjkJlGuABmVenDVi4gf3UI4sgOoD0UkFhfCHtSZEgySD+eiSHkzCqzt4jx80
	 p8EgLRpkwZkbGU3NpWHPIGzB3v3OxWwLsc3gK9fYZag0dA/BhVHBnUiASL2S4+fMjFAom
	 kuUMs9fDgfQ3RtFkmmL22AUwHw1cuPgZqf+Wrq8TqMUB6CK6tD/gGccZTq1l9GZRAz8Ar
	 EPWVXnS149Dl/rCBo88quxRCvAldFUHQL1PUtJAVJTrAmJXjMmtYKQHhbX1TuAawg0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=pkgUP0GT;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=R6rAnkXE;
	arc=none smtp.remote-ip=148.163.150.240
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE84C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=pkgUP0GT;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=R6rAnkXE
Received: from pps.filterd (m0355794.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACN0CkJ3698672
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=UZPdBtWA9pQKMZMHNBUh0eB5Fnnm3slLNwC8
	Pi8shQo=; b=pkgUP0GTSqLkHf8q+wXoGyenYuJcwhv/WLF5KOZDx0oedEdUhbJF
	IRUw68ezuiY30hzY1AFFGTZDBvvDM5TaDPpImCICqJSQnnC1FCKzIcAOckZ4oawZ
	uhZpl2jjEOguHwBtltTsDAaOuk5ZvcYSz10Brod3iDGaziRO3ZvcUiG8O6HFNQWf
	2a8yPwJqECVxUKoxRqMDQhNZX+/+YledREEXEvxJNZcA8DU5zAtw5yN+7KPcN//S
	AXaiDczMdiMO02v9TZASFkXHfZMySSelNW5YuUjH1uTPBhjgnne0hPoOUcZMnd0R
	AIZ5poKlDeXY1SjGW8kERH5LbBhXWwGjtA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hwk9sp02c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:03:19 -0500 (EST)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3b3590684so9511947b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1794538998; x=1795143798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZPdBtWA9pQKMZMHNBUh0eB5Fnnm3slLNwC8Pi8shQo=;
        b=R6rAnkXESu2Q363z3aAdgxXzm0eYqZEvsg5siKL0IT0cya/QX2mmHr1bldf02AruO8
         /Vym84hBFwTlbMOTY0GA3jA+R9/1QfJBodGbdqDlvjoe2mVQDhp5t9Ytf4WC7B8wg6ca
         8zwjIR+RR2Bj6lNiNxrGpBmF/CYxDBUVfe7M6ztvpOZwACzydj9H2SGG9WoRagjJdU8u
         J+/JMKFc7TucTWHUQW6Xf1qqeyWQjNGHH2YHBaPxT6+CwF4MDtE2zyL39sYWGSpw+BcR
         W/y6tUIpD/OSyRpG+3b776ce7jzSX4omaA/arFe1JdN6eQ13L/RItsxoSaBEHV/YKiAc
         4MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538998; x=1795143798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZPdBtWA9pQKMZMHNBUh0eB5Fnnm3slLNwC8Pi8shQo=;
        b=kyfhXBLcB9/L1vKSg1Wat9DULaElkDFRe1OXs8+yWH3C8LPzgHlUI3SO3yHUQiycBR
         9cripqYmRBMU2HRUoZqMWh3N8Q7f52yeT6z+JKpg0YcDDwD75mP8ricOFQEdegqdsyyy
         gI5pnQ4Ll+4SDmiH/X+1+up3hJHYnfh2tGFj3pN1+BTH/M/0Pwux4IIuVZHC9Df4j737
         lJjfNlp3f/WQbPjcEW+4XoMKOHzMZ/s3ylgReH+xPU/N823S0nsUbgPmU1mjukr+wj3y
         WpcCRioiMNX/hWPoaOA5hbY6pwQgLVbz4kd+bgJpM0OcDshXv1oyvT1BqgtrDf3aT6sW
         lCzg==
X-Forwarded-Encrypted: i=1; AL+hErEsa6Ku8Dfo0o2nQWtr6oAufshZd0KEmM3zkK/D8JIQG5utApba+AMv2UYUWaueLFryfh4RuIBpYFHbrdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ktBsgGp9a+sApFmPDhp26iW0md09NAZSZI/s6bZUYXAHE6Hun
	vfsb6PycD0Ww2f5YZvsMXlSxlML9sii+gw8kCf0tR98oNCFNWkjCFRM7B+J6w9Ybod2TH2m4syU
	1ogeJMr18UnPB9joXsAUSd4g1SKTVnbWy7lkkaOYnM4R7NYqRwVTiKpnGnuRgotU=
X-Gm-Gg: AYBFou3Lo5JEX8WY2/jbeG4IMCh46ZCgo2kY9rz513+WbVoz1hsl8oWBOgUm7GAYkRV
	UU5rFfJYD3/84dVuqWMSf0YFLvh8fxo/VJpiAbYKXU0ip81VwIr7/wa+KhADLH7DWQrZnHSM+Ey
	4VKj1+0Q07tXeATxjb598+1a/YACdz2ZXBvhO2CQznsU3IkKSoDVENjmB+wjHOgRLbqC4LDFqmK
	9RH/klfYK59nr4WRS1DvyrFtGLaw4ijaWShKKhANnlWjh0ofgCXPVKTYhdVY5dVPBe3z7ZuzTys
	XdRM97Wy3FrFV/lTmv3BBbvb4xB9aBksHhGfECOaPKk+dpGV/2SVwN2+pd2qYz7+Hjbnvs+MRV0
	JeDdzUNdGjC9CPJaYHQB4qRJ4GbSWgnQTq0j+hiD1hGFPH7rKRl3/Us5rtsbpjeofOJNV7Vy/IB
	8w4+J5uiSEWg==
X-Received: by 2002:a05:690c:1b:b0:8b3:7782:6759 with SMTP id 00721157ae682-8b4aa323715mr13793387b3.38.1794538998330;
        Thu, 12 Nov 2026 19:03:18 -0800 (PST)
X-Received: by 2002:a05:690c:1b:b0:8b3:7782:6759 with SMTP id 00721157ae682-8b4aa323715mr13793137b3.38.1794538997808;
        Thu, 12 Nov 2026 19:03:17 -0800 (PST)
Received: from jerrythepro.nyu.edu (216-165-95-156.natpool.nyu.edu. [216.165.95.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa99a6a3sm10905557b3.28.2026.11.12.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:03:16 -0800 (PST)
From: Kaho Jiang <kj2864@nyu.edu>
To: idryomov@gmail.com, amarkuze@redhat.com, slava@dubeyko.com
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+408fcc361565713f@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH v2] ceph: Use unsigned types for snapshot split counts
Date: Thu, 12 Nov 2026 22:02:58 -0500
Message-ID: <20261113030257.1061200-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfX8srIWtjjUcVv
 btCzGYZ2MOJhk7l+ItUevwHBNJiNs4RDqTKa80PYcDuqRgGm2AsdRxYwqiNK9OhKJDbf1006Ifu
 eLmaPtavQUoZjdVcshurZWi4Y8VyFFR1VDxzRI11+wx9meBZNIaRUS5bgKzoStIrovjD0ly/5v8
 jWzQlRkaxcXlyc/8AvyQBwtkjV5YLkmUHEmEQQj1y/PfIADe2XMuLAk5usi6cUggET0euS/b5L0
 sLlOGn61axjwRqfdVrfd6cZhbxIchMITjyHXhtJ/OBXdNpnAT66wsI/Kz0mrtUFJ19V8Xz4Qg7U
 4vAUUhBc+uNPvmprxBsHlx/p5WlahbYZu2uEjpdHx8sH71LSHhCNGf8DcDl6A8AbD/FAd1tM1+j
 ZZYPFpM0CNF6K7mw9itOQ52XsHEhrITsgw5CSBwtCdYt0By3FcIqSRU5pW9EuBOYYQHmXrxs62b
 xsKNS3YxbbeDk900V5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfX/Oe2qIh4dUBn
 Dn19i46vARjtYufHdc8MNfGxnPbZKyq8qB6ji4gntyUVU/ux+BW2CYkS/+bXYGZdM3FEprUxNqf
 z1buz/kvpVmAUTbDaPQ+PS2j11eHkoQ=
X-Proofpoint-ORIG-GUID: SE-npmxaG43v7pVDwl7OAg9KOiYQ9XyZ
X-Authority-Analysis: v=2.4 cv=Usv2pOwB c=1 sm=1 tr=0 ts=6af67df7 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=00YF/gXxkIOuibRGLzhWGw==:17
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=A3cO9-ABBa8CDv30UOuY:22
 a=VwQbUJbxAAAA:8 a=09FrV-9A3yaSbjUTAGAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: SE-npmxaG43v7pVDwl7OAg9KOiYQ9XyZ
X-Orig-IP: 209.85.128.197
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130011

ceph_handle_snap() stores the unsigned 32-bit split counts from the
message header in signed integers. Values with the high bit set become
negative and, on 64-bit systems, cause the subsequent pointer arithmetic
to move backwards before the message buffer.

BUG: KASAN: slab-out-of-bounds in ceph_update_snap_trace (fs/ceph/snap.c:815)
Read of size 8 at addr ffff888024f45478 by task kworker/1:3/2220
CPU: 1 UID: 0 PID: 2220 Comm: kworker/1:3 Not tainted 7.4.0-rc2-g7475ea8b5861 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: ceph-msgr ceph_con_workfn
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 ceph_update_snap_trace (fs/ceph/snap.c:815)
 ceph_handle_snap (fs/ceph/snap.c:1057)
 __pfx_ceph_update_snap_trace (./include/linux/list.h:172)
 down_write (kernel/locking/rwsem.c:1350 kernel/locking/rwsem.c:1356 kernel/locking/rwsem.c:1632)
 __pfx_down_write (kernel/locking/rwsem.c:602)
 ceph_handle_snap (fs/ceph/snap.c:1158)
 mds_dispatch (fs/ceph/mds_client.c:7298)
 find_held_lock (kernel/locking/lockdep.c:5401)
 ceph_con_process_message (net/ceph/messenger.c:1413)
 ceph_con_process_message (net/ceph/messenger.c:1424)
 ceph_con_in_msg_alloc (net/ceph/messenger.c:2094)
 ceph_con_v1_try_read (net/ceph/messenger_v1.c:1434)
 ceph_con_workfn (net/ceph/messenger.c:1576)
 process_one_work (kernel/workqueue.c:3495)
 worker_thread (kernel/workqueue.c:3578 kernel/workqueue.c:3659)
 kthread (kernel/kthread.c:436)
 ret_from_fork (arch/x86/kernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
 </TASK>
Kernel Offset: disabled

Use u32 for both counts and validate both split arrays against the
remaining message buffer before advancing the decode pointer. Use
size_mul() to detect multiplication overflow on 32-bit systems, and
ceph_decode_skip_n() for checked skips in the non-split branch.

Fixes: 963b61eb041e ("ceph: snapshot management")
Cc: stable@vger.kernel.org
Reported-by: co+408fcc361565713f@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 fs/ceph/snap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
index e03d89db61fe..b7f0db7bb515 100644
--- a/fs/ceph/snap.c
+++ b/fs/ceph/snap.c
@@ -1039,7 +1039,7 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 	void *p = msg->front.iov_base;
 	void *e = p + msg->front.iov_len;
 	struct ceph_mds_snap_head *h;
-	int num_split_inos, num_split_realms;
+	u32 num_split_inos, num_split_realms;
 	__le64 *split_inos = NULL, *split_realms = NULL;
 	int i;
 	int locked_rwsem = 0;
@@ -1079,8 +1079,10 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 		 * child.
 		 */
 		split_inos = p;
+		ceph_decode_need(&p, e, size_mul(num_split_inos, sizeof(u64)), bad);
 		p += sizeof(u64) * num_split_inos;
 		split_realms = p;
+		ceph_decode_need(&p, e, size_mul(num_split_realms, sizeof(u64)), bad);
 		p += sizeof(u64) * num_split_realms;
 		ceph_decode_need(&p, e, sizeof(*ri), bad);
 		/* we will peek at realm info here, but will _not_
@@ -1159,8 +1161,8 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 		 * positioned at the start of realm info, as expected by
 		 * ceph_update_snap_trace().
 		 */
-		p += sizeof(u64) * num_split_inos;
-		p += sizeof(u64) * num_split_realms;
+		ceph_decode_skip_n(&p, e, size_mul(num_split_inos, sizeof(u64)), bad);
+		ceph_decode_skip_n(&p, e, size_mul(num_split_realms, sizeof(u64)), bad);
 	}
 
 	/*
-- 
2.43.0

