Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173648;
	b=gF0LvjXyl2iJD4ZjPkc6c+194ZFVLeQjF7w28N5cDOE6BC5b30nUmmSBcM+rC2IeqvaF
	 nXOrYDw1sO4FJkWdqaNbIPW5xcb2vM5ZKx2y95kwkbo6/g7BV67vSy9LlYZVmBIl6kYOk
	 QpPPRt9arkLfOIDRbDciMxuwidqmiL50s8v1DEkN/71z0gYJ6Vfm0anlb9FczKhTIw5wp
	 fCr+q8iVNY7gH2FA9fLa3Z8w+d2/ikjxIx8Dn8VPR2DR8a7G0xVwp38KdA1nADtQVNXLm
	 zC+Bbub7DXhGm7yR99Cr/6l6tm5W5g7NcieB36jEmJmYiE2Xy6W8Kluz5sqHJTf1BvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8idl/HtLxFU4RXc5SRlZ1K4xdbzJi8/5nFcYdaBFYqU=;
	b=YU/JEAuUPvaajIgOAzD6o+SUFSExkzO/oTGGjQeXEEemUc++tXS9ubhMgB2L2yDl4K0+
	 cVE/qi5tX05QdhgekmZCzjsM7bHmCWtZBCtHQ6IIAtU0CNjFi1duVRnX15BA/lpFfIzKz
	 vPKmai8ewnJlDG+zC7vuJN/ScQMVstTciQqghr8Voz/wYhO45pq5ECCbhLx609eUYBPi6
	 MbPMyP2vHajH+uwCWMl26zmunaX5BU/G6snoeUDgjbn2ti5M8Jr5qvifacuY7WNBIqDtr
	 uNP4hAxpmKYw6GUAz7U+/4C/68fqBJpHtV1Tgn/AK6JtX5Ey3lFPO3mpJGLtokiQtLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fvuj5PzM;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B63606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fvuj5PzM
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so394799a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173648; x=1793778448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8idl/HtLxFU4RXc5SRlZ1K4xdbzJi8/5nFcYdaBFYqU=;
        b=Fvuj5PzMLnp511zUOuXtW31L3gHSh9Oxmyc4svNtGfRUcaoB9SyzBMYNXrIyReUD8R
         Whghg1MpP6ft4GuJiOnRvlfr6lvlXmDN9YG6M4RcQva1FVa07hw2SJ7cAYVMOwUNMeq3
         kh5rreu+mGVhbp4ng8GL/xeiP0UdZT4oBVoJyV66/46Cgxxy3YR/EPb4yrULEfa1DwX5
         +bwlDpN6ntqqPY9dV6ceqJMrW/uGjUyvpA/w5Dy5PFaJKtQQ0GNPrZBjoF5/yIuLBqeD
         pJ1AGvboT+IMFxKUjVJE66tLc4mO3VSbzw3IRtfIOHFwYRYek9V6l+RJ6YnZ52pj7iBI
         7hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173648; x=1793778448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8idl/HtLxFU4RXc5SRlZ1K4xdbzJi8/5nFcYdaBFYqU=;
        b=csXzlfO1fU3o0JRuw3I+/gVRFzbpfRGUPwweIIjLX3BsEikjoBZIbbnzwJVTXdLiPP
         ktvIz/z6OALtqO6RYhrAqtK+MCZx/Fj6hZZxQsUZBobSdXgUbtO/QVL345JnIp1V/joN
         L1tRf/fgo3+UvV+MomG6GVrSwQwNnS22R0cQlooip0Vp70pBnRORG5AsPouUn3C0XidJ
         ghqTovQQ+jS3i/48ldSVlVndx6xZ8D98CeWeTIwR4l+RePlkEZLcIqFT3D+DHl1eyQBp
         Z3uL9OX+vBfjuVRbH6O7uXP3IPXA4c/DDQktAZg13FIWn/8ZaRbrpF7/SjwzrLA0uD9d
         IdvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6WT10n9BT0mC3vLO0vo41Tsh0VVekiPymXs9xlSvItpr49/KjxSW5TGRJKgMZ7QpyzT0/5YduOsRfrVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYYwgoTb+qb1OCNdFIpr810PpE126zzpjV1+0rttHPnA4h2tld
	5dBRp2uOKhm0jwhOurwGkRCIkDQPm5KS68AhiJ7xme/UNf86Rsm/xbgP/CNvh2enX7o=
X-Gm-Gg: AYBFou31gCFKVtvaD/HdoG+MvWZaJoqnn6Rg65LD94Fuc7OTS2xcVZlAF7phpKyrl0u
	dTRsV9lb1PQCRewQYT2Brf6SgJM5ZNHyU7FrM7oiLrd1/R75dcjzkK4mD5bVFOgL/GeAGRfiUUP
	RELdIS23Y1Y3yUZICKZA3qboKcb9xYoCeiiqezpQfmo1ThbVDJC5E/xDu+Gi7HkcX0EgHBSd3DF
	XWd4rFEPkHzl2a7KMKfucOyPRAzm9b5OcwnJOTGCVzyd6aM2f97OYXlBhM+J9u8623h0c6yfaZ+
	KqXLFP6XEdp0lHmifjhG2BGmt1qcHWOS+fFXI1yPxDD2JSK7ced5OL/4i6UsWNuyQe57ziGXaP0
	nq/Nm3QdE/PHuctYBmb1h04rsAfNyK+StC3zFd/py/BuhJyMIviK/07AjA5l6ZSm668hJlZpu4t
	zJQZewSrz/T0I7VLEpDYrUG4D8+oNWJEgNkPj/LIP37BcTY6/SZ6MWv5b/3qp/hAy7bDxI//kHv
	znwNTRnsp8kXosRwnIpeD593xw4Wk1FUq422VP/WUbezbM5l3kLIEnMPfeBLNfH+Xg4nC/k2YC5
	mtJ5Oj1PVZkZhpmYLBoVT4cgwL9Z
X-Received: by 2002:a17:90b:510f:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3ae580ae38emr1000839a91.14.1793173647649;
        Wed, 28 Oct 2026 00:47:27 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a27f7c7sm1941127a91.2.2026.10.28.00.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:47:27 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] tracing: Avoid undefined shifts for zero histogram map size
Date: Wed, 28 Oct 2026 16:44:54 +0900
Message-ID: <20261028074610.2212374-1-jaewon8868@gmail.com>
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

Reject size=0 before calling roundup_pow_of_two().

include/linux/log2.h documents roundup_pow_of_two() as:

  - the result is undefined when n == 0

With CONFIG_UBSAN_SHIFT=y, a size=0 histogram trigger reports:

  UBSAN: shift-out-of-bounds in include/linux/log2.h
  shift exponent 64 is too large for 64-bit type 'long unsigned int'

Tested on x86_64 QEMU: size=0 is rejected without UBSAN warnings,
and the histogram modifier and parser tests pass.

Fixes: 7ef224d1d0e3 ("tracing: Add 'hist' event trigger command")
Cc: stable@vger.kernel.org
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 kernel/trace/trace_events_hist.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index f39fa8942673..3de794c7f5b2 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1430,6 +1430,11 @@ static int parse_map_size(char *str)
 	if (ret)
 		goto out;
 
+	if (!size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	map_bits = ilog2(roundup_pow_of_two(size));
 	if (map_bits < TRACING_MAP_BITS_MIN ||
 	    map_bits > TRACING_MAP_BITS_MAX)
-- 
2.43.0

