Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F2E346777
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707170; cv=pass; b=k65DYgXFABm51O1rtukaBLo39YWCEW7qc09+7kr2ciF/4aAWnQv9ERyKLdrqc/KWTlmxjdOCEI9nPVPvWsCFs5ricnFGSO4AtbZ2fmprbQkuLZVpYtJebXLHRKwEetXkBftVxtvixSRoiN/NZCXQfllUTzCVcf9ZpyGMVJlNvAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707170; c=relaxed/simple;
	bh=kC4r2EtC+0E0HnJQUcPe9Ptqztg+vJ74vZLQrRhdJmU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W0PP/EypFButXV9hIVy1tLhX4sltwpV7P9e9zrodpaSb/HGJqq3laGvPV21gvVoiPrtwCq04chR0nwewnnsyfOUFvOLTMSJ8bL+0nqwOb2X7x+KqFUgO8MiJkSX72XE9DS/YsejbVKEl1UTBtoFgZXLKzAecvAjPvyeCmaCZcwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in; spf=none smtp.mailfrom=lites.edu.in; dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b=AGNWkeKR; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b="AGNWkeKR"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so85404166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791707167; cv=none;
        d=google.com; s=arc-20260327;
        b=BXKfBUqYCXVN5426bombezALoCUMOrEkuePOgTYQmNhHm4uS606Z117GFS1ANZ0mHm
         l8xWd+1HQyGlKEIyQjXenva1Jf20zHrtJ3bIEihQYEBBkn87OracuqKqD9EWxeeC2q9C
         jE1i104CiBAMvoQvy7dLURDVDw+5+uLaMcwX1RXkL5/i9MW4FSwrMIn48hVggV7DALuX
         pIMX0p/laT+p1vJZLB8DRvpzyLbr64bmE+tEs0iKVQgndqXlre2uaf1ZIdtARGOz1jnW
         m/GQITiLl5QwSLeshuDbSzWKg/MCQuN4k5c/hiEkcGXUREuX2Y3mcR4aQNwKeqsUcv0Z
         iHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xUwhGo0JuncXeldW5hZFGT1tmNEZfWiYsMU2M3dZP+Y=;
        fh=94FGx7GyTSZx0CGrsydyL2/88nmsXrSCRVyW5YQaJlw=;
        b=ac2KYtk8gTln44I7W7jYnciDqZuIpccehOZCRrM6jb6z/kHZHvAS1W2akhkbakS1Ot
         BoDTsN6lU/v4pR9oFu8gpgZkCPv/vPujiC+xP4UrVylvtj3sEwZLjAgnEr0TrYvtFGgX
         H061SwJ/0B7/22BjdywUNGCeF6LWC+pTfkREYB38cfW04D25vsJY9RV7OjafsCAZCEp8
         Gncu/7vead/LsvfExdI3Bqo7VzMrA7lIixKO/EJPtBRSbsvMFjP2pm020yC6kPcMqxo5
         16m0zWWamUNE0ckGwvLHhA4CVAK3FmqWPwyuGChGreFpm2Uwsy5pyLe/7iUEMYRew4Kl
         CFnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lites-edu-in.20251104.gappssmtp.com; s=20251104; t=1791707167; x=1792311967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUwhGo0JuncXeldW5hZFGT1tmNEZfWiYsMU2M3dZP+Y=;
        b=AGNWkeKRkOlexY4gxqhFNpjtIWgY8VOoAS7e6gJCdgRt0OYRQnM4Tv0UjORdCE4Ll/
         FsPCsJjQzmquGsPVoLTfH7qbNc6q1zZws6DtDAEmkBUQWRFDOrDY2vaq7VlU7ryNE/iB
         hAggFsnkaoC15Frr8jHUGvAwQ+Cb4zFOTaZ7yWExc+2zKOWhLb4p8K/5pP6hUr8auC+U
         KMjHTaE5UBTVt4d+nDNvHA+nLpv53LMA/RoizuWyCC5bGShb2oSIuctT7avzmLgHjZis
         NryYYpJ4jQX3w6+iJXSqbd39vHNpIi+y/18Ig+IE2liRgFctYv3e9wswdl3nPqBbMvZV
         5Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707167; x=1792311967;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xUwhGo0JuncXeldW5hZFGT1tmNEZfWiYsMU2M3dZP+Y=;
        b=uNu/NElmYXOQi92Ztx1GpZa+hbDuIZ0+F4rEKEa1gQVOwljQCyWDTkwc1P2/kyq9J9
         nbsUEozB6maa3copdJxP7fv1R/YTa6Tx44emhYx8vZvOR6zpt6/XwehIC9oKKqidQuc/
         A1rHp2MR9MqpBJQXhr0M+xbipL28le1pbtVvo4pnOrNk+CIIbxdTqspC4Mt/Gw+XIZin
         b9IpLow9KGouY3aXfZsjmr6ifvOsRqHXuJftF+Vsmut6bZM/PL//ESQPtQRFv6KvzRk1
         yX3bRrGn7sCfO1pfqqfuRGEZVu3XgAtGmwygBjbRBWCHgDAlxOlxnJIoS+26TLcJAiUF
         mQwQ==
