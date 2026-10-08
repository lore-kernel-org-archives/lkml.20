Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01738C2D0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487135; cv=none; b=K5F5f3Vola67w2E5FkG1aEGRaSKDEXe6XpTyF1RpfxQl2sOyOK0j4t4br+wVoCwQby5qBaYyOLA0GkRbShD0wycMS5ogH9I9UbR//5o7nWpaoVA+/AesBPv30zN0om9TfPYTykouqDsPU93BAHfqRXhMrGO1/mj5TR4O2y7iuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487135; c=relaxed/simple;
	bh=NtDq6e8LX1lDAOuEJn4iBhESf83UdpiEIuIR6bCr5Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=snO5hX/K8q2nE8KSb1nCP0581sGwHGAR+vmpyDSXLY7a9fbwvA1glwdNG6bEL7FgJ4u70t4JnlhBn5DfSlVqrifi7CKzPe66+Sk9VjSjBQWkYf/luOj1OTSznEj7fg27xRvXx3+4OENudaB8Mo3U2h94WT0oO8rhuzzR5JQLLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YojI7yI1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YojI7yI1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2216968f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487133; x=1792091933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvBBYt0QHaBsGt4sgK0v6LDNYZqIUkl6IROUmRuxWdQ=;
        b=YojI7yI1wkldHLrvVqCPWDYkPwCDutcycnxzUVYgkY6MKJnwjsoC/hKFvv1HBt+8J4
         al6RHuc72iv7FkpsjiBx3XNu2gskZlFxeBGgZkzl0UsGKdfnppMivXQ9djP9marlM1c8
         WFZRg6/vp+D59u5tJXFyHt0wcWkrPLoBxmTto6ADyt3oQT4guDMakxMRbxDhjmQGxrib
         pmDnnJYYa68LvE44GSRXtZINd+ujOJikCywnfrmurS8xbdqpec90Ob791Nw/biv7uNgs
         YTtBJXwdbqM3fVX6+5EK6f7W+u87ymirT8gscZUm1WT9pLxkCA9kXP2Nup/sy/6A5aif
         tAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487133; x=1792091933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvBBYt0QHaBsGt4sgK0v6LDNYZqIUkl6IROUmRuxWdQ=;
        b=tWpxsJoRmk0qQ9LrzRa1wFL4o5Yt7fQzF1uGIZhvzp1+2wC1SPR9BPBXRd6ewgWApL
         tYKxfRayftYXlS56f9ASGxtieVF6uA+69MB1Jdef3c7X6AtVGUDJV+3+d8aHlsnoMPPU
         mtKU1wAmARHhoMSycCNXVHN22vDtJzGSbSIpEoVMUM0H1d3xphK3Kjd9levPnTTr2bKw
         6JA7H08fBaX1WDPekl6406YlCgtpsWacehODTCKTvVknZtMHZqDqs5KlQJvHnIgh2N/2
         C1XUUWqYq0n8nEGdDMQOEXE3tMmKe2x+fj6VBM1w6FulzN3pR8WjqSLIHqeE1iFRpU3G
         eIgg==
X-Forwarded-Encrypted: i=1; AKwUvBzH5Mnnf33i8I97zbuACfNt/t3f0cAIAGx6QkVgt5eSoTJXRqTX4scKqbAg57n0jqO8idU3nd4e6mL0R4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIshSo8denchwBJZ6L5PSIgLemEStHteaUjOOoU74FHeEnSx8SJ
	aIw0FJxxVZXE6zCjpjcgQzWjvqr08FTTrSknW1ybUMWbCx2SF7qOanB1
X-Gm-Gg: AYBFou3E0ApNyF3U31nfS9FLMaHufl7GuZaHQIPZs0GTfc8pyKQrTX5xq/97d1iUjNV
	8PRXWBK6ekszsqO/hadJzOYfp0MTLltz00gvM8FWUlL2nLJwQXNWCQa+tK+cJVXGqcqSJsEcLCE
	wJdvFv0Zn9cr5IIJt421F3nsckfePV5XHN9TjA63wsCwkCja1mI22RYJ9JzCZwJO1E30At8XVrE
	DcJ7KXuWYev77ojSpPTZ+uFoSNGHMam22+9BJIzqbhIl7Wj3ydEStwhKYRj9LuLbH9qEu/FESG5
	UjG1PkFgphiVeMepsEnfmaXdq4wbHhtW28eqrGcM7+pCSDVyWBkm6lhmn1xd/9rHKYJkVRypT4g
	MAa/hyQOM2zdIVCYBwB0DGRPO0RA1+ib7EztwtaRMyG2RvNz+sV6gGYxxY8fV0RqfZTS80IbhpY
	5BA/d9Ym5RG9tJ26jZ2wtk2F/Oz1YaIG15nnzZ9YX3RitSQXKfDWatIOlSZfSottEairQySQ/3B
	0/B0iinnBukLfyYeg9nCoU1b4uG7zRve7xPlc+0DuEWwRDeiD1+e3SdN5+8+mEDoYsl
