Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3E14E73CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609203; cv=none; b=fMy2+NUwA9pvKajcfrdQXe4uFFm/B7zwRPfr6zEFph0+h/cOVbiZyT+cwxwiacApGC/g6muVWVZYLVdM2LSom4hbcCe4mLDaizmRWgqb+2HPB0Z9vJ4hH9TK25LhKGkps8GildLHU3lwi3dOyccnd7bg9Ptn9tgxw3y8BfDZSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609203; c=relaxed/simple;
	bh=YUd7BK0ws0/ktUKy73cne940m91GSfX2WZjyprS92lU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNM2Aa3dO2zAWp5Y85K1F8FlSf8tgZ0FHtGtA3Zbkp9pd65cxFpy1uCyocz/bXikgCPUTU4QnXACr3P+SXCOyl2+ytBlKAvQScuWcLKFCBgR7WengPpI1xyszGpST+oOTgjAio9FHlCxJU0PRfXGqOHopPULH4tpTlSU08J+0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyeoA3kZ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyeoA3kZ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso2619834e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609200; x=1791214000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zFpLqG/hmtB6W9VTlNsIylmOlLpoN7arQbytoDPb1U=;
        b=YyeoA3kZW0awuZw+8N8oSeYBop+8P7nF4AoJBidIFdBl4Ds4n8U3mZy00mMe+pwdVw
         qVy+nvSIh2mDmS12XHeWquk6A6XgCkpYghlv1xgAtyp/NHjrGxzG4HLhkvIWcory8cDQ
         71WrmRG/zBd8a0QMi2y5uwPxaBcaLS/zI4BaIAARVYH8Njmj71d8BUsxiyJ1BgJugCBx
         vVoLONo3AnJ59EJWDkSHXtHQKcoBIz4F+cRU2gqYqipR7/uPte4m6DuOX7c6p3PJhOXt
         kUg641wkdJ5LLXgX+tJlJVEaEP/R7J5wLUXq8CHOsFUq+Vrcaih0wj4fzDq41THeERpW
         PgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609200; x=1791214000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zFpLqG/hmtB6W9VTlNsIylmOlLpoN7arQbytoDPb1U=;
        b=qFSYmMTN3qn7aqyQDf+8kNI+8h5I8FUtaXXiG9Lqe5bLCKxt3I9zz3L5dY995mKkQ6
         F3T9YrpJHahW0aN3AGvjgD9GrzlqjyJkEfMvu4ECvBp2gVQ9pLHMv6SO5IDdZvexkCgV
         152r0Z5wYQrfl4Od0MUn8qMYHOzQWpdifF835GS1f0guiUJhLOq5KrnryvlHm8Ib3pZ9
         wz6exJZU2KSbNQu4eEirJPps4t1aF3yaaTNsBOnmXSgvY5WZrcfiiO1jdmPU8qt9nZwU
         37JBQ8wWrZaxgHf4N+s36YZD1q967vhg0y1LH9uFonJq9FGqEjkmSVpsKzt3sfICXBal
         nogw==
X-Gm-Message-State: AFq9FYIZut0AHny2zC9DlVCh02jG+sHlv+UAkUIMM1s+L9rp/LuSWk5t
	nyJdC50ZrmK1otAE107XUtcO+A5yKp7I8ZjciRZ5Q+UI8EL4eTtYm4aVn/QivRcnBvoW+U9t
X-Gm-Gg: AYBFou0lttclqMX1ZmYH1KGfxsbDS6B4Pzt6l22+Q9U6TI7Z4byTCLsF0wwVyrBze4r
	GzYcR5WaqxV/rbyWw+MMJiKHCcg3MHIcqPGKRcih2j418cQSc3ho6mIv4ORO/8jYYCbScwGRaDM
	lrjmmQqvg5l+rt7dx0SyNqVIYrr//xOwZogfV2hD1p4QjzKDHp13HFYGqWeV9cr4eDMCK9O3TyP
	HZWt+VazvZC7qSTs5WJwC9TqKJ2VT9U7il84MRXrjwfDIs3T05iiJ/X2TsoKKMtswuxY9dh8SEk
	1wXzkS6pSr17zzIXauiDGmDIsG7tatZu3eRXRbmN7Bm54fM+BoCcpYYDtoe5VC4FU9ZHXGW/XOG
	UBzIkwjW/5sGINN/bdKxg2nklJQXSXkT5Go8yRPx/21i6+TIiHag4yScpG3YrZS26ga+Xk091AK
	06pJjBZVgigqWGrKdC2i6dwf4CzDWy6nTXKEVT0p+W6gSXL2Lhy2WCw4nElNBenwkq+C8CK24VU
	X76jArmIrhDKT1L7xO0TRPfRQZYseGV6RVP
X-Received: by 2002:a05:6512:3d12:b0:5aa:5ef9:a33 with SMTP id 2adb3069b0e04-5b8e6d99163mr3466903e87.25.1790609199795;
        Mon, 28 Sep 2026 08:26:39 -0700 (PDT)
Received: from sc-mac-012.corp.sbercloud.ru ([188.191.29.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826faf3sm638194e87.9.2026.09.28.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:26:39 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] tracing: Fix ignored return value of resize_buffer_duplicate_size()
Date: Mon, 28 Sep 2026 18:26:32 +0300
Message-ID: <20260928152634.4354-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When tr->allocated_snapshot is true, resize_buffer_duplicate_size() is
called to update the snapshot buffer size. However, its return value was
not checked. In case of a failed resize this could lead next snapshot
being incomplete.

Add resize_buffer_duplicate_size() result check and return error if
resize fails.

Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 180e4e390978 ("tracing: Add snapshot refcount")
Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
 kernel/trace/trace_snapshot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_snapshot.c b/kernel/trace/trace_snapshot.c
index 07b43c9863a2..4731ef7325a5 100644
--- a/kernel/trace/trace_snapshot.c
+++ b/kernel/trace/trace_snapshot.c
@@ -675,9 +675,12 @@ tracing_snapshot_write(struct file *filp, const char __user *ubuf, size_t cnt,
 		if (iter->cpu_file != RING_BUFFER_ALL_CPUS)
 			return -EINVAL;
 #endif
-		if (tr->allocated_snapshot)
+		if (tr->allocated_snapshot) {
 			ret = resize_buffer_duplicate_size(&tr->snapshot_buffer,
 					&tr->array_buffer, iter->cpu_file);
+			if (ret < 0)
+				return ret;
+		}
 
 		ret = tracing_arm_snapshot_locked(tr);
 		if (ret)
-- 
2.54.0

