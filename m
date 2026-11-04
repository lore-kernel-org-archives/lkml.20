Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811478;
	b=5V4uxtDeZpcx8vaaCGvoF+lSEEQPYxZHTMhmWNK2/53x9xmz2NJBkuhY8TpwuUj+t8I5
	 6fdYStghbaN6syiXp5gPiLkbmGu6P882k6xW5IPbuw8jQ3ryMr978sfmtoY5RS06QytnG
	 aMdnnWebI/LpN0rcF+iHdxeyVuHyTGaY43f2tsVgt//jhLqP3Yp42obHPTJphXvktSa4z
	 RmBzg7gfoxUNvrQq5BPcuGH0pyNrN3h2AZpyCHzqwiCMA8nYN7uHKnK7JgcAq12RJiNbZ
	 oN7JAQmKfnA3c/9f/0noVdlTaaoxjeTGzlBo9UgZIRErPBEP1Wx83GYeKlhnHMTUwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
	b=hNIJ3O6AOuHE5ueYXeGrQ8DD1mUOczQeH4eZwY/51zcapnn52wcojdpT0IoY6SLrgIDg
	 t5DU9VlxXcRfq88tAKSbil9RsK0bGHVp7VQjy/RWe8JMPECEhUVpTeCq/VnR9GQ/KmRFf
	 I2ZCejqJR1WHogOSV+6ylaX7Dx+rNppOOOzLhXtioOERxz1CeyrWGWsWNykCVkKFfRjSV
	 DVqEked/XWvXNBdqNkZApyDQXR1lf+pVme0PX/mIGzIAwdN8+8vicwnwEclI91Ycjhj5g
	 cV8vkMv5PKjqWJ7Q7Bc6kpPypna0taGxiNyXRNI9rmXdwDEP+Jp+7fYHGkmLgFLj7Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BA6606A33B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BA6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so1230858eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811477; x=1794416277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=lpDOW6ADYu851lyuivuLo7QwlZhzKTNs3PLF10Rp8myOxE5BpOBWhjm7Q4MqLXHeCx
         J52PFqv0AaxfoECHtzUpZMoovnjGHZgtZkxUez8M9SYQzp1jWB3MSam8LxY2TDtwtYM4
         i3YsZK1YrUlfkTefb9OYyeuUQ2dajq19tol+OtKNoLQ+MTKFu1lkw68gpHISoAjLNrX5
         GeRbxOyi04N5JeHjXQ+yP+UlpAEd/NKnQVYCH+cBYLKUSrSb3q/aJt4+3rxkSRyjQBnC
         YQ/20uVwMzwVNPsexHWcF+BUwyqNK40THR9TTrc2B1//qZ3wuMYu1M/+MQKh2WT/05Xl
         Q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811477; x=1794416277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=K0nsbMVkc9bQ6UgOpFgZR3kVPF0dxG7NGvzdSgLFefQkfWJMuudRjh/VrLAd3KRyGk
         Yn+l4v6oKIdOResDIENBPxA3eu8KDLoM9VYe4Ez1gikMb+TYZgwRXlMXhKQDVMrfEtao
         HBCSA8fUPqMziBgHu6jW5Qa5y9YcO1jNdCl+vNh0cpV5sIrOu4n49vjx+ASrJpWLx7/c
         IUExlMPu8zMNxGRubwsqqwu6nYSsYHj7N06fsFWFfMqF9CbrKZsS1ddWUMrx0amQCb+9
         KbRb3UrkE2GKXflu7C0ceoMeD3HVl8T7Krjav5SMFlLPecBADxB1QUWcPBO8ktvUycpV
         8yJA==
X-Forwarded-Encrypted: i=1; AKwUvBxjuid4sF5Kd8VFxZFUHicDD5o8SgfIsQLcDPA+Lft0xDYUp4hZqzu0bvDEttPuJOw99oajLmqvieKYRlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DJr11n4LPZbDMNDU+jhXAyTPXSCuUOyj3IimssiRZsSmeIeXw
	NhnRcLW3/K7YX0IxTX7Qi8s5O/ftRYAcnQx3igExugOiqz2cO/FdXyf6
