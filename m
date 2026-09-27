Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93595384CEE
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506114; cv=pass; b=jp49MMs9Qpk/WYS2LbkJbYroXkczE9Zc5r14N4wzQ4pluvQ9S4w0nmHJt9b3PyeZ4V1jB6Opyh0AEpekiZqGNgV2tCXsZX3yTBGN2uBpz0J/901LKDJ9Sr9hqYLc5pzWJtAVaSoi0wlIX8cS/BuMq7iJNfjMAi+v9DF8rbiqTAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506114; c=relaxed/simple;
	bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoHispczhmzUEUpDnxtSc/bsiSFCPKavsRwqXJvQ/bjPwKJjG/TvXPhC1RptRwh+n7fMkDElIz6zcLYKABomW7M3BcCHccT6DT048p+BCOKN1gijXzXWKQlHHAdnXGkskMlEZXU2bjUnccJo15fk//8wM/2cu3mNK6Dz1A7bvIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERazlVXU; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERazlVXU"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso158659eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790506113; cv=none;
        d=google.com; s=arc-20260327;
        b=FtV6cRoUjTTEnqiL9KZYgmMLqf4/NEsVDDzYBH6egWCWdtpCLIj8D4RRbr6cnai6Qd
         aq/yLl804ey0Ux0cSzDwbvR+WuZdtj9RkJEIlvc60Jy9zxxdh7t8x00129FLbN2KCMyx
         jpJ8OriVImydfm7lD+uPXECPFMEhXhWRBDbOr4BtbYIwmcaQs738KPyoOxUdDn4eLm7P
         FvZWuiTql6V3M6hePoqyi8xPbFL0g2EPMnAtj7oT6yvLUaMvxDnGZM3FFMC9A4n3i0UU
         NsxQuQK/FPqxrDGKamf7xQ0imCdavloIylN1ygrv+8yvhygFf1izZ8lAcQFtRfXdgDDQ
         0Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        fh=uiiUWoDxG4yr8vriTphxJgBY+wW1MjRTW8+XgBr5S5s=;
        b=GQEtCtxy3M3I8j1hWDsU+x3No26ni0rGTwRaomepw5jKu7lcw4/3vW+sWQDTCAKUvw
         NJYxrWWinO9ZkqEEL01gZAGDB9AXVF05uAiXjdhBLAahZJrflILG3bMfZACwj1Z5cHMc
         mLWSaLW0iuxoOJLLtBNytYK6FMlkhilzavyYkW0l9ljK2cO+sQsiiZNcNDLkm3BFI4L7
         QC8W/iXRCL1Exv9h9K8YOmq1fINihLPN/9E6TbU0PgsKXN9id0y0XAA5DReLhAsu/HN0
         UrMt/2fRAKm+4Bo+eRjIKTej0DyoH4wy2FYzFzxxBxMCcz0MoMvoHd97UzSiuE66lYv/
         UayQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506113; x=1791110913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        b=ERazlVXUAkPzxr3Oayu3BPW454HNKkeXaBRDkautfzZxYuvWFgc+TOndcmq1XCAkXy
         eiWni4nOtiMJmDoeRBVVqMTW3TqwRHcBfMlP2ejnR4rBCSispB7KPDs2GgGbIFToB21K
         P4ROW1jnh6/G1a30wBdrSj7Ca57y12EFq6t0lAvxPeBjW3sVqMa/bVIFZMPPVa8eWugE
         bNAgPNauENmrfZrRXXNp7G5JEbHM+wwQDqhkNoC36Laz0ldUwVQd4epVHHVM4PZNDpzO
         4/6RIdHwAAJAU4NX31C1jPTrYMZmaPXeOF1x6OEDJy9cT++px40WgZWPes8nwAQf1uWS
         Nulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506113; x=1791110913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        b=faeoQDCCB+UxxQEXntblx7vkOxg1IVV5vKvcA6OZW1fn8aKTsnLfcJbAfmgR8S3D4g
         XRt3swUGt7Yqse9zFInUV0Fk54oX0TF0DMWTN6esmxpTkdjVXdn5pNf4NeqpOjV3Jz5T
         V7sk7YzihB9738RwuxdamCQDyol31fOuCQLqE9Js9OTFDAFRAoe9VTy9V7u2Jo06xTCX
         X2om//GizYQMsietGzyKhbkZc2EiMOmNj0tHuDP7Wuy10uR8k/lrTtaLekqZJS1uqtm4
         r0w/1HhkGO6eEXnpeGxP3KijJdt6efhft/CH4HdCoK3txZnyOuDfcbz+fRKN/L3Ak+Xd
         q7yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy7hxcN+DSgX6yzSku3qkfpP2EsBp3MygFD2tbJS1vS+lsc20UONNhD3gUCtP/EA8uzX6SaKfSTKvBVCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFvSpQCpDMys8BkBlvJVoSYb54lU03jEdVbY3oJEYhshRNPIwr
	HqWvDeNsrQW5IwOAUqToqK7zwZ3uzh4MF37vJEhyt/3JlPIdkePJ6CaolhmIqQVA8coijLIj2dD
	qBSXRHjHE6ja0b1qWALYcro7VbcpfRwQ=
