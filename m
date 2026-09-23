Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D0448D1F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149350; cv=none; b=gptXmr2QDV9KBQ5/eqEwo4uTAl7vg/uuaMeMm0861KRI6IK6jY4PzmQzsO++1ziEmheM4IICotVK5JVTCfXh8v0QfmuXP6XlEXnS7mxPyLx3ZN2j5scGhHzDzDsgYeI7enOxcoNMaVS581B2WF4dla4aqFUTuuUJwZVvZj3ZiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149350; c=relaxed/simple;
	bh=YMyLmGEnwKFDxzmdHh0N11WIuaHQ/byRCKCpA1/x4r4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PGURexb+8m6v4/0mlmQ2+XLkRCzZHCFQ6UijtaSjpP88Ykf701zFOfZLLz4UDFynFp2lSXKsDN6qAU8L07A+Mc3I3oS1wE3OBAfIz8pXYqdXlGz2xCQpnJyfsvPGO6CT72c5Dyxgr0H8xKqbJRQZIrTKqTGzOW8bYcpXiU8mDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXOUtDTZ; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXOUtDTZ"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6422198fso3356275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149342; x=1790754142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKMAy2InHjp3FXMfVN35EHq0oszHWkWnOoyikT1MYuk=;
        b=KXOUtDTZ+tblaceljyq0dfbcMXuqh5QBOQj9D+clCblw8SMlaIg1s8kvMUbcljJzeT
         XOGgds6gwoq9NkKmB3/rWV8lcKGAbcxiO9bCeoDeAfA7VZnxv9g8qyYlRr9K2DWR0cSe
         higETK7KLbN6knNQ4IsuqyiSiMiGkgibQZhA9Rd5ZGr/Cos5ZB31a6M/CvNwYAjJQUhu
         ywf3y13qTElGdKh6CeQZ6hcDZtjwhxBsTJqnkzd5QlDIKnJdio/u4UVspfFanZ4nBf3n
         IWf5Q7oL7qb+NRBOuc/O6EiMV+Kx575N8YYzKo8GlhtHadz/Gj8fo4aofB2+YMGVbevg
         5Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149342; x=1790754142;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMAy2InHjp3FXMfVN35EHq0oszHWkWnOoyikT1MYuk=;
        b=QDz6FyA6VBTl4sFzE52hbU/bAXpa38QT5SUqdPd/znGKKzYVYMaHCHIoTSEiFDVrgC
         HPXf9TybO9tDSRNAKTnSNZ2UtyLT/Tf6SDmxFE1ByqFYlEanDme3ZVRUbBgpJAOhaJv1
         BwebaGV1NkhTSpNKnOI2wD8NjqnctEgfHp4+hEmO3BAf06tpw/9uH9OmA6V0Z/L68tue
         9arTuZmtCPgQe2oPwYPDplqy6yIeqUevWk4d9IGAR5Q90a3uDzmXL2NUyD6K69P1Urff
         CLoRGygPNs2Ex5x3ronfH+rkiN0WhXZRfOQwyOYuWmbpd8eQo+BMzuc6Io3pqy8YdvZ2
         FzQA==
X-Forwarded-Encrypted: i=1; AKwUvBzqLmnlveL9W5WziFjj/iSoVKjEODCkR6f7TvpFGuq11+E8QNOOCKnm1Z55HYKXxoAu3VH5yoqAGFkqIsA=@vger.kernel.org
X-Gm-Message-State: AFuF++nVNk1Ywaxk7l6Q8EiPxjoV+TZGAz8QdQAfm09xYeRs//skcT3s
	yq5WDPPpiQWkMpc7j6eu87TJU2JCpB3PZvc+7VwR6GGIDvV/5E5P4diBl8lTOLyUasmC9wdMBLy
	LiaqNWcVDs6cq1K4VEdjcsQ==
X-Received: from wmmu21.prod.google.com ([2002:a05:600c:d5:b0:49e:71f4:5b79])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e14:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-49fdeffd80cmr20298145e9.24.1790149341765;
 Wed, 23 Sep 2026 00:42:21 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923074213.3077182-1-vdonnefort@google.com>
Subject: [PATCH 0/3] tracing: Fix simple_ring_buffer symbol checking on parisc
 and sparc64
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Here's a series of fixes following Guenter report [1] of build
failures on parisc and sparc64 with allmodconfigs.

[1] https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/

Vincent Donnefort (3):
  tracing: Fix empty symbol names in simple_ring_buffer undef check
  tracing: Fix simple_ring_buffer undef check on parisc
  tracing: Fix simple_ring_buffer undef check on sparc64

 kernel/trace/Makefile         | 5 +++--
 kernel/trace/undefsyms_base.c | 5 ++++-
 2 files changed, 7 insertions(+), 3 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0.1082.g2b9226bbc0-goog

