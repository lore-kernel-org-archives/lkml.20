Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFF35E1A8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220932; cv=pass; b=BK+QYcd98K6VtlRP9CueViVAQiMdvtfx91FeYz0Q+cwhensrHQXeJSjDcHJHfhugylyJ1mYesytrZ51zDFiWDvaKHwE5QR9gsRHYxXJ0o/BX7OXMfSQt/92X5A46hN9JTgCRFZN0zEa3HZ66XXJrySS8CEmeA0bVMiHErv6/W4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220932; c=relaxed/simple;
	bh=Dm3QyVkgDubMoTiOQARsGxSnlOjpM04mOF4UOIkGwAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhNZ2tgOmIrRVce0vpUiPEoVpqEISJVEhk9mvD7F79NfnCxJsfyaApIAHG1flAg4CO1pe3YfysSQjLaYogX0YxzPV8GhzjV81T9byWuXQPJIry9aSvHwJ3rHbmZUze+39AyP7hOEJeQBHgqMH548iVLnfZLUN48gV1NXuqg6yrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lqs.me; spf=pass smtp.mailfrom=lqs.me; dkim=pass (1024-bit key) header.d=lqs.me header.i=@lqs.me header.b=PVL+vj0s; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lqs.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lqs.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lqs.me header.i=@lqs.me header.b="PVL+vj0s"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d8a00bcdso10685191cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790220930; cv=none;
        d=google.com; s=arc-20260327;
        b=Tt08KqUmp01IJY3erpz9ryKZLIqxfIz9SQ6lTt5RfXE0sPPqSdgwbG4yWo48arRMM0
         VYbeEtjPrmpcaGKimtP9euRXM8CmR84xz7L9Vek4WrRjesupg8vgmqYbyStNWrcCd/p7
         TZMjHq6r97kpxXftyYEiyfM6K5eQRWm6JRG7qi4fu2xJFF/QmsQCdEfcqxB25ZuxwjBA
         UBio0Dh38nUKfhkrmLRPCU0CuTRHu1Kw3AYx7Zs/XZK/C4qsFpkDVjwdeAXdchs9xcND
         9b/ZTHgce+G4O8NiOZkvxVQlww742MVKLpvXIa53AoNKpEtn+B5B+mqn35h2hYYdPULj
         f3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dm3QyVkgDubMoTiOQARsGxSnlOjpM04mOF4UOIkGwAg=;
        fh=cTsIh7WUKnu+iDmeywCCoG+cNDZhGP7NDUyzwW5wdf0=;
        b=Tzz6h/b0+viu0dQfZdIuvjarrXIBIKzIjnuaUj/E6chFPF8N6Nyw1jqlRDfk/wy2jp
         rr1knUd0scdifyWlgZnKsN1cWNOfmtPNrNb1Y5bQMcE4PIB+BI2o3zBZDFg/KXG+bfe5
         ScOy4N6Gr85YVRDhXbTw9UXiZ2nRXcuPjhLK6OgOslcjdcBwPha+Is9Y3/zMHCHF8cyS
         XZauDHFvU3nidXQKEYuGy7DeCBoxftBQ8Wlg8EI7ahgLnuT8t76lu6DQnbLp77MFgm3r
         aiSHNhcXseI1xrB1LKdPGu+ginvik25PqslORVJKZzI4Yr/JiViVfR+1uM2amVkiZwv0
         jL3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lqs.me; s=google; t=1790220930; x=1790825730; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3QyVkgDubMoTiOQARsGxSnlOjpM04mOF4UOIkGwAg=;
        b=PVL+vj0smL+u7HhDd4slEKcfASGVKXzZGVEWXj8+0m4iJNEe0qYwRXSzDpQHa4OHgX
         XQxcbVY+PObhMp/zyJq9J3E4ZmFGMDicy7VbumsFcFAl9FjDHsGK8YbYgJ0oPeMLBhnO
         4mkEX3sTjwxEwyD8IvoLYpbjwi7qWivABPCYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220930; x=1790825730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dm3QyVkgDubMoTiOQARsGxSnlOjpM04mOF4UOIkGwAg=;
        b=1Ijz9ksW+URJUsP8xW8us35gDgRhK96xwmVOAvemBuYP3jz9fSi+Z7P8u3nCchWgnH
         edo8do63PngqCz3QJZJiZ5pmVvzFZaoWQK6130ehOpa5/2TjMTICajVNDwoS9wN/SfaM
         28ZAZrK3e3GwGWeBOmgIbxXsmbMYYUOvBtJdq5fQ6N0gkOdIeSE0q3m5wOQw2pQShLS9
         loO7pEpe4MD+U7cwuuJmhjgYLHbM7EQ6mYF38YasQwKozo7o1npRv1LVPKpERkZ4xnbz
         n16+c9joVwHP8Bpf5sifa+1UIjyrMtLuFJmP3eufv+dFh7TRkAL6Jf1ZUoOT9pjUWzeN
         8tRw==
