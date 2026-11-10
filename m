Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333725;
	b=4p9TZbc7fo5uLNUSUKUwrOlx5EK7cZeIA26Lj9o3IqbM+T5A4UDHJJo63SMNEuBegrOi
	 gMNVcqKlJOQW+sxvPrzVdRMvzIa3Oynlh/K2G0+rpbUL7fJ3a88mLWgMiywlbkKv1zc9N
	 4cT2ll6HLRfQtioa7lTjJdX3UC+yIYIdMLVenDGJCR8gGAsY9bbMgSL+PX2jDcs6Osebx
	 LBVPagN49BpZvBuNYoqQE5ORbY47nLff8PooOfuDHibaltE+lu/VNrHzPHvxX0YyqapHz
	 fBiIsBViwuQL9b4SvTsPvzrzCT2ua5kB9eOuOtqdmQr4s02HNNNmdH7aCq0A188JS+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ov9SjO/T2yWWs9oVvwaD92SGckXKvt5IjQ1wTzEwgxg=;
	b=wMIPORpeXID0u8izaL8dEgehBjI+PkYc3kVeFn2jaRtZKwfbwhqMqJsZtRx8EMjcOswk
	 UEsYp+u6924V7yw/4AZ47ds0Q7qvBXn58OGLAG7YHLZ6Tgp6WQmNlOYGt7GEuX1gngBAI
	 vVY7kBeehdOB7JNTXMqPTfx4c8HyYT/lY0lVSKFZ5hSnysL3/s+w/lqJGk8qO02WuvpQ/
	 LQLtvI1pbHOZw5f8VepUH1OprM27kzGKfFOuIO+0zDVRZWNQ218a5awo4uniGAnwt07Do
	 ViHlZrvi88JThSnBbrUByMoNpDxAV2HFoq7cc/gEspudJIg8BN+f7PoKGDYM8mzFHLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIiFmA9D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F5606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64F5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIiFmA9D
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso20882861fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333723; cv=none;
        d=google.com; s=arc-20260327;
        b=jvWu4pby8BaM1bClugeRlr9jaKdX3aoQ7Phc+e1RERe6r59mPAKeTo9F3ztmvQxgLa
         GH0/qdwGWCBo2H0K1wDyFIZfjuA/nmzNjkx4my5bY8vPYjgllqQZRG1qUk7lAtXLGrxj
         eFB9XEjBT5PPPeY3Qjk+B91L8bPk7C7b3QQPx6DjefkEqY7WgNkk1C5aK66z/Eb+ekNb
         guag2QgHPhb834BfG8Wfseei76PK50bIziPgVo0uo+NoLFbj0wMtJ4jnfUBHnOX/bte6
         kly+Ur4Ab2jxeWmTUiifQqTFGuyguCXbYx47UEaXIr0xvxiAYypPcsj0N+jTsynEQ/ls
         25Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ov9SjO/T2yWWs9oVvwaD92SGckXKvt5IjQ1wTzEwgxg=;
        fh=nDoNSTUP0j5FlfXJsjk66MkQziJ6/iRmV4otzFNrWao=;
        b=E+sCwbwF3L6e3bJuiAHCo3uLe78+UiBwpoe1V4NgWoLI7nPr9kSg31x+KDNBWB3SfK
         JUMlcbtZWeb+QJpYNOACDYYRKgLZCNjVB+5/cOo4n3OtvBVINActon9Ppjp8aDMX/gq0
         vupSoTKBZ1cSb9fhSBHlVoJ7RRveQQiibf9LxgWKJaXj1/VzxGw3ws8ryGtGr7wqSj7S
         yaBTxwA0omPiUgqbzFVBbMLRBrk+qVb4mzfw/yQIH3LFQZy27qGKUiUQTIadMPm0DR9R
         vOmmihZVl8osVbr6rroCIDko8M7+s+vn6eZw3fGRYJX0m5Wqru1y9q+omW/qthIIWC+f
         dP2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333723; x=1794938523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ov9SjO/T2yWWs9oVvwaD92SGckXKvt5IjQ1wTzEwgxg=;
        b=yIiFmA9D3z5Per9cwYWiRgX1E1XQQ8dO7gpzu/mNl29tY14A5I+dmBbGEEmnOeTg+z
         x6agUp3nK/NqxDG1HzM5BvW1umy4G3APXr9bF2XDOcqV8MUaHK2WiT4Dhz0fGpAVc7Dc
         jaQAAxVho7pFeM4eAApu5a89U/JRtzBFc0Ddt/ILc812asKgCL8qCt6z0zPHSLSJ7x00
         qthMBKEm6Gj4k1raWvg+TOfQjdlO3Ll3WyaRLJxYOtvyu+3X3tHDsyKN2QXsSPA5mFk9
         SBl9nmSwlAjnnZCbS6Mn5+WKx2zH9mswTF1/sr93YEUxysyy+jWAtBC69syVNjtvMmvQ
         qvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333723; x=1794938523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov9SjO/T2yWWs9oVvwaD92SGckXKvt5IjQ1wTzEwgxg=;
        b=PsCidU6FZfPrZn2v+7tyI/HYrAVMC7onCmKURJxX4HdZnv0EXVjvQpVHhzR/MWdAvA
         exKLw3OWF7P8gkKslpUu26UY5CsdNHPFuMZF+1kwEQqJ3XTKGM8+8dkUIN+acyZ0I4oO
         KBmoB+xMaG9hVLzNep2ZinWfs5EMdPXWwitcdA1gKiws4U/Wr6DA+NWteVTdly3Fpgo4
         VXQIQviCHpS7xrVt+2147b5ekrUjW4pAB+0APN/NF8j+UIDHzNtaGGnDW40pZ2npphNA
         95gXcb373MHfzq1j+9Ib8nBs+25THvMVhBi4J/YZu/n0nZpDcmkNLK4iP0yX38BQyq8u
         aKVQ==
