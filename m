Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988475;
	b=fHghYtnl/gQsZ5JPN+Y1bOxzn+hUJVmr2mApMW/76fUPgJLVO8UCimjvpS3MaLv/uz7E
	 LcKwfYr1EzrHrVQRbs7TPMDBTqU6H6wGKbwu/iXigvIHPsN4nwK68xM96HYJC+armZRz8
	 EDs1SjMiwQxhyYD1q2fF52iadIjMF/XXpdLU7DLXBBmmC9njnMKmMgLCAKcNOHC3ETV6t
	 1ZAEYV8hdrYKOP4zqaStVjZsv3bAE6PYXRO6yXH0ABnXSy/7HrpVWRGVCH6/FQnTg8AMY
	 /iA3wONf/XZyiVXYMzSM04rbRkhOA7pSG/jdkSdcucZtnjwwkay7+fuqZ94tiF0ZVpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bNP0cGXOHenDMUkHAvBk8RqWahoi+t4WRJf7nDMcLHo=;
	b=CprAfBZwrPrxzYW8FAyyGtn88KaOxJ5Clx4KxACBkM6ecUpDs1FeqNiaiy5nlgVIlq7W
	 s065zfH7/4tVSy4qEmsbZ1y2NtS2TbvYkuDUBFiB52kIxMXFuasdjAYy1NEZ4B67EIKkZ
	 zhzAGXY1dTCEpH4py2WfFT6nRsBPCpLrs4clylEKJP+ZUxb/GY7LzGwkmgUBSKypZpUn9
	 WAZT8siEI4jSh6p7hK7mfuNA1tMd9hy+k71PbGV7rzOUB1OVDnUUxPXCbeh4j8rQjlq5J
	 2tBWSpEdUvkcBznlNwaaUN2JgatjLJcKmTVqswHw4mdDIBQNKGtaYmI+yCTnH17zdZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ZJY5/cYO";
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE5606EE81
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFE5606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJY5/cYO
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so6844255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988473; x=1794593273; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNP0cGXOHenDMUkHAvBk8RqWahoi+t4WRJf7nDMcLHo=;
        b=ZJY5/cYOXLhhdEKhblqsv+D30Qt0aUMmnALGl9sUVy1XKgfRw/cEinZtLCGIABAESe
         UX4kVn0ouAsKe+JBO2itANQoqunJ/o2Sr4Er4kJzDzz1EqkgbqUXb77ZFlrVx0899BHE
         QLOIMtqAUb+NQPf8ZzDZGFeI2mZ2/BQTymeZdqWNTJTU68S75lv/RGnxVbSl/ie24RWP
         3+HNEpMdtGB5WXoJ6dMa2tm4hW0tsHoTnSTaCs+siUv1xKW63SAXk7A6v4jk+caNuf/8
         VjFvGjiMcTqd10aniAVZGvLSveI6vd247NOp3VKgCTsQky7sf9YCutHjcRLsrbsE9NTe
         cplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988473; x=1794593273;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNP0cGXOHenDMUkHAvBk8RqWahoi+t4WRJf7nDMcLHo=;
        b=q8L5QJDbgK44QwFhyqkV+yBMgme0HQi60BCAePbb7L0UuCg0nzOYXbCZk/ndnn/hhq
         nYs/hCVQJXZoVu0pBf8M6YYR2umt4yOuhZ//DKpUMQxyc9F5IbhE/dONJKwu8RKK7/lW
         0IJTD4+A5vHPDJcrWFb1x6ygRyt8aAkSIlipmdJ5N5qaM3QLER0d5jHKlcht1B2DuU07
         h1+SK7HoKAziMGWEBXXtkjDOmnsftFQBsv0JL73nb/yTt+aI3iXv5FSDzSYKOiu7lFJF
         lPJyLyl9vTXraMqQbFOfvLAXKGOsVhLL/YH8Z8C1UBnLdr+g+wcJ4ZD/AjHrM0Oi99vU
         6NSw==
X-Forwarded-Encrypted: i=1; AKwUvBzRAxGRkhBvBot6BC6lw7W5HlMnWtnnnIUQqs4xAZdTsJJQs3EntIbgFFsGgyTnOkLOmFiWGKb9rpkKBlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mf6yqwa2nZT74v+89D3Dq5ph9i5DDsWzSHdZ70747/oKryOiA
	Cl55phsCWs70TYp0TiaBm5DtacTDu9GwGnnXf0XP6tQoMuWFqXI88gGcJb5WaHMuAB1+vcD4UV0
	88bXt9TtK9BE6idggSrxPug==
