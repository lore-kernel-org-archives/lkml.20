Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3F360EF9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557365; cv=none; b=eVg4/G0h9/B9jjco7bwNRwHm2J86lZ050PxL9ShU2IlqNvmsuysd0Co+WCHohLx0flw/BAUWRlHlYYTte6VKNuq1kVSFW4rgs2bDFZ8/fYjqErUGPVvUVh36lZ4rKwOLUsy19wTnPS1Gxann8/oDIrfaFM/tAfDmvyF0Y2sDYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557365; c=relaxed/simple;
	bh=6Rgk2U5Gcs1jlm68s+8TwYLZMH+uGB+n3+xZdFJefhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upqGbnCcUhwigjDrHdhbb15/TebV50rRsxJBWb/2yxuoFRs4sRkVnd84XA95Mq59ufo2zYY7YIy3y5xEfzgtR9p1JkjXtY5/LIAr/ujbFzbgl29LFG8l1u3+ZTjIsbv5+umhHSRRyg90sgLphYWZMbQQYnvsl1MW4zsBYEFRWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owIO1w5q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owIO1w5q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so13582745e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557362; x=1791162162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA1k+qnNIUMMLlr4nygQrkXcpGTQtW64tuBD4+P/LiQ=;
        b=owIO1w5qOXsaNV7Oc9HfFzG84TRS0mnLvOGIyaEguHKffBQl2IAxuOvi/nGc4kcDZh
         8L7n7WQ5StKLTMJDxnS950ANwoPL7r/aN7D4Dj0r3MBtzpfV8hl+sTmsHR5iupKMjept
         OO/6RZYiO/+ryrsxU4N9wneZw9WsMf6xFCL9znS+CsnVHYCTMAg8YdvpVxdyD1xUWddd
         CFm606FYR96+kCsoF9arCEYFopxsaSyqFGkDFL6ajuAjNwnJCVFRwwdehpmG1pXRQIUm
         BMbFdyIfkvXhb2wT4TMPxoWA23pI2awG2NoTnb05ck0lWfUaj0I9CMQSer5W+D/TGKqD
         prhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557362; x=1791162162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA1k+qnNIUMMLlr4nygQrkXcpGTQtW64tuBD4+P/LiQ=;
        b=qqq+1ltxJWsYYHRKMOF9La8Vt3pIHJTIzg1TId1Wh033ZF3317ZZDp2sddMRepiue9
         5wOZm7ypkselBQeIjzb0ietfx1ObkeTbOjMSqnxuDfr1M7NjhRqNAcw+RdVzXORBXs1p
         RvA4Bq40tIYzZhmdJEiRPgVCjzqLN2kgL+RVNloZ6wUIFjy3w5Yg40EYLJcbxu+dJVzA
         zZ5RaCPn38eom2fNmtKo+rI1BLksjlMuyGOCjjQusBTquGBS7W23uai6A6O12kpmgIve
         n80m6x41+D5QqmT9J0UmkodzLpcy04ZO1rEKcoF+/rtmd5RsL09kmg9ic1hMsEVx2/RY
         Iosw==
X-Forwarded-Encrypted: i=1; AKwUvBw0t4THt4lFin3GUNnaU6MbhWPDHa3G8kwYrLjtIp+04C5P33ToocXSVpbmQ2Um5d4GSUnoxQvB/bIAnRY=@vger.kernel.org
X-Gm-Message-State: AFuF++kTyf/lr0ACa0AS4kmvTfqkpOlBTMgCl+5cJEsaqGLtpyK0fcft
	qDEtuad10wUhRt653YuUz6Pq/nCkO5fqRjoSf877qnDRx2MfA9m678wO
X-Gm-Gg: AYBFou1Xl7yo1LQ+mdvnwmy4Rd7lfdo6et/TSTuaRG6L4AiMB+kmjZy6V62JHAzARvX
	13F9azRjzUpagFkReW/elrPLfPBEUxrWayDKBjMZu3lCU1bSRwvjUComqwnwB9HKaTXEbC8OUsd
	qK8kSxid+nUE1VK7+vifXBl1lP9xxIRuzqhnKG35echBy10cRJP1xc/DTX2Gw2vtDzzCl5/R31P
	uQUqkyiwaNoHGGVjxsIeN72jBKtEdNe2l5Mfwj7VSkYM6N/pgvKMXRkUjAXd3XySYhr5AtGDp9Q
	z8EAQyWja4uyBXxvKUVPoXFYtAvcDMerluaCamYqEl5dteUG5rwzg7bKZa78E1WL4DATnHdKXQk
	vCfdroJb1Xgx8E/PRN6qJ1pQAA2UmPtYF+XNnuPBdVUf0hgb3wO1z38dlp5ZqGbcYZwjktoFtG6
	wR3YlhMlmQ5xGIWIfFEmrwZ6zF5ernaqronJk37TdprOfBBQJIOahBVULl2nqBwVtSPPDIe01xL
	Tx50MzIz+XwIZ2OFHTY7PoZtu4FIsTab+4D8+mtt9hD3yqaV+yi5p/QTDq4GfIlztgssDUCS4hc
	It9gZBBFLMz8+vxh0EJkoI4mRo+gpBlN8Tz2DdaZhx96l0s81L4=
X-Received: by 2002:a05:600c:3b1b:b0:49f:e4d4:dd70 with SMTP id 5b1f17b1804b1-49fe6705bd7mr211875075e9.31.1790557362024;
        Sun, 27 Sep 2026 18:02:42 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm144207825e9.5.2026.09.27.18.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:02:41 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] perf symbol: Shrink the demangled Rust buffer to fit
Date: Mon, 28 Sep 2026 02:02:26 +0100
Message-ID: <20260928010227.1903673-5-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928010227.1903673-1-michalpl2003@gmail.com>
References: <20260928010227.1903673-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer a demangled Rust name is returned in is sized to whatever
attempt succeeded, which is usually larger than the string it holds.
Shrink it to the string's exact length before returning it.

Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/util/symbol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 1a52bc2980a0..858a14a91f79 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2772,8 +2772,10 @@ char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 				break;
 			demangled = tmp;
 			if (rust_demangle_display_demangle(&rust_demangle, demangled, buf_len,
-							   /*alternate=*/true) == OverflowOk)
-				return demangled;
+							   /*alternate=*/true) == OverflowOk) {
+				tmp = realloc(demangled, strlen(demangled) + 1);
+				return tmp ?: demangled;
+			}
 		}
 		/* Failure to grow output buffer or buffer exceeded sensible bounds. */
 		free(demangled);
-- 
2.43.0

