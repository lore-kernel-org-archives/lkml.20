Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844278;
	b=CYxa8iGOeZfGL90C6Pdx8ueFwMNOd6H1MIcRzmMpHQr+GaLs2TW3t3jIEHwHs21rs1K+
	 KIZ9MVQasUsCCOegtiff94auCzX9H4pE8x+TTBL66PdYEPpmC9MRtYJyQOMWz6WR8B1TV
	 mf2nm+RcGvOuap2pJvXqX71BAwFRk04KZ3ubvTBUViHwHrWky+jFs6VTxnGf3Cgy86nHu
	 VmVOCsbJvfUsxZD6+fEXeLutI6csSl6A08AdA+rliIR4Rrz+KH/AHqycDxlSbaa3G2VlP
	 A5Mczw7L2rC/rlY/yhK541wnqexyKhyRkY4XOY7y/FFi6EVoMpnZx/D6aklu2ugyUDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ystc8DoAYppwJm3M7zbYGUyJTtzS71i/6mGTHRMqtA=;
	b=10yQFQbbRkyZ0s51wV6ehh+ejfY5hmlYLexPD/tI8VMAeP8VyctwmVcfpcWlWM+1zo1B
	 7ojOGZuqGxTeI5cA4x2RZz6tRHQjjycMTUcP0h3ScYPhBfRdccDQ2mxaha6sk/IkcAsDU
	 aGNT+49Nb57fp677kCjZBzQ2SIxZfjqJDfEuOMPk6LJ441KiR/ywnGYuW/dz6ie0Qx+wS
	 mMLfhB0OSkpscjcyYDvnaSz7q5vpb6nQtNhiiKgSJHf93QSx61Mz86HThFHzQqKA/L50X
	 aTj+UIzgOxzWMlctej/UmMFXO12ezl67SSrnRgZ/oJ7lE/1hf9fM3kBGvxOjTaMAPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W51J4Yd4;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84ED606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B84ED606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W51J4Yd4
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso22625085e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794844276; x=1795449076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ystc8DoAYppwJm3M7zbYGUyJTtzS71i/6mGTHRMqtA=;
        b=W51J4Yd4lgn1evWQVa99DQUwuYWy77WuMv1cao+Zr8nwTX2DJrdAxqWX5Ohax49hVy
         fTbazZNCNL/BcgTGAITjW+p/4u2n5+GSgN3EEUAHWnDuuTzFAnV4ZEeGpRBxAZDEm4sK
         1OHO606PDhD+ndTm1MrD4IUitHqcaTKX/mMk4/yACkHdfEZM9b0tmfsR9nJHjwr4zjAs
         O1ObSwj8PrxCDDlNlpLbnWz8PDJ570Veb3ms5kLa0UBau5auAv8/Dd2+3J6LoC3RWDv0
         O5mkhm77fd8/fqVde1IahE9akSMvRJkyZehVFB1tRPZmp5jAJylQdrGQ4qUvo5l87S+1
         nDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844276; x=1795449076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ystc8DoAYppwJm3M7zbYGUyJTtzS71i/6mGTHRMqtA=;
        b=VvhJQJOpjRF6YNY6p9hKqldaHjN4Bh6xwUyjdGtx/jEnu9n0nHIAGDLUgGCyzExnMT
         ABWtV0HBJ7JjwgyOWevshPaB4sV3qZoFODQeOhoTmjQbpc4vY8sEwDNtdx2KXlz7dSis
         i0wj60gNXN2P8Q618EQr1HQiD6vLPKsjX3HW/bocDuguuIDTR8E71K8gjxGGhvDRO1HR
         3ZJWXELMIWMMMoJWfS5XlYdkkAIwfEbRqj1QlepFm44t9h9Ac8ojbWbJMN2Eei/sg8zK
         M2/DspZ/E/OvRqDY/L3WwUzILnDHkIbvxAE//FNY61nMTFFAlaBlV8o88yC57rnAi+Wj
         dtZA==
X-Gm-Message-State: APuU4Z/jQ6Tg0y9VcIYnC6+716SlntTeOK579bIq0vzT2Rwl62ObofYh
	H4jR4bNbj/xGYsdh9q8nGe/NhSnOrGHJNXky4X/p7PucS5lF9U3w6eESwo3e5joIsiVxCivjPh3
	5SwJkHz0=
