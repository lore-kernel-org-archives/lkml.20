Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BA12F585
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986048; cv=pass; b=Aqsy6z5w/XOieQ3f8bbQarWnk43+TfVrad9jvRCAkxaSsEcu+BHCPj4fSZAH3xzk2R5TXpqgX2jZXd0C22olS8bAokWe1TiryTv46HJ/6jiRAuCm5FMGxGmeqVKkUllUirYDzq/AhGrl1ee3aQz48+iO+VEiYloK4XTCNlLTP0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986048; c=relaxed/simple;
	bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szI4fZZHVm6qU73e68h51iiM3gk6cihBgzVpvrQ/PuLj85bI9quxZPv51BOpiKB7ib6IKSi84R05MHhL8sBB7OwYWGzYy0HurNRrLq3CyP3ZsWqE8I5+QckUKdsOrhbgOqgAsOMogsnPHtKRqLwM9pPxbNuGleLVWm1nf09nKHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Svl+yngK; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Svl+yngK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so32870a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790986045; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZwLw8D56N7bZLAY4RbQgf+ZRZKJkfT/kFb6q9nv5qxwMztdWsU1p3fxRaNiMdo+i7
         dWYUbr3GVOpnW4efa2M16IRGdymv2YijlKgJjpmGR8bmoKBYSTN0KL92AVY9apazts7f
         HbKCeGtoCxVrYbQ5zgSzG62KxWJW9tLMWIsoxMfYUguaVvpQyOY+p2vbX/vejnO+X9W7
         eQAy44IphsW+v4BU52uMU/X8dk8qVxH1maAWk4kVXa39hUsGHKc7GoyGO8UDIyrkEMtK
         39FMxb7UMlcRqvLIDvThDS9w8KjnHO+nWL6UPRecmoXIOaRDuNMtEXd1Cj8wRznfOL4x
         kpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        fh=Dtf9h10P9eHcWONhbJGp3v+veZ5zfkMyd6Gf/GApm68=;
        b=r3wyaGE8jh4J0bj3bCBBmOJuHPZORDaQsrs2/fEajRhGXzNFcPWg8Whf+rxYvJHn4D
         QiSoDbS5qADHEY97/z2t+1oU0Qt5e8bzuZMt28N8cTNLRd9dLaqkCZSVjb9Bs1JShhu3
         K92knIG6ow56tLQ7n1F3lQwn/mWu85YHpNY3DYM/OOEWH1RmcuqsycWQuBr7g+mcvX17
         C+6xf0LJvzQlVWW+vL7K2Bu/+3ND5L28q+dAdMe9G7Ztyd5KEjkmor6Z7K5GkpEkHFYI
         W6D5IE4zC1x2093sBbY016Yj9Ehiit2huvr7v7tldlhZ9JfD2Lti/pYaU+MMsRj9h2m+
         LGvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790986045; x=1791590845; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        b=Svl+yngKNLlH1gIMC0XAl/iJHdHc3SgRv/KoV2f/tG77MqV0CxFFSzskpf9Ofo8K8X
         TOWZzSS/e58+MBYguen4hp2H2uR2l4DqnmLHNidyJBqmV3MGMPKqTMlP+Z1PQ0lvERvm
         o2z85XtyL9UmNvEtA6cKIDgkgPS/4Tz970VCWW8cxREiiKpp5ALGMR4gV0RHTLIaomZh
         huNqXsgSq9DvA40ex7XE9huucLXF+ZE8T+b9B7DkbBOQJg9ZkF72Bgn2pqUHPgLG6yjq
         phXN26CKwKIAWJHl8GUQB2gnG9kAYZE9xutxEsEbBfdytsJNSc0K4uqLUITGjmiE8F6f
         Gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986045; x=1791590845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        b=Laz4HiwtGyIM26s9n5wH6odjK4NajPkQ/kvmLk9u9CsxVQz59jTXbLvK9bD4X4CpWC
         XMdXO2EvhThbU5JebKLIFAaUOrrnU29OCsfpjzRomCCWZRCS4KM+TpfVlQbFaaJpIWL0
         ezKEuG1rqUXPGNAK7cNmazbgw/h3fTPVXJyERyJbdlcsi/3OrW8QQjxmYY4cdU2XOlvQ
         zgWePymiKWZ2aThblW3XOBE6Mh7eStzvBSsOkQ+6IZNPguK/LQx8HAqwPajS/oT5NuJ/
         P5NmW2wwfeIzky31DtW4Yi7K4vINF+TfivIIf7Mqs2e6hLpst0DaWI+6OhoSgT/6kLa0
         2/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDfP57plj3Nn7KvePP3ZKejtdxCtzcugGHnsElT1Kt3Mvlw8/g47bMH2Bf5aHH80XNDMA+EihLjcHMqyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLULvaMC0OpS76/Vp68rLSVQhZAu4jSVooB+lB1JZZNJA8DYcv8
	r+XFCBAgbnW1NYtXXqhdSl02sX5JWenvmP8FnejYUt38IQfDfdp//ESxFpSwOoEtmthweEWo8/Z
	BCvA3F6GXjXFbdOEtt0KGD/Ae/JKzOMQ=
X-Gm-Gg: AYBFou0UdDOS0K3sYQeGmqIxCZG5+i4jASbL0lljvYKe2KA/6Bw6ibv1WCHF07eAQY8
	6fu8xiVxQ/TabtynTdym7uU/U3F2xOJqlU2DYYVnFMScmNdk4aCAuJXF2yWvSRKIjb/N/EjOGEx
	TQK261zPt8lh64ZfYN6x+sbGxZk0ZaNuUUrSjP9Z1AWUAL7pcnaUXSCgkiCVwC5eNE8u+zhI1ix
	o9Qq5cEm3OR/YYkivFa4aZL2AEk97N6nspUf5xjMyWa0H/VfSYKlxDDJSguDPOXn/FGhShADFo0
	g0aQ1m9AKL9lQCNhaFlvfGJ60eYGiQNIeX9rBI89VS5wrGojwcGZgb+bJJUyDxiYNXd4ECG7bSD
	fMz5ZnINy/x8gGL4qGX7FHRnhwhBg7rpNxlrbvdd1Zv8Sffx+YF35R0ogA4yxK/zpsUQbFS0GeX
	Qnf9beUkxCldivyLMkwP9X94gilg==
X-Received: by 2002:a17:90b:5108:b0:3a6:e5ee:52c with SMTP id
 98e67ed59e1d1-3a7877615bcmr603948a91.63.1790986045194; Fri, 02 Oct 2026
 17:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
In-Reply-To: <ar_fLAeFU4rmrwiH@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 3 Oct 2026 07:07:12 +0700
X-Gm-Features: AclHuK-xDRj275wrNIYauFmD4ArHDsq6qQwz8Qk8YquS81RnLrT5xbVpnSPRvtE
Message-ID: <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

Thank you for your review.

>
> Not sure about this. If it's optional, why should we bail the probe if
> we don't manage to get an irq? Surely it's better to continue without
> the interrupt in that case?
>

platform_get_irq_optional() returns -ENXIO when no IRQ is available.
Other negative return values indicate errors, including -EPROBE_DEFER.
In the case of -EPROBE_DEFER, we should propagate the error so that
the probe can be retried later.

Best regard,
Phuc
