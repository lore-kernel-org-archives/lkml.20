Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367616;
	b=zvphT/84vXTlTRi/7n1Ziro9h7CbZlisz8t/K/MmW5zUxrIloyw12Srco0+5sU7mhbZ8
	 by/Kc52xBCCfnLxCYnAfEr3jh8/QRMXbNF1BBY7Y1u++ReDNC9sApMIYRxwWqb3jyyYk6
	 fzyiLSicCYIT0MAA5fC8/ayPANYODBw1IlOqL6oJL/K6+hQukbtFzjq8/kzkcnUgqyG38
	 19PBtHIy0FibuKIgaALjFttz0jzOC5Oe4SxmfNrVVzHJP+GWF6ybkGyo8FnyijJiyulX8
	 K815o18UgyAcmYND2g/PZ1O3CnBorwubOtoPS/rGTNQSAhOAPPJqqHhk/cDwlRDIMgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6P2Cg7Q5nhb2mHUAtpDsvhVTITuBoNrw60dH9NrDDVE=;
	b=nZhhGSObES2/vr60DZKpmTxR9wfJsz0zW8c770N6hNaVJZUafWoz9UDc8Ndiv4Y+abVr
	 JZoKsOEte9Mq+ieLkAml4hxeyNkteC3Ms/hwd5j175aK36VZi4KGkK9/8UiJx24z7J9e4
	 phKpN5sgz1QK2Y0R77wtNOs+mezywyWZft2wnu0WTpEuODBZuHudtNStcIdK8PhQgYR6I
	 z8s2DvRcxZAvSjFTUfjbcbXsZ+Ykhi+xlv3Ji5nhUAruA8olKDHfp0gdZ2fFjWGPr1CmL
	 GM/Qfi8hQIxlr/e2VL40IwUFnAF/kSZA76uqHZHAVClMlyMpmZFGegg8KaSRFc6e8mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=IT0sPHNq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DB9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=IT0sPHNq
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6798af41644so465488d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367615; cv=none;
        d=google.com; s=arc-20260327;
        b=p2d6AdOdDWnN44fM6g3u59EHAqrwGAyIReHybqZVtD2k1c/3sVTqnx7ha7dYyvjcZn
         WKnwlF/ji/ziKbfSvhGYY499XmQptuVz4YjzUsz9Dmdp8ps7//T6G8IeXKDew2v5MJCT
         GA+vqNjWZKlzOJqKF6NzpCEahWreo7Lh8wI1iUkGNousnk6iBzEme+fvns/YcLa8dKnf
         0BncA0bkTp4s/j6AHD5kf3fOJV4NegsnrZ3qLV2f0JCrbezBWZO1DlByPF/FaCb344y8
         r5bKjNiAxkllvDAv+AXnEUF2LWiq+zScdoEBJRQqy6dbi65cs6qp2lfJWAXHqz1GeddB
         WJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6P2Cg7Q5nhb2mHUAtpDsvhVTITuBoNrw60dH9NrDDVE=;
        fh=ocdCZatNFBEofU734d4F9DbyJTyf+CYWUmLWgy+hBnI=;
        b=iAcGw3PIFRzCBO9c9XiF4b0bPuBPKZX7WYaZFXbY/ENWhM+tP7FH0m4AoJRJvnZIZl
         L+2TNK//iW1HiOCbbGAHQzRyThvmxpULfApHSJwKxPgyHK4LKC/cEqVp6XliQ+QMd8wL
         o8M0wCCOi43w4HD9m9H3mZ/Gqg75yR/mHwrx+XMEdHAsonBqoWTDjKiW5glRMIrHWMhD
         yyRbQXPkwNoVFf1hMIWqBkdZ12iDkV4p0tdHnrl3NkcQau44Gspw9TrU7u5YO6aeqdf7
         dNqN7xTbvV8DXovc2c1sN3P3eOyIEIoVpbO2rt7gBw98IBMNCzD0SVRIBbPeHtx1v6aM
         bqEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793367615; x=1793972415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6P2Cg7Q5nhb2mHUAtpDsvhVTITuBoNrw60dH9NrDDVE=;
        b=IT0sPHNq7fRL0aNWhR4ZxMbhlVMvdlJJO6ojtXrLIAFX4EhX0+g18RN47Bi7NKi5hD
         pLMxSIfEBygAWLacWenGfLX5i9hBXA7koHRnjJxb4igfLGqODhepu8UYvSRQYZA6vqaj
         kIED4xIt7dPXdU9iGzfaGRHaQjriH1lKEW1dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367615; x=1793972415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6P2Cg7Q5nhb2mHUAtpDsvhVTITuBoNrw60dH9NrDDVE=;
        b=iL9ce6soJOEiScz1Adno/eTZUBCDT1/BtZ393u4CLNludlWmj6QCZoINSjCCLo4I5N
         sYfZBRT+vUSQDTOGzN47D6v7ZPM+DqQa3uMqkZbMO/aCtOL02Jas2fnUWCGmT54Ce0t8
         iSvVtJlYgKBTGbv1bpaPtMcgLKfls/ZT1C75ocY2yVjn539NkvQGFMO8BymzNT91gwte
         RnF163bg3D+wI7qWcyHw55U+Kp234G8iIGBwLF4J7OsRz7KBjyAVd+Q3F/t1GkO/Bosm
         u98BePrwIC7NvyQV5Ogsz4/wjmXq/esDG4+2s2PXFKTXPgLw+5scgr/SX/vNXIOOgGpO
         5dmw==
