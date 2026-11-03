Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732907;
	b=0GrTZ0fxypvpyAwg6Q8NZHUkHu6XSmRBqeRMFBjMzo73iIdpeQWOXBLAejUSo2JIZ1cS
	 2QcudLEzq7a1QPvvoIkQPqeMcvNIdkPVd7ulrCIGZseJnIMiCLbEgxi5dsUxQQwnExq0g
	 PdRTuWuQJVloFBQaefFUkUxSkQB3HLromQ5jf3HgU6o7/R6B3EnWWVKOkvZ0HudTunvK4
	 Z7uG8/AE215hCG37MchJIm+S0OI5ScwoSLNPUjygh79UFoGJeAfhBCIlJm+gnytI2Jj4/
	 zNQvaJEfnwnvEVCTOvAS3+y8rr7CQlgq7ssKJcBHMCMhGf9IAMqSED3PTJyQNUtsPbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=p83s1UZrudYzqyiix38FzmFWnzl/cng77PjrgFldiOE=;
	b=A+h5w+diuD0RWjmpQEZ4uUmmxoUc/7pbxXHkFAcm3cl5dB6EHrmInoYi2/t/8oIEZ8lI
	 lwfyyamB+G83o9q2CIDk77CLWf+/8D1UqjRZz9UZ+oelcdhCMxYClkOfGo8cJRosBzvpj
	 Af2Vnzj7OXQSNppqZUBcH00Eb13SOCf661HSdaJJWixlEdYFnTDMiK/EpQXb9P13qCAm/
	 XhdviMGa3G+lXV9w+Wry/yZjnhPq8kIYFnhAVAzludSla6I3YG5gPmnfLwOXqRuXRekK+
	 8jkIuQioyRXuXn7NSkdqKmnvIQcO0SbWuKiCZnBKgAQMMycLINA49PNCIasWobsZi3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=akn1vy+5;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1D606D825
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E1D606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=akn1vy+5
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b00febba3so3083434f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793732905; x=1794337705; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p83s1UZrudYzqyiix38FzmFWnzl/cng77PjrgFldiOE=;
        b=akn1vy+5Xz5pRxHaBrgSKjRXzbwtRSB21+El/VdDDA5Av2vcsF3S8pHrOnmyE8JiVw
         BomVm1mkbiGo8Q8ibOmDf6w71znJ3Yr/RBXNougHUGgm3c3FoRz86AvKaSUYGs3N/cca
         n7wcwyq7wXqEaG6iSsImbry1ypAVsLZ8uW2XDeAM4DCwibek56IUMa8z8S8O+04G2kIB
         Gd61ZlwWFj4X7ohxskEyUxj65wUaueuzW2KBVMV/T0Ae/+OgLpJaLKtj6frNS6fcHXWD
         uJgnlO8Xv38sGmFAwqB75yp/eazqiZzkEKD31UDP2nY93cJNy0a2QUGAM8mzZYTGhDGS
         /DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732905; x=1794337705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p83s1UZrudYzqyiix38FzmFWnzl/cng77PjrgFldiOE=;
        b=lpguL1XIR2C0FHEOKrAfBGCGtaDRdyWeTDaekealaK9ldj6q3CvWVjJxZZMKcVmqZR
         u8+Uv0qznguAVuIGsXE8lcFof3M1CNYayREoYFs2WgjP+v5RgEXEQ2AQgjUYc2NqQ+Ts
         4yirR+uSPymELRPu8pE/eEwQ2qY77FwDxgur0TziQObBB9NO6zdwYQA8+zabRL5WDoVa
         ybFvQ3v5FxECbg6LqSqHAYlf3bTVUyMQZ0wP8YIzjd323/3bXOGx0x1EULRGdTvrT8i7
         UhVETRdhafNTW3pBipO7KhZ7znTgXoespMTN08wcgLQUdZXGW73gdQqb6073R2E3cbT6
         SyEQ==
X-Forwarded-Encrypted: i=1; AKwUvByvNLucm/4VgcN7KRwWRAtQ419qu8ugijLP8nQIlO9bfUxzTdQXaQW4wWNBCaWjbw5QJnbxwRklh1iAzqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9afFNj9V5ESf6x9JHt80R8COF8+k0twvN0N263NMOcPvtvx1cP
	wmQYpwn/aP5fY39l1+0e8cdGzx13KK13MkzZCGHlCU/Iyuh75gbhL67A7XTMTfqB0+yqykqOxTF
	9KLkhkqdfiqO/ww==
X-Received: from wrsq11.prod.google.com ([2002:adf:fecb:0:b0:48d:ee1f:7396])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f24b:0:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48e6e2ff6f2mr25928011f8f.27.1793732905092;
 Tue, 03 Nov 2026 11:08:25 -0800 (PST)
Date: Tue,  3 Nov 2026 19:07:49 +0000
In-Reply-To: <20261103190805.3487350-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103190805.3487350-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261103190805.3487350-3-jpiecuch@google.com>
Subject: [PATCH 6.18.y 2/2] sched_ext: Fix scx_flush_disable_work() UAF race
From: Kuba Piecuch <jpiecuch@google.com>
To: stable@vger.kernel.org
Cc: Cheng-Yang Chou <yphbchou0911@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Andrea Righi <arighi@nvidia.com>, Richard Cheng <icheng@nvidia.com>, Sasha Levin <sashal@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Kuba Piecuch <jpiecuch@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Cheng-Yang Chou <yphbchou0911@gmail.com>

[ Upstream commit d99f7a32f09dccbe396187370ec1a74a31b73d7e ]

scx_flush_disable_work() calls irq_work_sync() followed by
kthread_flush_work() to ensure that the disable kthread work has
fully completed before bpf_scx_unreg() frees the SCX scheduler.

However, a concurrent scx_vexit() (e.g., triggered by a watchdog stall)
creates a race window between scx_claim_exit() and irq_work_queue():

  CPU A (scx_vexit (watchdog))        CPU B (bpf_scx_unreg)
  ----                                ----
  scx_claim_exit()
    atomic_try_cmpxchg(NONE->kind)
  stack_trace_save()
  vscnprintf()
                                      scx_disable()
                                        scx_claim_exit() -> FAIL
                                      scx_flush_disable_work()
                                        irq_work_sync()      // no-op: not queued yet
                                        kthread_flush_work() // no-op: not queued yet
                                      kobject_put(&sch->kobj) -> free %sch
  irq_work_queue() -> UAF on %sch
  scx_disable_irq_workfn()
    kthread_queue_work() -> UAF

The root cause is that CPU B's scx_flush_disable_work() returns after
syncing an irq_work that has not yet been queued, while CPU A is still
executing the code between scx_claim_exit() and irq_work_queue().

Loop until exit_kind reaches SCX_EXIT_DONE or SCX_EXIT_NONE, draining
disable_irq_work and disable_work in each pass. This ensures that any
work queued after the previous check is caught, while also correctly
handling cases where no disable was triggered (e.g., the
scx_sub_enable_workfn() abort path).

Fixes: 510a27055446 ("sched_ext: sync disable_irq_work in bpf_scx_unreg()")
Reported-by: https://sashiko.dev/#/patchset/20260424100221.32407-1-icheng%40nvidia.com
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
[ Sync error_irq_work instead of disable_irq_work. ]
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index d2460a88fba3..78f15ddc0aa5 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4217,8 +4217,13 @@ static void scx_disable(struct scx_sched *sch, enum scx_exit_kind kind)
  */
 static void scx_flush_disable_work(struct scx_sched *sch)
 {
-	irq_work_sync(&sch->error_irq_work);
-	kthread_flush_work(&sch->disable_work);
+	int kind;
+
+	do {
+		irq_work_sync(&sch->error_irq_work);
+		kthread_flush_work(&sch->disable_work);
+		kind = atomic_read(&sch->exit_kind);
+	} while (kind != SCX_EXIT_NONE && kind != SCX_EXIT_DONE);
 }
 
 static void dump_newline(struct seq_buf *s)
-- 
2.56.0.385.gac671c819a-goog

