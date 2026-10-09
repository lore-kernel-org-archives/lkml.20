Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FF4F054D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563749; cv=none; b=MBD3P7cvmlRAGNhCka/ya6W+sGaoBKxoPIrU7b9KwfHh309f5xIDS8Zs/CUSjCG/n8QIcTDMI9ha/aHKScKGnyEFJUqONRj7XnEKmJDqBpgVqzXSFNUQAwl/v+SRKmi7EYQAQvO4DjibBtDbg/vLDQZKPD4z1Y4OujFVzK3o7pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563749; c=relaxed/simple;
	bh=hXThr6zhVSCw7eyzumaxd3t+XIOLHCoMx09cTROxa1I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EQaC7UlZs8OqHlchD9RCxEAFKAuq45/U82nXUWKePk+bSp59rJgPG11mwJ1QR4Sxr3p+cpUw5l3JrShfbctUpGT0Lt0b2XLEklsIhDRc/NJaYvFAHh2Z86gimzsUpKIq+lnixuDTXaydiuHPmGQyR1tcgnAAoDLLn078vB5Nsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FOTwTALq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FOTwTALq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso356875e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563743; x=1792168543; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=FOTwTALqzVIKwAUtLI0o5un7ZgtMshMr5eUC0kSYb0ZXPIKugYCEfjrYSbU/Eh3XEd
         Kr6SEt0eDWCFSTwbeqImhMNeMLXpgJYGnNZEoGnYHEnhpw/0idrcAPBhv4rXJ2D8LY+C
         CogvvTaBrD8uoUhL+bMyqteuRFqcTWVUNb0j9CLxabfN6STy3kpn5fEFY18knsnPLVkz
         udfrR4eb7BJSw/EbJG+V9FIrzdQLb0S9CCPIr22iU0MuIQ4vxe0jEypB9GCTiLosdoZ4
         d7CJa+EbpwsgHZl2H4142nwmkAKOP+muUBug8cOmLTlqNXFkGp5hi3tk79TTFFAaD3Hl
         C/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563743; x=1792168543;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=n6owGPBtuT5drQpuQNaOt5YdC5pLcyQ7HBppFEtOH/L36fziiX4PHFW1rb6rZrc5nk
         aSaS/S9vBJdLMVp7jdEmio7B7omzD64iUb1HflGKfTUxSYIkS4UedXIO3xhxm5QCeTuS
         wvX10Rs2Y/Y1YO/wZHxkoYilXJIMrwdOjAAGI84hC2g9v1AByFnJY8tg8dxrHD/l/fp7
         VoHuP60Lt4rc9q5EstrFriVW64okc7pVEwOMRHdtX75328skez9bX+IUCM66BU4ytvx0
         ZjJfu9IiCdRIBSA+BcluGCHMMcE4JaftuiygYaU6jzVGpbjpn3ChLrcn8xXemE+LphfT
         Pp/A==
X-Forwarded-Encrypted: i=1; AKwUvBz9FTWrc2DLYc1OyEzCPTuJearQWNnicV2sp2vUX4ZxNhz1PN/qqqMZgYJ+6ucTaVCp9/JjdWJKxrkB1RU=@vger.kernel.org
X-Gm-Message-State: AFuF++n2WLhI43PJ7mKJLGRMV5WAXoYRj300MctM4zorcrcKflV3yXSr
	XmTERKJf49Oy1qggUhwpSm8TLumi0wZuKKm+Sz9mfo9Lx7rpX0gIJ2e3f5mz3cYyLf4=
X-Gm-Gg: AYBFou23203RNDfyW8oNkcj1y7M5v/M1KlQXL7nwL4eTjieESRKkSoHEw+Z78aq4N1F
	fSf7bPWsTSaS5861C/ei27GmewR/PfPrG3A4hMjYBeWkyUQT+58SO7HFHXBv90d11P0hpPNJgQl
	zN6NEJbZX9MPMudBE7EOikIt+mjMzYSlSLD9e6+bg4rAv4XkyHz1F3TofyBchK2aC0t9UgRD5lA
	caWTN8RsobVbgxJ+nCjGR6Wa1ERwFD5p1WLZHpu6kx55QDM9as7wHZCaX3ImhUl5t04LQF7O69c
	YYtxGmMhfJnaPWNzggFiE45c/nVupS/fnbK1u9o4/N9ErfZkTqbuZNKZ0ZRSfNhlMdl7tnt4KYY
	ywmlpNtXoqT6+02Qvb5XsXgpXZaYNPQRfmzRtddDDCp6JODpvdh3vYGbx8q5B0HcM/o9hiPNcqZ
	boG6hLUrVudn3ozYXzqVHNO5ZyeJ5MXQF04Sj9yZnmgmmmS3+M9neFgJubn68Kvs2gCIxpti+as
	/7CpUlq1i52MFG9lQ==
X-Received: by 2002:a05:600c:154c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18e4aa310mr46374285e9.17.1791563742740;
        Fri, 09 Oct 2026 09:35:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf0abcesm77676145e9.1.2026.10.09.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.9518640684856472728.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hXThr6zhVSCw7eyzumaxd3t+XIOLHCoMx09cTROxa1I=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9c4Xp3chEv912jdY0Lyx62bFlyooVrXsa0g8q7m
 R3Utq3p7ihlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE/mQz/A+f+3KnCVfj+dMr
 2jxPsrd8Ldkcxnt+f4NZrfZUgRUe8U4M/1PyMo7YLTddV/+/96D5CjnH+z26cqflddy9lhuyyxX
 msgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The MA35D1 ADC clock divider register implements a simple closed-form
> relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
> by building a clk_div_table with one entry per possible divider value
> (up to 2^width entries) and feeding it through the generic
> divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
> Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
> set_rate(), and drop the unused mask_bit mechanism, whose only call site
> passed a bitmask instead of a bit index, causing an out-of-range BIT()
> shift.
> 
> Changes in v2 (addressing the Sashiko AI review of v1):
> - Fix a possible division by zero: 2 * rate in determine_rate() and
>   set_rate() could overflow for very large requested rates, making the
>   divisor zero. Rates above parent_rate / 2 now short-circuit to a
>   divider of 1 before the multiplication.
> - Fix the mismatch between determine_rate() and set_rate(): both used
>   a ceiling to pick the divider, yet determine_rate() reported a
>   closest-rounded rate, so set_rate() could program a different divider
>   than the one promised. Both now use closest rounding, as the original
>   CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
>   (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
>   range.
> - Not changed: min_rate/max_rate are not checked in the driver, since
>   the clk core already applies them and the previous
>   divider_determine_rate() based code did not either.
>

A cover letter is not strictly necessary for a single patch,
if you have text or changelog, you can add it after the commit description,
after ---

-- 
Jerome

