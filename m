Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701044;
	b=n15K8sSIIX5XginKKgkCwSxyYaemzGwSaCou4agiKEm9bClV87K4+r7R4FA1LAe8VNFe
	 ygv9S6wsiPn52CW//wGGWhZO6sF/2v4dvaoCNkR1xQspZrCb7w9HCo9/QIV402D2pcvCj
	 kIZJvuqDq7OA7+H9w/JWuCP2y3v3ThV1ezJIqQQE2HVjbutNvu8EhPiRhjCu0gPC+Z6mt
	 8K/Lx9fOVXCFYgbsp5ivfdzlFMkry5WxoN/NqdYHeegzppaVBln367EtxnZPafKPipfZI
	 326CR43Pbh4co7CHLRD/oRgWXan9M2ib7gH/enylBYeq5K97x/eVTyXmuNsuvf8N5Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=;
	b=BmDFWU4UNsNIRpB0llHcLPm7rtPsZ28SQdFuI0UKlcAYWfEfdoS933fpZkViOOYqluGq
	 HMDRpOLEmZMKMjmVpH+IqsRVJSjtAhZHN8yJWrj9fUVyr3TafR1U3ZQqjhqQu0JoQyNw3
	 bQKdeF1Yrit7Hk5LZ6hRb3k6c3GPQ/AmRD5lobO7rgOOV6g+lFJWcDGRWWFuGvIZywS5b
	 GJIZMccM29rcF7TDrLOHg9rsOJ8RATZ/sVPDrheLVYyFvH7HAx0Eqjjsd9G8dpu/xC1Pi
	 9YR/ok7cHuGpw5Yby8F4mf5ZuyTS3CK5XnnWu7JabIDlbK+ANob3b/h7voeffTVkKcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+1bLzlo;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D260A2623
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7D260A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+1bLzlo
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-98301b325c4so91658241.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701043; x=1793305843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=;
        b=S+1bLzloKb8vH0WReXi5f7Mtc5J/LgeQRBie3oVk7EyiNVja35y0WfqKjlYqzZcuKK
         cIzLtYdtHH3jyhwntYkQB2clkEz/JsnUzJoDNdUiXSikJ6dNJ1PBeIzCGIQAlhQ4V92F
         fhuS7oW9UU/WnamAQfxcuXn8PTw2OtbN7wXCREldpCLo3Ca5DFoptU1WZu4XUBdZhRPI
         V/EsQURumKeLfpzO4tNWqkNzIPBxJJCW30klNHIZ+c4hzdLsGhQhbUvOFdEMS9jxGaA7
         /BFKK9vlDsZycUmn884lASZ9HuOrF6Du902ydEp40ch+zX++WFFS5qh+PaSI9wEsB9lQ
         wSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701043; x=1793305843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwLGHXSVbX2rCSP/BPHeG6+sTlveNYHXen0aF4/nxh0=;
        b=1bSRUo32r/KvwrYIuXSKgchmDRoLej1UjYdmjAZClW9FZ/KSWkm3MDPBYCj1HuwLfX
         FcQPk2EgDSnRrsvzIuQpF4rRWdnoqGchUb1/Y8QoAF3Dc6TDfv56MCrDVrZOr/Q1D4ic
         5fafzDtL0sDdFItjiq93J2/FNlg4tgZhUCHo5xau42ngGs7ErOJchAAjY/MTDcEqtjDL
         zOyh21/5/cOH6wC44jbCPsZcNpQHiwNCOoGMRpmrRISvrRyApP5aWpfyKQm0UbI18smh
         MRLrqAWmVGp7hHiikrZFNoGBVanSRwPBnwBZq4fUQ5fOExJujDc2ev7IGfRKH2mNA/3Y
         ZzCg==
