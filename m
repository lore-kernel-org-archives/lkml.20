Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979528;
	b=FEG3biRsUTvBeIXWZ3X87LD7EnsgZavPNtxkRM4xyN5jQPwEsUJaqfcdGbZK64aNeJOd
	 lh8Xr8PAbZ6K3T4sbueFoJUCnfUJqWySuCd4Jl19u7mX4Tdj8op7qyX+i1PTOO1Nnaf7o
	 w6ew/HoAH4zt6Y4bE1Nu4hkmuc0idScAnA1THs2fenHhb1DbhVNQzXq/FmFuMaRxTvBGs
	 aXeRhHNFy52DSxpxNDUBLC/pEVhl6SUH0G1z3e3ZhPrCUOa0R3eD/HqwJhLxnE3jDr4pr
	 BlQrBrgk+oPB014+/ENwfJWhxbATXVNZuM+9lMac7HW0hzUoV2I34HFFxpWBCClTjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
	b=wWiLLI8C5rG5ySY4N4layD84rlCl4VCFl7qqmzGfSkEqSMXXyxT8TF2yCTVg8TLOhcNo
	 bKCQy14oHQBdJwrmRC0o19xjCTe1vxL+PPWBqvKC/4Mx8BDP2w/1bTnWM1eY+7kmkgm66
	 bgXnahybxfH1KhNifZ7XITU/+lYGr9qX2yXocgumRuT6tJyYGmc2jGFGj81M/FPa9DjYG
	 GdNpUInZV3LyEWpgyTNG5uV0gEEdN9B5L5vs5LZ7IKzTGHVgwSsn5W3Bu6xk9oMcGZWAu
	 oWqhXHTU7hsAO1rafCBr3bx4dR3rT+w8KqVlB0uFYnKb8gmhDzezj0K5RcOS/GUqmYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJAJQYE1;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB20606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJAJQYE1
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so475394a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979528; x=1794584328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
        b=dJAJQYE1w/j77c18sxLOlo+mr1HuEXlS37uqbWjJ4X/5lm97x75Vp+apbxqyhKE+Fn
         HWTJcV1wWbDg5zUaT5jhN8RLS3k6SY9lJX5jXuG9wWu+dB9lWbchMLk6X6vnoBTqWw3s
         pV1RRNRbPPvXt40PH1AIzIM8v4w5Me3sSeOn3O6aAE1+sP7AnnZam8Vyuj0MZ1TKiWij
         pFwvVGrnmK/BCISZfmfpAa/tKPjMkdNwTZ0V9h0795WuYHlTlfZ1/VmoW2x83SisKvVT
         LACJSAj484px3o9i8slantTN37v6/QJsYLYkZAwN/uv/GL41bimO30PxYXrM91Vr43Pf
         HjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979528; x=1794584328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
        b=AYNvGiKkK1pPnXW+exgo89QQu2eACONcgaXcQKGCHOE5boaTJqkSImonJZ+GDMRW9H
         RXJNn3ZdPBuDxDUOyI6aYI2QfwM3+k9XJJIavSrl+UAvQET0+sHWBBKX7JfNF0EBQryv
         hlekV9fEsKDYQkW+yo/dR1ykiVVSvzQHIRjlPEHnXdRI1JLQMUeYkxM68Q+q/DdYEXcN
         q0oZSxt51CZG7xBviND8SwsXGaMHH+pJEGY/Wormy/SrPl/k0NkZbvWrUjPngp2QP1R9
         PeDl9k1IKC3YmhRVfoW8LzusG8gNCpaPC6X4wP5RMZOzfE39ZQhtepaEE7qRIYUxfoCc
         qXww==
X-Gm-Message-State: APuU4Z8QsLGfjwsbCFMJl0LlO9HtRTE4zy+/16RInXNPeWA+ijMcoT2I
	X6slBTqDs27ZK12L2laArWUr1lggQKNAhqNVJUfmdwXCxeVN3Ct2Ogvn
