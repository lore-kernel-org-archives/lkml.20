Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368A449B11
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774083; cv=none; b=DYKB/AR2t4G/h2Rlf6y+4Hiha+KbZZHaf4kANUpMNfwKdkSiN7dMS97Uavf+o/7B39pjPNQaHMmAjXBeuJDE7mmiyyHr/8mr86uAKCBuyKvcMiX/L66DWDFBx+Ysocj5sjTiIUAr/j65sgtEGBD9lr20lngHqMk/Z0zir2xSyJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774083; c=relaxed/simple;
	bh=rQqHePLWdGfRjZ1vNvNSUN+STKeoOIcZI5Q6jZ5P4zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx4/FmrxO+ePd9zwylMVpJYdKuB9s0LrnN3f1IObEt4wYSrTHnm48oRtAI9pdfsY+Oh4L76/5tXsm2wOsa+xzNVRKxtbfdRxBX7UAWzYmtQrh98zj+ZLKXbfhAZjFj0C8zfyEBnIitm5Wg1sm3YZUgIg0092raO7IoAwxs/X9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=MDgVWSfD; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="MDgVWSfD"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D7E03F1BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788774078;
	bh=RYZ4OmdAPOoMtab4t2tgvajC94K/KaFxqp3U+WedQ18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=MDgVWSfDQdLtxJtGQvw/ueg8uUjL5zknX480KXQbpAgI7ijDfjIYnbYav0BsLqz+a
	 KmiorajJokFcweLpeqYg+2WKi/qreQyBBIWQRXPRn9L2naCEpq4eGW5qswXPC1SMh3
	 BIMA1vczpwVM58jHlzmuZXUcqStAjnO84BUvqiRhAol/TISeABh4TrS2wLn3xb5WRT
	 POrXAMSR/NljaN+wGMkiKfqPD44zo1JOHM0qorX9XRqo/b0RAKXR6sQrNk1BlXSzJd
	 6IZIWrqq1PhUKn2lFbjEkeB2K2JdPBcC6KfOg0mNWGk+w5QXqJ0dtXc80tYv6a5U7J
	 Xm3c0UwXQIAWdKIpRo8QyL25nsPQtjm7wmNi6JAmgyADxHEDSh8bs5WjWYWW+e4fts
	 GUEAuDEol7iruTX5cNe7FBjpJI8rjscdiD6UlkoTIg1J27SnuFCTyvjB3WNSQjpYQE
	 Tv0z8tiAwc1TqIAnixy8d+8xpHCTT9WJCdFLy6daDb4jy1l4F5+lUzd8Kb78PlTm2Q
	 7/v9iMmLIPSdgyjFo0wdck1nkf022XUBHq0W+nhTKZrGJPm0sR9R6nu1g9z9+mGEVR
	 dbffP6aVQdrHvJpAD0W34vWLd41+2SNJO8WCqRavSZBxD1gl/OZobiHQFnLBXWnelQ
	 UKsSTFP6GxZPvP4Q6Y5VYaUA=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482e05af072so2357382f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774078; x=1789378878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYZ4OmdAPOoMtab4t2tgvajC94K/KaFxqp3U+WedQ18=;
        b=Q/GOW+lU9wxMspdh0WVPL7uaKbu6EIiRnLR35a9aATuEDnITPITgNycBizI3uTGhxL
         QO8ueCm4iubT5q78Nx1XvbamKG7QAZ9CW9Q6zTpcRA3siVou39b6e9H/qu4c1JN3y7+o
         6Dc2vzm2hR/b1vnAKbGIY9xtI1kdtfN0mhL421uy87bEUVvpgOA+R3WzMQKK8umPkrs0
         ki+kUxkD2RAjsst76qCTQrzoNgoiXj0Wp/Jpz8Z6K6HkiDGYlGzAXiIceWBtru3nFx2S
         xcVVS3gC86V/vFw9Df5nRg8UNjid3LqnafEnmAhoUYk/yd3NKouNDJqHMKIMSHO7Ju17
         ZOTA==
X-Forwarded-Encrypted: i=1; AKwUvBzSWBJydEv8w+lV9usNyGj/07zFT4mMrQEnJmidRjz07TAErK9AaAh23qYbSvSmE8B0ENSr7C4TKz3GOXY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8HR8VXBwCfuzLONdb5I8AmnMLUFGRGJiZCQ8C8MtfTQ7DglWX
	NUIsi7Etu4Bv7g+XVwd0Ozd+x+QITQKEecYO70hnQcTEY9clJLdsvxzhe6N/zv5IiJ2YNkiNiuy
	OUqEDjhBtOMS4ltxaNbTL5ojQjhuK5RLslvmawmIQV27qHmfgXDRCt2NZOI2pIPBZb1vZP8ttJH
	us7pxVVw==
