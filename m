Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211026;
	b=bLJVJiZN4NYUqr+uhRKmluHn0xnTYIvaBwkkaxRAsGMxs2lKOJjJQDb8dUxsdnrjaAwi
	 s/oOnin1CPdXRUuUmL/xGR6x3DrtqRL6fQ5t3KOYN7J3gqBqCOctLidrMd2499UstLhwn
	 WiSP9QRFM3jxh4fWQ1f0HyT/jeT7MyFow3Lc1Ye9+3HUBApcsLZrl6Cz2Vl0z0yTD/b+w
	 MTx2xtqprcyNC8+WeAuVz1+E0Frqq/I0R0d072Ogf3Tl2GvhzKuU392au+I3Kb8o9CnmD
	 gLuVbJ5HxOFzvkFjQerHaXkW9plYVvdXkUrYRv9JVziTDJjs0JszxB1VXck6YvHBo3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PEsFmHwDP1UG6mxKZCd7t69d9iU/+Kdp2tnQbYYT7Gg=;
	b=DQrPrpohLpviK2EWESniwJEXCRvqqshUKMWoc3z2NLuwSZncoJyk+9aYSyXfQe51LLfr
	 fFkmTqOFPMDUX+dRLzZyrErFH6X8aCCGZiB6nbjB2CNiquWqo73pOtUSTregYwtCz8ZeM
	 Iir88XgollMmL5EM2WJxbI+Z7+nt1V36MCDTDACpI8sf4x0pVDAm4DMx+Z7HHDZgqCEIJ
	 hBmTalkjBqnNXcPVb7qqWQuVItOQfKXmwh9ut2xEx8AxkTKb+gentYTW4EgkZvqunHSd3
	 nFAbFNMEheOEJmbl0h3oJQEF8eY7skwZJw7Zznd5q0eRljILojREKr3tQLftjaYz0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbA57hZA;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF8606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FF8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbA57hZA
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8871ada1a26so10949237b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211025; x=1793815825; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PEsFmHwDP1UG6mxKZCd7t69d9iU/+Kdp2tnQbYYT7Gg=;
        b=FbA57hZA3sh5y/MJczD0fiHrpyfQAuF6nkWZpF/4+/7zalbgapirT19ufYH3iP8GBY
         2uBIdBGonUh5K2Y83Thx5xtOgcd/wSurpGrcJbgRO7QjU2LRfTEzS+T5219WJOEDU/Sr
         u22+5t1GBYYquB7BiUx5z9fKqntdM7yX8HhIbW5Uw7iVurJxEmJw2quvzBVPFfJ+Jnb0
         /l1vuDGKLQQQa+Xcv3eLPzwOtj0+ffa0hzEeiUx0aex1LT+E14exiVCHWa3tDCcx/8H4
         HdY3J52FOvsGr0kfNUeFz+lL6vygtCTV4BnYzxEEJw0FdbOrXr74AC4ApmgE5DWznKXh
         N25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211025; x=1793815825;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PEsFmHwDP1UG6mxKZCd7t69d9iU/+Kdp2tnQbYYT7Gg=;
        b=W8r0M9qECiZfkrkgUMuz0BMxTLeGfLS9v9DAxhn7AV0lgTdCkjLZa6MmxDYjXT/gok
         PYswhk6K1uq7PzjPuhXDe/kAYR4qSI9HkcOof5cohhliYvtJ4VisuM/cFTbjrQFZu7SZ
         JxIPWNHd0Qxn+wS7c//ceqQzlJgvGd6fzPU80eOpxVa0hiKJhhYgV/WssgUVZVCndGM1
         D7VO85woIdwBUXf+eUSU3z8uZk7G5QK1sZQMQdTpWxGbfk4FP67URAcqnVAXGML4Dsov
         I8GnTKBX0JhX+mh3radaymsTNw5uXeMQkwUQuKmsyYvWU73RXEYTZJOPLj1KpWSGw+E0
         VxSQ==