X-Forwarded-Encrypted: i=1; AKwUvBx++kvPBrQoSjniqiv1HehPPH6QQp4AzF0b4UitKuGEswuS7zvQCNTdzv8HrA8yIi9xlOdqBVQ1s6UEHkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo5yk1UohJKISfL0YNMqsBgAa1dJF93EbI2VSDioRrgRaU/9eH
	ds9Sg7WcN/KwrDixZxlOvBXb4MqBHcGU9aS5wlhF/GVUJtqU0/lbWUY/
X-Gm-Gg: AYBFou1apdgJWsXRNGUHDNL4mC7FnuQu42iElmpUxrQDTazC+kUQUqXMkcA51u9oB3l
	BXLL0w04jvNgZvlEH20Z1GIWyyZ8bRIw9Eud3TTV/GhNUnt5rI25TMt8FhJVpD5yaYKmZATMJyq
	EcdxhLTmLs6ZFxL+JAAAuYLAImD7BoukwyXNr+DLgxs712BMlcGTYGYhr/ytQFTAE7SicWEJPCJ
	xWdygEaLxYYWANm2y1CCfPSiLHLYSQykAjGfgcEqd+QUKt/EuMMbFC+UYxebLY6bo15v/pttclf
	sxJ0ODtTjsc7qAdIVZTzmUWCwo7Qqen4Nw9+Urn93oMQ/bPSF55ua4s9jQ65P+SExURShL1InCo
	NwImfQIZhKeZZEJiqAeLlIHH4z/V4WaJsVjwy5POr6Kc/YnDNd9o8zlyZT8ZcKfMjJmpairD+ZV
	wLVmAEbniQfIAXher4zALge9XsYMHlIE7HjXJaqP1mocNs6VHiIN3Ok0lhV8T+RMNbblBdsXqLI
	JrCqyqrGTnyNzfSFm01tuAp2UJZWKWVomEE8R2TMSPrcj2Ad9INLyp08Wo5ncrnBfXAWZdhFNer
	3CdiAWRwAZ/5PyGEk6BA
X-Received: by 2002:a05:6102:644a:b0:7c3:91f5:26f1 with SMTP id ada2fe7eead31-7ccc32f27c8mr227930137.6.1792701042480;
        Thu, 22 Oct 2026 13:30:42 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910184bc75sm371879241.12.2026.10.22.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:42 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 17:30:15 -0300
Message-ID: <20261022203016.75038-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bart,

Thanks for the review.

> Why eight readl() calls instead of a loop?

The eight readl() calls mirror the assembly's unrolled 16-byte body
(4x ldmia + 4x stmia over 16 bytes).  Collapsed into a loop in v3 —
the compiler unrolls it for the aligned case.

> Additionally, please use put_unaligned_be32() instead of open-coding
> it.  Is the code below equivalent to the loop above?

Almost, but not quite — two subtleties:

1. w0 is declared as u16, which truncates the readl() result.  It
   happens to work because the compose step only uses the low 16
   bits, but u32 is less surprising.  Fixed in v3.

2. put_unaligned_be32() would byte-swap relative to the original
   assembly.  The asm did a plain 32-bit store:

        and   r3, r3, lr          ; r3 = w0 & 0xffff
        orr   r3, r3, r4, lsl #16 ; r3 |= w1 << 16
        str   r3, [r1]            ; plain 32-bit store

   On little-endian ARM that writes [w0_lo, w0_hi, w1_lo, w1_hi],
   i.e. put_unaligned_le32() semantics.  put_unaligned_be32()
   writes [w1_hi, w1_lo, w0_hi, w0_lo] — reversed.
   acornscsi_data_read() feeds SCSI payload bytes verbatim into the
   upper layer, so that reversal would corrupt the transferred data.

   v3 uses put_unaligned_le32() / get_unaligned_le32() / le16().
   Note: <asm/unaligned.h> was removed in 6.12; the include is now
   <linux/unaligned.h>.

v3 follows as a reply to this message.  The 16-, 8- and 4-byte bodies
are now a single 4-byte loop per direction.
