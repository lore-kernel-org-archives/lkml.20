Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811496;
	b=IKVv/G9GmmGfJFlGUtmW1fYDCiaerGD4OoZJt5ia8GhvjRQ8+cRnNsLBQd/hyz/PpVmM
	 iPkdGskQ0BCTSjFZalZlrwlglmHHO98qne/67lSbUTrn4lva1DCa7Ha4/39g+u8dXev0C
	 sgz+lakjtVvueVXsjhAaVln3uWMrvdpACbOjnHFpzr1ii4fW2WPRlzpQQaf69snUUhwJi
	 v3D5Z6Y82ufGRS8+n0oNSHcypb2/1oUFfugplqcLCWxTXhhTT7p1evXNnSZbhVCTeNZN7
	 TjorrknEMM4wv2wfIPkRCxhiikdsNCdASX6n06rYUA7c4kRuBNQIlWfM0LAb8n0+LIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
	b=gVnr+pLZhNo5gN8Zxmti0LfQ5UtSV4/++EDnP/41I3lAz+IjzdNVRPupjgrITvZ68QJv
	 uQ/6mgXcI63lxTT/uIHy8CCMEcFEmpN7SFmaaU2rL9GDMbhBhaQw1atEPS6iboPpbPbdR
	 kJnWcuuLa6GHqY/ETEfMASYYZKByt5e6ajym8/nE9sYExrwQ8AiE1ndkp6RBL1Ww3cEYP
	 EzYBL3WbKdswcrxk59oAuVxdQ41m2itHEIxsUGVlex9e6nvtFxWAFhMXerl1XWuHPWqdn
	 Hw2iZhQXb9RSIsz5+guA0z5tHe6RUwSJeciKZAIToKHQkFkji9bWkUF6vIEUfC6yM7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B5606D826
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7B5606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1364250eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811495; x=1794416295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=hNr3tUusaaErjUitu2I6XbppO/tHcSXKdcNOfa5cTRenOkzbAShzlYf+Vh6lhhHcnU
         tV0j2CjmKzhKKOb88naSBWlsm7UMSz+rFmaMbHHVVo52UBAQUQqzpBCnbhekDTbeMHdu
         m2HGm/OC5cbaC5EsFBwb01g0ztwO9qcrVtWW/Gy5r5WiqyNKkT4Fnrid+ZtOZGerKzfs
         i5yhjeAtyPa/dnKRefMUtTmhyXApUGDjfd1Rt/xYYyIFeKFYslG1vZ7fTtcF5bzZh99e
         yUQCBLmrELZusND1vAwkU7lxXMR4LlihbNcRhxjtalepwnGQ6X6xc8qKK1tJvFak4VpN
         STow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811495; x=1794416295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=CvZqzI8s7JwmyZR9Zzd2In+TKSi+vA2qs997bQC4QTe6YOOf4QKhd+4qBJmtkpUhuW
         r6DfjKntJEU60ykK6XJjdvu+ymKZ9Sl/g3mk6Fn97bqbJv2rBVKelt5QaYinn1ISKKTC
         yIHO/P2v36Z/ORtdkqPV+mzH1n1OOl7uAk994/zyhrGNHRRfyd977BrA/PPud2qF7j4Q
         wtn8PL9Kop6bGYUdBoLMvA6m2xyLEO+6hpIlVZnBxTTrpCmu3HdJgRVyDffrtVdiWoCo
         wANcZ5gkamn91+GR3MHrDJbeNWcbsAxCagdDq2Zwnv+5zoAjv3pr7mcHZrz+FTF8KhSr
         Aq4w==
X-Forwarded-Encrypted: i=1; AKwUvBxWbhk7KJ/w+lyxBnMe1mexyYDwu3gED2ElQobrl2pUJRgenbxAcobRyFgzjhLhHmEczdjG8YeoGHA3k+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZXvDyFWo0N2IcOOjGR66DkG/Lxrwc8zPa5QiCsYTwuvbfCZ2j
	/aPvv/QoHJuG49WyvlHaGO2IV1UAQ/8J0DgslwNKp9yv1ST0xPv42v3o
