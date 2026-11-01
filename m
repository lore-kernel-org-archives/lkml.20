Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570937;
	b=Uer4jgnbBac5gC0jD7+/lJSSbpdu//6YXJ74l+sBU/24wI+bUZyf6AuQLLZazdRAQrZM
	 w/0ibJd1dUnDFTkYVQ6p1tVj7s3SUNL2qpqVEFuYR6oWDA2hu3CwgnJs2KVIkbOSfzpNq
	 X4u26/pIkD17RA4WFFoHImVt0iUweyq7+yDKQFpiXi2Rs9TbNyN6GLKmXD/HEeZEbDv7s
	 zefEABCKjelZbts7zN1PH1P8bzZ0yNdfWieWodPDcSBP5hVz8kmxcgoZgdR1jEdJQRHUS
	 0yoU45bumXYyhTyV/ZIvuRjdAy5/2y9sRQ3GBXsqm9hozzuhLiOSyJpYyxiS6xxzedA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8n/anYiLG943D5EygjwRlnHVbCkU3yfav7PkLTwYj2Q=;
	b=XvsB0WZE6LFqZ82pJv+GVMk75kW+pTZxdYl1Gwo+4iu+3juBgFj3hsMoKFBHCrjRFmHd
	 b1vIwra8OtJ3ImRvdToATEiUyDZaTqBxKmNETr9EkVCNRg73SFn/ldkwxMXsrg+7dp4Xc
	 kriVhkJwAJWIhdxA/yhLwOw1M727CAsjKZIq1sjboykituGkSgaTSHOTJc5/AfJ7BE8gT
	 B/rhA6OKrZKTdHBwaPg9UPLFI4AqvwTrUdu5kcEx2dheLH10gj68YBWFUQwBeglcQdrh4
	 sIbomC6+SFDZLZzEfv6lNsu8mh4MH9Vjkv+wPQrPRmofU1nj0xyiwpwMKIMV+2B6eaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbyZmfRS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE0606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EE0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbyZmfRS
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a000ac7efso1875350d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793570936; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+eAlOulJix9nSS9lbTIt5C6DmYtN6fIoAcbFR8OJmvWNAG2GYlkz/eCzAMlviMUOG
         rQDp5R5UfSCDduboszykUBHSiY73mqlntlPkfPkv+95Wh7FrYxRiTN8UU/XYT5wOjEYy
         CIcA2hlacXBynQN+6dbmu7mM+w9qYAMrUaJSrhuVWDUusfcyouttlaTjo8xlX3qxuZ2i
         9C4o+89s/2nlI49zK+1Z6SOjfryq8e05JtN6IxDHyWJv7akBS9Hla/+3+7gBYrtTuOUE
         EvgS5wccaNG76Y+tnyn2aNo1AaNCWWc6bzHs0JdL2ZySx2NJDGz3hhQu5Azg2P32v48y
         1uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n/anYiLG943D5EygjwRlnHVbCkU3yfav7PkLTwYj2Q=;
        fh=7txrTvKSJUlQ1il9M7Whdmk5+C37w0LmOv8obQSmwO4=;
        b=EyAIr/eo6s0J/XA39XpW6hX2bRJfgGDQDqiQB1U8nOSUwAjqDyDfnVBQs22u3pJq0C
         PZPax5BEUFQXrCvBYBBDAD1xM1RiSr52xBTP0tBolQDLI9g/J0gAiv4KTctTmY5BJRoO
         r8lSp9Vd7/2Y84UufBcFcXPyM57XJh8KpI9vrU/BmLDzBQyn+0F0M5zun6fE7WroQJJZ
         mguL15J03Z+AVbK9xr5JUvLUfdteAL7sqWODYVLNYf/l50M+qmF4W7A314Z07Xhz4YDv
         jVWj+mRMhFODoF+iwNGU4OzC3L2H5YMOZ6rzLvH90oXomi+2S7rtKUfs+h7CO0vFqWiV
         SoAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793570936; x=1794175736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n/anYiLG943D5EygjwRlnHVbCkU3yfav7PkLTwYj2Q=;
        b=NbyZmfRSnlR07rxCGz8qtFy5O5pLkKb41xrU2F0jPZoFiRJAqopH2gmZA2LIGwIA2O
         zdMHrveUgwpbckMETuBNOcrtQHGflc/p/OjNwYTvLhtKtYkwCvOhq7W1hkpDyOHj8bmm
         NJmvEzClpm/fM372xoJV5tEXXAR5IVKwCRr+TOuBlZlxFwZDiSWNfL2jI0Le1gvMp8u1
         ntde6200hjK63sXOFCaYPUvTb4jRgdWDdUHLWpf6SOhzczXQmwKmXUQVJy/h7kzfmeye
         o8zEMj09OKQNNLP9QIbLKV9VQwnYp70rkvJH2cmWTP8FZrOe0YPMohvuKhKI0IAtHMoi
         tYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570936; x=1794175736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n/anYiLG943D5EygjwRlnHVbCkU3yfav7PkLTwYj2Q=;
        b=jMhGqD6Qkghe+DlJCQ1ktMwEa3xmQqnRWFbaCalv6/rgYtCE0J30Em3vZTKeLdQJoX
         7ZdsDRLHwBCmBVY/r3KEEMSnXueC/uZ7D3FFPqnEHXmZ3EEWXdNWOwZTG9I1oEc5fz3y
         Cl4xuzMh8N+TLSFoxLAMb7nnyzwu67WMYhyUcWsB6hPCLU37FymV12Y5PRA8F8uFLnZ2
         I88W3HDH7iIE/03ncJY8vZZXcly8m+aTfXduVRPk0KagDZqm+UoJAYysDlKHVDOixLJg
         wHDU3hGYorwGbR/wENm5T9TaW/JN4EB4DTizBeZcl92mXXr2i8NJj9ubtQQDKDtQEF+k
         cMEA==
