Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450995;
	b=0D5T2X0I9t2JhhyVtWQ0P5gyR/gaJHH2r782XwvqocNJujRr2dcLq0q+Cd88guVitxqz
	 p6IHeQ/tvi8AqEGlh1B3OiJSUqy7OUy1KjzgrBppoKZA3Geh4SbDrtDJ+ok8bujudt0Z/
	 NHAAcmQ+tyrY4mJjiDBO1Rr2Y1NNFpD6WveyR47p76n4P6aGLdNXkl1RcqzM2a+iX83iy
	 KpmY/QeQM5BIsdcqrPE/wExS0wpiokgfDvX4vmIdw5nAgubMhNdq8QTo9tRwLvq2VQQk1
	 xD8QkXWoWq9MTsMCKa6jNxXHrpVameNyJFH9Lenn8clEBY0XDKoYkxM7c2Viw7hJTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D7Jfm0xtkB3hDvA63bm2HFuTPhTZu2s6lv0X+4q+1Ac=;
	b=DiliJNGTBw0Z2W+13V7txZ4jyZYChgkm9j6Xw14pMW0fmhOb48ZCL9haE8KY4hfqvo4d
	 vOw/+4eSQfe+G+NoJdK/VGZKKhY1ige3Spyx2vxEFqngtW1Tl8BNuiQi6khVWLWpwZE7t
	 C6M4MNQ+FPgCiwPqrKj/TYJuOopvzGosaj4PZi4KShzoL3Bhq1nirsleCMOdHjym9kF+k
	 TDrqVYCb4mo4qR8QDMYHeIuM54ug895eVtSjhFcjNVVT7r2N+NvUQpPN/j3/OcFkosKVR
	 /Uqy+L0XYp8i3Bin8spELIF6RgdXXmUFvFzHYyjSbGIQnvN04ych9UyFnu7HT2LAjXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9JaUhS4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7E606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B7E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9JaUhS4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14683605e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450993; x=1794055793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7Jfm0xtkB3hDvA63bm2HFuTPhTZu2s6lv0X+4q+1Ac=;
        b=u9JaUhS4F6FTaezzXBL/cdTsT45RGJdTQiAQ64AMAyszWSxs5z7FcIpl6683KylZMY
         V3AhKLSHa2YeqgrmYu9HY5IzZu8cyOtxDaOinWiP3O/gvJAwn9mmhPAPASTB26wVY1Ld
         pe2WqDWeQ8bYJ2rdhiRfD+SCJLoN0yXdXFuqGhS6aeL0APlblLZmsAvnI0yC8osA0RNh
         SuUcTxeo/31A+/jJQlHveQkIFYqUvE6zp8olFYtp9HzomN/7lmmTsSVHWdra2UQf34xu
         HySAD3OsmzEiQgtHC0RV1Fhh7003f6vLQnOMMxa9gwqfWF5JoLAJxuE6QqgEiNLYh8Zi
         /sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450993; x=1794055793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7Jfm0xtkB3hDvA63bm2HFuTPhTZu2s6lv0X+4q+1Ac=;
        b=xvBGTmRfwQ9beQe7tr/rPVsWo8guMOKz8u7P0oOfIQGZVcs8SNe6JrPzrHXaL07Zap
         E67uPEJ14TUIIBSRXaxXcbfWhCqEWNdlg7pNOVr+HDblEmDQS+3uL4uTDugEHIyt7Jih
         6xJ08mznbvCi7OUJuaPcY136YEgEfUYGqRKc3WBDlzJS94l/N4b/shGFJKc0BfjqhLaR
         CKIwF2t5IKnsHjDSmOF9IkQeiCI4J1Ip7oPgwp8ysPLzTQcMhYflwpwL9uXBU0pl30rL
         /ZafIUqlwAeVZ7eqEO8xA+5bN1Rm+QFLpZCwORDAsDiAbDasGGz1Ur6IrGmt1YhvzOh9
         ABdA==
X-Forwarded-Encrypted: i=1; AKwUvBwGkQMrsqUwGt/ncJw+YXL7dYVSQq70FKgyJKTeNph9lsD8WAbXmjnMa2wZLDv4WPp3DUa5TvFU9gOytmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu2jzR4f78nJF37RWAAZyOrAl4xkQulLEmeGWxcJUwcM5X+BBA
	lQSLHMCx0PIRsTKECqogtfJNy7v98dKi8bYQW1x7VbBJXNhY444qOqgEcbiRPdTN4lr8PQ==
