Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn [202.108.3.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC53FA5FC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513033; cv=none; b=Oek8IODvNN8ecEnb9fU+5+UFlc+C1chc3vzX63xjnYY1zHqymOsPL/Q70yRgLMDvqgCszGbBIgUUFmueMl13q3bvqAoPlmaLCC75cEOgYrmdNn3UjblGVgzxm0lPWp9/sjQryceZZF7agMFArwJBEXXikInUDvKWye9cpy08fks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513033; c=relaxed/simple;
	bh=MrXcEUTeGcNarmKBAT4+S5PFg4Vf6wueAlaIWdTpb/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jo+BR9VvWJ5KHoBBcECnDXC1EIIR9Insn9IEgduUMSUcRTGcTKCDjfvj5pKoDhOZ/29YUyX8XZ5iXkUPW8hZJweZH00BTqDZyYBSupnT2uOKRKBalH8QtZYFlNFhb09NGYrCRJA3UjyXaCoxWQnVUJk3VFOSit5X+XZNFzuj0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=d6+9mK2T; arc=none smtp.client-ip=202.108.3.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="d6+9mK2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788513029;
	bh=7VOLbfX8DslMEj9P3IdYwR8CwYqRGhFXh3e26QCPBuo=;
	h=From:Subject:Date:Message-ID;
	b=d6+9mK2TWxlDNpZZyctcuCHOz28iARSH+UtS0hnUtyiPR3sKJ9ViQdjcvuDtFq1Lg
	 kf8y263RJOBeB+xzQCxKeqfPYWboAtwk2hzd4HQo3JLY56uD92NaMif2UzdBuWdinI
	 nDFqM5qES9Zj66+zr12x94cnBWibQYpDTc3Cymxc=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6A9A8AFA0000567E; Fri, 4 Sep 2026 17:10:24 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7925356292018
X-SMAIL-UIID: F0B63013186A4F2CB516E47ADCA065C4-20260904-171024-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
Date: Fri,  4 Sep 2026 17:10:18 +0800
Message-ID: <20260904091018.606487-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
References: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 940de590b839

diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index fcb1f8186fdd..39447a72f91c 100644
--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -443,6 +443,8 @@ static void nvme_loop_reset_ctrl_work(struct work_struct *work)
 		container_of(work, struct nvme_loop_ctrl, ctrl.reset_work);
 	int ret;
 
+	if (!ctrl->ctrl.admin_q)
+		return;
 	nvme_stop_ctrl(&ctrl->ctrl);
 	nvme_loop_shutdown_ctrl(ctrl);
 