X-Gm-Gg: AYBFou20YUjjaK8YcuUvO6hsat5/X3dE84I0n8zcdTH684FZOPNPuWyl5H4ELNvscuw
	GHQTffMG9m4EkyDJ/OqDA7MOhap/aVpTRpc1+6GhCD6HVvCtU9lYHbKa7KuaabkgU68RXHo8vWR
	4PQmxUFgeUc9GSXnTPoBq5HCfMj+WUnl6KBzTR8ywFBDmOEnL9Qjc9WWqm4e3sRq6+BMZG1czEk
	85rnnyWFOPX65I1d3jUcYOLwaY/8DyYjVJJTuUlfCAJm+UQ2BwOnrU/2xyHui8OHRbH7x1pf+tn
	V+AKc0D3h7u7BPXHTuBPmAcMvwq0oBI3ZTeZcLPOhJtSF+wGZwtKZwVmXoxPM/i0xjA2jr5IEep
	asXyUS5JV2qW4HWBHZgEVlT4XjOE2vDpCjrFOJQI6APoA+H5DLmwVHQn+AR15AbtZXIwM1Cjxrd
	SeK7WGMiajTWPuUIxo4dUkg0B2Y8oh+8XJg9ZwviRR9f64lDQ7AdzlSH5/aHSNOPrzDwdpHVnVw
	A1X+N2sv2R93X8sxs8bnHry0ntyWcjHSGu6UfzuMDyiiXhbROLTKq+oQY8OwZ1XDljvLVV7woaR
	LEURBybdjsBfQMR/LBGznZAzm//OowIRYHpdEy69ntPQdxr7M0o=
X-Received: by 2002:a05:600c:484:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb55a5d628mr166651955e9.9.1794844276137;
        Mon, 16 Nov 2026 07:51:16 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm298063515e9.6.2026.11.16.07.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:51:15 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v6 2/2] workqueue: doc: Update WQ_UNBOUND and WQ_BH documentation
Date: Mon, 16 Nov 2026 16:50:51 +0100
Message-ID: <20261116155051.157875-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116155051.157875-1-marco.crivellari@suse.com>
References: <20261116155051.157875-1-marco.crivellari@suse.com>
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

When WQ_PERCPU is not present the default behavior is now WQ_UNBOUND,
so update the documentation accordingly, including the guideline that
recommended bound workqueues.

WQ_BH workqueues are the exception: they are always per-CPU, so
WQ_PERCPU is implied for them and WQ_UNBOUND is rejected. Mention that
in the WQ_BH section.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 Documentation/core-api/workqueue.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 54697907f2b0..ef8f613ce402 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -178,7 +178,7 @@ resources, scheduled and executed.
   queueing CPU's softirq context in the queueing order.
 
   All BH workqueues must have 0 ``max_active`` and ``WQ_HIGHPRI`` is the
-  only allowed additional flag.
+  only allowed additional flag. ``WQ_PERCPU`` is implied.
 
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
@@ -190,6 +190,9 @@ resources, scheduled and executed.
   This flag is the complement of ``WQ_UNBOUND``.
 
 ``WQ_UNBOUND``
+  Workqueues without ``WQ_PERCPU`` are unbound by default, except for
+  ``WQ_BH`` workqueues, which are always per-CPU.
+
   Work items queued to an unbound wq are served by the special
   worker-pools which host workers which are not bound to any
   specific CPU.  This makes the wq behave as a simple execution
@@ -375,9 +378,9 @@ Guidelines
   wq and potentially lead to deadlock. It should utilize its own
   dedicated workqueue rather than the system wq.
 
-* Unless work items are expected to consume a huge amount of CPU
-  cycles, using a bound wq is usually beneficial due to the increased
-  level of locality in wq operations and work item execution.
+* Use ``WQ_PERCPU`` only if work items benefit from the increased level
+  of locality in wq operations and work item execution. Otherwise, the
+  default unbound wq is usually the better choice.
 
 
 Affinity Scopes
-- 
2.56.0

