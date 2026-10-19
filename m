Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1E4854F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392156; cv=none; b=ZfyvoIA0/AI/F4QUiArwTjo48G4/aOSV8ma8HYkozreJ59MqkSvijIw1/yB9hZ2vHuyFIa7gyMeBtuooas5cshZMK2QibN1cIo5QMkYBFrkDgENe5whyFWzUxWEtZ6chiemTqn598yiN0nJdASc2Ig0PSRPc0+wE+X4i9+gPKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392156; c=relaxed/simple;
	bh=sI0uRdJyIwS/576GKroHmj+P9dYFOWObm8nsBCmV8W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ts5pSb0HldlgviQNTyIy9uKSg8B6XZAcm9O/r9P6Jp725foX5ZWitOt8K9KTE82IYCNhtha8GUvgcu7hoi5CaiGu4TtUlRscbPiuZ7hUg6RWCXBmayFuoGHpewuu7GCuB0lNrHDw+QFI1fMGE0DtciDIHfc2xJ0H4V+0yTyrYi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mym2WOqc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mym2WOqc"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so807713a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392155; x=1792996955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fCpTvdWPIdjGXF0xCoYGynFxh0LgUrYpyRnN0Oo9VE=;
        b=Mym2WOqc9oVz5JdiDodpZbxyQrCS1b415cTpdTpqMAy/wGVn5Yt+0GCw5lXqdrKEPK
         3tkazyRF19Y+4sfvHKglEGcGGmAqHg38t9SiVo95NQTVaT/Z9ddMOlamcRVZB7Ep13X3
         S46CdaSerNZnpWJtI8jO2FMS1VpCM/ZMs+siWYFKBIAq8/rICFwFpEZ2fWlJKwYJ8VHv
         jv9KcDyQ67m3EJ1MbNCw0EOHxXJmT+0VarTbaGWo0Dwg3FMJ17o7PqRChM/T1LCY7DM0
         6bfJ4x2KD4kSBfDiBsrvLXDzfYLzMXKiSF/AuD7udoRD2OuY/D/e6lZeivcFJsGrUThK
         b3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392155; x=1792996955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fCpTvdWPIdjGXF0xCoYGynFxh0LgUrYpyRnN0Oo9VE=;
        b=IYc13g3AsVSoF6u80xtk9TD8A95pWcXMx+n/8L7DHiOBNmlCVFBRm9SuPyK3F685zn
         QP+t2jGYHSq5DmVZ0ssmnIOhdmpVp+TG2Z0UtsJHupyI6MZa9VAMShqjRGCIjkd3Zp4D
         GcIFap2RgHMtKyxeU48n83UkCP+POloABMvJA1kOL3iTxcGZfaJuPnRHTTeQIA7Rsgwp
         loVB7O8np/9zxILo+emjtTyf8Tu25pcYcX5/RmKsKpkmOFEakb53zu0LlFoPjKDrYbYv
         PcSdHmf070O7zZqeMJwcN/RY3SFI4X1SifArInG3c6xh9/cT1jBbfELp79d7e1kuqrvO
         /Q9w==
X-Forwarded-Encrypted: i=1; AKwUvByTM9+YGJAP2YvdFaPALFw38br3DAYNhMpipUuFW7G1R4ljWK0IsotLaiBXsx8OcR6tQ9YdCFq66NxVMzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWJIKu9//rWdGHQC4GAywwOU1sr1S333aOJxRZ/zD+495zIYsa
	/Lz08pPQvYweOIa3GEucsRl7XCVHqCBhNfCdPpn1jYPg6/oqxI20SH9N
X-Gm-Gg: AYBFou2fegI2TJQleNjtQPCwpKb8MV8w9ob+7Mm+ZgrM+u/tF49Q+Tzvzr0QJyQU4ae
	92tHaFzOvdZ4rL9qY0lf0k14jbE0KkU4WqykqleZonmcdqjxvyY0N+w3pw04dLKH/NvNK7LF4gW
	3ULdjTlVaB6pV/do8XGS+G5d1B6xoVE3le+Z2iyiwnfwPXb6KqBSqtLMhWuRw7RRs5MYBCi16Gs
	fVOI14LXgOzjb1NDg0CW/YP1XmPs8Y0f2DN4/N6cSepnu692JywtNa9JgtxUk8wn4tWIu+ijOlP
	6tqqe3ODia1bFD0IN86zY7T6XITix/FRqItvmCkydEVr/9xljJ5CZ5mJjFyR5nRxTOHJtg6ExtX
	mRhWZUmlTExaOlnH3y9pf13vgbi+SGxSfoP1qaM9m0uB/OGMQTX+TFkHcm4+kyhZANVPajQFXUd
	1idyp8XvOwHqrTylpbJkO2dyEBr4reMTpsWin6ox/lbcBUq8V7QvxjqPCYBxOrF+fXU+PI85D+o
	nXjh3Zqk29BXboIBkj/Ue5+ERJgo7V+1dGgr52ESXeLDRWqu82D+LOWpHHiX9b0iSeiXQ==
X-Received: by 2002:a17:90b:4c92:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3acef134becmr6190292a91.12.1792392154938;
        Sun, 18 Oct 2026 23:42:34 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2100:3fed:6938:3f14:63eb:c479])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a3a592sm3688960a12.30.2026.10.18.23.42.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 23:42:34 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shakeel.butt@linux.dev,
	roman.gushchin@linux.dev,
	yu.c.chen@intel.com,
	zhao1.liu@intel.com,
	tim.c.chen@linux.intel.com,
	lizhe.67@bytedance.com
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [RFC PATCH v3 bpf-next 1/5] sched: fix stale get_pref_llc() stub for !CONFIG_SCHED_CACHE
Date: Mon, 19 Oct 2026 14:41:53 +0800
Message-ID: <20261019064157.29885-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261019064157.29885-1-laoar.shao@gmail.com>
References: <20261019064157.29885-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp
to fix UAF") switched get_pref_llc() from taking a struct mm_struct * to
taking the task's struct sched_cache_group *, but only updated the
CONFIG_SCHED_CACHE definition and its caller: the stub in the
!CONFIG_SCHED_CACHE branch kept the old mm_struct parameter.

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..973647ad6c2d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2194,7 +2194,7 @@ void init_sched_mm(struct task_struct *p) { }
 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
 
 static inline int get_pref_llc(struct task_struct *p,
-			       struct mm_struct *mm)
+			       struct sched_cache_group *grp)
 {
 	return -1;
 }
-- 
2.52.0

