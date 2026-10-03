Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644E484243
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044253; cv=none; b=s5yGeDjQ45mUpHRpDcKyuy9Pw5ad4JJ7pqCk8RjtBBbVgVwRxXq3VFF76eezJ4uRd3q18788BI4VB+SBh1uCYrsNhLkdGusoNYhJzcL9v4yU+JxCB0WWvR1WcBY6a0CVDnkJnpjAzvTtVRjN24r0TfnUn1012/u3SRJUNwhzHrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044253; c=relaxed/simple;
	bh=wfH8wpo4fQkMWmhf7ecM6gIGRhKxXZRTeQqjn3CvMFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aacilptf9kGVFgAzvmEg27mfhTo35taxEX+pc5I/Mt8PSHvQvSUelhVV6EA7W1O50CCFCp+OsIIaYsXbuLOzgZMD/W/lMFdQtUu5TMNb8i8NfsvilBc31kHOVjzjR1P52phJ252R+34k+yr5FCNvTZfVVPxQmJqRzWyP0zOvMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvhAZEsQ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvhAZEsQ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso196404a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044251; x=1791649051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDIjwlR7Rtt/S3CXSZpUYfZHO7+anZ87U124wiaxA8M=;
        b=jvhAZEsQIfvAA2tCYrGC4QXhx4oI59k0lij6o3V+ppy54dIun4TO0g6MgMZII1zei8
         dBW0U6jPiLUGNOb98m6445JcLRWVfPtmW6eUtMUXdJTzQkSUqfOCBCDa0zbI0sj0oZHq
         9xzUXEYYicSpPuy7ollElqzrp1gWNtCEiVeNoKtscyZ6amdbkE03NbPiqp8IQ6dPw/7f
         HcSod3aaPyk2FdFZq/TaAEjgh8ym3YgB6HV4ro+uDTtTckwllWK1Odu607uZlDrPSMUh
         u93zuAAwgHd6y0Tck9HNeMIr1Nxj+DxxW5tQUa9vsBGEz0Eo2eYjCbVIBDMiN44Pn3Bc
         fERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044251; x=1791649051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDIjwlR7Rtt/S3CXSZpUYfZHO7+anZ87U124wiaxA8M=;
        b=dSthUHk14DPQj4AxIh5DHZnhVdiqaQ4cqlog0w9i5kNa/4VuEcqzdO8Jxjzwsvursi
         pYLOKRxJk7yw/TTsuw2TpwI/t77uhuiXbQAE+cdPMEGRkBfaM5jlg/HmhFxZeYIa+/fX
         FENmxwxvmLKm6pUckvo7XNoik07F+i8ZAKB+q8XrZ4evBnwbVBZt4rFfzNMNtDKi+9S5
         nGJKxsmWH6cFcfnRou/BvIcUzdu5zvzag3o+LM0IFU1zSmr7oG1ngHZkwYpWDqAfXlBr
         lZm/NGxm5S7YFO5ywE5Bg1L/w27MO8aPFLuZUAAplvJhG2155daZc4rRTurkEIsQYbME
         bUDg==
X-Forwarded-Encrypted: i=1; AKwUvBxjiFqYfynf/KnciqHWvD4RArMqa2tfVOYP603IqnDCuBM7ztXB/FvlvdOVheylzGOx7xe2JvtMmJ8GPZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLY1rrzFWGUDTTpR0o9a4PLE0F9I07EK252HCMZTt7nTn1n9V/
	m8lWzzEHo5qDqh2qxJJToonM0WWLn7VVlUuMsArJJDdRz6T7+1fG28hB
