Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649484582C7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835110; cv=none; b=uTipVDu4ZgAVrUosf90tv+kw2FcQqhQNOcW84m+T7UzTPFvh31vAxnwUaKtRrCWdU1zigBul9lJwjHGGVVZkkwYrtfO57ad2T0SqCEkUTgUId+pNTcjyY3rVhTHuDEL3oh5Xx2PffSgI4LRqsRIeaLBv3DO6/XBmZYdgX0HEPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835110; c=relaxed/simple;
	bh=v5jl+aCSpkkvQGNIYYVrCrKyR7mWn2LR3j2JbpKPgPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2kzVWE4wZMAED1p8Xjqh7lyVOrkSqC0tU4iUvYP+Jn8XXidVg9s/1dLyzzuYWsogcRV8Y2lWQCPnp0FgqSCJRiAAGI5nsNeJsklgm1hk4SIq39imckkJPUkvU9NrM2E6XLrGwE4b5VX3ZM2R5To3U9z8rJQeEfuLyY2z8ZeKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtQTj6od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtQTj6od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F351F00A3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835095;
	bh=v5jl+aCSpkkvQGNIYYVrCrKyR7mWn2LR3j2JbpKPgPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KtQTj6odrNbQo+tcT34S+sezcdJj2BTCjN3wknjvnntYyUiI90qbsBzeTMVewApK0
	 c8DIsw4Wgzvso6nc6gmt81XPnusTt3oDL3rt0GekLCuVXJJ1SXDVS/feVGxFozA20T
	 4r7wZbL3byPi4iq8xF3BNCVpz2xuHYpr7iUDBMmuOHMyQ4SETwJ7HOo3o8b3bCK/Jq
	 K6rL04LtSK3xSpIuXCu4OukxiKEJDDD0ez3oHVPSK1jBGdTyAmETfiiWNPreyynodX
	 3zV5mV/0E7KDRg0/mZm0M/5njbYkF2BydadedBDcenOEo0YZCX8+lBtKIDKV6cQfId
	 QjY8sLiy1HAAw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c253358b121so89835466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro2Q59E0xij2hDPBxDQAl/fK2iqrknyLYBQ3X2IYTHVjtU+c4RYrzKAFr02y1DI3jeJ6ATS4PzIIkQt3Ek=@vger.kernel.org
X-Gm-Message-State: AFuF++lPOfWY5kxNeB8QHH6VwBydlO++vjuI/AoGOzLp/Sm1Z7Fp+zxC
	7kToMkNCsz0KwJ4VjOz25++/vi4TYio6gortBWUV1uLSfavVsJ37PhWAxKedW1IOLrTBMf8jL+J
	ZdwQl/PiN4z1UAQ9jcVeCAJeMVtlRSE0=
X-Received: by 2002:a17:906:2083:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c252a782276mr972912466b.6.1787835094458; Thu, 27 Aug 2026
 05:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075935.170457-1-zenghongling@kylinos.cn>
In-Reply-To: <20260824075935.170457-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:51:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8ZW7oGWVkgdW04WH828EAM2RwKptUxmobWJ9q2STsCtg@mail.gmail.com>
X-Gm-Features: AcwNN1VXPH_P87koasaLISpCwL-nDqmjfpElMWmTsmzod6L3siUJMK1CCNs9_5E
Message-ID: <CAKYAXd8ZW7oGWVkgdW04WH828EAM2RwKptUxmobWJ9q2STsCtg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix memmove overlap in ntfs_new_attr_flags
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 4:59=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> When the record shrinks while the payload offsets increase (e.g., enablin=
g
> compression reduces padding, making arec_size < old_arec_size, but the he=
ader
> grows by 8 bytes), moving the name first can overwrite the old mapping_pa=
irs
> before they are copied. Move mapping_pairs first in this case.
>
> Since mp_ofs is derived from name_ofs, they always change in the same
> direction. Checking name_ofs alone is sufficient.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
