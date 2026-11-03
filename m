Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674742;
	b=mL8CsErk515dBnBetjerUZuwI9cuZ89cIlYHxziXKt59XA/tIlMdHLvVKOh5XFDorOKl
	 BBHdX8G8QVzfCT+bBOnXFrFwJzM5lseAI6qDvGQ6sj++TZZuc0o6gQTDgL3x1C4qa5vno
	 15KweT5LgsBk340UdPaTvYpNRe3oMAvIeNxVanmFoLx5Xmls7UYeKM8Gz05/Yj5f/Xqjw
	 /2tAyS+S+uTe/6p0j0Zx9qR3Q3W+3e4lTLW5tkWvn6wt+UqyvLpumuIKgmfxeuf9514gr
	 9KcW1oW7nEfAy9Y3z/nUjt66EusT2IOA1GT3yofnET11NKVXHy2DAU8zPLsekB4y1RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
	b=CPvGlbecBdfw2nyIkfCLliyfJeyF3RJPR8gSsaNu8u2E2D1sXh/FGrn8d53iDpmDrWmP
	 bi517SVFNEFCyfGxU80MAvYj0tlveZw1dZWZhvlBY23x9qYCtYVBHp7VUuCX5ExB55a0E
	 Uh1PRNuAaSjs/wI8P8DxpC+qNzEjRKV3d2KX80aK8Qy/AVPbV0/CtRDkM4S1tJj9zkNwk
	 RLK9jD+16gwTcXxQWGJ54c3XXBF+VGStb7YjcsFiZMfVi/7R1Tc1/4cO10kPBwRuSMYU0
	 kfm83ZNHMm5Uo2hDCDRHIj4553t+5WYhid9zOD6QgXAwJJGoh+1Cnc4y5KAV+gn9Gow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD4606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBD4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2856a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674740; cv=none;
        d=google.com; s=arc-20260327;
        b=lp3FelmgUWM7TeKJ8I31Ug8YImSPvOEUolD0Pz2/nT3HUiyoU1WxI9CRHuH0QA4lf7
         Vh9JnjRNF4SiaAo17JQKchzbZ39PPFZfaF5zUHvgM6igyICbIk+5/2C0tQ+4nyXgvxrK
         J+vCRNOxhWZgEwtdu/UtBnB2OCYr8rAZ8gbGFtlqrra7KSnpDzmwWOzOle6gq9AEThQA
         MuhqDBggxbBhY2tLdGKSQH283PE36mrJPyns+G0+QC4KWlz35DbymTQBEttxn/sn1cwI
         6pPNWwLALV0Al/XdUv1k9/75LGtKBHWjGs5dUxABT5m8QUAJqB2YvDXlEBlByR/hOUMr
         6kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        fh=ZWzjNrxmLFpP7IWcuAqZkwyto7n97HYMitGY2FBYgGo=;
        b=maiv4iDbmgHIXWqnIBYRrE6RWEpd7YcLZb36OIwnGvYC4jXRaNmQPJKBgRI8Io8slY
         B+lSqlUcyZ/1V6z6cMmHg48Hwx42WsemAjRdw/Us5eYu0U6oLuGwLEnB5SxdKPmvcpmU
         WrlASqsAKYLW4UFpZ/jfR+GD/Z8lOlVugCRLR0Y7EUyCNf2IHTY3jOehfkHZr0kmUVx6
         KficXfopSJiCiRyzEjPnLkBzN0E7zb8hQ3S5LojX4LXFR+Bye9yB9NH/5nBAVUQdek2R
         yndEVfqYMMNr4jFmQLlt55JVbMfhbtpWZ6IzSyLp2gC0j+QGbAAfMcYlSF3EBqQmS1Ou
         pMCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793674740; x=1794279540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=SWftFRzfsr6HRx4mZ7jlKL9NBy880MECjOX0cGycb8yBgGDCdwhmaMudA5uCPfnCsr
         12rC+qqqvmSvKFG7NqLjNYRVUZE34khfj2SjffiiS8W5B5WZr/ZYboQR6rm2ybo5agl6
         KXtEvNcgHqwKMkLMR95tW4NLAlMHOmoqEX0mXlVeJqVOqHwpQ7u/x7oYcJcbK6Whw0Yv
         SxHXuClHnSuLcYRwTHj9cfFqZT5eWfkatAmjmPJy9ZR93RGnD24qRv3ORgNWVvy0TSYi
         DHvVQHYtwo4qQKosyCBDfYGYqALpH+v6Yh7R/cORV1TV7J7hYBYNhA+WlDn9ASn3KBGH
         lUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674740; x=1794279540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=uvTtnV6nLL3R3/2iqR72zlBa4TPcuIlYHOPm7+uz0kw4G0g2DqhYooZqjjCT59Rvkh
         DCF5CCzQPdVgDlhkXxk8MiGSitonGhScp7I2ubROKRjLZba6NyCiTb4XpJsWg46+76VQ
         YAb4VfLbivn7TurGiWaxRMmHvXveI5SS6dm03+1RMOsLvV3Vr0dl3obfxKRG6lPEuVg4
         aVeKZ2BvHCqt54fd2ROLnygKct7XFiP95tVfWffKzVxx1XV/SEGToYfxDK0tVYUFuGbl
         WsamlXxPNVMhph79fyDcqWpUU0eXS3kt8/D1hhHV/osGAHklESW9nj5EDGjvOITna1jC
         VbBg==
