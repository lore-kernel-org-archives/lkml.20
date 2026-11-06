Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978421;
	b=hTBZfRzS7IoTGsQmD2g0nnrbR2dYJredD6s06sOieLGkP6BpCd9QP5UNoW/NEK2K+oO2
	 392Z9bPya+75olup+XAvwRn28C43U3+wRyr7Td3/qQ5Rh6B61iJ/Tou3Wt9KQCGRu6cDQ
	 aZllrei0vPcUklO4u4c21eeVpEccbPv8EVKxkGKzKvm07iL3lk1wovD67b7UIy2F/Ztja
	 1YVI7SvYJFd7ZWkvuYuC/5ZMDSLM3XrrAhZ/En3TmVloAQ6EibtoD524QaiqzTVsdH6Vg
	 ft1c1LI8BpCwtzrVhKwPxSKvQPrJ0bcjdrD5C4SmYUAc4S0is1MaOd3uvxASrH1OfHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WkE6gJnDRs+XLmAou5XPy/YO7fax7WUEGWY0OkDdt7Y=;
	b=pbNmVUtmN0OWodiIiqb0OEwmxIq6KWnoNBE7FZ+mVqhn/OMhGyp7TpMG9l5fKjnoreTw
	 hNoDNR8gD5dfauWxelC1iV9leHvRWNywP45dzq+SzcatdG4sbIirhCdEXnOHfC4FAL9/b
	 dImISTAt7h2Euh4V1BFpwLOLEMcnmjPXhMkMZgSvqrcm6Q4pDm1mU/eiZAi9VbhTiAr2d
	 nVmjgMjz5M384TbNfm5pdQeuZCg4ZpxrLIOaN8kLZrEOEvsBqYYpyLKbAxHbqubiSTd9p
	 hYpOgbQ9RDKW3P0gYMLrCjdueYtn/Al9BoU8q/juvcBaK1mwPg643h1LpXoO085Pgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPmVDwt7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536C6083617
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7536C6083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPmVDwt7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so425010f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978420; x=1794583220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkE6gJnDRs+XLmAou5XPy/YO7fax7WUEGWY0OkDdt7Y=;
        b=EPmVDwt7MDNBSyzasZO/fwgLcTwsfX10VI6Sdmp2MoS1s3qYjTYQuxNhjk6vZb90qc
         HN2Agpl3P/XTuo7joYmQB4KVNmYlWOGZb7oSzylwGaVrwRlb+fWItxP8iDx4kSkB6VRP
         Hjamh0vZb/8dd59TY97RWiGTqgB9kSa+oIhGaHIn4IMppGHKDHCtYgVIetVByUl6GAKg
         xXRyehaAe08fZfWpaHSot1uoijPSCmMqL/INOzycwIvnUqtfMXJ/JZujWGfWsY8Shylm
         fWlsodZ+3u6lfFMGr7gU6BJJXL8ftcwEH50OkaeJk3ox4y3cqV1ZWQDuL2mVHE2OU9zx
         H0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978420; x=1794583220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkE6gJnDRs+XLmAou5XPy/YO7fax7WUEGWY0OkDdt7Y=;
        b=p69CBHX6q1zS5SfygrzGa/ckedvLFgcQXnoBgXUYFc0ZmoeP4GrD8ZC7dQCQxmrq7y
         knHFRNFJdkuYTEeAJJ1S64/h4lJYTKJyAYHnoDs2xwkeWrza7k+6lI4GwlmYQl/0Kqkw
         qmSH5Go9Om5m6v5b3DlHHSEUL1e/LWFnJInBErUuRyks6oRpLQrBtqexqxyE+OAdgJ1h
         +6H0KqLoJjh6Db/2ihJ8vmYGLeaOdkV6BNebIXrbrZbUaaIv8F+GhcQfhgM0H63ADz9j
         YKPrDGVgEuVdAR9YhsomQXaTBxR9PiBKVypSS1aHSOXzNrrUZcTOMLDcXFSgFelh+Wu0
         o8Fg==
X-Forwarded-Encrypted: i=1; AL+hErH8YPSQ+y1KqI4Ft/kgWlDzAubx1Bu++leJ8o0BM4cqXdaJvvuMsfmYbFWt2W5hdeOC5FsybEGluGrsIvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bgFZjnALHNmEuszVVg6eX3uHBzuwfuESQMjs3s0rgXPcfRlTS
	lJhLqI0mlxLKb5mkre95dzsp5jOcSApAPT1iq0nMO1ov7PIxjU6Q6WMYgXhRc6/79+8=
X-Gm-Gg: AYBFou2I6Yh8pyuCb8VNnYROuwSIM3hwXGQ+ZEBdrJqwwSPK3szx4PdWpQHBfsB51RR
	+UBy2DGgL+1TnvAc6nNImNfiI+C2g8muK2J/T+mhCSooJNs2JfncjHOv5GzgQuUAWDiQ4fxUgcd
	5/RYEdZHskM77JzPFOYpc13jWZHe6sNoc6MfJ0sqWQlj9ryJwbFMB+YqkrgyvwgnkA5jVXXpxFR
	IlVX2joa6ENXrZvSLpUd1hJfjBkQrUAd3klETBTi2zy0TYtXyVObaYt+HwgEaghC8KqlasdapY2
	WPeliVLYhoxzcuwyLhcsdyQ+c5QxkwRQb7YvcgpWz9Kk3QkbLORHzYGj2rdd63K9jAZUUK9sUNi
	hLjas2uOz7hKvRaw+cQpiYlEPLAuLVIm5hLpLTJDdIO8WchyGN8SlLprkCWRjm1bY4kUuZnfOxV
	M+6p4M7DsUxTiSDFTR+NBme3oBSWcfL6NYo98mPuRWU9rmTceBNjVYDyvk254j6wHWedchYJud2
	53FfKWl6cHi+8KfzpfVT/RxRR+5zds7RBATFQ/B3M+IWD97PvoRJVnJ8ou1gltTIUfeR/8zjpxE
	s/vgkjt2VKc+v1nrC6vM4labK0vOTFDq
X-Received: by 2002:a5d:5f86:0:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-49272a3aef0mr6257082f8f.7.1793978419738;
        Fri, 06 Nov 2026 07:20:19 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:18 -0800 (PST)
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
Subject: [PATCH 16/20 v3] energy model: Add a get previous state function
Date: Fri,  6 Nov 2026 16:19:43 +0100
Message-ID: <20261106151947.3991524-17-vincent.guittot@linaro.org>
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

