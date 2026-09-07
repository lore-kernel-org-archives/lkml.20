Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA254FECD5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796261; cv=none; b=pI+mxM1r6xWXWGYzwkkZm0OSkhVWLpb+pHaLGpLgVboUpkok/nFNHhd6jOLGgJwa7+ryoioH8SliRI54E0rSwICXGSqgkAwryV0IY1kT1lFRAXwsiayAYoQxZuIWjnDwkFSsE64v5ze5ij5hm+iqobkqU8ki00NddDWiSpJcZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796261; c=relaxed/simple;
	bh=DhiBgG7xnL08u0x0FTkYm6cczKwYmCOp1xitilaqnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0ols0Eqy2uqcduc3AyQ7fXJfAKJnYVA3CVeyRpPvWpPCLoKgRfhiCm5r3zGQalxpIWi87qz759wCQDO2dCIFyI+SR25PWC5A2g1Y+ZbMBjvZONat9Nj7TY78qqFFwotqmtvY6+QWvhKRoIWAoiTXot8IZHGUXZBE0reHkkEiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLl16i1H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLl16i1H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d91ff7d9acso30577175ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796258; x=1789401058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEKj5eE4ZkqVaXrVpceSXQRZCzNc8P/mNmuBsDFjR7I=;
        b=LLl16i1H7jds4lCauJc5qlUPdeYVj/+PycqL1V7Rwdnvn5owCzXfjyPGniQh+vazkR
         +3GTsKQJjNKPbfNBSrzLjlhOeSOaJVd17g7+ekmP5LMMQGNpHy0dKyBSQ0+bYCDzF6fJ
         MEQwrYAACFGs6QYHfeVS/qFYSOs5SnFC2fTSbHOcmT+1Hao8/VWdNwIPLovLrhtSvEln
         NTclDu0wf27AQ+5Hs95/BPPZZzAWbHLn1B6frDGEhsbT0g1mLo0ZV9TlVsXPSdQV0c56
         i0n9U40O+y9yJNUCUol3kZBp0g5wl4rwk+ypT85pHRxnYapuDumLcqeCVaqlYIXk1D/v
         tSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796258; x=1789401058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEKj5eE4ZkqVaXrVpceSXQRZCzNc8P/mNmuBsDFjR7I=;
        b=Uf3WN9K+7oKNsDXxyEJFXvoyhkskcvg3pctoqxv8DSK8s2IyF1iKoxfvbCjIjuDsWu
         Y9X/5N3JvGbU2vmaFufZzJWudfrefEoHAyiN0BVcZkWQy9SlKSoBP0PEyNSeRfxkEQ5Q
         RvwZ6+5qg2x1at8+iaQzkbLV5Fl7usRm+RNP+i+12YfStScekvHjA9d6nQv70b09lKQm
         rJ4FF5ha6NXVLIQT2rZ/U1Pw4HBIWfVn/z3OhQmy0cY9jJ20JIGsh53pWFs/9Lm2Hbes
         myNsvusOEn5OPBZhrgeoq2nxCoMWa1aCUnI9/LyHNAHyPfOV62zTPtoMxaEVBPXvXBZ+
         rSzA==
X-Forwarded-Encrypted: i=1; AKwUvBxzPBE4tP/IGECacodpv/pAfNTrXj3TVCnoFWaMoC8OJumi7etFs2abOaVq7xpskzi8OxxZ1Hv0QIBm6sg=@vger.kernel.org
X-Gm-Message-State: AFuF++mfvmxSxknDwVRTMzcagIBamt3z8N1+rnNfnYVN0ufzb942UP6K
	6avRBy0KQb7VpX+j1Nodadap5uG/1W3gV8i90knTPOV47c+jupon6lk=
