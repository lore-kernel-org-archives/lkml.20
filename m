Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910511;
	b=owwE7OAebF5Hf5zX1sk0OYCTZsjUtdgOJGnpfTSsJho1i4e7UaxtcUexE2U2nFPfPdoK
	 /R96LYP5X8vDyv0rypHjyjXh5zHJJWRDHl8PmVU6Xnb2p930nGoBoFeNa/KyuQR/A35Nl
	 A0i7MUMKlzxTkv8+X7RW4Khea9cJTMcf+5AtEjnVVDtGX5UdIJDZPwcjXGOqqx4sXPnzK
	 x0y567LExK+6eL655nk9o87a8ycNH7Pr/iAAPJKNJJfmExvFXAD/y2m2/Ow/R9Ew4Xkw1
	 7ATtsDa33SgG7j5MiuWGUV2mDVhUVJ3J9bxG7nW8gYfHTQj08kG49iZBC6DJ1KOpULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hIRaxxo4elhQ/z0xroM1fiMsS70aRe7w7f8k/jc1eTg=;
	b=qvWD7eUUAQ36m2w6DuXKjcfY/BSKtOrfKQ+ac46fWn8rMbIoxR8buqiFaKS5itntS2s3
	 SHL/EySTy8/LBQt58Qqoo/yhfaUIZe+GG1fG3oQqMGFPwoVGbf2g9R0gZVK6ZUdEhLk+5
	 iKuanv2E2cEy1or4SMTZ3aOYgYqpf1bdU+ACyOgWd8XK+bDwQW5gk+btTfaFErgK+bKsb
	 TNwccd4mgLuOQu8C+gxWEEApa7XschD7ol+dBVT1LcYr4PbZX76kvE5ozE3IMJfwDQBrA
	 X9Gpuo8VqGBSn/UASjMWHiT3yNxQVMeETLT+UGccFS2/Hay7XfZmw4xlSX+eCyhO1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZSRbgBbL;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425A606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A425A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZSRbgBbL
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4675349c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794910509; x=1795515309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIRaxxo4elhQ/z0xroM1fiMsS70aRe7w7f8k/jc1eTg=;
        b=ZSRbgBbLh9xlpv74RLRKRVOgeWV6gTyyUx18BJTQuUQUfpesN6GoQmLLAGmz97x9zz
         QXc1LAZjemPTTZauTzxRMXBE7PVe+IfBDE7zF4vzb0C/RSRIwQW21Ne0DpJp0Xs+03Ws
         UHI/IZU62eCIpvWofst2/GDuMRbbESXE+KxXIzAAStojm1UrNmbuwFuTCq6y/ah4S/mx
         3h/idv0+hrsqhIwRtIq5hgiDuJDiE1WrbDlbQS9Eem4YJAAG2Hxco2LPHEVH20/sPgsL
         zWd6DiXWlpzkrDqXnZNUNwrGYfX6XAhahof6Knv0ZX5PO9Kvtj25sUcQiE3Rq0DlXTc/
         rruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910509; x=1795515309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIRaxxo4elhQ/z0xroM1fiMsS70aRe7w7f8k/jc1eTg=;
        b=iTqGAbJK8XMniawKiQ2cGE/Nx0hkHx55lNoCnKT1IXxr6AkKLpDRrknY1qklktLKbI
         /saKZTDJJ0wqIzL4VGNTzBruwBZgQiGxXaitxXeND3sh8QdkZ68wcvzKFcXGwc8vAkq8
         cTuixNYtTSbzh+EQIhlPYHBL1HodLalWQjpuXHk0IVY+W8yeC/bY9vJVUUKDSeSBA4AV
         0QViCQK9zpQ60ypFXWb1xfnhNP8v4bEHAc/yTUONGzWvgaNpwKPFQlvGJXCg2sDXJSqP
         Aatg/mDglmo0NDxq8Ncfk2x/HTq5oRICdUlBJwI5bnajtT4Jni+Q4d9CvvobvvQghOi/
         WmsQ==
X-Forwarded-Encrypted: i=1; AL+hErG1RD0miZAaJyRy+/UTRYYk+bCJDidq+gAZOhClCDRi6qIFSOCwqvPpu8R0DhK8PNUxtsVkTITgB4w8NgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KYMsLVoaew1svLI0HcPZ1y16xmmN10fgF1aKPVONpO/59shP8
	AdRUudzlUhjUoMm8RHCYxbbkCcQPgVn316+m74xFVJd33SGh4A5pLNIR8ipN5n9gRxM=
