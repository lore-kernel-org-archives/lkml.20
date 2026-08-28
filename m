Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B5369990
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932324; cv=pass; b=lrl5Zc4PGGmCBB50kdPoc9T9gl4MlUKb7sS8TtjsI15p1M+wD26jrfxJFgrVI8MbmdFxXPOZRd0AeDitakg51QyRQ0u4wzAnlsogDRGFEBxNxsIIT252Di4kITs6eA2Bl2USSJyYkJHM0Hhk8Pf8mDoajQdyUgg3mFpjkeqA7Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932324; c=relaxed/simple;
	bh=aoZCNrfhmX8pZEoM1qBu4ztXr1H/TOUytZpURwnLYPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/RjuMFpfVkEH5jfSoaayIWgg1lz6jUNVl0HnrB20l9fwWa3EIESeTaPUKE/mPn/fMot5isI8muGZ/K3cX91QUEGVDbc4aYtG5QV6UvK1E0NhWaJPOa0nU/vyNVXEo/8Hzsny5M5tq0CnfmcKkly8XHMuJQocMzHNItRWVac86E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QA/9z/EG; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QA/9z/EG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5218927884fso13145331cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787932321; cv=none;
        d=google.com; s=arc-20260327;
        b=TsC7cynYGEF5pXnyCTS8ONrZqbcWJXLNTkw2WJdiyo2wOr0VmTFFWskDhmPh9TZPNV
         yYTpyAvGEhAVWD5L7ru8c6d9cvFH8+R+aGffK0tt7TDMcPVtie9EJXt772P2uIA9/ECt
         OIf0Sspqqeph83AZyzkwCWbDSRZg7DSosGoUa5Oqn2v3M+v1IfLa1k6INnUagekHBqGs
         gQS6HIcfaQltC/GjhvQ3ThXMXNXQUO1jx+YaMawNGNC62PFjBYrJx2+mlPJdshuMNh7w
         C46oxz0qAe0nPyxPzHo/nyy6kdVhgNtInZjts5vVfbjz9ew4dbx2q4mq/kmU3LtedtfS
         ndAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aoZCNrfhmX8pZEoM1qBu4ztXr1H/TOUytZpURwnLYPw=;
        fh=TE4qPprsVfGmvAnIL2evHANxdhpgF5GJqIo6A8b/Fv4=;
        b=NoKPfrCtKImOpXqJVF6hOq7tF1KnBipB/9q+tJSd5bOe+X5Wb9MWGyJwjp8UeEvys5
         L28DKRALpQ1rtTah1diyE6Hx8YR7hqHju7PPRwFaL2G/Kf1qQvaiwh3XZEY0lvF30TrU
         eN39a89ltlMER0BzkS/3tNpjXrVMlViMwtUvINC80PMLECc1gtt1XVPOEyCxdvCLAju/
         PZDTAtbAK9JOE9pH3UKwKnbohHCBqx6vpYDKwZBi7KG/rdX/PERR4yBAfc7q8GwfvXDt
         9C0iTFRdIImmjCCsJN7Dq74/eiFaG5RS5Ww0/fKSMcWczc4PkEN4nA7zWRRnf84KQsI0
         tm8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787932321; x=1788537121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aoZCNrfhmX8pZEoM1qBu4ztXr1H/TOUytZpURwnLYPw=;
        b=QA/9z/EGmDm+xV0rAWn/nYFkL4wB5KbDc4lgTbYkW4cwA7w2JycS4eo6jPJMQ0iuQM
         I/l2QGEMi8iDm7ysfZYdLl5/yTO68lBqCXe8IADnK4rLtEvunhVlqmFsmN/Uer8bbc8m
         L3CaDSCMD6lvQeHmlO6fBLcNUChGiX4IAuT1X+IChmz0ObcnOgquVXn0ECQ/0MF7+EdT
         aB6Vj/V01EEQEfZTMTaihY3QXAZt/E0TE1UjS6U87jtuQOdvyucpHio8BhFwYjN9EyNc
         h2hXgjylpntiewt4OtdPRRSqv4iBvYaxQ/e+QDfpy0b29/FPPLV55KAQn9vjtU5zx1wX
         Gp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932321; x=1788537121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoZCNrfhmX8pZEoM1qBu4ztXr1H/TOUytZpURwnLYPw=;
        b=rZL7H6T4SCewMpRC1BJ2lIdk8+0RaDq4gaNY747ogpbjxbJ0Ty3dTVYYVYlDe8F4Kh
         HV9X76XG3kMDQKlzVE8RlMH9S3XzONHZvZ1ktm6rdzhO7AdV2Kn4G5xiig94/a8A7vVi
         aWQxXtOY8h/3Oh69qrsKjA1+IKplkE+0wZvJ9suTFTQgrXbWuXvYjgcn0hXPUc6oM0A0
         xVKN1g7zILkcw3FkHrR2C5s/KMDqXBygdvaYUOSkgQqfu+xwQ7yq/pEhYCCvRxN5CuGI
         /ux/04rR1S0QoRcxEbfyLDANQ5YQ+qb/YtEjzjrmR1PQBcoxLCa8QXkYUZyX9Krr2dqG
         pR+g==
