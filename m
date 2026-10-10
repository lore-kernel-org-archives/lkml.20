Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C281495041
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637555; cv=pass; b=LgrWzpBb3A9scGPZYgvF4H4knbiI7M2amDrRPkrKenqFYfxDLOEvqmqwsz4lS2D1zy51RK75vL2xJos7/bVEEZKJOk2qO4vii4i7bYiw7hcp27xToO4nA4CGBeohpTEC809BnTqkVnuE2Xfvz177OMjFV7+NwUUowQ/pFe+qsfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637555; c=relaxed/simple;
	bh=dUgv8qU2MJmYgliXxK0C5ED2Eb+oFUrhcbBUDF3fTq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj+u9fVOXge81UWFXrYZSSu/VKJ3nheT7TZ8KulMncZrqmUQqJE0A5X+dyF8JlVTOGRpnrcLiqnxcTCIvrVTlNK5ht64c/QLulFqWxa2AB8xrS+d9LjKlJALSwffFfU3KPxs2NgE7H+//MMoUw1xQQsRkay5CB3CSYLvpWpW1IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0x40FL4; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0x40FL4"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab8d96d02aso3878597b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791637552; cv=none;
        d=google.com; s=arc-20260327;
        b=Bs6kaSgGdpCmIipItWd0HLZlXT469x8L69+eJ6uajEYJqbVn/1MHSmu6tqhygc6ZJc
         WnQZMMiRYb41Y87Zrw2jHBiAzmUXf1t/sRwDKieJZbe9F5Gmz7IHeZyiTs068mLUz7Ny
         I9p27BXy4sNE3OIJk+2qN5ocKvZ+BgLl9HiXFHCeYkXqhFOMyoqzZknrlI/ItVXtNzmE
         9067UR04Re1b019FSriYSC5bxPSzNaSOsqmpSMov7ci4eNJbch7H70di6WfFSIlYS0bL
         fpe8JjkMUhJYRHXoeQWhMnZI+P4ONLOui2ThsnlzTXpbPGxaf4p9ndPdBDG7SyQXY4ne
         3ieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUgv8qU2MJmYgliXxK0C5ED2Eb+oFUrhcbBUDF3fTq8=;
        fh=KhFPGuaxVU2tkPxd7As5wLUGseWz5iIJGT+nX+6+svE=;
        b=LpDWyxTdYahgz9NxIJdhKxN2qCLgcpoulMENnpGALrtYUyfY3jRM+oS1Qbaprs9kwV
         vFQCUIZQPYlXTmw3WQ7KslJE8R8PZrtgEormlSvtlx7jSSUOpdqi9kxiv84ERL9NxoA/
         /rLKtct3dZRbkD9RPk0lBcr1V9bSD0MHaenPDc/J9J/Lvj8Gd2QTVez9ppa8zYIQOGOy
         0pdZ13skhGurMv29DR1Dgm8wKTEMJunkylM7Ou9UVBb+ekrl4+6I3d1UMONGyGQby0AK
         KoSApNDAGHKfkLEsCUrVBmurE9jV8XFYz5oXExsZ/nNUpeglrPqWrvqxKRjmLBbwk9FH
         DFgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637552; x=1792242352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUgv8qU2MJmYgliXxK0C5ED2Eb+oFUrhcbBUDF3fTq8=;
        b=M0x40FL4KT+rZ1eE5DPHbZz2soVkDOSqunJttvG3BvfheaZskhed/N3TcpA2StibVH
         qdLaBkG+3DW1XnkucEf8+8zDtAh8QXkhk2LGYafN/GO0pePFYn04Aqoggto2EOjuCvl4
         3bk6HUy/lB9k3W8P2awRlaWHLrUzcebPBEGnTR3YdDsetnzQqO7Ms9lTBMn1AXZYKVQI
         O8bqMNdNSSZFkokcUp3V/q3Y6hc+Ll1ffJFhVDtHobMq8xhvp2oyRtkf3qUW4jVqOa6N
         P9IAPSGRaAk5v0LE/Tp4yE7xEm+Wij8zjLyoNKXWOX2NArQUYYPNbb5KULb16gWle8/w
         xqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637552; x=1792242352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUgv8qU2MJmYgliXxK0C5ED2Eb+oFUrhcbBUDF3fTq8=;
        b=KlBGafbhVyILnYAFlRWdBTm16j2zXiA9HfIGNShva9S7wBN9Jay8nNjIvB1l3MjBuO
         IKHUzwEGmvchQjHk1HECE03jMq44HHCWo1j1y/SrBJKkKlFghqsLcm71Y3So2FFT1lio
         CBS7BT051YbV3B2Q9J1GzA3VyYt16VOoKYpO5iXdAEeMxnODLhp4EFddTGs4vTWrf6/z
         tjWNHY3OkmuYkfza80iN3q1EpoiFii4lZQOq9KGTJ1hnh4VLwYlU0erkjRQCw9UuXYtE
         +2RbxwAHjYUOqU6eBvxUoVl0AFUnoRlfQp/m9Df4L9Nf6EOO2cUjBjj26wTAO4F2vlLV
         wz6g==
