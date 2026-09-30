Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E444E3EEF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773150; cv=none; b=hR/2Jx2HvLwaaxx8Qj288Sowu3d9OkOIa5BHuzwxQxdvvOdR5EfqdvLnmnoqdMu4VfO+Tzv083EY3Za3rFlVhxw3TSmdpc5l9ubENyIhYdjHfbqiOvqil4FIs+LuYApHXTkE59jy3M+6+OgmUyXmID6Pdgcg3bSXyWhVaPJFKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773150; c=relaxed/simple;
	bh=ZOZcnBA24NO/pa1vXrsjd8y9HWBPKelZsbY931OX+ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIoKglZ6cEbKDf708k/fC6HXO5YK7HSfRgqDf8Ax6DEIweH7SWWzlpf3QEK8UW1V1U94uYIJZakdSGPKmJjywkJ/1bEAYM9sNG5oOK7rLqSiYJul9Pa4qNes1aCeh3aJCg2Ad02iO3xbbNbNeEHv1ZZthNKb1z13haIZzTbEjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfazufTM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfazufTM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so23659625ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773143; x=1791377943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4F4f3/aIvZt5ojYeBT1ImcwfjE5cVxgdJesU8F13F8=;
        b=nfazufTMB/TLsGxbX9221aXt/VLrQxHmzjlo2IlQrnraKUN8wyNfRggB+q+ni2eKFg
         L/KLcuBg2kqKp2pRQAk9c7SFP4UhuCe2PoV/HNovQ3eWpw7vLzNtwA0KBYMMFZDm9zKg
         64d7xXE+OtM30X5+2qnKZ6NQo0+choAqYA6E4NL7Upa2Zw78Kg/qLOwpuG1G6beiWq2g
         dLbyVJU99DJzYuGiJ8PQnCjmGYQtadzAmmg5PQmRdpFFD6ve880d4tBtTWuaPY8C3I1K
         j174IKdfvd0avAB4T9mKgF/f6+GL0cA/UQoh3F81sTzmgi7999o5Rq4d3KJZtgVquu8Y
         hM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773143; x=1791377943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4F4f3/aIvZt5ojYeBT1ImcwfjE5cVxgdJesU8F13F8=;
        b=W3dqfITo1wdfTdxgHV+L4pXsV36pu5g3QWDC0xBc1UAa50v7nXsnFrB/tk+QfJNRoN
         GL0P3ExQhEOnH9m5qWBjkleuWW2dk96nSDgKf8XA6X+IHulFCrs7G5bfai9N/eHdi4tB
         6Obm3Gn7PWdKBF59nNtxFLE6pMDAmwgftB0q0Fggtybi2CCZYzunLJy0XXXZwMFLpkES
         LoQggi8NZKdZjzs2YCTuZs1w1d/1VUKPy1oMRoNObDoU5I4FyV05kLFaQt3h204N/hq2
         jf982nKkR5Dp2XreVkY17+i6mA99wk2K2enS6QpyzIcHD7kfNFe8Hi0R6AgN6sYFN+Cr
         jpYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy02TpoCuiy4gdEPGnALWjjhr1lsNPRo0PysUnzukcPc5k2NUxkybFVjdcrQ2ijZLg2lgbhu3rr7Jl/RU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg2uO5R3+Zi0bQdpHYOE9lliKHNdkUIA5rMjly/WeVkZc2w7nB
	aqTTInYwoNWWw1VCUFuuFguW2xjf2ifgDi8hlqMoVHXuBOA6GfCN0bNP
X-Gm-Gg: AYBFou1ENCPqax4QaXeTecMs0FWvkxcjNHJbXAVoWs1O2xRUMr0JXe4Uwzh9FD1dTsc
	XZ7T8ExcVXNwpqmEvuAeCekZOuT9crgTfEzj6pMZMOntCz71n5icbj8t4cbR4TBfyhi+Y7Tzwbv
	ww8fmRDa1XI1T4yoRC123lRn4xemOJTBoqBZ9JOqxkcS5jllakL9QV2IbCl5CHl5ck7sS4D7Cxn
	N8TN/LEH/YVhRzgkmU5b+V0XrJIfna8jZ9b5Wleyk0nft/3bYzGRXdHnuFlsFap0Fd2gJW6wAOD
	ThJLgJzMksZFgvagCaI3MUZ23h4M+6a8u9nNfjxgFH/aC0YZRs6omm/wK0zajs+aeBmgWz/1FhW
	w7AS8iXdSX9nlXTWC8xVvvUVojWOR0O5WtdUIyF6LL7P+BVgrgzOHtbNy/yuCbO4ZlLQ3C6KrCv
	QPZlvpTd0OcHagx1QOzlhFWTCiss/xqcDcellBcKgPDFHwAiVITgMP+PX8pRVA9lKPmIRUJ9NBw
	shvWGWZn4ms+XusCz5JerFQ+6gHxA+8lYg2JvieLbByx4qDE8xWyskadHJYaF1WSY8Ekd5+VgpH
	LOE8Nrekhg==
X-Received: by 2002:a17:902:f644:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2e2e48b30famr11257585ad.6.1790773143429;
        Wed, 30 Sep 2026 05:59:03 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b3d7sm6751925ad.70.2026.09.30.05.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:59:03 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v7 0/2] serial: core: fix baud rate fallback loop and baud_base overflow
Date: Wed, 30 Sep 2026 12:58:59 +0000
Message-ID: <20260930125901.778868-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two issues in serial core:
1. Division-by-zero WARN/Oops during baud rate fallback in uart_get_baud_rate().
2. 32-bit unsigned overflow in uart_set_info() when multiplying new_info->baud_base by 16.

Note on v6 1/3:
Patch 1/3 from v6 ("serial: 8250: fix deadlock in serial8250_register_ports")
has been dropped. The hash_mutex race condition was originally found and
reproduced on Linux 6.18.14 (where guard(mutex)(&hash_mutex) was dropped
inside serial_get_or_create_irq_info() before serial_link_irq_chain() linked
the port). We did not realize that it was already fixed in mainline by
commit b339809edda1 ("serial: 8250: use guard()s"), which refactored to
serial_get_or_create_irq_info_locked() with guard(mutex)(&hash_mutex) moved
into serial_link_irq_chain(). Apologies for the noise in v6 1/3.

All remaining patches are ported to the latest tip of mainline (551c722f4080)
and dynamically verified in QEMU KVM with CONFIG_KASAN=y.

Changes in v7:
- Dropped patch 1/3 (already resolved in mainline).
- Clarified in cover letter that 1/3 was found and reproduced on 6.18.14 and
  we did not realize it was already fixed in mainline.
- Retained patch 1/2 and patch 2/2 using check_mul_overflow() as requested
  by Jiri Slaby.

Hui Peng (2):
  serial: core: fix baud rate fallback in uart_get_baud_rate()
  serial: core: reject baud_base values that overflow port->uartclk in
    uart_set_info()

 drivers/tty/serial/serial_core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
-- 
2.47.3
