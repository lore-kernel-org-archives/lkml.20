Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561294;
	b=OPCEye/8CzkVRMX6amrV8OpGdNEFvDPN3DMirR058MqPgHQ1kpLeguNS2DLwIHla4qpw
	 FF4ekNzfyKCOikYfmPVvDK7CVaCDFX7wmGUeKjbC3QkmU8rmW6JHZi9PDfgMvTTNQWNcM
	 lIIdspH9FU9BCljYoLmWox/iZDdWdWNFuvsweGTUS21NdGT69uqPsHCYTeNGPR6/98M/S
	 nMn76m/qDXdnx3YpkB7K7ckOXzjlIEHBDfCQzDcVeXaY4Gh69hPjOoBGLkV6TCfLDGbHX
	 tGs4/kkhdjxWTz0KVRrMnZOB/qVGsSfFOLjPj3vc+NuBnW1w8eTpIvMV5x9xXjPHSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
	b=f+FRYUFAtKc5YvlqzrVinzPno+VqEmOaB93iAASQRd27D4oYanI2tkoZAcT9176Lg1eI
	 qvoRzpgYl71Pf9DC0TPsLhO0iFggY6mfdswx8tk9WLSQ6R6I6i7AxlO/PXmiVQIV24IwN
	 4XPsQ9pOGC2MWK9e2nHSeZYuiPdfb5cZbcE1Nt3gUno6b6oFkvS0YiYI/8NcOPn3vSz9U
	 S71Vtr/yle1FjRhzYoOKzZA93bVc+7EycVi2bF5jDvbnR0aVYr0TDW27QlUUiBUjOr9mK
	 tWM2ZDH8LqX2UmCZEu2AxknOQxZOKghQ9DWep9AO0/p3YGkMC+sNHo0dlnxEdxNIV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHi1lMaP;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533460A2601
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4533460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHi1lMaP
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac4806e210so17904367b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561292; x=1794166092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=PHi1lMaP6DJ14nweKwQZ98dt4zasR7P6wJF54ko8g8l3/7uVQVvN6I5eMHmut5PMyt
         ta4Dskz5PNsyOR80K76EX/8MGEftwgybPOpMSqj2tJxUwdOfvU/Gt1uisFMJn9OrJAGE
         B2M4/4Ej+3NcFO4q1Eexvbm7HFEyMQJYKs1MEA26Y0KF7a+ZzMzZxu+nhmomCxXBp4zA
         YVm/fl+mq8FxuBrf8hsB0EZXvm2Zc4NkJqm21aqMB/96nS8fwitcTrZ1IpOQ8igHCB6+
         PrxEJioUmvcfrjJOThbu/H7WdZZSADS9Pl1qc+wP/O0tnje+bz21U6XdKLHoL62FH66G
         IM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561292; x=1794166092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUuHLakRNbr4esv7p2rM0pJWyo4Q85EyExt4ND+SVOs=;
        b=OpvLHJpfkjrq0nRXtuawB1xq220GXxJ5uB90eFBpV3Jbx/6ISuNOB8ZGFtFdv4reDE
         OgKHih3uC241cD4EOYhYD5i58LO+fD/9wa8xkt4tAtsuNKEXEdZSWdGtN4L+HdKYxpqD
         ERcVQ5f88ftg/Ti0gEKTg3dzIcVKo9qI7Z8pQOmJKIvst8ihM+GuajSxlDgHL/Bl8OwN
         lkvz5Px+dr1OWWOEFB/vujlViUFz2hX2EVs7TEi0BspZUKoHtObUkJEE71kkbjmr7N6Z
         cYgmre6FDkH+zWMc0llydMkx0uogMHVkiOKl59utYIzbooP12FuLVEIVwe/Fm7Q4ezMU
         sOWA==
X-Forwarded-Encrypted: i=1; AKwUvByyD3QrmwZaCjNUF2S0f3jpLu3pmPLIbrgFsVtWTjFS3jhHOMoH5CjYHxbK78rpN6FkRwrXNHTRG0L6MK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nNgbGEOHY2Jz/xnrg7TIGvG4f8B4ggWqcicuNOp47VNhALseQ
	B/I1YXp6llqe6xd1MokyZ5eikB1xIIwPWMiPN/jadr0wzNv2C9QT8ozP
