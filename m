Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB844E643
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494887; cv=pass; b=aeRelkjPA/tl4w1EpnVpK5582INaVV4QqhKtQFaKuIF8VNOxfHth7/KpwaMBPH+eUMVIwMC9uyIa/7kkfJhaj06/0kph4RG0ZJpYDb+Selfcqr5gr2u6aPtizvVGZGWeOjrudgERz1el667/ayKqDkQNcsJtYYZTQR79l4yjvvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494887; c=relaxed/simple;
	bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzB7kx0CtB6betDHZdHb9sRdYO0ghAMKreCJQsVGUBq5yYSvIJAb8M+tvQBK2FOQO8Sd7it4BlebnYHWHZVyvRYYRyYsVDtu82ib9+6bqR2onht0anWO9k1X12xmdmO4N405PNddWtdjMet9l8+QiXaxtTenOW7bP5qCitGF4PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1FQBep5; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1FQBep5"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917c04630c2so36915576d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494884; cv=none;
        d=google.com; s=arc-20260327;
        b=OBl1wRBRZEgkXIeJi/UqUk5lITG+vjPOW7YjOV7lSlnNq/baY6AezJOZnncx/U/O/0
         trh3cP4v9RAcmjtoDLPiKFRAXU2wz284lJjnH8Eh3l2E9oJDMI0wGd+zbNEPPVvXBQg9
         WwPhKO7q2qAtKgjSA7EAnBZ8j2JiQDn1+srTjkSKOOGeavuhK7FRxshPeTNPTZbteJe/
         rQTgLuprx+3jPYp4v8dCj+lkzZFBUdq+g6kQ/KYx7VhKSpJbt6E8htdesQZ9pDMmVWYN
         58p+R0xKAbBmFK5fnlEchlhRhQsVgdGNNXBNDG+ujTCUYZX48Iw12w1ltkvZIdgOSuFY
         Bjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        fh=NbWTKcJUIczeOsbPnts6io6X5MocjQk5dlL6XSmETus=;
        b=qBgr4eBum2xLOUhULDz0XJ1lRC6PgVG2ZgnYDM2g5nVu6cC0Q5RXYcdNULKHqGWHS8
         LPGrMvfuTlWWI4dUzO2hjIjlyMyBca4O77unx81BGwFnKwd67Y5QncQJwOHRvtbmuECG
         BDFd7UvFaVKtcMc1wZpmLDlsmhCgxCoXwGQ6ivwzVwXP643kqw73wxofgbTyHpUumAgb
         3APVTSaDgwS5Ij1iMpX8QDdkiJs2ElAzBroYNRumrhvPYaNQmmyuhm9Q0ZD5mDxwW3Jc
         GHsmGWScx8K/GIV1rkD16UxmKfuAmhX4z9VBINui9OolNl7lv+RY5k1Ou6k/s8J0UzP5
         TNyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494884; x=1792099684; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        b=S1FQBep5rIbS2NRVh2ZkoFax+01UnH4BJIAUdJmdGIbuzORGGgeykIUXKd5p8S7RFW
         JA3x4H9ENgldTPyXa2IHWIiMMj8HdVV+7Ykxt73jdQTB0ATTdzNmnqJ9sEUVqAAzt5ZT
         GUEN48xs5ueGurG2aH2+4fd3kuWMA0tH5EJI0Uw4D++AJgl6fZR7vqwIQ5FwOCPuBSLS
         5oFH9GsHDa3sVxx+c0G64HQ0qGZfnqZ3N9BBOHz5UObudBauhfw7VQpdh04H1nF9t0fe
         H7phWVWs5W/OEo3p7229+ec/95ITwExDtxli6Va/SSrIXFlWVkPpw33iyVoIPirL4ue1
         WC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494884; x=1792099684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        b=oTduYGklJXttaFoQ7UvNZVPELwME3VWwl5TUIDint0V87u9u3PLthPQb4GTbUwjZHV
         qRM9/51Pu20k4MbYzV9PAnNoT6N/IJ3DDdr1FsjM6H6Oa68Y+mo2Tashq+09607Js8iU
         fkg5vV65YMqBTbMcc5iMC2FT+a5AxMBRosNiAvmnR2/44eA1Pi+hsp6FOzsk9v6ITz/L
         p7IX9LRk6LkSiE+7KY+U6+H4lDSsE7uThaHD/emD74CkTZYhMrHkrf2uKdM5tiudEVZW
         U/Q8/VxQTWKU64a1foIN1aa7nuPeNAqRkIucjHBgdLMcazDbsK7+lG7TJuv+A2aEZ6Ek
         N8WQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2LbvzUocFcflBSfot7HSzCJMC+b2/qXAr+67KW8bADDUAAWtQGyVP+c6pPoYSX7qqWbJ+zwh8XtR1Sjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfOMgxBcc0gzM8V2y5NVShYH6U41KLfMfGTJ+p7fO/dv6B1ZVh
	YJivTXFDnIa/VYKyFS4pGbQfYEZ4Ix3F9AyPZ9DZR4OmZE1IePU53siHSnVhqcAV/AD3z0j/HoF
	tC3MHLWvUbTIDLwGSEIxl+KXU7hbzMJo=
