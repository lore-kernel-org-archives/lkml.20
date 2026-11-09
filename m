Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242213;
	b=x9svG81hvjssNtv0UJkJ4MjmzzgOI2hs2pnL3+7darCHbsZbeG2R7mu1h+G2UZhfWgb/
	 Avmv9wBNRdZLqceDza/zhajF+PIDTbyF5rhCiU2LJ2sKhM26iEILHsvrA1vj084rtAunm
	 zhCdAV7DsAU7h9fM1l6i4mY0u1EzlrHIM0S/dn/2A5t3Z0RI4G1lO9/I4uvitFQQ9lQhR
	 emNJsXJglJybyje2CUd23hh052zZlsE5cglMdmI7mgTSZwLzobHLluXJXyOZ1Hnkt9//b
	 5nIPdJOU/Y7rLIgn2KKNsj1FVc7schOC55mIm2Kvc00b/vBH3rarxV43z4dGLIWJO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y66CCqvB5g3qvi4M73+bXbiz/isEgzbHoHJvrAP9QsA=;
	b=fzdf+T3UENAluUCCNBAfv3gES4BUNrf9vCbxLrXrYYOjyw7A6zEnYl82XZUFl5xN1NTS
	 kiJAgYC7Jf95I84JOtQqo3b7RpRFqmoUq/ZS3axLg98SizFeP2toEocEYaVdu3XVK9spG
	 Ox8nIkGqiI1+R5hrUjb+/cq2T0cciCB/15WMgsM2KR6OOv8n2Wk0r8+Jm3rM+GzxX1BXF
	 xOspBG6ln0f4QOdvfZCR89v6zVBq/lgf4Nr/04jM15k9ATdEKIzEdXlZFI+omSXU0JJAA
	 d1RC5DNBVZBrnsAvunLnf9uei/ye34Q71tzITrW+eZ0xseEEsmXohlbM5Y/fNUFaTsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEK460oy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A688E606EEBD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A688E606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEK460oy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7535985e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242211; x=1794847011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y66CCqvB5g3qvi4M73+bXbiz/isEgzbHoHJvrAP9QsA=;
        b=wEK460oyk5c/dCIonaDnWJVNXVDWPuPFmPt+5HCrz88sjJsIw0xBH9F3sSbftuow4d
         RoAJVt0qPS5PG5nuzcC+l1045LT9s2/K5q8vLjFcL6aMLoRxm9Wpn7haAKXyxewmN28B
         vRD3njt3DtwqRdcj32u+rBylQNWIHpJRaF7/sXbDkwkOoTSnL2acux/t6wvflR7G1tpk
         tXS4SgMVtnJTL5E5Nfc2OlvvxxRxxqQVA53tuRHEgfHAomSjW/l/O2alReKAlfh8fBMH
         Cue1thjp740s8UcVh7V6KA4SPX3gwPKHQD0U4PZpgiGdb80d/wuuc40dZI9DubsKCdbr
         uUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242211; x=1794847011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y66CCqvB5g3qvi4M73+bXbiz/isEgzbHoHJvrAP9QsA=;
        b=vQ6QM5Ul76cigvLRe3IqisH2JoOQOVA+u4BjFo/TMmW93rPBEE7sis72fw0CergVIf
         5pwom/8ivTRcg1d8DkieAJPS1lXaS1pBsCjURey93A263GvH9P61n1Saq6+AscXbJoah
         tm3YawpXrJGFRixM3TwDCmQIjDQAv3Gc5jyQHmv67kqDa/pqqPVED3zV9HwLz6EswPfX
         2Ri0gn+Gx/4UMpDrGaLO8MI/cOjrLCztYNt9PCb/YwxnzXsOmbdKJOZAyWdKdp7TYgp1
         ZPlJHWyllsz/jLlqfwn9RMXqBxDxHQWtDZ6W+oigEQJevWrBAJ4ZLDTw1PuNpZFL3Rp1
         arRg==
X-Forwarded-Encrypted: i=1; AL+hErHHOV+Vta2w6n4UCkBfjT3IFVll47lSapi+CwaNdARbl0OHhh70jt72QtPKewM4VTsIkgEEvP1AlwdxMNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D3gfiYHAuB0HLPM9jZRLF3wHAFPmZEhgezj8GNWep4JIp/o+U
	kb09MjN1tJpt0NBahiodVxXjoqpHTI5BjYqCLn1pBBO9IW/dl+kSe1uv
X-Gm-Gg: AYBFou2tU6/vZpeNkMgsSLQffl2rx/07Tc/y6TBXiRXDro0H8cZQiWUDiNO5EewfmjW
	RvgHLoXDZlplNajQ+lLDwVzJjH63Ym0XG+xOo6N8lehPrdQL51ZUiryFyTPblbQTCz0E6Kq2C7C
	gU70B5WLqVL6fjV5y3p4M9z17BGGixtZNaRRlaN7FZPUCdhZ8Nu6chJ9ROQfTlQKahuvXSxok4w
	SEK9t96FwSg430PRIO9ZVbFylT7A4hDwJTnr2kwR+A+R63E9RYGh6CXSm+T1yAFV/tOzw4Pr49K
	kDKxMCCH+ku4qrqFX1a/hT72714EohM8DAh23elMK3pPMuPanGr+NgilpUp7CNRat22nXPSpzgB
	8N7QI379qEyISICUdrWfp6fRO7SGtnldxbebe7Pn55x7v+MBv3bVQx7V+PoC6XsGlWDZMRphrNf
	7qIotYmYUNOjNOX1s/KuYu25FPnb+2dfxBP/eer54w61Ma4+vBrFd66WVUSgbd2xgy0tAJC0u4u
	QxOn+pxjxYaRasiynHBFIctr0ojsn/C5j4WQdzkiUvBgaDqe5Rj8FRCRg8nComL9b0Bxo6ufrwC
	/+d6Pfm4rOajN6JgZ11JqPzlUw==
X-Received: by 2002:a05:600c:6089:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4b963c81459mr76059785e9.27.1794242211238;
        Mon, 09 Nov 2026 08:36:51 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:50 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 17/29] sched/rt: Update task's RT runqueue when switching scheduling class
Date: Mon,  9 Nov 2026 17:36:03 +0100
Message-ID: <20261109163616.195264-18-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/rt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index cf756639d9e8..b16cc77d7015 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1926,6 +1926,27 @@ void __init init_sched_rt_class(void)
 	}
 }

+#ifdef CONFIG_RT_GROUP_SCHED
+static void switching_to_rt(struct rq *rq, struct task_struct *p)
+{
+	struct task_group *tg = p->sched_task_group;
+	int cpu = rq->cpu;
+
+	if (!rt_group_sched_enabled())
+		return;
+
+	if (tg == &root_task_group) {
+		p->rt.rt_rq = root_task_group.rt_rq[cpu];
+		return;
+	}
+
+	guard(raw_spinlock_irqsave)(dl_bw_lock_of_tg(tg));
+	p->rt.rt_rq = dl_bandwidth_read(tg)->active_context->rt_rq[cpu];
+}
+#else
+static void switching_to_rt(struct rq *rq, struct task_struct *p) {}
+#endif
+
 /*
  * When switching a task to RT, we may overload the runqueue
  * with RT tasks. In this case we try to push them off to
@@ -2127,6 +2148,7 @@ DEFINE_SCHED_CLASS(rt) = {

 	.get_rr_interval	= get_rr_interval_rt,

+	.switching_to		= switching_to_rt,
 	.switched_to		= switched_to_rt,
 	.prio_changed		= prio_changed_rt,

--
2.56.0

