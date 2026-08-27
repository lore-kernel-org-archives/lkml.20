Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CC419304
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860121; cv=none; b=tpGkfSfxHEgxk7LzMYwEQPVlXaJ8QWXSavmQoDFHrQr4ewCh2xmKWPfmqlz0Kb7fLz3iI1Gba/90zrwpaNNYkCwp93mg7goPXAIMHDxrd+yqkE/ApYcL+CRMhi8HmDo5FOiaGU0rbnYSg0pLr0mv5z5mWa/TazgJ20hY4Rt+tT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860121; c=relaxed/simple;
	bh=OLHUbxJ4td4FYpJO9Zdig60JX5sar7VpKjkhycz7buQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozAJuhRvfjAck5DHPnZuwYfyGcWvo6l/HUXhP9pS30hoiMvnHmSM11TskxAhabQ9CJVEAlzzxAtmoEgnmqAaN9N3eCPZNpnVwndRMrs3UCtZv3mGjYUTIOh8N1UysgX74y+0XObAaG6LHelJ7loVU7sN5RKSlIfG7+dsqLPfHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vonuzv0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vonuzv0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE571F000E9;
	Thu, 27 Aug 2026 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787860119;
	bh=MmwHgm9stMigjp1zMPN7HnPtZrgUd+r2zmwOI2wbvA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vonuzv0GCmaxYtthwGZO4i8AU0Vram97/e15RjhT0Qm+btU7eexrtDUbc+s/NYu4Z
	 oPy1u4+efqqjKVDAHQ40Kx3Nk8zLb8rnc/1uLgaMlzCP3FvjdOXHvyvFTXmTirAOIP
	 0W14lJIkCzofDddTOsisr6i2SNlF8aqLvUJDWGnQmc1N4JTstWkcJO3u+wpN5sV4dt
	 ioHTANq0Wfd2JsJ0wm6cJzNhTCEWCfLRIe+Mw+/ihykOJuIHgNicz7s/6GXhIx0E9n
	 83BgQSYnZpvhhjhLworH2XmLz5JBc64YR6L3pt3rMwMZP5f/HZaO71aNhn3K3X6PbP
	 jSDIpFslpnpfg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A69DF40066;
	Thu, 27 Aug 2026 15:48:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 27 Aug 2026 15:48:38 -0400
X-ME-Sender: <xms:lpSQaqevVjlA_V8To2fVG0wlOIQsmu6IuhnkhGi5QPwvGHdxAUyvKw>
    <xme:lpSQamfYegrZVLXqztX3VynCZ7XQ3bDB1RvklPpBi1MjtD9Tdiy4hiOb6ugR9hruK
    kZfXx2E8sAh6x4xWu3depaYdCx2ZX6J7BubJymcWqKjMDcYt94DQ7M>
X-ME-Received: <xmr:lpSQatyJ8pDdAWKQrA1uG-RVzSja6mLgsslZggSpzP4N0GTEVG_vTw68ANBfAOJGVpF2L9Eaf6tBqhqkm-WXzc6k_55CKKb->
X-ME-Proxy-Cause: dmFkZTE0VPwVxt2mk7rAHHr8B0o64NQYihVqGWyd9wGAQhTBpkxqC94xAMBmtNXIDwVZ1o
    7uk0aiotsbFAsGCf31o5AJX1EIaqgqzmKcwkMh7Ng7H6RhTbznMafsDd5G+3J70mF19Mwv
    0Y6Z8+aDREls+XWTTvE1gwP8S0f4pzKxbLTV1U6fXFzZ5glUIvRZyEHcJE36GJvjjgKqQW
    w2H+HK3QdsB1lVIW1VLBF6OQfBPaO5npPdp+dNT9YSI9F1AhI+XhfIMg++KzoosZr1Kzlz
    KY7bsdm2ZKGe9kQiJ8nKw+dZqOyCwlIZIKahjAc4D2WklPYyaFphZ4CGycv85QL8AT1DSl
    fwp/NOyV2Xr6mATW+N8GTEPQQeQ9TbmHuw/aE5/UHsmSEGYGu8tBrlrVB6vlOCxkkw1GPk
    FWRXk6Tyyj6906nDhhaQ5lUOKAnJEB1t820el+xGOTR1f4tWgV4dAXeut+IwP4tbYxy55B
    bT09ca23Gz6sDPXLCAoREnnNWNWivfdNqqAX6sIVxExs79AmIdB27zsqTHx3YuGejtiJtF
    /nslgauYWDlUNTMWla2bSVYBfRh9KdiXHv3Bp7A6jbBVTdElPEDj+3c2Zy/+U6tflmDQ3m
    l/IODSOkp6iSBBr/98NWlUcgopC4yEsfiqVCLScG1aDqJRq98OUzevGPPdrw
X-ME-Proxy: <xmx:lpSQat_Inww4MzMM_HzrOXDIYd-1LuN3L3hhwXf8x19Mvi1z2psBtQ>
    <xmx:lpSQali1ycXuSfjFBup8pLWN0iK7YL-Rs7U6rDdFJIhbTnPZvqkHqg>
    <xmx:lpSQakGmPD-xzQl3h-AOnKArIgaq6-kRKMrOy1Jnn3iQ-UBgviAv-A>
    <xmx:lpSQak-L93952y0cxuc3yQOVLqYBkzBM6TWha58jdymJ6M5fXBvtWw>
    <xmx:lpSQarxFzGByy6Oo9TL6eBa4l9NGwpICZN8Mq382NHVMUNsCtCEGN_rZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 15:48:37 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: tglx@kernel.org
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Lyude Paul <lyude@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>
Subject: [PATCH] preempt: Remove hardirq_disable_count()
Date: Thu, 27 Aug 2026 12:48:35 -0700
Message-ID: <20260827194835.38968-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260827181106.30090-1-boqun@kernel.org>
References: <20260827181106.30090-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out the previous usage of hardirq_disable_count() in
__irq_exit_rcu() would cause softirq pending issues. Without that usage,
hardirq_disable_count() doesn't need to exist, so remove it.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/preempt.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 8299657f0f86..6d2fedbd6758 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -168,7 +168,6 @@ static __always_inline unsigned char interrupt_context_level(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
 
-#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >> HARDIRQ_DISABLE_SHIFT)
 #define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
 #define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
 
-- 
2.50.1 (Apple Git-155)

