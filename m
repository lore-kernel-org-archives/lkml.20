Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF746371867
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029141; cv=none; b=GBN7ZOztkg1zxtwXWU+6p96V+wn90f2FjtiGxeYdRPO17oBWtHZzBAbOViOii5+e6qWfESJBoigHccDW+G99YTqgDDiqQ0989nZB/ZnG7u3yzj5z8x+SqowxNYqIrooHySNxzrFzy+nnSS+FStjtfuaAsZYUxfvDNf6bEKVomEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029141; c=relaxed/simple;
	bh=KP2iHaL/44s57MvPvmwfua7vwBb/vSPDJ59vz0bCga0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EwFzG8KSRFF2Tq5z1sY7uOdrLT0O+jeBqRAGVqoUUwKgARfCqko5IEk3xErG+iqmSeZuQNIg1vSLCf56LeA+yaUy3aZ8hEE1KsaWczJQfFdHWDGdR2P39VW474zqZb4hxoDSZb6gSSSPFaEvgjEyAktjsOWfIwFc9KnBHUw4SNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qm934V+C; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qm934V+C"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so4267921eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029139; x=1792633939; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glf3wPsStHsKi3TlEqw1dZgM8u514rgSxUDeGdh5Ugc=;
        b=qm934V+CtW9rd/Y9vMifc/pQ2hKkxJeV9wtiqMHuf+loPeUvpwTemCYSeSZbZaUz6t
         ml6le4ZR/CW+uX2hFPxPFHzYJKPA6dtKb7vhgxT68b9fe8Osnkrf1Hrpo2ial8UlHoX7
         Qd7p3JFSCzy7RCacnjBLscaZd30f0+exR5rL+srhw45X6Q3HyOiF0GCwtZFhr/YFtRnu
         2kEEhpQVpgHorAbW6jA4BAYG6rHjz3R/4iIa4xyGSIrubfVFjE3sXUbfL8KXICuX0g+w
         Mn2Air1qC6BNOON7XvOpbrwJ07k8BlCEDNUYFtcL/PvIkKpXB3Rf22/VMZpDcKwiduI8
         Rbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029139; x=1792633939;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glf3wPsStHsKi3TlEqw1dZgM8u514rgSxUDeGdh5Ugc=;
        b=0TfAv0wevgHCy6oBDdl+Xyr5ldfSv1pEJt0Lboc5UPvYwxHBoeXezty/nCG0OLzr3b
         4ASfWmIaYAJEcvZHQrbgih2+XApYbs5ztjlzN9hyKL/jvnEDqXYhx81lxsNinM5G93Ak
         lKkvBMSOw8ldVbdc58IDp8xgvjNMGZwalnqSFJfz1HKv1M1b5W55ZXh5xu41bYi1F54t
         UhvveT7L9QER50S2KDuTZtFE8MIPgDDw9Ow6kjQXd+8G/sKs4yJBB3rzyaH+e8GfTXQF
         YbCZacJEHCPwOtkFD2DruPQBjRvlB9V7gXzea1v+K7rjF+DTWqZz3odzddPs+JPgZ0CA
         7Ehg==
X-Forwarded-Encrypted: i=1; AKwUvBxA22/T01iqAg8HjcRnCBuZrjGr1JpcbU117+VKF2Qv9Z0ucLoggjq5TXR39TCSAyl4SRRKsJ4Uc6Is3lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9wpKTdPIIEfHkJdbqOZaC5c/gO7tAx1dPg9KfhImFnmtNclxW
	NlTnA8B0CfxV56C5pJ0Hgxrz2bS6J7uY/t5WtJCdubuFavGLTWXW8d7OJASWLY1sC9I=
X-Gm-Gg: AYBFou3k8wMvW+o9I/UjXfdfHg7rxREfl8ZMWs8Z0lF2ob4Z4Ln/2KsQ1S+oxYvEfyM
	MHsKTSjgzIyEz2TApzpBhIHYNFQqPilXaR9Ijb4zVdXDQMeTO/OAnxx0t8bGE1RKGxopv4qWYOe
	BQDIKSxYZjXSbw3bUTpfV1uVKA2K8aWc7Q//tuAX0cmAHxe5T1CuEogdDONc9PKtiS8dVCetwtV
	mG3/AyMYRNJ5DWP1/jrTO0j71CCSziYBv+cKLaKDvst+DpcNtqCZRvwhX7OnlPkBAHvLSDoPmH2
	YIJlbo/CVZlYFI9I9F5ejES6c/8ZwZh0NYdj7FCI9v3z31aNG0izfJd/BgNFzZtacMFqwmB+jv/
	+VsSwN9z1USnRcuJHvY8Ll5vSMwmiROtln/j14tXADB/7qVqzzybrHIUi5a3+G5kAKs3ho6kWEL
	zWIXNG3J4tDfhSplWIYMNKsrZoQELcS7IjLfTrQVYM+pfAwATl4EmDFHry2VLpU9yNMC72TgZK/
	iXV
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id a92af1059eb24-16a5ef287c9mr26663841c88.22.1792029138518;
        Wed, 14 Oct 2026 18:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm50647870c88.2.2026.10.14.18.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:52:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] block: skip quiescing the queue for the default
 elevator
Date: Thu, 15 Oct 2026 09:52:14 +0800
Message-Id: <20261015-bug-block-elevator-init-quiesce-v2-0-505a2b0b1c07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4x0GoC/4WNQQ6CMBBFr0K6dkxbLIor72FYtGWAidBqC42Gc
 HcrF3D5fvLfW1nEQBjZtVhZwESRvMsgDwWzg3Y9ArWZmeSy4nXJwSw9mNHbB+CISc8+ADma4bV
 kjUUoVXsuu9qcKtmybHkG7Oi9F+5N5oFi/nz2YBK/dXcLzsVfdxIgQNmL6jRHq2pz6ydN49H6i
 TXbtn0BVfHvPc4AAAA=
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Setting the default elevator of a new disk quiesces the queue, so every
disk added with a default elevator waits for an RCU grace period. Patch
1 skips the quiesce there, which brings START_DEV of a single-queue ublk
device from 7.74ms to 0.68ms at p50. Patch 2 renames a misleading label
in elevator_switch().

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Add Reviewed-by from Ming Lei and Nilay Shroff to patch 1.
- Rename out_unfreeze to out_unquiesce in a separate patch 2 (Nilay).
- Rebase onto for-7.4/block.

v1: https://lore.kernel.org/r/20261001-bug-block-elevator-init-quiesce-v1-1-5c85fa0ec59b@gmail.com

---
Qiliang Yuan (2):
      block: don't quiesce the queue when setting the default elevator
      block: rename the out_unfreeze label in elevator_switch()

 block/elevator.c | 11 +++++++----
 block/elevator.h |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 0f6b042f9a13968c4cd6cde1a70a7b242009ef46
change-id: 20260930-bug-block-elevator-init-quiesce-35d73f9b462d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

