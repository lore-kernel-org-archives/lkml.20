Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640043B3E6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824588; cv=none; b=JJhQox9RDH+IjUCQBGvMd2yQTST92ySUyL23DDHla2knxy53gvOO/DTnHf7DvK+dJ7jLZ3hIVgtqQKPH3Euwymrl1V3p6EwO8/2a0oL1DaFyX+IG0p3a4EOOKqOSNROPOLm3iZsJrdqRxwZ8HDvXQzaAqabzZgRgzrinENcsocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824588; c=relaxed/simple;
	bh=XVwxuwVv9J8klcfz+P0rkEtNX7AV6V6/RcSwg0haeL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swJZRrqM0xSuaIrXECF3Ok/kGj+RoJdMGzN2MI8V4GTYV9czbkSLtMakml7t0Uc/CiKtDKBqlEepo9XspPu70AJPsFDwTGKELhx5FK22mkDIuAbpWtcJFhWiaVRa2IumiW+LACz0/t/AR6NJmPiNgKn4RhIkEFoDtjYg997d5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Uz1FxSCi; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Uz1FxSCi"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BB2243FE28
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787824571;
	bh=twtaGX9keTthWlD8Iz9JDELL7y9v94YhHTzfCCgZVkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Uz1FxSCibNfL4jH0ATZjeFge2Q8AfHnXFgIon3LvgJFa9X5r+o9X9DxaIzeeDXvLz
	 iKrZsg4vDPeGlSThaJgSrnQAkNJxgXha8EF7knyLsoM3IbuIB6Qw83YwJxHm2JGLBI
	 PY/z3V9YKWdYOue0M1OrzJiNlVdN28W27MkL3tUGspR9HmA5YjuO6fgCRCPMhKc0Ii
	 vDajfBt9sWseooPPiEJAoWsrOMR8gYGYDKcMa1oLNLKDaByzEGKJpK91A1PLib8eyu
	 yeAcQ6Y/J44bUIKXuerf0gTU75KO7Cvlb48APu0vNZ6qy/fPvgNq6H6OzKiBKHNqT7
	 TapzUZtFknij38LIlzGoi0YYa9qwLfnmyAfqKoBS0ptCJv4MRxbvmNxaoMwY9BKlx4
	 8aUm0WrXH2UsbqQuDsXY5a5jFYrEog2SrPXDl0f+hIyX7LxwMaJzMYKvQxI+hr+3JL
	 zv9DTUan40+RupRwsbrn5Fai7/suDhOFeHS1cuLLwJ2ySb9s6fVrOPvLwbst/Z3muQ
	 fXVUPcnHiRavTFeAe0sPzcq1HZ2Mwz4iAv3q8WU2IkEUq178Ezt+nMlLT7uEyzPcbS
	 lmFEAP+7GZZ7pMCEJSlpiM79Wr/oAdpq9v6VHTHerS+36DCU7lHhyJhiKKrsh1z2hy
	 PNraum6R3qMo0+Scjg5SF/zU=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so15628225e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824571; x=1788429371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twtaGX9keTthWlD8Iz9JDELL7y9v94YhHTzfCCgZVkY=;
        b=lEcVYB6BG6ViW1eSdAhEK+xDcYvhsvAAt/mMRFOL54L4n4sAaNaXm1Dy8cyJhHGfJo
         7M+xzzMwUN9vJB5s8iqZyTrz70+wgxqUEYmfZ1KWuFHBBYmBVfS5BQgH5fO+f790sFhr
         mOmv72gNak6PTLwNevmqxx2Jghdy0fPqPab8OxDK3OFshmCiULgIsmWg5WDklEZ63vlY
         9q6eMDi9LB/5JfK/e8QMc7qrG3MwfOYD3fWf0Va+jWXMTJynqh3+aQuLmKLSVs1fUeFr
         mPYA1XtSjOQbFQdDOZW0ntEF35/Amcq3FMvmjsjwTm7rOUa9FowUBR36sJxvUlEksgvI
         wUNw==
X-Forwarded-Encrypted: i=1; AHgh+RqSaTJ35/aosUw7ClqNE2tpR2ihiyGzkBoYUSz1mus3PY18uVrKn2pDVUMqMdISnL7Wk6WNO0+c9oie6NI=@vger.kernel.org
X-Gm-Message-State: AFuF++nMmNkNgM23dP+FWLEQnyRhqHgtclvTYwzDlNQMfvjgQrlXL8DF
	F2qmLNukYa+CAo7yTMmFsDhJsE54FG5XDzRTIjpEPSLDiAHcdk9f/EHp9Br84AKFyiLQ4LI/NOQ
	wrMYjd3zoG5y7i15hTu6sS5h5RUHtL33OgbAxi8oS8qz+VdmuYRS/qk3NvOwy8UiKZ4J83Sm7qs
	hxSktsSA==
