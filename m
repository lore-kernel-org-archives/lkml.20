Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722693;
	b=T0vUJMBzbzCpe0KAYlEje7c58774/Z1YR/XQNaQVR+Kw14pizSNZj33z9SS60nj9kgg4
	 JuYa3wDrdJqdjLNdNkgEAgFNsV26IZtugmJtiCsV2QnlzCbC6AG9seUT4vKF90KIIxLB6
	 xfMoScxHgDCMrr7HfQqzxpNjmRhA6BXXul/6enh0fw7P7va01fh9qcGp5KtwT15xpc0v+
	 Nu0L2528bbhZU73qBvQ2RSHv/M6ay99IQG/nvBHYKW6T8imOS+I2CtDdfRQuoAxktZ4N/
	 0N9FUH4dFZM3BwBbWzpHKlicbd6ameX8GRPtbzaEvNwiy2l/g0Y1gYAQLPY5igozMlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vFsDRt0lNhWFHZQTXpeKzbrFyQk7dRmTZwu6sQNhBXU=;
	b=FckmaeqDVLrwAvP7/iyAzEhgXXWQMXn4Wap53jaazhU7mzCXO2xhP5AEd4o5K3UlcGyV
	 In87V1bTCJ6phULfgp9rbGl3Ll9Sjl3vnD8rzy99APyzRafjpFKihvwizXQDXlLmfh9oR
	 8awtfD/NDC9rpOGy41kZxQl+lkii8hk64XOu7bRvZw5WPzzPv1Drh/1dC/BGhgAOMMrAJ
	 IT/9y09yqjbR1O8zrtnDBU724XqmftKOfJyyyNT6/E7I6v87Rvln6mlsQ611A3KbzFftm
	 yk8jS102J3e81yj8vBQn2/pYyzEwEjT8sK91b0ElrGmGiZP3mLR99P83T17n4rwiV+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxndZ7Qa;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DD606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxndZ7Qa
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89f85edd210so147751b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722692; x=1793327492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFsDRt0lNhWFHZQTXpeKzbrFyQk7dRmTZwu6sQNhBXU=;
        b=CxndZ7QaDwRyJ69KpmJUIl5OO5i0QYm1TWc4EqX/gHOag+9SSqnnyq4En1k+nj7LXI
         zcSPoR9U4zqNpAs9YDAM3b2rkYoPSItPRiE21qUx1no28u6/sTyFxnRxQMjSB5lzQFtf
         jjpEJ6wmyqaGjW6qPWGDPa0EtLKZmT8buCD+NDKARHNceo8CdcMIMGiaqqQpWpUQ89kW
         ajExs4efzDrAEHV2shpktzprUWj8r3zCVJgCCvpzyvPfGAy7PbSR2uQvtZWMNhi5hpd+
         UnAeUL82gdrtMa3H4G1SMJDPNYUTImB1uv+e7kHpIyaLYPIMqYMiKN1rLNkrsJtRbgFr
         gwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722692; x=1793327492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFsDRt0lNhWFHZQTXpeKzbrFyQk7dRmTZwu6sQNhBXU=;
        b=yb7aHaoUfWBownhIdRx+05rX9pr6Au2VvZhpdo289pSE2JfjqBXKFwIXwJxYwivxHb
         LO86yO1HWryYYlvGh4H5xJ3v4/vjhhhdHm6aTGsxPzEKoRffhT/3OX6ZWXwCOcivBHsp
         ei5k/kvCKUlhVxQn/ftHScJPKj0CuWfCD5pLc8p2d004SQN5YC1UsYPgQ4c9uintctV+
         3KehXDUWz0mgFaSiH+Bk4vDWHCcogTgglv1umeNExaJUBuYuFI6ycOB/IHQT7VKfPk8b
         IQ2ILOYrOeCyv4Ad3fDrTkwFT3Qb4FQVF9Qsb3cXfil8GCamySRWaGPzebtYhja3vuv8
         ynig==
X-Gm-Message-State: AFq9FYIpBZx01WhbKAL96MN2+BBHgmjw/W/jOyew3GrhvMxm+JsUo1/p
	y713x/vLP6c6EEYd62YW00Be0aiEYPvKtr++8r0fedsJ7yfDiHtdkW71
X-Gm-Gg: AYBFou1TV4geULWqjQfX+SHB7CHOzAyr5O+R85iWsS4Bxc0cw45zLWsSqkWCDYNJsxG
	oHI6QU12GYb36JafjvflE6rcOG+zXC65MiXYhHZMu1nMwqbxbbnDYrujerf/50P1cJRzox2iNVG
	uZXb/KjV+4taMGHIb3jpxpD++L23eRqaR3LMvJIUJYCn2aFiSVD/ZDvyuFKZJYZ2YWNZzGobhok
	UF4Oq80OySghV2AVdX/81EiXzQMloZ19crPY+EW0qjcPj20HF+kvjrHdBO/p9sUffK0Dw+uOr2k
	wOS9QmNGjf0UvrcBiuAuzq51/WBmDQhLdKlHLFiFdX4rZ+34UhbGVf346zl27vrAImTWhKQIKpu
	H9LD3DqTZ6huQFK1j4tuMu9Qu3V8M1JbegM0y4We3fxkJunpBTeL3+KPdPVRNDf8DOFGqDMkvkw
	Ix4vt++X1mBz0TCz2LoqCZsXdlJvWl7MHPjAmRIdAsa4Y/1ZN2p/beq5G+CnpvaCNs9Sm7Fu39U
	BKpCl30cIC2+yQSiyULNOut398bdc6l+8UffaXuMfp2kjSDIpKkBh6ySy+ijK8Zmiw4aaWQj/Vu
	i6qETx5SK8/NVg7gzAVeZPlG5UEMvralN2BKk1hRHcCbUfXWNhyD9FoPwk+BKKc1bLTsa1Nc
X-Received: by 2002:a05:6a20:9c8e:b0:3de:4a1c:a95 with SMTP id adf61e73a8af0-3e376783287mr592947637.91.1792722692511;
        Thu, 22 Oct 2026 19:31:32 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:1d00:19d6:7438:ad54:9ef4:bc36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba89a40fsm279852a12.14.2026.10.22.19.31.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 19:31:31 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	gourry@gourry.net,
	david@kernel.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com
Cc: linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH 2/2] sched: use static_branch_likely() for the NUMA balancing tick check
Date: Fri, 23 Oct 2026 10:31:05 +0800
Message-ID: <20261023023105.28829-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261023023105.28829-1-laoar.shao@gmail.com>
References: <20261023023105.28829-1-laoar.shao@gmail.com>
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

task_tick_fair() checks sched_numa_balancing on every tick. The
static_branch_unlikely() annotation reserves the nop for the disabled case,
so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
taken jump per tick. Flip the polarity to static_branch_likely() so that
the fast path matches the default.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 973647ad6c2d..71dc47d6114d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (queued)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
+	if (static_branch_likely(&sched_numa_balancing))
 		task_tick_numa(rq, curr);
 
 	task_tick_cache(rq, curr);
-- 
2.52.0