X-Gm-Gg: AYBFou0DIKLFg+LvDCLBQ5KDDOHum9RHJPikhhFTJ6lRfsc9s1jduFHfltg81xBY1Tp
	LQy2ZMjZkHt10CE6mvXfqhzxjTmuhZbN9seWo0YzMAkd/WrCVklTE6cEO+BxdB6OH/ZySRifpiW
	v1axd4ht2JcgqM8l25ZmZHxDuxuL5tpVMLroWg64ARcpLuijQ65GjRMmxwYDzheqytSxCgXYBVk
	dySEH2QCIrDzUin7oIQud14eTR+R0XaI2icP2jqvuRuevEXsZbgu5IOV1D+im6E0pI1fnuNyWm0
	rc7NDSQaIowhvVaQzgCIsGpOCjM5uzc0qTM82YTI+lBYFOl77AgvoV5pMU5BTBB5adggNgGxxaC
	o0GBQeIpCutzKcC1lPnpxXfGy/6X3W84XhFIu9AzwQteKnLIPHjYU3U+6ykCj9Dk2Qof741paMd
	GEfYbbDLChezgubDssgqq9dJe7ZIHnBKD1m+9vg/k1bge1Bf0U+SXjciD5lF6pnT8LY6bD01SgT
	uaZDcPw5OXJ60m20OzKeWIvK6ty/YwuiBFQWQgRUj2lrm7m3q6UonEvYnF5ulv7sc16kD0ccBap
	w37nTOpCC1Ub57bTr9kzWKqIpm6jzTmG/OakpAn2yppd
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr115249705e9.18.1793450992773;
        Sat, 31 Oct 2026 05:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm8735884f8f.49.2026.10.31.05.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:49:52 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	mgorman@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/topology: Retry scheduler domains after failed construction
Date: Sat, 31 Oct 2026 14:49:50 +0200
Message-ID: <20261031124949.3904462-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

partition_sched_domains_locked() records requested partitions even when
build_sched_domains() fails. An identical rebuild then reuses the failed
partition, leaving its CPUs attached to the default root domain after a
transient allocation failure.

Check that the root domain is installed before reusing or detaching a
partition. This allows the next rebuild to retry failed construction
without rebuilding successfully installed partitions.

Reproduced with an alloc_rootdomain() failure in a four-vCPU QEMU guest.
The unpatched kernel skipped an identical rebuild, while the patched
kernel restored the scheduling domains.

Fixes: 029190c515f1 ("cpuset sched_load_balance flag")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/sched/topology.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..b3c4bc13875c 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3346,6 +3346,13 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
 	rcu_read_unlock();
 }
 
+/* A failed domain build leaves its CPUs attached to def_root_domain. */
+static bool sched_domain_installed(const struct cpumask *cpu_map)
+{
+	return !cpumask_empty(cpu_map) &&
+	       cpu_rq(cpumask_first(cpu_map))->rd != &def_root_domain;
+}
+
 /* handle null as "default" */
 static int dattrs_equal(struct sched_domain_attr *cur, int idx_cur,
 			struct sched_domain_attr *new, int idx_new)
@@ -3422,11 +3429,13 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	for (i = 0; i < ndoms_cur; i++) {
 		for (j = 0; j < n && !new_topology; j++) {
 			if (cpumask_equal(doms_cur[i], doms_new[j]) &&
-			    dattrs_equal(dattr_cur, i, dattr_new, j))
+			    dattrs_equal(dattr_cur, i, dattr_new, j) &&
+			    sched_domain_installed(doms_cur[i]))
 				goto match1;
 		}
 		/* No match - a current sched domain not in new doms_new[] */
-		detach_destroy_domains(doms_cur[i]);
+		if (sched_domain_installed(doms_cur[i]))
+			detach_destroy_domains(doms_cur[i]);
 match1:
 		;
 	}
@@ -3443,7 +3452,8 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	for (i = 0; i < ndoms_new; i++) {
 		for (j = 0; j < n && !new_topology; j++) {
 			if (cpumask_equal(doms_new[i], doms_cur[j]) &&
-			    dattrs_equal(dattr_new, i, dattr_cur, j)) {
+			    dattrs_equal(dattr_new, i, dattr_cur, j) &&
+			    sched_domain_installed(doms_cur[j])) {
 				/*
 				 * Reused partition has to be taken care
 				 * of here, because there could be a corner

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

