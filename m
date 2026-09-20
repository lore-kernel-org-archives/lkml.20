Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABD3264E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789911997; cv=pass; b=hlNeq1RK69qRwYTaVR841/nPMEcuAoRv/XhXfUuAosV3RJelt8Jr5t5H4CxfUxaaoZQGaX18tVRYbTjBLOEpU3mHwkut9Mpy4BsEmjGyT0JDf6H+RlaIGM8AJxL49KYe4cGeMoBPt0lHczQqJP0317gigS/22mta69BB2TWYdrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789911997; c=relaxed/simple;
	bh=GoKI1vGXcJ5D1y2Jg3o1IYUMORpwmXPIfiEF6PR9g3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAlNQ0suqKq4F6UPqjD7/NajunZWdkumfnyfRGb7SRWiekPxbvgK8Twl5QFOv4u8B86rpp2IYmu/GyZrr7Xskv2sd3UDw9IRoLT86rPVpZBD0xWb6bCftC4jCyfsZc2KwfpKJRKrlIoCCiMevC6+Y+EqkzOCsSIfuM+OKuJyDf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQXPeLnv; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQXPeLnv"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1859590b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789911996; cv=none;
        d=google.com; s=arc-20260327;
        b=VEP5Dg2Xi4hHENiPeeQ57T1bnW+4qvg5pxaWnGKdg5jxkA10fRGSbH1eDF3lUHeVeJ
         j3PCH/AZfQSS7ryaTjh53g/fnGkavaY2iXsZw31E9IaMlwKBioxqArbvNNo8MFdQp8LX
         v5ai8n+XyzeJnjG0cHwEFdJduS6e5sW3/g5h4AbqnxPgiFraA+320b2KVe+7nOOkL/EO
         Cw22VWPCOOCsqDDT508FAfG2L9eyygj88ZIm0sHs4/FNJdx/eNjLyCpYrcjk2xjEEIcE
         ZdIJtM1Y96ZbAv8je1Sr6EX1vr8T0KBpBnlgojjEKuWf7oQFKWEJWBbOefQCmaGV+cup
         yKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5JNQACwxf15rHzWmS7EKSzA7iMkUpodW8goKbzSEnsE=;
        fh=Af79daeBvgQKnFG6FHsXRr8F0WONgUzFqRMjOfFL3/M=;
        b=QXxUp9sSDp/Q3knUlX13HCRZVFdkc4J9bLcAsswO2uX+KtXT8jlyrEXYMckUXrIWNJ
         CVw5cQjCMN7/aYupuUCH9hxiofPWT/JMqvSW0rLLxOCa+mJVi4YIlSWbdqjOhNj1F1DQ
         lNZmQwcVRqKWuHtlNUzugbU/QdRJFe4vAZvNu6c6uMHmCwir+mTVbMLVsYCAlAy646iZ
         48680HSqwnyOzjQes+W1QjWUCBiagtGiMEUu+AflSYEOjIgV5FMoZNYNfBXPFS6Yypew
         Io9bRObk+6O534y1kZyoikEUgnB35FNwT2P1SbSBmbui6yubzQDlAVogwaBuhU1Dzudr
         16SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789911996; x=1790516796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5JNQACwxf15rHzWmS7EKSzA7iMkUpodW8goKbzSEnsE=;
        b=oQXPeLnvcyvFlsCH7w6hqYEZJw8GZuzE7mD4T2hIHLp9VIEC8P60sCcHXVGnt5JKRr
         yXP+ejIohVMtP7prjM3qg6uVCBtMDJuHtiG45FKd842F434B+vvCyshdSC25uFtQJGTs
         w+BskJZNeLaLsd+MAtozjYq29e+1sfkQ8OQxAisowFiynTtapdReG8JtJh3OEcWUr4Zj
         4oih3Bf8hNc6+f8iCV9rOQNQOreViPiOm2Yrn/gOIrFTTbGIh9iu7PAti7tGCnhTDkxk
         JPmxL9quP5TyDM3FSoxbdJv5vEP3ySVBZEeIhdBcOmlU+PzNhPIW0z2pj9za6AJojvJz
         jYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789911996; x=1790516796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JNQACwxf15rHzWmS7EKSzA7iMkUpodW8goKbzSEnsE=;
        b=rpAeRAfx+gz1NQrJ+lNL7esKZ+QQUjMPXEMU0L64bt99YOxmgIYhtC6OjXlydjTYtI
         t84B6USpPT+VM4utLxrjp4Ii3UgLmi63EqEeNlguCUsBkDcyJ8fzQJandLlAh343Wu55
         FnHLG5FeTeNCg3hz+X/0cr+7BivbN+uIg/4vuKx4IPnSbo6yBOUXCRlF/OZYI1cSZTR3
         PhuBgt0/DDozUDwqGpJpZb+YYV7MJ7GktaE5K4UyD7UN+Z8lyZMoV33CCwovYTZaQt1s
         72CMEdHe0Hlfh+nh0HwXuC8kx99VjAHSqjzQeIeomxdk4b0gFUtH/V5ZsCBzFvwZjSSW
         kyTA==