X-Forwarded-Encrypted: i=1; AKwUvByXY8P+qVoDroCJsmEpj9Oi68Zlovr9aKHjzfAeRwXGeUIpXeBx12nvOJFmvzyBvBWRSAZII+PMwrycrto=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU0jyrqJLOcc2pSA5acXKdeoAzlghoCOo1AXkB8uX+NZBrFY+5
	GT8CflhjdGV5ULDT7TK6DhqC4l8uZvMPmbDopgXvLvou1MAwLfQ/y44I
X-Gm-Gg: AYBFou23+aE4M+MYi7dmdQT7A+W5IQ4pXQ++wIvi4/zUxSudboRwMnaMsL1XI+B+FOo
	CreoNSQZDGRzUGSIXvteR3ZfjVyvYbQSOxqqT33MRNBLIifVHghW664qr0pc9d8reRsZpaSp/oC
	GlsmpxEfz8o0ndtDMt0/2T+RNGaLAx55z0AhWtiQhd/njQy4Ir2yF3et3Nt/JI0E0dL7VOzagGR
	MEx64t8TyFBv/uFLdxoIgW23nIcz4VfKIYEbcCxGo5wGbqMjGlbfLL/worYXrI/4D0ck3Glr3L/
	Jkk6+VTWTuqmnZpF3mxrZilE03YVcKs6m2uDZ1ycW4ULBMzG8y9MhK7ULQWg8Y1LcEF7oa8RJVJ
	KJ2j1lYUYIoPM7KBey92HFUjNLLs7RIwgNAS6GhuoWB3JawwWPWxvtc2Wy5N2YuqtaJNUuw99+6
	4uF55phvXwkElU2N3giWClDTjz1nOp9+0UML3ZpTsswAvOPqt1Io/TabNEvrGH45lgyiZLs4DRF
	+zRgytHG0MR1nva7mReew5YHXvMr37nUS2uRXjBEBv14NEsncJQ6wvEy9wDy7hCiGk+YBAsQqos
	FxA5hMhyPTpb7JeQFv+U9h/8J5wUm6e4x6hzsneSXWCdI3uNRnxJY5K0997TVNRO3xpANtXL8BU
	av4fVvylw6w==
X-Received: by 2002:a05:690c:a0ad:10b0:8b0:dd32:d6ca with SMTP id 00721157ae682-8b1b5c31f83mr14171727b3.59.1793211025228;
        Wed, 28 Oct 2026 11:10:25 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5c7d50sm32883317b3.30.2026.10.28.11.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:10:24 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] perf alpha: Decode ProfileMe samples
Date: Wed, 28 Oct 2026 14:10:23 -0400
Message-Id: <20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPnchRhD1KqUPUSe6YjVsbBHEu
 5vWx49h/oMiVBCpyQ5SfCXKuiTkj4y60S0DWPpkssaWubEVB6hnN4fRcdDVy4w3uDJpq+sWhS0
 oXYPCy/7PPl+346ed0G2/Fp3nBQCWlD54AAAA
X-Change-ID: 20261028-perf-alpha-profileme-8010299be323
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=0q1C3YhEO9HEq0KCnLp9he/zxM/6Cz1+kQq6ZA84tOU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWfWr2wrH7tnrtS9r1sr5v579vmC6cUvXtVP7hV723
 a+I2rU+reMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCu+W3N8D++16ld7v
 xMsao3S/3XT5hbv7s3VnPb9hZlg5UCugUs5TEM/91md1aVOnYejPAvO3Wnh3HFWf7uYq4Vh9+Ui
 bBUT/99jwMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com

This series is the perf tool side. Patch 1 decodes the raw data in perf
report -D and perf script -D, as is done for AMD IBS. It copies the new
uapi header from the kernel series into tools/arch, so it should wait
until that header is merged. Patch 2 adds a script that sums the status
by symbol or by instruction, in the style of DCPI.

To try it, with the kernel series applied:

  perf record -R -e instructions:p -- ./workload
  tools/perf/python/alpha-profileme.py --pc

I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
branch tests random data reports that branch mispredicted in 21% of its
samples, and 0% with sorted data.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (2):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py

 tools/arch/alpha/include/uapi/asm/perf_event.h |  27 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 162 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 133 ++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 7 files changed, 328 insertions(+)
---
base-commit: e74880764bf94b738102b4b6b6e8304d0c8375d3
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

