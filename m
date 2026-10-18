Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2714C9E10
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331991; cv=none; b=j9DEaeElUJPQSl9fI15CWAs0zi3PYxTIwnU6IVlteMnv8d0MWN8umZcjERzFMz4zac84aiHsZ4zjvagrn5CyoBg7Ru9Rb8Vyo7mozO5YnVeKiGXNfCfEVe9x7QoTbsrS7pPfms9yALZJZQ9NQRokLFZYnA2LGuVybCmWVKYOnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331991; c=relaxed/simple;
	bh=8+dudQneRtlky3L0134Uq63K6jUPTy15f15f59Dl2JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeOXg2uZZdGsJ5d3p82bVLce9XeytW0JDnWkF1wrFn3SRXxePa28dnM1IWLsUQVsJBqQxF9PxwaAlHNKLyZuSsOnsEwr9hu7KwmihSMT/lYZ69C4/BqIJ1dPvxArFMfYOtyFCoj/GhpF9wNDSHhm63g9i7qIhyN1/QSFOQGR7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=cdGObsrm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="cdGObsrm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1215226a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792331986; x=1792936786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfIM6O5XGdPMggK0iswqZ9O/3wNWaaWuby0Fr894zwY=;
        b=cdGObsrmW4D5w3Uh65A93PJlPk4Ne81C6dPBXTGA1bSIi9TtoW7Nf4INcqhQpS25hh
         oot1e1bDKehX4rbmcmuXG6MaoDPKwws9k/eF+QIJih6ABM23sDxMrcXzmBThzwFHX4Tt
         RVEKp+Pqs8VuL46JApnfP3yGdlyMMkWqXOt6XCKiuXyXTRGDgDHy8FhfrekjBcLHoMjb
         Zwz4v0c+zOcZBBlayNhyuhNtM2y6VtJKEhyobm7n3y+BLQ9cSgH9UGz54B7KrvF1rHD8
         ZLBc49qLIzIw7j0tyRw7z2sM/ZrQXCKdZVizD8xkMMqCrXI8WrD4laMjzLyL9KWC74sQ
         lmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331986; x=1792936786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfIM6O5XGdPMggK0iswqZ9O/3wNWaaWuby0Fr894zwY=;
        b=bn/QrdjHjD2YMOfNck8mNO04eAECx3fhKSpAHngn9EYL18MU5VU88ppvDk6JAVBGOu
         YA6eWZurqjJhK2GNEj8/IRIaRlKHYxW7FXdGHJ2btVOYGNeSOLwFh9vAL3w8jO1p3k/7
         FSXtWRYvk1qV/x4c48dzKnv9xJZchnkOCvu79kU9fk/Kpni/8Zs1SBpHK+feOcpw5NFW
         jZcAzX5451QLniO5o78MXEDc6YztOmjy0s6fBTGdDNnQw0HgDyNNIBmaFDVCpubIkRh1
         pPdh1Xc92EXZ4jGzEzks3Gw4lrJJPLBJk1tZzB304UMQ6nHQDDpDvR4X6qIene1YZolj
         kUcA==
X-Forwarded-Encrypted: i=1; AKwUvBzolpZJchNh3yya1iaHRrDsdPcl/WRgYHgC06LxvWbhyJlz5Uo8/pFDPC2vZwyAJT/Mxwh+7zcESmIDhVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjTcbnwXNUZtpO6klm9keuF+GiQNHStLMe9eX/NQBNFLTMB6zn
	AkwyOTDwRA8S/LunrgNjSeRbmcC1mIhyDh8+JS2eXWgeiMXZavAva3ch6e2FfY88Vt4=
