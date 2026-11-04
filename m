Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811579;
	b=DQMd3qxOnzIok8LkkkQgCy7MMpinbsllhV4g1R0MMiJStVA/3j2/YOAj+PPhghkC0xfr
	 cdc73/pJyMS17JzSc6ef2zMC7Toomlk0WwdskqIVF52kl50RJWsXWX2DMCN179IFnYTUL
	 VPoB5+eOKVN6kDcU0C+pY/Hn2Voj8mskuYrPZMACpxWqBYUDJaw/+0DLxy7R9pdCQeI7t
	 QPb3gErEtaAqHNDCckXzm4Z/3fxYxh9iqczngsFHE61ZW9m4cIGBbHuMg4fS96xw3TfTe
	 CLD+Rq1lQRlQO+EVgu+mKOZz3ob46ruweWmr+QYBP4ccv+g8CLzBKGNS5F6S1RTRFPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
	b=Ba8bPw55rKeHFzumGMkOos7mjzIqV0OT01+DEaJwmrlrIIJNfYg+OG/z693LLQfrceSS
	 M6CoP3tusJ/N58l3n5RLYru3LRttyYDbhBy4qpq8hd7Z1f5HywFw1tFls54RtpXXZ6+XS
	 ly2laVioeWV+dpLstAMTzNXvkd8rDWtUMiMf6neRdc6A5aAtJbiNGc/Mhp4Ge9a+alqym
	 QvcF8Nldi8P6LIxACeIqf1UBhgv4ztk7FoD7cQNlS3uOTc4PCt1Q9ByiIlr/AcpdRJ3ju
	 D7ichnFXRE7b8oR/XKjIUjA+kcaocF5YNyAl+kX+J0lxAT2S3NrhE0DV1IwZzawhZVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrse6usq;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02A606D83F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C02A606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrse6usq
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so1233374eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811578; x=1794416378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=jrse6usqBnrS+soUkCyFUg2F1RMgHEti6okHxkqcz8eXjyjL6hgO59HYse6SKdGg4S
         gmhsRH2BukszB3rE1G+ljKLc9MeAFdzPhVvn5ghI+cUZOEDZs49P6E2pUJcqypTcVo/e
         1p7oN0C8hNpdiiAZd58xsCRac5ExecZ8JbUWVaS9of6d8ewtNoh5E3iDr7qbTZgNyWoy
         MeYxDmBgMk8kqfKyiKGEAfj7Qe+JJRsN1N8Kn1C9hjexqAgVvQOobQZU0tiyHNyixf53
         j4xZoXo9nnFkK/q07aUOVg953ppzvaadCtW0T/zZajLGlqoa98FxyjdY3WwZXW4+j8BO
         3tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811578; x=1794416378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=ohP5Q55JsmSALVnsYI28SAx4uoVz46P0MlH3UQAIt6xMZeBv4YJP1DIBKAbvSIWSuB
         hWoFzCuPguZNcu04e/A7alwPoQF6BEf19iOai7zgu9sspkoMniWkgR5UKnoqL0GxIuhT
         BobnHNnWnpCcNitBf0ZzXwBVjTabS+TKyFk2idSKSGjBeyWdyHfGfGORuj70mj2Da2KC
         FQbStmu2zIHDcHWsZqJq47tS6f+p4ZLNhwPf180c6wgpXzHOHH2UH5qAbT2qIVZ5aAjX
         z+KjS0UIQfTvE88TXwwO819NWnvwkPAEYLhWWqjPGlhKRRr+ZCqlkBAHPQA/QpPku4b4
         Ejew==
X-Forwarded-Encrypted: i=1; AKwUvBwIymTZNXe9rYJX1+AgJHvqqTsUxjy/24aPtVLQhfNWMmkIXeMuNh8XX9E2eKutqJxvt7VtZAd/8u4MZFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjc6xK75NPIVgaTqHKHpIT7wNM52y75gdoGPmV+uNT3zyPaQg
	+bSCkj742sqs6YR/DUBTD5wRKe2yIvAghfTl8XX4FLj8RqOqWwSKiacc
