Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811487;
	b=DaTwy7qQO6CK/sGKsfxptNJI0VeZ/gXbxEY9vdgT+uu/nBGtJ/ElnBHwf+uyt+zr3XdG
	 HN8AQOkguUd0p8RObpU78HzucHh3hMYkA6/jux+yTBHLVttSo01VmJcfmsCBqMTAxf44J
	 5icqmoGN56SdoOKvXKtVRuoEx5LZC1jf9BVglJx2wUWJkXPo9uJwF7LzJ3W7SUtovReh+
	 BxLVwiLnOlCepF0i+pjKFpBn2jCJvnPP9ne5upUjIrF4SxxcQJcsCJIzxjf7iRjPYvEzg
	 rW/Qok9H5ubpbhwWPbL1a9KmncwPlX/JT9NzdTNUX/H3GtXPAgV2BPVJiehXsqtatAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
	b=t9uJmS8PRqqNqWBQkt2gLNe/H+30JRv47VXY5j3dw123u8Su5KczUpfAEM+xiKbQN5hE
	 xQDP7SgTGWszh0bccMtUuwXB0IIpNqI+pa5RPEvOXC7fzezBG4QBZMnJfYH02WHEP7iv4
	 hYmrW1scxDTU5jsmNyLIctGCmVQHDWI7r0BwLbjQbvIlWc/o1p/xyw4BBdp8UwM6esPy6
	 hQOz+aq4e+zQQAqyarTHr6FFp+qdVQkb5pbzGov0d3QxStJp5hsc3tm1nIEYGdE4Hg1tD
	 ciSlYicjRcZjHQPDEfafIa+tsGyvfHoW0SGQYTBipGsl0xNafIETOX4m7nGk3Ie8fog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDF4606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDF4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36c9a93a1abso856609eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811486; x=1794416286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=lotFQVZdNFhgVBDY7gna/kQwMt63LK8lZz7tMqJUIb8zH+l9m73GQU6xHgD8P4ZvZr
         1OS5T920Lqtt5GrJdQI/O7A/6fmemqaErhCNIlByN/wbXf/1XFlPVuCPkBuVcHrspK7l
         h3axa2N4YUH/YCY5LW1xycCedkvGXaq+AfvA7G+sdphoY7zT9z147BkTQr5zcfQaGlLK
         txraV1kFET4Rk4EEZPaTRDD/LKciGdu0jFc1pqCztMxzKSExFygfUyHNWNADpSIHVKQA
         jg1Ytx+JWO03LhIPjRtRyt+v8z5i1u4FBwFF4KovX6GB812JLN5y62qTJhVW97+uhY6Y
         YAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811486; x=1794416286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=DLLR/iBzjeQFukTM9qQ4lWUSxppJHPX4ULKV/RvOT9WpB0gHM3qmZNMUbjbomnIjOv
         ljA3jD2KYN+Gni0jCULz6Xm0RRAl4vpKYM/33C3oq4PoO2KPI5BMxP5dvYR0DiY3G6KU
         0Nl0Q0AHLDIhVL+/zm9OkNGInNYJai2g3XcRO5MxL6iAbfm/MEVtmjxvqRh145vIZlE1
         A1po4K4SyhPwhSuxRMXN37m6kII8EX7ZH39m7nZ39RQlDHt+WconQXe4ebNnU7DtbQ1z
         Pb+pFjWwC6AtkQjlJu34HW7tW6k/NLCOirZ/5E4s7tve1mBoiCWQS4Uvu9I6+2oJW1T8
         shEA==
X-Forwarded-Encrypted: i=1; AKwUvBx1HrDap35HJW35ti0UchKxu60X9SNe3AxrpqUmpz0MLjlBVAJiS8mUQFjKpnR3p//Rc7vXo09t5mK5g3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T2oepjUCyZV+aKeaA2gOD03eNjvHv5miGQJdkK5KavFHYzALD
	kflhVSNt3CfU/TltT6E+cMJgpFyN+xgLpfuVsZbPD2m5K2Vr/3o81NRa
X-Gm-Gg: AYBFou1DIZNC9ocmc0VeynchiDuLsZe+BcNvjr9T9KdiHme9VUrt+jF3XPMzHrqUA7X
	tc2iOEcw8aUG6pJh24Cg26uG4PKWwGoEbSqgI/l7Cpv3NhtDhh+/9a3YN3SmV8IvKEZUksHEZsT
	eb/Ho0e9m65vt7dXe/df9dZbYi4p2PvBHlQAQdzLqnOgOt7ArOZEcrtTVjs3kHtFNm62W2SAnnh
	iXka+IqKdSU/V2ZvCB6N6ZhHK5uorTIoz8M8+8xrh3Hv2dls2MEuKTrJ0RUbgWMj6vZHnjUVU4i
	7GtIqS2FQ28zZirWg5i6JbgH6/zr7FOVGY965rycZXV6jwMzDyZHMgi73wSgB2hm1156iiuyLCY
	QWMqvpFbKvUH6FhHXk5F8nrD+btxNR1A/XjvP547t+7A5TZcOfcdOIWOpvITmDeEATdcLW4XyY1
	fbZeMV8CkFU05e/psIQ79hg0zj8mMDG3q0SnFz2ZwNFCxmjtOtp5D1BRZz+TAP5syo/UbPaeS+i
	cx/4Pwi7+h+7o8vlOs0uzv5/N4umGCqfk8lG72seinq8Sz1r9JINp9Ta24ysPdeqn8Uruw+Kmtd
	jC2q8NAn2einXYBjA//li/44dAEVMr4q6UyyEKFq0iEwBjD/6nd36tTUTAa2
X-Received: by 2002:a05:7300:f78c:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36de479614fmr127613eec.7.1793811485795;
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
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
Subject: [PATCH 18/28] Documentation/litmus-tests: Add hazptr drain safety test
Date: Thu,  5 Nov 2026 00:54:36 +0800
Message-ID: <20261104165504.2430480-19-kunwu.chan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Model the drain engage snapshot race: the engage may read a
slot as empty or wildcard while an in-flight slow-path acquire
still sees the pre-unpublish head.  The Sometimes result
confirms the window exists; the engage's wildcard check (see
the engage-wildcard test) closes the gap by deferring
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr/hazptr-drain-safety.litmus         | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 02c26d6bea50..604c2c0025d9 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -119,3 +119,7 @@ hazptr-drain-engage-wildcard.litmus
 hazptr-drain-resnapshot-slot-race.litmus
     Test the marker consumption race between the resnapshot recovery
     path and a reader release: only one path may consume the marker.
+
+hazptr-drain-safety.litmus
+    Test the engage snapshot race: the engage can miss an in-flight
+    slow-path acquire, so completion must defer on wildcards.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
new file mode 100644
index 000000000000..a0ec1a063642
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
@@ -0,0 +1,43 @@
+C hazptr-drain-safety
+
+(*
+ * Result: Sometimes
+ *
+ * Models the drain engage snapshot race: the engage (P0)
+ * unpublishes the object (head=0) and reads the slot, while
+ * a slow-path reader (P1) publishes a wildcard (1), then
+ * replaces it with the target address (2).
+ *
+ * The engage may read 0 (empty), 1 (wildcard), or 2 (target).
+ * Reading 0 or 1 while the reader sees head=1 means the
+ * snapshot missed an in-flight acquire — the Sometimes result
+ * confirms this window exists.  The engage's wildcard check
+ * (hazptr-drain-engage-wildcard) closes the gap by deferring
+ * when it reads the wildcard value.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists ((0:r0=0 \/ 0:r0=1) /\ 1:r1=1)
-- 
2.43.0

