Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9237189B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648855; cv=none; b=lQTjDhg6TvcAxBtN1CNMgQ7wIAP23q6UaaFdLfmc0zD8GTNdp81ZWLvUFrFe3l5XVH6E1NzkhEKFijvErO9cpmD+59ofmUTmciMoj9mqRmXej5pUBS2+cmz7Ll15z7USHOovTZIYhRrG3ZWhz0s5kbxghtTfBvF57ACnN0/QWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648855; c=relaxed/simple;
	bh=0Yif8h3wRAA+zX//jWVlUkCu0tRyt2k+0eKhLSkGckw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=urhM3sjH64ob2l/xdjenTJrQYJUMeSTWt5TDFRyCzyMdDLJmMnm1Gw053AGJdEkG48sfuVdGjSiUbLqDYs3NCNyE/HaX6MsNzNQ+VGSYKDLAJTKZ3Lv3S9W0fwEJNJ1iAYeskQCizc8bflDLcEeq27dUI65oK+Lf7ARnsSRDJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBitWIGv; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBitWIGv"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-861a2ae9c51so27882607b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648853; x=1789253653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6yPhsfs4XIaeoX4pT5JJrb0Czgqi1YEFf3B49wOqCU=;
        b=cBitWIGvdKICD9YF13h6m5pvkBc89ZB+jhxLgUvQ++i0skNJME+V8zHp7QFEX0jLPp
         jN1lSQoCkavVIcYE9AVjuPra+mIcVpTuFv/mX4EtPaD4+M8/damTK1/qA+77IQRhc97F
         RS8rIwqzZxkvwtljZtmu0FJDNB+Gzh6DXWPPGTtXhU5CWpgVlrlKVFvONdTY62GopFH+
         brux1uaU+RRgz0knX8/IfMKTIhVqpJJuqf99E8UAJ0fmOVcCN4n6hUTAC2K4qt+13svr
         2c9Xc6d1LGfZ7dkXA/5pUkVWnmRU3yLqGGyYyb9kahkNDLl1mLs719QWv7BHJK37XkDe
         aBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648853; x=1789253653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A6yPhsfs4XIaeoX4pT5JJrb0Czgqi1YEFf3B49wOqCU=;
        b=McKIStLHNsr0L1JabGLs0NR9R1wbQLFbQmMlu0tFV9Uo7V5m9dkv+geFRxAvAXt9Lb
         W6QUVcpCyArJuQy9t5HewhoPtEGJ7ip4S7SDx4FJ91qGyVnSnCQJjtcoMz/8hN69sMwu
         mExs7WoEJpe5brrHTwlwAZX+w066dPpOjwnNUgQq5+wXsZXuFcgFtBZ7p+23Qf15Ynu9
         dFMBqN6wt48qpdH8xYz0PIUpZ2EEo3lqNLc3fareFFJSq+I45jDw8a4aRHJ9/tafG+xf
         4xds9ig6yBnx7FtvDw1u4h6HW2SzQaeBBjGcNdHl+bnN4CKsZZjRfeH2QSzxuOVlRIlK
         XHUA==
X-Forwarded-Encrypted: i=1; AKwUvBwsamdpAnzZyzMvTgc1O+D5fHmJS6yrtS2B2Avz0NCWyc9lD6LRHzCOCiYEAOUcKKGxcMvzIi+ZBWbblAc=@vger.kernel.org
X-Gm-Message-State: AFuF++nhtcruHdDA3tVUbTpjJpMpNdUnpE69SKoOsfRNpO43vIGIrX4P
	sMlcLvM0lH805PfJIGvW/4iz/QXY2ikwF5aZ1Lz1Q9lCK5klTlQ3GgGZ
