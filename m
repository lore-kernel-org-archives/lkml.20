Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124690;
	b=ewXcnG1U1dOymh6cHR4VtKLxA4hx7ouwwPwffUF/wSW0E7v1nhHnNowU6nfNxXySGanb
	 ECQ1TlQmiAz51Dku7p+lwauK4xrYgha1HiAEyyPYm5dWEp25jUK6I+Er97091qHxnQGE0
	 OPvHnPA9yX5pu7SOnJcr2IJcGwWD0HH1CD6cnkdOuqbzAWs3oUszU4f51dm2bI1h1CUKg
	 iLLsk6eRzDNXa3XgGoOG2OnepdJTM1SR1xz4pTYYKmFG/W3ncs14UNNswQ7paccyIT/g3
	 4nvR5KCcd/r7QZBWZaFg1Jesqdooqpp8282bPGUklK8m/Kgqc/qqiw0j/XOBM/Y3yXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgeza4WC3yHtTC4XeH+C9X3JS6p9k1oxyKbAx3haHms=;
	b=dhSl57bqCTH0eSy+oxHg2S2QR4YBYG2rBJAD6h2ok8K9bW/Qw2w6J2JrcEpXWbFky1Mq
	 R1+zpLP74bKJkuFVGjYirt65rSFGHDEIc5Qmmhc30wnQMpeBt+AHCKWnQX3QZUcKX3Mam
	 ACpTcvxPxFNUbCqWhP1RrjusB9vcfvKW0dDrje37pMNGml8bFrefk4Zk4ckB7AuEAPm64
	 KAjLV7m48/DLZEXyHkIYKxw0Cg/ZdyaX+iSGWTSghRNAdFoKHM3EaBBVTYE5122lW+lCI
	 HC3bHKewUZGvXlLNisrVkxoFF9NH58x2zA0KfqJkTlurdIALYPtvCRi+ON+rj4dc1yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qad3ATKw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84BA606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qad3ATKw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36ff9c9da34so437251eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124689; x=1794729489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgeza4WC3yHtTC4XeH+C9X3JS6p9k1oxyKbAx3haHms=;
        b=Qad3ATKwCXvJqdKNKnyFzWipniErv7sF3Cj4lCeNbrLPQELU2/qlY30jns4PKlrg2+
         PzaN7lelPiLTttcy/QXqcvQGuXc9EXKIWbEcVsOWOjC9ffJ//nCGUZjsMQeYLRsTYCUU
         lHOjKftASDA8jeg4kQ20vhtBFYHqghroIOS1FI7IVV9blTjR3bZIWD3vUOY0rutk86Vi
         lVlTAFcIAgyIdJPxOnVKcF5Q4d2T3Kyjbe5SwsfvWvvoJ8VZQzDAtLvuTpzVXwJ2Lifw
         +pM49GfBcyKTj4z0ZcPtYNtZ5tMpiBHkNKtFbvLp5CYBMbFxkwoxgPz9jrKxdfPniV3z
         x9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124689; x=1794729489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgeza4WC3yHtTC4XeH+C9X3JS6p9k1oxyKbAx3haHms=;
        b=EI74G0mw4r5nSJ1/XuKvsmNGj5Qj9JGBiFH9Sw6RP4BSQO9UsZptZIk15XDn/Dj2lj
         uR9R6lv77HaiMgi/uzJx4xtSHpGg85Ssp3t29Vs0xmhDcXAMo8lIaphw2czHVdOrB1ml
         iqp33ZfFEIdxuUlxSYUqqIkkGObEnZ/gY4RsNoXcTly/84ca3zUE4XemL0fz100je1rx
         bPFJHhlILNWHbUhJLiMVrHkyYcZSlofZMSeN5eklOzLigc7EcSv/Bgv+aNorlFVlv+ZJ
         Bt2Pn4y8KQUfr3jf/FB3XR6RiUL/iynErNFYlCJxuJtcJgEvRKZ1NvUO/HYLbFAItaO7
         jAgw==
