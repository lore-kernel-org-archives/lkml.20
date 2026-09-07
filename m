Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BB403E9D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764253; cv=none; b=bfjd/JgiVhMZqDpyJwMyS417f49ahYEjSTDxjtxlaw/P5rFlOOKDDuk28qeuACoHOsaEiDsQ9FVKfrNb4pEZ9nqgczVY71QHLFCPIFaUDHWCVu71tBI93HJEHzHYGGRV8Yd3uZKVeZyNW8SlqZXl4+Cm40511bKg526vDR4hk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764253; c=relaxed/simple;
	bh=srf++VPcu2qT+9fGZZVhYbv26o1BF4Q6qfp1ZMpyM80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euaalBc2p96lbuOhTFnrq/i97fi4zFgfXpobaJaeW0HlTiXrVygaUpvG0CS7i+6ScJSYpkFXIw4npZSH9q74CV2kxBaAzI1QnZ68MoXM2npSUYHErSMnETSSHVTebOlAGY20dr/q9DzzOZuMpfoOUZCmopL0i77QyYH94nE3KKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfVBXM7A; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfVBXM7A"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84830c774a0so2835678b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764251; x=1789369051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bjGa4x5hBZp9IFVjDEJ+twMTqoDJLCcfUFZGFx87P8=;
        b=GfVBXM7Ahf9tQJJlVLGHOOvkA0i3ZfFqWXUALrIwKWVUnsmse/ytLaZAcCDb+98ljp
         282tWNaxfMMLlKL/jpaETod25IKthSt50asrNDf2sGTK0I3zsfMI6NKe4mqgV4LTCwbx
         5Llfazlk5t0F+uRTJOPaKJ2Q8RfXWYtJqsWE20vyCvKrk942d50e43L2kxVR9AEsoBPI
         nQrrXcqCD4Tjpg0pwsoC0Ez239qsJLK+a0TORrvQOVjY5vi52uGlO61xc7ItQ7HfBDqx
         E/YvTxPyGpqN1uDYIaDbdyOccG02hQGmc8CO/EHCszBEZcasloWPK6Owx6psnbWxgfVa
         J6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764251; x=1789369051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bjGa4x5hBZp9IFVjDEJ+twMTqoDJLCcfUFZGFx87P8=;
        b=GAn6VqcqOG5pWCK+XuicZglGKA/DPB6aH1RsICLoLkA+wGYqiUbtGlvKRHTaC8YRi/
         jUzhO/XKj9CnZ+G6EzzTA+WSpRFAyPqBnGLQoeaDCkqAvpF4ROncm+1/QDieGBGEfZx/
         SzxeFZPo2Lmp6CAFgzIQCqnbyEEAMmt/TLS08G/3pX3wtWlI2WiDNot9syhhgoZouGwK
         6JEAhXNtm31RjP4VUTNyixTQWEFXazLNxE1cEgoHaAVWBD9jTHekOG2UL/ZdDDRrBBv4
         XVs1Tf/GO2/PDyV+TC83q9Zm2a6Bu7fo5BRJUvsZFW/GyoRbdNIZM+8Jb/Pl7h82PPMM
         +lcA==
X-Gm-Message-State: AFuF++nkiMapaOxE86Z5HsrI2MtvI1zqWtsZV2GvcQFWe+theNnx7I7v
	put0a3SGemrYTiP1EoLr7Jhv+5bmNhkrz6F11YplpmfEfMGUYQGCNrlb
X-Gm-Gg: AYBFou3qq6qLIvcO0KYuZkW/35tJJxrU9jcTUQ0rVaLngTLPk4iWlkuND86bfqX+DIx
	4i5No5RihCWVrpYPQ+WkAPuixwe/jcSBvD5JqOHu1vr5LHXxEkJ73HmgvubTAZvsU17ls3tilwN
	TirMZ9pW3t9KVi8QkJW6CbcrA08NVl2U4j7M97RqbQeceMZTAVIK/bduwxb4ATI4veh/58vK4Kf
	PUDmPun33dNhAX9/ZTo4aZYGaFADzxfLmd82kan62187PIFt08HeceQ1TlWUxizmn+/GQKsNl64
	CnM7IXWduttk0KJjb1/k5elleWlhF4r6wTnVEgx1NE0/EP5uWQVVkHcohxyDFt9vItvS9TlfK14
	cwCFSG6RVp2lWnCHnONKmOcIrXorNitXUH/9GQY8FUubMjp+HixdQBt798bBcnhxGd4fawm1UF7
	qx/yEcRQGBnls4BfCvywS2x+6ROiFuTeMJRxEY8v6Qwj4oyzXd58vqd6FHmuXV7sTLPSSXEskSN
	/RQPplTMVgtnQ==
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr27769459637.13.1788764250737;
        Sun, 06 Sep 2026 23:57:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm21479026eec.11.2026.09.06.23.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:57:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] sched: fix repeated word 'into' in comment
Date: Mon,  7 Sep 2026 12:27:25 +0530
Message-ID: <20260907065725.17876-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'into', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/sched/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index ebaf892a16b6..937d02732ba3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3251,7 +3251,7 @@ static inline bool rq_order_less(struct rq *rq1, struct rq *rq2)
 {
 #ifdef CONFIG_SCHED_CORE
 	/*
-	 * In order to not have {0,2},{1,3} turn into into an AB-BA,
+	 * In order to not have {0,2},{1,3} turn into an AB-BA,
 	 * order by core-id first and cpu-id second.
 	 *
 	 * Notably:
