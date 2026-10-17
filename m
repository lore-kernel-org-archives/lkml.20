Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD35390204
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216117; cv=none; b=klHQmvz4alfgYH2BogTgjSC/8nuoSRdTIe4LimzUDGpRKJCOrDyOkRnlPoddgvEKDd6XDPPcLICSzN3ATt1CfE85p5NaJN50LJj2gHbVs5ZysseiG/KznXaf2MV9L2Cse8CIVbqj6IkstZytLVBTRNO0hlYRHYA+VzWcLL4cJMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216117; c=relaxed/simple;
	bh=m+qK95YsXLjQ74wCYltLIhf7b7QUBE/Owh0lXAqBWcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ga8yub2kPEvn6nneOGPDtQdKhSZ8jYxQ5jfYwHRJzZmKn28bSTbpQSTeGyqHEmMkYFRvjPBHDCllAtXBO52Vl0CPKUQhzpH6xCLWl9hs6aQldYb6DYh2V+kaHhyMWBc0yowbe9Go9oO5Ul9SexFajWVsnFR0OvevPGj/RbJ4lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxdWjuNb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxdWjuNb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so581794a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216116; x=1792820916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7EatRdxc9GCmX3PE7WN6BAzYijlsRrXgxUIuAQGbmU=;
        b=YxdWjuNbLwoocpmn+pYWYlKhIPbMwaYXewp42ScY0tyDulTU6qWSW1Z8ZKYczAIA6s
         Hg0dKQ4U4Q0TnLV/obb3bISetKeGWbqdhsl7dP4TxXQ5Oe4wG/rXkqu9AXotg3wUJGJr
         jhjD7KT0AK9xyYwGvDaRCjOL/5Ofx8+dyNCdUK6ig8SnYHBjYy2TCNW0RWcHZkdEJvX/
         Bxdk86GV3/ie4Jh/oE4rxAzEEqMR6CHTwY7CvMIR/lkrLk3k+eGUHBMDD6Ib78BJdviJ
         v/setc6anDOVIwb5geTthxKaQ6nH4FEH1qZchStGqNyUIdmoEnWzgDM6Ls1BPNHBVIUG
         Sd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216116; x=1792820916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7EatRdxc9GCmX3PE7WN6BAzYijlsRrXgxUIuAQGbmU=;
        b=skfv5GEW/ejHj/kcplVb62+dhA0uw7sjF97N8Aeck7yQfnjExhDe/VPCV1CqblHncS
         Wa4iJsvK9SMCA9Kc0NB9p2aNYnE5wDRQ2BdlApZs2dfRlN4OGOP4qslfdIEsH4q1e/LW
         s07MOCjkpei5d+a5Tve8eZcZ+stHGAJ1Qp3eJoYXyGybA/WXltTkEYbl5ZOXI+lpF/8p
         Nga6+wjDrS+z4HI1xWzhYU9nci5UiNAOV+6u8XnnC5G9SjuVRGo/LX3DOqa/QtAm6HPY
         n85IZjL5EAzqyASDHsWqopk3Z6LeDrItp9eHX8wcnvd/00Ock392JLyaxR4V1G7n9cNY
         1nXg==
X-Forwarded-Encrypted: i=1; AKwUvBxW7jYBRlufq82/ma7z5WGQd9ElEuI7KnwxnsRMe5KrQLqHDSZsTGbj9FL6Fakqwpty1lnhhM5Ukmm5hDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0FQkDnyLL8pAB14JU2A+kM0UisfuitT0wV0XLQZ74NcAzMQMR
	QO7Ja/b5h73a8eSYeiXyDWEgAs0HQTx19wjtV/3GuEILmT3T64Pno7GI
