Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B13451D6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570724; cv=none; b=qpY2MEpjOwlN/k4GhevCLzgciTlTlhFlFvP0K2MTj3U8fM/C8XaEWMF1s997ZXQTsy6cd7YLq99iHyGysYreC01dyZdhB6/wddRSXl+DUhyEK2xy7eJgj4CSv6+PbimbbkLG6jl5Pw9YhNY2NRqeECchlOLN+p/Uiiyu+GpQ0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570724; c=relaxed/simple;
	bh=ggKlK180/E0rXqdeGU3OKFiV+qqILBEfQhs7E+YVhms=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DtnwASo2b76NorTF6hleHQDnsKL6MCS1KKlWum3Jou9rqa6UDloLjAEYPnBNjeuxZ1J/9qavBP3K6Q56e/ayaIPZkNK/fAa6MNzh1x4jGaB0zYUJOvfVbPX8lkUiWgCei17aX/CfwodEZYOSxlYwU7BJxyycDlYZb32i5JPPr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgXulh2i; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgXulh2i"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2858518a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790570722; x=1791175522; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzsbKzJOVwGlHF1oMtECAZyIGl7HsuDCUdGO92bcnNw=;
        b=YgXulh2iYgERMMxjTrR0yHksYC+fHlOQxj1sD/yYXnHnGXJGZ4au1UWlmNaTNiBHhv
         x/Itf7f3hryp6G6PFoLFXYx68/8sziwTTcKoH9sryWyM+engHFOvH6sYFfOzMTXwBq50
         6wyRFzst205Avd+rIGvcF/rEP8IgK0HM3eKSbAvj8rGKYerR3K2tBWHifoLuUpOjFqPS
         i1wkqw52TARqlVBapYELIDCwcSRU/8YWIY9O7oYGqGlwvZLIvvBAuUiM7V/pw9+gw7OY
         KShXGINFIo8hNNKqeUkHrd6EeTOPOd6Z5PE2Rp1tIpbDmLPQYELhQmIAclBcb9WNreqw
         Ttmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570722; x=1791175522;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzsbKzJOVwGlHF1oMtECAZyIGl7HsuDCUdGO92bcnNw=;
        b=tWLMTOl7MJjmGkBFsLuzNlxp0X5H+p4H+YJpPsFq6sNmVAIwOA4h/zWwZHeEsroaBv
         yKNm+/g3TFN8T2ROucj4NTOIKTn8kUhrcnw6WPBJT+B3inh2HVbiGPLAPnvifK0y0ul3
         gJBV8CyCSxYRaCqpBTTZqKSVAR3DuolZEWEfcmJBCD16mVaqkctdJQCy5Kb267SAkY7c
         1CX/HV78PpVbNGribeI2VcRozm+hBgx8pgjSQwwmjVZWKS1FAv0452KF8rPHQmMME1nl
         h/qXm6nZ/Gc3ykQt6VTRSvYvDk8kiOCh8hwyi9lGfs5xxrS9lq2ysr2QbnsQFTwgpo6G
         oj+g==
X-Forwarded-Encrypted: i=1; AKwUvBzax1aNbWOdsV/iRs0FRlOnNYWdYncKRB9kheK8ZRfujy11wPSSc70rvf6+A6/8HBtlbSEw8NidBBuOm3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa/+BU18rayYpr0VTFUj1vkfvbbIDh1krozk6Ky4vN3YoJr4rA
	ScMC16rM9cGINd4+f2SpLpJK0t5YM+TxwC4pehhx9IOr3y1FaQxLB50sGlD6jm+6x22ejOzXANL
	u
X-Received: from pjblx7.prod.google.com ([2002:a17:90b:4b07:b0:3a0:f05d:2b81])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e0f:b0:3a2:b246:be70
 with SMTP id 98e67ed59e1d1-3a2b247915dmr922147a91.22.1790570721493; Sun, 27
 Sep 2026 21:45:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 04:45:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928044513.1330392-1-morbo@google.com>
Subject: [PATCH] firmware: cs_dsp: Annotate struct cs_dsp_coeff_ctl with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Simon Trimmer <simont@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the 'cache' pointer member of 'struct cs_dsp_coeff_ctl' with
the '__counted_by_ptr' attribute. This allows the compiler and KASAN
to perform run-time bounds checking on accesses to the 'cache' buffer,
preventing potential out-of-bounds reads or writes.

The 'cache' pointer points to a buffer of size 'len' bytes, allocated
to hold the cached value of a DSP coefficient control. The 'cache' and
'len' are initialized in 'cs_dsp_create_control()'.

Every subsequent access to 'ctl->cache' is strictly validated to
ensure that it lies within the bounds of 'ctl->len'.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/firmware/cirrus/cs_dsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 4e3baa557068..6aa1e1b2b4a5 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -96,7 +96,7 @@ struct cs_dsp_alg_region {
 struct cs_dsp_coeff_ctl {
 	struct list_head list;
 	struct cs_dsp *dsp;
-	void *cache;
+	void *cache __counted_by_ptr(len);
 	const char *fw_name;
 	/* Subname is needed to match with firmware */
 	const char *subname;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

