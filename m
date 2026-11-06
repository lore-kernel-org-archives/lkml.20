Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978415;
	b=ALvKgs2vmKYLAJLxEbAu8K9eRcE6+fV8282F35vA1Xd+EVZNn6flBZwSi+2WyVHn85uC
	 CebY7taLwMklgKz66tkt3WTozCxvBjBn5U14zokuW4MaFpogCO3CKmZ4Asu3lJQO6fd1f
	 M9GESp/WPePfZ/ggS6cimHaG/Zin4zjkYzrb4btww9P2nE21itYVVmlBeGf6Tol4Cxe/4
	 DwHnrd1oUi39+2n4ydXECchA3d4+vcHY6xrCoKwDnl4vk3c6jmUf0oywIDNWBjkcZg//P
	 q4Qajkxf+XMikiTsldsbpC2yF6T+lg1X1dODLtOc1PL30nEhCCZ7nwbdTbtbx5jxUuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X7cjgrh5Yg6Kt2t9tmwbzYSsxzemzPkOn8ZYOdbmvek=;
	b=gWLafVuV3KqTSJ22WJzxzWCkehtjiA0G27PKktYqzEt1R+Z5I41Yy0E/H0dlambfrxfO
	 1IqV2Jt8ZaO85577St3X0e+HE9J5uSnxM/+oTIV269Q3qVHo269FiWWINMDdvPE5Gki9l
	 HfcEnp5gxteNIo0Cs2WILz205j56oQfUk6jRAl/PXTxy4cvMgVW0UFLa0AfmB6NUBrSbN
	 Dun7O+u+U3yxKlM0kTGzbmBq/7GbB9i1G+DCETx31x9zhCcclahdMmAaEgHtiHfY+eF0z
	 /wyb9whRKXV97ztJMkG7hQP+66X2js9q2wStXG6OMbG2PbTM7BrDs6zS8tZqknHYKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v3rkNR8c;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67543606D806
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67543606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v3rkNR8c
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49134c8509fso678695f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978414; x=1794583214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7cjgrh5Yg6Kt2t9tmwbzYSsxzemzPkOn8ZYOdbmvek=;
        b=v3rkNR8cc8u0mM6I32Zs57dGK/AcATh7qjOpbzCxROaoF59kzHGoZU7fR5VNljGcse
         tOjzTDac6/QgSQn5vM7xTHTJyo+I2GQl0qgxTNIk+APVQy8/+f9T6T+lGfxQfdpYCdtY
         cGuAAU2KTVuEZisxKt3Uxe3PHNCxY6rE2EwkWpYck3KhqMsUHsbdqB6SS2i0DTVAfRyk
         lHFnZs0jaR1EwRZQl3LC1yt0Gxy0OnXnwjTwG6w97KujtR0FG/pI1aPvm35xn7XjjLeR
         H9MG/mLZck9d49RI2oiFjJHpMu51jmBnmHIp9ER5atOP1rYtnu8gPpFpWVvm+lp4RyPL
         yvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978414; x=1794583214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7cjgrh5Yg6Kt2t9tmwbzYSsxzemzPkOn8ZYOdbmvek=;
        b=hgGOETKy/6FdzGe6upPelefJHrqN4Zvt3RBZ8gWQjthBGW0AlgbKTYcJQspNCitJzm
         ChzVwfWbCEUeTApflvEqEjKaHwU8TWkVPpqpmVDz4r+wAEE5RmOE1QX9hiocMTmIywRQ
         xouKW6or7/zuyIxkDlUUh5zQBaXtoiQoU8YqpYX+yUJ7IHnXaFvmQGSCH0BC4PrBTtYN
         ffKPmgRpE1D6RTmUFDFzWisMaDJk5bxJSPk86QRavPx9JJYaYV/eXlwN0zI5/u4n1fEU
         b9Fj7EOqZkZzqGADmkJBXGoxiXqeZPO0I8/colsqdqWUnWwk2oo9FI5iBTfYYmEM0BGo
         Xxjg==
