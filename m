Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55D26056C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834842; cv=none; b=f33i5tSFfHDlC1np9NU8G3PntPPhbN5/8MRONG9knurFsnw3kRHEF+PS2MOT+Wg4D41Twx4jmk2gNzE1RSOxM3DE5x6iYlsD9B+a5/WapuPLhl/D/AP8KqpTAW5599e2nySADXlwfDt/xPJMjUgmpszTmoMRp0UWiYqHiN/ES4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834842; c=relaxed/simple;
	bh=mxTE9KurbbuZsjlYngZ9+/rG/eVy0hDEZu3yRg5FO7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oznjWGLlmU0eSZBJi2Etr98+lKzuqgPNAfsWForqFlKGbEyQYOVKpmPasVijhDS/rUGjGniH6pPH9biIJ4BcjfL5UZOHCr6lFzzIivbfGyphy9L6t704oMruHLu+FeFDE9I+svuQynqEoSsq/GlPe4HuimLJeAho+dGss26Ll4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg; spf=pass smtp.mailfrom=starlabs.sg; dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b=lj22YfQ+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b="lj22YfQ+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3556392a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-sg.20251104.gappssmtp.com; s=20251104; t=1788834841; x=1789439641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTFCxFp1+0I+kkxnGsLulqSFRNalkX2NGoBoSUCrW+M=;
        b=lj22YfQ+7sbJIBIJJZDCWkNiZ8jEqCONF9iRC9T4FVoYHGs3+xMmLI3ZgmQ40e4XsG
         iAWxj4yYqloPwk2GbBCUDKYPCJpK6HuES0KKHqOKyEYvdrvmBYNFuZej8DRBMyGiiiav
         zHtDif6rXUhTuscGd9tGq+lYbrK2zvm6ASEvuekhxOzPEcQ9UimFwq1DvyoTKtCAM6Ct
         6Xd3181xEZmFG2F7BRmnrmg8Qs88J08LElPT0/uhQneWZxGonLBLjiHiAcH7bCk+TfcO
         qT2ubhGT73528IT6zSr1BMm/hVbkFy8ImEninC9Mox/6pmESg4i2i8KGlNHouFaSsMyV
         zhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834841; x=1789439641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTFCxFp1+0I+kkxnGsLulqSFRNalkX2NGoBoSUCrW+M=;
        b=Nt/7F+bvPfXNdVCT4EnY2SVcRfIz5PU0XyvjdNvQ7F2HMThMmB3cnvk/2W243GYFY6
         TFgJGd3DtipH0lORhjdm4MbnT4S7LqahSKfAMejCIy4o7EVwjQK9E4bKl9GD2Lt07/xz
         x1q8+sXV80f8RS4wH4uo25GJ6SxeVwwxQz0RVRyRvNZJAxHCgGaXtistcsOd4RNH1cMG
         AHWM83qWgtNQNdYtr7L40QY98R2mnXhaw1hgCcNnDSXUrwHPNZ1KzvieTOaeiQYIqh/L
         IemS8jgig/Fxsctz9O1ALRihEWlk6MS/cutc5Nt4TGv70IslSWM4PHV8n8/Z9hXdhXGv
         GwvQ==
X-Forwarded-Encrypted: i=1; AKwUvByG+T90Nakq74wJ6K0IF0SdU0WHCT+LMQsRigMInp79eRVFPWb6TVLFjR/sWNDkPUx04yZX2eUvcla9gRU=@vger.kernel.org
X-Gm-Message-State: AFuF++mTKkMNhVUFpuCIXeLc3O8L3bzE/2LeGdBDPY9PxTspK2bgtQvT
	T4H5uZh9UKqHkWuk/1VQbJ/l1rutFx+XMjn6YEtWvfat3pgyBrWt+HzUIciIV6wHeN4=
X-Gm-Gg: AYBFou0gSiFMqU6Z1L2AOFeFoWG3s57ieKhVy8yhBZZHKIY4XBtbKuTRTkQ5E9lt5TR
	npkabvKJAUqYyV0d7nYbbRxtG6rfuxwuYywtFir+ehquYRHHBl4K/ykHDGXwuClL4Eu1RJ1r0lc
	s4A+xjP+GZ6tEIt6VcNegW4UGire4Rg9NOgqREcaw0OiJhR3M/w/C0gmd1GAK3tPg7/i8FPMYLR
	RfMfjeWWFbDYOuBbJzsKM7u+TSxAOPr3AkBDi1F0QXJUIRKHUyiE394+9mIxY1t6jK60TGZZ87C
	QNLNMvM8IIWwU0hcynzVPju7KMDDUq8hu4jjHBeADTNHH8W05JW7T/+5wUK6dbgCa1CxhlBXxWE
	E4D6Vz3a61bmpzMeY9eVCck7nJk2FXo6uOWA9GA8rJGT2GCdMh90MnspPpLZkoE05xmM/DvyEcH
	BXIW8WW6PIiXUCQBAwTKFDTIlAtTFpupUDql2xxZArogevgRNFlZZxXFn5VKRhB0MEc2BLZLS/s
	A36wWE0ze2jEIuHKYodpPymTrhB3zJVMQ/zRc+fyhRyfwV7b8ahW/q8TMZ1cQ==
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr40608122a91.7.1788834840655;
        Mon, 07 Sep 2026 19:34:00 -0700 (PDT)
Received: from SLSGDTZTAUFIk002.starlabs.sg ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm29386513a91.0.2026.09.07.19.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:34:00 -0700 (PDT)
From: Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>,
	syzbot+1340ad4350ad43394c10@syzkaller.appspotmail.com
Subject: [PATCH] perf: Fix slab use-after-free in filter_chain
Date: Tue,  8 Sep 2026 10:32:24 +0800
Message-ID: <20260908023223.1516819-2-zafir.taufik@starlabs.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a slab use-after-free read in uprobe_mmap. The root cause is
when a trace_probe has a sibling event, unregister_trace_uprobe() does
not unlink &tu->consumer. This memory can still be referenced in
multiple locations, namely filter_chain and uprobe_mmap, resulting in a
use-after-free. This is not a security issue as creating uprobes
requires CAP_SYS_ADMIN.

Here's a short repro in bash which will trigger a KASAN report, tested on
v7.2.4. Note the offsets used for /bin/true may need some adjusting,
they are the offset of its entrypoint in this example:
```
echo "p:uprobe_test/evS /bin/true:0x23d0" >> /sys/kernel/tracing/uprobe_events
echo "p:uprobe_test/evS /bin/true:0x23d4" >> /sys/kernel/tracing/uprobe_events
echo 1 > /sys/kernel/tracing/events/uprobe_test/evS/enable
echo "-:uprobe_test/evS" >> /sys/kernel/tracing/uprobe_events
/bin/true
```

This is my first time sending a patch to the linux kernel mailing list,
apologies if there are any mistakes.

Reported-by: syzbot+1340ad4350ad43394c10@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1340ad4350ad43394c10
Signed-off-by: Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>
Assisted-by: Deepseek v4 Flash
---
 kernel/trace/trace_uprobe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index c274346853d1..8738c46a6ebf 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -408,6 +408,11 @@ static int unregister_trace_uprobe(struct trace_uprobe *tu)
 		return ret;
 
 unreg:
+	if (tu->uprobe) {
+		uprobe_unregister_nosync(tu->uprobe, &tu->consumer);
+		tu->uprobe = NULL;
+		uprobe_unregister_sync();
+	}
 	dyn_event_remove(&tu->devent);
 	trace_probe_unlink(&tu->tp);
 	free_trace_uprobe(tu);
-- 
2.43.0

