Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7564734F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935589; cv=pass; b=He+jQPWMxdQQH84zS1VZ6zBwcGY7IWsfcmtsCxr3GWChv+46FKPphZK7dxE7wQi6bmBS5BTp8BAudOdYJ9E+ZGyBvLrbNFQv6kuZlUrRXDaOCbD+CRFZLGJhuVw8KSq9or0B+Iu1MHI+QHBCp2MvZtnJwMbMkt774PwJzaVqkWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935589; c=relaxed/simple;
	bh=gmmThrJvDx6E/5siZJqxDO5qT13qL6bZJindI281JSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hM5WMLVJ6wHccnMVLBIRresi8oHD2FcJ5CvWxu9ERxyOaY4EX5QGbFZwTXUgimnXrXEQZ/vpDwEQ+/Um7Gn55tRqXyCjdYUG4AEHdl0wkCU9NstQoPQ4v6IlP93m/LResA4V+EikQyOcRqcHOyfz8IopooiZHSXVHAeBcYJZF9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epO5KDgd; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epO5KDgd"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso6067970a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935586; cv=none;
        d=google.com; s=arc-20260327;
        b=d21gLSRhWwUPUkwlYbIVwSKDeiNFQ6VT9ImjcrSqsYuQm46oE+g0bflBT4xvOacU23
         Ba6fjOQ2eyJfViSj98dToEarzA2Lk+J4rsFD2o220IJN6kgpWCBoDeYw9KDH+2ns9bDC
         v7J0UGBoECxNht+kMHWPgeLIP4BjuKAZan3YRPiDL49lYXY3kqiLoHlT3Q0aKrlRJ9Mj
         hO7iqZLLjiM1LNcBZW8gQnSinW4ilFzUQUTzCPqQUcnIUeXlvVzVwiWFAtCRUzDHFHw6
         Ui1lcwc2z/HnDSjTpNas+lJ7z8hUxydYpsLOtuscxODUv9uzEYT0KfLmsj9D0pYjTg2y
         /Teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uE68pqUdgB501HIODogSgxT3qz6bLjZb6VtyoVku90c=;
        fh=ukApqdaE8/I27f8m6gqLHbXU7uUGHfvU3YKUKu9ov9g=;
        b=l5HJ/NZApk+r3/ac2+O3uuAK8SG3zMdyjRYui66l9kY9GV2vlZM9uBFE/ssa+hKHCV
         77DAhMcbYcGRG8JhV/UPZTBfKeLwguI3tti/baenv1Yugzl9ERGMxEbBU3YMEm9tYXNv
         858mS4fRWltBMdbvg6HJAujUGcg5d8bg5lp/oHWFtlrD6Ik2HPx3WVsXjlsBOVTmW92l
         f/TNRqqoJM97srqdxTHXkWycouncstVh8Y/YWSFThcKnOII8MYgJVT8LGFlNENcjSchn
         eJkf5VYXJEywe4Wvw/rfnNXS61gidJp29zb5kik33o6NkCdHqp3fXHRKmpgZpFhjdjvm
         s9+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935586; x=1791540386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uE68pqUdgB501HIODogSgxT3qz6bLjZb6VtyoVku90c=;
        b=epO5KDgdxoUEOsm+bOUGUZqPkAwpBQ6qGKI3Q0KmFLfAqnZGFX9xlgGPT71bjT4C+0
         EU5M9NzD7O5tyh9gpQSVV6kwVWa6m6p1frx3F+GkDArVvG7yYV77LnpDJkOjb4Bbl/i4
         ks7WJDQe2d7C1KL13pPz66eFqGbLTvj1ZXMB0BfOrxoUtL3JtOA8Kyhr+QQkEXusVOkY
         ob302smIiu/vJP7w2SoCjcXv8V6XFJdZzUG+rQi3DL++tvgsq62oarvJmAflKUtEZPBn
         4TNJozGSRhxLbr1G2OAkbQHSyJMO3E4S9MRzv4LjuN758HT6XXxWssVePhAGPyFpjOOm
         OdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935586; x=1791540386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE68pqUdgB501HIODogSgxT3qz6bLjZb6VtyoVku90c=;
        b=Vd2PKkGKl6GgAemDsSG2sikyMnFd30LG92nsxzO++kxRITpV8y9qHZdcaC+pyA4hiB
         QFTT/Khc3ZrkvRjj0Ya5HvsujuOLBL1r5vJoqndcvZJes2r8jJf5N3ei6PMiVeKFgj1E
         UNy/dkYjUCbMHp2/pHf5S+CVFQt+iGRgE/3pEHI2scUd8bveq/29Xp+AKMsmfZ5oFjPP
         GJ3r7aNSJcpxTFB6iJk7ZPJGNMInQ7sIbdSr8FpkSlFF9tm2RGGXwPtOctHMI9Lp2LsR
         tZ/GeeNTKQEypRpFVEH06AnGmOfIxD9MswJvrOvUImcB1JsMbxDHh+I9aMdWn8H+7oyK
         m/dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd49K0riB97P/egOacTHbdLIHxQFRFltA7aS9DM65yLKEAxI4xL2pm8O0urYTSbveBxiwxuR0A26iOSvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxcjEzCAMA1sJlXFWZNvOfAbM8rlo6s4JTroQ5D5Uw4Lz6Q0rs
	b3ZQy5CCwuW7XfgUJIVmZU7vsD/PVWwU3j3D4AL8wFYJ5W5tKjzcoYCre3GI4Ja1cC2HsSQn72I
	JietixCGEiz64iNaw76HnnNh829mBAAo=