X-Gm-Gg: AYBFou1ub5ahaC7KScgUCyRu71NMNTEDqdRkB3JSxaDsPrduFOnDNTcjNk65VPNyPTd
	Tq8/EeNAtlBnJhkXqWKZy1g+/9xypC0cqlXvAGpuhFPt2pdLBRUSSbtIdAeOpC8BkKEVHcUCaSO
	rFggvC0EphXeI/l6FYh5OFNi5ZrKUWEGjcxIxfdMwhne9vClmWPL4aC6x4yU4cM4WgrzDnpo68k
	bgHvhNootks0skmkMhFJg9BAcp5d1Fa7nXktH/HWbiq8/gHHUNrsilg9bsN6Bnstc1lgjVfLWiT
	c0YQ6+LoIhQ7mPRsiICCGnAPhWj1OwBY0hoS+2o11Szb+6wfHruOuJlhm5jNYPA8IiqEQnyN6y2
	P9Q2PxN5sLUFmD9DH6eFSBSs7FSMng2nXqWIruFByhTLT2DoxQvAzh4RcqEZU4VChEDzwgdcK+u
	hl8NDoZnsyoIcP43LVGuxybEgjpzBnslaheM0imaKAR3XGJM4zwHN/d63Yd/ka7w==
X-Received: by 2002:a05:693c:4099:b0:33b:ee8a:2061 with SMTP id
 5a478bee46e88-3427169bcc5mr10569991eec.1.1790506112570; Sun, 27 Sep 2026
 03:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v788t7xh.fsf@kernel.org> <aC94ccT3un1EKctso2G_kliI1gc8wSausWGU_X9r-V4YAhGjsYXsQCgdJxkzK8r17dZZlWTNqshNIMN3xs1LBw==@protonmail.internalid>
 <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com> <87ik3w2igl.fsf@t14s.mail-host-address-is-not-set>
 <tencent_C5A4AA0891F6F42B9C63D6E7AF460782A007@qq.com>
In-Reply-To: <tencent_C5A4AA0891F6F42B9C63D6E7AF460782A007@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 12:48:19 +0200
X-Gm-Features: AclHuK87iO5FOOguxgTW5oV-Lw8OS_qDSXwVNiSFWHJ9NydHmO8J-Jz41Ja__rI
Message-ID: <CANiq72k+e1c1ZvoziA9bFed=JFFg5aGqOHGHqzmVyW0sC6pOXw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: configfs: require thread-safe callback data
To: =?UTF-8?B?6ZmI5oCh6ZyW?= <1479826151@qq.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, ojeda <ojeda@kernel.org>, boqun <boqun@kernel.org>, 
	gary <gary@garyguo.net>, bjorn3_gh <bjorn3_gh@protonmail.com>, lossin <lossin@kernel.org>, 
	aliceryhl <aliceryhl@google.com>, tmgross <tmgross@umich.edu>, dakr <dakr@kernel.org>, 
	"daniel.almeida" <daniel.almeida@collabora.com>, tamird <tamird@kernel.org>, 
	acourbot <acourbot@nvidia.com>, work <work@onurozkan.dev>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:27=E2=80=AFAM =E9=99=88=E6=80=A1=E9=9C=96 <147982=
6151@qq.com> wrote:
>
> Hi Andreas,
>
> Yes, this looks good to me. Thank you for your reply and complement.
>
> Best regards,
> Yilin
> =E9=99=88=E6=80=A1=E9=9C=96

The mailing list drops messages using HTML, so you will probably want
to configure your client to send plain text only.

Quoting your message here for archival purposes -- I hope that helps!

Cheers,
Miguel
