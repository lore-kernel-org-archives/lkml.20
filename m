Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85C4EF15D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412302; cv=none; b=GI4LphITDxkz/PKOqMjkCJcUJuhhiA/C3KoX4JbXdVY8B92T1bAkJHvmxdcosM8m6V/fytYEhWvqNjt544zqN6tX84sLyxCRZvNc5rEKBB0WAqJhU1tgC4A6BhnOn6hQqCgqi0Bh1F27IneRWWaNMq4mDJDE4iwEyCzVCC/3EUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412302; c=relaxed/simple;
	bh=L4l0C842PaN5K9bGHHtRk3ubTPBdp/5B3l3N8zPypBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kas/46mnX7dCp3XBBdGooa7cy6M0ZO1SIRRls9l1oFWnMWii36OKB1vM1wacXMRqYZWX+Ug4CFANTDCtVNC20lVTYwXtVC3sLlUv+0ANd2yx4PXp+C6l/KJgBECXonAZVPDcA9JvZib61pVFHKhOJkN3/gSZKSIl276rAzKZap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIA575iq; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIA575iq"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso3898796eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412300; x=1793017100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRfs1vktLPXWDvTriKQSEHHDI9GDjzxeRyGVjDU57FA=;
        b=QIA575iqKAE6vasObKazTtlIt/HVaxzTk69cAqhkjrKYTM7qm69yeXVXN8FpB+YQzy
         3a6iPxwJ4Ch1i2Z7KBRxukDGI4Yut/e0Qu0tO2jjenecgnLFv3+vJUIOEdNiwdk0yzXM
         byTD/+0PW8NT+SGgKzyHSKSEn1lzuNkDaqREU3TrS9sw7hqlwVEtYHhtbcJ87DapwlVh
         IxEIbLuEqWuCC5PyLRw8d6kCKSjErdaKSPzqS9n4rjFZNhLMQy7aEogZIMrhstZeNs5O
         Kx23tQLwcNqUIzpcVl5QC2QLH7JNjoP69OwcX/sS/swii4IVTBREIU4pGYPNCYBSkIDa
         rqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412300; x=1793017100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRfs1vktLPXWDvTriKQSEHHDI9GDjzxeRyGVjDU57FA=;
        b=PG6SXEeFbZHHmW7KvGurBGYQW3ybsp4DngCZE2SWnJlHCFaHP5TXJAT0eIVDNDCalA
         ZExpV+RHQezgMgilwIloaX5LSk+Zr+140lH0ramG+USO1cXFdeCPDKaem/3ADCLVvBb6
         aU/sMyNEHJApb0gJeRX/2cvfJKroRe0rymfVD8RlV92yfcLR+l97bcMIgoi6wlOchtKr
         Dm5SHoZO20ffDJW3exnGfEm/hRIs11s+iyPpCRsiImQXOrvuA+emGjneozZW12cmAQFL
         PLaXPPd2xie+NLqaJhSTIMGwqXr1R19L9vVTRz9ly7k4SZhljLJ/0Q36JBxOLxnGv176
         yjow==
X-Forwarded-Encrypted: i=1; AKwUvBxsnPLYsu/YVsaXtzYg2RZFBrwCUqScH9sy5zDxeaCpxh0nDEDUmDcpIXvxPN4DvywnpODI6aG9ekxZlFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0kyNcImYTWZ8VAuyU+2p44X6jsfFHR1av6vbNg9OblKA4qjyh
	Wb0ky+LBbipXQg3M9Z1o7LMu/2eh9h6dj9gg8LUJsRfNbBRS9F673ByF
X-Gm-Gg: AYBFou2yyXvSd7EqiWCobgJWqkF0tQL9FQPG6iz2btji/NVwDTfRbgC9RGf1f5aV9jB
	dPgzy3C57xhOrubKS364+znZgTGGDO9m54u+Oi8SHORoP5YvcS87P1JLsKysYk04gYPsHiFU3Zr
	9KUs2ICujyW9nd+JU8t1l9oF0H5E2Zf0zxES/NvmzcL/5AXWal73xbBOFOx4W/qTZPEsbxeYab6
	HFXiN9FfvY5oSKXua+bcxaK+o9upCENMbVdRWTiB9HARVX2W3LO99rtM39G50fn3LLD+Y1JnOve
	ufpc5t+6uXwNpQ4sUIpU44EEmUboRwDSi5Id6g1+Jeb4deoMKDIwPW7cChcX8ABoGWyqjYMIra/
	8cDgBd7LDtNNzI1SJqwOIgE2MN9hJN9Pw8+NehLHCd/vfp3JhEmIFYsQF+wv4bJm3cjrLLuwDKB
	NojFzPMKm+WqjQYdEiuq/2vrRAMr4/+tpIOLBkdIIlmMgqu+bvNIxac0XZwloWBuXqIamJeA==
X-Received: by 2002:a05:7300:10d:b0:361:306f:c32a with SMTP id 5a478bee46e88-361a0e869c7mr11786048eec.11.1792412300220;
        Mon, 19 Oct 2026 05:18:20 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm30175587eec.22.2026.10.19.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:18:19 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH] block: annotate lockless task ioprio accesses
Date: Mon, 19 Oct 2026 19:18:15 +0700
Message-ID: <20261019121816.9202-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018071636.79198-1-ngocthang2710.1999@gmail.com>
References: <20261018071636.79198-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Damien,

Thanks for looking. I don't think RCU is needed here, because the reader
can only be the owner of the io_context:

 - The only path that drops the task's reference is exit_io_context(),
   which the task runs on itself in do_exit() (and on the copy_process()
   error path, where the task never ran). It clears task->io_context
   under task_lock() and only then puts the ioc.
 - So when __get_task_ioprio() runs lockless, p == current, and current
   cannot be inside exit_io_context() at the same time. Once the pointer
   is non-NULL it stays valid for as long as current is executing; the
   ioc cannot be freed under it.
 - For p != current the function already requires p->alloc_lock
   (lockdep_assert_held()), and that is what serializes against
   exit_io_context().

The only thing another task can change under the lockless reader is the
NULL -> ioc transition and ->ioprio, both done by set_task_ioprio() under
task_lock(), and that is exactly what the KCSAN report shows
("value changed: 0x0 -> 0xffff..."). The patch only needs to make that
publication and the ->ioprio accesses well defined, not to extend the
lifetime of the ioc.

I can add a sentence to the commit message and a short comment in
__get_task_ioprio() stating this lifetime rule in a v2 if you think it
helps.

Thanks,
Nguyen Ngoc Thang
