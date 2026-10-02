Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706E502576
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961115; cv=none; b=qu6K66fTvkhifs/wIhFcT3+sCBIfTOZetLPssK6BIV8fUXoNzM9DBvLU8PMxq6IE9EhNQv8RDvvukroM8I4GO+dl+q+Q0yZ3jTbRRd9Bz/wVvhKo23xCxEvVJjKZls0G1NRWK6AP50IChKz+tEoR1HAqlHWjrSDZWsAbOWKLNSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961115; c=relaxed/simple;
	bh=c7ckEYnsoc8lY6bepSRx0MX3kspdeIxVPo6r8T3T7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAdrI4lhc5wMPW8B+SxqaU3BMXRvAH4rWMYEBMJwzzrSss5trJc2Yl5RGn2SSXhLPl+r8bXeqB6C7iiCt2sXkz2SRmoKc45ySRHCZ/winQsRR5S2cV8ZzS0gTEMoy5/0ZNfIrPpvaPm1dPBUbRzzOf0RGurAF2zkvRoORUHrUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et5jNYEn; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et5jNYEn"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so2899087a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961105; x=1791565905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=et5jNYEnRjFgMtTgxmbQKLyPtRY6+zKJzAnn+F/zA7U5sJ/MODnWgoIGviLqzly2o3
         IccUsYTT7Jf0u5LsoSlm/gL/LX6zgMD4ZaN+YW1wFLq2m05UwrWCJzpqLywP8+51ieoH
         sKuHC73BiU+9GzZGD39y1cCmxIcBxlpJp8DDpp/Ot5lDGHGnzgSAjZ3FZ+lVIvrPfgVh
         +inTzZggE/DtWmkS5J0mez4GQC1kWVsqpppwu3kztgArWRkh6bZDmwz151sAHiI1dFGZ
         RyjjvDKG2iJIlf2V7z+ITXU8Yeaf8BtfbjsAEOC5zQbQSCqSoKviRefuWBB3VYIeaTpv
         UP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961105; x=1791565905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=ogcLkHUza405ypriemXi2sPD/GEARh2+KMIfm+ZNp2VE6ghywWpG1fgLxnx47jcj0K
         O2dDkEI7K9wVirLLhi1Wd1vhCDzSXmb6h9uLPuNQG/dF1LNA2AYwsSgJ96ucW1JCLO6g
         HGAsPBXXDbnIFIdDcpWGzqWWOJKfBOav/csJLq6ipEbpfD9z+6x2CLZDhlOG+sqVRVgw
         DNRmAtGGJV+P0qhoD3uQOvAXigoElScSVweFKolfVvnWSxmORt2A7DsfL6vkGp7pWxUF
         XMo2BuwE663XvHdFAyRFwAppAmemUC3VDg9HWMUhMSvs3NPgmGDAFgrGUAgBt4bePWbN
         pX/A==
X-Forwarded-Encrypted: i=1; AKwUvBzFdiTfq6CeOmHNKKV6OAQw/yASvzWia4JE8EU2P/mQN+YR0H83Ok12L9WLrwXWxFpM93Kk8McXiHxsPKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/xZuzB6/HPLRuvbHzh+FGQ7fWt33OW4XcxGu7pvjSXJQLcanN
	NeZ1C0t9N8LhreFLCzgbpy4f6W1QwD7YIaIP5n5NfG8phGmEcJao+RqF
X-Gm-Gg: AYBFou0AnFkXLU53awqF8hNZ/LFDU+73aPCErc0fQcvnugecz9FK7sVuxTSetvg9W2u
	QX7Z3/dFUTz5x4UZZyyMRZr8WYwDwzC1Pzd9JCPcD2agunJaJZAP1ev/d+muyNKn6kmGLp6BlDD
	sb6WuIVijorUnaV5SvwDmsgdFbvUvCBkdyVsQ+aLqTeVfLc2rietzkkQxIyi8R0VU85m7qr8sHg
	tFEC4JOa9kZvPyFrVXy8Kfc677BvmZahqGwKfiDI0rJCfRe0prRmN6qFy7y2187truNm0BcjXL4
	J517xSuaZnqFCCqZthgpBB7I9jnAcOyTVQ09UE2Dfy0BONZjucqxd/uJZhSGaEWLQihWzNMAX+K
	ASFwYVlajTYV7vy+vFOvM+FrBD86v4FKUgvWHlc0yNK5Wvcf1N5J8Y3VTmIb832PdHhkm0BHG2+
	8HVjlXJZuZhydXiSmtfvXJC6z+QLRi97kvtPXn/U50kOdRfqr3IxcymnTOwPrdJuqM3XLrO/MlR
	9cSos2ZL9MMHyZb3o2wyE/BaJnR
X-Received: by 2002:a17:90b:3d84:b0:3a6:c7e8:1e3f with SMTP id 98e67ed59e1d1-3a6ce34d7edmr3083622a91.3.1790961104965;
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 14/15] hazptrtorture: add 128- and 256-CPU configs
Date: Sat,  3 Oct 2026 01:08:46 +0800
Message-ID: <20261002170847.3653663-15-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPU128 and CPU256 configs for hazptr-stack torture testing.

These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 1826be30c066..90ef09b0e654 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -4,3 +4,5 @@ READERS0
 READERS4
 SLOWPATH
 LOCKDEP
+CPU128
+CPU256
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