X-Gm-Gg: AYBFou0AbB31bbGU95FQ5ddq1NEH+rZhQJSo9hPJ7nGqulUfv2/zwDqzKynREWh3Hki
	q2APaHXzrZ9FPzXEeLX1DivIWg28pcthvDvRYycxIVl1xLMqfg1kB1RKI7euyTirqiHOySowIC8
	LYTZ1pP9G7gOXEZLSkK+h+TUNl1A22v12vRR2SY60OL7R18livMtDxtNtgk/3Ft4/mQKb6FAbHR
	SFsep2mxtyb+wd/U5SEoHPLczCUuuq7PBhrCKpmcGolgiJIuEjz9fPh4fZBaMpNoAbtiqSHl1It
	5TV0lz2Np1x2W/zCo0UWSDXoUxyzDnUKEKcMPY8CaQqdq6hrAOPCMsd/a6pdiyFZee3wQJcVkHr
	/hzPAiZk1Eh2fF1LSy5fPA4TmGGpVliEmuQK4vPvmDVC3ZAQ+a6HE6NeEy5pCv+BWfIQ11r1fIV
	reyTokYAe2U1ljdRLHBQeWAGjNJBSVUbylIlP+rKBGtJi9gaSS0UtuOpt6CHxHUNEEw6VSJ0dZS
	nS2iv9+ATBGzY7W81+4Yg==
X-Received: by 2002:a17:90b:1806:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3acef538909mr4550140a91.64.1792331986138;
        Sun, 18 Oct 2026 06:59:46 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:6c71:58da:ec95:3c04])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm16263797a91.11.2026.10.18.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:59:45 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Karan Tilak Kumar <kartilak@cisco.com>,
	Narsimhulu Musini <nmusini@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Hannes Reinecke <hare@suse.de>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: snic: reject a target count larger than the response buffer
Date: Sun, 18 Oct 2026 22:59:30 +0900
Message-ID: <20261018135930.3190279-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snic_queue_report_tgt_req() sizes the REPORT TARGETS response buffer for
min(fwinfo.max_tgts, shost->max_id) entries.  The completion handler walks
that buffer for as many entries as the adapter reports in tgt_cnt, and the
only thing in the way is

	SNIC_BUG_ON(tgt_cnt > snic->fwinfo.max_tgts);

which compares against the adapter's exchange-version value rather than
the bound the allocation was built with, and which is a WARN_ON_ONCE in
any build without DEBUG, so it falls through into the walk.  An adapter
reporting more targets than were asked for reads past the buffer, and the
count is also stored for snic_handle_tgt_disc() to walk a second time and
create a target per entry.

The same exchange-version handler already clamps max_sgs_per_cmd against a
driver limit; max_tgts is taken as it arrives.

Compare the reported count against the bound the request was built with,
and fail the completion the way an empty target list is already failed.

I have no Cisco VIC hardware; the completion is injected under a KUnit
harness so that the adapter reports 259 targets for a 256-entry request.
The W taint below is the UML test machine's own virtio_pcidev warning:

BUG: KASAN: slab-out-of-bounds in snic_report_tgt_cmpl_handler+0x266/0x410
Read of size 4 at addr 00000000622c0810 by task kunit_try_catch/20

