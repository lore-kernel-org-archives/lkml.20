Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521155;
	b=u/tHCHdcHNCFkFrJDsTJ+xfsm2DTGRXEkpuGLrMowXgpPb0717pE0Lks6iYGv/dKrP1c
	 kMG5wF6tZlhV1wcwlpnYEvGCyLREFFuJsRg9r36/LhqCBzUXeVsMILQ+M0Kw8rHX7RjBd
	 bpRdtPC3ub3b3IqfAml4a5yzuftyn67hbm6gQQywIJbyNzzVRTAk5vF3czXULN/i1bg5z
	 2ZnhnviF1gIoWQKZoJvNWKT2FmgK6fYOVEUFewsovz7PpzO9K0rXp5Z5zK6Jo5GTrhvrG
	 Sg2StDOWeUjY9o82S148QAQ7QJKX1QCaq3uP7SXM/nB1Xy0g8ywtZlLZmWkPi1rMOoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gS1rjdMlRb4/K9zyYzLkZk0j6UEfbGKlcQ3VHcPrCP8=;
	b=ZZSW1pQ1O758B7CcltUbSlLriFo10tAabCuma2r45JVzmfEQaVY56gwRuisr02a+9plS
	 109nW1jZPz41xguSY349bWg/doaCeNsxX2TB1K5/h9Sj7fk5mop/pgXvF+qqsS7DwSprI
	 apBp7JOiCtg6Axi6EXZ35dY7a9O4JqWUkBwB4aL/yDH+63kETzty72YBnmJqIJyjEWe47
	 YzsBJWuso5EPRlqDO8JHK4xefrBSFeg5bJk6NYpv9JfLsXLKgLMyqFKyAXmGgTokHw4Wb
	 1rQ8Gj5mWAJAomrbM39YUNZ1iljZ8vyl6cBdezIv8RtCeAnT2vDSEzVY1kMXdIja3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbr9LbjB;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE82606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE82606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbr9LbjB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f6295304dso315890eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794521154; x=1795125954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gS1rjdMlRb4/K9zyYzLkZk0j6UEfbGKlcQ3VHcPrCP8=;
        b=sbr9LbjBPYV6M2I9MIvUhdctg7bsyrPjWmfMyEcbLDk87qf2gDMyTY7lS4/coaDAof
         BETIZZlIq6qyNptH8aATXZ1QMTPELfib925KGYgmWhPm1chcuZpyxDGK29DobMHwR5Fg
         2S+QB9CzEEl7YKwBFnvKMhXIhw+OLIMYV27ItpSWjELzKD6dMmsGCrK8bQBAFQjSlL5N
         Kt+Zm7kh1h7BB9LjvaiJMj2kx4kKnMmMkFjHCA0SiWtSxsHeuq4eQYyEKlim7bat/+xk
         1Vbb8wO1q8OPdQkdjW4LSb9H2rc4RA/eFicN5CooSQnKPIODHA1x2/2SmoM7T0Lnu0JY
         2mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794521154; x=1795125954;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS1rjdMlRb4/K9zyYzLkZk0j6UEfbGKlcQ3VHcPrCP8=;
        b=nTbEv7cGj/nM2dmjvkfc2tqL4iBcImBXyldp7Qxce1Ip3rORgnRrtZ6nMrDhQOtCwX
         AYs+svTR+6bcYTr1K4WocCtLRPMQtiOkJYexwfUJ40tkhQwMJCUTrFRSpYQYVZiCkqWu
         vHHelvhAoJ16weJAi2EgFpHgTe4OglIf50nKutC1cHO4gmqf3gGixA7f71htLCzf2puC
         TO7kzon0KScOTuULyN8TJPg/gKiY5AB6oqDQZChAxxiqN5be5yjPn0XxiuNfmObXVrLS
         N3qb/s3z01Tdr91m9FLrK0puX3QQGITHlFoY6d2+JOVplvDBGU76rkyz7Bn+PNPrip+j
         JJZA==
