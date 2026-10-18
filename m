Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870A48FF76
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792325647; cv=none; b=r+kIQhoVEdtVkQVcHp7htu0ZpaYrstFHrB1Mq1wuClqCprchTDbAAXcAIxgEFDkCanzX0Pojoz71S3UJnFL6DtPdEOtaExuuG6Si1RxBnvbVQeBzlWLxWTdP+KeEjh4JGDQ6KQoMhyGt8ZsKYtDuHQQrOylQ6GPu59sghu0MwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792325647; c=relaxed/simple;
	bh=0ZUoTOrw2sVIIJsHysZ9LrpXCPGOLNSWoimGoqE2U2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxIOIiyMZuu/3sP9p17pXJGfs6nBv49lt/qkxc5ZIzyyBGjOmvxOv+oytq95+zH6pLx2EtrCxk0X/GzMv9iQCTJKpu6tjeziFvTNwe436hjNQdWQHwUg9XVZ90ly+SUaQNy3pxq2RbpuDlKLrXSLNGSJt51M719Wwa2sIX4qKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpinP1vp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpinP1vp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso628765a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792325645; x=1792930445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTNuU8y07OWc3gpsCtxs9hMoDORTFAVO+j50HlgZwnM=;
        b=hpinP1vpFyJpDdPHICXGzIQIRyImrKMVDhw1wgqsbp/SHHH8D77WA05IczWynz+ZQU
         cE4hrlX3BUbq7wjQ2t4DM6bRSyXh/0EXGO5qZlEud8ZvnbFJGqykMI+TPhQQv0kS7MfQ
         xFQoKTXBNyOirmkztWZlwE/YDM+shn63+be1LPBgy/2eS3R3X2gnx2amqEzRF2LNeQkE
         HZseIBZNuNsA747O7X3E7lW71cbVvbIh/lGQg3N38dnYaB8kNGwKHCz7Ajg0WrVWuWx2
         q2YRb2LbIMcOHjEUexc9g5nVeahpZZ7W33eKZE8hXJROfPktp6fSIBjvD7hMOqBXHKSr
         Cxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792325645; x=1792930445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTNuU8y07OWc3gpsCtxs9hMoDORTFAVO+j50HlgZwnM=;
        b=2Y+xFtPcyENUI5YzPvW5UVSthGihdVBgZwYTZl8EHJEijNYjgwkEQb5gj62xUn4fF1
         SIOvQhDOCCF3DwEGzquW7nLC1v04dlId6UJ+4nNbECQ8CBbD8pvyiib+dkrfwsIdq9XL
         7C90fLCqv69vqfV2PvUrOsGw2cSRnXHi6tUywDPopc6ZiDIHKihSs95LVVhvmIUPbvZk
         2hIbc/7SGHOHx8MU3VoGRmi8+YmkEUn+r+vpYWGJ/VnyD7/NirkVsjf+xRu5FO97KcRv
         NObhTKkHMNpiDggs4OhDTcfYHOOvZJVgkVhT6HOAo8z9nbhmQSLg9ZBYKV95qOpP2PRX
         W7kg==
X-Forwarded-Encrypted: i=1; AKwUvBxUYmn1jG9+1Eipv3N1RwaPEq+GIWDmalMLT+QNyaNo3qDzk0bQItRFi/H21axUuRyW3BXusb34cuJ9mC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxaxm6q5YK3SKWhEnPR7BRq8GVkNIvuPSgSJr9mzpD6Fl7g1Xa
	9EssMvMO7JIfSdPik6mmMXfbJoJlSpNunNIqXlyWN1PZAbESNJODGCLK
X-Gm-Gg: AYBFou1sxzAZTCtdA5nikKyBXHL3UbbGvOQzTOjorTfm8SsW+ZTPx0y/x3Qvj8cVw2v
	CWs13NzVyd6jrOPNnKDhTvpKa43SFGTyOW5aG9HPpEpE2f9cXSXXDUUlSeuTST7d8q1dx+sti/m
	ZMePN94w7UqVlcYOb7ft4YmM8MDTQrP5/fJCGkZzdPfwirB0Vp7KZzHNwc5d39Jaqy8gtHs8LHS
	lYNL0IY2mEvlyMoJJIrkdf5sc6jYBx7X3OfLtOa/8OFFXy93erC5n79y/S4JWPPCbohclkz+r0L
	THeiYD6sYYIMWp+zhWqQEItdEKieJoVdBrGk0GPUtugpGMz0KbkLKQYwVyIqmHjA5fkYgepywco
	u2uESy88f9tbSV3vVJJ94cvFijFDEmlUogpycblnNDKnfJxefHRiziPnsENUA3pIsG7fbrTg33q
	B91WvzvuPjiNrUxaDVa9xDqJOLo3JTykuJRvEi+UqxP/2V9Dkj48PMlPPNPh7wYwK+jDhnTTIFU
	RNjRbBtS38NNrMg6A2WEDbjLEbewmaWr+/8QIuZvQtsgfTwG09RvDR6CUgBEGBJhSO/5+LQE32y
	Ibmq+SfO0CdmqDtHiVkPKz3Z9tDEvI3dG5sZzz2GTXu760st
