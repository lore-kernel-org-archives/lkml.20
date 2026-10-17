Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AE3B8D48
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206806; cv=pass; b=LiWGUKL7A7qIVeUKBcw49L38j8qnNV4h25Ifi3lm+hwc67y1MRRzKqq0Fje7SM+W3JWOnDgHrhX7LyjIlQ5d2lhW2cst983C9OlIz3/CtrhXkoFcCYC+i6KlQvSglSuUoeDky0DmZO05F7d0tN+/FqINIzafiVITtqVFaFJMCwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206806; c=relaxed/simple;
	bh=AqcEFbz/zS+lJVauCfo1Ltgz1Ixx8sqngbRxS3SpVQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVBhUACzLY2uijZ9t2v+AzEDifJkjriw0oTY+mkxJrdVFO4XI/bmG9Sa3AOzCEwHbUc6f2k33Gmo8mi3V6rKUrWsF6ndKLybEhrOjKaXVJrztO79gucyNIpdyftNUm/PVod7yRehXOe8t8aL+Y0m0ODh0KM21xwQrob2tCKWMp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX7T+Mch; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX7T+Mch"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so4238931fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206803; cv=none;
        d=google.com; s=arc-20260327;
        b=dCz83YpgsoCcWLTRZkszv3BdAEcEFrop8LFQ1qyitTpiBxvDLW72B2FNMIozTzMm15
         /eAw8A3HKJLpRDP39AQMLtRcvUr3SuE6Wn1hbQ1NXbXi1V2cMIKAg/Fx25WW3OKcW1vs
         Ql4mpDXy87KJZXC73wTojG6QI2HTRD6AyePmKrQnMS68krUQ9R2NDITZ9dxl4BUlt9WF
         Pb+/OCAgpzMW1L3kyMQqAi31wOyPhg205JfSvV3Ogsra+hinlZDybjbOII2OM1igDhFp
         6dJAjDD6HsUhvCBR7CjXZ8zWf+Hp5Hvyen7RXjwACnI220KCKMj3WU2rXPZDDHIKHaNC
         npKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        fh=zlL3XBXQ3mTLJAjetwR0SldpwBlXpJC6FXP9pqatMFs=;
        b=GZlFNWA+sMje53hlyJBNckAsT8+NQR/qp9XGeZKkyYIJtEbKIC1lCOl2zrBJVFk35v
         iMI0Z5biNtEqJxTYIDVjMGAwTju4xSlM7UlLkZ9X7rB+05Ie3CYpUYTqvOYOinVTx10i
         UM7Q8qgcsf7YlJyOiemSOWtaQvPnGwNWUJwxTyq6p63oBPvACVW3Q8tdr9alS6bgwOll
         vppk8k96gmKKO6VUJcWKgDZB5so3cvA6H26BYK4G9Hm8JiVBY9nv2pcS5OhLHYHRRrWq
         kf8vc38+jmJ9RkOtcYTLvYlDVxH0DFqqfNRkSW257ZtKGvmJ0zxYW510Sa71i3csJXaV
         KMEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206803; x=1792811603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        b=mX7T+MchxJBnNbP9stv+9j6/hs6LQP0um39ENX9iPY1q/q1r9gdYlJp/pKrCb303WW
         fzbHqQxuOPFw0q6BhzlSSzrlTk9gX3SorgKWss25W2ua12qPpVtFKa8kFCWb0V5k1eYP
         96wcNQ9VNLDzMKVJGVDCsxO8PfIEWMCOSoTEMSBr+tgyVEqu7amLyy97TTtlSodEC5KX
         Ikjx7z30ZxQXJqHW6HdauCxVbk4njzRe0gYS+tJJk1RNJsBvtRH+SAF9/8FVp87Bs6eV
         ZPP4JtEyi3rC6iXwvoj6EbEcTdgR9hNXglLS/946G4gzyyWGTL+y3ws/VheplXxkZvF0
         se+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206803; x=1792811603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbhybitijkW3GHz3YceixagzL+nb9IuKCWzm9D8hv+0=;
        b=TOaXtYog9qA75kiHK2FDtQHqKlsZPWebLRkFBgnCrZLomwuquMEVQi8l3qKgjCA8zi
         1yJrWMj09Li6kHKZcp/v2kvyN2FC2l/xrl4NJfyhONnbTaXpgQBdBRUSIKhwUcv8p7g6
         7XPgaPretpHMGnzliOgCl5LLX+GVuEM/ZGzmXFKHf9WDcRpyZvEX0XS7iHccWfHMBaIB
         k0noR5VoLI4XbwqbKiufYmuidNESOTrko6F6BAjD1d7/ZgEwTftLkE/4IQppAQGRmPXu
         3tHcD76UwaRAcctYt/5/vzhRjl2mc34cLdYCTSh+I6mstPjUL7HkO0HvPChxvwCoC/Y0
         iSSA==