X-Gm-Gg: AYBFou1ePr0yfxEtBd9Ar8/gzh29F6770XgXpSnJrKZB9P+i/XzQNyJPWXxgDoKYvIp
	mvssQ/4ybOdJ5rhSi6lpK/jIgQ6s0PEDwCLnuKgFE2f7b5tkzkeeYu0wmzQ13OoXF/NFN1gWD5+
	YllZDyJ1mEcqnhZYVhYrRW/ULQtnck4BDsXwdBxxN1BGpvAY9FTF5Mr4bF2huFzGRkdTDCX5qYJ
	vYn/4dm3e6NmVUai0pvkY8ZDGfDsrogQmMl10sliOynxbz13jZS9PxDqFvIENc6OSArV82uy1i2
	swkSxwC9j9LItNgKnkwsUNfGDdgF1RU9ifYBTK2X6SpJqHaL8PaZjbFPcKs+Q4c+3L0IKOwpXMu
	MChFFZ9UBBDOkHPAnnysKbvtenBaCswkPstVRsUiSceSVVgpjlDo8cU6zNdG2RoRjacIuHhFTPB
	2SBYKehBeoLw8R6jvb5vp3SHD8OaE0zkjuYjVpXmLUJQopH4suRMku0Z9/QAs9DXKIpDLmWPOJB
	QcEJN0JLmGHyZrnL7BCnyMHqHARuTTvz+lXerHsN+M5YXa+ZAowdvXNO3XBozQ4w6FAE3tJWLQA
	rQuEoy6F3PjEff9C7fLNK77Q1lGYmx0GDBWaYo+G+3tOFYLHNFkzwoj0Q7rL/BsqR7DTgz1y3+g
	JErrX8aZuvow0+T1oyQtFjlzDlrF+cbQ=
X-Received: by 2002:a05:690c:30a:b0:8b1:6e61:513 with SMTP id 00721157ae682-8b2b64382d1mr80228967b3.0.1793561292194;
        Sun, 01 Nov 2026 11:28:12 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b6d3ba5bsm40482837b3.0.2026.11.01.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:28:11 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 01 Nov 2026 14:28:06 -0500
Subject: [PATCH v3 3/7] alpha/perf: clear PERF_HES_UPTODATE when an event
 starts counting
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-alpha-profileme-v3-3-92d511b5a044@gmail.com>
References: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
In-Reply-To: <20261101-alpha-profileme-v3-0-92d511b5a044@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>, 
 Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=bEa6cnf/NHGbPsC7PL/IhVePDwjtE880lWDMA14mV8w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeTzpqzXxf5wfjifN3lZpDysVDXp81fLXlTXn3qW/Mu
 QJ1RfMPdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1s94y/OHe7lSsdj
 a1/LZQ24ddVcs/PP+xQ0tZ4YcRG0fe0sDlh8IY/qeIprfEJzSZ2fu9q597Z5uzuG7om/a8v1rFI
 rMMnvx8xwYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
then programs and enables the counter, but nothing clears the flag until
the first alpha_pmu_start(). In that window alpha_pmu_stop() with
PERF_EF_UPDATE skips the count update, because the flag claims the count
is current. Since the next reload rewrites the counter, everything
counted since the event was added is lost.

perf_adjust_freq_unthr_events() does this on the first tick
after an event in frequency mode is scheduled in, which is the default
for perf record, and it then sees no count to adjust the period with.

Clear the flag where the event starts counting. alpha_pmu_add() cannot
do it, since the event is not programmed until the PMU is enabled, and
stopping it before then must not read the counter.

Fixes: a4eaf7f14675 ("perf: Rework the PMU methods")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 70840c05d39b..ecec78c355cd 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -456,8 +456,11 @@ static void maybe_change_configuration(struct cpu_hw_events *cpuc)
 			cpuc->current_idx[j] = idx;
 		}
 
-		if (!(hwc->state & PERF_HES_STOPPED))
+		if (!(hwc->state & PERF_HES_STOPPED)) {
+			/* The counter is live, so hwc->prev_count will go stale. */
+			hwc->state &= ~PERF_HES_UPTODATE;
 			cpuc->idx_mask |= (1<<cpuc->current_idx[j]);
+		}
 	}
 	cpuc->config = cpuc->event[0]->hw.config_base;
 }

-- 
2.55.0

