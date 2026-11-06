Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978427;
	b=QlUiFGhOYmcAydpr4BBFgnXOVet1devbsIxA3pYGuA0x/cNu6tAuhRpFy8JrLmL3fkP8
	 UHE/O/hI1fUekTk0X71ENHbRmaFbgGTOXLwyfHqhWvHy0hPzBIVYX01+XVcNmJPBf3Qlm
	 KKPQ994AYs4NfP0t26Ww3P/RdNtwMkOdEAYmrd8QPUYbk+J7zvFUqYzZfgQlRXIzxt9Sy
	 +5aFCDhJT+ywrAlXsIteTMsJZ/2YX3Z6a9bFsGBIn+0A5sXXs8AIPD/aBDEqvuui76l2c
	 qcrYmJCu6eMSVen2sCvFBXPvIRXuJPDGLHv7almX+t0dUK1cgLsCwckwruPE0LaGbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fjXC0m7vB3Xiy5SvbhOFI4wpy3VxvAkCMaqlqhn8FJg=;
	b=nnfT01uLGYsnjPSPVdGDKVzgGaHRZhoJKzeLle9MnhrUGYeGHOETqajj/L3QwJBFft4F
	 je155rBe0A/ATXDrVDUyveeRXPb9jyj0RQjQjW3B7Q0AqUQwQrRG8+9AHpD/91m0qU3w3
	 C746obPfkgma9ncSUdMIbJa5+zakOR7zqoG/od/NcJGU9+mNbkLSIloXP5OtUtXsCZ1aF
	 S+nK+rlnfflxK/EMIVD1MKeVyOU8s/JpuvmCc2WQco2Gj2Z/ZQ1zdQJgAPWDk7SqlKWFu
	 +Q78otKBqFH5DMN+Q71f54VCDGrhuVDPobAOTVYWOHnb/bU+L1ebqqZ6HhMWj8CGgcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VQ9mT3Z4;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE160A2601
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BE160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VQ9mT3Z4
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so8757855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978425; x=1794583225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjXC0m7vB3Xiy5SvbhOFI4wpy3VxvAkCMaqlqhn8FJg=;
        b=VQ9mT3Z40Y/6uILB8CrK66n8XzgP67TgOVMzoUK3dk9L6kIb8vRs/1sWkaVM8smMDO
         kDdV99OSlvAMI0Sm6ARwKgqRoJZ8c4IoKFQVrVhY2EpOoWDogMRlIkQCCEfT1xgS1gel
         xVG5JMWtSCyuI9AaWiQzBqxhbYauF11tpTzNzsKqci+dOZmO11unBZEnR/XAGjnCB87f
         e0NRwXaLfjeI4NecAh5ZaNoM3x6TSA8DxlHIClxIJ+HvgoeiV0M1bPqEKvxSr8mK7zJA
         PBLnFYxeOqD+hGBCHmfc4Clttp89ikntRaMt7E9zxIpTO75QFUI8ZE68xa+MxIdza9xX
         k89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978425; x=1794583225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjXC0m7vB3Xiy5SvbhOFI4wpy3VxvAkCMaqlqhn8FJg=;
        b=wi+bUfNPf5L/VdSH7npuY0QMeYOJdaQ+YikU7R8Sy6eXKraogkwu93SiIPY+IhIjP8
         QHUOMKfAzSJhfKgFBI2DvzMibyVgNUYZ5XKWMPQoQ7ClReWYqtOukQaeGN6Uw/ZIHBin
         QuugLh/QQXulECawZa/MpuWoFp/3LnOIMZrLf5ak1G9/6L+r8xHMp8doJORmYil/rVq7
         DzkzcpJMbZvazPQ++kxUNPRrUdgd/rwy8ArtUQwF1mYI07ey+4gqaM3Rd3v34nMY+qzd
         wyuWrO/iyyUlXVvuUdPk8BoYexHFRsGLzxxVNA6j2illQJlCtU2jPhzBM49qCk24wT0h
         OX6g==