X-Forwarded-Encrypted: i=1; AL+hErETFzuTk59W5BnF63xxWgCZyONFlqcxunroFsfpgFIzcyp/GmfRCu9Ul6c10RvyjZvAp6yJBNyNqz2wlj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XmcRQR1tCrRW/2d0M6O4/vsjdKfWEkQHqV/WaqbVtyBaQtqAm
	C+HG4F5OyRd1Y+4/awvCYh02LC7oOg4JbScDuCDCbmfugAHELTvcLRIwj2fu3DCcYH2lMBOngrv
	P/0Pv5RUadQ+wbdCJftD57JKV5wkp6Vc=
X-Gm-Gg: AYBFou3vRYX0a62JucYhbSd+wsHqWIiVKr86ShfpdPt2iDJmYqJaU2WUdllvrUPE/fB
	oj+ydWxvQCyoPLC12QhyDIwoJ4eSDZkWBpYf6BytPBwOE/p/2OLRJ3AExvI75iv8Kc3hwM89J6V
	TxLg9crAnLbQcX7wsgLBIoH97eEUb41x/q48ueAnZnsK2/z/CdYZRbzmNR0rafYgK76dty6eKZE
	VO3AYzHtnYh94Vq5pFP73GemvMawm3vBVJ1HrzVTG06QzQKOZuXV4OTtDUB2mWY7jjVAlgAIjK0
	yPfzy3YvrmLC14IOllaf4iCSoMXbdTThA8svqqE4DiaWbbh43iTuV7BEc43YKIt42DnmWXNtoNh
	xQ+v19Wz21k/vjpV1hxQyNxJPJU5zdOh6T3+vZLzybUDAUlvYrr3ZB8u2QJVzs75GZ18lVAWtVR
	rHaOObhzN3TBL0tA9QiXaPTey0M2JjsZL08pPIK8CQ2UFzxPbzVsiyYw==
X-Received: by 2002:a2e:b8c9:0:b0:3a3:61ec:43c7 with SMTP id
 38308e7fff4ca-3ae10a3465bmr680781fa.24.1794333722682; Tue, 10 Nov 2026
 10:02:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-11-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-11-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 11:01:50 -0700
X-Gm-Features: AclHuK9ip-psjuIqgfh78sIFIsL_WvHPuXVercH_1RHZcH6UZnfeuVyaxOhmKcM
Message-ID: <CAKEwX=PJObB4gDPtsOWGjW6FJD4dtoz0qDu9KpK9jzP0=N=d_w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] zsmalloc: fold zs_obj_write() into zs_store()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:49=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> zram and zswap always call zs_obj_write() right after zs_malloc(), and
> zs_obj_write() has to take pool->lock and look up object location
> again, which zs_malloc() just did.
>
> Replace zs_malloc() and zs_obj_write() with one single zs_store()
> call.
>
> zs_store() takes zspage read lock under class->lock, before it drops
> class->lock to copy the data, while zs_obj_write() used to take it
> under pool->lock.  Compaction and page migration already take zspage
> lock under class->lock, so this follows the existing pool->lock ->
> class->lock -> zspage->lock order.  We don't need pool->lock there,
> zs_store() doesn't look up the object via the handle, it already has
> the zspage from the allocation.

Oh nice, this looks like it'd save a pool lock acquisition?

That (effectively global) lock can be quite contend-y under memory
fragmentation, etc...

>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
