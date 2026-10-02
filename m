Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207F3F327C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955930; cv=none; b=ikqTPtFQGlr7qZXlrlB5lFTIQyeNElq6obPd9wEXUqBv5f0KzzSDP/aYJec/cAsTkRiDsuzvkmyc+Jv3OVBVz40N5+h1wnqjHPMRSlQmrAXR6nFkIxHQbJ3iszFEYDXJznydOlO8f8+oyC0q0Oqc6Y+SUO9udAwlzNGpBV83GSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955930; c=relaxed/simple;
	bh=qgQ6mPEUSsweS0ySFC93r8P4Eludf9RVMAvxsJJRRs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ir69Zq4rD2NxZeSPtGOC+Ez5gd/Qng6Dwqy2NEOAY9esIi3aAl6KDnhoLVONyzU7s3HRPcLNFMQ8lJHmMcJcmDVOOUWC+cIfCzL+l0/FbrPmlQay98I4PoFvO7PQ14ZQwhQiHh74wH0LUIW2Ko6gtJKH/Y8a5juJVk3Z5+9q3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM78FrUn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM78FrUn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a163f2555aso350265e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955923; x=1791560723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxDjVmpry+V5sESUwysJzs9Q3KJpqmz8KRnIcWV2Dos=;
        b=eM78FrUnxkEFSWR1T5s3qUniky8aZ2xEoRNeycWDgxz8i3mV6XNhfM+BOj59rsxZW8
         iRKfNHTYXjYS1kzs2DLf0NOtj3xW+aOAbgXAH9ASqseOUYWG3obWSl+LcKSgiP91A7xX
         1Y/JqVzd75r2tqALzoRp71fSNf27jXdnJkTYJ1LtFe8Tyz7nnc1KaxxVINKDNxabQKUk
         ZokPjH4TfogGUmMOdccO124MK7IdjMn12O5dr/Gdig3OIR9jJmYv5JBsLQNCJOCIovoP
         OQgCWzh7RaSXds5ZMJQVIJoeS7SxX/4cO+pxJtNYHnr20HG7fmzRMo9njAJlVmw/brLq
         03rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955923; x=1791560723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxDjVmpry+V5sESUwysJzs9Q3KJpqmz8KRnIcWV2Dos=;
        b=AC3r/Wz41H1e0czuiMCBNdokALm2GFCfsJajhTrnLySh1VLwK6+y/HRnHoDIqLLaui
         qRg9hJTCowoiNp0ZY7OEUwp315b6tCYcTWh8g3LsnPe67tqc9rZ7x+TdiMJUokHzZe5c
         HpWJYu2BM9FAdPfpRU8Q7HxjwwCGrB1nWSUOYusvH6PyRkE6Z/F4ud96HS/b/5Hv/CmK
         vvUtS5OASnrRwSsVx6My4Ftk85rTApsnC3TAbaLhxr/GI8Lky9Tsc46CtbF8kc9y1WLW
         FESDFiPLDKKHfmWeXrP68K0PP81u+R0/6aau4dHrghUvol/V8U2g2xgWLLtyEMufCmKh
         nOVA==
X-Forwarded-Encrypted: i=1; AKwUvBwMAIAkDcl2ozTOz/qDrTNVOUdtwnPirN0uFEQkKu1oIWARziExSOqbREPIZRd+HhJOWOyxwY+PuSwk9Sg=@vger.kernel.org
X-Gm-Message-State: AFuF++mA6p3yVnAUwmlk962HsyQ5t3TYHrDK+3G8lagMltlL5E3XyQ5Y
	tBz+g4/NFAnm2lfT/9IoKt26bzZTFnBuOAZ96Ch3+YxZ/Vlj8Tk69EvJheEHwnqqTlY=
X-Gm-Gg: AYBFou2GBfWoqL2sfWmqhNQ21PTxekM8mwC7rc3AQU+NPeiSEV2Ea99BT5L+XURlfvw
	njjHw0b5lmckK6xV9BIkVSApOAimGaPWFRFnYoWR1tieSX4Fk/iZ6Onx/xHEkqQ4DEdMg1p/Q4b
	2zA3BLxPzkzj1fGYZgKvRjkUWYpDob91+H5ljlAiE3VwFEFkLJk16GvPY5Aw6vIcMCa6c3r0hwp
	NBNrMMzrYnCEJsvPxn865AXyJnwCjc45VhmXroMADQxZX8VPzfAZBnJuEA0ua964JzIq0ClVRe0
	UHRnOO0v98/xKAyMneA2p2eluFIVCagBZcnKmurFmQjmN6OHxCju5hQdb1iI0uIcG71JM/9k+rw
	fgteSflcP1/0rQTGS8efrKgJI+2+q/4K/Ysro404KyCJa6Nan3jSbM4/Ea48TJHvswV0lxHlF0f
	pAkl4NLZpD5cJ39xNc4q9BouyewZkMC32102xXtWKYcAK7CkeHujNlZ1guhls/Ku9vMe76K79u7
	JDXq0FZqZJ4XTdj
X-Received: by 2002:a05:600c:5308:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a02751affdmr54746315e9.3.1790955923338;
        Fri, 02 Oct 2026 08:45:23 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:22 -0700 (PDT)
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
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 14/18 v2] sched/fair: Enable push task for preempt short
Date: Fri,  2 Oct 2026 17:44:11 +0200
Message-ID: <20261002154415.2270586-15-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable push mecanism for the preempt short feature which is the
1st feature using it.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..6b1058268e6d 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3475,6 +3475,9 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	sched_energy_set(has_eas);
 #endif
 
+	if (sched_feat(PREEMPT_SHORT))
+		static_branch_inc_cpuslocked(&sched_push_task);
+
 	/* Remember the new sched domains: */
 	if (doms_cur != &fallback_doms)
 		free_sched_domains(doms_cur, ndoms_cur);
-- 
2.53.0

