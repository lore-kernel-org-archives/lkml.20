Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223613191D6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119553; cv=none; b=PZ4/WiA3ZjIC2k/K33BwiQIWDJ/aV4NdgQ/gGJv2G2kIIb5hpIvqigmAvET+NRv/dPvXsj0oxlYExx2u7kjfO2+dyQZmh1hmngJGo79a3RV8MOTrfGixakHrkqJXpSva1r/UyFt72TgzUFJ0YctNBeeeIWH1vv50EDSebrysv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119553; c=relaxed/simple;
	bh=tQwU97Q5Qc95/ZILTtFW5OQzgohnrKuxWIQ0COr+06g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aAg8l+l8WkEGQ1vugXgWbQRZ8of7kIXIvu+AZlWXOG1KnrBd5VtZh02sq/7o5CYL1vur14Sco0CmwjJub/NUDPVdR1xWSnkC11MLEgwKcSjjti9vlNu0j3OO93hduaUc1QXRlaBwwOCA8kPlPlNhy+XHjSLKvfiDpmr5o90lYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jElejrT1; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jElejrT1"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1400486eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119550; x=1792724350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1L4X9krWaj/8h81mwCk+OQw5bXYP1pwk3yum+RjoZtY=;
        b=jElejrT11P+6mJgBf+ifll01z0ShThFRLA/ozm8hQR7rWZd1hrbAj0vHbmZcnGZMqG
         H5rsnIjxpKZxBvCzIyN072Uvo0vQwnUssKindVvUUWC3wnlz0HsjNWjbuWWvFzgMBWNs
         oe3FUz3MT97bzxrOtny5faSa2pw+rKVZjZjbqK0REDKSI8kXLSWBfdMiIn+/4gMW9aX4
         6cYsMq5CTqfxT/EA/GTYIPS0RsZBD1IPMiiU/Zy70hTougB+b3XqRM92fQKVsH5sLXPP
         n7mGX7iMnhDYSL28KBpS90am+P1kh7BuOROY77WTQ/EGpUIm/o/9YlRRQWk5AWaSccFy
         7Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119550; x=1792724350;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1L4X9krWaj/8h81mwCk+OQw5bXYP1pwk3yum+RjoZtY=;
        b=RZ+emwb1Nj7pq7S4N6z3lyQp2Y21yk/gzrdkEWcw/SpzaheT/SRjT0WSw8G6ObndFO
         /PrfZHN1Q4OaHdi16bUEWgugQJlbmRZ6czv0GJROiQqcqAfbFuSZ1DBxd7zh+TokWYBR
         UCacD6dILiDWRTRDJxI5nGg/NgOjffpB7mNvSakiRT1nbV4XHWM4gokJRrPuGZGJ5e1p
         ed+ohITlKmjx3bppG38+fMVRg7Fxzw+0w3fKASnmF/U1wwpKLOZeUdCNSjAdsg1x0ZKd
         anKjSSpBwzPIVmhaMxSHjT5TJ1s7oJpJVJR9YC/1asXMOmTBA9oocnTEejqpMA6HLBvL
         mncg==
X-Forwarded-Encrypted: i=1; AKwUvBzKr97Ub/le8zN/twoVt46Nkzi/wZw+tJOTJaTREkt0vOtE1zCEu+PeygiULNqEdCDuvFh1KZ2rfmeZtbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmEmFMC1IXvSdyYIpQ4wFztvb7VJBwpeayo6fcl+iNCtzduQa/
	sq6mFo9YTAKD24+2Xtff6PKlKks5ys9/fw9ju6ExLtlM/nKOvgD2nh3U
