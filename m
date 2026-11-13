Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575004;
	b=MO+TmggUZp8cd/edmkZszaGJeZvEjtCa1lA2gbTqnok4KD+ifj6jkJAd0iFem/cCJy7g
	 OX2fsJrWe4v0rvEal5WLcYq2ZaJGgxCB9j5ZJ4NLcj4b9P16uFSkly7jydNC5TEy06k5t
	 SS0T9qcH2IfGipmsFXnKC3+etqda3lfSoxozy5PSOyec+qb2W/yaGINPWDEg6lV8P7B5D
	 BcMrmgbC0eUeNAzA090fNKY819ULliLuchMkBTyDU0IHtd62WehrRICE9cHr5FhKRItM9
	 uP3QnqU5u7deYVQUCAY2qpF2Be9HjcSdBYOepplvRMlv1nb+vtVZnYntXgcTJRt/Yzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
	b=SmCSZX3tgbgWRz3rpuK+HZzW8Espt3wz2+0QK0f6ihcAUu32WQv99vjEISBxr84DDw2o
	 EeUahNMAUEFZZ1jdpWCsgqlB1j/R9r7bmirPSUWO82R1g2AbvY7wiUiPTVXtyF5RN2bga
	 3Wlxn1fP30FlepimZ+PYFZ0FjzdP6QeMjLlkNFCSpNkWOhQwDBoz6wX46uKbBkwkq314Z
	 i6lQhe07+1Ii1XCmWGQa2Hv64PRTUpC2AYIsh0Saszh4xu/t3zqh8ZG6RmqsV+dFC1Ed5
	 rXAjd+1Wni8xWLiV84oOzC3JCSQn9ZrW9yvTZtYkQ+pRTgEMC6OghgOJlCVo720FzMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56951606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56951606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2047580a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575002; cv=none;
        d=google.com; s=arc-20260327;
        b=Zk9b+e060pIpCwyL5Z11tlhZWfHqNYUN4Dp/gruoEqVpsge/921LSqUgciDDULYyQC
         tw9mIaG1kOlsVrnEVJPCQJlFrLDlLbaeZTmYSbbIQvO/DlPssLdfPXnYANlJ2xFpXhlO
         jVEOL6GgfMGIXGmxvI2kB/c+JGkvhh5QKOtp/Il3AzfgInKMODjkWArtY/Jn8SbITudq
         /iF6fYmUokD4eAcVf7197FKtDj7gtzN0J4Nlq9pCdNT2SujbP7uYzteYV1t5FEOaRhwA
         yD33OlOy0QKa5+Q0S6hFGnCsNFPeUHhtH/Iz/kGwG/9JCS4Dn1Bzu+x7JSuxcs0ikU0P
         3yBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        fh=pX8mft63RufDUbaHv0kFBDA8EIgLDxMo+KzI7yiAPVg=;
        b=hzC1u9rIh5EKw7YyUC9F0reKAcP3RYpl/Zyv/DZKng2Tj9O/IKiy1YH41OINWd5uBP
         Dq+pQHwSOGOPL2f33aIzulwBCn3ghJB6hJ/+TdpcNUKTFudR/ORUGI/RL3Tgocrq6fU+
         zQ7krI7WiaIRzU0+qzM0DRqi4Qz9acSaGhgHCKGImfujStyEb+qe5aHt+6KZEt9jwSl9
         FcR0iszRsUaHtvmzLMk2tGBJ3DdlZePk5t95/FyZB8NCuPMANzPMVdbM2zNbvF9p/ImC
         Qz0Nk2B4jODGpD/wU4X2n5OrvEDm8JOmn6mu2DEyy57j5Vrzti+IY2qRzTRrvt+gQtK3
         dztg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794575002; x=1795179802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=aJ5s+LODrTBmRhVW9mdEBuV0ItjC6oE9WnU0EAlypd9HUuGd33Rc9jHB0ESw55qLVE
         XCHFjKB1r5N8neiJ9MkAxutTT1CFEwL1EexRpPanr+PWI0CLkLZUvTvsVvTxN6blv6g8
         rIek8Vm3FiaW4AzOw7hRkyyD2IOjQI0n1C6iMlUMin4QYzjCbRbbMm6j5pXCwSDAOA1/
         Pl//oWlOy1pK3ECO+xlcOdE532VuYbUsD54UwyDhX4HFHx0IflHDnq4yKGfDbgTzCN24
         fkcSziJ7sCoIKdYIj4YfCbDXBjw8CbH9PrRIRffFgxdKSHpvAj+KGbH5x5+Fy6yaTLdp
         oRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575002; x=1795179802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=XjleJjDQjhqZJNWswTjJA4XJ8UTgVQ269pi205fVDHMLEQufT8NyJvibmkN5K6yWKE
         iCiZ4JrAVOIwqNyabmyQmWrrpNkB5kZdm530QWIVADic1leTUFh1atOiIR1AoZY78t2A
         jIRVON1q2RVfiKJxbIGbxZQ0akKIr0XVxwace9MIc+X7t4+xWpjrRl95ORooVGkA9zBs
         VXA/ALo77Cb4UsOZH2gf3lSIOKzmh8dPteLBTMTfoasJWDvqiUlEbLdfsfY+fj3Pfe4A
         GSjpLkbz4BgsqvyUKSbxni3gIQVudPGZbERvSYZ+PQMw0/IwV9ulbC7pRD4M9jkXZAGZ
         p4cQ==