X-Gm-Gg: AYBFou0hwWb2czz2DOMHGAf7Yx5td3p03qLsE/raEczwHL64jkc2+udse4Vzdf9lfle
	WJaNvuYY78t7fBIPs8+5rCI7vvMBnJtQxtQzIiu5fDIPkSlTlDiitTwDPYDHf3tfs94C5E0Jq9Q
	qxS+xkUc91wKI+M+NczgmzPZ1p3EFrcnU29rDftfGlE+gVjkDRJXkXBl+sxJ/Pyk6L1OUK7y81G
	XvHI/rgYdoVBnkaIw3jShdBSGRthhdtee/Qszz25VWYMwKx60T1jR782bJlEAy3p1O7IPY7lZbw
	L0+pO/RsXBvi1+/WhjVb1y5+inkCtF4dsnkdlAqsWGtQ43vnwrKd6SiaZP8PDUEJzq5L0Smthii
	2ZSNah4W5nsqkaA==
X-Received: by 2002:ad4:5c6f:0:b0:914:501c:6d08 with SMTP id
 6a1803df08f44-91b554f0389mr257436d6.14.1791494884320; Thu, 08 Oct 2026
 14:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-2-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:27:48 -0400
X-Gm-Features: AclHuK92Eilo9AIrsmVEgSCURzevr5CYUX7NRSheSjbh494ve_VZ5MYQZo-3BMI
Message-ID: <CAEdQ38E6pTdnfzU4tTvoJOFVGv6jSQ2HrhLTFet+2qMiYU4kZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:44AM +0200, Magnus Lindholm wrote:
> so testing preemptible() expresses the required condition directly
> rather than naming particular callers. alpha selects ARCH_NO_PREEMPT,
> so unless something else turns on PREEMPT_COUNT the test is a
> compile-time 0 and the hook runs everywhere, including at the end of
> kthread_use_mm(); it only takes effect in PREEMPT_COUNT builds.

The only way I can find to get PREEMPT_COUNT on alpha is
RCU_STRICT_GRACE_PERIOD. DEBUG_ATOMIC_SLEEP depends on !ARCH_NO_PREEMPT
and PROVE_LOCKING only selects it if !ARCH_NO_PREEMPT.

In that config preemptible() is true at the end of kthread_use_mm(), but
the task still cannot migrate there: there is no kernel preemption and
nothing sleeps between switch_mm_irqs_off() and the hook. So the test
never prevents anything, and its only effect is that one debug config
leaves asn_lock set where every other config clears it. I would drop it.

> A shootdown IPI taken in
> that window either finds asn_lock still set and defers, or finds it
> already cleared and flushes directly and by then PAL_swpctx has
> installed the incoming context, so the direct flush acts on the right
> one. need_new_asn is only ever set while asn_lock is 1.

The deferred case has two halves. If ev5_switch_mm() reused the ASN,
need_new_asn is set and check_mmu_context() reloads. If it allocated a
new one, need_new_asn is 0, the IPI zeroes mm->context[cpu], and the
task runs on with a zero slot. Nothing is stale at that point, but the
follow-up series reads a zero slot as "not running here". More in my
reply to v2 3/3 there.