X-Forwarded-Encrypted: i=1; AL+hErE3nrXU5TqYvNq/687Ga9vycLuVQuUvCpDkw7risIU7ACLA3bjIq6kz/kNRHiXmv8QTklXDRMBMUQeIQqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aY/AKm7Uqnj2E3OCvBoqU4u/KCuuizdNSMA1Gzk2qKgLv1SCI
	PTBILmB7YkuXify0PA2rHkkAoS+TeROpc8Tx22sr/xfLLjex1bqEykNd
X-Gm-Gg: AYBFou1zlmB7PiyZvIK9gc/xrS5i3BnvNDYVXBV/UE0DyMdR6sVBsrjFFNUs1kd0K1k
	dTVTxr4mvTUjWsC/J/cg2QWWf13vOCC7HLexAfD844bM/5sNKUG55IPfutWxSMHv0S8Jnyb8qRX
	hA3KcUDourJWfcmYU8bFpOSdeVMJgHB/iFPHL1tvTQP/502DfmoPAkRUr376B12t7i2Zs5DzxXs
	sIYPZpQF8OHbioAjLVScb8ixfWegPgBU4EejDsMCfIH0oDlHCemYL18DPtFDB8n4BQdC+EixjW5
	xLCztKcu/KST+/l4gHthmaEpzyqDrWK7j7FDJCmZ+CqudxEgIp1I0LhBpiWSWXHGtRVDfMIG/0z
	Ox4y7dTYB0HxYjOlkm6FXvvwT6Gy3QCQQ6CE+XxL0U8vkWCT040rBFDqjC73UoNuvi27O6k+Ks0
	W6+AmpxVI5SYCHreZ1EHAnkhMjgjQjdAe3ThVVY8vHD6nfmQh5lSjD80/2/cOz4FnoRT0aKo16H
	u7pwyQIwokI4QfDiVPobThjD4BsuMx8fRPr7810VhWQnvkjP+x0a+tHC4rpYLwbhmYGJNprPufF
	2GVDmrZmP96+7jn2lNfGpGq0t6z6IfY7FNdW+PWcnPr8BekqYF7ldhHq5npOxbnuTi8mPZnCRyx
	3YeKm1P560bO+Tv0mq1/EMR1sRg==
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr2190444eec.23.1794124688659;
        Sat, 07 Nov 2026 23:58:08 -0800 (PST)
Received: from localhost.localdomain ([2406:b400:d4:acc8:a024:59b8:c312:eefd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm3866093eec.20.2026.11.07.23.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:58:08 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	rostedt@goodmis.org,
	julianbraha@gmail.com,
	julia.lawall@inria.fr
Subject: [PATCH v4] drm/xe: Remove unused xe_vm_restart and xe_vma_flush tracepoints
Date: Sun,  8 Nov 2026 13:23:35 +0530
Message-ID: <20261108075335.13248-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261108060418.4554-1-sowmyatorra@gmail.com>
References: <20261108060418.4554-1-sowmyatorra@gmail.com>
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

Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
binds") removed the calls to trace_xe_vm_restart() and
trace_xe_vma_flush(), but left both event definitions behind.

Remove the unused definitions from xe_trace_bo.h to avoid
generating code and data for events with no remaining callers.

With the tested x86-64 configuration, size reports a reduction of
888 bytes in xe_trace_bo.o, from 20262 to 19374 bytes: 296 bytes
in text and 592 bytes in data.

Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
Changes in v4:
- Combine the xe_vm_restart and xe_vma_flush removals as requested
  by Steven. This replaces the separate patches for these events.
- Report the measured combined object-size reduction.

Changes in v3:
- Add the Fixes tag.

Changes in v2:
- Document the measured object-size reduction.

 drivers/gpu/drm/xe/xe_trace_bo.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..a6802f6d3a01 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -115,11 +115,6 @@ DECLARE_EVENT_CLASS(xe_vma,
 			      __entry->end, __entry->ptr)
 )
 
-DEFINE_EVENT(xe_vma, xe_vma_flush,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_pagefault,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
@@ -228,11 +223,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
 	     TP_ARGS(vm)
 );
 
-DEFINE_EVENT(xe_vm, xe_vm_restart,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
 DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
-- 
2.47.3