X-Forwarded-Encrypted: i=1; AL+hErF0g0Mu4uaiOc0spYfbKhD//A4ET1Hg40wPnM7IQwFbHXyrwRnbvIz5sVnRCgVcUMdbIkO9PiLNu5bnwls=@vger.kernel.org
X-Gm-Message-State: APuU4Z87mLBuWGC/8KK8K8zhR87Ygh/MO+zg19knCdcYGLzb0hpBi0AV
	w/pRZPT8B58ZgiMHib2JN1zYCswzq+X5TuTufeDuK1hH7P47osBetb/vHEy2XGCLfWU3U+aFNvD
	lXW6ZYmMrMONyXoTGXXNRDhlKzuHyqq3Hyhd4UvI0OQ==
X-Gm-Gg: AYBFou13kdfoxLLSqOGPBSvmN0c0MI+DwnEfPp5oaE66Ti3xpoBzEORKQcnxfm3dijE
	0mQFBd8UBk/VncxqI76BnoHhwB5tWe+mv19oOMmrZdrR5TIwsGaklj/n8pNfX6/2GDwfw2FH8PV
	grld4LOJHz3Zsgpbdj3Fl/j4yDNMhreGeM1ajFaSGeTjVF7kgnl55Q2eF7xVndTtx+lNuI5ciA8
	w7tjbXzWy9ZLFwCLlTMlTJ6rOJGJ8CWo1cfCEfRaJALF5dhML5vledBz840u7bivN7WVhVilsn8
	Wu+29gD1yym5aig/ZLWuScLdjnGnytEOYQ+zVjB2RPIrY1tV4h3a2hS0chzSgfbdUZ0KjAVmjvR
	41r1/bIrneZzMzBScAadopQwfqrUSL97d2aLYJJR+HCGFSWMpYTQHXacVsYF1lzcBb9w7sYsmG9
	TECoWDqY4x7atw1NQ=
X-Received: by 2002:a05:6402:c517:10b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b7c08b0a8cmr1544223a12.5.1794575001558; Fri, 13 Nov 2026
 05:03:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-11-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-11-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:03:10 +0000
X-Gm-Features: AclHuK8TI6TajdXfbmO4ZfXjIUyzkcLZWaP_zfTUGkQ09RFX-UNUsATe86j4dT8
Message-ID: <CADrjBPpUGoWPfmS1Ne6=KnXoGM_vc_X3510xF2zwmqKkGzms3Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_USB, this provides clocks for USB
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Same comments apply here as for the other CMUs in my previous email.

Peter
