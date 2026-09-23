Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F884078EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181391; cv=none; b=shtglnTsidbfcyYgMoT0pMR3lWyq/rr0EYMHO2xa/1frYOWYd8n7imMr/Ldb3a42Vx7Kdkd+qqIYiF72HTGIwHY2so9r9VTek89oUtvY0pWywa0j4caGO+DjsF/Fu/XPx+Xg32DLF3IE8IcDvkfxwH4dENfnKH23Rd/akqj81Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181391; c=relaxed/simple;
	bh=HyMlUX/W9HvvI5kZhh4XgDfUUhUda5AirsyOm9dGlUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ue7cLrgkSPxWKF3aSSXLSdQhOxQTHuRu9EXZ+N8WIP/lwkqnQlEKx20ai+DgZGSHGtRN0j1S8GJvuOMZIIMkps2RJXaIv/szPssb6VU5HiyLE78JmzNT/PxZpP6cuPZLVpyiqgshiaUmJe4vcMgUNV3qmxL7XRphQVgQ6OOn6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=QhKCS5ty; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="QhKCS5ty"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-859023466e6so1166467b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181379; x=1790786179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8ztzFzESiCouCMaYiUr65tJ28qhpNA5LSgzOI3RJSU=;
        b=QhKCS5tyYcQwxn+dfVzq7sGjioWxu2ybxkIxfXdUJioJuhAMZeBkge8rawr/9F1xVM
         7MAZxqAeIh6t3tie7645xAt1j92seJBopW5YOwg/5lJO4678Rq8RFdNc2e0vZZWDS+do
         zYX/AR7TkonFvYJJ8vqbmbSOjWgIkL7JU+obB7deYyCg5dDaamUeQaCFsrRmIG/RTIdK
         ZabJksbPlhdJ+HNZ8llKwuzIWl8O6g22HgBZEaO5CQze4ET7W3XxKzdjmp/neb0Zd1R3
         nKae+V5+1/wgR29z9OgCeCYvsm4gSh2edqqR4a7hkS0r5x6WcID6rCu6Jz4743shyUzO
         r1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181379; x=1790786179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8ztzFzESiCouCMaYiUr65tJ28qhpNA5LSgzOI3RJSU=;
        b=Cx+7dAvwMvU4pVxq0WfKoVKyNvcyaj+EE32DMWVOdRMshpGkTlfrkPiLhx9zV2/9eK
         Ftsx2pFklH1xeARHo4LrcfX+PF6O/iltRGE52jvG+WD3Gay+9RnZmVgkugaDud5U5LrL
         KZLSqcrG2N11gEuVMaTZMvzq7zGxlUHqs7R/ZzDgaDaZzjYXBG1Aoh9G5aKVDh6Ad3Er
         S5IeqNcfCmoz0YDhwZ4v5/2AdcMDOvRg3NeTHwx09tBW1uPZ1JgxQrBejS2bTdOnDEZ1
         mywu9NrytWClQGWa3RXEFiEZjP/r+7tDzidAhnYZiAA2d5AEwpeDchFcV7RBN1HmivmM
         2c3g==
X-Forwarded-Encrypted: i=1; AKwUvByBwssxPT2pRelWSZf2+LSvUOJSWRxvryvLKypWmnRDNKFJ1nNI9qSoOrqC0bXuRU/Kel6fIVFPGfHBIT0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFl34v/neRsnG5o08ZPaDVxBpL4XX0DtjZ0TJAFTs/r0mpdfo6
	ixfbt/42OlsJA61ouEJ8DybXcu7AjEhBmxuy65ZY3MjLCg8yqEivUEz2ySxDPsDgfQPj
X-Gm-Gg: AYBFou1Xdt+WmnYS+i8719JeJR1z/bzygNBoKM3wDJnTkdJZyYfW4EQFUNpGIYxu5PY
	K1W23qh/b8qhdqk3UtvGacF4yjOVmRIp/6FPYKTLHmtxTufsN5b0zyrteEJg7EOKCjzBYGsUuTB
	7Bztz0roCbB6ltuWbcNNNi0FAbMDgKTC/25QzMGwv+vKcVhk4ZRKUzAu6Eb9n1DqW4ZPAd2nama
	WzBbjrRRsxYZz8Ei0mg7nA+qwGTwlNqvqzyHz8uhznQj4Ozfj1PSGXP1i4k27QArErroE3r0Ggs
	pA4mWEFYGskyi55sffyftsEo10FXURH2Skl1PsMmOG4r3IhpBe2xeq23tJd0blJoSSgqntHmvJ6
	6dL6NdD23Crtkwfeej/98bTHknBb8U2kIgMjY8Xc8U0ekEVqoc7QKQa2HTs7eoMm7FJpDM1BRzv
	eVrcEQPLvcEzgEhWeEbPQhCODJWuhKnYXECpZePxFy24lYvVm57tvZQWh81B/eTBV455c7ATbCS
	xnMe7VrAVtR8Ynh5P5FajHv43gOgsYNA2E5zA0=
X-Received: by 2002:a05:690c:6b13:b0:862:bb29:a715 with SMTP id 00721157ae682-8a45bb793d0mr35516137b3.3.1790181379194;
        Wed, 23 Sep 2026 09:36:19 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:18 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] docs: landlock: clarify TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:20 -0400
Message-ID: <20260923163321.79770-2-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923163321.79770-1-clusk@northecho.dev>
References: <20260923163321.79770-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_SCOPE_SIGNAL limits signals sent to arbitrary processes outside
a domain.  A PTY master differs because its holder controls attached
processes through input and signal injection.

Clarify this boundary in the userspace guide and narrow the UAPI
description to arbitrary target processes.

Built the userspace-api docs; no new warnings.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev
Suggested-by: Günther Noack <gnoack@google.com>
Suggested-by: Mickaël Salaün <mic@digikod.net>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 Documentation/userspace-api/landlock.rst | 6 ++++++
 include/uapi/linux/landlock.h            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 84cb7bf6b3ed..4d9fb1f1588c 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -430,6 +430,12 @@ The operations which can be scoped are:
     This limits the sending of signals to target processes which run within the
     same or a nested Landlock domain.
 
+    Holding a PTY master FD grants control over the processes running under that
+    terminal, including the ability to inject input and signals.  A process able
+    to write to the master should therefore be considered as privileged as those
+    processes, and this capability is not restricted by
+    ``LANDLOCK_SCOPE_SIGNAL``.
+
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
     This limits the set of abstract :manpage:`unix(7)` sockets to which we can
     :manpage:`connect(2)` to socket addresses which were created by a process in
diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index cceda3b3b961..ad7b1ebd62ed 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -500,7 +500,7 @@ struct landlock_net_port_attr {
  *   connecting to an abstract UNIX socket created by a process outside the
  *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
  * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
- *   to another process outside the domain.
+ *   to an arbitrary process outside the domain.
  */
 /* clang-format off */
 #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
-- 
2.55.0