X-Gm-Gg: AYBFou0ohH2+u4A6aXAFiFbiy5eKvi7pDVWXpYaU9Kz4D2YUAXMlGry1NTw2wZJgnvP
	KBdLb2njY5GNumH7kGURMM9NQt+Ybc4nvIg0iXxFB/Z/ISPqHjlr65eBTNWZ5GKJb9xSu7h3Gg0
	+IY0X2pd5I5FU7NtDBpZ+ykv+a1Kr1gAwMTEIKszr5jqmi3QXkvXnKnb5UmC32acA3NWLuFWPsW
	2649UhXWrt13lzbhWOrbyYpOkyCcajbNclF454oiFsp3A1BmegxGBY1jc8VjJGG9mf1esxwDtvR
	2rjpByjzy0RMVas4Vz3kfLsiNpW/bNhBi2kkMHNM98bqN4DliUJOWdDTzLyndwFhwnvon5Kf8oA
	OdW/P2mxLillX
X-Received: by 2002:a05:6402:1908:b0:6a9:9522:f87f with SMTP id
 4fb4d7f45d1cf-6af9e320e56mr1486442a12.41.1790935585981; Fri, 02 Oct 2026
 03:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926090039.1714460-1-bestswngs@gmail.com> <20261001182326.572045-1-bestswngs@gmail.com>
 <20261001160958.00a95918@kernel.org>
In-Reply-To: <20261001160958.00a95918@kernel.org>
From: Weiming Shi <bestswngs@gmail.com>
Date: Fri, 2 Oct 2026 18:05:49 +0800
X-Gm-Features: AclHuK-DuqEHJWA_x2c8da-Y6I8oMIIctXWrMoUX8UHFH0_s4ggmWmgZgdUAJu0
Message-ID: <CANgPUi0-OMgEfpFmWWPr4RgXMiFfupBa-n_JNzHy_PemP_28kQ@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: team: fix transmit skb ownership
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+2cf741c3005abc20@bugs.sh, Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=882=E6=97=
=A5=E5=91=A8=E4=BA=94 07:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri,  2 Oct 2026 02:23:24 +0800 Weiming Shi wrote:
> > The queue override path can pass an skb to a lower device, see that
> > dev_queue_xmit() returned a drop, and then reuse the consumed skb. Fix
> > the handoff decision separately from the transmit result.
> >
> > An AI-generated review of v1 forwarded by Jakub identified a separate
> > broadcast-mode leak: bc_transmit() returns without consuming the skb
> > when no port is txable. Fix that in the second patch.
>
> Do not repost just for this but, please, DO NOT post new revisions in
> reply to old ones.
>
Hi,

Sorry for threading v2 under v1. I=E2=80=99ll post future revisions as
separate threads and include a link to the previous version.

Thanks,
Weiming Shi

> See https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
> --
> pv-bot: threaded
