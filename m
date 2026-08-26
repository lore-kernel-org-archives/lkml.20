Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D333EC6B9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744986; cv=none; b=OXrrwAWKT9wA92qZOXLcz/e1tkYKJYq8XP5Pqg4yUJcZWs9UNsmRS5gqOGmiptaLU1saUWBzFeVTS3tEMV8sMlvM8bri5OXzHRd46CJKdM5GDEOQek/tpTk7yhioCH+fZ3qJowNral8Nyr68lyO/jj/tdWw8vDY08VX5NbLP3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744986; c=relaxed/simple;
	bh=8gJvi1AY0EFIV+KHyvnHbnOhp3L3wnKl2p4qeaAFDNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiFmMuztHfVrii2e+dbjdXPzr5XYG1G9yfh9zr6Sk3FRDabMG1xIbyGHViBNzjrPsNuTtjw26XcqnXmnBUN4JY1xSTd9RftLmwf59lgrsXRbHdZ43O2ptBdVfHhZ+Xe2HxVMz/NuWlER+02m0FI8PC2ZcsKrtrT+md21bB47K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=WWg6SWYm; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="WWg6SWYm"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB8BC3FCA9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787744981;
	bh=siYAsVZaz9ivF+usBNLFZ9S0R6ASYmhsoOaIHFs/ZnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=WWg6SWYmOEKnMIDsFGVMSM37qUsp2AUgpGQFpsM8i1Xl7fxRD/uGF+Zte0umQlu+P
	 PmncPal8frCIEnZexUiMj7nMsXCQYEbS6K/Y1zS7ntjjzl/K1kHD8YreJUB+qnv+nS
	 y2/IKDGkheW2280vHvC61vcCzzY4ftVG/HB7/ewWBJ9Q909QuSZgsohly9m9DIkW1E
	 zKn1oF38zgyz5jQ1axdFZGiPx2cxmFmSZT5+45IJJD9Uc5yS1ol645P2FXYG1KAe5R
	 Q7z23e0bHFr+Cw8jnPTfWyS9eRAsRw5kUiA/F9q5b/l0OGrPWCF8bdRo+M7rwIzhcf
	 5iLJ/v/K8frL6NVqdNfn09n1tGrjsZovm4LDKPnuUeQummkYWEgUwEXLBMrDwR02RP
	 dFQSwWHnQ6bxo5GEoMJZO84dhDMTCiVtTLZB9W08/etm1852MsnNpZnbh44+nbN+Ir
	 YEubKwfLXW5/41/hJav9GlUHe4hcCgtPTB47Q/q0o9ERCz52GdhRAsh4BlFiZ0QNhl
	 mxn5qXDVcMuc/+t5D/sBSa7bQonnq//oCadhxrQElKZ8y4kObQy91Y/mLjxSgZfPT3
	 h1dqf0A6zjHOdGoQqNxFPTLKOALxxlR9ZgQtc9ZbPPhUfJH3nF0RT6ZK6TSzuzAwPt
	 H0p4vuUn8TVvFekBVENJN9ds=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c217f249fa1so94230766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744981; x=1788349781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siYAsVZaz9ivF+usBNLFZ9S0R6ASYmhsoOaIHFs/ZnU=;
        b=H5n5MRgQ33bNb79W2W0zjpo4EFNnPjJFKztpb0KfUmFwxzIVbdfBkaIjawkYx7eyZH
         b2EG2NrjaEi3y+M0g8kI30VgebPh/H7bIPoP1iXeo63qI4/3R10ZRwDF4b8TUgF01Co0
         unYpfr/aZ7Y/Xfx71JlzdQ98ryt3t06eUh0OU0fcK1n0HtjQswSBFTBOZ4VA41+Dh+dV
         aBRZCW0y8W9zIYmz7Ip4g01IoiCMtZwlqclhykfxVUNGiS/ZXxCC6oXzegm7YbB3n+W1
         eynMiezvHFyHiX7PKXPEvGUC+idxSIAnFen9E4ydQ5iZXivHF3WNPz81wGCcHABHKvmq
         2mFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMOY2sfw36ECfMSb/G47AKmMCwkPZ+Ztr9+EkwtcRQtfpn4mNLJiOZ8Cnhlj0Up8+PyH+3eZb+AQJ1r5M=@vger.kernel.org
