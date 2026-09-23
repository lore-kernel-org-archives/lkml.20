Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D932D23A6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124589; cv=pass; b=ONr/O8dNBLTatLXc9U8glThwgMj10gSXKOj7cxniBvRXGOtOlNTT2AYB6nZk8rjI/Me3hTS8UUP44nAJ/ZTQNzVvAMsOMG8V18TJvzAghKGzgRXab3bBzs2yibiqQoUJx3yUTAO8/+gSR8QPmTWZ4oT8F7HeEEeSDv8uS4sSAno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124589; c=relaxed/simple;
	bh=z4nEtmW/B7eogzGruiprSjDTAnPPo0KNEGcrLZetKgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdtgzDdhtBbJ2CUC4uRUUvn1fpWwXw27ixU8OdPzTPPY5W+KHgl3tDgRmDmcvj3DPolFWCahBt+YNu1TuUzU6d5Q1vz6i/1NY8KwpmgYePjEXKTMIppfGjozmBTW5j1Eprpfu+KLhjWZYxNX1t5fJH6cUsTQoGajXUhDwiVfk4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPmhPf6G; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPmhPf6G"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so4415141fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790124586; cv=none;
        d=google.com; s=arc-20260327;
        b=Ed0S6C1V/J4enkC9uT6eVT7zSD3LGHiSZnu3Qa6lu87njY1mkDXaaxhmi1e10xysw1
         b75shJKxB2WZZw5rr0Xp69ZBZ96jOiNsD762lmnYw/zE5p8CwJTYSHx5oCvrBX6VEX0W
         OWlx/9sqZ1LmTsK66SKrrjKoXECwd8SZC2OFLOrY5VMMNa4qqqFginDIoRHHjzQK7qTU
         HBiKfPRef34v3ythR9JC8jwutSog7JdZCwgpQowg2MrNqKuOuxIb/a+xrhz+A4UaRo47
         H8I4y2uE9ZqJbOiFNPvmoTNqvakM43SA9Um58foc0F2eC5S+H9+5PdSoXXobIgVBOwyH
         vrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        fh=J7cKmb4Sf0cH1v0K87XalYrmBqoa4htURdwmDbPEcZQ=;
        b=sweMI0w2ye+G8WsktLFcDT39nQouQ6HEMTxMFAQ9UPYnlph9Yhz+yhe9Y6rKz9Qe/i
         SNihp+e9cxefuxoTjJlWKzn2NAq4wihYVyPaNJAt7Yp9ZQ0pm/mXY2pw8cN0usm7wQdy
         dbHeR20roSPVmntTOoJj2o5Fwwaub8Zj9QkUVxP0ZCxdHL+LL5kByRCVetA0YAiwu7Iv
         TYYRqsYgnJKZkkufX4peqMj5EGaOMjCSc95jGro8GMFI7jEzm8xSguTxpzHFHI3sT6ls
         6ymImq0T1CJq5EAPVPkQp0C/RwCzXQJlto72YtHbSUAJd2Bz8e9a0JoPF31oYm9WlLCU
         hmtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790124586; x=1790729386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        b=kPmhPf6GKAPw3LS7y85s3PjBNg3bk61omaCv6WTEwcjvDNy9YxJhCPIUaWNV2jBJho
         F6YH+aTw47peFBTEkDE5L6r777tVK6YHwSC5eUC2zwDvRegrhrecbsOHUNEsVooVScY/
         aEhPC734NOpIAn3lthxA679K/o8az2HWx94umWqHXiC6AEsQFTaGlcUaF96r2Xa8dhkR
         UDfgDVjp+83EcLBOGAS8PuDY+4tocoD4G9WJ3w5eGZ0OcOVvwxxVW+AqIYgY1SRJoxHI
         /E2O6wI/9Y4hewo8yTZ9iNgQDdidffqsp7SwXR5godqEWQHM/01S7wgxKJHncQJxk1Cc
         EmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790124586; x=1790729386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/jUfJT4ttFuk5nJaSR/zxk67u0WSF3uD0qyCWP34DU=;
        b=M7WNpBdMXEBLP7/jxMlfHcgCXsldF9R24jXfkyuN8Cl5vySpnRetsSpHGACxJ3ipi3
         hjvsJLfvyldlPOMKdQfDSdkBVPf2jLAjnTeI97PwlXDbT93HqD3pED3E+ciZBUsWeW2s
         m9t3JggBLK48uJv4kmQy/s5c1e8gGAAaXStzocYMsDGcrzJtjDm3Ih/c3CJf4xmD3JHG
         +fj+HTaM88PCydyQlLhbSnMDw0kC0k4FYBNFIF4BCT1xIZJCLUJ0pwA7mJJB+THWTpBM
         ac30TCFRwmJBHpYOjG0KSMXnB5HpjpCLzJzZvEYhujkuVTgkjX15e3Hnsd0Q/6NQnMmn
         I2jQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0vRlj3uAZqBTkBEiu9wjUSSgVggC6mQXPYaU34J5XJIbpQ9+967yzgockVORosNL2VDj11i6LEGXuRgM=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjpb0tzZEAdX7WbT3V2RS4Q4uNLNURGlEhFx4qSH0orkmOpt3
	kUsineEIxXzlqqcPSuJ7X4kUW6IAfpG6oKPIS7zaTfk8iOVWgUJkdak7eOypRKU0bOoMQVq+sAt
	zpbumoEip3rJlrOe/qS4JtZ+Bgh67yLM=
