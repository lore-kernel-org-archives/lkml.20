Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811404;
	b=BimG0y2L7sB5nOFF9TkgFzstKVmjh/Y3JBq9TXUP2L/oUBJ2WYfMRl4FaRD9HJbwYO4a
	 dszDQTb3F+EDLLV+hQ/vDnaOwhyNDgREfp+UnvZ9myeLs/AAAJbu8YAJOROfX7gyCV3Xv
	 FvgBlUvtBHSDaWiP7tNVL8dnTfxza/uSiY2ddu53ImAqp4XHBY9uVy9syfhRtXQ2S9UU2
	 8gj6IpdxhGk24sk3oI1yxhsTg21wdp4iRN4J2v9y4NA3YlTSEGZZ5poA+ky4EcJsgUjM8
	 HFxCZCpk7rFVyjLHt9WHyf4E0lY4jElOWAzDddEWp7FzcrEihwlmj218+gO3xHKfiEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
	b=j6UsK3/lKLUChmU9NqucuWkzh0loKe3BOsgY6UfwYKIY0mwxEGDCfNYSzNxnPejWCWN8
	 V07mAbUjy4CdZF1dWe7Y5tqzJ8Hu7xjAn/xjWrNp6oV6Lgvkhr0Bg7JPBOupx+sUzrNRp
	 AEzSmI9K8sv/BJJZpZXtug6tql6vjONLpq8Fj79OiSLK9EKAvfnpCWPTATPMWBsKqqc0I
	 9h0jPWB+DLQRZAXkv+v7P5Rg3L8VhLFqBGUeStkQxNrbcROTPyhRyu+XVpVSrJxQFDVl7
	 V7wERI8mD3PfEPzCGkG8NW3obMugPiv++N36LqjzYurb81AqbugmGTiJjyvj19TVBpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093E6606D802
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093E6606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so1229009eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811403; x=1794416203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=fE8WH1MKci4/tbOVBnJedYZrGTpUWQYU6L/1iUfnHKTUHhPapsG5ksuKHGAOT0+Bul
         d/z+dGRxCJ6aamcS0zzHgcwDJ4MdPZWqjDLr2gnttF6MZhzB2QHkR7BVrMWu+yuGWJGQ
         IxhmUZCVKxbCWS2ZDY2bXZq0SMCPMiZpxg7n3hu/lOfaAvfXIKTrbdcgrBS9ZfFUVPPU
         dce4azDrVK9nu70VUB9+o0C/rGPtu3O0JwvR2EbeLw1mVBViSDmD3QruVjqeIPbbKtma
         8ZQ/vQ4iY4whe4/9hwWcx6tOOnyEubAyxtgnmfbAuvrSlFsSucoq5Qgv+UgLhx9So5Da
         E1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811403; x=1794416203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=X43WZ7EoVX2jGMaOyG2WwIz9d4R1SkkJfNDfDiZDUEgUATQxGt8g/NZlTppeyTf3g2
         LmKxoqNr66FEvtY/pyh9GYnaT4oqTbdydLjyOiK1wRXjIetSul/FZw3xwxp1qPgJ/4Xj
         LIrzjWfdeTYKHvLqQxoeCH7HpDM057nbHGGIkFu0y4ggxqdfZ4UvxJK9+1aZNuJBXA7O
         HYoaj0Wu4t5y6ULuFomdrHT0KqX5dDz9ECo3LK6NEiy9iTw1BWN49PqJqWoxneFfdJzR
         jU6+c6h3K9/ClZBkdRRkwWFy0GtFGHDfxSrUwjhSyIh8bfkT82NELZoAbSaz/79vfZc5
         U1kA==
X-Forwarded-Encrypted: i=1; AKwUvBxoEC5r5vzbsqfzsvA8czqmWeQRaMUYv7nskLBlEA2BMFlJHBqbDbfqDuCLRwTISjogQc3OxyKdxLhNmm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yVNhwWH8/x0uMtjjvW2p0khoLCJKMNUfHfE7EGgxKjCMoDio1
	qcIxSd5XfQ1TxcO0QcJF9x6uHoywoCH+HHcUhsMWGwSsy4INXXXc8Y+k
X-Gm-Gg: AYBFou2tUhW0rgvv+rhKyMB/j/AMEgvIKkW/F59jwSZrBP4ja4RAlxqZNsv/g4QDrJD
	pI2CvYtfZdaG+brQp+FPm4t+MBAzhNATUQpIE05dov/kvSlOGvvJBYFO9y8USq2SMcfIC2OeukJ
	2QE/qo0QMiuUSiHQDeYyFNYTgC0ih7jq+CeMVBeyzuZEhUOdU5K8fUQmS/16zOkNhLWiHiwAQbr
	v4SDv6sGes1JibOHSItRVslppxY/WA+gbbvUD1wLfMoTq+/2JHP6Gmz2Vr0ZStLAOh1lvlaWtee
	ByqGR6TMfAIWEe6h/Ufm3HovbxP2zX48Ea/mFXyCGHbzp0ObZlWGBzVS7brJb+2dhiH/N/k+5iL
	pOKCOUycqhedr97Z2eTnB82B8fGVsIV42LD8lw09pKk70S8wdJJBX8actNdgFGp9KtUe2Nt2TER
	e3Pyr0MZaHiLvgxVnary6cYBLKFF5jSBckTT9ng3guCWsTJMkYa9UuJXvp6bjAF681CD+zWWM16
	xw0eWGZe2H/loKQIO8/3xaP1wWv8ScANAfwegLqlz5WDlxIXj8uTkZ4R6dBfIaSMPcowmJ3kXP4
	7DgvuurDYa/tMcLPLd3txCNaIAx/epl8RDxND/A=
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr24794481eec.17.1793811402488;
        Wed, 04 Nov 2026 08:56:42 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:41 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
Date: Thu,  5 Nov 2026 00:54:27 +0800
Message-ID: <20261104165504.2430480-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 4 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
new file mode 100644
index 000000000000..f5564c218902
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=0
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
new file mode 100644
index 000000000000..0d0df3f7dca4
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=4
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