X-Gm-Gg: AYBFou2MHEeGuKk8NicXeJYW7tA2I3sUy3M/c6rNfguSmLfEn1YMG47LTs0PXcmVeJP
	OoS39oRJF8+fw4KUMAQAAH++dUzVaHKwCW5W04TXxrx3dxMx3APnOrJUcHDU+CrKXHVU4tKnm3h
	ng2XDJwDLsQO0c+iWTTP79xPeXNnfJW93rJj5YI+ogdHsGYlxFfWhaFVwU4tXapX0eGmrc3H/XM
	4TJRg80UXWUYcH49qCvzEEoW6TyNqaS+64MHnKPdbezYM96zS4K4tId2mXSjGAFSbRHBMiu/1Vw
	gZTBveZc3LP0GQuKijfem/IpYqSg7COfJR4stXygGRE0l2O7CzWH8hha5G5z7Wotve8J0Cn3PUD
	xnZBSBeK70vNdfgNOBf/OBh7KEWbtv/VqpMmuAENchaCnnIhf5PYWe4lq5PeISZvMvsFrxyxr5x
	WDKV+/4N0xL26sn2Kc/NiCk4+XPA7AQFcLeQwCDribmItytWtCzxp7QULvIqEyReoqnow1gmiQm
	AMveMWSKS9G/KOB6fJ10BLKPNK251QGZx/bChIYVvjnJk6cy6b46barti5G+WQsnzyKx/9VkUsK
	nEABgOhu+nWB9+7LqpRRoUL+vrd55Atkw7J4H4+XRfqXz8kE
X-Received: by 2002:a17:90b:388d:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b0db13e119mr2605368a91.0.1793979527519;
        Fri, 06 Nov 2026 07:38:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b2b57sm9067695a91.15.2026.11.06.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:38:47 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: cx23885: altera-ci: drain CI status work before free
Date: Sat,  7 Nov 2026 00:38:31 +0900
Message-ID: <20261106153831.2736659-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

altera_ci_irq() schedules inter->work (netup_read_ci_status) from the
cx23885 interrupt path, but nothing cancels it on teardown. The worker
netup_read_ci_status() obtains the fpga_internal via container_of() and
takes inter->fpga_mutex, so it must not outlive that structure.

On device removal cx23885_finidev() calls free_irq() and then drains only
its own works (cx25840_work, ir_rx_work, ir_tx_work) before unregistering
the device, which reaches altera_ci_release(). free_irq() waits for the
interrupt handler to finish but does not cancel a work the handler has
already scheduled, and inter->work is not among the drained works.
altera_ci_release() then frees the fpga_internal via
kfree(state->internal).

If the CI interrupt fires shortly before free_irq(), inter->work is left
queued on the system workqueue and runs after the fpga_internal has been
freed, so netup_read_ci_status() dereferences freed memory and operates on
inter->fpga_mutex in a freed structure (use-after-free).

Drain the work with cancel_work_sync() before freeing the fpga_internal, in
the final-release branch where it is about to be freed. altera_ci_release()
does not hold inter->fpga_mutex, so the drain cannot deadlock against the
handler.

The sibling NetUP CI driver cimax2.c has an identically-named
netup_read_ci_status() work and had the same use-after-free fixed in commit
4e143d662ca9 ("media: cx23885: cancel NetUP CI work before teardown");
altera-ci.c has the same pattern but was not covered by that change.

Found by static analysis and code review; not runtime-reproduced (needs a
NetUP CI card on cx23885 hardware and an interrupt racing device removal).

Fixes: 349bcf02e361 ("[media] Altera FPGA based CI driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/cx23885/altera-ci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 20a3b6c..94930e2 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -496,6 +496,7 @@ void altera_ci_release(void *dev, int ci_nr)
 
 			ci_dbg_print("%s: Actually removing\n", __func__);
 
+			cancel_work_sync(&temp_int->internal->work);
 			remove_inode(temp_int->internal);
 			kfree(state->internal);
 		}
-- 
2.43.0

