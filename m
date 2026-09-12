Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148E3C5826
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244867; cv=pass; b=nBjQTe5ouq6DZsV6XShXXUqp4XGJUbWydk/HAJmIoYFL3jWQZMgFZxd+ciKZQn74/G34HEcoU++O8E7RhEH3xdcNP8L1BQ63HAoBuhUGWfMj1aYWYHwvchEVelVrc2Nq17ERMQLWiHgB1monZRck21bVNVEgE4td++czqu3lZiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244867; c=relaxed/simple;
	bh=mdQ2/RSBa5kkx4EoM2gRmAu0I4MaI/d5EfpBHtMqvYk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=I+HIrcYKaptJrM64ktXOS6iDm8lX/xk4iZZgli7Osr5j/1UNx/u4G/VJ/c2CZAzkN8ZZRNVTWZYqlWq6EhI9PjVUIemYR8/IU2/d2Ke1pu7Arfc9kJfIi1m+917J7KkuJnoviuhkF+/Ivk45y/dqF7CHdjCSsxXrAOX4Kb2sotc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=mKAjp5vN; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="mKAjp5vN"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso1931913e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789244857; cv=none;
        d=google.com; s=arc-20260327;
        b=SN8ddnZGc00WPzOVwCif6DucEk5EhPta7USoaJoe9uonm8ekay6f7rSLNA5yU/Vhx5
         7mjprsfygcbw0LNlVmEMz3PC1+pB8BbeVRzuUVhepdfzrMcfKndhPUEQU63VfO5wvJNE
         aV7HPN8zeCKSHY5j32C2crOGwZiHUSmXjwFrcZtb3E3I7tvDVV3NP+QQFtaSGtloXO7A
         E26Ljt3r6pvSgsJV6aiLJ6HI9EJOgNstmkrCD0mug9/U/nqnAKLHoyNSc820betdC86+
         BTRz0crO9Eq6D+mDaxRxzHyHeL37f4jHkpDT+X/bIC1WMSBar7D215MPZ98CiHI49DWh
         zBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QusD7oKO91C2KV0ZFIkt5N0wahUFTPr7WHmYLgncsbQ=;
        fh=VZRnQaGHI8aBt74HcuNG/uzypalxNXtI2ikMdOI2fgk=;
        b=G3v1C6zeIVYuXaEaVQdKVG6Q8hnI20FOq0FW6wZrqUdbA1897jNI9Gg3EoDnFxnh5A
         PU+xuZP0JLEBMb26l9a/oC+Zm6LlMgcjnZ/zfxzgxFkhatTJdghmiMopyihCF3ybpdoV
         ndYgmX+H5jrVexP+fiNT641ZHruyAfIjNgu705BYR1NzqKYajl1WXLeyjft4KCJklAz8
         eSg89nLXnFxH83tqZKTxjxVEYcqOUceU7YK4mPqrKZEuUia5R3gQFlFXP5yZ1kXUXhFt
         5D/grswwt35I03D5OqOpinLXczkRc5YQ72tsMSYMeDalf9G5BrubH7xfq8pCpuRhh9lB
         Wzxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789244857; x=1789849657; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QusD7oKO91C2KV0ZFIkt5N0wahUFTPr7WHmYLgncsbQ=;
        b=mKAjp5vNjmKVy4As+yPyVkaSWnVJBbKMP/sUd6ziTxC0wHxHUfBqZe5sTLUT5Wbcye
         4e2GxisTOjbpCbltXEY6yHqAXLHyWDewQiolCJv+OyYXxa7dBbw/1y5q/EK7IQSrxZ8e
         g0IIT/ykx+jjPZroKPh6r5aPK5Dc7tqQWNidU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789244857; x=1789849657;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QusD7oKO91C2KV0ZFIkt5N0wahUFTPr7WHmYLgncsbQ=;
        b=gbIUTlKfALSYtk/36xY4pZaNBKUnOInYD6iGIWUsH+DrWKPLaghksldIgppiCFtgV6
         hjdlaSFzg/2zVyYvpCphozc0lFbihfu9Q8nXfwXI1w6/XZLDG/dD4Go/Se9Va6ObV8fa
         o+hQA4o0SIsjYLdm9MQETlbzYw0jbZECTnMWyGEx1Dcu54PrM4cV3MfBsIT5VJ+lcqh6
         RZK9lvWQJJ6EVoZ4Qu5o4QWy2JsCeGK1U0reB93kzehVrU4XPemxcyZrTV8+Inl0OKu2
         wInemDhFVVBF37ZLTDS0ucbDf8+IU+W28dCffU7D7z1tLdHf6rYPfInDXnvdMj8PdL3C
         PpoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/iKIEHP4CfMiK2yIGNLsMKGnIEF0c2/PtPQpUWxKgVlu2dlBJ5ha84cBjOcbKMv93/mgopV7TLtGXZ5I=@vger.kernel.org
X-Gm-Message-State: AFuF++nWyYbxKqDhWWEMJPQJFw2KJrTv+Uaqs8vkHp82ACBhI8tCsoGm
	y5Gfu+oULZNZyskS44Um30d/saJ2Wx5Z8s+LQ1oTkhFlF0724gvyd/rF8Vs3veXSfcGG2xOVoV/
	UOjehAwkqW2PAdvs4ClUn3IRtmaFCpetBeD0Df+FdJJcqzgEtSQRu
X-Gm-Gg: AYBFou2UXGvSJSblEgfqVzHv3kRNKLX9gOd9QYw8dxRJ2IHx/fa4LIGVGD5xxg8cOLM
	GRUc527+05auLjdhvHpMbSrjH9eSSalAlBw/Lb8rH5L/a108WTh1PbwNfrHMLb6UPjoJHtSwgg/
	UXKLFTevoGwSQNua+EPKON7kJ1kryJvraKeLI1XyHSfVWaT8FnJjmqadvAJLkYQHZen09ZooI44
	CtRxsGTg5bvwhslxKf3yUu0vRv7TZ+eQ8cEuBoA5FUiYtMPefclCQwECTwiYuRiRJEu/DEKezGD
	Ko2llYwseHt6WsA/t+FJ+xg+kQm0IjANhjXyiqeHBaVyDaLqA+M=
X-Received: by 2002:a05:6512:3b13:b0:5b6:1a7c:fd84 with SMTP id
 2adb3069b0e04-5b8a033055amr2293019e87.42.1789244856795; Sat, 12 Sep 2026
 13:27:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 13:27:36 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 13:09:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 12 Sep 2026 13:08:47 -0700
From: kimwooseok <5mghybrid@khu.ac.kr>
Date: Sat, 12 Sep 2026 13:27:36 -0700
X-Gm-Features: AcwNN1U1b0vod9cTp2CAPwS7-ksB7fvx9duh70j0iRAn55UF18yCCn1pT85r_9E
Message-ID: <CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com>
Subject: [PATCH wireless 0/4] wifi: rtl8xxxu: keep RX requests available
 across transient errors
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
