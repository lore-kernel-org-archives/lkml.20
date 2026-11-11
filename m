Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.150.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367981;
	b=A4j0eGHfamDIkh4u22VHA02zv9/NcuqPCL9ktQmspkOBuKZ6TfHkYhLxMZI+WmWzscQy
	 19K7ne7YCyyN7PWjCX6/HbHsqpHNlJsKPYLzqBq09bGBlyW92cewRy8Hl3n98hJ8/Tq0p
	 570vOjjQXyJn0cweGx2ddj10ZIGO1s7Mt0pK3WGxHA6F7tZzEAx7woPCWVFEZ1z0Ub6lP
	 QZlDVh6HeXvoW43wI8G49qvLG8mqdICEE8yLLn7uIG7gPNPhNDCLamnf2BPsD9Xur9aUB
	 BGJCm64OL13gH9AUEcqcZmL9fsfhY4qMI9S4J2608XK0nzhQGX9rlyFoOpDI68DBnKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Orig-IP:X-Proofpoint-Spam-Details;
	bh=bQ7xCGeyKivCNLHanIQkVR3eV/kMY2IG8KqwPvVm/cM=;
	b=4C21ml+J8SDjN0Qk9F8zRQQ2MVy7oUQZSV2tcf3jHTTw8senR+yicBI+mlLu+G+8ZY/2
	 0RlRHbtCoAfQh1wunDi8WFX0TidezOtOlbxWGqZ5uTrU388KZZj188g/YfwMynVezTUjv
	 g0RptVlJTUq2zv7WZujLGr+OUtoEsUpng4ePkR0DfXyi0MIS/J6KD9l7TL4n04PSwwVh+
	 bVGR4LSYyCA6zxNV4lAiuMUfM2nHL/O41JvdtyRBo+lo5a2fmjwsd9DtL5SoxW1Xv5peO
	 v7fZfOjDTHPIgSWW+yPnSDDputSe3W1dBf+RmHPVXfmT+G3J8PE6PPq9YZ7KIlJ1BEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=v6iMNFcf;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=uPsmbQ47;
	arc=none smtp.remote-ip=148.163.150.240
Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9BB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=v6iMNFcf;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=uPsmbQ47
Received: from pps.filterd (m0355795.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB13ZXw2258103
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=bQ7xCGeyKivCNLHanIQkVR3eV/kMY2IG8Kqw
	PvVm/cM=; b=v6iMNFcfWrjyl90pLk/uRuozJ2Go+1iAeDdwrlxiLR1pqH5vbGQe
	SxJ+LwDeaezfrmtmCOpyB9Z8gp39d3hZbjRomWPgPmu8okU552Qkw2waE3qMPdsO
	nz+Q53ytBGWVuXJyNWVsnTR4GJSHddCE/R1/F+7fCrvs0Cp1ojfe4C2fHsWHH572
	6Bayfen+GQgz2My+usDvdC+QmM1SGNZO7IgnCOFUw+QhSxAxPxfwXJAQ6u2mv9OM
	HTqltuNDwdjBNSEkSViLg/+49bSA8cxzzxTPmhJwobWBb/0BTVp49llGSQoIAbCo
	8Th4nC14oJHg47HvxPyvpn6mejnYhqigzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hvantmwn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:32:52 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebc622dc8so73170086d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1794367972; x=1794972772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQ7xCGeyKivCNLHanIQkVR3eV/kMY2IG8KqwPvVm/cM=;
        b=uPsmbQ47UIY/FJS/RsCm1j9cJWsT6UksWf44W0uJthuxDbn/9DqBG2RT/dencJlEGi
         uOmpKPw7WSyTglYAjNYkR7JK1ZhUlZdiF9NZi3gCEDaEZBTrpuD4JQddz4GjvfggZqFc
         n/qrUZfv3DDrl4n13wP5UROlDNy3XLGfuTQs9WMa1ZA/qNdWqsJ2AK0vX5D0wrXub4pS
         yF3THlErtlk6xyFRZ20LvnNcFy+oxGVkVgij3q+Bw2wg3WvFD0DpmidXSJIQ2DdzgytO
         5au7W1JDtDoXllGOQdDglUSoNU27hxijDiT0jg72aSbNIQ/Pz51MDCvfMLVE82ogRSy/
         GPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367972; x=1794972772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQ7xCGeyKivCNLHanIQkVR3eV/kMY2IG8KqwPvVm/cM=;
        b=C1z8ThdWxg3edS2DYhbVU7iGTSzUwO7k1OgtZMnTJG4IuMJbeaONAF6in51JiJqlRF
         7V91h3llls/oDzk9AAZKjhrWV8+FCWxGqqcpF2DlP82MQp8sqJBo7HbG6jaBhLcXw+q7
         IBSaOVgEfYRM6Gk/51UjJrxUByc3vesjWv3mq+E1+1lfwFu1+Xzhw74ovpQ/FLX705ZW
         RXZN+dWiD1jB9Z0NgBepnaccqzChdHeY++Hu/QFRFWrFk2jxXtybNpp7nahl8X8mdhlf
         wU1aAV8niuUUvpKSB/1xeJH7lE9ziQYomxTxGb7YgRjBYyjUJG5k7uS7SPX83gK5NiKB
         5zoA==
X-Forwarded-Encrypted: i=1; AL+hErFLNo4Owm2BERZcDKQ/g5IQrKd79WedfEDpIs27C9SuudkulWS1osepT4f4EZ0GnvPcUB8kRwncrbjHBoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ol3gFWAJqU9yJIU6RaJUAQOgVvk6lfctragmVlZtDgUEqj99X
	JEedSctUw3sInHbc543XZmnv2FSCiE7zzOPYpc0B8zb48Ntv8pAfD77uXqyylhknIqon50SXF0M
	fov6NCuXBRBuwq+bTa/Qwd1cNGr/qxNdRGATGf0iQ0eqRKxVhAnWM8/FQ1swt9wM=
X-Gm-Gg: AYBFou1K1DsYOkPxhq0/XscY3fy+efoogOKrBdBSV9F5JK65C7QOwYWXOU5wwOH+Qt+
	gux8zbOdtYHDGGZOnqLdPw6thVDL63m5mUxFDWmFsdvcRwG+zj4fJaxON6HBWftp7KcbUENqSKL
	20CVtrDoS3HMwC1Ij9u3DaC7kIWfEY+v4giTa8sqE1saU0TK6crBYmSNH74P6edaUEFkLWBkQW9
	FCtQRXeZTaHpn9BaE3iTMw+Vhb+xiiE9pH4djm49nr69Jw7WhsMXut2vMZ+JTJX5ppqBeodHaWs
	/PFKvKjlkd8/eSU3ww2RzkWoyKlBAGajWFMqUZGG0aS9woB+mJO56nAXnQzC2D2zV1RsXt6SRUj
	KJLANTBhKUlj/7QnE+gR21qlsnLNxlnoMw6FSGDgAY98Gs02LH/W/XgKYHImOHUK9OIO7t6IToV
	lXhMGS2KWGQg==
X-Received: by 2002:a05:6214:c2f:b0:91e:a762:94e5 with SMTP id 6a1803df08f44-91f0404accamr24041366d6.14.1794367971952;
        Tue, 10 Nov 2026 19:32:51 -0800 (PST)
X-Received: by 2002:a05:6214:c2f:b0:91e:a762:94e5 with SMTP id 6a1803df08f44-91f0404accamr24041056d6.14.1794367971473;
        Tue, 10 Nov 2026 19:32:51 -0800 (PST)
Received: from jerrythepro.nyu.edu (216-165-95-164.natpool.nyu.edu. [216.165.95.164])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef051dc53sm37025576d6.32.2026.11.10.19.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:32:51 -0800 (PST)
From: Kaho Jiang <kj2864@nyu.edu>
To: idryomov@gmail.com, amarkuze@redhat.com, slava@dubeyko.com
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+408fcc361565713f@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH] ceph: Use unsigned types for snapshot split counts
Date: Tue, 10 Nov 2026 22:31:50 -0500
Message-ID: <20261111033150.847104-1-kj2864@nyu.edu>
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
X-Proofpoint-GUID: a2-j_zz9ze0kN7V0eCja9YhdXJjmKpkw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX53yLJnhhvkRz
 ZmExhrVhZCRzmCCjORHizB6b8AqN1pe9BWHzw7ZyqN5CXIgQFi2mbosiQTZrLhGXZ8uoJcs+Hzo
 4KqCXwx3KYMfupze5MEt8CBux3qy5qQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX1W79gGcKVdxI
 iKPpAn0IesU4NLgaj9len0m1NkLwdXRLrDV+MpvhxNN9eKyPsdSRwbMO+C9L2aORbTAy7vcYbfb
 BHjASJE6DarvIG2RIXLCsXOcc4qfKtCgAcVQt8QiInovaER7PQpxvxYaSJ9h4Xd3K7oY/OvqF9I
 GuGc0s05BofTuvG1RkdKAMH7IrcjuosOry+am7nYtCIWDgJnHb3zYLh68Nh6JpMWI11JOKuvKxk
 RynS++bAIkv4x+YtDqsiDRw2fk/yyoMewq5tu7kvyHwOHuX45eCorWuRaXbmaL1EnvkPG8dwBuH
 qJlwEgzjlKt/URxi32bbuYNzDpok9DG8fckGSNE/FwpDSM9C1z0WQpyCE/+7gA4Qd6rM5L6TsQq
 pp2InPIXSIW37WETPM1O8H7eBj4UiO3aXtMHFy8Sygn4i2k5/g/iRMFRiYqvSlHKioP3rhsZyVl
 iq2JwkbXicLk6OXze4Q==
X-Proofpoint-ORIG-GUID: a2-j_zz9ze0kN7V0eCja9YhdXJjmKpkw
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6af3e1e4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZtTe6gSuN0kH6OIYMjA5WQ==:17
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=Lu3rmdZLeA08KL8VqJdF:22
 a=VwQbUJbxAAAA:8 a=yYqStf5IHDHNmpx8MkMA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Orig-IP: 209.85.219.72
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

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

Use u32 for both counts to prevent negative
counts from moving the pointer backwards.

Fixes: 963b61eb041e ("ceph: snapshot management")
Cc: stable@vger.kernel.org
Reported-by: co+408fcc361565713f@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 fs/ceph/snap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
index 9b79a5eaca93..7ed782abfbbc 100644
--- a/fs/ceph/snap.c
+++ b/fs/ceph/snap.c
@@ -1027,7 +1027,7 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 	void *p = msg->front.iov_base;
 	void *e = p + msg->front.iov_len;
 	struct ceph_mds_snap_head *h;
-	int num_split_inos, num_split_realms;
+	u32 num_split_inos, num_split_realms;
 	__le64 *split_inos = NULL, *split_realms = NULL;
 	int i;
 	int locked_rwsem = 0;
-- 
2.43.0

