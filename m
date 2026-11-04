Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800018;
	b=ZULQNYNzVDwbMypRRDpGyi+yQrrSH5aZnNGl176WOJgGvP5VIZmsRC3ZlGEyiyEzEoZc
	 oXnxlrGD4kWpbcJthvMXOalln1BGyVmCUFG2oVfPuNfakUw9A0Q05jpHUB324MyQVZocL
	 e4ZqmMN16TGn8C/uwnFsqBvwi7ioyBscPc5H7pWmY5UndUo4Q1Himuzr9MAhZyq1D2Mdd
	 LBs6xEG6cAECi50NsM+dYqYtKKbiHgOFxmS0RTNL+cyQBuGTLj4HYWW7fL37iWgZQ+qsc
	 1jFL1cp0YXvtvqnHrobIOusGs1gtHs1EMgz70Z6CSZi/G6dZh1E0Aj/N564tFYeUa5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v0NPf7uK51C+NuOmfq0dUsG7uocw1sLSSOEDM1yf6wk=;
	b=UT96DHdhdGtoqOu2ZTk2VptABVODZnmwRfj22YJGkIm8ZZt0aVboHYDBEiUSd2dhkOQ+
	 ZwRfRtlD2RBVANTdTUEyoWaJjw/gyzcujBsF7XtuM0llSQt3lmmfa3BQ7cuaGS1EWnQ7w
	 qEylYNtbTjlZl0f9XrO35puk2GYWz5leqSuo/mCCUCyxS/YIVU7IPmsemAg7jBMds4xaa
	 ZsNejjElu+ThIErdOxVeZXwAP495+LiTPdlZNWHycAXX1CwkdmMR1ohkX6fdvD7bixYmO
	 H98eOhMYIkyoRiZwu8uYBcKaHkzGaqam6HFf7qnXjGtE/nSyjkZhnrUorkDYR2iETdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihjL52O0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1566F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1566F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihjL52O0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8c028eefeso1106515ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800017; cv=none;
        d=google.com; s=arc-20260327;
        b=CVvqogN3m4ifhuOUGO5jN9NEZROH40cc6js331L1k3MyFQIAge/mKAzdEcY0Y320+0
         pnjVP+BqY9RwUCa+7xw5pAgYClKXYbUEezdG71C57dZF8r4diIhnHEiGqK9sCLwEpVVF
         xsXgvg2ejZHmL63DpvxbSOgcOY/GZ+z6KO3NyzUVvpDHjueRs8HzxbtNeg5W3D+8W6ja
         FDqtgjPJO3ZEOG7MAUFQ0FwuugfZRaR/7IzJImCwvMj71nzYPYBpdbQ13A6oO8lznnq7
         BWeF3T8L1+e60qPVyoBYAiC4416WJoWNPtkiC8yL5DZVPKG0sA0K4XJUV11+/ldUsQHY
         WnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v0NPf7uK51C+NuOmfq0dUsG7uocw1sLSSOEDM1yf6wk=;
        fh=XX9Pi5wwYh+pZ2tORMNmZv2KgRjfoRufg52j6PdQPpA=;
        b=HaE7CKvLE6utg+IoOzQ1nUY1BvV6f3rVVOoa6FSxLao7440JA06ig8jE2GaeYuQSHo
         fUSU657++xam/nrExSXKEtTKXC6YWFUvY7dyw0LZ8qbFPEW5ULy5j29DLMm9kN/7QnZV
         gnN8SVGcItoZRgCAtifW9QHoDCAYgydQJfmi+4yycEAL0eCBv9bXLRxmLF4NeKPKBMyV
         r0oAP/0Ca4Oc6KgibD3BL6u9jJooMiWGwDxvXzPzaVFqeDFQkh0w9VZkMVJo0auh2krT
         hkSmVaoRTtH0weAJ/aJ1wnd3gsqe6gJOes5mK/MiUgpO/8tKvK8OjKArOzhAHbx8cU1H
         94gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800017; x=1794404817; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0NPf7uK51C+NuOmfq0dUsG7uocw1sLSSOEDM1yf6wk=;
        b=ihjL52O0skRU27mZA12gv9OY64lPiLkGxCFfeu7jBzNIK9f9Png6CsthAr4W8zGwFi
         G6Z1OqUsgWGMaSBARhoTyfGnSuPHH1hn8Z0W5atP3bxRFQ6Sp/rxG4dx2SLVIuGyfGz4
         33HUthHtECsfTJdUWVNzWbUijLTg1rfFmGn7mJZbZmha03HFNFCIkSQ6QEoI77W1O8i7
         dxKbU0C2RhYMpqd4V6c4RAa3jsMi9amjvuBHRjVqZeJtoH679Y3Au5ZBQdKg35b7+qc0
         AQ/Ud3ZweTCnAd41awwQHcXF69swy4Jgeib+fBC6lOOmNG4fbSDiAHc0vVZ7/hAW1AJZ
         HtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800017; x=1794404817;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0NPf7uK51C+NuOmfq0dUsG7uocw1sLSSOEDM1yf6wk=;
        b=T/24C2q5okzMbgpJd5Ld71J0k7XCB41kqgV9fXfB5OKbVjn/bCcIhkrwSONkJlMT3d
         YnfkIxAWmmjm1Bvol9f4Aig66IjrZwu2bZhGtYcxOT/hDRbvMhnTCpS208Mda7WAylr8
         f23XTbYhxWWJmKG0TqQY/yDuLTAnnNPmFE1Nqqg0SoUFFHrpmw3waN8M18TAF7UidiIc
         Sai0mal8S+3JoCdFRmsFisSlz0sVpr7BpsF2LOm2L92dKMPQeCCOGHTCvDvK6aKQYrYP
         x/bQ3RIRw20DlqKw40SmSU0ngsFjnn48efP4B08j7cLPc3N1jbi8x5FKsC5S/EN00l4T
         teNg==
