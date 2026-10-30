Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333346;
	b=2iv0Z/lrnoFtYRze42b2nGtCyNcq1gfdnPMVsR7GyMrwJJUZ9wX9iUffE17D/EtQL7zI
	 jQWNfLVEZj8dq9TTL4+yrDlrsScGaqCNLTWPQINdzzFJeYMGQQs0GhLYLzLKwom2RSHYz
	 Gu3TxgzvUG4HGpmBn9DaC38P6s+uPBsVCNRED8HgYfjcuRdjv1ASULYqQH1dmZy4Ojl4S
	 I3kqajFXVV0HouKJDEtvdgKGKlDiD15Mr7+sROMvSz1uKALM2ueGmiBTGVOiKdzyDFdPY
	 mqDAcBki/VsfqGLaDX7o+CPjASuARar4mCwlpO2CmXXZbAUK7GYzxEmFjdBYOXhDOxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KLY6uZGPwiFF8FKR5/rBjv6CszZW/cjkjocdfXqgdv0=;
	b=Aswk/0gy84vnfhW6kDclFqJGyM4EunWJgtvHFQEYP9CQ3ShL1OKwkgH8GxgGn/XF+62/
	 B9hhm5rvI+yC9M5KZTue7Yb7KxbMYbPAWztCWF9xJx+92NtvgvN5NuUY8t8j7jwYgV7ua
	 eUwyw3qTjPzvr1Nqlw+ekkKFv3WSe2457UIqbH19omaBMrlltvNpbG9guXFzNhmNj7qv7
	 Ygwa9acSr6pBHJ6756zNK9L3scelCCC8ANJoSVnNVcbVcY3rT1WBl+Rj8mwc+EWh9BiEP
	 FPa/nAQTvdYD7hUKqevdNgKz9x/idI11ez+04LmYi3sGzEUq4RCmp5rYXy2iTjEGm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u5Kf2M7/";
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D439606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D439606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5Kf2M7/
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6768403e9bbso218972d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333345; x=1793938145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KLY6uZGPwiFF8FKR5/rBjv6CszZW/cjkjocdfXqgdv0=;
        b=u5Kf2M7/6YIjELzCkl70tvynJLj7pohStzpqHIHK4Kwkj1GSq8J1avE+hxCX6hwNtq
         PGkpB1aA/kq14+FiDjIIYUsw82b6mguQwSK/O55ncJvZlsY8AiCG+qmp5+g1H7UTePl1
         yoWW4LxfNH7JbHWa+3NPcjpwd5LBUvQVyCEOcvSQ8aAblcc2YCxyR9YDUpP+U9MCaVCs
         Ng4udMJXLudlObRCsvBcfWyQ9Y4P+hA1KiYD5kojXeZYYpqYKWgeRG1cSVr/cdWYtBTf
         Ms9KcRt1yhbTtBzlqpyQUCxzWsUNCWFQ5HhFv+Zb+i8V7aI8ifH1diPu4C1BUKIx1Btm
         /b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333345; x=1793938145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KLY6uZGPwiFF8FKR5/rBjv6CszZW/cjkjocdfXqgdv0=;
        b=KeW1AT+n5lCNKBSl8QKWLdvPc5uxezKTX7Q9xeqi0UXp/aRBaLQNKw+Lz8T/KZAHx2
         L76oDSWv71QW6FrYiuZ45piRvQhCgR7c9kOzi2HUfg+QkM6Onn/XINya8aTs24OvRtGO
         Z0gOOihojqOQ8IzlNHf9gtwWaGhrOBpwU/zO4COOvT4XYU2AQhKwsPPEkgsaPzcDovuL
         W/ufud3+DUmJYWplM09Dumpk5jfSmuEbOiCQL2RvSiBvezUq2PGH7XGI3rvV8KiLdjv7
         HsBME6vF8y8B78BhiyIDFDBwF4/mv4zon1GTqB4EULLxnMNmBanAbIyo7w3R+ESd6qCG
         AtgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKMNYM+DUcwMRLQc5E/NR+AoDa6FombCqHCk/qJ89vLAVcl6RsJ4x+CpDHP17PxZCytgR8rNRWAi3Kyy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9n/m4e8Umhw6aZYl+sOe0MD9Xh8OXRRzO3jcI2n8rGSeOq6+z
	MgQLdvSdwfWfaNaC+G5E1YapJD1KQB8/oZRlWBwDnPE0PdMalsNDUPqs
