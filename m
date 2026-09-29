Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1851D525
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698658; cv=none; b=J9ITtWkJr0CirNMUwaUgGq8wBNa4aVzrVa78/hPUt57pyzFUTwb9nh8RVd4gysL3G4wnPYlr/6A3nX3YIKod7YTi9n5P+2OOwW2fBmcz22zdxQVVv/M4m03rjL0WZM0LhWuSf+95tk5734PnixGysYWBju3g/7ULMPdH2vjF1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698658; c=relaxed/simple;
	bh=OSapIsypgzxAwguCwLF3uHoyRFOPYISBOQuUBeBGKjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s79cA8ALr5fsRhaPg11WsHKU1bCPMuzF1hU2KqRnYhW6yEqwPldDwUWmWAwHboc+HOL5W94gvdBwlTJh4KZuSLRw0zv09xbW1aviikTg/3KeBqKfQlWfJfpE1/ZLhs7kNgN1TAWZgVrr9SAIZgs0tuUrDX92BgY1YCpp/hKTgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kmfE6b6n; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kmfE6b6n"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e65ecd557so29460265e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790698655; x=1791303455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/6pvxZeKIDYo9vdlmIoyBxKuaoJZDw4e5OkPlYPYA8=;
        b=kmfE6b6nTB679PaTI9r0GFluqAGvVGINgEji8T8wAwFltcA7os197bfuP4kSOFOAm8
         8vfew+aUjQkkwlAYPYBtCIcs8uBjRACFx3qZ6BbZ7iiBvKNB6KbH6LH1cX+jZ26CfDEW
         yFztI2JYrZwUASJ0p9RUTDPWsk0LQnXKqZRbGIfPyl2XhQ7M1S/Tz13xKoshMq/6wHs9
         vAqRw5RMU+5CVs99hOX38nghVl80FUKkYGanLKljk4WQYQGNsNKr79jQ/jyGyAoVuFxr
         nlXbwi3WCAlHj0SG+dGHvsQwS8Tvx+OmzF2TVLXgTcLg18XgHom18MXBLaV62HVb6Ztz
         Yu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698655; x=1791303455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/6pvxZeKIDYo9vdlmIoyBxKuaoJZDw4e5OkPlYPYA8=;
        b=JQIamitphabSCZbPxaqZH1e2VRYxb0dlTuAlP4vw5tu2SlVp5UV4EVYLABcBCu4MkW
         X7bJlf+hK4vrS+kbFXYkyK0m97UZyxZEhNZkUOCum9B/eVApjO5GAs6Lhk5FcCrJ2HhZ
         POd5/2KuVdGdJTudXEl2SYWhQgDu3O8wPDWUcbwblLuGaLHtxE9NVtkH0p04uqGJRzJp
         Eoeg2rBDLwwJKomOz2fTR2Qz9F5KKh/lHHqmXKFDDeKbmzn6HgApBxAcDscK2NfNiY79
         yphlBI/5Nqok2I3zmoz9Z0x6wIIjTjKdG2kUCUNgMPWViMIKBh0PoF6WvpcJZJYmWIEX
         f/YA==
X-Forwarded-Encrypted: i=1; AKwUvBwRWQI3BjU+DAq9S5Qi02ORg6BxkHyo5ugOcJv4sNbn3Pp9bCg7PAqPMKc8Tccihd+axvqgPbko4FX81LM=@vger.kernel.org
X-Gm-Message-State: AFuF++naPQj4bqkicEEydY215c0ZeyJ9QZH7P0DvEOpjH1qZe5C9m3Da
	jpydKg6T+H/9gQCHEP9Iea1U+6kd1QvGYiT9wZnvPfnlQBCNgoUnE9syW0bJzRWrdplCsBcc4qW
	yuSrineu75r1/Iw==
X-Received: from wmpe40.prod.google.com ([2002:a05:600c:4ba8:b0:4a0:137d:1bc8])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr173062125e9.13.1790698654808;
 Tue, 29 Sep 2026 09:17:34 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:26 +0000
In-Reply-To: <20260929161730.185271-1-jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929161730.185271-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929161730.185271-4-jpiecuch@google.com>
Subject: [PATCH 3/3] selftests/sched_ext: Enable the dequeue_remote test
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Now that ops.dequeue() is called when a task arrives on a remote local
DSQ, the dequeue_remote test passes. Add it to auto-test-targets.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 tools/testing/selftests/sched_ext/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index 4e06d0baaeec..af919a56a4f4 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -165,6 +165,7 @@ auto-test-targets :=			\
 	create_dsq			\
 	dequeue				\
 	dequeue_iter			\
+	dequeue_remote			\
 	enq_last_no_enq_fails		\
 	ddsp_bogus_dsq_fail		\
 	ddsp_vtimelocal_fail		\
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

