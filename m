Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745405;
	b=jns3F+SRle9Z2loFWWdGizO/4XYxG5S8jE0+RQQAHsMk6Mb6Jw6+/7xRhjnLtlhJ2wQY
	 lzdfjYNSpWz1M8NG8JM0I+lVvr9KwqCfyOyPgJa/5fsdgE/SCboTfhnHAGfbofUNriDuV
	 ncg8M7/h4xgr9cQhi2+y8Q4PsE7M6tJykl0XFIkOk9LQJeVYfJ7D8ZYrhvGOaob09x61+
	 HvR+A1LUdrtZWzpEwjR0gYbtXqPQrCJWgwAczB2STbv9Bxy0oAua0uEN1ExQJ+dlQjuiI
	 KyKUZci/dVclWuqnczbINfqL1iGjr01NQhP1Mqu57pTA+8Oht3lfHsgEOd/ZsPX+2mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4IKreVLwvzkycx/+a2vJ4WN6jd/0jq52BOWptHfX8BY=;
	b=VmTFBzUvc/cqssO8RHSQd7YVgUMQXRl1Jyogk9cgc8s4Xxe7NqiLZiTjOsu8KsLxN0rE
	 EQ3W8TSvbQTY7cAgMkQPfPDeqf/qVGNa9/0QfEs0YXqSqokkaamdxpXERx09+KCLFteR+
	 +mdwi0hrz/wCn3pfvkpWRDrpChX+Nf1YFDCA7uNvL21mdd8xMCB33m022veM9m+Nugm/B
	 SxWHZ3r5IPgzBqDX6w7tG2UMg15C11DP+sGqoHD81EnYO8O6KMKo5ALvEKpxyR31IelmM
	 ymHHAJ6/9+WDM3E5LbSzNukQgNjNty2HE2WtFfjgqBLml52lXdGfZo/ZH5riOi2YLdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zmua24I1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE95606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zmua24I1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso2882105e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792745403; x=1793350203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IKreVLwvzkycx/+a2vJ4WN6jd/0jq52BOWptHfX8BY=;
        b=Zmua24I1C61D5bHy7WsKoUzM57sQhaspfWR8TCfoLIJPXdT02lyt8tEMM3iDpe2QaP
         zOe8uTgLacHji1pZ5q7c2FULURO9xhO+rlR3ZX8bT5sHLcXuTIas8XTia4HVgRmn32Pn
         aukqB03YSmFwE7MwmM2MCnjy/VYTlUH5io8myHLpFy8QvDVHfLJs0lopj1A5z7Pc5qCz
         qugPebQd+wP7YV5x/80X1Yq8GlZzTmXhEtBrLseEHc2Go/XlUrLSUaIS7e9WkpY8CoQm
         k+DNdo/X6n7nJdhONpqlyV+L9PS7foBa1aSB3tDSj1S4VvmBzB0skW+gEb9ylc0cYTHp
         x7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745403; x=1793350203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IKreVLwvzkycx/+a2vJ4WN6jd/0jq52BOWptHfX8BY=;
        b=Un04nvgaCAGj8MfPeAD/ZuV48pKI/ZGYoE3nmD4RclrPYlBkf33wCl/Upe994Y+52U
         Q7MvSXtiVjXt1DaUeSrTUZtRvPsKDNDxB+JqPExMeVkqlIT3lbXXmlLquT5AJS/QgDR/
         ni2ooX4OHmt/x1V9ZbqkgjD9yw2XgLD834td3rqmpdMl1sbsvMx/44igHqE9gNYgImTL
         CMlcyqThMYN0uTi049g/uv+P6P5GBF6FuKVNgetLToxET0Vtv9LalKXSY2k17T7N5she
         KdWa10+MZlvIPed2vR+JDlMSjNnrHY0xN1H5KfL/Cay2wvPe5Sl4tJWZb2/bhM5F3zy7
         eQoA==
X-Forwarded-Encrypted: i=1; AKwUvBzwwbsvPG03wLqc5F4/47ZMCw/IoqUv4WiP9lyAYWnymy9WTmyaiYvK837ycZEwzjC7N1rO/SzD8uJdLMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuUlDZPoSg6jHIQijDXNGWURm4dazViPTZjfO4VqgzusXKLUDk
	LofYAgfrq5T4NxEGkoa3PipCNFf/yUOXYYoHFgy3DWkbmD+6G9eCIV5kTM/se0DnocQ=