X-Gm-Gg: AYBFou2fz4D6hfIZAph4V33g33OfiHIEa0y70TnC7gcqm1cye1iOFK6cLeb0qB7LOTb
	HsUzMyljNGIbr4k5J8Zebybjk9GNP55pL/0lQsNLLFNUVTg1VDpi1+DYa4ltqMOeWOQ9L0eTBb4
	vg3zK6HND5IimmzIPEXPwjwzpOa/6689mPyRg+1nI7Rnd+ACNTIzWP0spZCs/uo3LjSqGmgzpxG
	Onu7587MWil+6WoSqZ3o7oP2T2GDJk185SGgqM/Zn4lwaAHMMLNxFu81pEMyYwkI793KCktYia5
	QjqE0vTNRjjqAr0brS+OrH1xv8qHpl/8rOnDZAjS8XeqdGwbA1nXauuzM5viVoKqtRlsiDvNSts
	GcG5cqVcIgiFBwOs7x/3cTckTBWfwyIdoc3ewTDuqVUG6xZWjJxbdHT2HcHYrwyegeMpJgayQCa
	mczeSQITOgh/cms/X4pkC6CNKPCOckqaOuDHXJ/UTDWt9+ZNtPDCrUc84yg3oe8wcmbvxob7WFY
	+gmUCaLcSF6y4Yr
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr128165285ad.19.1788796258200;
        Mon, 07 Sep 2026 08:50:58 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm47265405ad.63.2026.09.07.08.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:50:57 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 2/2] tracing: Fix memory corruption from a "STACKTRACE" histogram key
Date: Tue,  8 Sep 2026 00:50:45 +0900
Message-ID: <20260907155045.692664-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907155045.692664-1-donggeunyoo.kernel@gmail.com>
References: <20260907155045.692664-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"cpu", "CPU", "stacktrace" and "STACKTRACE" are generic fields, defined
with an offset and a size of zero so that the filter code can match them
by name. parse_field() maps them onto their common_* equivalents for
backward compatibility, but unlike the common_* names it hands the
placeholder back to the caller instead of NULL.

create_hist_field() takes a non-NULL field as a promise that the record
carries a stacktrace and picks HIST_FIELD_FN_STACK, so the __data_loc
word is read from offset 0, that is from common_type, and its low 16
bits are followed as an offset into the record. What is found there
becomes the length of an unbounded memcpy. Pick an event whose id is
small enough that the offset stays inside its own record and the length
is a kernel text address:

  # cd /sys/kernel/tracing
  # echo 'hist:keys=STACKTRACE' > events/ftrace/print/trigger
  # echo hello > trace_marker

  Oops: general protection fault, probably for non-canonical address
  RIP: 0010:rb_next+0x23/0x60
   </IRQ>
  RIP: 0010:memcpy+0xc/0x30
   event_hist_trigger+0x2e7/0x12c0
  Kernel panic - not syncing: Fatal exception in interrupt

Leave the field NULL, which is what the comment above the branch says
the code does and what common_stacktrace already does. FILTER_CPU and
FILTER_COMM are left alone, their create_hist_field() branches never
look at the field.

Fixes: 4b512860bdbd ("tracing: Rename stacktrace field to common_stacktrace")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
'hist:keys=STACKTRACE' now reads back as 'hist:keys=common_stacktrace'
rather than 'hist:keys=STACKTRACE.stacktrace', since hist_field->field
is what the print side keys off.

 kernel/trace/trace_events_hist.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 620a74fc62e4..eabe95419b97 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -2417,6 +2417,7 @@ parse_field(struct hist_trigger_data *hist_data, struct trace_event_file *file,
 				*flags |= HIST_FIELD_FL_CPU;
 			} else if (field && field->filter_type == FILTER_STACKTRACE) {
 				*flags |= HIST_FIELD_FL_STACKTRACE;
+				field = NULL;
 			} else if (field && field->filter_type == FILTER_COMM) {
 				*flags |= HIST_FIELD_FL_COMM | HIST_FIELD_FL_STRING;
 			} else {
-- 
2.53.0