X-Forwarded-Encrypted: i=1; AL+hErEqh4a182C4DqGQPqkCjeQ8lAhJot75D4idjx4+gpPYI9o+u6Knw5p48Y9XDW4wqvXQ0y9kB+ewEZP3c8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XedDQyYq5K+3bA0/ak+C0b/e6NEs6fdRnTJmj+CTRa5TrO240
	JnQxMLgR9GwAdMDZdoqjLgbMIb+5xwU8dQgJS3GaKrWYsoX6/JD7NFCIdDqdGmSNRH8=
X-Gm-Gg: AYBFou0mpDuBMyUgPqLWLLPfOo2+VxjnDfWiR1pmjhdWUM3sbJls6FrIwBNPvIrPDA6
	j1IuY3ZpmUAbEmuc7jGKXwPBaE0XqbzghRnh3a3cyJLthsYM6BCNjP+SyfbwbXnng0ztfmk7eQZ
	BZTl674Ty1kF6ict4W6GWLaWFFIqjp+xTMzaQzNOuxcMylnNcJslxe3UHD4F67yQWJdo9pjGcZO
	PG3xkQI6yKSwnybqnSDOMmhvE3njsn5/065Cm8nxUJWJZddKfoKJTcQv7lB3PeLX+NivFPUbXzq
	gyF0kqWCgQS+bwWaK7CamNeFw7+jYQBAT9SJ9PANV6BkSFwgrLbE6a8uAaZX9kyoASuSgGZfXSN
	aUAFHMbjvOeAKvfXRNKMx8+nvjsV3DB4ExxT1jdHXFRrb6/UQ/QnnAGyj5eEygCFr6nRuuujMHE
	hvj4OVbgCCZzdZynATfB3dmeGDMrTMur30WPXJWVG0O8ORGBY8ShyFIeNpgQpFJkDwyl3VZ4Xgu
	ekBlli8cRhOkL5pZrCCEIPx3HUUz0Hd2DRO4eHonBiwoyhpluc2yPMusWkRjnFBf+oTHrT78y4w
	49ToFDcLXxzG7YiJMUGclH939lPVMbm1hA46CLDmEjQQc8o=
X-Received: by 2002:a05:6000:22c1:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4927678d572mr6661924f8f.39.1793978413847;
        Fri, 06 Nov 2026 07:20:13 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:12 -0800 (PST)
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
Subject: [PATCH 13/20] sched/eevdf: Try to push short slice task on a better CPU
Date: Fri,  6 Nov 2026 16:19:40 +0100
Message-ID: <20261106151947.3991524-14-vincent.guittot@linaro.org>
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

When a task is put back in the runnable list, we check if we should try to
push it on a better CPU, i.e. when fair is preempted by a higher class or
the task is preempted by another fair task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 980eda9c935a..3923587b66e0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10112,6 +10112,23 @@ static bool __check_pushable_fair_task(struct rq *rq, struct task_struct *p)
 	return true;
 }
 
+static bool check_pushable_short_task(struct rq *rq, struct task_struct *p)
+{
+	struct sched_entity *pse = &p->se;
+	struct cfs_rq *cfs_rq = &rq->cfs;
+
+	if (cfs_rq->h_nr_runnable <= 1)
+		return false;
+
+	if (!entity_eligible(cfs_rq, pse))
+		return false;
+
+	if (pse->slice < cfs_rq_max_slice(cfs_rq))
+		return true;
+
+	return false;
+}
+
 static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struct task_struct *next)
 {
 	if (!__check_pushable_fair_task(rq, p))
@@ -10120,6 +10137,12 @@ static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struc
 	if (next == p)
 		return false;
 
+	if (next && next->sched_class != p->sched_class)
+		return true;
+
+	if (check_pushable_short_task(rq, p))
+		return true;
+
 	return false;
 }
 
-- 
2.53.0

