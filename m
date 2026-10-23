Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770942;
	b=FxA7MWdrDMIF5y9EBmUpuKW42o02c9t68GuTybvU9E4gBqX1fZkgQJrRSN9QoRPyDzIi
	 aoCeIYRJmpkGEbrLEQILcnHRXTzYAp90+PNd5dlt36MU+xLB0XzEXD2YCLt5GPK66ssN3
	 X50kLDuNcjR9D+IEwKfB3x4PmMRdSjwnrWw0kYiq8rKXUyC+qgmn3A2Q6Skw0XGHqoApw
	 BIc2uzK1gW40aIx67o3lfYU9SygWI9Nwn92ABmQ/alDLlsc7iDmWiM4qPsGAxlLCXFPv4
	 P6XdALYiG6gORWUC694X6yfIp9uC6KK0lPN4U/YZp8IUqUgWW/1JMS37N5FykRLuriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770942;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=ynnFsRlov1ettI6tdNTmf0TbH0h7G/oa8q2L/bW+DQ8=;
	b=CKDjUPzkxTB90AwgabZLUFmT5j/eXAJKwqyzAlgaNTUSF+3B1UbYjzemmdpI4hvBYPNN
	 DC3KtV1TVpBiZ1m4g2XxEmMienSvX+MQYkzy6UzdoZnSBCZSvDjmMyE0yjS2CMA42Afbd
	 ISnz0esIzyHTQRbHgNIziebYzfLWoekOPkpZpRHU1tgi+rsJwPms3/3nVoSncR/g8Ut7d
	 rs+f3Xj/muKblHvg+dn689PlL3Y4mpKrijOtjmqZj7sV1TSQkH1oWjSiwjY/Ei5DOIfEl
	 TvDGXRDQRp/tJLaS8MXfeaJYy9xlHLcnEsuyFlTKxUtUhtL9v4bKffsZdSiDUhC2wxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeqVggOP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4FDF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeqVggOP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792770940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ynnFsRlov1ettI6tdNTmf0TbH0h7G/oa8q2L/bW+DQ8=;
	b=YeqVggOPF7MtY45syd+t842rl4Q+dAXgV0SDAoDNSKfd3qpOseKZ6KVh13vtIGP3oDNGK7
	4qtuOqXChdB33ewPyzsaBc+DUvNpgfnc4TO7phzLCqdaTnJTw9hObdXtNFULMVPZQ355lR
	HAwGUi5iwJH11BPUVCeQXl75qBvZsTw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-BgUftQijMgmoYf_ioMrlPQ-1; Fri,
 23 Oct 2026 11:55:37 -0400
X-MC-Unique: BgUftQijMgmoYf_ioMrlPQ-1
X-Mimecast-MFC-AGG-ID: BgUftQijMgmoYf_ioMrlPQ_1792770936
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F21A818005B1;
	Fri, 23 Oct 2026 15:55:34 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 632451956089;
	Fri, 23 Oct 2026 15:55:31 +0000 (UTC)
From: Jerome Marchand <jmarchan@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Jerome Marchand <jmarchan@redhat.com>
Subject: [PATCH] powerpc: Use raw_local_irq_pmu_save/restore() in local_t functions
Date: Fri, 23 Oct 2026 17:55:29 +0200
Message-ID: <20261023155529.3895393-1-jmarchan@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On ppc64 with CONFIG_TRACE_IRQFLAGS enabled, the ring buffer code can
enter in an infinite recursion loop.

The problem occurs because some PowerPC's local_t operations
(local_inc/dec in particular) use powerpc_local_irq_pmu_save/restore()
which call trace_hardirqs_on/off() to generate trace events. This
creates a recursion loop:

  ring_buffer_unlock_commit()
    rb_commit()
      local_inc(&cpu_buffer->entries)
        powerpc_local_irq_pmu_save()
          trace_hardirqs_off()
            trace event => ring_buffer_unlock_commit()
              [INFINITE RECURSION]

Use raw_local_irq_pmu_save/restore() instead of their
powerpc_local_* counterparts.

Fixes: 6cd74d2b61749 ("powerpc/64s: Implement local_t using irq soft masking")
Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 arch/powerpc/include/asm/local.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index ec6ced6d7cedf..4c033526bfb0d 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -32,9 +32,9 @@ static __inline__ void local_##op(long i, local_t *l)			\
 {									\
 	unsigned long flags;						\
 									\
-	powerpc_local_irq_pmu_save(flags);				\
-	l->v c_op i;						\
-	powerpc_local_irq_pmu_restore(flags);				\
+	raw_local_irq_pmu_save(flags);					\
+	l->v c_op i;							\
+	raw_local_irq_pmu_restore(flags);				\
 }
 
 #define LOCAL_OP_RETURN(op, c_op)					\
@@ -43,9 +43,9 @@ static __inline__ long local_##op##_return(long a, local_t *l)		\
 	long t;								\
 	unsigned long flags;						\
 									\
-	powerpc_local_irq_pmu_save(flags);				\
+	raw_local_irq_pmu_save(flags);					\
 	t = (l->v c_op a);						\
-	powerpc_local_irq_pmu_restore(flags);				\
+	raw_local_irq_pmu_restore(flags);				\
 									\
 	return t;							\
 }
@@ -81,11 +81,11 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	long t;
 	unsigned long flags;
 
-	powerpc_local_irq_pmu_save(flags);
+	raw_local_irq_pmu_save(flags);
 	t = l->v;
 	if (t == o)
 		l->v = n;
-	powerpc_local_irq_pmu_restore(flags);
+	raw_local_irq_pmu_restore(flags);
 
 	return t;
 }
@@ -106,10 +106,10 @@ static __inline__ long local_xchg(local_t *l, long n)
 	long t;
 	unsigned long flags;
 
-	powerpc_local_irq_pmu_save(flags);
+	raw_local_irq_pmu_save(flags);
 	t = l->v;
 	l->v = n;
-	powerpc_local_irq_pmu_restore(flags);
+	raw_local_irq_pmu_restore(flags);
 
 	return t;
 }
@@ -128,12 +128,12 @@ static __inline__ bool local_add_unless(local_t *l, long a, long u)
 	unsigned long flags;
 	bool ret = false;
 
-	powerpc_local_irq_pmu_save(flags);
+	raw_local_irq_pmu_save(flags);
 	if (l->v != u) {
 		l->v += a;
 		ret = true;
 	}
-	powerpc_local_irq_pmu_restore(flags);
+	raw_local_irq_pmu_restore(flags);
 
 	return ret;
 }
-- 
2.56.0