X-Forwarded-Encrypted: i=1; AKwUvBzXl/A15oE+PE4NfXjwQahGESIPgVKrO0sFXJYYSYKjbvRtatZngnQdKo9vesxOYrcSuwy7l8wKhznVJQk=@vger.kernel.org
X-Gm-Message-State: AFuF++lRQUUGCf87TSU4qt42pyzGOvds7KLKIo3Ty8EulaaF6B6GklQi
	MDQcVmZntzaCYE0KnF70ipSvFxs34eyEZliJVUVmrAsDZ6zANO3bwnZuPY23bwz7djloesRgVKm
	UQsNnerd40L0sQM3a8P/IqREfri6zfdg=
X-Gm-Gg: AYBFou3YReBeoMlTgeZ8moQP3rsQJujJZMYm9xL0I34TqeN/5uZPDvn9H8t9TRvHPQO
	ctHj8dTYzW5bioBi3nuFUl3c5IJJKlpOGU3rEmj6NvKHqRNq1TxBIEaEIJf22AP0hVDcigPpfC7
	NKT9sC8kF7JH038VoGfJCVBoVhuPWSyKFxFJuEDtVHW/WP6wXoDw/SKQ8W+PyPh6z5GqweFpSZJ
	rHwmQDhEdGZ9FQkgcNnhFLwLQmSCIC+tYwggG3NltGbo8m6MvHt+21CSd34QdSwzuDj3gmhks4p
	vpjMow4TG8zL8/yTt5omBw4FudfZrDmCD9E0SVdverBVM3htW60+gZ2t/JJqH2fkZCk=
X-Received: by 2002:a05:6a00:2789:b0:869:427:9b0b with SMTP id
 d2e1a72fcca58-874db4f4e46mr11966028b3a.1.1789911995534; Sun, 20 Sep 2026
 06:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918151405.716075-1-adrianox@gmail.com> <20260920063412.GA1777922@shredder>
In-Reply-To: <20260920063412.GA1777922@shredder>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Sun, 20 Sep 2026 10:46:24 -0300
X-Gm-Features: AcwNN1XjX2H1M9YCBSMoOuH9mbeQ4Rr2lvNNteqbG_O4Z_sKSwLPOSPuqscgf8w
Message-ID: <CAMGU2hXurKGhL5rhDQnT6uTKST=YhzQCuC5yHKZOpnmdV+vxRg@mail.gmail.com>
Subject: Re: [PATCH] ipv6: check per-interface proxy_ndp in forwarding and NA paths
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It does not hit any of the current selftests, but it would be possible to w=
rite
one that would currently not proxy NDPs, I think the following config in th=
e
current code:

net.ipv6.conf.all.forwarding=3D1
net.ipv6.conf.eth0.proxy_ndp=3D1     # all.proxy_ndp =3D=3D 0
ip -6 neigh add proxy 2001:db8::100 dev eth0

makes the initial multicast NS work but the subsequent unicast NS do not.


El dom, 20 sept 2026 a las 3:34, Ido Schimmel (<idosch@nvidia.com>) escribi=
=C3=B3:
>
> On Fri, Sep 18, 2026 at 12:14:05PM -0300, Adriano Cordova wrote:
> > proxy_ndp can be enabled per interface, with net.ipv6.conf.all.proxy_nd=
p
> > as a global default. ndisc_recv_ns() checks both, but ip6_forward() and
> > ndisc_recv_na() check only the global value. With the per-interface pro=
xy
> > ndp set and the global one left at 0, the router answers proxy NS but
> > does not pass NDP messages to the proxied target.
> >
> > Check both values at these two sites, as ndisc_recv_ns() already does.
> >
> > Fixes: fbea49e1e240 ("[IPV6] NDISC: Add proxy_ndp sysctl.")
> > Signed-off-by: Adriano Cordova <adrianox@gmail.com>
>
> Do you have an actual use case for this? Changing a 20 years old user
> visible behavior for the sole reason of removing a TODO comment is not
> good practice.