CPU: 0 UID: 0 PID: 20 Comm: kunit_try_catch Tainted: G        W        N  7.3.0-rc7-g58161ead29e5-dirty #7 VOLUNTARY
Tainted: [W]=WARN, [N]=TEST
Stack:
60d4e7dc 6220f200 622c20d8 00000000
ffffff00 60d4e7dc 60d56045 622c0810
60dcd680 6009aac3 622cfce0 6003e621
Call Trace:
[<6009aac3>] ? dump_stack_lvl+0x5e/0x7a
[<6003e621>] ? _printk+0x0/0xd7
[<6004b21d>] ? print_report+0x14b/0x517
[<603bdf3b>] ? kasan_save_track+0x1b/0x40
[<6003e621>] ? _printk+0x0/0xd7
[<600897a3>] ? snic_report_tgt_cmpl_handler+0x266/0x410
[<603beebb>] ? kasan_report+0x11b/0x160
[<600897a3>] ? snic_report_tgt_cmpl_handler+0x266/0x410
[<60073dad>] ? _dev_printk+0x0/0xe8
[<600897a3>] ? snic_report_tgt_cmpl_handler+0x266/0x410
[<6008a11c>] ? snic_lt_silent_overrun.cold+0x46/0x4da
[<6089d880>] ? snic_lt_silent_overrun+0x0/0x330
[<600bf62d>] ? os_nsecs+0x2d/0x40
[<600a16a4>] ? timer_read+0x14/0x30
[<602235de>] ? ktime_get_ts64+0x8e/0x2c0
[<60223550>] ? ktime_get_ts64+0x0/0x2c0
[<606fa06c>] ? kunit_try_run_case+0x1bc/0x310
[<606f9eb0>] ? kunit_try_run_case+0x0/0x310
[<603c08f0>] ? __kasan_check_read+0x0/0x20
[<600bf020>] ? um_set_signals+0x0/0x60
[<600bf020>] ? um_set_signals+0x0/0x60
[<6013e3cd>] ? __kthread_parkme+0xdd/0x1c0
[<606f9eb0>] ? kunit_try_run_case+0x0/0x310
[<60700130>] ? kunit_generic_run_threadfn_adapter+0x0/0x100
[<607001ac>] ? kunit_generic_run_threadfn_adapter+0x7c/0x100
[<6014464e>] ? kthread+0x36e/0x560
[<601442e0>] ? kthread+0x0/0x560
[<6009f0de>] ? new_thread_handler+0xce/0x130

The buggy address belongs to the object at 00000000622c0000
which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
allocated 2064-byte region [00000000622c0000, 00000000622c0810)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x22c0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x40(head|zone=0)
page_type: f5(slab)
raw: 0000000000000040 0000000061402140 0000000000000122 0000000000000000
raw: 0000000000000000 0000000000040004 00000000f5000000
head: 0000000000000040 0000000061402140 0000000000000122 0000000000000000
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000003
head: 000000009f279a01 00000000ffffffff 00000000ffffffff 0000000000000000
head: 0000000000000000 00000000ffffffff
page dumped because: kasan: bad access detected

Memory state around the buggy address:
00000000622c0700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000000622c0780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>00000000622c0800: 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                        ^
00000000622c0880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
00000000622c0900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

Fixes: c8806b6c9e82 ("snic: driver for Cisco SCSI HBA")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/snic/snic_disc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/snic/snic_disc.c b/drivers/scsi/snic/snic_disc.c
index 71d34a702f2ab..df7da6413f84a 100644
--- a/drivers/scsi/snic/snic_disc.c
+++ b/drivers/scsi/snic/snic_disc.c
@@ -385,7 +385,7 @@ snic_report_tgt_cmpl_handler(struct snic *snic, struct snic_fw_req *fwreq)
 {
 
 	u8 typ, cmpl_stat;
-	u32 cmnd_id, hid, tgt_cnt = 0;
+	u32 cmnd_id, hid, tgt_cnt = 0, ntgts;
 	ulong ctx;
 	struct snic_req_info *rqi = NULL;
 	struct snic_tgt_id *tgtid;
@@ -406,7 +406,19 @@ snic_report_tgt_cmpl_handler(struct snic *snic, struct snic_fw_req *fwreq)
 	/* printing list of targets here */
 	SNIC_HOST_INFO(snic->shost, "Target Count = %d\n", tgt_cnt);
 
-	SNIC_BUG_ON(tgt_cnt > snic->fwinfo.max_tgts);
+	if (snic->fwinfo.max_tgts)
+		ntgts = min_t(u32, snic->fwinfo.max_tgts, snic->shost->max_id);
+	else
+		ntgts = snic->shost->max_id;
+
+	if (tgt_cnt > ntgts) {
+		SNIC_HOST_ERR(snic->shost,
+			      "Target count %u exceeds the %u requested.\n",
+			      tgt_cnt, ntgts);
+		ret = 1;
+
+		goto end;
+	}
 
 	for (i = 0; i < tgt_cnt; i++)
 		SNIC_HOST_INFO(snic->shost,
-- 
2.43.0

