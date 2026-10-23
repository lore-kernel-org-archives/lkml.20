Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742522;
	b=09bwaiXtfiBcIt6QR1KL+1ZZHbtofIuL1FvJQhhlo292m/oEDcxrAdr5/kVN8Mfv0xhf
	 9rIQ/UCDMrfzGGEJHZeDHAV638BXG9zsAnJLwIek9ZWOxXks1QrlZhLGTPSXDsIBRbh5E
	 8pRi7TI6HAVHlYeh0iw45Qmsv++UCKM1LbM137CdCZXmO91MytoLKH3vf4RsgfWu2z/Ej
	 cqcl/FS3EOzAV5haj5ImnXhygYvokIJ/XWuM37xB2jAZyJgNTpuAfXrLpMcywTprzXXOi
	 jP7NDlg6xro18K06SV7LjIuCjeJkLFiG3MXrNI0rFUHA7c03z1d96N0T2dS+f74OAaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
	b=zCwSeYspgELt/VOv0+kSTo3r7jLRj/7h3W3TxjBhdEbjY68mbZSN0L8r/0YNOs/cyUXr
	 0SdrUyrZQC7W2iOpVoInDgKP7sb4SDya+IC0zcxKZ9534YPFj4dEGSsliYjhkMaVNqBBa
	 +IlvKvEJ2pIWMzOcIe1n3VMcx/rkncajjk2TpIpf8XhtEOBDyNot/N6z0MWu1lAoUA+mb
	 zeAMWeBPyePT83jjku+LnwqHmymnhG17s7RSlmgcGTOU0RTumvhIBvDdkvsI2tZ/HiBe0
	 Bnovq6XtB8665s6L8WHV7JEDlr9EqbZ0EwrzB0D6FVfbc8aAm25t6MenUiG6BG0S7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HD41iG65;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F942606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F942606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HD41iG65
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea1e7fad99so2638855ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742521; x=1793347321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=HD41iG656yMUK102wLHCu+QycKWyUjK+pNlZxmmUVXYay/KVDi9lZS2AwdBhibwgsp
         9StHGFsh5f4NgHgBgukCttMkj5COKB+Nt2hJzZXv9hwByjCtmed4HfgvN8tioaD5xu6W
         J2YEosyiu4BlV4JS8GWaDx4EzoOzGISn3RCAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742521; x=1793347321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=PRFGX8+o3/60256x3hfyEw/7UN+JE0BwplKiXQkuZKRws6TDiU7+e8N3zzE7JbQdGk
         GFMy5V1Qic03XT2QXWPoSRuG8wR3yf7aC373nE3LycKWV6yxrC7Rbq8PtUAYTGiHwJvp
         4eBXuM+6GnBI1HU9G00b9N4J/fsh809cYKCtwchqL+W7oC+rdv9urYKfuFUmPNljEhvj
         sInViWNt3xnIQh7F8iMdqDhG8luxFX7hT4N/t2mstmMmRKdXc12znY4ki7GdrMWXShpS
         ePb+YYaI6aJ2/phOsUTBJVkqOruKVr1srpBiY5gR8SKo4ts9nwtjNaHkZ62ekrGBRVs2
         lAzQ==
X-Forwarded-Encrypted: i=1; AKwUvByXM5KDdhKfkrEmB0Ph49CEf2LJ2ZJ4sOwFESDixqHkC5wydDqbJZBo8rcvsXCcuZePaAFhkQvkbfdAUwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6GVA9is0hax97wETsptOnDjW3v1FcZN5ME4feymXPKmUHc4M9
	OJEeFmoZ9kbOG0S8Gd/TYiYhDxddJNP5TGcqV5g01hVZ58XsW91kCS1tQ8XcJmb9kfJBVikI7eW
	ZUiJJimrb
X-Gm-Gg: AYBFou3ZnhCN7dz5k1gr3LY5FWkVdoHOh1IS3QAB0kzCV+MDffEtVr7pLJvOpwqWIeN
	A5267RS1l/q1CGa8UyuNg9gSUjNxZ3t0qHOUtVXPC216EDqTUblD18hzZ6GRPHzB/vwL9duRdVJ
	P+uWtd44tSuV9t0sZtcvWdnJHoWkt05+bEHIEmoj0sPBqS/OS5xqauwJH/tK32OgAeYWs6fLXJH
	ao279HPDj6TPhosxvUWcMoPzCeDjm2tzQXsM11vFYGf7A1GPonhAIeyn1uaqp/4lZ+6nyaglgNN
	m+7n9rolsr+MfYESh9xKuCexKMSFlUGE+i+HKZ426DoxsyulESNcILniqKip8AGFTjSjfYegkh1
	Q8x5g3JPp9OSnTiYGKUJEPAGtTlFU6VBu91hlsta5n7Iv7iJiEGKUPvS1zJLylrEI28PnniLO9P
	sGlzHU5vsuK+EMmF9eU9rXlUi8HC2JTVdP5prQNEJ02aJEo0/KsWdjica23tYlSJeMo+H0me7C2
	7ZAqWc+JqZ+YY2tkgy16+MU+aeongE55zybrGV9YU0qb30xYTl4RXNBX9ETQG+wjMnIEMkUNkCu
	yLUspo7n4Uj0mVAI6Q==
X-Received: by 2002:a17:902:cf0b:b0:2e9:9524:b004 with SMTP id d9443c01a7336-2ea7d07bdf0mr14233255ad.59.1792742521424;
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b36bd37sm7029155ad.35.2026.10.23.01.02.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36681e85e87so1548534eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKqixX+xkXfpDl4avxTHB4qG2XWL3cJH7tgnaV9CObrBr1qpvFovqGRmCb+17QelDZmJEDFR9Qb/Mic6M=@vger.kernel.org
X-Received: by 2002:a05:693c:41d1:20b0:368:6841:c4fa with SMTP id
 5a478bee46e88-369d97cba44mr2146857eec.25.1792742519525; Fri, 23 Oct 2026
 01:01:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019060825.4163770-1-fshao@chromium.org>
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 23 Oct 2026 16:01:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
X-Gm-Features: AclHuK-R_JeODaJVMp0e_2XshjhzldOiDGJ3AA99g544rt-KmJQNU86dD3TgdPI
Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address
 handling in decoders
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:08=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Both the stateful and the stateless decoder workers peek the source
> buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
> returning the buffer. The buffer stays at the head of the ready list, so
> the same job is scheduled again and fails the same way. In the stateless
> decoder the media request is also never completed.
>
> The two fixes are split because they fix different commits, and the
> stateless fix also has to complete the media request.
>

I sent v2 to fix an issue where I misused mtk_vdec_stateless_cap_to_disp():
https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Please disregard this series.

Regards,
Fei

>
> Fei Shao (2):
>   media: mediatek: vcodec: Return source buffer on NULL va in stateful
>     decoder
>   media: mediatek: vcodec: Complete request on NULL va in stateless
>     decoder
>
>  .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> --
> 2.56.0.176.g3575e65682-goog
>
