Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811367;
	b=5NAH19Kekq5P3dBCREAcLXPmrQxPjXxhuShYCQLUPeCmYJccOoqrwyuPlxVTdhZ6L/WD
	 0zV+URPYDQBqkX49JN7+zf/j4//FTOmMmlw5X2KmfxK2aJouFJlIIH/IcJpOBs3mw4Of/
	 HqHWC+fY/3lFilMmVZBG1p0zdJF4wwzGLmWjSS5pkBHvlxEEWUaT0US4jRFzts4yFttdh
	 bAMc1SUbzyHYDlZUxeG+ZdENS/T3OY1/ALMAzN6dfV/bRcIiAjWQW1Q1wgSVE6mtW6mGe
	 cBlkZgWgfzSNFwAhXUumuWZhvBH4BelCEj6l4xZIog1NFA+4JDhcTHYfcgzIz//uqMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
	b=gtzBwFm++6K72luGrmr0jaE7j0CTf+WiprifQjy9oAv9bKfM8CpfIQWK/UbSPRaaupLW
	 qLs54nhF/OCEUOrCfZBzhR2cbZLUD6FTvj8C5xWxpEuWxVEshFE9PXb540Xk2M2bXAO4E
	 AVWSRhb5eIRh4FC5raG4wFFqPYW68Xx/d+dxi6LTZpqOeRf+cEAzgCaeNi3+ljPByMHPd
	 9qchdDMlnrmRKcaoChdrqG3j9nOGVaD1oYkFQxa7+Cgn/Sg2KuVPBm7udamxBvRC3N9SX
	 MYDWQwOK8dWoXGpM07MhNEa2S04AeAATaMra8u1xmrwoNC51ODSJ2COAv9yLQKqm4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61161606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61161606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so1895014eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811366; x=1794416166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=UGUkONorfwM+zbVj6eSQLZ/CtHpB5o6WUk5r6DRCTGw9BsZ3jYHEXXgAeUMXpdkKHw
         rOZh0cr3KpIP5HIpA47NNa2SvdgBzVZO9ouBTKR1uZ7I/v8x7qERHplfE42RZ9WkV9rA
         WhTMYE7yMWjkIdRnqeFALhk6GGbkABiCkQLU/LhORN/exgEintJBo2+52BvPekR5iiCg
         JaiaFNJVcOrSF5SWDQcIfnWQzeik44hR0n1dwFRYF1zMjcPvRGBJLcLTj5Qezw261wSm
         VRmyrgJiAM2eYvZ3x5IdrrkO1UP6/IpCBNjSbQFnbFoLKEC4WWZ2HEP12RSgYhlCsYXq
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811366; x=1794416166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=OWhPRSqoNIa+GAZrvT8cOQuyZQJ+A9aIKQzmBmUvzHZhCDCiHkTgM/hTvDsJMLWXrS
         AHIKmPNzPW+CQTnwC1KoFdp/q1wXeB50noD8wNJr/ZaZ7zldLkTjadFf0sDm1RZxHIdh
         u9JHNkB+F4h0TkfrBUOWXFLolEx2ISWMMsxkDQ0i2AiqDRwnQAA/RCLRnd2NIvV/lTIA
         qhNuXxbXFnHa6yv6ZTKkyPGZRRu28mwWbX5TkNz5XGXy/Omp5zZ4iVp2nSDU+R8JXazA
         LIB6BoLsuYV69B/HpZS9HI6LtYrQMlRedLpg8BCn9bat3dBo7pDe1Wo+V7tJefbhEwfI
         3hAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsMSTTdW5I2BZp+BCsva4LAgtl7Ql6/qZpoXKJAzuGCJkWetG0O1nX/kuD23Y5nwYhfaeXpROoLYoz6Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z81qaSlhNHLknxTL2qnKpgmNuvp5ZM1KgkW6LjUeUImaMNQVVTk
	WjyyVU+I8bHs0j0OCsF98vvwwpIa9F24usX/fUGIcnxmTeoBD2JQZpv/
X-Gm-Gg: AYBFou0XbaylCi03lDY9CamWxrWKYGtzuo9mmW9KmsGQyPSjusWojN3UB5NVK4q/NYn
	7f2g+kIAvmnK4ClUlgZXjFWnEupoVOIx/x+H01xr0DCaUIg993tRYQ8qX4qd2Ml6TJrGNBfFRJG
	ZDmUs6p188B/nEONUhQY8a+1ANW6bCml4LqML1GfhrBp6wxuw67QTbDQerJwLhYPM+XUPHfpeTa
	pPW3u19QIRu8WfqNmWdPA6X5XdoPkMLpeNiJhMyXFz2C4mtE/8KYFch+MhO6tfi0ZMBsNZffJ9Z
	Ouk1ZXez1SZHPIG5DdubuvSbF8NC/TZWIX7ze0hi/1SZDGRzW13UpsC7K+UyjDgkBHMoLw8OFQX
	QT7DGVGPlcrxS1OvW81Q1raF3aWe4hA0R6bGtzoPM/nZHwgJiJmCcXB7xyMpygPC5wxQSdSPF6P
	jPkP+Ly5SzYYvLbjWmsojqTezSxkt4t/5nGeRzSPlC7PHSjLU0PKa1tksDk7VJJgp6gWwfWk/6z
	gGpHMPTH4xI5sB6EqjE8YUWw5lajZQMkTSjL2T1A2E9Aq9fEClEKaaDHziq6XCQlOuFow88FvOJ
	R8ElEC0NfB7USQlohiIeYAVwot4CSKbxDRAQYNk=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr26391236eec.28.1793811366010;
        Wed, 04 Nov 2026 08:56:06 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:05 -0800 (PST)
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
Subject: [PATCH 05/28] Documentation/litmus-tests: Add hazptr wildcard-flip escape test
Date: Thu,  5 Nov 2026 00:54:23 +0800
Message-ID: <20261104165504.2430480-6-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass scan: a straggling acquire which published the
old wildcard after the final walk cannot still load the
unpublished object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

