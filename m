Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621761;
	b=BVTmLTLGRSVndAxFSgkL3h5e5IzXYaFoYqWBbFGBP+diPokmJfcjw+IeLwOMI0KuQcyi
	 OtH1NMc+ZANnzKTXsrGd4K/DxPO0vzvNUvvNw82jkbKDsQqzqE6gvyqCqW44SVZHyaoSI
	 nr0bvs4V32YWVEldNWr/TYrMGWJKNH9HpDYZBifISg5TU/IRkl09Ee8aDFV/i3wE60OsV
	 isDXD8aCGsC3gpIBt4NnfyM3YTDAuDBuhQUkv6TBYdJkRMCOsEDnKv43i/gdielE651OF
	 FV7/nM6Um4DXY9iJ5HlVqv4xWfyztaR/bHLMkA3JNx8AFZIAGjr7Umcc48OIn6e5cVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
	b=YPlnmyUHEFB539J3LCooTuyYMNj9pNaR5DeR/9n8fU4LlWgynHUHvDD1/bjqkEq77Gj1
	 yasg7sb5sChS9mf6duefa5KBbYi5cBUG2E3oMkDNaW12zN1x3t3wxEMQI5YqSxgUz/GBX
	 hloAcxx7mXOBDo4hyl5/HpJ0NJvociywCbbxOYJDDzKPrrEew8L1O2ZKoasfFrr43okaW
	 Rv5dPMh0QYrDal8MoTIGKVoGMKr3FCmBD89ZwSAijtKgXxZ0XKoFvhhIBREn20fNZTgoE
	 il6wSvvi7H79RRCVdg23R4Dz3Y0qbO/xXVNUYMAuz0CJU2CdQ+jk/uiAkGtgazH8I+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v+k6p67j;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4760A383F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A4760A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v+k6p67j
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so31221065e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621759; x=1794226559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=v+k6p67jlSCCtAFLTJHEr/fOP9jUFtDJoZqJvF4UwB4P7qpSBHVS3eUZvY9DppleiP
         ncB/xEDSRl37A0F6ns4DDzlZP6inyg5KWPo8e6ykcJk30dPKR5DnnEUgn0WrLZc/xAnd
         N0QvD6LwpBeF+HSJiazvoTsSciBmIy/nKEFxLq+4ijHyKjQoW3xxnAyo8OtnpRiwzQa1
         oRTg0fI69BbAXuYXlQdTgcLOBvUbjpBfw7v2UmLtEse94ConR3apsuQwBAcl+6TeEJYZ
         jH0MHdU4hFz/923Fuha1P6EBUsNwFW8Y6YklDiL3BPlWBon+mOjM5oOm6WDpzRPsucsD
         mESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621759; x=1794226559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=yE2e/1tMyNs+Ad346Zzx8EP+EiEkmjYHFVv0hvc36T43NVAz6QBBOMqWocREXWjgMn
         TFxMt3BiVXb20t719oeUSrA9kSKXIrDzHsa6WQyR83k9cjkqxGBrOY5o4Rs4VZRyjoXj
         7RKVqytiyIyW9udvJ1Z2X66KDNlpNzTFsdJNJFAHrGk4lN1K2N+GQBiYJVTiUzDmmuG7
         Aauj490auGKtC42mxMxbaJQUj/WQtAETc+1xg1+Tp7rcZW4aSZ8Ne9X8hBomDLB8djoU
         camHhrEvood5LFojwbjua+4fspkVasVnSJZqUpVcvC8kSA+Z1jLmrJschsoCNmlghbzI
         813g==
X-Forwarded-Encrypted: i=1; AKwUvBzxWi6dGkfx5MX1N2etcBvQj7DcVMAnomXD/KnJMU2TR9wvDaFx93+m4U06qTIjsOUcQMdpo+6WKALZj6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlU86wnDLzw+egubbRhvvdKLALQINX9Lf8Fth9qEHnBAjBp5bk
	tGqPFoBE5FQKq4ebeCRWqx3cDqA6XK73cr5eWNlk/V52qwRSj2z8BTY00D2lQbTPqfc=
X-Gm-Gg: AYBFou2Xf+iY7P4/nb+aUo+IDN46QsdD7Z7TYGqY/NOu8TAd+aVytSpYKM1R6NnUV8T
	D+crVzfHIR0+pNGagdKIQJNKH7TmlYxjasQ+CcMs+uauT6C3m/QZv0mR19wywtkwRU4yo5hjArV
	K3VXXJhc0hrPraBFPJTctWhrAWpUZb6NMAEWDurx0bwTR8/SZJ064Kcmo4wcM/6XgE00kyrBVF7
	tfoF8ylYhCB5fI4dMmM7Xx8ivRkIahAOvgyrLfsfT/DjId09ojcVI8A7e0bp6KVI4JebqeGp++u
	j3AMov5gbV6x7YPvaBD6SQDUOOO0rLytQ/15pLQwy1CQ0ZSxTIP0nj1SDOFGVOkX0c9OOnh/RGP
	610vixda9q/8bVVSNC13ICFl5wr0C/pr9mbcgjuxICYNsCZ7G5jMFp6N5lfeyZP9mSR2aGT8HTw
	LZAW2VCctVCfjT6aFpMEZ03QnL7TUthecKa1DGbZ15/ZYI7R+FK0oXwBJQxReiPCrxtSm4FjgJf
	gx3zdMEpE3FjSxhRrk86vBqpEW4dnzUk227aamJU5gNNUQhuTk5z0lTHc1UQ5nlEm/RgtaHpkn4
	oydVup+13EB0M0DwF5Fol6o7q7juJ4sj
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr197102405e9.33.1793621759044;
        Mon, 02 Nov 2026 04:15:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:26 +0000
Subject: [PATCH v3 12/18] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-12-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Intel PT has its own wrap search but the same pointer fixup logic as the
generic auxtrace_record__default_find_snapshot(). Replace the duplicate
code with auxtrace_record__snapshot_fixup().

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..ce854209213d 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1150,26 +1150,7 @@ static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
 
 	return 0;
 

-- 
2.43.0

