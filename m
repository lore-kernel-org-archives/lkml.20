Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682612;
	b=oyxUuGA1vnOVtwMhaJ2Wn5VO/j9P/Y8Jic0PU+PWlsYZYuAGg4zGVPK+oSRKYEc1NADz
	 oYZoQTywUe8qoKRfCXImH+JnIx3hmUCqUo0uGy06qbqROjMji/EtdgqC8tSDZb50FDDGY
	 Q564htPuYQ2jVf7NkHHalsq30RHVHHUPisa24UaDBcO/CY74/3HxaByavifyG+MsCceNA
	 nO6PfUwCJgV3VXDDTnR2PUZD+CHXD9dSfhBXze9XIaDcj7r/AFEJhMGF5PNSFdKV2mYES
	 WWiUzMXPHoOtADeg5CeF1xbY1RregarZp0fq+PFAWiXLuf2mY9lva9tbPxtPjBG9Sjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
	b=OXB97DLZams/RAOYg26nk9702SRWF3JJUQptYkRd9f6i0TOTtaEReOj390U4oZPC+veq
	 f0xWz/FOBdVXc/Vxq9X7IufIRqHl4WNBovTqgbFF0Kb+TCQZnEYC3vqMTcYfEnHNYUqXy
	 MI5/RGieG5pXXWKTZbKYQS76qnxmOIljI0eItdsWodXIsXsi6KW96dj47CcD9ZV4mXDHB
	 5bzF6LELdZGmMdf/v3c4eLsdgvh8CV1hUNMUXQpQjYquUfFo3m17Aj0os+f2ohJEUxgAJ
	 s1Gunjb49zmWTa207UQLCtY9wdSQhZnkoHsT2wByQ7nBjtH14mY6H6U/L+LGP4DgrVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPcXOyXn;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC70606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC70606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CPcXOyXn
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1101533241.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682611; x=1793287411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
        b=CPcXOyXn/DGVCoqRgq5H5e+9MESWF0a85ivXpvn4UAya6/ZGP5UeA1ZnBuGnrLRFFh
         AjTeLjFmwRxHq8yXsgXZifiYpBQt1XUZrwvevsxJOMwGhjf0rH/Whkvpl7ZfhBcqh4FI
         EkqUwAvXou+0EOX5+Tuop/DT8j40mOIbwsI6KjkNrQl2CingR5PPEtNwa93mtpzcyZJ9
         499FvypsmD5CI57ewnqunkmU9A1sURyIxRWlx1OL700rEgMJeqf6u0i3K6eGabqivnsn
         V2Snh5TTHl7hhGWWFhrr5J11zeaZDwHgcDLXJ5k4aVNhhs1YhQ+kbCY2ACAYtEKFeS6u
         9SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682611; x=1793287411;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aMMJVhb/yYciWVQAAWCQmERXG+GAY5iNLNs2fW+mSs=;
        b=15eSHj8aU7CZ2PPzsPxuk9wvc8MLr0FzUB3Q5Dngfb/pXdrETn7xdGxO52gar34B+i
         e47aV9iBrmmnDOjgJuTZmOZlBLzbvLeYDpiNEhJm67SdBllqj7r8/ocO6mCDgXepH3H/
         ibjJqRYpvMHco5Mrdz6kLgVOmnFQiVKkQF3oPj1lvxk61CO0wEBdzKhP5kPJOV6AbPGF
         rqxDFdyTkYA+myNMwT0ibb3PkjLU0pWAUSFpKULcfFDm7rRh+0tTX7MkspAX0EGm5jCr
         R5E2BA8UqS3Yv6DUXPRBbH2XryN6Fcm82gHNg/gKTlsIRJM0onP7cLaj8KdOhhjlNJF0
         eicQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvhQ5Kx+RrvyWD/GW9DrirTlF31PBr/0t1X9pRJFvEKeDr/4qBrdOnSGD5lacJdMMtge+msUwjsnVuXSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpOdMq4O5Sdi4hl5Rh3BqpU5X+vkCuryfvUg4XdFrdfsFzliIv
	EMslvh9iyxRn0rPL8HtLPV+cBCZtYABJ0NkQsnc6TYNx1qCnJQDd8vr7
X-Gm-Gg: AYBFou1WVPU+xgG8JbycFD5jL1vAROt49DIFlmWVwzgM5SBwH87oqWTMM+siJdQu3Cu
	RUJSvXQiifjIbCIFhEc9tckwOpUHjiG0ZCUIlKqUmbmwQl2e6FibOZZb4iz9cbbzl5r1bST8hFp
	V7iJ6k8oqIGBsUQTvuN/41Xp9h4OrNjxEcHaMDzYgnff/PIPChmofgF3oLdoUJY3zlE7N4S1vtn
	N5w7AV+wjOtifx8AbR1Up6YeG9QDRAfrDuSLwqElbekP9SuRIvhfhIHJL6YHdNP64xfoz96KfnF
	Nw8fFEFuwiqZWzAaBDJLTLKrd+lokkDrWybfecQDtIujw40vJLMMamjK0fTZyeSaFWNJfrvLxgJ
	SoapxhF5zd7YHSTSWcLSfzySqN48Sj19MahoNb+2B6JV93/glkHK0wm4pVmsW2tJfUPxpPNHoJY
	/TpD4/D2kz+MskbDbcMZ2CjCT5Y5vYlJjspXMmSV0sFKS7Q5aEaRrA1+wLL8qRd0Q0yudyeAy/S
	anyZMq8t7eWNI6YMLjlJKkVOaLjg/23+kozg6IqeJg27T4n1J3m0SxosITO+K86B3LPq84Jmdml
	anONhurAnYCPdP+pVDOlAJAW+sNGbGPhGn58MW+4mGOb9s0OnGYDFUvtoEmFPP7h8QnumF8pMrQ
	5dEIyo6gv0N5pSRQK98s=
X-Received: by 2002:a05:6102:290e:b0:7c3:90db:ed50 with SMTP id ada2fe7eead31-7cc9264dd67mr2189802137.17.1792682610974;
        Thu, 22 Oct 2026 08:23:30 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d12049e1sm6759034241.12.2026.10.22.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:23:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:23:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Antoine Tenart <atenart@kernel.org>, 
 Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
Message-ID: <willemdebruijn.kernel.2ed6416f82cae@gmail.com>
In-Reply-To: <atnAmOuzTuL-0f4u@kwain>
References: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
 <atnAmOuzTuL-0f4u@kwain>
Subject: Re: [PATCH net] selftests: gro: remove unused variable total_data
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Antoine Tenart wrote:
> On Thu, Oct 22, 2026 at 11:09:35AM +0800, Hangbin Liu wrote:
> > From: Hangbin Liu <liuhangbin@kylinos.cn>
> > 
> > I hit a build warning when building the net selftests.
> > 
> >   gro.c: In function 'check_capacity_pkts':                                                                                                                                                                                     gro.c:1249:13: warning: variable 'total_data' set but not used [-Wunused-but-set-variable=]
> >    1249 |         int total_data = 0;
> >         |             ^~~~~~~~~~
> > 
> > Remove the total_data variable, as it is no longer used.
> > 
> > Fixes: d97348474708 ("selftests: drv-net: gro: always wait for FIN in the capacity test")
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Reviewed-by: Antoine Tenart <atenart@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