X-Gm-Gg: AYBFou3roNIS9t/BBfTq5NDMJoGgdahUgSboaUEMN2CnWewyVxike00OEq207gAjuei
	dP5/MxCtU72QQAVe0EkLwrElg5qUXeI+b6aInJYewyqjw3dXrfk1t3unPax4BUXIAoOGjU7vIY1
	sbtTXXeW3eXXb31owJJUzdcwHXj9KQkourVPYWM+Tgaa3Qa7QG/jtYw5wpduCDvJPMyjpb24hI5
	51X3FkHPB54p9P/rLycZtLKXy35StifdR6JznzGeMjxYHL/rQumJkwiwLG1Hq3GETQqQ5SXIkJP
	AkMADaZVhQLXpn+cUqTxJpzyuWbR5Z7JAFyxx6/ZCs5BFrwRrjwdnmYK5sVz5KFJ5FHT2aygJK1
	fCUk7e5kHSXyovrbKkhZ3XTwj6Tpb8Gm4F/D/7SO7H7mhXS3R2W5/huxfIF1jJ9jaDLckRz6c7P
	I1DxemUvkAiA2F20kx2hQTTbNObAu0CCiNwJ1fj30pTe6vDN8QFkeEsuK/7rT6PDcE/Q==
X-Received: by 2002:a05:693c:80c5:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-35f6d9db757mr4457148eec.23.1792119550091;
        Thu, 15 Oct 2026 19:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm2481261eec.3.2026.10.15.19.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:59:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v4 0/4] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
Date: Fri, 16 Oct 2026 10:59:04 +0800
Message-Id: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPiS0WoC/5XNy27CMBCF4VdBXncqX5JQs+p7IBa+jMESiSOPG
 4GivDtuVhGrsBwdzffPjDBHJHY6zCzjFCmmoR7N14G5mxmuCNHXm0kuO8G5BsJ7KEiFwI4BqOQ
 /VyCNBIYoOSixxwwtWi51i05xzio1ZgzxsWbO7P9vwEdhl7rcIpWUn2t/Euv+WWoSIEAbfTTaK
 i+8/b32Jt6/XerXwCQ3qOA7UQkc/NE06kd33gbxjqot2u5EVUUxYNco31hp1BZdluUFa6epVYw
 BAAA=
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
and expects a timer callback of its prog, 500ms later, to find no
struct_ops associated anymore. It fails now and then while test_progs
runs other tests in parallel.

Since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
optional"), a struct_ops map clears the association only after the RCU
grace period of bpf_map_put(), so nothing waits for a prog that reads
the association in between. A timer callback can then return into a
freed trampoline, and the kernel hits an int3 Oops.

Patch 1 lets the association be cleared in any context, and patch 2
clears it in map_free_pre_rcu(), so that the grace period bpf_map_put()
already waits for follows it. Patch 3 adds a test that catches a map
freed under a running .test_1. Patch 4 has the timer callback of
st_ops_assoc_in_timer_no_uref retry until the association is gone.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V3 -> V4:
- Clear the association in map_free_pre_rcu() instead of deferring the
  free of the map (Amery Hung)
- Add patch 1, replacing st_ops_assoc_mutex with a spinlock, since
  map_free_pre_rcu() may run in softirq
- Stop st_ops_assoc_in_timer_free and _no_uref when running syscall_prog
  fails, instead of waiting for the timer forever (Sashiko)
- Point Fixes of patch 4 at 0e841d19263ab, which added the test, as the
  delay left after patch 2 comes from freeing syscall_prog

V2 -> V3:
- Wait for an RCU tasks trace grace period in patch 1 for every map, so
  that progs reading the association under RCU tasks trace, e.g. from a
  bpf_wq callback, are waited for too (CI bot)

V1 -> V2:
- Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
- Add patch 2, a test for the use-after-free
- Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
- Move the restarting of the timer into patch 2, which needs it too,
  so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
- Rebase onto current bpf-next

v3: https://lore.kernel.org/r/20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com
v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com
v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

---
Qiliang Yuan (4):
      bpf: Protect the struct_ops association with a spinlock
      bpf: Dissociate struct_ops progs before the grace period of the map
      selftests/bpf: Test freeing a struct_ops map under a running prog
      selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer

 include/linux/bpf.h                                |  2 +-
 kernel/bpf/bpf_struct_ops.c                        | 28 ++++++++++--------
 kernel/bpf/core.c                                  |  3 +-
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 34 ++++++++++++++++++----
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++
 5 files changed, 63 insertions(+), 20 deletions(-)
---
base-commit: 15b578b1715d9a318c804350d98af87c203672bc
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

