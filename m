Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A3372ECE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789250954; cv=pass; b=ToPPeVK8KT+WClxh9Y/EU4UmBLRmnzz+gDaRqsSHrvkYQYDGGX8/4YlqeJX9JFYh0pPdZuIpt9W2tBy2RX46PzuyrKV243n0S9luJ98+LWICnX01b/6HkKCZqoWwWYrlC4cPahQ6xaa7j+pRAb/rFifGCLIf/YsfE1l56U9ktNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789250954; c=relaxed/simple;
	bh=H2ICmjZpLo/tW61jV/HYoGADra3Y8ym4ib/gFKKdiW8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nJPk0d8CBX/09+YNr3PisQqn/WczxO8XJc1X+t/9ktDTOMe49GHr2QFucdvG3UGHBi55qFMKN0NGdco0iIBcVvZX5zS+t+S3FS2RM6DXiwVEJvb+nAjpBIcplgF+nXOo0c1ThW2nliF1xVUwNcOGBc/jfyqqItfYuQm45GwW7T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=I7f0XMvZ; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="I7f0XMvZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso2487935e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789250950; cv=none;
        d=google.com; s=arc-20260327;
        b=YPffTFKDlWUaLSmU5Q0zAFH8h8LiOnQoAMrFiW7NqY9OmiBolLmTUKKeAG/R9e1xch
         ZC6Ul8dnAYBAg3eP2aRajIT8I/Iyhj8gCcZgNMxEtMXs+WA7k4zSAqlG7BCdFazgs+Ov
         0/EHaKbtQkedithqGcpej8UvmXYJrZ1X1aF8gAgXTGGeeYrJYOGpJqMUGYhjYHKqmFPH
         oM7kH1t68mWZXc+EESD2FYdjkLEzfwooBXr+vmay0ifpQkG8iPEAeku9Bk2boeFurH88
         hvqmMlBUqejKA+kHYb2w0PFPN0705r0/hn9MuKqw3Q5nUpZSC789TxwQ7cQpcp/vZku5
         qRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SaUBas2xojJNtpVmmDXVZGkNTaIpg5Lm10270g6b8fU=;
        fh=QH5j6iZ1luz0zzWJwY7KHBLY124YOXyZpLboqHbF8Mw=;
        b=e1/AG70ZuC0mfCJR8oboLUNxitijfN55XoofDvltSEC9pmWE9Y8b9EdjIspQ343j89
         NWXWsCNJMQ49uPT7w92tE2vO8dAzLKrwsxcQRCMEvhfhFl79w4jc8OI75hYltAjjBumf
         yhFjI5sMFkiHWLXGHzvRDEyyWItxJywXqWnVKHkHNMtUyxAEbX9AyHfJSdVbekX68zM4
         DE9e5HJbpM6FeUCRoQh5IlMGZGZgHKXJV6oZgqV9CGnmCWJRupGo0cLkxiyjv06ThP0Y
         cG+ZDR3RjE6C7zaRTRuKXEJzxU5ZhX9VY9PWHTOd09CH2aDbCTKTfCncPgkWgcTDhMfX
         xGOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789250950; x=1789855750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaUBas2xojJNtpVmmDXVZGkNTaIpg5Lm10270g6b8fU=;
        b=I7f0XMvZGa+qEjxCn3GebBbQkARe4SQIXmdtl4eoT5TDnpy537s2xfAc0UiVryAVvD
         IENjdkxuXxYqJ6vW+uN6y4JhtJUTTFIPR1eQV3B/ajEKLGlsaRmGX66TqYJDod9pur46
         l/ZeTIUBPgcgocIlaZupi4yAObj+6x1m8R3j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789250950; x=1789855750;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SaUBas2xojJNtpVmmDXVZGkNTaIpg5Lm10270g6b8fU=;
        b=DjQ1wb5bgVk4Qluy20+MbUCCFDtTwa0utS7TXyu97NV6mrfqIyItMTNqOr90/ju9Ml
         iOkz+D7S71hd+8slPrSAFJ8gkfSsn2N8hBqiSvhFT+3GTNJC6AvSH30kIpUWZnNNgzZZ
         w6f09/VAgtC9zULPdrVrtCfc4HaRkHMfgbyXzhLJqDCrV11YeE0EvkhewC/BXRhwe4NW
         FcJkbfeWlHZ43tdrBw2yPO3OSARPYE+W884W1B5FHk4el+k1yPHRbANTpW6ZRrEMGqdj
         kCcc8rG7lW8xXtCO//gUB3SvVlry3ve+UI50Xzss2P45+vIS8EtyOALJUiv/Zo8RfX2t
         Z7GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNwR9mE0SptQoXTmJNpJ9aAKMV92nsIit/6t7DdqmYn+JOiu0bcgGKs1jeOXs4NKILX3fqQAJemyfff8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mk9JumPpBSfCeYDS7r7j7dOJn5E7sIoEWr8bKh1kWWTxtT+ybk
	9OTTx0ViJFJsIoonHf+HTwXvK/bFHioYVmxKoc110o9sqj+jG8BLT2baZh2+V1iKP61aLD6yJSx
	RCPlrae1NwgTX7NFXTW/1lWquNfAI0JnF+lkbQihmdA==
