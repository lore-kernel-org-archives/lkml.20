Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB432E888A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946912; cv=none; b=EreaLKuGZuariHoDD3et1YWkG4OnyHlumQqEfInoHJqPV0O56FBZ8AblMrS/d4q6vA25r8Tyl/UzMqC9moR+0jXU0yCZod4jPwzX3eh3V8bRP1spEQVGTfPCHmbWmV5Zv442iuxFQr2Jxc0seOeoDVokDnu+2EVOvqU7FZ7vMJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946912; c=relaxed/simple;
	bh=5/I17mBtvm5qyo3LKvWLp14P9xgcAc151/QEvDX00/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOkgtDGuze5DVKcxgSP+WaGa2mNu8YktilFWmlSQqNIbO2hf+5CNTyUCoRdTfmk/BqF/NTlEQWLhzOdiJ5K003HeD9B6fC6P3rZGt34bJhuxqEp66ePTo7otgb3CC96amjJTxdWuDmPVcPfJIjWiaNVtTxRdggKLhiM5VEysFTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPzzHyZu; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPzzHyZu"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso2101430eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946908; x=1791551708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVjE1hRdd4E4QxO4Rzcy++6rwJxJskiASO91HFudBoo=;
        b=aPzzHyZulpskMcT70Rdtk43sgcUe9NZc+jk6Of4WHQZf/PiiMLUAF6JPpba+8CktBI
         oGnzBHK9WIwO8oL2+NTzSuFgoC8gutE+8tdIhPgcDr/MZ694t4wTk19I4qEirCwrLRJE
         nmL+ncwwxP22UDb+fwKIcRGQJpe+s14EmKr03k9rFzEVVgBCaxn7ghI7/7tPKk3MG6Aq
         1LqguK3tieoNnarL2REITzEriP4VkqoIDMFXW2WXyXsY43f9Wr4ZF6Z+LESyb4yWBxFR
         PLFXdEP+uoHqv+lOFq/tN1wxIvXuP2doA/CC8kL+MNumOBvrqYsYlrgnJ9ifsIHE+MjP
         glQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946908; x=1791551708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVjE1hRdd4E4QxO4Rzcy++6rwJxJskiASO91HFudBoo=;
        b=I/IKAAeYtcb//LCGIok6DmDLbKUYHxwx/Zxj8zFVKQc8sZmnKZIAefPkyNC8pIRZWw
         BtyJTzfR1qBApk9EQCBxZVK6zaOvbvmjbNCMZ4/4O4TqiGxRqqqGjftj0zPFyhi5m35n
         Wyh40eI3dOlqg7joabpi9MT8s561Fmi2X7j+cpVKXXlO06n8hrMjrjhq864MUTdnuZWY
         4BHgSNiZj+gA3NasgRD5io/8IDixuZw3GIatqPI0WEPfImiKeEyBkea0qblp9Jxk9Knw
         bHVDLNQoNWz8zYzhIPQHz1JgR/Jk02SdepKQuT9PFAs21keA7vi061rSqylJ0DwvO5cw
         jUkA==
X-Forwarded-Encrypted: i=1; AKwUvBxfWMAe/GcOzX+cpaEzRNCaFG+EftzOz5kvSTgF0Cd3yQsifATAGYltu0siy6MqzbwcTiVpZf6F2iap2Rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0aE7fmgbuLcaXKZtXFLwgvV0uKMO43//qKb26dYquGTMmlkmb
	yzNWpF+sMK1OfW4WA9TjQwzW0/gOmgSSiP6p8T7MJA8qRvWlM2O4IyMh
X-Gm-Gg: AYBFou18cFz17VUw9VAE8KsOsCfWktKMflM6JAj1BYkJa7jageV/7UPT3xJWMgzcO19
	xKaJj3cYJD+iQ06aIGU6SzHEOqB2Hy9WivNmxssq02bJQWvez/gsFz7qdgJL8vM5putSOzkVk8Z
	6IgsQJ/pBGijglNeiohSHiY2o3QX7TPgYYkcdmn3Qm+MMP9nTyQphEAzJiZian6OpL1d+yeSPAD
	OwesCRR2aroDYddNS9QSJTKCndPIkvEpi0N9NeUkWsv2HtGqwi5x2GQzHp2yDIzF+x+v36MqIkI
	P0Uiz9pdb4IkUzgT63p0QAS3T+/axVSLhUBFoC/HV11RWK+hP5HKaDWdzf8cd9M2U0eu1C5iTNS
	aDrA8LpTLbGaFUmnvpZr/70/nLtfOR0BAko87Jnp7hio4G3+XwcVAJRhFoFty2NlM7wyx2ftGJd
	UIN+FJCnjY+dRoIdAgqfCMPOkq+oa+sn/uAswlyxGj0dD8pYl+bJwnq9fg4i6ysyUxhTQrXUxxB
	ScTb8dFG8orGKJCdPzEuo14z9S+YvAnc1/2NBS4fSbp5K4LIkjm/fzww5Wen7bZwFRkN4ELww==
X-Received: by 2002:a05:7301:a2b:b0:346:d790:9e10 with SMTP id 5a478bee46e88-34f219895b9mr2675271eec.39.1790946907796;
        Fri, 02 Oct 2026 06:15:07 -0700 (PDT)
Received: from arch.srmap.univ ([103.217.237.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34ef98d925csm7162965eec.0.2026.10.02.06.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:15:07 -0700 (PDT)
From: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
Subject: [PATCH] sched/core: fix indentation in call_trace_sched_update_nr_running()
Date: Fri,  2 Oct 2026 18:42:56 +0530
Message-ID: <20261002131256.9556-1-jahanzaibashraf1318@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function body uses spaces instead of tabs, violating the kernel
coding style. Fix to use a tab for indentation.

Signed-off-by: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..e8c46f849f6e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10701,7 +10701,7 @@ const u32 sched_prio_to_wmult[40] = {
 
 void call_trace_sched_update_nr_running(struct rq *rq, int count)
 {
-        trace_sched_update_nr_running_tp(rq, count);
+	trace_sched_update_nr_running_tp(rq, count);
 }
 
 #ifdef CONFIG_SCHED_MM_CID
-- 
2.56.0