X-Forwarded-Encrypted: i=1; AL+hErFBftbj5BBhhsHZRUHTwK8xLiXCCAm25veBGA1tnzCE3WbARsZz5/eNdDaP5qGennSTRvyUotNNjeqQzlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1tZsDDErnscS1hlD1reJdq3JSP/qREOdNM4YobHiLdxuKPmUk
	kMnqR62BI7LhUER+28Mx8yHHSXXn5CnsQ4Hgk2Y9GZ3hX8TKYc4kh/MB
X-Gm-Gg: AYBFou1nNfTw+s4QtMUPCRKxnXU6RP/yqvj7EFGvLTf60Qa2RP5pFObeDrEbgyO/f8O
	wOt/ZT3DdjnvDi7TCcCnozwfsDzZY03h1WONa/HZTmU594aYf3tW6Bw0Pl3ABOCBgCWH75FlsKe
	CGgSDxuhkYx0HdBEcDvTn2lmUmfY1jbpU94xRZHJZ/DDCMi6E9aSgPJHGrLSAGkadqdUkeQjTKd
	q2TYWZp39eNiH64pCLZVdpEqbAB397QjDVjkY/rCLpbowKB0Rv1/SlCZAazaFtgV+l4w2ybwPcg
	NzrD7gx5gcEPXM9XTYwkQgQeQ+Sv81KKEPz1vVODt6dHe21d06osvKm2BWUbAeHpcx1tAbpcp+c
	Az88LpUP0rNexrdB3NP16bJTpm0QyX9276n6yKjcK0keedMHtHUypxlonAJ+IexTv2jwf/701me
	SH5zghYxqSYgqUpVvFMzt4tGC2w6ki03Rvrv8IHKgeOZQ7xph4lqG1TC3Xu0Z8z0ynKPpNlcc7F
	Py0mA64QkuVYAzME88QyU6lA69AK9RyEhcvDuye4+xygqLIssm6/Ri/tCTst7/MwKePr0NWogs9
	vWEdTFacKR0dmuoA/jDsCH5A6EgJz7/XGoRY5Hlq+GyjR8dIrmXAG6meLt6WSpwcYjHCsLEnpL/
	gCAzXrC3TqRJdLJLPwgF1+Nzk5P743GCrb3wA6ysvL97njhDeQ7VObTiJVsulBpAa/bGAo1HivE
	tfAunjk79O9HJ3DpuBFtSLKtQ+aJTZsU1UEEe99e4rwA==
X-Received: by 2002:a05:7300:d0a2:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3796628f98fmr454214eec.19.1794521153797;
        Thu, 12 Nov 2026 14:05:53 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm428304eec.6.2026.11.12.14.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:05:53 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] iio: proximity: sx93xx: keep the IRQ balanced across suspend and resume
Date: Fri, 13 Nov 2026 03:35:47 +0530
Message-ID: <20261112220547.508369-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108012904.4555e72b@jic23-hlaptop>
References: <20261101102518.22757-1-kapoorarnav43@gmail.com> <20261108012904.4555e72b@jic23-hlaptop>
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

On Sun, Nov 08, 2026 at 01:29:04AM +0000, Jonathan Cameron wrote:
> All 3 of these look fine to me, but given they aren't totally trivial
> I'm going to leave them for a while in the hope someone will test at least
> one of them! If it looks like that's not happening I may pick them
> up in a week or two.

Please don't pick these up yet, I found a problem with v4.

Moving disable_irq_nosync() to the end of suspend leaves the interrupt
enabled while suspend holds data->mutex for the register writes. If the
sensor fires then, the threaded handler blocks on the mutex, and since
disable_irq_nosync() doesn't wait for it, it runs once suspend returns,
against a paused sensor. Sashiko pointed this out on sx9310, and sx9324
and sx9360 have the same pattern.

I'll send v5 that calls disable_irq() before taking the mutex and
enables the interrupt again if suspend fails.

Thanks,
Arnav
