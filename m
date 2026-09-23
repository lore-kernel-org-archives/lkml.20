Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F06D44065C;
	Wed, 23 Sep 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150102; cv=none; b=PKPfEzFLGDNAM0HbdnejsZxvJz0lkWLFO25vpKMVv+uG9NCN0ux45JXiIDQIptD9LW3dRVu48PeHiM5IsK/FbSihVvrSFJItbq4vsh/WcXkvTiVPLT8uKox9Qi8fshkERKg+I19F/vB9Avp92LCgvucyjPYJ4SklhQdKLLrMRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150102; c=relaxed/simple;
	bh=fvHEWAOJ6P6y1UwNvR4hFOljugics7J4N6Pa9ApYUqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhihjWVjZfuTgA8BiHHWHmknABamEXkweAEJ7yycDSszxMqxqCcfdXlN/Z0xyHiPK2zaHuaIadHmpZrXhfoMF3xiV0aHc5RoK53i6mgy8sSezAvG6fu7jGmnZHZy72nB33zcjq5yHzNJ1H1ctQt3hXftPHxM3FjEAPv6LWArcjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FlWudLa1; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FlWudLa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lL
	LbAuDItUeFsJys/FN0v0NLFXWsZuQWvsi2qnq5reg=; b=FlWudLa185yd7OdHLo
	xIajnae3r5ckXHaMHbk1C/3VFv+Qdq5gAe+hmTnzyrsLutMuDvVLE7Jy2YeP/sOA
	X92IWoOYLPGyRp2Ag72Q7ODCwc6+XbVmQTSdVDGD6AjSx9sZrGysl041zb61r9mz
	270xgIF06Cg0qjKach78zV9PU=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD333xqhbNq90JFAQ--.55464S3;
	Wed, 23 Sep 2026 15:53:16 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v3 2/2] docs: kernel-parameters: fix a truncated sentence for preempt=lazy
Date: Wed, 23 Sep 2026 15:53:04 +0800
Message-ID: <20260923075304.584348-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923075304.584348-1-quchaosheng000406@163.com>
References: <20260923075304.584348-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD333xqhbNq90JFAQ--.55464S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry3KrWxtF4DuF43WF1kAFb_yoW8GF45pw
	s5XryxK3srJwn8Cw18Xrn7Xryfuas3ua1rKFykK3WrXan8KF1qv34ftr45GF1DurWxua1U
	ZFsYvF48uw1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pNhF2NUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4wwEeWqzhWwEAQAA3n

The preempt=lazy paragraph trails off: "One preemption is when the task
returns to user space." reads as if a preemption and a preemption point
were the same thing, and the sentence does not say what it is describing.

Say which point it means.

Assisted-by: LLM
Reported-by: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
Changes in v3:
- No change to the diff. The Reviewed-by is for this patch as posted in v2.
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..83261eb6b26b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5453,8 +5453,8 @@ Kernel parameters
 			lazy - Scheduler controlled. Similar to full but instead
 			       of preempting the task immediately, the task gets
 			       one HZ tick time to yield itself before the
-			       preemption will be forced. One preemption is when the
-			       task returns to user space.
+			       preemption will be forced. One such preemption
+			       point is when the task returns to user space.
 
 	print-fatal-signals=
 			[KNL] debug: print fatal signals
-- 
2.43.0

