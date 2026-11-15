Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745297;
	b=vsNCzgDZSxqgEoR6VTD/fxqaRtlwQn3/19Jsdu4OT9hj7Y4cd8JGPLmhWsBD52+96Zy2
	 kKe+/uCZAhKHYRVQRPZEqMwT6eyuXFwfhiS9LTFoAVHQt83iZKQVRMEgX2+Bh4OnqoGiz
	 1YxufyFL3v4yZPnbp6Sysa7/4J3v4Q8Re2tpw/JAwtPIfVqaKoG6Jx6w8acu/uiylzzaH
	 y4dT7ZqZ5r6uBLRCIv5lMRDwvnPJH4WmsUAC4KCagtnO784vfdd3m7bOi7XleNcBklhBU
	 WRrNSHFt618LN9PFJK6LU53ysqKMBvqGfjWNgJl7SInJcerDtxl4Ptw/ZZ9r3CF2lqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JHGMhIDfe6WAYWe+FkSfHWLhXPJoptf+ba9HCbYyk88=;
	b=0EFT2Ma34pm1AH5k02gMoKfErWmwCSsCk8W61g/WzMrc9/t3v9E2T/GBs+dELwWZrRR3
	 Et/qCDdFobVIrEqOHR4xq1EuxUieqTapvy2WipFE18ytztNpRUrBGvjbU09D0WcRUTk5D
	 l1uE6l43MMVtpv2Fm6zStghyg/WM9OfUOtmiY9XHVL3ws5//aXl6qI9DUNGaM0JHQIbsc
	 hanbFRIn7hVoC6BD1ml0Vh/qJH7hk2Nlru0651YCq6GxYBaLyVVHvhQjRpHbm7tC5b5MJ
	 IwUNx4P5WOi3BgZkxQgpJjwjHwfuI9pNf6128+A6IJtTu33+aLrJbnfouwfujJ5EwXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SuHcITR3;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8E606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB8E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SuHcITR3
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so998658b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745296; x=1795350096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHGMhIDfe6WAYWe+FkSfHWLhXPJoptf+ba9HCbYyk88=;
        b=SuHcITR3zO9FUe5aWO6oSCNsm2i3GomzfbwB6DUi87XOEJBcUlS9GEnmpssphplHm3
         BCAzqapGelNdJVylbZf6VUsSrS/gePn7mLuER7LEyQNN92UEcZOVY0c0ZPbzpS43yKQQ
         N+qslmv+yfu7ppoz1WtFraMIlOSPhuujaadB3bbNDfQ2ebiSk8A/q0mK8OMEuE8NrB4z
         XCNW3mcUr0NDRhkcjecgS+vRsKsVlZK0AX1eZeyVs6R8h8BAgyJZDpgKZLIx7ylYQ523
         ZcsrMP33BCfclAnxwhgAG4CvI/kJfS4ol7hHebRpjij0MuFxxuPSBrMQRE5QUZZglZHm
         evJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745296; x=1795350096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHGMhIDfe6WAYWe+FkSfHWLhXPJoptf+ba9HCbYyk88=;
        b=GcMHYTXdAWoKpIof43zxpGBGHNLTDgJbbF+mrUIXoPKmhsQ95h61tRyInXbq7FHl3C
         wlMCRQuVrfb+G5UEkiOts/i1CbGxOlXd/Io4/Rh6yD8QH50iSygiZCOyYegPrkkFBj5w
         YNXKU1el1GfRN9oUDUJWoEBqeCa96qgqjYsbEbU/JeR2I5Y6g5X7emFF7EXQpy0wSoq+
         +XoVuKoouxdnZoPULI7wt2XdEUdNnFaZrwywiGW8cDrzW9Y1c/GDtwNrZ+3GauVhT6y+
         0fhhY3hs1XW3Atu5xiKGVKHJrIsjudsQclLm4yX8AU20GgrpcSOKRZqmxikJcFqchkRK
         VXMA==
X-Forwarded-Encrypted: i=1; AL+hErH7hlH/GgLyw21slK/8nDZRp9iYR1mdvBa+SmdP9dsF5CXYNHWa1Lstyh+ys2IzYHrPovq4MPqntVFL3FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pb+M+WNCuwqe/cFJtOya8fnJ/SYx7vW7Ijh9mvCU/r3EYoeBs
	r1RKBDcfhK8Dyk1X7Mw/SUawwAYfmXliJiBTqcxEOG++SrRsbwaRT7n5A01R9PIZEFo=
