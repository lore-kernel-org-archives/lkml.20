Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C94EFFAC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955932; cv=none; b=fS5cNHZ1kWmywViKMtZVjmCa03ETzz+NZJs5dYyeonMvrnbPF0u/ULx5L8/NWPzbX6QLkGYcE0x+pcOdCg7f13rYfNNoanErYZBRfPbcBS8pwlcjDv8LV+1LHw6DTjPFn1S8bIIjUeIiIfQisKN1zMBQ+d91AoniJweLuVbWXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955932; c=relaxed/simple;
	bh=XJBmbAQssDpv3cWBcThWNbjc6nl3j+gt9Ko4eNiaO98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg9cL4gySxM9dXnp1L7vPR4h6zA4pusCmRfEQjOsFVTgvP/sZDzETMGnqs78X7KbezWbDyrooDi094jEG5maYdjg4Yd81HTSXCtVIBhw6+8BLO6ijDa0Ot/6iB8TYEgWGWm4h6v0kmDsl4lU01YtmXz8QNtl4tdwRXVnFFsH7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhzdFhK4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhzdFhK4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso190575e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955925; x=1791560725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkE6gJnDRs+XLmAou5XPy/YO7fax7WUEGWY0OkDdt7Y=;
        b=nhzdFhK4XJm4ywkcMx2iZMlbdA0TopX3qmiFqXqJugOxcLyeKb3VMWUs0kTjTnGuM8
         2mNAe8T2O4hzGJQSPLdDh82R7EJs0X889b+En2tC6hrk17UoJZG1IZ8bXRoK56uxa2zx
         AO+vWqV8B/fAAV8FQKM+MAHDUiEWDtazoFIeizUtFrCdVkjLsW0+qfVNTkOTlQBCuqSE
         Vvd6wedQWqZPk6RJgoTNBb/SUo8uK55/IJa/tKgPE+Agf7NmfSihpJxqjgkTl/P5giYl
         SQV52N9l+O719/iKvYM5j3/pDDgcnqX5MVQdEzeQrUKfYqm8CTc6LH8x3h35/b5MEyqu
         egAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955925; x=1791560725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkE6gJnDRs+XLmAou5XPy/YO7fax7WUEGWY0OkDdt7Y=;
        b=0OF3FwwyAHUInEIx3BD6ZGO0a9VN88HE2yw9AkJs8MgCJFuecGdAhe1hbHrCl5tyBy
         g4/PSyjUIdqiLF/4dDFSNrTpUBePQ3Ai+l0RXWdW00uQGLcqQx9QlSu2323roeBERWRe
         BeN6EJAKJscSPQxvu+uYQTL9Ca+WXHIcwVrUrMBaRf/5fasZEtAr23+64JM/mvYQyoMF
         Cj++bmwBkwnHQgPt1o2n1fJmTf68nMnZaRyP2qw/lVCSBMCuy/iss5DUpRUIsY2Hww9Y
         vRqdsO4R6Fg6hrUEg4vA/2vDiFNvT1sQ4xJ994FSpbD2/QrIGEyb5OIS+Odo4BiYR6im
         BSRA==
X-Forwarded-Encrypted: i=1; AKwUvBxYCF0Nv+Y9dSZlWdzgGdbqymAynh/vScgx18aAP5f8ngFx3FVQ9XC3aEHGctsleBZxTBbkblAVsyJS5z8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKr2pPWEUu1g9PpermXcjeqtDQc1S8kTyNY4oh2TxI4pffZrBQ
	pnyShzfjw3Mj2jNJfiKVgbabEfSpe0m0bIAti6wW05FLPRf86s+cbotLKG6J9gx0Gxs=
X-Gm-Gg: AYBFou3ywp3u9arfumAs0kHIMky1aUYhjWBz3AxvEY9E75of+6dgHzScP620OBmf0lX
	9wjioHfZA6tHiuWCFPfLkxaGe1jYjv0tX3Ilf8jCNflTuN81InAUYWbT1mN1JAtF2sYrcoqtKsQ
	4744FosML+6f5hWgHE9WOov9DPcmkzO61NZot7SdMy5yJjcTM2jv4bmK7Mric4dBLXKRzWUxnEx
	hdHfaEFYeZbIrIWjIggG7BIHTBuZW8fvaVV0zMxRYj3zGS/o+f/OIKDjBluScEER8teUuh/z6cF
	TwD1Fa65zaes7kO3NEl0mABU7EAXj6ZQIttcSEO4KQ+XuNhvGL4MzBih7/CahUF8ZPCx9ybn4sK
	mVze2i5BtMhBsfOTtq+lhxnqFwYJDtNbhgZgbcJ0KWJFRFgArPPxHC8oj3EmpoJQGi6M9Lzwn8U
	4kzVm62+3Gi1EmimN6fJpxvHR6vT5OsxsbZBtWfMy3ul0iIxpIsIxcjeA+y5shet+8373yI92m4
	QG5K1Lq8UfUFomb
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-4a0276a224amr56824375e9.32.1790955924579;
        Fri, 02 Oct 2026 08:45:24 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:23 -0700 (PDT)
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
Subject: [PATCH 15/18 v2] energy model: Add a get previous state function
Date: Fri,  2 Oct 2026 17:44:12 +0200
Message-ID: <20261002154415.2270586-16-vincent.guittot@linaro.org>
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

Instead of parsing the entire EM table everytime, add a function to get the
previous state.

Will be used in the scheduler feec() function.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/energy_model.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index c909a8ba22e8..89cf109cbca6 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -224,6 +224,26 @@ em_pd_get_efficient_state(struct em_perf_state *table,
 	return max_ps;
 }
 
+static inline int
+em_pd_get_previous_state(struct em_perf_state *table,
+			 struct em_perf_domain *pd, int idx)
+{
+	unsigned long pd_flags = pd->flags;
+	int min_ps = pd->min_perf_state;
+	struct em_perf_state *ps;
+	int i;
+
+	for (i = idx - 1; i >= min_ps; i--) {
+		ps = &table[i];
+		if (pd_flags & EM_PERF_DOMAIN_SKIP_INEFFICIENCIES &&
+		    ps->flags & EM_PERF_STATE_INEFFICIENT)
+			continue;
+		return i;
+	}
+
+	return -1;
+}
+
 /**
  * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
  *		performance domain
@@ -375,6 +395,18 @@ static inline struct em_perf_domain *em_pd_get(struct device *dev)
 {
 	return NULL;
 }
+static inline int
+em_pd_get_efficient_state(struct em_perf_state *table,
+			  struct em_perf_domain *pd, unsigned long max_util)
+{
+	return 0;
+}
+static inline int
+em_pd_get_previous_state(struct em_perf_state *table,
+			 struct em_perf_domain *pd, int idx)
+{
+	return -1;
+}
 static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util,
 			unsigned long allowed_cpu_cap)
-- 
2.53.0

