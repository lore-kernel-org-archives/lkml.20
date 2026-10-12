Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FF3E6DDD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812083; cv=pass; b=gAUa9ceBi1sRvjVQLK8W9YtLi/93lqmycjbtxDDuVvZUe1obVA3IVGR8ziev8uuRaFi1guShfizPaQEJPepli8IsFlnhco1hPFYLSYsycoQ0N10R468lkqR0GDO9bGnbpiMkiw0aXTkTTv9VqHQLyfD0i2Nq5b4na4yzucys/4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812083; c=relaxed/simple;
	bh=Hjh9Sc1Z8WiXuHtP/aanprIfbIR9xjT2RLWFLTycrHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5vWxtwsYH+3ak8V4BYsT0s02lZAG05ityDWXaTKONPufnRwqop900ld4Xb09E0pz6FwkJsF1KhzB2WujBo9DdtMp1dKR44izEbvyB1FtdptLCeTBI9dJaPO6iHCBanm+7IxByCJyjN/A5bmV6jif8XCfJQ+tIr+rb+ImfS1kOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i60sjgN8; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i60sjgN8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53394bffe0fso79226211cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812081; cv=none;
        d=google.com; s=arc-20260327;
        b=ssbQvPZ/OegWOD9RJmei2tp9j53UhUPltlfUnP/dn7f8QB+IosbDr+ciI7IrT5foRg
         dsxafablJL2x/1uBVA2EXLJVX/4tSI8+yVmTUfCJTy3EjYBSJtq0iiWhM9a3tOsfGKh/
         +kKstcAZDC05QQ5UWhc4qIytPwVWAAh45lr2HodA7ItRnLQUzY1zJ+Jr5hUPHxCrTUrq
         5g2nf4KykC6WJheITr98yjHhfKm6L3Ms830De4eYrUkJuhNBs7jOwUDTj8vsexHg+aBL
         OYgT+hLHUeY358hxHm7tZ+bWz4MSb0qWLS/poCzQexwHoNBka5qyOGPU0+OIO2vxhmGS
         O29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/pQuL3QRG7ONHZtCsU3bcCCqTHvrsEAV12C8i1xPxyc=;
        fh=iKFIKrq3l0cGx/Gh2NwTOcy7M/FJYREZU9lzZj2JEII=;
        b=Sz4PghMsHm48bMvaGk91N6hUyIcjFZFg8WeliBZfI/ArAN5c8NnZcKqLaXmp3gVqIB
         AAwKvnRrcggl2C+Z9vIDVATbC4rpQtEbJMFDzGOjvq5uvpsdNc5N2RfKkak57vZqZL81
         kXt5I3jzJxSJbr1anDS3vCA+aZ4AMi9dieK79alJTIarPBPETp2sRDPB0iZPwUoeo9mP
         d9ewA2YcOsGLHpEWmismjUHq0OrALYCMGuyRxEQCz4zQ846u2iaup2BkTgl2siJEk5d4
         bgeVhAw5B59tk1rRhi2H7SEduPngpyH1A8bT9lyqqREQf7CicVoSPoEMEbgRdG6SZldw
         LHdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812081; x=1792416881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/pQuL3QRG7ONHZtCsU3bcCCqTHvrsEAV12C8i1xPxyc=;
        b=i60sjgN8Pg2KFoMIbqsgzNQ4h4khD3JMnyQLM7f3cidu4wTAnA9e+9b5egoC50ImhI
         1ccyJGnZFn3LQxSaSDwKedStLu510UnnRkwfD0emti7topz9C/tIo8If9gBVglRBoGqI
         lDzke/3kYan1cHxlIPloNUN6BiqKHj2rrcjYvxJr36+NqeEBiNMg7+/OH5vLnllmOrhl
         M9DHVv9SL9tGNov/bIHVMa5mBEHHgmff5+nBg783OUQCOBRmZuTtku4PgEp0dKZnQydh
         RJt3CIpqBcghIyEgYmasKehYxo2OduK7G4IXnYrljDJDCrE9/lKsqhTSuao7sxB7xKUD
         GTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812081; x=1792416881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pQuL3QRG7ONHZtCsU3bcCCqTHvrsEAV12C8i1xPxyc=;
        b=fTMfwVSNUPCdU7j3RHdRNzkKc8NUXeigTs16sfOlLgrCbBrzsV8GTKbwQLRmEEFaZf
         BGJEor0x66kgzzCdlSh6hl/LU/rZE4BDz+vANF817NdNur5Suq28bwkHkoqcWBBA4Q3V
         mDgbAZVWP2w2nxG44iGZsB42+nLmwij3kqplxyl0w+NbJIO4PVJqlA9Tpg7DXoeDGN/F
         vdqAyesvJs8zcxqdlT5IT34Ue64O7PUuKJvnc/1bxDwDaIPqsKKNxSkIO5V+0VKgmXkx
         SgitUFBLt099+YmABLsjmz497vWHitNnkwJ2tM6b8f96WcXsQ8sJComEuiXLPGVZ2bhU
         ECxQ==