X-Gm-Gg: AYBFou0JS5o/YOSTt+0bItEGbRH6qdOEEp7OmwCClSKNvXaXAwqT/HRhOFrH8aQ9WKc
	qMOIgJ+jfIPmEE1dlSpciZ43xoqSHv5A+q3MCueza5bZjtZzTk85jkK14P5LeUeQYo9ITSSFQ9h
	k+CThFrAeAa7zt+9cpWSwduO8KzmJvzntqDrVWgT51ZA7d1ioBJtHqSOQpYZOqM2S6zSEgTTpom
	2klDd+wVFbqSjxbTDpvITq4gpDtvwZOP25DAJ1uwQE50PFfDc28EtytXm//l+ZsuR6tej8KdGrE
	rqa6KoGUJkg9PSrxjEK/mVOzo+YhEpi/nvEtW2gqq0lpmTF4H7rwQm5srQM51gYmfRF/mXss271
	HUwXSneRnK1LVpRWP/kuXnCVIcIYi3pUdxMN3mbk9SSEU2MmU3WZZURJceXLnpl8vloi5C44ZPQ
	w4dqEAVH4S71Abeb/qBBuBcK/HQ4uBYJYqBBvevatU/rgHQmRTVENiE1Pt0bhqDcjYdfUwHvG+x
	AfA9JP35ok5yiAXAG+rj/PI9k6SNoywdRqTxK5JiT9KZU5gu9SaEqNwHz/7rmNupJFcXKQ1LCHG
	Sub7q2EUbvtwRLqENPjaFRlJnki0mGjdtswoFirzUD31GSNYbzR6jUqStBYmmTz34MAEP8rxPBS
	1oVWV4+zkuLW/Oew4DyfzzLg78wyRuzW17dXUkw==
X-Received: by 2002:a05:6a21:6e96:b0:3f9:bfa2:6067 with SMTP id adf61e73a8af0-3f9bfa2a300mr2573650637.21.1794745295946;
        Sun, 15 Nov 2026 04:21:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm3301925a12.7.2026.11.15.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:21:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] scsi: libiscsi: tighten task completion
Date: Sun, 15 Nov 2026 21:21:19 +0900
Message-ID: <20261115122122.1446791-1-yhlee@isslab.korea.ac.kr>
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

1/3 stops the receive path from completing a management task that is still
queued or still being filled in, so a slot cannot be returned to the task
pool while the transmit path still owns it.  2/3 stops it from completing a
NOP-Out sent with RESERVED_ITT, whose single reference belongs to the
transport, so that reference cannot be dropped twice.  3/3 is new: it makes
the transmit path hold a reference before it publishes the state the other
two test, and makes the SCSI command lookup honour that state at all.

v2 -> v3:
 - 1/3 and 2/3 are unchanged.
 - 3/3 is new.

The review of v2 1/2 raised three issues.  All three are older than this
series, which narrows two of them and leaves the third as it was, and 3/3
addresses each one:

 - the window between the ISCSI_TASK_RUNNING store in
   iscsi_prep_mgmt_task() / iscsi_prep_scsi_cmd_pdu() and iscsi_get_task()
   in iscsi_xmit_task(): the store moves into iscsi_xmit_task(), after the
   reference has been taken.  For a SCSI command that alone is not enough,
   because iscsi_itt_to_ctask() never read task->state, so a command still
   queued on conn->cmdqueue in ISCSI_TASK_PENDING could be completed by the
   receive path; that lookup now skips a task that has not been sent, the
   way 1/3 does for the management lookup.

 - iscsi_xmit_task() requeueing in conn->task a task that the receive path
   completed while frwd_lock was dropped: the requeue becomes conditional
   on the task still being ISCSI_TASK_RUNNING, read under back_lock, which
   is the test commit 533ac412fdb4 ("scsi: iscsi: Remove unneeded task
   state check") removed.  The other half of the same window - a task that
   was parked in conn->task and finished before it could be sent again - is
   dropped now instead of sent.

 - transports without ihost->workq, which call session->tt->xmit_task()
   from iscsi_send_mgmt_task() and iscsi_queuecommand() with no reference
   beyond the allocation one: both now take a transmit reference of their
   own, and both finish with a failed send inside the same back_lock
   section that tests for it, so the receive path can no longer complete
   a task whose reference the caller is about to put.
   iscsi_queuecommand() gives the command back to scsi-ml right there;
   iscsi_send_mgmt_task(), whose caller frees the task, parks it in
   ISCSI_TASK_COMPLETED, which is a state no ->cleanup_task() reads
   differently from ISCSI_TASK_RUNNING.

3/3 needs 1/3 underneath, and is marked for stable for the same reason.

v1 of 1/3:
  https://lore.kernel.org/all/20261113145140.282504-1-yhlee@isslab.korea.ac.kr/
v1 of 2/3:
  https://lore.kernel.org/all/20261113232322.395246-1-yhlee@isslab.korea.ac.kr/
v2:
  https://lore.kernel.org/all/20261113233938.397415-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

Yehyeong Lee (3):
  scsi: libiscsi: only complete a task that has been sent
  scsi: libiscsi: do not complete a task sent with a reserved ITT
  scsi: libiscsi: take a transmit reference before a task is published

 drivers/scsi/libiscsi.c | 67 +++++++++++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 9 deletions(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.43.0