X-Forwarded-Encrypted: i=1; AKwUvBwpsXQ9PFwvYYxlnprzh4q5xV7iqlu3dphVMuiT4YyvT/G8cXG50O3Ow14pdUNWxZmby6cgoBLxucydunw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbUp/j+KRm1WvlNyo4dzBmUzbPjExb0WiTigBVzY8EcABk1zES
	UgffpJwlxdF5WdKCyYJGOSUN23isZLQ9LjjleyfnrxJJ0RvUfDpmFKpfAXHsYXYJGTzqReRGPTb
	2Dk7zcPUYR8clVg+yeBY+G4tEygP1tsY=
X-Gm-Gg: AYBFou36sCz3srx04aauIBgByPa/fUmlJ8651SIvqqUEYHa7e9ygInWQGw+/2YRv1Mm
	px/YuEYoBksFEJJyyfkOZJG6xWQw+K2V3G8CRIj+NZGK/ksfFhTygk0vFuGlXrOPgvPFrflmRvv
	GJ35wk6o3lRQryKDdaS/E/Sd0Ff++qDnplCI1atzfC2iSUEMmM7ZnexinweC8a5jX0CoLaRyuG5
	xymsjS8B+jzaFBmKQJcHl/ZXaFS9M6iTEL1ljFc6RgLeZ3OIGzj6nlm2/qnrzKg5GhVNSqX0rse
	M2Oa5k/xWoAJ9G2BnXMawCZFK59+7ya/2W3ZKD/R5iaJtvAooUAhBlhmvsQZZeQyPxxM7jVsVOa
	rR90ZO6YwEPwgkC+Vz8PqUWgKiVLoDNn6lxd5cw==
X-Received: by 2002:a05:651c:1986:b0:3a7:812b:d1c with SMTP id
 38308e7fff4ca-3ab28e5a169mr3365891fa.0.1792206802485; Fri, 16 Oct 2026
 20:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-5-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:13:10 -0400
X-Gm-Features: AclHuK9BvYIfJv8hFIUrAGFCnqzrnZKHiW7eX8Qxk71UgmZNKGUkKFDMktSbsNs
Message-ID: <CAEdQ38Fyhhc9rgGNdX3CmW9-Mv2mG21LCcvtfzyzrcARn0SXWQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> On system vectors 660/620, capture live PERROR and MISC before acknowledg=
ing

A few lines in the commit message are over 75 columns (this one, and
the ones starting "previously latched" and "by HRM 8.8.2.6"). checkpatch
complains about them.

[...]

> +     tsunami_ack_pchip(TSUNAMI_pchip0, state->perror[0]);
> +     /* Do not access the second Pchip on single-Pchip systems. */
> +     if (pchip1)
> +             tsunami_ack_pchip(TSUNAMI_pchip1, state->perror[1]);

Not something I'd hold the patch for, but the same 10.2.5.6 paragraph
you now cite for CPU vectors applies here to the Pchip that didn't
raise this machine check. If it latched an error that hasn't reached
DRIR yet, we can read it with INV set, print "Transaction information
unavailable", and then clear it, so its own interrupt with valid
SYN/CMD/ADDR never comes.

Acking only the Pchip(s) that SESF names would avoid that, at the cost
of the case where the frame is older than the live state. I'm fine
with either; I just want to know it was a deliberate choice. If it was,
maybe a sentence in the comment.

[...]

> +     struct tsunami_error_state live;

live is now only filled in on 660/620 and only read under the same
condition, so this is correct. Initializing it with =3D {} would keep it
that way if someone later moves the tsunami_report_live_errors() call
out of that branch.

With or without those changes:

Reviewed-by: Matt Turner <mattst88@gmail.com>

(no need to send a v9)