X-Gm-Gg: AYBFou3n3FvY4IXwRiCIIqKnbkjdPZoCqmOA3IU91KubxerPVzN0acRS6dZxbLlGtM6
	jhGBk7ZY34Gf5B0tu6PcdvUx6/Uw4BxAebsVBvuRKz2bu9ctd+J5F3YVvC4rNaJnnRBowXaTHC9
	7V5NYS6JLbtai5U8o3fvHTvptj/8e8JxoUGMADySEY55wjiM2dyTpreSl5pF0cEcwBmOadxvgXq
	8Awu1NY4vff/nHJLgTG332YR2Zq52PR8Fkay99RADFhq62hhdfd5tE64P202jYF7525f9rck8Io
	mgs9RghQcqAZcUCBeBA9enDuiCM1NxdFRzjcFU3emSf0ImncQ7mOOz3OpWDbVvaH+84SFj72HZs
	LpAOQ+JaJIiCAUie5jzjz4p8hAfQuFkBjq43bhBNPVKuZqf/0eu79QLkjHqbN1uSP27uJPwIGfQ
	x5ZgO6Y94hyQhc3yc299kLheQjlSw/DtfBDlFO2MaD2Mx6lbCUrsCuNB/Wy9/h5ddJmVFHcXCCw
	lnjQH0K2e469kOtl7uFMP4PRVQGVVnF4HxBlprF0i48Qdz5Yd8gKguVov6cIrD0ILN5bzFndTSW
	5gIJxROcTKlF9bMj/jDh5utLshhHdBFyksq6/nd3i2s5Hvrb3BlA7leZVFBvCllk1qHAbid6M2o
	7MmzNuh5jx4LhsMUO42tg9IZJX18laaK916P6pg==
X-Received: by 2002:a05:701b:4651:20b0:14c:8461:b3ef with SMTP id a92af1059eb24-1b50310039amr12607345c88.24.1794910509130;
        Tue, 17 Nov 2026 02:15:09 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:cd44:de10:449c:756c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm39965539c88.6.2026.11.17.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:15:08 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] scsi: libiscsi: tighten task completion
Date: Tue, 17 Nov 2026 19:14:56 +0900
Message-ID: <20261117101500.1894608-1-yhlee@isslab.korea.ac.kr>
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

1/4 stops the receive path from completing a management task that is still
queued or still being filled in, so a slot cannot be returned to the task
pool while the transmit path still owns it.  2/4 stops it from completing a
NOP-Out sent with RESERVED_ITT, whose single reference belongs to the
transport, so that reference cannot be dropped twice.  3/4 makes the
transmit path hold a reference before it publishes the state the other two
test, and makes the SCSI command lookup honour that state at all.  4/4
stops the receive path copying a Data-In into a command that has been
handed back.

v3 -> v4:
 - 1/4 and 2/4 are unchanged.
 - 4/4 is new.
 - 3/4 drops the two hunks that kept iscsi_xmit_task() from handing a task
   to the transport once the receive path had completed it: the early
   return in the conn->task branch, and the ISCSI_TASK_RUNNING test around
   storing the task in conn->task.  Both release the last reference to a
   task whose PDU the transport has only half sent, and for iscsi_tcp
   tcp_sw_conn->out.segment then still points into the sg list that
   scsi_done() has handed back, which the next task's
   iscsi_tcp_task_xmit() flushes first.  Mainline holds the task until the
   transport reports the PDU done, and 3/4 now leaves that alone.  The
   second hunk also re-added the test that commit 533ac412fdb4 ("scsi:
   iscsi: Remove unneeded task state check") removed, so that Fixes tag
   goes with it.
 - 3/4's SCSI lookup refuses ISCSI_TASK_FREE as well as
   ISCSI_TASK_PENDING, because iscsi_alloc_task() stores the state before
   ->sc and under frwd_lock only, so a slot being handed out can be seen
   with its new ->sc and the state it was freed with.
 - 3/4's changelog follows.

One older problem is left alone, because it is not a completion condition.
iscsi_xmit_task() still sends one Data-Out for a command the target has
answered, from conn->task and from conn->requeue alike; nothing is freed
there, because the reference is taken before the queue's one is dropped,
and skipping the send is what the two dropped hunks show to be unsafe.

3/4 needs 1/4 underneath, and is marked for stable for the same reason.
4/4 is independent of the first three.

v1 of 1/4:
  https://lore.kernel.org/all/20261113145140.282504-1-yhlee@isslab.korea.ac.kr/
v1 of 2/4:
  https://lore.kernel.org/all/20261113232322.395246-1-yhlee@isslab.korea.ac.kr/
v2:
  https://lore.kernel.org/all/20261113233938.397415-1-yhlee@isslab.korea.ac.kr/
v3:
  https://lore.kernel.org/all/20261115122122.1446791-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

Yehyeong Lee (4):
  scsi: libiscsi: only complete a task that has been sent
  scsi: libiscsi: do not complete a task sent with a reserved ITT
  scsi: libiscsi: take a transmit reference before a task is published
  scsi: libiscsi_tcp: do not accept a Data-In for a finished command

 drivers/scsi/libiscsi.c     | 56 +++++++++++++++++++++++++++++++------
 drivers/scsi/libiscsi_tcp.c |  3 +-
 2 files changed, 50 insertions(+), 9 deletions(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.43.0

