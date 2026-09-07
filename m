Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7AF43DA2C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767969; cv=none; b=Dsby8PlHPhOUfzGGpa7fbLLNdgzSpMYsvzKEtVk8GqLXe0DhSC8G+rCgKCEW+fJNvJXi5OgbZi3Nfqn8IcaDvlbrJlLoi+F+Lwgg5E8w9cK+MAcfK6E08EiGBQT0XB8tM1eBDgTfKUeo2t+sFv8mElUgruIfkru070kZfJ/ybBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767969; c=relaxed/simple;
	bh=CY0SGZKkWGBgKFAKz+DqhuTW6aotEarWwAXGLJcyfqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+uOCIbyLKCY73quV58Uh/DzbUiA3XHLhD94tuWpUwEEHkMpbbq4FhWUNEuorF4WgfxvhnLNxhGqVzzb5qZMYMHsZzoCa1DND3V313bquSDT1QIWdDB+pyRxyFo6D/wElMIkS0Y5tjxCsTnjZfCZt8K9qkRDj+k4JpKG3U/B+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlczcLJ/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlczcLJ/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d91ded8174so24758225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767967; x=1789372767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rknn3+6TS+aLNZFIltiGpSi2IYKIP8ZCdc2t7DJkt98=;
        b=ZlczcLJ/b25uKxe47Zb1+5Rr69MFn6lsDS07k1AsDeHmvonMSHsT4ZGPO1SIRaeY+d
         75Usme2oHOuM9FwevXhlmemtMQ/Okrgz2JsdnRq1IJZXOMx4Pg3d4KjO7g9QC/tUDgQK
         /DAMmXuKV2dxO4YGaIX7Cl4DETxCN0d5Q54x3vqR8r6C9B0Wx0JbknmG9LDgdYaVX0Ht
         93GS6TO1mEoIBlRDY0csiZvOFtbQWZmEdF1pfRkXtwb+dBbLfygTql9JUm661TbdgrRc
         3qMZ1y0ktCEKRLoXNd6//wVADz/GHgUOJdZp5B8vn/AYjw7zLzs9+4gJKlToGwUY7XHa
         0xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767967; x=1789372767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rknn3+6TS+aLNZFIltiGpSi2IYKIP8ZCdc2t7DJkt98=;
        b=qMeExU3EcwKRl0IPfJWQ1vXuH6WboxfMOMVwV3+BXi69qNMqC/JrL5cMRmFW82BqXi
         nbiEMnS/ni0e4SdAKHmEl3pSOMLMEyjI/Yo8P4AcRW6WQZI/zvgzUBEd4eT3O8OIcI3V
         bGz92L8x4DOf5Yv0t+Vm63Wk4Ztzr8zKKUmHzfPRKCt+SgQADPx2lD4EpW3mwik9pSFk
         WviyJllV1MFnR91PvqAYruOR45wjw0hzQKnAdI0k4EHV+pn2A5OttggXgNoXiSf1QMhW
         awp09z8tOy2TuadL54aqckt1TzLLNlXocIDTrfJLfx3eL5OTbUi2BUKXnD7FHLIdLfyt
         naNA==
X-Forwarded-Encrypted: i=1; AKwUvBxsDZRcRcgwIU/PjH6VYF4so0VjBtUzLYN5gEevauSSAcX+GNKssH8b1XVSx5sNX5y7HvvoEEAz85ve2v8=@vger.kernel.org
X-Gm-Message-State: AFuF++m+ZLxAshq4Mj3sWmRyjUyuH6+XWS/55mf9atyR2xJvP9HC1DLn
	ZWvaZGSstv66rLhtR2SDGsz4KV5mP+NmYWG6MSEA7HJL34BV+u58N1s8
X-Gm-Gg: AYBFou3LijAvR2wMujyl9muiP3pqwKMsffqfEai/U8LMrBwsUoHUIPXrty75Wa3WoWk
	ZMO0PVJ6fsexXjSibDy/IoAdeB7a8wxm7GoW7TROiMzZiZsrEfvkGFqtEzhXtfz5RnPIEa7WJFk
	cQDNqTo6in56l0nBE5C+CgefSGYkc+K8i++F0Z9xxMHOEPYFPQEqc2aC3mStbBcHgd4lCl4Egm+
	9VTfzsyF4fDeCh4XttK6erBK9QgdcE9Mz3aSf94XCQG0kqxXRSuEWYxjbNGI3WL972NrfqKc1+B
	HUyGfJ6vWFx00GCuJSlUGnPTReteOUR3aC8hPdNr5EXFhA5MIZ5FRRAOvh6lDA93+x34/h6jc/5
	guZ3CoP412jNBO3NhdJ7PuE9qL8vAT86+8f7Wp5KRtzqJIT+Jo8E/+I8BPFKq2hHgIiBljsPWBZ
	24NB4Fw+A+jHgg8KcZfTxZaXA3tpBQb+OmaHXZuq43Ewk7Er0gShj+3VwkeBaGB8iaVV5Qc5ez+
	JEHU8U=
X-Received: by 2002:a17:903:1af0:b0:2db:331b:e187 with SMTP id d9443c01a7336-2db331be292mr163344515ad.8.1788767966572;
        Mon, 07 Sep 2026 00:59:26 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:26 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 12/13] srcutree: Remove debug pr_alert()s
Date: Mon,  7 Sep 2026 15:58:28 +0800
Message-ID: <20260907075829.2073224-13-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Remove the debug pr_alert()s from srcu_gp_start() and
synchronize_srcu_atomic().

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index a93bf803e2f7..a016c93d65cb 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -916,7 +916,6 @@ static void srcu_gp_start(struct srcu_struct *ssp)
 {
 	int state;
 
-	/*&&&&*/pr_alert("%s() start: ->srcu_gp_seq: %lx ->srcu_gp_seq_needed: %lx\n", __func__, ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed);
 	lockdep_assert_held(&ACCESS_PRIVATE(ssp->srcu_sup, lock));
 	WARN_ON_ONCE(ULONG_CMP_GE(ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed));
 	WRITE_ONCE(ssp->srcu_sup->srcu_gp_start, jiffies);
@@ -2152,7 +2151,6 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 	// OK, we really have to do it ourselves.  Start the grace period.
 	non_block_start();  // We must not voluntarily block!
 	smp_store_release(&sup->srcu_gp_seq_needed, srcu_state); // See srcu_funnel_gp_start().
-	/*&&&&*/pr_alert("%s() start: ->srcu_gp_seq: %lx ->srcu_gp_seq_needed: %lx\n", __func__, ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed);
 	ASSERT_EXCLUSIVE_WRITER(ssp->srcu_sup->srcu_gp_seq);
 	srcu_gp_start(ssp);
 	raw_spin_unlock_irq_rcu_node(sup);
@@ -2208,7 +2206,6 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 		cpu_relax();
 		srcu_advance_state(ssp, true);
 	}
-	/*&&&&*/pr_alert("%s() end: ->srcu_gp_seq: %lx ->srcu_gp_seq_needed: %lx\n", __func__, ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed);
 	ASSERT_EXCLUSIVE_WRITER(sup->srcu_atomic_gp_flag);
 	atomic_set_release(&sup->srcu_atomic_gp_flag, 0);
 	preempt_enable();
-- 
2.43.0

