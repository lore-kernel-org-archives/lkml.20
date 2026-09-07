Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076483F104D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752996; cv=none; b=JfMNDZ9hSP9L6HVIy4AXae2DBqWx9n/i9uhcfK0ZtSTo06e+7C+jUQZCo+mRS8WEKnEQmtF9xtu+RXJfFEAphat5p7XlJuJL5HhD+LLaPVkBBZx3GyY7o3PPp1ZQ87u7A4kA9fC7wu3V5X5Lv+hfeRwBAXK8QmWMvsRrWIslcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752996; c=relaxed/simple;
	bh=nSW4NsKwkvH7BmiQJChN9fC/TyPeSFa/im/kFV67DP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjEIDl/KlIm648IwV2GYySCGvHKUrHFh+rKPpqybVqtH6ePbLPpmghkXmHOdhoIfZfxZ07ChGMWd0cFZb/UMrerN00q2+GAFDAB5BVJxmdl2HTesJiYlXu+DKxGp0C0/7078Q3rdDhW19ulPX9eQZw91fp9sRzX4OM14cZDRSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9aQCCcF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9aQCCcF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso17629825ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788752994; x=1789357794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7q+VNGVNrcoYTCPMYgbT4Asobyd71i+FBLenDRfuM4=;
        b=Q9aQCCcFGlPwmuB8fhNa3mHslByZ0vPEnA2fsxx3YI2lCW4rK2ZC+iNUkorBsi3y03
         iAXc4Vy1p6Y8vZTeEkmP76U2fHHdSboHduUNVQvYGOGz9YbmU+npfSQks/z2+1cdzBpF
         NUJFTCjdRd61TdFpoCPhY1GptVu2SB9H2Up6FXCwdHQV61P7BaOT/u+3gOo94c7BUg+D
         u1E9sGpC4IhufRK/Di0axjGrK7Hu9tRua0pGm+1d41U4xRSjnWE+vA5+YYt32R152IRu
         YAHnhRFnM0xwLNqQ3oeQHFl3VxJI1zxQdeN52fX9Sy7NvGZnjN5H30YFWtf+Tli+yB7Q
         c5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788752994; x=1789357794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7q+VNGVNrcoYTCPMYgbT4Asobyd71i+FBLenDRfuM4=;
        b=H5cHsLZNiW1BB2aCpOBmJZx13gt7QmlYvcv14KfFXxox/j919dMsHW5Y6X5nutvuFr
         wduAb9rSj/5SYZkrkgNtTYB87biFtTfzLlhQgTQjK5pNhsskWx6LTEBs9JfmmUady684
         sEwyqq6x9OSccH3D3EksQRMHOTClamBDNnSN/ny6Mm8r6RidXXdWeUltcZ2FGUGPYZRB
         lcf287br4RZAPIjU6MvX59Al/5CWPcXLfwZGUHGaA2RdX/BEb6tV+p+6yi/O7wOjdK0C
         up0iwrMQLgrKko5nyQENtRhJ5rqS/AEIlz7MKyg6cfHWTDdgpHkevL8fb651f3MJq8fu
         5VhA==
X-Forwarded-Encrypted: i=1; AKwUvBzXE5b3bHrMgGIawtdBM+/6kQZCiSYJ8oflYZePk3GhP/jaRAe3tB9pL2+EPtX/jCiE9Gjsx/eh1/t/OzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kD0KIHZxv4WwKQpzQPNFBA0ZTZCF2r2n1eGQaA/8O+GEcV8EPO
	7hgQCYwhO6y7k9PEZyeTIHSUH7eD3qXB3rqdbNUpkf1YjvVLR/+hsdM=
