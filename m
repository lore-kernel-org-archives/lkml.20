Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD8442FBE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418518; cv=none; b=N0adN5Q0joSb1HpyXcIXeoFEzQsaCyCMYdiziuMbMo2xDLEQ9X87ASwCvRXocHZiEuPpcagboH/q8MHXe7RXqQe+e62s9f3SuKBXl28UrVzj0n6icoW3AyuxOXprkIjGKzMxptlj/OzGqw5TZwgfRqw1TGLTY4UcRq3W+L6xTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418518; c=relaxed/simple;
	bh=NGWB4j6Qtj1I45qJXTxUF3DXiZ03+1wrOcaEWMEdRtc=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=mxcp4ngSRMO34HH+US4HoL86EI93qsXQaey9iQNE+sxwhC/afzsUa23PDyJgJYWRyX8TJZd6Yo7f9fufUEsIiyQjTMMGlrhriwEa9oRLik6lUomAuGm63xAHkjuMrfHf5f6RDNVDEG3S7oLoInvr/vpgBsjg7muQcfh2uJY2QAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BKJZYJqx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BKJZYJqx"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-530e5b2cab9so15262591cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789418512; x=1790023312; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weFISBwya/NR8Sn9j+ZA3fbgOeUtW9dlmxru4a9CsTM=;
        b=BKJZYJqxLJgFemMBcjr5I/aDXNKPtJB3WRJtLpLBN90kCCOc2ISZa//Hx+A9+uy7hz
         KotROizMJXWX9tEzVf5O2jdHFH3zcLlGP6MzE7D9BcffRwl5dnFhOwNpSiEVpj1HEnJ7
         EvvPhvn7MfJE76qXhcCt4bZKswpUqfwd0aWhG8mfZX2zxmbfWiqBIzrihkzUvkRM4+pU
         0txeqCV4C+FMMdpJa03B+HismbOogUi7Ezhk+FqcN08IynGTUWXRYeAFxW76NBiVlJ0L
         L414LmF6/TYULPjGTgneeLNYrcAk3bxDHO3JN/fQrYxHr7NjczBjhvGl0Vfc2MBYNYf7
         gRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418512; x=1790023312;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weFISBwya/NR8Sn9j+ZA3fbgOeUtW9dlmxru4a9CsTM=;
        b=LqBF/NEd3d7jEl/Pl9cwduiTsTYf/84wdwyUdNhJH5TpT35yzmPsO/pHzwlku9E1jj
         JjaEeV2kf1sQc8ExzbJPCWaiXK20dGylcETxebXYzL2gZKibMJqJnwOEnpQnFIvUHE/q
         HLYSkLBozilhWOSPLYl+CZCNITJr5KPq70CIm6adl+L8YNmFv8pn6pN+NtGH9BaA5VkX
         ISYIOMDEiCgpyksgzh/NQIyhC5dg1OmcwrU8E4qK3y27SQBdgQUPOrxbcrK2V+ekBcMG
         3pm6DtLaYIWNVKs6v+WJ9jP8gXtlly4GnVvaVPoiNOR0AjuN/9NU3CuJEgzI/yWKrF2s
         R57Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzgNKaIZwkMPCrTAagGYicocVPjt9jXSq1tXoAZzaThhDQ+GYJLHG9+rWWV4A3QhlS7otqrDrlr1xRFWY=@vger.kernel.org
X-Gm-Message-State: AFuF++mo0Ttmy4cZ99Mpz3Tnvtrnr4HwCG31fLZvPiFi1XYskSLHTZTv
	d+9401TREE72t1MHJu50h1rnK73NCJFpwH2Tk3w7TFizhYm7soqCWABFbAF5tAmXbA==
X-Gm-Gg: AYBFou37NQrg1qpv1nqkstrp5MMeHRsQxX9vMJk/6Ao/3ercTy5xbY7hGtGo28yZU+Z
	GP7tj3EVcQKQAUjBnz6TR4Bhhi86Dq6xeswFdew37UT/8V3c/f1smcEIULfDVzntw2s0OVBNPHv
	A+kcdoVd5A0HGxMA6FWlvHp0JSWwoQfSi4ZvY7+gl4TJYVF0Oq8pzpfBcIgQwWoZiw/5gtkV1Um
	vt8hi9cmJSAvumgSa3yNYI3pSwgX/HwlR/YYpjs4Z4N+7HmXWq/WRRWxMO5bGNOYsDSFn819DBC
	CEgFGF/8mZNlf1rNJTgZjF2TRouh/zsTJR8SLddQrYT+uBuVkf6SPVJN51UMShnZTUDbAI9OlJw
	cNOmwlH0D6GqZaC6GjGI/LqsDysvMCZz/FmyUGaPWjFdruUSQMzz70Yfmv324CX8r2Z1DmmIEnP
	wcUQAZsLq5QwI97r/v4NsWiKsJBLDTdeYk8N35dUjLULZd8IIlMkPd6IIyHn8a0gt7RBuQ8W6ju
	40l7uBkz99LtvTEdHozwEULoorOU5X/6fuSD9qMb8EqDXyEZrpG1SrOEGzZl95rzMpiAJFJtwdw
X-Received: by 2002:a05:622a:15d6:b0:530:b2e1:8e38 with SMTP id d75a77b69052e-5310d063e03mr64295201cf.51.1789418511760;
        Mon, 14 Sep 2026 13:41:51 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca3098easm108403901cf.3.2026.09.14.13.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:41:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:41:50 -0400
Message-ID: <af4448a7a2b428d0f4af0ea4c19abeff@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260914_1619/pstg-lib:20260914_1251/pstg-pwork:20260914_1619
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, Jeff Vander Stoep <jeffv@google.com>, Nick Kralevich <nnk@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, audit@vger.kernel.org, kernel-team@cloudflare.com, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1 1/2] lsm: Preserve full ioctl commands in audit records
References: <20260910144837.381855-2-mic@digikod.net>
In-Reply-To: <20260910144837.381855-2-mic@digikod.net>

On Sep 10, 2026 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net> wrote:
> 
> Ioctl commands are unsigned int values, with their encoded direction and
> size in the upper 16 bits.  However, struct lsm_ioctlop_audit keeps only
> a u16, and the common audit formatter uses %hx.  This logs 0xc00ffeee as
> 0xfeee and makes distinct commands with matching low 16 bits
> indistinguishable.
> 
> Change cmd to unsigned int and use %x.  Pass the full command through
> ioctl_has_perm() as well.  Its driver and xperm values remain u8 values
> derived from the same low 16 bits, so SELinux enforcement does not
> change.  Commands that fit in 16 bits keep the same audit text.
> 
> Cc: Jeff Vander Stoep <jeffv@google.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: stable@vger.kernel.org
> Fixes: 671a2781ff01 ("security: add ioctl specific auditing to lsm_audit")
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
>  include/linux/lsm_audit.h | 2 +-
>  security/lsm_audit.c      | 2 +-
>  security/selinux/hooks.c  | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)

This looks good, thanks Mickaël.

However, I am going to drop the stable tag and merge this via lsm/dev
instead of lsm/stable-7.3 simply because we're changing the audit field
(going from a 16-bit to 32-bit hex string) and I don't want that to catch
anyone by surprise in a stable kernel release.  I will leave the 'Fixes:'
tag for reference in case there is a downstream that wants to pick this
up as a fix.

--
paul-moore.com
