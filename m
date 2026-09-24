Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFD4C10FB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278881; cv=pass; b=MOX7I2yj1Y8t0hOlpjK8AA4Arvhuv1tmfcvkvfkX+cHcmfvFOjOkiaOU8ODHyKQag+Mc8qncd/Bwa9N1AmNAk8LgWLcyD+OfMNkFnjmn1xw+BH2agUNJrKi1EXKlZzmxpHOHFvUX2aYzJOzWJGb6sfQc8+QTbiVj67iCg3GnY34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278881; c=relaxed/simple;
	bh=bgEUev2/WA/xtTv6tfLEW2vV4/QUHdZ+xHOitzvHWxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERs18ppP6qCrFR29I7NQXOrpP5DW0MZq32vwVfED/Y8neePBB6CElAT5UP6QU3aSXnQDYjRw6qGmn/vGhH2Ly/pm04kGDXiEZHWVTvspa8Y+1bYv9irByXfkcvcK26eAQL5PJU1Ka6EOU40pu1cX3S+/e8lWPFsbP5T/5Y4hF1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmMn9C+o; arc=pass smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmMn9C+o"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso78149f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278869; cv=none;
        d=google.com; s=arc-20260327;
        b=Rv9p3dzNVGf/xlJ0eOTd/G00QsiQwVuF0uiVs9dMaR8oS25KUAPpmAfV8RuhUNCwut
         93/Hd9/IPN6QsJUTKSh4D5K87GpSYuDxEakQbsiulxDuxX1B7DDi/yEo1+HdGWrdlJRr
         d6oNeN0kcB17fuOGfUeq6RjdnR9tN48/s8Uerq+n7Unp/iStpLxj/xZwRQDMf6/vD0Ax
         FRW8w/rnH1cJ6XsYHOeIW9Mk8/NsHf+Q8wcJXHjLqcoOKcTmJ+egnV5ZIjdTebx0WVF4
         2kIK8JD7+ubEmsCZlu3EVnVHWr+w+ps9YWRLaHVAzIZnWECFgQT9x9sOYR2dlJYOwrkZ
         h12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        fh=keucbURrh2i8VGsmvJnmCpqX1cD0EspwmzfPsqUlqrw=;
        b=qIjAgdmGCf8xTwU4QAGFxGTufQmrEOAeUC9716Vmh8B7ssx2MjsEj1MgDtNx4IaTlG
         OqkOZqMxzw6f0UFahh3UKtm1k3n1k5aZ9Oh4Qgwzwhafaupp4Z0owoY9vZ+63Ew0FYyE
         y86OJRelNqOtxzy8IBpiuMwNBY8AkVLBKKZWgNni89gsYvzyhSrQsw+LVc8MGznb3oU3
         ETlFQhWuFDMXd22A9Kd6sKPHgdhwcEtZs1QIE+3Bg6PQBnDfOrYdB903atDGfxypGUu3
         YWg7KnC0Y6x7g+PpaAfmQc3KSVWnQT8EjVAZLXCiaUrdLVRuOcwMah4eIlIR3QgoKVmL
         Sd3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278869; x=1790883669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        b=WmMn9C+oxJ61uKuUc3cMxu9RZF2rwLj8bUxNBvv3JbD//ikt0RfQrk1gBdMaM00Dw6
         OvaNe/i62s1Nim6rBQTMbOu3W4+dxXRBRZz0sUNY//4u4HGCeQJNB9c/j2SbE8pLOCEy
         rb73INsv8mgsp3pIn+LaxkroNcIsyRPIR4HytzA8k9lycLOaFIE+azyy+hIeh3cxeTFD
         K1PtPh6pJM0jEAc4siKsJQwsn5lvuE7FY6IjWvcBjnRVk9cDKXBvNAgwzy/GZeul0EqB
         pywIg+8S7m1ALnyKiQSBbSQB7vLmfMNc4AAn5B6rWg12PvJ/HJac3LRqc3ctqvgd2U+v
         ILkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278869; x=1790883669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h41Xw1fnsOQR0sx8RF3G8IgCDeEFjEbkE/RdEqTN4CI=;
        b=f7VYpxonXLwPqC0O8jDiN0FnMsPZ9fMmB00O+ZsPPvZ6eZ6+VCRO2H3abQ3QG5qn+L
         n0clo8fgKtCILB76NZz9yNot+Um3G9AOh0ZLZ3YUTm5MfOmQr1ZDtZ7Fm5mgGgjsrYEo
         Ah++ihqhtNvIz1S0bhKUKU+nnruVdkw4ntQXWpSVrbYZi9kATZP/+7GYqe+yLpMWgPuX
         knIGbslegARtzPPbfFs3QZ1gmdhya77SfE4n4HF2rg4sh4jhGzFmPJX8HfSqhjl27S/U
         K/zNYKW3LtfLl3cAkl3QDCOF/ccWLWvlxjcPARHLbvIOIYGRPCgkBGJhle31334qHF1i
         vokA==