X-Gm-Gg: AYBFou1reZsCM735i1tb0bkNKP55vHTyihpDyEBAHJaJ5JuyuqbcXcKaGZC/CfyZ2K8
	aUEktZauu3oj3bizqNRUaxwG5iROrR2EipVVP/8K/snCqz+xC8fbktKKxMZWW7ISlbyOdIBi+we
	bxODUHwyRGWKVYWJW40pQS5OgrsUPuTg70J29WdqrJaZ6La/THiPF1jO2e7mPZP1md8mpNKkvdg
	10NhvOQWbHBYyM2EiNCEmhpCTcvXQyHEgc5YDdExqWCvTGECbii2C/tJ8OQ/4yO2gJ9VVvenvbp
	siICcyYaW2tB0chvu3+8EUoUBGoNrze6LIkYqEw3rFr+tUoMTOCW64OTpmELpw5MW2DmXu1Ov5e
	ePX+SADaGOcvhi2YLriyIRtGphJkKdm5dEYm3Nse5uqtZWNJwy9GhXzuMXuqfNKc6OTgM2YCd0O
	OxhhAlUBjk5FxmVO2audMXv7hXnffGmFYMn8XFkd/zg/Fj7kz6NAqTQnupYpZ2zQe9aIog9rQ7V
	zc0pZUZsz8X3GRn
X-Received: by 2002:a17:902:e952:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2db12754d9emr307628815ad.16.1788752994021;
        Sun, 06 Sep 2026 20:49:54 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm37437475ad.80.2026.09.06.20.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:49:53 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: hist: free the field rejected for a bad modifier
Date: Mon,  7 Sep 2026 12:49:48 +0900
Message-ID: <20260907034948.240387-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing a hist trigger whose value or variable carries a modifier that is
not allowed there leaks the fields that were built for it.

__create_val_field() takes the field from parse_expr() and stores it in
hist_data->fields[] only after the modifier checks have run:

	hist_field = parse_expr(hist_data, file, field_str, flags, var_name,
				&n_subexprs);
	...
	if (hist_field->flags & HIST_FIELD_FL_VAR) {
		if (hist_field->flags & (...))
			goto err;
	} else {
		if (hist_field->flags & (...))
			goto err;
	}

	hist_data->fields[val_idx] = hist_field;

Both checks jump past that store, and the err label returns without
freeing anything. The error unwinds to create_hist_data(), which calls
destroy_hist_data() -> destroy_hist_fields(), and that reaches a field
only by walking fields[]. A field that never got there is unreachable.

commit e0213434fe3e ("tracing: Do not let histogram values have some
modifiers") set ret to -EINVAL and fell through to the store, which left
the field owned by fields[] and freed along with the rest of hist_data.
Splitting the check into a value case and a variable case replaced that
fall-through with a goto that skips it.

With CONFIG_DEBUG_KMEMLEAK, 200 writes of

  # echo 'hist:keys=prev_pid:vals=next_pid.log2' > \
	 events/sched/sched_switch/trigger

each correctly rejected with -EINVAL, leave 332 unreferenced objects
(63744 bytes) reported at create_hist_field(); 200 install and remove
cycles of a valid trigger leave none. A '.log2' field is two
allocations, since create_hist_field() puts the plain field in
operands[0] of the log2 field, and both are reported.

Use destroy_hist_field() rather than __destroy_hist_field() so that
operands[0] is freed as well. It returns early for HIST_FIELD_FL_VAR_REF,
which is what an operand owned by hist_data->var_refs[] needs; the
rejected field itself is never a var ref, because a var ref never carries
a modifier flag.

Fixes: e30fbc618e97 ("tracing/histograms: Allow variables to have some modifiers")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Tested under QEMU x86_64 on 1fc5a74b108f, both kernels built from the
same config:

  vals=next_pid.log2, 200 writes   332 objects / 63744 bytes -> 0
  x=next_pid.log2,    200 writes   471 objects / 61544 bytes -> 0
  valid trigger, 200 install/remove  0 -> 0

All 400 writes are still rejected with -EINVAL after the change. A
CONFIG_KASAN build reports nothing on the same runs. tools/testing/
selftests/ftrace trigger tests are unchanged: 32 pass, 3 fail, 2
unresolved before and after, with the failures also present on an
unpatched kernel.

 kernel/trace/trace_events_hist.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 963e0d6b61fd..b65d79d6e132 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -4331,6 +4331,7 @@ static int __create_val_field(struct hist_trigger_data *hist_data,
 	return ret;
  err:
 	hist_err(file->tr, HIST_ERR_BAD_FIELD_MODIFIER, errpos(field_str));
+	destroy_hist_field(hist_field, 0);
 	return -EINVAL;
 }
 
-- 
2.53.0

