Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7721B469856
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392236; cv=none; b=rdeTa5IdD4VJgfjbE4RAsNFYE+AYGS16EQ8hmDNC4in1lLr6sNfD6+3VKrPSU9amv8Xdv0oPF3u//60yQvysbL11eWV16FMJ1HOL9YX7ZxRq0NFL3oVbsyEydpUwrIR0ipAcrNHra0GZukLxrrpYmCqclVasKGq0hUg3Xza8RK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392236; c=relaxed/simple;
	bh=OuTIZeT/AghyPafQp3fT5mJjsC+pfQMeOe4QJeL3G+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UON5LFCl/LxbeB/YxVjkEIat4sEm3fp3NmwH9YD0BebDQ91uyoki7Oh212NyVoWH8Czc+IP6Ra6nsrgFaCTohIS5Ej7nCYZGtqKnH/NuGOx4xMkQE1EIpa8dFvY9zh0PvuAj6RSMAv6X6G6ratDNkABMtHw2hAneQhk8i4nzEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9E8vfHp; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9E8vfHp"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1851978a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392235; x=1789997035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7vTzUhnMyED4pEMC1tFaqZHzEKwfASC7IbldcQj558=;
        b=I9E8vfHpJzpnAqcqGDdNr8ASaWbC5FlcExp55dTp4FC5KQaGVPZmEVi4a6YDJ1yOXj
         /lKpLuY1olOxiXAGjKFmQ2mb86PRi2yNW1hQRVdk1fgOaSrmbvd/IuIkysJIxtuMSqKt
         FyhGlX0Eh53RuVyyw58eBgAXGeVq5uC+F1ACZUmcIwWUFFGN+NpAZezV4LTPNlxamyRC
         4fXjoD58OoZWc1okDcIojYJ812dAep/Ibi9t69pn4z42Jsdk4r5LmG4XMgv7b/pIONM9
         SlalsBBGD3m1qUMFlhrFyKDS32TUqBwVsqFNUbE3gFRUKgjuLu8USn1XIAMtxT2kkdCo
         j9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392235; x=1789997035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7vTzUhnMyED4pEMC1tFaqZHzEKwfASC7IbldcQj558=;
        b=jpAdcFptzeWNpGDpJSXeCk7Q49VF+P9L8J5dNNvywoOmnrbch7F/9UlzgnJWCvG1qw
         dTsALgKjFJanY5DxVoOAAcR6AVLxvLSHapLZS0I6m2sfbcrVsPrtM0Uqh9Mp8ncsFesL
         pq6EJDz5jtsQZYaHWY2a5l3eWQOdDYCw8dUFfTYZSNw/ympPJvbA8ig8Mw5jwrOBgJDE
         I1lUeGfB8gquPCaff1IpRuApYkMrPigsoOXdhiVnQQ2LjB3xIO8buyBQjD/u0WGlherv
         N2dEs3I7tmbYQ1NQmuGSZJbqX11e9uQ/kKkowibJTZwnclsqsB+57C2jCcJtNcPiuQGo
         x3CA==
X-Forwarded-Encrypted: i=1; AKwUvBzFOZr9E49UCAfCMsql5JQl/QQEUxlUA7GI9FNt/KEtxeGhcwM8xqq9jeNVsSv+Nq5cIYksaOQPwzPCT6s=@vger.kernel.org
X-Gm-Message-State: AFuF++kZErFG76n+D7prSz6zswxXJ+NuVEG7ApzUoLtYT3pcvNePXAmM
	d0iL0GifP6jDvEgRlrR00zjaA5XeeUXCGno67oOTh5cSc2nB153xrTg=
