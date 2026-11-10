Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794272626;
	b=1JknH3r9dMuHnNnMUp2K1O6K8SwUvAiLBXm0ifusuVeAGTeu2tozA9H4Q/RjpwZNEglq
	 jZ9fmHLXY2AOO4GEntUnz5voj5c9iGGhdpesALIXOHSC+O53A1I49lMH53n4yhq27i1Nj
	 FEptCwlM35zdJesU+UQ2gZqoVLFhpIES2TqjUYwjTwzQzDTnpbf5VEAF5TCnX65IZdntS
	 9HFrtk1H6PDIRw3KYcd1CaQVLhH4AT7E0aYN1uIntKdDCE/BAKIkgc3s7gFrvgbuOjvNc
	 aFdN3FFifwpMSxaB56RESa2+crZZ8tg0zwnZlRmDg6o7CRx89dY3RGHuwQi9EQCu84Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
	b=ecv6SjWFBEHkRk3h7Qq9Ygr/EQElBmK6HuxpNbuku9vQQtkXXsrIM+jfn5ZTSmHLokd6
	 nQcrrGlox1F37X5igJvayhYMV7T3URqUKGMtvpVv+S35oT9k4a32awyX6jbo7+y092y1r
	 8ldAASIibwB8XO8Ymk/anWuo9iBzyeIP18KZ4JhLqoBTYVmOG8T4L7kXvLYL3+3gaaF3n
	 WlZqNwAle1JayldwAJOU1vdGUe87oIzqMGYpQVrhk8TtnMEW1DrVUQuF3iZOOAwMZQJoD
	 WwS3j3ekzz2AA/RAsPtt6vceKj8eyv1SJyEAa+nR2ZgO/scjCQnCUWKr2ekEdrJ7Dkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFhBDZen;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFhBDZen
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4697404c2bso203305066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272624; cv=none;
        d=google.com; s=arc-20260327;
        b=NoxA88e/FC9ZZvBfcUxjkz5LToUTLGogXXykYtJ3S2zBQhRtTwaYXACTbfmy9rw1JC
         TFmTK2wUzY/EhpRoHC3BQQtzdaThAkDxq8ILpYRhv8wL82Ka6ogJq0io7hEb4079wDwg
         KOQR0jYoBzz66JKFi3d3wQwlkXv/Vg4FHpbJY4NpuXRudqe1F/zsdzMOn+uZjQQLsbFP
         trUg1phPWeaJIJi17JNesW/krVM7bxxq6Uif6W0BDuIR0sNN6a//TiYESuCtk2iWgW4l
         EtBRkgXDVSK24ol2fof9HEgsqIqGWvEK0c2695xJTpn5ojFg99SiZZxTNhgs9ykaZ83P
         xn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        fh=imMacTnEJLnFbg2QeWuaT4coaAUwEZfli2s2/+5kNuU=;
        b=SnrDmPdLBQ3vlkWM7rMt5lNK47kbUJeDicp678pBhdfpXWUik06Pi4dS/2dg70OBUV
         I49ybkFWB65fNnrra+AvKxHmJQb0k/g8h+UAfRaBUafSHlUFs4Tg77/9v6+vShI//L1x
         d6BjA5IgAw1eYqSXqA7JdgFPNgU0rF9CpDB0eMs10F2FAyNnLOkxNJen2sKWRxQNvLtP
         Xr6HJr1C0n340ut0K6eIeVSrijQlVwOQep2Zr3djR9JKYh7E7pdi/Oe2E5sJ4ljhWjw2
         iE17Ap3zYhdrZ6a/bFQQavyM6z2aA4x2+THeiw5h8VJS3V1gUt1qcVMjCLWBEb6tQnhI
         EQ5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272624; x=1794877424; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=TFhBDZenFN45JlhIEeSGBEeQfWUOkKjAKUvTUvvY6zeYFJQ20XCoSxzTXgWCefeyV4
         bO33UG7WYxjqgtSXChX3H/6yyoNU/kUlWPRsetsllVbVbhYuy7IenwrRes5+SOvkyVGt
         66KWKf/w6vx8Hsf7xPEbZ3nWXCbiO++juGnIlCPnoYTa69GyItCinuGANT+pkfyE1EQV
         PGdtj1/68sK5Qwz6EjMGqWWIpAItMN2xwWzXunJty2v9HRr9hvlAANNt5ottDFVt9/EG
         t0MxT8SCeJE82/hQAx5iMOSZ9bsN1p48iHsCSxnvdOMtcE1zTqVQiA9u8KhleNp9onBa
         LEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272624; x=1794877424;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+WfmWLpflRA+bUwC4gEr75YY4Ckyb5jqXk5SR8iLBA=;
        b=h8BzUG+iz3rxnY6QvIstGOEQQXb5Hc8rc1/7FG9VTFjAp4yEcdgfrVuZfWJgc/nw8V
         lsgCONnQQvPeKIuv0tAvmebC78UzVb9s9lUgftiQptw98goe2Vq2dhwRG0uKNyCz0Mg2
         vKifCA7z5cqzxoR6et2rdy2cRpZGdaDbeg2v/ZLI+HlbmU9K42ain59/Ke51A0mbLDUt
         n7HJr1G8MoRbvBhDSfLBRAerrSRcyS6Uk4s1l90U72dCnxbEKp2+WA4Nmt4/VCMka93O
         lr0M4Bnvfd05eU9IMEzzV9JrmDYKxFX9uT9GsuEdsgNw4tKHZI+gCZ1OD5BKfahrUhTd
         ciOw==
