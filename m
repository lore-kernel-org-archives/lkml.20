Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832470;
	b=VmkcxZsy9VeX2bO3d6EnUgLOUMWa52S+wOqcKdwOrjkIIjzOZoDXTcuKFCFSOMAVnALu
	 LCo+NAHKDDVFPALfFWbKmp4bDL57KgBTloBesiSDXT8X2INWlac/NgZ1hu/qSc24Uaqvw
	 sBjMAa8JR08s3qEkBAXgkwTwppMtvHler/uKLM0HAeHl5ZNhqqqZAR65uv9JF5TZQb6WA
	 h38djTA7fsBJlJB+H4M5NQQOgDZkE0M7q+PWocH08jM3opnk/v6xAqkh4PAo2FrJxwR+U
	 8H81fafoDxLdNKV9HxDwABzyy33YcBtoRI46OOLKM2BGd86GCrAVInqq5nFQBfp+faQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lpFaIBWmfmlMxFrZCO2klHkfCv0BTOen1Lt5ra/b8a4=;
	b=tSRTQaj6GZvQi45SIJssBOZuk5SBriVXziq9j4ls22vCTwu+1YMPNPdr6sMiSVFl8Gff
	 c8ddweb4sNivOU+ZWX0pYYxOsnsR/Sn3nQ2s9+hqvT6bbtqYJA0BaUCWWnl2QG0m6AIl3
	 YJzysSXeE9SvcDFvh3xYjBuEV9BEyFLUJ3BqN0m4zPnReAwmfnvn02gnlbiCWuiHVaYDl
	 FY+wUgzLd9jq1aVc6V6H1ap9SPCyxUozTlVq/ZoBKISUYf62ILfkL3Y1wh3jNfG6DFzmx
	 qaVkNOWkiMEQrAF+kqb7QSpuD8eGtxcl6GrueVThvf/Fujl2Dkf9gW6HxoYu2FyFdnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EihWGpxs;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4045D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EihWGpxs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c505186727fso77837466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832468; x=1795437268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpFaIBWmfmlMxFrZCO2klHkfCv0BTOen1Lt5ra/b8a4=;
        b=EihWGpxsBxK53ZUJS4h2DaFYymtbGue06AA4i8MyxHLS7+PXphaoGC6RR/pNAhrMFd
         V894PTFwXq1fZ4BNSAP9o3SxVhM+91PbsUsbaE6D0fl/GPHJRbAa8mVNVrPmbL2XC/PG
         8qQLf8inzFeGL0fy5NYioSliToJoBnm43NkULs+AS6nw8mXMwPcAqeVhJm//d3JRfJ70
         x1u51oPufRbWbb/2VRcjRwlIrlUbTm8fOeh5ci+U48czV1oyBb0XUMOrCBUr7d0pNx+J
         0LgLxyYwtxwAZG+zRbh3wjym9OYbjlBW8p6V+NBdjATW4Wtf80SlKzuq+xkoCNQ9jXr3
         kGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832468; x=1795437268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpFaIBWmfmlMxFrZCO2klHkfCv0BTOen1Lt5ra/b8a4=;
        b=WVXBqASpOgkT6Huc5m4We9oF8XhFNjHWjFNJJvMj2ynDHRNyYDrCZst/TE09xT4s3H
         LN62ofeszOXnXuaGn1elrETKnS1/D+G2/aVJunm4mq3KmKl0BEaSuDhkWBMiY+z1X9fn
         D9RbeVOz72Q3dTEL/DefkR5yhh5/ZNANa5SzBo2BRZb1T2pG+vUUFiF8hC+SN11gSXxN
         rFVuqlIlaMvhHfvya+cPCzDrDqUf8S+PetfZSL8LZwv8wVXDBHHjecMuMF7swSm/eojI
         HaibFBHG/q6SZLp9+d/RLr6dP5h3Y/ingeSTWUiOy3cAZ4dJaTZTefDMLLuC8Wu4pJSX
         2RLA==
X-Forwarded-Encrypted: i=1; AL+hErHJLcvI6qSSSYpx0BCakaVjCeQkKWLmiKU2gTcyl+UEVoxRi1/4QUlRuTEwhE9JrIj9EAcdPNqH2skNhlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gsAQFCbttix8nxo8pc+hIn+hFtmgQL4MP8PWXo34pT6+aV4ov
	u5QVCglYE5ZFAv647vMhTZ3DSs7fti1ePD2ZxAxs3t7VwFfYSJiH68u0
X-Gm-Gg: AYBFou3POwdkKQ6aiINJaL4y5gsKDWyC3Xwb01+zBjKxNfZ5m2tvUTD2/mlMgsrlnnX
	eHaDI/XkQUCSd8XHh4HnvURhxdXmFCN/obzpshxIYS1xvCrZZPcEfthhZKyPJYkNQE+Kxh5KXDr
	bViDoxoDsjvJDvOFgWxRq36wHXnN88oJJWUC8EEiOvi5xBXaHrr+qaxKzKh0JGBqtxBz+Zan1Zh
	ns/7IEEWaZBUKAF9CpvBuUwFipTp0n4O0KJu4FyEmyz6neQtM4r8CXaBeDyisDwOtrM2vRhlACN
	uQQ64fK0aoCJQCCApy0XMwcA3j6ds2EL70ZiER+IPoFHrNtXassE2ruiksvrz6PI4pAtvxcfRt+
	/XgKTVy6xMbuxMomtpl0jnnu6kxo+5AhXjz7cSlvd8NTKuVyVJ2Xj3O0p4JDB5koXWg6DowvBgQ
	SBmXNPRAoHt94zQWSgaushfZ9gXZl9I5UY4zhlohagfE7ytqJjumLx2/fmn0bA5+7rKAlkA7mqu
	OMcqCusoFu6cUYt3m2i8J60UHVJW9HIJPDYCTN0gx9lUApsqU0x7CM3f0/0eFu7NKyIBRtUYrRE
	GVilJmqbFCpVo6++nEIp/iUQg0NvIz7krt/f+MAp3Oh2
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c50963967fcmr853137766b.29.1794832468302;
        Mon, 16 Nov 2026 04:34:28 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:1c3:e2b2:8068:e97d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24608sm410200566b.30.2026.11.16.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:34:27 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] sched/psi: Check triggers before updating averages on read
Date: Mon, 16 Nov 2026 14:34:24 +0200
Message-ID: <20261116123423.743790-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

psi_show() can advance the averaging totals and deadline before
psi_avgs_work() checks PSI_AVGS triggers. When a pressure-file read
runs in this interval, the worker can miss a completed threshold
breach, leaving an unprivileged monitor without a POLLPRI event.

Check averaging triggers before updating the averages in psi_show(),
matching the ordering used by psi_avgs_work().

Fixes: d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s period")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/sched/psi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c5381423334..351d50cc0663 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1261,8 +1261,10 @@ int psi_show(struct seq_file *m, struct psi_group *group, enum psi_res res)
 	mutex_lock(&group->avgs_lock);
 	now = sched_clock();
 	collect_percpu_times(group, PSI_AVGS, NULL);
-	if (now >= group->avg_next_update)
+	if (now >= group->avg_next_update) {
+		update_triggers(group, now, PSI_AVGS);
 		group->avg_next_update = update_averages(group, now);
+	}
 	mutex_unlock(&group->avgs_lock);
 
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

