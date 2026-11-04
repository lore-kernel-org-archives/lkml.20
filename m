Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756574;
	b=fR6UMbOpSUAU0W5+zatd/ZdawlTbaHMg5g0vOd7smATkubv/v5EH2KVWj92fnr7LPO+G
	 GoYxwQZzZpksaimuWCnh2fXUL+dNgSZM89OtUuY01AjgXZC3jNVTlLUYQ55hx5wVkbKDU
	 1po6m2ugRurm6fppce/oIYz+AibjstB9AdQKryrqfltG+Icdt5vRhWDKQDKmX9b46j4k2
	 mWT9KhX4pL7gmbPCuEfzK0cyEujuzeyG9gY+EBUV/seeqQwtrcG5Ij7ultaG4flrg3GpP
	 8T2PxXJHgUHTwPLa+ud5/ww3zGZz/mlGuRSafpMHmsuBKflGlG8bz6kJIIGcJKd3+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
	b=Ja5Ku5ktVmGrWlaNVwqwgSSKR68QnMNhT9R4HTYrNQjBe+eNaUoYHc23/xhHMCawygZi
	 WedxEV5UUfoicmkYST3A2f4UsAf7GhVNz6lK5k8aG53DwW1zsgBCKbgaq00T9QnbfB0NP
	 FS06/Bsi0TwDZoXwro+I1oWBkCRJXMptI9IRRkCDKMFhWKYpOzaSwEJLlMZQ/M5TJLQIf
	 SrQr2M6eM5DDI5uoyIhlMvurOrbJCvx2G1oYaBVHYZSl+WrIM/STjncPtVoL3gZVrIILd
	 9boyhlYSIboOo/EblgOofEpBBE3nJjPR3g6IbW2oEMkq4Wik33D8ECnrJ7hb1peEbUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnZ5cWJ+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A2606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40A2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnZ5cWJ+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so7702475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793756572; x=1794361372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
        b=ZnZ5cWJ+ytnymUUDiWLTVDB8LUTx11Pe67lDgEa6UTMikuPe68RtvMTSngvvG/kQTZ
         zDW+WxILFmp5F9KDBr8bZ75Du8TzTPUcpFIzuzO1RlOJ4dCf1JMNDKjZXKeuCni92DH8
         LV2A8/2ZiAOjNVuhXVEhHVa75+tQ4F/OWopgV+krqItDpK5BawAZn5fHh8JXk7wgQZGC
         eUqFXjsoN77aU5Y6b6d/3e68Dyj3/lYlCdkhISVvTHfvZz5OaaEkExil5VEyLaShdqGu
         GC+wwPZbki+kaZLg3qz1MoSCl8tEssvKKP92k7ba8KFQhfKls9TS1+HIul+I1aSQ7plR
         YOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793756572; x=1794361372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
        b=ibBYq/zW24hGc4tTowjY+xdNsDd/DFnbW1n5pfRL/lppd0TAgzcguZuVWdI4glnKOk
         LBQ/VgwNd5NxAoLsFXSxo/A79Vx/VzbN1iW0BxKYfaNmshlwdc1sPqCT5gXT79E1RQf8
         0bu3JD4WV5KP2SYd3ePQhJMbHh98BOcuu4ljKoZKBaUObivU0x1sDrbFOusYtNLCm30z
         5d6NkVCZYmwO0VVmyhxBsoQsh0TAFgCsv+m+Ij/ZVTVOoxX0ITFVsC2detVpqVmz8jRh
         f1dZc/b3y5oHdmeSrXPcOJC2iBcIHjnwUoROa8TmU76yfy/Jo78ZdwjFjvW8r0FHrJUe
         ox3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaRZxaYHFs0znFPzp0cUJQi5Sz/RvsyOUNopN5LmCStaJCTDVhrZEUsqr2WL1gi8PR4zSIhS620SNWXuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MU1uTYFXsdN1gBPCzYoijj3ego9FaG0LwOU3npCBuVV6Zs68D
	6VpxWlwEN9jeGIGFhfobGkj0NzTRcBkFlJDscO9sLQs/M0FruuS6dEs=
X-Gm-Gg: AYBFou3K5kleh2sdUTXY3HtlYXOmd2XviCa8qT5fD9yCldo2GNYxc4/kpiAT4gJbXyB
	i88ca64YdTuY8EClkZZS5cyZOEqANiuRODd5UD5vhp9NttLSbsHfxk3UcOMC+mTk0k6YkPSoIeD
	aHo95xjwiUuKYlkJ5T0ow0204UjaH80RhxDoHiZRKIAXoRQdkyiBpyOFV//unSEvobU/2AXO4ot
	mvnVN5+TyE+1M4OuRxmnZRx2kZ+LymFKx0L4wRpDntKfBD8G0+Jpq0I2PeUbi0RSSz6qOrpnU6R
	ijozSwOC7IuGS0Ls0UvpbjEFBp4022jeeYMg1uKLWSyMfcQWn5UEhuEUvtc9gMJJNCqVvlSPb46
	WvHkaudZ4UAwlcyi4AxJ2S1E0bZEyMKl83i7jvXujkHg4vagv4k75G3GVIqA49SCD00BJH/ixuv
	K+ovuPNovJybxpJ5nxpjMY5RHaorH0m2jdx1wA1C9/nmqof5rTrctQJzu6W5KTy99PAYIfyYd5b
	L4DSYgZUJ4T48Mu/UIGhYuk6twYfcXj1hWwEWsei8tvw0sU4G4w83PZTEcAolantTfGjXE7+RHI
	BjZI3LyfXnc=
X-Received: by 2002:a05:600c:4ece:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ac169d7e39mr333856735e9.5.1793756572002;
        Tue, 03 Nov 2026 17:42:52 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm885532f8f.58.2026.11.03.17.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:42:50 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Wed,  4 Nov 2026 01:42:48 +0000
Message-ID: <20261104014248.3761373-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

v4l2_m2m_release() frees the m2m_dev struct without cancelling
m2m_dev->job_work.  When a job finishes, v4l2_m2m_schedule_next_job()
calls schedule_work() to queue the next run.  If the driver tears down
concurrently, v4l2_m2m_ctx_release() invokes v4l2_m2m_cancel_job() which
handles per-context state (TRANS_RUNNING, TRANS_QUEUED) but does not
drain the device-level job_work.  A pending work item can then fire after
kfree and access freed memory.

Add cancel_work_sync() before the kfree in v4l2_m2m_release() to ensure
the work item is drained.

Fixes: 7f98639def42 ("V4L/DVB: add memory-to-memory device helper framework for videobuf")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Expanded commit message to clarify that cancel_work_sync() complements
  the per-context v4l2_m2m_cancel_job(), which handles TRANS_RUNNING and
  TRANS_QUEUED flags but does not drain the device-level work item
  (Nicolas Dufresne)

 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..311e2e08d066d 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	cancel_work_sync(&m2m_dev->job_work);
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.47.3

