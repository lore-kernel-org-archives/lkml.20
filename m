Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452139;
	b=oRy+dk/OlNZU1G6zHKMRD/cOBN9i6y7Y2Bw4d/gHxIEiQNspc3m5ZN3CpnV8g3KTT98h
	 OLcuJTiJpffJArroBUt2Sx3FdKuFMESsKxgQjgcdZi+ag3opzNXfLg3ERBn65vWRNExeQ
	 2P9lIJEwbBz2tFMhjNq2DHaO0zON1tq8183FAULY8MMdRxulq46sBq/x67HavjCoOK+UG
	 O4XGB2xKMEFLvACMOEozoH3ETNtrITqow4NjzaXjObvGTCsX4AmhG2u2kUgqcHX3z6Kvw
	 iZidEb0ROX4y2bMl/OI96pj1NFiodRMqq6FrVTaowEqmO/hz2s+Fln1W6rQ5bsqwzKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452139;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qi7f1KgOCzopIIyafaAsmIgKuU3gCkVBQNjPcWy+NIg=;
	b=dh+zMl7hlxITf0mhKGtPtZHRW6liOw4NmmaoNn8+rhZfSCOeZpb/+cQWaO/NrGq6hxSi
	 3XXLW8nipjNcCXQ5gn1N8U16+YPQ1j3596MpGfLA3gDTb8g1cCo46RvkWs088t/4mUq1e
	 XiXszNKmYoB9b8VtUdnQTAWxNPYyui/HCvXrGXh3d+LlB3VV0OKjZN4IooEj8DoasBwcS
	 b6NBPdfvWMSXO2PwWLotLD4XDBZXqaNdVp2NMtWMZvk8pQBhWiBlk50h2Z+24BX1SHRBY
	 edGdAvq1yQF00zsO2A/YH5jgUAl1rjbvqLMsaoy46I/daxjZtgqoamY0hIQTuc6vj8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfnut9uF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35756606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfnut9uF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB9A1F000C6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792452138;
	bh=qi7f1KgOCzopIIyafaAsmIgKuU3gCkVBQNjPcWy+NIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jfnut9uF/Znj3kJltSHyEUFi8bTwH5/fKeQU9V1eGYqCSYcfync+cRebGXIRcDZkr
	 v5lKqqXYV0OV0y4kWh3KJpJto4iPtKrzZksP5MGOifmaikAIeMoGJGE/LzMrTWa7wo
	 RRJIn6UdlibLr6SNljMi+/0eGaDuYmebiZxvQ1NSK+IbuZ1MgjC5mVTinZNXlKnJHQ
	 /BZYQrzr+loE9Rw4ZNhbCFtFTiRAfrlh62MLpvAeeXPa7Cy/EWEakDW5zdhRCAX2GH
	 P893cVzZ1AjgO6MWHiHroZLg6A1hpjZwvXopp/DlaqAi8kHHiEaP7eyJN3oZ1GJJj1
	 omfldTbXg/m7Q==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e8c710847so331660766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxltkzkNl5YnLe0E7qpEB9fkk+iMHmW0UGQb96KYYTtVxF3BF+E80PCtEEALtK2ZxBKkUDqTJSXvLG1INw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnL3V8PGYjoSGrw1aNAa7NmC4DMiasWU9ZKXACIi2sc2MAfwzy
	dvWxfxdiw6p/hDBmt0jkcyh4tm/sn8ynDLTRsMuTgok8jeyCFp1uODQF3WXSjqzkrAQzoGBjsDl
	RJMVn3XIsRQUxsySM7uksuOHp7zHGT4g=
X-Received: by 2002:a17:907:3fa0:b0:c40:c6c8:6bd8 with SMTP id
 a640c23a62f3a-c419e838694mr681955266b.20.1792452137514; Mon, 19 Oct 2026
 16:22:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015144934.1800240-1-hengyul@cs.unc.edu>
In-Reply-To: <20261015144934.1800240-1-hengyul@cs.unc.edu>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 20 Oct 2026 08:22:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-79BubKS44eb_JQ31QD-bY669bQhcFZCcu18JtdUFUQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGdgwhEbwfe_gFBT5kDnV0OKkRUJozhsOJjHQDS4Kl-rIULKojpqDmcc
Message-ID: <CAKYAXd-79BubKS44eb_JQ31QD-bY669bQhcFZCcu18JtdUFUQQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix reading a directory whose FAT chain is longer
 than its size
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, chizhiling@kylinos.cn, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:49=E2=80=AFPM Hengyu Liang <hengyul@cs.unc.edu> =
wrote:
>
> Commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper") made the
> directory code walk the clusters of a directory with
> exfat_chain_advance().
>
> However, exfat_chain_advance() returns -EIO once it has walked as many
> clusters as the size of the directory says. The FAT chain of a directory
> can be longer than that, because some cameras stop updating the size,
> see commit 1e5654de0f51 ("exfat: handle wrong stream entry size in
> exfat_readdir()"). As of now, opening such a directory fails with EIO as
> soon as the chain is two clusters longer than the size. Reading a
> directory that has a FAT chain after a seek past its end fails with EIO
> too.
>
> The issue can be reproduced with an image in which the size of a
> directory with 200 files and 7 clusters is lowered to 2 clusters:
>
>     mount -o loop exfat.img /mnt
>     ls /mnt/d | wc -l
>
> Before commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper"),
> the result is:
>
>     200
>
> After that commit, ls fails with "Input/output error" and the result is:
>
>     0
>
> This patch will make exfat_chain_advance() follow the FAT to its end
> when the directory has a FAT chain, as the code did before, and keep the
> size check for a directory without one.
>
> Fixes: 08cf4a8181b4 ("exfat: use exfat_chain_advance helper")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
Applied it to #dev.
Thanks!
