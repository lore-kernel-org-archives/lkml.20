Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3646D096
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779838; cv=pass; b=FhxNho3q7JjiyEUBSxgthZKywvl1pLsAnkjsRuhy0WK43WK9yG4O8GCDKn6PhUNHDyf/7Gvmef10mr3o7KzPpdj7HLCrZeOjvInTXIHmYAg3IBQhMqSoZCJ/SZEgGZuWOq7t22OdXtGfXXVTb84EKntPjZdb/RpAYAE0jLWuVsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779838; c=relaxed/simple;
	bh=NRIOJ7LdHSiFoCy4s5VPIFe11Z/c9wcns1PStTsWpYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+8NHxvdkwQ3X5lpUppAjgp+WaKBXUQhUTXEfkRmYF76dxcukjbUCRzmqcz9kpNcoOHvmD7aoGirogIOPN+jTBhrHmgvPoD/4R314SfCt+M2QAMKl7hSs0ITGaLQGYum19DLQvkfw99RRUkzKr7JJWnNJskeTpIv9qu4TbSQwgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JTk3B7kI; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JTk3B7kI"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f6617c7536so1551471a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788779834; cv=none;
        d=google.com; s=arc-20260327;
        b=QU+uGEa0U84JV1legQzyQk4R6HebC5pUKg+Sqit8bu761ohWno5/uIm1EZxPE+K2u9
         +CrkaiCV4XPYMwCOtTiF9FbtWC8ImASDuOxmS/kfEKmczwndC4OH8McKfEmhdQTEXn4n
         7y7nxuLv/vzrIgASL5dcI74QfQVQ+Ks4RdRtmAmOyBZqWZxY2USmXaZQhY/W/aGpzEak
         1hHWjKY9+mEgwdUQlt62hGVfv0mu4Wiidw6zGzKSa420oPU1QsHbnVc4r+gPM9GSM893
         OuYOClvPMZ1IxzzW/dmPJDy3HFoVhN1t5YyxMxTLCmWbIanpKsWvjSYYDWgo354lshA1
         JKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        fh=7HUvE7x/2MkHWJtJEhWoKBCvzZspK06GELwT7ig8iZE=;
        b=Z6S6muWRVrqgBlbSLiP64qK62bqzwm9bK0JdwlznSp4NX3EuQc0PupVVIGJxvmtuc3
         ZtcCfHV2AEFuupCNftn2gNhoy9nIlKpRsNlZe7eEWYROjBcXVKS0eCw6/hozpVXct6Et
         irCkSDfdMWivEL1qTdiNgkZ4Ds4MlEZS9UOil0RvTZaWrYY3Q2vDqDy/6BYllpOHMnFo
         NCqlpn2VYw0mRqZrPA1iZkcyrOPWr3UaaIfHmfNSbgUuaDjlzZHg4Q0uztH7tL3FEZgY
         WHoQJZmA4cjL2KvPwGNKEjUvqh2jIDQ5AGJj20FivPS7gXGVip2u+I6crHOW9Ih81zMp
         bY1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788779834; x=1789384634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=JTk3B7kIT/O2NHmbAYbIfXtgNJlqMsTFHBu18yPLQtnGiOlJMJ504Nfyj0lz8WRLjU
         sP/SOSggyu7UJKZd61Yfc47aASI2/X6tbn6VN4jWK0prVV0CIxAGZGI7DVF7VgWfborv
         8XvfmYzv3HKGfXrWfBLluBC+Y6gr0BkkFv+Z7bUl1E+OWEgYnT8k+WjWFZ13eTMStaN8
         XPBEts67if/LnB7oDnRTyf+aTWq4n8fHBz/mrz0zzqNjsSv+mhcReSAnjbmwRfd8BcEq
         fIuQxxMJ3rlo0BcZRQPX6iFYRcVo9CixytXy6zS9UIyjIhBklhVh1vkPaRgHQDDofH8K
         oBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779834; x=1789384634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=aN+kyX06tJCNSZ8/kzUnHtOTvC9pkWTfiaV8LxhKCDJfCbBq/8Sw2mjdxGWGZ9BBoN
         5N/Ptmbvny44iR2SHu6oTvJWkp/N3jZ00QFd/FNjwd8AmCgNEyIUohfghTDtdZR8PYe/
         /wlhj0hX0cciu9OLggCCt3qh5B2WqSMk7Cm3ECHfodamfk2yVjgRRhFpIJzLN6FE8W/m
         XPp+y7feiYkiJkG9Q/g36mwkopsvMN8qMtt4IV7k1q0RHrh5hOcp00jwRpJVeywWmBQB
         nUg/qxjTsiOEhWcPGlYAV4QEW4CSRklI+Dq0A8yFabXSzZGgM3JM0QyWEYY3E2xwOOPM
         q4nA==
