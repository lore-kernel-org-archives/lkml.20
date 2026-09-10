Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB9380FE5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007616; cv=none; b=O3nFx2yKlbCIoNY7QYNaZROVj8vMFv2FmOgMjdZGSS357r1jUKYF3t1M2KnX0jtEflHevyS/HvaKtNlbxONtgD1imLztR/0IKNP+f3D3K35xhHQyE3mUwutc0Qts4ImK7yrKzhQ/w43Poi+qDoVxF3NWHM2cPTk/gio93jM36o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007616; c=relaxed/simple;
	bh=PRcINuX1tw7Br8al9eoW9L7u74k4XsbR9+/Wlzrvpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sf9YoFZWCCtd9AXqvDNawktdcjeq//w7LcDl1tJ5LBIwm/5rFsQZp9rFuO1I/djVE5y0HfG+2XNV6HpVpuEYZQMDZ690SGvdqhBnFoUyDFa4BhxwYv1WbakLDOhzvq2HEmMCZ8dKE3hxDuv/9npkXiJYX5ntiL5cfkWaMv+JT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg; spf=pass smtp.mailfrom=starlabs.sg; dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b=Stvfdilt; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b="Stvfdilt"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4b28b358eso378676a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-sg.20251104.gappssmtp.com; s=20251104; t=1789007614; x=1789612414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaxI37OQHzUYDVOni7XBy4EMpiTKEW+dinVvRL8tiFs=;
        b=StvfdiltxxLiQpH3gqxp+nY53BoyyVPR2JuaK3FWnCqoqEBxv/AE6UzZhyOr8NGYLF
         OpJ24Vtp5SV4CS1Ds5NVwZeF7NjopKCzuCgSJTYZmgUxq0j9HpSD1H523fVMOUTLafPF
         KujMS4dVVMcYgZd4CC1+7AE3bLIrdRKngeMzxJ1nkAAtRy2dBgjiUKUToeAzrHjWFu4p
         1rsSx/0C52TsEoeIE3u8y2Gt/dhHdO8PRNiv9mVdg43QTstsAOg0OYtoArp/1HcMgQ66
         dt/l6OihyAqvPwHHmoO3xhcih4wa5ysjDYi4u54kjDuzrYqUB50u4E03QCcl91nBMP9G
         vcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007614; x=1789612414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaxI37OQHzUYDVOni7XBy4EMpiTKEW+dinVvRL8tiFs=;
        b=ANeFjZ172QM+Qu7zF65O8QPoTVj+u2gJdaE04KiYy8EAHKz2rWeVMw8p23X3FMtoxR
         uEpvzvwFdB9n49G/HIP4/twZ+wKIhq7BZ7yvKRDvcrEvEdwfucH7R9MFZw0sI6G364gK
         6FaxVy9pBQVVG4vkc4DdXyKuiXZzs0cqNAigECOXdVdezU/X7hl/JX/IdidwjgYWJAYw
         Ds0wThA3KImZYM+1eYzsm0ZSlRUQEbGBG7rce3Yj2PGIY+/JtwP7AaZdHJWx4slQbaF8
         g21KYVuzvcnkqjjH47k8H9QyBpRX6xDIDgXpnUTsFHQ1egHXvNrX1YPQTQ8X5aUBXTJ9
         fetg==
X-Forwarded-Encrypted: i=1; AKwUvBxAaiGEmIb61RZcJ6dfMf1sk7I419tjjrns3vD8+lUU5l0LMz068qjBfsU2yd904bxCD4P3KRK/+D1rdMs=@vger.kernel.org
X-Gm-Message-State: AFuF++n2phyXrL6SkFnTWkOp6J55Y5jwvualgj1uMYxmcFPgKb2mj3jo
	hwlhM5C9uNs4HS6SG7PJ1Hcan+MO7hPxGeRLmPI/MuCWYFhLaszR4z+lj8SC4oiv/1M=
X-Gm-Gg: AYBFou3PMxNOjCk42CDCr55VD0qkD53dM+VRGZxIMl4srS65Tk6yL0Qz3tSheotz80x
	vEoDWU1foUo/O1wxMoqHlO3zpSs97gfD6gsid4QYbJUSxtm9LnZvgh5zlOWNpXq9GqKA/dWqB3z
	5PjE50J3C8jqRj862Hp2csSiQ6lkywhFZAGfXWO4DjuPT9k2uCzBr6Vv0HnAVJeIoCM77eZdj3p
	p91zgAp5hR3wsEJhJUtwREN+UCgBxMcLf2LI+V2NPeV8B/icdU23kaRdMeFnHT76BgeMYAZP+ZI
	UdR5DC4iVy06+eg4yIyxEgd6L7Q7doZRtosri6p7DKNRFOh5HNXWPJsRUWJH7nqm04PaurNBi2b
	fgcAGZm3lDet0wlShyycwEDo7iyeQ04akCsFX3CGUE8KKTWad+726xhk/ZBjV487csJNxflfKo4
	VeQcZoASg9JJHGeScexM9zo78s2useBge4OsFIHdfqZiGXTHCJCePnKwFOACsypjjQSi6Ls9RN6
	6A+1zsOUPc5P05wUaCC80fGWva3/qQnHB4tD36A4j90a9DXbJSNij7rmcXt8g==
X-Received: by 2002:a05:6a20:12c8:b0:3d3:ae40:51e7 with SMTP id adf61e73a8af0-3da3a102710mr56406340637.27.1789007614411;
        Wed, 09 Sep 2026 19:33:34 -0700 (PDT)
Received: from SLSGDTZTAUFIk002.starlabs.sg ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45c62012bsm7132003a12.4.2026.09.09.19.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:33:33 -0700 (PDT)
From: zafir.taufik@starlabs.sg
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>,
	syzbot+1340ad4350ad43394c10@syzkaller.appspotmail.com
Subject: [PATCH] tracing: uprobes: Fix slab use-after-free in filter_chain
Date: Thu, 10 Sep 2026 10:31:08 +0800
Message-ID: <20260910023106.1795811-3-zafir.taufik@starlabs.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>

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

I originally reported this to the perf maintainers (because of tag by
syzbot) but I should've reported it here instead.

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

