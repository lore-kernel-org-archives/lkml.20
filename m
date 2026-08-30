Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B61321F5E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123175; cv=none; b=nXARzzt9bbBln3NVz/rna04C5OSH91pNYMQsSIFrI5cJhgfT0yTdrwEZzrfjeOaA7ZoTr5pVgOYAOCPi1GtsLNG3Ex4TwYRfEpkKuz0leRWQRhAKcUsmbukPvvTkfiA8u1yRzhTf/PHIvfAO6XSOUYXe3gQL1aoRdJG7Q2YU5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123175; c=relaxed/simple;
	bh=J1XnXvUhkya2ACpjnSJHwTSg5sxeBkJnQgGmjFu/XDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ikel06xFBVpKYZ4EIadsvi3AY93oUWU3w6O2TbY5+JUuQxsxrxsVm1Qb+Uao8EF/kt/+IvLZ+AaG0SbedQEBxN4/oWbR2izr/KDXjPzluAnj5kB1ZTb/+qd5wSXPnYMJ5Gxb5T5J1vib2RdoLOKxRJX9RDW3Ycv6nK2pvTPikNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCQ2r/Gs; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCQ2r/Gs"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so1956627a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123173; x=1788727973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e3NLpNy+BDe0j0QP8+nBDEi6sQEUt8fjxuUZyp+2VTs=;
        b=jCQ2r/Gsp3BwOES5IdhGU3B3cKwFtJautNu9DEA+HEiwERjF9IyprJTDlv03KVmZne
         p7RkvwJB7p3QHel1aW986friAar0yl5hp2Vtfr2HeCXFZDfecSiycFhswNiu7ejmu3HD
         sSC9+i6+jJ+9usMKKRxU/3wu3q4aWhOZR8OOxvPAYaaFcupghdewVVr3UHQizg8P13cA
         ksD+/MJkAk5fTEnxKPInChZhwOcOW+RNeG3M9/iSv40UNKMfDP7x4pF1o1l+OQdjdPGS
         EXlFR2H3SIoZvwbJL20zNuYiVJZ3LlI5ufj6m4UbqLg7YEXRz5CPXy9IEX64+tPnpjR4
         TgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123173; x=1788727973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e3NLpNy+BDe0j0QP8+nBDEi6sQEUt8fjxuUZyp+2VTs=;
        b=ih7xqoAlIKX8o0NifR+eHovcxjlws+5XLKWrHJkC2Cc612XNlVPGL3mPn/CuEFI3Pr
         ELWNkO2FLLohFU1PotyfDSt83imfX1FOE6zS4IKY+FZ/PRqZfwaLaY5mz9yTw9tWVpJC
         Jt/JHyPiO0kFcmP5KJpeqzJhfvSTKLOGfgXVWoOjCjmyLUsJiR3O+1QWiA0oB9vBJHyR
         NQ1nUn89qDoq4YrDSpjx8Wy5DNJpOAx0vIE9ShacV9Y/p4m50YpeEtG/a7fEJZb8tNDa
         nnZYsgjQtHEPbuv646kVwL3iqY1bgdkhjOHqyAAqo4zrzRW9Bw6z+ZUu3Qng/EHElsMI
         USIA==
X-Gm-Message-State: AFuF++mbvMF179VEQVOyxNyDejps2zqhgYXw8teSeBR98YLrJEpQBOP3
	Am3EIpFvUldr/NPFM7KHsjRnGbfN9xD/n7sAeDq70NEpDasCZfFU3fLAw9P4BkNd
X-Gm-Gg: AR+sD13HaLG6tORkpqluYfVwgSTp7kGjF5s9jgm+0CQuNjQS7SDpZHJfNh/r1v+/e1q
	94QY8r/bpf941SxzpA6YH6h6Yq36pYJ3s2kFo40BSAH2EXOsJ4bNWzFtnlOOu9dp065P3vLA8rF
	14RM//X3Hcaj0hK71xakegmXXNz1Xa1QQ0ffgG2ZoH8uRZY6siAYtHxhbsqUM+6Az5Yisldcmqc
	zwbspCklLmAoZhV4t9drTY9x46obe1OUPTTLM2YDg1DBLpA0IWxN1G4u/ti7Ixw959mA5ezRSqU
	3+55lsMFgdVP0boCGbJLN34i4F3WwE7h5W9yki6ntNv7lzamQ7kL/M12y7QGDAySmOuT46bsL7P
	MybFW3OA5OnsEJaIrb0Yzx4T2NByujyUbTFZaYama6pCo2EvrCwealOghaHjvM7CBx9oRspIZxW
	jqgj85vsTx5dIBbT3cGbLta6ewPnN9B8aOLn71bQphgkv5J1C1mDilCJIiOaC9INieHWB2ryuFj
	neq0In51Zd2Wm5WL89j/nFarLDFgMDtxBjKhsQqt3H1+lHoG1k=
X-Received: by 2002:a05:6a20:9c87:b0:3d1:60d3:9a10 with SMTP id adf61e73a8af0-3d26784f276mr36532863637.5.1788123172866;
        Sun, 30 Aug 2026 13:52:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:52 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/7] Input: gscps2: cleanups and locking fixes
Date: Sun, 30 Aug 2026 13:52:45 -0700
Message-Id: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2YlGoC/yXMSwqAMAxF0a1IxhZqwe9WxEGNqcaBSqMiFPdu1
 eGB+14AIc8k0CQBPJ0svC4RWZoATnYZSfEQDUabQle6VqPgJkZZ5whztLZ0NcR48+T4+o7a7rc
 c/Uy4v2u47wc98uSqagAAAA==
X-Change-ID: 20260809-gscps2-affec5caa7f9
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

This series cleans up the PA-RISC GSC PS/2 driver (gscps2) and addresses
several concurrency, locking, and interrupt handling issues.

The series performs code style and structural cleanups, including removing
forward declarations, converting printk calls to dev_* logging helpers,
and simplifying enable/disable handling.

Additionally, it resolves several concurrency, locking, and interrupt
handling issues:
- Protect ps2port_list traversal with RCU and manage port registration in
  open/close rather than probe/remove to avoid use-after-free during
  device unregistration.
- Protect ring buffer indices with ps2port->lock in read and report
  helpers while releasing the lock before calling serio_interrupt().
- Assert and enforce ps2port->lock across gscps2_flush() callers.
- Return IRQ_NONE when no data was handled on shared interrupt lines to
  preserve core spurious interrupt detection.
- Serialize concurrent interrupt handlers using a try-lock to guarantee
  in-order byte delivery.
- Drop the 6 ms busy-wait and manual interrupt pump on transmit in favor
  of standard asynchronous hardware interrupt delivery.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (7):
      Input: gscps2 - clean up driver code style and structure
      Input: gscps2 - use RCU for ps2port_list and manage it in open/close
      Input: gscps2 - protect buffer access in read and report helpers
      Input: gscps2 - serialize hardware and buffer access in gscps2_flush()
      Input: gscps2 - return IRQ_NONE when interrupt is not handled
      Input: gscps2 - serialize concurrent interrupt handlers
      Input: gscps2 - drop busy-wait and manual interrupt pump on transmit

 drivers/input/serio/gscps2.c | 277 ++++++++++++++++++++++---------------------
 1 file changed, 139 insertions(+), 138 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260809-gscps2-affec5caa7f9

Thanks.

-- 
Dmitry

