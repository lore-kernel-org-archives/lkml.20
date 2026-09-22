Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4E4FD7BA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061048; cv=none; b=jvec9QTjJWjkjAQjOtr5BtFC6nkT/CGrIWdt08AXXOFDJrJB31W0+ch1uAnMUgsAtp29Pczd9J4OAj9ZjXbdsd9O86kRRi8lE4cYwx7zSzzZtLq4Q1bSJBbBqRVirbfgUUk5EoMvmgyfW0wK90e0E+D8UadDlicL31f0SGDEd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061048; c=relaxed/simple;
	bh=JeXul2Nkf2zeS2OWaaoOg5njiRzZPTKUOP2PjjDjokQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/YLwmyvjhJymnzZDFLfw3JIPRm2HAmf6kVgdciT8OcxYMEebu1ypcHa2BwTMsm5iUtBKx+wfuhHSU0HdydJBKeICqQ83SKcnnsfz2tnzkQjDXzE1MQKlGxqs1YYpgWb9afn8ntRwbU2Dvxj2Vb84BI57x0LbnyJQZHODUTalRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdTPOEdm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdTPOEdm"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso1632513a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061046; x=1790665846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM25rpREpN0YJ4vGmgefvM6EGacbAogSR9saanUz1wI=;
        b=sdTPOEdmJXwieL/77+UQ5ZopnJVY8eQ0VbwKBd42xXAxXLTxn2xTYQVnWxnlv+6hqT
         IA+Mo5NUhqX95i1TSjolIymQh0ErsvyY524YmOXfToegh7Vi6zoGjeAWDN+1AqdikQ9n
         3dWFm8++MfBftbgcwdOYspdJcpWwPNw9f5GSSMH5hFqxyuGcWjdeaRQkVjAvhgkaqpMb
         8JubUW3fyaVu+fndevBZuwVwyg6xLgaQKP1JeNtkqJnKyuU04XcP5gzcymUafxfgtrPG
         rkaOt7IzFSiHRsEplM6gvhDMcierdgdoGWStAh4KyXZSv09Yn7SGr2tua18MqTC9/D68
         mf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061046; x=1790665846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM25rpREpN0YJ4vGmgefvM6EGacbAogSR9saanUz1wI=;
        b=0ch9WqMu0lbKPeJEuA0rd1ZDG4xrAKLvCF2slRXEYxZcQ/KU+msJpf6r4jCxrJFqH2
         nQpVC1lZfI1QmPM00DPv2BS1rYeAagKFms943dHp08OUQClK2Si9IbabWZo7mu8q6VII
         qpoZOCZHLFVFAkrcJLfc1HpFCw20NZnY/x7DSX+KiQHt+2FcbzAFkPqKLvs4s5La8gdO
         j8HHfeIhaPpX8k9GAQuMQ1x/fMAIm2sGWEUnurLlYtdAb8o3eH/myS1mkDMH8MRtkj5k
         cVbFFlt6Z1uZHY6Kmh7w77vPjcyozVSvluTubdTARYwcZoQEj6RQWiW/PAkxDBJ3k2q6
         GirA==
X-Forwarded-Encrypted: i=1; AKwUvBy92Ifoy3y+a5YI3ealx0euzPIMHSWTvbM3mBY240SL8jJKO/vZY+WiLJsbT95UYt6oM6TIcU5OiQgExjw=@vger.kernel.org
X-Gm-Message-State: AFuF++nlsLX8VgGPkAK2LniVzLwV7HnaO5mF7P8g9V1EuKmRdVHXpQ38
	EJ81UwGcbFSZI/RO/ATychcID+ngm3eK9K3NkEyQ/8DA2T8ZbIOOTYWl
X-Gm-Gg: AYBFou3JQCmoLqHB4LAU4vPwUbkzI0G2U/nyE6d6/BzkERN5iZX69UgsMalMIEkY4Uv
	UHbxsEtVxVpdG9BhIngWhRAHQK36UKwmVS0eY9FDJMcR9j3a0EI/Ia/BX+nmfKM/pUraVAPyPcA
	qK794xv/rHoAGJ4qmwe+3nXgr+vMKjBrvTN4rvnF9sKhl8Q/pQgCcWWrG2/rlL50e2MwQp5YDKb
	R0K79DyVZwvEAkwkkOFcwNDEnVUBQYvL89gRzY/Oan8h2UWhefF0Jo9X46rwrutlB1ZVvB0lpYx
	w+oKAgLhG1sXDiIRxQew70HvU4AeToAhjjNwrOwrWnKhr82SmZEID1bCH/YzeNazjr7xjKQuo2G
	Znt8xZDgqd1S/NhcIrlBMBQMKD8RTBAlV00mMTPc7ChG5l4bW4iwuOHjRluCGP1mZgdfzXKpQPi
	sZzlMZ5zjsZpUE7/0LVIHFg5xFI59s7cBJ7frl5tIDhQ4hux3IvCqiMTUzA2MSccoLWtdzUmXWz
	JhhVI5h89Yw++uzTQ==
X-Received: by 2002:a17:90b:58d0:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a07322a5bfmr239358a91.47.1790061045855;
        Tue, 22 Sep 2026 00:10:45 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:45 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 4/4] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Tue, 22 Sep 2026 15:09:50 +0800
Message-ID: <20260922070950.4173245-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070950.4173245-1-kunwu.chan@gmail.com>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an LKMM test for the hazard-pointer publication protocol used
by the lockdep conversion.

The test checks that the reclaimer cannot miss a reader hazard
pointer publication while the reader still observes the
pre-unpublish pointer.  The smp_mb() pair provides the required
ordering.

Models the resolved-publication case; the in-flight wildcard window
is covered by the two-phase wildcard scan of the v3 implementation.

Verified with herd7: Never 0 6.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-acquire-before-scan.litmus  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..19df97f1c3b2
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,49 @@
+C hazptr-acquire-before-scan
+
+(*
+ * Result: Never
+ *
+ * The reclaimer unpublishes the pointer, executes smp_mb(), then
+ * scans the hazard-pointer slot.  The reader publishes the
+ * protected address, executes smp_mb(), then loads the pointer.
+ *
+ * The smp_mb() pair forbids the reclaimer from missing the
+ * publication while the reader still observes the pre-unpublish
+ * pointer.
+ *
+ * This is the publication protocol used by the lockdep
+ * is_dynamic_key()/lockdep_unregister_key() conversion.
+ *
+ * Models the resolved-publication case; the in-flight wildcard
+ * window is covered by the two-phase wildcard scan of the v3
+ * implementation.
+ *)
+
+{
+int ptr = 1;	(* 1: points to the object, 0: unpublished. *)
+int hp = 0;	(* Hazard-pointer slot: 0: empty, 1: holds the addr. *)
+int data = 1;	(* Object payload; 0: reclaimed. *)
+}
+
+P0(int *ptr, int *hp, int *data)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Store A: unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Load B: scan. */
+	WRITE_ONCE(*data, 0);	/* Reclaim. */
+}
+
+P1(int *ptr, int *hp, int *data)
+{
+	int r0;
+	int r1;
+
+	WRITE_ONCE(*hp, 1);	/* Store B: publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load A: load pointer. */
+	r1 = READ_ONCE(*data);	/* Access object. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