X-Forwarded-Encrypted: i=1; AKwUvBzQlkPUKNiZMt0SCu8QvmcgMgzxLZOnHp0POY1p0QHHJHbqeIvgwVpnGHBhZT8OsYqLwaMH4ryObusZlWI=@vger.kernel.org
X-Gm-Message-State: AFuF++n/2zEctf5TZKygMJaYCLxP+/sdjGttYChcEcbr7adQmcp2HIdV
	Yu0YK5SeLk7ips3NIJt/GoYOqPJAKQI9N1BODGUhRk4LCJWJNV0Ldw/xIWyAb6taK1ZCGBZmHs+
	y0qKOWFQ32fD2cRn7FFpcrtlE2I/qUx8JNp+r7pWi5A==
X-Gm-Gg: AYBFou0b8jyTCIQOkNuPATxpZtj4buKhaHG4KxbimPYrBBpbmc5KBTsuPLjMoG5687I
	ATy4tOEhAx+iwZ+bOI8sAhtEVEpdIAy5v/OFpaS1v3FSxHqXNHsVjCjrr0O7argWujlQjENgq2b
	Grs+7ydjcEeC+5NqDTNNp0TiZkfcEvo7tkPH3wxG1aLeRUOefBWG5WRIY7WXH8IEyznmluAJUiV
	DP7or1E6Wc8PcbF6vqhnbhPG15u0pXN4M3Ac8AFTrvCmajnu69qD/xcl1EHIOIsWOeLqSGqHjej
	KkKpQLVfl5oM7sq+2rHYU9hVPskD73N+bUHzBD97eV2KNA7gH7efVhEGiPRbabrnRVppjB8uDHv
	SCD/7KEv1zMpHZ0W8U47WJUQ/waYAxigmwgKl5G7opRNZ
X-Received: by 2002:ac8:5d56:0:b0:532:effa:2c09 with SMTP id
 d75a77b69052e-532feafa23bmr5244311cf.42.1790220929944; Wed, 23 Sep 2026
 20:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923132048.3272878-1-lqs@lqs.me> <arR6KOhDYJrK0lqB@fedora>
In-Reply-To: <arR6KOhDYJrK0lqB@fedora>
From: Qishuai Liu <lqs@lqs.me>
Date: Thu, 24 Sep 2026 12:35:18 +0900
X-Gm-Features: AclHuK-u7ZWs5YCZHarhNQR6uy_MBbFvpCvCpfsOuu3gU7yxMZlU6sPWxb6vjzo
Message-ID: <CACtPduyfC3QMKsFTLjwvVRYfa28T-mNWLeA0CPLtRM5=s2ZnDQ@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: fix prefix route expiry in modify_prefix_route()
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:18 AM Hangbin Liu <hangbin.liu@linux.dev> wrote:
>
> On Wed, Sep 23, 2026 at 01:20:48PM +0000, Qishuai Liu wrote:
> > modify_prefix_route() is given the lifetime in clock_t relative to now,
> > but fib6_set_expires() wants an absolute jiffies value. So when a
> > permanent address is changed to a finite valid_lft, the prefix route
> > ends up already expired and GC removes it.
>
> nit: Does GC really removes it? I see the expires is negative, but the time
> seems overflow and GC won't remove it.

Yes, it is removed once the fib6 GC runs, i.e. within gc_interval if
the GC timer is already armed by another expiring route, or right away
with "sysctl -w net.ipv6.route.flush=1".
