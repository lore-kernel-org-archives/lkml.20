Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793772898;
	b=TjdpQp2t60uu36tW+s9rciczI6pBy2sL0fvHWMX/d1XXa/OLMkAVqlhNVL+ZVOfn8DRx
	 MuJpZCtiMn4qxEt6KyVeM4zdMGbgv4kzhzR412B956EElTwr7pRaNoBJz9PiduzacuHOt
	 Y08MPl1O61Xo/Eu71rHBj/EP4On/yo9iKBRT4Etttn+sAOhmOZfjFxYqh1eA6WEQ50oa8
	 Rw1Wls/vXyD6jVGwayu2VajcgNq2fweKmE0ejs1dxCJpb6ywp6Li0qCxNqzHi4NtpaT9u
	 WQN2LghO3jpclBxTpWCYDYqwtYd8n46MzYQ3xENJi+AbFHJMxHv/hzX4pihPsXIP5TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WXtfI0CtVUis1DTLl6ZkWUkR91YI6KmmXqM/+fvN/qM=;
	b=RhCSpUv/P0q4euxJNoane+aRPKBrqXSY2AU/NeN7yFRebZKG7Vfh1rQR3SCmzvDHWu2n
	 NaZWSb3cT1MMVxCOROwXxtw3hgAryTUUW6Y52bRWiqm0gSDHsxeFkdPhBRkyl0wvGbHUj
	 xqY6LNe81uSk9u6wrF/sCWN2/BgJklsp0QDtt2JwMU4Bu6lIfU6KVG9WuYzvrqe0a2dVS
	 K380vhwOrUAFSkeH+pCq9I0zOdCMGVX2fsoawP1EbDLU5rSQ0WYsM3Bbbot/OesgOz/11
	 35oCTeHd6Wryb2qf/YC5g+H/yQ9JjJkp+C/xtTKUYm8EekU3inO1kk49wpUhWF0EnMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5V9G3Z8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2620B606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2620B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5V9G3Z8
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so472726a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793772896; cv=none;
        d=google.com; s=arc-20260327;
        b=jPKlVxP5pZEiMxoUDbSjkYoYfFCZNZ7R4EWrsy0t46F8IBHFvqs5dTSql5EM/bDvSw
         5sw3CnXMLbCpeMxcF31o7jYP6Hq/qAQk6R0hRzpKTtPkReM+zYb9fDpJJjtP7kpKYT7d
         Iqimts6lW504TVoxrSrPrm9tYL8X8n8dffZaqYsCg5yNRQCa3Xw+X2hD+TMrilS+s98u
         Rjd0vceph8XZne24uuLFUkFe/Kmx+BMG7XlE7LDEtRnIF3pMu7d9LiFUgAYpaf/lUkAa
         hoPRaMDwljtXf5XvP01AH9+1apWwb8CTSkfBRGLSLPAkbzhXmL4tmcbpI+xbLopVK2GZ
         UFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXtfI0CtVUis1DTLl6ZkWUkR91YI6KmmXqM/+fvN/qM=;
        fh=wNGR3JUExCFHeovK7O11lxu8zdH7g8khUHglkNf+Qog=;
        b=KMN7fOVAYyvYBXCZUSfV7lwBHPgWtrDPb39b8S9pMhsgGRCBYdrttdNPHpUNdkzdA5
         WWCtmvr+DdSEGZJkfhFjAUkRVojgTguV2rj2wxuIHqCHxK/TYEmmwSEKM00me4IyMlSn
         ez0vIcNPSbAhvz3vnMuhjybcaTSErbM6BQo7Jy4BOgPwERjMsrNioIYWBsDy7DjF1oOr
         NAciqSkU58+VnXHPf8WrZcvZHxXO6EyfJzrUwB/5imaeYU9CAitBvxnurFqtnYVFW9IM
         j49y6nxj0CroMrrA5trNLd1//5Ri8CMWg1LPjmx5bla/OWRu0rlhLxountOaYPy35OeF
         /odQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772896; x=1794377696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXtfI0CtVUis1DTLl6ZkWUkR91YI6KmmXqM/+fvN/qM=;
        b=O5V9G3Z8P+hZrzxtaR5wh4mx+r3d7HqKen9KoLNKmpLsaYappQ57NB4dhMhe6Ji3cI
         mIG+5HfgJUMiw6hEH2jVPyvkiNYrc5FXkpUwjhPMg6jebi+EtQ4H6Jugu8o8YEwdrdJG
         ucMo3Wcz6H4X8enRqO/M4/Kut/f3wYaN5LHuUrp5Nd7tW+NRi1MqSyyEJ08kMHTjQGuo
         bFBU9vLvynCZcj3SR9x/RpKBWoCQFbNG/vOAL2zOkLgAi/kPFp0hP7CmbbjwDImdS8ev
         NnGVAlXrcW43CXsvh4qt2PbIchrMG4Lq7qbxt45I57m6OCLg6wKMplwJSsXhdem5pUPA
         6U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772896; x=1794377696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXtfI0CtVUis1DTLl6ZkWUkR91YI6KmmXqM/+fvN/qM=;
        b=mxMmXkOARXBEYKO6LMJz6k5pn5UEPfK5ioc1Ag84swMjx8kVczdK+DCYy+58UxCkAB
         mQnOC7EEKK4ehPGC0Gu3u364UxbWnr1m2LhueMP7YVAxepJYJCw6GAyOSZplU9rYCQVy
         Dr3CbZt6kdq2v/hTlSQq/FinQyh9uM/d2xAgyB3q/qDgPAs/TeT+ojq14U5Ol569qBdb
         02imHCmulKKEhmtOihFLQ4NhiqubOmmHVCVZpkh+0tU3LW520H0PuoE8MyD0LvxBEGW+
         PCRBEqrgzuyL2XV+fjBHSGxgnB6OrwdQfq7K8JHAJ4uVpMhKOMCNh6Lkd8RqC837jMg1
         ifaw==
