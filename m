Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497746;
	b=rGn04tC9iLjMPQJ8z7kRLBqwNNvKHwNhNMge0ezrA5YZ634HkFhTlwNVtKzZZAXxEE8v
	 UQHJCyyqoa/rKiAX19nkdWo4Et+jndI/NOFJb31Ps1FdqIhwYFYOzuWu6G6Rgzd07ycXs
	 XR4yNYURp1oMSP3pGL592kwKw5J8YVwKWkbQzgp7MdevKtzn71P+rzSjD/pCNIpOEB1ED
	 Os+BVkWqHU/7bgLAlRPStvG+SJRfVIucA9I0ofUAtDCFxc4vzQ7e+mDoA1UE9juawCRQc
	 A+esAbEZL8+wtsBdMctif85kNbRUIXmdWxi0Wlc6cS2fI2eROGGxNrRVcy2d3TSdwnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vL4vwsQsE5/zV/F3IafCkPB1dlrGK2hIbWUCOVgrMnA=;
	b=ZLDw+bYDVVmtNG9L8t+td4Dd8DBFzdjFJpD4darEe5HvfyYlch760EXXaHotms/42oOm
	 /Np0ZLo4JKi1v91A4eEuZ/5QqiejHhGmifZN98uNnLh/ckxWo+vZ9WtTGAntZBbiraruA
	 h3cZBu1hJlP8MyTFizGhTEqIBHIYWO/eKUGdId1uqKV78nL9zPNa4QmAdfafhIkV0kAdr
	 mi0JqgV9iKKP6nhXxnQwoP1smyFyTKtiN8w3IVx3ObhBFPbNpxsJ5sB2j5IioFlTnSplt
	 1XMtn5c7Ty4mPw8HmmtF0vQ66Dz8ubRARP1mKCuxpCaQWZY+l/CjMay0ejNYEEWHKKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQsIqYvw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D51606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D51606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQsIqYvw
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53b7a2ec68bso116676b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794497745; cv=none;
        d=google.com; s=arc-20260327;
        b=J+CB5OL0r/B0+jFRrxUWp1gm2bFX6nlKVVpZRuWwStTDa6XmFSV+YDdwd1+dy3lZ3O
         V5A2xf9Na3amVjffAxGCp1r5T17d0TTopR0dYPEJZRBR9r2n84MabnqKBcKBhtgsW97j
         CE+IM5ALl3VSvqmCExPHCcsLJ3avTTyELbS18Um4H3qlcHH2s9a9G+UE08Qqid+fj/HJ
         F7gLAGtJuAwZOKLUlMwBHAKV//sU6vogSod9rnAz7/TU1FlgFA8eVRzEEK0br6LyF56S
         tBsQ+YWGiE3JrfgXpYp0vobmJqJmzJU11IVHMqkvcHHaMfque6rL4m2EXINu+fvxrGSC
         xWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vL4vwsQsE5/zV/F3IafCkPB1dlrGK2hIbWUCOVgrMnA=;
        fh=ct9NLQ6YTR9V+IoUejOBOdmI3kxOdzqzCcEjppFkul0=;
        b=l9MlSRW0DOWielo+K5DQWiAplriw2zxiaz+sBCmEfCSAihVsU22ALR/N/Emr0ErJPK
         XmRVTAdNxIpHw74oNC9UHWWl3Ojp2XqjjiFkzH/wFqvRbwzUoW472oRf1MqI/dCBtCHQ
         Im0YRHZB7PwSydW/ZQWHT66w2TkKnyZg2STA88ZQ1bLlWhPXKyxCaBretHz6zn3kWp2q
         v0oGLHAmTRt0V6JNkBWXjus45bO+o2kVL3VocRpqAOrBCuHkZe2ThLciQEW+NenLqbs5
         l4qOXPx7+dpbeeOzth7V2BspbyEk6uKYCweBYtWyN/UAzwvSRL7fdFI2AbBWwwpyzahc
         rWrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497745; x=1795102545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vL4vwsQsE5/zV/F3IafCkPB1dlrGK2hIbWUCOVgrMnA=;
        b=TQsIqYvwtqHYtFKU0UlwxRAkmxO+dVnW+3b9OJNO3JmWQbvPKRsFqIEDcr7kCRTl8I
         yUZ47jfwwlPmV/UzJepyHdzI8zZStYCV8JAHKGg0z9HL4Es4436K/4egi08jpg4A9fYa
         EDihUiyJwIK7Ko3PxVnPIa8M+VJInUyM4bMP7vMACRlh/6XWNDOBLRFpOWMtmhjzgX93
         zqdonhJnX589lfOdLdQpl+AQQU43l+bOQmjn4yEf6eHIj4Y53B5plxpddDbNZnKPG9Hi
         EJYmhnyttvd+rCmOsR1PUdwrmBbMdV1/QFZJ1o43AAx+vHf+GfhaWNmKFaO3ii+e0ZEl
         YvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497745; x=1795102545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL4vwsQsE5/zV/F3IafCkPB1dlrGK2hIbWUCOVgrMnA=;
        b=r0uRdVKE+89vk+98iSgKB+Mf7Qgm+o+I+sc3AN2/qgd8RbdNUXO7A2UdIIWki2jWsi
         38++rilofAxshLaUsQFpM+DEK1mAvfs2lvfGfLyWPJPOt/bs7RqbmryMyE/djFIKpfTT
         uQPV0Cx2OzTJkjGSnkLZdWIa7pdGFk42w07liJqNpAIjwQquvh1HJCebnOpzfRC7nTQh
         kkhzTs+8GJN6DNJyVR+FQOzbIoDxrwbr/J+zWhqrwCvSf2KdQXjcmlGbiDNQTo6pQTGA
         WzhsRJWEJhOhTjzeMCyCJkhqFr1K7cNWO6NtFWmOhL6sbb+AdkdQaKj9fL53n2JtnSeX
         f+jg==