X-Gm-Gg: AYBFou0B39y5avaoRCOElm3DZ1DkH6ckePVg43Ud07brmWStOxXrsuVZ/kAs5BJsY1S
	g7G8W2pc+VD0jp6SPsXRdVWEviaHo/Ih7ply1HUSEOhthEWOcuIPJpIh4Hv267CEMbr8BtUUMne
	AGLCcqAQ6gp/P15Bc4BWUISOYRHTunSai7Rz7XBLof2JO3mWg11JIh37heKK5qeWtQT0yD9pLqk
	vc6kES6d0zJKIMIrKQdNGgBYEyGycM4WaOauUMdLDZ47hiKSz2zzCInGgYeeubEAqDbCCIAt3k1
	nBj2FfId7P8q5T0MkYPugTstYkx7KLqf8m3kY1SeqiDmAfPt0kiCF2IiZgmjd9Q3tkhtgjTf3JG
	dbYuW88FL9KmdDjjdG6VPgarACBRFgm22Q/7MEOI5fY9PHIhJtSt/kgotnEf2VURHSPsdySIzNT
	gI1hhL/qUQU4wYLtqJYH1zMBHVnQTSb1P3F7XWS1SbFOcmNqosGaVysRzWlQzV488pkgQfIhGDp
	ghHQ73ROx/QT4cOxxMQPR9/jq2u
X-Received: by 2002:a17:90b:3e85:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3a783504695mr1759638a91.44.1791044250656;
        Sat, 03 Oct 2026 09:17:30 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79a98e7c0sm2199935a91.0.2026.10.03.09.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:17:30 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2] rcuscale: add srcua scale type
Date: Sun,  4 Oct 2026 00:17:19 +0800
Message-ID: <20261003161720.240855-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for scaling atomic SRCU grace periods using
srcu_read_lock_atomic()/srcu_read_unlock_atomic() and
synchronize_srcu_atomic().

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
Changes since v1:
- Rename srcu_atomic_ctlp to srcua and reuse srcu_ctlp for
  SRCU operations, as suggested by Paul.
- Reuse the existing SRCU cleanup and completed helpers by
  initializing srcu_ctlp in srcu_atomic_scale_init().
- Add .stats using srcu_scale_stats().
- Use "srcua" to match the existing "srcu" and "srcud" scale
  type names.
- Use synchronize_srcu_atomic() for both normal and expedited
  scale tests.

v1: https://lore.kernel.org/all/20260927100359.3903688-1-kunwu.chan@gmail.com/
Tested with kvm.sh --torture rcuscale scale_type=srcua on x86_64 and
arm64, alongside gp_exp=1 and PROVE_LOCKING=y: no warnings or lockdep
splats.
---
 kernel/rcu/rcuscale.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..b172882824ac 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -293,6 +293,44 @@ static struct rcu_scale_ops srcud_ops = {
 	.name		= "srcud"
 };
 
+static struct srcu_struct srcua;
+
+static int srcu_scale_atomic_read_lock(void)
+{
+	return srcu_read_lock_atomic(srcu_ctlp);
+}
+
+static void srcu_scale_atomic_read_unlock(int idx)
+{
+	srcu_read_unlock_atomic(srcu_ctlp, idx);
+}
+
+static void srcu_scale_atomic_synchronize(void)
+{
+	synchronize_srcu_atomic(srcu_ctlp);
+}
+
+static void srcu_atomic_scale_init(void)
+{
+	srcu_ctlp = &srcua;
+	init_srcu_struct_atomic(srcu_ctlp);
+}
+
+static struct rcu_scale_ops srcua_ops = {
+	.ptype		= SRCU_FLAVOR,
+	.init		= srcu_atomic_scale_init,
+	.cleanup	= srcu_sync_scale_cleanup,
+	.readlock	= srcu_scale_atomic_read_lock,
+	.readunlock	= srcu_scale_atomic_read_unlock,
+	.get_gp_seq	= srcu_scale_completed,
+	.gp_diff	= rcu_seq_diff,
+	.exp_completed	= srcu_scale_completed,
+	.sync		= srcu_scale_atomic_synchronize,
+	.exp_sync	= srcu_scale_atomic_synchronize,
+	.stats		= srcu_scale_stats,
+	.name		= "srcua"
+};
+
 #ifdef CONFIG_TASKS_RCU
 
 /*
@@ -1110,7 +1148,8 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))

base-commit: d21906b0aa1e9573cdb5e7acaca44966b9d1dcd2
-- 
2.43.0

