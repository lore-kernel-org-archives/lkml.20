Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88912263F44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838611; cv=none; b=CH4E6F4QodXw7ZTHs2q9PfJCI/cs1uEsZzhcqXnYvxYQAHTeecYF8hEhG18eN/ff4l2EWaOq78Ju+B11vaeQjlaOyOXwlEgfuliRhVCuK8pNcx1RVrvVXV0GYGqLKil9eGZn3Lv2svEROPJAkx4ClqWSBakbP7ltiqbe6rpHviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838611; c=relaxed/simple;
	bh=vmkgHp4qjpk64IJKA5ih3Bno+A5WAkjdnL6wpKag8k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcucVXPHDmpNBrryAp6kDp+5yB6bTKOKPTB92TtEJDfmxMSDQ14RPS93GNw+JVjtyiZuSQJUh1M5qyWl+H4IEdXcJloq1ChIP5kOHlAwpwvtaAk/2Gt/LCmyETn2Vo4sRARF9tQMPoOEnw/uEcVVQiwKItNJT9y2vd+JwsUGYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck82Vpr+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck82Vpr+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2673601a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838610; x=1788443410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StKPa87KMq3gd2F3wzCNT23815+rLpaPXtMI+qlMagQ=;
        b=ck82Vpr+OLdq6k5w6VEzDEAB+Dm5xFNxE+GVkMvi7B4kcw15fsZxNG/jtcuuTb+ZyB
         YiKyCe41ru0+wpr/Lo+XSbJuWUza+X1yoTxmd7hi+k4ctWmQQ+dBDCKr7wYsosQirCiV
         z2HcLJU3jYByuY+uuz1saWcXS47OHbI7y8/9vIpwakiOOyYRlBLE/xcKkB+9j1Je7sRG
         /RQ5bAerYcPEX2S9+wnaeEPJ/f5r6mdmCqbO8Ikmij0i+wPEouN3W25gvLNge/VcnfVq
         gTRSnlpkrftUmVnMvnM973lTJU0eTeEhnP3hhrPsutyOecVMjlhv64x1XXPFqJI1vJb4
         JsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838610; x=1788443410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StKPa87KMq3gd2F3wzCNT23815+rLpaPXtMI+qlMagQ=;
        b=YqeJXm0UisRmfg/Vt+XhCVRzFEMkXrtOuVgtkv+24wYA4Cw8y3zY0t6coCmT3WSwiL
         247q46eK7DFX1+not0MNGxXhV2MpVdGK5z5pMtbR9s89p+coFMQWmr2Ag+E5RNRBpNrC
         PVceKDeORu/OHloOcHwYZX1nO9eokTp8EgQCKA9vE/ifzXOCL8+Z+prWEHavZRWO7Zzu
         VIFa/mdehqXVjx2iAn/soXGU3kqGz06AW0roOJQrq9F7b8lk8t8W9ZxQoLOhRyf5h7Dc
         rhFeznweLuzq93TLCPLeNTgu5rU2gJJX8uxo0BQIe+RZ4liPXkp7isEInPxVROJs44WX
         1LqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBcuEfvxYHO1uo9wqBGbgbDPAEgFDDeWuYXHpFvWoahzEz0zEluHLR0B0bQGvR7KYCvBM4hQdm9zzU3o0=@vger.kernel.org
X-Gm-Message-State: AFuF++nbmHUv81+f+dHPNtNyn4DQPl2ZU2TNQgNrn4V5yFWR35dJTfbH
	GuoPfhE6D5UeUIEyJws7VhE9oIK+/X4EpBnqsQLYxpZhmRU//KMuU8iNgIx4Nw==
X-Gm-Gg: AR+sD119FYKn7pOqMUXa/JVPWFde151f3KFD+ONOPIYpjI0sprq3y6px5Gz+RKzrWBx
	nZM4ujEpgLZ+cRZml4vCd+tbnIRi6rqQpHCU2fbaO6qDtvN5T2nwGZKsLZLHrw0mjabLUkJlvif
	kXn1ZCZV7Rb4bdLcJgsX84rTmdFhBbau0vmH7me/0w8t7OqHoce82oRN4Y4fuyPVcWizy8S1gKp
	/Rlkec8Nvbpy+cqgfluhIEK7Bmvk9DB2Lzgtc80CZ3TqEMcy9SJFa1m5o2S3gfA+G7DkWK5v6ZE
	7uYaYBsn/iUKSn7WP/s15aFmBUIaezU/s3BGnK4Vs2bKdxaYd1KTLWALMgWdbwqIj/zL+4wdfE4
	jDuTe9+i7K5If3ajY0JGulOMgFbQoz/0Ubt+DliUA5hmOuOgcHVE165qPSwbB5LDPsiy3v/kSF4
	BpiyqHYe/kc0ZJ8gx1tGhB8G0+lBT8ZkcUB8KlSWNqlvk7YR51D843H63EItadrZ3J69MT9CzlR
	3g5ek93odo=
X-Received: by 2002:a17:90b:3b92:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-3966d5d91e7mr28859812a91.10.1787838609618;
        Thu, 27 Aug 2026 06:50:09 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fa2f46sm2873538a91.9.2026.08.27.06.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:50:08 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com
Cc: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: sched/fair: which tasks should nr_pref_llc_running be compared against?
Date: Thu, 27 Aug 2026 21:50:00 +0800
Message-ID: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading alb_break_llc() I cannot tell which set of tasks the equality is
meant to cover:

	/* kernel/sched/fair.c:10756 */
	if (env->src_rq->nr_pref_llc_running &&
	    env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable) {

The two counters track different sets.  nr_pref_llc_running is maintained
from account_entity_enqueue() and account_entity_dequeue() at fair.c:4522
and 4538, beside cfs_rq->nr_queued++/-- at 4525 and 4541, so it follows
queued tasks.  h_nr_runnable leaves out delay-dequeued entities:
set_delayed() decrements it at 6398 while the entity stays queued and
clear_delayed() restores it at 6418, neither going through
account_entity_dequeue().

So with DELAY_DEQUEUE a task that has just gone to sleep holds
nr_pref_llc_running above h_nr_runnable until it is dequeued for real, the
equality cannot hold, and alb_break_llc() returns false, which stops
active load balance from honouring the LLC preference.  The counter is a
superset of the other, so the error is one-sided: the check can fail to
protect but never protects wrongly.

Comparing against cfs.h_nr_queued would make both sides agree and read as
"every queued fair task prefers this LLC".  Keeping runnable semantics
would instead mean maintaining nr_pref_llc_running from set_delayed() and
clear_delayed(), which may be the better fit, since only runnable tasks
are candidates for active load balance and a task on its way to sleep is
not one.  Which did you have in mind?

This is from reading the code rather than an observed failure, and I could
not exercise the path in a two-socket qemu guest either: with cache aware
scheduling on and one process of 6 busy and 10 sleeping threads,
p->preferred_llc was never assigned, so nr_pref_llc_running stayed 0
throughout while alb_break_llc() itself ran 21 times.  Nearly every
account_mm_sched() call returned before the mm->sc_stat check, which makes
me suspect update_se() bails on delta_exec <= 0 under emulation before the
accounting is reached.  If a guest cannot exercise this, that is worth
knowing on its own, since it is also how a mismatch like this stays
hidden.

Thanks,
Zhan Xusheng
