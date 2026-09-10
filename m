Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755549552B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048011; cv=none; b=iCtfDuHlonMcOYiBLqnWVz59L+gsyZJDmBOppCV4tjmKwhDIy8E5h5xh+lJK34M0syFAkjNScj9CLn7+ZqQcLM6OoG0QOiYUvMRw2mHHwatoOSant/a5rlyaC5ZbVxABwqIZZSifUYde8vNGzbUbLvkf0h1dcIi+ExVjfUYF8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048011; c=relaxed/simple;
	bh=UXHuXOhFDKFisF/9OmmcTV6G79e9pR0bjsa1Y/uydpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzUWfLKoMiVzd+C6ADIqMYwZ8hfmY5yFwr4+ttGbLBRytaVJDOurP7KHzTuD5dyTFFpY24Eoe5MVPC+1iVvXOJ2F+ys26iQMo4aBgtBN0t6H4Q6KRHvWLCZ9Z4hUlxOQjtNyQmxEnY2vc1ZO55dDNvSLJ1AnGnURSK7SwNrTp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSDi2czV; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSDi2czV"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1297184fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789048008; x=1789652808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ugE+BUq8sDK0fNpwmpU6SEIFPEB70ZUCPnwQzu3hcY=;
        b=iSDi2czVrhGIJfpOLi0nmBaNgKP9pAmmMnWokn004OUVwM+Q7YpR/czFVjGO1ufWPV
         8ZekuZaZXBfAWhgBIOu3kJ4NojyD+H/XAdq4pRgtZlqLoEsFDuRkMZQzPhO/NwvjhlPN
         VVp0161wKj4VqvlJvEsbPKpW7cNpr/Gd7PW60bOzcl0Q/z5YDV+Hecqs8H5hG5GBVwes
         fI1ai45ja7HqOe8+pXL3RBvntZx49oLm9BS4JfCNUE6FA/Fum5mBLJNBXu1lRzxDH0H4
         BF+2WNB8ToN/ELp7TDZZttE0rxMjnKgRegy5VzfFIK2cW8OgXv9gzLgiP5cMASq3CjrA
         3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048008; x=1789652808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ugE+BUq8sDK0fNpwmpU6SEIFPEB70ZUCPnwQzu3hcY=;
        b=K3TT3cf8cYueAN7pB+w/A+eFXUJ/FDyUCS/gkWmhW4SsfA9LxtZYC52NEKFvlk0I9y
         DTshpwxgDUAFY/Ai7eOtJccGgfhsmpe2dY9KRsmAhD7+8S5Uzfk2U6Ej3sPkRjScsHX5
         knR3ORIz8nqcpTET5i4WRAurwZwZ7qN3Kl129leSafhkf2xlvvg3p+OO6m5W2uW8Mi6j
         sroK58oZehtYMp5IAM92Le0u15HA1+QuTqxt+nTRjHeMHWv31P/c6SXzoOgBkz5Ii89F
         +rFDQXUE51tv+z3mEj++HwG5M1b065O5tIfJ1KwB773SQDJPQRxk6knLRntzJXWGSpAL
         6j6A==
X-Forwarded-Encrypted: i=1; AKwUvBxvNFX3Hh4JmeRQYKXVCcNE/q5gQ2wHN9MqTrZrbw5zh3m7DrXN8iv25ZRMai809vNtYzvP+5Hf1s3/JhY=@vger.kernel.org
X-Gm-Message-State: AFuF++n46NUUUaaPvCtRQh0E48Ni6KDW1Vk+5ZfpNNPMFTiLoOFFC6op
	tdJ+IxHgoZkW098YfHvQi/3ztL15Vmtj+v/A78bRF8BUYfaoYoUISzKl