X-Gm-Message-State: AFuF++lxHPa+vHOfTEGxOWbkDVRJsNkmNg3oSKVTKon2kkpt83D7wV0X
	fIE/QitWAfsc7YYjR7W0O3jNSM5CRICRrJICxDvGVuobt4kiDYp22JubqtejabYNZHgC1XJH2iU
	OgAf2su9ndH2VO7UiX3oFKrgZ1uBj8bWU7A0na+mJQ7urQnyMkZKq3TgDwx/4HpOr9CZzCqmjs9
	yF/BKhrg==
X-Gm-Gg: AR+sD10RDu7JX9aWpFE8H1j78xZx3reWnUjJfp8nkuq/w+EUc6lymTvyCKjIdrD3Rsr
	ovq4yg36b2zgpW708ARDU/Q6eZwWIKrM2TaL8GkrBZBEBQgcRuKsTDaz8NR8loxYECvQdNqEmaw
	SiHJrFYeT4+Wgh/1jMmsm/GJZkirJM9pMe4cDm23VQg9OW8JINmyQB3Gk0Ejlpxe7RUnKHJLCy+
	DURXF9/H3YGUVqHtuuGdm3CqJYyRap7lcJEIqkPzvJFgy4HftjY90CUVnaqXgl6ya5pbsdcRoek
	LDLUrPvbUMFASED3t272U4cZ23yYBZMa1Dvt5QRAcD4XB6kzvKIyy2SVhbNm1/u4ROXA7xkTXnp
	a7b9+RX44mLnxqRF1IOvopIZXPONqZ9hdOSiuVNfn9tTD1z2Z1FULJ+MjmetowFBJk9JaVw==
X-Received: by 2002:a17:907:ea8b:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c250c330f70mr731885766b.12.1787744981541;
        Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
X-Received: by 2002:a17:907:ea8b:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c250c330f70mr731879866b.12.1787744981167;
        Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
Received: from localhost (93-40-43-207.ip37.fastwebnet.it. [93.40.43.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62easm466521666b.6.2026.08.26.04.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:49:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 13:49:39 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if
 iproute2 too old
Message-ID: <ao7S04LkWVXAQpgq@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
 <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>

On Wed, Aug 26, 2026 at 12:01:56AM +0200, Andrea Mayer wrote:
> On Mon, 24 Aug 2026 11:15:37 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> Hi Alessio,
> 
> Thanks for the patch.
> 
> > In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> > the End.DT4/DT6/DX4/DX6 support are not available and the tests
> > contained in the following 4 test files
> >  - srv6_end_dt4_l3vpn_test.sh
> >  - srv6_end_dt6_l3vpn_test.sh
> >  - srv6_end_dx4_netfilter_test.sh
> >  - srv6_end_dx6_netfilter_test.sh
> > are failing in some kernel backports.
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
> > To amend this, check the current running iproute2 supports the required
> > feature and, if not, just skip the entire test to avoid a failure.
> > 
> 
> Which kernel were you running when you saw these failures?
> 
> Did the ip route add commands that install the seg6local routes fail
> there, and if so, with which error?
> 
> Ciao
> Andrea

Hi Andrea,

I was running kernel 5.15 (5.15.0-139-generic).

Removing the sink to /dev/null in check_hs_connectivity
I can see the following error:

------------
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.

--- 10.0.0.2 ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 0ms

    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]

.....
------------

The error I can see upon installing the route in the setup is the
following:

------------
Error: either "to" is duplicate, or "vrftable" is a garbage.
------------

I can see that iproute2 doesn't support any End routes

------------
~$ ip route help 2>&1 | grep -qo "End"
~$ echo $?
1
------------

It's similar to the case we added last month(-ish) for
srv6_end_dt46_l3vpn_test.sh.
I just didn't realise at the time that there were standalone 4 and 6
test cases as well, or I would have added those checks at the same time.

Kind regards,
    -Alessio
```