X-Gm-Gg: AYBFou3hF38Qln7ZdJ/QBUPZOUovQCJ2j6Bq096vTQarATJotqkrtqo8zEZEJR5gx3a
	diUaujybqmN2HqVIcPoZxu5ovcqjoEeKPorovGTtX1sLHsv+AjHwWmeXdntFgP011Dv1e3UFT3O
	+/yS/YS2Vo75QwU8VX4dprUfgCl+6B7IJYqMtPCDKnzz5hMw3qpN9PYMdP47LH/Bbsv29zjEQLf
	lOosxk+YYz5i8cqjJ943rBRP0nsSn5zU4fto8P+oPvnx9GMFWaqieBLDYuUyKFocSVFDOdP7og/
	SPMKo1aJWMuQUuov9JmH3PN44BOeu5zfVf/ODlHMwUio3vP1/j5FR6LBLIF70a3exe3aHUYvBVC
	r/dJKGTLmd0naqnyDa4TfJk9VjJ+nOKTcw+Khbn8TjJKTt/afUhDwuYlt9E9dkipHIfGSlESJ9J
	syof18YXpOiCw8bAHTSgyYCkN7Bv1iu3NL7wScOUIamp9xq8hiqQ1GxFa1gkWm5nr9wCtPOd6q3
	bGHuNDU+fjNd/OX+uElXS7iPnNhkRP5ZTZFy+OtLqXTHRYz4uyDQJYlPTmKg32+USM0XiYSKsxO
	YuxYqdVxhfaGJ/clPSJD/I4l2f6V8uQHTtKy4so+f5Fa1voQ6qHNGMA72KM9LM6++biLvOr+1Ny
	fVrYgpasgRKaelzfE73af0KL3teqF+A4uUgJUdTMosoGMULxircAiuxYVQ8G/8Q0m8s0JPCj/cQ
	ctRMbmD/IB
X-Received: by 2002:a05:600c:5394:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4a211ef97cemr22798745e9.17.1792745402825;
        Fri, 23 Oct 2026 01:50:02 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-1eca-2717-bf6d-b62d.rev.sfr.net. [2a02:8434:fda5:4201:1eca:2717:bf6d:b62d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034d740sm65356115e9.4.2026.10.23.01.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:50:02 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Preserve event trigger filters in ftrace2bconf.sh
Date: Fri, 23 Oct 2026 10:49:46 +0200
Message-ID: <20261023084947.3264289-1-edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ftrace2bconf.sh reads each trigger line into "action active", keeping
only its first whitespace-separated word. For example, a histogram with
"if common_pid > 0" is exported without its filter. Reapplying that
configuration installs an unconditional histogram instead.

Read the whole trigger line and remove only the trailing histogram state
marker. Quote the resulting action so that whitespace in a filter is
preserved in the exported configuration.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

This is my third submission to the kernel. Feedback is welcome.

I tested this in a temporary tracefs instance on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled. I installed
histograms with "if common_pid > 0" and 'if comm == "a b"', exported
them, then restored that instance's actions with bconf2ftrace.sh --apply.
The original exporter lost both filters. With this patch, both were
restored correctly. An unfiltered histogram worked in both cases.

Thanks,
Eduardo

 tools/bootconfig/scripts/ftrace2bconf.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index f8f288f90c..0a066094f5 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -115,8 +115,10 @@ per_event_options() { # event-dir
 		done
 		DEFINED_VARS="$DEFINED_VARS "`defined_vars $evdir`
 	fi
-	grep -v "^#" $evdir/trigger | while read action active; do
-		emit_kv $PREFIX.event.$group.$event.actions += \'$action\'
+	grep -v "^#" $evdir/trigger |
+		sed 's/ \[\(active\|paused\)\]$//' |
+		while IFS= read -r action; do
+		emit_kv $PREFIX.event.$group.$event.actions += "'$action'"
 	done
 
 	if [ $GROUP_ENABLED -eq 0 ] && event_is_enabled $evdir/enable; then

base-commit: 22ab3094befd6ef37135e4a252c0da9cd755f75a
-- 
2.53.0