X-Gm-Gg: AYBFou2I0cK4740tYlFGXcfbyXxnbgiVQDYVI7OTL6+aDs7AW6s6RTdQESPl10/MISU
	W/5Hgad2sC/32ZUzvL9xhqGS3dzgrVrwm0Rm9+seVQ3voHac7VQQJzCeq263hVsdEVVMXqMJ3m+
	QqcduoAuJVFaFHAmHKoq2UVEQNCkKYzIFsncFYHDxdyyE0bZNtlKYWDUGHoOPjJKslQjjCMJ0ae
	jV4VJlkbemf1YeZrj1JOfJUFb7rK0S7k/4YQrlkMU1M7CzF8Y46+XNBWls4JEF+6IsuVALnl+mD
	ekYNbmDO109YinAriGLHIP8Wiy7osBvjHgWEajyYuV5JGbiQJJbZW5n6cm6fypcTXMKV+dxkrjd
	gVvJ0sNJHUR7YXjNv2FUx82yoT26ln7lA/qA4hBl3kE9LhC/KpLUngxBjRQG4Vw0MtQlT6adaS2
	GrpqDMzDChH68i6QmL+NGBIb919jjGyEXXrHH0jSWkoMYdmBe77j4UimDQoXYvz8pMg0h9X5z7B
	zAZ5Y4yNjaZo8qWH0rX+xw2+vFt/TA00pGKqox4Xxj9hpwUkARoYOPJeXgv59yEdjsXuJUu4mZ1
	qMI1XpB7RlOzubO+jfciuWGCEtTp2e0y8hLgiowG78tx+OZdr3c6hIfHd2rrvpU=
X-Received: by 2002:a05:6870:d408:b0:475:a153:2dce with SMTP id 586e51a60fabf-47c5239a143mr4735595fac.36.1789048007972;
        Thu, 10 Sep 2026 06:46:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4760cec8679sm15256534fac.5.2026.09.10.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:46:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	urezki@gmail.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] rcu: drain kfree_rcu sheaves from the userspace barrier hook
Date: Thu, 10 Sep 2026 21:46:40 +0800
Message-ID: <20260910134640.2044424-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqKZXmlRGsmJPl3r@thinkstation>
References: <20260910101112.1648978-1-matthias.goergens@gmail.com> <20260910101112.1648978-2-matthias.goergens@gmail.com> <aqKZXmlRGsmJPl3r@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I ran into this while testing bcachefs performance changes. The bcachefs ktest end checks write `do_rcu_barrier` before reading `/proc/allocinfo`, with the expectation that allocations still reported afterwards are leaks. Small objects released with `kfree_rcu()` remained visible after repeated writes to the hook and 20 seconds of waiting, so otherwise clean tests failed their leak check.

Strictly, that ktest is assuming a stronger contract than the hook currently documents: `do_rcu_barrier` promises an ordinary `rcu_barrier()`, not a complete drain of objects still held in `kfree_rcu()` batching. I nevertheless think the stronger behaviour is useful for this test-only quiescence hook, because it lets allocation-leak checks reliably separate deferred frees from genuine leaks.

I followed those allocations across repeated filesystem lifecycles. Their number eventually fell when an RCU sheaf filled, so I have no evidence that this path grows without bound or causes OOM. The problem I observed is limited to test isolation: the hook can leave deferred frees behind and make them look like leaks. With the proposed change, the same unmodified bcachefs workload passed the leak check.

After tracing that behaviour, I wrote the private-cache module in the cover letter to reproduce it without bcachefs. I can publish the original bcachefs workload and results if anyone is interested.

I also found that this exact follow-on was discussed when `kvfree_rcu_barrier()` was added in 2024: Paul proposed calling it from `rcu_barrier_throttled()` for clean userspace benchmark baselines, and Uladzislau agreed that adding it and documenting both operations was safest: https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/

You are right about the `Fixes:` tag. `kvfree_rcu()` batching predates `do_rcu_barrier`, and the existing interface does what it documents, so the later sheaf commit is not the right introduction point. I will omit the `Fixes:` tag in v2 and present this as a strengthening of the test interface.

-- 
Matthias
