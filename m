Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A20480DD6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280527; cv=none; b=IMMAlgWCugu48K8+0DnLP8SzViC8/SsEmUc+e4/QIW2ZgaIUjYSy7sVRPg0MO+3lvLXVLy17j3kxMbqgmdccrEUv8Eec1iJHdn225VnZbSx6WgzNN0EqemMZcT8qVfg+tT0CvXX6j67N26WUOA8DkCloFJ9E67fzUZm56vxIP14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280527; c=relaxed/simple;
	bh=z88Zbti+eVn6lXXx/+2Go/9F6rEqw/LuvvNJSb76Nek=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=VSRKfu40YrEQKxe9EAuSryqnFY/DT7OKV5SKlwo5l0iUKtp30GTtW1M1mVluvOlZ4ky7yg4hrp9GSPjbus9NaCtm0JxaZuJ/ZRnTN2ylKjFWgMaF3xImCzdosEAbEKedql+jzFmZoSOsNhj3quuPPLCoCnxAMAp7evyMUEVxDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SqvT5Z1R; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SqvT5Z1R"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so50531a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788280525; x=1788885325; darn=vger.kernel.org;
        h=content-type:cc:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vfJ+8z3YDb4sQyJTzQApTAjtBp19tmC+bWO+0fB6Ujo=;
        b=SqvT5Z1R97FCYK6cJbzLL47ma9FdGjeo746qsoWgRdrwkBDSWv3Vl6cMnj/s8SDK/j
         oKeiuqK2ZmH8gNs/WP50VGfx/EG7XqGe52T2geSzYocPn8BSLcXlisaYhSrN40otzIAm
         A4zxvNMxTGvTndETIzjFmG4TZjftngavhIz/j5fa4s+nq8wR5VWye5I/9VEkb8TsaTpN
         ZlJYTXnFjsyyjj4t6JB+bB4uUFZQ9MY3tkLWfkBV4GJAexUFllYmvUOK1QBeFC7cBpD9
         RQnw753StAOMYC4CmQ/P6ycHfjuhatnyWCLOoEueJCQICzAMGwSqQIugvCK7tYBfJNMC
         cBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280525; x=1788885325;
        h=content-type:cc:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfJ+8z3YDb4sQyJTzQApTAjtBp19tmC+bWO+0fB6Ujo=;
        b=AucfyqrAC2zW/UpovaQsE9rLh4utaYweFZE6LtOeyJ/ntuGKlDHxkBo8CiC8hXl4dW
         /ichuxlBTUzAFHbKUMCEv5esP9UZBnnNY96To45hrpkzLLTdDjLYnghTW4T5/LmaldJj
         imvx+LzP97scWKpgIckLTe9zYyHeID4kU1/2CzLuJCGtEpplCBhbz/l8r5tHoTug8vM1
         6Mpth4sBxE8saCH3XokVqxvGOMugV2//LAZAuieMhezXVSDiEcy9WconybZd1GobufBh
         ZLxVOmg2xOY4Mvzr1ShiIwxmQo4Jedo4jAqXYbDJdSAF9TKpNsVsiY/Kye4tfvzg4pTU
         kZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKJRCkRQ4QyS2W1neMP7TMYwkB8zQLYRCPNywMlwjstYXP55bqn8LA5NFGjoHJ1QGCIYi1jk7aHGOSHJU=@vger.kernel.org
X-Gm-Message-State: AFuF++mmgTXFcuiNBZbw0zYoe/G7yAsEqjpb4hUspGVTAPx9W5gH348z
	4DPD0eDOnt3wRpEusNZERw2po2jrE2YiEcaoalcIBIYGN7YCqCUFzw1EvRTIbzDESlnzxAZr48O
	eQsaHoqcZXX1rig==
X-Received: from dlak8.prod.google.com ([2002:a05:701b:2908:b0:13f:9a34:1f84])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2551:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-396d0fe384cmr60584271a91.9.1788280524517;
 Tue, 01 Sep 2026 09:35:24 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:35:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901163521.1355535-1-cmllamas@google.com>
Subject: [PATCH v3 0/5] binder: fix issues with mremap()
From: Carlos Llamas <cmllamas@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"

This is a follow up series fixing some pre-existing issues found by
sashiko during a review of an unrelated patchset here:
https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com

The goal is to safely reject mremap() requests on binder's vma to
prevent pages from temporary leaking and accidental IPC tear-down.

--
v3:
 - Switch to a range-check in vm_ops->close() and protect against
   partial munmap() as Sashiko points out.

v2:
 - Set VM_DONTEXPAND in [1/5] and [2/5] per Sashiko's feedback.
 - Check vma->vm_start to prevent incorrect ->close() in [3/5] per
   Sashiko's feedback.
https://lore.kernel.org/all/20260901030419.470246-1-cmllamas@google.com/

v1:
https://lore.kernel.org/all/20260831224145.169403-1-cmllamas@google.com/

Carlos Llamas (5):
  binder: set VM_DONTEXPAND
  rust_binder: set VM_DONTEXPAND
  binder: check vma->vm_start in binder_vma_close()
  binder: reject mremap()
  rust_binder: reject mremap()

 drivers/android/binder.c             | 13 ++++++++++++-
 drivers/android/binder/page_range.rs | 15 ++++++++++++---
 drivers/android/binder/process.rs    |  1 +
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.55.0.966.g6673acef38-goog

