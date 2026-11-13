Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533499;
	b=bhbmdysmXe5Wkme9PnU5eFL759Aj1Ym2oZQ7iXD469dnl7OVo3jMb8HlQmrME8eeSriS
	 TeEbgCEDnTqa4GB7/7/1wtLo7BLL0Z6i+Vrgfkqb5hOJ31kQSXA0CO086kczfzWFyJ9JV
	 49ylmc3SodDpAmTdgSZNfAIBPIw7BAseWoLWDRRZ0+WVOoUZCEKKU6XHjdW9+ZYadTwFR
	 WiFGD2AQ5z4fo98rQFCKXbKp/cgcK/YM67EoidENb5lsPjFJXBoObqEh4J3GMZaOkVxgG
	 2Q84VtXk9WCjyUgP80tyfzJxZvVXRYhEDzlaAF8kBcwvfkauBiC0Rc7hVxM2MXF/Dxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533499;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/hHvQrCnLzoweM7M4UovcCsZCxbGrXpTuh9XhQZgiF4=;
	b=EEZ+DseUSdhkWcsecdy4Mx1FK1bn61HcxB9KjUZ6lqyrq9FqF5wnHXwig8C3aqSD+7ns
	 JjBON7CetJYqOzfbJcv0dLhtP9B0+zPmiKFOFeBaw1ALX5MVOW7kVJXdjnKwOFiAtIxoX
	 nSjttlmeWlARD/vVO/TqTiJkHp5bgxhMWNYcnbDA7crcEgMYd2zv7le5Dxg3oYg37tUvo
	 bCkcZQkOnbwQFV2Lead158A7dr2573vhyMhNfpWJYkrY/gMQVz8YPt6hP2CPgQPU1Kwa8
	 areaO6M5WXwzYF0QbScnaJkZ1DjuCDoa4aFdyVgHDD0tXBffd7hY457K+vDqErH+EeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TciylHjX;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1B8606A890
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1B8606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TciylHjX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t5Zqz0WI7GYFLm5RnSIXNaMDqsZrzQM+YYvfjFTE24U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794533496; v=1; x=1795138296;
 b=TciylHjXnfmCLk5xIipfoIezh//QjjqrDDiRbkKuWOQne/fRFP5IXyakyMmVdwHgVRFGY/U8
 qtR+V0ziVzdrv8mUOxYGNaWGpkXg2ix+gejNUz7v5OoforNAmZlEGgeCOClZTZ8QTw1yPjA/o0Z
 iEpJZV89FbHZEI55ZXZfCBSU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 969525ee193caff0;
	Fri, 13 Nov 2026 01:31:36 +0000
X-Mizu-Trace-ID: 969525ee193caff0
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH 1/2] docs/zh_CN: Add RCU/index.rst translation
Date: Fri, 13 Nov 2026 09:30:22 +0800
Message-ID: <20261113013054.5662-2-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261113013054.5662-1-xiongwei.song@linux.dev>
References: <20261113013054.5662-1-xiongwei.song@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xiongwei Song <xiongwei.song@linux.dev>

Translate .../RCU/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit b3eb16109ae1
("doc: Update stallwarn.rst based on RCU Tasks Trace as SRCU")

Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
---
 .../translations/zh_CN/RCU/index.rst          | 49 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst

diff --git a/Documentation/translations/zh_CN/RCU/index.rst b/Documentation/translations/zh_CN/RCU/index.rst
new file mode 100644
index 000000000000..6db03061fd87
--- /dev/null
+++ b/Documentation/translations/zh_CN/RCU/index.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _rcu_handbook:
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/RCU/index.rst
+
+:翻译:
+
+ 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
+
+:校译:
+
+============
+RCU Handbook
+============
+
+.. toctree::
+   :maxdepth: 2
+
+TODOLIST:
+
+* checklist
+* lockdep
+* lockdep-splat
+* rcubarrier
+* rcu_dereference
+* whatisRCU
+* rcu
+* rculist_nulls
+* rcuref
+* torture
+* stallwarn
+* listRCU
+* NMI-RCU
+* UP
+
+* Design/Memory-Ordering/Tree-RCU-Memory-Ordering
+* Design/Expedited-Grace-Periods/Expedited-Grace-Periods
+* Design/Requirements/Requirements
+* Design/Data-Structures/Data-Structures
+
+.. only::  subproject and html
+
+   Indices
+   ====
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index b52e1feb0167..4488a97934ec 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -29,6 +29,7 @@
    power/index
    scheduler/index
    locking/index
+   RCU/index
 
 TODOList:
 
-- 
2.52.0

