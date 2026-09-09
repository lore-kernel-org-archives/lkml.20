Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B5C563FBD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967547; cv=pass; b=LS84MN/mg2A/lxVGo4i7Kvv66sR/AMW1qEu6Z9/1HE6WYh4RS40TdH0Q310lXAXOkqWcjOo+goahiIrv+/IugSWZbqlSeOXSqHUtznUqiogRE2S+qScZVWoPKedj+EFguB4Udid4N6/btn690Bfejh2eCrRALAH1NglhzSai2oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967547; c=relaxed/simple;
	bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2ePGtJWCn6nuK3LaG6yU7Tg3xDfFGSGeKUw8GkYzWqOy7AV4BGeIhcst9aveGx1H8ynrwyXkWxZMyhWegROGhzciHaX8nqf06bCXKBMClB5ASZt74BHB7RJbP1ckYVREGwGhFh8ohEyBPA2hhOcW1jaeZf3ehcKX8oCE2YhIi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIEbJ3tU; arc=pass smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIEbJ3tU"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-9105342b2d3so25964486d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967545; cv=none;
        d=google.com; s=arc-20260327;
        b=DdI0e03V3Akn+PMDJNTNLRCY6jYzGJyb+rvxYjB0JWgbVPqjTHiMPPb2Nemr348nU/
         Bg1iboK+vVLfBsMuQSWTtI1BfRLf2G5feH8eDEPpP9Ux0mS1JhR05QvHPNwWcrLzASzZ
         a8Flf6w+MtXLtOqZwTKJW0FhpexyP4FZxHKF3AZKVCBkbkZYcatYMTYsnul1TVCulRtD
         LwpYD6g/qIJrIZvuQq6fzxsExw5TdeTJSEN2yx109r/rZyDOSLe5gm1ZYHSVHJw0Y0aV
         sCBHQyJH17E03ZXt/VYjm6cg0N+ohsmgRqAzPNT/2C9Xf1itoc8pbUK++M2TY9Q047fb
         vzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        fh=CJJJkDaK5p18E99at8eE2ugLaYJII3eokrW6RfEKecw=;
        b=g9K0eFDxE8YfulSWwYn9Q0YTm7bqef+fdZSPhYPjWZZK872ZjuaQdZIDEBvxl9IC9V
         K6cPbIb1MTiYm1J745+UVNMvi48/ePVPd+9NDLuikY0tgZ7nO67KvxNHTOmAwwIQzs4s
         k0lZZp3E+IQcwc8yfyM9vDp3RJxNPUIYlBk1wLT2bmfxpgp53n6D506MjNGLATIUpKd4
         SEA4vbW1zoRkNDcjyr1B7T/aSJFnk3quXYgQ4tjCioaOkpZlotNs/IBR9B0Fe9BBASYt
         AJs4i4Scor8HWpR+MNH1QZE8DBNDhVWjmcpF0SHKg2us2AmkLwSkelvmHU1MX5tj66Os
         t8WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967545; x=1789572345; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        b=tIEbJ3tULppdr2+syxuOlfIdUs5O59slsP7c1p0TUBt80qrIVX+FykF2VS3ukP6iw/
         zuBHCzALAh+9l/QqqPphFzIWHNhF1W/sAWPdthS6/UUUyLVfumQ3sXz7N0y8QjwWq1Pq
         Gu+PxDdXf4M7xbhOgx4Wdj0k4kZYPPM6esb0FjBMPFvjsE/a5110DG+C41zwOhLdfXcL
         NQmytweFASB7ltcbXWSSjAS/cc9nV5WqMRq/QzkHPEIauEmpb5GAPv69WP7YukB5JHDz
         njd8fXZFh0IOf3qYw+DOe6eCTSHUSyKDN7k1V4HIduQEbiUWP5oCjUtAmQxswtr1y3Sc
         0kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967545; x=1789572345;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        b=BKfPH6XWZIuAqX1Nvbr5CZfDkODl4TOtc6TdnZaPVasEYMMt9zgXSpDJxV9/N03Z7K
         nkIDhlF4moUJCDSIDMwwV6F/QjG8Co13kxAqD1eqUB3Jzi46j37pMi/5M6hDnaamAGax
         J4dq+74U0wcehbr4Txs9ztWItFpuEbky186NPvC6DGQuuIFW0vstY+r6iKJIpDGi1RJm
         hY5akwTj3YsOCd2hsb42uRxyz7sgSDDdQapA2BuZjBeSOn2SO7DIFyn1oZY2u2y/kfbf
         uC6unnsLVJJ327pDS+xh9MgiWjF2xwcdpSoV/AOOpT+2f+96VuwA60j3L5Sg7rMfbHHJ
         IuCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1laNeMX+vkeia963kXZCBpCIvxeRk6yZKu17NjkaQ2MJ83EvJouudjbVe+7TOJQ/zqQyvPLH2EJSQc0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mnGxMfieEuMG6HeHS0ljRjR574d3iFJ7CBzlGCTWgcZOTpqELr
	qcNIDB5LrBbRrTol4NG3ooquG8Ir8hbWlvAfkBA1WmLqfpIABZVVMgzmcAbWuyLb1l8b1ixnR+W
	8MpaRsCPJoNIs4vdwCf/7AuHrIH1AUBo=
X-Gm-Gg: AYBFou0p3WeLX3HlXmQym8fk8a+76DLWFmoFsisClixzGEOdDKPs7XwR4UHVGBtv9DU
	QoGN8OIeTzfBEGRifFCPDylu8v+bSmewciJMIm1cji1YyUyYDurh0+mweJF8tdUa7SaDnnSTMGt
	QCW3mNoNZ/wnPfSJwm2ZE9o0EepXNG7ZvINfE3NnY8pfRb4OwPq6jNw6LQZg2Il9VFaE+Y5WZUt
	fuoHAkmtt8YjAVFyjPZYZ6Hm6sC/VlQn02UGvXXuRliEpyCB9NguZ8+QXTwf3ycco3gFANmC2im
	GC3kdYPEq9Rw1yKQgcQDMw9ZUYPn2LzNiqbzmoowfAVPei3rzN6KjA==
X-Received: by 2002:a05:6214:3f83:b0:910:49d1:3a7d with SMTP id
 6a1803df08f44-9106b371d12mr101320656d6.3.1788967544656; Wed, 09 Sep 2026
 08:25:44 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:43 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
References: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:25:43 -0700
X-Gm-Features: AcwNN1XbctJykLIajwUrOJ8N0MtuRTsipdzh4r2QkiO3ZZ9AV0_gzwQwPujw2hI
Message-ID: <CACGbirTmyi0LHZEr4xOwg_WgFALarFVPMm7JhHBbXwG10PF3KQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests/sched_ext: Validate select_cpu_and
 mask constraints
To: Tejun Heo <tj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

Please disregard the previous Gmail resend in this thread. While
investigating the same delivery path for an MM series, I confirmed that
outbound delivery wraps long lines and damages patch whitespace.

I have resent the unchanged v2 as a text/plain attachment:
https://lore.kernel.org/r/CACGbirTEtYnxiZW0EnOCHbZt66=t-A_Nppp0ChRfM9G2ZD5+aQ@mail.gmail.com

The externally received attachment preserves the patch and applies
through b4 and git am to the prepared tree.

Sorry for the extra resend.

Thanks,
Tianyi