X-Received: from wmwz19-n1.prod.google.com ([2002:a05:600d:6413:10b0:4a1:f4c2:f6c7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5294:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4b6dc40027cmr59015825e9.3.1793988473177;
 Fri, 06 Nov 2026 10:07:53 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:45 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-10-vdonnefort@google.com>
Subject: [PATCH v8 09/21] tracing/remotes: selftests: Add a test for the dmesg
 tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Exercise the newly introduced dmesg tracefs file that turns on and off
the dmesg redirection.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../selftests/ftrace/test.d/remotes/dmesg.tc  | 86 +++++++++++++++++++
 .../selftests/ftrace/test.d/remotes/functions |  1 +
 .../ftrace/test.d/remotes/hypervisor/dmesg.tc | 11 +++
 3 files changed, 98 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
new file mode 100644
index 000000000000..a5dcdd91e516
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
@@ -0,0 +1,86 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote dmesg redirection
+# requires: remotes/test remotes/test/dmesg
+
+. $TEST_DIR/remotes/functions
+
+test_dmesg()
+{
+    if [ ! -f /sys/module/printk/parameters/time ] || [ "$(cat /sys/module/printk/parameters/time)" != "Y" ]; then
+        echo "printk timestamps are disabled - please enable CONFIG_PRINTK_TIME"
+        exit_unsupported
+    fi
+
+    echo 0 > tracing_on
+    assert_unloaded
+
+    #
+    # Test dmesg on/off when tracing is disabled
+    #
+    echo 1 > dmesg
+    test $(cat dmesg) -eq 1
+    assert_loaded
+
+    echo 0 > dmesg
+    test $(cat dmesg) -eq 0
+    assert_unloaded
+
+    #
+    # Test events are logged to dmesg
+    #
+
+    echo 1 > tracing_on
+    assert_loaded
+    echo 1 > dmesg
+    test $(cat dmesg) -eq 1
+
+    # Timestamp format is '[    XXXX.YYYY]'
+    last_ts=$(dmesg | tail -1 | sed -n 's/^\[ *\([0-9]*.[0-9]*\)\].*/\1/p')
+    if [ -z "$last_ts" ]; then
+        last_ts=0
+    fi
+
+    nr_events=128
+    for i in $(seq 1 $nr_events); do
+        echo $i > write_event
+    done
+
+    sleep 1
+    output=$(mktemp $TMPDIR/remote_test.XXXXXX)
+    dmesg | awk -v ts=$last_ts '
+    /^\[ *[0-9]+\.[0-9]+\]/ {
+        t=$0; sub(/^[[ \t]*/, "", t); sub(/].*/, "", t);
+        if (t+0 > ts+0) print $0
+    }' | grep "selftest id=" | sed 's/^[^]]*] //'> $output
+
+    check_trace 1 $nr_events $output
+
+    rm $output
+
+    #
+    # Disable dmesg and verify events were not consumed by dmesg
+    #
+    echo 0 > dmesg
+    test $(cat dmesg) -eq 0
+
+    start_id=$(($nr_events + 1))
+    end_id=$(($start_id + $nr_events))
+
+    for i in $(seq $start_id $end_id); do
+        echo $i > write_event
+    done
+
+    sleep 1
+
+    output=$(dump_trace_pipe)
+    check_trace $start_id $end_id $output
+    rm $output
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+
+    setup_remote_test
+    test_dmesg
+fi
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/functions b/tools/testing/selftests/ftrace/test.d/remotes/functions
index 05224fac3653..c368dea2ac4e 100644
--- a/tools/testing/selftests/ftrace/test.d/remotes/functions
+++ b/tools/testing/selftests/ftrace/test.d/remotes/functions
@@ -8,6 +8,7 @@ setup_remote()
 
 	cd remotes/$name/
 	echo 0 > tracing_on
+	[ -f dmesg ] && echo 0 > dmesg
 	clear_trace
 	echo 7 > buffer_size_kb
 	echo 0 > events/enable
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc
new file mode 100644
index 000000000000..4d6ce8fed3cb
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace dmesg redirection
+# requires: remotes/hypervisor/write_event remotes/hypervisor/dmesg
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/dmesg.tc
+
+set -e
+setup_remote "hypervisor"
+test_dmesg
-- 
2.56.0.455.g6c5a503b38-goog