X-Forwarded-Encrypted: i=1; AKwUvBwHLAJaezFb4TPsVUpeRQZxPgwxlt4fw2TTZQmuIR7Xu/QMAY8r666zzgKEsrv57GCOeUArrT+CViGbJPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K9s0ILhlrVZQcZC3XWwMj3feUXqlv9veQFTn3nywrQh/DRVxf
	LCsBjOo0nhXB9/Mkpj5OyKHsvfNZJqktFjxQGeNkMa0Q2gnJsvB4kyhJUOEdQR6TeG/8vPK3DEt
	6lyUDc04+PTDLhtlMFqKiHlKI6mlUZ7PCGlPtw0pH
X-Gm-Gg: AYBFou3EzxSxueNBrBbu2eDXBM+KEqxIb0ZeaRVBRmUY8qmEkssawVq+L5VUcAQTCG/
	/Pd7hGFglrylZXDnFAs8qxBl/QpRMeYT+2ssB/GehNDMubtx843z4uGSMVw5hrYgzUC4I2feswW
	A2ijtnxUcyNluP/twmV+EGvSDbm+3X0V5NbyXEYDL4gQkvx24fGeG4RGm0djEwzmzMbBlB56hvN
	WzmltCigdHlGYRBPibJBj329ghDunagVYXwQK/0Yx2xrqk4SBPMqIgKi1TXceF2d8Z6VQ7111li
	AhSbymJaAPa3wrNNhfS41ljcYe0UZ37u5/iKBPn6v67RJNGVNL0jrXYqLnLKAtBuDkK6kLiDFDK
	nRbKNU55JdRuV/bWPmT4vAyast1547lSdGS1RML8=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr32077a12.14.1793674739712; Mon, 02 Nov 2026
 18:58:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-8-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-8-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:58:48 -0800
X-Gm-Features: AclHuK9Z5oWBbhWwMCS_z-DuUMSaT3p8QPAgg8n9KeMCHplfWy0Bv6rYsGa7af8
Message-ID: <CAHS8izMyGmLC0yg+WT7eAZ0tkSoJ5K80t-J8-WfYegvjDXonMA@mail.gmail.com>
Subject: Re: [PATCH net-next 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX net_iovs are now sized from the dmabuf layout, but the TX tests
> use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> buffer from it, so that frags end at and continue past the 2MB net_iov
> boundary. The payload has a 7 byte period to catch offset errors.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
