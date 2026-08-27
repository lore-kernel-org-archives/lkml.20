Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9047D46A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844268; cv=none; b=RcPyuuolOZse7M+edOv+F6sZgYI124UBJ48EOhnjSbRMkzi7hx8/Qwm6nsHlXlxNsgrXNlS4j3V56FYGZHzgsFzAljXvUEKFLGcyjXEvJhTByfp8wnJUogjW1SKnbQs0cLuAUd7V/+0M5/1uaCflA0HxlZwQeLcw7Z1NhOYpFbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844268; c=relaxed/simple;
	bh=gPPDBVz7emEv719U/1T+Q5qL4mRlgYE+mty6MZDOCpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAZVIvO/Ie1Fg58NJtJRgLl1+A7o6RmQk4EWwxMtt0g1oYfrLlaXIuFjhIInU45ql7OqmGcuuvB+11NwvlXOBaYVKjb144Mlks3+Ks93tM8duc3gC7sdjrx3piHoHIKHO3C+/nSB8tusIoHCrl7/LiXNcxXE1Miwi51/I6M0dAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9l9DKSA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9l9DKSA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1187829f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844265; x=1788449065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DILcxOjqLfpxM3Ar5Lvo++XnVhWWEcd9Lq8Wh426u8=;
        b=d9l9DKSAT6ivpm4EnTABWHidL6sz/4gVW2JphZyDX5/2XpeDoUSo4QKTThdE6s5MzV
         hirvU6emHuwD088cgh8wCx1YMeMuXW4KO7U7Ex99xOgY0aRlTaGXR1Vok8rBWUXr3rLV
         Ihr0frF1GjQb/sxMPAThvz8ZuOwWy3TiClSW+nXDzIDBOJ63yfjciN15SqSCV4F1k3SW
         6vhFKCHAX0aaByi3OVq/QtyB9eREUK7gEC2dIK4/RLqiATKuDG2l/TV1+KRTXXDAxA7a
         iv/ti+h3oYz4JMGJ7fYWgpl7fG6m5RbyDQBRSEezspNKiqTag6WhYGtJURmewb7rdPxV
         DtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844265; x=1788449065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DILcxOjqLfpxM3Ar5Lvo++XnVhWWEcd9Lq8Wh426u8=;
        b=GglSeWGYDWCHTRaEWO4Y9MBEJSJTiYyuRgV6Stf43V8QYkagJJr32UUEN4JsyAGgpJ
         E51YDAW0cbwSnqGQRunKvwHMxWSsluMxqQUWtcFkPx5XSVyWdnGKqwIJh4lM+zmbsMkC
         jg7S7EmbGOafyXNOcQx314sSYIN7TEvijaR51zdBg/uPQabCIJUpsFFR3y5CoJgnfrkY
         VwNh1mZlYbWloPASigwaoz7K7J+nd4EPAuBSzuhcs5aq0LNL52+1ad74IR+0zIr4sdz6
         DcA9k1rxLa1U8wGIkp/FHZpAhv78BJOn2zZqA+0BMOr2sPJhx0zsxYApmdNabuoHKiib
         ze/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5C/BoT3bKiq8m6ZYnW51KK1zZZCoQtrZn/nsUUdRd1GcEko/AsjA6kO3ldgBAIHbVZ/NtGPA7qzn+eA0=@vger.kernel.org
X-Gm-Message-State: AFuF++mW+D0NyrSXkngOYbH1Fv9uY8yYApF81eIXG4Qn3yyS+a31cULt
	/vJsT45QRLQKtaU+WJrAAQdFwVCSxuIJMKMmP44x1AdBixlwm6w/nrfLxQdjSJ12/Gs=
X-Gm-Gg: AR+sD11GudU6EpQBD+70fKDqNcePd4AnvHDvCYrDlVvB8G7YhZnuKWdFk4pSdUzTvpN
	awVQVQuMsZFfoyU667NlLA9qJQJJwX3J36N8cpmA8UnmpBY+1x1mxouM0LDn90mj/FojzDHmGAT
	L+rNHeHXv3oYEMR/e0Q/Yc/aCmq6ioqkSMNF5dmTQONEDQvarO0HjHORHlW8yWjZ9KBfMCEu+Q7
	/Ns3xua0OKDU9xLVHYq9W997Id7CKa4T4txEjJ6QeFk7n98W8XHPZ+gZUka1pAU1MODFwijpspv
	i125L9aPNs6LgO8QVX5aTPUJIYc51jpKQIMZVYFSsXvP3JUEcj3WAAQAcBhx4O4vxIQH/e1TAoW
	sp6B2jT2+NWoyEM4V8zsVoBbLjJzoVSeV7tFJLHiq/Dv2+9C7im1UyXvLj8HRGnIiGY5YSnqzzt
	poDzHrEVakPMaWS0qU/Q/pIt1teh22WGFUOflxCRxIlfFeVn+5W6oo1qaYHMlKsqV4VASNBtqOb
	gwMj99joKUViFMBbVndFnc=
X-Received: by 2002:a05:6000:653:b0:481:5167:d526 with SMTP id ffacd0b85a97d-482e269d904mr19918299f8f.6.1787844264757;
        Thu, 27 Aug 2026 08:24:24 -0700 (PDT)
Received: from amwld-tmagires1.us.drwholdings.com ([149.14.21.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm10257371f8f.11.2026.08.27.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:24:23 -0700 (PDT)
From: Tudor-Stefan Magirescu <tudor.magirescu@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.magirescu@gmail.com
Subject: [RFC PATCH v2 0/1] perf scripts flamegraph: Add --asm option
Date: Thu, 27 Aug 2026 17:23:53 +0200
Message-ID: <20260827152354.1513813-1-tudor.magirescu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821090555.1B6DC1F000E9@smtp.kernel.org>
References: <20260821090555.1B6DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flame graphs report samples at function granularity, so a wide frame shows
which function is hot but not which part of it. Obtaining that requires
perf annotate, which reports per-instruction counts without the calling
context of a flame graph. This adds an --asm option that appends the
sampled instruction as a leaf node, so both views are available at once.

While testing locally on x86_64 I noticed that when recording using
--call-graph fp and :p event modifiers, the top stack frame of the
callchain and the sample information don't agree. In my case, it appears
that the callchain's ip is exactly one instruction after the sample's ip.
perf annotate seems to ignore the callchain information and only uses the
sample ip to record the distributions, which I replicated in the script,
so that both tools attribute a sample to the same instruction.

This approach has 2 problems:

1) (Occurs only when recording with --call-graph fp and :p) The sample and
top of callchain might not refer to the same function, which means that
some instructions might be misattributed to a wrong call stack. Is a fixup
wanted here, and if so should it live in this script or where the
callchain is built?

2) A binary object might contain 2 or more symbols with the same name but
different code (e.g., when defining 2 static functions with the same name
in different translation units). In this case, the approach cannot
disambiguate between them, so instructions might get misattributed. Would
exporting the symbol start and end for the sample, as already present for
callchain entries, be acceptable? This would also remove the objdump -t
call entirely.

Changes since V1:
- Warn to stderr and disable annotations if objdump is not found at startup.
- Resolve DSOs through perf's build-id cache rather than raw DSO path.
- Try debug before elf in the build-id cache to support stripped binaries.

Tudor-Stefan Magirescu (1):
  perf scripts flamegraph: Add --asm option

 tools/perf/scripts/python/flamegraph.py | 161 ++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

-- 
2.43.0