X-Forwarded-Encrypted: i=1; AL+hErHv47j6uL+/dlCcSgSoniyIcgVIAJL8fDwCUv5tLhbOhCAz3RHlYcP6vrlhL6DMZUa75U1ilDukNVimZsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o0uOLxc0Bmzxnio9o8Pp0L2Ug8tpLTy7oUzyy9HwmJLmSOlwJ
	ohmEfdSJCVN74WBhAdUAJtNzV1Qvo7K6ZW+iD2NNoBFZSFtioEFPFaakK/m2AE8qcIYfLOCEaNq
	2MBVNmeH0rEV/oFaJcxGRD4/1R9LLWcA=
X-Gm-Gg: AYBFou0rkSBnoIqSiLhK0vcqM/APUmb4ut31FT8T/uUStxthgT8ntrC0Gbk5o/3K5bQ
	kja41A1rcgWE1qWrEwjUPFPNhCOb1uJyMnL5XR8bBdo9YuV6YWZoKsxjoqli8j9CEjCVQsEnKG1
	oEg/gxTyXDxF3/kAjxJX5X8V5p01IDoWhgc2VjkKjrQLBzosFACqMZPys34w0rENc1XjBu/XHLi
	2ERfDwI4PYEmkGe0UVSiJk+s5SI/nB4R/7hK6IaS+HR3WLvIRihi88vSKb3vBh8e8rXOmTj281d
	rILksZTpJZkaVuUqT7fY2Rnc/n2esjdHRWsayCVqXG1SXEMOIQfh8Y5FEC1DrHhl060YwhwEgEq
	NgOUBTL9ufgZA5wzzcoxfL4Q1ktpxI/BeKhtF2wvdG+mnWmcDA++QsQ==
X-Received: by 2002:a05:6808:10cd:b0:53a:5618:af49 with SMTP id
 5614622812f47-56b9334ada5mr7407026b6e.1.1794497744766; Thu, 12 Nov 2026
 07:35:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-netcons_double_cleanup-v1-1-d5ff8167e05a@debian.org>
In-Reply-To: <20261112-netcons_double_cleanup-v1-1-d5ff8167e05a@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 12 Nov 2026 15:35:33 +0000
X-Gm-Features: AclHuK-tQJrPNW5sGGep4G60vDD9vdFiHHDLPuiFhEtYncUeLh7f5-NDadEgubE
Message-ID: <CAGSyskXhb_d9q0-+NDyVYtNF4oBVhEuv4M6kx0GGP-QrwYRn7w@mail.gmail.com>
Subject: Re: [PATCH net] netconsole: harden the enablement through configfs.
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:05=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> There is a possible race when enabling/disabling the target through
> configfs with netdev events that can call a null pointer dereference.
>
> My robot was able to come up with a reproducer by adding a bunch of
> msleeps() around.
>
> The race is basically this one:
>
>   CPU 0 (enabled_store)             CPU 1 (netconsole_netdev_event)
>   current_enabled =3D true
>                                     nt->state =3D STATE_DEACTIVATED
>                                     do_netpoll_cleanup()
>                                       np->dev =3D NULL
>   nt->state =3D STATE_DISABLED
>   list_move(&nt->list, &target_cleanup_list)
>   do_netpoll_cleanup()
>     __netpoll_cleanup(): np->dev->npinfo
>
> And kasan reports:
>
>   KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
>   RIP: 0010:__netpoll_cleanup
>   Call Trace:
>    do_netpoll_cleanup
>    netconsole_process_cleanups_core
>    enabled_store
>    configfs_write_iter
>
> The disable path used to call netpoll_cleanup(), which skips a netpoll
> without a device, until it started deferring the release to
> target_cleanup_list.
>
> Re-check the state under target_list_lock, which the notifier holds when
> it stops a target, and queue the target only if it is still enabled.
> Mark it disabled either way, as before.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Good catch!
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