X-Forwarded-Encrypted: i=1; AKwUvByLbSYCcoS84sgNY6WOiOEAtJ0WReuvaiL9t/JeZJ4SIqPsDDCZo47OPntRqfjD4SQrnB6ST+t8AhjiPG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe5okbH9NyvmiZwmI3RjjE1oQ7GYKxzatjYjp3t/EqGeqpZ1E2
	yHy05ZIBtF+RGjQ19bN7OuPy+OSOspKf4szfG0yZOJc78vucc4q2Hf+nXUEWH7CS41o8scvFT0y
	nRHB1LzUvQZMfBs4wKOLTe/CfReNuyaHUNAmid4Vs7nAws9La+Xc8YWbOudmH
X-Gm-Gg: AYBFou2zNWtQ952IcPkjVWizCbSlX5pjZvFXik9YbGZEVJ4VtNFpjADMWqMpC3vT4iA
	ddqQk+9jHnd0Tu55tG7b9jA4JcgOuehktPXcJqjb3kqHKv1RrWm6HFt1+nvawwxXsnKU/QYkBO4
	1jkmvGhIUf3zGWWTOf3FQpW2N1+zV8No8U9yMDJkKGZfJLN+vWWU62CPjNXTgA7RQJUJI/UGB7n
	Dcz6tD6DjXtpzQNIWibEKwqWkYpGm1ImMVX0kBpbfVzJVwSz2LcG6J8EwtMWoppHNAaJaAn+CNP
	T4VoHscQo2Gn647ouf2ATtlGSZJ6OY8bxkpdIkMbxnGuwx0U5gfCLNPZkA==
X-Received: by 2002:a17:906:dc94:b0:c2d:dbfd:4314 with SMTP id
 a640c23a62f3a-c31a9fff622mr580547666b.46.1791707166999; Sun, 11 Oct 2026
 01:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: 961222243021 SHYAM J <961222243021@lites.edu.in>
Date: Sun, 11 Oct 2026 13:56:35 +0530
X-Gm-Features: AclHuK8eHPSQUztDhSxElqVSAsgBFdjWQM-IfcyG-kTe4KDDcr3Po0TXJMn07nw
Message-ID: <CABQ+_VKQoHEFfr5OpsAxFggBSR0zdQ-U8ekmo=E82WQLC3+MMQ@mail.gmail.com>
Subject: [PATCH 1/2] lib/math: rational: avoid overflow when comparing semiconvergents
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Trent Piepho <tpiepho@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The comparison of a semiconvergent with the previous convergent doubles
its final term t. When t exceeds ULONG_MAX / 2, this multiplication wraps
and can incorrectly select the previous convergent.

For example, approximating 1/ULONG_MAX with a maximum numerator of 1 and
a maximum denominator of ULONG_MAX - 1 returns 0/1 instead of the closer
1/(ULONG_MAX - 1). The same problem occurs with 32-bit unsigned longs.

If t exceeds ULONG_MAX / 2, its mathematical double is greater than any
representable value of a. Select the semiconvergent before evaluating the
multiplication in that case, preserving the existing tie comparison.

Fixes: 323dd2c3ed06 ("lib/math/rational.c: fix possible incorrect
result from rational fractions helper")
Assisted-by: LLM
---
 lib/math/rational.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/math/rational.c b/lib/math/rational.c
index d2c34e629..dbd24dabc 100644
--- a/lib/math/rational.c
+++ b/lib/math/rational.c
@@ -90,8 +90,10 @@ void rational_best_approximation(
                        /* This tests if the semi-convergent is closer
than the previous
                         * convergent.  If d1 is zero there is no
previous convergent as this
                         * is the 1st iteration, so always choose the
semi-convergent.
+                        * Avoid overflowing the multiplication of t by two.
                         */
-                       if (!d1 || 2u * t > a || (2u * t == a && d0 *
dp > d1 * d)) {
+                       if (!d1 || t > ULONG_MAX / 2 || 2u * t > a ||
+                           (2u * t == a && d0 * dp > d1 * d)) {
                                n1 = n0 + t * n1;
                                d1 = d0 + t * d1;
                        }
--
2.51.1