X-Gm-Gg: AYBFou3WPC1gMRBDXMUMNHRb7Sj7ijSxXdkw0RB+K95OZp5jVA6kL50PwxpnR2dWK7S
	qk8fiRA1b9XLy9GKVjoaP26HYvymJ+4XZtzM2ElPsq54RfFhOkAOYq//+Ym5wHPdV8B4uWHdzZn
	PhAPmKHL5T4dgo4ziOycg+YaSt1PssAiTO71WyidM3SJGCaM1gUlnmO9y/dpNKWgld6RtxXSGu+
	NQVpvtvHoIUzirAW/artf02T9I8zyFE/eLQKaVJtZfqkh1S3gLmHQBsnwNHE3HHvbXQrFu5RtfJ
	2NCA2pmSteIyedZeODY5oxzOtXKeQw6dw1d2+7X6c5VKB037J5/vtTTrp01XshPvEtaN01nIHmP
	eXpLcJ6voqbsE+dQgSMXk4ZVhMCdW5zWu7tXl5t6+GjCw3+DcdCygkmkS+C3U6P2qfX1EaQ==
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-48587087196mr24451160f8f.4.1788774077838;
        Mon, 07 Sep 2026 02:41:17 -0700 (PDT)
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-48587087196mr24451111f8f.4.1788774077434;
        Mon, 07 Sep 2026 02:41:17 -0700 (PDT)
Received: from localhost (93-40-94-241.ip38.fastwebnet.it. [93.40.94.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm26869519f8f.27.2026.09.07.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:41:16 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:41:15 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	horms@kernel.org, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, stefano.salsano@uniroma2.it,
	hangbin.liu@linux.dev
Subject: Re: [PATCH] [net-next, v2] selftest/net: skip
 srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Message-ID: <ap6Gu0oRGKXcs4vg@cicciput>
References: <20260903103545.1325276-1-alessio.faina@canonical.com>
 <20260904202546.a888aad9efbbf113aa1db900@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904202546.a888aad9efbbf113aa1db900@uniroma2.it>

On Fri, Sep 04, 2026 at 08:25:46PM +0200, Andrea Mayer wrote:
> On Thu,  3 Sep 2026 12:35:45 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> Hi Alessio,
> 
> Thanks for the v2. The check looks good to me. The comments below are
> all on the commit message and on the subject.
> 
> > In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
> > the vrftable support is not available and the tests
> > contained in the following 4 test files
> >  - srv6_end_dt4_l3vpn_test.sh
> >  - srv6_end_dt6_l3vpn_test.sh
> > are failing in some kernel backports.
> 
> Two files now, not four.
> 
> > This is the result of one those tests in an unsupported environment:
> > 
> > \################################################################################
> > \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> > \################################################################################
> > \
> > \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> > \
> > 
> > To amend this, check the current running iproute2 supports the vrftable
> > feature and, if not, just skip the entire test to avoid a failure.
> 
> IMO the sentence could say what the check does: it installs a route
> with the vrftable feature, and skips the test rather than failing when
> the feature is not supported.
> 
> > v2: - remove dx[4/6] tests
> >     - test if vrftable is available in the installed iproute2 application
> > v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
> >     - initial approach by testing DT[4/6] and DX[4/6]
> >     - test if DT4/DT6 are available in iproute2
> > 
> > Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> > ---
> > 
> > [snip]
> 
> The changelog goes under the ---. checkpatch reports it too.
> 
> Since the commit message needs to be revised anyway, a few nits:
> 
> i)   The subject came as [PATCH] [net-next, v2] instead of
>      [PATCH net-next v2]. And maybe you meant selftests/net: ?
> ii)  "one those tests" -> "one of those tests" ?
> iii) The backslashes in the pasted log could go, git does not remove
>      them and they stay in the commit message.
> 
> Ciao,
> Andrea

Hi Andrea,
Thanks a lot for the review, I will address your comments and update the patch
accordingly. A v3 will be on its way soon.

i) Yeah, definitely my fault when I exported with format-patch I didn't
merge the [PATCH] and [net-next v2] parts. I will fix that.
ii) Yes, thanks.
iii) Is interesting, checkpatch.pl is complaining about having a
list of ##### in the commit message, but adding a space in front makes
it happy. I will use that approach.

I will add the missing cc_maintainer as well as mentioned in the list of
checks.

Kind regards,

    -Alessio Faina