X-Forwarded-Encrypted: i=1; AKwUvBwOba7TEgCBUh4fztO86GThe3BbYgjdHx/AwFP2AT/lpJ0qdAtngugXE/p71fI7oet/UbEjgie5jn8To3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKpykkul6ehfi8N0D24JsaRPQQvcoS3DPFfEheGfZYXjwxLxFx
	d8AKOC0yASYqnkc7oc1HFvIS8RaslpOHEk9kFtX07T5BrvMGsiUKJzTis8/Tztad6jiRb8JOgYT
	wN23Rio2qMF23wxZxm2Hcnok/AqgU/TsxnEb6zzG4KA==
X-Gm-Gg: AYBFou0y9MIeUCFsWYUOfz4jQ3i8qmqrbMwFEUGyA2fRtZbSA83YFzaZnoQg7fx8Vz8
	VmtHuWeKVvt5YjxCE0Gttd3B+zUYOJfQy3XOyhNRxKxfruZL/DwpGj1cOORo/J+dV6bj8zAtWNM
	EZ48ploATwKceJyQ59EoY+UzXlakVHp5jQiK5ODi8nF4cqceWfiMXPOVXOJCGpgXhBCd4fCLPDC
	w81PGD19Bc07vX+BqtnTyDuxyENRl72M4khf7ZfCWgXtmwi+OhaV14lxTYSz52cHKcBZU/oORtO
	6Sy4IMK3zmiKadDCVlX6Zi4MhuyoCs44Ve0eDKvAGnzwL5mm64hXPrQVawdk4gqS/shsBhfCDQw
	SaQXSvkhXEX5uDtNvfEUhLEDaHt4mja4MHKNvAB4W9OROarkvme3YSgMDeXCrNYER0K/1cjY=
X-Received: by 2002:a05:690e:138e:b0:679:b1f8:72da with SMTP id
 956f58d0204a3-67ba4fa145fmr1497948d50.18.1793367614684; Fri, 30 Oct 2026
 06:40:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-13-irogers@google.com>
In-Reply-To: <20261027231513.816148-13-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:39:58 -0700
X-Gm-Features: AclHuK8TIkJu85y66B8E48uqjOcf7KiuNWY3s7VN3LSwj2nbT1cFJPXYBWv-78U
Message-ID: <CA+w=M=SKSJdrehMFouJG7ir5MinOgeWqhunS2jyNWmjtSSW+8g@mail.gmail.com>
Subject: Re: [PATCH v2 12/18] perf rwsem: Add down_read_trylock() and down_write_trylock()
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> symbols->lock, dsos->lock, or machines->lock). Non-blocking trylock
> primitives are needed so shrinking paths can safely skip any locked
> container without deadlocking.
[...]
> + return perf_singlethreaded ? true : pthread_rwlock_trywrlock(&sem->lock) == 0;

Could the single-threaded trylock path detect when the current thread
already holds the lock, rather than unconditionally succeeding? One
option would be to track lock ownership or nesting depth. Otherwise,
the shrink path needs to avoid any container that is currently being
changed. In the full series, the unconditional success can make
shrinking free an array that its caller is about to pass back to
realloc().

perf_singlethreaded remains true in perf report, perf script, and most
commands. perf top, multi-threaded synthesis in perf record, and perf
bench synthesize explicitly switch it. In report and script these
trylocks therefore always succeed, even on a lock the current thread
already holds. The shrink paths can't skip a locked container there.

The case I hit: __symbols__insert_sorted(), reached through
dso__insert_symbol() outside dso__load() (for example from
db_ids_from_al()), holds symbols->lock for writing and calls

perf_session__realloc(session, symbols->symbols, ...)

This path combines 12/18 with the shrink and allocator plumbing in
15-17/18.

If that realloc fails, perf_session__shrink() reaches symbols__shrink()
on the same container. The write trylock succeeds and, with every
symbol at refcount 1, it frees symbols->symbols (or reallocs it
smaller). perf_session__realloc() then retries realloc() with the old
pointer. With an LD_PRELOAD shim that fails one realloc, ASan reports
realloc() on freed memory from perf_session__realloc() <-
__symbols__insert_sorted() <- dso__insert_symbol(). After
perf_set_multithreaded() the trylock fails and the insert returns
-ENOMEM, as intended.

Thanks,
Alireza