X-Gm-Gg: AYBFou0iqc9MYvYdsS4elET5+c+ZzKSINJWJCVNZJYM+xM+WiZylP+1Ppmp+y/DVWhe
	VyMFW2FwVfqcU3w9xImMMtMMIYfGz5/CDnM3VM+MCwh7D0mhFNxviUVy2q5vnOWYc1qWShiFRou
	PfAFW7lOnpNi/pf36iKJySW0O0Qpz7RquEPp2qnifMOazk0IlDnMN3pnyxN2GxCfCgjj8soVGPN
	bW7sjInevklopYTCIqRM+KRDSa8KE9NAuI3S0im2uNjr/a2dUAOqklGNrjBhMmw0hwOV1ZeARSx
	TYXYDTQtTmVxs/kslHDIxCJF94zVLx4qYosspQtQg6eBvH/7Zg7Z4RaZTDhyczkIKRXI74vSEi6
	UdOUNECLrYYt4/Lk/3UoksBu+jEL3bjcr+3ZUXwa9ha6IYinQcjL3pT1F/B9Er4xZXSSH5nunBJ
	laD+2xdc80TzgnmTCo/7vpVsrpg50X4H0/gY5SDuSKELDO4NFPRcTqD08gYDRj71vNzZmnaP4JK
	c1FHhEU0GhhLuYvKioNnbdVBvU=
X-Received: by 2002:a17:902:d4cd:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2dd6c76c7f8mr50088735ad.20.1789392234581;
        Mon, 14 Sep 2026 06:23:54 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd5650198csm26768095ad.84.2026.09.14.06.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:23:53 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	zanussi@kernel.org,
	namhyung@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: Clamp the printed end of a histogram bucket at U64_MAX
Date: Mon, 14 Sep 2026 22:23:46 +0900
Message-ID: <20260914132346.2234731-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A key with the ".buckets=N" modifier is stored as the start of its bucket,
and hist_trigger_print_key() prints the range it covers as start to
start + N - 1. That addition overflows once the start is within N of
U64_MAX:

  # echo 'hist:keys=offset.buckets=10' >> \
      events/syscalls/sys_enter_lseek/trigger
  # ./seeker 5 -1                      # lseek(0, 5) and lseek(0, -1)
  # cat events/syscalls/sys_enter_lseek/hist
  ...
  { offset: ~ 18446744073709551610-3 } hitcount:          1
  { offset: ~ 0-9 } hitcount:          1
  ...

18446744073709551610 + 10 - 1 does not fit in 64 bits, so the range ends
below where it starts.

The bucket does end at U64_MAX: it holds every value hist_field_bucket()
maps onto its start, and there is no value above U64_MAX. Clamp the printed
end there. Printed honestly the group is shorter than the size asked for,
which histogram.rst does not mention, so say it there.

Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Tested under QEMU/KVM on 704340f1cd0d, x86_64, unfixed arm first.  Keys come
from lseek(2) offsets.

Nine cases over buckets=1, 10 and 16.  One printed range differs:

  buckets=10, key 18446744073709551610
    before  ~ 18446744073709551610-3
    after   ~ 18446744073709551610-18446744073709551615

The other eight are identical on both arms.

ftracetest test.d/trigger: 42 pass, 2 xfail, 1 fail, per-test verdicts
identical on both arms.  The failure is trigger-synthetic-event-dynstring.tc,
which needs a ping(8) that is not a busybox applet.  No case in the suite
uses .buckets.

 Documentation/trace/histogram.rst | 3 +++
 kernel/trace/trace_events_hist.c  | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 340bcb5099e7..97b67f05f5ea 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1943,6 +1943,9 @@ the ".buckets" modifier and specify a size (in this case groups of 10)::
       Entries: 16
       Dropped: 0
 
+Keys are 64-bit, so the group holding the largest values is truncated where
+that range ends and can be smaller than the size asked for.
+
 To save stacktraces, create a synthetic event with a field of type "unsigned long[]"
 or even just "long[]". For example, to see how long a task is blocked in an
 uninterruptible state::
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..86df1a29d8d5 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -5560,9 +5560,14 @@ static void hist_trigger_print_key(struct seq_file *m,
 				   *(u64 *)(key + key_field->offset));
 		} else if (key_field->flags & HIST_FIELD_FL_BUCKET) {
 			unsigned long buckets = key_field->buckets;
+			u64 end;
+
 			uval = *(u64 *)(key + key_field->offset);
+			end = uval + buckets - 1;
+			if (end < uval)
+				end = U64_MAX;
 			seq_printf(m, "%s: ~ %llu-%llu", field_name,
-				   uval, uval + buckets -1);
+				   uval, end);
 		} else if (key_field->flags & HIST_FIELD_FL_STRING) {
 			seq_printf(m, "%s: %-50s", field_name,
 				   (char *)(key + key_field->offset));
-- 
2.53.0

