Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453402;
	b=IyHLi8xXtuZlXQsmsLifynJiUFnoqf7+M1yj6nU3dxQGgvgI4pXkja1I9IZmF5psrBFf
	 yJ0lFTQOe5MbAR7OTFbyMQxBo93VXY2ZJ1r8lhroQUkaO6Y55dgqOAuEvD83M7FcKN7uk
	 1M5AqlZUiDe/Dqc3UbanZ3u/FOncz3FwJDIJzo8HIZSwsD1r7noJkzIBHppQfrptlGZxC
	 1DF/M4/LRp8Gza9+MUkZ0as3tdSe55Xh/0dHAQzGTwpZpMOBAlbBoLcu/hyvegKvmXXtf
	 MNxdlM+J1wuNz7SxmlLbqjYQmg282STV784v+b2PRuIQHATsgK/mbhy+I0UsDz9gdNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=L39CR+CBenA/NXHH1oDntch59w/4ZX+SRL912KR+wXs=;
	b=HtQBG/wD6td6/9BSuCW7T52BmtPUthm6SdU4Kwwxi5zTE3v81lHYj2FWfDuPznRWruIU
	 mgKkWHjKOACpaQx8rNfhmHu6hrZp9pIHok58Py3t3hUjauxtn1qZl1V/HGJ6gpe1tttsX
	 ZR/YIJ351JlW9jOxBVFB51xK8VoGLw3kpB/mvPl73VQzzoLdS4wMKsdAxQM5hyEg4jMrY
	 yQNXD3JfDRZZRriPanCyuBcNFZhpV4f4yBxFMgXI7wavJJVlWKAQnh7tIeoeFMYqBeGpb
	 hank2DqyRZVPt+K5SeiMQ9tpZX7ERO476clULJGNHwpuHF8rmogy5PLEg+VVdaiZcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fZ+/Ydj/";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85888606A8AE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85888606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fZ+/Ydj/
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so734817c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453402; x=1795058202; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L39CR+CBenA/NXHH1oDntch59w/4ZX+SRL912KR+wXs=;
        b=fZ+/Ydj/FgLNUQ+y/kZ30Ugr5pjInyVUH7hkeCMRcK/PgDLmUsNrc9WIYQye2+B+Fa
         Nw4V1BObffYhgl/L/FxMwyd2E/5vWBea2Hsk/R7k7LiBp4p4q7H9pyed9U8YF3Fa2BQ+
         kOj20hfu4WQjneIsGScQ2k559KQor+5JVvleWAcPhirMs+FKW3rV1SdNYudaHLQy3DmU
         jzT2kuaH6n0UXKqGQYHnysZnsT9rRN2Ce3q6NyS/A8ZqVMMquk/VS1uZGKRsRGlzpGkz
         XkC0ypJhc4pzy1JHmTF94XnV5nAqT6nhOAxZUhFS+QJFgzpwK3Wjz0O5qUS2/Fw0eiVD
         GEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453402; x=1795058202;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L39CR+CBenA/NXHH1oDntch59w/4ZX+SRL912KR+wXs=;
        b=Su7RjcZ96fxKg2dDEdU1K4+2Sfa1RpQUpVz5gam+UV2v+QLmJCGzqsG3VG8Sq75W12
         TQBHuhturBXFvkyfzjAGDS5t461QixbFCaSg5sVhc+fYwczMEwPjUmDjkVGwNhAWKe5s
         FQB7II1/s4wCRKxoBuB0rnrHAJXKqeD02ykw8CVkwGocSxRlXCfDeg+kBQ2VFNxOBmss
         rEF43Wa9+gytJUj/W/AT5v6JaZlWi0zIl6fhZyeMtQV+TusF3waZAFhWuMb0gFF9kkIW
         7Q/eE5axksreMOGuuch7Ueb9PeF88zwMqonh18MdmSVHYqvJeDskCQSIiTkfF7cxfSvS
         0T+Q==
X-Forwarded-Encrypted: i=1; AL+hErGD+5JTnRkK6rp3KVrR6RXDesJh/W8xHSatDRFNqi0bGE9vWpFdlcBBq6fXrLe9R0bh3SZ/rzqiG1LfW4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sNgREXX6n080/dm7ooqtMJbPhVeqN+lojWJOh7RSeODSbAwMr
	Qpq1otEuFoBmQrQbTKuwYBsNcmvLMbwKEXNCc8m5XRm9LCmhApjGIURYaw4Vhhwbw4jmy8+CCnS
	9DbKC7uQLGw==
X-Received: from dlbtz9.prod.google.com ([2002:a05:7022:eac9:b0:1b0:ab15:db1d])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4549:20b0:1b3:aceb:b8dd
 with SMTP id a92af1059eb24-1b3c034a955mr3990077c88.38.1794453401434; Wed, 11
 Nov 2026 19:16:41 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:26 -0800
In-Reply-To: <20261112031629.396819-1-mrungta@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-5-mrungta@google.com>
Subject: [PATCH v4 4/7] genirq: Export NMI APIs for qcom-wdt
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, request_nmi(), free_nmi(), enable_nmi(), and disable_nmi() are
restricted to built-in kernel code because they are not exported.

Export these symbols with EXPORT_SYMBOL_FOR_MODULES() restricted to the
qcom-wdt module so it can register and manage its pretimeout NMI when
built as a loadable module.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/irq/manage.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 073fd3595d2c..ace4d2796382 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -852,6 +852,7 @@ void disable_nmi(unsigned int irq)
 	if (!__disable_irq_nosync(irq))
 		__synchronize_nmi(desc, true);
 }
+EXPORT_SYMBOL_FOR_MODULES(disable_nmi, "qcom-wdt");
 
 void __enable_irq(struct irq_desc *desc)
 {
@@ -919,6 +920,7 @@ void enable_nmi(unsigned int irq)
 {
 	enable_irq(irq);
 }
+EXPORT_SYMBOL_FOR_MODULES(enable_nmi, "qcom-wdt");
 
 static int set_irq_wake_real(unsigned int irq, unsigned int on)
 {
@@ -2189,6 +2191,7 @@ const void *free_nmi(unsigned int irq, void *dev_id)
 
 	return __cleanup_nmi(irq, desc);
 }
+EXPORT_SYMBOL_FOR_MODULES(free_nmi, "qcom-wdt");
 
 /**
  * request_threaded_irq - allocate an interrupt line
@@ -2455,6 +2458,7 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 
 	return retval;
 }
+EXPORT_SYMBOL_FOR_MODULES(request_nmi, "qcom-wdt");
 
 void enable_percpu_irq(unsigned int irq, unsigned int type)
 {
-- 
2.56.0.611.g1030f0b940-goog