X-Forwarded-Encrypted: i=1; AHgh+RqddxkbEQdtK9jz9u2nGIlls6nvf8CM0lAoaFIxvlt+JLXET5gkKgNLvo1Adqw6udOOYG12odTPCmHWmTg=@vger.kernel.org
X-Gm-Message-State: AFuF++m3VH2VEzuj5Cd6YxZ34y3woOdt7REIoxbHgLXLkHmrGPEadqla
	7SLzfJRGIONF+Htzl4msNbZULVHAYQ0UngUjvkuC7HadAIN6fvb8Dybr5eF4JDXw228SxcHgEl0
	B5V42pwrtjffjNJKw+140NBJWPVXqfu3QIjh6M3u3
X-Gm-Gg: AR+sD131F7VJNQa8YURDP5r+MmPqZCX9W2gbeCvSIPDTRmQLWWdt0gSUx1tD6Wn0tnd
	GpWGnTH/Sn+zcS++Cu2aDfizxdbOn4W1lbmn0emV9FjHl3hCwgb3kixI31hRYWaVQADwLU5tBOi
	mrAAK/ymjijDVXGhJncBI5ktm8b9H2S4JnIdKYdPDtv5GI+RuhVWHl5RSFP8XGi6m4rO1KkZDEA
	7LXO/yhiBxLcI9oGNnkG7M/zCZEwBE0FqS3F6lYcM7vC2ymnIkH3kCtF3R3N70GLWnpB5Wpqv3q
	mJWPABRjZq5lkSy05rbMluxWKasJhT8D5WLOB6tKNejIvrtn4I9cBi6YwliXkZZLVEVWZpz3uw1
	v6sTE8AQzF01F4Qdq0pZMVBZFXJ9zuECdQ8qKV7aTuTpruUwpP/XVFKtDE80=
X-Received: by 2002:ac8:590d:0:b0:52f:ae2b:da0b with SMTP id
 d75a77b69052e-52fb942d67bmr92898081cf.16.1787932320576; Fri, 28 Aug 2026
 08:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828012918.1461-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260828012918.1461-1-xuanqiang.luo@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 17:51:48 +0200
X-Gm-Features: AcwNN1WNUfRz0c38YPkdkzESErlfZuBvnROhijzV7VpnpSfwkeHLO6YNKkbnH8Q
Message-ID: <CANn89iLvTQXe=nOdp+VNfi1jpeupkknNLhtm=_uo7MVxKV6JAw@mail.gmail.com>
Subject: Re: [PATCH net v1] raw: annotate disconnect-side IPv4 match writers
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, kuniyu@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org, runyu.xiao@seu.edu.cn, 
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>, Jackie Liu <liuyun01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:29=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.=
dev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> raw_v4_match() reads inet_daddr, inet_rcv_saddr and
> sk_bound_dev_if locklessly under RCU. Bind and connect writers are
> annotated, but __udp_disconnect() still clears the same fields using
> plain stores.
>
> Commit 18f116931f52e ("raw: annotate lockless match fields in
> raw_v4_match()") added the lockless readers and annotated the raw bind
> and datagram connect writers. Its v4 revision intentionally left the
> shared disconnect-side IPv4 writers for follow-up cleanup.
>
> Complete that follow-up by using WRITE_ONCE() for the disconnect-side
> stores, including the inet_rcv_saddr reset in inet_reset_saddr(), to
> pair with the lockless raw socket matcher.
>
> Fixes: 0daf07e52709 ("raw: convert raw sockets to RCU")
> Link: https://lore.kernel.org/netdev/20260716142958.3064224-1-runyu.xiao@=
seu.edu.cn/
> Suggested-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

Reviewed-by: Eric Dumazet <edumazet@google.com>