X-Forwarded-Encrypted: i=1; AL+hErHBP2W5/DuDuzDB9A4u0Fq8g/nXeRg+mQ+wMieV3AQ60TucpRgVl4UzBlrOJf+rJs684YyxaW9on0PRbGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aneI2zTJJAJt74oXPWyhgQ7As3NhQJehtmqR7la+tQ+U6Ze9b
	XAqixaF3rFbifddBZYJzmyEsjLSZw/LOAaagRx8JMHGFxR/wZWyJud3Z3O7WD9CTlIj3EIoUaxQ
	f6hdgrhrTEMFjc8aQiZB+gu1V1P7oiw==
X-Gm-Gg: AYBFou2W2yg+g4+8HEMdmv5Id8nxpw8fZ3kKkyp7Q+PJk5MCtojd9FKF9d9HmcaWHmI
	cwSPK3CNUoXwNow/WaFpr87JrmNjJy+6ChZrzmT+jkY17cIL8OR3G+Shcw0EXy/Nv5g2ljZINgA
	mT0VntNjjcSznmvH1Wzq1fCDryupfyViuii1lK/6b/1iq/iaEDpRM82K2VDqiat82OvqfvWIiu7
	JyXGVorMvVP8Yq/T4Vhx1Fbu8iNKPgYL5XvOK6BK8y/qHCzau4Qe8JOi3CfUYvI0+LJgXs0OT8h
	DJiVluJCx9I/te0ec3ZwowoLZ3USL56gD/DGKZsRRYd2P1gjb3PAUwZzVlZSYDg5Q86C8zKPfaE
	NRjL6OG9JMpkWNaLmQLkwZyTZhj0a+o73/V3FndFEQL6Kk0k8RflfoVxKdsDhc+2lSQ/urOcZ1j
	z1i8bcU8ObGQrprDQ1HEQ+EqoGh2PjYoasgsCFHOoKYBkT
X-Received: by 2002:a17:906:2f88:b0:c4d:4d5b:4bd6 with SMTP id
 a640c23a62f3a-c5049588c43mr49781366b.41.1794272623674; Mon, 09 Nov 2026
 17:03:43 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:03:42 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Mon, 9 Nov 2026 19:03:42 -0600
X-Gm-Features: AclHuK-OJaw2qupbzmzX6Mid4lqVpd56r616Z45mPkUj2w_nmX7EGPR89o8V2q8
Message-ID: <CAGEsz8Gj01qFUzbEqymn8oPM6puJkaJoD6QLGabFnG9kzMYF=g@mail.gmail.com>
Subject: [PATCH v2 1/2] dmaengine: stm32-dma3: unregister the OF DMA provider
 on removal
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Probe registers an OF DMA controller, but remove does not unregister it.
The OF DMA helpers retain the driver's data pointer after managed cleanup
frees it, leaving a stale provider entry for subsequent channel requests.

Unregister the OF DMA controller before tearing down the device resources.
There are no fallible operations after its registration in probe, so no
matching probe error path is needed.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1921,6 +1921,7 @@

 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
 }



On Tue, 10 Nov 2026 00:42:55 +0000, mhun512@gmail.com wrote:
> Split OF provider teardown from the managed clock cleanup requested in the
> review of the original patch. Patch 1 unregisters the provider on removal;
> patch 2 returns the active clock reference after managed DMA/IRQ teardown.
>
> Keep the existing remove-time runtime PM disable barrier. Check initial PM
> activation failure, and let devres handle later probe failures. Remove the
> manual IRQ-free loop from the original submission.
>
> No hardware runtime testing.