X-Gm-Gg: AYBFou3c05a1tzY7iQvcwiJIvf77g+quRs0hufx84l2ijH8U7DYEB153Xxs2S34QTmz
	Sk4JhcjszgdZ3cPn6pNOUqjiiC7WsOb5p2sOSgKqHV1pmU6jhOzb6tm2GEYz4d/gPPkmgqR6e/N
	TSWvVJ3xbK4XpsBzAS/ipVnNkJB5URbA9NtRBXTcoh6u1Xbus0aBrfjFbpuEi6KGn2NxJGWK4F+
	aqzbPRsjukZkTdWL9suQ4A3iJr753nYwavwrPjygdDVadk4DY/+4Z1byOUpQ5aSozj39ZC95tg7
	wYa0vC2swtYTF2QV/0FVt4mJxwdrHzbmTjmJxjug6rdcNvWnVqu+K3RVeX7JrtPFwL1DT9TU4A7
	ntdkZkiArEdeMhsQu5w2UalStXj5GOkSOUgHyYjE5QIQi3O6nEaqJU5m2NvLihFdRoSYZEZCgIl
	+9qsLTuecFhuPaG7C/PhUpofXlAW5XSG4huIpinuL418t1q4PyyC7xyocpY0XPMvR+MFJzoCzZN
	V1v12q/RVtEjM6AeJR0E5Yeo3nPlVDZaMnydEHws1Q1A7I7yK3gtZyNJ7RRaO5pZgYtzNg502eu
	soU8QXxjI3sU2mTxr4VaIGAd12MuvZxCn4AKLYO95iFdPPAPFMZy6hXT7FVT
X-Received: by 2002:a05:7301:fae:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a424596c7mr24456857eec.23.1793811577443;
        Wed, 04 Nov 2026 08:59:37 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:36 -0800 (PST)
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
Subject: [PATCH 28/28] Documentation/litmus-tests: Add hazptr bloom wildcard-hole test
Date: Thu,  5 Nov 2026 00:54:46 +0800
Message-ID: <20261104165504.2430480-29-kunwu.chan@gmail.com>
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

Test the wildcard-deferral of the shared-scan Bloom walk: a
slow-path acquire that published a wildcard to an overflow-list
slot cannot be missed by the kthread's post-wildcard slot read.
Verified with herd7: Never 0 6.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  7 +++
 .../hazptr/hazptr-bloom-wildcard-hole.litmus  | 49 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 79b0634ddb13..561319404126 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -111,6 +111,7 @@ hazptr-wildcard-flip-escape.litmus
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
 
+
 hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
@@ -127,3 +128,9 @@ hazptr-drain-safety.litmus
 hazptr-drain-generation-visibility.litmus
     Test the drain generation ordering: a release hook that observes
     the new drain address also observes the new generation.
+
+hazptr-bloom-wildcard-hole.litmus
+    Test the wildcard-deferral of the shared-scan Bloom walk: a
+    slow-path acquire that published a wildcard to an overflow-list
+    slot cannot be missed by the kthread's post-wildcard slot read
+    (completion is deferred until the wildcard resolves).
diff --git a/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
new file mode 100644
index 000000000000..28a2bc1206c7
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
@@ -0,0 +1,49 @@
+C hazptr-bloom-wildcard-hole
+
+(*
+ * Result: Never
+ *
+ * Wildcard handling in the shared-scan Bloom walk: a slow-path
+ * acquire publishes HAZPTR_WILDCARD (Store B) to an overflow-list
+ * slot before loading the target pointer (Load A) and publishing the
+ * real address (Store C).  The scan kthread observes the wildcard
+ * (r2=2, its walk loop keeps waiting) and defers completion
+ * decisions; the model captures the final post-wildcard slot read
+ * (r0) that gates completion.
+ *
+ * P0 models the kthread's post-wildcard read: it must not complete
+ * the waiter based on a slot value observed before the reader's
+ * Load A.  P1 is the slow-path reader.
+ *
+ * Question: can the kthread's post-wildcard slot read (r0) miss the
+ * reader's Store C while the reader's Load A still saw the old
+ * pointer (1:r1=1)?  The smp_mb() between Store B and Load A, paired
+ * with the kthread waiting out the wildcard before its final
+ * load-acquire, forbids it: Never.
+ *)
+
+{
+	slot = 2;
+	head = 1;
+}
+
+P0(int *slot, int *head)			/* scan kthread */
+{
+	int r0;
+	int r2;
+
+	r2 = smp_load_acquire(slot);		/* walk sees wildcard... */
+	r0 = smp_load_acquire(slot);		/* ...waits, reads again */
+}
+
+P1(int *slot, int *head)			/* slow-path reader */
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 2);			/* Store B: wildcard */
+	smp_mb();
+	r1 = READ_ONCE(*head);			/* Load A */
+	WRITE_ONCE(*slot, 1);			/* Store C: real address */
+}
+
+exists (0:r0=0 /\ 0:r2=2 /\ 1:r1=1)
-- 
2.43.0