X-Gm-Gg: AYBFou3yCzvNAn0hfwefuQZ2rePDcLJCD+sGjc+NlK3Jui82MUVjC5oA1ouhNMS8Sxt
	xDeWo+Wn7IgqDG0hn3yXvGvEj7kP/cpERX+qIrzjujXWrNv+7IQW+hk9wTspHa5a6220rbj1gZf
	DGPy1HMQwiWi7QI5ZYfzUrMwN1vHsn/GSpyaXJIz7EpXPciEd9bLnhadNvsOc619gUyiMQHRXif
	xOSevRr0mxstPyoL+BLZ/wqzOgeEhomvr0Mv0ootfX5Gtjbpx/cI67s8c18NRWRZwF1YGeEnC2l
	F4aHVHOK8a7AZShn8phw/ffZ9hlAxbpbsA0Agjcc49T9QG5zGm4=
X-Received: by 2002:a05:6512:b87:b0:5b5:e8af:a5f2 with SMTP id
 2adb3069b0e04-5b8a02cccf0mr2106901e87.20.1789250949819; Sat, 12 Sep 2026
 15:09:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 15:09:09 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 17:08:17 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 17:39:07 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: kimwooseok <5mghybrid@khu.ac.kr>
Date: Sat, 12 Sep 2026 15:09:09 -0700
X-Gm-Features: AcwNN1WJjBQEbc375fUfyTjRKYGITxb5OsGfVxMtKIzLK8nMKDyxANUQAsZFX4I
Message-ID: <CAH1Bc_yJ1e_nHk9tP2qP_4D8MHEve1R2EF5cYCEXRwc+1xVAxw@mail.gmail.com>
Subject: [PATCH RESEND wireless 0/4] wifi: rtl8xxxu: keep RX requests
 available across transient errors
To: linux-wireless@vger.kernel.org
Cc: Jes.Sorensen@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This resends the same patches after line wrapping damaged the previous
posting and prevented it from being applied. There are no code changes.

Previous posting:
https://lore.kernel.org/linux-wireless/CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com/

rtl8xxxu maintains a pool of 32 RX URBs. Successful completions return
their URBs to a pending list and schedule the RX worker when more than
eight URBs are waiting. The worker allocates fresh receive buffers and
resubmits the queued URBs in a batch.

Completion errors free the affected URBs, reducing the pool. Once eight
or fewer survive, their completions can leave all remaining requests on
the pending list without reaching the worker scheduling threshold. If no
request is in flight and no worker is pending or running, nothing triggers
further submissions, so RX remains stalled after the errors stop.

Temporary submission failures can leave requests in the same state, while
retaining an skb that the next submission attempt overwrites.

This series fixes buffer ownership on failed submission, unwinds
incomplete startup, and preserves requests through one delayed retry path.
The retry worker schedules submission even for a single request. A
separate error list provides a 100 ms batch delay from the first error
while preserving normal successful RX batching. Shutdown drains retry
work, submission work and active requests in that order.

Completion retries cover EPROTO, EILSEQ, ETIME, EOVERFLOW, ECOMM and ENOSR;
ENOMEM/EAGAIN from startup or worker submission uses the same retry path.
Cancellation and removal keep their release behavior. EPIPE endpoint-halt
recovery is outside this series.

With 24 injected EPROTO completions, the original driver stopped at eight
pending requests and zero in flight for about 30 seconds. Under the same
error budget, the patched driver retained all 32 requests and resumed RX
without restarting the interface.

Validation:
- ARM64 QEMU KUnit: 11/11 cases passed, covering the actual RX helpers,
  worker, buffer ownership, startup failures and shutdown.
- RTL8192EU on Raspberry Pi, kernel 6.18.46-thesis-test-rt+: 13/13 cases
  passed using a compatibility backport. The lab fixture substitutes
  completion statuses and injects submission and allocation failures.
  Each of the six completion statuses recovered after 32 completion
  errors followed by 96 submission failures. Error-window, pending-retry
  stop, startup failure and clean RX/down-up cases also passed.
- W=1 ARM64 allmodconfig and allyesconfig builds passed with incremental
  caches; the changed driver and KUnit objects rebuilt in both.
  Sparse added no diagnostics relative to baseline.
- Each intermediate production commit compiled, and sequential patch
  application reproduced the corresponding source trees.

kimwooseok (4):
  wifi: rtl8xxxu: free RX skb when URB submission fails
  wifi: rtl8xxxu: unwind incomplete receive startup
  wifi: rtl8xxxu: preserve RX requests across recoverable transfer
    errors
  wifi: rtl8xxxu: test RX ownership and recovery across failures

 .../wireless/realtek/rtl8xxxu/.kunitconfig    |  16 +
 drivers/net/wireless/realtek/rtl8xxxu/Kconfig |  11 +
 .../net/wireless/realtek/rtl8xxxu/Makefile    |   3 +
 drivers/net/wireless/realtek/rtl8xxxu/core.c  | 236 +++++++--
 .../net/wireless/realtek/rtl8xxxu/rtl8xxxu.h  |   3 +
 .../net/wireless/realtek/rtl8xxxu/rx-test.c   | 461 ++++++++++++++++++
 .../net/wireless/realtek/rtl8xxxu/rx-test.h   |  27 +
 7 files changed, 707 insertions(+), 50 deletions(-)
 create mode 100644 drivers/net/wireless/realtek/rtl8xxxu/.kunitconfig
 create mode 100644 drivers/net/wireless/realtek/rtl8xxxu/rx-test.c
 create mode 100644 drivers/net/wireless/realtek/rtl8xxxu/rx-test.h


base-commit: f71dd599a98182d6bc34dce39977f928068ecd64
-- 
2.48.1