X-Gm-Gg: AYBFou0/8kErnHAbY6/aPJWzBfbl1RhbMwf+IIL2S92wBa6ncofyb0IsU0AMPC/GCY0
	0tUsBwuDfuzExdyCM0//kctiPWNrZlW8fMIaeArm99pA00Cu+dx12UGh1YVF3Y80nyco3pqNmW9
	jPOOKH/seVsBuVXtt66VELBHtAc/QRGYff5w5SxqP1ZmiY9NEx7Jo/rrqlJSySKGCYIUYZWXtAb
	2Y7zrImG/F1mIGZKg6zD/cSCUkeqOcRwAND0ERTKRHZ8TuN0haQ8NRMPeEjw7m6LXAVheu8uRm6
	DE1Mlpc7sUY7cjImIwUoMTpG0PzTOlZDUX7hdCgkelQ3ymAV8oBAeO0e0LnI7bSxgoVIy92OzQO
	8R2lfx02Fw28j8f6fxOjWY0OTKWE6U1PZJIOGPqp92LQ5hJ/eK/KOm84=
X-Received: by 2002:a05:651c:a189:b0:3a5:eacf:9811 with SMTP id
 38308e7fff4ca-3a624d70958mr9639501fa.14.1790124585416; Tue, 22 Sep 2026
 17:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-2-sigefriedhyy@gmail.com> <179012274833.2160803.6278526272510624940@kernel.org>
In-Reply-To: <179012274833.2160803.6278526272510624940@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 09:49:34 +0900
X-Gm-Features: AcwNN1XrOYM44dDQqYS22hhW-LuVc39KJdo7O2ULglxGQeLxCAP5lFJTK_NObdY
Message-ID: <CA+7S2vJ_Wq+_BrZ31qWnDFMowZdo2wR0THrZ-qkgFD1dMQoH-g@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:19=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
> [Severity: Low]
> This isn't a bug in the change itself, but should this carry a Fixes: tag=
?
>
> The spec has been shipped with the wrong type, and the generated ynl code=
 and
> the Python decoder have been treating the netns ID as an opaque byte blob=
,
> with the request path rejecting an integer for a binary attribute.  The
> kernel side has always declared it signed 32-bit:
>
> net/ipv4/devinet.c:ifa_ipv4_policy:
>         [IFA_TARGET_NETNSID]    =3D { .type =3D NLA_S32 },
>
> with nla_put_s32() on the emit side and nla_get_s32() on the parse side i=
n
> net/ipv6/addrconf.c.
>
> git blame on the pre-patch tree attributes the type: binary line in
> Documentation/netlink/specs/rt-addr.yaml to:
>
>   dfb0f7d9d97956 ("doc/netlink: Add spec for rt addr messages")
>
> so would adding
>
>   Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
>
> help backport tooling and users identify which releases carry the wrong
> type?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260921235951.3214-1-sigefriedhyy%40gmail.com

This issue has been discussed in a previous review comment before, we
want to keep this patch target net-next without the Fixes tag.