X-Forwarded-Encrypted: i=1; AKwUvByofpR60hh75IpjJPXnQC9Hr+H5K4oiYe3Lzno3F9nLP6+9Nu36qR65gcd90b4Uf5OC0hZF4YVVthrvERY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeyCc0R27KZRshRHzRz3XBkkdBL1EHLDS0fZMIW8EL6duPr6oi
	Lof/u2DU9KFcdwWqh8pya8KKYo8HgWY0e4JoUL/gt3dz1AVk/9Zx5FIzj0yhSKxy7DzL2pjFQTh
	Amr/EZOJbSNbiJ5qdibHghHnrggyzHtUc1x1RAFxOdg==
X-Gm-Gg: AYBFou2R8EfqDif8JnJnrE1zw2MPo3I5jRnItDFGdwlasuhhiIeO7aaUi/k90c+9QUF
	OL+LWW5WSs9nYhlY9PP3ahUIiFni+AOScz4vOUXMg+dDSosg5dSp1fCEqBzYoJ1WaJIFi/riVzl
	/gmL+JC9gBh6cOgViUeQdt7Z1g/XC4VnBRq8GKgciN5+Tl9ytfJxEcT+zPzhY3LsownHsgwXxeu
	VxdP6JB2RmntI3bb4gH2LTzlH7CXFMRb5RMYtQk9LHj8nRj5OKJQBKABREuvXReIBCd93TeAmCT
	S6DkSWOi2+VFx6qlqCQt2eftC5k2Ws8slFrjMoOC8PMucmHK1pxLsWpU4LS8ExqhfFaBdoiDkMt
	Qb3cpba8RX99jHADvrFgY8R4ryNv6lzjpVAXWqbFe6TR8cevkTdD1NuBRKkPkpudg3G86c+VZRH
	ffGQf/f39H+Z00hdvmDiqm4hENKKtx1TsVUjGlyNoRDG4KEH9APBpzvcHL430VyaGXmsoZGPpTA
	WbGTSZl9sJQxEr2cq9F9CAVv5OfCYo=
X-Received: by 2002:ac8:5a84:0:b0:535:1b18:211 with SMTP id
 d75a77b69052e-535a6167c2dmr141612981cf.19.1791812080480; Mon, 12 Oct 2026
 06:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012132622.48550-1-jain.sm@gmail.com> <179181183946.2527009.5855837780305581870@kernel.org>
In-Reply-To: <179181183946.2527009.5855837780305581870@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 12 Oct 2026 19:04:27 +0530
X-Gm-Features: AclHuK_kfEe-9ObjWtrZZzSOuT5ZHZoYK7KuO9E7Qd1UmZm7snqpktX-gyYDV3Q
Message-ID: <CA+FWx=mA0dsOSopCNBiA_8BrYSDYD7=jxMO7uLpxT1OOU-BkWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] tcp: keep the route window metric when
 SO_RCVBUF is set before connect
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>  - How the issue was discovered ...

Found by manual code inspection assisted by an LLM (Claude Code, Claude
Opus) while reviewing the networking changes that set window_clamp on
unconnected sockets, then confirmed before posting with the packetdrill
tests in patch 2/2 (SO_RCVBUF before connect with a route window metric,
TCP_WINDOW_CLAMP vs a later SO_RCVBUF, and the TCP_FASTOPEN_CONNECT
SYN_SENT case) plus a veth/netns reproducer. The patches carry an
"Assisted-by: LLM" tag for that reason.

Thanks,
Shashank

On Mon, Oct 12, 2026 at 7:00=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