X-Forwarded-Encrypted: i=1; AKwUvBzqFrLhr1ZAP5kLz/HFU+acmfDHSde0x5SKgFAiSzl44GLlJDcvJMg4LDUJSpu2YTSUArLdFA5IVn5o/i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HVeDL4UYDyy9R443RLKNR46Tk0xzfbP18l+R08NKr2QWFNXTV
	xPSX9Pp0k6AhFtDVt5MP/funHAbhq8O9MfJNkt0YlAK9UamoAwEQq6ZJrQePbVkoQNCruT3nhtD
	YRBowrfu3tfMJdoRQW7jD+GuGCx0pznA=
X-Gm-Gg: AYBFou12Q31ImjnjpkNfefgp0ARGF4/xsKzkFTMNjCDrc7I1REfYwoDL9l9d8HPI0NX
	KUBLUPEQjp4JfQ2OoLwXmvant6hr5N2OolDoudaC7hdwhVRujQzXrqnJkhk3aYue2NP4bNn9iIA
	+cPtXqtJsmMOw8sZq+3hSweLHWZChxNPIr3td5/KtRNGp1R0XjNZjoDZhbzm9Ixr7ZyRewWZ/2l
	FSZL3kN8JQmwyaY4UpTjac9UciBobTjWTnvs82PSKRXarY4jOTHOPRpNVcjRKxvvVXrDlFJ2ttY
	ftVgMKuuphRg2D6+o14okyCcrNI+h56cIzbKyNvCJJ+teqZ407E8pEFzXYjMu30cnDt82YwyQte
	ykpDSF7ClT+ZF/YKxMNfKgClbILJZ2MkWxVlosA==
X-Received: by 2002:a17:902:f644:b0:2d8:f4d4:7044 with SMTP id
 d9443c01a7336-2eb364ac899mr234912175ad.3.1793800017381; Wed, 04 Nov 2026
 05:46:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103174911.1600930-1-lui2012qwq@gmail.com> <179379596607.2456854.2339185330606278000.b4-review@b4>
In-Reply-To: <179379596607.2456854.2339185330606278000.b4-review@b4>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 4 Nov 2026 21:46:43 +0800
X-Gm-Features: AclHuK8QFgSjlnkIh2jmVtX_lksuV4gAkSWDxxHqNDiGeOkcAvuVCuc4ZkicWFE
Message-ID: <CAE=Q7=4-eyygfMRttGqPDh-d-2iaU8NojQBr5gJWniTZbLJ2GA@mail.gmail.com>
Subject: Re: [PATCH] regulator: cancel disable_work synchronously in regulator_unregister()
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 04, 2026 at 08:39:05PM +0000, Mark Brown wrote:
> I think you want disable_delayed_work_sync() here for the rearming part.

Agreed, that's a mistake in my patch. Thanks for pointing it out. I'll
send a v2 switching to disable_delayed_work_sync(), which keeps the
work disabled so a racing regulator_disable_deferred() can't re-arm it
during the teardown.
