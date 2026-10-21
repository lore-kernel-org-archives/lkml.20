Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592203;
	b=ERPUN35KBKRTK9l1G+opyRl+FRWP02s9iKZwmRlnpMCXc5fuaKRnC5Dt+RfUADhxmHDN
	 mW9LcH6bodv33IiRZcub79+8WaieH38SgLPdB40g1S9NLpzm+knFTg4B+Y7yzCrf4UH36
	 f+x2H8Iswgr4pDhyX265UiCLhC+Lfhjlct6lDC+dBlQh/Mh2FX4phooSR0b1o0AdT6qJu
	 1+pjQnRXyiWfPR+4RXebYhyL1y3R60qnxuoXMEH01hn3YTl50HzzyCcDqEhUaxgcxQUmi
	 Lqa99u6gGWTaHi9LL+pTAqOdmxPDnh/pgOa9dCpetcEMHnwjIzGBFHiqdGr+He/ICIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
	b=NQwklupYImBcG23LPb2ACKWjDNsdabSEqujxOf89evYlXUKSuiCelLTK/iSGGJH/W7kG
	 vHakJuq1NC61yXSGsFLCLaTRc5n7VFsloMQVjouARwuMKkFNZAs0AzP9ufqAAhDpT3hu8
	 7RVgVMwr60yqf1O/L4Yvz/dls0q5xyyin3BSOWg7Vz/8S96j870uaIb6RT5ZPl58EkY58
	 Xu+xzXPYVcNLW0iMTDMLbNWY4l4bIFcVZk8Uj7SIJE0dBcwoqTRKBVcEhCNplafaYpsW3
	 o+8KftC4Mi50fubn9XyBbTl9bSdOj0DYxdqJQWvGOtZMi6UOqEDjwaRfB/DZh5RmboA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXSGAQo1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2843C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXSGAQo1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so6318185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592201; x=1793197001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
        b=pXSGAQo1w8u14Mqjow8UJEyWhUYYrB69TR9aQWEvGhCixOimy04HdT28SeOD45WDA8
         WZuL6oVBY9ffx5cWYPjDbaxAACUw0I2cR+uYT0Garv289rUubRh3xjXR1nrBNtIX/5FJ
         //LmE5q+Ac91zAhqvjkoPK4RH6nyoZgQUVElCtFuC0wnSLsYE+XX+JgycGZlB4nsL9Rc
         tDz+B0XCbUVxgDkfrOIWRU4KVUme5crpdq4X8RqDqnl9gBoRPOY+6tFkb3K5AufjEyQm
         9bcq2POPABcLk8k4ZCxTYDlp0TYL38yllkQxGg8TvQnn6YwvqmbF7rq5SJTl3mZHN03k
         TnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592201; x=1793197001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
        b=px4qBUgJMWl7zP5CQc5VPIfCs9LGejNykhvpHLP/tYaQzsixeMngFnJDe3XRD2PyUv
         heSu8Yj1rb2Q/wDvo0DnRFm6fMNynf5B5bBNyZIap5N8/hGcfP8KVMXAxkPWr42XvAuz
         +vt3/uVTL71ImXoUcMmvopHkrFSRAqjOYMbqWcIiRKldxL6Ipn5BcxFQzyktMfQnM3PB
         rPAkNMTsc8NXlHOI6iGRUCFRdaVkbEAhw3vpJTEFRCOm7i6oYaNK2cYapr6ANx2awfvB
         Nc3XFZqyQpOlAy29HknbOzXBBm94HOS1EBnvSV4VS9iELn7+mWoEpM+4GDbVoYo5+uVC
         GY3w==
X-Forwarded-Encrypted: i=1; AKwUvBwy9dEJqZr0glNS1pEL1qzMpL5l/lIUs8WOjgsJeXoMJVlMLsl0QUuqPd9eau2twRFScQP6QZ10vqgfIG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9/VbjgkpzymnHjI80kC66PYv83xH822eMt4VuWGikurFOmB+H
	nKWnLmB8PicHnBKnLZoIt1y3jH0SV68eN8wM08nHGrriG4HCHvAw1gQ1
X-Gm-Gg: AYBFou33x8ec5BSIoTOdV5z5foVJqMRwQep4UZQ1Bf9HVq9oqCDNXkmw7P5sPHYUTFO
	RC5azA0tMv9ugjSJS4sjpr1B7fEEyFFWCGoBFWdRXFhqwNq08qxOAjWNDaiEiWAFinoFimUS/Bg
	apV36XmzvzSlp5EPAMXl2AC8JlN01ZAQ14oYCeMPYoD2K1xVTmptEJ6YS5ju8eC37tnyQTegXuU
	O56Cize047ghitKn5XmRrbbIQanfuDzBcF5BavmThT40TmrUAeuK8N6afFWGQjVoiM38f2cWrj5
	nFurKHuEFb17OnA5IGTjg5li40/j4dYxzB1edmDrlt/wS4PvJkJqZLYzry+kWHxvGztL5grlw33
	EL/FJFdfVeF36CTcqYYKd9AIurPFFmkiVS4Qbk+8Ro+GNO3MsEUFvPjgHlTZ3AomLeIjepZGR6d
	VQKNvgnhE9PAx1Z7kBx553FR1xOB3N1PxEATJ8kXzTcBoPIElkUgFIgBCr0N/ZE6PGMw9jj1o4z
	g1zqBeIm9fnDh1D7x4bya5p3eKN4qSabWQFbRs/5XZ4sQ==
X-Received: by 2002:a05:600d:14:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a1fdd29c25mr38502685e9.22.1792592200397;
        Wed, 21 Oct 2026 07:16:40 -0700 (PDT)
Received: from fedora ([2.35.202.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb698cebsm117409555e9.1.2026.10.21.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:16:39 -0700 (PDT)
From: Francesco Nigro <nigro.fra@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	kan.liang@linux.intel.com,
	leo.yan@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Francesco Nigro <nigro.fra@gmail.com>
Subject: Re: [PATCH] perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH
Date: Wed, 21 Oct 2026 16:16:30 +0200
Message-ID: <20261021141630.2408518-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-180295@kernel.org>
References: <sashiko-outbox-180295@kernel.org>
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

> On systems with Transparent Huge Pages (THP) or multi-size THP (mTHP) set
> to "always" [...] As a result, overflows only reaches 489 (or fewer)
> instead of NR_EVENTS (1000), and count_overflows() returns TEST_FAIL.

Confirmed: on master with transparent_hugepage=always the software case
gets 489 of 1000 overflows. With madvise(MADV_NOHUGEPAGE) on the buffer it
gets all 1000, and the tracepoint case still gets 1. I'll send a v2 with
that change.

Thanks,
Francesco
