Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E185437D8;
	Thu, 17 Sep 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652876; cv=none; b=K8CJW1DvJPcu7hwMvWWqhXeTvFBHmwdfWOQ1wWHhID2umbEiI7z70ektWxdGLCHgYwRuRhlX6uZ0wnnYEo25JeKRrWqhLacUC34seaBiC7rB6FTkxXw9+PPAhbqHkPSct3nC1McN3P1vjWQE9mLJc6BQFowTFIWpvEt9Q3BuHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652876; c=relaxed/simple;
	bh=Eto8hzL6OaM80EOgMASH5eHiPO+2/yag486xyFWRXFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+ZwgIywyGPYcVGIVTBTLNif4eByayFMSmMMlBH+fF1aHNUQ8bmNLrC07R7xrRUeNku9zSSVX42FPI3nCX+K/yBcCzD+85mkKj7un6p3OIm8Oyp02F+HvMhE5T3JyQqvr20RCcqSV/kwcFbnnTBfcPzI78aYEXFP5wnRKknTHJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OZbSwR3S; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OZbSwR3S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=Ei3la3t9mnU7egxeLLJVw2Dg0OUQm68UUC9EQYYQZPU=; b=OZbSwR3SjmBfb5UAnj4ffQD6uQ
	TnjMK9ApQipb6geHD2ciiCEgIrqtdkUn9RlswO2B+bAs0vnx7Cdt7JFqDQN7Qq+A4sV7TVoIFiJjQ
	Fz/Eyp89W1W/SDkZqdLsWxzn2Et+iLJI2l5v2/i5ZHMffUItE99Jrpx6ezW7bF3xYFQwW6LCRMgeq
	XoWbleh2m8YDA10ftf6zFEU/KyfGOena69dRPNDTHt3R8QlLFwNRvS85ZNvIz3bhwN6Y86F653ks1
	7watHq8HPqMgU5esr5b7Zuhfv53dQJgHbLLjc/zT+Gc/BXnqajgprSnmadIY99+ecjiSyM7FN136t
	Qau2ZyAQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7CSq-005zBN-3A;
	Thu, 17 Sep 2026 13:47:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 17 Sep 2026 06:47:35 -0700
Subject: [PATCH 1/3] Documentation: kmemleak: describe the metadata pool,
 not the early log
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-kmemleak-doc-v1-1-84fde6d1f749@debian.org>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
In-Reply-To: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=leitao@debian.org;
 h=from:subject:message-id; bh=Eto8hzL6OaM80EOgMASH5eHiPO+2/yag486xyFWRXFs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqq+97bAZLPHORsUJDZJBGyd9jqqoLSrsRu/m3E
 VBvWYZmKpKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqvvewAKCRA1o5Of/Hh3
 bRDoEACF4IxIhijugl9oV3FI0E3zTWGkO2KSgHIGnOFvv3K+Mxi7194KcfTdMmIjI9ji7+GZoNt
 NpL8YVh1hCdQCSTm5HgQoDZ9WYjsL54UDncCxyxP8ambZSREXC6bJ8XllyzuDj5ssVhbQVmEnDd
 o3lqWniw3AIY9G9fPj4XnhxEXi+4g0Rgx4aHU/8Vr7xtqgjrTv/tmeTKjyUmiikvfcFC97wisd0
 Gj+gh3tJtMEHxQN0QTCY0bj/xk88IQqRFTxAExrs2Nx9QR7RjBwUSknYB5epCfhXUiPIMrpt08n
 eCwD4bBW+JcBmARaWxuwFNijmIJR+x/BbX86Vc3I31xmMpOaA+cVS4N8HZkdDv50E0wTZu0nMgf
 hYQMTt14KYGauGp6dYZG0SOINEcjLnpxxBRLa0ziC8wjtZh9QeRg7LLJCoTCHtHhZE+oj5TwWcI
 JHFFCM+WAa7qnbLEC8wWSizAbjC5SnzVO3O/AH4w0yPQBFhLaC2EztbEFSUq6TZdTi6/soCw2nJ
 OE5tJqPQbbWO/VSu6Kl6vxmbhIKqFtzcByJHi3eQBPGZWvzelhSOb2ThoGeDFjXONSrp9ED1kfO
 fh34x+4Iy6sntbm6zwD9b4zoRPNwSUGqlf3LHn7UH9oMrW6O5bjxbS2j/flSoQ3KQXElTYt8OMg
 Ozo5kvCKQkEis6Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

commit c5665868183f ("mm: kmemleak: use the memory pool for early
allocations") removed the early log buffer in favour of a static pool of
kmemleak_object structures, but the documentation still describes the
old mechanism.

Fix the documentation by describing what the pool actually is, matching
the Kconfig help text.

Fixes: c5665868183f ("mm: kmemleak: use the memory pool for early allocations")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/dev-tools/kmemleak.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index d1b690b171696..8dad7647742d3 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -66,9 +66,14 @@ Memory scanning parameters can be modified at run-time by writing to the
 Kmemleak can also be disabled at boot-time by passing ``kmemleak=off`` on
 the kernel command line.
 
-Memory may be allocated or freed before kmemleak is initialised and
-these actions are stored in an early log buffer. The size of this buffer
-is configured via the CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE option.
+Memory may be allocated or freed before kmemleak is initialised, so a
+static pool of metadata objects is used to track those allocations. Once
+kmemleak is fully initialised the pool becomes an emergency reserve, used
+whenever a metadata object cannot be allocated from the slab. The number
+of objects in the pool is configured via the
+CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE option. Exhausting it at run time
+prints "Cannot allocate a kmemleak_object structure" and disables
+kmemleak.
 
 If CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF are enabled, the kmemleak is
 disabled by default. Passing ``kmemleak=on`` on the kernel command

-- 
2.53.0-Meta

