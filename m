Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742195;
	b=CIXnlyQtX6Lcnkrn9GGUr7B4kXWOh/e+eR4W8zxVRZNL9Di9wWujDijzgKGj1ZYBhawe
	 9A3pXYd9k9Hv6izzxYM4Y2lzmhviTEMV5Dg1RAgPKtZdSzZm55mRk3r2WEF96cT/atwVV
	 uRDcZAs001noKVhNdFgLMBs0ILqN3WCnTigyMgyCBp+p4gEZrNmjKr661pQrouEpDwgUu
	 /1X6ea4tQaQuLs+l4aPdyxi6hXxHHzqgwMAQmNl/+7GMoKax4J8paZGhvhns17FZRYLBV
	 DilZq9DW2D5BfX+/KHumgwd6QcPE/noDfpvnqftOzqP/I1btV4bKKlDwwL5/BDGjF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
	b=di3nRkIpfXQujmaWNKhNugrg6SnkbuvTKOBgjg+W30U2b7fRdG4m/IqstP/UJuZBS0yx
	 97hnmHYcxsEBMt4c4CnWdT2G+TMG0y5K8dQScH98ATC0g4FIb5hrZ4dqt1A/N9n87KVws
	 HpxvHGHBqCDuYSiyyjtdL5M6M8qQ2N9vnlHQ0CnDIffJe2sp+/Jd21u2/VF7JgzSE8q1u
	 4g4Shh6s2kl4CWlkAD3qOaK1rmw5TFNaCEKySx93hsQXMmKytl1pdPdTsweD0gSF8iHQM
	 PlzsZsojG9prl+OGMAF8Mqr7p3YqSXt9IlirMKOsqZ608VhcN6avihgXex6Pqk5uNLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5CHPewS;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641F606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3641F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A5CHPewS
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1494a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742194; x=1794346994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
        b=A5CHPewSGSTU2oeHArS+Of4cmMXag/WzykuQsiv+SZXPrjYlsQGklY6SHJ59b2R5Pu
         xDqfKMN0Hal/bA7PPxq8uR/fD0gM3HHz41jMUmDsFm+nwBbYFNirdgIn2Gy+EvbyvgV+
         Gqi1iUw1jlYykhd+2Rx7CUwTVVPUl+/wx2iLlOG41MWANizqlcIxA5AgLpprwAQKYgpm
         Hv8Jn4h5hczWt27TiFa9kt09R/Q+vnjJTBBHfU1FeN7zPUYNXpaO5xBK7OpcaBfuJ7WO
         2juceEhWRVEveMlYMoy+PkFmqHtTqARMwhNgoJIBC1GL4Nys2eLanVSgRNDhDtJSw1vI
         gSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742194; x=1794346994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsQbLTCb15SEBz66E/puI9KOwSbRd2cOgYsx7WE88Ls=;
        b=z3UAZWFBcUtdO7ksAeQLr46nE0J573YmdHSZYLRc98yiGYOJdgHKsLNrdR6IDMdEgB
         wvsCE+oUKBEbyNOcE2wH2wl1+idO0wnbF1kq6fPUCOCUYU97o7lilX7kTjLcwpcsJpZe
         iwu1uPlFiWzhfOgxqiX7ayuXQm5kSk7MshelAhQDmlxyK5a0ryKtZVwzkYagWlp/RJX6
         ffr+HV0jTg/q70RjT0tkjSnDATEZ+lKiaEW10JVOYn9fFybn4a2roTj7Wh+pHVROx6yQ
         FZXhw+oFPO5P29AP0+0nbJVFtIR3F8kzKFKZcxZj6DXL+7rYniqWtaThuEnNjQ7gFC6d
         prYw==
X-Forwarded-Encrypted: i=1; AKwUvBwkhVb3F0UVdLt5ppI+W/mU+ncKi/fVWhGaD3og2FhpYs5lDRU3lGtpZbWn/CMlmBkRP0bRgaiH6TmRZp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+64+DPcXD7GPbmdrSDmY6Zf2h1rPytfMSQs1z2/s87vezU6yXM
	FXzxL8TgMqsyVbcVJr9Cunmi8b7WB9CgAFXow/yt67aoBHrLfF5u1dP0QNT95elNt0Y=
X-Gm-Gg: AYBFou3QwbZDVUNPcAQTaeQZ1DnXVRMYutnyBj/1wPXxE+B2td8V83cxD5k1ASeLm+G
	+3tOIUYWXaseuviohdic4RUWGzjh/H2h0oKbVRIlC+rgDPexs0Ui18J7Pgc3EF0rkQhhLO+q+Hs
	Nr5fvgUESwbhyjXxLcD3vuDouW6MP3aPG0WulXwqebxTXMZGrcNfux+Hgegwo4elm9GWqTNcAil
	5gQX2GRFAaRwUeP7p5Sjt4SaaoiEzF1MGqtFbcc9cdTAUKnZpusCwk5Ue7EDMivJ//WHAZEKkc5
	l/jWstuyl/2iNFd0HAPemHcXsobdE7Vt0B/O1dVC006duo30Q2FNIATTQ/F/D4TwKVdnlKwQXq6
	TbOZ05Jw+MtoQ68Drdswwivx3pB8RLNvlbYJHu8qoJR5tXH7Uj46H2WM7ntQMijRz/aroxwV1+W
	XjYyg+tUx/30B1myOQxZXxAoak0BQ9ZRMbltpiJYYNv5jInqxjLqS3Ln6zNuIzmcm5iY0FILZXg
	0zu9NxfdrM77Cm9Gl5x8ZlUnsjSzGM8bER1nHWUQEPm1SMTK6sZhLcPyej7D6S+8LinqeXoQUaV
	5yPmIzzcA8IPUqK8nxeMeWfFvXjN6B5mx98kI3Ahkk9+C/rIxaNb352UH4umljvztqzFhwY=
X-Received: by 2002:a05:6402:90c:b0:6aa:f0e:a15f with SMTP id 4fb4d7f45d1cf-6b4d534badfmr10647171a12.38.1793742193445;
        Tue, 03 Nov 2026 13:43:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:12 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 01/14] alpha: fix saved registers in page-fault oops dumps
Date: Tue,  3 Nov 2026 22:35:07 +0100
Message-ID: <20261103214120.1099893-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aligned exception frame moved r9-r15 back by one word. Adjust the
pointer passed to die_if_kernel() so s0-s6 show the correct registers.

Fixes: 3b35a171060f ("alpha: align stack for page fault and user unaligned trap handlers")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 3dfeb854f196387d8c8f709d0ce355e5145035fb..f09f69894cfd65d814ab1cf498c946043fb9e8a3 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -244,7 +244,7 @@ retry:
 	   terminate things with extreme prejudice.  */
 	printk(KERN_ALERT "Unable to handle kernel paging request at "
 	       "virtual address %016lx\n", address);
-	die_if_kernel("Oops", regs, cause, (unsigned long*)regs - 16);
+	die_if_kernel("Oops", regs, cause, (unsigned long *)regs - 17);
 	make_task_dead(SIGKILL);
 
 	/* We ran out of memory, or some other thing happened to us that
-- 
2.43.0