X-Forwarded-Encrypted: i=1; AKwUvBzBt7zmgS9VXHKQjun1chm4xRuM7Rg5YK2vM23Dz7KcjjUBCed9TKVsy5uzPiqmGExsbr7sGcROx0wSD6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mI+DaL59jKjMgXmBZpfrbdX4oekpxuwB125I7sHVa7SaiaVYc
	3BVxdTSJAs3QGrmhH2D1KwwwcKTZuLIJFkLb8nBpdBmY5Xp57CpSW187JaK5VJTe5QxPoR+ORhn
	Ob+eG3HOK5pMKTuUpg5HJFodN19ueqVfQJw==
X-Gm-Gg: AYBFou1LET0fhuXCWTZPaBReeTnt7pKPXl9VEbiASakQawudGBf5ylHlpatAxNO2wn6
	zMgVLJxxCAi1f9XpyQmCNnwOcvvODC6HjPTIN6aLC2RELXsZRMTbrZ8EtFGOVZI/4S65dmOpkL1
	h0QWDXUlk2aJd5mmUXlQ2k0rQ2i1DP72w0wvd8ZD60y0RsemBIaL9ohTmEYLG/UjPgVOFENnQ2P
	3bRIhdAl3NYfawzgIZYqA+eSCTwzl3AgX8jtn8dQ71EV/15aEirlttjtUQlH8j35hmcO1XiKDGA
	11tB0HzwXylfZimAFtIvMYMklewGep7Kp5D24QRJZyacx0uMCW02MesQU/r6X4MbMuWPIfPNxdJ
	KD/m/P+UZjFUr/axKgfeERrNtRAKytwrHuv3iAqrqXT16uEArAkm9NWzN9D5aBZX/yT3bREsZI4
	tOAJxD9yfdoMVROdYEtHgJuv5Ow4tKxpp97qgeA7BgV++lc2HZRlEKftbRhzODWt+iqIf7g6kTX
	U2jMM0pSfa5x4eroEZXuyToZwGOQa/tObHIpweBprVjIXP3yQ==
X-Received: by 2002:a05:6402:378c:b0:6b5:4cde:9115 with SMTP id
 4fb4d7f45d1cf-6b54cde93f1mr2124654a12.14.1793772896441; Tue, 03 Nov 2026
 22:14:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103215557.183459-1-rosenp@gmail.com> <a5f044a803a64a1eb68815f075bda2ee@realtek.com>
 <CAKxU2N9OpxoKF6M5rJpNOJ1HWXx8oJ3wXHpfyGGVgQpZaMi+uA@mail.gmail.com> <55e67132a79243cc9e214f9de7788132@realtek.com>
In-Reply-To: <55e67132a79243cc9e214f9de7788132@realtek.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 3 Nov 2026 22:14:45 -0800
X-Gm-Features: AclHuK-R8dd2PGCMhHI3LZJWK6ZO8cOlM0h83Q1-A6jK8aBloOQEDV_UIvp2u9g
Message-ID: <CAKxU2N_JCRjWXkD8SNGf-LJGOHfCsAMM1JU+AoTD6cfZZYJ03g@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:21=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Rosen Penev <rosenp@gmail.com> wrote:
> > On Tue, Nov 3, 2026 at 4:47=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com=
> wrote:
> > >
> > > Rosen Penev <rosenp@gmail.com> wrote:
> > > > When the WiFi device has no ACPI companion, or the firmware does no=
t
> > > > implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() ca=
lls
> > > > acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:
> > > >
> > > >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe860780=
3aa7 rev:0 func:10 (0x1001)
> > > >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe860780=
3aa7 rev:0 func:6 (0x1001)
> > > >
> > > > Here the handle is NULL, and acpi_evaluate_object() returns
> > > > AE_BAD_PARAMETER. All callers already treat failure as "no policy
> > > > provided by the platform", so this is only noise.
> > > >
> > > > Bail out early when there is no ACPI handle, as acpi_check_dsm() wo=
uld
> > > > otherwise hit the same warning while querying function 0. Then use
> > > > acpi_check_dsm() so that functions the firmware does not advertise =
fail
> > > > quietly at debug level, as rtw89_acpi_evaluate_method() already doe=
s.
> > >
> > > Adding this check is fine to me. But my question in v1 is that
> > > acpi_check_dsm() checks func 0 to determine if BIT(func) is existing.
> > > Is it possible func 0 not existing, but BIT(func) existing?
> > Shouldn't happen, but who knows.
>
> I don't mind taking this patch, but this is the only one point I don't kn=
ow.
>
> > I can drop the acpi_check_dsm() part.
>
> If you drop the part, what will this patch do? almost nothing.
The !handle check is the big one that silences it.
>
> >
> > 7bf2dfccc2dd70821104d15cbab7b6fca21872be
> >
> > is effectively the same as this.
>
> Since rtw89_acpi_evaluate_dsm() is called at probe stage, I don't mind
> acpi_check_dsm() being called on every call.
>
> >
> > Note that this specific card was taken out of a laptop and placed in a
> > desktop, hence the warning.
>
> So, the warnings really bother you?
Yeah why not.
>
>
>
