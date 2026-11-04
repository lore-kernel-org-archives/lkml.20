Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825957;
	b=n8dW4c99Y9am6fpMw1OJ0ypPwLwDCOW4zrkNwIK/KZlgAXltiYMkaE0jt8byDEM9zksO
	 OzHK71tlhWmJIjnUUVSZJPIUIJ94/Q0SalbOKo2KPqL4/QTbwl/C83gJ+e4LJhuBvhInI
	 o2hxoxAPS+xiA/JrBr5/xrSXB4be5E04bOVewHVpIv1TxqZqVG/Acl+vxzTxcbjnRbFpP
	 YGGdZt4BGvSkSTr7oAw/3tj/yzJRESRrx38JIeUQj2oqYKQiiEYkNazI30eHcd+kP6kQA
	 0cGVdqNkqtPodOlaFbQ84KtTiW0eB27kcr7bFlszslSe1bdZvTQKsYNNeTxBkXYD5lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=dTUUSKS1V7tuqt32nhpjzzkOvha/uBr4kfgjO67+eJTeaupguBDKFtw62H0AsgUT0A12
	 DeuC0M0g//WsFE08yQUUr/o+OoFr4pCOboee3uuLzbFX23MNFNMk8iNTOveQCrybjcDKt
	 DnavvIl//lvlPVKFvbsHG/ZQ2zsnMS9IMHg/ZLw84rrxfuclwKfpHmD0d6Y45sQrYmNHP
	 LKe0yTQvSF1739FIC5WNZn0R+v+K7Ofq+Jy2qoUkOWhMDvAAQWZ10LopNVyGBU4b67dkK
	 DCMzRoInjbvG4HhSlU9zn4Xv3a952IUf+wn+v5mLr1/Vlm4e1t3lnGkFccuB0fa6wvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6zFms6C;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6A609CAE9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F6A609CAE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6zFms6C
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1acbaf81bebso1547902c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825957; x=1794430757; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=l6zFms6Ci0gFXFw30uQIWUkIkwYmvRxAMdghJhLpZ+go3ISZ7Jniiuzq66BwbUb56I
         8mb09obnK8YnNHaTkVm31Ea2v0UaaWNRllclxcfvlHrbTKPfpt2mWvOmNcQ2IyIK/0C1
         DfIhWhoWkiz1+kqpWV16xBvy84wx0BvptX+abXOT++5la9IwOK98ALjhdsIkleO8SRrZ
         UYTS5A7keueVD43yv1v4Sqo5zLBwYn6V+QQi8m0nH7D7s1TRarej/Z1/EIBqqvUN7kw8
         x4hVb+3XeIJvkIqd5V38nbi4MullO2BRucBgQ7ojyWt3+6qdewgcbox4mWSTpg4LYNx+
         Gf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825957; x=1794430757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=z9H4e1h5eO7ZRQO6jVPKNJKnhAde2zVi1Mo+y4+fOMmWwTQpbVbxQuw/qzKgj0bmpa
         wswCPapNgDjROPnvxa3XqteD2bZpIgk7yG+k9NZ9M5YfOz+TA43kySd1IXx6iIVH9YZ1
         1+siwuGDcawXROwc9+ioCSqgzD7FEsy3Pq4BYXUw8m5bXpvQF+/9TJtPkA9tiTe8IfR5
         OLDHI5x1h1RQ+aDac/C6om1NF14nTtyip6eA4O/PjlulVpnAmJAF1Ts4FteXWuBaVmn1
         lXMrGEP3QL2n8mZhAA4VJCIV/DB30Slp+qo9KKzRtUWzsM7l2vptuAzj8fzm6LYyQArF
         x0Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwF+Yc+Bhzhd80PqrME5b1JBvhH41TiQrMw3D4Umu5OqdjcGXM23WS+CbhX7UQhtAIMQRxhhX06fzn8OPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jpPYpv1wkOsfOYSnYx6DfhWKiIDCE+BWiFWWl5OxKSr3ESckO
	8ZoDghvP5gdL+4jj2JgMaaLHX/OiybYJXo1aHUm3X/19GOU47Xdec9fVuboG2L/46T8Cuexx+QC
	B+DaLTkljDQ==
X-Received: from dlbsj3.prod.google.com ([2002:a05:7022:f903:b0:1b0:4179:ee7b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f15:b0:16a:f5cd:365
 with SMTP id a92af1059eb24-1b009604eb1mr18474520c88.5.1793825956090; Wed, 04
 Nov 2026 12:59:16 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:51 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-2-irogers@google.com>
Subject: [PATCH v9 01/19] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.0.455.g6c5a503b38-goog

