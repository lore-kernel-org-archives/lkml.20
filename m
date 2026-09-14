Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA2384CF2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413247; cv=none; b=QAYWN4d7XYNHrlXDT6o7tF4CLmRHaErS3YEcKkGrMN+aje9VWuOWTlw6Kh3CHLYnHNxToccjSGzbat8rAvo/uhE7u6RFV7RNelauD4M8NbpDgTbMJcR+gJ4/8ycaQFpAXbSczJf5YL/G8bqU7Ik1/jt9en/YNjDFxrQAy1ReQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413247; c=relaxed/simple;
	bh=xb99JgDGTtCItKyuxlPAFODc8L6TfNE8KIBXgN0TWUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tI4jgqzF9bHFgtcvULx/jdcElQGFGU4HN4mXAKtEWoh6lzuqw8xkloV6VRtAIqhi+quo3/6nfE6DTZVTR+fWSFJ5DhaJrjMw/hKY0N+VHb+PdRrxuIb9JiWnNq0QDrnUqs4v6llsWjT2GeodHm3BmsIt5+fBkBLhKvAx6SPRpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FWS1lNLp; arc=none smtp.client-ip=91.218.175.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FWS1lNLp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xb99JgDGTtCItKyuxlPAFODc8L6TfNE8KIBXgN0TWUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789413237; v=1; x=1790018037;
 b=FWS1lNLpoPI1tBVZMBqF5IeelD/6x6FEAAj4IacdwFCb+Psvq8atJPc+1FFpDFVDdC96VThv
 GygIE7W+0I34RCn331S2z0NPKyx8FOX0Qd5uAFmfGB4OaITPi/yI4V4BOHluWVasSClFXZ5u5Ry
 4EZo+a4Z0GvHYDvURVGs4hE4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 418e8b628414cde1;
	Mon, 14 Sep 2026 19:13:57 +0000
X-Mizu-Trace-ID: 418e8b628414cde1
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v6 2/4] rv/reactors: propagate rv_register_reactor() error from reactor init
Date: Tue, 15 Sep 2026 03:13:35 +0800
Message-Id: <1684c66520cee66ba86224f2b9e473c7dd2416ee.1789412799.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1789412799.git.wen.yang@linux.dev>
References: <cover.1789412799.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Yang <wen.yang@linux.dev>

Both register_react_printk() and register_react_panic() ignore the
return value of rv_register_reactor() and always return 0.  If the
registration fails (e.g. a duplicate reactor name), the init functions
silently report success even though the reactor was not registered.

Propagate the error from rv_register_reactor() so a failed registration
is reported instead of being silently ignored.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 kernel/trace/rv/reactor_panic.c  | 3 +--
 kernel/trace/rv/reactor_printk.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/rv/reactor_panic.c b/kernel/trace/rv/reactor_panic.c
index 76537b8a4343..db7116ceafff 100644
--- a/kernel/trace/rv/reactor_panic.c
+++ b/kernel/trace/rv/reactor_panic.c
@@ -26,8 +26,7 @@ static struct rv_reactor rv_panic = {
 
 static int __init register_react_panic(void)
 {
-	rv_register_reactor(&rv_panic);
-	return 0;
+	return rv_register_reactor(&rv_panic);
 }
 
 static void __exit unregister_react_panic(void)
diff --git a/kernel/trace/rv/reactor_printk.c b/kernel/trace/rv/reactor_printk.c
index 48c934e315b3..002a10f6aa7b 100644
--- a/kernel/trace/rv/reactor_printk.c
+++ b/kernel/trace/rv/reactor_printk.c
@@ -25,8 +25,7 @@ static struct rv_reactor rv_printk = {
 
 static int __init register_react_printk(void)
 {
-	rv_register_reactor(&rv_printk);
-	return 0;
+	return rv_register_reactor(&rv_printk);
 }
 
 static void __exit unregister_react_printk(void)
-- 
2.25.1