X-Gm-Gg: AYBFou07rtuSMsbMmFq8px3KnIkz3/hjT5gOy8V0piRaHQOCCb/fNwBjLKffr1LKkG1
	tkqqrvXmaMPKo+ZYrSZmp354e/HVv4NZP5DrNv/eOrpuPgCcYOhDbTFNopXYkJl6mSEKOr9BS6H
	KiqIPSzersqkZtM3U4qRr8tozjMUwSj5GIVsR0jhydC1HhoGq9HjEWcr46ZCya8f7LZ3mKezeEw
	F4V/FdYkFGwhO3MJBy8GsaXxujLSezL9oBR/iC1iuQ6m2KQXsE0oyx0cYasRxEMk0CAhjtRAIw0
	pi94ngGezEvTUFyz2d9rDH3xpfs4ZX+KwlJKm6FubHr1OaiSpCMPOVx14DoPeCC1WgTfwew1dbc
	vR+aZl4c6h1KKPtC4tEJfNQ5mx9aej1+TOL63U//RXp+nER9TfjFFOlR3o05SqtJ2mMz78Ikvnm
	NC6sNQd3Tv1zhrWxDgfdv+Ux1ET24kxbgjixxQBZ5c59UFcakdOLsgMie6WcCQsZkWvOFm7xAiT
	6peCK8QAEUu7kriZyk6f9qkn+Ehnwd+6Vze/npXjsbkXtPeJ5uoqmy7O4FceZXfJT6Z72p5pnYo
	fMsuxir+wHxQU5JU+ZSAzZDIQpu4K49Tkke7rMmJ2cTH3gYE2RRNaKcB0czL
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr24088619eec.20.1793811476479;
        Wed, 04 Nov 2026 08:57:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:55 -0800 (PST)
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
Subject: [PATCH 17/28] Documentation/litmus-tests: Add hazptr drain resnapshot-slot-race test
Date: Thu,  5 Nov 2026 00:54:35 +0800
Message-ID: <20261104165504.2430480-18-kunwu.chan@gmail.com>
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

Model the marker consumption race between the resnapshot
recovery path and a reader release: only one path may consume
the drain_gen marker (the cmpxchg in the implementation).  The
Sometimes result confirms the race window exists
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 +++
 .../hazptr-drain-resnapshot-slot-race.litmus  | 36 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index daab126e45a2..02c26d6bea50 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -115,3 +115,7 @@ hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
     not complete for the target address.
+
+hazptr-drain-resnapshot-slot-race.litmus
+    Test the marker consumption race between the resnapshot recovery
+    path and a reader release: only one path may consume the marker.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
new file mode 100644
index 000000000000..699cbf0e3d7a
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
@@ -0,0 +1,36 @@
+C hazptr-drain-resnapshot-slot-race
+
+(*
+ * Result: Sometimes
+ *
+ * Models the marker consumption race between the resnapshot
+ * recovery path (P0) and a reader release (P1).  The shared
+ * slot_gen represents drain_gen; only one path may consume
+ * the marker (cmpxchg in the implementation).
+ *
+ * The Sometimes result confirms the race window exists; the
+ * cmpxchg ensures only one of the release hook, resnapshot,
+ * or unchain path decrements backup_outstanding.
+ *)
+
+{
+	slot_addr = 3;
+	slot_gen = 1;
+}
+
+P0(int *slot_addr, int *slot_gen)
+{
+	int r0;
+
+	r0 = READ_ONCE(*slot_addr);
+	if (r0 != 3)
+		WRITE_ONCE(*slot_gen, 0);
+}
+
+P1(int *slot_addr, int *slot_gen)
+{
+	WRITE_ONCE(*slot_addr, 0);
+	smp_store_release(slot_gen, 0);
+}
+
+exists (0:r0=3 /\ slot_gen=0)
-- 
2.43.0

