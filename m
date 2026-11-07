Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049677;
	b=byJlFbexzQCSwG+W1/L4wwj+xKSdy+9wLPk2FqFpzUWfcPAWg7afDzPUsx2+q4Aq5N2g
	 2t3Jv2wD+3TJPtB3MALl1r2ArPuSsIVwAAcSQgTWvA04T2qzJjeGhrJz0OPaNn3F7jA1f
	 s5QPCmcNZnjNEuf8X1KI8TBRKsuNquItS3ZHPUExff/IwIdJk9gnVswA8/GClAZbHj6QP
	 Xyn//tnFIZAQeBR+lbtDiV3FnSUwEHOhsf0pmKxoooqfZl9ot7OdG2PS3hnp1M4bFBG0i
	 LuiSPose5EHH64Bk9YWCMkrS5MfUb2gkTW3gDb1toRjOaPyvaX+2Nh3h53FghS+zz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iazXt1ue45sdT0Gt6vlrMv52pc1Nk4AJvSoapTr3fo8=;
	b=OHijxQl4Ah/33SRuHM1ZghZQR28Is/KHoetIBalqRLfIPOLlC9MBuoZjJ0g/YEWKm9bR
	 u2Sh6zmmlwyq7j/Smwxd1GO/PXQFqm3l0Sezd00AmKWVByY3yjZm+fEv8gkKr2vNymNiZ
	 CAbxMLVg8G8JloLZE6cU0dRVUmAVJU+EHqFPU2jDmLB2a5Guld8BnmtVhw7KhjjDAC9+p
	 5hVQPmKBJWzChZ1pR0VvaLvPtjnytQqznfdWMteOD1WyhKJN6GLfyIokBr9fI/bfxa3nZ
	 UvBNvyZF212McSa2y0iaHMiJE7ykzb9e7FiGUZP3l3zKglEz99GIgDRMElB8grb0gnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qEZl/bdc";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC2606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDC2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEZl/bdc
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so821109a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049676; x=1794654476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iazXt1ue45sdT0Gt6vlrMv52pc1Nk4AJvSoapTr3fo8=;
        b=qEZl/bdcxE8GCw8c7ClrZpmQhVEMFSEfQSIy6aqxy4a16P21FtQRRFalHK4OVhH7Nd
         zDFw99hGs3FIMKOHqMK2vYwdX1Nn+sZN9eOAki5cprOkzfHXy/Smnwuigh6dXnMX+bAV
         mv7OAQFjr4yd1PypfnitcKpAx3YiUAcxeSBFG+EKjtfhE8JPIdL4B4NMm/8iaxa4L6C7
         cm3/F3krW/Cxh7KJorkV7jUDeYM1c6oF7ESs1QDrehyQKemwMi2b8mI6YmESxqhGv8bd
         4MpYlpZv0jIQbOcp0VdfHgodPQDdQ0m58kKD+C5KvyhL/+0rvlLmjJ/zUGCd3Fn9jLGm
         fiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049676; x=1794654476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iazXt1ue45sdT0Gt6vlrMv52pc1Nk4AJvSoapTr3fo8=;
        b=YM12KpU7J1OnHksEBtF0gquT+qe0cT2iviv0oQTN6H3v0HY0y2gwR49Xs+iOwM3zGa
         oRXy72/IQLGnA9/3wp1zZRoSjyTd0NJW0n9KYhelWIuEyZnHIl4jmoHSpBIW/SHGCoLN
         qjH69WMlV4o41ZU1xNL1Z1Hluo89sO/s5q9TKv2eYrsRJuNKsFwpap2mfj/Rz7NmS2Kf
         WLRSIdI9DIXifVTQepMkzysMAksQx3/Xa5BROasuPsULBjZNLsTf+/714/ewnkvgIRIj
         FRLqaUv/cPvS70BqAQwPdFRTOMYoiNQyEeFy6vgMJroEIH/94tez9rC5pxARu3SAqUbM
         Mlvw==
X-Forwarded-Encrypted: i=1; AL+hErE6nsywrQYNnajf+SQcYoywa7Vxdfwz1ZiVVfAUslKNgeriGLHGa4EcDGJexhj34vbwEoZdJMNbGHzrPAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JkQhfzkVQgjO6YmdT8OLimIptiZNYHtT8XMC5ZORpZUKv6nw6
	MD8FmTHrEaGxMJYmyzRnXx3mmFK3MaP5YIfjV1pKWfKg87Wl66Cdf+WW
X-Gm-Gg: AYBFou3cI+dcy18Pzt0oE8TCpXz7Wr3WVO1GE5sOQnKtGeBUUvHPEVncu+tyDViJPBa
	zVDv4ueuabWbnu9L7xdTc2nacR6Q3dHzct7Nro6apRn9LzlQo8aBID45UGGXTyzcGnBPzXTFEBq
	nWjojukXHmwAljtl1G7nkieEElHTAyp1uhA2M2OdF5oPL18L6pIrCSDoIVr0RRA+3YOaeOY60sJ
	f38cIEsuSVUhqFfSqjyM4giY+ljaM4hgnoYWg2fLGFM4WnnkSFmx2tuf3G9w94gjxEPbjC4bqQt
	GUk9288W5bEcEpspSWfhnk6kSKcMvXgn32Di5azbZUKp7m4kackrlkM8QFXDbIgzHeEmNmH/VNp
	5dwcJ3xS+zCb7SLgXYQHdDN3fOHZSA1UCKY1JGAT1nkjE9hScN6hIwpQSSm3AGGskeUy+pWeotS
	A4Cnbfdn8sjmzSqZ75q99lJMCzeYdJ2SYjIlKbIcYO98bxvl2c6Juh/lMBrdjkHFGm366Jgb7HE
	C1rbjQFGHFXhbeZrn4s8xsIXxsmwcWgYply1JFAscVoknBtfuPAv9WybVUV8rqYhzA88d6Mr0A0
	UQ1Smp/nZedup033mVygmX6bK7SNVKm1ktwZSR26BMIp5B3dSDwb/cc7MEj14ThyaN0WG14=
X-Received: by 2002:a17:90b:2f4c:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b0db5f176bmr5265142a91.6.1794049676200;
        Sat, 07 Nov 2026 03:07:56 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:6fb0:6db0:221b:f543])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057ef145sm2997336a91.6.2026.11.07.03.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:07:54 -0800 (PST)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangbo56@xiaomi.com
Subject: [PATCH] tracing: Wait for marker writers when copy_trace_marker is cleared
Date: Sat,  7 Nov 2026 19:07:22 +0800
Message-Id: <20261107110722.1241413-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
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

Clearing copy_trace_marker removes the instance from marker_copies
without waiting for trace_marker writers still walking the list. If the
option is set again right away, a writer on that entry can revisit
instances and write the same marker twice.

Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 kernel/trace/trace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 18710c190c92..b0357f1b5a69 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4016,7 +4016,9 @@ int set_tracer_flag(struct trace_array *tr, u64 mask, int enabled)
 		break;
 
 	case TRACE_ITER(COPY_MARKER):
-		update_marker_trace(tr, enabled);
+		/* Writers of the top level trace_marker may still be on this instance */
+		if (update_marker_trace(tr, enabled) && !enabled)
+			synchronize_rcu();
 		/* update_marker_trace updates the tr->trace_flags */
 		return 0;
 	}

base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
-- 
2.34.1

