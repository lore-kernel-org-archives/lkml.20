Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792922977;
	b=KEBs3ya8pI96Zu3JnXgPxcVBoqqRhs2KMoO30I160qvgk6hGMCGVqjyMZEEoqYqFsfPo
	 O3l++4THlB5yoT9L8c4am1Pyd/yzIk5HjeVoouyKYp/tC6t+KWoTWI12cUMgrybmNEzdd
	 BaZb3S66EmApfwLfycNtvC19h99i1BBCJJj8DeDrOAE5Vuu35Szj4xTjpZ42V+4pamH2j
	 TTvLsk0/0VoCWj5mB9GsvofR+zH9WSW/543Vr5zk52Fbghko5teTAISH6p18/fur/oif2
	 QIEdfBbTp2x6NvdiWUSlpcPTpIMMiqZv/ONke7n/b3r+3Md5EGLpTAR8UsYVw9Nnp8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922977;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x9QnU2pBsGjIFmv9Euw9yPy4UBXfMcM3EXn/p1BGvaw=;
	b=hJDYUCfl6OxVIuUO44tshE82lPl0Z5L4j1wCNFYxal1dV4sfh/7l3CbMFybsQ4nUYxyj
	 UADMhPjwQkTkt6NNghW2vq+btPsbG2KqSW6kax+H811jmVAOBhvZbtmELz9VlYDMDPmj2
	 Ruya0c7BGXB/nrLtx8i96cE7H/JFHuc9N3bGm2JbaFxC+/HV7uA7jNG4rGhNToPirpqGY
	 8UTusna710Yfi0AzSk22dplYsbsa9WFEWVZWwAdQdUVYhKPlkiLe3J2PVxRpSA3e53FkZ
	 ex5KHJaWI0x7yFP/nlVIsGJddZc8RU9E3nSMygfxGJn3PO2gPzdlf/sYjKFd8Whx2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfkkbBlt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F6606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfkkbBlt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976F71F01829
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792922976;
	bh=x9QnU2pBsGjIFmv9Euw9yPy4UBXfMcM3EXn/p1BGvaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VfkkbBltC7bsCM+rryO+DA/DdspsX0PfPXpnFrniEqfAR0EmFYeVGINTVujq8fXon
	 9meZtkY8T5Kp/W52P+22vw7Wwhp+wsRyFuyWjmF8A31c2etBkSTZE5EpmdU5B654vA
	 sRjKNj4+4Jyuz+OLj4lEVKzwuZE6RxR5Ik395HfjrIY44KorpL2PKvjpyxRzAciL1y
	 IJS8Ldv9yyiYecnrNhVsTSWsL3KkXYdJ+r9aAphG44pFpYI0qoi/GNiBFzcyWJ3zR+
	 NhaoeDfPQ1knN3JHF8+4dMP7NXLFJl3YIaglTmUxLj+GqcJ85J6eaLA9IrwbdJnBT4
	 7RfD5/MuvqHLQ==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b83459526so27381636d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByicrhhobRINTxbL8TWo/e3/lgDtlaBRbFUBpKZXGAM9nWDVxCJv2fHWIQzKQG6qBTRVGsqmYFnQYO3ODg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ1Ow5JakphI7F1e1wmbAnbpOEBvBJ5ZNuo2Te4c8H52Q2wiV9
	ofYZWGiOU5B95dMXYw/9UYufRctAoSqe+0LjRyjLwpNO8dgI5mfY1GV+HQVtz/ik6+CLQesF6vq
	uSrC0U22m9tP3C0OOIMFoeXPJrC5EtE8=
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id
 af79cd13be357-940ef9504b7mr498180685a.73.1792922975943; Sun, 25 Oct 2026
 03:09:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025021839.1542805-1-senozhatsky@chromium.org> <20261025021839.1542805-3-senozhatsky@chromium.org>
In-Reply-To: <20261025021839.1542805-3-senozhatsky@chromium.org>
From: Barry Song <baohua@kernel.org>
Date: Sun, 25 Oct 2026 18:09:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xxB1Dp-wFkw0bqF6hUtDERxmjZ9e0k01MYtaECvc2z1w@mail.gmail.com>
X-Gm-Features: AclHuK_hSR0uvsmfM9khVcfYjoKkHuYjN_xXHvZnCMI2yL_FlRUxprG3VMTY-6I
Message-ID: <CAGsJ_4xxB1Dp-wFkw0bqF6hUtDERxmjZ9e0k01MYtaECvc2z1w@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] zram: remove debugfs entry on init failure
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, 
	Bo Zhang <zhangbo0325@gmail.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 10:18=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Do not leak the debugfs entry when zram_init() fails to register
> the block device.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/block/zram/zram_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Barry Song <baohua@kernel.org>
