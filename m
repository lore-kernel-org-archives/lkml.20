Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218549E129
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261920; cv=none; b=k7C1vkWoSq30OpxVhiHZD1cozLRIT1qrKaj/BaL5DjeQx1FVBgnWEPHYoFPXrlz1ISVqKRPHheBAbDVFpYvoSXCvyqYlhuOy+GemuwKXviMjdLnd74s4CY9MIja5eRfOYrQYDZUWG8vpxubig7s0vU8wVtp6THr0JT0hDSvIo0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261920; c=relaxed/simple;
	bh=cp1AhYwgoyBcNpnaWfbKwCvMcNX5AAJTHBA6wE+dkpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bffVjYPaMWvhKCb/ud2bbxlg+j+cvCrNwcDA/ji1dUO197ijcKDA2mQBJ9ahoyo7zVN55Dwqz4XiZl7ptI4S6l38XKOcIsHk+v1wcVNr8HzOQMOhIdrfap4U18N4+TxbKEGef3QZ609Zxn2gCeK72LjYI0zwzMzl5S7TBHbn4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gEQwkkvV; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gEQwkkvV"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fcd86b8d3so17761245e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261914; x=1790866714; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APC2vzzEaWI0IfcuCj+IJ6SBWsVQXpmXfTBg9jSKKIw=;
        b=gEQwkkvVD8VBv5z+N96rH5kPHhCX4WVZpLBAze0ArowGCu/x0RpeYRSXFQDqFi154B
         Usoaz7wFZpfubXxx2io2id3hD56FDeBU1BHExqkt+dCsShXS4zkJPnLDgiCBPGmaGiHo
         A6sPFU15+BYOl/1jDBzUX1LN5p8V2uubyTur7W7ko8ul1Lj6RhaunEtRRNwaI/9T/5Zs
         s6GDDknV7Y869KhYRYYKbu6dSNtDdFXpDEtAGCaC+IzeX4ztvSA//bY4dU3JeFHSMTAk
         YS6TNaC3++3dyPN+MqCf3xvfh+x3zxF+vFlrmL7S1R4oy8cCswFvwsb+XPgkN8ybNmPI
         VDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261914; x=1790866714;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APC2vzzEaWI0IfcuCj+IJ6SBWsVQXpmXfTBg9jSKKIw=;
        b=QaBfhvJ3CoW0wvX0lMTn3jlFLJeJX5oFTfBXfLwZiMz91W+cgdmROoKBR2etP29eHV
         FuFxRrmkAlCB1FtZ/yx6Tm1mpfQYCBQd0ULnZc1Aut0/ZBN43EHMkEn9ZvnUBTS8GxUb
         xMfnX3hdsD0Y9RoGbjmUrjpof92sv/J0Rw0MrIEs4sIpm7DTTvi0CR9c36Q7Zxv6IySi
         J5nWW4OaavsTrUqLlUFUwa48cL+dGb/CjU5hwXze135qiI9PF1bE8myE8XLLmZ60Wg5v
         zfhXU/TDXogMtJylCi9zlCc6q0QH0WM7UDDl4sudek5ZDGlkTZhLDwysR8paPvlOVZgC
         Kd7g==
X-Forwarded-Encrypted: i=1; AKwUvBxjYtce0+REbUss2+92IYfTIeLu4+JfQGEBR8mg3sdgGqAaeiV4HYsGZdo9NuzU5UVdIDaxMJgplD4hyGw=@vger.kernel.org
X-Gm-Message-State: AFuF++mRXoFRmwdzEd1IjDB9LvneKmpTUPnDOZJ06nbx7vsOpz5/E4ar
	ZuqpxaTYIMfuRb1l+RG73IW3GuaEFpa1LCYbITWRhy4laXL4QO59LNVxxPFomKrKeINgCv6OwzK
	a8PC7SWhueQD3MKIvDYk5FA==
X-Received: from wmpo33.prod.google.com ([2002:a05:600c:33a1:b0:49e:661c:77f4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c7:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49fe66c8e71mr45572405e9.2.1790261913911;
 Thu, 24 Sep 2026 07:58:33 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:43 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-10-vdonnefort@google.com>
Subject: [PATCH v7 09/20] tracing/remotes: selftests: Add a test for the dmesg
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
2.56.0.rc1.310.g51773c2048-goog

