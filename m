Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636784;
	b=uZOHApTrLPlwZNMsneN1loaoGh3d78PmABdRr7Y7JNcd6K0vbfPE+KTkLSHNi103N6zr
	 HNqQ/agZT/pAuRTGdllqSoYQe2yvajZq78ziyBZ9dw0QhIctBjDv1bcs8ik+Gctw2Q7Q6
	 sOwnK3XoGA34SZ3BsDtDSvnnZxinWHixjnpvbNPPLNcftgWVnymQG8seYgP9c06Bz0hlZ
	 r6CE1cYmZC67CdCPqDPq15IqM0e5H1G6dSsSksqZPWWLz/65KunbwrDCNGojWP9UmJkmX
	 jnk/zeVggVcX83kwtTG0SBEmx0v6FF+LC2QT4ym1xHb7mxt/EDFNW+9DPtH/RaV7M6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vCVc5uN5koRfW3We1Irng1UChFIRF8uThNg4EI6oku4=;
	b=2a1WSt9E7s87jp5pbIcfUrFQcm4C2OkhjSIgOjKlS0siSeUZ8VuIhQei5OSgL9KvCWxt
	 vJT7rlhWvCAPlyyC6SNc6VDSnkWfdbV8/Fmp1xy2ZVhl46Y+UAhaJjTf6M+/okSk2ugLk
	 fdZs8mmxKtMA8jcoIVMAWJZA6NjbEtdx3Ym4mByrydiEDr6BaTIRrOxf3f2jYzCSViDDy
	 Rhx+Abq83SzA7vlld0pc/mHKbnZrfbmkd1atwesl8bKpStWShTk6v5n5YuzmT+rYpGD8q
	 LjipMo5lWOsPqUHiW/k+uWK+dSsO3dpvV0wN8xQuKa+mk4nzpdnJuDl5qh0TannIdhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXSAcZrb;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56B606AE99
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD56B606AE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXSAcZrb
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso1517004f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636782; x=1794241582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCVc5uN5koRfW3We1Irng1UChFIRF8uThNg4EI6oku4=;
        b=HXSAcZrbuWCltYlm0yjjMBnqBdMpv6CLEsK5CowC0S+immagkbH8M1jNoPmEAmCoZD
         1fxB2VozW5s90sGhEIHWY0qgcQrFgDelbW8lzGpITgNW0vJpu46FSPwTTBARFgzd8k5X
         vIZqj1AmdZotj8lyK0HFl+Sn5IWPSXFcwpEAHmrQxmbxMNhYU09SIeIh8ySMpDuR/MQi
         /rEp4O2+kDPDeTNxZl9IU2RcbI7pFqIwFiPI3w8tlgHWEXNyqNQc/wzL9gl+U6rDtE8p
         prN5gTh/38sDqM8AkupsZzVC1DrWk1sWxvLi4jKB/yhedd60N+i89Ritog5oj2q1pLam
         BI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636782; x=1794241582;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCVc5uN5koRfW3We1Irng1UChFIRF8uThNg4EI6oku4=;
        b=ZkpfkrzN7soWlMmMQ7bE043563sq55LxlVNPrNmj9tiO18MhlFihr1pDAyuXyIK0AT
         9pneYGLwQOZO1cebdCsNtgKfQnbvjHihr83CvXQubMwCowXU2q4q6IePQbCFgevf7STQ
         1s+Gwd5jzqeAno+UDHMxzPaW4KgOxZln5QWdwZ7gQg5yOxzZ/ZsjBtvLAQstLVSSgFiB
         Ne8PiJ/orYCADQwAx9Y8X7g+D3L61QDuZsfdHdH7/6QGOBFvOoGmlFUO6nidjWpCp9oW
         wgq1K46RE0esAY+cf5zqxk+MCLMTowxtUvQASHkPcm2jtR1rF/TZwtKM3/po2YTkKKCK
         hGqA==
X-Forwarded-Encrypted: i=1; AKwUvBzxRHg98t1pzneZQtquYCSAYyqRUfiywJIC4SrIO+3s8oW0HkS3yWYxTIPaLthmKtSBkwL+TW7wiEN9cgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wu99r0N3s4nudcuQauHNSmnuTkxnr9x0+tiy8DdwFZy5XtOlZ
	IwRZbMu7P8BDosI3+k6uMU/N36caKCvBHWEDmq+cepiu50H9//65FAU=
X-Gm-Gg: AYBFou0SghWZYl7LUKOZ2bUqkvwhWwlE3/HYVHXpczgGrnWMys1C+NS+pCxbzE2/Oa0
	UX8MybnSYHudDNARYNSBK4jS9+B4qgDGFNuDGOpmsSfNAirik6zoV7Shw7MckTriDO1nDR4ocuy
	zio+lCjgqJBu++TRQ6ClPr4UI1SL00mZSPNvzXHzPYq5IaYPqFjX8jfdTxY4HyngFSuHOWNK3Rt
	eEGC2JSE6u6TXB0LwkcP9F6Kf7WyPlqSiMCypx2wPqzqupcpUbksET4CCtRhxwfJZMAdCEkUbSL
	pgk9PRieUoF39FYDz9k2B0lV17gGjyxdaIvV4fBpqGoInoQxroTp3iqpyXWL508h4Kw/sbfKuAh
	lDMqAHkV54fGwh6fLTbKkDC3ahNjbqtRaA0IHESaNiJaCsr24OsPBWaB/x+S2jtCYjs5bIfL7vM
	faXnZmqv+HLCTYNb2KnVxCuMhdRkYfqi3E1KnF9vCdHIbKi4feKBnOOU54v9ww/IEEKKS8cSyGF
	3K0F9XAJX73dN2Xx/GcX959Vba4uVGgi2BBlacN5KzYquksl0qCMXFNDFRe6tUV+s8ua3yJobpQ
	R7C8JqpW26c=
X-Received: by 2002:a05:6000:2011:b0:48d:f14a:917e with SMTP id ffacd0b85a97d-48e6e2f24f9mr25344268f8f.11.1793636781827;
        Mon, 02 Nov 2026 08:26:21 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80306sm22341432f8f.33.2026.11.02.08.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:26:20 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	steffen.klassert@secunet.com,
	daniel.m.jordan@oracle.com
Subject: Re: [PATCH] padata: fix lockdep warning in padata_find_next()
Date: Mon,  2 Nov 2026 16:26:19 +0000
Message-ID: <20261102162620.1428887-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102155353.1268322-1-tristan@talencesecurity.com>
References: <20261102155353.1268322-1-tristan@talencesecurity.com>
Content-Type: text/plain; charset=UTF-8
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

On Mon, 02 Nov 2026, sashiko-bot@kernel.org wrote:
> [Medium] padata: redundant spin_lock_nested() in padata_find_next() splits lock class

You are right. Commit af3852cda347 ("padata: remove __padata_list_init()")
already resolved this by giving squeue->serial.lock and reorder->lock
separate lock_class_key via separate spin_lock_init() call sites.

The spin_lock_nested() annotation is redundant and would incorrectly split
the subclass.

Please drop this patch.

Thanks,
Tristan
