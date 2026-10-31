Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478195;
	b=SG0aJi5SFXmo9kFE5H4VHFNaP6MEkjBXWl5pJpkPXNzv9Xh2meSm35ur3lDFilOZyr0p
	 3p+HEmrrwiCc4sfS5MAhxvrEzxe4iAwWhSng3eocB9FfdCzcDMcxLFPKfvqcLRREZWIzl
	 rgSx6Z85OJBJho6DF+UwrwaEDP5OMC6nw5wCqLOg+MqpQ0nF9Tz34Aw/s/0cA3fkZ8soX
	 hSFavO84GJe3C20MamJff1hmOk5DSyXfYXieGO3u3Qo4wEhdfT+kNHirUK1KCYg2vmcmb
	 hIH9gtPn5dv6K1xIFg8aqQTjoTovqpW75dMEbpxLYGI0dWIofeCMtgiLxDQzRhYkTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wmdmHhw5lcam76Lnm8iQAn5TOuqeDn6SBmbwkdD+0RU=;
	b=3UUqe3loFVF1Tp1pawKaHyFXAqG5wEcoTNMH6c/1VoEnMbk54s0E/+ubhQCtKXfGtjOB
	 o+0h6xHFACT32befArZpL8bG8kT2OUEgt1VUF84Zx+OOfrqFeLYQ6Kub8KvWSqXFWo/Pe
	 0JJ3EJIhPaa/Uw+pOfQu6bOZpx3d4QhNMVmpguVMGoSgk9WhILRR1CGZtv2aaQNpfQBZl
	 cDqKaBGt+qwzgYO8OKr2T2CjFrT/P/JDeOp1O+nUoSHPT/NOFFm9N6xS6ULXleCChRKlH
	 XDIb7H6NobPX422OKYrCqIyFZgOsho3jZeJlU7O4D+hkDyrn/zlcdS+0GJz6OdHj9vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxi+OILJ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFC606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4FFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxi+OILJ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so13789545e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793478193; x=1794082993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmdmHhw5lcam76Lnm8iQAn5TOuqeDn6SBmbwkdD+0RU=;
        b=sxi+OILJS/J7LLTZn8DJimesL9MpfmvCri79Nl3QW44HjW9eLiOvPawpVb9otpCSnm
         qUl7CpuckaqM64+a0JhZ+ZfM/nHfPHJ5MQ6RgHXYGN/ZoYp8QchjHF1XF41ZUOoYjQgP
         ZnmVDTmp8cU83R8qVl47jsl/hFwKnRjio/2sXMhp5ViXd/DlF7rxvnLUo7uCd6WH6qHZ
         BrCdRSPTX+Yr/ffx6hs7kDRo/k3xJCJn9mqrsxl1bLnGFY5brD7baZaZQhrvfWY1XJ3I
         54mDoc279hmtfyXzGm77dkMQ5OlFtMeRzGNlYRIvGFOzea4+nu/s1YL3EUNknDraDCPB
         bxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478193; x=1794082993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmdmHhw5lcam76Lnm8iQAn5TOuqeDn6SBmbwkdD+0RU=;
        b=eFay6l3RP4Jf8ki7/qtupUkZEfOWIrfKQeVfPrUe4jBWA+A789v0+yKPShZ5gGtr2o
         UfLbURBW2lbdmnjhMJF5HV8GgJEf//MPI4vL+LMG7Al5O9Vcag+Es8bh9tJdPJ3DPQiO
         MQ/zeEqmoXzePFLNM4bHw/BjMUGYdYrS40PUR+8N1NJS/C6mADwXjcgU9bLlx1KlNjbS
         KCMQ4UrX6yxfAmdBLlO4fbYRpWpSLjnwbsWsDbYYiH5/cx2cfUsuRXDXk8pcGnYx10Oq
         bMzjSG/grjGoM1R39Skxtl0Z1Xsyr2QT+2Lypiqr/dMOG/tYRcwrAKUgkqbGUPRccqYI
         ErhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhBsctTggrAS1piIzsCNjhvXn0zY5+HfUkpBxzbgGbfSY4mrZywJo+FCjsykmG1M9PaoEQaM+n0I7i2d4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5XtUNrBYVtrwxH9JbItabR6htbXKAcbmfFxirfenA14oLhAdy
	vYtqExohPsz4vitsOr+WRNuP7yoz0KxCnj16HocltkWax+lx1vfU1+vW
X-Gm-Gg: AYBFou0l3HSO0S6mZRysINIAxnYm/NZFeSpCOWhX6jEeZHFrSNQ3kST1few56eZkO0R
	diLZsTiHVFlgepugtgoIkDi1SQm00OzAxo+D+3CLEo9aPo9SWHkO5lHTJOnhx+WqWq8ER6AAudL
	xSAjxnWdvEsm0gQfnY6FKJv1KYX+UeSR/KQS19EOtuXnQvTxl/lqkStumclJMNRdap0oUiaHwzq
	RlNAjtn+MuEMLkZIvgW4x7XiiUjUFh95Eh5oY6ucukt5epEpTe89E63ZQ5bZN84IbFXuzn3rwaF
	gk8+t/dd8VEGbnjnF2BNuzU6QmelyBhXaifrMz0lqfEi0a9JXb4oUlC68mFSxUFILEnnH9NVyuP
	IXGyYIoJ7/UQ4miWlI3WbyMROCh1uX3ODyZastabxUbS7iqDEqZqY2seBc1Qh6H6+eWRRNw7RIk
	yWWW0AImc2XbUmj+nSEVaWlW+Y//rhOpD+1qqmqwrESTDIQ4tUYQd5xVKU7Lnif0+X8B4/eBw5a
	A+k/C/SUjQaHC9dvs4wi3vpCQdNr2bGaKxbm68u0l09oOWrt/PD0td6yDNck4kg0eb4mhEk8sKx
	Qje9UcOZJVwmV68Bbjiv80sQVHIMXNU=
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr137690915e9.27.1793478193177;
        Sat, 31 Oct 2026 13:23:13 -0700 (PDT)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:ea89:68da:557c:f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1076sm159818145e9.6.2026.10.31.13.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:23:12 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	sdonthineni@nvidia.com,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq/core: Propagate IRQ descriptor range search errors
Date: Sat, 31 Oct 2026 22:22:54 +0200
Message-ID: <20261031202254.200628-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

irq_find_free_area() returns -ENOSPC when no suitable IRQ range is
available. __irq_alloc_descs() uses the negative result without
checking for errors. The unsigned count can cause start + cnt to
wrap, allowing descriptor allocation with an invalid IRQ number.

Return the search error before using the result in range arithmetic.

Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt descriptor management")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 7cbcc3fb9e6d..651f34dae034 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -922,6 +922,8 @@ int __ref __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int no
 	start = irq_find_free_area(from, cnt);
 	if (irq >=0 && start != irq)
 		return -EEXIST;
+	if (start < 0)
+		return start;
 
 	if (start + cnt > total_nr_irqs) {
 		if (!irq_expand_nr_irqs(start + cnt))

base-commit: e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
-- 
2.53.0