X-Forwarded-Encrypted: i=1; AKwUvBwHWsn9yIrGPpkW0U5uurADLJlfpHWVTt1FD48faChaeZ62U8jX44TqmqibNpXAIjR1iuVu/+no/92tk60=@vger.kernel.org
X-Gm-Message-State: AFuF++kgfgMIJyS6XJk+/JvZ2Pk+VdRi7ElAqmGW0uH0u05MhjmxCEjw
	lJ9+QV2tnQAWiy0XZ6L/yJEraykSoCIQFopFNkwdju38TWJNdHtlQdkdqD3nUW4hrCnOFuHeM2E
	Qyk6GzkiB6P0J+pMVRKjJmYSlnLyuUYOdmwUubyrORTrk/3L+wSjthBGuKg==
X-Gm-Gg: AYBFou1/faBrAuXWbTJ4oOkRh2JXPPgE+d16gSvEOM0bODNdBBAGaFDjgedPTg/LC7P
	e0sbzbfl/PlgdbM0CISv5xpe0mVI8PSSg05sojb5zsTU7q7ew0a3CHyFCgcaoDoo/6xX3Opsa3g
	UebcDKRYEgPcOLhzb3TD9WCYQ1AjdkmpsO0XNBZJo13Nx8u2P681r7msAVf8N/A6K96fO2nBrFS
	Vhhgb/oXbDAs0HXSLtvCWMDaaYilcBHCQo8ZK0H1Gn1icCO0nXF9Obxf5GA+wbcn9HjNcl9ZiwS
	sdIA+iieeBYW/B4O1f1ETv9g4lqyR+A55s7EigbylMRst8K8hMBnAMVTnMt9ujqwjD5iKfpnedc
	WWqdrtlCeJhvMrN2q1SODeW0gd73iKPSh8CIPxdlVjxG+mGat/qCjYGxGFzk28yWAdPK/iM7aKv
	NyNqB9daU+WSsdsBU8oQ==
X-Received: by 2002:a05:6000:2004:b0:487:ffe:7219 with SMTP id
 ffacd0b85a97d-488716f4324mr6632733f8f.27.1790278868680; Thu, 24 Sep 2026
 12:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
In-Reply-To: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Sep 2026 12:40:56 -0700
X-Gm-Features: AclHuK_afT3ctq6aSy0pVcz1YzUDdQbAo-wmNktAE4b7mg6mDhHhkzG2dA3w-_w
Message-ID: <CANDhNCrE3dkrE_251o52z=igoOFOhwg=u0284-DVYJABBBLPvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests: timers: count what tick is worth in the
 drift estimate
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:52=E2=80=AFPM Eva Kurchatova
<eva.kurchatova@virtuozzo.com> wrote:
>
> raw_skew measures the drift between CLOCK_MONOTONIC and
> CLOCK_MONOTONIC_RAW and compares it against the adjustment adjtimex()
> reports, but for the latter it reads only tx.freq. The kernel takes
> the tick value into the adjustment as well, worth a microsecond of the
> tick length per unit, a hundred ppm each, and a time synchronisation
> daemon does put the coarse part of its correction there.  Where it
> does, the two numbers cannot meet:
>
>   # Estimating clock drift: -51.724(est) 48.277(act)    [FAILED]
>
> On the machine measured, chronyd held freq at 48.278 ppm with tick at
> 9999, so the correction really applied is -51.722 ppm, which is what
> the clocks show. The skip for an externally adjusted clock does not
> catch this: the clock is steady, the offset is zero, and neither freq
> nor tick moves during the run.
>
> Count what tick is worth alongside freq. On the same machine:
>
>   # Estimating clock drift: -51.724(est) -51.723(act)   [OK]
>
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

I've not closely reviewed the math, but it looks roughly ok to me.

I was going to object that I thought we nulled out the other adjtime
values before testing, but I must be recalling a different test
(adjtick.c I think).

Acked-by: John Stultz <jstultz@google.com>

Thanks for fixing this!
-john