X-Gm-Gg: AYBFou1yiUz7A/wQP844bVIq0BCCwmOd3JQT+Li5XjmBQ19bnP76D7IRG/PlBgDE6c6
	8XAUrXKOZg07xwUJlfEX5mJU+RE9YeJIBS7N9/ZhZ5ou8RIxwUTb6XWiDLwknaSu602ZGxtPoDd
	uiDnqnkAQ/tL3h3xSfJL5rxOVy9dwmBRj5U1bCFXoSIZMEdbxhVMvklaqWHnCEN5tbG/fFbevtc
	YVBgUlaKtsvo7qhPU/ggkkT+RLwaz9/I95FrMa6074LVJgyZKgZCLi1malvJ5LZaaiSxtECxAdb
	nPXl+zPru0pGO/7Msit5z/OM1ZwOMdmSHj/EzKMVV1/Ilp8gI59xWlnBW3uIPyWTFnBH1A2Ixqp
	t4R7r+B2cVdi/RDQET9heP707gdkxCQH00IdvQJeEHxNhe1ivsviOsH+NjTyvhDyeDMWn8BnUyF
	2DVwGZO6p/aP8BfNQtbiiMrF7xSy6+ATANYEAZ7ZNEJeXsg9ssmBBn75r2qQN43XMjx0mSjE6qS
	e1SIUeUquLHBrdeQaqgELqOhDE4P9weo3rKATwWaEGaz4CZBFiQXAevvK0T5FICJ3SSSPTcaHkd
	uzrGmFsll3E3fL2mqq4oOtXoXG24EHGmRumVERI=
X-Received: by 2002:a05:7301:fc81:b0:36c:d29e:668f with SMTP id 5a478bee46e88-36cd29e694cmr3306314eec.6.1793811494826;
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
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
Subject: [PATCH 19/28] Documentation/litmus-tests: Add hazptr drain generation-visibility test
Date: Thu,  5 Nov 2026 00:54:37 +0800
Message-ID: <20261104165504.2430480-20-kunwu.chan@gmail.com>
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

Prove that the drain engage's smp_mb() publication ordering is
correct: a release hook that observes the new drain address also
observes the new generation counter (herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr-drain-generation-visibility.litmus | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 604c2c0025d9..79b0634ddb13 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -123,3 +123,7 @@ hazptr-drain-resnapshot-slot-race.litmus
 hazptr-drain-safety.litmus
     Test the engage snapshot race: the engage can miss an in-flight
     slow-path acquire, so completion must defer on wildcards.
+
+hazptr-drain-generation-visibility.litmus
+    Test the drain generation ordering: a release hook that observes
+    the new drain address also observes the new generation.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
new file mode 100644
index 000000000000..d5c1ca247d71
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
@@ -0,0 +1,41 @@
+C hazptr-drain-generation-visibility
+
+(*
+ * Result: Never
+ *
+ * Drain generation visibility: the engage publishes the
+ * generation counter before the drain address (separated by
+ * smp_mb()).  The release hook reads the address with
+ * smp_load_acquire().  If it observes the new address, the
+ * subsequent generation read must also observe the new value,
+ * so the cmpxchg compares against the correct round.
+ *
+ * If this were not the case, a release could read a stale
+ * generation (from the previous drain round) while the address
+ * already belongs to the new round, causing the cmpxchg to
+ * succeed against the wrong round's marker and falsely
+ * decrement the new round's backup_outstanding.
+ *)
+
+{
+	gen = 5;
+	addr = 0;
+}
+
+P0(int *gen, int *addr)
+{
+	WRITE_ONCE(*gen, 6);
+	smp_mb();
+	WRITE_ONCE(*addr, 1);
+}
+
+P1(int *addr, int *gen)
+{
+	int r0;
+	int r1;
+
+	r0 = smp_load_acquire(addr);
+	r1 = READ_ONCE(*gen);
+}
+
+exists (1:r0=1 /\ 1:r1=5)
\ No newline at end of file
-- 
2.43.0