X-Gm-Gg: AYBFou0t6fb99tTj2UD4OWIvYMRL73YNyc4SUY/RKaZb6aov0tYEnW1gyXfLUQsIZkn
	sfWlJp1FSfPxE3UnwSft1IU8QodPLvep0KsB0wjeRQc0IuQnp9cvTU3Is7MYpXfMXrl/gofy9Am
	JpHl0kGeDIbK65hta7A3m6CVyEB1PWyxqMNZyZVwOUNX24i3P/ARZX8sSWT+9YIpxyA9LTf0orf
	pg1YgeMZhJLLwIjRSfvkPqqo8dm3luI3DVrNYDGnu8UXaQL98ZjKX1/LWex4ZuxYv24EiYfkNh+
	ashaiG7E/k/cwHNmFAsmRCTLxHiKsv9jDGkaOSYt4i1sMj+lLqnzO6GalsZZrB0mlDkGtKtVq6V
	msbDCrNiRNr4D5G+fJk34mZkmxpF1jdhXVzCOvljUG3vu5jPl7H/eIO09V9f5ud+y2h85FLmmDg
	MoN8MNsOjomG4dFD8EBVcvnsI/KZ4iqbUQq89/p+Ax6emFjQM7b5cpDqer75g5cc/pVXjdJuOPI
	AE157KSbTpF6X3AlfwVayPAuhcMYXRazUyxbzX7585JqtOqzCFQuCUb2fUjmKT6W3AmSrvXKt8v
	jlytyMU1ji/3kA==
X-Received: by 2002:a17:90b:562b:b0:3ac:9d26:551d with SMTP id 98e67ed59e1d1-3aceefc0841mr1636007a91.50.1792216116049;
        Fri, 16 Oct 2026 22:48:36 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm13570028a91.9.2026.10.16.22.48.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 22:48:35 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/1] ALSA: virtio: trace control message lifecycles
Date: Sat, 17 Oct 2026 14:48:31 +0900
Message-ID: <rfc-v2-virtio-snd-control-trace-0.60ead383067a41ae@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds a control-message lifecycle trace event to virtio-snd. A per-send
ID connects enqueue, response, cancellation and sender wait outcomes,
including a response arriving after a timeout.

Changes in v2:
- Group internal helper event arguments in struct virtsnd_ctl_event.
- Use designated initializers and named validity flags instead of positional
  booleans. Keep TRACE_EVENT and its record format unchanged.

The event definition, error handling and request lifetime are unchanged
from v1. The patch applies directly to the base below and has no dependency
on the experimental VZ capture changes.

Validation of v2:
- ARM64 W=1 builds, including KASAN/lockdep, BPF events and tracing-disabled
  configurations, passed without warnings or errors.
- Eight QEMU boots passed malformed-response, enqueue failure, asynchronous
  completion, interrupted wait, timeout and reset/recovery checks. Trace-on
  fixture runs recorded 280 events each without loss or KASAN/lockdep reports.
- A non-debug QEMU/HVF comparison completed 90,000 lifecycle cycles and three
  10-second synthetic captures at 4,096 frames. All functional checks passed;
  captures each read 480,000 frames with no XRUNs or read errors.

On GCC 14.2.0 ARM64, the event arguments are scalarized. The control object
text shrinks by 56 bytes and the send stack frame drops from 192 to 176 bytes.
With event tracing compiled out, the old and new object text is identical.
The existing 24-byte per-request metadata cost remains unchanged.

Host-load stability checks failed during the timing comparison, so those
measurements do not establish an isolated runtime overhead percentage.
These regressions use synthetic QEMU devices; native VZ steady-capture
performance and physical microphone acceptance remain unverified.

The malformed-length fixture writes a full response and changes only the
reported used length. The sender retains its existing behavior; this patch
records diagnostic fields without changing protocol validation.

Previous version:
https://lore.kernel.org/linux-sound/rfc-virtio-snd-control-trace-0.208f05ae8ea44e77@gmail.com/T/

Thanks,
Joonho

Joonho Lee (1):
  ALSA: virtio: trace control message lifecycles

 sound/virtio/Makefile               |   2 +
 sound/virtio/virtio_ctl_msg.c       | 178 +++++++++++++++++++++++++++++++++++-
 sound/virtio/virtio_ctl_msg_trace.h | 107 ++++++++++++++++++++++
 3 files changed, 286 insertions(+), 1 deletion(-)

base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