X-Forwarded-Encrypted: i=1; AKwUvBw4npUU8nLOH//Em1pn5jXcETffgAQkFpB/6qzBxGmgyORcFbzbGndByChrU5CqRNKMo6XCWIFREiD53Mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uim5IhEEMz2uxhab/YXF7dwtNndvoJCRd8uVnMNV0I13/NgYi
	D36vFvUf0WynxZMUqMYi6yo41SJcz19EBCg4+MVL36BXlP+7uTflHL1cnVqrRKuktxsOtuCYMx2
	H6HBwc4+D+n0/cWdyWNu/DY+paa5Btrc=
X-Gm-Gg: AYBFou0Bl9QEDLo5qJtmyOlxB6v95+FxrmxhI6aMVz0qfGpu8F0CBhHxPm/sJ3bssiI
	cacGpBbk/zhZx1WxsmmkmwqLWiYKa/6VgJygIdAU1CTLehHM9uOMyk9M8H36xvyHOqoYIT5FILW
	rkhqwF5W/M8VkkKR9nKZJRGGJ2ENzK3LiRP9Z2NGYY1/3uXAvux2QwVYeVDo+hW9rdwJ8r8uKeC
	OdJxWYKmnGZqEUUySfr69cOPtjKqpK3wpAdQbAXNXQpnVwKoWMnViHV86AFsbE3MQm+Pm53exOS
	a707VIPoN+ku6iCYEz55rF6aoKfZ2kHtYV8/VmpVzZKqgfi+Zzn/EGtIs0zEn/YJBuB20Ylo2n+
	QP5XTkqEXu5TkZAksl5Gpli/EnaFdeCm9Ty0Guc5e67Qdre4X9lxuMr10M2OoyMRdQlY43HVsHt
	GAbwng4uI4jvSh9vRKYmcvQIk=
X-Received: by 2002:a05:690e:4006:b0:678:80a8:9a02 with SMTP id
 956f58d0204a3-67ba4ede517mr6000936d50.42.1793570935715; Sun, 01 Nov 2026
 14:08:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_C2E4FE9B7C0A05615861782611715EAA9C0A@qq.com>
 <tencent_7A270291DDE5CD89DAFFE8A745D094D5BD06@qq.com> <179344707641.114606.12665582704521593779@cmss.chinamobile.com>
In-Reply-To: <179344707641.114606.12665582704521593779@cmss.chinamobile.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 1 Nov 2026 15:08:00 -0700
X-Gm-Features: AclHuK-zfUDuhrVjSiZBc3Vdhahij_jloXH0-toEDdIfq8O2PD6sh-2K1QlBU84
Message-ID: <CAMMLpeQKJO52qhba=G-ZudUA57iAdX4SOapOv7YuprBZ3FzM-w@mail.gmail.com>
Subject: Re: [PATCH net v3] ipv6: reject wrapped temporary address preferred lifetimes
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org, dsahern@kernel.org, 
	idosch@nvidia.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	yana06070@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 5:44=E2=80=AFAM Xia Yan <yanxia@cmss.chinamobile.co=
m> wrote:

> One question on the clamp added by f4bcbf360ac8, separate from the
> wrap fixed here - I don't think this patch needs to address it. I have
> only followed the source and have not run this case.
>
> As far as I can tell the clamp's termination relies on cfg.valid_lft
> and if_public_preferred_lft being finite. Consider a public address
> with both lifetimes at INFINITY_LIFETIME and a large regen_advance,
> with no wrap involved. For example with regen_min_advance=3D2,
> regen_max_retry=3D3, dad_transmits=3D1, an RA Retrans Timer around
> 28,600,000 ms and HZ=3D1000, regen_advance is around 85802; raising
> regen_max_retry via sysctl has the same effect.
>
> If temp_prefered_lft is set below regen_advance, the effective
> max_desync_factor goes negative, desync_factor is reset to 0, and the
> clamp engages on every creation. The clamped preferred lifetime
> regen_advance + age + 1 then passes all three checks, including the
> new one. But the temporary address inherits the public address's
> tstamp, so addrconf_verify_rtnl() finds it due for regeneration one
> second after each creation: one new temporary address per second,
> each living about temp_valid_lft. Creation is only refused once age
> grows enough that regen_advance + age + 1 exceeds cfg.valid_lft,
> which here is just temp_valid_lft, so the accumulation is bounded,
> but with the numbers above it can still reach tens of thousands of
> addresses.
>
> Is this finite-lifetime assumption part of the intended behavior of
> the clamp, or would it be worth tightening separately?

Hello Xia, that is a good question. In that extreme scenario, creating
one temporary address per second is intentional. As you noted,
regen_advance is not a constant. Before I added the clamp, Linux would
just stop creating temporary addresses if regen_advance increased to a
value larger than the preferred lifetime that the user specified. No
new addresses were created until the network interface was restarted,
even if later on regen_advance dropped to below the user's preferred
lifetime. Temporary address generation was effectively disabled,
eliminating the privacy protections that the user thought that they
had enabled.

When I wrote the patch, I did not consider that the temporary
addresses might be based on a static address that has an infinite
lifetime. If having a static address causes Linux to refuse to create
more temporary addresses after a certain period of time, that's a bug.
However, I have not been able to reproduce the problem: On my machine,
with a static address, max_desync_factor=3D10, temp_prefered_lft=3D30,
regen_min_advance=3D60, and temp_valid_lft=3D90, Linux 7.2 never stops
creating new temporary addresses. Is there another combination of
parameters that might cause a problem?

-Alex