X-Forwarded-Encrypted: i=1; AKwUvBxm1wx9682uO/ZJ2HINEwx4VJMICucrDSN6O6uBXVs2UBwqgPepBbSear+XoSbx1PD8ei1JGcu9jkHa5o8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWAeFtJc/hbJpd8D6uNc+oT+M/NBqm0Q002KHwS7exPxjk87qm
	ixpzHU0Z8Mcoj/APDpxQqByH63AQRzJFRtYMykQuyAnKK/1CXrWZciFMRbv4i2QuVKAEHtiIr1A
	1pLCD7edcbzBUvFoZNKWmq6nkXAuKs6oZajHf
X-Gm-Gg: AYBFou0F761FlrWM+kgkyqsvFSvMGtrlN5tISbszw+yK8DgmOXoXZxro1VLHVq+YF5J
	FPObyOPxxkkm3qRqcVrhWYCkxiNXkShSFhtxRgw2vx3bO9N1pJ6A9haGpue+ml0o3z0R+sb4r5X
	eT6ici1MJIX1JwnzSoFYmPioX4DFZW7iGYej0U5d/Ez8lbKe940fy3wNs1b+aPg9TnpU26RO8Z/
	PUduxxLDqNLvGpYuLROTNJi4Rx+GZJQQrQrP6Ge2PkFA3vzv3F8lnHJywJxeeQ1KQehfHxSec5t
	Se1A0vmuwzXaS1vTCST/0s6LXm2XYzkJTHNZsuFxME33s+evOafeqBmP
X-Received: by 2002:a05:690c:85:b0:882:31:3af9 with SMTP id
 00721157ae682-8b07ebe12aamr14950917b3.9.1791637552107; Sat, 10 Oct 2026
 06:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sat, 10 Oct 2026 15:05:40 +0200
X-Gm-Features: AclHuK_ZZxWO5VOmv-dijVsfp5Dirw-cleU_Ss5a_ua-hVf2p2vv9lQol9MPm7Y
Message-ID: <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com>
Subject: Re: Question about obtaining LUO session FD for non-systemd-managed service
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: jianghaoran@kylinos.cn, avagin@openvz.org, linux-mm@kvack.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 10 Oct 2026 at 04:11, Chenghao Duan <duanchenghao@kylinos.cn> wrote=
:
>
> Hi Luca,
>
> I watched your excellent presentation from the LPC conference in Prague.
>
> I have a question I=E2=80=99d like to consult with you.
>
> I am currently working on the `memfd_luo` feature in CRIU. My goal is to
> leverage the LUO capability to store checkpoint images inside memfds.
> After a kexec reboot, the image data will be retrieved directly from
> memory instead of from disk.
>
> Here is my pull request on the CRIU GitHub repository:
> https://github.com/checkpoint-restore/criu/pull/3152
>
> In the PR discussion, avagin suggested using systemd as the CRIU daemon
> to centrally manage LUO sessions and access to `/dev/liveupdate`. I have
> watched your talk and read parts of the systemd source code.
>
> From my understanding, systemd currently provides a unit=E2=80=91based so=
lution
> where child processes can inherit LUO session file descriptors. However,
> this approach requires the target service to run as a child of a systemd
> unit. As far as I know, CRIU does not run as a systemd=E2=80=91managed se=
rvice.
>
> So my question is: for services such as CRIU that are **not systemd=E2=80=
=91managed
> child services**, how can they obtain LUO=E2=80=91session=E2=80=91related=
 file descriptors
> managed by systemd?
>
> Thank you very much for reading this email. My knowledge of systemd is st=
ill
> limited, so please feel free to correct me if I have misunderstood anythi=
ng.
>
> Thanks & best regards,
> Chenghao Duan <duanchenghao@kylinos.cn>

Hi,

At some point up in the stack, everything runs as a systemd unit, so
it's only a question of figuring out in your setup how to pass the
FD(s) up and down the stack.