X-Received: by 2002:a5d:64c9:0:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48c72890fdcmr12484231f8f.50.1791487132477;
        Thu, 08 Oct 2026 12:18:52 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db650fe17sm1104128f8f.9.2026.10.08.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:18:52 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Subject: [PATCH] nvmet-fc: don't drop the last assoc reference in nvmet_fc_delete_ctrl()
Date: Thu,  8 Oct 2026 20:18:48 +0100
Message-Id: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot hit a recursive locking report on subsys->lock when a subsystem
is unlinked from an FC port.

nvmet_port_del_ctrls() holds subsys->lock while it calls ->delete_ctrl()
for each controller. nvmet_fc_delete_ctrl() grabs a reference on the
association, queues del_work and then drops the reference. If del_work
gets to run to completion before that put, ours is the last reference.
Freeing the assoc tears down the queues, the last nvmet_cq_put() drops
the last ctrl reference, and nvmet_ctrl_free() goes for subsys->lock
again:

  WARNING: possible recursive locking detected
  ...
   nvmet_ctrl_free+0xa6/0x8e0 drivers/nvme/target/core.c:1766
   nvmet_cq_put+0x158/0x200 drivers/nvme/target/core.c:848
   nvmet_fc_target_assoc_free+0x418/0x2220 drivers/nvme/target/fc.c:1173
   nvmet_fc_delete_ctrl+0x717/0x7e0 drivers/nvme/target/fc.c:1581
   nvmet_port_del_ctrls+0xfb/0x150 drivers/nvme/target/core.c:311
   nvmet_port_subsys_drop_link+0x1e8/0x310 drivers/nvme/target/configfs.c:1119

It's a real hang, not only a lockdep warning. I reproduced it with
fcloop by putting an msleep() before the put: rm on the configfs link
gets stuck in D state for good.

I don't think we need that reference at all. del_work does
list_del_rcu() and synchronize_rcu() before it drops the initial
reference, so an assoc we find on assoc_list can't go away before
rcu_read_unlock(). nvmet_fc_schedule_delete_assoc() doesn't sleep, so
just call it inside the RCU section and get rid of the get/put. If the
assoc is already being deleted, terminating is set and the call is a
no-op, which matches what happened before when the get failed.

With the same msleep() in place the patched kernel unlinks cleanly and
the assoc is freed from the workqueue.

Fixes: 4049dc96b8de ("nvmet-fc: defer cleanup using RCU properly")
Reported-by: syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=da94a51633758d13bd63
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/nvme/target/fc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..eecdffefa24f 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1567,8 +1567,14 @@ nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
 		list_for_each_entry_rcu(assoc, &tgtport->assoc_list, a_list) {
 			queue = assoc->queues[0];
 			if (queue && queue->nvme_sq.ctrl == ctrl) {
-				if (nvmet_fc_tgt_a_get(assoc))
-					found_ctrl = true;
+				/*
+				 * No assoc reference here: we're called with
+				 * subsys->lock held, and if del_work beat us,
+				 * our put would free the ctrl under that lock.
+				 * RCU keeps the assoc alive until unlock.
+				 */
+				nvmet_fc_schedule_delete_assoc(assoc);
+				found_ctrl = true;
 				break;
 			}
 		}
@@ -1576,11 +1582,8 @@ nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
 
 		nvmet_fc_tgtport_put(tgtport);
 
-		if (found_ctrl) {
-			nvmet_fc_schedule_delete_assoc(assoc);
-			nvmet_fc_tgt_a_put(assoc);
+		if (found_ctrl)
 			return;
-		}
 
 		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	}
-- 
2.34.1