X-Received: by 2002:a17:90b:2c90:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3acef0ff0cdmr4044977a91.46.1792325645279;
        Sun, 18 Oct 2026 05:14:05 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48e8646sm11116604a91.10.2026.10.18.05.14.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:14:04 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: Dmitry Bogdanov <d.bogdanov@yadro.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [BUG] scsi: target: PR OUT CLEAR registration-list teardown races concurrent PR OUT -> UAF / double list_del
Date: Sun, 18 Oct 2026 22:13:57 +1000
Message-ID: <20261018121357.63980-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

core_scsi3_emulate_pro_clear() tears down the global registration_list holding
only pr_tmpl->registration_lock, and __core_scsi3_free_registration() drops that
lock across its pr_res_holders busy-wait:

	spin_lock(&pr_tmpl->registration_lock);
	list_for_each_entry_safe(pr_reg, pr_reg_tmp,
			&pr_tmpl->registration_list, pr_reg_list) {
		...
		__core_scsi3_free_registration(dev, pr_reg, NULL, calling_it_nexus);
		...
	}
	spin_unlock(&pr_tmpl->registration_lock);

__core_scsi3_free_registration():

	if (!list_empty(&pr_reg->pr_reg_list))
		list_del(&pr_reg->pr_reg_list);
	...
	spin_unlock(&pr_tmpl->registration_lock);
	while (atomic_read(&pr_reg->pr_res_holders) != 0)
		cpu_relax();
	...
	spin_lock(&pr_tmpl->registration_lock);
	...
	kmem_cache_free(t10_pr_reg_cache, pr_reg);

Unlike PR OUT PREEMPT (core_scsi3_pro_preempt), which holds
dev->dev_reservation_lock across its entire registration_list free loop, CLEAR
drops dev_reservation_lock before the loop. The same registration_lock-only
teardown appears in core_scsi3_free_pr_reg_from_nacl() and the PR OUT REGISTER
unregister path. PR OUT has no device-level serialization, so two I_T nexuses
can run teardown loops concurrently.

list_for_each_entry_safe() caches the next entry. While one CLEAR is parked in
__core_scsi3_free_registration()'s registration_lock drop, a second concurrent
CLEAR acquires registration_lock and list_del()s + kmem_cache_free()s exactly
that cached next entry. The first CLEAR then advances onto the freed entry ->
use-after-free read of ->pr_reg_list.next, list_del() on a poisoned node, and a
double kmem_cache_free().

Reproduced on a KASAN kernel with two tcm_loop I_T nexuses mapped to one iblock
LUN, each looping { PR OUT REGISTER own-key ; PR OUT CLEAR own-key } via SG_IO:

	list_del corruption, ffff...->next is LIST_POISON1 (dead000000000100)
	kernel BUG at lib/list_debug.c:56!
	RIP: __list_del_entry_valid_or_report+0xc2/0x140
	Call Trace:
	 __core_scsi3_free_registration+0x12d/0x430
	 target_scsi3_emulate_pr_out+0xac0/0x13f0
	 __target_execute_cmd+0x56/0x140
	 target_execute_cmd+0x1a0/0x5b0
	 tcm_loop_write_pending+0x15/0x20
	 transport_generic_new_cmd+0x40b/0x700
	 __target_submit+0xae/0x1e0
	 target_queued_submit_work+0x64/0x190

Note for a fix: simply taking dev_reservation_lock across the CLEAR teardown
loop (mirroring PREEMPT) is not sufficient -- it deadlocks. A PR OUT command
takes a pr_res_holders reference on its own registration via
core_scsi3_locate_pr_reg() *before* acquiring dev_reservation_lock, so one CLEAR
busy-waiting in __core_scsi3_free_registration() for another nexus's
registration to reach pr_res_holders == 0 waits forever on a nexus whose own PR
OUT is blocked on dev_reservation_lock (observed as an RCU stall). A correct fix
likely needs the registration lifetime reworked (drop the locate reference
before teardown, or defer the free to the last put) rather than only widening
the lock.

Reported-by: Yu Zhang <yuz08559@gmail.com>
