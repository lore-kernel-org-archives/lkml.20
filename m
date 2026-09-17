Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45F3DB328
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678285; cv=none; b=k0qFYfAawXk/QyOszXPep7iIINUIV5k1pzheRCmj/HCxL3uWSVoD9ixCvX9ynsG+rb62gv1Dn4cZnsfIJ12056Qem5ykJiWcivQ9/o3i8kJj2JSWInusxkC0IAhvOxnuLePozqsc+EsAQmEwyib/LtbjuWIhbfXjAIcNB/asb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678285; c=relaxed/simple;
	bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0nom5PRzrWCC3oIaAMSF/+dKNZoDcMGouDu13fTkbomKYOth8KcBRIRGs7ca1SXAIjHLjnqqlLyjH35aPo6mUYNfohZzw8CS/00zkZiz0dTUNtK259MJEdmGm268gtFAINGfwOi1ADvQqKOacvXOM7/06fj+D/vTpVqk8cbT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQYIDZ6i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6nleB57; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQYIDZ6i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6nleB57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789678282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
	b=UQYIDZ6igFJHrP18aRSm3AprR8e3O46BjA3IbPG74sKgGcsO93ZRtAs911uYJ0ep8uO87P
	UObFlKJIURi3skIvcL8la7XMLf7CoGp012MypGERc41FRLChC3qdHptZyfvew8R8IagEMP
	VGc/IQu9ef2l7oZyI99ZUSI+LNs0CUw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-XDtVBUQtPqm9eID_z5BYwQ-1; Thu, 17 Sep 2026 16:51:21 -0400
X-MC-Unique: XDtVBUQtPqm9eID_z5BYwQ-1
X-Mimecast-MFC-AGG-ID: XDtVBUQtPqm9eID_z5BYwQ_1789678280
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91054f537f9so273776d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789678280; x=1790283080; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
        b=a6nleB57f4M/As4ssg0Sck2TVnQ/MDkSIEdDSo18qw+pu7XUMvE+m3ZJa5S6AZUiff
         t29JpXzWa4vwzfES1G5ARFYu5KooDTtocLls4hsZzAJXHbWPcSE3cgYjQE4oLgJdTvIc
         dHbkABal6EoyhJyF6GVuLIsh45lo7rzGnhADlTcwtaZLPOTZIvMV7YzsJJI2Xt3CU5AJ
         vTt9kQNX5KDnuXZHJGcmOLpeuKzfxQT4JYKnu9UNQJaY8bGdQFDHwkCh5ihftmA4PTcK
         NRPQRi1wpS2jxtUON7yIPgn5Mmpt0WeUJeYmgrnG4PG6c676gMq+XBRiwyx4rXI5izfk
         uCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678280; x=1790283080;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
        b=l/tPEv731kME8iH4FOSxXuby3g7Xytyb13i8LbecV6vQ443qN4v0iW5NxwQ+1NbugM
         su4OUsQRBItpLzPNdqdrslzzxOBskj5jfeRqNVcQO+VVLFxri7cx9iPOwBJtHP4E6G4T
         DzOOx0u05HkghZtjz/slQGymi7RVJ3Z9slD9x6Bbco5O0pTmRUyelsshCKfm6w1jqjLz
         4t0qTYaQyLgg4V2CQ7tdHCsYCtnzMjvzWObwlE6bXJGkOGLuNIisYMIuI9yz26v9C9H6
         fu91sharW/+FgcWVIVpq6dhJ9v1L1NxWVUHoy722QqwR1uk9zoMuxJryE7t/+FAto0B1
         g3YA==
X-Forwarded-Encrypted: i=1; AKwUvByaw3gTJHPKDry3mjW1YzezLX2UWxdcMYEv5ZsRgOYpcmc/OTXB5gtkAVVuT/gCgiYYR5o4/9l19fOvWzE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Nixd9mConuQUvt9rv/Co718dEqtuF+tITxB9of7a2ySby4lD
	ixgdBombyw9KQtxYsJ7N0wCjM2lH7wUp208x02lZn14EUr43Q0Hi48vMiii0SPZjnbJzmIIxFoK
	EiLPIk93IWPFnQqlMZic7j2KgqCdwjxwEuqhYXaWk6R3kMg6v4004U+f5gN2DOSyMkQ==
X-Gm-Gg: AYBFou31s1ZxjS49rEXiVy/5HYZEGBxw+UECH0t+/GzrYlTxAEj89pEA3Ey0eSFMgdt
	OM4jnAuQhmDA/MBIp22Ne/g5u+p2jNstKa0uuC9rh35JhZMeB8kXjsR7xjOzZ/sseKysp62bAZj
	Y8cQmqwtK5UFvEKeeZoB4EQYtIg7umMetN19uFRhhUEQd+G+eHPRCxKv2yehTYOjW0DGBjk3JOU
	TgFy2Ldf8wWgxP62Oi2mMYhk8A/abcRJ75F3PYs8Dg0PdLLqN0tVJ135UakDy6ghcjI0CoEpIV0
	C7D0PY/A+67iosS3bwMCC764iaoQL7GLBUc2q7te7DpMKWa2l6JUbg1e5Rui3K58g/8MmP2Q
X-Received: by 2002:ad4:576d:0:b0:912:35b7:8a9a with SMTP id 6a1803df08f44-912483188bamr72768456d6.20.1789678280315;
        Thu, 17 Sep 2026 13:51:20 -0700 (PDT)
X-Received: by 2002:ad4:576d:0:b0:912:35b7:8a9a with SMTP id 6a1803df08f44-912483188bamr72768046d6.20.1789678279742;
        Thu, 17 Sep 2026 13:51:19 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c9377esm6673096d6.24.2026.09.17.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:51:19 -0700 (PDT)
Message-ID: <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate
 desync in nvkm_pstate_prog
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Sep 2026 16:51:18 -0400
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Mon, 2026-07-27 at 17:28 +0200, Francesco Magazzu wrote:
> Follow-up to "[PATCH v2 0/4] drm/nouveau: fix list cursor use after
> loop
> in the clk pstate paths"
> (20260712123616.1180830-1-postadelmaga@gmail.com).
> Sashiko AI review flagged three pre-existing issues while reviewing
> patch
> 2/4 of that series; the third (clk->func->prog()'s error being
> clobbered
> by nvkm_volt_set_id() in nvkm_cstate_prog()) is already fixed by
> patch 4/4
> of that series. These two patches address the other two:
>=20
> =C2=A0 1. nvkm_pstate_prog() drops the RAM reclock error and falls throug=
h
> to
> =C2=A0=C2=A0=C2=A0=C2=A0 core clock programming anyway.
> =C2=A0 2. nvkm_pstate_prog() commits clk->pstate to the new state before
> the
> =C2=A0=C2=A0=C2=A0=C2=A0 hardware transition has actually succeeded.
>=20
> Francesco Magazzu (2):
> =C2=A0 drm/nouveau/clk: don't ignore RAM clock programming errors in
> =C2=A0=C2=A0=C2=A0 nvkm_pstate_prog
> =C2=A0 drm/nouveau/clk: only update clk->pstate after hardware programmin=
g
> =C2=A0=C2=A0=C2=A0 succeeds
>=20
> =C2=A0nvkm/subdev/clk/base.c | 9 +++++++--
> =C2=A01 file changed, 7 insertions(+), 2 deletions(-)

