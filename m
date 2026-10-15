Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55B5304B8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072922; cv=none; b=RxOKUGM/rBkD1+FVhT7Bczd4s5e+F1ohWnrvuppEYP6mfv5XtCtw8Q6W4m4PYTeyGaPyE2AcnvZLpZ2In8qLcE9msHS/gDrzGodShk3ga/oIK3kHTJIVUXlmxPBxUNJZXlgmgdol9RRUuwgV9yj8VY5u9RSSeePMQa0KCwa2Oqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072922; c=relaxed/simple;
	bh=4wok5OG498AYa8ZIOonM9xKhgUjfjmsfckHaHyJILpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENbvqeTjjykJ6fCtEtvDOrzN1p96J6L4zNuyJrwancxtDRtUazIykiIXJkUi0AF6xqWUJsqXEEuQqOABWnN/xWQqsYbv1NLPcFdZ5lU8sjbHewQntRbOjjXDA54BH69a0Z61ppKLYjNR7ztK4ZN3kSsjX/jgNDqQteqpiDghD84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EW9yNY6o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EW9yNY6o"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so21695245e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792072920; x=1792677720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2jVUir0tYJsoZB3ghMUVk6rgybsD+0302uJ10iXLqY=;
        b=EW9yNY6oar40KBz8LfEZqk4S/pb8bWiHcbw+mjulfNUjSRgInp+RbzuAPze6iKOYVf
         DOZq4KCfqzsKTy6b4S4zG/7YdoLzvPsWs90atsuSiLeS4tvezXgOQKQ6ct3VwoJ0R/9T
         zy4V9B5Q/a/8jr1lV+IvHYUTKacMJWeLYeEdIcPXwZuZ/ukX9wC/LzmNOLiI7BNDv1Wu
         CEu97SUxJ7OfsJFZrrRm0Vqf5QCDOFjC5WvP1KIP/0HHX8nZVR8kaXccFB/LArNv+kvH
         IF+xuVfUY2AnB76K6RVd6oapXlhu7JJS/DFEYl4fd8TvxU9AlH+DAP/beVnL7fUZ+/Vv
         GeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072920; x=1792677720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2jVUir0tYJsoZB3ghMUVk6rgybsD+0302uJ10iXLqY=;
        b=GCgTmVXFAIAosAUjEQluLQcqm8X5N7RLG1MByQvgy4GcE+TLQjU8MS3miD1TSfycM6
         HwJA37ogCM8JvliALOdhsgtalkdXBWJqoOyfxlCjE+yXhtAOynOgCEuyuH7jJnKI9Koy
         klHxD5ytUkMl5Mi9bUbQKD2ldlk0awjp22DYzJ9QPakaphvWoBEt89qFMEN6/gJPe1wd
         eSNFYaM0nCP7B0aI8kTd34QG9dSO1l7ia3JhOsP9THSpx8NXKPYQXYr1uNIQqkLyo9Gu
         gLQVh2CHo/6d5lB61R8INlR8xAwKaY1C+LWOaD0nKXF3b2MP49BqKHpDoUn4zAe0engU
         +a/w==
X-Gm-Message-State: AFq9FYLgD5D1otYUwN7iV8X1Ej234jYNROoujuAht8ixaKlaVUrT/RO/
	nTSN16/wv5dm4oYYQdPjWXYcqRiawo9k3d4iDFQ8VhynJA6feFxoV0zMPJJwpYcAZpG3t0RySRg
	rHGRYmWQ=
X-Gm-Gg: AYBFou0aHFGhV1yW08m+ZBz8JsswBY+vyNGUCcxWfvEQgPd5mtcXKMnqgNitlTUYOYA
	IveOq3/aq4TuJgs+q6odt32t98ubpzCO0LSluVNJcZ0gjyGEsisN2kR70G13LdZUiWfrBNhF2h0
	E8AVQB0Im3tj5XpLNWoQe7iJbNvpVXI/j65KlIu1HE0AEx+l0AKVCXZVrkWM1NcvgcnJZ3InCHj
	j30GBvWEfTHBy8mq5MeRC9NJgAK+j3e2WurUgvuXfvJKskZ42RweinLOrqSGCeKpcJKvNRn1B9l
	jL/dJRp0up5gzWiJfT1Eqhtg4TfA8H9dbV0OyPRbZgPBBAhsrfVIhFHWnrQmsgXstzC46nu8ceB
	6WILc8M4B0HaUaoFVx8Sw2JpI+vi+8/rml9Rql6QdU5fSXEGriHoDxwx79KCycjNTAhCGOmpdl+
	lczTidd1hWeEoucTC9yYOYurihjCe0dBhglciNkx9Dzbw4zbdXLHl/GgKr/5Au3itlES7Qg3UrT
	h5cqmS6rBwpAeyEaJ8qXw==
X-Received: by 2002:a05:600c:5391:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1ac6671c7mr181899655e9.4.1792072918195;
        Thu, 15 Oct 2026 07:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd7319c6sm85233365e9.0.2026.10.15.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:01:57 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v4 2/2] doc: Update WQ_UNBOUND and WQ_BH documentation
Date: Thu, 15 Oct 2026 16:01:48 +0200
Message-ID: <20261015140148.231126-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015140148.231126-1-marco.crivellari@suse.com>
References: <20261015140148.231126-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When WQ_PERCPU is not present the default behavior is now WQ_UNBOUND,
so update the documentation, reflecting this change.

WQ_BH workqueues are the exception to this rule: they are always
per-CPU and can't be unbound, so WQ_PERCPU is implicitly set for them
regardless of what the caller passes. Update the WQ_BH section
accordingly, as WQ_HIGHPRI is no longer the only additional flag
involved.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..76b70e7f4e3f 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -177,8 +177,9 @@ resources, scheduled and executed.
   workqueues are always per-CPU and all BH work items are executed in the
   queueing CPU's softirq context in the queueing order.
 
-  All BH workqueues must have 0 ``max_active`` and ``WQ_HIGHPRI`` is the
-  only allowed additional flag.
+  All BH workqueues must have 0 ``max_active``. ``WQ_HIGHPRI`` and
+  ``WQ_PERCPU`` are the only permitted flags. ``WQ_PERCPU`` is enforced by
+  default as BH workqueueus cannot be unbound.
 
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
@@ -206,6 +207,10 @@ resources, scheduled and executed.
   * Long running CPU intensive workloads which can be better
     managed by the system scheduler.
 
+  Workqueue without ``WQ_PERCPU`` are unbound by default, with the
+  exception of ``WQ_BH`` workqueues, which always have ``WQ_PERCPU``
+  set since they can't be unbound.
+
 ``WQ_FREEZABLE``
   A freezable wq participates in the freeze phase of the system
   suspend operations.  Work items on the wq are drained and no
-- 
2.55.0