X-Forwarded-Encrypted: i=1; AL+hErHnOUAt0zcBm/skbsJCgE0bBjrVzE8eQGoP3RdT7P9oUDrFWPSTAmdMLaWM5YDfkjj7kO+RtTl7QzUqlFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OzfAwY+nA5b+r95FnaDzC1gF1JhW2aE3CpgpTmY8+YLyqryLx
	tde0wWOlo/3obOEJC/4OM7OcuRw/OcwBpykarxBUJ8UENNu49+0jq2mfD9gY/UC1Ag0=
X-Gm-Gg: AYBFou3PZdAGSRvJdRR6C8U+qmSbPR8vMzHMuVU7gotSPfXzutWim4zOyQq6HJ8BwDU
	pDo2kdiY5QjiOknCRD3ETq4lLFpE7eMrGj7WwMlwx/1KAKVwPBhkPwfoogsgAbBZav3PVHJhViw
	yr+IHhGlfT2HYTXyEVrIO73iqhCMR/SZqq1Yjb1qEdeOp+8n2435Tt2IRHKk15yI4Ft2vcIMqjW
	6lyvU3/jBQqwszFp2+KehhgqUNjKsgEpzcgDECZcnv6SxTT5uobMBoOHrP4Jp+19XdhbM/vCbmn
	d3an9r/aGh1WkFOuTt9dR96tLC4cxDUZhob9BaOb+yYnN7u9bG7bXgGPI9PlFyxMd7aMn6Gn0Jy
	8sCeOpVwFXPuQAyj/AslehJde/lYPgUnP23af0bcOazWGeCbuf6/rKjRUggzU2PgOpoLpoFnNZ4
	qRlfF+WNCv9GadJz7K/Yf6kHkE5hCRTyvVqeXKBIGPXWPPnRpN0TXHGgvLpTr+TuY1XUXxsgePS
	cstdi8RY1FplqQ2mbS9qqu/Ew2r2OUd9D1aFa7HcshYwosz3PXfrYTi27uq1I+XKV4lZ/TWkGEP
	Bhd1Vqm4A2lvG4fYwdS5O7m4C7tJ65uWU6c+DTVzNX0rTLA=
X-Received: by 2002:a05:6000:22c1:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-492765a4011mr6585904f8f.21.1793978424778;
        Fri, 06 Nov 2026 07:20:24 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:24 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	kayracizmeci@gmail.com,
	tim.c.chen@linux.intel.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 19/20 v3] sched/fair: Take into account slice in EAS
Date: Fri,  6 Nov 2026 16:19:46 +0100
Message-ID: <20261106151947.3991524-20-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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

When the cost is the same, take into account the slice of a task to try to
select a CPU where is will run first.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ea117c3d0dd7..da9c4416f1b5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9885,13 +9885,22 @@ static bool update_best_cpu(struct energy_cpu_stat *target,
 			    int prev, struct sched_domain *sd,
 			    struct task_struct *p)
 {
+	unsigned long task_slice = p->se.slice;
 	bool target_idle = choose_idle_cpu(target->cpu, p);
 	bool min_idle = choose_idle_cpu(min->cpu, p);
+	bool target_first, min_first;
 
 	/*  Select the one which is idle */
 	if (target_idle != min_idle)
 		return target_idle;
 
+	target_first = task_slice < get_rq_min_slice(cpu_rq(target->cpu));
+	min_first = task_slice < get_rq_min_slice(cpu_rq(min->cpu));
+
+	/*  Select the one where you can run first */
+	if (target_first != min_first)
+		return target_first;
+
 	/* Favor previous CPU */
 	if (target->cpu == prev)
 		return true;
@@ -10055,7 +10064,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 			 */
 			if (target_perf < min_stat.min_perf)
 				find_pd_cost(pd->em_pd, target_perf, &target_stat);
-			else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd))
+			else if (!update_best_cpu(&target_stat, &min_stat, prev_cpu, sd, p))
 				continue;
 
 			/* Save the new most efficient CPU of the PD */
-- 
2.53.0