X-Gm-Gg: AYBFou0eUluKjxKqqQVlpOLSbr3KJ2bbcxaENZcl99dLLpgjarsKQvadxgImerdiZNJ
	5+hxg0o6pe5Hl7chx9KJfH30FBtxY2/5EH8TF8+C/cyirSbGPZnaeFTRg5Zx673AEBbMYeVkuo7
	A9Yt3F5q3atB/WlUsxWaJjNLokRXAD+vyydmSiFvQFoicEBKt47Asgq/pc7pETod95HKft/yiFi
	y7/giN/nfVAmOfR/IRPUVDUi/S+IMtPebgxUcVR/HOW+BH1PGER5QA4la5827BegBzWWP0d+KRa
	Pf76NbdtGg5fAJFSKUuxI/iDZTWYKuGMw2neWxsOTgY80nZbRSqj9fOVr2k6T4Vv31hYTB//3Rh
	uo8zI5JcItkuL1TFcXh+JxyprS5FOAzRu/UHwqItSi9IWxYXFGwwsqlbbXuXuPNUowmctwAYBhj
	r7S98KFRPv3t/qVTwlluhWkTNt8Y/TYWsuag1fjwR0xfn8CkmBB+BelfBwjl2S929jSjUWRDL39
	j8E/Z30EPDB80vPCvXEA1oXWM7G+tATKyYHnY3lyPOUdHoU1de192Ai4Dy4FOb0/r1IkB1SFGgH
	uOJIwBwV7tLyvK2yOLfmNp8G0MsaGvv/dUeeewtOf4NngjtYq55yW5zsxZQJKCYcfbRUEa/jSw7
	xLp9lFuQvkg==
X-Received: by 2002:a05:690e:4007:b0:677:c605:b736 with SMTP id 956f58d0204a3-67ba4f3da5bmr934225d50.43.1793333345148;
        Thu, 29 Oct 2026 21:09:05 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba756e5c2sm310717d50.23.2026.10.29.21.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:09:04 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/2] perf alpha: Decode ProfileMe samples
Date: Fri, 30 Oct 2026 00:09:02 -0400
Message-Id: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7Zi2GAKuvAdhUcoUxgBtWiQaw
 t0teACXL9/P2yBSYIpwzzYItHJkNydQlwzMoOeekLvEoIQqpFAlegoW9egHjT44yyNNhKVIWVW
 1lKsc0tQHsvw+b+vmx/HVPsksx9fRGDguLnxO7yqP3h/FKlGgvRVGVnnZCSEf/aR5vBo3QbPv+
 xeAhpVnygAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Fv5bg9fYYkT1GcbeqWxYqtphm6wHQyvs/kxSvur0KhY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeSMQZyjbeZxW4VnuYW2aFkJC5lIgQR9fLZfNaEraYp
 G+5VBvZ8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNdEJDP8sxBiPNWsVN
 ydf+S8//XDTQtfCR3fdUgpU+PmxJMPv+x7sp2RYbaBuMlazjVazw7tiQm/UHVxT72e6/P3J5i31
 T84p6MtywoA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carries
the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
PERF_SAMPLE_RAW data, which says whether the instruction retired,
whether it trapped and why, whether it was a mispredicted branch,
stalled before map, or was killed on a wrong path, and what PCTR1
counted while it was in flight:

  https://lore.kernel.org/r/20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com

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
Changes in v2:
- Patch 1: copy the raw data out of the sample and convert it from
  little endian, so that it decodes on strict-alignment and big-endian
  hosts.
- Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sample
  from kernel v2.
- Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-v1-0-f46c1938d001@gmail.com

To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org

---
Matt Turner (2):
      perf alpha: Decode ProfileMe raw samples
      perf python: Add alpha-profileme.py

 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/python/alpha-profileme.py           | 162 +++++++++++++++++++++++++
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 145 ++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 7 files changed, 344 insertions(+)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20261028-perf-alpha-profileme-8010299be323

Best regards,
--  
Matt Turner <mattst88@gmail.com>

