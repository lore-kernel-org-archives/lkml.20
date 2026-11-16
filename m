Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828463;
	b=2P9gejWQ1Pj+x+TrPzHDt43a+RT1NIte/Jk7cOCChXTtiiqfPdG3vghdJ21p708zcjMk
	 HFPphVNaLWuB4hpDyzmMBvbnoa4YJ+qfqH6m409vQreaeJccJapDHvreFftKuyzsl0KOc
	 MN+YMvWZDMt3a5LIs2VrVRmQoyAoZG8sCMx/O5FRCrkotUyzLEq+WWtFeUUmOxN8xZUQh
	 0HFd41ds47O61frAgJ6fYyKI7rFwqV7KHdmpfwIEcF8eIPUebDRfk1QJBjT57SzdFWETB
	 T4jLVGiSVVyo8aHXIlQzDkeC6JxCk5fp+N/8fpe1KlgqBkPjwf6zVCNlqWC287OqA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
	b=gacrz0XxnRVynCYaWADsXrMz41XGBGaIgJoNP8lGFadawhK0VBErb5Gl4mW+Pv/TMkpO
	 OeYSQ/MULbYx11wD113GUMKjhgnNQg7V0m79igkmsYuublwGzmUuWsIyzSG24+gdHg8bw
	 mbmHnbZRjC60vx5gKfSSD+1MXltwLvJ70o5pRjjpxRHUjwUTttOO348/JQacmY4JEKRbX
	 5+xd4FtoXcLFoJsDX2OG11IpTlZjo/Rtouq7q7gAK/0H3KoCo3Qlvn/HxbgD2RmZFf4Gk
	 g3j4nzeYE3/vz2CkyKpI3wBnDSF88AEcmk5S5UiUqjSh/AQRRwEm1LlIXzDcl5d0YHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXqUHQMu;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD4606A8AD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DD4606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXqUHQMu
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so661020a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828462; x=1795433262; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
        b=aXqUHQMu84q9KhosXOB3ucirlzx7ZQGNufrWj/vuioDZqQMBvQBOD0LXtBQ9uiyF0F
         1bpagOGT1NRYW9t5sepTu9gM1+HSAf/Dj0r8fFEWJwV08/H0YFOlHaqYsf323BkeGc4U
         H9HWxrRaUzBRhwAIbKpFyz4iq1V5EgBns9TSOLeqdHRxocyu4BEDF005hz+k20TS8yCl
         X9aoOwO0K+/t10ZYh//D5XtQ8oWXpznExseEJHrP6jWCYG3EKCbs7oZAyDxIJ/TD4ta9
         5UhYk99AsICi++yFP6tpoJliGNoLla/cJH2K9K6nvaCRsKzJN6W072doTRmHWqHWYELd
         Tm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828462; x=1795433262;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
        b=CKMVXJ5ABvBTFWXKfCj0sTgkK+h8GAN7NOdDJlupio4vvW0dlE4C5QIMmgm6i4DIo7
         ilCnNhsw6vyy92DnFv8FeCXpEzGEqdurEGFVPkpO1pMtNxiDjcfVDSuaKnI0l9edsuZB
         GkWByapsA+7meE0dEa6fMZzY0+69/9GhHrxhQY+JjTCLBYaRw2RxzK1kt9oFgqXB0MKm
         4JF+NZq7/2gUzA4B+piKtaDcJZ1jhyDyCLs30+/AKrz24/JJii0tBqBrTRY7jyLEe1nT
         psAGHAQQSRdNo+Mc6w4L3hWW5WHvNhEfBOfF5kVLClYrZCPY78DK9oDYOyl/Tj4SUSZF
         b05A==
X-Forwarded-Encrypted: i=1; AL+hErHhJhcA7VTMw+/uvChdTU32t9sWMSr6q7UvnFrqKTct4/jfDGnFDfr3vOBiqW9ocp7LcrSYw9K6d5EQCto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NLBGfU/6rVB2a8SHa7mqynI8L6hLDhPA/XByl+ayaC/Qbq5Jn
	9biwLpQHuLEpX0cixpc5pCSJsvm8VWxnPboxbc3qNgZfLI73AQyOjUi8
X-Gm-Gg: AZFdTZcWkzVE4Fb2xjqg4ObjAfm33eVrR3mcdCqkcF6D2gQWNfxqt13BqV9IZ1PwvOa
	ehWUuKRS7oUimbU1QhcQZkX3i6KxAtSHo55wxBsaSH3BAbpZfffCAdE671s+fyF5ibymNuwQm3J
	f7eblEZlFz6dH06HqM8jLb7jDr1m63H05Ot0aerfqvobbJKzJcU6jpSGN5R4ugQ9+7DmAUyADgm
	OYu5WVveHAFVdfIGzhHpK879sPBbl1m9ZKCqNwCPGyrUApchi5IbPXUFI1PLNyS2gUJ6X69rQI1
	V87Xd3xwrnDbVfe6v7Eh680cJojttPXYlTqmYPuzz3SLCO+gSP6eiOXz8jXf6aFMFRbi60fai+/
	d8octhqA/MOIMkyKrJ6OC46315p5pzCGR+h7j11Btc8VOERLyFdcWigLP5exnxjFcCUhqZX+YUl
	yw0LTu7716Y7Oeuq1vk4M4Hiy3SuogsUlcgbHPGrtF3xVQ9fv+I4LH2pftcmgRYQWMNSiSGvIKv
	NC4asCFgFSX6shs/FC6SJ1ePc++KDh7HVLeDbTcbronl/X4RU4iZehr56gZ1QUmvDMcA4rVN5Ma
	X17MW53206CjlKMGkuBN5LehXmPFUzwIVtw5zdk4d5MbrNuKa03viwl1+aBi5e7ymoIFy2qOWe9
	CwrKSqPDzdiohR3B0+EeHrekAl4q09aJZTz1pPKfgr2JbO7xUD287SvNGCMPuzA==
X-Received: by 2002:a17:90b:570f:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b1b0815b4amr10210516a91.3.1794828462318;
        Mon, 16 Nov 2026 03:27:42 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm8411247a91.3.2026.11.16.03.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:27:41 -0800 (PST)
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
Subject: Re: [PATCH v2 0/3] mm/damon/tests: add KUnit coverage for age_ms
 filters
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 16 Nov 2026 22:25:52 +1100
Message-Id: <179482835290.151538.5686597403158226303.b4-reply@b4>
To: Jason Angelov <jasonangelov@ucla.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, SJ Park <sj@kernel.org>
In-Reply-To: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
References: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
X-Mailer: b4 0.16.0

Hi Jason,

On Mon, 16 Nov 2026 03:06:20 -0800 Jason Angelov wrote:

> The DAMON core tests do not cover DAMOS_FILTER_TYPE_AGE_MS. Add tests for
> committing valid and invalid age ranges, identifying the filter as
> core-handled, and matching ages at and outside the range boundaries.

LGTM, thanks for adding these tests :)

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