X-Gm-Gg: AR+sD10tBQFPPs2OW817Yb/gC0W33Lx3/TR+ArDWiDz1veM4MEaQIzUtLFOhAbajOBc
	QOMHrww/sxjntoteuqLK9co4T19cpag1M/d8KJH4RuViBmltGjRrHiz6DGwHyPeDaoE2JLwORXZ
	i8+sJ5MQwTGjV897TRHlRTJhJprh1TEoW4WBdfBiWPr543XKUNB2ZGw4V9ovxl4j5AaKy6sC7N7
	DxhdkFpXNYNuahnKWbLmiFcjJtBtb6Um3sgTLj7rbkokQoEW4RGMRwOPXvRffIWa7WqO94pzUVS
	3a8E1W6XPNoiMvoE6cWETjii199fafLhSQYFsa94W9nq7UcoTulKAZuU/lmGA8of9UpEZbCWUJj
	eKSe68svWKB5Q7g3nMG1eq4/PupjO08pgXOxpvlwr9mYkSJKWOu1+J3VwdgafkPE8MOA=
X-Received: by 2002:a05:600c:3acf:b0:499:db5a:1049 with SMTP id 5b1f17b1804b1-499dc70246bmr162323595e9.8.1787824571156;
        Thu, 27 Aug 2026 02:56:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3acf:b0:499:db5a:1049 with SMTP id 5b1f17b1804b1-499dc70246bmr162323025e9.8.1787824570756;
        Thu, 27 Aug 2026 02:56:10 -0700 (PDT)
Received: from localhost (93-35-56-63.ip53.fastwebnet.it. [93.35.56.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm36964705e9.4.2026.08.27.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:56:10 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:56:09 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if
 iproute2 too old
Message-ID: <apAJuZzDOvjkVx60@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
 <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
 <ao7S04LkWVXAQpgq@cicciput>
 <20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>

On Thu, Aug 27, 2026 at 03:07:01AM +0200, Andrea Mayer wrote:
> On Wed, 26 Aug 2026 13:49:39 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> Hi Alessio,
> 
> > I was running kernel 5.15 (5.15.0-139-generic).
> >
> > Removing the sink to /dev/null in check_hs_connectivity
> > I can see the following error:
> >
> > ------------
> > PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
> >
> > --- 10.0.0.2 ping statistics ---
> > 1 packets transmitted, 0 received, 100% packet loss, time 0ms
> >
> >     TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> >
> > .....
> > ------------
> >
> > The error I can see upon installing the route in the setup is the
> > following:
> >
> > ------------
> > Error: either "to" is duplicate, or "vrftable" is a garbage.
> > ------------
> 
> This error comes from the route parser: the seg6local action was
> parsed, and "vrftable" was not recognised. The End.DT4/DT6/DX4/DX6
> actions have been in iproute2 since v4.14.0, but the vrftable
> attribute only since v5.11.0.
> 
> > I can see that iproute2 doesn't support any End routes
> >
> > ------------
> > ~$ ip route help 2>&1 | grep -qo "End"
> > ~$ echo $?
> > 1
> > ------------
> 
> The help text reports the names of these four actions only since
> v5.14.0.
> 
> > It's similar to the case we added last month(-ish) for
> > srv6_end_dt46_l3vpn_test.sh.
> 
> End.DT46 was different: parsing and help line came in one commit,
> so no upstream release has one without the other.
> 
> The two DX tests do not use vrftable, their seg6local routes only
> need nh4 and nh6, which are as old as the actions. Which error do
> the DX tests give on your setup?
> 
> Thanks,
> 
> Ciao
> Andrea

For the DX tests I was doing a local test but it's not in the original
kernel, sorry, I must have confused 2 tasks with one, so disregard the
DX4 and DX6 tests, they are not relevant to this issue; if we manage to
agree on a solution for the DT4 and DT6 tests, I will discard those
modification in a subsequent patch.

About the DT4 and DT6 tests, I thought to use the same method as the failure
was practically the same as End.DT46.
This is the version I'm currently using 
ip utility, iproute2-ss200127 (should be 5.5.0 if I'm not mistaken)
and I can confirm 
[SEG6_LOCAL_ACTION_END_DT4]		= "End.DT4"
[SEG6_LOCAL_ACTION_END_DT6]		= "End.DT6",
is available.

What do you suggest would be the right way forward to check what is
going on?

Kind regards,

    -Alessio Faina
