Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666914C9E12
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158535; cv=none; b=V2DJiqOND2AgNtuvAbIjIKnagEQihHRUsLvnV+rmx+XIrMpGu9LaaeZUPsz/vcwxi4vaFibwBKQcsWzBLgcdS8xXxds0VwSaTKWh7pnwFjO5VNfUV44p5qZbExOjo6cxiKHfaAjdkcE6j2JMQ5/dhjJCNbAhxTTLGQRrhQy53TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158535; c=relaxed/simple;
	bh=qap1eOGitYV75+L/QKg9xm+U2tLDgEHHJGYhahzwLNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEja1gSlj2p2ISAX2ORuMtI9up4jEyUo7CwfTw2dVRH1rgD4OuaWvtP3zAV+co619hoVFR7RitpsebVcwU9L1SNBuv7rmQxRepOOU/+NkZgvX+AAvhAQtF3RQkWwtFz/tB952Zo0FS3ocJvE0QdvGohfLsabtIL8aKuV1oScn5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXyzV+9D; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXyzV+9D"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15756f82e8aso712277c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158533; x=1792763333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uF+LfQczF3q7pmbkjozwjBwMdX5SJot+p3Vd/HXF+0=;
        b=OXyzV+9DdmB5v5sTvPfcd58P9I0M1XdYAkofvygaDhgnhbz2y2/dfYKPOKNDkADwCe
         2+zXDEckGwqW7cXcjCMgc4LkKVHrLb/wRDmMYhM81KycdZRtFwJL46rJpinqi0p5ebky
         vgQay7OYzjPxHWpIBDh0V4Zh7Ci1q4HY/qoHfpzNu6NNLw+dwKojcH8jF6LzkVOQHqtV
         9TP1MUNmGWoQZS37k+S7D2JsOVZVuxJd+asQpuGj42lcTtV/xltbiz1Z0T6P3gkNr7JW
         m003/kNphSMkQa9wg30idhUriSfILjukVPYkiHPx3FOoKgk2zPQUaI80DDwxxkwiwQ3H
         /jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158533; x=1792763333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uF+LfQczF3q7pmbkjozwjBwMdX5SJot+p3Vd/HXF+0=;
        b=jhesn97uMw8N16Pa2pEC+qxFDp5Ho3mtPPNCzLrmwmzZC50+5GW4U7dckNoJY6VRrQ
         wmI03aa5onHMqWhihsUC6Nva4UUb6Y0orbFxmJWrznMo7W8l3lci1BFad5cKg5en+VBa
         cBGTlLqfam//8lIof4pFuJfJLDppHEstCbPs8EWon6Ka/pK3r24cCAKdMtBm8A9lpocu
         ZLxBUGybeGZ+b1IkQqv/lXmL6WiQsWtOICuWxxEu3UWXJGDuTqekCHPuEV5hS3useVwL
         30gVcT/+FMnbmGk7YkHLaLr3jFR/KsLFRPaUR1REqc1jpAHMhMFUaeG5eu2R/TgL+qTc
         YHCg==
X-Forwarded-Encrypted: i=1; AKwUvByfWWRVdQYUsQBLA6EFfcyh/tNEv4vsc5P2VVXKysPdlX9zcYhnVUh/bbWohr72tRUFMpddWGrtv1HY1g0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC2lSpBlq13eevZAa7QIYxKeYA++YVBAceapW9W1kpA6lUt27o
	thZCRPmKUyTz+VaHWKnyFO6ObZVKhL1V1eWX37i1VPKGDDYg+XFXgguo
X-Gm-Gg: AYBFou1vFPvK00azs/0IAB26S1pA8UISYDsV/hrkm+HllFnlvb2kvC3zielWKro7dZC
	JW6yHYpbtO8mw3MQKd031hM03KY5/JF+L1wCFbmR+ibrpHtMafgN/qXt1aTpuOKwt3EwWgrql3m
	tsN2/yTZI4vMblPNRJ/wVlQGiUkvU6MLi9lyFKiXoRgHBp6wZ3rULyEhYDv3RATA1puFCfp9/Un
	wZ58BnK1NCV1061zCHv76BO/liFhg1p2CuKIJh8CqeCoY5l6Imj2lFLGschl7IReAo8kJXt0L1H
	ITT//47nx/DMMJAXDRQiMJh/F+yJeT3qfCGVPxk+ZtOoNoE+J/WnqrdzozoBZBlWvxfbe/h5QCa
	yic4in2B1TxFwzUb0AHZMBtigAa9f0BR31w58PbjXdJWu6ymA+/p8/I4zSZaK13NQFlNM6q9Ldx
	5GsO7v1qOoKKVB0UWZ8KWwPx3O/zkZYV/5bHeo7W8lr7Wd5kubMJOPAfkXev9b4uc1aS2tDUt16
	/hY/ic5yZhbHQBoWsSpHlHR6fR10n++8MQBu136AUw6h4XOEFNYVKcvKl/YtqNOFM7HIuBq8/M=
X-Received: by 2002:a05:7022:43a5:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-18511eb69acmr15578c88.19.1792158532965;
        Fri, 16 Oct 2026 06:48:52 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm7956376c88.6.2026.10.16.06.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:48:52 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
To: senozhatsky@chromium.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bgeffon@google.com,
	minchan@kernel.org,
	richardycc@google.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Date: Fri, 16 Oct 2026 21:48:47 +0800
Message-Id: <20261016134847.1620103-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atHftz13hWzGludk@google.com>
References: <atHftz13hWzGludk@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 17:54:25 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> A quick and dirty patch, as usual, just to play around with.  This
> attempts to improve the reader side, because the reader is side
> much more sensitive.  Tested only with zstd.

I applied the cross-CPU borrowing patch on-device and re-ran the same
zstd Android A/B, so it can be compared against the preempt-disable
numbers I posted earlier. Focusing on the read (exclusive decompression)
side, which is what this patch targets:

                        9+10+kmalloc   preempt-disable   cross-CPU borrow
  dexcl_contended       15,919         54                1,447
  dexcl_wait_ns_total   109.6 s        0.68 s            3.66 s
  dexcl_wait_ns_max     145 ms         34.6 ms           26.6 ms
  dexcl_avg_wait        6.88 ms        12.6 ms           2.53 ms
  dexcl_acquire         2.21M          2.75M             2.94M

Borrowing clearly works: dexcl contention drops 15,919 -> 1,447 (-91%),
and the residual 1,447 are the genuinely all-CPUs-busy cases that fall
through to wait_event(). More importantly for us, the worst case and the
average are the best of the three - max 145ms -> 26.6ms (-82%), avg down
to 2.53ms.

One note so the table isn't misread: the preempt-disable column also
disabled preemption on the *write* stream, which is why its
cwrite_contended was 48; this borrow-only build has no write-side change
(cwrite_contended back at ~16k, as before 9+10). That's expected - your
patch deliberately leaves the writer side for later, and the writer
isn't on the swap-in path, so it's lower priority for us too.

Scripts and raw numbers on request.

Thanks,
Bo