X-Gm-Gg: AYBFou0tO5JlPhGSFXoA+B01/oS+ovqvrBP93RusGEnmpcoYHOtw5FF7YnhF/LuwpLj
	TTCX2MWkpMLZ3Ks/gmdqnqlKV7dEmOLBukq2aMNy1c33SGNN8NjuFvT45RjT8EAPpLZt9/emS4P
	wyBAtoJ70ZyorfQP/PHY8iBGbyaA+iNS524adOnMjMlLgaa+iK5VrZk/QK6pJ7lIO4RQix3Jz8L
	i/tquY7cVLCK+R7Le4Z1+tDYxtqRLyHuTQkXnxoTpj1CyvUPTmUvuCvL2FfhuUA2CWA2e4nQPr9
	3tGfvcrT4etq65pAZ3TGh22QjAUM55JgmJ6q32AbiU/7r5/gZvZT8FNNImoX+rJ2S82YyopZVuk
	YNeWDN4eBE0adFaxehAD1f+4mli3KNkasyLdiqYXLhURnRORleduAYG8C+Jvi/67B506ld93Uh0
	sL8ZMNlOZZXrmt7azPmwea+C+zH/6izAslqfVraWlUlMcQ8TdKBb6dFCs2rj050g==
X-Received: by 2002:a05:690c:c509:b0:873:5bb2:6c21 with SMTP id 00721157ae682-8735bb26f1emr30474437b3.40.1788648852997;
        Sat, 05 Sep 2026 15:54:12 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm45516347b3.45.2026.09.05.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:54:12 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] perf: Alpha annotation support
Date: Sat, 05 Sep 2026 18:54:10 -0400
Message-Id: <20260905-perf-alpha-annotate-v1-0-97380433ccb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswqciuEi3GnGogTDQiCO+et
 HyL/19IHIUTjNULkW9JcvqCpq5g2clvjOKKQSvdK6M6DBxXpCPshOT9edHFaFtD2g62d8ZAKUP
 kVZ7/Os05f8mlbOllAAAA
X-Change-ID: 20260905-perf-alpha-annotate-b49a2b8b6d99
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=0Yif8h3wRAA+zX//jWVlUkCu0tRyt2k+0eKhLSkGckw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmzJ1kYHc1zH73zfZcsZ3JLy0fRTN05Xi487madl945
 qCz+cqKjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkm4Rsjwx7/43H7o1
 78tPO/Erl65xYND6/P/xd8vMIjv4dnzl/ePFGGf2Zvxd5Z8GtnGPf1vLt23b38luuVzSr5Z2fY/
 vk9qWzFUh4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has no arch support in perf annotate, so annotating an Alpha
perf.data resolves no call targets and draws no jump arrows.  Patch 2 adds
it.  Patch 1 is a prerequisite for reading such a perf.data anywhere other
than on Alpha itself: thread__e_machine() currently misdetects a
file-backed session as live and falls back to EM_HOST, which silently
annotates the Alpha disassembly with the x86 instruction table.

Alpha's calls need a little care.  Only bsr has a real PC-relative target.
jsr is register-indirect, and its trailing operand is a branch prediction
hint that objdump prints as an address, so it looks like a call target
without being one: in a vmlinux built from this tree, only 23093 of the
213750 jsr hints land on a symbol, while 157204 point into the middle of an
unrelated function.  Those are therefore left unresolved rather than
reported as calls to whatever the hint happens to name.

Tested on an EV7 Marvel, both natively and by annotating its perf.data on
an x86_64 host, over bsr to a local function, jsr through the PLT and
kernel-mode jsr.  The two hosts produce identical output.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (2):
      perf thread: Fix live-session detection in thread__e_machine()
      perf annotate: add Alpha instruction support

 tools/perf/util/annotate-arch/Build            |   1 +
 tools/perf/util/annotate-arch/annotate-alpha.c | 185 +++++++++++++++++++++++++
 tools/perf/util/disasm.c                       |  15 +-
 tools/perf/util/disasm.h                       |   1 +
 tools/perf/util/machine.c                      |   1 +
 tools/perf/util/thread.c                       |   2 +-
 6 files changed, 202 insertions(+), 3 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260905-perf-alpha-annotate-b49a2b8b6d99

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

