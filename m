Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978420;
	b=R5k3aErElgNdbG9mNzHZENTA0bPjsrfHHWw8qywyXlEuAmsQtLm0T8a+UzGlIOCDBgCr
	 qezgT7A+fTmoeBGxwEn+VMzb15DUaZzy6QtwK169+NX0BqpPJ/0qWPxExMzct53OyVgrF
	 qm7Cq6h53b/qyKOKfcvP/M7PEi6p+r93QHt756g2KP9JVmpMEpD4Q5ekhHnWSFOJI8N/V
	 gZ7WieWImkW11w7ctmB6aBIej+MZ2rl9hx1uZNvgzW7UlKZWWvKiaF75k1HcGA53ywKWZ
	 GXT5CGVUejy6u3rz3JlAIEJSLig5zSZyAYErHD1iuTByLsa3RPUb7wFrNULHxxpAhlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tX9HEYRWehVYzSumdU6wnzHc9q5GXalqxT96ZBMgpCY=;
	b=Ht1f/X/xy+vqTdTSQ5I7Ug0TERRIB808uR24sPSAdBMTb/yj1ULZMO3yJgHgllrO3u+g
	 9soMBF1ZnYuGj85IKRtFAo0l6a13A4Nu5dKv3Ijq8dDYARgpCPjAhmJ6p43PadtJeM/U9
	 U+sWXTbCbjPK3H37i0q9Ez3NSgoe5O9wZ2BMZoJE+vbRCJJ3Cq3P82/BdM3cMeBmK76AO
	 DyZbZ9Ob9sPs/JBGTxWBlt+pmdwa766eWFvFn9IPpnFAaZnb6frSzqYdo5slOS8RjoHOq
	 f88pqsS3dKDzJ8jU5RLppEN84B7i+PVGoFqSicjSiLRZ0AHlcgruOXcxCaISvRlT52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oUaDCEwV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC16082BFF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CC16082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oUaDCEwV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so830745f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978418; x=1794583218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tX9HEYRWehVYzSumdU6wnzHc9q5GXalqxT96ZBMgpCY=;
        b=oUaDCEwVrwd7wVYPPsm0oJBpoZHHoBSabQQXobDkNX1E/yVA4GVnM6EJ2wRhRu9Nem
         fXy0GSv7+LLM6mrTX7ub/JDoVi3llKrfkaWQtp5rSgdmfG9heTBixWcv1YfsMC9R9m/8
         wQpPF5NKaAUGu82YN/HxZ5r1W9Ih5LCkruyQF59UHv3IEcRuroRLtw643mvMX0xeNxYG
         KFsJwLKYLXvHgizNpv56l4kTCPx4E+9qkvyq0oFlA0LW1FQ0VbjzGVevyQtsszYH9Y1C
         4Bkbn7leuF/WAf72QEY7eTiwlgRsKFMzz2xMAKNJ+auHdipQcYh0ZRalBeYFTLs0Rrsl
         O72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978418; x=1794583218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tX9HEYRWehVYzSumdU6wnzHc9q5GXalqxT96ZBMgpCY=;
        b=AqCubYQbziWrP+pVP+jMQopAC7Hc93uEMiwDNEQb0ZETseZUVpd6i6RBkl2dY17Z6w
         JtNI1Sm1kP+Td6W/Hp0FXtmDgt8WWSlN/mSe+vDgSVWN+PJF7BSJBVlEeZEbdfta1XTD
         ++HxK6YlRCUGIOLqrJUmxEFGDrBrlCAABuFUr58+yYuwofsCzGEfAQw9umWgDTb29i4i
         jdB0puXrobEpFfArZgoJ1TFswQwLzLfU/UcSgYJ8nveMQr+Oc5Vu2nZCx6kQVifWNPjx
         pg3/RBeo4WKMhDWs4VC7B3Gu23VS0wPoUrylIbd6xDf98GgBvQcV5VehB2LWqW0tahMm
         uuBw==
X-Forwarded-Encrypted: i=1; AL+hErGzwuViyedCdK3Lq4SJ6B1QyaslGrNciFDtzVuhQYb0WsTysqSXel8mSGmEeSNdI5hkjK+2MTkCkA+Nu7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u/4H6CrtUleTV+CsBv5Z4F1/RfH1I59Bmvk4Ou68p7sGsEUgt
	zsy9QdT0HJr24roaJ7LerjShHWRZ1JFejBZNyhHXubejp9LBdJ47b474HQrNXRjHmco=
X-Gm-Gg: AYBFou04MoE5YV9c9hogD5z02xqpGWrMrYgmW9s5/7yy/VA1056cquAkVm+ky8AIDRP
	ILI4oepsGMDPx0vgHFg3ryMOU4rp17y+5qZ93fYUlj5n/0u/Q9ubYiLMiQUzpayjiUWAIs8ylAQ
	gtsXGLbgqNXKcOOWii8IHuzBN3aIc92nKIhyEuA0NajBClkB2CHO8treCmvJcFS2qYmiictUBvj
	idNsGltWr5Ut5gZCgNIlyoJxB7NsmRp4u+P6TG4mbdjT9R2h4A8iLWA2aNPnEnZmzGVSB9amguI
	TByUHkJ4by8ieMP08jv35C43fT2oqRfqLaG4RqNUGhPhumg1mItpsbFF7HP65kuAx1QmLF4TowX
	bhwkk4xjeQt9+cmwKCot1Q2iczUd8KZOhg7xUXusfJuXdovhwGETDwyWizp7P1PUc0Dde5ssm7k
	QeesDaB5ergsETDMgLufZ4GBiXTPgUsFMpn41KwqvQAu0JANTjcZVi8eV3XL9fR4BULx1y+Wgty
	C2UXvLDyUTxdA2LnpVD7m5FD/sBfLPEWSnQ+fAQd/9PwqhBlyYklZUR4AJrUsHE3JY+kIuSMcBM
	y3UN75QwZqs80FmBDmN4f3Sb6ZZ5XUOP46Wp1TZDE1jDWTsB
X-Received: by 2002:a05:6000:2893:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-492761d00cdmr6320952f8f.9.1793978418032;
        Fri, 06 Nov 2026 07:20:18 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:17 -0800 (PST)
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
Subject: [PATCH 15/20 v3] sched/fair: Enable push task for preempt short
Date: Fri,  6 Nov 2026 16:19:42 +0100
Message-ID: <20261106151947.3991524-16-vincent.guittot@linaro.org>
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

Enable push mecanism for the preempt short feature which is the
1st feature using it.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..5481f2472e17 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3497,6 +3497,9 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	sched_energy_set(has_eas);
 #endif
 
+	if (sched_feat(PREEMPT_SHORT) && !static_branch_likely(&sched_push_task))
+		static_branch_enable_cpuslocked(&sched_push_task);
+
 	/* Remember the new sched domains: */
 	if (doms_cur != &fallback_doms)
 		free_sched_domains(doms_cur, ndoms_cur);
-- 
2.53.0

