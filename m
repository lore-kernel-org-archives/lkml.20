Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831033;
	b=Qte7Ts/tCDb5lhPiVVuCEjrMgs6Z4AvxFGxpKqO8DxxlYrs2y/0SOEMV+/LhbCGIVB5g
	 pRTYiJ7ogzpnaOvdkyv5eTaElkYyYXKwVcxIuklfM4dYqTwOh9QDEm2uVI4RwGgPYp+cr
	 pSulVamILXQ1jBUKqXE8IToyJNuJ9+xg0+aouszPP+4bkSE1h0Hr2RQxwJxuXJlkeJzIN
	 dC5ASqKp2/kFVD7NBV2c2j05eomwRCF5F8IJrL2bnEzsVQ4wxlAmaVLv+FtZiovr04QbN
	 cO1wTUPY6FCuw0GXqu+1ZgGCa6PKHwoWbr7fExApXLiCDQI+vjugwxZV6/xUcb5fGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831033;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yogqGq6K7jVQChJ/YPRwUkMOSfe+PhV20PoYhuNYLPw=;
	b=pxop06P8xbsoBujBmDBDKTMYWmN64vvlonHrQdX4zODhdEyc/0ueZp1p6EfQVpjVs/EM
	 Zyd4HMsaW/z348Si3N+SBInunY/QxYYhlYPfX9ULh2XX2c1U6NoDbAQ/ehPc21mbaI5gg
	 nF8uzbuLqOzMXH+OOXESPN7wyN/Pe8X7CkGExwufIgXLKZPEA18RHMOMDp5qG0y+0HnmZ
	 sHXZM4NYfc8wOB/9PWxsfIwCj/hfjG11nEvsltd6JKnZAYqMPu791Zvfgi4XkYZi3hy5Y
	 aUZwVxQYuVpNl+7yLpr6WVIITNJwbBoC8/op3drvdpwNRg5q3LWERR6qfiDhNlNtsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laVHPMRv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B86606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laVHPMRv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB471F000CA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831033;
	bh=yogqGq6K7jVQChJ/YPRwUkMOSfe+PhV20PoYhuNYLPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=laVHPMRvx6oakQPHa8D9yynGmLvQU7CtRHDG3k5VsbLKnX6MVJYC16B1n7TEo4pO7
	 Bfpdt8Koa3ncyPTCCvCfR39R4WAo2jqevyID/eDj2Hpega6j85UEtJxMaDzWtj8Zv0
	 BMxxoZw2GS0DYgoCt27Ja4AqJ2yCd7H1xauCw83Yev2Au35h9HjzPD1i0y0Pu837Un
	 HxhSR+M1J0y1Mi/uCPY/oXY39gnjhxLFMStltd6P2wsG2qxPb6+KQk42bpnXnKjprK
	 Decv25C+QyD1v6AF/32O7JgzZ9cSgBJRgAHWrWT2ZvBkkmn/tEQaFsslZj7TBnhiZP
	 +Le2R0w3nJTJw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4cd576f2aso8305997b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:10:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6EibPeZTtQopahlo8hA0sb7B3wXj7ZJONUyO2OcVjtDh9u7iYLA70Ek+WVZdWFmWl1eATOOUsSGInc8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MiTlh0JBjn+z1HEzrpjHUVyq0ai/oEi2iS/babrzvdLGUIjgQ
	HKosit2gIBt6GwhRJIcJvbEUhfNhkhbo+Mutv79TeCNHrkizKWbukfIOzMLPEwRAZMOXY4YO8PE
	cTiNSIgjoJl6TvucEQp6+90ND2ZG7ArI=
X-Received: by 2002:a05:690e:bc2:b0:67d:b274:39d6 with SMTP id
 956f58d0204a3-67db274406emr1915423d50.55.1794831032524; Mon, 16 Nov 2026
 04:10:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
In-Reply-To: <20261116074849.475815-1-stefan.chulski@broadcom.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 16 Nov 2026 21:10:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
X-Gm-Features: AclHuK-NMgDJ7sKrkDrwDOe1Jm6Lwdix0HevzR3vIhht9ZS3bSgXg6UFWRTgmyo
Message-ID: <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Stefan Chulski <stefan.chulski@broadcom.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:49=E2=80=AFPM Stefan Chulski
<stefan.chulski@broadcom.com> wrote:
>
> The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
> ("fs: WQ_PERCPU added to alloc_workqueue users") only made that
> default explicit as part of the treewide transition to unbound-by-default=
;
> it was not a ksmbd-specific decision.
>
> Per-CPU work keeps request processing on the CPU that queued it, which
> is good for cache locality, but it also runs work on CPUs that were
> isolated from workqueue noise (isolcpus=3D, nohz_full=3D) and prevents th=
e
> scheduler from placing blocked or long-running workers elsewhere.
> Which behaviour is better depends on the workload and platform.
>
> Add a boolean use_unbound_wq module parameter. It defaults to false, so
> behaviour is unchanged unless it is set; when true, "ksmbd-io" is
> allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
> workqueue is already WQ_UNBOUND and is not affected.
>
> Document the parameter in ksmbd.rst.
>
> Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
Hi Stefan,

Do you have numbers comparing the per-CPU and unbound queues,
How does this compare with the earlier following RFC ?

https://lore.kernel.org/linux-cifs/20261022092514.2590010-1-huiwen.he@linux=
.dev/

Thanks.
