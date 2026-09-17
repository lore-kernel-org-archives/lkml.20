Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E7C392C4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612725; cv=pass; b=rXh72N5/nkovQrcb7qXvVKScopH5bkofg6Jr/eg5B1RrZUmyTSHxl4AZHQ6JbuIEoE2zfgMbl9iiJGes7pnGH1DThTD4eJXLgFEjf31NmECwQUHmxDnhD5CIo6SpGYqJYKZgLVEiBwHX2it0sRkVLSYa5DkZbtZRppAdhxLrSxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612725; c=relaxed/simple;
	bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/wagjyp21+iIjGbSODBzcdNVjCjl6gAPV3kxDiPuPd4Gmpqb/TUeMYdXj49ySg+m41DXRrqVDCvYmqvYKUwahIc9BlWYWBJWa+DmHSqR90HDkkmcFiGeM1bj4fL4kxx+TTdgQZ+//bWTRZdO2cVgIOFH4Y9Hb03OUdFeP8f6oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fr2BErdp; arc=pass smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fr2BErdp"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so132383f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789612717; cv=none;
        d=google.com; s=arc-20260327;
        b=B7048rVLbwq+FKMpWWZVi5Kix50lApTVNzZyAdC+/Sr9v3Ny7M3AQvtc7Su2ZGkhGO
         4IA7R+zzBT6WRqctnr1FXURNrdtxyw0jWV3JFC3fIreiXs8DcWd5hNvjeFk5SXIH3mzC
         SmJg779HPVlbK0BQFkna0AJmAUgbx3DPZfx6s6CAkzAK7P8B9xrft4v3LHJXevaIzF1p
         rKO517kGNb2Sidju3M1mqOIxqI1KivynKV3bgEDKv4Sv3FQ4fb3F/Q4KW72c/y4KO8oD
         7AAVk7BznxESM/t4zhsdOgRD9IpFhzBegCTcE6UKxD1TV8VZxKM4DMKNlZm/I+uyfzGB
         Ykvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        fh=2vB50X9kRA5PSk0YCbmB2saFh8lg9Az4Gbw1VJyxylU=;
        b=j5TJSZgOmdLOgT0BxTAvOAPJTgYehCPJzUor3j6VtV/V+QKGiR8HuNLBIY+J4jJg0L
         ZXFYl7/G/BfNOVYQYxKMrjvFVjnNuVNSnEDNL2ulkGxoYtyRRhLLl8L4LfY+Z2+lpOvD
         mxIGBas7+P2aM4BornfU3wyrBN13hAStDrYo2r3s+/F0d32S0rChaSX06udU6KjxGKJG
         ymG2Fl25I12aA1GAWRyEg8gk232PXwOF9uV/qnIc0m1DseGYcrC9ILUyARdB7lKvUQK7
         4nxIppxyoapQ9sXtGOvbkrUBKBVTDn9qjTxW6KjsIpRwONjGcb3I4eFMG9KWFyfSyR7H
         54JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789612717; x=1790217517; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        b=Fr2BErdpNEyRRXm/yaFnwVK7SRheemtEuSvCkgNqa6eReSyU2ckmNMs6Cjetx838FX
         zBf1i3aNfTji3i04D6J7wsC77qqNRojD2V8aqEIdPeBCdU5oD90geqfKuLnKmKCmq9Bv
         hjqqts8Swlr5K97CFwinNd5vACChbH5zSCX2vj4cTdl89km07jvIfWMhLECfbF9PmFOX
         XVOMhRxsGc9ROysYfZntXVmErea08KTxv9KkM4A10Zt4AowCS5fEk2uDxtZo7c00UyHM
         EmgZdTMQJZQnLRyMbI0CO7IDzidX+DwhSeCeOjm2mBb9/+3oXRkCKq4M+2dC0RCHPFkT
         C/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789612717; x=1790217517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vq4o8SMQXm0gA308FoVdVzcFOKue1qv39OaHjktBjk0=;
        b=h3AGUs59/anBnND4t0D4FE3b0EQP8uTkESsbHct7e7AF5wG5YO7eTzpDl1ukpi0MRG
         IX2GqaLoKdWl+OW59dwTWy3yCbSL7xUmtPc4KpGSZEfJzu/qR4JEmmVPY1wyjWPU6OY8
         eRRZJNjagZWsaf9j2Hdbptoj4Az9hvJM3m21/Z9UIYBTz2v0t5u4OdSjz/9jsKrigHKK
         by803OUPLoh/eGe9WI4JeZFQhHm3/HgBkpwWVXZ0CqeO0NoDvpVOFQFx7Lu8D7Yy2InA
         WF34oJISjrE1vTeA65/XZZ9VPjq9u63nDr3q4AnXsBbo/quIT7isfrxiZh3UFJKCBIOJ
         EHKA==
X-Forwarded-Encrypted: i=1; AKwUvByazJ42hKumXkaYfKGv+UKkiNXyccOQR0AS+HaWdrqSyBCNEVQI5jSAbrb8n+fY+A05j/HZc1R3DBjlgIM=@vger.kernel.org
X-Gm-Message-State: AFuF++nXb1/TjbnEQvldRVhUqtZq+07vtEgRC4vth53nAXB6It33wvvH
	lAddZeDR1aIBNXNzvBjTD9ySy1K1kNeYuOgStQ5G5U2CsbnpxbxwUAQ+m7j8yWQFsiL4z2O8+PB
	T2ZVswseI2+IRzAbm5tB7O84PSZqaom2kT4ngef5B
X-Gm-Gg: AYBFou0MivkMOvoIbXnTLfpKAKI7M8w5EtoVxfDmiZFNPhQU8mYD79+t1j6K5OMohZz
	QhZc7NxFOqbBU9PSSrfjJ+ZbQberctCeVcHqZLt25N4uO5h1sia9+qv/MmA487MnSd94NYFukm6
	nBX0IoEiVaV+MI5UoO+XvHp0pn5Z/2eiTZwtmivDvvmEcibBxDtFRYCqALRM+eKxmZ0il3gn4AA
	Av52dIA+FC7vZmYh7F+xE18BcZOoVpTdWlX0qQO5Y4LWhZxNpl/QRsVVQaRJ79PyBqk9Iyrjpuv
	2a24Q5HLGKWd4+3SR1DbKi3GLPbn6OjurdlHD4NrDXJEsWsGTRkEgTa4Z3RXpA==
X-Received: by 2002:a05:6000:490d:b0:487:342:d142 with SMTP id
 ffacd0b85a97d-4870d16b276mr5758481f8f.44.1789612716970; Wed, 16 Sep 2026
 19:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911193208.410015-1-jthies@google.com> <2026091633-sinless-freezing-0184@gregkh>
In-Reply-To: <2026091633-sinless-freezing-0184@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Wed, 16 Sep 2026 19:38:25 -0700
X-Gm-Features: AcwNN1XpuCi2cTM7SKEf-K3jHaqLdXUfZIHv1kf9oqVEKu65nfK0QgLQpuCFung
Message-ID: <CAMFSAReNTsHdCqAX7RUEKUhaAeHOfPoLRUpEyLrAEkJAZDOvFg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index fixup
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback, I'll send a follow up with appropriate tags
and reviews.