X-Forwarded-Encrypted: i=1; AKwUvBw4emcQCuFNzm9foSyzdiMoQVXlHYUatTiPl3QVz9Tf4vMDxa1CEft28wVr5rwcOtOIummywyJ+oDIbQhs=@vger.kernel.org
X-Gm-Message-State: AFuF++njVHPigKvXhOdHCreXmgd1cjZSwtsqtmjrGG55j3vUz5br28Mg
	yTs1URMeerYlTtweCzRzyO4fvuIcNUzmTllBlAMUoe7ExAhVClXfor55CtLMtsBaOgPAWxnihR8
	zNNWFoGRuujJG4xmcXNWoZdLwxGMYfGM=
X-Gm-Gg: AYBFou1oJFCM7Jcs5LeCBPUOdr73OZv8V29dtlwsl/bWkEOgaggPYqCar4F0nuB4HPH
	TKNDxAiszR0W7uZrq9akMNvHz9zDvrr/CZDqF2UntEnBVJlXKZyivOs6wAkCV72GhsWH9d+k46p
	7tuQnj4Ru97BrhVPNNQorGM7aBfr05aRMxYiMdiUnLwd7CKDFHwQCzJJume1cVmBVkMk16JA2hQ
	zMQKoQU5DL+Z0zPhGz3eVtuGEDi7oBzBeyRKUm2uWWdpTO7/49lWkFVobgSMycFELebyPAvxQL5
	JwULWQM697/Bedhzysxohgq7mNiok00aI6UiKDw00ZOe6mfvZXsRjWJ8+TxlvYbs1+mPFA9p5Q=
	=
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id
 006d021491bc7-6b6fa7e183amr13654410eaf.3.1788779834482; Mon, 07 Sep 2026
 04:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813062039.14567-1-kmehltretter@gmail.com> <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
In-Reply-To: <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
From: Karl Mehltretter <kmehltretter@googlemail.com>
Date: Mon, 7 Sep 2026 13:17:02 +0200
X-Gm-Features: AcwNN1UczZjMW4p4EYJlnlzfPEBGVu9_4lKAUmRz_TMoKp6TJFSsoOPV9Fyqs_0
Message-ID: <CACzUYvRVi+XW2piwsBE1Lhe1Pg7Z_mNvFq2HX+da8RDpzTXxQw@mail.gmail.com>
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 7. Sept. 2026 um 12:37 Uhr schrieb Joel Granados
<joel.granados@kernel.org>:
> I don't see this in 7.3-rc2. Did we miss pushing this in? At the moment
> I see that syscall_user_dispatch.c is still using CONFIG_PROC_SYSCTL
> which is never defined anywhere.
>
> Two questions:
>
> 1. Did I miss anything. Is this not supposed to be upstreamed at the
>    end?

I already sent an updated v2 rebased on mainline with an adjusted
commit message:

https://lore.kernel.org/r/20260822072325.51994-1-kmehltretter@gmail.com/

Thanks,
Karl
